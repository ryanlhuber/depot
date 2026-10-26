# Spec to UI

## Goal

Turn an approved interface specification into working front-end code that matches it, and prove the match. Success means the build satisfies the structure, states, responsive behavior, and token usage the specification defines, differences from the specification are listed, and open specification gaps were resolved by a person rather than guessed.

## Inputs

- Required: the specification material (a decision document, requirements, state and behavior specifications, layout plans, token definitions, copy) and the codebase it will be built in.
- Optional: an existing component set, a defined accessibility standard, and target viewports and input modes.
- Assumptions: the design decisions are made upstream. This workflow implements them and does not redesign. Framework or styling-tool choices belong to the project, not to this workflow.

## Stages

1. **Read the specification**
   - Assignment: [Check Design Handoff](../skills/frontend/check-design-handoff/SKILL.md).
   - Requires: the specification material.
   - Produces: what is decided, proposed, open, conflicting, or missing, and what can be built now.
2. **Resolve gaps** (performed by the specification owner)
   - Assignment: the owner decides the open, conflicting, or missing items that block the build. Items that do not block it are carried as noted assumptions.
   - Requires: the intake report.
   - Produces: decisions recorded against the specification. The workflow does not proceed on a guess for a blocking item.
3. **Structure**
   - Assignment: [Write Semantic HTML](../skills/frontend/write-semantic-html/SKILL.md).
   - Requires: the specification and the resolved decisions.
   - Produces: markup with landmarks, headings, native elements, and accessible names.
4. **Component interface**
   - Assignment: [Design Component API](../skills/frontend/design-component-api/SKILL.md), only for a component that will be shared. One-off parts skip this stage.
   - Requires: the markup and the intended uses.
   - Produces: the component's inputs, events, state ownership, and accessibility contract.
5. **States**
   - Assignment: [Implement Interface States](../skills/frontend/implement-interface-states/SKILL.md), from the state specification.
   - Requires: the markup and the state specification, and the component interface when stage 4 ran.
   - Produces: each specified state implemented, announced, recoverable, and demonstrable.
6. **Responsive behavior**
   - Assignment: [Implement Responsive Layout](../skills/frontend/implement-responsive-layout/SKILL.md), from the layout plan.
   - Requires: the markup and the layout plan.
   - Produces: layout that holds at the defined viewports, zoom, and text sizes, with the verification performed.
7. **Tokens**
   - Assignment: [Implement Design Tokens](../skills/frontend/implement-design-tokens/SKILL.md), from the token definitions.
   - Requires: the build and the token definitions.
   - Produces: one source of values used by the components, and a repeatable check that raw values are not used.
8. **Check against the specification**
   - Assignment: [Review UI Fidelity](../skills/ui/review-ui-fidelity/SKILL.md), performed by someone other than the stage 3 to 7 implementer when possible.
   - Requires: the build, the specification, and the resolved decisions.
   - Produces: mismatches in layout, visual values, content, states, and behavior, each with severity.

## Validation

- After stage 1, confirm every blocking item has an owner.
- Before stage 3, confirm any value the build needs that the specification does not give (a breakpoint, a token name, a size) is listed as proposed and, if it affects appearance or behavior, decided at stage 2. A value used before that is labeled proposed in the output.
- After stages 3 to 7, confirm the build runs and the checks the stage names were actually performed.
- After stage 8, confirm every mismatch is fixed, accepted by the specification owner, or recorded as a deviation.

## Branching and iteration

- If stage 3, 5, 6, or 7 finds the specification contradicts itself, return that item to stage 2.
- Stages 5, 6, and 7 depend on stage 3 and may run in any order after it; run them in the order that least changes earlier work.
- Fix stage 8 mismatches in the stage that owns them and re-check only what changed. At most two rounds, then escalate the unresolved mismatches to the specification owner.

## Failure behavior

- Recoverable: a state, viewport, or token is missing from the specification. Return it to stage 2.
- Stop or escalate when: the specification cannot be obtained or is too incomplete to build from, or the owner is unavailable for a blocking decision. Do not invent design values, copy, or behavior.

## Final output

Return the intake report, the decisions made at stage 2, the implementation and the checks performed, the stage 8 mismatch list with its resolution, and any deviations and accepted risks.

## Completion criteria

- Every specified state, viewport, and token is implemented or listed as a deviation.
- No design value was invented; each traces to the specification or to a recorded decision.
- Stage 8 found no unresolved mismatch above the severity the owner accepts.
