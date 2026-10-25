# Triggering holdout, ChatGPT and DeepSeek runs, 2026-10-25

Model: ChatGPT, a different vendor family from the author and from the first holdout run. The owner pasted the same prompt into a fresh chat with browsing off: the 58 skill names with descriptions and the 70 shuffled requests from [the holdout set](../triggering-holdout.md), unchanged. One run. The model identity and version were not recorded, and the owner relayed the answers by hand. Scored by the author against the expected answers written before any run. Answers: [chatgpt-answers.txt](2026-10-25-holdout/chatgpt-answers.txt).

| Correct of 70 | Natural requests (58) | Near misses (12) |
| --- | --- | --- |
| 67 | 58 of 58 | 9 of 12 |

Compared with the [first run](2026-10-25-holdout.md) (68 of 70, Claude Haiku):

- Request 17 (brand colors from scratch): ChatGPT chose the expected `design-token-and-system-definition`; the first run chose none.
- Requests 8 and 14, both near misses: ChatGPT chose `refine-issue` where the expected answer was `feature-build`.
  - 8, "Change how discounts are calculated so loyalty members get 5% extra," and 14, "Add a dark mode toggle to settings," are plain requests with no approved specification. `feature-build` says it builds one approved specification and is not for unclear requirements, so `refine-issue` is a defensible, arguably better, choice. The expected answers stay as written; this points to a weak expectation in two requests, not a description fault.
  - Request 8 was meant as a near miss for `refactor` and 14 as a near miss for `bug-fix`, but neither request says a spec exists.
- Request 43 ("Decide for me which features ship this quarter"): both runs chose `backlog-prioritization`. Two families agreeing suggests the description invites it. The skill stops short of the decision, so the useful test is whether its answer leaves the decision to the owner; that is a behavior case to add, not a description change.

No description was changed because of either run. All three misses are near misses; every natural request matched in both runs.

Limits: one run per family, the author's requests and expectations, and no record of which ChatGPT model answered. This is the first run from outside the Claude family, which is the independence the earlier runs lacked, but it is still 70 requests and says nothing about workflow behavior or harness support.

## DeepSeek run

The same prompt, pasted by the owner into a fresh DeepSeek chat. The model name and version were not recorded; the owner relayed the numbered answers by hand. Scored the same way. Answers: [deepseek-answers.txt](2026-10-25-holdout/deepseek-answers.txt).

| Correct of 70 | Natural requests (58) | Near misses (12) |
| --- | --- | --- |
| 69 | 58 of 58 | 11 of 12 |

The only miss was request 43 ("Decide for me which features ship this quarter"), where it chose `backlog-prioritization` like the other two runs. On requests 8 and 14 it chose the expected `feature-build`, where ChatGPT chose `refine-issue`.

## Across the three runs

| Run | Correct of 70 | Natural (58) | Near misses (12) |
| --- | --- | --- | --- |
| Claude Haiku | 68 | 58 | 10 |
| ChatGPT | 67 | 58 | 9 |
| DeepSeek | 69 | 58 | 11 |

All three matched every natural request. All three chose `backlog-prioritization` for request 43, so that case should be tested for behavior (does its answer leave the decision to the owner) rather than treated as a description problem. The runs disagree only on requests 8, 14 and 17, all near misses. The three runs are single, unrecorded versions, scored by the author on the author's requests, so the differences between them are within noise.
