# Changelog

User-visible changes to depot: skills, agents, workflows, install steps, and the plugin. Each release matches `version` in [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json), which Claude Code reads to decide whether an installed plugin has an update. Bump it, and add an entry here, in any change that alters what a user installs or what a skill, agent, or workflow does. Documentation-only and test-only changes do not need a bump.

The version is `MAJOR.MINOR.PATCH`: MAJOR for a renamed or removed skill, agent, or workflow; MINOR for a new one or a change in behavior; PATCH for wording and fixes that do not change behavior. While the version is below 1.0.0, a rename or removal bumps MINOR instead.

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
