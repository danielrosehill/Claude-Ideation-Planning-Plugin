---
description: Aggregate and analyse ideas across all completed ideation runs
---

Synthesise results across ideation runs.

## Procedure

1. **Check runs**. Read all files in `runs/`. If fewer than 2, suggest running more sessions; proceed only if the user insists.

2. **Parse all ideas** — extract name, summary, category, feasibility/impact ratings, run number, date.

3. **Write** `synthesis/YYYY-MM-DD-synthesis.md`:

   ```markdown
   # Ideation Synthesis

   **Date**: YYYY-MM-DD
   **Runs analysed**: N
   **Total ideas**: N
   **Date range**: earliest → latest

   ---

   ## Executive Summary
   <2-3 paragraphs: what was explored, emergent themes, overall coverage>

   ## Top Picks
   <ranked highlights with rationale>

   ## Themes
   <clusters of related ideas>

   ## Outliers & Unconventional
   <lateral ideas worth reconsidering>

   ## Gaps
   <angles the runs missed>

   ## Recommended Next Steps
   ```

4. Report the synthesis path. If the user wants deep evaluation of a pick, suggest spinning up a `single-idea-eval` workspace via `/ideation-planning:new-workspace`.
