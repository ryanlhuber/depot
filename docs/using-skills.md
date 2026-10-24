# Use depot skills with an agent

The maintained files are in [`skills/`](../skills/), grouped into bucket folders (`core`, `plan`, `design`, `frontend`, `dev`). Every skill uses the [Agent Skills `SKILL.md` format](https://agentskills.io/specification) and keeps its supporting files, such as `templates/`, in the same folder. [`.agents/skills/`](../.agents/skills/) and [`.claude/skills/`](../.claude/skills/) are generated flat mirrors, one folder per skill, because harnesses discover skills one folder level deep.

Not sure which skill, agent, or workflow fits? Ask for the [`kit-router`](../skills/core/kit-router/SKILL.md) skill and describe your situation. It recommends one place to start and the models to run it with.

## In a clone of this repository

| Agent | Discovery path | How to start |
| --- | --- | --- |
| Codex | [`.agents/skills/`](../.agents/skills/) | Mention a skill with `$`, such as `$independent-code-review`, or use `/skills`. [Codex skills docs](https://learn.chatgpt.com/docs/build-skills) |
| OpenCode | [`.agents/skills/`](../.agents/skills/) | Ask for the task or load a skill with its skill tool. [OpenCode skills docs](https://opencode.ai/docs/skills) |
| Hermes Agent | [`.agents/skills/`](../.agents/skills/) | Run `hermes skills trust` once for this checkout, then invoke `/independent-code-review` or describe the task. [Hermes project skills docs](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills/) |
| Claude Code | [`.claude/skills/`](../.claude/skills/) | Invoke `/independent-code-review` or describe the task. [Claude Code skills docs](https://code.claude.com/docs/en/skills) |

The discovery folders contain the full skill files as regular files, so no symlink support or setup step is needed in a clone.

## What to give a skill

Each skill states its required and optional inputs, what it returns, and when not to use it. Supply the material it asks for, such as the approved specification, the diff, the test results, and the revision identifier. When something required is missing, a skill should say so and ask, not fill the gap.

## Keep qualification honest

[Reviewer qualification](../skills/core/reviewer-qualification/SKILL.md) only measures a candidate when the answer key stays out of its context. Run each candidate in a fresh conversation, give it only the inputs the skill lists, and save its report as a file before scoring it.

## Keep reviews independent

Review skills only work as independent checks when each reviewer is a separate session or party that does not see the others' output. Run each review in a fresh conversation, give it only the inputs its skill lists, and save its report as a file before anyone reads the next review.

## Use an agent

An agent is a Markdown file in [`agents/`](../agents/), such as [`merge-gatekeeper.md`](../agents/merge-gatekeeper.md), that defines a specialist role and names the skills it applies. Give the file to your agent as its instructions, or let Claude Code discover it from [`.claude/agents/`](../.claude/agents/), a generated mirror. The skills it names must be installed alongside it. Agents are optional; any skill works on its own.

## Use a workflow

A workflow is a Markdown file in [`workflows/`](../workflows/) that assigns skills to ordered stages and defines the handoffs, validation, and stopping rules. To run one, give an agent the workflow file and make sure the skills and agents it links are installed. Workflows are optional; any skill works on its own.

## Outside this repository

Install skills with `npx skills`, or copy the entire folder for each skill you want. Keep `SKILL.md` and its `templates/` together. To keep copies of skills and agents in a project repository current, use the sync adapter described in [skill sync](../integrations/skill-sync/README.md).

To install with `npx skills`, run this from the project and choose the skills when prompted:

```sh
npx skills@latest add ryanlhuber/depot
npx skills@latest add ryanlhuber/depot -a opencode --skill <skill-name> --copy
```

`-a` names the coding agent to install for, such as `opencode`; use `'*'` for all agents, or leave it off to choose. `--skill` selects skills by folder name (`'*'` for all). `--copy` writes regular files instead of symlinks, so they can be committed with the project. `npx skills@latest update` refreshes what was installed. The installer decides each agent's folder; OpenCode and Codex read `.agents/skills/`.

Agent and workflow files are not skills, so copy them by hand or use the sync approach linked above, which also pins the depot commit. Pick one method per project: both write the same skill folders.

Keep credentials, secrets, proprietary source, and confidential issue text outside the public repository. Supply them privately to the agent you choose, and review every output before using it.

## Contributing

Edit skills only under `skills/` and agents only under `agents/`, then run `scripts/sync-adapters.sh` to regenerate `.agents/skills/`, `.claude/skills/`, and `.claude/agents/`, and `tests/validate-repository.sh` to check the result. See [CONTRIBUTING.md](../CONTRIBUTING.md).
