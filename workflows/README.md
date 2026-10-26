# Workflows

This directory owns portable multi-stage orchestration: execution order, assignments, handoffs, validation, branching, bounded retry behavior, failure handling, and completion criteria.

Workflows must reference rather than duplicate expertise from [`skills/`](../skills/) or specialist responsibilities from [`agents/`](../agents/). Harness- or technology-specific execution belongs in [`integrations/`](../integrations/).

Use the [core artifact architecture](../docs/core-artifact-architecture.md) for composition rules and the [artifact authoring standards](../docs/artifact-authoring-standards.md) to author a Workflow.

## Index

- [Goal to Backlog](goal-to-backlog.md): takes a goal from framing through epics, draft work items, dependency order, and a ranked backlog, ready to hand to refinement.
- [Idea to POC](idea-to-poc.md): frames a question worth testing and cuts the work to the smallest slice that can answer it.
- [Backlog to Roadmap](backlog-to-roadmap.md): cleans and re-ranks an existing backlog, then turns it into a now/next/later roadmap with confidence stated, plus an optional status report.
- [Brief to Requirements](brief-to-requirements.md): turns a vague brief into traceable requirements, user and solution findings, task flows, and a content structure.
- [Design to Validation](design-to-validation.md): takes a design through expert review, a targeted test plan, analyzed session results, and recorded decisions.
- [Fix or Build to Merge](fix-or-build-to-merge.md): takes one feature or defect from an approved specification through build or a proven minimal repair, regression review for defects, one independent review for ordinary changes or two for high-risk ones, bounded repairs, and a verified human merge.
- [Feature to Release](feature-to-release.md): wraps Fix or Build to Merge with regression review, documentation, release-readiness, and a human release decision.
- [Spec to UI](spec-to-ui.md): turns an approved interface specification into structure, states, responsive behavior, and tokens, then checks the build against the specification.
