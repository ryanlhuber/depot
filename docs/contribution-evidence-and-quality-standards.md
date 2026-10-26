# Contribution, Evidence, and Quality Standards

This document is the canonical governance reference for depot. It defines how contributions are framed, researched, reviewed, accepted, maintained, and retired, and how evidence and repository-wide quality are evaluated. Apply it proportionally: a typo fix needs far less process than a normative artifact, a high-impact accessibility claim, or a repository-wide policy change.

## Document ownership

This document owns contribution governance, evidence handling, review methodology, review outcomes, and repository-wide quality gates. Other repository documents may summarize or link to this guidance, but must not duplicate or redefine it.

It applies, without taking ownership from, these canonical references:

- [`core-artifact-architecture.md`](core-artifact-architecture.md) defines Skill, Agent, and Workflow semantics (SURFACE-2).
- [`artifact-authoring-standards.md`](artifact-authoring-standards.md) defines artifact structure, authoring guidance, and starter templates (SURFACE-3).
- [`portability-and-integration-boundaries.md`](portability-and-integration-boundaries.md) defines portable-core and integration boundaries (SURFACE-4).

Repository structure (SURFACE-1) and technology-specific integrations are also outside this document's ownership. This standard does not prescribe a contribution platform, provider, model, harness, design tool, framework, library, or frontend stack.

## Governing principles

- Make rigor proportional to a claim's impact, uncertainty, reach, and reversibility.
- Treat requirements, evidence, interpretation, and preference as different things.
- Prefer explicit ownership, composition, and replaceable dependencies over duplication.
- Ask for observable validation, not an assertion that work is high quality.
- Preserve necessary context, safety, accessibility, and failure behavior while avoiding context cost that does not improve decisions or execution.
- Use **must** for binding requirements, **should** for recommendations with possible justified exceptions, and **may** for optional behavior.

## Contribution lifecycle

### 1. Frame the contribution

Before substantial work, record what is relevant to review:

- the user or contributor problem and intended outcome;
- why the change belongs in depot;
- the proposed artifact type or documentation scope;
- portable-core or integration placement;
- affected artifacts and dependencies;
- meaningful constraints, assumptions, non-goals, and unresolved questions; and
- observable success checks or tests.

The record can be a short description for a small change. Higher-impact or harder-to-reverse changes need enough detail to expose their scope, claims, and consequences before implementation.

### 2. Check repository fit

Search for artifacts that already own the capability, responsibility, orchestration, or guidance. Prefer extending or composing existing ownership when it remains coherent. If overlap exists, name it and explain why extension or composition is insufficient.

Reject a proposal whose only benefit is renaming, reorganizing, or copying existing guidance. Do not add a speculative abstraction without a concrete, reusable need. File count or superficial similarity alone does not decide fit: responsibility, reuse boundary, dependency direction, and change boundary do.

### 3. Research consequential claims

Research effort increases with impact, uncertainty, reach, and difficulty of reversal. Stronger support is required when guidance:

- uses normative terms such as **must**, **never**, or **required**;
- concerns accessibility, safety, legal obligations, compatibility, or performance;
- presents behavior as universally better;
- overrides a recognized standard or platform convention;
- affects many downstream artifacts; or
- would be costly for contributors or users to reverse.

Record enough source identity, scope, version when material, and rationale for a reviewer to verify a consequential claim. Citations are not required for self-evident repository mechanics, clearly illustrative examples, or explicitly labeled subjective preferences. Legal sources may establish applicable obligations, but this process does not guarantee legal or regulatory compliance.

### 4. Author and self-review

Apply the canonical architecture, portability, and authoring references rather than restating them. Complete the proportional proposal outline and relevant quality gates below. Resolve known duplication, unsupported claims, hidden dependencies, and unclear completion conditions before requesting review.

### 5. Review and decide

Reviewers apply relevant gates and return one outcome:

- **Accept** — applicable requirements are met and no material issue remains.
- **Request changes** — the contribution is viable, but identified issues must be resolved.
- **Defer** — the idea may be useful, but its dependencies, evidence, timing, or scope are not ready.
- **Reject** — it conflicts with repository goals, duplicates established ownership, or cannot be made reliable within reasonable scope.

