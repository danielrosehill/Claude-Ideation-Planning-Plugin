---
description: Define the speaker roster for a conference-simulation workspace
---

Define speakers for a conference simulation. Writes files to `speakers/`.

## Procedure

Ask the user how many speakers and which tracks (e.g. industry, academia, policy, civil society). For each speaker, collect:

- `speaker_id` (unique slug)
- `role` — job title
- `track` — thematic track
- `focus_areas` — 2-4 primary areas of expertise
- `perspective_orientation` — e.g. optimistic, contrarian, pragmatic, idealistic
- `prompt_questions` — 2-3 seed questions the speaker should address

Write each to `speakers/<track>/<speaker_id>.md` with YAML frontmatter + markdown body.

Leave `organization` as `[TBD - Fictional Organization]` — `sim-run-conference` generates plausible fictional identities at runtime.

Report how many speakers were defined and across which tracks.
