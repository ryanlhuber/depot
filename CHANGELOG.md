# Changelog

User-visible changes to depot: skills, agents, workflows, install steps, and the plugin. Each release matches `version` in [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json), which Claude Code reads to decide whether an installed plugin has an update. Bump it, and add an entry here, in any change that alters what a user installs or what a skill, agent, or workflow does. Documentation-only and test-only changes do not need a bump.

The version is `MAJOR.MINOR.PATCH`: MAJOR for a renamed or removed skill, agent, or workflow; MINOR for a new one or a change in behavior; PATCH for wording and fixes that do not change behavior. While the version is below 1.0.0, a rename or removal bumps MINOR instead.

## 0.7.0

- Split the `design` bucket into two buckets with clearer names. `ux` holds the 12 skills that inform the interface: research, requirements, journeys, flows, information architecture, heuristic and accessibility evaluation, and microcopy. `ui` holds the 8 skills that design and specify the interface up to front-end handoff: design tokens and system rules, DESIGN.md, state and responsive specifications, visual critique, design-to-implementation QA, design rationale, and portfolio case studies. No skill was renamed and no skill's content changed.
- **Breaking for bucket-plugin installs:** the `depot-design` plugin is replaced by `depot-ux` and `depot-ui`. If you installed `depot-design`, uninstall it and install either or both new plugins; invocations change from `/depot-design:<skill>` to `/depot-ux:<skill>` or `/depot-ui:<skill>`. The full `depot` plugin and `/depot:<skill>` names are unchanged.
- `kit-router`'s routing map now has UX and UI sections, and gains a row that routes visual hierarchy, spacing, and type critique straight to `visual-design-critique`.

## 0.6.2

- Fixed the one-developer quick start in `getting-started` and the README install example: `repo-conventions-setup` and `kit-router` are in `depot-core`, so `depot-core` is installed with `depot-dev`. The validator now checks that every skill the quick start names comes from a plugin it installs.

## 0.6.1

- `fix-or-build-to-merge` now says what to do when the recorded test command, branch, or runtime is unavailable (state the substitute and get it confirmed), and that a builder-run regression review is the builder's own check. The README and workflow index describe the light review path, `getting-started` has a one-developer short version, and `roadmap-planning` says where unverified items are listed. Found in a real run on a scratch repository.

## 0.6.0

- `fix-or-build-to-merge` now has two review paths. The standard path is unchanged: both reviews, three distinct model families. It applies to high-risk changes, changes with no recorded risk, and whenever the requester asks. The light path applies to every other change: the independent review only, with the builder and one reviewer from two distinct model families, and the adversarial review skipped and recorded as skipped. The path is set from the risk recommended at stage 1 and recorded before the build; the workflow never lowers the risk, and a repair that reaches a high-risk area moves the item to the standard path. `merge-readiness-check`, its checklist, `review-reconciliation`, and `feature-delivery` follow the path. Independence is still never weakened silently.

## 0.5.2

- `delivery-planner` and `goal-to-backlog` now agree: when the requester is unavailable, planning continues with the goal marked unconfirmed and assumptions labeled, and stops only when no goal can be stated. The architecture document names `kit-router` as the one skill allowed to recommend other artifacts.

## 0.5.1

- `roadmap-planning` stops only for cleanup decisions that later stages depend on, as `backlog-triage` did before the merge. `goal-to-backlog` now lists work that depends on an unsettled assumption as not yet sliced instead of drafting provisional items, matching `delivery-planner`.

## 0.5.0

- `repo-conventions-setup` now also records the target branch, the supported runtime, and the install and build commands, so `fix-or-build-to-merge` can read them at its environment step instead of asking each run. The target branch is never assumed to be the default branch.

## 0.4.0

- Added a plugin per bucket to the Claude Code marketplace: `depot-core`, `depot-plan`, `depot-design`, `depot-frontend`, and `depot-dev`, plus `depot-agents` for the five agents. Install the buckets you use instead of `depot` to keep fewer skills in every session; the full plugin is unchanged and still adds about 4,400 tokens. `depot-plan` depends on `depot-core`. The validator checks the entries.

## 0.3.0

Fewer artifacts, same coverage: 59 skills, 5 agents, and 10 workflows became 58 skills, 5 agents, and 8 workflows. Names below were removed or renamed, so update any saved references.

- Merged skill `scope-cutting` into `simplification-review`, which now covers shrinking a backlog or plan as well as trimming an overbuilt design or implementation, with keep, remove, and defer lists, costs, revisit conditions, and owner flags for protected areas. It moved from the dev bucket to core, and its template is now `simplification-proposal.md`.
- Merged workflow `refine-to-merge` and workflow `bug-fix` into `fix-or-build-to-merge`: one path from work item to human merge for a feature or a defect. Defects keep their expected-behavior step, regression review, and before-and-after proof. The `bug-fix` skill is unchanged. `feature-delivery` now runs the merged workflow.
- Merged workflow `backlog-triage` into `roadmap-planning`: it now cleans and re-ranks a backlog before writing the roadmap, and each earlier step is skipped when its inputs are supplied.
- `review-reconciliation` now owns revision binding and re-review tiers; `merge-readiness-check` verifies the record instead of restating the rules.
- The triggering table has 116 rows (58 skills); row numbers changed.

## 0.2.0

- Shorter skill descriptions (about 200 characters each) to cut the per-session context cost and sharpen triggering. Skills were not renamed.
- Added workflows `bug-fix`, `feature-delivery`, and `spec-to-ui`, and ten dev skills (`feature-build`, `bug-fix`, `refactor`, `migration`, `deployment-readiness`, `dependency-audit`, `technical-debt-audit`, `documentation-pass`, `regression-review`, `simplification-review`).
- Marked 11 skills manual-only with `disable-model-invocation: true`.
- Fixed contradictions found in two independent reviews: Tier A re-review versus the merge checklist, reviewer-qualification thresholds, workflow handoffs in `bug-fix`, `poc-scoping`, `feature-delivery`, and `spec-to-ui`.
- Added `kit-router`'s routing map entries for the new workflows.

## 0.1.0

- First plugin release: 59 skills in five buckets (core, plan, design, frontend, dev), five agents, seven workflows, a router, and the model routing table.
- Install through `npx skills`, `pnpm dlx`, or `bunx`, or as a Claude Code plugin.
