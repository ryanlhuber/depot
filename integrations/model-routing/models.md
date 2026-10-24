# Model routing table

Environment-specific data for `kit-router`. Belongs in `integrations/`, not in a portable skill, because it names models and providers. Replace freely.

Source: the strengths and weaknesses in the prompt-library model guides, reduced to a short list. Effort levels are starting defaults to tune, not measured results. Verify availability on your current plans before relying on a row.

Effort: `low` = fast pass, `medium` = normal, `high` = deepest reasoning. Effort follows the step, not the size of the project, so nothing changes when a small project grows.

| Role | Model | Family | Effort | Use for |
| --- | --- | --- | --- | --- |
| Planner and synthesizer | GPT-5.5 | OpenAI | medium | Discovery, epics and issues, review consolidation |
| Builder | Codex | OpenAI | medium | Features, bug fixes, remediation in a repository |
| Cheap builder | GPT-5.4-mini | OpenAI | low | Scoped implementation and fixes after review |
| Deep reviewer and architect | Claude Opus | Anthropic | high | Architecture review, readiness decisions, hard refactors |
| Everyday reviewer and writer | Claude Sonnet | Anthropic | medium | Code review, documentation, feature work |
| Dense reviewer | Kimi K2.6 | Moonshot | medium | Code and regression review, acceptance criteria |
| Spec validator | GLM 5.1 | Zhipu | medium | Requirements validation, spec sign-off. Not for building |
| Bulk scanner | DeepSeek V4 Flash | DeepSeek | low | Large-context scans, repo audits, high-volume summaries |

## Rules

- Independent reviews (for example in `refine-to-merge`) use three different families across builder, first reviewer, and adversarial reviewer. Versions of one family do not count.
- Example independent set: builder Codex (OpenAI), first review Kimi K2.6 (Moonshot), adversarial review Claude Sonnet or Opus (Anthropic).
- Keep the strongest model for decisions and reviews. Run scoped, well-specified build steps on the cheaper model.
- To protect usage limits, spend `high` effort only on the review and decision steps; lower the effort of the build step before lowering the review's.
- Switch models at stage boundaries, after writing a handoff note.
