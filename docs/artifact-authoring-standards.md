# Artifact Authoring Standards

This document is the canonical authoring reference for depot Skills, Agents, and Workflows. Use the [`core artifact architecture`](core-artifact-architecture.md) to classify artifacts and the [`portability and integration boundaries`](portability-and-integration-boundaries.md) to place portable and environment-specific behavior. This guide applies those references; it does not redefine them.

The templates below are flexible scaffolds, not schemas. Authors may merge, rename, reorder, or omit sections when that improves execution and preserves the information needed for reliable use. Section presence and order are not compliance requirements. Quality depends on whether the artifact communicates the necessary scope, behavior, inputs, outputs, constraints, checks, and completion conditions in its context.

## Shared standards

### Write for execution

- Write instructions an AI can act on, not an essay about the topic.
- Prefer ordered procedures, decision rules, constraints, checks, and acceptance criteria to background prose.
- Mark required behavior clearly; label recommendations and examples as optional or illustrative.
- State required and optional inputs, assumptions, and unresolved dependencies. Do not rely on hidden conversational or ambient context.
- Define the returned result and separate it from completion criteria: **output** describes what is returned; **completion criteria** describe the observable state that proves the work is done.
- Reference instructions owned by another artifact instead of repeating them.

### Keep scope coherent and composable

- Give each artifact one coherent responsibility and choose the smallest artifact type that fully owns it.
- Put focused expertise in Skills, durable responsibility and decisions in Agents, and orchestration in Workflows.
- Reference each dependency by purpose and expected contribution. Keep dependencies replaceable and never create circular references.
- Split independent parts when they are reusable or change for different reasons. Do not split merely to add layers or links.
- Expose unresolved dependencies and the behavior for missing required input; do not invent information needed for correctness.

### Preserve portability

Apply the canonical [portability boundary](portability-and-integration-boundaries.md):

- Express portable requirements as capabilities, standards, behavior, constraints, and expected outcomes.
- Keep provider-, model-, harness-, design-tool-, framework-, library-, command-, API-, schema-, and file-format-specific behavior outside portable core artifacts.
- Use named technologies only as clearly replaceable, non-normative examples.
- If an artifact is intentionally technology-specific, identify that scope and the portable requirement or integration contract it implements.
- Treat replacement as a test: changing the surrounding capable environment must not change the artifact's intent.

### Be precise and concise

- Use direct language and concrete verbs. Define a term only when its meaning is not already canonical.
- Include an example only when it clarifies a decision, boundary, input, or output.
- Remove motivational prose, duplicated context, exhaustive edge-case catalogs, and sections that do not change execution.
- Keep Skills near 80–120 lines when practical. This is a compression target, not a quota or hard limit.
- Never remove necessary safety, accessibility, validation, failure, or escalation behavior to meet a length target.

## Skill authoring

A Skill teaches how to perform one focused kind of work well. Keep its method reusable across roles and Workflows.

- **Purpose:** Name the focused capability and intended result.
- **When to use:** Give triggering situations and meaningful exclusions.
- **Inputs:** Identify required and optional context, artifacts, constraints, and assumptions.
- **Process:** Give the smallest reliable sequence that produces the result.
- **Rules or heuristics:** State decisions requiring judgment. Distinguish evidence-based requirements and standards from recommendations or aesthetic preferences.
- **Checks:** Specify verification performed before returning, including relevant safety, accessibility, and failure checks.
- **Output:** Define the result, its useful structure, and evidence or caveats to include.
- **Completion criteria:** State observable conditions that show the focused work—not a larger delivery—is done.

Do not let a Skill route work among Agents, coordinate stages or handoffs, or decide which other artifacts to invoke. Do not bury reusable expertise in an example. Include failure or escalation behavior only when it is part of performing this capability.

### Skill starter template

