# Idea Capture Workspace

Low-friction capture + progressive consolidation workspace. Dump ideas as they come (voice notes, text, URLs, sketches); they mature into structured files over time.

## Theme

- **Theme / scope**: {{THEME}}

## Structure

```
raw/            # Unprocessed inputs exactly as they arrived
ideas/          # Cleaned, single-topic idea files
consolidated/   # Merged proposals combining related ideas
```

## Workflow

1. `/ideation-planning:idea-capture` — capture from text, URL, or voice note
2. `/ideation-planning:idea-refine` — iteratively improve a single idea file
3. `/ideation-planning:idea-consolidate` — merge related ideas into a proposal

## Idea file format

```markdown
# <Title>

**Source:** <text | URL | voice>
**Date:** YYYY-MM-DD
**Status:** <raw | developing | ready-to-consolidate | consolidated>

## Summary
## Detail
## Open Questions
## Related
```
