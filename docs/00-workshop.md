# Workshop — Live Presenter Feed (v2)

> **Format:** Scroll top to bottom as you present. Each stage has talking points, what to say to the agent, audience beats, and a fallback prompt if the agent needs a nudge.
> **Agent:** `Design Thinking (Beast)` — open before Stage 1. Do not close or reset between stages.
> **Pace:** You drive. The agent waits for you. Never let the agent advance a stage you haven't narrated yet.

---

## Pre-Show Checklist

- [ ] Copilot Chat open, `Design Thinking (Beast)` agent active
- [ ] Send the warm-up message below to confirm the agent is alive **and** anchor it to the context folder
- [ ] `gh auth status` — active
- [ ] GitHub repo created and accessible.
- [ ] GitHub Project created in that repo — note the project name exactly as it appears
- [ ] Browser tab pre-loaded to the demo repo's Issues page (hidden — reveal in Stage 7)

- [ ] Font size: chat window and terminal both readable from the back of the room

### Warm-Up Message — Copy and Send Before Stage 1

```
Good morning — I'm about to run a live design thinking workshop using the HVE framework.

Please save all context artifacts, stakeholder maps, interview outputs, and synthesis documents to the designated context folder as we work through each stage.

You are going to help facilitate this workshop and the process. At the end of the session you will also use the gh CLI to create GitHub Feature issues directly from the implementation options we generate.

Start by creating the documentation folder structure, then confirm you're ready.
```

### Display Before You Speak

Put this on screen before the first word:

> *"Our approval process is killing us. It takes too long, too many people are involved, and things fall through the cracks. We need a modern system to replace what we have. Can you build it?"*
> — VP of Operations

### Talking Points

> "Raise your hand if you've received a request that sounded exactly like this."

*(pause — let them react)*

> "Keep your hand up if your team started scoping or estimating before anyone asked a single clarifying question."

*(longer pause)*

> "This is the most dangerous moment in any project — not when you're lost, but when you're *confident* you know what to build. The request sounds obvious. The solution seems clear. And that's exactly when you build the wrong thing."

> "Today we're going to go from that one sentence to a structured GitHub backlog — using AI-powered design thinking. But here's what's different about how we're doing it: I'm not going to paste pre-written prompts into a chat window. I'm going to have a conversation with an AI agent — a Design Thinking facilitator — and you're going to see it think through the process with us, stage by stage."

> "The agent knows the HVE design thinking framework. It knows what questions to ask at each stage. My job is to give it context. Its job is to keep us on track. Your job is to watch where the output surprises you."

> "Let's start where most teams don't."

---

---

## Stage 1 — Scope Conversations

### Open the Agent — Set the Stage for the Audience

> "I'm opening the Design Thinking agent now. Notice: I'm not writing a prompt. I'm going to describe the situation the way I'd describe it to a colleague."

### What to Say to the Agent

Speak naturally. Type something like this — in your own words, not as a formal prompt:

```
Hey I just got handed a request from a VP, its a vague one but it needs attention.

They said: 'Our approval process is killing us. 
It takes too long, too many people are involved, and things fall through the cracks. 
We need a modern system to replace what we have. Can you build it?' 

We haven't started any scoping yet. Where do I begin?
```

**While the agent responds:**
> "Watch what it does. It's going to classify this request and tell us what stage we're in — not because I told it to, but because that's how this agent is designed to think."

### What to Expect from the Agent

The Beast agent should:
- Classify this as a **Frozen Request** (specific solution implied: "a modern system")
- Route to **Method 1: Scope Conversations**
- Offer to generate discovery questions or a stakeholder map

### Narrate the Agent's Move

> "It classified this as a Frozen Request — a request that sounds specific but is really just a symptom wrapped in a solution. And it's correctly telling us: before we do anything else, we interrogate the request."

### Advance: Discovery Questions

Tell the agent:

```
help me to generate some discovery questions that we 
should be asking before we scope anything.
```

**While it runs:**
> "These aren't requirements questions. They're not 'what's your timeline' or 'what's the tech stack.' They're the questions that expose what we don't know yet. That's the discipline — and it's the part that gets skipped most often."

