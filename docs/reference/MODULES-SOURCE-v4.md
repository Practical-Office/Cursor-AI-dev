# MODULES-SOURCE v4 — Cursor-AI-dev

**Version:** 4.0 | **Updated:** 2026-09-10  
**Audience:** Competent software engineers with basic Cursor experience  
**Tone:** Direct. Process-first. Zero cheerleading.  
**Source of truth:** `CURSOR-MATT-SKILLS-PROCESS.md` — modules lag it.  
**Published HTML:** `docs/*.html` — learner surface. This file is instructional density for regeneration and review.

**Preferred chain (non-negotiable):**

```
/setup-matt-pocock-skills  (once per repo — hard gate)
→ route (/wayfinder | /grill-with-docs)
→ /to-spec                 (synthesis only; three mandatory sections)
→ /to-tickets              (tracer-bullet vertical slices; slice test)
→ pre-Build review         (ticket + plan; ≥2 concrete findings)
→ /implement               (Red→Green only at seams; CI-matching commands)
    └─ auto /code-review   (model-invoked; Standards ‖ Spec)
→ must-fix committed same day
```

**Tracker skill (separate from routing):** `/triage` moves existing issues through the label state machine defined at setup.

**Glossary:** `docs/glossary.html` — domain language for learners. Canonical terms in repo-root `CONTEXT.md`.

**Teacher Manual:** Instructor Textbook v4 (`docs/instructor-textbook.html`) + `WORKSHOP-AGENDA.md`. Learner HTML is the student surface; textbook is enforcement.

**Facilitator ban:** Do not teach this cohort from `Practical-Office/cursor-skills` AI-Development-SOP if it contradicts the living process (e.g. `/to-issues`, refactor-in-loop `/tdd`).

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
Make the cost of undisciplined AI usage visible. Install taxonomy. Drill **route before grill** until automatic. Practice one worked example of each Three Pillar.

Day 2 publishes a three-section spec — it does not re-drill routing. Nail routing here.

### Why for a new Dev
Most new Cursor users treat the agent as autocomplete. Accept → ship → discover mess later. Cost is rework hours and review cycles, not first-draft speed. This module makes the cost visible on a real ticket.

### Hard truth
Grilling without all Three Pillars is theater. Verbal "share what changed" does not count — committed `CONTEXT.md` / ADR is the deliverable.

### Core concepts that must land

**Cursor surfaces**
- Chat = thinking / Q&A. Not building surface.
- Composer / Agent = multi-file building, terminal, primary surface for code changes.
- Rules = always-on static context (short, specific, point at examples).
- Skills = on-demand workflows; cost context only when invoked.

**Skill taxonomy (architecture)**
- **User-invoked** (you type): ask-matt, grill-with-docs, wayfinder, triage, improve-codebase-architecture, setup-matt-pocock-skills, to-spec, to-tickets, implement
- **Model-invoked** (agent reaches; not typed as normal flow step): prototype, diagnosing-bugs, research, tdd, domain-modeling, codebase-design, code-review, resolving-merge-conflicts

**Worked example — user-invoked vs model-invoked:** Student types `/implement` on a tracer-bullet ticket (user-invoked). Agent reaches `/tdd` for Red→Green, then auto-invokes `/code-review` (model-invoked). Do **not** type `/code-review` as a separate chain step.

Typing `/code-review` or `/domain-modeling` as primary flow = architecture misunderstanding. `/implement` reaches `/code-review`. `/grill-with-docs` reaches `/domain-modeling`.

**Route before grill** (not the same as `/triage` tracker skill)

| Situation | Typed skill |
|-----------|-------------|
| **Foggy** — underspecified or >1 session; weak-context (cannot name correct `@` files yet) | `/wayfinder` |
| **Scoped + codebase** — properly primed with minimal correct `@` attach | `/grill-with-docs` |
| No codebase yet | Prime, then `/grill-with-docs` once code exists |

Never default every item into `/grill-with-docs`.

**`/triage` — tracker intake (separate)**  
User-invoked tracker skill that moves existing issues through the label state machine defined at Setup. Use when issues need role movement — not as substitute for route-before-grill on new work.

**Three Pillars** (grilling engine properties — one worked example each on Day 1)
1. Context Engineering — correct `@` files/folders first. Wrong context → confident wrong answers.
2. Assumption Destruction — force assumptions open; attack them. Facts = look up yourself; decisions = grill.
3. Stress Testing — failure modes, scale, future regret, removal test.

