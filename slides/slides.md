---
theme: "@pulumi/slidev-theme"
title: "Getting Started with DevOps AI Skills"
info: |
  Getting Started with DevOps AI Skills.
  Engin Diri & Adam Gordon Bell, Pulumi.

  Build, share, and run Agent Skills for DevOps with Microsoft APM and Pulumi.
transition: slide-left
mdc: true
canvasWidth: 1920
aspectRatio: 16/9
highlighter: shiki
lineNumbers: false
layout: cover
defaults:
  layout: default
---

<div class="absolute inset-0 flex flex-col justify-center items-start px-20">
  <h1 class="!text-[5.4rem] !leading-[1.04] !font-semibold !tracking-tight !mb-6 !max-w-[95%]">
    Getting Started with DevOps AI Skills
  </h1>
  <p class="!mt-2 !text-[2.1rem] text-[var(--p-fg-muted)] !m-0 !leading-relaxed">
    Teach your agent your runbooks, using Agent Skills, APM, and Pulumi
  </p>
  <p class="!mt-6 !text-[1.8rem] text-[var(--p-fg-muted)] !m-0 !leading-relaxed">
    Engin Diri · Adam Gordon Bell · Pulumi
  </p>
</div>

<!--
Goal:
- using and finding skills
- sharing skills ( apm )
- building skills
- runbook -> skill
-->

---

<div class="absolute inset-0 flex items-center px-24 gap-20">
  <div class="flex-shrink-0">
    <img src="/img/engin-diri.jpg" class="w-[28rem] rounded-2xl shadow-xl border-4" style="border-color: rgba(126,107,255,0.45)" alt="Engin Diri" />
  </div>
  <div class="flex-1">
    <h1 class="!text-[7rem] !leading-[1.02] !font-semibold !tracking-tight !mb-4 !text-[var(--p-primary)]">Engin Diri</h1>
    <p class="!text-[2.5rem] !leading-relaxed !m-0 opacity-90">
      Senior Solutions Architect at <strong class="!text-[var(--p-primary)]">Pulumi</strong>
    </p>
    <div class="!mt-8 flex items-center gap-8 !text-[1.5rem] opacity-70">
      <span class="flex items-center gap-2"><carbon-logo-x /> @_ediri</span>
      <span class="flex items-center gap-2"><carbon-logo-linkedin /> engin-diri</span>
      <span class="flex items-center gap-2"><carbon-logo-github /> dirien</span>
    </div>
    <p class="!mt-10 !text-[1.75rem] !leading-relaxed opacity-70 !m-0">
      Building platform tooling and infrastructure-as-code.<br/>
      Helping teams ship cloud infrastructure faster. With and without agents.
    </p>
  </div>
</div>

<!--
- Engin built R1 · on chat today
-->

---

<div class="absolute inset-0 flex items-center px-24 gap-20">
  <div class="flex-shrink-0">
    <img src="/img/adam-gordon-bell.png" class="w-[28rem] rounded-2xl shadow-xl border-4" style="border-color: rgba(126,107,255,0.45)" alt="Adam Gordon Bell" />
  </div>
  <div class="flex-1">
    <h1 class="!text-[7rem] !leading-[1.02] !font-semibold !tracking-tight !mb-4 !text-[var(--p-primary)]">Adam Gordon Bell</h1>
    <p class="!text-[2.5rem] !leading-relaxed !m-0 opacity-90">
      Community Engineer at <strong class="!text-[var(--p-primary)]">Pulumi</strong>
    </p>
    <div class="!mt-8 flex items-center gap-8 !text-[1.5rem] opacity-70">
      <span class="flex items-center gap-2"><carbon-logo-x /> @adamgordonbell</span>
      <span class="flex items-center gap-2"><carbon-logo-linkedin /> adamgordonbell</span>
      <span class="flex items-center gap-2"><carbon-logo-github /> adamgordonbell</span>
    </div>
    <p class="!mt-10 !text-[1.75rem] !leading-relaxed opacity-70 !m-0">
      Host of the CoRecursive podcast.<br/>
      Telling the stories behind the code.
    </p>
  </div>
