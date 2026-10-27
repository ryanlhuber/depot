# Depot

One library of small, composable agent skills for taking work from an idea to a verified change: general agent practice, planning, interface design, interface implementation, and software delivery. It holds 57 skills, 5 agents, and 8 workflows. Each skill is a folder with a `SKILL.md` in the open [Agent Skills format](https://agentskills.io/specification). Everything is Markdown you can read and use directly, with no build step. The skills are for people working with an AI assistant and for AI agents doing the work, and they load in Claude Code, Codex, OpenCode, and Hermes Agent.

A project is a project. Nothing here switches modes between a weekend prototype and a long-lived product; each skill scales its rigor to the risk and size of the change in front of it, so a small project that grows needs no rework.

## Get the skills

Pick one method per agent, because installing by plugin and by installer gives you every skill twice. A plugin updates through its marketplace; the installer copies editable files into your project, and you update them yourself.

<details open>
<summary><strong>Claude Code plugin</strong> (skills and agents; updates through the marketplace)</summary>

```sh
claude plugin marketplace add ryanlhuber/depot
claude plugin install depot@depot
```

Or, inside a session: `/plugin marketplace add ryanlhuber/depot`, then `/plugin install depot@depot`. Skills are namespaced by the plugin, for example `/depot:route-work`; the five agents appear as `depot:<agent>`. Workflows are Markdown files that the plugin does not load as a component, so read or copy them from [`workflows/`](workflows/). Third-party marketplaces do not auto-update by default; turn it on in `/plugin` under Marketplaces. The full plugin adds about 4,500 tokens of skill descriptions to every session (approximate; the sum of the table below).

**Only what you need.** Each bucket is also its own plugin, so a front-end developer need not carry the planning, UX, and UI skills. Install the buckets you use instead of `depot`, never both:

| Plugin | Skills | Always-on tokens (approx.) |
| --- | --- | --- |
| `depot-core` | 5 general skills, including `route-work` and `settle-decisions` | 395 |
| `depot-plan` | 11 planning skills, including `refine-issue` (needs `depot-core`, installed with it) | 905 |
| `depot-ux` | 12 UX skills | 935 |
| `depot-ui` | 7 UI skills | 525 |
| `depot-frontend` | 6 front-end skills | 490 |
| `depot-dev` | 16 delivery skills, including `record-repo-conventions` | 1,235 |
| `depot-agents` | the 5 agents, which apply skills from the buckets above | 0 |

```sh
claude plugin install depot-core@depot
claude plugin install depot-plan@depot
claude plugin install depot-dev@depot
claude plugin install depot-agents@depot
```

Skills are namespaced by the bucket plugin, for example `/depot-dev:fix-bug`. `route-work` knows every bucket, so it may recommend a skill you did not install. Update a bucket the same way as the full plugin.

</details>

<details open>
<summary><strong>Codex plugin</strong> (skills; updates through the marketplace)</summary>

```sh
codex plugin marketplace add ryanlhuber/depot
codex plugin add depot@depot
```

Codex reads the same marketplace file as Claude Code, so there is nothing else to set up. Skills are namespaced by the plugin, for example `depot:route-work`; mention one with `$` or browse them with `/skills`. Codex loads the skills only. The five agents and the workflows are Markdown files that it does not load, so read or copy them from [`agents/`](agents/) and [`workflows/`](workflows/).

```sh
codex plugin marketplace upgrade depot   # refresh the marketplace to the latest depot
codex plugin remove depot@depot          # uninstall
```

Tested on Codex CLI 0.164.0: the full `depot` plugin installs and every skill loads. The bucket plugins (`depot-core` and the rest) install there, but their skills did not load, so for a subset use the installer below. Updating was not tested across a version change.

</details>

To choose skills for any agent, or to get editable copies in your project, use a compatible skills installer. Run the command for your package manager from the project you want the skills in:

**npm**

```sh
npx skills@latest add ryanlhuber/depot
```

**pnpm**

```sh
pnpm dlx skills@latest add ryanlhuber/depot
```

**Bun**

```sh
bunx skills@latest add ryanlhuber/depot
```

Add `-a <agent>` (for example `-a opencode`) to pick the coding agent, and `--skill <name>` to pick skills; leave them off to choose when prompted. To update later, run the same command with `update` in place of `add ryanlhuber/depot`. The `bunx` command is the standard Bun equivalent and has not been run against this repository. Skills land in `.agents/skills/`; see [using skills](docs/using-skills.md#install-notes) for the pitfalls and what the installer does not copy. To keep another project's skills and agents current, see [skill sync](integrations/skill-sync/README.md).

You can also clone this repository and use it directly. [`.agents/skills/`](.agents/skills/) and [`.claude/skills/`](.claude/skills/) are generated mirrors that harnesses discover skills from, so a clone works without a setup step; the maintained source is [`skills/`](skills/). Keep a skill's supporting files (`templates/`) with it when copying.

## Start here

New to depot? Follow the [getting started guide](docs/getting-started.md); [using skills with an agent](docs/using-skills.md) covers how each tool discovers and invokes skills.

**Not sure where to start?** Ask for [`route-work`](skills/core/route-work/SKILL.md) and describe your situation. It recommends one skill, agent, or workflow to start with, what to chain after it, and which models to run each step with. Named models come from a model table: the [model routing table](integrations/model-routing/models.md) in this repository, or your own; without one it describes the capability needed for each step instead. It recommends only; it never runs the work.

**Know what you have?** Pick the skill that matches it. For example, give [review-code-independently](skills/dev/review-code-independently/SKILL.md) an approved specification, a diff, test results, and a commit hash and it returns a PASS or FAIL report with evidenced findings and the tests that were not run. Each skill states its required inputs, what it returns, and when not to use it. See the [worked examples](examples/README.md) for what good output looks like.

## Artifact model

- **Skills** contain reusable expertise and procedures for focused work.
- **Agents** define specialist roles that apply one or more skills.
- **Workflows** coordinate stages, handoffs, validation, and completion toward a larger outcome.

The canonical definitions, dependency rules, and classification guide are in the [core artifact architecture](docs/core-artifact-architecture.md).

## Naming

The shape of a name tells you the artifact type.

| Artifact | Shape | Examples |
| --- | --- | --- |
| Skill | `verb-object` | `fix-bug`, `draft-issues`, `review-usability` |
| Agent | `domain-role` | `backlog-owner`, `merge-gatekeeper` |
| Workflow | `input-to-output` | `goal-to-backlog`, `issue-to-merge` |

**Skills** start with a verb and name what they act on. Prefer three words or fewer. Use a plural object when the skill handles a set (`draft-issues`) and a singular one for a single item (`fix-bug`). A bare verb is fine when the verb alone is the established term (`refactor`). Use the same verb for the same kind of work:

- `write`, `draft`, `define`, `specify`, `implement`: produce something.
- `review`: judge one thing against a standard or specification.
- `audit`: sweep a whole area for findings.
- `check`: verify preconditions and return ready or not ready.
- `map`, `sequence`: map relationships and put work in order.

Skill names are unique across buckets and carry no bucket prefix; the plugin name supplies it (`/depot-dev:fix-bug`).

**Agents** are a domain plus a role: `<domain>-<role>`. The role is one of `owner` (holds the decisions in an area), `planner`, `reviewer`, or `gatekeeper` (holds a go or no-go gate). Reuse a listed role before adding a new one. The file name matches the `name` in its frontmatter.

**Workflows** name the artifact they start from and the artifact they end with: two nouns joined by `to`. Use no verbs and no "or". Matching ends make chains visible: `goal-to-backlog` ends in a backlog, and `backlog-to-roadmap` starts from one.

## Browse

Skills live in six buckets. The [skills index](skills/README.md) has one-line descriptions.

### Core

General skills for working well with AI agents in any domain: authoring skills, interviewing for decisions, handing work between sessions, qualifying reviewers, and choosing where to start.

| Area | Skills |
| --- | --- |
| Authoring | [write-skill](skills/core/write-skill/SKILL.md) |
| Decisions | [settle-decisions](skills/core/settle-decisions/SKILL.md) |
| Continuity | [hand-off-session](skills/core/hand-off-session/SKILL.md) |
| Routing | [route-work](skills/core/route-work/SKILL.md) |
| Tuning | [qualify-reviewer](skills/core/qualify-reviewer/SKILL.md) |

### Plan

Turning a goal into a plan before a change exists: framing the problem, slicing outcomes into draft work items, ordering them, ranking and trimming what to build next, keeping the backlog honest, and refining each item into an approved specification. Plans propose and owners decide; every item states one observable done signal, and size bands order items against each other without implying time estimates.

| Stage | Skills |
| --- | --- |
| Framing | • [frame-problem](skills/plan/frame-problem/SKILL.md)<br>• [map-assumptions](skills/plan/map-assumptions/SKILL.md) |
| Structure | • [define-epics](skills/plan/define-epics/SKILL.md)<br>• [draft-issues](skills/plan/draft-issues/SKILL.md)<br>• [sequence-work](skills/plan/sequence-work/SKILL.md) |
| Prioritization | [prioritize-backlog](skills/plan/prioritize-backlog/SKILL.md) |
| Scope | [simplify-scope](skills/plan/simplify-scope/SKILL.md) |
| Upkeep | • [audit-backlog](skills/plan/audit-backlog/SKILL.md)<br>• [write-roadmap](skills/plan/write-roadmap/SKILL.md)<br>• [report-status](skills/plan/report-status/SKILL.md) |
| Specification | [refine-issue](skills/plan/refine-issue/SKILL.md) |

### UX

Learning about users and judging whether an experience works for them, to inform the interface design: research, definition, evaluation, and interface wording. Findings separate observations, standards, heuristics, and preference, and rate severity and confidence independently.

| Stage | Skills |
| --- | --- |
| Research | • [compare-patterns](skills/ux/compare-patterns/SKILL.md)<br>• [draft-personas](skills/ux/draft-personas/SKILL.md)<br>• [write-user-interview-guide](skills/ux/write-user-interview-guide/SKILL.md)<br>• [synthesize-research](skills/ux/synthesize-research/SKILL.md)<br>• [plan-usability-test](skills/ux/plan-usability-test/SKILL.md) |
| Definition | • [define-requirements](skills/ux/define-requirements/SKILL.md)<br>• [map-user-flow](skills/ux/map-user-flow/SKILL.md)<br>• [map-user-journey](skills/ux/map-user-journey/SKILL.md)<br>• [design-navigation](skills/ux/design-navigation/SKILL.md) |
| Evaluation | • [review-usability](skills/ux/review-usability/SKILL.md)<br>• [review-accessibility](skills/ux/review-accessibility/SKILL.md) |
| Content | [write-microcopy](skills/ux/write-microcopy/SKILL.md) |

### UI

Designing the interface and specifying it, ready for front-end handoff: visual foundations, states and layout, review against the design, and communication of decisions. The same separation applies.

| Stage | Skills |
| --- | --- |
| Visual foundations | • [define-design-system](skills/ui/define-design-system/SKILL.md)<br>• [write-design-md](skills/ui/write-design-md/SKILL.md) |
| Specification | • [specify-interface-states](skills/ui/specify-interface-states/SKILL.md)<br>• [specify-responsive-layout](skills/ui/specify-responsive-layout/SKILL.md) |
| Review | • [review-visual-design](skills/ui/review-visual-design/SKILL.md)<br>• [review-ui-fidelity](skills/ui/review-ui-fidelity/SKILL.md) |
| Communication | [write-design-rationale](skills/ui/write-design-rationale/SKILL.md) |

### Frontend

Building interfaces on the web platform from decided designs: structure, behavior, layout, and styling foundations. These skills implement decisions rather than make them. They are written for the web platform (HTML, CSS, JavaScript, and browser accessibility semantics); framework specifics belong in `integrations/`.

| Stage | Skills |
| --- | --- |
| Intake | [check-design-handoff](skills/frontend/check-design-handoff/SKILL.md) |
| Interface structure | • [design-component-api](skills/frontend/design-component-api/SKILL.md)<br>• [write-semantic-html](skills/frontend/write-semantic-html/SKILL.md) |
| Interface behavior | [implement-interface-states](skills/frontend/implement-interface-states/SKILL.md) |
| Layout | [implement-responsive-layout](skills/frontend/implement-responsive-layout/SKILL.md) |
| Styling foundations | [implement-design-tokens](skills/frontend/implement-design-tokens/SKILL.md) |

### Dev

The process around a software change: recording a repository's conventions, building from an approved specification, independent review, and a verified merge and release, plus audits of security, architecture, dependencies, and debt. Approvals belong to a revision, and independence between reviewers is never weakened silently.

| Stage | Skills |
| --- | --- |
| Setup | [record-repo-conventions](skills/dev/record-repo-conventions/SKILL.md) |
| Build | • [build-feature](skills/dev/build-feature/SKILL.md)<br>• [fix-bug](skills/dev/fix-bug/SKILL.md)<br>• [refactor](skills/dev/refactor/SKILL.md)<br>• [migrate-system](skills/dev/migrate-system/SKILL.md) |
| Review | • [review-code-independently](skills/dev/review-code-independently/SKILL.md)<br>• [review-code-adversarially](skills/dev/review-code-adversarially/SKILL.md)<br>• [reconcile-reviews](skills/dev/reconcile-reviews/SKILL.md)<br>• [review-regressions](skills/dev/review-regressions/SKILL.md) |
| Release | • [check-merge-readiness](skills/dev/check-merge-readiness/SKILL.md)<br>• [check-deployment-readiness](skills/dev/check-deployment-readiness/SKILL.md) |
| Audit | • [audit-security](skills/dev/audit-security/SKILL.md)<br>• [review-architecture](skills/dev/review-architecture/SKILL.md)<br>• [audit-dependencies](skills/dev/audit-dependencies/SKILL.md)<br>• [audit-tech-debt](skills/dev/audit-tech-debt/SKILL.md) |
| Documentation | [fix-docs](skills/dev/fix-docs/SKILL.md) |

## Agents

An agent is a specialist role that owns a decision and applies several skills to it. Use one when a task needs that ownership, such as deciding whether a reviewed change may go to a human for merge; use a skill directly when the expertise alone is enough.

| Agent | Owns |
| --- | --- |
| [delivery-planner](agents/delivery-planner.md) | The delivery plan for a goal, from framed problem to dependency order. It does not rank by priority or build anything. |
| [backlog-owner](agents/backlog-owner.md) | The proposed order and scope of a backlog, ending in a roadmap. It stops at the owner's decision on what ships. |
| [design-reviewer](agents/design-reviewer.md) | One prioritized expert review of a design or build, with severity and confidence kept separate. |
| [design-system-owner](agents/design-system-owner.md) | Design-system decisions (tokens, component rules, states, responsive behavior), each marked decided, proposed, or open, in one DESIGN.md. |
| [merge-gatekeeper](agents/merge-gatekeeper.md) | The readiness decision for a reviewed change, from independent reviews and verified merge preconditions. It stops at the human merge decision. |

The [agents index](agents/README.md) has the full descriptions and the file format.

## Workflows

A workflow assigns skills and agents to ordered stages with handoffs, validation, and stopping rules. Workflows are optional; any skill works on its own. The [workflows index](workflows/README.md) has the full descriptions.

- [Goal to Backlog](workflows/goal-to-backlog.md): a goal through epics and draft work items to a ranked backlog, ready for refinement.
- [Idea to POC](workflows/idea-to-poc.md): frames a question worth testing and cuts the work to the smallest slice that can answer it.
- [Backlog to Roadmap](workflows/backlog-to-roadmap.md): cleans and re-ranks a backlog, then writes a now/next/later roadmap.
- [Brief to Requirements](workflows/brief-to-requirements.md): a vague brief to traceable requirements, task flows, and a content structure.
- [Design to Validation](workflows/design-to-validation.md): expert review, a targeted test plan, analyzed session results, and recorded decisions.
- [Issue to Merge](workflows/issue-to-merge.md): one approved feature or defect through build or repair, independent review, and a verified human merge.
- [Feature to Release](workflows/feature-to-release.md): wraps Issue to Merge with regression review, documentation, a release-readiness check, and a human release decision.
- [Spec to UI](workflows/spec-to-ui.md): an approved interface specification to working front-end code, checked against the specification.

## Principles

- Evidence over assertion. No evidence, no finding; never report a check, result, or approval that was not produced.
- Do not invent facts. Users, measures, baselines, values, and results are marked supplied or assumed, and a gap becomes an open question.
- One responsibility per skill. Orchestration belongs in workflows and decisions in agents.
- Humans keep the decisions that matter: approving a specification, accepting risk, ranking and cutting scope, and merging.
- Keep skills portable. Skills describe capabilities and outcomes, not a particular model, harness, tracker, design tool, or platform. Environment-specific adapters live in [`integrations/`](integrations/).

## Repository map

| Path | Purpose |
| --- | --- |
| [`skills/`](skills/) | Portable, focused capabilities grouped in buckets, one folder per skill with a `SKILL.md` (indexed in [`skills/README.md`](skills/README.md)) |
| [`agents/`](agents/) | Portable specialist roles and responsibility boundaries, one `<name>.md` per agent |
| [`workflows/`](workflows/) | Portable multi-stage orchestration |
| [`integrations/`](integrations/) | Replaceable technology- and environment-specific adapters: skill sync and model routing |
| [`docs/`](docs/) | Repository-wide architecture, standards, and governance |
| [`examples/`](examples/) | Non-canonical demonstrations of skill output |
| [`tests/`](tests/) | Repository validator and behavioral cases |
| `.agents/skills/`, `.claude/` | Generated mirrors for harness discovery; never edit by hand |

## Contributing

Edit skills only under `skills/` and agents only under `agents/`, then run `scripts/sync-adapters.sh` to regenerate the mirrors. Run `tests/validate-repository.sh` to check structure, links, indexes, the router map, and sync. Use the [behavioral cases](tests/behavioral-cases.md) for changes that affect model behavior. Names follow the shape for their artifact type; see [Naming](#naming). Start with [CONTRIBUTING.md](CONTRIBUTING.md); [AGENTS.md](AGENTS.md) has the repository rules.

## License

depot is available under the [MIT License](LICENSE).
