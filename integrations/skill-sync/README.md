# Skill and agent sync for consuming repositories

This adapter keeps copies of depot Skills and Agents in another repository up to date. A consuming repository lists the Skills, and optionally the Agents, it wants; one command refreshes them from a local checkout of this repository and records the commit they came from. It implements no Skill, Agent, or Workflow semantics; removing it changes nothing in the portable core.

The adapter only touches Skills and Agents it installed. Items from another library (for example a work library with its own sync script) and items written in the consuming repository are left alone, and the adapter refuses to overwrite them.

An Agent applies Skills by name, so install the Skills an Agent lists under its `## Skills` section. Sync warns, without failing, when an installed Agent names a Skill that is not installed in the repository.

## What a consuming repository has

| File | Purpose |
| --- | --- |
| `scripts/sync-depot.sh` | Copy of [`sync-depot.sh`](sync-depot.sh). Each sync refreshes it from here. |
| `skills-depot.txt` | Skills the repository wants, one name per line. `#` starts a comment. |
| `agents-depot.txt` | Optional. Agents the repository wants, one name per line, named by their file in [`agents/`](../../agents/) without `.md`. Without it, no agents are installed. |
| `skills-depot.lock` | Written by the script: source commit, installed Skills, and installed Agents. Commit it; do not edit it. |
| `.agents/skills/<name>/`, `.claude/skills/<name>/` | Synced Skill copies. Do not edit them. |
| `.agents/agents/<name>.md`, `.claude/agents/<name>.md` | Synced Agent copies. Do not edit them. Claude Code discovers `.claude/agents/`; `.agents/agents/` is the harness-neutral copy for other tools. |

## Set up a repository

1. Clone this repository next to the consuming repository, so that `../depot` exists. Another location works if you pass its path to the script.
2. Copy [`sync-depot.sh`](sync-depot.sh) into the consuming repository's `scripts/` folder and make it executable.
3. Create `skills-depot.txt` in its root and list the Skills you want. Names are the skill folder names under [`skills/`](../../skills/), without the bucket: `skills/dev/security-audit/` is listed as `security-audit`. To use Agents, also create `agents-depot.txt` and list them, and make sure every Skill each Agent names is in the Skills list.
4. From its root, run `scripts/sync-depot.sh`.
5. If it has a formatter or linter, exclude `.agents/` and `.claude/`, so the copies stay identical to this repository.
6. Add the [agent instructions](#agent-instructions) to its `AGENTS.md`.
7. Commit the script, list, lock file, and Skill copies.

## Update

```sh
cd ../depot && git pull && cd -     # get the latest Skills and Agents
scripts/sync-depot.sh --check       # see what is behind; changes nothing
scripts/sync-depot.sh               # sync
```

Then run the consuming repository's own checks and commit. To add or remove a Skill or Agent, edit `skills-depot.txt` or `agents-depot.txt` and sync. A removed name is deleted from both folders it was copied to.

A repository that already has the script gets this feature in two steps: the first sync refreshes the script itself, and the next one reads `agents-depot.txt`.

## Agent instructions

Paste this into the consuming repository's `AGENTS.md` and adjust the checks line. An agent can then update Skills and Agents from any environment, including a cloud session started from a phone.

```md
## Updating skills and agents

Skills in `.agents/skills/` and `.claude/skills/`, and agents in `.agents/agents/` and `.claude/agents/`, are synced copies. Never edit them; change the skill or agent in its library and sync again. When asked to update or sync skills or agents:

1. Use only the library that was asked for. Skills and agents come from depot (`scripts/sync-depot.sh`, `skills-depot.txt`, `agents-depot.txt`).
2. Make sure a current checkout of the library is next to this repository: clone https://github.com/ryanlhuber/depot to `../depot` if it is missing, otherwise pull its default branch.
3. Run `scripts/sync-depot.sh --check` and report what is behind. Stop if everything is in sync.
4. Run `scripts/sync-depot.sh`.
5. Run this repository's checks: [the project's check and build commands].
6. Commit on a new branch and open a pull request that lists the synced skills and agents and the library commit. Do not push to the default branch.
```

## Integration contract

This section follows the [integration contract checklist](../../docs/portability-and-integration-boundaries.md#integration-contract-checklist).

1. **Scope:** copying selected Skill folders and Agent files from a checkout of this repository into another git repository's `.agents/skills/`, `.claude/skills/`, `.agents/agents/`, and `.claude/agents/`.
2. **Contract mapping:** input is the list files and a checkout; output is identical Skill folders and Agent files plus a lock file naming the source commit, with Skills and Agents in separate sections. Everything is copied unchanged. The lock file of a repository that installs no Agents has no `agents:` section.
3. **Requirements:** Bash, git, and standard POSIX tools. No network access, credentials, or external services; obtaining the checkout is the caller's job.
4. **Configuration:** the Skills list, the optional Agents list, and an optional checkout path (default `../depot`).
5. **Capability negotiation:** `--check` reports missing, out-of-date, unlisted, and never-synced Skills and Agents and an out-of-date script, without changing files. It also warns about an installed Agent that names a Skill the repository does not have; the warning does not change the exit status.
6. **Failure behavior:** every validation runs before any file changes. Unknown names, name clashes with another library's lock file, and unmanaged folders or files with a listed name stop the run with an actionable message. A run that fails during copying can leave partial copies; run it again.
7. **Compatibility:** each sync refreshes the consuming repository's copy of the script from this directory, so repositories converge on the current version. Lock files written before Agents were supported remain valid.
8. **Verification:** `--check` exits non-zero when anything needs a sync and zero when copies match the checkout.
9. **Removal path:** delete the script, list files, and lock file from the consuming repository. Synced Skills and Agents stay as ordinary files.

## Migrating from the earlier kit repositories

Consuming repositories that used `sync-kit-core.sh`, `sync-kit-plan.sh`, `sync-kit-design.sh`, `sync-kit-dev.sh`, or `sync-kit-frontend.sh` switch once:

1. Merge their `skills-kit-*.txt` lists into `skills-depot.txt` and their `agents-kit-*.txt` lists into `agents-depot.txt`.
2. Delete the old `scripts/sync-kit-*.sh`, lists, and `skills-kit-*.lock` files, and delete the skill and agent copies those lock files recorded. The sync refuses to overwrite a copy it did not install, and it refuses a skill another lock file already records.
3. Run `scripts/sync-depot.sh`. The skill content is the same, so the resulting diff should show only the lock file and script changes.
