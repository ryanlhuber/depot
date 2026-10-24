#!/usr/bin/env bash
# Validate repository structure. Fails on integrity problems; warns on style.
#
# Fails on: broken frontmatter, name/folder mismatch, duplicate skill names across
# buckets, missing or oversized description, empty support folders, broken Markdown
# links, skills missing from the indexes, indexed skills that do not exist,
# workflows missing from the workflow index, agents that name no skills, name a
# skill that does not exist, or link to a skill, agents missing from or wrongly
# listed in their indexes, router map entries that do not exist or artifacts the
# router map omits, symlinks, and out-of-sync .agents/ and .claude/ copies.
# Warns on: recommended sections that are absent and skills over 120 lines. The
# authoring standards make sections and length guidance, not compliance rules.
#
# Usage: tests/validate-repository.sh
set -euo pipefail

REPO="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$REPO"

failures=0
warnings=0
fail() { echo "error: $*" >&2; failures=$((failures + 1)); }
warn() { echo "warning: $*" >&2; warnings=$((warnings + 1)); }

[ -d skills ] || fail 'missing skills'
[ -f AGENTS.md ] || fail 'missing AGENTS.md'
[ "$(cat CLAUDE.md 2>/dev/null)" = '@AGENTS.md' ] || fail 'CLAUDE.md must exist and contain only @AGENTS.md'

if [ -n "$(find . -path './.git' -prune -o -type l -print -quit)" ]; then
  fail 'repository contains a symlink'
fi

# --- skills ------------------------------------------------------------------
names=''
keys=''
count=0
for entry in skills/*; do
  if [ -d "$entry" ]; then
    case "${entry##*/}" in *[!a-z0-9-]*|''|-*|*-|*--*) fail "invalid bucket name: $entry" ;; esac
  elif [ "${entry##*/}" != README.md ]; then
    fail "unexpected file in skills: $entry"
  fi
done
for skill_dir in skills/*/*; do
  [ -d "$skill_dir" ] || { fail "unexpected file in a skills bucket: $skill_dir"; continue; }
  name="${skill_dir##*/}"
  bucket="${skill_dir#skills/}"; bucket="${bucket%%/*}"
  if grep -Fxq -- "$name" <<<"$names"; then fail "duplicate skill name across buckets: $name"; fi
  keys="$keys$bucket/$name"$'\n'
  case "$name" in *[!a-z0-9-]*|''|-*|*-|*--*) fail "invalid skill name: $name" ;; esac
  [ "${#name}" -le 64 ] || fail "skill name too long: $name"
  count=$((count + 1))
  names="$names$name"$'\n'
  skill="$skill_dir/SKILL.md"
  [ -f "$skill" ] || { fail "missing SKILL.md: $skill_dir"; continue; }
  [ ! -e "$skill_dir/README.md" ] || fail "redundant top-level skill README: $skill_dir"

  if [ "$(head -n 1 "$skill")" != '---' ]; then
    fail "missing YAML frontmatter: $skill"
    continue
  fi
  end="$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$skill")"
  [ -n "$end" ] || { fail "unterminated YAML frontmatter: $skill"; continue; }
  front="$(sed -n "2,$((end - 1))p" "$skill")"
  grep -Fqx "name: $name" <<<"$front" || fail "name metadata must be exactly 'name: $name': $skill"
  description="$(sed -n 's/^description: //p' <<<"$front" | head -n 1)"
  description="${description#\"}"; description="${description%\"}"
  if [ -z "$description" ]; then
    fail "missing skill description: $skill"
  else
    [ "${#description}" -le 1024 ] || fail "skill description too long: $skill"
    case "$description" in *'Use when'*|*'use when'*) ;; *) warn "description does not say when to use the skill: $skill" ;; esac
  fi

  for section in Purpose 'When to use' Inputs Process Checks Output 'Completion criteria'; do
    grep -Eq "^## $section" "$skill" || warn "no '$section' section: $skill"
  done
  lines="$(wc -l < "$skill")"
  [ "$lines" -le 120 ] || warn "skill is $lines lines, over the 80-120 target: $skill"

  for support in references templates examples; do
    if [ -d "$skill_dir/$support" ]; then
      [ -n "$(find "$skill_dir/$support" -type f -print -quit)" ] || fail "empty support directory: $skill_dir/$support"
    fi
  done
