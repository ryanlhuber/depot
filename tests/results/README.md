# Behavioral results

This directory records what actually happened when cases from [behavioral-cases.md](../behavioral-cases.md) were run. It is evidence about the skills, not part of them: nothing here is read by a skill, and no skill instruction depends on it. A case with no result here has not been run.

## Rules

- Record only runs that happened. Never fill in a verdict from expectation, from reading the skill, or from a similar run.
- Include failures and partial results, not just passes. A failure is evidence the test can fail.
- Judge outcomes against the expected outcome in the case, not exact wording.
- Record the model name and version, and say how it was run. A run by the same model family that wrote the skill is not independent.
- Where a model cannot be run, mark the case Unexecuted and leave it out of the results.

## How to run a case

1. Open a fresh session with no earlier conversation. Give the runner only the skill, agent, or workflow named in the case (and the files it links), plus the case input. Make the run read-only.
2. For a triggering case, give the runner only the skill names and descriptions and the request, and ask which single skill it would use or whether none applies.
3. Save the full output, or note where it is kept. Compare it with the expected outcome and decide the verdict.
4. Add a row to a dated results file named `YYYY-MM-DD-<label>.md` using the format below. If a failure leads to a change, record the rerun as its own row.

## Format

Each results file starts with the date, the model and version, how the cases were run, and the limits of the run. Then one table:

| Column | Content |
| --- | --- |
| Case | The case name from `behavioral-cases.md`, or the triggering number |
| Artifact | The skill, agent, or workflow under test |
| Kind | `output` (what it produced), `trigger` (should be chosen), or `no-trigger` (should not be chosen) |
| Input | The fixture given, or where it is described |
| Expected | The expected outcome from the case |
| Actual | What happened, briefly, with the output location if saved |
| Verdict | `Pass`, `Fail`, or `Partial` |
| Reason | Why, in terms of the expected outcome |

Results files:

- [2026-10-24 initial run](2026-10-24-initial-run.md)
- [2026-10-24 install check](2026-10-24-install-check.md) (owner-reported install, not a model run)
- [2026-10-24 workflows run](2026-10-24-workflows-run.md)
- [2026-10-24 triggering table](2026-10-24-triggering-table.md) (all 59 skills, before and after shortening descriptions)
