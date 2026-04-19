# ideation-planning-plugin

Claude Code plugin for ideation and planning workflows — capture, evaluate, rank, simulate, and plan ideas. Consolidates brainstorming and idea-evaluation primitives from across the marketplace into a single plugin with seven workspace variants.

Part of the [danielrosehill Claude Code marketplace](https://github.com/danielrosehill/Claude-Code-Plugins).

## What you get

### Primitives (always available once the plugin is installed)

**Capture & ingest** (`/ideation-planning:idea-*`):
- `idea-capture` — capture a new idea from text, URL, or voice-note audio
- `idea-ingest` — process raw inputs in `raw-inputs/` into a structured idea document
- `idea-refine` — iteratively expand and clarify an existing idea document
- `idea-consolidate` — merge related ideas into a consolidated proposal

**Ideation runs** (`/ideation-planning:ideation-*`):
- `ideation-configure` — set topic, constraints, depth, diversity mode
- `ideation-run` — generate a diverse batch of ideas against the active topic
- `ideation-synthesize` — aggregate across runs, surface themes, pick top candidates

**Evaluation & ranking** (`/ideation-planning:eval-*`, `/ideation-planning:rank-*`):
- `eval-single-idea` — ICEC-style scorecard evaluation of one idea
- `eval-council` — six-persona council deliberation on an idea or business
- `eval-batch` — evaluate a queue of ideas in one pass
- `rank-ideas` — comparative ranking across evaluated ideas
- `rank-candidates` — shortlist a set of candidates (GitHub repos, products, vendors) against a spec
- `rank-redteam` — red-team/buyer-perspective evaluation of a target (site, product, vendor)

**Feature ideas** (`/ideation-planning:feature-*`):
- `feature-new-idea` — capture a structured feature idea/request
- `feature-prioritize` — score and prioritize the feature-ideas queue
- `feature-export-roadmap` — export an approved roadmap

**Decisions** (`/ideation-planning:decision-*`):
- `decision-analyze` — run seven parallel decision frameworks (CBA, SWOT, matrix, ICE, risk-reward, Eisenhower, regret minimization)

**Simulations** (`/ideation-planning:sim-*`):
- `sim-configure-speakers` / `sim-configure-parties` — define conference speakers or negotiation parties
- `sim-run-conference` — simulate a multi-speaker conference / symposium
- `sim-run-negotiation` — simulate a multi-party negotiation
- `sim-map-debate` — map positions, camps, and fault lines in a debate

**Planning & deliverables** (`/ideation-planning:plan-*`, `/ideation-planning:deliverable-*`):
- `plan-project` — convert a refined idea into a project plan
- `deliverable-audience` — generate a stakeholder-targeted PDF deliverable from consolidated ideas

**Agents**:
- `idea-evaluator` — autonomous single-idea ICEC evaluator
- `council-evaluator` — six-persona council deliberation orchestrator
- `ranking-evaluator` — batch ranking / shortlist orchestrator
- `buyer-evaluator` — red-team buyer persona for websites and products

### Provisioning skill

- `/ideation-planning:new-workspace <name> [--variant=<v>]`

Scaffolds a new workspace for one of the seven variants:

- `ideation-session` — brainstorming + synthesis runs
- `single-idea-eval` — deep ICEC/council evaluation of one idea at a time
- `multi-idea-ranking` — shortlist/ranking across many candidates (GH repos, products, vendors)
- `feature-ideas` — feature idea intake + prioritization
- `decision-framework` — seven-framework decision analysis
- `simulation` — conference, negotiation, or debate simulation
- `idea-capture` — low-friction capture + consolidation workspace

Personalises `CLAUDE.md` from `~/.claude/CLAUDE.md` and (by default) creates a public GitHub repo.

## Install

```
/plugin install ideation-planning@danielrosehill
```

## Usage

```
/ideation-planning:new-workspace my-ideation --variant=ideation-session
/ideation-planning:ideation-configure
/ideation-planning:ideation-run
/ideation-planning:ideation-synthesize
```

```
/ideation-planning:new-workspace evaluate-saas-idea --variant=single-idea-eval
/ideation-planning:eval-single-idea
/ideation-planning:eval-council
```

## Provenance

Absorbs and deduplicates primitives from 15 source repos: Claude-Business-Idea-Evaluator, Claude-Decision-Evaluation-Framework, Claude-Github-Shortlister, Claude-Red-Team-Buyer, Conference-Simulation-Template, Debate-Mapper-Template, Feature-Ideas-Template, Idea-Capture-Template, Ideas-To-Reports-Template, Ideation-Runner-Template, Negotiation-Simulation-Template, Project-Ideas-Template, Project-Planning-Template, WIP-Idea-Template, Claude-Think-Tank.
