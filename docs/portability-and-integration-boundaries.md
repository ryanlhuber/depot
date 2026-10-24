# Portability and Integration Boundaries

This document defines the repository-wide boundary between portable depot artifacts and environment-specific integration code. It is the normative reference for deciding what belongs in the core, what belongs in an adapter, and what assumptions an integration may make.

The artifact semantics used here are defined by [`core-artifact-architecture.md`](core-artifact-architecture.md). This document adds deployment and integration boundaries; it does not redefine Skill, Agent, or Workflow.

---

## Portability Goal

depot's core artifacts must remain usable across providers, models, agent harnesses, operating systems, design tools, frontend stacks, and UI libraries. Portability means that an artifact's purpose, inputs, process, outputs, and completion criteria remain meaningful when the surrounding implementation is replaced.

Portability does **not** require every environment to expose identical features. It requires environment-specific capabilities to be declared at an integration boundary, with unsupported behavior detected explicitly rather than hidden inside a core artifact.

---

## Boundary Model

The repository recognizes three layers:

```text
Portable core artifacts
        ↓ depend on abstract contracts only
Integration contracts
        ↑ implemented by
Environment-specific adapters
```

### 1. Portable core

The portable core contains:

- Canonical Skill, Agent, and Workflow definitions
- Provider-neutral schemas and vocabulary
- Inputs, outputs, validation rules, and completion criteria
- Orchestration expressed in terms of artifact references and declared capabilities
- Examples that are illustrative rather than required dependencies

Core artifacts may request a capability such as “capture a rendered-page image” or “run a command,” but must not assume the API, executable, configuration file, or vendor used to provide it.

### 2. Integration contracts

An integration contract is the stable seam between portable intent and environment-specific execution. A contract defines:

- Capability name and semantics
- Required and optional inputs
- Output shape
- Failure and unsupported-capability behavior
- Side effects and permission expectations
- Version or compatibility information when needed

Contracts describe **what** is required, not **which product** supplies it. Contracts should be as small as possible and must not expose vendor-specific concepts unless the contract itself is explicitly vendor-scoped.

### 3. Environment-specific adapters

Adapters translate a contract into a concrete environment. Examples include:

- Harness packaging, discovery, invocation, or routing configuration
- Provider authentication and model invocation
- Design-tool APIs and document formats
- Framework generators, build systems, and test runners
- Browser, shell, filesystem, or deployment tool invocation

Adapters own environment detection, concrete configuration, authentication references, feature translation, and actionable error messages. They must preserve the portable contract and must not silently change the meaning of the core artifact they execute.

---

## Dependency Rules

1. **Core artifacts depend only on portable artifacts and integration contracts.** They must not import, require, or route through a concrete adapter.
2. **Adapters depend inward.** An adapter may depend on the relevant contract and core metadata; core artifacts must not depend on the adapter.
3. **Vendor-specific configuration stays outside the core.** Model identifiers, API endpoints, harness routing keys, plugin manifests, design-tool object identifiers, framework imports, and UI-library component names belong in adapters or examples clearly marked as non-normative.
4. **No implicit fallback may alter semantics.** If a required capability is unavailable, the integration must report it as unsupported or fail with an actionable message. It must not substitute behavior that violates the declared output or completion criteria.
5. **Optional enhancement must remain optional.** Removing an optional integration may reduce convenience or fidelity, but must not make the portable definition invalid.
6. **Inputs and outputs cross boundaries as documented data.** Undocumented ambient state, hidden prompts, global configuration, or provider-specific response fields must not be required for correctness.
7. **Secrets never belong in artifacts or examples.** Adapters may refer to environment-managed credentials, but portable definitions and committed configuration must not contain secret values.
8. **Integration-specific orchestration stays at the edge.** Setup, authentication, retries required by a vendor API, rate-limit handling, and transport conversion belong in the adapter. Outcome-oriented orchestration remains in Workflows as defined by the core architecture.
9. **Capabilities are validated before execution when practical.** An integration should surface missing required capabilities before starting work that cannot be completed.
10. **Replacement is a design test.** Replacing a provider, harness, design tool, framework, or UI library should require changing its adapter and configuration—not rewriting unrelated Skills, Agents, or Workflow stages.

---

## Allowed and Prohibited Assumptions

| Concern | Portable core may assume | Portable core must not assume |
|---|---|---|
| Model | A declared reasoning or generation capability | A provider, model name, context-window size, or proprietary response shape |
| Harness | Artifact references can be resolved and declared capabilities reported | A directory convention, command name, routing syntax, or agent lifecycle API |
| Tools | A contract with documented inputs, outputs, and failure behavior | A particular browser, shell, MCP server, plugin, or tool-call wire format |
| Filesystem | Explicitly supplied artifact paths or content | Repository location, home directory, path separator, or writable global directories |
| Design | Structured requirements and export contracts | Figma or another design tool, proprietary node IDs, or a particular document format |
| Frontend | Platform-neutral UI requirements and acceptance criteria | React, Vue, a build tool, package manager, or named component library |
| Credentials | The adapter can report whether authorization is available | Secret values, environment-variable names, or an authentication vendor |