done
[ "$count" -gt 0 ] || fail 'no skills found'

# --- indexes -----------------------------------------------------------------
# skills/README.md links "<bucket>/<name>/SKILL.md"; README.md links "skills/<bucket>/<name>/SKILL.md".
for key in $keys; do
  grep -Fq "$key/SKILL.md" skills/README.md || fail "skill missing from skills/README.md: $key"
  grep -Fq "skills/$key/SKILL.md" README.md || fail "skill missing from README.md: $key"
done
while IFS= read -r indexed; do
  [ -d "skills/$indexed" ] || fail "skills/README.md lists a skill that does not exist: $indexed"
done < <(grep -oE '\]\([a-z0-9-]+/[a-z0-9-]+/SKILL\.md\)' skills/README.md | sed 's|^](||; s|/SKILL\.md)$||' | sort -u)
while IFS= read -r indexed; do
  [ -d "skills/$indexed" ] || fail "README.md lists a skill that does not exist: $indexed"
done < <(grep -oE 'skills/[a-z0-9-]+/[a-z0-9-]+/SKILL\.md' README.md | sed 's|^skills/||; s|/SKILL\.md$||' | sort -u)

for workflow in workflows/*.md; do
  [ "${workflow##*/}" = README.md ] && continue
  grep -Fq "(${workflow##*/})" workflows/README.md || fail "workflow missing from workflows/README.md: $workflow"
done

# --- agents ------------------------------------------------------------------
agent_count=0
agent_names=''
for agent in agents/*.md; do
  [ -e "$agent" ] || continue
  file="${agent##*/}"
  [ "$file" = README.md ] && continue
  name="${file%.md}"
  case "$name" in *[!a-z0-9-]*|''|-*|*-|*--*) fail "invalid agent name: $name" ;; esac
  [ "${#name}" -le 64 ] || fail "agent name too long: $name"
  agent_count=$((agent_count + 1))
  agent_names="$agent_names$name"$'\n'

  if [ "$(head -n 1 "$agent")" != '---' ]; then
    fail "missing YAML frontmatter: $agent"
    continue
  fi
  end="$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$agent")"
  [ -n "$end" ] || { fail "unterminated YAML frontmatter: $agent"; continue; }
  front="$(sed -n "2,$((end - 1))p" "$agent")"
  grep -Fqx "name: $name" <<<"$front" || fail "name metadata must be exactly 'name: $name': $agent"
  description="$(sed -n 's/^description: //p' <<<"$front" | head -n 1)"
  description="${description#\"}"; description="${description%\"}"
  if [ -z "$description" ]; then
    fail "missing agent description: $agent"
  else
    [ "${#description}" -le 1024 ] || fail "agent description too long: $agent"
    case "$description" in *'Use when'*|*'use when'*) ;; *) warn "description does not say when to use the agent: $agent" ;; esac
  fi

  for section in Role 'When to use' Responsibilities Inputs Skills Process Outputs Constraints 'Completion criteria'; do
    grep -Eq "^## $section" "$agent" || warn "no '$section' section: $agent"
  done

  # Skills are named in backticks under "## Skills", never linked, so the file survives being copied.
  if grep -Eq 'skills/[a-z0-9-]+/[a-z0-9-]+/SKILL\.md|\.agents/skills/' "$agent"; then
    fail "agent links to a skill; name it in backticks instead: $agent"
  fi
  named=0
  while IFS= read -r skill; do
    named=$((named + 1))
    grep -Fxq -- "$skill" <<<"$names" || fail "agent $name names a skill that does not exist: $skill"
  done < <(awk '/^## / { on = ($0 == "## Skills") } on' "$agent" | sed -n 's/^- `\([a-z0-9-]*\)`.*/\1/p')
  [ "$named" -gt 0 ] || fail "agent names no skills under '## Skills': $agent"
