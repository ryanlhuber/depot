# Router UX and UI cases, 2026-10-25

Model: Claude Opus subagents, the same vendor family as the author, so this run is not independent. One run per case, read-only. Each runner was given only `kit-router`'s `SKILL.md` and `routing-map.md` (as of 0.7.0), no model table, and the user request. The author judged the outputs against the expected outcomes in [the behavioral cases](../behavioral-cases.md). Each runner's final answer is in [2026-10-25-router-ux-ui-cases/](2026-10-25-router-ux-ui-cases/).

Scope: the three router cases added with the `ux` and `ui` bucket split in 0.7.0.

| Case | Artifact | Kind | File | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Router sends visual critique to UI | kit-router | output | r1 | `visual-design-critique` primary, `design-reviewer` at most as follow-up, no frontend build skill | Primary `visual-design-critique`, follow-up `design-reviewer`, no frontend skill | Pass | Matches all three conditions |
| Router keeps specifying apart from building | kit-router | output | r2 | `interface-state-specification`, not `interface-state-implementation`; implementation may be a later step | Primary `interface-state-specification`; `interface-state-implementation` named as a step after the spec exists | Pass | Spec first, build only as a later step |
| Router keeps research in UX | kit-router | output | r3 | `research-synthesis`, no UI or frontend skill | Primary `research-synthesis`; follow-ups `persona-and-scenario-drafting` and `problem-framing` | Pass | No UI or frontend skill recommended |

Result: 3 of 3 pass.

Limits: single runs, same vendor family, read-only, and the author wrote both the fixtures and the expectations. The requests are clear-cut by design; they show the new map sections route the obvious cases correctly, not how the router handles requests that sit on the UX and UI line.
