#!/bin/sh
# Mirror each maintained skill and agent into the folders that harnesses discover them from.
# The maintained source is the only place to edit; the copies are generated. Never
# edit them by hand.
#
# Skills are folders under SOURCE_ROOT. Agents are single Markdown files under
# AGENT_SOURCE_ROOT (README.md there is the index, not an agent).
#
# Usage:
#   scripts/sync-adapters.sh          copy every skill and agent into each target, remove stale copies
#   scripts/sync-adapters.sh --check  change nothing; exit non-zero if any copy is
#                                     missing, differs from its source, or has no source
#
# Skills are grouped in bucket folders, skills/<bucket>/<name>, and mirrored flat, one
# folder per skill, because harnesses discover skills one folder level deep.
set -eu

# --- repository settings -----------------------------------------------------
SOURCE_ROOT="skills"                        # where the maintained skills live
SOURCE_DEPTH=2                             # 2: SOURCE_ROOT/<group>/<name>   1: SOURCE_ROOT/<name>
TARGETS=".agents/skills .claude/skills"       # generated copies, one folder per skill
AGENT_SOURCE_ROOT="agents"                  # where the maintained agents live, one <name>.md each
AGENT_TARGETS=".claude/agents"              # generated copies, one file per agent
# -----------------------------------------------------------------------------

usage() { echo "usage: scripts/sync-adapters.sh [--check]" >&2; exit 2; }
mode=sync
case "${1:-}" in
  '') ;;
  --check) mode=check ;;
  *) usage ;;
esac
[ "$#" -le 1 ] || usage

root=$(cd "$(dirname "$0")/.." && pwd)
source_dir="$root/$SOURCE_ROOT"
[ -d "$source_dir" ] || { echo "missing source directory: $SOURCE_ROOT" >&2; exit 1; }

list_sources() {
  find "$source_dir" -mindepth "$SOURCE_DEPTH" -maxdepth "$SOURCE_DEPTH" -type d | sort
}

sources=$(list_sources)
[ -n "$sources" ] || { echo "no skills found under $SOURCE_ROOT" >&2; exit 1; }

names=$(printf '%s\n' "$sources" | sed 's|.*/||')
duplicates=$(printf '%s\n' "$names" | sort | uniq -d)
if [ -n "$duplicates" ]; then
  echo "duplicate skill names: $(printf '%s' "$duplicates" | tr '\n' ' ')" >&2
  exit 1
fi

is_source_name() { printf '%s\n' "$names" | grep -Fxq -- "$1"; }

status=0
count=0
for src in $sources; do
  name=${src##*/}
  count=$((count + 1))
  for target in $TARGETS; do
    copy="$root/$target/$name"
    if [ "$mode" = check ]; then
      if [ ! -d "$copy" ]; then
        echo "missing: $target/$name" >&2; status=1
      elif ! diff -r "$src" "$copy" >/dev/null 2>&1; then
        echo "out of sync: $target/$name differs from its source" >&2; status=1
      fi
    else
      mkdir -p "$root/$target"
      rm -rf "$copy"
      cp -R "$src" "$copy"
    fi
  done
done

# Copies with no source skill are stale (a skill was renamed or removed).
for target in $TARGETS; do
  [ -d "$root/$target" ] || continue
  for copy in "$root/$target"/*; do
    [ -e "$copy" ] || continue
    name=${copy##*/}
    if ! is_source_name "$name"; then
      if [ "$mode" = check ]; then
        echo "stale: $target/$name has no source skill" >&2; status=1
      else
        rm -rf "$copy"
      fi
    fi
  done
done

# --- agents ------------------------------------------------------------------
# A kit with no agents has nothing to mirror and creates no target folder.
agent_sources=""
if [ -d "$root/$AGENT_SOURCE_ROOT" ]; then
  agent_sources=$(find "$root/$AGENT_SOURCE_ROOT" -mindepth 1 -maxdepth 1 -type f -name '*.md' ! -name README.md | sort)
fi
agent_names=$(printf '%s\n' "$agent_sources" | sed -n 's|.*/||; s|\.md$||; /./p')

is_agent_name() { printf '%s\n' "$agent_names" | grep -Fxq -- "$1"; }

agent_count=0
for src in $agent_sources; do
  file=${src##*/}
  agent_count=$((agent_count + 1))
  for target in $AGENT_TARGETS; do
    copy="$root/$target/$file"
    if [ "$mode" = check ]; then
      if [ ! -f "$copy" ]; then
        echo "missing: $target/$file" >&2; status=1
      elif ! cmp -s "$src" "$copy"; then
        echo "out of sync: $target/$file differs from its source" >&2; status=1
      fi
    else
      mkdir -p "$root/$target"
      cp "$src" "$copy"
    fi
  done
done

# Copies with no source agent are stale (an agent was renamed or removed).
for target in $AGENT_TARGETS; do
  [ -d "$root/$target" ] || continue
  for copy in "$root/$target"/*.md; do
    [ -e "$copy" ] || continue
    file=${copy##*/}
    if ! is_agent_name "${file%.md}"; then
      if [ "$mode" = check ]; then
        echo "stale: $target/$file has no source agent" >&2; status=1
      else
        rm -f "$copy"
      fi
    fi
  done
done

if [ "$mode" = check ]; then
  if [ "$status" -eq 0 ]; then
    echo "$count skills in sync across: $TARGETS"
    [ "$agent_count" -eq 0 ] || echo "$agent_count agents in sync across: $AGENT_TARGETS"
  fi
  exit "$status"
fi
echo "synced $count skills from $SOURCE_ROOT -> $TARGETS"
[ "$agent_count" -eq 0 ] || echo "synced $agent_count agents from $AGENT_SOURCE_ROOT -> $AGENT_TARGETS"
