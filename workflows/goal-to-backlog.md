# Goal to Backlog

## Goal

Take one goal from a sentence to a ranked set of draft work items that is ready for refinement, with every assumption visible, every item observable, and the order consistent with the dependencies. Success means the requester can start refining the top items without re-asking what the goal is or what it rests on, or the work stopped at a named decision.

## Inputs

- Required: the goal in the requester's words, and a requester who can confirm it and settle trade-offs.
- Optional: constraints, existing items, the structure of the existing system, a priority criterion, and a preferred item format.
- Assumptions: no particular tracker or tool is required; items are plain Markdown. If the requester is unavailable, the workflow proceeds with the goal sentence marked unconfirmed and its assumptions labeled, and says so at the top of its result; it stops only when no goal can be stated. It never invents users, measures, deadlines, or effort.

## Stages

1. **Frame**
   - Assignment: [Delivery Planner](../agents/delivery-planner.md), applying [Problem Framing](../skills/plan/problem-framing/SKILL.md).
   - Requires: the goal.
   - Produces: a problem frame with a confirmed or unconfirmed goal sentence, success measures, assumptions, and open questions.
2. **Test the premises**
   - Assignment: the Delivery Planner, applying [Assumption Mapping](../skills/plan/assumption-mapping/SKILL.md).
   - Requires: the problem frame.
   - Produces: an assumption register and a list of assumptions that should become early items.
3. **Slice the outcomes**
   - Assignment: the Delivery Planner, applying [Outcome Slicing](../skills/plan/outcome-slicing/SKILL.md).
   - Requires: the problem frame and the register.
   - Produces: an epic outline with a coverage check.
4. **Break down**
   - Assignment: the Delivery Planner, applying [Issue Breakdown](../skills/plan/issue-breakdown/SKILL.md) to each epic.
   - Requires: the epic outline, the early items from stage 2, and any existing items.
   - Produces: the draft item set.
5. **Order by dependency**
   - Assignment: the Delivery Planner, applying [Dependency Mapping](../skills/plan/dependency-mapping/SKILL.md).
   - Requires: the item set.
   - Produces: a dependency map with the build order and external blockers.
6. **Rank**
   - Assignment: [Backlog Owner](../agents/backlog-owner.md), applying [Backlog Prioritization](../skills/plan/backlog-prioritization/SKILL.md).
   - Requires: the item set, the dependency map, and the criteria that matter now.
   - Produces: a priority table, the close calls, and the decisions the requester must make.
7. **Approve and hand off** (performed by the requester, outside this workflow)
   - Assignment: the requester accepts or changes the ranking, then copies the items into a tracker or keeps them as files, and takes the top items into refinement.
   - Requires: the priority table and the item set.
   - Produces: an approved ranked backlog.

## Validation

- After stage 1, confirm the requester confirmed the goal sentence, or that it is marked unconfirmed.
- After stage 3, confirm every success measure maps to an epic or is reported as a gap.
- After stage 4, confirm every item has an observable done signal and a size band, and that no acceptance criteria or time estimates were added.
- After stage 5, confirm no cycle remains and every external blocker has an owner.
- After stage 6, confirm no item ranks above a hard prerequisite.
- On failure: return the failing item to the stage that owns it, with the finding named.

## Branching and iteration

- If an assumption has High impact and no evidence and would change the epics, put its test first. Continue with the dependent epics marked provisional, and list their dependent work as not yet sliced, with the decision it waits on, rather than drafting items.
- If the coverage check fails after stage 3, return to stage 3 once. If it fails again, stop and report the uncovered measures.
- Allow at most two returns to any one stage. After the second, stop and escalate with the finding and the decision needed.
- If the requester changes the goal during the workflow, restart from stage 1 and record what was discarded.

## Failure behavior

- Recoverable: a field is missing, an item lacks a done signal, or a dependency lacks a reason. Return it to its stage and resume.
- Stop or escalate when: no goal can be stated, constraints contradict each other, an unevidenced assumption would change the whole plan, or a decision about scope or priority is needed that only the requester can make. Never fill a gap with an invented fact.

## Final output

Return the problem frame, assumption register, epic outline, item set, dependency map, and priority table, with the decisions the requester must make, the assumptions still unconfirmed, and the items ready for refinement first.

## Completion criteria

- Every success measure is covered by an epic, and every item has an observable done signal.
- The ranking is consistent with the dependencies and every placement has a reason.
- Every statement is marked Supplied or Assumed, and nothing is reported that was not produced.
