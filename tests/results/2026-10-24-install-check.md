# Install check, 2026-10-24

This records an installation attempt made by the repository owner on their own machine. It is not a model run, and nothing here was executed by the author of the skills. Every statement below is what the owner reported.

- Tool: pnpm 12.15.0, command `pnpm dlx skills@latest add ryanlhuber/depot`, run in a local scratch project.
- First attempt with `npx skills@latest add ryanlhuber/depot` failed with `EBADDEVENGINES` because that project's `package.json` requires pnpm. The same session also contained a mistyped repository name. Neither is a depot defect.
- The installer reported 59 skills found.
- Skills were written to `.agents/skills/`.
- `kit-router` contained `SKILL.md` and `routing-map.md`. `problem-framing/templates/problem-frame.md` was present. `bug-fix` contained `SKILL.md` only, which matches its source.
- The owner reported the installed skills worked when invoked.

| Check | Verdict |
| --- | --- |
| Installer discovers all skills in the bucket layout | Pass (59 reported) |
| Supporting files copied with the skill | Pass (two examples inspected) |
| Skills usable after install | Pass (owner report, not independently observed) |

Not checked: installing agents or workflows with the installer, installing for harnesses other than the one used, and updating with `skills update`.
