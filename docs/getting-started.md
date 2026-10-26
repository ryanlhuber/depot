# Getting started

A short path from nothing to a project that agents can work in. Each step is optional after the first, and nothing here changes how a skill behaves.

## Short version for one developer

1. Install `depot-core`, `depot-plan`, and `depot-dev` (add other buckets only if you use them), not the full plugin: `claude plugin install depot-core@depot`, `claude plugin install depot-plan@depot`, and `claude plugin install depot-dev@depot`. `kit-router` is in `depot-core`, `refine-issue` (the first step of Fix or Build to Merge) is in `depot-plan`, and `repo-conventions-setup` is in `depot-dev`.
2. Run `/depot-dev:repo-conventions-setup` once.
3. Describe your situation to `/depot-core:kit-router` and do what it recommends.

For a small, ordinary change, the light review path in [Fix or Build to Merge](../workflows/fix-or-build-to-merge.md) needs only you and one reviewer from a different model family. The full three-family review applies only to high-risk changes. Everything below is optional.

## 1. Install the skills

Pick one method. In Claude Code, the plugin is the simplest: `claude plugin marketplace add ryanlhuber/depot`, then `claude plugin install depot@depot`. Its skills are named `/depot:<skill>`, so the commands below read `/depot:repo-conventions-setup` and `/depot:kit-router`. To take only some skills, install the bucket plugins instead (for example `depot-core`, which has `kit-router`, plus `depot-plan` and `depot-dev`); their names carry the plugin, as in `/depot-dev:bug-fix`. For any other agent, or for editable copies in your project, run the command for your package manager from the project, as shown in the [README](../README.md#get-the-skills): `npx`, `pnpm dlx`, or `bunx`. Do not use both for the same agent. The installer asks which skills to take; include these two:

- `kit-router`, which tells you where to start for a given situation.
- `repo-conventions-setup`, which records how your project works (step 2).

Skills land in `.agents/skills/`. If you pick an agent with `-a`, the installer decides the folder. See [install notes](using-skills.md#install-notes) for the `devEngines` error and git access.

## 2. Set up the project once

Start `repo-conventions-setup` by name. It is a manual skill, so the model will not start it on its own. In Claude Code, run `/repo-conventions-setup` (`/depot:repo-conventions-setup` from the plugin); in Codex, mention `$repo-conventions-setup`; in other agents, ask for it by name.

It reads your repository first, asks only what the repository does not already answer (one question at a time), then drafts a short conventions section for your agent instructions file (`AGENTS.md` or `CLAUDE.md`): where work items live, where specifications and notes go, which commands check the work, and what agents must not do. It shows you the change before writing, runs only the check commands that are safe, and lists anything it could not verify. Re-run it when those conventions change.

## 3. Pick a starting point

Ask for `kit-router` and describe your situation in a sentence or two, such as "I have a vague idea for a settings page" or "this login test started failing". It recommends one skill, agent, or workflow, and at most two more to chain after it. It recommends only; you start the work.

## 4. Decide which skills the model may start

Focused craft skills run when your request matches them. Eleven skills are manual: you start them yourself, because a surprise run would be costly or would defeat their purpose (the review gates, long interviews, and release steps). The [full list and per-agent settings](using-skills.md#manual-and-automatic-skills) are in the usage guide. Change the split in your own copy if it does not suit you.

## 5. Add agents and workflows when you need them

Agents and workflows are Markdown files, not skills, so the installer does not place them. Copy the ones you want from [`agents/`](../agents/) and [`workflows/`](../workflows/), or use [skill sync](../integrations/skill-sync/README.md), which also pins the depot commit. Install the skills a workflow links before running it.

## 6. Keep it current

A plugin updates through its marketplace (`claude plugin update depot@depot`, or the bucket plugin's name, updates now). For the installer, re-run it with `update` to refresh what you installed, and re-run `add` to pick up new skills. Pick one method per project (plugin, installer, or sync), because they all put the same skills in your session.