A review comment should identify the applicable requirement or concern, its impact, and the smallest useful correction. Use the finding structure below for material or disputed findings. Aesthetic disagreement alone is not a quality failure, and review outcomes do not require a numeric score.

### 6. Maintain or retire

Correct outdated claims and misleading guidance when discovered. Replace superseded standards or platform conventions, and revisit assumptions when evidence becomes available. Time-sensitive or version-sensitive guidance should identify an owner or an observable update trigger, such as a referenced standard changing.

Deprecate or retire an artifact when its value or ownership has been absorbed elsewhere, its premise is no longer valid, or its maintenance cost is no longer justified. Material changes should preserve useful history and identify replacement or migration guidance when users or downstream artifacts must act. Retirement should remove stale ownership and update dependents without forcing unrelated artifacts to change.

## Claim classification

Authors and reviewers must keep these categories distinct:

### Requirement

A binding condition from the task, product, repository policy, applicable obligation, or an explicitly adopted standard. Use normative language and identify the authority and scope. A requirement in one product or jurisdiction is not automatically universal.

### Standard

A documented external specification or formally adopted internal rule. Name its applicable scope and version when that changes interpretation; avoid unnecessary version pinning in portable guidance.

### Platform convention

Established behavior or guidance for an operating system, browser, device class, design system, or other platform. It is a strong default within that platform's scope, not automatically a universal requirement.

### Empirical finding

An observation supported by research, user testing, analytics, experiments, or other direct evidence. State material limits involving population, task, environment, sample, or method.

### Heuristic

A reusable evaluation principle grounded in accumulated practice or expert reasoning. It supports judgment but can conflict with other heuristics and requires contextual interpretation.

### Recommendation

A proposed course of action derived from requirements, evidence, constraints, conventions, heuristics, and tradeoffs. State important conditions and do not present a contextual choice as universal truth.

### Assumption

An unverified premise used to continue when required information is unavailable. Make it explicit and bounded, describe the consequence if it is wrong, and revisit it when evidence becomes available. Never present it as a known requirement, finding, or standard.

### Aesthetic preference

A subjective visual or stylistic choice not justified as a usability, accessibility, or performance requirement. Preferences are allowed when labeled, but cannot overrule requirements or relevant user evidence.

## Review finding structure

Repository-wide findings keep these fields distinct so downstream critique, review, and release-validation artifacts can reuse and extend them without surrendering their domain methods:

- **Observation** — what is present, absent, or behaving unexpectedly.
- **Classification** — the relevant requirement, standard, convention, empirical or usability concern, heuristic, recommendation, assumption, or preference.
- **Impact and severity** — who or what is affected, how seriously, and how broadly.
- **Evidence or rationale** — the authority, evidence, heuristic, or reasoning supporting the concern.
- **Confidence** — certainty that the observation and interpretation are correct.
- **Recommended action** — the smallest useful correction or next validation step.

Severity, confidence, and evidence strength are independent. A severe potential issue may have low confidence and need validation; a high-confidence observation may have negligible impact. Domain-specific reviews may add fields while preserving these distinctions.

Skills restate this separation in one line instead of linking here, so a skill still works when its folder is copied alone. Keep those lines consistent with this section.

## Evaluating evidence

Claim type, evidence basis, and confidence are separate dimensions. Do not turn the considerations below into a mechanical hierarchy or universal score. Evaluate material evidence for:

- **Authority** — whether the source can establish the claimed requirement or standard.
- **Relevance** — similarity of users, tasks, platforms, and constraints.
- **Directness** — whether it supports the claim itself or only an inference.
- **Quality** — rigor, transparency, sample, method, and reproducibility where applicable.
- **Currency** — whether it remains applicable.
- **Corroboration** — whether independent evidence points in the same direction.
- **Limitations** — uncertainty, conflicts, and boundary conditions.

Depending on the claim, prefer explicit product and user requirements for the product context; current recognized standards and normative specifications for standards claims; direct validation with representative users and tasks; relevant peer-reviewed or methodologically transparent empirical work; official platform guidance for platform behavior; and established heuristics or reputable practitioner guidance for judgment support.

Greater general authority does not guarantee greater contextual relevance. When sources conflict, disclose the conflict, compare scope and applicability, and narrow the finding or recommendation. If uncertainty remains, state it and propose validation rather than manufacturing certainty.

