---
description: Generate a stakeholder-targeted PDF deliverable from a workspace's ideas, synthesis, or plan
---

Generate a polished PDF deliverable from a workspace's accumulated material — consolidated ideas, an ideation synthesis, raw ideation runs, or a project plan — targeted at a specific stakeholder audience (executive summary, technical team, board, general public, investor, or just yourself reading it away from the terminal).

## Procedure

1. **Audience**. Ask the user for the target audience if not provided.

2. **Read source**. Take the first of these that has content, since the source depends on which workspace variant you are in:

   | Source | Variant it belongs to |
   | --- | --- |
   | all files in `consolidated/` | `idea-capture` |
   | the newest file in `synthesis/` | `ideation-session` |
   | all files in `runs/` | `ideation-session`, when no synthesis has been written yet |
   | `plan/plan.md` | planning workspaces |
   | `docs/idea.md` | single-idea workspaces |

   When falling back to `runs/` in an `ideation-session` workspace, say so and offer `/ideation-planning:ideation-synthesize` first — a deliverable built from raw runs carries the duplication and the run-by-run framing that synthesis exists to remove. Proceed from `runs/` if the user would rather see everything.

   Stop with a helpful message if none of them exist.

3. **Select and frame content for the audience**:
   - Choose which themes are relevant
   - Adjust depth (executives high-level; technical implementation-heavy)
   - Adjust framing (concerns, jargon, formality)

4. **Build directory**. Create `build/.gitignore` containing `*`.

5. **Convert to Typst**:
   - Write each section as a markdown file under `build/`
   - Convert each: `pandoc --from=gfm --to=typst --wrap=preserve -o build/frag-NN.typ`
   - Strip shield badges and GH-specific markdown before conversion

6. **Wrapper**. Generate `build/wrapper.typ` with title, metadata, cover page, design tokens (accent colour, IBM Plex Sans if available), page layout.

7. **Compile**: `typst compile build/wrapper.typ deliverables/<slug>-<audience>-YYYY-MM-DD.pdf`.

8. Echo the PDF path back to the user.