**After output — point to 2–3 questions:**
> "Here: 'When you say approval process, which one?' Most teams assume there's one. Our scenario has at least four: code review, procurement, expense, change management."

> "And this one — whatever version of the organizational memory question it surfaced. That's the question that tells you whether you're walking into a political minefield."

### Advance: Stakeholder Map

Tell the agent:

```
Good. Now let's map the stakeholders. 
Who do we need to consider for something like this?
```

**After output:**
> "This is what scope conversations produce. Not a feature list — a map of competing needs. Every one of these personas wants something different from the same system."

### Transition

> "We know who we're dealing with. Now we need to hear from them."

> *(If agent tries to move on its own, say:)* "Hold there — let me walk the room through what we just learned before we go to the next stage."

---

**⚠️ Fallback — if the agent doesn't classify the request clearly:**

```
We are starting a design thinking engagement using the HVE framework.

A VP submitted this request: "Our approval process is killing us. 
It takes too long, too many people are involved, 
and things fall through the cracks. We need a modern system to replace what we have."

Classify this as Frozen or Fluid. Then run Method 1: Scope Conversations — generate 10–12 discovery questions organized by category, and map 4–6 stakeholder personas with power/interest levels and risk notes.
```

---

---

## Stage 2 — Design Research + SME Simulation

### Before You Engage the Agent

> "We have our stakeholder map from Stage 1. Now we put those personas to work. In a real project, you'd take your interview questions and go spend days with these people. Today we're compressing that entirely — and I want to be upfront about what that means."

> "We're going to ask the agent to embody each persona and answer as that person would. This is synthetic research. It's useful for surfacing contradictions and pressure-testing your thinking before you sit with a real human. It's a rehearsal, not a replacement."

### What to Say to the Agent

```
I want you to simulate interviews with each of the stakeholders we mapped. 
Embody each persona and answer as that person would 
with their blind spots, 
their priorities, 
and at least one thing they reveal 
without realizing they've said something important.
```

**While it runs:**
> "Each persona is going to give us a different version of the same problem. Some of what they say will directly contradict each other. That's not noise — that's the data."

**After output — take a moment to scan and pick one contradiction:**
> "Let's look at a couple of these. Pick any two personas — find a place where their answers are pulling in opposite directions. That tension is your finding. It's the thing a new tool won't automatically fix."

*(pause — read one out loud, or take an answer from the audience)*

### Transition

> "We have the voices. Now we find the signal in them."

---

**⚠️ Fallback — if agent doesn't go deep enough on simulation:**

```
Simulate realistic interviews for each persona in our stakeholder map. For each persona:
- Answer through the lens of their role, incentives, and blind spots
- Include at least one direct pain quote
- Include at least one moment where this persona contradicts what another persona would say
- Include one thing they reveal without realizing its significance
Format as short Q&A exchanges — 6–8 per persona, not essay responses.
```

---

---

## Stage 3 — Input Synthesis

> **7 min | Running: 0:24 | Agent: Beast**

> ⚠️ **Do not reset.** Synthesis runs against the conversation history of Stage 2.

### Before You Engage the Agent

> "We have voices, we have data, and we have contradictions. Input Synthesis is the stage where we stop collecting and start making sense of it."

> "Before I run this — based on what we just heard, which persona do you think has the most accurate diagnosis of the real problem?"

*(pause — take 2–3 answers)*

> "Hold that. Let's see what the synthesis says."

### What to Say to the Agent

```
Let's do the synthesis. Look at everything we got from those 
interviews and find the patterns. 
what's the actual problem underneath the 
request we started with?
```

**While it runs:**
> "We asked each of these personas about the same process. We're about to find out whether they were even talking about the same thing."

### The Pivot Moment

**After output — scan the themes aloud, then read the reframed problem statement:**

> "Let's look at what it surfaced. The themes are —" *(read 2–3 theme names aloud from the output)*

> "And here's the reframed problem statement." *(read it aloud)*

> "Compare that to where we started: 'build us a modern approval system.' That's the shift. The agent isn't pointing at a tool gap — it's pointing at something else. Whatever it named, that's what a new tool alone won't fix."

