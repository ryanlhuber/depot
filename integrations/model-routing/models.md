# Model routing table

Environment-specific data for `kit-router`. Belongs in `integrations/`, not in a portable skill, because it names models and providers. Replace freely.

Last checked: 2026-10-24 against the sources below. Model lineups change often, so recheck before relying on a row. Effort levels are starting defaults to tune, not measured results. Verify availability on your current plans before relying on a row.

Effort: `low` = fast pass, `medium` = normal, `high` = deepest reasoning. Effort follows the step, not the size of the project, so nothing changes when a small project grows. Providers name their levels differently (OpenAI also offers `xhigh` and `max`); map these three onto the nearest level the model accepts.

| Role | Model | Family | Effort | Use for |
| --- | --- | --- | --- | --- |
| Planner and synthesizer | GPT-6.1 Sol | OpenAI | medium | Discovery, epics and issues, review consolidation |
| Builder | GPT-6.1 Sol in Codex | OpenAI | medium | Features, bug fixes, remediation in a repository |
| Cheap builder | GPT-6 Luna | OpenAI | low | Scoped, well-specified implementation and fixes after review |
| Deep reviewer and architect | Claude Opus 5.5 | Anthropic | high | Architecture review, readiness decisions, hard refactors |
| Everyday reviewer and writer | Claude Sonnet 5.5 | Anthropic | medium | Code review, documentation, feature work |
| Dense reviewer | Kimi K3.1 Pro | Moonshot | medium | Code and regression review, acceptance criteria |
| Spec validator | GLM-5.3 | Zhipu (Z.ai) | medium | Requirements validation, spec sign-off, security-leaning review. Text only |
| Bulk scanner | DeepSeek V4.1 Flash | DeepSeek | low | Large-context scans, repo audits, high-volume summaries |

Optional escalations, used only when the row above falls short on a hard step:

| Model | Family | Use for |
| --- | --- | --- |
| GPT-6 Astra | OpenAI | Most capable OpenAI model; complex reasoning and coding |
| Claude Fable 5.1 | Anthropic | Demanding reasoning when Opus 5.5 at high effort still falls short |
| Claude Haiku 5.5 | Anthropic | Cheap, fast classification, extraction, and routing steps |

## Rules

- Independent reviews (for example in `refine-to-merge`) use three different families across builder, first reviewer, and adversarial reviewer. Versions of one family do not count.
- Example independent set: builder GPT-6.1 Sol in Codex (OpenAI), first review Kimi K3.1 Pro (Moonshot), adversarial review Claude Opus 5.5 (Anthropic).
- Keep the strongest model for decisions and reviews. Run scoped, well-specified build steps on the cheaper model.
- To protect usage limits, spend `high` effort only on the review and decision steps; lower the effort of the build step before lowering the review's.
- Switch models at stage boundaries, after writing a handoff note.

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
