# Workflows

This directory owns portable multi-stage orchestration: execution order, assignments, handoffs, validation, branching, bounded retry behavior, failure handling, and completion criteria.

Workflows must reference rather than duplicate expertise from [`skills/`](../skills/) or specialist responsibilities from [`agents/`](../agents/). Harness- or technology-specific execution belongs in [`integrations/`](../integrations/).

Use the [core artifact architecture](../docs/core-artifact-architecture.md) for composition rules and the [artifact authoring standards](../docs/artifact-authoring-standards.md) to author a Workflow.

## Index

- [Goal to Backlog](goal-to-backlog.md): takes a goal from framing through epics, draft work items, dependency order, and a ranked backlog, ready to hand to refinement.
- [Backlog Triage](backlog-triage.md): a recurring pass over an existing backlog: health check, re-ranking, scope cuts, and a status report.
- [POC Scoping](poc-scoping.md): frames a question worth testing and cuts the work to the smallest slice that can answer it.
- [Roadmap Planning](roadmap-planning.md): turns a ranked backlog into a now/next/later roadmap with confidence stated.
- [Discovery to Definition](discovery-to-definition.md): turns a vague brief into traceable requirements, user and solution findings, task flows, and a content structure.
- [Design to Validation](design-to-validation.md): takes a design through expert review, a targeted test plan, analyzed session results, and recorded decisions.
- [Refine to Merge](refine-to-merge.md): takes one work item from an approved specification through build, two independent reviews, bounded repairs, and a verified human merge.
- [Bug Fix](bug-fix.md): takes a reported defect through expected behavior, a proven minimal repair, a regression review, and the Refine to Merge review and merge stages.
- [Feature Delivery](feature-delivery.md): wraps Refine to Merge with regression review, documentation, release-readiness, and a human release decision.
- [Spec to UI](spec-to-ui.md): turns an approved interface specification into structure, states, responsive behavior, and tokens, then checks the build against the specification.
