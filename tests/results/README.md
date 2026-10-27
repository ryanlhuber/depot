# Behavioral results

This directory records what actually happened when cases from [behavioral-cases.md](../behavioral-cases.md) were run. It is evidence about the skills, not part of them: nothing here is read by a skill, and no skill instruction depends on it. A case with no result here has not been run.

## What is and is not shown

Read this before the results files. It summarizes them; where it and a results file disagree, the results file is right.

- **Shown, with limits:** choosing the right skill from its name and description. The 70-request holdout was run on Claude Haiku before and after the renames and once on each of five other model families, with author-written requests and answers. The skill sets were also checked after the renames.
- **Shown, with limits:** that workflows and agents stop where they should and follow their stage rules. The 26 workflow cases and the review-path cases were run once each by Claude subagents, the same family that wrote the skills, read-only, judged by the author against fixtures the author wrote.
- **Shown, narrowly:** that the delivery workflow can be followed on real code. One scratch repository, a 25-line library with one seeded defect, same-family builder and reviewers, the independence rule waived on purpose. It shows the mechanics, not reliability on a real project.
- **Not shown:** that depot improves output quality, completion rate, time, or cost compared with no depot. No baseline run exists. [The evaluation plan](../evaluation-plan.md) describes how to measure it.
- **Not shown:** that a different-family reviewer catches more than a same-family one. No run compares them; the scratch run used one family throughout.
- **Not shown:** that the light review path is as safe as the standard path. The only evidence is the single scratch run above, where one reviewer reached the same verdicts as two.
- **Not run:** cases added after the last results file. A case with no row here has not been run, and the [changelog](../../CHANGELOG.md) entry that added or changed it says so.

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
- [2026-10-25 merge consolidation](2026-10-25-merge-consolidation.md) (18 triggering rows near the merged skills)
- [2026-10-25 conventions setup](2026-10-25-conventions-setup.md) (target branch and runtime cases)
- [2026-10-25 workflow cases](2026-10-25-workflow-cases.md) (26 cases across all 8 workflows: 24 pass, 2 partial)
- [2026-10-25 review path cases](2026-10-25-review-path-cases.md) (5 cases for the light and standard review paths: 5 pass)
- [2026-10-25 holdout](2026-10-25-holdout.md) (70 untouched triggering requests: 68 correct)
- [2026-10-25 holdout, five other model families](2026-10-25-holdout-chatgpt.md) (same 70 requests; ChatGPT, DeepSeek, Gemini and Muse Spark: 67, 69, 67 and 67 correct; Grok 70 with its search setting unconfirmed; all 58 natural requests in each)
- [2026-10-25 real run](2026-10-25-real-run.md) (scratch repository, real code and tests, light and standard review on a correct and a flawed fix)
- [2026-10-25 router UX and UI cases](2026-10-25-router-ux-ui-cases.md) (3 router cases added with the bucket split: 3 pass)
- [2026-10-26 router cases after the rename](2026-10-26-rename-router-cases.md) (the same 3 router cases against the 0.9.0 names: 3 pass)
- [2026-10-26 holdout after the rename](2026-10-26-rename-holdout.md) (same 70 requests, new names, one Claude Haiku run: 66 correct in three runs, two new near misses that repeat)
- [2026-10-27 same-family light-path cases](2026-10-27-same-family-cases.md) (8 cases for the 0.11.0 independence change, one Claude Sonnet run each after the review fixes: 8 pass; an earlier round of the first six also passed; same family as the author, read-only, author-written fixtures)
- [2026-10-27 independent review of PR 29](2026-10-27-pr29-review.md) (Claude Opus 5.5, a same-family review: PASS with six Minor findings, all fixed)
- [2026-10-27 trigger cases after the 0.10.0 rename](2026-10-27-naming-cases.md) (20 requests for the two renamed skills and their neighbors, three Haiku runs: 20, 20, and 19 correct; both renamed skills chosen every time, one miss on a no-skill request)