Environment requirements may be documented by an adapter. They become a portability violation only when a core artifact relies on them without an explicit contract.

---

## Integration Contract Checklist

Every new integration should document:

1. **Scope** — the capability or environment being integrated.
2. **Contract mapping** — how portable inputs, outputs, and errors map to the environment.
3. **Requirements** — runtime, dependencies, permissions, and external services.
4. **Configuration** — non-secret settings and how credentials are referenced.
5. **Capability negotiation** — how required, optional, and unsupported features are reported.
6. **Failure behavior** — actionable errors, retry ownership, and whether partial outputs can exist.
7. **Compatibility** — supported contract and adapter versions or a stated compatibility policy.
8. **Verification** — contract tests or repeatable checks that do not redefine core acceptance criteria.
9. **Removal path** — how the adapter can be replaced or removed without modifying unrelated core artifacts.

Adapter-specific documentation should link to this document and to the contracts it implements rather than copying their normative definitions.

---

## Decision Guide

Use these questions when placing new content:

| Question | Location |
|---|---|
| Does it define reusable expertise, role responsibility, or outcome orchestration without naming an environment? | **Portable core artifact** |
| Does it define provider-neutral capability semantics and data exchanged at the boundary? | **Integration contract** |
| Does it mention a concrete provider, harness, API, executable, file layout, framework, design tool, or UI library? | **Environment-specific adapter or non-normative example** |
| Is a vendor detail required only to install, authenticate, discover, invoke, or translate? | **Environment-specific adapter** |
| Would changing vendors force unrelated core artifacts to change? | **Boundary violation; introduce or repair a contract** |

When uncertain, first express the smallest provider-neutral contract. Add an adapter only when a concrete environment needs an implementation of that contract.

---

## Examples

### Portable browser capability

A Workflow requires a rendered-page screenshot with a viewport and target URL as inputs and an image plus capture metadata as output. Those semantics form a portable contract. Playwright-specific launch flags, browser installation, and screenshot API calls belong in an adapter.

### Design handoff

A design Skill produces a structured specification containing layout, typography, states, and assets. Exporting nodes from a named design platform is adapter behavior. The Skill must remain usable when the specification is supplied manually or exported by a different tool.

### Frontend implementation

An Agent can accept requirements to implement an accessible component and return source plus verification results. A React implementation or use of a particular component library may be selected by explicit project input; neither is a property of the Agent's portable role definition.

---

## Anti-patterns

### Core artifact embeds harness routing

A Workflow that names a harness-specific agent key or invokes a harness command directly couples orchestration to one runtime. It should reference the Agent by portable identity and let the harness adapter resolve it.

### Skill requires a named vendor

A visual-review Skill that can operate only through one design platform confuses expertise with transport. The Skill should define the review method and input contract; platform access and data conversion belong in an adapter.

### Adapter changes completion criteria

An adapter that marks work complete because its API call succeeded, while the Workflow requires validated output, changes portable semantics. Transport success is not outcome completion.

### Silent capability substitution

An integration that returns source HTML when a screenshot capability is required hides an unsupported feature and breaks the output contract. It should report the missing capability instead.

---

## Change Review and Validation

For every new or modified artifact, contract, or integration, verify that:

- Vendor and environment names appear only in adapters, explicitly scoped integrations, or non-normative examples.
- Core definitions remain coherent if every optional integration is removed.
- Required capabilities and their input, output, and failure semantics are explicit.
- Adapter configuration and secrets do not leak into portable artifacts.
- Unsupported capabilities fail visibly and do not produce misleading completion signals.
- Provider retry and transport behavior does not leak into outcome-oriented Workflow logic.
- At least one plausible replacement environment can implement the contract without changing its meaning.
- Integration tests verify the contract rather than encoding a new, adapter-specific definition of success.

---

## Non-goals

This document does not:

- Define concrete adapter file layouts or packaging formats
- Select a provider, model, harness, design tool, framework, or UI library
- Require lowest-common-denominator behavior across all environments
- Define individual Skill, Agent, or Workflow content
- Replace the canonical artifact responsibilities in [`core-artifact-architecture.md`](core-artifact-architecture.md)

---

## Acceptance Criteria

- [x] Defines portable core, integration contract, and environment-specific adapter boundaries.
- [x] Establishes an inward dependency direction that prevents core-to-adapter coupling.
- [x] Identifies allowed and prohibited assumptions for providers, harnesses, tools, filesystems, design tools, and frontend stacks.
- [x] Defines explicit capability, failure, configuration, secret, and compatibility expectations.
- [x] Provides a placement decision guide, examples, and anti-patterns.
- [x] Makes replaceability testable during change review.
- [x] Preserves the canonical Skill, Agent, and Workflow semantics rather than redefining them.
- [x] Remains independent of any specific provider, model, harness, design tool, frontend framework, or UI library.
