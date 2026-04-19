---
description: Configure the active topic and parameters for an ideation session
---

Configure the active topic for an ideation-session workspace. Writes `config/topic.md`.

## Procedure

Ask the user (or parse from `$ARGUMENTS`) for:

- **Topic** — subject area
- **Purpose** — what the ideation should achieve (explore, solve, product ideas, etc.)
- **Constraints** — budget, technology, audience, domain boundaries
- **Output format** — what each idea should include (name, summary, analysis, feasibility)
- **Depth** — `brief`, `standard`, or `comprehensive`
- **Quantity per run** — default 10
- **Diversity mode** — `breadth` (spread across categories), `depth` (cluster in niche), or `balanced`

Write everything into `config/topic.md` with a clear header. Confirm to the user and suggest `/ideation-planning:ideation-run` next.
