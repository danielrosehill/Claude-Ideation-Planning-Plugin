---
description: Evaluate a queue of ideas in one pass
---

Evaluate every idea file in `input/ideas/to-process/` (or a subset specified in `$ARGUMENTS`) using ICEC.

## Procedure

1. List all markdown files in `input/ideas/to-process/`.
2. For each, launch `idea-evaluator` in parallel (use multiple Task tool calls in a single message for speed).
3. Aggregate results into `data/rankings.json`.
4. Write individual analyses to `output/analysis/`.
5. Report: how many processed, score range, top picks. Suggest `/ideation-planning:rank-ideas` to compare.
