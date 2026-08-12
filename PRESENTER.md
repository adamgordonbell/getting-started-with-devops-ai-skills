# Presenter run-of-show — Getting Started with DevOps AI Skills

> 60 minutes, presenter-driven. The deck runs **slides first, then one live demo block at
> the end**: the argument is complete before anything can break live, and the demo is the
> payoff. This is the plan for the room *and* the plan for when the wifi dies. Decide the
> cuts **before** you walk on, not at minute 45.
>
> The [published listing](https://www.pulumi.com/events/getting-started-with-devops-ai-skills/)
> promises *"coding agents can write Pulumi for you, but the quality depends almost entirely
> on how you've configured them."* Beat 2 of the demo block is that sentence, live.

## Pre-flight (before the talk, on the venue wifi if you can)

**Devcontainer / Codespace** (the intended way): the container build already installed the
LSP binaries, kind, and the APM CLI, ran `apm install`, and pulled the npm deps. Two scripts
remain yours:

```bash
demo/prewarm.sh                 # re-RUNS apm install + npm deps and checks MCP/LSP/kind — local writes only, no cloud mutations
demo/setup-cluster.sh           # kind cluster + the crashlooping 'payments' pod — never automatic
```

**Bare-metal** (no container): add the LSP installer before those two:

```bash
demo/install-lsp-servers.sh     # put gopls / pyright / typescript-language-server on $PATH
```

**Auth is always manual** — do it now, not on stage: `pulumi login` (`pulumi whoami` to
confirm), `claude` login, approve the project's `pulumi` MCP server, `/mcp` → authenticate.

Then confirm — five original lights plus the Beat 0 trio:

- `apm install` resolved **16 skills + 1 hook** into `.claude/` (incl. `skill-creator` and
  `cluster-health`) and **3 LSP servers** into `.lsp.json`
- the hook is wired cwd-proof: `grep CLAUDE_PROJECT_DIR .claude/settings.json` hits
- `pulumi whoami` works
- `kubectl -n demo get pods` shows the `payments` pods in `CrashLoopBackOff`
- `demo/pulumi-ts/index.ts` shows a red squiggle on `publicReadAccess`
- **(Beat 0)** `cc-pick` lists the seeded sessions, incl. the checkout-outage one
- **(Beat 0)** ccview answers on the forwarded port 42425
- **(Beat 3 prereq)** `checkout` service healthy: `demo/break-checkout.sh --test` → UP
- `claude` starts and answers (auth = `ANTHROPIC_API_KEY` via VS Code `remoteEnv` — works
  in VS Code terminals only, not a bare `docker exec`)
- `git diff --exit-code demo/k8s/` is clean — rehearsals tend to "fix" the broken YAML
- statusline present: `jq .statusLine ~/.claude/settings.json` hits (seen dropped once on a
  from-zero build, Aug 11). Remedy: re-run the "personal config" block of post-create.sh —
  `cp .devcontainer/claude/statusline.sh ~/.claude/ && jq -s '.[0] * .[1]' ~/.claude/settings.json .devcontainer/claude/settings.json > /tmp/s && mv /tmp/s ~/.claude/settings.json`

If any of these is red, switch that demo beat to its recording. The show doesn't change.
Two hard-won notes: create the Codespace **the day before** (cold build ~10 min; a repo
prebuild removes even that), and `slides/node_modules` is platform-specific — run
`npm install` fresh on whichever machine actually presents the deck.

## The shape of the hour

Six stages (the agenda slide and the divider breadcrumbs mark them):
**What → Why → Get → Wire → Use → Build**, bookended by open and outro. Demos live
inside their stages; nothing is end-loaded.

| Min | Stage | Slides | Covers |
|----:|-------|--------|--------|
| 0–5 | *Open* | 1–6 | cover · intros · housekeeping · agenda = the stage map |
| 5–17 | **What** | 7–13 | generic-agent problem · `SKILL.md` + homes · frontmatter control panel · anatomy + **Beat 0** (session → skill, PR #1) · progressive disclosure |
| 17–20 | **Why** | 14–16 | the job is skill-shaped · the stat (*with the caveat*) |
| 20–24 | **Get** | 17–19 | adopt before build · vet before trust |
| 24–33 | **Wire** | 20–27 | two per-machine paths (the gap) · APM pitch + **Beat 1** (`apm install`) · manifest debrief · MCP/Neo · LSP · hooks |
| 33–44 | **Use** | 28–30 | **Beat 2** (money shot) off "Same prompt" · debrief on "Use it" · final click = **Beat 3** (incident-triage) |
| 44–49 | **Build** | 31–33 | six principles · keep current / remove clean |
| 49–55 | *Outro* | 34–36 | "One loop, closed today" (recap = the real example, spoken merge moment) · what we didn't cover · thank-you QRs |
| 55–60 | Q&A | — | — |

**R2 change — demos are INTERLEAVED, not end-loaded.** R1 ran slides-first, demos at 41.
R2 runs each beat right after the slide that sets it up (each carrier slide has a purple
**DEMO band**):

All bands are **click-reveals**: the slide's points can come first or the demo can — the
band appears on its click and you jump when ready. Show-then-tell pairs: 22→23 and 28→29
(band on the first, debrief clicks on the second).

| ~Min | Beat | At slide |
|----:|------|----------|
| 12 | **Beat 0** — session → skill (PR #1, cc-pick, ccview) | 11 "Anatomy" → 12 "Skills come from work…" |
| 27 | **Beat 1** — `apm install`, live | band on 22 "APM: package.json" → debrief on 23 "One manifest" |
| 35 | **Beat 2** — the money shot | band on 29 "Same prompt…" → debrief on 30 "Use it" |
| ~40 | **Beat 3** — incident-triage | final click on 30 "Use it": "…and now that payments service is crashlooping" |

Beat 3 deliberately chains off Beat 2: golden-path just created the payments service, and
now it's crashlooping — one continuous story in the same Claude session. (Shipping the PR
is not a beat — the "Closing the loop" slide near the end narrates merge → dep line →
`apm install` in ~2 min, nothing performed.)

The old "argument complete before anything can break" rule is traded for pacing: nobody
sits through 40 minutes of slides. The wifi-dies story changes accordingly — a dead demo
now interrupts mid-deck, so each beat's fallback (below) matters more, and the slide the
band sits on always works as the recording's narration.

The deck's speaker notes add up to roughly 26 minutes of talking against a 41-minute slide
window. The slack is for the "questions any time" promise in housekeeping. If the room is
chatty, defend minute 41: the demo block is what flexes, and the cut list decides what goes.

## Beat 0 [slide 11] — mid-deck: skills come from sessions (~5 min, at the "Anatomy" slide)

The one demo that does NOT wait for the demo block. The "Anatomy of a complex skill"
slide carries a **DEMO band** linking to the real PR, and the next slide ("Skills come
from work you already did") is the backdrop for a jump into VS Code:

1. Click the DEMO band → **PR #1 on `adamgordonbell/devops-agent-skills`**
   (`service-connectivity-triage`). Walk the folder in the diff: SKILL.md +
   `references/failure-modes.md` + 3 read-only scripts — the anatomy slide, for real.
2. Jump to VS Code (devcontainer). Run `cc-pick` in the terminal: click through the
   session history, open the checkout-outage session. The story: "the way I usually make
   skills is *retroactively* — something broke, Claude and I dug through it, and
   afterwards it's good practice to ask what's extractable."
3. Optionally show the same session in **ccview** (port 42425, forwarded) — the
   statusline links into it.
4. Land it: "I pointed Anthropic's `skill-creator` at that session; the draft became the
   PR you just saw." Don't merge it — that's the demo-block payoff (Beat 4).

Requires: container running, sessions seeded (postStart does it), `claude` auth working.
Does NOT require `apm install` on stage — sessions come from `.devcontainer/seed-sessions.sh`,
and the extraction is already done. Fallback: the PR alone tells the story; skip VS Code.

**[the session, by name in cc-pick: "Checkout service unreachable — support escalation"]**

## The beats in detail

Beats 1–2 now run **inline** at their carrier slides (see table above); beats 3–4 are the
end block at the DEMO slide. Each beat still happens *after* its slide — the slide is the
setup, the demo is the payoff.

### Beat 1 [slide 22] — wire it up: `apm install` (~3 min, band on "APM: package.json")

1. Show `apm.yml` in the editor. Point at the three dependency kinds (skills, MCP, LSP)
   and say the fourth out loud: hooks are file-discovered from `.apm/hooks/`.
2. Run `apm install` (prewarmed, so it's fast).
3. Show what landed: `ls .claude/skills/` → 14 skills; `.lsp.json`; the hook merged into
   `.claude/settings.json`.

Callback: "One manifest → every agent." A new teammate gets all of this from
`git clone && apm install`.
Fallback: run nothing. Prewarm already put the tree on disk; walk it in the editor.

### Beat 2 [slide 29] — the money shot (~7 min, at "Same prompt, configured vs not") — **protect this**

This is a **sequenced composite of three artifacts**, not one magic prompt. Run them in
this order, narrate "off vs on," and don't imply one keystroke triggers all three.

1. **LSP.** Open `demo/pulumi-ts/index.ts`: the red squiggle on `publicReadAccess`, an
   invented arg on `aws.s3.BucketV2`. Without LSP this only blows up at `pulumi preview`;
   with it, the agent sees the mistake as the code is written.
   *(prerun: "Review my Pulumi code — the bucket arg")*
2. **The skill triggers itself.** In Claude Code, type the plain request:
   *"Start a new payments service — AWS, TypeScript."* Watch `golden-path-service` fire
   from its description alone (nobody said "use the skill"), wire ESC + OIDC, apply
   standard tags, and stop at `pulumi preview`.
   *(prerun: "New payments service — first run" — plain-prompt trigger, so the
   "nobody said use the skill" claim holds on screen · slash-command alternate:
   "Golden path: scaffold the payments service")*
3. **The hook holds the line.** Ask the agent to apply. `guard-pulumi.sh` blocks
   `pulumi up` with exit 2, and the reason lands back in the agent's context. Show
   `pulumi preview` still passing right after.
   *(prerun: same "New payments service — first run" — ends on the hook block AND the
   honest "nudge not wall" line)*

Say the honest line out loud right here: **the hook is a nudge, not a wall.** The
Automation API and the MCP server never touch the Bash tool, and a `make deploy` wrapper
slips past because the command string never says `pulumi`. The real wall is Pulumi Cloud
deployment policy plus OIDC-scoped creds.

Callbacks: the "LSP", "Hooks", "Same prompt, configured vs not", and "Use it" slides.
Fallback: open the step's prerun in cc-pick/ccview and narrate it.

### Beat 3 [slide 30] — a complex skill under pressure: `incident-triage` (~4 min, final click on "Use it")

1. Prompt: *"We have a prod incident: the `payments` pods are in CrashLoopBackOff in the
   `demo` namespace. Triage it — gather diagnostics, classify severity, and propose a
   stabilization plan."* (Say it this way. A bare "triage this crashloop" can match the
   narrower community `diagnose-crashloop` skill instead — fine as an aside on skill
   collision, wrong as the planned beat.)
2. Watch the shape of a complex skill do its job: it fires from the description, runs
   `scripts/gather-diagnostics.sh demo payments` (read-only; only the *output* enters
   context), classifies severity from `references/severity-matrix.md`, proposes a fix,
   and stops. A human approves; nothing mutates.

Callback: the "Complex: make it safe and deterministic" slide. Scripts for procedure,
prose for judgement, read-only by default.
Fallback: run the script directly in a terminal, no agent — or open the prerun
**["Prod incident: payments crashloop triage"]** in cc-pick/ccview and narrate.

### "One loop, closed today" slide (~2 min, spoken — not a beat)

The recap IS the payoff of Beat 0 — the workshop's whole argument retold through the one
real example: incident → session → skill-creator → PR #1 → merge → dep line →
`apm install` → every teammate. Told, not performed.

(The mechanics are real and were verified Aug 10 — apm resolved the skill off the PR
branch cleanly — so if anyone asks "does that actually work," the answer is yes, tested.)

## The cut list (in order — cut from the top when you're behind)

Demos are interleaved now, so cutting means *skipping a band as you pass it* — decide at
the band, not at minute 45. Cut order:

1. **Beat 3** (`incident-triage` live) → point at chapter 06 + `demo/setup-cluster.sh` as
   homework; show only the skill's file tree.
2. **Beat 1** (`apm install` live) → don't run it; show the already-installed `.claude/`
   tree in 30 seconds and move on.
3. Already behind at minute 30, on the slides? Compress "keep current / remove clean" to
   one sentence + a pointer at chapters 08–09.

**Never cut Beat 2.** It's the only thing that *proves* the thesis ("quality depends on
how you configure it"). If you show one thing live, show that.

## When the wifi dies (it will)

- The slides need no network, and the demos all sit at the end, so a dead network never
  interrupts the argument mid-flight. The demo block just becomes recordings.
- `apm install` stalls → prewarm cached everything; if it didn't, show the recorded run
  and the resulting `.claude/skills/` tree.
- The Pulumi MCP server is **remote** (`https://mcp.ai.pulumi.com/mcp`, OAuth) → you did
  the OAuth dance in pre-flight. If the venue network blocks it, Beat 2 still runs: the
  skill fires locally, and only the MCP-dependent extras (registry lookups, Pulumi Cloud
  access) go quiet. Say so and move on.
- LSP shows nothing → binaries missing from `$PATH` or `npm install` never ran in
  `demo/pulumi-ts`; use the screenshot.
- Keep **screen recordings of all three beats** on disk as the universal fallback.

## Honest scope (say it out loud, don't get caught)

- **opencode**: the abstract names it; today's build is Claude Code only (APM writes LSP
  config for Claude Code + Copilot CLI only). Say so, and that the *method* is the same
  for opencode.
- **Pulumi-centric**: most skills here are Pulumi. The *approach* ports to Terraform/Helm/
  ArgoCD — point at the community runbooks as the non-Pulumi takeaway.
- **The hook is a nudge, not a wall.** Real enforcement is Pulumi Cloud deployment policy +
  OIDC creds. Don't call it a security control.
- **The stat** ("LLMs run >20% of infra deployments") is Pulumi's own figure (Joe Duffy,
  May '26). Attribute it; don't present it as independent.
