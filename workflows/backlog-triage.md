# Backlog Triage

## Goal

Bring an existing backlog back to a state that can be trusted: problems found with evidence, the owner's cleanup decisions recorded, the remaining items ordered, and an honest status. Success means the owner has a cleaned, re-ranked backlog and a report, with no item changed without their decision.

## Inputs

- Required: the backlog items with whatever fields they have, the snapshot date, and an owner who can decide on cleanup actions.
- Optional: a staleness threshold, repository activity, a dependency map, a limit driving scope, and the previous status report.
- Assumptions: no tracker is assumed. The workflow recommends; the owner or their tooling makes every change. A staleness threshold that is not supplied is stated as assumed.

## Stages

1. **Check health**
   - Assignment: [Backlog Owner](../agents/backlog-owner.md), applying [Backlog Health Check](../skills/plan/backlog-health-check/SKILL.md).
   - Requires: the items, the snapshot date, and any threshold or evidence.
   - Produces: a health report with evidenced findings and one recommended action each.
2. **Apply cleanup** (performed by the owner, outside this workflow)
   - Assignment: the owner accepts, changes, or rejects each recommended action and applies the approved ones.
   - Requires: the health report.
   - Produces: the cleaned item set and a record of the decisions made.
3. **Re-establish order**
   - Assignment: [Dependency Mapping](../skills/plan/dependency-mapping/SKILL.md) on the cleaned set.
   - Requires: the cleaned item set.
   - Produces: a dependency map with the build order and blockers.
4. **Re-rank**
   - Assignment: the Backlog Owner, applying [Backlog Prioritization](../skills/plan/backlog-prioritization/SKILL.md), and [Scope Cutting](../skills/plan/scope-cutting/SKILL.md) when a limit applies.
   - Requires: the cleaned set, the dependency map, the criteria, and any limit.
   - Produces: a priority table and, when a limit applies, a cut proposal with owner decisions flagged.
5. **Report**
   - Assignment: [Status Reporting](../skills/plan/status-reporting/SKILL.md).
   - Requires: the cleaned set, the priority table, and available evidence of progress.
   - Produces: a status report that lists decisions needed, risks, and unknowns.

## Validation

- After stage 1, confirm every finding cites an item and evidence and that nothing was changed.
- After stage 2, confirm every applied action traces to an owner decision.
- After stage 3, confirm no cycle remains.
- After stage 4, confirm no item ranks above a hard prerequisite and that protected-area cuts are flagged.
- After stage 5, confirm every Done item cites evidence.
- On failure: return the failing item to the stage that owns it.

## Branching and iteration

- If stage 1 finds no problems above the threshold, skip stage 2 and continue.
- If no limit is supplied, skip the cut proposal in stage 4.
- If items the owner flagged as needing verification remain unverified, carry them forward as unknown, not as done or dead.
- Run stage 1 again at most once if the cleanup changes the set substantially; then continue with what exists.

## Failure behavior

- Recoverable: a finding lacks evidence or an item lacks a field. Return it and resume.
- Stop or escalate when: the owner is unavailable to decide cleanup actions that stages 3 to 5 depend on, or the backlog cannot be read. Do not apply cleanup actions on the owner's behalf.

## Final output

Return the health report, the record of cleanup decisions, the dependency map, the priority table, any cut proposal, and the status report, with the decisions still needed and the items marked unknown.

## Completion criteria

- The backlog changed only through recorded owner decisions.
- Every finding, placement, and progress claim is tied to evidence or a stated reason.
- Unverified items are reported as unknown.