### Live demo (instructor)
1. Real small backlog item.
2. Path A: Agent, accept most suggestions, "ship".
3. Path B: weak grill (few questions, no pillars, no CONTEXT update).
4. Path C: full three-pillar `/grill-with-docs` with correct `@` priming.
5. Side-by-side: questions, assumptions destroyed, residual risk, plan clarity, durable artifact?

Students state the difference in one sentence each.

### Practice (pairs)
Two real backlog items each. Write one-sentence **routing** decision (not just "triage"). Run correct user-invoked skill.  
**Deliverable (binary):** committed CONTEXT.md entry or ADR stub per item. Verbal share does not count. No artifact → no credit.

### Success criteria (binary)
- [ ] Setup gate still holds — student can point at tracker, labels, domain-doc path files from Setup
- [ ] ≥1 committed CONTEXT.md / ADR from real item
- [ ] Correct routing of new item without prompting (one-sentence reason recorded)
- [ ] User-invoked vs model-invoked stated with examples (e.g. /implement → auto /code-review)

### Stop / Start
- Stop defaulting everything to `/grill-with-docs`. Start route before grill with written one-sentence reason.
- Stop treating chat recap as the graded record. Start requiring committed CONTEXT.md / ADR before credit.

### Instructor enforcement
Kill pairs still "just chatting." Force the artifact. If they cannot name the pillar used, the grill failed.

---

## MODULE 2 — Advanced Grilling + Specification (Day 2)

### Concept — Context Engineering (insert before skill drills)

**What context is:** rules, skills, `@` files, chat history, tool results. Costs tokens.

- **Too little** → confident fiction
- **Too much** → dilution
- **Sweet spot** → minimal correct `@` attach

**When to compact vs start fresh:** Keep grill → spec in one unbroken window. Do not compact until after tickets. Clear context between implementation tickets.

**Quick cue — @ attach quality**
- [ ] Empty `@` — agent guesses (fail)
- [ ] Kitchen-sink `@` — diluted attention (fail)
- [ ] Minimal correct `@` — properly primed (pass)

### Goal
Publish a three-section, implementable specification via synthesis only. Routing was Day 1 — today's focus is spec quality.

### Why
Polished ticket never grilled = fiction. `/to-spec` synthesizes; it does not think. Skipping the grill produces specs that look complete and fail under implementation.

### Hard truth
`/to-spec` does **not** interview. Missing any of acceptance criteria, non-goals, or residual risks → reject on the spot.

### Concept — Structures & fences (insert before skill drills)

| Fence | Failure mode it blocks |
|-------|------------------------|
| Rules vs Skills | Bloated always-on context drowning the task |
| Human gates | Typing model-invoked skills as primary steps |
| Binary reject rules | "Good enough" specs that fail in implement |
| Vertical slices = one context window | Multi-session tickets and context pollution |

### Core concepts
- `/to-spec` publishes a clean spec from the conversation that already happened.
- **Three mandatory sections** (any missing → reject): acceptance criteria (verifiable), non-goals, residual risks.
- Keep grill + spec in one unbroken window. Do not compact until after tickets. Implementation starts fresh later.
- **Weak-context** `/to-spec` (empty or wrong `@`) produces soft output. **Properly primed** `/to-spec` produces implementable specs.

### Worked example — bad vs good spec

**Bad (reject)**
- Acceptance: "User can manage notifications."
- Non-goals: (missing)
- Residual risks: "Might be slow."
Fails: vague acceptance, no non-goals, unverifiable risk.

**Good (pass)**
- Acceptance: "Given a logged-in user on Settings, toggling email digest off persists after refresh; audit log records the change."
- Non-goals: Push notifications, SMS, admin bulk-edit.
- Residual risks: Email provider rate limits may delay digest send — monitor queue depth; no retry UI in this slice.

### Live demo
Same grilled conversation → weak-context `/to-spec` (soft output) vs properly primed `/to-spec` (implementable). Critique section by section.

### Practice
Route (if needed) → full three-pillar grill → `/to-spec`.

**Group review:** Every spec reviewed by peers (or instructor). Reviewer = another pair or rotating reviewer — not the author. Any missing or vague mandatory section → sent back immediately; no partial credit.

### Success criteria (binary)
- [ ] Every published spec has all three mandatory sections (inspected)
- [ ] ≥1 item correctly routed with written reasoning (Day 1 skill — spot-check only)
- [ ] Instructor spot-checked underlying grill transcript for ≥1 spec per student

### Stop / Start
- Stop forcing foggy/oversized items through single-session grill. Start `/wayfinder` first.
- Stop accepting incomplete specs. Start rejecting on the spot in group review.

---

