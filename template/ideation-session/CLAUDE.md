# Ideation Session Workspace

This workspace runs structured ideation sessions against a configured topic. Claude acts as an ideation engine: you define the topic and parameters, run one or more sessions, and synthesise across runs.

## Structure

```
config/      # Topic configuration
runs/        # Individual ideation run outputs
synthesis/   # Cross-run synthesis documents
```

## Workflow

1. `/ideation-planning:ideation-configure` — set topic, constraints, depth, diversity mode
2. `/ideation-planning:ideation-run` — generate a diverse batch of ideas
3. Repeat (2) as many times as useful
4. `/ideation-planning:ideation-synthesize` — aggregate across runs and surface top picks

Optionally capture standalone ideas with `/ideation-planning:idea-capture`.
