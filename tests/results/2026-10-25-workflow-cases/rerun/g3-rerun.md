# Goal to Backlog: case "Coverage check fails twice"

Every statement below is marked [S] Supplied (stated in the fixture) or [A] Assumed.

## Stage 1: Frame (Delivery Planner, Problem Framing)

- **Goal sentence:** "Let tenants of a small apartment building book the shared laundry room." [S] The requester is reachable but has not given anything beyond the fixture, so the sentence is unconfirmed. The workflow proceeds and says so here.
- **Who and situation:** tenants of a small apartment building [S] and the building manager [S]. I add no other users.
- **Constraints, preferences, non-goals:** none stated [S]. The non-goals list is "none stated".
- **Success measures:**
  - M1: a tenant can book a slot [S].
  - M2: a tenant can cancel a slot [S].
  - M3: the building manager can see who booked [S].
  - Observation method and baseline are unknown for all three [A, unknown]. I propose none and record them as open questions.
- **Open questions:**
  - Q1: What can the manager see, such as names, units, times, or history? Who can answer: the requester. If this stays unanswered, M3 cannot be sliced into an observable outcome.
  - Q2: How are M1 to M3 observed? Who can answer: the requester.
- **Validation after stage 1:** the goal sentence is marked unconfirmed, which the workflow allows.

## Stage 2: Test the premises (Assumption Mapping)

| # | Assumption | Type | Impact | Evidence | Test or decider |
|---|---|---|---|---|---|
| A1 | The manager's view of bookings has a definable content (Q1). | user | High | None | Decision by the requester. A named answer on what the manager sees confirms it. A continued refusal refutes it for now. |

- A1 is High impact with no evidence, and it would change the epics, so the branching rule applies. Its test goes first.
- Epics that depend on A1 are marked provisional. Their dependent work is listed as "not yet sliced, waiting on the requester's answer to Q1" and no items are drafted.
- Other assumptions, such as that bookings are per slot, are not supplied, so I do not list them.

## Stage 3: Slice the outcomes (Outcome Slicing)

**Epic outline, attempt 1 (the drafted epics, as given):**
- E1, "Tenant books a slot", serves M1. Boundary: booking only.
- E2, "Tenant cancels a slot", serves M2. Boundary: cancelling only.

**Coverage check 1:**

| Measure | Covered by | Result |
|---|---|---|
| M1 | E1 | covered |
| M2 | E2 | covered |
| M3 | none | **uncovered** |

- Validation fails because M3 maps to no epic and is a gap.
- Rule: "return to stage 3 once". This is return 1 to stage 3, with the finding named: "M3 uncovered; no epic delivers the manager seeing who booked."

**Epic outline, attempt 2 (after return 1):**
- E1 and E2 are unchanged.
- E3, "Manager sees who booked", serves M3. Its outcome is stated and its boundary is "what the manager sees: unknown (Q1)". I cannot write an observable first slice without inventing content, so E3 stays provisional with no slices.
- Per the requester's refusal, Q1 is still unanswered.

**Coverage check 2:**

| Measure | Covered by | Result |
|---|---|---|
| M1 | E1 | covered |
| M2 | E2 | covered |
| M3 | none that can be sliced | **still uncovered** |

- Rule: "If it fails again, stop and report the uncovered measures."
- The workflow does not make a third attempt. The cap of two returns to any one stage would permit one more return, but the specific coverage rule overrides it and ends the loop now.

## Stop report

**Stopped at stage 3.** Stages 4 to 7 did not run.

- **Uncovered measure:** M3, the building manager can see who booked.
- **Finding:** two slicing attempts could not cover M3 because its content is undefined (Q1).
- **Decision needed from the requester:** state what the manager can see, or explicitly descope or defer M3.
- **Final output so far:**
  - The problem frame (unconfirmed goal).
  - The assumption register (A1).
  - An epic outline with E1 and E2 covered and E3 provisional and unsliced.
  - M3 reported as a gap.
  - No item set, dependency map, or priority table, because nothing was produced for them.

## Report

- **Stages run:** 1, 2, and 3. Stage 3 ran twice, with a coverage check each time. Stage 3 has two coverage checks, and the workflow cap is two returns per stage.
- **Where it stopped:** after the second failed coverage check, as the branching rule requires. The first failure returned to stage 3 once. The second failure stopped the workflow and reported M3.
- **Not produced:** stages 4 to 7, since the workflow stops. Observation methods and baselines for the measures were not produced because the fixture does not supply them.
- **Assumptions I made:**
  - The goal sentence is unconfirmed, because the fixture gives no requester confirmation.
  - E3 is created in attempt 2 as an empty, provisional epic. The fixture says only that the revised epics still leave M3 uncovered.
  - The coverage rule takes precedence over the general two-returns cap.
  - A1 is the only assumption listed, since the fixture supplies no others.