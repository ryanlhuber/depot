# Feature Delivery

## Goal

Take one approved feature through to a released, documented state: merged by the rules of [Fix or Build to Merge](fix-or-build-to-merge.md), documented for its readers, and checked for release safety, with the go or no-go decision left to a human. Success means the release decision was made from evidence, or the work stopped at a named blocker.

This workflow adds the stages around Fix or Build to Merge. It does not repeat refinement, build, review, or merge.

## Inputs

- Required: the work item, the repository and its conventions, a builder, the independent reviewers the review path needs (see Fix or Build to Merge), and the target environment.
- Optional: a regression concern list, the documentation readers who matter, rollout constraints, and recorded human approvals.
- Assumptions: no particular tracker, platform, or deployment tool is required. Deploying is performed by people or the project's own process, never by this workflow.

## Stages

1. **Specify, build, review, and merge**
   - Assignment: [Fix or Build to Merge](fix-or-build-to-merge.md), run as written, which assigns [Feature Build](../skills/dev/feature-build/SKILL.md) to the builder for a feature.
   - Requires: the work item and the project's conventions.
   - Produces: a human-merged change with its review reports, or the blocker. If Fix or Build to Merge stops, this workflow stops with it.
2. **Regression review**
   - Assignment: [Regression Review](../skills/dev/regression-review/SKILL.md) on the merged revision, when the change touches shared contracts, data, or flows. Skip with a recorded reason for an isolated change.
   - Requires: the merged revision and surrounding code.
   - Produces: regression risks with coverage and the checks still missing.
3. **Documentation**
   - Assignment: [Documentation Pass](../skills/dev/documentation-pass/SKILL.md) for the named reader of the feature.
   - Requires: the merged change and the reader.
   - Produces: updated documentation with verified commands and links, or a list of what could not be verified. Edits made here come after the merge, so they are a new change: deliver them through [Fix or Build to Merge](fix-or-build-to-merge.md), or through the project's own review rule for documentation-only changes, before stage 4. To avoid this, put the documentation in the specification at stage 1 as an acceptance criterion so it ships in the reviewed revision, and use this stage to verify it.
4. **Release readiness**
   - Assignment: [Deployment Readiness](../skills/dev/deployment-readiness/SKILL.md) for the target environment.
   - Requires: the merged revision, test and review evidence, and the rollout constraints.
   - Produces: a ready or not-ready verdict with the rollout, monitoring, and rollback it needs. It does not deploy.
5. **Release decision** (performed by a human)
   - Assignment: the requester decides whether to release and when.
   - Requires: the verdict and any high-risk approval.
   - Produces: a recorded decision. Releasing is never automated here.

## Validation

- After stage 1, confirm the merged revision is the revision the reviews examined.
- After stage 3, confirm every command and link in the changed documentation was checked or is listed as unchecked.
- After stage 4, confirm each readiness item has evidence or is marked Cannot verify.

## Branching and iteration

- If stage 2 finds an uncovered risk of high severity, return it to the builder as a new work item through stage 1 before stage 4. Any change made after stage 1 merged (a regression fix, a documentation edit) is a new revision, so stage 4 assesses the final merged revision, not the first.
- If stage 4 is not ready, return the blocking items to the stage that owns them. Do not re-run earlier stages that were not affected.
- Stage 3 may run in parallel with stage 2 when it does not depend on its findings.

## Failure behavior

- Recoverable: documentation cannot be verified yet, or a readiness item lacks evidence. Gather it and continue.
- Stop or escalate when: Fix or Build to Merge stops, a required approval is missing, or a rollback path cannot be established for a high-risk change. Never mark a readiness item Met without evidence.

## Final output

Return the outputs of Fix or Build to Merge, the regression review, the documentation changes, the readiness verdict with its conditions, and the recorded release decision. List accepted risks and decisions escalated.

## Completion criteria

- The change merged under Fix or Build to Merge and nothing was released by this workflow.
- Every readiness item has evidence or is marked Cannot verify.
- A human recorded the release decision, or the workflow stopped with the blocker and decision named.