> "That reframe just saved someone from building the wrong thing."

**Audience Engagement:**
> "Look at the themes on screen. Pick the one that would give your org the most relief if it were solved. You don't have to say it out loud — just know which one you'd pick. We'll come back to that."

### Transition

> "We know what's broken. Now we shape it into something worth building."

---

**⚠️ Fallback — if synthesis output is too shallow:**

```
Perform a full Input Synthesis using the simulated interviews from all personas. Produce:
1. 4–6 primary themes — named, described in 1–2 sentences, with persona citations
2. 2–3 significant contradictions — conflicting needs, assumptions, or definitions of success
3. 1–2 hidden insights — things a persona revealed without recognizing its significance
4. A reframed problem statement that names whether this is a tooling problem, a process problem, or something else
Be explicit about the real problem beneath the original request.
```

---

---

## Stage 4 — How Might We + Brainstorming

> **10 min | Running: 0:34 | Agent: Beast**

> ⚠️ Stay in the same conversation. HMW and brainstorming run against the synthesis from Stage 3.

> "This next part is fast — two minutes. We're doing the HMW reframe: the hinge between diagnosing the problem and generating solutions. Watch how the language shifts."

Tell the agent:

```
Lets Generate How Might We statements from our synthesis. 
They should be open enough to invite multiple solution directions, 
but specific enough to stay anchored to the real problem 
we just identified
```

**After output:**
> "Notice the framing: 'How might we' — not 'how should we.' It holds possibility open without assuming there's one right answer. Pick the statement that feels closest to the problem you identified in your head. We're about to brainstorm against all of them."

### Divergent Brainstorm

Tell the agent:

```
Let's brainstorm. 
Use SCAMPER against those HMW statements.
give me a wide range. Include obvious ideas, 
surprising ones,
ideas that would probably fail,
and at least one idea that reframes the problem entirely. 
Don't filter yet.
```

**While it runs:**
> "This is the divergent phase. The job is not to be right — it's to be broad. Some of these ideas will be bad. That's the point."

**After output — give the room 15 seconds to read:**
> "Look at the range. Some of these you'd never build. Some you'd never have thought of without pushing past the obvious. Now we collapse them."

### Converge: Options

Tell the agent:

```
Now cluster those ideas into between 3 and 5 distinct implementation options 
that I can review.
Each option needs a short memorable name 
(a direction, not a feature name), 
a brief but clear description of 
what it builds or does, the HMW statement 
it addresses, and the key risk or assumption 
we'd need to prove out.
```

**While it runs:**
> "Each one of these represents a coherent direction, not just a ticket. When the room votes, they're not picking a feature — they're picking a strategy."

**After output:**
> "These are our options, each grounded in the research we did, each carrying a named risk. That's what makes a backlog defensible — not just what we're building, but why."

---

**⚠️ Fallback — if options aren't distinct enough:**

```
Cluster the brainstormed ideas into exactly 5 implementation options. Options must be meaningfully distinct — no overlapping purpose or approach. For each option:
1. A short memorable name (direction, not feature)
2. What it builds or does in 2 sentences
3. Which brainstorm ideas it incorporates
4. The primary HMW statement it addresses
5. The key risk or assumption that could invalidate it
```

---

---

## Stage 5 — Confirm the Options

> **2 min | Running: 0:36 | No agent.**

> ⚠️ This is the bridge between the agent and the backlog script. Do not skip it.

### What's Happening

> "The agent has been building context in our designated folder throughout this session — the stakeholder map, the interview simulations, the synthesis, the options. Before we vote, I want to confirm those five options are clearly in front of the room."

