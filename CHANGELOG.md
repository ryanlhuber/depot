# Changelog

User-visible changes to depot: skills, agents, workflows, install steps, and the plugin. Each release matches `version` in [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json), which Claude Code reads to decide whether an installed plugin has an update. Bump it, and add an entry here, in any change that alters what a user installs or what a skill, agent, or workflow does. Documentation-only and test-only changes do not need a bump.

The version is `MAJOR.MINOR.PATCH`: MAJOR for a renamed or removed skill, agent, or workflow; MINOR for a new one or a change in behavior; PATCH for wording and fixes that do not change behavior.

## 0.2.0

- Shorter skill descriptions (about 200 characters each) to cut the per-session context cost and sharpen triggering. Skills were not renamed.
- Added workflows `bug-fix`, `feature-delivery`, and `spec-to-ui`, and ten dev skills (`feature-build`, `bug-fix`, `refactor`, `migration`, `deployment-readiness`, `dependency-audit`, `technical-debt-audit`, `documentation-pass`, `regression-review`, `simplification-review`).
- Marked 11 skills manual-only with `disable-model-invocation: true`.
- Fixed contradictions found in two independent reviews: Tier A re-review versus the merge checklist, reviewer-qualification thresholds, workflow handoffs in `bug-fix`, `poc-scoping`, `feature-delivery`, and `spec-to-ui`.
- Added `kit-router`'s routing map entries for the new workflows.

## 0.1.0

- First plugin release: 59 skills in five buckets (core, plan, design, frontend, dev), five agents, seven workflows, a router, and the model routing table.
- Install through `npx skills`, `pnpm dlx`, or `bunx`, or as a Claude Code plugin.
