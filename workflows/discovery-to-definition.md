# Discovery to Definition

## Goal

Turn a vague interface brief into a traceable definition that design can start from: numbered requirements, grounded user context, a view of established solutions, mapped task flows, and a content structure. Success means every requirement is addressed by the definition or explicitly listed as unaddressed, and every open question names the decision it blocks.

## Inputs

- Required: the brief or request describing the desired interface or outcome.
- Optional: user research material (notes, interview or survey summaries, analytics, support themes), products or examples to compare, a content and function inventory, platform and business constraints.
- Assumptions: any item not supported by the inputs is recorded as an assumption or open question, never invented.

## Stages

1. **Define requirements**
   - Assignment: [Define Requirements](../skills/ux/define-requirements/SKILL.md) to make the brief precise.
   - Requires: the brief and any constraints.
   - Produces: numbered requirements, constraints, assumptions, open questions, and non-goals.
2. **Ground users and survey solutions** (independent; run in either order)
   - Assignment: [Draft Personas](../skills/ux/draft-personas/SKILL.md) for users and situations, and [Compare Patterns](../skills/ux/compare-patterns/SKILL.md) for established solutions to the core problem.
   - Requires: the requirements set, plus user research material for personas and comparison targets or selection criteria for the analysis.
   - Produces: sourced personas and scenarios with research gaps, and named patterns with tradeoffs and limitations.
3. **Map task flows**
   - Assignment: [Map User Flow](../skills/ux/map-user-flow/SKILL.md) for each primary user goal.
   - Requires: requirement IDs for the goal, the scenarios that describe it, and the pattern options that apply.
   - Produces: ordered flows with branches and failure paths, friction points, and unresolved questions.
4. **Structure content and navigation**
   - Assignment: [Design Navigation](../skills/ux/design-navigation/SKILL.md).
   - Requires: the content and function inventory and the primary tasks drawn from the mapped flows.
   - Produces: hierarchy, navigation mechanisms, labels with rationale, and task-path traces.

## Validation

- After stage 4, trace each numbered requirement to at least one flow step or placement in the structure, using the stage outputs as evidence.
- Confirm every assumption and open question is carried forward with the decision it blocks.
- On failure: return the unaddressed requirement IDs to the stage that should cover them, with the finding.

## Branching and iteration

- If no user research material exists, skip personas and carry forward the assumptions-and-research-needs list that Draft Personas returns instead.
- If no comparison targets or selection criteria exist, skip the competitive analysis and record the gap.
- If the scope is a single flow with no content inventory, skip stage 4.
- Retry a failed validation at most once. If requirements are still unaddressed, stop and return a partial result.

## Failure behavior

- Recoverable: a requirement is untestable or conflicting. Return to stage 1 with the specific items and resume.
- Stop or escalate when: a blocking open question needs a stakeholder decision, or the brief cannot be turned into testable requirements without information that was not supplied.

## Final output

Return the requirements set, the user and solution findings (or the research-needs list), the task flows, the structure, the traceability result, and all assumptions, open questions, and unaddressed requirements.

## Completion criteria

- Every requirement is traced to the definition or listed as unaddressed with a reason.
- Every flow and structure decision that rests on an assumption says so.
- All open questions are recorded with the decisions they block.
- Skipped stages are named with the reason.
