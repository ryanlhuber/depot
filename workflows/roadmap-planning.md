# Roadmap Planning

## Goal

Produce a one-page now, next, and later roadmap that matches the current ranking and dependencies, states its confidence honestly, and promises nothing that was not committed. Success means the owner can share it and every entry is traceable to a ranked outcome.

## Inputs

- Required: the items or epics with their outcomes, and an owner who can approve the roadmap.
- Optional: a current priority table, a dependency map, supplied dates or commitments, and the intended audience.
- Assumptions: no dates are used unless supplied. A ranking older than the last significant change to the backlog is treated as stale.

## Stages

1. **Confirm the ranking is current**
   - Assignment: [Backlog Owner](../agents/backlog-owner.md), applying [Backlog Prioritization](../skills/plan/backlog-prioritization/SKILL.md) when no current ranking exists or the supplied one is stale.
   - Requires: the items and the criteria that matter now.
   - Produces: a current priority table with owner decisions flagged.
2. **Confirm the order**
   - Assignment: [Dependency Mapping](../skills/plan/dependency-mapping/SKILL.md) when no current dependency map exists.
   - Requires: the items.
   - Produces: a dependency map with external blockers.
3. **Write the roadmap**
   - Assignment: the Backlog Owner, applying [Roadmap Writing](../skills/plan/roadmap-writing/SKILL.md).
   - Requires: the priority table, the dependency map, supplied dates, and the audience.
   - Produces: a one-page roadmap with confidence and moving conditions.
4. **Review and approve** (performed by the owner, outside this workflow)
   - Assignment: the owner reviews the roadmap, changes it, and approves it for sharing.
   - Requires: the roadmap, open decisions, and risks.
   - Produces: an approved roadmap.

## Validation

- After stage 1, confirm no item ranks above a hard prerequisite.
- After stage 3, confirm every entry is an outcome with a horizon, a reason, a confidence, and a moving condition.
- After stage 3, confirm no outcome sits ahead of its dependency and every date is marked as supplied.
- On failure: return the failing entry to the stage that owns it.

## Branching and iteration

- If a current ranking and dependency map are supplied, skip stages 1 and 2.
- If the roadmap would place an outcome before its dependency, return to stage 2 once to resolve the conflict, then report it as an owner decision if unresolved.
- Allow at most one return to any stage. After that, stop and escalate with the finding and the decision needed.

## Failure behavior

- Recoverable: a missing confidence, reason, or moving condition. Return it and resume.
- Stop or escalate when: the owner is not available to settle an open trade-off that determines a horizon. Do not guess dates or commitments.

## Final output

Return the roadmap, with open decisions, main risks, and the changes since the previous version when one exists.

## Completion criteria

- Every entry traces to a ranked outcome and agrees with the dependencies.
- No date or commitment appears that was not supplied.
- The owner approved it, or the open decisions blocking approval are named.
