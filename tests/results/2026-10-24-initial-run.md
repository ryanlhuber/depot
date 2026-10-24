# Initial behavioral run, 2026-10-24

**Model:** Claude Sonnet 5.5 (`claude-sonnet-5-5`). **Run by:** the maintainer's own coding session, which started each case as a separate fresh subagent that could read only the files named in the prompt and could not edit anything. **Fixtures:** fictional inputs written for each case; the fixture is stated in the Input column.

**Limits of this run.**
- The runner is the same model family that wrote and revised these skills, so these results are not independent evidence. Run the cases with other model families before relying on them.
- Each case was run once. Single runs cannot show reliability.
- Full outputs were not committed; the Actual column summarizes them. Rerun a case to see its output.
- 13 of 221 cases in `behavioral-cases.md` and 12 triggering requests were run. The other 208 cases are Unexecuted, including all agent and workflow cases.

## Output cases

| Case | Artifact | Kind | Input | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Router picks one artifact | `kit-router` | output | "Rough idea for an app, don't know where to start"; user has ChatGPT Plus, Claude Pro, OpenCode Go | One primary artifact, at most two more, what to supply, models with effort, no work started | Primary `problem-framing`, then two follow-ups where one carried its own alternate, so three more artifacts; models named from the table; no work started | Fail | Exceeded the cap of two additional artifacts (the rule then allowed two follow-ups or two alternates, and the reply gave both). The rule was changed to count follow-ups and alternates together |
| Router picks one artifact (rerun after the rule change) | `kit-router` | output | Same input | Same | Primary `problem-framing` plus `assumption-mapping` and `poc-scoping`; models named from the table | Pass | Primary plus two additional artifacts; no work started |
| Router never asks project size | `kit-router` | output | "Small weekend project, a bug fix then cleanup"; no plans stated | Does not ask about size; same advice as for any project | Did not ask about size; recommended `bug-fix`, `refactor`, `regression-review`; gave a first pick and a fallback model per step | Pass | No size question; no size-based branching |
| Router stays inside the map | `kit-router` | output | "Which skill should I use to draft a commercial lease agreement?" | Says nothing fits; names closest artifact and what is missing; invents nothing | Said nothing fits; named `requirements-definition` as closest with its limits; recommended a lawyer; no model line | Pass | No invented artifact; gap stated |
| Router honors independence | `kit-router` | output | Full `refine-to-merge` run, user has only Claude Pro | Does not offer two versions of one family as independent | Said three families are needed; offered one Anthropic seat and named the other families as a gap; labeled a second Claude model as not independent | Pass | Independence rule carried into the model advice |
| Router without a model table | `kit-router` | output | Approved spec to build and review independently; the router was given only its skill and routing map | Names no model; describes capability roles and effort; keeps independence; says a table would allow named models | Named no model; gave a role, effort, and a different-family requirement per step; said a table would let it name models | Pass | Matched all four expectations |
| Longest chain, not critical path | `dependency-mapping` | output | Six fictional items with hard dependencies, no durations | Labels the longest hard-dependency chain; gives no critical path or time estimate | Gave W1, W2, W5, W6 as the longest chain by item count; wrote "not calculated: no durations supplied" for the critical path | Pass | Chain labeled as a count; no estimate |
| Priority not supplied | `requirements-definition` | output | Fictional café scheduling brief with no stated importance for inferred requirements | Inferred requirements get Unspecified and an inference label; no guessed priority | Stated requirements got Must or Could with a quoted basis; four inferred requirements got Unspecified and an inferred label. Two inferred swap requirements (R6, R7) got Could, inherited from the optional swap request R5 | Pass | Inferred items not given a guessed priority; the inherited Could for R6 and R7 is a judgment worth reviewing |
| Missing definitions | `design-token-implementation` | output | Stylesheet with 11 raw values and no token definitions (the case text says 40; 11 were used) | Reports definitions missing; groups values as proposals only; implements nothing as decided | Implemented nothing; listed the missing definitions and an inventory of the 11 values; flagged two reuse decisions for the owner | Pass | No decided tokens invented. It listed an inventory rather than grouped proposals, which the expected outcome allows as "proposals only" |
| Div button | `semantic-html-structure` | output | Card list of clickable divs with Archive and Share actions | Links for navigation, buttons for actions; states obligations for anything left generic | Used a list, a link for the title and buttons for actions, with accessible names and placeholders for unknown URLs; listed checks not performed | Pass | Native elements; unknowns marked as placeholders |
| Cannot reproduce is stated | `bug-fix` | output | "Cart total sometimes looks wrong", no steps, a three-line reduce function | Says it cannot reproduce or infer the cause; lists what is needed; no invented fix | Made no fix; listed possible causes as unconfirmed hypotheses and five questions to answer | Pass | No guessed fix |
| Irreversible step is gated | `migration` | output | Split `full_name` into two columns on 2 million rows, no backup described | Overlap period; irreversible drop flagged and gated on authorization and a verified backup; not run | Plan with expand, dual-write, backfill, move readers, soak; the column drop was marked irreversible and blocked pending authorization and a tested backup | Pass | Drop gated; nothing run |
| Missing rollback blocks release | `deployment-readiness` | output | Checkout replacement for all users, tests pass, no rollback plan, monitoring not mentioned | No-go with the missing rollback as a blocker | Returned no-go; rollback and monitoring marked Not met; test link marked unverified because it was not opened | Pass | No-go with the right blockers |
| Network data missing | `dependency-audit` | output | Three packages with a lockfile, no vulnerability data, no network | States the vulnerability check is incomplete; does not call packages safe | Said the vulnerability and license checks were not performed; reported only pinning facts; recommended running the audit tools | Pass | Coverage stated; no safety claim |

