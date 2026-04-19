---
description: Score and prioritize the feature-ideas queue
---

Score every feature idea in `ideas/` against the prioritization framework and update status/priority fields.

## Scoring axes (1-5 each)

- **Impact** — how many users benefit, how significant
- **Feasibility** — implementation complexity vs. available resources
- **Alignment** — fit with product direction
- **Demand** — frequency of requests/mentions

## Procedure

1. If `$ARGUMENTS` names a product/category, only score within that subfolder.
2. For each idea, read the file and score each axis.
3. Compute average → priority level (High ≥ 4, Medium ≥ 2.5, Low < 2.5).
4. Update each file's `Priority` and `Status` (set `Under Review` if previously `New`).
5. Present a summary table.
6. Ask the user whether to:
   - Approve high-priority ideas → move to `approved/`
   - Archive low-priority/declined → move to `archive/`
   - Adjust scores
7. Update the README counts after moves.
