# Feature Ideas Workspace

Capture and prioritise feature ideas and requests for a product, tool, or project.

## Target

- **Product/Project**: {{PRODUCT_NAME}}
- **Scope**: feature requests, UX improvements, integrations, API changes.

## Structure

```
ideas/        # Raw ideas, organised by product/category subfolder
approved/     # High-priority ideas approved for implementation
archive/      # Declined, deferred, or superseded
```

## Workflow

1. `/ideation-planning:feature-new-idea` — capture a new idea
2. `/ideation-planning:feature-prioritize` — score and rank the queue (Impact / Feasibility / Alignment / Demand)
3. `/ideation-planning:feature-export-roadmap` — export an approved roadmap

## Idea file format

```markdown
# Feature Idea: <Title>

**Product/Category:** <name>
**Source:** <personal / GitHub issue / forum / user feedback>
**Date:** YYYY-MM-DD
**Priority:** <High / Medium / Low / Unscored>
**Status:** <New / Under Review / Approved / Declined / Archived>

## Problem Statement
## Proposed Solution
## Benefits
## Alternatives Considered
## Additional Context
```
