# Routing map

Source of truth for `kit-router`. Every name below must exist in the library, and every skill, agent, and workflow must appear here; `tests/validate-repository.sh` fails when either is not true. Update this file whenever a skill, agent, or workflow is added, renamed, or removed.

Kinds: **S** skill, **A** agent, **W** workflow.

## Core (any domain)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague plan with hidden branches | S `decision-interview` | W `goal-to-backlog` once decided |
| A long session to pause or pass on | S `session-handoff` | |
| A repeated task to make reusable | S `skill-authoring` | S `reviewer-qualification` if it judges others |
| A model or reviewer to trust with a review role | S `reviewer-qualification` | |

## Plan

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A goal that is not yet precise | S `problem-framing` | S `assumption-mapping` |
| A frame to turn into a plan | A `delivery-planner` or W `goal-to-backlog` | S `outcome-slicing`, S `issue-breakdown` |
| An idea to test with the smallest slice of work | W `poc-scoping` | S `simplification-review` |
| Epics or items needing an order | S `dependency-mapping` | S `backlog-prioritization` |
| A messy or stale backlog | W `roadmap-planning` | S `backlog-health-check`, A `backlog-owner` |
| A need to show direction | S `roadmap-writing` | W `roadmap-planning` |
| A need to report real progress | S `status-reporting` | |
| Too much scope for a limit, or something that looks overbuilt | S `simplification-review` | S `backlog-prioritization` |
| A request to make buildable | S `refine-issue` | W `fix-or-build-to-merge` |

## UX (informs the interface)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague interface brief | S `requirements-definition` | W `discovery-to-definition` |
| Raw research notes | S `research-synthesis` | S `persona-and-scenario-drafting` |
| A need to learn from users | S `interview-guide-writing` | S `usability-test-planning` |
| A whole-experience question | S `journey-mapping` | S `user-flow-mapping` |
| Findability or navigation problems | S `information-architecture-and-navigation` | |
| A need to see how others solve it | S `competitive-pattern-analysis` | |
| Interface text to write or tighten | S `ux-microcopy-writing` | |
| A design to review | A `design-reviewer` | S `heuristic-usability-evaluation`, S `accessibility-review`, S `visual-design-critique` |

## UI (interface design to handoff)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A screen with unspecified states | S `interface-state-specification` | |
| A layout that must adapt | S `responsive-layout-planning` | |
| Visual hierarchy, spacing, or type to critique | S `visual-design-critique` | A `design-reviewer` |
| Visual foundations to define or record | A `design-system-designer` | S `design-token-and-system-definition`, S `design-md-writing` |
| A decision others must approve | S `design-rationale-writing` | |
| A build to check against its design | S `design-to-implementation-qa` | W `design-to-validation` |

## Frontend (build)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| Design material about to be built | S `design-spec-intake` | |
| Markup to write or fix | S `semantic-html-structure` | |
| A shared component to specify | S `component-api-design` | |
| Screens that only handle the ideal case | S `interface-state-implementation` | |
| A layout that breaks at some sizes | S `responsive-implementation` | |
| Raw values to turn into tokens | S `design-token-implementation` | |
| An approved interface spec to build | W `spec-to-ui` | S `design-spec-intake` |

## Dev (process around a change)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A new repo that agents will work in | S `repo-conventions-setup` | |
| An approved spec to implement | S `feature-build` | S `regression-review` |
| A feature to take to release | W `feature-delivery` | W `fix-or-build-to-merge` |
| A reproducible defect | S `bug-fix` | S `regression-review` |
| A reported defect to fix and merge | W `fix-or-build-to-merge` | S `bug-fix` |
| Working code that is hard to change | S `refactor` | S `technical-debt-audit` |
| A system that must move to a new state | S `migration` | S `deployment-readiness` |
| A change to review | S `independent-code-review` | S `adversarial-code-review` |
| Two or more review reports | S `review-reconciliation` | A `merge-gatekeeper` |
| A reviewed change about to merge | S `merge-readiness-check` | A `merge-gatekeeper` |
| One change, spec to merge | W `fix-or-build-to-merge` | |
| A change that might have broken something | S `regression-review` | S `independent-code-review` |
| A change ready to go live | S `deployment-readiness` | S `merge-readiness-check` |
| A security question about an area | S `security-audit` | S `dependency-audit` |
| Dependencies to check | S `dependency-audit` | S `security-audit` |
| Slowing delivery with unclear causes | S `technical-debt-audit` | S `architecture-review` |
| Docs that are missing, stale, or confusing | S `documentation-pass` | |
| A structural question about a system | S `architecture-review` | |

## Known gaps

Not covered today. This inventory is not a plan to add them, and the router must not invent an artifact for them. When one is needed, report the gap and the closest artifact.

- Designing and writing automated tests as a focused capability (`feature-build` and `bug-fix` add tests for their own change only).
- Performance measurement and optimization.
- Executing a deployment or rollback (`deployment-readiness` decides readiness and defines rollback; it does not release).
- Creating visual interfaces directly (the design and frontend skills specify, review, and implement from a design; they do not originate visual design).
