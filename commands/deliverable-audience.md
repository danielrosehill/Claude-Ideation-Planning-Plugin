---
description: Generate a stakeholder-targeted PDF deliverable from consolidated ideas
---

Generate a polished PDF deliverable from consolidated/planning material, targeted at a specific stakeholder audience (executive summary, technical team, board, general public, investor, etc.).

## Procedure

1. **Audience**. Ask the user for the target audience if not provided.

2. **Read source**. Default: all files in `consolidated/`. If empty, fall back to `plan/plan.md`, then `docs/idea.md`. Stop with a helpful message if none exist.

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
