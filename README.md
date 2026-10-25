# Depot

One library of small, composable agent skills for taking work from an idea to a verified change: general agent practice, planning, interface design, interface implementation, and software delivery. It holds 58 skills, 5 agents, and 8 workflows. Each skill is a folder with a `SKILL.md` in the open [Agent Skills format](https://agentskills.io/specification). Everything is Markdown you can read and use directly, with no build step. The skills are for people working with an AI assistant and for AI agents doing the work.

A project is a project. Nothing here switches modes between a weekend prototype and a long-lived product; each skill scales its rigor to the risk and size of the change in front of it, so a small project that grows needs no rework.

## Get the skills

Pick one method per agent, because installing by plugin and by installer gives you every skill twice. A plugin updates through its marketplace; the installer copies editable files into your project, and you update them yourself.

<details open>
<summary><strong>Claude Code plugin</strong> (skills and agents; updates through the marketplace)</summary>

```sh
claude plugin marketplace add ryanlhuber/depot
claude plugin install depot@depot
```

Or, inside a session: `/plugin marketplace add ryanlhuber/depot`, then `/plugin install depot@depot`. Skills are namespaced by the plugin, for example `/depot:kit-router`; the five agents appear as `depot:<agent>`. Workflows are Markdown files that the plugin does not load as a component, so read or copy them from [`workflows/`](workflows/). Third-party marketplaces do not auto-update by default; turn it on in `/plugin` under Marketplaces. The full plugin adds about 4,400 tokens of skill descriptions to every session, measured with `claude plugin details depot`.

**Only what you need.** Each bucket is also its own plugin, so a front-end developer need not carry the planning and design skills. Install the buckets you use instead of `depot`, never both:

| Plugin | Skills | Always-on tokens (approx.) |
| --- | --- | --- |
| `depot-core` | 7 general skills, including `kit-router` and `simplification-review` | 555 |
| `depot-plan` | 9 planning skills (needs `depot-core`, installed with it) | 750 |
| `depot-design` | 20 design skills | 1,540 |
| `depot-frontend` | 6 front-end skills | 490 |
| `depot-dev` | 16 delivery skills | 1,230 |
| `depot-agents` | the 5 agents, which apply skills from the buckets above | 0 |

```sh
claude plugin install depot-dev@depot
claude plugin install depot-agents@depot
```

Skills are namespaced by the bucket plugin, for example `/depot-dev:bug-fix`. `kit-router` knows every bucket, so it may recommend a skill you did not install. Update a bucket the same way as the full plugin.

</details>

Use a compatible skills installer to choose what you need, for any agent (or to get editable copies in your project). Run the command that matches your package manager from the project you want the skills in:

<details>
<summary><strong>npm</strong></summary>

```sh
npx skills@latest add ryanlhuber/depot
```

</details>

<details>
<summary><strong>pnpm</strong> (use this if the project's <code>package.json</code> requires pnpm; <code>npx</code> fails there)</summary>

```sh
pnpm dlx skills@latest add ryanlhuber/depot
```

</details>

<details>
<summary><strong>Bun</strong></summary>

```sh
bunx skills@latest add ryanlhuber/depot
```

</details>

Add `-a <agent>` (for example `-a opencode`) to pick the coding agent, and `--skill <name>` to pick skills; leave them off to choose when prompted. To update later, run the same command with `update` in place of `add ryanlhuber/depot`. The `bunx` command is the standard Bun equivalent and has not been run against this repository.

Skills land in `.agents/skills/`. See [using skills](docs/using-skills.md#install-notes) for the pitfalls and what the installer does not copy.

You can also clone this repository and use it directly. The maintained source is [`skills/`](skills/), grouped into bucket folders; [`.agents/skills/`](.agents/skills/) and [`.claude/skills/`](.claude/skills/) are generated flat mirrors that harnesses discover skills from, so a clone works without a setup step. Keep a skill's supporting files (`templates/`) with it when copying.

New to depot? Follow the [getting started guide](docs/getting-started.md). See [using skills with an agent](docs/using-skills.md) for how each tool discovers and invokes them. To keep another project's copies current, see [skill sync](integrations/skill-sync/README.md).

## Not sure where to start?

Ask for [`kit-router`](skills/core/kit-router/SKILL.md) and describe your situation. It recommends one skill, agent, or workflow to start with, what to chain after it, and which models to run each step with. Named models come from a model table: the [model routing table](integrations/model-routing/models.md) in this repository, or your own. The router skill alone does not include a table, and without one it describes the capability needed for each step instead of naming models. It recommends only; it never runs the work.

## Browse

Skills live in five buckets. The [skills index](skills/README.md) has one-line descriptions.

### Core

General skills for working well with AI agents in any domain: authoring skills, interviewing for decisions, handing work between sessions, recording a repository's conventions, simplifying scope, qualifying reviewers, and choosing where to start.

| Area | Skills |
| --- | --- |
| Authoring | [skill-authoring](skills/core/skill-authoring/SKILL.md) |
| Decisions | [decision-interview](skills/core/decision-interview/SKILL.md) |
| Continuity | [session-handoff](skills/core/session-handoff/SKILL.md) |
| Setup | [repo-conventions-setup](skills/core/repo-conventions-setup/SKILL.md) |
| Simplifying | [simplification-review](skills/core/simplification-review/SKILL.md) |
| Routing | [kit-router](skills/core/kit-router/SKILL.md) |
| Tuning | [reviewer-qualification](skills/core/reviewer-qualification/SKILL.md) |

### Plan

Turning a goal into a plan, before a change exists: framing the problem, slicing outcomes into draft work items, ordering them, ranking what to build next, and keeping the backlog honest.

| Stage | Skills |
| --- | --- |
| Framing | • [problem-framing](skills/plan/problem-framing/SKILL.md)<br>• [assumption-mapping](skills/plan/assumption-mapping/SKILL.md) |
| Structure | • [outcome-slicing](skills/plan/outcome-slicing/SKILL.md)<br>• [issue-breakdown](skills/plan/issue-breakdown/SKILL.md)<br>• [dependency-mapping](skills/plan/dependency-mapping/SKILL.md) |
| Prioritization | [backlog-prioritization](skills/plan/backlog-prioritization/SKILL.md) |
| Upkeep | • [backlog-health-check](skills/plan/backlog-health-check/SKILL.md)<br>• [roadmap-writing](skills/plan/roadmap-writing/SKILL.md)<br>• [status-reporting](skills/plan/status-reporting/SKILL.md) |

### Design

Creating and evaluating user experiences and interfaces: research, definition, design specification, review, and communication of decisions.

| Stage | Skills |
| --- | --- |
| Research | • [competitive-pattern-analysis](skills/design/competitive-pattern-analysis/SKILL.md)<br>• [persona-and-scenario-drafting](skills/design/persona-and-scenario-drafting/SKILL.md)<br>• [interview-guide-writing](skills/design/interview-guide-writing/SKILL.md)<br>• [research-synthesis](skills/design/research-synthesis/SKILL.md)<br>• [usability-test-planning](skills/design/usability-test-planning/SKILL.md) |
| Definition | • [requirements-definition](skills/design/requirements-definition/SKILL.md)<br>• [user-flow-mapping](skills/design/user-flow-mapping/SKILL.md)<br>• [journey-mapping](skills/design/journey-mapping/SKILL.md)<br>• [information-architecture-and-navigation](skills/design/information-architecture-and-navigation/SKILL.md) |
| Design and specification | • [design-token-and-system-definition](skills/design/design-token-and-system-definition/SKILL.md)<br>• [design-md-writing](skills/design/design-md-writing/SKILL.md)<br>• [interface-state-specification](skills/design/interface-state-specification/SKILL.md)<br>• [responsive-layout-planning](skills/design/responsive-layout-planning/SKILL.md)<br>• [ux-microcopy-writing](skills/design/ux-microcopy-writing/SKILL.md) |
| Review and quality | • [accessibility-review](skills/design/accessibility-review/SKILL.md)<br>• [heuristic-usability-evaluation](skills/design/heuristic-usability-evaluation/SKILL.md)<br>• [visual-design-critique](skills/design/visual-design-critique/SKILL.md)<br>• [design-to-implementation-qa](skills/design/design-to-implementation-qa/SKILL.md) |
| Communication | • [design-rationale-writing](skills/design/design-rationale-writing/SKILL.md)<br>• [portfolio-case-study-writing](skills/design/portfolio-case-study-writing/SKILL.md) |

### Frontend

Building interfaces on the web platform from decided designs: structure, behavior, layout, and styling foundations.

| Stage | Skills |
| --- | --- |
| Intake | [design-spec-intake](skills/frontend/design-spec-intake/SKILL.md) |
| Interface structure | • [component-api-design](skills/frontend/component-api-design/SKILL.md)<br>• [semantic-html-structure](skills/frontend/semantic-html-structure/SKILL.md) |
| Interface behavior | [interface-state-implementation](skills/frontend/interface-state-implementation/SKILL.md) |
| Layout | [responsive-implementation](skills/frontend/responsive-implementation/SKILL.md) |
| Styling foundations | [design-token-implementation](skills/frontend/design-token-implementation/SKILL.md) |

### Dev

The process around a software change, from approved specification through building, independent review, and a verified merge and release, plus audits of a system's security, architecture, dependencies, and debt.

| Stage | Skills |
| --- | --- |
| Specification | [refine-issue](skills/dev/refine-issue/SKILL.md) |
| Build | • [feature-build](skills/dev/feature-build/SKILL.md)<br>• [bug-fix](skills/dev/bug-fix/SKILL.md)<br>• [refactor](skills/dev/refactor/SKILL.md)<br>• [migration](skills/dev/migration/SKILL.md) |
| Review | • [independent-code-review](skills/dev/independent-code-review/SKILL.md)<br>• [adversarial-code-review](skills/dev/adversarial-code-review/SKILL.md)<br>• [review-reconciliation](skills/dev/review-reconciliation/SKILL.md)<br>• [regression-review](skills/dev/regression-review/SKILL.md) |
| Release | • [merge-readiness-check](skills/dev/merge-readiness-check/SKILL.md)<br>• [deployment-readiness](skills/dev/deployment-readiness/SKILL.md) |
| Audit | • [security-audit](skills/dev/security-audit/SKILL.md)<br>• [architecture-review](skills/dev/architecture-review/SKILL.md)<br>• [dependency-audit](skills/dev/dependency-audit/SKILL.md)<br>• [technical-debt-audit](skills/dev/technical-debt-audit/SKILL.md) |
| Documentation | [documentation-pass](skills/dev/documentation-pass/SKILL.md) |

## Agents

An agent is a specialist role that owns a decision and applies several skills to it. Use one when a task needs that ownership, such as deciding whether a reviewed change may go to a human for merge; use a skill directly when the expertise alone is enough.

| Agent | Owns |
| --- | --- |
| [delivery-planner](agents/delivery-planner.md) | The delivery plan for a goal: a framed problem, an assumption register, epics, draft work items, and a dependency order, ready for refinement. It does not rank by priority or build anything. |
| [backlog-owner](agents/backlog-owner.md) | The proposed order and scope of a backlog: health findings, priority tiers, scope cuts, and a roadmap. It stops at the owner's decision on what ships. |
| [design-reviewer](agents/design-reviewer.md) | A consolidated expert review: applies the usability, accessibility, visual, and specification-conformance reviews that fit and returns one prioritized list, with severity and confidence kept separate. |
| [design-system-designer](agents/design-system-designer.md) | Design-system decisions: tokens, component rules, states, and responsive behavior, each marked decided, proposed, or open, recorded in one DESIGN.md. |
| [merge-gatekeeper](agents/merge-gatekeeper.md) | The readiness decision for a reviewed change: one blocking set from independent reviews, the re-review a repair needs, and merge preconditions verified from evidence. It stops at the human merge decision. |

The [agents index](agents/README.md) explains the file format. Agents are installed the same way as skills; see [skill sync](integrations/skill-sync/README.md) to keep them current in another repository.

## Workflows

A workflow assigns skills and agents to ordered stages with handoffs, validation, and stopping rules. Workflows are optional; any skill works on its own. See the [workflows index](workflows/README.md).

- [Goal to Backlog](workflows/goal-to-backlog.md): takes a goal from framing through epics, draft work items, dependency order, and a ranked backlog, ready to hand to refinement.
- [POC Scoping](workflows/poc-scoping.md): frames a question worth testing and cuts the work to the smallest slice that can answer it.
- [Roadmap Planning](workflows/roadmap-planning.md): cleans and re-ranks an existing backlog, then turns it into a now/next/later roadmap with confidence stated, plus an optional status report.
- [Discovery to Definition](workflows/discovery-to-definition.md): turns a vague brief into traceable requirements, user and solution findings, task flows, and a content structure.
- [Design to Validation](workflows/design-to-validation.md): takes a design through expert review, a targeted test plan, analyzed session results, and recorded decisions.
- [Fix or Build to Merge](workflows/fix-or-build-to-merge.md): takes one feature or defect from an approved specification through build or a proven minimal repair, regression review for defects, one independent review for ordinary changes or two for high-risk ones, bounded repairs, and a verified human merge.
- [Feature Delivery](workflows/feature-delivery.md): wraps Fix or Build to Merge with regression review, documentation, release-readiness, and a human release decision.
- [Spec to UI](workflows/spec-to-ui.md): turns an approved interface specification into structure, states, responsive behavior, and tokens, then checks the build against the specification.

## Start with one skill

Pick the skill that matches what you have in hand. For example, give [independent-code-review](skills/dev/independent-code-review/SKILL.md) an approved specification, a diff, test results, and a commit hash and it returns a PASS or FAIL report with evidenced findings and the tests that were not run. Each skill states its required inputs, what it returns, and when not to use it. See the [worked examples](examples/README.md) for what good output looks like.

## Principles

Everywhere:

- Evidence over assertion. No evidence, no finding; never report a check, result, or approval that was not produced.
- Do not invent facts. Users, measures, baselines, values, and results are marked supplied or assumed, and a gap becomes an open question.
- One responsibility per skill. Orchestration belongs in workflows and decisions in agents.
- Humans keep the decisions that matter: approving a specification, accepting risk, ranking and cutting scope, and merging.
- Keep skills portable. Skills describe capabilities and outcomes, not a particular model, harness, tracker, design tool, or platform. Environment-specific adapters live in [`integrations/`](integrations/).

By bucket:

- **Plan:** plans propose and owners decide. Every item states one observable done signal, and size bands order items against each other without implying time estimates.
- **Design:** separate observations, standards, heuristics, and preference, and rate severity and confidence independently.
- **Frontend:** implement decisions; do not make them. Core skills are written for the web platform (HTML, CSS, JavaScript, and browser accessibility semantics); framework specifics belong in `integrations/`.
- **Dev:** approvals belong to a revision, and independence between reviewers is never weakened silently.

## Artifact model

- **Skills** contain reusable expertise and procedures for focused work.
- **Agents** define specialist roles that apply one or more skills.
- **Workflows** coordinate stages, handoffs, validation, and completion toward a larger outcome.

The canonical definitions, dependency rules, and classification guide are in the [core artifact architecture](docs/core-artifact-architecture.md).

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

Edit skills only under `skills/` and agents only under `agents/`, then run `scripts/sync-adapters.sh` to regenerate the mirrors. Run `tests/validate-repository.sh` to check structure, links, indexes, the router map, and sync. Use the [behavioral cases](tests/behavioral-cases.md) for changes that affect model behavior. Start with [CONTRIBUTING.md](CONTRIBUTING.md); [AGENTS.md](AGENTS.md) has the repository rules.

## License

depot is available under the [MIT License](LICENSE).