## Accessibility evidence and validation

Accessibility guidance must:

- favor current recognized accessibility standards, semantic platform behavior, and official platform conventions;
- distinguish conformance requirements from broader usability recommendations;
- never claim that automated checks prove accessibility;
- include manual or assistive-technology validation when behavior cannot be verified automatically;
- treat ARIA, a design-system component, and a tool score as aids rather than substitutes for correct semantics and user-operable behavior;
- surface jurisdiction-, platform-, and version-specific limits rather than implying universal legal compliance; and
- preserve accessibility requirements when they conflict with aesthetic preference or arbitrary concision targets.

Automated checks are useful evidence for the rules they can observe. They are not evidence that every interaction is perceivable, operable, understandable, robust, or usable by people with disabilities.

## Repository-wide quality gates

A contribution is ready only when its relevant gates pass. Applicability and depth are proportional; an author or reviewer should mark a gate not applicable rather than fabricate evidence.

### Need and duplication

- Solves a concrete, reusable problem within depot's mission.
- Does not duplicate capability, responsibility, orchestration, or guidance owned elsewhere.
- Explains overlap and why composition or extension is insufficient.

### Scope and classification

- Uses the correct artifact type or documentation form.
- Owns one coherent responsibility at an appropriate abstraction level.
- Separates reusable expertise, specialist ownership, and orchestration.
- States relevant dependencies and non-goals.

### Composability

- References dependencies instead of copying them.
- Produces outputs usable downstream without hidden conversational context.
- Keeps dependencies replaceable and avoids circular ownership.
- Splits or combines content by reuse and change boundaries, not arbitrary file size.

### Portability

- Applies the canonical core-versus-integration boundary.
- Expresses portable needs as capabilities, standards, behavior, constraints, and outcomes.
- Avoids unnecessary provider, model, harness, design-tool, framework, library, command, API, schema, or file-format assumptions.
- Labels technology-specific scope and keeps it replaceable.

### Evidence and language

- Classifies consequential guidance correctly.
- Supports material normative and empirical claims with appropriate evidence or authority.
- States conditions, uncertainty, limitations, and conflicts where relevant.
- Avoids unsupported absolutes, false precision, and preferences disguised as facts.
- Uses **must**, **should**, and **may** for required, recommended, and optional behavior respectively.

### Accessibility and inclusive UX

- Applies recognized standards and relevant platform conventions.
- Preserves semantic, operable, perceivable, understandable, and robust behavior where applicable.
- Does not use automated validation as sole evidence for behavior requiring human review.
- Considers users, environments, and interaction modes the guidance could exclude.

### Actionability and validation

- Provides sufficient inputs, procedures, decisions, outputs, and completion conditions for reliable execution.
- Defines observable checks instead of relying on quality assertions.
- Includes failure, escalation, or stopping behavior when omission would make execution unreliable.
- Uses examples to clarify decisions without turning them into hidden requirements.

### Token efficiency

- Every section materially improves execution, review, safety, accessibility, portability, or maintenance.
- Removes duplicated background, motivational prose, redundant examples, and exhaustive low-value edge cases.
- Links to canonical ownership instead of restating it.
- Never sacrifices necessary context, evidence, safety, accessibility, or failure behavior to meet an arbitrary length target.

### Maintainability

- Uses stable concepts and links to canonical references.
- Makes time-sensitive, version-sensitive, and technology-specific assumptions visible.
- Identifies ownership or update triggers for guidance likely to change.
- Can be revised or retired without forcing unrelated artifacts to change.

## Contribution proposal outline

This copyable outline is proportional guidance, not a mandatory schema. Merge or omit fields that add no useful review information.

```markdown
## Problem and outcome
- Problem:
- Intended user outcome:

## Proposed change
- Change and artifact classification:
- Repository fit and duplicate search:
- Why extension or composition is insufficient (if applicable):
- Portable core or integration placement:

## Context
- Dependencies and affected artifacts:
- Material claims, evidence, and limitations:
- Constraints and assumptions:
- Non-goals and unresolved questions:

## Validation
- Observable checks and success conditions:
```

## Reviewer checklist

This checklist supports reasoned review, not a mechanical score. Not every item applies equally to every contribution.

