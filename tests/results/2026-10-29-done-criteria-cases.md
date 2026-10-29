# Done-criteria cases, 2026-10-29

Date: 2026-10-29. Artifact under test: `issue-to-merge` stage 1 (the done-criteria rule, 0.13.0).

Model: fresh Claude Sonnet subagents (the Agent tool's `sonnet` setting; exact version not shown to the session). Same vendor family as the author. Each runner read only a read-only copy of `skills/`, `agents/`, `workflows/`, and `integrations/`, with no `tests/`, changelog, or expected outcomes, and described what it would do and where it would stop; it ran and changed nothing. One run per case per round. The author judged the outputs against the expectations in [the behavioral cases](../behavioral-cases.md).

Limits: single runs, same vendor family as the author, read-only, author-written fixtures and expectations. These runs show the wording is followed and the question fires only when it should; they do not show that asking improves what builders produce. That is untested (see the Kits project, `depot-eval/round2-results-2026-10-29.md`, for the evidence that motivated the change).

Round 1 (first wording, which asked whenever the builder's criteria went beyond the report's literal words): three cases matched, but the regression check "clear defect, documented format" failed. The runner invented criteria (zero-padding, "check other places") and asked about them, which would bring back the unneeded stops that 0.12.0 removed. The rule was narrowed to criteria that change what the fix does beyond the stated behavior and that the report, documentation, and tests do not settle; routine criteria are recorded without asking. That regression check became the case "Routine criteria are not a question". Round 2 ran all four cases on the final text.

| Case | Input | Expected | Actual (round 2) | Verdict |
| --- | --- | --- | --- | --- |
| Done-criteria asked once | `style(fg=0)` ignored; no criteria; related inputs and invalid values plausible | Records definition, risk, path; asks once about criteria that change the fix, with a recommendation; does not build before an answer | Recorded definition, low risk, light same-family path; asked one question (whether `fg=False` becomes black, with a recommendation) bundled with the same-family notice; held the build until an answer or "proceed" | Pass |
| Routine criteria are not a question | Date function returns slashes, docs say hyphens; no criteria | Records routine criteria; no question; goes to the build | Recorded routine criteria and low risk, told the requester, no question, went to the build (would stop only if an existing test asserted the slash format) | Pass |
| Done-criteria already stated | Report with numbered acceptance criteria and a stated low risk | No done-criteria question; records them; goes on | Recorded the four criteria as written, kept the stated risk, asked nothing about criteria; named one conditional question that would arise only if the repository conflicted with criterion 3 | Pass |
| Unconfirmed criteria reach the reviewer | Done-criteria asked; requester unreachable | Criteria marked unconfirmed; reviewer told and still given them | Recorded criteria as its own, marked unconfirmed, told the reviewer, gave it the criteria with the diff | Pass |

Note: in round 1 the "already stated" run stopped for an unrelated reason (it recorded no risk because the criteria change what invalid inputs do on a public function). With a stated risk in the round 2 fixture it did not stop. The risk rule is unchanged by this release.

## Review and re-check

An independent same-family review (Claude Opus, fresh session) of the first version of this change returned FAIL with two Moderate findings, both verified against the files and fixed: stage 1's Assignment line still said to stop only for an open question (now names the done-criteria question), and the question text did not ask the requester to add criteria (now it does, and says the build waits for an answer, "proceed", or an unreachable requester). Minor fixes: the recorded definition marks criteria confirmed or unconfirmed (Validation and stage 5 inputs), and the changelog was corrected. Not fixed, and left to the owner: the final output and merge checklist do not list unconfirmed criteria; the seven 0.12.0 stage 1 cases were not re-run on this text.

After those fixes two cases were re-run once each on the final text: "Done-criteria asked once" with a new fixture (a parameter named `help`), which matched (one question inviting additions, build held, criteria marked unconfirmed on "proceed"); and "Routine criteria are not a question", which matched again (no question, straight to the build). The other two cases were not re-run after the wording-only fixes.
