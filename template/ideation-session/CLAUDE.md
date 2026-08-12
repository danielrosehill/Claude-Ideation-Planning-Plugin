# Ideation Session Workspace

This workspace runs structured ideation sessions against a configured topic. Claude acts as an ideation engine: you define the topic and parameters, run one or more sessions, and synthesise across runs.

## Structure

```
config/        # Topic configuration
runs/          # Individual ideation run outputs
synthesis/     # Cross-run synthesis documents
deliverables/  # Rendered PDFs
```

## Workflow

1. `/ideation-planning:ideation-configure` — set topic, purpose, constraints, depth, diversity mode
2. `/ideation-planning:ideation-run` — generate a diverse batch of ideas
3. Repeat (2) as many times as useful
4. `/ideation-planning:ideation-synthesize` — aggregate across runs and surface top picks
5. `/ideation-planning:deliverable-audience` — render the synthesis as a PDF

Step 1 is the step that decides the quality of everything after it. The **purpose** field, in particular, is what tells the generators whether they are covering a space or attacking a problem, and the **constraints** are treated as hard — an idea that breaks one is off-brief, not bold.

Each `ideation-run` reads every prior file in `runs/`, so repeated runs push into new territory rather than restating the first batch. Runs above a handful of ideas fan out across several `idea-generator` agents working different lenses of the topic in parallel.

Optionally capture standalone ideas with `/ideation-planning:idea-capture`.
