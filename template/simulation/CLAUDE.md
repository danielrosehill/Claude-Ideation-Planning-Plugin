# Simulation Workspace

Simulate multi-agent situations: conferences, negotiations, or policy-debate maps.

## Simulation type

- **Type**: {{SIMULATION_TYPE}}  (one of `conference`, `negotiation`, `debate-map`)

## Structure

```
# Conference
speakers/           # Speaker persona definitions (organised by track)
sessions/           # Timestamped session outputs (speeches, panels, Q&A, summary)

# Negotiation
parties/            # Party definitions
rounds/             # Per-round negotiation transcripts
outcomes/           # Agreement, dynamics analysis, party assessments

# Debate mapping
debates/            # Debate-map documents
comparisons/        # Jurisdiction comparisons
visualizations/     # Quadrant plots, cluster diagrams (PNG + SVG)
```

## Workflow

### Conference

1. `/ideation-planning:sim-configure-speakers` — define the roster
2. `/ideation-planning:sim-run-conference <topic>` — run the full simulation

### Negotiation

1. `/ideation-planning:sim-configure-parties` — define parties (minimum 3)
2. `/ideation-planning:sim-run-negotiation` — run multi-round negotiation

### Debate mapping

1. `/ideation-planning:sim-map-debate <topic>` — map the landscape

## Guardrails

Generated identities must be fictional and must not reference real people or companies. The simulation's purpose is exploratory, not predictive.