</div>

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[6.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !max-w-[95%]">Housekeeping & Agenda</h1>
</div>

---

# Housekeeping

<div class="zoom-content">

<ul class="!mt-8 !text-[1.6rem] !leading-relaxed space-y-5">
  <li>We'll <strong>present and demo</strong>, so you don't need to code along live</li>
  <li>Ask questions <strong>any time</strong>; treat this as a conversation</li>
  <li>Slides, chapters, and the finished skills go home in the <strong>repo</strong> (QR at the end)</li>
  <li>Everything I show, you can run yourself later. One chapter at a time.</li>
</ul>

</div>

<style scoped>
.zoom-content { zoom: 1.7; }
</style>



---

# Today's Agenda

<div class="zoom-content">

<ul class="!mt-8 !text-[1.55rem] !leading-relaxed space-y-4">
  <li><strong class="!text-[var(--p-primary)]">What</strong> — an Agent Skill, up close</li>
  <li><strong class="!text-[var(--p-primary)]">Why</strong> — DevOps work is skill-shaped</li>
  <li><strong class="!text-[var(--p-primary)]">Get</strong> — find &amp; evaluate existing skills</li>
  <li><strong class="!text-[var(--p-primary)]">Wire</strong> — one manifest for the team: skills, MCP, LSP, hooks</li>
  <li><strong class="!text-[var(--p-primary)]">Use</strong> — same prompt, configured vs not — live</li>
  <li><strong class="!text-[var(--p-primary)]">Build</strong> — your own skills, done well</li>
</ul>

</div>

<style scoped>
.zoom-content { zoom: 1.5; }
</style>

<!--
- arc = using → sharing (apm) → building → runbook->skill
-->

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">What</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">an Agent Skill, up close</p>
</div>

<StageMap current="what" />

---

# Your agent is smart. And generic.

<div class="zoom-content">

<p v-click class="!mt-8 !text-[1.4rem] !leading-relaxed">
  It writes great code. It does <span class="hl">not</span> know your
  <span class="hl-soft">golden paths</span>, your <span class="hl-soft">runbooks</span>, or your
  <span class="hl-soft">tagging and region conventions.</span>
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  So you paste the same context into every prompt. Again. And again. And it still
  reaches for the wrong component or forgets to <code>pulumi preview</code> first.
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  A <span class="hl">skill</span> packages that context <span class="hl">once</span>, and the
  agent loads it <span class="hl-soft">automatically</span> when the task calls for it.
</p>

</div>

---

# A skill is a folder with a `SKILL.md`

<div class="grid grid-cols-2 gap-8 mt-2 items-start">
  <div class="big-code">

```markdown
---
name: pulumi-stack-bootstrap
description: >-
  Scaffold a new Pulumi project on our org
  standard: ESC for config, OIDC for auth,
  preview-before-apply. Use when asked to
  start a new stack, service, or IaC project.
---

# Pulumi stack bootstrap

1. Ask cloud (aws|gcp|azure) + language (ts|py|go).
2. `pulumi new <cloud>-<language> --name <name>`
3. Wire config to ESC, not local secret files.
4. Always `pulumi preview` before `pulumi up`.
```

  </div>
  <div>
    <p v-click class="!text-[1.35rem] !leading-relaxed">
      YAML frontmatter (<code>name</code> + <code>description</code>) on top, plain-Markdown
      instructions below. That's the whole format.
    </p>
    <p v-click class="!mt-7 !text-[1.3rem] !leading-relaxed !mb-2">Drop that folder in one of a few places:</p>
    <ul v-click class="!text-[1.2rem] !leading-relaxed space-y-2">
      <li><code>.claude/skills/&lt;name&gt;/</code> this project (commit to share)</li>
      <li><code>~/.claude/skills/&lt;name&gt;/</code> you, across every project</li>
      <li><code>&lt;plugin&gt;/skills/&lt;name&gt;/</code> from a plugin, namespaced</li>
      <li>Enterprise: managed settings, org-wide</li>
    </ul>
  </div>
</div>

<div v-click class="prec-band">
  <span class="prec-label">Same name in two spots? Highest wins:</span>
  <span class="prec-chip"><ph-buildings class="text-[var(--p-primary)]" /> Enterprise</span>
  <ph-caret-right class="prec-arrow" />
  <span class="prec-chip"><ph-user class="text-[var(--p-primary)]" /> Personal</span>
  <ph-caret-right class="prec-arrow" />
  <span class="prec-chip"><ph-folder class="text-[var(--p-primary)]" /> Project</span>
</div>

<style scoped>
.big-code :deep(.slidev-code) {
  font-size: 0.92rem !important;
  line-height: 1.42 !important;
  margin: 0 !important;
  padding: 0.9rem 1.1rem;
  border-radius: 12px;
}
.prec-band {
  margin-top: 2.4rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  flex-wrap: wrap;
}
.prec-label {
  font-size: 1.6rem;
  color: var(--p-fg-muted);
  margin-right: 0.4rem;
}
.prec-chip {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 1.75rem;
  font-weight: 600;
  color: var(--p-fg);
  background: rgba(126, 107, 255, 0.14);
  border: 1px solid rgba(126, 107, 255, 0.35);
  border-radius: 12px;
  padding: 0.45rem 1.05rem;
  white-space: nowrap;
}
.prec-arrow {
  font-size: 1.55rem;
  color: var(--p-fg-muted);
  flex-shrink: 0;
}
</style>

<!--
[USING]
- frontmatter = contract · body = procedure
- here: apm install writes these for you
-->

---

# Frontmatter is a control panel

<div class="grid grid-cols-2 gap-8 mt-2 items-start">
  <div class="big-code">

```yaml
---
name: deploy-service
description: Deploy a service to production
              # ← the trigger (default: Claude
              #    fires it AND you get /deploy-service)

disable-model-invocation: true
              # ← only YOU: /deploy-service
user-invocable: false
              # ← or only CLAUDE (pick one)

context: fork # ← runs in its own subagent,
agent: Explore #   own context, reports back
model: haiku  # ← cheap model for mechanical work

allowed-tools: Read Grep Bash(kubectl get:*)
              # ← least privilege, pre-approved
---
```

  </div>
  <div>
    <p class="!text-[1.3rem] !leading-relaxed !mb-3">Who invokes it?</p>
    <ul class="!text-[1.2rem] !leading-relaxed space-y-3">
      <li v-click><strong>Default:</strong> both. Claude auto-triggers on the description; every skill is also a <code>/slash-command</code></li>
      <li v-click><code>disable-model-invocation: true</code> → <span class="hl">you-only.</span> Right for anything that mutates: deploys, rollbacks, <code>pulumi up</code></li>
      <li v-click><code>user-invocable: false</code> → <span class="hl">Claude-only.</span> Background knowledge, hidden from the <code>/</code> menu</li>
      <li v-click><code>context: fork</code> → the skill runs in a <span class="hl">separate subagent</span>: doesn't fill your context, can use a different model, returns just the result</li>
    </ul>
  </div>
</div>

<style scoped>
.big-code :deep(.slidev-code) {
  font-size: 0.88rem !important;
  line-height: 1.45 !important;
  margin: 0 !important;
  padding: 0.9rem 1.1rem;
  border-radius: 12px;
}
</style>

<!--
[USING]
- who fires it: default both · disable-model-invocation = you-only (mutations) · user-invocable:false = Claude-only
- fork = own subagent: big noisy jobs (log sweeps, audits) don't eat your context
-->

---

# Anatomy of a *complex* skill

<div class="grid grid-cols-2 gap-10 mt-4">
  <div class="big-code">

```text
incident-triage/
├── SKILL.md            # the procedure, concise
├── references/
│   ├── severity-matrix.md
│   └── escalation.md
├── scripts/
│   └── gather-diagnostics.sh
└── templates/
    └── postmortem.md
```

  </div>
  <div>
    <ul class="!mt-2 !text-[1.4rem] !leading-relaxed space-y-4">
      <li><span class="hl">SKILL.md</span> stays short. It's what loads on trigger.</li>
      <li><span class="hl">references/</span> hold the long detail, read only when needed.</li>
      <li><span class="hl">scripts/</span> do the deterministic steps, so the model never re-derives a fragile command.</li>
      <li><span class="hl">templates/</span> are the artifacts it fills in (a postmortem, a PR body).</li>
    </ul>
  </div>
</div>

<a href="https://github.com/adamgordonbell/devops-agent-skills/pull/1/changes#diff-b9c8fad0c741f0d1d84555217357a44e00726c4eda4b8d9fbf66065e798cfbfc" target="_blank" class="demo-band">
  <span class="demo-chip">DEMO</span>
  <span>a real one — <code>service-connectivity-triage</code>, a PR against our team skills repo →</span>
</a>

<style scoped>
.demo-band {
  margin-top: 2.8rem;
  display: flex;
  align-items: center;
  gap: 1.1rem;
  font-size: 1.6rem;
  border: 1.5px solid rgba(126,107,255,0.45);
  background: rgba(126,107,255,0.08);
  border-radius: 14px;
  padding: 1rem 1.4rem;
  text-decoration: none;
  color: var(--p-fg);
}
.demo-chip {
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--p-primary);
  border: 1.5px solid var(--p-primary);
  border-radius: 8px;
  padding: 0.15rem 0.7rem;
  font-size: 1.2rem;
  flex-shrink: 0;
}
</style>

<!--
- don't walk the bullets — click DEMO, walk the real folder in the PR
- degrees of freedom: open field = prose · narrow bridge (db migration) = exact script
-->

---

# Skills come from work you already did

