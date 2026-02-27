<div align="center">

<img src="https://img.shields.io/badge/HVE-Design%20Thinking-6e40c9?style=for-the-badge&logo=github&logoColor=white" alt="HVE Design Thinking"/>
<img src="https://img.shields.io/badge/GitHub%20Copilot-Agents-0078d4?style=for-the-badge&logo=githubcopilot&logoColor=white" alt="Agents"/>
<img src="https://img.shields.io/badge/Format-Live%20Workshop-00b388?style=for-the-badge" alt="Live Workshop"/>
<img src="https://img.shields.io/badge/Duration-~60%20min-f5a623?style=for-the-badge" alt="Duration"/>

<br/><br/>

# 🧠 From Vague Request to GitHub Backlog in 50 Minutes

## A live AI-powered Design Thinking workshop using the HVE framework and GitHub Copilot

<br/>

> *"Our approval process is killing us. It takes too long, too many people are involved,*
> *and things fall through the cracks. We need a modern system to replace what we have. Can you build it?"*
>
> **— VP of Operations**

<br/>

**This is the most dangerous sentence in any project.** It sounds like a clear request.
It's actually an assumption wrapped in urgency and most teams start building before asking a single question.
This workshop aims to help you fix that.

</div>

---

## What This Is

A fully scripted, live-runnable workshop that takes an audience from a single-sentence stakeholder complaint to a structured GitHub backlog — using AI-powered design thinking, a GitHub Copilot agent, and the **Hypervelocity Engineering (HVE)** framework.

No pre-written prompts. No canned output. A live conversation with an AI agent that keeps the team inside the framework, stage by stage.

---

## The Journey

<div align="center">

| # | Stage | Duration | What Happens |
|---|-------|----------|--------------|
| 1 | **Scope Conversations** | 8 min | Classify the request (Frozen vs. Fluid), generate discovery questions, map stakeholders |
| 2 | **Design Research & SME Simulation** | 8 min | Agent embodies each persona — surfaces contradictions, blind spots, hidden reveals |
| 3 | **Input Synthesis** | 7 min | Patterns emerge across voices; the *real* problem gets named |
| 4 | **How Might We + Brainstorming** | 10 min | HMW reframe → SCAMPER diverge → converge into 3–5 implementation options |
| 5 | **Confirm the Options** | 2 min | Lock options before the vote |
| 6 | **Audience Vote** | 2 min | Room chooses a direction — anchored in research, not opinion |
| 7 | **GitHub Feature Issues** | 6 min | Agent creates real GitHub issues via `gh` CLI — live, in your repo |
| 8 | **Closing / Payoff** | 4 min | Debrief the gap between what was asked and what was actually needed |

</div>

---

## The Agent

This workshop runs on the **Design Thinking (Beast)** agent — a GitHub Copilot agent tuned to the HVE framework.

It doesn't wait for structured prompts. Describe the situation like you'd describe it to a colleague. It classifies the request, routes to the right method, and keeps you inside the framework without you having to manage the process.

```
Hey I just got handed a request from a VP, its a vague one but it needs attention.

They said: 'Our approval process is killing us.
It takes too long, too many people are involved, and things fall through the cracks.
We need a modern system to replace what we have. Can you build it?'

We haven't started any scoping yet. Where do I begin?
```

That's a Stage 1 input. The agent does the rest.

---

## Repository Structure

```
.
├── docs/
│   └── 00-workshop.md          # Full presenter script — scroll top to bottom as you present
└── .github/
    ├── agents/                 # Agent .md files (DT Beast, DT Lean, BPM, Dev Lead, TPM, etc.)
    ├── instructions/           # Instruction sets applied to agents
    ├── prompts/                # Reusable prompt files
    ├── skills/                 # Skill definitions (e.g., docx-to-markdown)
    ├── workflows/              # GitHub Actions workflows
    └── ISSUE_TEMPLATE/         # Feature, story, task, bug, risk templates
```

---

## Quick Start

### Prerequisites

```bash
# Confirm GitHub CLI is authenticated
gh auth status

# Confirm your demo repo is created and accessible
gh repo view yourorg/your-demo-repo
```

> The design thinking context folder structure is created by the agent during the warm-up step — no manual `mkdir` needed.

### Pre-Show Checklist

- [ ] Copilot Chat open — **Design Thinking (Beast)** agent active
- [ ] Send the [warm-up message](docs/00-workshop.md#warm-up-message----copy-and-send-before-stage-1) to confirm the agent is alive and anchor it to the context folder
- [ ] `gh auth status` — active
- [ ] GitHub repo created and accessible
- [ ] GitHub Project created in that repo — note the project name **exactly** as it appears
- [ ] Browser tab pre-loaded to the demo repo's Issues page *(keep hidden — reveal in Stage 7)*
- [ ] Font size: chat window and terminal both readable from the back of the room

---

## The Payoff

> *"The original request was 'build us a modern approval system.'*
> *The backlog you just saw is not a feature list — it's a direction rooted in what the research actually surfaced.*
> *That's not what the VP asked for. It's what they actually needed."*

Three things the room walks out with:

- **Design thinking isn't a process tax.** The hour spent interrogating the request saves weeks of building the wrong thing.
- **AI doesn't replace the thinking — it accelerates it.** You still decide what matters. The agent handles the throughput.
- **The backlog is a side effect of good thinking.** If your discovery process is solid, the work almost scopes itself.

---

## Supplemental Resources

### Related Projects & References

There are many ways to leverage AI tooling to accelerate design thinking, engineering, and delivery. The following table provides some great options to get started with.

<div align="center">

| Resource | Description |
|----------|-------------|
| [Repository Assets](.github/) | [Agents](.github/agents/), [instructions](.github/instructions/), [prompts](.github/prompts/), and [skills](.github/skills/) used in this workshop — plus [issue templates](.github/ISSUE_TEMPLATE/) for features, stories, tasks, bugs, and risks |
| [microsoft/hve-core](https://github.com/microsoft/hve-core) | The Hypervelocity Engineering (HVE) Core framework — enterprise-ready prompt engineering for GitHub Copilot with 35 agents, 68 instruction sets, validated artifacts, and the RPI methodology |
| [bradygaster/squad](https://github.com/bradygaster/squad) | Squad — AI agent teams that live in your repo as files, persist across sessions, and accumulate project knowledge the more you use them |
| [csharpfritz/SquadUI](https://github.com/csharpfritz/SquadUI) | VS Code extension to visualize and manage your Squad team — roster, decisions, velocity metrics, and skill management directly in the editor |
| [github/awesome-copilot](https://github.com/github/awesome-copilot) | Community collection of custom agents, instructions, hooks, skills, agentic workflows, and plugins to supercharge GitHub Copilot across domains |
| [MCP Market](https://mcpmarket.com/) | Marketplace for Model Context Protocol (MCP) servers — browse, discover, and install MCP integrations for GitHub Copilot and other AI tools |

</div>

---

<div align="center">
<sub>No requirements were harmed in the making of this backlog · Powered by curiosity, caffeine, and GitHub Copilot · An AI helped write this, then a human double-checked it (mostly)</sub>
</div>
