# Single-Idea Evaluation Workspace

Deep evaluation workspace for one idea (or a small batch) at a time using the ICEC scorecard framework.

## Structure

```
input/
  ideas/to-process/       # Drop new idea markdown files here
  businesses/to-process/  # Drop business evaluations here (for PRGX scoring)
  user-context.md         # Your background, skills, goals — used to contextualise
output/
  analysis/               # Per-idea ICEC analyses
  council/                # Council-mode deliberations
data/
  rankings.json           # Cumulative score registry
reference/                # Optional: custom scorecard, dimensions, calc method
```

## Workflow

1. Fill in `input/user-context.md` with your background, skills, resources, and goals.
2. Drop an idea markdown file into `input/ideas/to-process/`.
3. `/ideation-planning:eval-single-idea` — ICEC evaluation.
4. `/ideation-planning:eval-council` — six-persona council deliberation (slower, deeper).
5. `/ideation-planning:rank-ideas` — compare once multiple ideas have been evaluated.

## Idea file format

```markdown
# <Idea title>

## Summary
<1-2 paragraphs>

## Problem
<what problem this solves; who has it>

## Proposed solution
<how the idea works>

## Why now
<timing signal>

## Who pays
<target buyer>
```
