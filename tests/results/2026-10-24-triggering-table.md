# Triggering table, shorter descriptions, 2026-10-24

Model: Claude Sonnet 5.5, the same family that wrote the descriptions and drafted the requests, so this run is not independent. Each run was a fresh subagent that read only a list of skill names with descriptions and the 118 shuffled requests from [the triggering table](../triggering-table.md), and chose one skill or none for each. One run per description set, scored by the author.

Two description sets were compared on the same requests: the descriptions before this change (average 311 characters, 18,380 in total) and the shortened ones (average 210, 12,359 in total).

| Descriptions | Correct of 118 | Missed a should-trigger request | Missed a near miss |
| --- | --- | --- | --- |
| Before (longer) | 113 | 0 | 5 |
| After (shortened) | 113 | 0 | 5 |

Both sets missed the same five rows, so shortening did not change the outcome on this table. Every skill was selected by its own should-trigger request in both sets.

## The five misses

All five were weaknesses in the table, not in the descriptions. They are listed with what was done.

| Row | Problem | Change |
| --- | --- | --- |
| `design-token-and-system-definition` near miss | Expected `none`, but `design-token-implementation` is the right skill | Expected value corrected |
| `interface-state-specification` near miss | Expected `none`, but `interface-state-implementation` is the right skill | Expected value corrected |
| `documentation-pass` near miss | Expected `feature-build` but the request mentioned no approved specification, and `feature-build` requires one | Request now states the approved spec |
| `migration` near miss | Same as above | Request now states the approved spec |
| `design-rationale-writing` near miss | A request for "every size, spacing value, and state" fits token definition as well as state specification | Request reworded to describe states, actions, messages, and exits |

The five rows were revised after seeing the misses, and the five revised requests were then rerun once on the shortened descriptions: all five selected the expected skill. Because the author edited the test after seeing the result, the 113 of 118 above is the score on the table as first written, and a clean score on the revised table has not been measured as a full run.

## Limits

- Single runs, one model family, author-drafted requests and author-judged scoring.
- This tests choosing between descriptions presented side by side. It does not test a real harness, where only some descriptions are loaded, the manual-only skills are hidden from the model, and other skills compete.
- The table has two requests per skill. That is enough to catch a skill that never triggers, not enough to estimate how often a skill is chosen wrongly.