<div class="grid grid-cols-[1.4fr_1fr] gap-10 mt-4 items-start">
  <div>
    <ul class="!mt-2 !text-[1.45rem] !leading-relaxed space-y-4">
      <li>Something broke. You and the agent dug through it. It's fixed.</li>
      <li>That session <span class="hl">is the runbook</span> — the commands that worked, the dead ends, the tell that cracked it</li>
      <li>Afterwards: reopen the session, extract the skill. Anthropic's <span class="hl"><code>skill-creator</code></span> does the drafting</li>
      <li>PR it to the team repo → <code>apm install</code> ships it to <span class="hl">everyone's agent</span></li>
    </ul>
    <p class="!mt-8 !text-[1.5rem] !leading-relaxed">
      <span class="hl">The best time to write a skill is right after you needed one.</span>
    </p>
  </div>
  <div class="flex flex-col gap-5">
    <div class="tool-card">
      <div class="tool-card__text">
        <div class="tool-card__name">cc-pick</div>
        <div class="tool-card__desc">browse + resume past sessions, in the terminal</div>
      </div>
      <img src="/img/cc-pick-qr.png" alt="cc-pick QR" />
    </div>
    <div class="tool-card">
      <div class="tool-card__text">
        <div class="tool-card__name">ccview</div>
        <div class="tool-card__desc">web viewer for session history</div>
      </div>
      <img src="/img/ccview-qr.png" alt="ccview QR" />
    </div>
    <div class="tool-card">
      <div class="tool-card__text">
        <div class="tool-card__name">skill-creator</div>
        <div class="tool-card__desc">Anthropic's skill-that-writes-skills — <code>anthropics/skills</code> (in our apm.yml)</div>
      </div>
      <img src="/img/anthropic-skills-qr.png" alt="anthropics/skills QR" />
    </div>
  </div>
</div>

<style scoped>
.tool-card {
  display: flex;
  align-items: center;
  gap: 1.1rem;
  border: 1.5px solid var(--p-border);
  background: var(--p-bg-elevated);
  border-radius: 14px;
  padding: 0.9rem 1.1rem;
}
.tool-card__text { flex: 1; }
.tool-card__name {
  font-family: var(--slidev-font-mono);
  font-weight: 700;
  font-size: 1.45rem;
  color: var(--p-primary);
}
.tool-card__desc { font-size: 1.05rem; color: var(--p-fg-muted); line-height: 1.35; margin-top: 0.2rem; }
.tool-card img {
  width: 7rem;
  height: 7rem;
  background: #fff;
  border-radius: 10px;
  padding: 0.35rem;
}
</style>

<!--
BEAT 0 — jump to VS Code here:
1. cc-pick → click through history → open the checkout session
2. story: broke a Service, diagnosed with claude — pods green, endpoints empty, selector typo
3. ccview: same session in the browser
4. "I ran skill-creator on it" → that's the PR on the last slide
-->

---

# Progressive disclosure: why you can have dozens

<div class="pd-row">
  <div v-click class="pd-card">
    <div class="pd-tag"><ph-eye class="text-[var(--p-primary)]" /> Level 1 · always loaded</div>
    <p class="pd-what"><code>name</code> + <code>description</code></p>
    <p class="pd-cost">of <em>every</em> skill · ~100 tokens each</p>
  </div>

  <ph-caret-right v-click="2" class="pd-arrow" />

  <div v-click="2" class="pd-card pd-card--accent">
    <div class="pd-tag pd-tag--accent"><ph-file-text class="text-[var(--p-primary)]" /> Level 2 · on trigger</div>
    <p class="pd-what">the <code>SKILL.md</code> body</p>
    <p class="pd-cost">loads only when the task matches</p>
  </div>

  <ph-caret-right v-click="3" class="pd-arrow" />

  <div v-click="3" class="pd-card">
    <div class="pd-tag"><ph-folders class="text-[var(--p-primary)]" /> Level 3 · on demand</div>
    <p class="pd-what">scripts · references · templates</p>
    <p class="pd-cost">loads only when a step needs it</p>
  </div>
</div>

<p class="pd-takeaway" v-click>
  Install <span class="hl">dozens</span> of skills. Only the one the agent actually uses ever
  reaches the <span class="hl">context window</span>.
</p>

<style scoped>
.pd-row {
  display: flex;
  align-items: stretch;
  justify-content: center;
  gap: 1rem;
  margin-top: 3.2rem;
}
.pd-card {
  flex: 1;
  background: var(--p-bg-elevated);
  border: 1.5px solid var(--p-border);
  border-radius: 16px;
  padding: 1.8rem 1.6rem;
  display: flex;
  flex-direction: column;
  gap: 0.85rem;
}
.pd-card--accent {
  border-color: color-mix(in srgb, var(--p-primary) 60%, var(--p-border));
  background: rgba(126, 107, 255, 0.06);
}
.pd-tag {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-family: var(--slidev-font-mono);
  font-weight: 700;
  font-size: 1.15rem;
  text-transform: uppercase;
  letter-spacing: 0.03em;
  color: var(--p-fg-muted);
}
.pd-tag--accent { color: var(--p-primary); }
.pd-what {
  margin: 0;
  font-size: 1.75rem;
  font-weight: 600;
  color: var(--p-fg);
  line-height: 1.2;
}
.pd-cost { margin: 0; font-size: 1.2rem; color: var(--p-fg-muted); line-height: 1.35; }
.pd-arrow {
  font-size: 2.2rem;
  color: var(--p-fg-muted);
  align-self: center;
  flex-shrink: 0;
}
.pd-takeaway {
  margin: 3rem 0 0;
  max-width: 95%;
  text-align: left;
  font-size: 1.85rem;
  line-height: 1.45;
}
</style>

<!--
- contrast: CLAUDE.md = always-on, bloats every request
-->

---
hide: true
---

# Skill ≠ MCP ≠ CLAUDE.md

<div class="grid grid-cols-3 gap-6 mt-6">
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Agent Skill</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Knowledge + procedure.</strong> "Here's how we do X." Loaded on demand. Portable folder of Markdown + scripts.</p>
  </div>
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">MCP server</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Tools + live data.</strong> "Here's an API I can call." A running server the agent connects to.</p>
  </div>
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">CLAUDE.md / AGENTS.md</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Always-on context.</strong> Project rules loaded into <em>every</em> request. No triggering, no scoping.</p>
  </div>
</div>

<p v-click class="!mt-9 !text-[2rem] !leading-relaxed text-left !max-w-[95%]">
  <span class="hl">They compose:</span> a skill tells the agent <span class="hl">how</span> to use
  the Pulumi <span class="hl">MCP</span> server, and your <span class="hl">CLAUDE.md</span> points
  at the skills your repo expects. Best results use all three.
</p>

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">Why</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">DevOps work is skill-shaped</p>
</div>

<StageMap current="why" />

---

