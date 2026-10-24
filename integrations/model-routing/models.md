# Model routing table

Environment-specific data for `kit-router`. Belongs in `integrations/`, not in a portable skill, because it names models and providers. Replace freely.

Last checked: 2026-10-24 against the sources below. Model lineups change often, so recheck before relying on a row. Effort levels are starting defaults to tune, not measured results. Verify availability on your current plans before relying on a row.

Effort: `low` = fast pass, `medium` = normal, `high` = deepest reasoning. Effort follows the step, not the size of the project, so nothing changes when a small project grows. Providers name their levels differently (OpenAI also offers `xhigh` and `max`); map these three onto the nearest level the model accepts.

Each role below is its own table. Models are ordered best first for that job, so the first row is the pick and the rows after it are fallbacks for when you lack access to the one above. The order is a judgment from the sources below, not a measured ranking.

## How to pick

1. Start from the role the step needs.
2. Take the first model in that role's table that you can use on your current plans.
3. For independent reviews (for example in `refine-to-merge`), builder, first reviewer, and adversarial reviewer must come from three different families. Skip any model whose family is already used in the set, and take the next row. Versions of one family do not count.
4. If you cannot reach three families, say so rather than substituting a second model from one family.
5. Keep the strongest model for decisions and reviews, and run scoped, well-specified build steps on a cheaper one.
6. To protect usage limits, spend `high` effort only on review and decision steps; lower the effort of the build step before lowering the review's.
7. Switch models at stage boundaries, after writing a handoff note.

Example independent set with ChatGPT Plus, Claude Pro, and OpenCode Go: builder GPT-6.1 Sol in Codex (OpenAI), first review Kimi K3.1 Pro (Moonshot), adversarial review Claude Opus 5.5 (Anthropic).

## Planner and synthesizer

Discovery, epics and issues, review consolidation.

| Model | Family | Effort |
| --- | --- | --- |
| GPT-6.1 Sol | OpenAI | medium |
| Claude Opus 5.5 | Anthropic | medium |
| Kimi K3.1 Pro | Moonshot | medium |
| Claude Sonnet 5.5 | Anthropic | medium |

## Builder

Features, bug fixes, and remediation in a repository.

| Model | Family | Effort |
| --- | --- | --- |
| GPT-6.1 Sol (in Codex) | OpenAI | medium |
| Claude Opus 5.5 | Anthropic | medium |
| Claude Sonnet 5.5 | Anthropic | medium |
| GLM-5.3 | Zhipu (Z.ai) | medium |

## Cheap builder

Scoped, well-specified implementation and fixes after review.

| Model | Family | Effort |
| --- | --- | --- |
| GPT-6 Luna | OpenAI | low |
| Claude Haiku 5.5 | Anthropic | low |
| DeepSeek V4.1 Flash | DeepSeek | low |

## Deep reviewer and architect

Architecture review, readiness decisions, hard refactors.

| Model | Family | Effort |
| --- | --- | --- |
| Claude Opus 5.5 | Anthropic | high |
| GPT-6.1 Sol | OpenAI | high |
| Kimi K3.1 Pro | Moonshot | high |

Escalate only when the first choice still falls short on a hard step: Claude Fable 5.1 (Anthropic) or GPT-6 Astra (OpenAI), each the most capable model in its family.

## Everyday reviewer and writer

Code review, documentation, feature work.

| Model | Family | Effort |
| --- | --- | --- |
| Claude Sonnet 5.5 | Anthropic | medium |
| GPT-6.1 Sol | OpenAI | medium |
| Kimi K3.1 Pro | Moonshot | medium |

## Dense reviewer

Code and regression review, acceptance criteria.

| Model | Family | Effort |
| --- | --- | --- |
| Kimi K3.1 Pro | Moonshot | medium |
| GLM-5.3 | Zhipu (Z.ai) | medium |
| GPT-6.1 Sol | OpenAI | medium |
| Claude Sonnet 5.5 | Anthropic | medium |

## Spec validator

Requirements validation, spec sign-off, security-leaning review. Not for building.

| Model | Family | Effort |
| --- | --- | --- |
| GLM-5.3 (text only) | Zhipu (Z.ai) | medium |
| Kimi K3.1 Pro | Moonshot | medium |
| Claude Sonnet 5.5 | Anthropic | medium |
| GPT-6.1 Sol | OpenAI | medium |

## Bulk scanner

Large-context scans, repo audits, high-volume summaries.

| Model | Family | Effort |
| --- | --- | --- |
| DeepSeek V4.1 Flash | DeepSeek | low |
| GPT-6 Luna | OpenAI | low |
| Claude Haiku 5.5 | Anthropic | low |

## Where each model is reached

Availability depends on the plan; confirm in the tool's model picker.

- OpenAI models: Codex and ChatGPT. As of the sources below, Plus includes Sol and Luna in Codex; plan access to Astra was not stated.
- Anthropic models: Claude apps and the API. Plan access to Fable 5.1 was not checked.
- Moonshot, Zhipu, and DeepSeek models: OpenCode Go lists `kimi-k3.1-pro`, `glm-5.3`, and `deepseek-v4.1-flash`, selected as `opencode-go/<model-id>`. Go applies per-model monthly dollar limits, so heavy use of one model can run out before the others.

## Sources

- OpenAI: [Using GPT-6](https://developers.openai.com/api/docs/guides/latest-model), [Models](https://developers.openai.com/api/docs/models), [Codex models](https://developers.openai.com/codex/models), and the [Sol and Luna rollout in Codex](https://9to5mac.com/2026/09/22/openai-upgrading-chatgpt-and-codex-with-two-more-gpt-6-models/).
- Anthropic: [Models overview](https://platform.claude.com/docs/en/models/overview).
- OpenCode: [Go](https://opencode.ai/docs/go/) model list.
- Moonshot: [Kimi K3 launch coverage](https://pulse2.com/moonshot-ai-launches-kimi-k3-for-advanced-reasoning-coding-and-knowledge-work/). K3.1 Pro was confirmed only on the OpenCode Go list.
- Zhipu (Z.ai): [GLM-5.3 release coverage](https://datanorth.ai/news/z-ai-releases-glm-5-3).
- DeepSeek: [DeepSeek V4.1 Flash listing](https://llmgateway.io/models/deepseek-v4.1-flash).

The Moonshot, Zhipu, and DeepSeek vendor sites were not reachable from this environment, so those three rows rest on third-party coverage plus the OpenCode list. Check each vendor's own site when you recheck.
