---
description: Capture a new structured feature idea or request
---

Capture a feature idea into the `feature-ideas` workspace.

## Procedure

Ask the user for (accept partial input, fill defaults):

1. **Title** — short, descriptive
2. **Product/Category** — which product this relates to
3. **Source** — personal, GitHub issue, community, user feedback, etc.
4. **Problem statement** — what problem, who is affected
5. **Proposed solution**
6. **Benefits**
7. **Alternatives considered** (optional)
8. **Additional context** — links, screenshots, related issues (optional)

If the user provides a GitHub issue or forum URL, fetch the content and prefill fields.

### Write

1. Create `ideas/<product-slug>/<title-slug>.md` (create the product subfolder if missing).
2. Use the feature-idea template from workspace CLAUDE.md.
3. `Date: today`, `Priority: Unscored`, `Status: New`.
4. Update the README product index if this is a new product/category.
5. Echo the path and a one-line summary back to the user.
