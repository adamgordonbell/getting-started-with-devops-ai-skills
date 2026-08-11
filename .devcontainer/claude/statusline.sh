#!/bin/bash
# Claude Code status line: model | project root | branch | session id | context use
input=$(cat)
model=$(printf '%s' "$input" | jq -r '.model.display_name // "?"')
sid=$(printf '%s' "$input"   | jq -r '.session_id // ""')
root=$(printf '%s' "$input"  | jq -r '.workspace.project_dir // .workspace.current_dir // .cwd // ""')
transcript=$(printf '%s' "$input" | jq -r '.transcript_path // ""')

# 1M is tested first: a 1M-context Opus would otherwise match *Opus* and report 400k.
case "$model" in
  *1M*)   LIMIT=1000000 ;;
  *Opus*) LIMIT=400000 ;;
  *)      LIMIT=200000 ;;
esac

ctx=""; ctx_col=""
if [ -f "$transcript" ]; then
  # tac, not `tail -r` — this is Linux.
  tok=$(tac "$transcript" 2>/dev/null \
    | jq -c 'select(.message.usage != null) | .message.usage' 2>/dev/null \
    | head -n1 \
    | jq -r '((.input_tokens // 0) + (.cache_read_input_tokens // 0) + (.cache_creation_input_tokens // 0))' 2>/dev/null)
  if [ -n "$tok" ] && [ "$tok" -gt 0 ] 2>/dev/null; then
    pct=$(( tok * 100 / LIMIT ))
    ctx=$(printf '%dk/%dk %d%%' $(( tok / 1000 )) $(( LIMIT / 1000 )) "$pct")
    if   [ "$pct" -ge 80 ]; then ctx_col='\033[31m'
    elif [ "$pct" -ge 50 ]; then ctx_col='\033[33m'
    else ctx_col='\033[32m'; fi
  fi
fi

branch=$(git -C "$root" branch --show-current 2>/dev/null)
DIM='\033[2m'; CYAN='\033[36m'; GREEN='\033[32m'; YEL='\033[33m'; UND='\033[4m'; RST='\033[0m'
out="${CYAN}${model}${RST} ${DIM}|${RST} ${GREEN}${root}${RST}"
[ -n "$branch" ] && out="${out} ${DIM}⎇ ${branch}${RST}"

# Session id as an OSC 8 hyperlink into ccview. The port is forwarded, so
# clicking it in the integrated terminal opens the browser on the host.
PORT="${CC_SERVE_PORT:-42425}"
if [ -n "$sid" ]; then
  link="\033]8;;http://localhost:${PORT}/${sid}\033\\\\${sid}\033]8;;\033\\\\"
  out="${out} ${DIM}|${RST} ${YEL}${UND}${link}${RST}"
fi
[ -n "$ctx" ]    && out="${out} ${DIM}|${RST} ${ctx_col}◓ ${ctx}${RST}"
printf "%b" "$out"
