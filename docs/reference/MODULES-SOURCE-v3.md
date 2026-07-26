# MODULES-SOURCE v3 — Cursor-AI-dev

**Version:** 3.0 | **Updated:** 2026-07-25  
**Audience:** New Dev (basic coding experience; little disciplined Cursor/agent practice)  
**Tone:** Direct. Process-first. Zero cheerleading.  
**Source of truth:** `CURSOR-MATT-SKILLS-PROCESS.md` — modules lag it.

This is the instructional source for the published HTML modules. Convert to the bug-handling-sop HTML pattern.

---

## SETUP — Skills install (hard gate · ~25–35 min)

### Why this exists
Without a verified install every later module invents process. Unconfigured agents produce confident fiction. Setup is graded, not optional.

### What you leave able to do
- Install mattpocock/skills into Cursor
- Run `/setup-matt-pocock-skills` once in a real repo and show inspectable output
- State: Rules = always-on; Skills = on-demand

### Hard gate
No Module 1 until setup output (tracker, labels, domain-doc layout) exists in the student's own repo. Evidence Pack fails if missing.

### Exact steps
1. Cursor open; Composer/Agent available (building surface). Chat is for thinking.
2. `npx skills@latest add mattpocock/skills`
3. Select official engineering skills **and** `/setup-matt-pocock-skills`
4. Open **real** working repo
5. Run `/setup-matt-pocock-skills`; answer tracker / labels / doc layout
6. Verify files written
7. Recommended: `/setup-pre-commit` so local gates match CI

### Binary checklist
- [ ] install completed
- [ ] setup output visible in repo
- [ ] student points at tracker/labels/doc-path files
- [ ] student states Rules vs Skills difference

### Failure modes
| Failure | Fix |
|---------|-----|
| Skills global but invisible in repo | Re-run setup inside target repo |
| Student skips and starts prompting | Block; no Module 1 |
| Wrong skill set selected | Re-run installer; official + setup |

---

## MODULE 1 — Reality Check & Core Setup (Day 1)

### Goal
Make the cost of undisciplined AI usage visible. Install taxonomy. Drill triage-before-grill until automatic.

### Why for a new Dev
Most new Cursor users treat the agent as autocomplete. Accept → ship → discover mess later. Cost is rework hours and review cycles, not first-draft speed. This module makes the cost visible on a real ticket.

### Core concepts that must land

**Cursor surfaces**
- Chat = thinking / Q&A. Not building surface.
- Composer / Agent = multi-file building, terminal, primary surface for code changes.
- Rules = always-on static context (short, specific, point at examples).
- Skills = on-demand workflows; cost context only when invoked.

**Skill taxonomy (architecture)**
- **User-invoked** (you type): ask-matt, grill-with-docs, wayfinder, triage, improve-codebase-architecture, setup-matt-pocock-skills, to-spec, to-tickets, implement
- **Model-invoked** (agent reaches; not typed as normal flow step): prototype, diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts

Typing `/code-review` or `/domain-modeling` as primary flow = architecture misunderstanding. `/implement` reaches `/code-review`. `/grill-with-docs` reaches `/domain-modeling`.

**Triage before grill**
| Situation | Typed skill |
|-----------|-------------|
| Foggy / >1 session | `/wayfinder` |
| Scoped + codebase | `/grill-with-docs` |
| No codebase yet | Prime, then `/grill-with-docs` once code exists |

Never default every item into `/grill-with-docs`.

**Three Pillars** (grilling engine properties)
1. Context Engineering — correct `@` files/folders first. Wrong context → confident wrong answers.
2. Assumption Destruction — force assumptions open; attack them. Facts = look up yourself; decisions = grill.
3. Stress Testing — failure modes, scale, future regret, removal test.

Grilling without all three = theater.

### Live demo (instructor)
1. Real small backlog item.
2. Path A: Agent, accept most suggestions, "ship".
3. Path B: weak grill (few questions, no pillars, no CONTEXT update).
4. Path C: full three-pillar `/grill-with-docs` with correct `@` priming.
5. Side-by-side: questions, assumptions destroyed, residual risk, plan clarity, durable artifact?

