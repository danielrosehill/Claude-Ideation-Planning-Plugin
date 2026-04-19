---
description: Map the landscape of positions, camps, and key voices in a debate
---

Map a debate or policy issue.

## Procedure

1. Ask the user (or parse `$ARGUMENTS`) for:
   - **Topic** (e.g. nuclear non-proliferation, EU AI regulation)
   - **Sub-issue or angle** (optional)
   - **Scope constraints** — geographic region, time period, institutional focus

2. Produce `debates/<topic-slug>-YYYY-MM-DD.md`:

   ```markdown
   # Debate Map: <Topic>

   **Date Generated:** <date>
   **Scope:** <constraints>

   ## Overview
   <2-3 paragraphs>

   ## Taxonomy of Positions
   ### <Camp> (e.g. "Strict Regulators")
   - Core argument
   - Key individuals / orgs / institutions
   - Alliances and adjacent camps
   - Fault lines with other camps

   ## Policy Comparison
   <how different jurisdictions approach it, clustered by regulatory philosophy>

   ## Axes of Disagreement
   <2-3 key axes; position each camp on them>

   ## Likely Trajectories
   ```

3. Optionally generate a quadrant plot or cluster diagram to `visualizations/` (matplotlib, PNG + SVG). Ask the user whether they want visuals.

4. Report the output path.
