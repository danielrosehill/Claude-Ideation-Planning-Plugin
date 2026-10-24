---
name: voice-note-kickoff-research
description: The full voice-note-to-project run - kick off the repo from a Drive voice note (voice-note-kickoff), render the project-brief PDF (voice-note-brief-pdf), run the plan's first-phase research as a timestamped executive report (modular-research:research-report), then join the brief and the research report into one combined PDF, commit it and email it. Use when Daniel says "kick it off and research it", "the full run on this voice note", "brief and research in one PDF", or asks for both the project brief and the research.
---

# Voice note → brief → research → one PDF

A wrapper: it runs three skills in order and adds one step. Read each skill when you reach it
and follow it, with the overrides below. First written 2026-10-24; its parts were first run on
`danielrosehill/Proofed` that day.

| Step | Skill | Override |
|---|---|---|
| 1 | `ideation-planning:voice-note-kickoff` | none (it asks new-or-existing repo, public or private) |
| 2 | `ideation-planning:voice-note-brief-pdf` | don't email |
| 3 | `modular-research:research-report` | don't email; the question comes from the plan (below) |
| 4 | combine (this file) | |
| 5 | deliver (this file) | one email, combined PDF |

If a step's output already exists (a kicked-off repo, a brief PDF, a research folder for this
phase), don't redo it; say so and go on. Commit and push after each step, as each skill says.

## Step 3: what to research

The research question is the plan's first research phase: `docs/development-plan.md` phase 1
and its open questions, and the matching tasks in `docs/tasks.md`. Make each research task a
sub-question. Skip questions only Daniel can answer (decisions, preferences, budgets); list them
in the report's *Open questions* as "needs Daniel". Folder:
`research/YYYY-MM-DD-phase-1-<slug>/`. After the report, tick the research tasks in
`docs/tasks.md` it answered and update the plan where findings change it, in the same commit.

## Step 4: combine

```bash
pdfunite <brief.pdf> <research-report.pdf> docs/<Project>-brief-and-research.pdf
```

Brief first, then research. Each part keeps its own title block, provenance stamp and page
footer, so the attribution and timestamps of both survive. Check: `pdfinfo` pages equal the
sum of the two; `pdftotext -f 1 -l 1` shows the brief's title page; the first page of the
research part shows its provenance block. Add to the README's `## Project brief` list:
`[Brief and research (PDF)](docs/<Project>-brief-and-research.pdf)`. Commit
`Combined brief and research PDF`, push.

## Step 5: deliver

Follow `modular-research` `skills/run/references/delivery.md`: the one-line notice that the PDF
is leaving the machine, then one email with the combined PDF attached. Subject
`<Project>: brief and research`. Body: the brief's abstract, the research's bottom line,
3–6 key findings, the questions that need Daniel, and GitHub links to the combined PDF and the
repo. Drive only when asked, to `<drive.folder>/<Repo>/`. Check the sent folder. Record the
delivery in `research/<folder>/delivery.json`, commit, push.

## Report

The repo URL, the combined PDF's GitHub link and page count, whether the email was confirmed
sent, and the questions that need Daniel.
