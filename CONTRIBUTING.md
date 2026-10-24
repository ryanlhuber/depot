# Contributing to depot

Thank you for contributing. Before proposing a change:

1. Identify the concrete, reusable problem and intended outcome.
2. Check the [core artifact architecture](docs/core-artifact-architecture.md) and the relevant directory README to classify and place the change, and choose the skill bucket that matches the kind of work.
3. Follow the [artifact authoring standards](docs/artifact-authoring-standards.md) for Skills, Agents, and Workflows.
4. Apply the canonical [contribution, evidence, and quality standards](docs/contribution-evidence-and-quality-standards.md), including the proportional proposal and review guidance.
5. Verify the [portability and integration boundary](docs/portability-and-integration-boundaries.md), then submit the smallest complete change with its validation evidence.
6. Run `scripts/sync-adapters.sh` after editing skills or agents, update `skills/core/kit-router/routing-map.md` when you add, rename, or remove an artifact, and run `tests/validate-repository.sh` before submitting. Use the [behavioral cases](tests/behavioral-cases.md) for changes that affect model behavior.

Canonical governance and quality requirements live in `docs/`; this file is only the contributor entry point.
