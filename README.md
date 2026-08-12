# ideation-planning-plugin

Claude Code plugin for ideation and planning workflows — capture, evaluate, rank, simulate, and plan ideas. Consolidates brainstorming and idea-evaluation primitives from across the marketplace into a single plugin with six workspace variants.

Part of the [danielrosehill Claude Code marketplace](https://github.com/danielrosehill/Claude-Code-Plugins).

> **Decision analysis moved out (v1.1.0).** The `decision-analyze` command and `decision-framework` workspace variant have been migrated to the standalone [`decision-evaluation-framework`](https://github.com/danielrosehill/Claude-Decision-Evaluation-Framework-Plugin) plugin, which expands the original seven frameworks to twenty, adds parallel multi-lens orchestration, Typst PDF rendering, and Google Drive export. This plugin's scope returns to ideation, evaluation, ranking, and simulation.

## What you get

### Primitives (always available once the plugin is installed)

**Capture & ingest** (`/ideation-planning:idea-*`):
- `idea-capture` — capture a new idea from text, URL, or voice-note audio
- `idea-ingest` — process raw inputs in `raw-inputs/` into a structured idea document
- `idea-refine` — iteratively expand and clarify an existing idea document
- `idea-consolidate` — merge related ideas into a consolidated proposal

**Ideation runs** (`/ideation-planning:ideation-*`):
- `ideation-configure` — set topic, constraints, depth, diversity mode
- `ideation-run` — generate a diverse batch of ideas against the active topic, fanning out across parallel `idea-generator` agents on separate lenses when the batch is large enough to warrant it
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

**Simulations** (`/ideation-planning:sim-*`):
- `sim-configure-speakers` / `sim-configure-parties` — define conference speakers or negotiation parties
- `sim-run-conference` — simulate a multi-speaker conference / symposium
- `sim-run-negotiation` — simulate a multi-party negotiation
- `sim-map-debate` — map positions, camps, and fault lines in a debate

**Planning & deliverables** (`/ideation-planning:plan-*`, `/ideation-planning:deliverable-*`):
- `plan-project` — convert a refined idea into a project plan
- `deliverable-audience` — render a stakeholder-targeted PDF (pandoc → Typst) from whichever of `consolidated/`, `synthesis/`, `runs/`, `plan/plan.md`, or `docs/idea.md` the workspace has

**Agents**:
- `idea-generator` — lens-scoped idea generator, designed to be fanned out in parallel
- `idea-evaluator` — autonomous single-idea ICEC evaluator
- `council-evaluator` — six-persona council deliberation orchestrator
- `ranking-evaluator` — batch ranking / shortlist orchestrator
- `buyer-evaluator` — red-team buyer persona for websites and products

### Provisioning skill

- `/ideation-planning:new-workspace <name> [--variant=<v>] [--private] [--local-only]`

Scaffolds a new workspace for one of the six variants:

- `ideation-session` — brainstorming + synthesis runs
- `single-idea-eval` — deep ICEC/council evaluation of one idea at a time
- `multi-idea-ranking` — shortlist/ranking across many candidates (GH repos, products, vendors)
- `feature-ideas` — feature idea intake + prioritization
- `simulation` — conference, negotiation, or debate simulation
- `idea-capture` — low-friction capture + consolidation workspace

For decision analysis, install the [`decision-evaluation-framework`](https://github.com/danielrosehill/Claude-Decision-Evaluation-Framework-Plugin) plugin separately.

Personalises `CLAUDE.md` from `~/.claude/CLAUDE.md` and creates a GitHub repo — public by default, private with `--private`, skipped entirely with `--local-only`.

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

A full subject-scoped session, private, ending in something readable away from the terminal — here, non-fiction books that could be written about a given subject:

```
/ideation-planning:new-workspace books-on-<subject> --variant=ideation-session --private
/ideation-planning:ideation-configure     # topic, purpose, constraints, depth, diversity
/ideation-planning:ideation-run           # repeat; each run reads the last and avoids it
/ideation-planning:ideation-synthesize    # themes, top picks, gaps
/ideation-planning:deliverable-audience   # → deliverables/<slug>-<audience>-YYYY-MM-DD.pdf
```

`ideation-configure` is where the shape of the output is decided — the *purpose* field distinguishes covering a space from attacking a problem, and the *output format* field is what makes each idea come back with the fields you actually want (for books: working title, thesis, why now, who reads it).

```
/ideation-planning:new-workspace evaluate-saas-idea --variant=single-idea-eval
/ideation-planning:eval-single-idea
/ideation-planning:eval-council
```

## Provenance

Absorbs and deduplicates primitives from 15 source repos: Claude-Business-Idea-Evaluator, Claude-Decision-Evaluation-Framework, Claude-Github-Shortlister, Claude-Red-Team-Buyer, Conference-Simulation-Template, Debate-Mapper-Template, Feature-Ideas-Template, Idea-Capture-Template, Ideas-To-Reports-Template, Ideation-Runner-Template, Negotiation-Simulation-Template, Project-Ideas-Template, Project-Planning-Template, WIP-Idea-Template, Claude-Think-Tank.
