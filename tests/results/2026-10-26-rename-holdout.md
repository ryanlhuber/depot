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

Requests 8 and 14 are new misses. Both give no approved specification or acceptance criteria, and `build-feature` says it is for a ready spec and not for unclear requirements, so choosing `refine-issue` is defensible. They were correct before the rename. With one run per version I cannot tell whether the rename, the move of `refine-issue` into `plan` in 0.8.0 (the earlier run predates it), or ordinary run-to-run variation caused them. I did not change any description or expected answer because of this run. Repeating the run would show whether the two misses are stable.

Limits: single run, same vendor family, author-written requests and expectations, expected names mapped by the author.