Students state the difference in one sentence each.

### Practice (pairs)
Two real backlog items each. Write one-sentence triage decision. Run correct user-invoked skill.  
**Deliverable (binary):** committed CONTEXT.md entry or ADR stub per item. Verbal share does not count. No artifact → no credit.

### Success criteria (binary)
- [ ] Setup gate still holds
- [ ] ≥1 committed CONTEXT.md / ADR from real item
- [ ] Correct triage of new item without prompting
- [ ] User-invoked vs model-invoked stated with examples

### Stop / Start
- Stop defaulting everything to `/grill-with-docs`. Start triage first.
- Stop accepting verbal share. Start requiring committed artifact.

### Instructor enforcement
Kill pairs still "just chatting." Force the artifact. If they cannot name the pillar used, the grill failed.

---

## MODULE 2 — Advanced Grilling + Specification (Day 2)

### Goal
Triage-then-grill becomes default. Produce a 3-section, implementable specification via synthesis only.

### Why
Polished ticket never grilled = fiction. `/to-spec` synthesizes; it does not think. Skipping the grill produces specs that look complete and fail under implementation.

### Core concepts
- `/to-spec` does **not** interview. It publishes a clean spec from the conversation that already happened.
- **Three mandatory sections** (any missing → reject on the spot): acceptance criteria (verifiable), non-goals, residual risks.
- Keep grill + spec in one unbroken window. Do not compact until after tickets. Implementation starts fresh later.

### Live demo
Same grilled conversation → weak-context `/to-spec` (soft output) vs properly primed `/to-spec` (implementable). Critique section by section.

### Practice
Triage → full three-pillar grill → `/to-spec`. Group review of **every** spec. Incomplete sections rejected in the room.

### Success criteria (binary)
- [ ] Every published spec has all three mandatory sections (inspected)
- [ ] ≥1 item correctly triaged with written reasoning
- [ ] Instructor spot-checked underlying grill transcript for ≥1 spec per student

### Stop / Start
- Stop forcing foggy/oversized items through single-session grill. Start `/wayfinder` first.
- Stop accepting incomplete specs. Start rejecting on the spot.

---

## MODULE 3 — Tickets + Implementation (Day 3)

### Goal
Convert 3-section spec into tracer-bullet tickets that pass the binary kill test. Implement Red→Green only. Local verification matches real CI commands.

### Why
Good spec never sliced → large unreviewable diffs and context pollution. Horizontal slicing ("all schema first") is the most common failure. "Just implement the whole spec" produces balls of mud.

### Core concepts
- **Tracer-bullet tickets:** vertical slices, end-to-end observable behavior, declare blockers, sized for one agent session.
- **Binary kill test:** fails if missing one-sentence user-observable behavior **or** missing/circular blockers. Re-slice immediately. No negotiation.
- **`/implement`:** Red→Green only at seams. Refactor is a `/code-review` output, not part of the loop. Runs CI-equivalent commands. Auto-invokes `/code-review`. Context cleared between tickets.
- **Local verification matches CI:** "tests pass in session" is not done. Pipeline commands must be green before commit is complete.

### Live demo
Same small ticket: "just build it" vs full `/implement` (Red→Green + CI + auto review). Compare diff, coverage, findings, residual risk.

### Practice
Convert Day 2 spec → tickets. Pair-review applies kill test to every ticket; failures re-sliced on the spot. One ticket through `/implement`. Confirm Red→Green only, CI green, review auto-fired.

### Success criteria (binary)
- [ ] Zero circular blockers; zero tickets failing one-sentence test
- [ ] ≥1 `/implement` diff is Red→Green only (no in-loop refactor)
- [ ] Student states why refactor moved to code review

### Stop / Start
- Stop teaching red-green-**refactor** inside implement. Start Red→Green only; refactor in review.
- Stop subjective sizing. Start binary kill test on every ticket.

---

