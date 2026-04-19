---
description: Shortlist a set of candidates (GitHub repos, products, vendors) against a spec
---

Shortlist candidates against a user-defined spec. Generalises the "GitHub shortlister" pattern to any list of items.

## Procedure

1. **Read inputs**:
   - `spec/spec.md` — user's requirements, constraints, evaluation criteria
   - `candidates/candidates.md` — the list to evaluate (URLs, product names, vendor names, or markdown bullet list)

   If either is missing, tell the user to create them and stop.

2. **Gather info per candidate**. For each entry:
   - If it's a GitHub URL: `gh repo view <owner/repo> --json name,description,stargazerCount,updatedAt,primaryLanguage,licenseInfo`, plus README summary.
   - If it's a product/vendor URL: fetch via WebFetch and extract product description, pricing, positioning.
   - If it's a freeform name: use WebSearch to gather baseline info.

3. **Launch `ranking-evaluator`** with the candidate list and the spec.

4. **Write** `analysis/analysis-YYYY-MM-DD-HHMMSS.md` including:
   - Spec summary
   - Per-candidate fit analysis (strengths, weaknesses, match percentage)
   - Ranked shortlist with top N picks
   - Recommendation

5. Report the output path.
