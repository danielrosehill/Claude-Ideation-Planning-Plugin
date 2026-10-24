---
name: voice-note-kickoff
description: Kick off a project from one of Daniel's voice notes in the "project voice notes" Google Drive folder - download it, polish the audio if the repo is public, transcribe it with AssemblyAI, and commit the audio, the raw transcript, a cleaned transcript and derived docs (development plan, task list, CLAUDE.md, README) into a new or existing repo. Use when Daniel says "kick this project off from the voice note", "grab the voice note from Drive and transcribe it", "I recorded a note about X, set up the repo", or "process the <name> voice note".
---

# Voice note → project kickoff

One voice note in, one seeded repo out. The audio and its raw transcript are the source; every
other file is derived from them and points back to them. Earlier repos made this way by hand:
`~/repos/github/ai-models/Pseudo-Personalised-Spam-Classifier` (2026-10-16, older `context/`
layout). This skill: first written and run 2026-10-24 on `proofed.mp3` → repo `Proofed`.

Scripts are next to this file (`scripts/`). Skills read from the catalogue have no
`${CLAUDE_PLUGIN_ROOT}`, so run them from the local clone
`~/repos/github/ai-agents-and-prompts/ai-claude-plugins/Claude-Ideation-Planning-Plugin/skills/voice-note-kickoff/scripts/`.
Work in the session scratchpad: `<scratch>/vnk/<slug>/`.

## Where the notes are

- Folder id `1FBdCBdxL_td4vNth7URpIx7KBF-PPGXY`, on a shared drive (drive id
  `0AGUnItPFjcUqUk9PVA`), account daniel@danielrosehill.co.il.
  Link: https://drive.google.com/drive/folders/1FBdCBdxL_td4vNth7URpIx7KBF-PPGXY
- List: `rclone lsl gdrivepersonal: --drive-root-folder-id 1FBdCBdxL_td4vNth7URpIx7KBF-PPGXY`
  (or gateway `google-workspace-personal__list_drive_items`, `folder_id` above,
  `order_by: "modifiedTime desc"`).
- Download: `rclone copy "gdrivepersonal:<name>.mp3" <scratch>/vnk/<slug>/original/ --drive-root-folder-id 1FBdCBdxL_td4vNth7URpIx7KBF-PPGXY`.
  Never rename, move or delete anything in the Drive folder. Nothing marks a note as processed
  there; the processing record in the repo is the marker.

**Which note:** the one Daniel names. Else the one whose filename matches the repo name
(`proofed.mp3` ↔ `Proofed`). Else list the newest five and ask.

## 1. Decide the target (ask, in one question)

- Inside an existing repo for this project (cwd, or one Daniel names): use it. Visibility from
  `gh repo view --json visibility`.
- New repo: ask **public or private** (and the name, proposing one at maximum specificity, if
  the note doesn't make it obvious). Topic group under `~/repos/github/` per its `README.md`.
  Create with `gh repo create danielrosehill/<Name> --<public|private> --clone`.

Audio goes in the repo by default. Leave it out only if Daniel says so (then write the
Drive link in its place). Public repo → commit the **polished** audio. Private repo → commit
the original as is unless Daniel asks for the polish.

## 2. Polish (public repos)

Skill `audio-production-private:polish-voice-note`:
`~/repos/github/ai-agents-and-prompts/ai-claude-plugins/Claude-Audio-Production-Private-Plugin/skills/polish-voice-note/scripts/polish_voice_note.sh <original> <scratch>/vnk/<slug>/voice-note.mp3 --title "<Project> - project brief"`.
Mono, EQ, pauses over 1 s cut to 0.5 s, gentle compression, two-pass loudnorm, 96 kbps MP3.
Keep the before/after duration and LUFS it prints for the processing record. Transcribe the
file you commit, so any timestamps match what people hear.

## 3. Transcribe (AssemblyAI)

```bash
with-secrets scripts/transcribe_assemblyai.sh <scratch>/vnk/<slug>/voice-note.mp3 <scratch>/vnk/<slug>/asr [boost terms...]
```

Boost terms: project and model names you expect (from the filename, repo name, earlier notes).
The script uploads the audio to AssemblyAI. It writes `transcript-raw.txt` (body only: paragraph
text, no word-level data, no timestamps), `transcript-timed.txt` (for citing), and the full JSON
(scratch only, never committed). Read the whole raw transcript before writing anything.

## 4. Write the files

Layout (one folder per note, so later notes for the same project sit beside the first):

```
context/voice-notes/YYYY-MM-DD-<slug>/
  voice-note.mp3          the audio (polished if public)
  transcript-raw.txt      AssemblyAI output, unedited. Never "fix" it.
  transcript-clean.md     cleaned transcript
  processing.json         provenance record
docs/development-plan.md
docs/tasks.md
CLAUDE.md
README.md
```

The date is the recording date (Drive created time), not today.

- **`transcript-clean.md`:** Daniel's words, first person, every point kept, tangents too.
  Remove fillers, false starts and repetitions; fix obvious mishearings (model and product
  names especially) and list each fix at the end under `## Corrections`; add paragraphing and
  a few section headings. Self-corrections ("actually, no, ...") resolve to what he settled on,
  with the first version noted in brackets if it changes meaning. No summarising.
- **`docs/development-plan.md`:** what the project is, the goal, scope and non-goals, the
  approach, phases with exit tests, open questions, risks. Cite the note (`voice note
  YYYY-MM-DD mm:ss`) for anything taken from it. Mark what is Daniel's stated decision and
  what is your inference.
- **`docs/tasks.md`:** the first tasks, checkbox list grouped by phase, small and doable, the
  first one startable today. Note which tasks need Daniel (data, accounts, decisions).
- **`CLAUDE.md`:** for an agent opening the repo cold: one paragraph on the project, status
  with an absolute date, where things are (paths above), hard rules from the note (public repo
  constraints, things he said not to do), the source-of-truth order (the note, then the plan).
  If the repo already has one, add to it; don't replace.
- **`README.md`:** a short project outline, status line, and a `## Project brief` section
  linking the audio, raw and clean transcripts and the plan by relative path. Existing README:
  add the section, keep the rest.
- **`processing.json`:**

```json
{
  "source": {"drive_file_id": "", "drive_name": "", "drive_folder_id": "1FBdCBdxL_td4vNth7URpIx7KBF-PPGXY", "created": "", "bytes": 0},
  "audio": {"committed": "polished|original|none", "polish": {"chain": "audio-production-private:polish-voice-note", "duration_before_s": 0, "duration_after_s": 0, "lufs_before": 0, "lufs_after": 0}},
  "asr": {"provider": "assemblyai", "model": "universal", "transcript_id": "", "audio_duration_s": 0, "word_boost": []},
  "derived": ["transcript-clean.md", "docs/development-plan.md", "docs/tasks.md", "CLAUDE.md", "README.md"],
  "processed": "YYYY-MM-DD"
}
```

## 5. Ship

One commit (`Kick off from voice note YYYY-MM-DD: audio, transcripts, plan, tasks`), push.
Verify the push: `git status -sb` shows no ahead count, and the README's relative links resolve
(`ls` every linked path).

## Next

- A presentable PDF of the brief (overview, plan, edited transcript): `voice-note-brief-pdf`.
- The brief PDF plus the first-phase research as one combined PDF:
  `voice-note-kickoff-research` (it runs this skill as its step 1).

## Report

Repo URL, the note processed, audio length (and seconds cut by the polish), the transcript id,
and the open questions from the plan that need Daniel. Nothing else.
