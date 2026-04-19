---
description: Analyse a decision using seven parallel decision-making frameworks
---

Analyse a decision using all seven frameworks in parallel: Cost-Benefit Analysis, SWOT, Decision Matrix (Weighted Criteria), ICE, Risk-Reward Assessment, Eisenhower Matrix, Regret Minimization.

## Procedure

1. **Find the decision file** in `decisions/queue/`. If `$ARGUMENTS` names a specific file, use that; else list available decisions and ask.

2. **Launch 7 subagents IN PARALLEL** (one message, seven Task tool calls, `subagent_type: general-purpose`), each applying one framework. Each subagent:

   ```
   Analyze this decision using the [FRAMEWORK] framework.

   Decision file: <path>
   Framework guide: frameworks/<framework-file>.md

   - Read the decision file completely
   - Read the framework guide completely
   - Apply the framework exactly as specified
   - Return the full analysis report with a 0-100 score
   ```

3. **Aggregate** all seven reports into a single combined output at `outputs/<timestamp>-<decision-slug>.md` with:
   - Decision summary
   - Per-framework analysis and score
   - Cross-framework synthesis
   - Weighted final recommendation

4. **Move** the decision file from `decisions/queue/` to `decisions/processed/`.

5. Report the output path.
