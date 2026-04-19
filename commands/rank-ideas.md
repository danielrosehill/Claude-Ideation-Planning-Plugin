---
description: Generate a comparative ranking across all evaluated ideas
---

Produce a comparative ranking across previously evaluated ideas. Works purely from existing analysis — no new evaluations.

## Procedure

1. **Read `data/rankings.json`** for the list of evaluated ideas. If missing or empty, tell the user to run `/ideation-planning:eval-single-idea` or `/ideation-planning:eval-batch` first.

2. **Parse `$ARGUMENTS`** for a subset (e.g. `--top 5`, or explicit idea titles). Default: rank everything.

3. **Read the analysis files** for each idea under `output/analysis/`.

4. **Launch `ranking-evaluator`** in rank-only mode with the list.

5. **Present results**:
   - Tier breakdown table (Tier 1 / 2 / 3)
   - Pairwise comparison highlights (close calls)
   - Portfolio recommendation
   - Path to the generated report at `output/ranking/<timestamp>.md`
