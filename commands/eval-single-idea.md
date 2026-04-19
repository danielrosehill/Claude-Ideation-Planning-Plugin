---
description: Evaluate a single idea using the ICEC scorecard framework
---

Evaluate one idea (or all ideas in `input/ideas/to-process/`) using ICEC (Impact, Confidence, Ease, Contextual Suitability).

## Procedure

1. **Locate input**. Check `input/ideas/to-process/` for markdown files. If `$ARGUMENTS` names a specific file, use that.

2. **Read references** (if present) for scoring methodology:
   - `reference/scorecard.md`
   - `reference/comprehensive-analysis-dimensions.md`
   - `reference/global-score-calculation.md`
   - `input/user-context.md`

   If these don't exist, use the baseline ICEC guidance in the workspace CLAUDE.md.

3. **For each idea file**, launch the `idea-evaluator` agent via the Task tool. Pass the filename and any user context.

4. **After evaluations**, write an analysis file per idea to `output/analysis/<idea-slug>.md` and update `data/rankings.json` with the new scores.

5. **Summarise**: number of ideas processed, score range, top-scoring idea(s). Suggest `/ideation-planning:rank-ideas` if multiple ideas have been evaluated.