> *(Scroll back through the chat and confirm the 5 option names are visible — copy them to a slide or whiteboard now if you haven't already.)*

### Transition

> "Options are locked. Time to vote."

---

---

## Stage 6 — Audience Vote

> **2 min | Running: 0:38 | No agent. No terminal.**

> ⚠️ All 5 option names + 1-sentence descriptions must be visible on screen during the vote.

> ⚠️ Copy the 5 option names from the agent output onto a slide or whiteboard before this stage. Do not leave them buried in the chat window.

### Run the Vote

*(one beat of silence)*

> "Not because leadership decided. Not because it was the loudest voice in the room. Because we went from one vague complaint to structured research to a ranked decision — and this is where the process landed."

### Audience Engagement

> "Quick check — is this the option you would have picked if I'd asked you at the beginning of the hour, before any of this? Who changed their mind?"

*(take 1–2 quick answers)*

### Transition

> "You voted. Let's make it real."


## Stage 7 — Feature-Level GitHub Issues

> **6 min | Running: 0:44 | Agent: Beast**

### Set Up the Moment

> "Everything we just did — the scope conversations, the stakeholder map, the simulated research, the synthesis, the reframe, the brainstorming, the vote — it's all been building in context. The agent knows every output from every stage."

> "In a traditional process, turning that work into a backlog takes weeks. Research writeup, alignment meeting, spec review, someone creates tickets by hand, context gets lost between the thinking and the doing."

> "We're going to skip all of that. I'm going to ask the agent to create the GitHub Feature issues directly — using the gh CLI — from the implementation options it generated."

### What to Say to the Agent

```
Using the implementation options we generated, 
create a GitHub Feature issue for each one in the 
repository using the gh CLI.
Use the template in .github/ISSUE_TEMPLATE/feature.md

```

**While the agent runs:**
> "Watch the terminal. The agent is reading from the context it built throughout this session — the same thinking we just walked through — and turning it into structured work items. Live."

### After Issue Creation

Open the GitHub Issues browser tab:

> "There they are. One issue per option — each one tied directly back to the design thinking work this room just did."

> "The winning option is Issue [#] — the one you voted on. Every issue carries the description, the HMW statement it addresses, and the risk we named in brainstorming. The backlog isn't a task list — it carries the reasoning that produced it."

### Audience Engagement

> "What's different about this backlog versus one your team would create without going through this process?"

*(take 1–2 answers — expected: tied to real research, contradictions encoded, clear rationale per item)*

### Transition

> "One more thing."

---

---

## Stage 8 — Closing / Payoff

> **4 min | Running: 0:48 | No agent. No terminal.**

### What Just Happened

> "Fifty minutes ago, you had a one-sentence complaint from a VP."

> "In fifty minutes, we interrogated the request, mapped the stakeholders, simulated the research interviews, synthesized the findings into named themes and a reframed problem statement, ran a SCAMPER brainstorm, clustered the ideas into implementation options, voted, and the agent created GitHub Feature issues directly from that work — live, in a real repository."

> "The original request was 'build us a modern approval system.' The backlog you just saw is *(read the winning option name from the screen)* — not a feature list, but a direction rooted in what the research actually surfaced. That's not what the VP asked for. It's what they actually needed."

> "The gap between those two things — that's the design thinking payoff. It took an hour."

### Surface the Agent's Role

> "Here's the other thing I want you to notice. I didn't write nine carefully crafted prompts and paste them in sequence. I had a conversation. I described the situation, told the agent what I needed next, and it kept us inside the framework — asking the right questions at each stage, flagging the right contradictions, producing output that built on itself. And at the end, it created the GitHub issues itself."

> "The agent is a thinking partner, not a text generator. The design thinking framework is what gave it shape."

### The Close

> "Three things to walk out with."

> "One: design thinking isn't a process tax. The hour we spent interrogating this request will save weeks of building the wrong thing."

> "Two: AI doesn't replace the thinking — it accelerates it. You still had to know when to advance, what to look for, what mattered. The agent handled the throughput."

> "Three: the backlog is a side effect of good thinking. If your discovery process is solid, the work almost scopes itself."

> "Questions?"

---

---

## Q&A — 10 min

**Anchors if questions are slow:**

- "What would you do differently if the VP's request had been more specific — or even more vague?"
- "We used simulated interviews today. What are the right guardrails when you use synthetic research in a real engagement?"
- "What happens if the audience votes for an option you think is wrong?"
- "How do you handle a team that refuses to do discovery — that just wants to start building?"
- "The agent stayed on track today. What would make it go off track, and how do you correct it?"

---
