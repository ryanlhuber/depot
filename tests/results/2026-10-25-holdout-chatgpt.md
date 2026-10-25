# Triggering holdout, ChatGPT run, 2026-10-25

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
