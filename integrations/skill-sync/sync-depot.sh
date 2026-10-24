#!/usr/bin/env bash
# Sync skills and agents from depot into this repository's .agents/ and
# .claude/ folders: skills go to skills/<name>/ (flat; depot's bucket folders are
# not copied), agents to agents/<name>.md in each. Only skills and agents this script installed (recorded in its lock file)
# are replaced or removed. Items from other libraries and local ones are left
# alone, and the script refuses to overwrite them.
#
# Usage, from the repository that uses the kit:
#   scripts/sync-depot.sh [path/to/depot]          copy the listed skills and agents in
#   scripts/sync-depot.sh [path/to/depot] --check  report drift; change nothing
#
# The path defaults to ../depot, next to this repository. Choose skills in
# skills-depot.txt and, optionally, agents in agents-depot.txt. Never
# edit the copies; change the skill or agent in depot and sync again.
#
# The maintained copy of this script is in depot at
# integrations/skill-sync/sync-depot.sh.
# Each sync also refreshes this file from that copy. Setup guide:
# https://github.com/ryanlhuber/depot/blob/main/integrations/skill-sync/README.md
set -euo pipefail

# --- library settings -------------------------------------------------------
LIB="depot"
SOURCE_REPO="ryanlhuber/depot"
KIT_SCRIPT_PATH="integrations/skill-sync/sync-depot.sh" # maintained copy, relative to the kit
find_skill() { # print the library folder for skill "$1" in any bucket, or nothing
  local d
  for d in "$KIT"/skills/*/"$1"; do
    if [ -d "$d" ]; then echo "$d"; return 0; fi
  done
  return 0
}
find_agent() { # print the library file for agent "$1", or nothing
  [ -f "$KIT/agents/$1.md" ] && echo "$KIT/agents/$1.md" || true
}
# ----------------------------------------------------------------------------

REPO="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
SELF="$REPO/scripts/sync-$LIB.sh"
LIST="$REPO/skills-$LIB.txt"
AGENT_LIST="$REPO/agents-$LIB.txt"
LOCK="$REPO/skills-$LIB.lock"
ADAPTERS=".agents .claude"

usage() { echo "usage: scripts/sync-$LIB.sh [/path/to/$LIB] [--check]" >&2; exit 2; }
kit_arg="" MODE=sync
for arg in "$@"; do
  case "$arg" in
    --check) MODE=--check ;;
    -*) usage ;;
    *) [ -z "$kit_arg" ] || usage; kit_arg="$arg" ;;
  esac
done
kit_arg="${kit_arg:-$(dirname "$REPO")/$LIB}"
[ -d "$kit_arg" ] || { echo "error: no $LIB checkout at $kit_arg; clone https://github.com/$SOURCE_REPO there or pass its path" >&2; exit 1; }
KIT="$(CDPATH= cd -- "$kit_arg" && pwd)"
[ "$KIT" != "$REPO" ] || { echo "error: run this from a repository that uses $LIB, not from $LIB itself" >&2; exit 1; }
[ -f "$LIST" ] || { echo "error: missing skills-$LIB.txt; see the setup guide in $LIB" >&2; exit 1; }
git -C "$KIT" rev-parse --git-dir >/dev/null 2>&1 || { echo "error: $KIT is not a git checkout" >&2; exit 1; }
KIT_SCRIPT="$KIT/$KIT_SCRIPT_PATH"

list_names() { # names in a list file, without comments and blank lines
  [ -f "$1" ] || return 0
  { grep -v '^[[:space:]]*#' "$1" || true; } | sed 's/[[:space:]]*$//' | sed '/^$/d'
}
lock_names() { # lock_names FILE SECTION: the names a lock file records under "skills:" or "agents:"
  [ -f "$1" ] || return 0
  awk -v sec="$2:" '$0 == sec { on = 1; next } /^[a-z]+:/ { on = 0 } on && sub(/^- /, "") { print }' "$1"
}
agent_skills() { # the skills an agent file names under "## Skills"
  awk '/^## / { on = ($0 == "## Skills") } on' "$1" | sed -n 's/^- `\([a-z0-9-]*\)`.*/\1/p'
}
has() { printf '%s\n' $2 | grep -qx -- "$1"; }

wanted=$(list_names "$LIST")
wanted_agents=$(list_names "$AGENT_LIST")
installed=$(lock_names "$LOCK" skills)
installed_agents=$(lock_names "$LOCK" agents)
others="" others_agents=""
for f in "$REPO"/skills-*.lock; do
  if [ -e "$f" ] && [ "$f" != "$LOCK" ]; then
    others="$others $(lock_names "$f" skills)"
    others_agents="$others_agents $(lock_names "$f" agents)"
  fi
done

status=0
for name in $wanted; do
  if [ -z "$(find_skill "$name")" ]; then
    echo "error: $name is not in $LIB" >&2; status=1
  elif has "$name" "$others"; then
    echo "error: $name is already installed by another library; remove it from one list" >&2; status=1
  elif ! has "$name" "$installed"; then
    for a in $ADAPTERS; do
      if [ -e "$REPO/$a/skills/$name" ]; then
        echo "error: $a/skills/$name exists but was not installed from $LIB; move or rename it first" >&2; status=1
      fi
    done
  fi
