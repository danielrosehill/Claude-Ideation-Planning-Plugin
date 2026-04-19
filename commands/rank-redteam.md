---
description: Red-team buyer-perspective evaluation of a website, product, or vendor
---

Run a red-team buyer evaluation. Used to stress-test a product/landing page/vendor from a skeptical buyer's perspective.

## Prerequisites

- `config.json` must exist in the workspace root with `target_url`, `objective`, and `browsing_method` (`webfetch` | `playwright-local` | `playwright-remote`).
- If missing, tell the user to create it (see `template/multi-idea-ranking/` scaffold).

## Procedure

1. **Load `config.json`**.
2. **Launch the `buyer-evaluator` agent** with the target URL, objective, buyer persona, and browsing method.
3. **Evaluation dimensions**:
   - First impressions (first 5 seconds)
   - Value proposition clarity
   - Trust and credibility signals
   - UI/UX quality
   - Conversion friction
   - Competitive positioning
4. The agent returns structured findings as JSON.
5. **Generate a report** at `outputs/redteam-YYYY-MM-DD.md` with verdict, dimension scores, screenshots (if playwright was used), and recommendations.
