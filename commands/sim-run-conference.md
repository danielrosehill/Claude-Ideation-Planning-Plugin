---
description: Simulate a multi-speaker conference or symposium on a given topic
---

Run a full conference simulation on the topic given in `$ARGUMENTS` (or prompt for it).

## Procedure

1. **Topic confirmation** — clarify scope, time horizon, angles to emphasise or avoid.

2. **Speaker loading** — read all files in `speakers/`. If none, tell the user to run `/ideation-planning:sim-configure-speakers` first.

3. **Identity generation** — for each speaker, generate a plausible fictional `full name`, `organization`, `location`, and brief professional background. Do not reference real people or companies.

4. **Session setup** — create `sessions/YYYY-MM-DD-<topic-slug>/` and a `config.yaml` recording topic, date, speaker list, parameters.

5. **Speech generation** — for each speaker generate a speech matching their prompt template and constraints. Write to `sessions/<session>/speeches/<speaker_id>.md` with a header (name, role, organization, track).

6. **Panel discussion** (if speakers span 3+ tracks) — select 3-5 contrasting speakers. An MC poses 2-3 questions. Write to `sessions/<session>/panels/`.

7. **Audience Q&A** (optional — ask) — 3-5 questions routed to the most relevant speaker. Write to `sessions/<session>/qa/`.

8. **Synthesis** — `sessions/<session>/summary.md` covering key themes, agreements, disagreements, surprises.

9. Report speeches generated, tracks represented, panel composition, and output path.