done
for name in $wanted_agents; do
  if [ -z "$(find_agent "$name")" ]; then
    echo "error: agent $name is not in $LIB" >&2; status=1
  elif has "$name" "$others_agents"; then
    echo "error: agent $name is already installed by another library; remove it from one list" >&2; status=1
  elif ! has "$name" "$installed_agents"; then
    for a in $ADAPTERS; do
      if [ -e "$REPO/$a/agents/$name.md" ]; then
        echo "error: $a/agents/$name.md exists but was not installed from $LIB; move or rename it first" >&2; status=1
      fi
    done
  fi
done
[ "$status" -eq 0 ] || exit "$status"

# An agent applies skills by name. Warn when one it names is not installed here.
warn_missing_skills() {
  local name src skill
  for name in $wanted_agents; do
    src=$(find_agent "$name")
    for skill in $(agent_skills "$src"); do
      [ -d "$REPO/.agents/skills/$skill" ] || echo "warning: agent $name uses skill $skill, which is not installed in this repository"
    done
  done
}

head_commit=$(git -C "$KIT" rev-parse HEAD)

if [ "$MODE" = --check ]; then
  locked_commit=$(sed -n 's/^commit: //p' "$LOCK" 2>/dev/null || true)
  if [ -z "$locked_commit" ]; then
    echo "never synced: run scripts/sync-$LIB.sh"; status=1
  elif [ "$locked_commit" != "$head_commit" ]; then
    echo "lock is at ${locked_commit:0:7}; $LIB checkout is at ${head_commit:0:7}"
  fi
  for name in $wanted; do
    src=$(find_skill "$name")
    for a in $ADAPTERS; do
      if [ ! -d "$REPO/$a/skills/$name" ]; then
        echo "missing: $a/skills/$name"; status=1
      elif ! diff -rq "$src" "$REPO/$a/skills/$name" >/dev/null; then
        echo "out of date: $a/skills/$name"; status=1
      fi
    done
  done
  for name in $installed; do
    has "$name" "$wanted" || { echo "no longer listed, still installed: $name"; status=1; }
  done
  for name in $wanted_agents; do
    src=$(find_agent "$name")
    for a in $ADAPTERS; do
      if [ ! -f "$REPO/$a/agents/$name.md" ]; then
        echo "missing: $a/agents/$name.md"; status=1
      elif ! cmp -s "$src" "$REPO/$a/agents/$name.md"; then
        echo "out of date: $a/agents/$name.md"; status=1
      fi
    done
  done
  for name in $installed_agents; do
    has "$name" "$wanted_agents" || { echo "no longer listed, still installed: agent $name"; status=1; }
  done
  warn_missing_skills
  if [ -f "$KIT_SCRIPT" ] && ! cmp -s "$KIT_SCRIPT" "$SELF"; then
    echo "out of date: scripts/sync-$LIB.sh"; status=1
  fi
  [ "$status" -eq 0 ] && echo "$LIB skills and agents are in sync"
  exit "$status"
fi

# Remove this library's skills and agents that were dropped from the lists.
for name in $installed; do
  if ! has "$name" "$wanted"; then
    for a in $ADAPTERS; do rm -rf "${REPO:?}/$a/skills/$name"; done
    echo "removed $name"
  fi
done
for name in $installed_agents; do
  if ! has "$name" "$wanted_agents"; then
    for a in $ADAPTERS; do rm -f "${REPO:?}/$a/agents/$name.md"; done
    echo "removed agent $name"
  fi
done

for name in $wanted; do
  src=$(find_skill "$name")
  for a in $ADAPTERS; do
    mkdir -p "$REPO/$a/skills"
    rm -rf "${REPO:?}/$a/skills/$name"
    cp -R "$src" "$REPO/$a/skills/$name"
  done
  echo "synced $name"
done
for name in $wanted_agents; do
  src=$(find_agent "$name")
  for a in $ADAPTERS; do
    mkdir -p "$REPO/$a/agents"
    cp "$src" "$REPO/$a/agents/$name.md"
  done
  echo "synced agent $name"
done
warn_missing_skills

{
  echo "# Written by scripts/sync-$LIB.sh. Do not edit."
  echo "source: $SOURCE_REPO"
  echo "branch: $(git -C "$KIT" rev-parse --abbrev-ref HEAD)"
  echo "commit: $head_commit"
  [ -z "$(git -C "$KIT" status --porcelain | head -n 1)" ] || echo "warning: $LIB checkout had uncommitted changes when synced"
  echo "skills:"
  for name in $wanted; do echo "- $name"; done
  if [ -n "$wanted_agents" ]; then
    echo "agents:"
    for name in $wanted_agents; do echo "- $name"; done
  fi
} > "$LOCK"
echo "recorded $LIB at ${head_commit:0:7} in skills-$LIB.lock"

# Refresh this script from the kit last. Replacing the file by rename keeps
# the running copy intact.
if [ -f "$KIT_SCRIPT" ] && ! cmp -s "$KIT_SCRIPT" "$SELF"; then
  tmp=$(mktemp "$REPO/scripts/.sync-$LIB.XXXXXX")
  cp "$KIT_SCRIPT" "$tmp"
  chmod +x "$tmp"
  mv "$tmp" "$SELF"
  echo "updated scripts/sync-$LIB.sh from $LIB"
fi
