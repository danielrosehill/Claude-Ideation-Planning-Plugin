---
name: voice-note-brief-pdf
description: Turn a project's kickoff voice note and its derived documents into one presentable project-brief PDF (Typst, IBM Plex Sans) - project overview, development plan, then the lightly edited transcript - stamped with the date, the recording date and attribution to Claude Code and its model. Saves the PDF next to the voice note, links it from the README, commits and pushes; emails it when asked. Use after voice-note-kickoff, or when Daniel says "make a PDF of the project brief", "give me the brief as a PDF", "one PDF with the idea, the plan and the transcript".
---

# Voice note → project-brief PDF

The companion to `voice-note-kickoff`: everything Daniel said defining the project, in one
document. First written and run 2026-10-24 on `danielrosehill/Proofed`.

Needs a repo already kicked off (`context/voice-notes/YYYY-MM-DD-<slug>/` with
`transcript-clean.md` and `processing.json`, plus `docs/development-plan.md`). If they're
missing, run `voice-note-kickoff` first.

Renders with the `modular-research` plugin's template and renderer, so the brief and research
reports look alike: `~/repos/github/ai-agents-and-prompts/ai-claude-plugins/Claude-Modular-Research-Plugin/scripts/render_pdf.sh`
(no clone: `gh repo clone danielrosehill/Claude-Modular-Research-Plugin` into scratch; template
fields `provenance` and `footer_stamp` need its 2026-10-24 version or later). The compose
script is next to this file: `scripts/compose_brief.py`, local clone path
`~/repos/github/ai-agents-and-prompts/ai-claude-plugins/Claude-Ideation-Planning-Plugin/skills/voice-note-brief-pdf/scripts/`.

## Contents, in order

1. **Project overview** (`context/voice-notes/<date>-<slug>/overview.md`, write it if missing):
   one to two pages that present the idea cleanly: what it is, the problem, the objective,
   scope and out of scope, approach, the open questions. Third person, drawn only from the
   note (cite `mm:ss` sparingly), no new claims. Starts with `# Overview`.
2. **Development plan:** `docs/development-plan.md` as it stands.
3. **The voice note, lightly edited:** `transcript-clean.md`. Never the raw transcript.

A later note on the same project (a second `context/voice-notes/` folder) goes in as its own
section after the first transcript, in date order; ask whether to include earlier notes only if
there are more than two.

## Steps

1. Take the timestamp: `date +%Y-%m-%dT%H:%M:%S%:z`.
2. Write `overview.md` if missing.
3. Front matter to a scratch file `<scratch>/front.yaml`:

```yaml
---
title: "<Project>"
subtitle: "<one-line description, from the README>"
kicker: "PROJECT BRIEF"
date: YYYY-MM-DD
author: "Daniel Rosehill"
abstract: |
  <three sentences: what the project is and what the first phase does>
provenance:
  - label: "Defined by"
    value: "Daniel Rosehill, voice note recorded YYYY-MM-DD (mm:ss long)"
  - label: "Prepared by"
    value: "Claude Code · <model name> (<model id>)"
  - label: "Generated"
    value: "YYYY-MM-DD HH:MM:SS ±HH:MM"
  - label: "Transcription"
    value: "AssemblyAI universal (transcript <id>), lightly edited by Claude"
  - label: "Repository"
    value: "github.com/danielrosehill/<Repo> @ <short commit>"
footer_stamp: "<Project> project brief · prepared by Claude Code (<model id>) · YYYY-MM-DD HH:MM ±HH:MM"
---
```

   Recording date, duration and transcript id come from `processing.json`. Your model id is the
   one your system prompt states; never guess. The commit is `git rev-parse --short HEAD` before
   this skill's commit.

4. Compose and render:

```bash
D=context/voice-notes/<date>-<slug>
python3 -I <skill>/scripts/compose_brief.py <scratch>/front.yaml <scratch>/brief.md \
  "Overview=$D/overview.md" "Development plan=docs/development-plan.md" \
  "The voice note, lightly edited=$D/transcript-clean.md"
<modular-research>/scripts/render_pdf.sh <scratch>/brief.md $D/<Project>-project-brief.pdf --toc
```

5. Check the PDF, not the exit code: `pdftotext -layout <pdf> - | head -50` shows the kicker, the
   provenance rows and the three section headings; no raw markup (`#`, `$`, `\[`). Rasterise
   page 1 and one table page and look at them.
6. README: add `· [Project brief (PDF)](<path>)` to the `## Project brief` list. Commit
   `Project brief PDF` with `overview.md`, and push.
7. Email only when asked: follow `modular-research` `skills/run/references/delivery.md`, email
   section (one-line notice first, PDF attached, subject `Project brief: <Project>`).

## Report

The PDF path and GitHub link, the page count, and whether it was emailed.