# The job is already skill-shaped

<div class="zoom-content">

<p v-click class="!mt-8 !text-[1.4rem] !leading-relaxed">
  <span class="hl">"If you find yourself doing the same type of task with different content
  each time, that's a skill waiting to be built."</span>
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  Pipeline triage. Pulumi drift. <code>CrashLoopBackOff</code>. Cost spikes. The Sev1
  at 2am. That's <span class="hl-soft">repeatable judgement</span>. Not novel code.
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  Pulumi's own number: <span class="hl">LLMs now run over 20% of infrastructure
  deployments</span>, heading past 50% this year. The agent is already in your infra.
  The only question is whether it follows <span class="hl-soft">your</span> playbook.
</p>

</div>

<!--
- 20% stat = Joe Duffy, May '26 — vendor forecast, attribute if challenged
-->

---

# Turn the wiki nobody reads into something the agent runs

<div class="grid grid-cols-2 gap-10 mt-6">
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Today</div>
    <ul class="!mt-3 !text-[1.2rem] !leading-relaxed space-y-2">
      <li>Runbook in a wiki, last edited 18 months ago</li>
      <li>Senior engineer re-explains it on every incident</li>
      <li>Agent guesses, reaches for the wrong command</li>
      <li>You re-paste your conventions into every prompt</li>
    </ul>
  </div>
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">With skills</div>
    <ul class="!mt-3 !text-[1.2rem] !leading-relaxed space-y-2">
      <li>Runbook is a <code>SKILL.md</code> in git, reviewed like code</li>
      <li>Encoded <strong>once</strong>, so every engineer's agent runs it the same way</li>
      <li>Safe by default: read-only, preview before apply</li>
      <li>Triggers itself when the task matches</li>
    </ul>
  </div>
</div>

<p v-click class="!mt-9 !text-[2rem] !leading-relaxed text-left !max-w-[95%]">
  <span class="hl">The stack in 2026:</span> skills carry the <span class="hl">know-how</span>,
  MCP servers / CLIs give <span class="hl">governed access</span> to real systems (Pulumi, Vault,
  Datadog), and the agent <span class="hl">orchestrates</span>.
</p>

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">Get</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">find &amp; evaluate existing skills</p>
</div>

<StageMap current="get" />



---

# Don't write what you can adopt

<div class="grid grid-cols-2 gap-10 mt-4">
  <div>
    <ul class="!mt-2 !text-[1.35rem] !leading-relaxed space-y-3">
      <li v-click><strong>Vendor sets:</strong> Pulumi ships <code>pulumi/agent-skills</code> (Apache-2.0, 4 plugin groups); cloud providers ship theirs</li>
      <li v-click>The skills directory, <code>skills.sh</code>, and Anthropic's <code>anthropics/skills</code></li>
      <li v-click>Community runbooks like <code>bregman-arie/devops-sre-skills</code> and <code>dirien/claude-skills</code></li>
      <li v-click>And your own org repo, full of skills your teammates already wrote</li>
    </ul>
  </div>
  <div class="big-code">

```bash
# The fastest skill is the one
# someone else already ran in prod.

npx skills find pulumi      # search
npx skills find kubernetes
```

  </div>
</div>

<!--
[USING]
- if asked: NO get.pulumi.com/skills.sh (403s) — real path = npx skills / marketplace / APM
-->

---

# Evaluate before you trust

<div class="zoom-content">

<p class="!mt-6 !text-[1.3rem] !leading-relaxed">A skill <span class="hl">acts on your infrastructure.</span></p>

<div class="grid grid-cols-2 gap-x-12 gap-y-3 !mt-4">
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-identification-card class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>Who publishes it?</strong> Unknown author = unknown blast radius.</span></p>
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-gear class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>What can it run?</strong> Read the scripts.</span></p>
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-target class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>Is the description honest?</strong> It's the trigger.</span></p>
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-shield-check class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>Safe by default?</strong> Preview before mutate.</span></p>
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-wrench class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>Maintained?</strong> Commits, versions, changelog.</span></p>
  <p v-click class="!text-[1.2rem] flex items-start gap-3"><ph-puzzle-piece class="!text-[1.5rem] text-[var(--p-primary)] shrink-0 mt-[0.18em]" /><span><strong>Fits your stack?</strong> Pulumi ≠ Terraform.</span></p>
</div>

</div>

<aside v-click class="info-card">
  <div class="info-card__label">Rule of thumb</div>
  <p>Read the whole <code>SKILL.md</code> and every script it bundles before you enable it. <strong>If you wouldn't merge it as a PR, don't install it as a skill.</strong></p>
</aside>

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">Wire</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">one manifest for the whole team — APM</p>
</div>

<StageMap current="wire" />

---

# Connecting a skill: two ways

<div class="grid grid-cols-2 gap-8 mt-4">
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Universal CLI (skills.sh)</div>

```bash
# Works for Claude Code, Cursor,
# Copilot, Codex, Gemini, …
npx skills add pulumi/agent-skills \
  --skill '*'
```

  <p class="!mt-3 !text-[1.1rem] !leading-relaxed">Lands in <code>.agents/skills/</code>, pinned in <code>skills-lock.json</code>.</p>
  </div>
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Claude Code marketplace</div>

```bash
/plugin marketplace add \
  pulumi/agent-skills
/plugin install pulumi
```

  <p class="!mt-3 !text-[1.1rem] !leading-relaxed">Lands in your Claude plugins, grouped by plugin.</p>
  </div>
</div>

<p v-click class="!mt-9 !text-[2rem] !leading-relaxed text-left !max-w-[95%]">
  Both are per-machine. What does your <span class="hl">teammate</span> get when they clone
  the repo? <span class="hl">Nothing.</span> Unless there's a manifest.
</p>

<style scoped>
:deep(.slidev-code) {
  font-size: 1.05rem !important;
  line-height: 1.5 !important;
  margin: 0.3rem 0 0 !important;
  padding: 0.8rem 1rem !important;
}
</style>

---

# APM: package.json for your agent

<div class="zoom-content">

<p v-click class="!mt-6 !text-[1.35rem] !leading-relaxed">
  The course uses <code>npx skills</code>. Perfect for one laptop. <span class="hl">Microsoft APM</span>
  takes the next step: a <span class="hl-soft">manifest</span> your whole team shares.
</p>

<p v-click class="!mt-5 !text-[1.35rem] !leading-relaxed">
  Declare skills, MCP servers, and LSP servers in <code>apm.yml</code>; drop hooks and your own
  skills under <code>.apm/</code>. Run <span class="hl-soft">apm install</span>. Every teammate's agent
  (Claude, Copilot, Cursor, Codex, Gemini) gets the <span class="hl">same setup</span>.
</p>

