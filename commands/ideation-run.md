---
description: Execute a structured ideation run against the current topic configuration
---

Run an ideation session.

## Procedure

1. **Load** `config/topic.md`. If missing, tell the user to run `/ideation-planning:ideation-configure` first and stop.

2. **Scan previous runs** in `runs/` to build a list of previously generated ideas (by name and concept). Avoid duplication.

3. **Determine run number** by counting existing run files and incrementing.

4. **Generate ideas** per the configuration:
   - Match quantity, depth, and output format
   - Respect stated constraints
   - Do not repeat or closely paraphrase prior ideas
   - `breadth` → spread across distinct categories
   - `depth` → cluster within the core niche
   - `balanced` → mix both
   - Include 2-3 unconventional or lateral ideas per run

5. **Write** `runs/YYYY-MM-DD-run-NNN.md` with:

   ```markdown
   # Ideation Run NNN

   **Date**: YYYY-MM-DD
   **Topic**: <from config>
   **Ideas generated**: <count>

   ---

   ## <Idea name>
   <body per configured output format>
   ```

6. Summarise what was generated and suggest `/ideation-planning:ideation-synthesize` after multiple runs.
