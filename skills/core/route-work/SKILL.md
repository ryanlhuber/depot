---
name: route-work
description: "Recommends which skill, agent, or workflow fits the situation, and which models and effort levels to use. Use when unsure where to start or what to use next. Recommends only; it does not run the work."
---

# Route Work

## Purpose
Turn a described situation into a short, justified recommendation: the one artifact to start with, what to chain after it, and a small set of models with an effort level for each step.

## When to use
- Use when: the user describes a goal, a stuck point, or a stage ("I have a vague idea", "this change needs review") and has not named a skill; or asks "what should I use?" or "what's next?".
- Do not use when: the user already named the skill, agent, or workflow, or the task is a single obvious step.

## Inputs
- Required: the user's situation in their own words.
- Optional: what already exists (spec, design, diff, backlog), the repository, which plans or models the user can use, and a model table.
- Model table: a Markdown table of roles, models, families, and effort levels. The user supplies it, the project's instructions name it, or it is found at `integrations/model-routing/models.md` in a checkout of the library.
- Assumptions: the routing map sits next to this skill. It lists library artifacts that may not be installed in the user's project.

## Process
1. Restate the goal in one sentence. Ask at most one question, and only if the answer would change the recommendation. Never ask about project size or type; a project is a project, and the same artifact and model advice apply as it grows.
2. Place the situation in the [routing map](routing-map.md): find the stage, then the row that matches what the user has in hand.
3. Choose the smallest artifact that fully owns the need. A **skill** when one capability is enough. An **agent** when a persistent decision owner adds something. A **workflow** when several stages need ordered handoffs.
4. Recommend one primary artifact, then at most two more artifacts in total, counting follow-ups and alternates together, each with a one-line reason tied to the user's situation.
5. Name what the primary artifact needs from the user, so they can start immediately.
6. Recommend models, two or three at most, each with an effort level (`low`, `medium`, or `high`) for the main step and one for any review step. With a model table, take the first model in each role's list that the user can use. Without one, name the capability role instead: the strongest available reasoning model for decisions, architecture, security, and final review; a mid-tier model for planning, writing, and everyday review; a fast, inexpensive model for scoped, well-specified builds and bulk scans. Say that a model table would let the router name specific models. Prefer a different model family for each reviewer. Where a workflow requires distinct families (the standard review path), say so when they cannot be reached. Where it only prefers them (the light path), and the user can reach only one family, recommend a fresh-session reviewer from that family and label it a same-family review.
7. If nothing fits, say so and name the closest artifact and what is missing. Do not invent a skill.

## Rules and heuristics
- Required: recommend only artifacts that exist in the routing map. A name that is not in the map is not a recommendation.
- Required: the router never runs the recommended artifact and never reproduces its method. If a recommended artifact is not installed in the user's project, say so and point to the library; do not perform its work.
- Required: never name a model that is not in a table the user supplied or the project provides.
- Required: when a workflow requires or prefers independent parties, carry that requirement or preference into the model advice; never suggest two versions of one family as distinct families.
- Recommended: set effort by step type, never by project size: `low` for scoped, well-specified build steps, `medium` for planning and synthesis, `high` for architecture, security, and final review steps.
- Recommended: prefer the cheaper model for scoped, well-specified steps and keep the strongest model for decisions and reviews.
- Recommended: keep the whole answer to roughly 10 lines.

## Checks
- Every recommended skill, agent, and workflow appears in the routing map as written.
- The recommendation names one primary artifact, not a menu.
- Model advice states an effort level per step, respects any independence requirement, and names only models from an available table (otherwise capability roles).

## Output
Return: the one-sentence goal; the primary artifact and why; up to two follow-ups or alternates; what the user must supply; the model line per step (a model from the table, or a capability role when no table is available, with the effort level); and any gap found.

## Completion criteria
- The user can start the primary artifact from the answer alone.
