# Router cases after the 0.9.0 rename, 2026-10-26

Model: Claude Sonnet subagents, the same vendor family as the author, so this run is not independent. One run per case, read-only. Each runner was given only the renamed `route-work` `SKILL.md` and `routing-map.md` (0.9.0), no model table, and the same three requests as [2026-10-25](2026-10-25-router-ux-ui-cases.md). The author judged the outputs against the expected outcomes in [the behavioral cases](../behavioral-cases.md). Each runner's final answer is in [2026-10-26-rename-cases/](2026-10-26-rename-cases/).

| Case | Artifact | Kind | File | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Router sends visual critique to UI | route-work | output | r1 | `review-visual-design` primary, `design-reviewer` at most as follow-up, no frontend build skill | Primary `review-visual-design`; `design-reviewer` and `specify-responsive-layout` as optional alternates | Pass | Matches all three conditions |
| Router keeps specifying apart from building | route-work | output | r2 | `specify-interface-states`, not `implement-interface-states`; implementation may be a later step | Primary `specify-interface-states`; `implement-interface-states` named as a later step | Pass | Spec first, build only afterwards |
| Router keeps research in UX | route-work | output | r3 | `synthesize-research`, no UI or frontend skill | Primary `synthesize-research`; follow-ups `draft-personas` and `map-user-journey` | Pass | No UI or frontend skill recommended |

Result: 3 of 3 pass.

Limits: single runs, same vendor family, read-only, and the author wrote both the fixtures and the expectations. The requests are clear-cut and show the renamed map routes the obvious cases, not requests that sit on a bucket line.
