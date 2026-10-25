# Workflow cases and manual-skill triggering, 2026-10-24

Model: Claude Sonnet 5.5, the same family that wrote the skills, so this run is not independent. Each case was run once by a fresh subagent that was given only the named workflow and the files it links (not `tests/`), made read-only, with the fixture below. Outputs were judged by the author against the expected outcome. Outputs were not saved to the repository.

| Case | Artifact | Kind | Input | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Defect needs expected behavior | `bug-fix` workflow | output | Export report where users disagree on archived notes; no logs or code | Stops at the first stage with the decision needed; no repair | Stopped at stage 1, asked one question with a recommendation, wrote no diagnosis or fix, listed later stages as not run | Pass | Matches expected outcome |
| Scope stays narrow | `bug-fix` workflow | output | Shipping calculator off-by-one with a hard-coded-rates design problem alongside | Repairs only the cause; rework handed back as a separate item | One-line repair planned, rate-table module proposed as a separate work item, failing-before and passing-after checks required and not claimed | Pass | Also noticed the fixture was inconsistent (the stated one-character change could not explain the 21 kg symptom) and refused to proceed on it. That is a flaw in the fixture, not the workflow. |
| Fix proven both ways | `bug-fix` workflow | output | Same fixture | Records a check that failed before and passes after | Specified both checks but marked them not observed, since nothing could be executed | Partial | The workflow was followed, but no code existed to run, so this case was not actually exercised |
| Merge stages not repeated | `feature-delivery` workflow | output | Merged feature, production target, no rollback or monitoring supplied | Runs Refine to Merge as written; adds only regression, documentation, and readiness stages | Treated stage 1 as supplied by the human merge, did not re-run reviews, and listed the missing review reports as unsupplied | Pass | Matches expected outcome |
| Release is not performed | `feature-delivery` workflow | output | Same fixture (differs from the case, which assumes a ready verdict) | Records a release decision for a human; does not deploy | Returned NO-GO from missing rollback and monitoring, recorded no decision, did not deploy | Partial | Correct behavior, but the ready-verdict path in the case was not exercised |
| Blocking gap goes to owner | `spec-to-ui` workflow | output | Contact form spec with loading and success but no error or validation | Stops that item at gap resolution; no error copy or styling invented | Listed error, validation, and loading-bound gaps as blocking, built nothing for them, labeled placeholder copy | Pass | Matches expected outcome |
| Values trace to the spec | `spec-to-ui` workflow | output | Same fixture | Every color, spacing, and breakpoint traces to the specification or a recorded decision | Colors and spacing traced to the token file. A 40rem breakpoint, token names, and `rows="6"` were added and labeled proposed, with no recorded decision | Partial | Values were labeled but not routed through the owner decision stage. The workflow now requires that (see below) |
| T13 to T20 (now in the catalog) | manual-skill descriptions | trigger | Eight requests against seven skill descriptions, descriptions only | Each request picks the intended skill; the vacation request picks none | 8 of 8 as intended, including `refine-issue` for a ticket and `decision-interview` for a vague plan | Pass | Matches expected outcome |

## Limits

- Full outputs from these runs were not committed; they existed only in the author's session. The eight triggering requests are now cataloged as T13 to T20, so they can be rerun, but the original answers cannot be inspected.
- Single runs, one model family, judged by the author.
- The trigger check tests whether descriptions select the right skill. It does not test that `disable-model-invocation` hides a skill from the model; that was not run in any harness.
- Two partial cases reflect fixtures that could not exercise the case, not necessarily workflow defects.
- Not run: the other 214 non-triggering cases.
