# Integrations

This directory owns concrete, replaceable adapters and extensions for harnesses, providers, design tools, frameworks, libraries, platforms, and other technologies. Add structure only when implementing a concrete integration.

Portable Skills, Agents, Workflows, capability semantics, and repository-wide standards do not belong here. Keep them in their core directories or [`docs/`](../docs/) as appropriate; an adapter may depend inward on those definitions, but portable core artifacts must not depend on the adapter.

Use the canonical [portability and integration boundaries](../docs/portability-and-integration-boundaries.md) to decide placement and document an integration contract.

## Current integrations

- [Skill sync](skill-sync/README.md): keeps copies of these skills and agents in another repository up to date.
- [Model routing](model-routing/models.md): the short list of models, families, and effort levels that `route-work` recommends from. It names models, so it lives here rather than in a portable skill.