```markdown
- [ ] Mission and user value are concrete and reusable.
- [ ] Existing ownership was checked; overlap is resolved without duplication.
- [ ] Artifact classification, responsibility, scope, dependencies, and non-goals are sound.
- [ ] Composition is explicit; outputs need no hidden context; dependencies are replaceable and acyclic.
- [ ] Core/integration placement is correct and avoids unnecessary technology coupling.
- [ ] Consequential claims are classified, bounded, and supported by appropriate evidence or authority.
- [ ] Accessibility and inclusive-UX risks use appropriate standards and human validation where needed.
- [ ] Instructions are actionable, with observable validation and necessary failure behavior.
- [ ] Content earns its context cost and links rather than restates canonical ownership.
- [ ] Maintenance triggers, time-sensitive assumptions, conflicts, and unresolved uncertainty are visible.
```

## Classification and review examples

### Bound a universal claim

**Unsupported:** “Side navigation is always easier to use.”

**Bounded recommendation:** “For products with several persistent top-level destinations, consider side navigation when content width and target-platform conventions support it; validate findability with representative tasks.”

The revision states conditions and a validation need instead of inventing a universal empirical finding.

### Separate accessibility and usability

**Requirement:** “The control must expose its name, role, value, and state as required by the applicable accessibility standard and platform semantics.”

**Recommendation:** “Use familiar wording for the name because it may improve recognition for this audience; validate the wording with representative users.”

The first traces to a scoped conformance authority. The second is a usability recommendation and needs contextual support, not conformance language.

### Label preference

**Misclassified:** “Rounded cards improve usability.”

**Preference:** “For this visual direction, we prefer rounded card corners; no usability benefit is claimed.”

The preference is legitimate but cannot overrule contrast, target-size, or other applicable requirements.

### Resolve duplicate ownership

A proposal creates a new “form error writing” Skill, but an existing form-content Skill already owns that method. Extend the existing Skill if the new guidance shares its responsibility and change boundary; otherwise compose that Skill from the proposing Agent or Workflow. Do not copy its method into a second Skill.

### Move technology-specific instructions

**Portable core:** “Capture the rendered state at each required viewport through a declared screenshot capability.”

**Integration:** “Invoke the target harness's screenshot API with its concrete command and output format.”

The core preserves intent and contract-level behavior; the replaceable integration owns tool syntax.

### Report conflicting evidence

“Study A found faster completion with the pattern on desktop, while Study B found more errors on touch devices. The populations and tasks differ, so confidence in a cross-platform recommendation is low. Limit the recommendation to desktop conditions matching Study A and validate the touch case.”

The decision exposes scope, conflict, and confidence instead of averaging evidence into a false rule.

### Use a lighter editorial review

A change that fixes spelling without changing meaning can state “editorial correction,” confirm the rendered text and links remain valid, and receive focused review. It does not need a full evidence record, duplicate analysis, or accessibility study. If the edit changes normative force or technical meaning, the stronger gates apply.

## Completion criteria

This reference is successfully applied when a reviewer or implementation agent can verify that:

- a contributor can proceed from proposal through a reasoned decision without undocumented governance rules;
- representative statements can be classified consistently across all claim categories;
- material claims trace to sufficient authority, evidence, or explicit rationale;
- higher-impact, uncertain, broad, and less-reversible claims receive stronger scrutiny than low-risk edits;
- accessibility requirements are not conflated with tool output, legal guarantees, preferences, or general usability advice;
- review detects duplication, misplaced ownership, unnecessary coupling, hidden context, and avoidable token cost;
- downstream review artifacts can reuse the finding structure while retaining their domain-specific methods;
- Accept, Request changes, Defer, and Reject remain available without a numeric score;
- small changes can use a lighter process; and
- the guidance remains portable and references canonical documents instead of duplicating them.

## Non-goals

This reference does not redefine artifact semantics, artifact structure or templates, portability boundaries, or final repository directories. It does not mandate platform-specific pull-request mechanics or any provider, model, harness, design tool, framework, contribution platform, machine-readable schema, automated validator, or evaluation platform. It does not create a universal numeric quality or evidence score, guarantee legal compliance, demand citations for every sentence, author V1 domain artifacts, or make reviewer taste a normative standard.
