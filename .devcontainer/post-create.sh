#!/usr/bin/env bash
# post-create.sh — runs once after the container is built. Sequential (unlike the
# parallel object form of postCreateCommand) because these steps depend on each other:
# install the toolchain, then `apm install` to wire skills + MCP + LSP + hooks.
set -uo pipefail
# Codespaces runs lifecycle scripts with umask 077 — files extracted here (APM's
# libpython, gopls) would land root-owned and unreadable. Force sane perms.
umask 022
export PATH="$HOME/.local/bin:$PATH"
WS="${1:-$PWD}"
cd "$WS"

log() { printf '\n\033[1;35m==> %s\033[0m\n' "$1"; }

log "APM CLI (Agent Package Manager)"
curl -sSL https://aka.ms/apm-unix | sh || echo "  (apm install failed — retry: curl -sSL https://aka.ms/apm-unix | sh)"

log "Language servers for the LSP demo (APM writes config, not the binaries)"
# TypeScript is PINNED. TS 7 removed `moduleResolution: "node"`, which
# demo/pulumi-ts/tsconfig.json uses — under TS 7 the compiler fails on the config
# and never type-checks index.ts, so the deliberate `publicReadAccess` error never
# appears and the LSP squiggle demo silently shows nothing. Verified 2026-08-07:
# TS 5.9.3 + the unmodified tsconfig gives exactly the intended TS2353 and nothing else.
npm install -g prettier typescript@5.9.3 typescript-language-server pyright || true

log "gopls (Go language server)"
if command -v go >/dev/null 2>&1; then
  go install golang.org/x/tools/gopls@latest && sudo cp "$(go env GOPATH)/bin/gopls" /usr/local/bin/gopls || true
fi

log "jq (poking at JSON — kubectl output, settings, hook payloads)"
sudo apt-get install -y -qq jq >/dev/null 2>&1 || echo "  (jq install skipped)"

log "kind (for the incident-triage demo cluster)"
arch=$(uname -m); case "$arch" in aarch64|arm64) arch=arm64 ;; *) arch=amd64 ;; esac
curl -fsSLo /tmp/kind "https://kind.sigs.k8s.io/dl/latest/kind-linux-${arch}" && sudo install /tmp/kind /usr/local/bin/kind || echo "  (kind install skipped)"

log "k9s (cluster TUI — eyes on the crashloop pods during the incident-triage demo)"
K9S_VERSION="v0.51.0"
curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_${arch}.tar.gz" \
  | tar -xz -C /tmp k9s && sudo install /tmp/k9s /usr/local/bin/k9s || echo "  (k9s install skipped)"

log "uv (Python tooling)"
curl -LsSf https://astral.sh/uv/install.sh | sh || true
grep -q '.local/bin' "$HOME/.bashrc" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"

# Needs uv, so it has to come after the block above.
log "cc-pick (browse and resume Claude Code sessions from the terminal)"
( export PATH="$HOME/.local/bin:$PATH" \
  && uv tool install git+https://github.com/adamgordonbell/cc-pick ) \
  || echo "  (cc-pick install skipped)"

log "ccview (web viewer for Claude Code sessions — the statusline links into it)"
go install github.com/adamgordonbell/ccview@latest || echo "  (ccview install skipped)"

# The personal layer, committed to this fork so it's visible and versioned.
# Merged into ~/.claude (the named volume) rather than symlinked — Claude Code
# writes its own state into settings.json and a symlink would fight it.
log "Claude Code personal config (statusline)"
mkdir -p "$HOME/.claude"
cp "$WS/.devcontainer/claude/statusline.sh" "$HOME/.claude/statusline.sh"
chmod +x "$HOME/.claude/statusline.sh"
[ -s "$HOME/.claude/settings.json" ] || echo '{}' > "$HOME/.claude/settings.json"
jq -s '.[0] * .[1]' "$HOME/.claude/settings.json" "$WS/.devcontainer/claude/settings.json" \
  > /tmp/claude-settings.json && mv /tmp/claude-settings.json "$HOME/.claude/settings.json" \
  || echo "  (statusline wiring skipped)"
# Verify it landed — this failed silently on a from-zero build once (Aug 11).
if [ -x "$HOME/.claude/statusline.sh" ] && jq -e '.statusLine' "$HOME/.claude/settings.json" >/dev/null 2>&1; then
  echo "  statusline wired OK"
else
  echo "  !! STATUSLINE WIRING FAILED — re-run: cp $WS/.devcontainer/claude/statusline.sh ~/.claude/ && merge $WS/.devcontainer/claude/settings.json into ~/.claude/settings.json"
fi

log "apm install — wiring skills, MCP, LSP config, and the guardrail hook into .claude/"
( export PATH="$HOME/.local/bin:$PATH" && apm install ) || echo "  (run 'apm install' manually once you're in)"

log "Slidev deck dependencies"
( cd "$WS/slides" && npm install ) || true

log "LSP demo project dependencies"
( cd "$WS/demo/pulumi-ts" && npm install ) || true

# Show the welcome banner on each new shell.
if ! grep -q 'banner.sh' "$HOME/.bashrc" 2>/dev/null; then
  echo "[ -f \"$WS/.devcontainer/banner.sh\" ] && bash \"$WS/.devcontainer/banner.sh\"" >> "$HOME/.bashrc"
fi

log "Done. Open a new terminal for the banner, then authenticate your agent (see README)."