<p v-click class="!mt-5 !text-[1.35rem] !leading-relaxed !max-w-[72%]">
  <span class="hl">Reproducible</span> by design. And because these skills run code, <code>apm</code>
  scans every install for <span class="hl-soft">hidden-Unicode attacks</span> and pins their hashes.
  Policy can gate what's allowed across the org.
</p>

</div>

<div v-click class="demo-band">
  <span class="demo-chip">DEMO</span>
  <span>run it — <code>apm install</code>, then what landed in <code>.claude/</code></span>
</div>

<div class="apm-qr">
  <img src="/img/apm-repo-qr.png" alt="microsoft/apm on GitHub" />
  <div class="apm-qr__label">github.com/microsoft/apm</div>
</div>

<style scoped>
.demo-band {
  margin-top: 2rem;
  display: flex;
  align-items: center;
  gap: 1.1rem;
  font-size: 1.5rem;
  max-width: 68%;
  border: 1.5px solid rgba(126,107,255,0.45);
  background: rgba(126,107,255,0.08);
  border-radius: 14px;
  padding: 0.8rem 1.3rem;
}
.demo-chip {
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--p-primary);
  border: 1.5px solid var(--p-primary);
  border-radius: 8px;
  padding: 0.15rem 0.7rem;
  font-size: 1.15rem;
  flex-shrink: 0;
}
.apm-qr {
  position: absolute;
  bottom: 2.5rem;
  right: 3rem;
  z-index: 20;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}
.apm-qr img {
  width: 9rem;
  height: 9rem;
  background: #fff;
  border-radius: 12px;
  padding: 0.5rem;
  box-shadow: 0 10px 28px rgba(0, 0, 0, 0.35);
}
.apm-qr__label {
  font-family: var(--slidev-font-mono);
  font-size: 1rem;
  font-weight: 600;
  color: var(--p-fg);
}
</style>

<!--
[SHARING] BEAT 1 launches here — final click reveals DEMO:
1. apm.yml in editor (3 dep kinds + hooks file-discovered)
2. apm install (prewarmed, fast)
3. ls .claude/skills/ · .lsp.json · hook in settings.json
- analogy: curl|sh → lockfile
-->

---

# One manifest → every agent

```yaml
# apm.yml: committed to the repo, the same for everyone
name: getting-started-with-devops-ai-skills
targets: [claude]            # also: copilot, cursor, codex, gemini, …
dependencies:
  apm:
    - pulumi/agent-skills/pulumi          # Pulumi's core skill set
    - pulumi/agent-skills/delegation      # pulumi-neo-handoff
    - bregman-arie/devops-sre-skills/skills/kubernetes/diagnose-crashloop
  mcp:
    - name: pulumi                        # hosted MCP server (OAuth on first use)
      transport: http
      url: https://mcp.ai.pulumi.com/mcp
  # lsp: language servers (next slide) · hooks live in .apm/hooks/
```

<div class="grid grid-cols-3 gap-4 mt-4">
  <div v-click class="gpu-card gpu-card--muted"><div class="gpu-caption gpu-caption--muted">apm install</div><p class="!mt-2 !text-[0.98rem]">Resolve + scan, then integrate it all into <code>.claude/</code>: skills, hooks, LSP, MCP.</p></div>
  <div v-click class="gpu-card gpu-card--muted"><div class="gpu-caption gpu-caption--muted">commit apm.lock.yaml</div><p class="!mt-2 !text-[0.98rem]">Pins exact versions and content hashes, the same for everyone.</p></div>
  <div v-click class="gpu-card gpu-card--muted"><div class="gpu-caption gpu-caption--muted">git clone &amp;&amp; apm install</div><p class="!mt-2 !text-[0.98rem]">A new teammate is fully configured in one command.</p></div>
</div>

<style scoped>
:deep(.slidev-code) { font-size: 0.95rem !important; line-height: 1.45 !important; max-width: 96%; margin: 0.3rem 0 0; padding: 0.8rem 1.2rem; border-radius: 12px; }
</style>

<!--
[SHARING] DEBRIEF of beat 1 — they just watched apm install run; this is the manifest
that drove it. Walk the deps, then click the three cards.
- if asked: apm compile = separate (.apm/ → AGENTS.md), not used here
-->

---

# Skills, MCP, Neo: three layers

<div class="grid grid-cols-3 gap-6 mt-8">
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Agent Skills</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Static know-how</strong> in your agent. "How an expert uses Pulumi." Loaded on demand. Free until used.</p>
  </div>
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Pulumi MCP server</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Live tools.</strong> Query the registry, validate code, reach Pulumi Cloud. Governed access, so the agent never holds creds.</p>
  </div>
  <div v-click class="gpu-card gpu-card--accent">
    <div class="gpu-caption gpu-caption--accent">Pulumi Neo</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed"><strong>Autonomous agent</strong> with RBAC + human-in-the-loop. Hand off with the <code>pulumi-neo-handoff</code> skill.</p>
  </div>
</div>

<p v-click class="!mt-9 !text-[2rem] !leading-relaxed text-left !max-w-[95%]">
  A <span class="hl">skill</span> teaches the agent how to drive the <span class="hl">MCP</span> server;
  when the job gets big, <code>pulumi-neo-handoff</code> packages it into a <span class="hl">Neo</span> task.
</p>

<!--
- don't oversell Neo — we show the handoff skill only, no live Neo run
-->

---

# Quality depends on how you configure it

<div class="zoom-content">

<p v-click class="!mt-8 !text-[1.4rem] !leading-relaxed">
  That stack is only as good as its <span class="hl-soft">configuration.</span> A coding agent can
  write Pulumi for you, but <span class="hl">how well depends almost entirely on how you've set it up.</span>
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  Skills and the MCP server are two levers. Two more keep it from
  <span class="hl-soft">drifting off your patterns:</span>
</p>

<p v-click class="!mt-6 !text-[1.4rem] !leading-relaxed">
  <span class="hl">LSP</span> lets it <span class="hl-soft">see real types</span> as it writes.
  <span class="hl">Hooks</span> and <span class="hl">permissions</span> are <span class="hl-soft">local guardrails</span>
  on the dangerous commands. <code>apm install</code> wires the hook; you add a permissions deny-list.
</p>

</div>

---

# LSP: let the agent see real types

<div class="grid grid-cols-2 gap-10 mt-4">
  <div class="big-code">

```yaml
# apm.yml: a language server per Pulumi language
dependencies:
  lsp:
    - name: typescript-language-server
      command: typescript-language-server
      args: ["--stdio"]
      extensionToLanguage: { ".ts": typescript }
    - name: pyright                       # Python
      command: pyright-langserver
      args: ["--stdio"]
      extensionToLanguage: { ".py": python }
    - name: gopls                         # Go
      command: gopls
      args: ["serve"]
      extensionToLanguage: { ".go": go }
```

  </div>
  <div>
    <ul class="!mt-2 !text-[1.3rem] !leading-relaxed space-y-3">
      <li v-click>The agent sees <span class="hl">real types and live diagnostics</span> as it writes</li>
      <li v-click>So it uses the <span class="hl-soft">real cloud-SDK API</span> (the actual args on <code>aws.s3.Bucket</code>) instead of guessing</li>
      <li v-click><code>apm install</code> writes <code>.lsp.json</code>, not the binaries. You put <code>gopls</code> / <code>pyright</code> / <code>typescript-language-server</code> on <code>$PATH</code> yourself</li>
      <li v-click class="!font-semibold">Mistakes get caught as the code is typed, not at <code>pulumi up</code></li>
    </ul>
  </div>
