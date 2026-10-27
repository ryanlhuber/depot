# Independent review of the stage 1 change (0.12.0), 2026-10-27

**Reviewer:** Claude Opus 5.5, a fresh session, same family as the builder (a same-family review). It did not see the builder's context. **Revision reviewed:** `1f40408`, one commit on `fd1caa6`. **Verdict:** FAIL, two Moderate and four Minor findings. Findings were checked against the files before being accepted; all six were accurate.

| ID | Severity | Finding | Disposition (fixed in `e600418`) |
| --- | --- | --- | --- |
| R1 | Moderate | The reviewer's "risk too low" check had no defined effect when the review passed: "moves to the standard path from the next review on" was copied from the repair rule, and a light-path pass has no next review | Fixed: a too-low finding, or a requester raising the risk after a light review, raises the recorded risk to high; the light review does not carry over; the standard-path reviews run on the current revision; stop if a family is missing; human approval applies. The builder also re-checks the risk against the diff before stage 5 |
| R2 | Moderate | No behavioral-case results were recorded | Fixed: see [the case results](2026-10-27-stage1-cases.md) |
| R3 | Minor | "Requester may correct it" conflicted with "never lower it" | Fixed: the requester may raise the risk or lower one the builder recorded; the builder never records below a stated risk; the workflow never lowers a risk on its own |
| R4 | Minor | "Approved specification" wording remained at stages 2 and 3 on the skip path | Fixed: both now say "or the recorded definition". The summaries in `README.md` and `workflows/README.md` were left as they were |
| R5 | Minor | Case 272 did not say the environment was recorded, so a correct run could stop at stage 2 | Fixed: the fixture now says the test command and target branch are recorded |
| R6 | Minor | No case covered a stated risk the builder thinks is lower | Fixed: "Stated risk is kept" added |

The reviewer's view on the loophole question: a builder-recorded risk is a real loosening, kept fairly tight by the closed high-risk list, "plainly touches none", and "cannot tell means standard path", but its safeguard needed R1 fixed. Not verified by the reviewer: the pilot claim in the changelog. Not run: behavioral cases, any cross-family check. The report text was not saved in full.