## MODULE 3 — Tickets + Implementation (Day 3)

### Concept — TDD why (insert before implement drills)

Classical TDD is red → green → **refactor**. This course locks **Red→Green only** inside `/implement`:

- **Red** proves the seam/contract — failing test at the boundary about to change
- **Green** proves minimal behavior — smallest code to pass
- **Refactor belongs in `/code-review`** — implementing agent self-approving refactor pollutes context and skips second pair of eyes

**Seams / characterizing tests:** Tests at module boundaries (API, service interface, UI hook). Characterizing tests capture current behavior before change.

Contrast classical red-green-refactor once, then lock Red→Green-only for all course work.

### Goal
Convert 3-section spec into tracer-bullet tickets that pass the **slice test**. Implement Red→Green only. Local verification matches real CI commands.

### Why
Good spec never sliced → large unreviewable diffs and context pollution. Horizontal slicing ("all schema first") is the most common failure. "Just implement the whole spec" produces balls of mud.

### Hard truth
**Slice test:** fail if missing one-sentence user-observable behavior **or** missing/circular blockers. Re-slice immediately. No negotiation. Reserve *kill test* for BML experiments.

### Core concepts
- **Tracer-bullet tickets:** vertical slices, end-to-end observable behavior, declare blockers, sized for one agent session.
- **Slice test:** one-sentence user-observable behavior + recorded blockers. Fail either → re-slice.
- **Refactor:** improving structure without changing behavior. Happens in `/code-review` — not inside `/implement` loop.
- **`/implement`:** Red→Green only at seams. Runs **CI-equivalent commands** (same checks as PR pipeline). Auto-invokes `/code-review`. Context cleared between tickets.
- **CI = pipeline green:** "Agent said tests passed" ≠ done. Run the same commands your PR runs.

### Live demo
Same small ticket: "just build it" vs full `/implement` (Red→Green + CI + auto review). Compare diff, coverage, findings, residual risk.

### Practice
Convert Day 2 spec → tickets. Pair-review applies **slice test** to every ticket; failures re-sliced on the spot. One ticket through `/implement`. Confirm Red→Green only, CI green, review auto-fired.

### Success criteria (binary)
- [ ] Zero circular blockers; zero tickets failing slice test
- [ ] ≥1 `/implement` diff is Red→Green only (no in-loop refactor)
- [ ] Student ran CI-equivalent commands locally and can show pipeline-green evidence

### Stop / Start
- Stop teaching red-green-**refactor** inside implement. Start Red→Green only; refactor in `/code-review`.
- Stop subjective sizing. Start slice test on every ticket.
- Stop trusting "tests passed" in chat. Start running the same commands CI runs.

---

## MODULE 4 — Debugging, Review, Architecture, Prototype (Day 4)

### Goal
Repeatable model-invoked disciplines for cleaning AI mess and settling design questions that cannot be answered on paper.

### Why
AI creates mess at speed. Without systematic diagnosis, dual-axis review, and throwaway prototyping, teams ship the mess or invent ad-hoc cleanup every time.

### Practice gate
Every must-fix has a committed diff before day end. A review with zero fixes is a failed exercise. Prototypes are throwaway — never harden in place, never merge to default branch.

### Core concepts
- **`/diagnosing-bugs`:** reproduce → minimise → hypothesise → instrument → fix → regression-test. State hypothesis + next smallest experiment **before** changing code. Model-invoked.
- **Dual-axis `/code-review`:** two parallel inspections —
  - **Standards** — repo conventions and concrete code-quality patterns (duplication, unclear naming, scattered change, etc.). Name the pattern explicitly.
  - **Spec** — does the diff match the originating ticket? ("no spec available" if none).
  Must-fix findings require committed diff before leaving.
- **Pre-Build review:** Before `/implement`, separate agent review of ticket + plan. Record ≥2 concrete findings (gaps, risks, missing seams).
- **`/improve-codebase-architecture`:** HTML report of deepenings → skill grills the selected opportunity. Reject large-rewrite proposals.
- **`/prototype`:** throwaway answer to **one** design question on **throwaway branch or folder**.
  - Logic/state feel right? → LOGIC terminal app (print full state).
  - What should it look like? → UI variants on one route + floating toggle bar.
  - Rules: marked throwaway, next to real code, one command to run, no persistence default, no polish, capture verdict, **never merge to default branch**.

### Practice
Every must-fix committed before day end. ≥1 prototype on throwaway branch/folder, removed from default branch, verdict recorded. Pre-Build review on at least one ticket before implement.

