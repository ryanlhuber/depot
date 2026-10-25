# Goal to Backlog: Risky assumption with no evidence

**Note at top:** The requester is unavailable, so the goal sentence is **unconfirmed**. Criteria are Assumed.

## 1. Problem frame
- Goal (Supplied, unconfirmed): Offer same-day plant delivery in one city.
- Success measure (Supplied): 50 deliveries per week within two months. Observation: weekly delivery count. Baseline: not supplied.
- Users, constraints, non-goals: not supplied. Non-goals: "none stated".
- Open questions:
  - Which city? (requester)
  - Same-day order cutoff? (requester)
  - Who sets the fee? (requester)

## 2. Assumption register
| ID | Assumption | Type | Impact | Evidence | Action |
|---|---|---|---|---|---|
| A1 | Customers pay a delivery fee of at least $6 | user | High | None | Test first |
| A2 | A local courier can pick up before 3 pm | dependency | Low | Weak (one verbal call, no written terms) | No test needed; record the terms |

- A1 test: offer a $6 fee to a real sample of customers. A willingness-to-pay threshold of at least $6 confirms it. Customers refusing at $6 refutes it. The requester must set the threshold and the sample, because neither was supplied.
- Early items: A1 test.

## 3. Epic outline
A1 is High impact with no evidence and would change the epics, because the fee model shapes ordering and fulfilment. The branch rule applies. Dependent epics are **provisional**.
- **E1 Fee viability known** (not provisional). Serves the 50 deliveries/week measure. First slice: the A1 test.
- **E2 Customers order same-day delivery** (provisional, waits on A1).
- **E3 Plants reach customers same day** (provisional, waits on A1 and the unconfirmed city and cutoff). The A2 courier arrangement is the one part not tied to the fee.

Coverage: the 50 deliveries/week measure traces to E1 to E3. No gap.

## 4. Draft item set (nothing drafted for provisional work)
| ID | Title | Done signal | Size | Depends |
|---|---|---|---|---|
| I1 | Test customer acceptance of a $6+ delivery fee | A recorded result shows the share of customers who accept a $6 fee, with the requester's threshold applied | Medium (needs a sample and a method) | None |
| I2 | Record the courier's pickup terms | Written courier confirmation of pickup before 3 pm, with the terms | Small | None |

**Not yet sliced** (decision awaited: A1 result, plus the requester confirming city and cutoff):
- Checkout with delivery fee (E2)
- Order cutoff and time-slot rules (E2)
- Dispatch to courier and delivery confirmation (E3)
- Weekly delivery count reporting (E3)

No acceptance criteria or time estimates were added.

## 5. Dependency map
- I1: none, can start now.
- I2: none, can start now, parallel with I1 (soft link: a courier fee might affect the A1 price point).
- All "not yet sliced" work: hard dependency on the I1 result (reason: the fee model shapes ordering). It is blocked by an external decision.
- External blocker: the I1 threshold and the city and cutoff decisions. Owner: requester.
- Longest hard chain among written items: 1 (no durations supplied, so no critical path).
- Single point of failure: I1. No cycles.

## 6. Priority table (Assumed criteria: risk reduction, then cost of delay; proposal only)
| Item | Value/risk reduction | Effort | Tier | Reason |
|---|---|---|---|---|
| I1 | High: settles the only High-impact, no-evidence assumption | Medium | Now | All provisional work waits on it |
| I2 | Medium: makes A2 verifiable | Small | Now | No prerequisite, cheap, parallel |

Close call: I2 could go to Next if the requester wants to focus on I1 alone. No item ranks above a hard prerequisite.

**Decisions for the requester:**
- Confirm the goal sentence.
- Set the A1 threshold and sample.
- Confirm the city and cutoff.
- Decide what happens to E2 and E3 if A1 is refuted.

Stage 7 belongs to the requester and sits outside this workflow.

## Report
Stages 1 to 6 ran. Stage 7 is the requester's step.

The branch rule fired at stage 2. A1 is High impact with no evidence and would change the epics, so its test is first. E2 and E3 are marked provisional, their dependent work is listed as not yet sliced with the decision it waits on, and no items were drafted for them.

The workflow did not stop or return to any stage. Validations passed:
- The goal is marked unconfirmed.
- Every measure is covered by an epic.
- Both items have a done signal and a size band.
- There are no cycles.
- The external blocker has an owner.
- No item outranks a prerequisite.

I did not read the linked templates. I filled the outputs from the skill descriptions instead.

Assumptions I made:
- Rated A2 evidence as Weak.
- Treated A2 as a dependency-type assumption.
- Wrote I2 as recording the pickup terms.
- Chose the epic structure.
- Chose the ranking criteria.

I could not produce a baseline, a city, an order cutoff or non-goals, because none were supplied.