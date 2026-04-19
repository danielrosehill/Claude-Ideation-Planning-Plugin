---
description: Merge related ideas into a consolidated proposal or plan document
---

Consolidate related ideas from `ideas/` into a single document in `consolidated/`.

## Procedure

1. **Scan** `ideas/` for files with status `ready-to-consolidate` or `developing`. If `$ARGUMENTS` names specific ideas or a theme, focus on those.

2. **Identify clusters** — group ideas that share a theme, solve related problems, or combine into a larger proposal.

3. **Confirm with the user** — show the proposed grouping, the titles of the files to merge, and the planned consolidated document title. Wait for approval.

4. **Write `consolidated/<title>.md`**:

   ```markdown
   # <Consolidated Title>

   ## Overview
   <high-level summary>

   ## Ideas Included
   - [<idea title>](../ideas/<file>.md) — <one-line summary>

   ## Detail
   <synthesised content combining all sources into a coherent narrative>

   ## Open Questions
   <unresolved questions the consolidated proposal still raises>

   ## Next Steps
   <concrete actions>
   ```

5. **Update status** on each source idea to `consolidated` with a back-reference to the consolidated doc.

6. Echo the new path and suggest `/ideation-planning:plan-project` or `/ideation-planning:deliverable-audience` as follow-ups.