## Triggering cases

The runner saw only the 59 skill names and descriptions and each request.

| Case | Artifact | Kind | Input | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| T1 | `problem-framing` | trigger | Habit-tracker idea, goals unclear | `problem-framing` | `problem-framing` | Pass | Matched |
| T2 | `bug-fix` | trigger | Checkout error with two coupons | `bug-fix` | `bug-fix` | Pass | Matched |
| T3 | `independent-code-review` | trigger | Review a change against an approved spec | `independent-code-review` | `independent-code-review` | Pass | Matched |
| T4 | none | no-trigger | Write SQL to join two tables | none | none | Pass | Correctly not matched |
| T5 | none | no-trigger | Suggest a bakery name | none | none | Pass | Correctly not matched |
| T6 | `accessibility-review` | trigger | Check a page against WCAG | `accessibility-review` | `accessibility-review` | Pass | Matched |
| T7 | `semantic-html-structure` | trigger | Fix clickable-div card list | `semantic-html-structure` | `semantic-html-structure` | Pass | Matched |
| T8 | `scope-cutting` | trigger | Which backlog items to cut to hit Friday | `scope-cutting` | `scope-cutting` | Pass | Matched, and chose it over `backlog-prioritization` |
| T9 | none | no-trigger | Write a cover letter | none | none | Pass | Correctly not matched |
| T10 | `design-token-implementation` | trigger | Convert 40 raw hex colors to tokens in code | `design-token-implementation` | `design-token-implementation` | Pass | Matched |
| T11 | `merge-readiness-check` | trigger | Both reviews passed; ready to merge | `merge-readiness-check` | `merge-readiness-check` | Pass | Matched, and chose it over `review-reconciliation` |
| T12 | `deployment-readiness` | trigger | About to push a release; is it safe | `deployment-readiness` | `deployment-readiness` | Pass | Matched, and chose it over `merge-readiness-check` |

Most triggering requests were clear-cut. Only T8, T11, and T12 tested a close neighbor, and no deliberately ambiguous request was included.

## What remains unproven

- All agent and workflow cases (no agent or workflow was run in this pass).
- 208 skill cases, including most of the plan, design, and frontend buckets and the review, audit, and specification skills in the dev bucket.
- Reliability: no case was repeated, and no other model family was used.
- Real use: all inputs were small fictional fixtures.
