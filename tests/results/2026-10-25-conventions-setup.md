# Repo conventions setup, target branch and runtime, 2026-10-25

Model: a Claude Sonnet 5.5 subagent, the same family as the author, so this run is not independent. It was given only the skill and its template and two fictional repositories, ran read-only, and was asked what it would record and ask. One run per case, scored by the author.

| Case | Artifact | Kind | Expected | Actual | Verdict | Reason |
| --- | --- | --- | --- | --- | --- | --- |
| Target branch not assumed | `repo-conventions-setup` | output | Target branch `develop` from the contributing guide; `main` not assumed | Recorded `develop` with the guide as evidence, noted that the git default differs, and did not ask about it | Pass | Matches the expected outcome |
| Runtime and setup recorded | `repo-conventions-setup` | output | Runtime, install, and build commands from the README, marked unverified; none invented | Recorded Node 20, `npm ci`, and `npm run build` from the README, all unverified, plus the `lint` script from package.json | Pass | Matches the expected outcome |
| Unknown stays open (extra fixture: no branch, runtime, or package manager stated) | `repo-conventions-setup` | output | Unknowns listed as open and asked; nothing invented | Target branch, runtime, install, and build left open; declined to write "none" for build or to guess `npm test`; asked each one | Pass | Matches the expected outcome |
