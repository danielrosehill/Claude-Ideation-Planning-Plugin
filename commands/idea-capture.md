---
description: Capture a new idea from text, URL, or voice-note audio into the workspace
---

Capture an idea into the current workspace. Works in `idea-capture` and `ideation-session` variants; also usable in any workspace that has a `raw/` or `ideas/` directory.

Input may be:

1. **Free text** — a typed or pasted idea description in `$ARGUMENTS` or prompted.
2. **A URL** — fetch the page, summarise, extract ideas.
3. **A voice recording** — an audio file path under `raw/` to transcribe.

## Procedure

### For text input

1. Create `raw/YYYY-MM-DD-short-description.md` with the original text.
2. Extract distinct ideas into `ideas/` files using the standard idea format from CLAUDE.md.
3. Set `Source: text`, `Date: today`, `Status: raw`.

### For a URL

1. Fetch the page with WebFetch (or the configured fetch MCP).
2. Create `raw/YYYY-MM-DD-short-description.md` with URL, fetch date, and key-points summary.
3. Extract distinct ideas into `ideas/`.
4. Set `Source: <URL>`, `Status: raw`.

### For a voice recording

1. Locate the audio file under `raw/`.
2. Transcribe via the configured transcription tool (e.g. gemini-transcription MCP).
3. Save transcript as `raw/YYYY-MM-DD-transcript-<slug>.md`.
4. Extract distinct ideas into `ideas/` files.
5. Set `Source: voice (<filename>)`, `Status: raw`.

### Finalise

- Commit if the workspace is a git repo.
- Report the created files and paths back to the user.
- Suggest running `/ideation-planning:idea-consolidate` when there's enough material to merge.
