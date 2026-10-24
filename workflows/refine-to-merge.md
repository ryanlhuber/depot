# Refine to Merge

## Goal

Take one work item from an approved specification to a verified, human-merged change, with every approval tied to a named revision and two independent reviews that were not allowed to influence each other. Success means the change merged only after every merge precondition was met by evidence, or the work stopped at a named blocker with the decision still needed.

## Inputs

- Required: the work item (an issue, ticket, task, file, or plain request), the repository and project conventions, and a builder plus two reviewers who can be kept independent.
- Optional: project configuration naming the target branch, a repair-round limit, a review budget, and recorded human approvals.
- Assumptions: no particular tracker, hosting platform, or tool is required; where the work item or the change lives is the project's choice. One active work item at a time. Independence means a different party for the builder, the first reviewer, and the second reviewer. When the parties are models, they must come from three distinct model families; versions, variants, or reasoning levels of one family, or one family reached through different tools, do not count. If independence cannot be met, the workflow stops and asks; it never weakens the rule silently.

## Stages

1. **Refine**
   - Assignment: [Refine Issue](../skills/dev/refine-issue/SKILL.md).
   - Requires: the work item and the project's conventions.
   - Produces: a specification the requester explicitly approved, the Ready check results, and recommended metadata including risk.
2. **Confirm environment** (performed by the requester or builder, outside this workflow)
   - Assignment: the requester or builder confirms the repository, the target branch read from project configuration (never assumed), the supported runtime, the install, build, and test commands, that the base branch is current, that access is least-privilege, and that no production secrets are in any agent's context.
   - Requires: the approved specification.
   - Produces: a confirmed environment note. The workflow does not proceed on a guess.
3. **Build** (performed by the builder, outside this workflow)
   - Assignment: the builder implements the specification on a feature branch and runs the tests. Reviewers never edit code.
   - Requires: the approved specification and the environment note.
   - Produces: a change, test results, and the revision identifier under review.
4. **Independent review**
   - Assignment: [Independent Code Review](../skills/dev/independent-code-review/SKILL.md) by a reviewer independent of the builder.
   - Requires: the specification, diff and context, test results, and the revision.
   - Produces: a saved review report for that revision. Not posted to the change discussion.
5. **Adversarial review**
   - Assignment: [Adversarial Code Review](../skills/dev/adversarial-code-review/SKILL.md) by a third independent reviewer. It starts without the first review's findings or the change discussion.
   - Requires: the same inputs as stage 4 and the same revision.
   - Produces: a saved review report that states whether any other review output was seen.
6. **Reconcile and decide**
   - Assignment: [Merge Gatekeeper](../agents/merge-gatekeeper.md), applying `review-reconciliation` and, when nothing blocks, `merge-readiness-check`.
   - Requires: both reports, the specification, test evidence, the risk level, and the target branch.
   - Produces: consolidated findings and the blocking set, or the completed merge checklist and a ready or not-ready verdict. After both reports exist, both are attached to the change record together.
7. **Repair** (only when the blocking set is not empty)
   - Assignment: the builder fixes the blocking findings; the gatekeeper records the re-review tier through `review-reconciliation`.
   - Requires: the consolidated findings and fix order.
   - Produces: a new revision and a tier record. Return to stage 4 and run the reviews the tier requires, then stage 6.
8. **Merge and close** (performed by a human)
   - Assignment: the requester merges after the verdict is ready and any required high-risk approval is recorded. Merging is never automated here.
   - Requires: a ready verdict for the current head revision.
   - Produces: a merged change, the post-merge checks from `merge-readiness-check`, the work item marked done where a status is kept, and a completed execution record.

## Validation

- After stage 1, confirm the requester gave explicit approval and nothing past ready was set.
- After stage 5, confirm the second reviewer saw no other review output and that both reports name the same revision.
- After stage 6, confirm the verdict names the head revision and that every checklist item has evidence or is marked Cannot verify.
- Before stage 8, confirm the head revision is the revision the reviews examined, or that the required re-review covered it.
- On failure: return the failing item to the stage that owns it, with the finding ids or checklist items.

## Branching and iteration

- If the blocking set is empty after stage 6, go to the readiness check and then stage 8.
- If the change is high risk, require a recorded human approval before stage 8.
- Allow at most two repair rounds. After the second failed round, mark the item blocked, stop, and escalate with the findings and the decision needed.
- Pause the work item after three review runs, or when the budget set before it began is exceeded. The requester then decides to continue, simplify, split, or change approach, and the decision is recorded.
- If a reviewer becomes unavailable, keep independence, record the reason, and invalidate affected approvals. If independence cannot be kept, stop.
- A new revision invalidates earlier approvals unless a diff-only re-review covers it.

## Failure behavior

- Recoverable: a report names the wrong revision, a field is missing, or tests were not run. Return it to its reviewer and resume.
- Stop or escalate when: independence cannot be met, the repair limit is reached, the environment cannot be confirmed, a required check or approval rule would have to be bypassed, or a high-risk approval is missing. Never invent a test result, a review, or an approval.

## Final output

Return the approved specification, the revision that merged, both review reports, the consolidated findings, the repair and tier record, the completed merge checklist, and a list of unresolved findings, accepted risks, and decisions that were escalated.

## Completion criteria

- The change merged only with every checklist item Met for the head revision, or the workflow stopped with the blocker and the decision named.
- Every approval and re-review is tied to a named revision.
- No review output reached the second reviewer before its initial report, and no result is reported that was not produced.