```markdown
# <Focused capability>

## Purpose
<State the capability and result in one or two sentences.>

## When to use
- Use when: <observable trigger>.
- Do not use when: <meaningful exclusion>. <!-- Conditional: omit if no exclusion matters. -->

## Inputs
- Required: <context, artifact, or constraint needed for correctness>.
- Optional: <input that improves the result but is not required>. <!-- Conditional -->
- Assumptions: <assumption to confirm or expose>. <!-- Conditional -->

## Process
1. <First concrete action.>
2. <Next action or decision, including required failure behavior.>
3. <Prepare the result.>

## Rules and heuristics
- Required: <standard, constraint, or evidence-based rule>.
- Recommended: <judgment rule and when to depart from it>. <!-- Conditional -->

## Checks
- Verify <observable property> using <evidence or comparison>.
- If <check fails>, <correct, report, or escalate within this capability>.

## Output
Return <result and structure>, including <evidence, caveats, or unresolved items>.

## Completion criteria
- <Observable condition proving the work is complete.>
- <All required checks pass, or failures are explicitly reported as specified.>
```

## Agent authoring

An Agent owns a reusable specialist responsibility and applies Skills. Introduce one only when durable responsibility, decision ownership, or reusable specialization adds value; use a standalone Skill when expertise alone is sufficient.

- **Role:** Define the specialist identity, scope, and decisions it owns.
- **When to use:** Name work that benefits from this responsibility boundary.
- **Responsibilities:** State owned outcomes and decisions, not the methods copied from Skills.
- **Inputs:** List context, upstream artifacts, constraints, assumptions, and required handoff information.
- **Skills:** Reference reusable capabilities and say why each contributes. Do not reproduce their methodology.
- **Process:** Explain how the Agent frames, performs, and reviews its responsibility.
- **Outputs:** Define downstream-ready deliverables, decisions, evidence, caveats, and handoff information.
- **Constraints:** Set scope limits, prohibited behavior, and authority boundaries.
- **Completion criteria:** Define observable conditions for a complete specialist result.

Keep cross-Agent routing, multi-stage orchestration, and Workflow-wide retries in Workflows. An Agent's output must be usable without hidden conversational context.

### Agent starter template

```markdown
# <Specialist role>

## Role
<State the durable responsibility and decisions this Agent owns.>

## When to use
<Describe work that benefits from this ownership boundary.>

## Responsibilities
- Own <outcome or decision>.
- Ensure <downstream-relevant responsibility>.

## Inputs
- Required: <upstream artifact, context, constraints, and handoff data>.
- Optional: <useful supplementary context>. <!-- Conditional -->

## Skills
- [<Skill reference>]: apply for <expected contribution>.
<!-- Reference methods; do not copy them. -->

## Process
1. Frame <scope, unknowns, and decisions>.
2. Apply the referenced Skills needed to fulfill the responsibility.
3. Review the result against <responsibility-level checks> and prepare the handoff.

## Outputs
Return <downstream-ready deliverable>, including <decisions, evidence, caveats, and unresolved items>.

## Constraints
- Do not <out-of-scope or prohibited behavior>.
- Escalate <decision beyond this Agent's authority>. <!-- Conditional -->

## Completion criteria
- <Owned outcome is complete and observable.>
- <The output contains everything required for downstream use without hidden context.>
```

## Workflow authoring

A Workflow coordinates replaceable stages toward a larger outcome. Reference Agent and Skill instructions rather than reproducing them, and express dependencies without coupling them to a harness implementation.

- **Goal:** State the final outcome and success definition.
- **Inputs:** Identify starting context, artifacts, constraints, and assumptions.
- **Stages and assignments:** Define meaningful ordered units and assign each to an Agent or standalone Skill. Direct Workflow-to-Skill use is appropriate when an Agent adds no meaningful ownership or reuse.
- **Handoffs:** Name the exact output passed from each stage and the input expected by the next.
- **Validation:** State who validates what, the evidence required, and what happens on failure.
- **Branching and iteration:** Give conditions for revising, retrying, skipping, or choosing another path.
- **Failure behavior:** Distinguish recoverable failures from escalation or stopping conditions. Bound every loop with a retry, escalation, or stopping rule.
- **Final output:** Define the assembled deliverable and reported evidence, caveats, and unresolved items.
- **Completion criteria:** State observable conditions for the overall outcome.

Keep stages replaceable: changing a capable assignee or implementation must not alter the Workflow's intent. Make every stage's required input and produced output explicit.

### Workflow starter template

