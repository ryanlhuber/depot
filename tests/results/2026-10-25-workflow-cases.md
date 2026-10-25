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

## Rerun after the fixes

After the wording fixes in 0.5.1 and the unavailable-requester change in 0.5.2, cases g1 to g4 were rerun, and s1 was rerun with a complete fixture (labels, required fields, and state copy). Same method and same limits as above; outputs are in [rerun/](2026-10-25-workflow-cases/rerun/).

| Case | Result |
| --- | --- |
| g1 Goal changes mid-run | Pass: restarted at stage 1, discarded work recorded, asked for confirmation because the requester was available |
| g2 Goal with no success measure, requester unavailable | Pass: proceeded with the goal marked unconfirmed and assumptions labeled, invented no measure, drafted only the two early items. It described the result as a stop at a named decision after stage 6, which reads inconsistently with having run the stages; the workflow text could be clearer |
| g3 Coverage check fails twice | Pass: stopped after the second failure and reported the uncovered measure |
| g4 Risky assumption with no evidence | Pass: test first, dependent epics provisional, dependent work listed as not yet sliced without drafting items |
| s1 One-off component path | Pass: skipped the component interface stage and ran the states stage from the markup and state specification |

With these, all 26 cases pass on their latest run. f6 ("Fix proven both ways") is still the one a read-only run cannot fully observe; the [real run](2026-10-25-real-run.md) observed a failing-before and passing-after check with real tests.
