# Issue to Merge

## Goal

Take one work item, a feature to build or a defect to fix, from an approved statement of what it must do to a verified, human-merged change, with every approval tied to a named revision and the independent review the change's risk requires: two reviews that were not allowed to influence each other for a high-risk change, one for any other. For a defect, success also means the fix is proven by a check that failed before and passes after, and did not widen scope or break nearby behavior. Success means the change merged only after every merge precondition was met by evidence, or the work stopped at a named blocker with the decision still needed.

## Inputs

- Required: the work item (an issue, ticket, task, file, plain request, or defect report with symptoms, where it was seen, and any reproduction steps), the repository and project conventions (for example the working conventions in the agent instructions file), and a builder plus the reviewers the review path needs (one for the light path, two for the standard path) who can be kept independent, from distinct families where the path requires or prefers it.
- Optional: project configuration naming the target branch, runtime, and install, build, and test commands (when the project's conventions record them, read them there instead of asking), a repair-round limit, a review budget, and recorded human approvals; for a defect, logs, recent changes, and the intended behavior.
- Assumptions: no particular tracker, hosting platform, or tool is required; where the work item or the change lives is the project's choice. One active work item at a time. Independence means a different party for the builder and each reviewer: a fresh session that has not seen the builder's context or reasoning, and, on the standard path, not the other review's output. When the parties are models, a different model family is the preferred and strongest form. It is required on the standard path. On the light path it is preferred and suggested, but not required: when only the builder's family is reachable, or the requester chooses it knowing another family is reachable (which is allowed but discouraged), the review may go ahead as a **same-family review**, recorded as a limitation (see Review path). Versions, variants, or reasoning levels of one family, or one family reached through different tools, never count as a distinct family and are never reported as one. If a party is not independent in the first sense (the reviewer is the builder or saw its context or reasoning, or, on the standard path, saw the other review's output before its initial report), or the standard path lacks a family, the workflow stops and asks; it never weakens the rule silently.
- Review path: the standard path applies to a high-risk change, to a change whose risk is not recorded, and whenever the requester asks for it. It runs stages 5 and 6 with a builder and two reviewers from three distinct families. The light path applies to every other change. It runs stage 5 only, with a builder and one reviewer, and skips stage 6. A reviewer from a different family than the builder is preferred and is the standard form of the light path. When only one family is reachable, or the requester chooses the builder's family anyway, the reviewer is a fresh session in the builder's family and the review is recorded as a same-family review: the requester is told before the build, the review report, merge checklist, and final output name the limitation, and the work continues. The path comes from the risk recommended at stage 1, or recorded by the builder when Refine Issue was skipped. The path, and for the light path whether the review is cross-family or same-family (with the reason, "no other family reachable" or "requester chose same-family although another family was reachable", for a same-family review), are recorded before the build. If another family is reachable, suggest it to the requester before the build and say why it is preferred (it is less likely to share the builder's blind spots); proceed with the builder's family only on the requester's explicit choice, and never record "no other family reachable" when one was. The requester may raise the risk, or lower a risk the builder recorded (not one a reviewer raised); the workflow never lowers a risk on its own, and the builder never records a risk below one the report or the requester stated. A repair that reaches a high-risk area moves the item to the standard path from the next review on. A review that finds the change touches a high-risk area, or a requester who raises the risk to high after a light-path review, raises the recorded risk to high: the item moves to the standard path, the light-path review does not carry over, the reviews the standard path requires run on the current revision (stop and ask if a family is missing), and the high-risk human approval applies.

## Stages

1. **Define what the change must do**
   - Assignment: [Refine Issue](../skills/plan/refine-issue/SKILL.md). For a defect, only when the correct behavior is not already stated or is disputed; skip when the report states the expected behavior. The report is then the requester's statement of what must happen, and the builder does not wait for a separate approval: it records the definition itself (see Produces) and goes on. Stop and ask only for a real open question (see Branching and iteration).
   - Requires: the work item and the project's conventions.
   - Produces: a specification (for a defect, the expected behavior and acceptance criteria) that the requester explicitly approved, the Ready check results, and recommended metadata including risk, which sets the review path. When Refine Issue was skipped, the builder records the following before the build and tells the requester what it recorded; the requester may correct it any time before the merge: the expected behavior and acceptance criteria taken from the report; the risk with a one-line reason, judged against the high-risk areas named in Refine Issue (low or medium only when the change plainly touches none of them; high when it touches one; no risk recorded, and so the standard path, when the builder cannot tell; a fix that makes the code match behavior its documentation already states is not, by itself, a breaking change to a public interface); and the review path that follows. The builder also writes the done-criteria it will build and review against: what must be true when the fix is done, including related inputs or places the same defect can appear and behavior that must not change. Routine criteria (tests added, nothing else broken, the same pattern checked elsewhere in the code) are recorded without asking. The builder asks the requester once, before the build, only when the report does not state acceptance criteria and a done-criterion would change what the fix does beyond the report's stated expected behavior, and the report, the documentation, and the repository's tests do not already settle it: a rule generalized from one example to other inputs, how invalid or edge inputs must behave, or behavior that must stay as it is. The question lists those criteria with the builder's recommendation, together with any real open question (see Branching and iteration), and the answer is recorded as the acceptance criteria. A report whose own words, documentation, or tests already settle every such criterion needs no question. If the requester cannot be reached, or says to proceed, the builder records its criteria as its own, marked unconfirmed, and the reviewer is told they are unconfirmed. The reviewer receives the acceptance criteria with the diff.
2. **Confirm environment** (performed by the requester or builder, outside this workflow)
   - Assignment: the requester or builder confirms the repository, the target branch read from project configuration (never assumed), the supported runtime, the install, build, and test commands, that the base branch is current, that access is least-privilege, and that no production secrets are in any agent's context.
   - Requires: the approved specification, or the builder's recorded definition when Refine Issue was skipped.
   - Produces: a confirmed environment note. The workflow does not proceed on a guess. If the recorded test command fails for a reason unrelated to the change, or the recorded branch or runtime is not available, the builder states the substitute used and the requester confirms it before the review; conventions are not edited silently.
3. **Build or repair** (performed by the builder, outside this workflow)
   - Assignment: the builder applies [Build Feature](../skills/dev/build-feature/SKILL.md) for a feature, or [Fix Bug](../skills/dev/fix-bug/SKILL.md) for a defect, on a feature branch and runs the tests. Reviewers never edit code.
   - Requires: the approved specification (or the recorded definition) and the environment note.
   - Produces: a change, test results, and the revision identifier under review. Where the builder recorded the risk, it re-checks the risk against the actual diff before stage 5 and records high if the diff touches a high-risk area. For a defect: the smallest responsible cause with evidence, and a check that failed before and passes after. If the cause cannot be reproduced or found, the output is the evidence gathered and the questions left open; do not guess a fix.
4. **Regression review** (required for a defect; for a feature, [Feature to Release](feature-to-release.md) runs it after the merge)
   - Assignment: [Review Regressions](../skills/dev/review-regressions/SKILL.md), performed by the builder or another party. When the builder performs it, the reviewers treat it as the builder's own check and verify its coverage claims.
   - Requires: the revision and the surrounding code.
   - Produces: regression risks with coverage status and the missing checks. Add the missing checks to the change, which makes a new revision, or record them as accepted risks.
5. **Independent review**
   - Assignment: [Review Code Independently](../skills/dev/review-code-independently/SKILL.md) by a reviewer independent of the builder.
   - Requires: the specification, diff and context, test results, the regression review when one ran, the recorded risk and its reason, and the revision.
   - Produces: a saved review report for that revision, which also says whether the diff touches a high-risk area or the recorded risk otherwise looks too low. Not posted to the change discussion.
6. **Adversarial review** (standard path only; skip on the light path and record that it was skipped)
   - Assignment: [Review Code Adversarially](../skills/dev/review-code-adversarially/SKILL.md) by a third independent reviewer. It starts without the first review's findings or the change discussion.
   - Requires: the same inputs as stage 5 and the same revision.
   - Produces: a saved review report that states whether any other review output was seen.
7. **Reconcile and decide**
   - Assignment: [Merge Gatekeeper](../agents/merge-gatekeeper.md), applying `reconcile-reviews` and, when nothing blocks, `check-merge-readiness`.
   - Requires: both reports, the specification, test evidence, the risk level, and the target branch.
   - Produces: consolidated findings and the blocking set, or the completed merge checklist and a ready or not-ready verdict. After both reports exist, both are attached to the change record together.
8. **Repair** (only when the blocking set is not empty)
   - Assignment: the builder fixes the blocking findings, again with Build Feature or Fix Bug and without widening scope; the gatekeeper records the re-review tier through `reconcile-reviews`.
   - Requires: the consolidated findings and fix order.
   - Produces: a new revision and a tier record. Return to stage 5 and run the reviews the tier requires, then stage 7.
9. **Merge and close** (performed by a human)
   - Assignment: the requester merges after the verdict is ready and any required high-risk approval is recorded. Merging is never automated here.
   - Requires: a ready verdict for the current head revision.
   - Produces: a merged change, the post-merge checks from `check-merge-readiness`, the work item marked done where a status is kept, and a completed execution record.

## Validation

- After stage 1, confirm the requester gave explicit approval and nothing past ready was set, or, when Refine Issue was skipped, that the recorded definition (expected behavior, acceptance criteria, risk with its reason, review path) exists before the build.
- After stage 2, confirm the environment note names the target branch and the test command.
- After stage 3, for a defect, confirm the failing-before check was observed failing for the stated reason and that the diff touches only what the cause requires.
- After stage 4, confirm every Not covered risk has a check added or an accepted-risk record.
- After stage 5 on the light path, or after stage 6 on the standard path, confirm the review path was recorded before the build (or raised afterward by a recorded risk change) and matches the risk, and, on the light path, that the review is recorded as cross-family or same-family and the report names the reviewer's family. On the standard path, also confirm the second reviewer saw no other review output and that both reports name the same revision.
- After stage 7, confirm the verdict names the head revision and that every checklist item has evidence or is marked Cannot verify.
- Before stage 9, confirm the head revision is the revision the reviews examined, or that the required re-review covered it.
- On failure: return the failing item to the stage that owns it, with the finding ids or checklist items.

## Branching and iteration

- If the blocking set is empty after stage 7, go to the readiness check and then stage 9.
- If the change is high risk, use the standard path and require a recorded human approval before stage 9.
- If risk is missing from the specification, use the standard path.
- If the expected behavior of a defect is undefined and the requester cannot decide, stop at stage 1 with the decision needed. When Refine Issue was skipped, a real open question is one the report leaves open that changes what the fix does: two reasonable behaviors, or a fix that would require changing an existing test or documented behavior. Ask it once, with the options and a recommendation, together with the done-criteria question from stage 1 when that applies. A question that the report, the repository's tests, its documentation, or its conventions already answer is not a stop; record the answer and go on. If stage 3 shows the defect is a missing or wrong requirement, return to stage 1.
- If a repair needs a larger change than the cause justifies (a redesign, a migration), stop and hand it to the requester as a separate work item rather than widening the fix.
- Allow at most two repair rounds. After the second failed round, mark the item blocked, stop, and escalate with the findings and the decision needed.
- Pause the work item after three review rounds, or when the budget set before it began is exceeded. A review round is the reviews the path requires for one revision (stage 5, and stage 6 on the standard path); a Tier A check does not count as a round. The requester then decides to continue, simplify, split, or change approach, and the decision is recorded.
- If a reviewer becomes unavailable, keep independence, record the reason, and invalidate affected approvals. On the light path a replacement from the builder's family is allowed (suggest another family first if one is reachable) and the review is recorded as same-family with its reason: no other family reachable, or the requester's explicit choice. If independence cannot be kept, stop.
- If a repair moves a light-path item to the standard path and a family is missing, stop and ask; a same-family review does not carry over to the standard path.
- A new revision invalidates earlier approvals unless a diff-only re-review covers it.

## Failure behavior

- Recoverable: a report names the wrong revision, a field is missing, tests were not run, the reproduction is incomplete, the failing check fails for a different reason, or a regression risk lacks a test. Return it to the stage that owns it and resume.
- Stop or escalate when: independence cannot be met (the reviewer is the builder or saw its context or reasoning, or, on the standard path, saw the other review's output before its initial report, or the standard path lacks a distinct family; a missing distinct family on the light path is not a stop), the repair limit is reached, the environment cannot be confirmed, a defect cannot be reproduced or its cause established from evidence, a required check or approval rule would have to be bypassed, or a high-risk approval is missing. Never invent a reproduction, a test result, a review, or an approval.

## Final output

Return the approved specification (or, when Refine Issue was skipped, the builder's recorded definition with its risk and reason), the review path used (and, on the light path, whether the review was cross-family or same-family, with the limitation stated for a same-family review), the revision that merged, the review reports, the consolidated findings, the repair and tier record, the completed merge checklist, and a list of unresolved findings, accepted risks, and decisions that were escalated. For a defect, also return the expected behavior, the cause and its evidence, the before and after check results, and the regression review.

## Completion criteria

- The change merged only with every checklist item Met for the head revision, or the workflow stopped with the blocker and the decision named.
- Every approval and re-review is tied to a named revision.
- On the standard path, no review output reached the second reviewer before its initial report, and no result is reported that was not produced.
- A same-family review is recorded as same-family everywhere it appears and is never reported as cross-family.
- For a defect, a check that failed before the repair passes after it, both results were observed, and the change contains no scope beyond the cause.
