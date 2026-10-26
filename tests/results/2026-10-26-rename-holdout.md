# Triggering holdout after the 0.9.0 rename, 2026-10-26

Model: a fresh Claude Haiku run, the same vendor family as the author, so this run is not independent. One run. It saw only the 57 skill names with their descriptions (new names, 0.9.0) and the 70 shuffled requests from [the holdout set](../triggering-holdout.md), unedited. Expected answers are the 2026-10-25 answers mapped through the rename table in [the changelog](../../CHANGELOG.md#090). The request that expected `portfolio-case-study-writing` is treated as `none`, because that skill moved to kit-work. Scored by the author. Raw answers: [2026-10-26-rename-cases/holdout-answers.txt](2026-10-26-rename-cases/holdout-answers.txt).

| Run | Correct of 70 |
| --- | --- |
| 2026-10-25, before the rename | 68 |
| 2026-10-26, after the rename | 66 |

Misses:

- Requests 17 and 43: the same two misses as the 2026-10-25 run (see [that file](2026-10-25-holdout.md)). Expected answers left as written.
- Request 8, "Change how discounts are calculated so loyalty members get 5% extra." Expected `build-feature`; chosen `refine-issue`.
- Request 14, "Add a dark mode toggle to settings." Expected `build-feature`; chosen `refine-issue`.

Requests 8 and 14 are new misses (first run). Both give no approved specification or acceptance criteria, and `build-feature` says it is for a ready spec and not for unclear requirements, so choosing `refine-issue` is defensible. They were correct before the rename. ## Reruns

Two more fresh Haiku runs on the same prompt ([run 2](2026-10-26-rename-cases/holdout-answers-run2.txt), [run 3](2026-10-26-rename-cases/holdout-answers-run3.txt)) each scored 66 of 70 with the same four misses. In both, requests 8 and 14 got `none` rather than `refine-issue`, so across three runs they never matched `build-feature`. Runs 2 and 3 gave identical answer lists, so they add little independent evidence beyond showing the answers are stable at this setting. The misses are therefore probably not run-to-run noise. What changed between 2026-10-25 and now is not isolated: the skill names (including `feature-build` → `build-feature`), the removal of the case study skill, and the 0.8.0 bucket moves all differ. A run of the 0.9.0 descriptions with the old names would separate the rename from the rest. I did not do it, and I did not change any description or expected answer.

Limits: single run, same vendor family, author-written requests and expectations, expected names mapped by the author.
