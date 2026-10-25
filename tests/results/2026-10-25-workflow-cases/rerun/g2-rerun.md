# Goal to Backlog: Goal with no success measure

**Top of result: the requester is unavailable. The goal sentence is UNCONFIRMED, and every dependent statement is labeled Assumed. The workflow stops at a named decision after stage 6 (provisional). No full backlog was drafted.**

## Stage 1: Problem frame
- **Goal (Supplied, Unconfirmed):** "Make onboarding for our recipe-sharing app better."
- **Who and when:** Unknown. Assumed: new users of the app in their first session. Source: Assumed.
- **Constraints:** None stated. **Preferences:** None stated. **Non-goals:** None stated.
- **Success measures:** None supplied. "Better" is an open question, not a measure.

| Candidate measure (not adopted) | How it would be observed | Baseline | Source |
| --- | --- | --- | --- |
| A user-level outcome the requester names | Unknown until named | Unknown | Assumed |

- **Assumptions:** onboarding exists today as a defined flow (Assumed); someone observes some onboarding behavior (Assumed).
- **Open questions:**

| Question | Who can answer | What changes |
| --- | --- | --- |
| What is wrong with onboarding today? | Requester | Which epics exist at all |
| What observable change would count as better? | Requester | Success measures, epics, and ranking |
| Who are the users, and what is a completed onboarding? | Requester | Scope and boundaries |

**Validation:** the goal is marked unconfirmed, which satisfies the check.

## Stage 2: Assumption register

| ID | Assumption | Type | Impact | Evidence | Cheapest way to settle | Confirms | Refutes | Decider |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A1 | A specific, nameable onboarding problem exists | User | High | None: only the word "better" was supplied | Question to the requester | A named problem plus an observable measure | Requester cannot name one, so the goal is a placeholder | Requester |
| A2 | Some onboarding behavior is already observable | Feasibility | High | None | Ask what the app records about first-time use | A named data source | Nothing is recorded, so a baseline would need new work | Requester or owner of the app |
| A3 | Onboarding is the same for all new users | User | Medium | None | Question | One flow | Several flows | Requester |

- **Early work:** A1 first, then A2. A1 would change every epic, so the branching rule applies.
- **Decisions needed:** A1 and A2 (requester).

## Stage 3: Outline of outcomes (provisional)
- **E1 (provisional), Onboarding problem and measure are defined.**
  - Outcome: the requester can state the problem and one observable measure.
  - Boundary: defining only. Changing the app is out.
  - Slice 1: a written problem and measure, end to end.
  - Serves: the missing success measure (a constraint of the plan).
- **Not yet sliced:** every epic that improves onboarding. It waits on the decision from A1 (what "better" means).
- **Coverage check:** FAILS. There are zero confirmed success measures, so none map to an epic. Reported as a gap. The workflow does not return to stage 3, because the cause is missing input and not a slicing error.

## Stage 4: Draft items (early items only)
- **I1, Name the onboarding problem and one observable measure.** Done signal: a written problem statement and a measure with "how observed" and "baseline known or unknown". Size band: S. Owner: requester.
- **I2, Establish what onboarding data already exists.** Done signal: a written list of what is recorded about first-time use, or an explicit statement that nothing is. Size band: S.
- No acceptance criteria or time estimates were added. Validation passes for I1 and I2.

## Stage 5: Dependency map
- I1 and I2 are independent. Build order: either, or both together. I2's results are interpreted against I1's answer.
- External blocker: the requester's input. Owner: requester.
- No cycles.

## Stage 6: Rank (provisional, Backlog Owner)
Criteria that matter now were not supplied. Assumed: unblocking the plan comes first.

| Item | Tier | Reason |
| --- | --- | --- |
| I1 | Now | The whole plan is blocked until it is done. |
| I2 | Now | It is cheap and informs I1. |

- **Close call:** I1 versus I2 order. It has no effect, because they are independent.
- **Decisions for the requester:** (1) What does "better" mean? (2) Who is the user, and what is a completed onboarding? (3) Accept this ranking and the criterion.

## Stage 7
Not run. It is performed by the requester.

## Report
**Stages run:** 1 to 6, all of them reduced in scope. Stage 7 is outside the workflow.

**Where it stopped:** after the early items. The workflow's stop condition applies, because an unevidenced High-impact assumption (A1) would change the whole plan. The only decider is the requester, who is unavailable.

**Not produced:**
- Success measures. None were supplied, and I did not invent any.
- Improvement epics and items. They are listed as not yet sliced, waiting on A1.
- Baselines.

**Assumed:**
- The user set (new users) and the flow's existence.
- The ranking criterion "unblock first".
- That the coverage failure should not trigger a return to stage 3.
- That I1 and I2 count as a legitimate outcome epic, E1.