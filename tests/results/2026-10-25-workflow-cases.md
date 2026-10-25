# Workflow behavioral cases, 2026-10-25

Model: Claude Opus subagents, the same vendor family as the author, so this run is not independent. One run per case, read-only (the agents described what they would do and which stops they would hit; they did not change files or run checks), judged by the author against the expected outcomes in [the behavioral cases](../behavioral-cases.md). Each agent's final answer is in [2026-10-25-workflow-cases/](2026-10-25-workflow-cases/).

Scope: 26 cases across the 8 workflows: `goal-to-backlog` (g1-g4), `roadmap-planning` (r1-r5), `poc-scoping` (p1-p3), `design-review` (d1-d3), `fix-or-build-to-merge` (f1-f8), `feature-delivery` (x1-x2), and one `design-to-build` case (s1).

| Pass | Partial | Fail |
| --- | --- | --- |
| 24 | 2 | 0 |

## Partial results

- f6, "Fix proven both ways": a read-only run cannot observe a check failing before and passing after the repair, so it could only confirm that the workflow demands both. This is a limit of the method, not of the workflow.
- s1, "One-off component path": the fixture lacked labels and required fields, so the run stopped at stage 2 and never reached the states stage. Rerun with a complete fixture.

## Findings

1. `roadmap-planning` failure behavior had lost a qualifier when `backlog-triage` was merged in. The old text stopped only for cleanup actions that later stages depend on; the merged text stopped for any cleanup decision. Fixed.
2. `goal-to-backlog` said to continue with dependent parts marked provisional, while `delivery-planner` forbids writing items on an undecided premise. The workflow now marks dependent epics provisional and lists their work as not yet sliced, with the decision it waits on. Fixed.
3. Where a held Unknown item appears in the `roadmap-planning` priority table is not stated; one run (r5) continued after escalating because the instruction was ambiguous. Not changed; noted for a later pass.

## Limits

Single runs, same vendor family as the author, judged by the author, and read-only. This shows the workflows are followable and their stops are found, not that they work end to end on a real repository.
