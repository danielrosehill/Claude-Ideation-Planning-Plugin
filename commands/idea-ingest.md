---
description: Process raw inputs in raw-inputs/ into a structured idea document
---

Process unstructured files dropped into `raw-inputs/` (or `raw/`) into a structured `docs/idea.md` (or extend an existing one).

## Procedure

1. **Scan inputs**. For each file in `raw-inputs/`:
   - `.mp3 .wav .m4a .ogg .webm` — transcribe via the configured transcription tool.
   - `.txt .md .doc` — read directly.
   - `.png .jpg .jpeg .webp` — use vision/OCR to extract handwriting, diagrams, whiteboard content.

2. **Synthesise**. Combine extracted content into a unified narrative, preserving the user's original phrasing where the intent is clearest.

3. **Write / update `docs/idea.md`** with sections:
   - Title
   - Summary (1-2 paragraphs)
   - Problem statement
   - Proposed solution
   - Key points
   - Open questions
   - Next steps

4. **Frontmatter**. Set `status: captured`, `last_updated: today`. If the doc already exists, append new material and bump `last_updated`.

5. **Changelog**. Append a line to `docs/changelog.md` noting the date and which raw files were ingested.

6. Report the updated document path and suggest `/ideation-planning:idea-refine` as the next step.
