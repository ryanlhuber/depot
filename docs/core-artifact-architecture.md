# Core Artifact Architecture

This document defines the canonical depot artifact architecture. It is the normative reference for how capabilities, roles, and orchestration are distinguished and composed. Later repository documentation should link to this document rather than redefining the model.

This architecture is provider-agnostic, harness-agnostic, model-agnostic, and independent of any specific design tool, frontend framework, or UI library.

---

## Artifact Types

### 1. Skill

A **Skill** is reusable expertise, methodology, guidance, or a repeatable capability focused on a single kind of work.

A skill should normally define:

- **Purpose** — what the skill does and why it exists
- **When to use** — the conditions under which it should be invoked
- **Inputs** — the data, context, or artifacts required
- **Process** — the repeatable steps or methodology to perform the work
- **Rules or heuristics** — constraints, guidelines, or quality gates that govern execution
- **Checks** — how to verify correctness, completeness, or quality
- **Expected output** — the artifact or result produced
- **Completion criteria** — the conditions that signal the work is done

**Responsibility:** A skill owns **how to perform a focused kind of work well**. It defines expertise and methodology.

**Non-responsibility:** A skill must **not** own multi-stage orchestration, agent routing, handoffs, retry loops, or broader execution sequencing. It does not decide which other artifacts to invoke.

---

### 2. Agent

An **Agent** is a specialized role responsible for a category of work.

An agent should normally define:

- **Role** — the identity and scope of the specialist
- **Responsibilities** — the category of work it owns
- **When to use** — the conditions under which the agent should be invoked
- **Inputs** — the data, context, or artifacts required
- **Relevant skills** — the skills the agent composes and applies
- **Process** — how the agent selects and applies skills to fulfill its responsibilities
- **Outputs** — the artifacts or decisions it produces
- **Constraints** — boundaries on its authority or behavior
- **Completion criteria** — the conditions that signal the role's work is done

**Responsibility:** An agent owns a **persistent responsibility boundary** and acts as a **decision owner** or **reusable specialist role**. It composes and applies skills rather than duplicating their expertise.

**Non-responsibility:** An agent must **not** duplicate detailed expertise that belongs in reusable skills. It does not own the orchestration of other agents or the sequencing of larger outcomes.

An agent is justified when the work benefits from a persistent responsibility boundary, decision owner, or reusable specialist role. If a reusable skill alone is sufficient, do not introduce an agent.

---

### 3. Workflow

A **Workflow** is a first-class orchestration artifact that coordinates agents, skills, handoffs, validation, branching, and iteration toward a larger outcome.

A workflow may:

- Invoke agents
- Tell agents which skills to use
- Invoke standalone skills directly
- Pass outputs between stages
- Define execution order
- Perform validation
- Branch or retry
- Define stopping and completion criteria

**Responsibility:** A workflow owns **orchestration logic**. It sequences work, manages handoffs, and ensures a larger outcome is reached.

**Non-responsibility:** A workflow must **not** copy or duplicate the detailed instructions of referenced agents or skills. It references expertise rather than reproducing it.

---

## Dependency and Composition Rules

The canonical dependency direction is:

```
Workflow → Agent → Skills
```

1. **Prefer `Workflow → Agent → Skills`** for multi-stage work.
2. **A workflow may call a skill directly** when introducing an agent would add no meaningful responsibility, decision ownership, or reuse value.
3. **Skills must not** coordinate multi-stage workflows or route between agents.
4. **Agents must not** duplicate detailed expertise that belongs in reusable skills.
5. **Workflows must not** copy the instructions of referenced agents or skills.
6. **Dependencies should remain replaceable:** changing an agent or skill should not require rewriting unrelated workflow stages.
7. **Circular dependencies are not allowed.**
8. **Core artifact semantics must not depend** on a specific model, provider, coding harness, design tool, frontend framework, or UI library.

---

## Decision Guide

Use this guide to classify a proposed artifact:

| Question | Classification |
|---|---|
| Is this reusable expertise for one kind of task? | **Skill** |
| Is this a reusable specialist role with distinct responsibilities or decision ownership? | **Agent** |
| Does this coordinate multiple stages, roles, handoffs, validation, or iteration? | **Workflow** |

**Rule:** When in doubt, choose the smallest reusable artifact that fully owns the responsibility.

---

## Examples