</div>

<style scoped>
:deep(.slidev-code) { font-size: 1.0rem !important; line-height: 1.45 !important; }
</style>

---

# Hooks: a fast local guardrail (not a wall)

<div class="grid grid-cols-2 gap-10 mt-4">
  <div class="big-code">

<div class="gpu-caption gpu-caption--muted !mb-1">.apm/hooks/block-pulumi-mutations.json</div>

```json
{ "PreToolUse": [{
  "matcher": "Bash",
  "hooks": [{
    "type": "command",
    "command": "\"$CLAUDE_PROJECT_DIR\"/scripts/guard-pulumi.sh",
    "timeout": 10
  }]
}]}
```

```bash
# guard-pulumi.sh blocks (exit 2) pulumi up/update/
# destroy, flags and all; fails CLOSED if it can't parse.
```

  </div>
  <div>
    <ul class="!mt-2 !text-[1.3rem] !leading-relaxed space-y-3">
      <li v-click>A <code>PreToolUse</code> hook on the <span class="hl">Bash</span> tool sees the command first; exit <code>2</code> blocks it and hands the reason back</li>
      <li v-click><code>apm install</code> merges it into <code>.claude/settings.json</code>. Pair it with a <code>permissions</code> deny-list, the "settings" lever</li>
      <li v-click class="!font-semibold">It's a <span class="hl">nudge, not a wall.</span> The agent can still deploy via the Automation API, the MCP server, or a <code>make</code> wrapper, none of which touch Bash</li>
    </ul>
  </div>
</div>

<aside v-click class="info-card">
  <div class="info-card__label">So where's the real wall?</div>
  <p>Server-side: <strong>Pulumi Cloud deployment policies + OIDC-scoped, short-lived creds.</strong> The hook catches the obvious local mistake fast; the Cloud policy is what actually stops a bad apply.</p>
</aside>

<style scoped>
:deep(.slidev-code) { font-size: 1.0rem !important; line-height: 1.45 !important; }
</style>

<!--
- eager-agent story: R1 + my rehearsal — agent found the broken crashloop yaml and FIXED it unprompted
- that's why: nudge not wall · real wall = Cloud policy + OIDC
-->

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">Use</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">the configured agent, at work</p>
</div>

<StageMap current="use" />

---

# Same prompt, configured vs not

<div class="grid grid-cols-2 gap-8 mt-3">
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Naked agent</div>

```ts
// "make an S3 bucket for our data"
new aws.s3.BucketV2("data", {
  publicReadAccess: true,  // ❌ invented arg
});
// then runs `pulumi up`, no preview
```

  <p class="!mt-2 !text-[1.05rem] text-[var(--p-fg-muted)]">Hallucinated API, no tags, deploys unprompted.</p>
  </div>
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Configured agent</div>

```ts
// same prompt; skills + LSP + hooks on
new aws.s3.BucketV2("data", {
  tags: { team: "platform", env: "dev" },
});
// `pulumi preview` ✅ (hook held `up`)
```

  <p class="!mt-2 !text-[1.05rem] text-[var(--p-fg-muted)]">LSP killed the bad arg; skill added tags; it stopped at preview.</p>
  </div>
</div>

<div v-click class="demo-band">
  <span class="demo-chip">DEMO</span>
  <span>for real — the squiggle, the skill firing itself, the hook holding <code>pulumi up</code></span>
</div>

<style scoped>
:deep(.slidev-code) { font-size: 0.95rem !important; line-height: 1.4 !important; }
.demo-band {
  margin-top: 1.8rem;
  display: flex;
  align-items: center;
  gap: 1.1rem;
  font-size: 1.5rem;
  border: 1.5px solid rgba(126,107,255,0.45);
  background: rgba(126,107,255,0.08);
  border-radius: 14px;
  padding: 0.8rem 1.3rem;
}
.demo-chip {
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--p-primary);
  border: 1.5px solid var(--p-primary);
  border-radius: 8px;
  padding: 0.15rem 0.7rem;
  font-size: 1.15rem;
  flex-shrink: 0;
}
</style>

<!--
BEAT 2 — the money shot. Three artifacts IN ORDER, narrate off vs on:
1. LSP: open demo/pulumi-ts/index.ts → red squiggle on publicReadAccess
2. skill: "Start a new payments service — AWS, TypeScript" → golden-path fires itself
   — land it: you never SAID "use the skill"
3. hook: ask it to apply → guard-pulumi.sh blocks pulumi up, preview still green
- say it: hook = nudge not wall
- if only one demo survives the clock: this one
-->

---

# Use it: the agent triggers the skill itself

<div class="grid grid-cols-2 gap-8 mt-4">
  <div>
    <p class="!text-[1.3rem] !leading-relaxed !mb-3">You type a normal request:</p>
    <div class="pr-card"><div class="pr-card__body">"Start a new <strong>payments</strong> service, AWS, TypeScript."</div></div>
    <ul class="!mt-5 !text-[1.2rem] !leading-relaxed space-y-2">
      <li v-click>Agent matches it to <code>golden-path-service</code> from its <span class="hl">description</span></li>
      <li v-click>Loads the body, follows the steps, runs the bundled script</li>
      <li v-click><span class="hl-soft">previews</span>, waits for your OK, and never runs <code>pulumi up</code> unprompted</li>
    </ul>
  </div>
  <div v-click class="big-code">

```text
🛠  golden-path-service triggered
→ pulumi new aws-typescript …
→ wired config to ESC (OIDC, no keys)
→ applied standard tags
→ pulumi preview  ✅  (awaiting approval)
```

  </div>
</div>

<div v-click class="demo-band">
  <span class="demo-chip">DEMO</span>
  <span>…and now that <code>payments</code> service is crashlooping — <code>incident-triage</code>, live</span>
</div>

<style scoped>
.pr-card { max-width: 100%; margin: 0; border: 1px solid rgba(126,107,255,0.4); border-radius: 12px; background: rgba(126,107,255,0.06); }
.pr-card__body { padding: 0.9rem 1.2rem; font-size: 1.3rem; }
:deep(.slidev-code) { font-size: 1.1rem !important; line-height: 1.5 !important; }
.demo-band {
  margin-top: 1.8rem;
  display: flex;
  align-items: center;
  gap: 1.1rem;
  font-size: 1.5rem;
  border: 1.5px solid rgba(126,107,255,0.45);
  background: rgba(126,107,255,0.08);
  border-radius: 14px;
  padding: 0.8rem 1.3rem;
}
.demo-chip {
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--p-primary);
  border: 1.5px solid var(--p-primary);
  border-radius: 8px;
  padding: 0.15rem 0.7rem;
  font-size: 1.15rem;
  flex-shrink: 0;
}
</style>

