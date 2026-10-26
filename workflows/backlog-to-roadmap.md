# Backlog to Roadmap

## Goal

Bring a backlog to a state that can be trusted and turn it into a one-page now, next, and later roadmap that matches the current ranking and dependencies, states its confidence honestly, and promises nothing that was not committed. Success means the owner has a cleaned, re-ranked backlog, an approved roadmap whose every entry traces to a ranked outcome, and an honest status, with no item changed without their decision.

## Inputs

- Required: the items or epics with their outcomes, the snapshot date, and an owner who can decide on cleanup actions and approve the roadmap.
- Optional: a staleness threshold, repository activity, a current priority table, a dependency map, a limit driving scope, supplied dates or commitments, the intended audience, and the previous status report or roadmap.
- Assumptions: no tracker is assumed. The workflow recommends; the owner or their tooling makes every change. No dates are used unless supplied. A staleness threshold that is not supplied is stated as assumed. A ranking older than the last significant change to the backlog is treated as stale.

## Stages

1. **Check health**
   - Assignment: [Backlog Owner](../agents/backlog-owner.md), applying [Audit Backlog](../skills/plan/audit-backlog/SKILL.md).
   - Requires: the items, the snapshot date, and any threshold or evidence.
   - Produces: a health report with evidenced findings and one recommended action each.
2. **Apply cleanup** (performed by the owner, outside this workflow)
   - Assignment: the owner accepts, changes, or rejects each recommended action and applies the approved ones.
   - Requires: the health report.
   - Produces: the cleaned item set and a record of the decisions made.
3. **Confirm the order**
   - Assignment: [Sequence Work](../skills/plan/sequence-work/SKILL.md) on the cleaned set, when no current dependency map exists.
   - Requires: the cleaned item set.
   - Produces: a dependency map with the build order, external blockers, and no remaining cycle.
4. **Confirm the ranking is current**
   - Assignment: the Backlog Owner, applying [Prioritize Backlog](../skills/plan/prioritize-backlog/SKILL.md) when no current ranking exists or the supplied one is stale, and [Simplify Scope](../skills/plan/simplify-scope/SKILL.md) when a limit applies.
   - Requires: the cleaned set, the dependency map, the criteria that matter now, and any limit.
   - Produces: a current priority table and, when a limit applies, a simplification proposal with owner decisions flagged.
5. **Report status** (optional: when progress evidence exists or a report is wanted)
   - Assignment: [Report Status](../skills/plan/report-status/SKILL.md).
   - Requires: the cleaned set, the priority table, and available evidence of progress.
   - Produces: a status report that lists decisions needed, risks, and unknowns.
6. **Write the roadmap**
   - Assignment: the Backlog Owner, applying [Write Roadmap](../skills/plan/write-roadmap/SKILL.md).
   - Requires: the priority table, the dependency map, supplied dates, and the audience.
   - Produces: a one-page roadmap with confidence and moving conditions.
7. **Review and approve** (performed by the owner, outside this workflow)
   - Assignment: the owner reviews the roadmap, changes it, and approves it for sharing.
   - Requires: the roadmap, open decisions, and risks.
   - Produces: an approved roadmap.

## Validation

- After stage 1, confirm every finding cites an item and evidence and that nothing was changed.
- After stage 2, confirm every applied action traces to an owner decision.
- After stage 3, confirm no cycle remains.
- After stage 4, confirm no item ranks above a hard prerequisite and that protected-area cuts are flagged.
- After stage 5, confirm every Done item cites evidence.
- After stage 6, confirm every entry is an outcome with a horizon, a reason, a confidence, and a moving condition, that no outcome sits ahead of its dependency, and that every date is marked as supplied.
- On failure: return the failing item or entry to the stage that owns it.

## Branching and iteration

- If a clean, current backlog is supplied, or stage 1 finds no problems above the threshold, skip stage 2; skip stage 1 as well when the owner states the backlog was checked recently.
- If a current ranking and dependency map are supplied, skip stages 3 and 4.
- If no limit is supplied, skip the simplification proposal in stage 4.
- If items the owner flagged as needing verification remain unverified, carry them forward as unknown, not as done or dead. List them under an Unknown heading beside the priority table, not inside a tier, with what would verify each, and show them in the roadmap as unknown.
- Run stage 1 again at most once if the cleanup changes the set substantially; then continue with what exists.
- If the roadmap would place an outcome before its dependency, return to stage 3 once to resolve the conflict, then report it as an owner decision if unresolved.
- Allow at most one return to any other stage. After that, stop and escalate with the finding and the decision needed.

## Failure behavior

- Recoverable: a finding lacks evidence, an item lacks a field, or a roadmap entry lacks a confidence, reason, or moving condition. Return it and resume.
- Stop or escalate when: the owner is unavailable to decide cleanup actions that later stages depend on or settle an open trade-off that determines a horizon, or the backlog cannot be read. Do not apply cleanup actions on the owner's behalf, and do not guess dates or commitments.

## Final output

Return the health report and the record of cleanup decisions (when stages 1 and 2 ran), the dependency map, the priority table, any simplification proposal, the status report when one was made, and the roadmap, with open decisions, main risks, the items marked unknown, and the changes since the previous version when one exists.

## Completion criteria

- The backlog changed only through recorded owner decisions.
- Every finding, placement, progress claim, and roadmap entry is tied to evidence, a ranked outcome, or a stated reason, and agrees with the dependencies.
- Unverified items are reported as unknown, and no date or commitment appears that was not supplied.
- The owner approved the roadmap, or the open decisions blocking approval are named.
