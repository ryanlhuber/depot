# Routing map

Source of truth for `route-work`. Every name below must exist in the library, and every skill, agent, and workflow must appear here; `tests/validate-repository.sh` fails when either is not true. Update this file whenever a skill, agent, or workflow is added, renamed, or removed.

Kinds: **S** skill, **A** agent, **W** workflow.

## Core (any domain)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague plan with hidden branches | S `settle-decisions` | W `goal-to-backlog` once decided |
| A long session to pause or pass on | S `hand-off-session` | |
| A repeated task to make reusable | S `write-skill` | S `qualify-reviewer` if it judges others |
| A model or reviewer to trust with a review role | S `qualify-reviewer` | |

## Plan

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A goal that is not yet precise | S `frame-problem` | S `map-assumptions` |
| A frame to turn into a plan | A `delivery-planner` or W `goal-to-backlog` | S `define-epics`, S `draft-issues` |
| An idea to test with the smallest slice of work | W `idea-to-poc` | S `simplify-scope` |
| Epics or items needing an order | S `sequence-work` | S `prioritize-backlog` |
| A messy or stale backlog | W `backlog-to-roadmap` | S `audit-backlog`, A `backlog-owner` |
| A need to show direction | S `write-roadmap` | W `backlog-to-roadmap` |
| A need to report real progress | S `report-status` | |
| Too much scope for a limit, or something that looks overbuilt | S `simplify-scope` | S `prioritize-backlog` |
| A request to make buildable | S `refine-issue` | W `issue-to-merge` |

## UX (informs the interface)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A vague interface brief | S `define-requirements` | W `brief-to-requirements` |
| Raw research notes | S `synthesize-research` | S `draft-personas` |
| A need to learn from users | S `write-user-interview-guide` | S `plan-usability-test` |
| A whole-experience question | S `map-user-journey` | S `map-user-flow` |
| Findability or navigation problems | S `design-navigation` | |
| A need to see how others solve it | S `compare-patterns` | |
| Interface text to write or tighten | S `write-microcopy` | |
| A design to review | A `design-reviewer` | S `review-usability`, S `review-accessibility`, S `review-visual-design` |

## UI (interface design to handoff)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A screen with unspecified states | S `specify-interface-states` | |
| A layout that must adapt | S `specify-responsive-layout` | |
| Visual hierarchy, spacing, or type to critique | S `review-visual-design` | A `design-reviewer` |
| Visual foundations to define or record | A `design-system-owner` | S `define-design-system`, S `write-design-md` |
| A decision others must approve | S `write-design-rationale` | |
| A build to check against its design | S `review-ui-fidelity` | W `design-to-validation` |

## Frontend (build)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| Design material about to be built | S `check-design-handoff` | |
| Markup to write or fix | S `write-semantic-html` | |
| A shared component to specify | S `design-component-api` | |
| Screens that only handle the ideal case | S `implement-interface-states` | |
| A layout that breaks at some sizes | S `implement-responsive-layout` | |
| Raw values to turn into tokens | S `implement-design-tokens` | |
| An approved interface spec to build | W `spec-to-ui` | S `check-design-handoff` |

## Dev (process around a change)

| If the user has... | Start with | Then / alternates |
| --- | --- | --- |
| A new repo that agents will work in | S `record-repo-conventions` | |
| An approved spec to implement | S `build-feature` | S `review-regressions` |
| A feature to take to release | W `feature-to-release` | W `issue-to-merge` |
| A reproducible defect | S `fix-bug` | S `review-regressions` |
| A reported defect to fix and merge | W `issue-to-merge` | S `fix-bug` |
| Working code that is hard to change | S `refactor` | S `audit-tech-debt` |
| A system that must move to a new state | S `migrate-system` | S `check-deployment-readiness` |
| A change to review | S `review-code-independently` | S `review-code-adversarially` |
| Two or more review reports | S `reconcile-reviews` | A `merge-gatekeeper` |
| A reviewed change about to merge | S `check-merge-readiness` | A `merge-gatekeeper` |
| One change, spec to merge | W `issue-to-merge` | |
| A change that might have broken something | S `review-regressions` | S `review-code-independently` |
| A change ready to go live | S `check-deployment-readiness` | S `check-merge-readiness` |
| A security question about an area | S `audit-security` | S `audit-dependencies` |
| Dependencies to check | S `audit-dependencies` | S `audit-security` |
| Slowing delivery with unclear causes | S `audit-tech-debt` | S `review-architecture` |
| Docs that are missing, stale, or confusing | S `fix-docs` | |
| A structural question about a system | S `review-architecture` | |

## Known gaps

Not covered today. This inventory is not a plan to add them, and the router must not invent an artifact for them. When one is needed, report the gap and the closest artifact.

- Designing and writing automated tests as a focused capability (`build-feature` and `fix-bug` add tests for their own change only).
- Performance measurement and optimization.
- Executing a deployment or rollback (`check-deployment-readiness` decides readiness and defines rollback; it does not release).
- Creating visual interfaces directly (the design and frontend skills specify, review, and implement from a design; they do not originate visual design).
