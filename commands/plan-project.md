---
description: Convert a refined idea or consolidated document into a concrete project plan
---

Produce a project plan from an existing idea document.

## Procedure

1. **Locate source**. Look for (in order):
   - `$ARGUMENTS` as a file path
   - `docs/idea.md` (WIP-idea variant)
   - The most recent file in `consolidated/`
   - If none found, ask the user.

2. **Extract** problem, solution, scope, key decisions.

3. **Write** `plan/plan.md` (create `plan/` if needed):

   ```markdown
   # Project Plan: <Title>

   ## Goals
   ## Scope (in / out)
   ## Milestones
   | # | Milestone | Outcome | Target date |

   ## Workstreams
   ### <Workstream>
   - Tasks
   - Dependencies
   - Owner / Skill set required

   ## Risks & Mitigations
   ## Open Questions
   ## Success Criteria
   ## First Actions (next 1-2 weeks)
   ```

4. Echo the path and suggest `/ideation-planning:deliverable-audience` for a polished PDF.