## MODULE 4 — Debugging, Review, Architecture, Prototype (Day 4)

### Goal
Repeatable model-invoked disciplines for cleaning AI mess and settling design questions that cannot be answered on paper.

### Why
AI creates mess at speed. Without systematic diagnosis, dual-axis review, and throwaway prototyping, teams ship the mess or invent ad-hoc cleanup every time.

### Core concepts
- **`/diagnosing-bugs`:** reproduce → minimise → hypothesise → instrument → fix → regression-test. State hypothesis + next smallest experiment **before** changing code. Model-invoked.
- **Dual-axis `/code-review`:** Standards (conventions + named Fowler smells) ‖ Spec (match ticket; "no spec available" if none). Parallel sub-agents. Must-fix findings committed same day. Zero fixes = failed exercise.
- **`/improve-codebase-architecture`:** HTML report of deepenings → skill grills the selected opportunity. Reject large-rewrite proposals.
- **`/prototype`:** throwaway answer to **one** design question.
  - Logic/state feel right? → LOGIC terminal app (print full state).
  - What should it look like? → UI variants on one route + floating toggle bar.
  - Rules: marked throwaway, next to real code, one command to run, no persistence default, no polish, capture verdict on throwaway branch, never harden in place.

### Practice gate
Every must-fix has a committed diff before day end. ≥1 prototype correct branch, removed from main, verdict recorded.

### Success criteria (binary)
- [ ] Diagnosing loop; hypothesis before each fix
- [ ] Review names ≥2 Fowler smells
- [ ] Every must-fix committed
- [ ] One prototype: correct branch, throwaway, verdict recorded

### Stop / Start
- Stop leaving findings unacted. Start requiring committed fixes before close.
- Stop settling "does this feel right?" during implement. Start `/prototype` first.

---

## MODULE 5 — Full Workflow + Reality Check (Day 5)

### Goal
Process survives real deadline pressure. Leave with `/ask-matt` decision logs, not a hand-built framework that duplicates the skill.

### Why
Process practiced only under low pressure is not learned. Day 5 = execution + artifact inspection. No new theory.

### Rules
- Zero new theoretical content.
- Instructor = enforcement only (force pillars, kill bad tickets, stop context pollution).
- Real open work only.

### Executed chain
triage (`/wayfinder` | `/grill-with-docs`) → `/to-spec` (if multi-session) → `/to-tickets` (kill test) → `/implement` (Red→Green, CI, clear context) → `/code-review` (auto)

### Group reviews
Diffs + dual-axis output. What would ship? Residual risk explicit. Smells named.

### `/ask-matt` decision log
Three real scenarios from student's week → skill routing decision → one sentence agreement/disagreement each. Deliverable: three transcripts + three sentences. Not freeform prose.

### Week success criteria (binary, inspected)
- [ ] One complete end-to-end cycle with full artifact trail
- [ ] Three `/ask-matt` transcripts + agreement/deviation sentences
- [ ] Instructor has direct evidence of quality improvement Day 1 → Day 5

### Stop / Start
- Stop hand-building personal frameworks. Start from `/ask-matt` transcripts.
- Stop new theory on Day 5. Start grounding discussion only in today's artifacts.

---

## CERTIFICATION (evidence pack)

Within 5 business days, submit on **real shipping work**:

1. Proof of `/setup-matt-pocock-skills` completion
2. Triage decision + transcript
3. Published 3-section spec
4. Ticket graph passing kill test
5. ≥1 Red→Green `/implement` diff + CI-green evidence
6. Dual-axis review naming ≥2 Fowler smells + committed must-fixes
7. Three `/ask-matt` transcripts + agreement/deviation
8. (If used) `/prototype` throwaway branch + verdict

Missing any required artifact → fail. No partial credit. Measure only real experiments.

---

## HTML conversion notes
- Preserve every binary checklist and stop/start.
- Keep failure-mode tables.
- Live-demo scripts → numbered instructor steps.
- Link skill names to living process or skills hub.
- Do not soften language. Do not add motivational framing.
