# Changelog

User-visible changes to depot: skills, agents, workflows, install steps, and the plugin. Each release matches `version` in [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json), which Claude Code reads to decide whether an installed plugin has an update. Bump it, and add an entry here, in any change that alters what a user installs or what a skill, agent, or workflow does. Documentation-only and test-only changes do not need a bump.

The version is `MAJOR.MINOR.PATCH`: MAJOR for a renamed or removed skill, agent, or workflow; MINOR for a new one or a change in behavior; PATCH for wording and fixes that do not change behavior. While the version is below 1.0.0, a rename or removal bumps MINOR instead.

## 0.13.0

- **Changed:** `issue-to-merge` stage 1 now has the builder write the done-criteria it will build and review against, and ask the requester once, before the build, when the report states no acceptance criteria and a criterion would change what the fix does beyond the report's stated behavior (a rule generalized from one example, how invalid or edge inputs behave, behavior that must stay). The question goes in the same message as any real open question and carries a recommendation; "proceed" is a valid answer. Routine criteria (a test that fails before and passes after, nothing else changed, the same pattern checked elsewhere) are recorded without asking, and a report whose own words, documentation, or tests already settle every criterion needs no question. If the requester cannot be reached, or says to proceed, the criteria are recorded as the builder's own, marked unconfirmed, and the reviewer is told. The reviewer is told whether the criteria are confirmed. This adds one possible question to a stage 1 that 0.12.0 had made quieter; the narrowing to criteria that change the fix is meant to keep it rare. Ryan may veto this extra question.
- Why: a second evaluation round ([results in the Kits project, `depot-eval/round2-results-2026-10-29.md`]) ran one hard defect four times per arm, then re-reviewed the four depot diffs with and without the requirements. The depot builder never asked the requester for requirements, the requirement it missed was one only the requester knew, and a reviewer shown that requirement failed all four diffs that the same reviewer had passed without it. One task, same model family as the author, author-written requester answers, eight single reviews. Whether this change improves outcomes is not yet measured; the cases below show only that the wording is followed.
- Behavioral cases: added "Done-criteria asked once", "Routine criteria are not a question", "Done-criteria already stated", and "Unconfirmed criteria reach the reviewer". See [the results](tests/results/2026-10-29-done-criteria-cases.md).

## 0.12.0

- **Changed:** `issue-to-merge` stage 1 no longer stops to ask for approval when a defect report already states the expected behavior and Refine Issue is skipped. The builder records the expected behavior, acceptance criteria, risk with a one-line reason (judged against the high-risk areas in Refine Issue), and the review path before the build, tells the requester, and goes on. It stops and asks only for a real open question: two reasonable behaviors, or a fix that would require changing an existing test or documented behavior. Questions the report, tests, documentation, or conventions already answer are not stops. Risk the builder cannot judge is still not recorded, so the standard path still applies; the standard path and the independence rules are unchanged. The builder re-checks its recorded risk against the actual diff before review. The independent review now also says whether the recorded risk looks too low; a review that finds the change touches a high-risk area (or a requester who raises the risk to high after a light-path review) makes the risk high, the light-path review does not carry over, the standard-path reviews run on the current revision, and high-risk human approval applies. The requester may lower a risk the builder recorded; the builder never records below a stated risk. Fixes that make code match behavior its documentation already states are not, by themselves, a breaking public-interface change; this is a deliberate loosening, and a long-standing divergence that callers rely on is a known gap the reviewer must catch.
- Why: a pilot run of the workflow on five real defects found that, with identical instructions, builders stopped at stage 1 in some runs, went straight on in others, and in one built first and asked afterward. Skipping Refine Issue left no rule for who records the risk that sets the path. See `depot-eval` in the Kits project for the pilot (single runs, same model family as the author, author-chosen tasks).
- Results: [the case runs](tests/results/2026-10-27-stage1-cases.md) (seven cases on the final text matched; one case failed in the first round and led to a clarification that a fix matching documented behavior is not by itself a breaking change) and [the review](tests/results/2026-10-27-stage1-review.md) (FAIL with six findings, all fixed). Single runs, same model family as the author, author-written fixtures.
- Behavioral cases: added "Clear defect, Refine Issue skipped, no risk given", "Clear defect that touches a high-risk area", "Real open question on a defect", "Question the repository already answers", and "Review finds the recorded risk too low". Added "Stated risk is kept". Changed "Risk is not lowered" so it no longer contradicts the new rule: it now uses a builder that cannot say whether the fix touches an authorization check.

## 0.11.0

