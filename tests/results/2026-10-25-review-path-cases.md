# Review path cases, 2026-10-25

Model: Claude Opus subagents, the same vendor family as the author, so this run is not independent. One run per case, read-only, judged by the author against the expected outcomes in [the behavioral cases](../behavioral-cases.md). Each agent's final answer is in [2026-10-25-review-path-cases/](2026-10-25-review-path-cases/).

Scope: the five cases added with the light review path in `fix-or-build-to-merge`.

| Case | File | Result |
| --- | --- | --- |
| Workflow stops without independence (high risk, two families) | l1 | Pass: standard path recorded, stopped before the build, asked for a third reviewer |
| Light path for ordinary change | l2 | Pass: light path recorded, stage 6 skipped and recorded, second-review rows marked not required; verdict Not ready only because check status and report attachment were not supplied |
| Light path is not the same family | l3 | Pass: another version of the builder's family not counted, stopped and asked |
| Risk is not lowered | l4 | Pass: no recorded risk gave the standard path; the builder's "probably minor" was declined |
| Repair reaches a high-risk area | l5 | Pass: moved to the standard path, chose Tier C, stopped because a third family was missing; also raised that the spec may not cover server-side enforcement |

Result: 5 of 5 pass.

Limits: single runs, same vendor family, read-only, and the author wrote both the fixtures and the expectations. They show the path rules are followable and the stops are found, not that the light path catches the same defects as the standard path. That needs real changes reviewed both ways.
