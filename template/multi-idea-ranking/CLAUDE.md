# Multi-Idea Ranking Workspace

Shortlist and rank many candidates against a spec. Generalises the GitHub-shortlister, vendor-shortlist, and red-team buyer patterns.

## Structure

```
spec/spec.md               # Your requirements, constraints, evaluation criteria
candidates/candidates.md   # The list to evaluate (URLs or names, one per line)
analysis/                  # Timestamped shortlist analyses
config.json                # Optional: for red-team runs (target_url, objective, browsing_method)
outputs/                   # Red-team evaluation outputs
```

## Workflow

### Shortlist mode

1. Fill in `spec/spec.md` with your criteria.
2. List candidates in `candidates/candidates.md`.
3. `/ideation-planning:rank-candidates` — scores candidates against the spec and produces a tiered shortlist.

### Red-team mode

1. Create `config.json`:
   ```json
   {
     "target_url": "https://example.com",
     "objective": "Buyer persona: mid-market SaaS ops lead evaluating vendor.",
     "browsing_method": "webfetch"
   }
   ```
2. `/ideation-planning:rank-redteam` — runs a red-team buyer evaluation.