<!--
- DEBRIEF of beat 2 first: matched from description alone · ESC/OIDC wired · stopped at preview
- then final click = BEAT 3. Prompt EXACTLY: "We have a prod incident: the payments pods
  are in CrashLoopBackOff in the demo namespace. Triage it — gather diagnostics, classify
  severity, and propose a stabilization plan." (bare "triage this crashloop" → community skill)
- watch: fires from description · gather-diagnostics.sh read-only · severity from references/
  · proposes fix, STOPS
-->

---
hide: true
---

# Complex: make it safe and deterministic

<div class="grid grid-cols-2 gap-10 mt-4">
  <div class="big-code">

```yaml
# incident-triage/SKILL.md frontmatter
name: incident-triage
description: >-
  Triage a prod incident on K8s. Use for
  an outage, CrashLoopBackOff, or a pod
  that won't schedule.
metadata:
  default-mode: read-only      # ← a hint for humans, not enforced
```

```bash
# the exact commands live in a script the agent runs
scripts/gather-diagnostics.sh <ns> <workload>
# pods · events · restarts · logs · rollout
```

  </div>
  <div>
    <ul class="!mt-2 !text-[1.3rem] !leading-relaxed space-y-3">
      <li v-click><span class="hl">references/</span> hold the heavy detail (severity matrix, escalation), read only when the task needs them</li>
      <li v-click><span class="hl">scripts/</span> do the deterministic part. <code>gather-diagnostics.sh</code> gathers evidence and <span class="hl-soft">mutates nothing</span></li>
      <li v-click><span class="hl">templates/</span> are what it fills in: a postmortem, ready to paste</li>
      <li v-click class="!font-semibold"><span class="hl">read-only</span> by default. It proposes a fix; a human approves.</li>
    </ul>
  </div>
</div>



---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20 text-center">
  <h1 class="!text-[7.5rem] !leading-tight !font-semibold !tracking-tight !m-0 !text-[var(--p-primary)]">Build</h1>
  <p class="!mt-4 !text-[2rem] text-[var(--p-fg-muted)] !m-0">your own skills, done well</p>
</div>

<StageMap current="build" />

---

# Six principles that make a skill reliable

<div class="grid grid-cols-2 gap-x-12 gap-y-3 mt-6 zoom-90">
  <p v-click class="!text-[1.25rem]"><strong>1. The description is the trigger.</strong> Say what it does <em>and</em> when. Third person, specific.</p>
  <p v-click class="!text-[1.25rem]"><strong>2. One skill, one job.</strong> Sharp scope beats a mega-skill that competes with itself.</p>
  <p v-click class="!text-[1.25rem]"><strong>3. Keep <code>SKILL.md</code> short.</strong> Under ~500 lines; push detail into <code>references/</code>.</p>
  <p v-click class="!text-[1.25rem]"><strong>4. Scripts for procedure.</strong> If a step is exact commands, ship the script and have the agent run it.</p>
  <p v-click class="!text-[1.25rem]"><strong>5. Name it like your team talks.</strong> Match the words people actually use.</p>
  <p v-click class="!text-[1.25rem]"><strong>6. Safe by default.</strong> Read-only, preview, confirm before mutating. No static creds.</p>
</div>

<aside v-click class="info-card">
  <div class="info-card__label">If you remember one thing</div>
  <p>The <code>description</code> is the most important line you write. It's how the agent decides to load the skill at all.</p>
</aside>

<style scoped>
.zoom-90 { zoom: 1.0; }
</style>

<!--
[BUILDING]
- don't read all six — land #1 + #6
-->

---

# Keep them current · remove them clean

<div class="grid grid-cols-2 gap-10 mt-4">
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Keep up to date</div>
    <ul class="!mt-3 !text-[1.2rem] !leading-relaxed space-y-2">
      <li>Skills live in <strong>git</strong> next to the runbook; change both in one PR</li>
      <li><strong>Review like code</strong>; pin deps and bump deliberately (<code>apm update</code>)</li>
      <li>Re-test on model/agent upgrades, and keep a smoke prompt per critical skill</li>
      <li class="!font-semibold">Stale skill &gt; stale doc: the agent <em>acts</em> on it</li>
    </ul>
  </div>
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Remove cleanly</div>
    <ul class="!mt-3 !text-[1.2rem] !leading-relaxed space-y-2">
      <li>Every skill costs context and a chance to mis-trigger, so prune the unused</li>
      <li><code>apm uninstall &lt;pkg&gt;</code>, or delete <code>.apm/skills/&lt;name&gt;/</code> and recompile</li>
      <li>Drop the manifest entry so it doesn't come back on the next sync</li>
      <li>Unsure? <strong>Disable</strong> beats delete (<code>skillOverrides</code>)</li>
    </ul>
  </div>
</div>

<!--
- killer line: stale skill > stale doc — the agent ACTS on it
-->

---

# One loop, closed today

<div class="zoom-content">

<ul class="!mt-6 !text-[1.45rem] !leading-relaxed space-y-4">
  <li v-click>An <span class="hl">incident</span>: checkout dark, every pod green — nothing any installed skill covered</li>
  <li v-click>The debugging <span class="hl">session became a skill</span>: <code>skill-creator</code> extracted <code>service-connectivity-triage</code></li>
  <li v-click>The skill became <span class="hl">PR #1</span> on our team repo — reviewed like code</li>
  <li v-click>Merged → one line in <code>apm.yml</code> → next <code>apm install</code>: it's in <span class="hl">every teammate's agent</span>, pinned</li>
</ul>

<p v-click class="!mt-8 !text-[1.5rem] !leading-relaxed">
  <span class="hl">incident → session → skill → PR → review → team.</span><br/>
  Your runbooks are skills waiting to be built — capture the next one you do twice.
</p>

</div>

<style scoped>
.zoom-content { zoom: 1.15; }
</style>

<!--
- the whole workshop in one arc: what (a folder) · why (this job) · get (we adopted 14)
  · wire (the manifest) · use (you watched it) · build (this loop)
- merge + dep line: spoken, not performed — one click, verified working Aug 10
-->

---

# What we didn't cover

