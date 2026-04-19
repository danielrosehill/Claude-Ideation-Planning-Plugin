# Decision Framework Workspace

Analyse major decisions through seven objective frameworks in parallel. The output is NOT a determinative answer — it's multi-lens analysis that helps you see the decision from different angles.

## Frameworks

1. Cost-Benefit Analysis
2. SWOT Analysis
3. Decision Matrix (Weighted Criteria)
4. ICE Framework (Impact / Confidence / Ease)
5. Risk-Reward Assessment
6. Eisenhower Matrix (Urgent/Important)
7. Regret Minimization

## Structure

```
decisions/queue/      # Drop decision markdown files here
decisions/processed/  # Moved here after analysis
frameworks/           # Per-framework guides
outputs/              # Combined analyses
```

## Workflow

1. Write a decision file in `decisions/queue/<slug>.md` describing:
   - The decision to be made
   - Context and background
   - Options being considered
   - Constraints or requirements
2. `/ideation-planning:decision-analyze` — runs all seven frameworks in parallel, produces a combined synthesis, moves the decision file to `processed/`.

## Decision file format

```markdown
# Decision: <Title>

## Context
## Options
1. <option A>
2. <option B>
3. <option C>

## Constraints
## Timeline
## Stakeholders
## Open questions
```
