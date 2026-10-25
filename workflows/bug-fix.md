# Bug Fix

## Goal

Take a reported defect to a repaired, reviewed, human-merged change whose fix is proven by a check that failed before and passes after. Success means the defect no longer reproduces, the fix did not widen scope or break nearby behavior, and the change merged by the rules of [Refine to Merge](refine-to-merge.md), or the work stopped at a named blocker.

## Inputs

- Required: the defect report (symptoms, where it was seen, and any reproduction steps), the repository and its conventions, and a builder plus two independent reviewers.
- Optional: logs, recent changes, the intended behavior, a repair-round limit, and the project's target branch.
- Assumptions: where the report and the change live is the project's choice. The independence rules for builder and reviewers are those in Refine to Merge and apply here unchanged.

## Stages

1. **Define expected behavior**
   - Assignment: [Refine Issue](../skills/dev/refine-issue/SKILL.md), only when the correct behavior is not already stated or is disputed.
   - Requires: the defect report.
   - Produces: an approved statement of expected behavior and acceptance criteria. Skip when the report already states the expected behavior and the requester confirms it.
2. **Diagnose and repair** (performed by the builder)
   - Assignment: [Bug Fix](../skills/dev/bug-fix/SKILL.md).
   - Requires: the defect report, the expected behavior, and the confirmed environment.
   - Produces: the smallest responsible cause with evidence, a repair, a check that failed before and passes after, and the revision under review. If the cause cannot be reproduced or found, the output is the evidence gathered and the questions left open; do not guess a fix.
3. **Regression review**
   - Assignment: [Regression Review](../skills/dev/regression-review/SKILL.md).
   - Requires: the revision and the surrounding code.
   - Produces: regression risks with coverage status and the missing checks. Add the missing checks to the change or record them as accepted risks.
4. **Review, reconcile, and merge**
   - Assignment: stages 4 to 8 of [Refine to Merge](refine-to-merge.md), applied to this revision without change, including its repair-round limit and independence rules.
   - Requires: the approved expected behavior, the revision, test results, and the regression review.
   - Produces: the outputs Refine to Merge defines, or its named blocker.

## Validation

- After stage 1, confirm the requester approved the expected behavior.
- After stage 2, confirm the failing-before check was observed failing for the stated reason, and that the diff touches only what the cause requires.
- After stage 3, confirm every Not covered risk has a check added or an accepted-risk record.
- Before stage 4, confirm the revision named is the one stages 2 and 3 examined.

## Branching and iteration

- If the expected behavior is undefined and the requester cannot decide, stop at stage 1 with the decision needed.
- If stage 2 shows the defect is a missing or wrong requirement, return to stage 1.
- If the repair needs a larger change than the cause justifies (a redesign, a migration), stop and hand it to the requester as a separate work item rather than widening this fix.
- Repair rounds after review follow Refine to Merge.

## Failure behavior

- Recoverable: the reproduction is incomplete, the failing check fails for a different reason, or a regression risk lacks a test. Return to the stage that owns it.
- Stop or escalate when: the defect cannot be reproduced, the cause cannot be established from evidence, independence cannot be met, or a high-risk approval is missing. Never invent a reproduction, a test result, or a review.

## Final output

Return the expected behavior, the cause and its evidence, the revision that merged, the before and after check results, the regression review, and the outputs of Refine to Merge. List unresolved risks and decisions that were escalated.

## Completion criteria

- A check that failed before the repair passes after it, and both results were observed.
- The change contains no scope beyond the cause.
- Merge followed Refine to Merge, or the workflow stopped with the blocker named.
