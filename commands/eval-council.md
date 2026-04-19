---
description: Run a six-persona council deliberation on an idea or existing business
---

Run a council-mode evaluation using six analytical personas: Operator, Financier, Skeptic, Visionary, Customer Advocate, Strategist.

## Procedure

1. **Locate input**. Check `input/ideas/to-process/` and `input/businesses/to-process/`. If multiple exist, ask which one to evaluate (council mode is thorough — one at a time).

2. **Determine scoring type**:
   - Idea → ICEC (Impact, Confidence, Ease, Contextual Suitability)
   - Business → PRGX (Performance, Resilience, Growth, Contextual Fit)

3. **Launch the `council-evaluator` agent** on the selected file.

4. **After completion**, display:
   - Each persona's score and rationale
   - Pairwise blind ranking results
   - Key disagreements
   - Final synthesised score and recommendation

5. Store full deliberation to `output/council/<idea-slug>.md`.
