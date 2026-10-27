# Stage 1 cases, 2026-10-27

Date: 2026-10-27. Artifact under test: `issue-to-merge` stage 1 and its review-path rule, for 0.12.0 (a clear defect proceeds; the builder records risk and path; real open questions stop).

Model: fresh Claude Sonnet subagents (the Agent tool's `sonnet` setting; the exact version was not shown to the session), the same vendor family as the author, so these runs are not independent. Each runner read only a copy of `skills/`, `agents/`, `workflows/`, and `integrations/` made from the branch, with no `tests/`, changelog, or expected outcomes, and was told not to write or change anything. Runners described what they would do and where they would stop; they did not change files or run checks. One run per case per round, except the first case in round 2 (three runs). The author judged the outputs against [the behavioral cases](../behavioral-cases.md). The raw outputs were not saved; this file records the author's reading of them.

Limits: single runs, same family as the author, read-only, and the author wrote both the fixtures and the expectations. The fixtures are short and clear-cut. They show the rule can be followed and the stops are found, not how it behaves on a real change. In the pilot of five real defects (see below), the stage 1 behavior varied between runs, which these case runs may not show.

Why this change: a pilot run of the workflow on five real defects found inconsistent behavior at stage 1 (two builders stopped to ask for approval, two went on, one built first and asked afterward), because skipping Refine Issue left no rule for who records the risk that sets the path. The pilot used single runs, Claude builders and reviewers, and tasks the author chose.

## Round 1 (commit `1f40408`)

Five of six cases matched. One failed: "Clear defect, Refine Issue skipped, no risk given" (a date-formatting defect whose documentation states the expected output). The runner recorded high risk ("arguably a breaking public interface"), moved to the standard path, and stopped for the missing families. The expected outcome was low or medium risk and no stop. A near-identical case ("Question the repository already answers", a number-parsing fix) recorded low risk in the same round, so the rule left the "breaking public interface" boundary ambiguous. The fix was to state in the workflow that a fix that makes the code match behavior its documentation already states is not, by itself, a breaking change to a public interface. That makes the rule more permissive on this point, and it is a decision the owner can reverse.

## Round 2 (commit `e600418`, after the review fixes and that clarification)

| Case | Input | Expected | Actual | Verdict |
| --- | --- | --- | --- | --- |
| Clear defect, Refine Issue skipped, no risk given (3 runs) | Date-formatting defect, expected output stated and documented, test command and branch recorded, no risk level, only the builder's family reachable | No approval stop; records expected behavior, criteria, low or medium risk with a reason, and the light path as same-family with the reason "no other family reachable"; tells the requester; builds | All three runs recorded low risk citing the new clarification, recorded the light path and same-family reason, told the requester, and did not stop (each noted it would ask if an existing test asserted the old output) | Pass (3 of 3). The runs quoted the added sentence, so the pass depends on it |
| Clear defect that touches a high-risk area | Fix changes who may download a file; no risk given | High risk, standard path, stops for missing families | Recorded high with the reason, chose the standard path, stopped for the missing families, offered three options including the requester explicitly lowering the risk | Pass |
| Real open question on a defect | Two reasonable behaviors; one needs an existing test changed | Stops once with options and a recommendation | Stopped once, gave both options and a recommendation, did not edit the test | Pass |
| Question the repository already answers | Number-parsing defect; branch, commands, conventions recorded | No questions; records and goes on | Listed no questions, recorded low risk and the light path, read the environment from the repository | Pass |
| Review finds the recorded risk too low | Light-path defect, passing review that says a credential check changed | Risk becomes high; light review does not carry over; standard path on the current revision; stops for families; human approval applies | Did all of those and quoted the rule | Pass |
| Risk is not lowered (changed) | Builder cannot say whether the fix touches an authorization check | Standard path; no low risk recorded without a reason | Recorded no risk with the reason "cannot yet tell", used the standard path, stopped and asked | Pass |
| Stated risk is kept | Report says medium risk and asks to skip the standard path; builder thinks it is low | Keeps medium; light path; builder says its view and leaves the decision | Recorded medium, light path, said it thinks low but may not go below the stated risk, proceeded. This run was interrupted by a usage limit and resumed once | Pass |

Not tested: a requester raising the risk after a light-path review, and a requester lowering a builder-recorded risk. Both are described in the rule but have no case.
