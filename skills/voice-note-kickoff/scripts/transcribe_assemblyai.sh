#!/usr/bin/env bash
# Transcribe a voice note with AssemblyAI (universal model, English).
# Usage: with-secrets transcribe_assemblyai.sh <audio> <outdir> [word_boost terms...]
# Writes to <outdir>:
#   transcript.json      full API response (word-level; scratch only, never committed)
#   paragraphs.json      AssemblyAI paragraph split (scratch only)
#   transcript-raw.txt   the transcript body: paragraph texts, blank-line separated, no timestamps.
#                        This is the file that goes in the repo, unedited.
#   transcript-timed.txt "[seconds] text" per paragraph, for citing timestamps while writing docs
#   transcript-id.txt    AssemblyAI transcript id
# Key: ASSEMBLYAI_API_KEY (or ASSEMBLY_API_KEY) via `with-secrets`. The audio is uploaded to AssemblyAI.
# Adapted from asr-dev voice-update/scripts/transcribe_assemblyai.sh (verified 2026-10-22), minus
# its Hebrish boost list.
set -euo pipefail
AUDIO=$1; OUT=$2; shift 2
K="${ASSEMBLYAI_API_KEY:-${ASSEMBLY_API_KEY:-}}"; [ -n "$K" ] || { echo "no AssemblyAI key: run under with-secrets" >&2; exit 1; }
mkdir -p "$OUT"
BOOST=$(printf '%s\n' "$@" | sed '/^$/d' | jq -R . | jq -s -c .)
U=$(curl -sf -H "authorization: $K" --data-binary @"$AUDIO" https://api.assemblyai.com/v2/upload | jq -r .upload_url)
REQ=$(jq -n --arg u "$U" --argjson b "$BOOST" '{audio_url:$u,speech_model:"universal",language_code:"en",punctuate:true,format_text:true}
  + (if ($b|length) > 0 then {word_boost:$b,boost_param:"high"} else {} end)')
ID=$(curl -sf -H "authorization: $K" -H "content-type: application/json" https://api.assemblyai.com/v2/transcript -d "$REQ" | jq -r .id)
echo "$ID" > "$OUT/transcript-id.txt"
echo "transcript id: $ID" >&2
while :; do
  S=$(curl -sf -H "authorization: $K" "https://api.assemblyai.com/v2/transcript/$ID" | tee "$OUT/transcript.json" | jq -r .status)
  [ "$S" = completed ] && break
  [ "$S" = error ] && { jq -r .error "$OUT/transcript.json" >&2; exit 1; }
  sleep 15
done
curl -sf -H "authorization: $K" "https://api.assemblyai.com/v2/transcript/$ID/paragraphs" > "$OUT/paragraphs.json"
jq -r '[.paragraphs[].text] | join("\n\n")' "$OUT/paragraphs.json" > "$OUT/transcript-raw.txt"
jq -r '.paragraphs[] | "[\(.start/1000|floor)] \(.text)"' "$OUT/paragraphs.json" > "$OUT/transcript-timed.txt"
echo "audio: $(jq -r '.audio_duration' "$OUT/transcript.json") s, paragraphs: $(jq '.paragraphs|length' "$OUT/paragraphs.json"), words: $(wc -w < "$OUT/transcript-raw.txt")" >&2
