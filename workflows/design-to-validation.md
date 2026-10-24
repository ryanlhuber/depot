# Design to Validation

## Goal

Take a design or prototype and produce evidence-based, prioritized changes: expert review findings, a test plan that targets the questions review cannot settle, analyzed session results, and recorded decisions. Success means every high-severity finding is either resolved by evidence, scheduled for a stated next step, or recorded as an accepted risk.

## Inputs

- Required: the design or prototype, and the primary user tasks.
- Optional: numbered requirements, personas or scenarios, accessibility standard to apply, design intent and constraints, completed test session notes.
- Assumptions: anything not supported by the inputs is recorded as an assumption, not invented.

## Stages

1. **Expert review**
   - Assignment: [Design Reviewer](../agents/design-reviewer.md), applying [Heuristic Usability Evaluation](../skills/design/heuristic-usability-evaluation/SKILL.md) for usability concerns, [Accessibility Review](../skills/design/accessibility-review/SKILL.md) against the stated standard, and [Visual Design Critique](../skills/design/visual-design-critique/SKILL.md) for hierarchy and consistency. The three reviews are independent and may run in any order; the agent merges their findings.
   - Requires: the design, the primary tasks, and any requirements and design intent.
   - Produces: one prioritized finding list, each finding with its source review, severity, and confidence, and the findings marked as needing validation with users.
2. **Plan validation**
   - Assignment: [Usability Test Planning](../skills/design/usability-test-planning/SKILL.md).
   - Requires: the design, the primary tasks, and the findings from stage 1 that need validation with users.
   - Produces: a test plan whose questions and tasks cover each finding that needs validation.
3. **Run sessions** (performed by people, outside this workflow)
   - Assignment: the research team runs the plan with representative users.
   - Requires: the test plan.
   - Produces: session notes and observations. The workflow pauses here until they are supplied; it does not fabricate session results.
4. **Analyze results**
   - Assignment: [Usability Test Planning](../skills/design/usability-test-planning/SKILL.md), results summary. It owns task-level results because they are judged against the success definitions in the plan: task success, errors, effort, and severity. When the sessions also produced substantial open-ended material, such as interview answers or free comments, add [Research Synthesis](../skills/design/research-synthesis/SKILL.md) to consolidate it into traceable themes before findings are prioritized.
   - Requires: the test plan and session notes recorded per participant per task.
   - Produces: prioritized findings with evidence, confidence, and limitations, and a list of tasks the notes do not cover.
5. **Record decisions**
   - Assignment: [Design Rationale Writing](../skills/design/design-rationale-writing/SKILL.md) for each significant change or accepted risk.
   - Requires: the stage 1 and stage 4 findings and the design intent.
   - Produces: a short rationale per decision covering the problem, options, choice, and evidence.

## Validation

- After stage 2, confirm each finding marked as needing validation is covered by a test question or task, or recorded as deferred with a reason.
- After stage 4, confirm each finding cites the participants and tasks in the session notes that support it.
- After stage 4, confirm every high-severity finding from stage 1 now has direct evidence, a stated next step, or an accepted-risk record.
- On failure: return the uncovered finding IDs to the stage that should cover them.

## Branching and iteration

- If no accessibility standard is stated, name the one applied in the review rather than skipping it.
- If session notes are not available, stop after stage 2 and return the review findings and test plan as the result.
- If session notes cover only some tasks, analyze those, state the number of participants, and list the rest as untested.
- If stage 4 shows a design problem the review missed, record it as a new finding and send it to stage 5.
- Retry a failed validation at most once. Then stop and return the uncovered findings and the decisions still needed.

## Failure behavior

- Recoverable: a finding lacks severity or confidence. Return it to stage 1 and resume.
- Stop or escalate when: the design cannot be reviewed because it is incomplete or inaccessible to the reviewer, or session notes are too thin to support any finding.

## Final output

Return the review findings, the test plan, the results summary if sessions were run, the decision records, and a list of unresolved findings, accepted risks, and limitations.

## Completion criteria

- Every high-severity finding has evidence, a next step, or an accepted-risk record.
- Findings that needed validation are tied to test questions or recorded as deferred.
- No result is reported that session notes do not support.
