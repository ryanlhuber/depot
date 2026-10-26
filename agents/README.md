# Agents

This directory owns portable specialist roles with a coherent responsibility or decision boundary. An Agent may reference and combine multiple Skills.

Reusable expertise does not belong here; place it in [`skills/`](../skills/). Workflow sequencing and repository-wide orchestration belong in [`workflows/`](../workflows/), while technology-specific implementation belongs in [`integrations/`](../integrations/).

Use the [core artifact architecture](../docs/core-artifact-architecture.md) to justify an Agent and the [artifact authoring standards](../docs/artifact-authoring-standards.md) to author one.

Each Agent is one Markdown file, `agents/<name>.md`, with `name` (matching the file name) and `description` in its frontmatter. List the Skills it applies under `## Skills` by name in backticks, for example `` `check-merge-readiness` ``, rather than by link, so the file keeps working when it is copied into another repository. Every Skill named must exist in this repository. Edit agents only here: [`.claude/agents/`](../.claude/agents/) is a generated mirror for Claude Code, refreshed by `scripts/sync-adapters.sh`.

## Index

- [Delivery Planner](delivery-planner.md): owns the delivery plan for a goal: a framed problem, an assumption register, epics, draft work items, and a dependency order, ready for refinement. It does not rank by priority or build anything.
- [Backlog Owner](backlog-owner.md): owns the order and scope of the backlog: priority tiers, scope cuts, backlog health, and a roadmap. It stops at the requester's decision on what ships.
- [Design Reviewer](design-reviewer.md): owns a consolidated expert review of a design, prototype, or build, reconciling usability, accessibility, visual, and specification findings into one prioritized list.
- [Design System Designer](design-system-designer.md): owns design-system decisions (tokens, component rules, states, responsive behavior) and marks each as decided, proposed, or open.
- [Merge Gatekeeper](merge-gatekeeper.md): owns the readiness decision for a reviewed change, reconciling independent reviews into one blocking set, choosing the re-review a repair needs, and verifying merge preconditions from evidence. It stops at the human merge decision.