<div class="grid grid-cols-2 gap-8 mt-4">
  <div v-click class="gpu-card gpu-card--primary">
    <div class="gpu-caption gpu-caption--accent">Skill evals</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed">Anthropic's <code>skill-creator</code> now <strong>tests skills</strong>: eval cases (a realistic prompt + assertions), benchmarks for pass rate / time / tokens, and blind A/B of skill vs no skill.</p>
  </div>
  <div v-click class="gpu-card gpu-card--muted">
    <div class="gpu-caption gpu-caption--muted">Org-wide governance</div>
    <p class="!mt-3 !text-[1.15rem] !leading-relaxed">Enterprise-managed skills, and APM's <code>apm-policy.yml</code>: tighten-only rules from enterprise → org → repo for what agents may install.</p>
  </div>
</div>

<p v-click class="!mt-9 !text-[2rem] !leading-relaxed text-left !max-w-[95%]">
  And the habit that makes evals matter: <span class="hl">every new model release can change how
  your skills behave.</span> Re-run the evals; a skill that worked yesterday can drift today.
</p>

<!--
- this answers Ravi's R1 question: "how do you TEST a skill"
- eval case = realistic prompt + assertions · blind A/B skill vs no-skill
- kicker: new model → re-run evals (capability skills go obsolete, preference skills drift)
-->

---

# You used the whole Pulumi stack today

<div class="grid grid-cols-[auto_1fr] gap-x-10 gap-y-4 mt-6 items-baseline pulumi-stack">
  <div v-click class="ps-name">Agent Skills</div>
  <p v-click="1" class="ps-what">The skills <code>apm install</code> wired in — <code>pulumi/agent-skills</code>, open to your contributions</p>
  <div v-click class="ps-name">MCP server</div>
  <p v-click="2" class="ps-what">Registry, validation, Pulumi Cloud — governed live access; the agent never holds creds</p>
  <div v-click class="ps-name">ESC</div>
  <p v-click="3" class="ps-what">Where golden-path put the config — OIDC, no static secrets anywhere the agent can reach</p>
  <div v-click class="ps-name">Cloud policy</div>
  <p v-click="4" class="ps-what">The real wall behind the hook — deployment policies + short-lived scoped creds</p>
  <div v-click class="ps-name">Neo</div>
  <p v-click="5" class="ps-what">Hand off whole jobs — RBAC + human approval. <span class="hl">And Neo runs Agent Skills:</span> the skill you watched get born teaches it too</p>
</div>

<p v-click class="!mt-9 !text-[1.9rem] !leading-relaxed">
  <span class="hl">Same skills, every agent — including the autonomous one.</span>
  <span class="opacity-70">pulumi.com/docs/ai</span>
</p>

<style scoped>
.ps-name {
  font-weight: 700;
  font-size: 1.55rem;
  color: var(--p-primary);
  white-space: nowrap;
}
.ps-what { margin: 0; font-size: 1.25rem; line-height: 1.45; }
</style>

<!--
- not a pitch — a map of what they WATCHED, product by product
- kicker: Neo speaks Agent Skills (pulumi/agent-skills README: accepted skills work in Neo)
  → today's loop also upgrades the autonomous agent
-->

---

<div class="absolute inset-0 flex flex-col justify-center items-center px-20">
  <div class="opacity-80 tracking-[0.6em] uppercase !text-[1.6rem] !mb-4 text-[var(--p-fg-muted)]">Thank you</div>
  <h1 class="!text-[4.5rem] !leading-[1.02] !font-semibold !tracking-tight !mb-16 text-center">
    Go make your agent <span class="!text-[var(--p-primary)]">yours.</span>
  </h1>

  <div class="flex gap-12 justify-center items-start">
    <div class="text-center">
      <img src="/img/engin-diri.jpg" class="w-32 h-32 rounded-full mx-auto mb-4 border-4 object-cover" style="border-color: rgba(126,107,255,0.35)" alt="Engin Diri" />
      <div class="!text-[1.7rem] !font-bold">Engin Diri</div>
      <div class="opacity-60 !text-[1.2rem]">Pulumi</div>
      <div class="flex items-center justify-center gap-4 mt-2 !text-[1.1rem] opacity-60">
        <span class="flex items-center gap-1"><carbon-logo-github /> dirien</span>
        <span class="flex items-center gap-1"><carbon-logo-linkedin /> engin-diri</span>
      </div>
      <div class="mt-5 bg-white rounded-lg p-2 inline-block shadow-lg">
        <img src="/img/linkedin-qr.png" class="w-32 h-32" alt="LinkedIn QR" />
      </div>
    </div>
    <div class="text-center">
      <img src="/img/adam-gordon-bell.png" class="w-32 h-32 rounded-full mx-auto mb-4 border-4 object-cover" style="border-color: rgba(126,107,255,0.35)" alt="Adam Gordon Bell" />
      <div class="!text-[1.7rem] !font-bold">Adam Gordon Bell</div>
      <div class="opacity-60 !text-[1.2rem]">Pulumi</div>
      <div class="flex items-center justify-center gap-4 mt-2 !text-[1.1rem] opacity-60">
        <span class="flex items-center gap-1"><carbon-logo-github /> adamgordonbell</span>
        <span class="flex items-center gap-1"><carbon-logo-linkedin /> adamgordonbell</span>
      </div>
      <div class="mt-5 bg-white rounded-lg p-2 inline-block shadow-lg">
        <img src="/img/adam-linkedin-qr.png" class="w-32 h-32" alt="Adam Gordon Bell LinkedIn QR" />
      </div>
    </div>
    <div class="text-center">
      <div class="w-32 h-32 rounded-full mx-auto mb-1 border-4 overflow-hidden flex items-center justify-center" style="border-color: rgba(126,107,255,0.35)">
        <carbon-logo-github class="!text-[6rem] leading-none" />
      </div>
      <div class="!text-[1.7rem] !font-bold">Workshop repo</div>
      <div class="opacity-60 !text-[1.2rem]">slides · chapters · skills</div>
      <div class="mt-2 !text-[1.1rem] opacity-0">&nbsp;</div>
      <div class="mt-5 bg-white rounded-lg p-2 inline-block shadow-lg">
        <img src="/img/repo-qr.png" class="w-32 h-32" alt="Workshop repo QR" />
      </div>
    </div>
    <div class="text-center">
      <div class="w-32 h-32 rounded-full mx-auto mb-4 border-4 bg-white flex items-center justify-center" style="border-color: rgba(126,107,255,0.35)">
        <img src="/logos/pulumi-logo-mark-color-light.svg" class="w-20 h-20" alt="Pulumi" />
      </div>
      <div class="!text-[1.7rem] !font-bold">Pulumi Skills</div>
      <div class="opacity-60 !text-[1.2rem]">pulumi.com/docs/ai</div>
      <div class="mt-2 !text-[1.1rem] opacity-0">&nbsp;</div>
      <div class="mt-5 bg-white rounded-lg p-2 inline-block shadow-lg">
        <img src="/img/pulumi-qr.png" class="w-32 h-32" alt="Pulumi website QR" />
      </div>
    </div>
  </div>
</div>


