---
description: Simulate a multi-party negotiation across configurable rounds
---

Run a negotiation simulation.

## Procedure

1. **Check prerequisites** — at least 3 party files in `parties/`. If not, tell the user to run `/ideation-planning:sim-configure-parties` first.

2. **Collect parameters**:
   - **Negotiation topic** (required)
   - **Rounds** (default 3)
   - **Style** — formal / informal / crisis (default formal)
   - **Moderator stance** — neutral / activist / procedural (default neutral)
   - **External pressure events** (optional, per round)

3. **Read all party files**.

4. **Run each round sequentially**:
   - Determine the round's focus (opening positions / reactions / final offers)
   - Each party speaks in character, responding to prior rounds — not just repeating openings
   - Moderator summary: progress, sticking points, emerging consensus, coalition dynamics
   - Inject any external pressure events before the next round
   - Save round to `rounds/NN_<slug>_<timestamp>.md`

5. **Generate outcome docs** in `outcomes/`:
   - `agreement_<topic-slug>_<timestamp>.md` — what was agreed (or impasse)
   - `dynamics_<topic-slug>_<timestamp>.md` — analysis of patterns, coalition shifts, concession sequences
   - `party-assessments_<topic-slug>_<timestamp>.md` — per-party evaluation

6. Report output paths.
