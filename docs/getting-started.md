# Getting started

A short path from nothing to a project that agents can work in. Each step is optional after the first, and nothing here changes how a skill behaves.

## 1. Install the skills

Run the command for your package manager from the project, as shown in the [README](../README.md#get-the-skills): `npx`, `pnpm dlx`, or `bunx`. When prompted, choose the skills you want. Include these two:

- `kit-router`, which tells you where to start for a given situation.
- `repo-conventions-setup`, which records how your project works (step 2).

Skills land in `.agents/skills/`. If you pick an agent with `-a`, the installer decides the folder. See [install notes](using-skills.md#install-notes) for the `devEngines` error and private-repository access.

## 2. Set up the project once

Start `repo-conventions-setup` by name. It is a manual skill, so the model will not start it on its own. In Claude Code, run `/repo-conventions-setup`; in Codex, mention `$repo-conventions-setup`; in other agents, ask for it by name.

It reads your repository first, asks only what the repository does not already answer (one question at a time), then drafts a short conventions section for your agent instructions file (`AGENTS.md` or `CLAUDE.md`): where work items live, where specifications and notes go, which commands check the work, and what agents must not do. It shows you the change before writing, runs only the check commands that are safe, and lists anything it could not verify. Re-run it when those conventions change.

## 3. Pick a starting point

Ask for `kit-router` and describe your situation in a sentence or two, such as "I have a vague idea for a settings page" or "this login test started failing". It recommends one skill, agent, or workflow, and at most two more to chain after it. It recommends only; you start the work.

## 4. Decide which skills the model may start

Focused craft skills run when your request matches them. Eleven skills are manual: you start them yourself, because a surprise run would be costly or would defeat their purpose (the review gates, long interviews, and release steps). The [full list and per-agent settings](using-skills.md#manual-and-automatic-skills) are in the usage guide. Change the split in your own copy if it does not suit you.

## 5. Add agents and workflows when you need them

Agents and workflows are Markdown files, not skills, so the installer does not place them. Copy the ones you want from [`agents/`](../agents/) and [`workflows/`](../workflows/), or use [skill sync](../integrations/skill-sync/README.md), which also pins the depot commit. Install the skills a workflow links before running it.

## 6. Keep it current

Re-run the installer with `update` to refresh what you installed, and re-run `add` to pick up new skills. Pick one method per project (installer or sync), because both write the same skill folders.