These examples are illustrative and do not imply a required provider, harness, design tool, or frontend framework.

### Example 1: Accessibility Audit Skill

- **Type:** Skill
- **Purpose:** Evaluate a UI for accessibility conformance and usability barriers.
- **Process:** Check color contrast, keyboard navigability, focus order, screen-reader labels, and motion sensitivity.
- **Output:** A prioritized list of findings with severity and remediation guidance.
- **Why a skill?** It is reusable expertise for a single, focused kind of work. It does not decide what to audit next or who should fix it.

### Example 2: Frontend Implementation Agent

- **Type:** Agent
- **Role:** Specialist in turning design specifications into working frontend code.
- **Responsibilities:** Implement UI components, ensure accessibility conformance, and verify responsive behavior.
- **Relevant skills:** Accessibility Audit Skill, Responsive Design Skill, Component Testing Skill.
- **Why an agent?** It owns a persistent responsibility boundary (frontend implementation) and composes multiple skills to fulfill it.

### Example 3: Create Page Workflow

- **Type:** Workflow
- **Purpose:** Deliver a complete, validated page from requirements to deployment-ready code.
- **Stages:**
  1. Gather and validate requirements.
  2. Produce UI design specification (invokes a Design Agent).
  3. Implement frontend code (invokes the Frontend Implementation Agent with Accessibility Audit Skill and Responsive Design Skill).
  4. Validate output against requirements and quality gates.
  5. If validation fails, branch back to the appropriate stage with feedback.
- **Why a workflow?** It coordinates multiple stages, roles, handoffs, validation, and iteration toward a larger outcome.

---

## Anti-patterns

These examples illustrate common architecture violations.

### Anti-pattern 1: Skill assigns work to agents

A skill that says “ask the Design Agent to produce a mockup” violates Rule 3. Skills must not coordinate or route between agents.

### Anti-pattern 2: Agent contains full methodology

An agent whose definition includes a complete accessibility methodology, instead of referencing an Accessibility Audit Skill, violates Rule 4. Agents must compose skills rather than duplicating their expertise.

### Anti-pattern 3: Workflow duplicates skill instructions

A workflow that pastes the full color-contrast checking steps into its own definition, instead of invoking the Accessibility Audit Skill, violates Rule 5. Workflows must reference expertise, not copy it.

### Anti-pattern 4: Narrow agent where a skill is sufficient

Creating a “Color Contrast Agent” whose only job is to run a single color-contrast check violates the decision guide. A standalone Color Contrast Skill is sufficient; an agent adds unnecessary overhead.

---

## Non-goals

This document explicitly does **not** define:

- Harness-specific file formats or adapters
- OpenCode-specific routing or configuration
- Provider or model selection rules
- Design-tool integrations
- Frontend-framework integrations
- Concrete UX/UI skills, agents, or workflows beyond the small illustrative examples above
- Repository-wide portability or integration boundaries (defined in [`portability-and-integration-boundaries.md`](portability-and-integration-boundaries.md))

---

## Validation

Before a change to this document or a new artifact is accepted, verify that:

- Each artifact type has clear responsibilities and non-responsibilities.
- The difference between expertise, responsibility ownership, and orchestration is unambiguous.
- Direct workflow → skill invocation has a clear decision rule (Rules 1 and 2).
- No example implies a required provider, harness, design tool, or frontend framework.
- The document can be used to classify a proposed artifact without relying on undocumented conventions.
- Later documentation can link to this document instead of redefining the architecture.

---

## Acceptance Criteria

- [x] `docs/core-artifact-architecture.md` exists and is the canonical architecture reference.
- [x] Defines responsibilities and non-responsibilities for Skill, Agent, and Workflow.
- [x] Defines the canonical `Workflow → Agent → Skills` dependency direction.
- [x] Defines when workflows may call skills directly.
- [x] Prevents orchestration logic from leaking into skills.
- [x] Prevents agents from duplicating skill expertise.
- [x] Prevents workflows from duplicating referenced agent/skill instructions.
- [x] Includes a compact artifact-classification decision guide.
- [x] Includes concise UX/UI-oriented examples and anti-patterns.
- [x] Explicitly preserves provider, model, harness, design-tool, and framework independence.
- [x] Does not absorb the scope of `SURFACE-4`.
- [x] Completion criteria are testable by a reviewer or implementation agent.