### Success criteria (binary)
- [ ] Diagnosing loop; hypothesis before each fix
- [ ] Review names ≥2 concrete code-quality patterns + spec-axis findings
- [ ] Every must-fix committed before leaving
- [ ] One prototype: throwaway branch/folder, verdict recorded, not on default branch

### Stop / Start
- Stop leaving findings unacted. Start requiring committed fixes before close.
- Stop settling "does this feel right?" during implement. Start `/prototype` first.
- Stop merging prototype branches. Start capturing verdict and deleting throwaway work.

---

## MODULE 5 — Full Workflow + Reality Check (Day 5)

### Goal
Process survives real deadline pressure. Leave with `/ask-matt` decision logs, not a hand-built framework that duplicates the skill.

### Why
Process practiced only under low pressure is not learned. Day 5 = execution + artifact inspection. No new theory.

### Practice-gate rules
- Zero new theoretical content.
- Instructor = enforcement only (force pillars, reject tickets failing slice test, stop context pollution).
- Real open work only.
- Every must-fix committed before session end.
- Pre-Build review recorded when implement starts.

### Executed chain
```
/setup-matt-pocock-skills  (once — hard gate)
→ route (/wayfinder | /grill-with-docs)
→ /to-spec  (synthesis; 3 sections)
→ /to-tickets  (slice test)
→ pre-Build review  (ticket + plan; ≥2 findings)
→ /implement  (Red→Green + CI-equivalent green)
    └─ auto /code-review  (model-invoked; Standards ‖ Spec)
→ must-fix committed
```
`/code-review` is nested under `/implement` — not a separate typed chain step.

### Group reviews
Diffs + dual-axis output. What would ship? Residual risk explicit. Code-quality patterns named on Standards axis.

### `/ask-matt` decision log
Three real scenarios from student's week → skill routing decision → one sentence agreement/disagreement each.

**Sentence template:** "For [situation], I routed to `/skill-name` because [one-sentence reason]. The skill agreed / I deviated because [one sentence]."

Deliverable: three transcripts + three sentences. Not freeform prose.

### Day 1 → 5 evidence artifact types
| Day | Artifact type |
|-----|---------------|
| Setup | Inspectable setup output (tracker, labels, domain-doc path) |
| 1 | Committed CONTEXT.md / ADR + routing decision |
| 2 | Three-section spec (all sections complete) |
| 3 | Slice-test ticket graph + Red→Green implement diff + CI evidence |
| 4 | Dual-axis review + committed must-fix + prototype verdict (if used) |
| 5 | Full chain on real work + three `/ask-matt` logs |

### Week success criteria (binary, inspected)
- [ ] One complete end-to-end cycle with full artifact trail
- [ ] Three `/ask-matt` transcripts + agreement/deviation sentences
- [ ] Instructor has direct evidence of quality improvement Day 1 → Day 5

### Stop / Start
- Stop hand-building personal frameworks. Start from `/ask-matt` transcripts.
- Stop new theory on Day 5. Start grounding discussion only in today's artifacts.

---

## GLOSSARY (learner surface: docs/glossary.html)

Key terms: route before grill, `/triage` tracker skill, foggy/weak-context, properly primed, user-invoked, model-invoked, three-section spec, tracer-bullet ticket, slice test, group review, Red→Green only, refactor, CI, dual-axis review, pre-Build review, must-fix, evidence artifact, `/prototype`, kill test (BML only).

---

## CERTIFICATION (evidence pack)

Within 5 business days, submit on **real shipping work**:

1. Proof of `/setup-matt-pocock-skills` completion
2. Routing decision + transcript (route before grill — not conflated with `/triage` tracker)
3. Published 3-section spec
4. Ticket graph passing slice test
5. ≥1 Red→Green `/implement` diff + CI-green evidence (same commands as PR pipeline)
6. Dual-axis review naming ≥2 concrete code-quality patterns + committed must-fixes
7. Three `/ask-matt` transcripts + agreement/deviation sentences
8. (If used) `/prototype` throwaway branch/folder + verdict (not on default branch)

Missing any required artifact → fail. No partial credit. Measure only real experiments.

---

## HTML conversion notes
- Preserve every binary checklist and stop/start.
- Concept blocks (Context Engineering, Structures & fences, TDD why) appear **before** skill drills — do not replace drills.
- Keep failure-mode tables and bad-vs-good spec compare.
- Link skill names to living process or skills hub.
- Link glossary from hub and every module footer.
- Do not soften language. Do not add motivational framing.
- Do not use person names in course artifacts.
- Learner pages: no Fowler smell names; instructor textbook may retain enforcement detail.
