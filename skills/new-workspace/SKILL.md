---
name: new-workspace
description: Provision a new ideation-planning workspace on disk. Use when the user wants to start a new ideation, evaluation, ranking, decision, simulation, feature-intake, or idea-capture workspace. Accepts a workspace name and a variant. Scaffolds the workspace, personalises CLAUDE.md from user memory, and (by default) creates a public GitHub repo.
disable-model-invocation: true
allowed-tools: Bash(mkdir *), Bash(cp *), Bash(cat *), Bash(git init *), Bash(git add *), Bash(git commit *), Bash(gh repo create *), Bash(gh auth status), Bash(git push *), Read
---

# Provision Ideation-Planning Workspace

Creates a new workspace for one of the ideation-planning variants. This plugin's commands (`/ideation-planning:idea-capture`, `/ideation-planning:eval-single-idea`, etc.) are globally available once installed — this skill only provisions the **data scaffold** that those commands read from and write to.

## Arguments

`$ARGUMENTS` is parsed as:

- **First positional**: workspace name (kebab-case). Required.
- **Second positional** (optional): target parent path. Default: `~/repos/github/my-repos`.
- **`--variant=<v>`** (required): one of `ideation-session`, `single-idea-eval`, `multi-idea-ranking`, `feature-ideas`, `simulation`, `idea-capture`.
- **`--local-only`** — skip GitHub repo creation. Default: create public repo.
- **`--private`** — create private GitHub repo. Default: public.

### Examples

```
/ideation-planning:new-workspace my-brainstorm --variant=ideation-session
/ideation-planning:new-workspace saas-pivot-analysis --variant=single-idea-eval
/ideation-planning:new-workspace vendor-shortlist --variant=multi-idea-ranking
/ideation-planning:new-workspace ai-policy-debate --variant=simulation
```

## Procedure

### 1. Parse arguments

Extract workspace name, target parent path, variant, and flags from `$ARGUMENTS`. If workspace name or variant is missing, ask the user.

### 2. Resolve the scaffold path

The bundled scaffold lives at `${CLAUDE_SKILL_DIR}/../../template/<variant>/`. Confirm it exists. If the variant isn't one of the six, list the valid variants and stop.

### 3. Read ambient facts

Read `~/.claude/CLAUDE.md` if it exists. Extract OS, locale, timezone, and identity facts to personalise the workspace CLAUDE.md.

### 4. Create the workspace directory

```bash
mkdir -p <target-parent>/<workspace-name>
cp -r ${CLAUDE_SKILL_DIR}/../../template/<variant>/. <target-parent>/<workspace-name>/
```

Do **not** copy any `.claude/` tree. The plugin's primitives are global.

### 5. Personalise CLAUDE.md

Open the workspace's `CLAUDE.md` and:

- Add a header noting workspace name and variant.
- Embed ambient OS/locale/timezone facts so downstream commands can skip re-asking.
- Leave any `{{PLACEHOLDER}}` tokens that require user input unresolved — step 6 handles those.

### 6. Prompt for variant-specific facts

Ask the user only for facts this plugin can't infer:

- **ideation-session**: the topic. Suggest running `/ideation-planning:ideation-configure` next.
- **single-idea-eval**: no prompt needed; user drops idea files into `input/ideas/to-process/` and runs `/ideation-planning:eval-single-idea`.
- **multi-idea-ranking**: what's being ranked (GitHub repos, products, vendors). Write into `spec/spec.md`.
- **feature-ideas**: the product/project name these ideas relate to.
- **simulation**: simulation type (`conference`, `negotiation`, or `debate-map`). Record in CLAUDE.md.
- **idea-capture**: the theme or scope of what will be captured.

### 7. Initialise git and (optionally) publish

```bash
cd <target-parent>/<workspace-name>
git init
git add .
git commit -m "Initial workspace from ideation-planning plugin"
```

Unless `--local-only`:

```bash
gh repo create <workspace-name> --<public|private> --source=. --push
```

### 8. Print next steps

Tell the user:

- Workspace path.
- Variant chosen.
- Which plugin commands apply for this variant (see README primitives list).
- Reminder that the workspace is **data** — plugin updates will not overwrite it.

## Notes

- Resolve the scaffold from `${CLAUDE_SKILL_DIR}/../../template/` (not `${CLAUDE_PLUGIN_ROOT}` — that's only exported in hooks/MCP).
- Never copy `.claude/commands/`, `.claude/agents/`, or `.claude/skills/` into the new workspace.
- Don't hard-code Daniel-specific paths or identifiers — everything comes from user memory or prompts.
