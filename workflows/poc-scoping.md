# POC Scoping

## Goal

Define a small proof of concept that can settle one question, with the smallest slice of work that can answer it and a stated rule for when to stop. Success means the requester can start building with a clear question, a result that would confirm and one that would refute it, and a limit, or the work stopped because the question could not be made testable.

## Inputs

- Required: the idea or question in the requester's words, and a requester who can confirm it.
- Optional: the limit on time or effort, known constraints, the existing system, and what has already been tried.
- Assumptions: a limit that is not supplied is requested before stage 3; if none is given the workflow stops there and asks. Nothing in the scope is presented as a commitment to build the full product.

## Stages

1. **Frame the question**
   - Assignment: [Delivery Planner](../agents/delivery-planner.md), applying [Problem Framing](../skills/plan/problem-framing/SKILL.md).
   - Requires: the idea or question.
   - Produces: a problem frame whose success measure can fail, naming the result that would confirm and the result that would refute.
2. **Find what must be tested**
   - Assignment: the Delivery Planner, applying [Assumption Mapping](../skills/plan/assumption-mapping/SKILL.md).
   - Requires: the problem frame.
   - Produces: a register with the assumptions the proof of concept must test, ordered by risk.
3. **Cut to the smallest slice**
   - Assignment: [Simplification Review](../skills/plan/simplification-review/SKILL.md).
   - Requires: the frame, the register, and the limit.
   - Produces: a simplification proposal retaining only what is needed to test the riskiest assumptions, with deferred work and revisit triggers.
4. **Break down and set the stop rule**
   - Assignment: the Delivery Planner, applying [Issue Breakdown](../skills/plan/issue-breakdown/SKILL.md) to the retained slice.
   - Requires: the simplification proposal and the limit.
   - Produces: a small item set and a stop rule: the limit, and what result or lack of result ends the proof of concept.

## Validation

- After stage 1, confirm the question has a result that would refute it, or report that it is not testable.
- After stage 2, confirm each assumption to be tested has a confirming and a refuting result, and that a time or effort limit has been supplied. If not, ask for it now and stop until it is given.
- After stage 3, confirm every retained item serves a tested assumption and every deferral states its cost.
- After stage 4, confirm the stop rule names a limit and a decision point, and that no item implies building the full product.
- On failure: return the failing item to the stage that owns it.

## Branching and iteration

- If the question cannot be made refutable after one return to stage 1, stop and report what would make it testable.
- If the cut would remove a safety, security, accessibility, or data-protection concern, flag it as an owner decision instead of cutting it.
- Allow at most one return to any stage. After that, stop and escalate with the finding and the decision needed.

## Failure behavior

- Recoverable: a missing confirming or refuting result, or an item without a done signal. Return it and resume.
- Stop or escalate when: no limit is supplied, the question cannot be tested, or the smallest slice still exceeds the limit. Report the gap and let the requester choose to raise the limit, narrow the question, or drop it.

## Final output

Return the problem frame, the register of assumptions to test, the simplification proposal, the item set, and the stop rule, with the owner decisions and anything deferred and why.

## Completion criteria

- The question, the confirming result, the refuting result, and the stop rule are all written down.
- Every retained item serves a tested assumption.
- Deferred work and its revisit conditions are recorded, and no commitment to a full build is implied.