```markdown
# <Outcome-oriented workflow>

## Goal
<State the final outcome and observable definition of success.>

## Inputs
- Required: <starting context, artifacts, and constraints>.
- Assumptions: <assumptions to confirm before execution>. <!-- Conditional -->

## Stages
1. **<Stage name>**
   - Assignment: <Agent or standalone Skill reference and expected contribution>.
   - Requires: <exact stage input>.
   - Produces: <exact handoff output>.
2. **<Stage name>**
   - Assignment: <Agent or standalone Skill reference and expected contribution>.
   - Requires: <prior handoff and other input>.
   - Produces: <stage output>.

## Validation
- <Reviewer or responsible stage> verifies <property> from <evidence>.
- On failure: <target stage receives findings and required corrections>.

## Branching and iteration
- If <condition>, <revise, retry, skip, or choose another path>.
- Retry at most <finite bound>; then <escalate, stop, or return a partial result>. <!-- Conditional if no iteration exists. -->

## Failure behavior
- Recoverable: <failure and recovery action>. <!-- Conditional -->
- Stop or escalate when: <missing capability, unresolved decision, or other terminal condition>.

## Final output
Return <assembled deliverable>, including <validation evidence, caveats, and unresolved items>.

## Completion criteria
- <Final outcome satisfies observable success conditions.>
- <Required validation passes and all handoffs and unresolved items are recorded.>
```

## Pre-publication decision check

Before publishing, answer yes—or revise the artifact—for each applicable question:

1. Is this the correct artifact type under the [canonical architecture](core-artifact-architecture.md)?
2. Does it own one coherent responsibility?
3. Is expertise, responsibility, or orchestration duplicated from another artifact?
4. Are dependencies referenced rather than copied?
5. Are inputs, outputs, checks, and completion criteria observable?
6. Can required instructions execute without hidden context?
7. Does normative guidance remain portable under the canonical boundary's replacement test?
8. Are named technologies requirements only when the artifact is explicitly technology-specific?
9. Can prose, a section, or an example be removed without reducing execution reliability?
10. Would another capable AI or harness interpret the important requirements consistently?

## Compact authoring examples

These fragments demonstrate decisions, not production artifacts.

### Turn vague Skill prose into actions and checks

**Vague:** “Review the interface carefully and make it accessible.”

**Actionable:**

1. Inspect each interactive element using the supplied accessibility requirements.
2. Record the affected element, violated requirement, user impact, and remediation for every finding.
3. Recheck each remediated element.

**Check:** Every in-scope element is accounted for; each finding has evidence and a remediation; unresolved items are explicit.

### Reference a Skill from an Agent

**Avoid:** Embedding all contrast measurement steps in a UI Review Agent.

**Prefer:** “Apply the Review Accessibility Skill to identify and verify barriers. Own prioritization of its findings and return the prioritized findings, evidence, and unresolved decisions in the review handoff.”

The Skill retains reusable method; the Agent owns the specialist decision and handoff.

### Specify a handoff and bounded retry

“The Requirements stage passes a numbered set of testable requirements and recorded assumptions to the Design stage. The Review stage maps the design specification to every requirement. On failure, it returns requirement IDs and corrections to Design. Retry review once; if required items still fail, stop and report the failed IDs and blocking decisions.”

This names the exchanged data, validator, correction path, retry bound, and stopping result without prescribing a harness.

### Omit or merge a section that adds no value

A Skill with one required input and no meaningful assumptions may write `## Inputs — Required: the interface specification.` and omit separate optional-input and assumption subsections. The same information remains explicit with less boilerplate.

### Replace technology with a capability

**Coupled core requirement:** “Use Playwright to take a PNG screenshot.”

**Portable requirement:** “Capture a rendered-page image at the specified viewport. Return the image with viewport and capture-target metadata; report an unsupported required capability instead of substituting another output.”

A technology-specific adapter may implement that capability and document its concrete image format or command without making them portable core requirements.

## Scope of this guide

This guide does not define artifact semantics, portability boundaries, contribution governance, evidence tiers, review policy, repository-wide quality gates, harness metadata, invocation or registration syntax, provider prompting conventions, integrations, artifact placement, or a required universal section order. It does not establish a machine-readable schema, validator, linter, generator, or directory layout. Those concerns remain with their canonical references or later work.