done

for name in $agent_names; do
  grep -Fq "(${name}.md)" agents/README.md || fail "agent missing from agents/README.md: $name"
  grep -Fq "(agents/${name}.md)" README.md || fail "agent missing from README.md: $name"
done
while IFS= read -r indexed; do
  [ -f "agents/$indexed.md" ] || fail "agents/README.md lists an agent that does not exist: $indexed"
done < <(grep -oE '\]\([a-z0-9-]+\.md\)' agents/README.md | sed 's|^](||; s|\.md)$||' | sort -u)
while IFS= read -r indexed; do
  [ -f "agents/$indexed.md" ] || fail "README.md lists an agent that does not exist: $indexed"
done < <(grep -oE '\]\(agents/[a-z0-9-]+\.md\)' README.md | sed 's|^](agents/||; s|\.md)$||' | sort -u)

# --- router map ----------------------------------------------------------------
# skills/core/kit-router/routing-map.md may recommend only artifacts that exist, and
# must mention every skill, agent, and workflow (the router itself excepted).
map=skills/core/kit-router/routing-map.md
if [ -f "$map" ]; then
  while read -r kind token; do
    ref="${token//\`/}"
    case "$kind" in
      S) grep -Fxq -- "$ref" <<<"$names" || fail "routing map names a skill that does not exist: $ref" ;;
      A) [ -f "agents/$ref.md" ] || fail "routing map names an agent that does not exist: $ref" ;;
      W) [ -f "workflows/$ref.md" ] || fail "routing map names a workflow that does not exist: $ref" ;;
    esac
  done < <(grep -oE '\b[SAW] `[a-z0-9-]+`' "$map" | sort -u)
  for name in $names; do
    [ "$name" = kit-router ] && continue
    grep -Fq "\`$name\`" "$map" || fail "skill missing from routing map: $name"
  done
  for agent_name in $agent_names; do
    grep -Fq "\`$agent_name\`" "$map" || fail "agent missing from routing map: $agent_name"
  done
  for workflow in workflows/*.md; do
    w="${workflow##*/}"; w="${w%.md}"
    [ "$w" = README ] && continue
    grep -Fq "\`$w\`" "$map" || fail "workflow missing from routing map: $w"
  done
fi

# --- generated copies --------------------------------------------------------
scripts/sync-adapters.sh --check >&2 || fail 'generated copies are out of sync; run scripts/sync-adapters.sh'

# --- Markdown links ----------------------------------------------------------
while IFS= read -r -d '' file; do
  while IFS= read -r target; do
    case "$target" in ''|'#'*|http://*|https://*|mailto:*) continue ;; esac
    target="${target%%#*}"
    [ -n "$target" ] || continue
    case "$target" in
      /*) destination="$target" ;;
      *)
        source_dir='.'
        [[ "$file" == */* ]] && source_dir="${file%/*}"
        destination="$source_dir/$target"
        ;;
    esac
    [ -e "$destination" ] || fail "broken Markdown link in $file: $target"
  done < <(awk '{ line = $0; while (match(line, /\]\([^)]*\)/)) { print substr(line, RSTART + 2, RLENGTH - 3); line = substr(line, RSTART + RLENGTH) } }' "$file")
done < <(
  find skills agents workflows integrations docs examples tests -type f -name '*.md' -print0
  printf '%s\0' README.md AGENTS.md CONTRIBUTING.md
)

if [ "$failures" -ne 0 ]; then
  echo "$failures validation check(s) failed, $warnings warning(s)." >&2
  exit 1
fi
echo "Validated $count skills and $agent_count agents ($warnings warning(s))."
