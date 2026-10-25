# Skills

This directory holds every portable, reusable capability in the library: focused expertise, heuristics, procedures, checks, and expected outputs. Each skill is one folder, `skills/<bucket>/<name>/`, with a `SKILL.md` file and any supporting files such as `templates/`. The five buckets group skills by the kind of work they support; the categories below subdivide each bucket and are an index only.

This directory is the single source of truth. [`.agents/skills/`](../.agents/skills/) and [`.claude/skills/`](../.claude/skills/) are generated, flat mirrors that harnesses discover skills from: edit only under `skills/`, then run `scripts/sync-adapters.sh` to copy them across (`scripts/sync-adapters.sh --check` reports drift and stale copies). Skill names are unique across buckets.

Multi-stage orchestration does not belong here; place it in [`workflows/`](../workflows/). Specialist-role responsibilities belong in [`agents/`](../agents/), and technology-specific implementation belongs in [`integrations/`](../integrations/).

Use the [core artifact architecture](../docs/core-artifact-architecture.md) to classify a skill and the [artifact authoring standards](../docs/artifact-authoring-standards.md) to author one.

## Core

General skills for working well with AI agents in any domain.

### Authoring

- [Skill Authoring](core/skill-authoring/SKILL.md): creates or revises one portable skill with a description that triggers correctly, clear inputs, an actionable process, checks, and tested behavior.

### Decisions

- [Decision Interview](core/decision-interview/SKILL.md): resolves a plan's open decisions one question at a time, with options and a recommendation, and ends in an explicit confirmation.

### Continuity

- [Session Handoff](core/session-handoff/SKILL.md): condenses current work into a self-contained note so a fresh session, agent, or person can continue without the conversation.

### Setup

- [Repo Conventions Setup](core/repo-conventions-setup/SKILL.md): records where work items live, how documents are laid out, which checks to run, and what needs approval, in the repository's agent instructions file.

### Routing

- [Kit Router](core/kit-router/SKILL.md): recommends which skill, agent, or workflow fits a described situation, and which models at what effort level to run it with. It recommends only and never runs the work.

### Tuning

- [Reviewer Qualification](core/reviewer-qualification/SKILL.md): qualifies a reviewer for one domain by scoring it on a seeded change with known defects.

## Plan

Turning a goal into a plan, before a change exists.

### Framing

- [Problem Framing](plan/problem-framing/SKILL.md): turns a vague goal into a one-page frame of the problem, users, constraints, non-goals, observable success measures, assumptions, and open questions.
- [Assumption Mapping](plan/assumption-mapping/SKILL.md): lists the premises a plan rests on, rates impact and evidence separately, and names the cheapest test or decision for each risky one.

### Structure

- [Outcome Slicing](plan/outcome-slicing/SKILL.md): divides a goal into outcome-defined epics with observable first slices and checks that they cover the success measures.
- [Issue Breakdown](plan/issue-breakdown/SKILL.md): slices an epic into draft work items with done signals, dependencies, and relative size bands, as plain Markdown that fits any tracker.
- [Dependency Mapping](plan/dependency-mapping/SKILL.md): finds real dependencies, resolves or reports cycles, and returns a build order with the longest hard-dependency chain and external blockers.

### Prioritization

- [Backlog Prioritization](plan/backlog-prioritization/SKILL.md): ranks items into Now, Next, Later, and Not now tiers with reasoning, dependency overrides, and close calls, stopping short of the decision.
- [Scope Cutting](plan/scope-cutting/SKILL.md): proposes the smallest set that still delivers an outcome, with what each deferral costs and a revisit trigger, and flags protected-area cuts as owner decisions.

### Upkeep

- [Backlog Health Check](plan/backlog-health-check/SKILL.md): finds stale, duplicate, oversized, ill-formed, and misreported items and recommends an action for each without changing anything.
- [Roadmap Writing](plan/roadmap-writing/SKILL.md): writes a one-page now, next, and later roadmap of outcomes with stated confidence and no unsupported dates.
- [Status Reporting](plan/status-reporting/SKILL.md): reports progress from evidence rather than item states, separating done, in progress, blocked, and at risk against the baseline.

## Design

Creating and evaluating user experiences and interfaces.

### Research

- [Competitive Pattern Analysis](design/competitive-pattern-analysis/SKILL.md)
- [Interview Guide Writing](design/interview-guide-writing/SKILL.md)
- [Persona and Scenario Drafting](design/persona-and-scenario-drafting/SKILL.md)
- [Research Synthesis](design/research-synthesis/SKILL.md)
- [Usability Test Planning](design/usability-test-planning/SKILL.md)

### Definition

- [Information Architecture and Navigation](design/information-architecture-and-navigation/SKILL.md)
- [Journey Mapping](design/journey-mapping/SKILL.md)
- [Requirements Definition](design/requirements-definition/SKILL.md)
- [User Flow Mapping](design/user-flow-mapping/SKILL.md)

### Design and specification

