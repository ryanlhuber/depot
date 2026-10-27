# Skills

This directory holds every portable, reusable capability in the library: focused expertise, heuristics, procedures, checks, and expected outputs. Each skill is one folder, `skills/<bucket>/<name>/`, with a `SKILL.md` file and any supporting files such as `templates/`. The six buckets group skills by the kind of work they support; the categories below subdivide each bucket and are an index only.

This directory is the single source of truth. [`.agents/skills/`](../.agents/skills/) and [`.claude/skills/`](../.claude/skills/) are generated, flat mirrors that harnesses discover skills from: edit only under `skills/`, then run `scripts/sync-adapters.sh` to copy them across (`scripts/sync-adapters.sh --check` reports drift and stale copies). Skill names are unique across buckets.

Multi-stage orchestration does not belong here; place it in [`workflows/`](../workflows/). Specialist-role responsibilities belong in [`agents/`](../agents/), and technology-specific implementation belongs in [`integrations/`](../integrations/).

Use the [core artifact architecture](../docs/core-artifact-architecture.md) to classify a skill and the [artifact authoring standards](../docs/artifact-authoring-standards.md) to author one.

## Core

General skills for working well with AI agents in any domain.

### Authoring

- [Write Skill](core/write-skill/SKILL.md): creates or revises one portable skill with a description that triggers correctly, clear inputs, an actionable process, checks, and tested behavior.

### Decisions

- [Settle Decisions](core/settle-decisions/SKILL.md): resolves a plan's open decisions one question at a time, with options and a recommendation, and ends in an explicit confirmation.

### Continuity

- [Hand Off Session](core/hand-off-session/SKILL.md): condenses current work into a self-contained note so a fresh session, agent, or person can continue without the conversation.

### Routing

- [Route Work](core/route-work/SKILL.md): recommends which skill, agent, or workflow fits a described situation, and which models at what effort level to run it with. It recommends only and never runs the work.

### Tuning

- [Qualify Reviewer](core/qualify-reviewer/SKILL.md): qualifies a reviewer for one domain by scoring it on a seeded change with known defects.

## Plan

Turning a goal into a plan before a change exists, through to an approved specification for each item.

### Framing

- [Frame Problem](plan/frame-problem/SKILL.md): turns a vague goal into a one-page frame of the problem, users, constraints, non-goals, observable success measures, assumptions, and open questions.
- [Map Assumptions](plan/map-assumptions/SKILL.md): lists the premises a plan rests on, rates impact and evidence separately, and names the cheapest test or decision for each risky one.

### Structure

- [Define Epics](plan/define-epics/SKILL.md): divides a goal into outcome-defined epics with observable first slices and checks that they cover the success measures.
- [Draft Issues](plan/draft-issues/SKILL.md): slices an epic into draft work items with done signals, dependencies, and relative size bands, as plain Markdown that fits any tracker.
- [Sequence Work](plan/sequence-work/SKILL.md): finds real dependencies, resolves or reports cycles, and returns a build order with the longest hard-dependency chain and external blockers.

### Prioritization

- [Prioritize Backlog](plan/prioritize-backlog/SKILL.md): ranks items into Now, Next, Later, and Not now tiers with reasoning, dependency overrides, and close calls, stopping short of the decision.

### Scope

- [Simplify Scope](plan/simplify-scope/SKILL.md): finds the smallest version of a backlog, plan, design, or implementation that still delivers its outcome, with what to keep, remove, or defer, what each costs, and protected-area cuts flagged as owner decisions.

### Upkeep

- [Audit Backlog](plan/audit-backlog/SKILL.md): finds stale, duplicate, oversized, ill-formed, and misreported items and recommends an action for each without changing anything.
- [Write Roadmap](plan/write-roadmap/SKILL.md): writes a one-page now, next, and later roadmap of outcomes with stated confidence and no unsupported dates.
- [Report Status](plan/report-status/SKILL.md): reports progress from evidence rather than item states, separating done, in progress, blocked, and at risk against the baseline.

### Specification

- [Refine Issue](plan/refine-issue/SKILL.md): refines a work item (issue, ticket, task, or plain request) into an explicitly approved, implementation-ready specification, one decision at a time, without starting development. Works with any tracker, a file, or chat alone.

## UX

Learning about users and judging whether an experience works for them, to inform the interface design.

### Research

- [Compare Patterns](ux/compare-patterns/SKILL.md)
- [Write User Interview Guide](ux/write-user-interview-guide/SKILL.md)
- [Draft Personas](ux/draft-personas/SKILL.md)
- [Synthesize Research](ux/synthesize-research/SKILL.md)
- [Plan Usability Test](ux/plan-usability-test/SKILL.md)

### Definition

- [Design Navigation](ux/design-navigation/SKILL.md)
- [Map User Journey](ux/map-user-journey/SKILL.md)
- [Define Requirements](ux/define-requirements/SKILL.md)
- [Map User Flow](ux/map-user-flow/SKILL.md)

