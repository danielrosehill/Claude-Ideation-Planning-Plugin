---
description: Iteratively improve and expand a captured idea document
---

Refine `docs/idea.md` (or the idea file specified in `$ARGUMENTS`).

## Procedure

1. **Read the document**. If it does not exist, tell the user to run `/ideation-planning:idea-ingest` or `/ideation-planning:idea-capture` first.

2. **Analyse** and identify:
   - Vague or ambiguous language
   - Gaps in problem statement or proposed solution
   - Missing technical-feasibility considerations
   - Open questions that can be partially answered with reasoning
   - Structural improvements

3. **Present findings** — list proposed improvements grouped by section. Wait for user confirmation.

4. **Apply approved changes**:
   - Clarify language while preserving original intent
   - Fill gaps with reasonable expansions (mark speculative additions)
   - Reference prior art if identifiable
   - Expand technical notes with implementation considerations

5. **Update frontmatter**. Set `last_updated: today`. If `status: captured`, suggest bumping to `refining`.

6. **Append to `docs/changelog.md`** with a summary of the refinement.