- **Changed:** on the light review path of `issue-to-merge`, a reviewer from a different model family than the builder is now preferred, not required. When you can reach only one family, the review goes ahead as a **same-family review**: a fresh session with none of the builder's context, recorded before the build, and named as a limitation in the review report, the merge checklist, and the final output. It does not stop the work. The standard path (high-risk or unrecorded-risk changes) still requires three distinct families and still stops when one is missing. A reviewer that is the builder or saw the builder's context or reasoning is still a stop on both paths; on the standard path, so is a reviewer that saw the other review's output before its initial report. A same-family review is recorded with its reason: no other family reachable, or the requester's explicit choice. Choosing the builder's family when another is reachable is allowed but discouraged: the workflow suggests the other family first and says why it is preferred, and never records "no other family reachable" when one was. A repair that moves a light-path item to the standard path stops and asks for the missing families; the same-family review does not carry over.
- `check-merge-readiness` (and its merge checklist), `merge-gatekeeper`, `route-work`, and the model routing table follow the new rule. A same-family review can reach a ready verdict, with the limitation shown to the human; it is never reported as cross-family, and two versions of one family are still never reported as distinct families.
- Added a quick start to the top of `README.md` and the same-family note to `docs/getting-started.md`. Added a "What is and is not shown" summary to `tests/results/README.md` and an unrun [evaluation plan](tests/evaluation-plan.md) for measuring depot against a no-depot baseline.
- Behavioral cases: changed "Independence lapse escalated" to the standard path and replaced "Light path is not the same family" with "Light path with a same-family reviewer". Added "Same-family light-path review carried", "Light path reviewer saw the builder's context", "Same-family review does not carry to the standard path", and "Router single family on the light path". All eight new or changed cases (the six above plus "Same-family review chosen while another family is reachable" and "Same-family replacement after a reviewer drops out") were run once on 2026-10-27 by fresh Claude Sonnet subagents (the same vendor family as the author, read-only, author-written fixtures, author-judged), and all eight matched the expected outcomes at the time. After the owner decided that choosing the builder's family while another is reachable is allowed but discouraged, one case's expectation changed and the seven cases that depend on the workflow and gatekeeper wording were re-run on the final text; all seven matched. See [the results](tests/results/2026-10-27-same-family-cases.md). A same-family review (Claude Opus 5.5) of the change passed with six Minor findings, all fixed, and a diff-only re-review of the fixes passed with two Minor findings about the written record, also fixed; see [the review](tests/results/2026-10-27-pr29-review.md). The earlier result rows for the two replaced cases describe the old behavior and are left as they were.

## 0.10.0

- Renamed two skills and one workflow so each name fits the convention for its artifact type. No method, inputs, or outputs changed, and nothing moved between buckets. `run-heuristic-evaluation` dropped the filler verb "run" and now sits with the other `review-` skills. `decide-plan` read like "pick a plan" but interviews you through a plan's open decisions. `fix-or-build-to-merge` used verbs and "or" where a workflow name should be two nouns, and "issue" is the word the planning skills already use for a work item.
- **Breaking:** invoke the renamed skills by their new names (for example `/depot-ux:review-usability`), including in bucket plugins, installer selections, and sync lists such as `skills-depot.txt` in a project that syncs from depot. Replace old names with new ones using the table below. `depot-core`, `depot-ux`, and the full `depot` plugin carry the renamed skills; the workflow is referenced by name from `feature-to-release`, the routing map, and the docs.
- Added a Naming section to `README.md` that records the convention for each artifact type: skills are `verb-object`, agents are `domain-role`, and workflows are `input-to-output`. `AGENTS.md` points to it. The five agents and the other seven workflows already fit and keep their names.
- Titles, the skills and workflow indexes, the README tables, the routing map, the `design-reviewer` agent, linked workflows, the example, the docs, the model-routing note, and the behavioral cases use the new names. Earlier changelog entries and `tests/results/` keep the names they were run with.

| Type | Old name | New name |
| --- | --- | --- |
| skill (ux) | `run-heuristic-evaluation` | `review-usability` |
| skill (core) | `decide-plan` | `settle-decisions` |
| workflow | `fix-or-build-to-merge` | `issue-to-merge` |

## 0.9.1

- Fixed a broken link in four skills (`review-accessibility`, `run-heuristic-evaluation`, `plan-usability-test`, `review-visual-design`). Each linked to a document in the repository's `docs/` folder, which is missing when a skill is installed alone, for example from a bucket plugin or the skills installer. Each now states the finding-field rule in one line. No skill's method, inputs, or outputs changed.

## 0.9.0

- Renamed 55 of the 57 skills so each name is a verb phrase that says what the skill does, with the same verb family used for the same kind of work: `write-`, `draft-`, `define-`, `specify-`, and `implement-` for producing things; `review-`, `check-`, and `audit-` for judging them; `map-` and `sequence-` for mapping and ordering. `refine-issue` and `refactor` keep their names. No skill's method, inputs, or outputs changed, and no skill moved between buckets.
- **Breaking:** every renamed skill is invoked by its new name (for example `/depot-dev:fix-bug` instead of `/depot-dev:bug-fix`), including in bucket plugins, installer selections, and sync lists such as `skills-depot.txt` in a project that syncs from depot. The full `depot` plugin's `/depot:<skill>` names change in the same way. Replace old names with new ones using the table below.
- Titles, the skills index, the README tables, the routing map, workflow and example links, agent skill lists, the docs, and the behavioral cases all use the new names. Earlier changelog entries, `tests/results/`, and the triggering tables keep the names they were run with.
- Also renamed one agent and four workflows. Workflows keep the "X to Y" form, and the agent keeps a role noun. The other four agents and four workflows keep their names. Links, indexes, the routing map, and the plugin manifests use the new names.