### Evaluation

- [Review Accessibility](ux/review-accessibility/SKILL.md)
- [Review Usability](ux/review-usability/SKILL.md)

### Content

- [Write Microcopy](ux/write-microcopy/SKILL.md)

## UI

Designing the interface and specifying it, ready for front-end handoff.

### Visual foundations

- [Define Design System](ui/define-design-system/SKILL.md)
- [Write DESIGN.md](ui/write-design-md/SKILL.md)

### Specification

- [Specify Interface States](ui/specify-interface-states/SKILL.md)
- [Specify Responsive Layout](ui/specify-responsive-layout/SKILL.md)

### Review

- [Review Visual Design](ui/review-visual-design/SKILL.md)
- [Review UI Fidelity](ui/review-ui-fidelity/SKILL.md)

### Communication

- [Write Design Rationale](ui/write-design-rationale/SKILL.md)

## Frontend

Building interfaces on the web platform from design decisions.

### Intake

- [Check Design Handoff](frontend/check-design-handoff/SKILL.md): reads design material before implementation and reports what is decided, proposed, open, conflicting, or missing, and what can be built now.

### Interface structure

- [Design Component API](frontend/design-component-api/SKILL.md): specifies a reusable component's inputs, state ownership, events, composition, styling hooks, and accessibility contract.
- [Write Semantic HTML](frontend/write-semantic-html/SKILL.md): chooses and writes semantic markup, with landmarks, headings, native controls, forms, accessible names, and ARIA only where native elements fall short.

### Interface behavior

- [Implement Interface States](frontend/implement-interface-states/SKILL.md): implements loading, empty, partial, error, and other specified states so each is representable, announced, recoverable, and demonstrable.

### Layout

- [Implement Responsive Layout](frontend/implement-responsive-layout/SKILL.md): builds a responsive layout plan in CSS and verifies it across viewports, zoom, text settings, and input modes.

### Styling foundations

- [Implement Design Tokens](frontend/implement-design-tokens/SKILL.md): implements decided design tokens in code with one source, layered names, theming, a migration from raw values, and a drift check.

## Dev

The process around a software change, from approved specification to verified merge, plus system audits.

### Setup

- [Record Repo Conventions](dev/record-repo-conventions/SKILL.md): records where work items live, how documents are laid out, which checks to run, and what needs approval, in the repository's agent instructions file.

### Build

- [Build Feature](dev/build-feature/SKILL.md): implements one approved specification as the smallest coherent change and reports each acceptance criterion's status with evidence.
- [Fix Bug](dev/fix-bug/SKILL.md): finds a defect's smallest cause, repairs it without widening scope, and proves the repair with a check that failed before and passes after.
- [Refactor](dev/refactor/SKILL.md): improves structure in small steps against a safety net while behavior stays the same.
- [Migrate System](dev/migrate-system/SKILL.md): moves a system between technical states in reversible steps with compatibility, data integrity, ordering, and rollback defined.

### Review

- [Review Code Independently](dev/review-code-independently/SKILL.md): reviews one revision against its specification and returns an evidenced PASS or FAIL report.
- [Review Code Adversarially](dev/review-code-adversarially/SKILL.md): tries to disprove a revision's correctness, in isolation from other reviews, and records the attacks attempted.
- [Reconcile Reviews](dev/reconcile-reviews/SKILL.md): merges independent reports into one finding list with a blocking set and chooses the re-review a repair needs.
- [Review Regressions](dev/review-regressions/SKILL.md): traces a change to the flows and contracts it could break and compares existing tests to those risks.

### Release

- [Check Merge Readiness](dev/check-merge-readiness/SKILL.md): verifies merge preconditions from evidence and returns ready or not ready with blockers.
- [Check Deployment Readiness](dev/check-deployment-readiness/SKILL.md): decides from evidence whether a change is safe to release to an environment, with the rollout, monitoring, and rollback it needs.

### Audit

- [Audit Security](dev/audit-security/SKILL.md): audits a defined scope for security weaknesses, traces each from an attacker-reachable entry point to an asset, and returns evidenced findings with a coverage statement.
- [Review Architecture](dev/review-architecture/SKILL.md): judges whether a system's or design's structure fits its stated goals and constraints, and returns evidenced findings with the cost of leaving each, the smallest fix, and the decisions that belong to others.
- [Audit Dependencies](dev/audit-dependencies/SKILL.md): reviews third-party dependencies for vulnerabilities, abandonment, license, and supply-chain risk, with risk-ranked findings.
- [Audit Tech Debt](dev/audit-tech-debt/SKILL.md): builds a debt register in which every item has evidence, a cost, and a place in a cleanup sequence.

### Documentation

- [Fix Docs](dev/fix-docs/SKILL.md): makes documentation usable by a named reader and checks that every reference in it is true.