- [Design Token and System Definition](design/design-token-and-system-definition/SKILL.md)
- [DESIGN.md Writing](design/design-md-writing/SKILL.md)
- [Interface State Specification](design/interface-state-specification/SKILL.md)
- [Responsive Layout Planning](design/responsive-layout-planning/SKILL.md)
- [UX Microcopy Writing](design/ux-microcopy-writing/SKILL.md)

### Review and quality

- [Accessibility Review](design/accessibility-review/SKILL.md)
- [Design-to-Implementation QA](design/design-to-implementation-qa/SKILL.md)
- [Heuristic Usability Evaluation](design/heuristic-usability-evaluation/SKILL.md)
- [Visual Design Critique](design/visual-design-critique/SKILL.md)

### Communication

- [Design Rationale Writing](design/design-rationale-writing/SKILL.md)
- [Portfolio Case Study Writing](design/portfolio-case-study-writing/SKILL.md)

## Frontend

Building interfaces on the web platform from design decisions.

### Intake

- [Design Spec Intake](frontend/design-spec-intake/SKILL.md): reads design material before implementation and reports what is decided, proposed, open, conflicting, or missing, and what can be built now.

### Interface structure

- [Component API Design](frontend/component-api-design/SKILL.md): specifies a reusable component's inputs, state ownership, events, composition, styling hooks, and accessibility contract.
- [Semantic HTML Structure](frontend/semantic-html-structure/SKILL.md): chooses and writes semantic markup, with landmarks, headings, native controls, forms, accessible names, and ARIA only where native elements fall short.

### Interface behavior

- [Interface State Implementation](frontend/interface-state-implementation/SKILL.md): implements loading, empty, partial, error, and other specified states so each is representable, announced, recoverable, and demonstrable.

### Layout

- [Responsive Implementation](frontend/responsive-implementation/SKILL.md): builds a responsive layout plan in CSS and verifies it across viewports, zoom, text settings, and input modes.

### Styling foundations

- [Design Token Implementation](frontend/design-token-implementation/SKILL.md): implements decided design tokens in code with one source, layered names, theming, a migration from raw values, and a drift check.

## Dev

The process around a software change, from approved specification to verified merge, plus system audits.

### Specification

- [Refine Issue](dev/refine-issue/SKILL.md): refines a work item (issue, ticket, task, or plain request) into an explicitly approved, implementation-ready specification, one decision at a time, without starting development. Works with any tracker, a file, or chat alone.

### Build

- [Feature Build](dev/feature-build/SKILL.md): implements one approved specification as the smallest coherent change and reports each acceptance criterion's status with evidence.
- [Bug Fix](dev/bug-fix/SKILL.md): finds a defect's smallest cause, repairs it without widening scope, and proves the repair with a check that failed before and passes after.
- [Refactor](dev/refactor/SKILL.md): improves structure in small steps against a safety net while behavior stays the same.
- [Migration](dev/migration/SKILL.md): moves a system between technical states in reversible steps with compatibility, data integrity, ordering, and rollback defined.

### Review

- [Independent Code Review](dev/independent-code-review/SKILL.md): reviews one revision against its specification and returns an evidenced PASS or FAIL report.
- [Adversarial Code Review](dev/adversarial-code-review/SKILL.md): tries to disprove a revision's correctness, in isolation from other reviews, and records the attacks attempted.
- [Review Reconciliation](dev/review-reconciliation/SKILL.md): merges independent reports into one finding list with a blocking set and chooses the re-review a repair needs.
- [Regression Review](dev/regression-review/SKILL.md): traces a change to the flows and contracts it could break and compares existing tests to those risks.
- [Simplification Review](dev/simplification-review/SKILL.md): finds what an implementation or design can drop, merge, or defer while still meeting its goal.

### Release

- [Merge Readiness Check](dev/merge-readiness-check/SKILL.md): verifies merge preconditions from evidence and returns ready or not ready with blockers.
- [Deployment Readiness](dev/deployment-readiness/SKILL.md): decides from evidence whether a change is safe to release to an environment, with the rollout, monitoring, and rollback it needs.

### Audit

- [Security Audit](dev/security-audit/SKILL.md): audits a defined scope for security weaknesses, traces each from an attacker-reachable entry point to an asset, and returns evidenced findings with a coverage statement.
- [Architecture Review](dev/architecture-review/SKILL.md): judges whether a system's or design's structure fits its stated goals and constraints, and returns evidenced findings with the cost of leaving each, the smallest fix, and the decisions that belong to others.
- [Dependency Audit](dev/dependency-audit/SKILL.md): reviews third-party dependencies for vulnerabilities, abandonment, license, and supply-chain risk, with risk-ranked findings.
- [Technical Debt Audit](dev/technical-debt-audit/SKILL.md): builds a debt register in which every item has evidence, a cost, and a place in a cleanup sequence.

### Documentation

- [Documentation Pass](dev/documentation-pass/SKILL.md): makes documentation usable by a named reader and checks that every reference in it is true.
