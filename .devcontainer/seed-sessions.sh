#!/usr/bin/env bash
# Seed demo/sessions/*.jsonl into Claude Code's session history so cc-pick and
# ccview have real past sessions to open (chapter 10: extract a skill from a
# session). Idempotent: never overwrites a session that already exists.
set -euo pipefail

workspace="${1:-$PWD}"
src="$workspace/demo/sessions"
[ -d "$src" ] || { echo "seed-sessions: no $src, skipping"; exit 0; }

# Claude Code names the project dir after the workspace path, one dash per
# separator: /workspaces/foo -> -workspaces-foo
project_dir="$HOME/.claude/projects/$(echo "$workspace" | sed 's|[/.]|-|g')"
mkdir -p "$project_dir"

seeded=0
for f in "$src"/*.jsonl; do
  [ -e "$f" ] || continue
  if [ ! -e "$project_dir/$(basename "$f")" ]; then
    cp "$f" "$project_dir/"
    seeded=$((seeded + 1))
  fi
done
echo "seed-sessions: $seeded new session(s) -> $project_dir"

# Pin display titles in cc-pick's cache (source=manual never expires there).
# Without this, cc-pick's Haiku titler invents its own names and outranks the
# custom-title records inside the .jsonl files.
title_cache="$HOME/.cache/cc-session-titles"
mkdir -p "$title_cache"
now=$(date +%s)
while IFS=$'\t' read -r uuid title; do
  [ -n "$uuid" ] || continue
  sess="$project_dir/$uuid.jsonl"
  [ -e "$sess" ] || continue
  mt=$(stat -c %Y "$sess" 2>/dev/null || stat -f %m "$sess")
  printf '{"title":"%s","source":"manual","generated_at":%s,"session_mtime_at_gen":%s}\n' \
    "$title" "$now" "$mt" > "$title_cache/$uuid.json"
done <<'EOF'
146a2acf-d4e1-4399-9d66-3358995418aa	Checkout service unreachable — support escalation
a38137f2-af0f-4cf8-a766-8b5b9342411f	Golden path: scaffold the payments service
b8f03a0d-0375-4ae2-9aa7-3ea6fdb7f02b	Review my Pulumi code — the bucket arg
4a7c91c7-d85a-4dc0-bce0-b14bad0c00f3	Prod incident: payments crashloop triage
ba67cb4c-e621-4e95-b7d4-87751b20d349	New payments service — first run
EOF
echo "seed-sessions: display titles pinned"