| Bucket | Old name | New name |
| --- | --- | --- |
| core | `skill-authoring` | `write-skill` |
| core | `decision-interview` | `decide-plan` |
| core | `session-handoff` | `hand-off-session` |
| core | `kit-router` | `route-work` |
| core | `reviewer-qualification` | `qualify-reviewer` |
| plan | `problem-framing` | `frame-problem` |
| plan | `assumption-mapping` | `map-assumptions` |
| plan | `outcome-slicing` | `define-epics` |
| plan | `issue-breakdown` | `draft-issues` |
| plan | `dependency-mapping` | `sequence-work` |
| plan | `backlog-prioritization` | `prioritize-backlog` |
| plan | `simplification-review` | `simplify-scope` |
| plan | `backlog-health-check` | `audit-backlog` |
| plan | `roadmap-writing` | `write-roadmap` |
| plan | `status-reporting` | `report-status` |
| ux | `competitive-pattern-analysis` | `compare-patterns` |
| ux | `interview-guide-writing` | `write-user-interview-guide` |
| ux | `persona-and-scenario-drafting` | `draft-personas` |
| ux | `research-synthesis` | `synthesize-research` |
| ux | `usability-test-planning` | `plan-usability-test` |
| ux | `information-architecture-and-navigation` | `design-navigation` |
| ux | `journey-mapping` | `map-user-journey` |
| ux | `requirements-definition` | `define-requirements` |
| ux | `user-flow-mapping` | `map-user-flow` |
| ux | `accessibility-review` | `review-accessibility` |
| ux | `heuristic-usability-evaluation` | `run-heuristic-evaluation` |
| ux | `ux-microcopy-writing` | `write-microcopy` |
| ui | `design-token-and-system-definition` | `define-design-system` |
| ui | `design-md-writing` | `write-design-md` |
| ui | `interface-state-specification` | `specify-interface-states` |
| ui | `responsive-layout-planning` | `specify-responsive-layout` |
| ui | `visual-design-critique` | `review-visual-design` |
| ui | `design-to-implementation-qa` | `review-ui-fidelity` |
| ui | `design-rationale-writing` | `write-design-rationale` |
| frontend | `design-spec-intake` | `check-design-handoff` |
| frontend | `component-api-design` | `design-component-api` |
| frontend | `semantic-html-structure` | `write-semantic-html` |
| frontend | `interface-state-implementation` | `implement-interface-states` |
| frontend | `responsive-implementation` | `implement-responsive-layout` |
| frontend | `design-token-implementation` | `implement-design-tokens` |
| dev | `repo-conventions-setup` | `record-repo-conventions` |
| dev | `feature-build` | `build-feature` |
| dev | `bug-fix` | `fix-bug` |
| dev | `migration` | `migrate-system` |
| dev | `independent-code-review` | `review-code-independently` |
| dev | `adversarial-code-review` | `review-code-adversarially` |
| dev | `regression-review` | `review-regressions` |
| dev | `review-reconciliation` | `reconcile-reviews` |
| dev | `merge-readiness-check` | `check-merge-readiness` |
| dev | `deployment-readiness` | `check-deployment-readiness` |
| dev | `documentation-pass` | `fix-docs` |
| dev | `architecture-review` | `review-architecture` |
| dev | `security-audit` | `audit-security` |
| dev | `dependency-audit` | `audit-dependencies` |
| dev | `technical-debt-audit` | `audit-tech-debt` |

| Type | Old name | New name |
| --- | --- | --- |
| agent | `design-system-designer` | `design-system-owner` |
| workflow | `discovery-to-definition` | `brief-to-requirements` |
| workflow | `feature-delivery` | `feature-to-release` |
| workflow | `poc-scoping` | `idea-to-poc` |
| workflow | `roadmap-planning` | `backlog-to-roadmap` |

## 0.8.0

- Moved three skills to the bucket that matches their work. No skill was renamed and no skill's content changed.
  - `repo-conventions-setup`: `core` → `dev`. Most of what it records (runtime, install, build and test commands, branch rules) serves the delivery workflows.
  - `simplification-review`: `core` → `plan`. Its users are the planning workflows and the Backlog Owner agent.
  - `refine-issue`: `dev` → `plan`. Planning now runs through to an approved specification for each item; `dev` starts from that specification.
- **Removed** `portfolio-case-study-writing` from depot. It moves to [kit-work](https://github.com/ryanlhuber/kit-work), next to the job-search skills it works with, because a portfolio case study is career writing rather than project work. Install it from kit-work.
- **Breaking for bucket-plugin installs:** invocations change to `/depot-dev:repo-conventions-setup`, `/depot-plan:simplification-review`, and `/depot-plan:refine-issue`. Fix or Build to Merge starts with `refine-issue`, so the one-developer quick start now installs `depot-plan` as well as `depot-core` and `depot-dev`. The full `depot` plugin and `/depot:<skill>` names are unchanged, apart from the removed skill.
- `kit-router`'s routing map moves the three rows with their skills and drops the case-study row.

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
