# Routing map

Source of truth for `kit-router`. Every name below must exist in the library, and every skill, agent, and workflow must appear here; `tests/validate-repository.sh` fails when either is not true. Update this file whenever a skill, agent, or workflow is added, renamed, or removed.

Kinds: **S** skill, **A** agent, **W** workflow.

## Core (any domain)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague plan with hidden branches | S `decision-interview` | W `goal-to-backlog` once decided |
| A long session to pause or pass on | S `session-handoff` | |
| A repeated task to make reusable | S `skill-authoring` | S `reviewer-qualification` if it judges others |
| A new repo that agents will work in | S `repo-conventions-setup` | |
| A model or reviewer to trust with a review role | S `reviewer-qualification` | |

## Plan

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A goal that is not yet precise | S `problem-framing` | S `assumption-mapping` |
| A frame to turn into a plan | A `delivery-planner` or W `goal-to-backlog` | S `outcome-slicing`, S `issue-breakdown` |
| An idea to test with the smallest slice of work | W `poc-scoping` | S `scope-cutting` |
| Epics or items needing an order | S `dependency-mapping` | S `backlog-prioritization` |
| A messy or stale backlog | W `backlog-triage` | S `backlog-health-check`, A `backlog-owner` |
| Too much scope for a limit | S `scope-cutting` | S `backlog-prioritization` |
| A need to show direction | S `roadmap-writing` | W `roadmap-planning` |
| A need to report real progress | S `status-reporting` | |

## Design

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague interface brief | S `requirements-definition` | W `discovery-to-definition` |
| Raw research notes | S `research-synthesis` | S `persona-and-scenario-drafting` |
| A need to learn from users | S `interview-guide-writing` | S `usability-test-planning` |
| A whole-experience question | S `journey-mapping` | S `user-flow-mapping` |
| Findability or navigation problems | S `information-architecture-and-navigation` | |
| A need to see how others solve it | S `competitive-pattern-analysis` | |
| A screen with unspecified states | S `interface-state-specification` | |
| A layout that must adapt | S `responsive-layout-planning` | |
| Visual foundations to define or record | A `design-system-designer` | S `design-token-and-system-definition`, S `design-md-writing` |
| Interface text to write or tighten | S `ux-microcopy-writing` | |
| A design to review | A `design-reviewer` | S `heuristic-usability-evaluation`, S `accessibility-review`, S `visual-design-critique` |
| A decision others must approve | S `design-rationale-writing` | |
| A build to check against its design | S `design-to-implementation-qa` | W `design-to-validation` |
| A project to write up for a portfolio | S `portfolio-case-study-writing` | |

## Frontend (build)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| Design material about to be built | S `design-spec-intake` | |
| Markup to write or fix | S `semantic-html-structure` | |
| A shared component to specify | S `component-api-design` | |
| Screens that only handle the ideal case | S `interface-state-implementation` | |
| A layout that breaks at some sizes | S `responsive-implementation` | |
| Raw values to turn into tokens | S `design-token-implementation` | |

## Dev (process around a change)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A request to make buildable | S `refine-issue` | W `refine-to-merge` |
| A change to review | S `independent-code-review` | S `adversarial-code-review` |
| Two or more review reports | S `review-reconciliation` | A `merge-gatekeeper` |
| A reviewed change about to merge | S `merge-readiness-check` | A `merge-gatekeeper` |
| One change, spec to merge | W `refine-to-merge` | |
| A security question about an area | S `security-audit` | |
| A structural question about a system | S `architecture-review` | |

## Known gaps

The library has no skills for writing code itself (bug fixes, feature builds, refactors, migrations). When the user needs one, report the gap and the closest artifact; do not invent one.
