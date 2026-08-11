# demo/sessions — the reusable session set

Real Claude Code sessions, seeded into the container's history on start by
`.devcontainer/seed-sessions.sh`. Two jobs:

1. **Chapter 10 / Beat 0**: the checkout-outage session is the raw material the
   `service-connectivity-triage` skill was extracted from.
2. **Prerun fallbacks**: every live beat has a finished session in history —
   if a demo dies on stage, open the prerun in cc-pick / ccview and narrate it.

Filenames must stay UUIDs (`claude -r` and the viewers key on them). The first
user message is what cc-pick displays — that's the "name" you'll recognize.

| Session | Opens with | Role |
|---|---|---|
| `146a2acf` | "hey, support says the checkout service … is unreachable" | **The seed.** Beat 0: diagnose (pods green → endpoints empty → selector typo) → DNS red herring debunked → fix + verify. Source of PR #1 |
| `ba67cb4c` | "start a new payments service aws, typescript" | **Beat 2 prerun**: plain-prompt trigger (description-match, no slash), hook blocks `pulumi up`, ends on the "nudge not wall" line |
| `b8f03a0d` | "how is my pulumi code?" | **Beat 2 (LSP) prerun**: the `publicReadAccess` squiggle found and explained, left broken for the demo |
| `4a7c91c7` | "we have a prod incident: the payments pods…" | **Beat 3 prerun**: incident-triage fires, runs gather-diagnostics read-only, classifies from references/ — then applies the fix (narrate as "and here I approved it") |
| `a38137f2` | `/golden-path-service` | Beat 2 alternate: same arc but slash-invoked, so it can't demo the description-match claim |

Hygiene: token-scan before committing a new session
(`grep -cE "sk-ant|ghp_|AKIA[A-Z0-9]{16}"`), scrub real account IDs, and keep
this table in sync.
