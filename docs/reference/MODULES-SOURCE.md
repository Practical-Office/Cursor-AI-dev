# Module Source Content — Cursor + Matt Pocock Skills Course

This file is the source for the five HTML modules + setup.  
Convert to the same HTML pattern used in bug-handling-sop (module-N.html, setup.html, index.html).  
Tone: direct, process-first, zero fluff, zero cheerleading. Audience = competent engineers.

---

## SETUP (setup.html) — hard gate, ~20–30 min

**Goal:** Skills installed and `/setup-matt-pocock-skills` verified in every student’s own repo before any engineering skill is used.

### Steps
1. Confirm Cursor is the primary surface (Composer / Agent mode preferred for building).
2. Run:
   ```
   npx skills@latest add mattpocock/skills
   ```
3. Select the official engineering skills and `/setup-matt-pocock-skills`.
4. In the student’s real working repo, run `/setup-matt-pocock-skills`.
5. Verify output: issue tracker connection, triage labels, domain-doc layout visible.
6. (Recommended) Run `/setup-pre-commit` so local gates match CI.

**Gate:** No student proceeds to Module 1 until the setup output exists in their repo. This is graded, not demoed.

**Success:** Setup artifact present and inspected.

---

## MODULE 1 — Reality Check & Core Setup (Day 1)

**Goal:** Make the cost of undisciplined AI usage visible. Install taxonomy. Drill triage-before-grill.

### Teaching points (must land)
- First-draft speed is not scored. Rework count and review cycles are.
- Composer / Agent is the building surface. Chat is for thinking.
- Rules = always-on static context. Skills = on-demand, cost context only when invoked.
- User-invoked vs model-invoked is architecture, not trivia.
- Triage table:
  - Foggy / multi-session → `/wayfinder`
  - Scoped + codebase → `/grill-with-docs` (reaches `/domain-modeling`)
  - No codebase → light priming, then `/grill-with-docs` once code exists
- Three Pillars are properties of the grilling engine, not exclusive to one skill.
- Verbal “share what changed” is theater. Committed CONTEXT.md / ADR artifact is the deliverable.

### Live demo
Identical small task: raw accept-everything vs weak grill vs full three-pillar `/grill-with-docs`. Side-by-side: questions, assumptions destroyed, residual risk, clarity.

### Practice
Pairs take two real backlog items. Triage first (write the one-sentence reasoning). Run the correct user-invoked skill. Deliverable: committed CONTEXT.md entry or ADR stub. No artifact → no credit.

### Success criteria (binary)
- `/setup-matt-pocock-skills` output verified.
- At least one committed CONTEXT.md / ADR from a real item.
- Correct triage of a new item without prompting.
- User-invoked vs model-invoked stated correctly with examples.

### Stop / Start
- Stop defaulting every item into `/grill-with-docs`.
- Start triage first.
- Stop accepting verbal share. Start requiring committed artifact.

---

## MODULE 2 — Advanced Grilling + Specification (Day 2)

**Goal:** Make triage-then-grill the default reflex. Produce a 3-section, implementable specification via synthesis only.

### Teaching points
- `/to-spec` does **not** interview. It synthesizes the conversation that already happened.
- Mandatory sections: acceptance criteria (verifiable), non-goals, residual risks. Missing any → reject on the spot.
- Keep the grill + spec conversation in one unbroken window. Do not compact until after tickets.
- Context Engineering is not optional; the student must prime `@` files/folders themselves.

### Live demo
Same grilled conversation → weak-context `/to-spec` vs properly primed `/to-spec`. Critique section by section.

### Practice
Every student/pair: triage → full three-pillar grill → `/to-spec`. Group review of every spec against the three mandatory sections. Incomplete specs rejected in the room.

### Success criteria (binary)
- Every published spec has all three mandatory sections (inspected).
- At least one item correctly triaged to `/wayfinder` or `/grill-with-docs` with written reasoning.
- Instructor has spot-checked the underlying grill transcript behind at least one spec per student.

### Stop / Start
- Stop forcing oversized items through single-session grilling.
- Start triaging to `/wayfinder` first for fog/scale.
- Stop accepting incomplete specs.

---

## MODULE 3 — Breaking Work Down + Implementation (Day 3)

**Goal:** Convert specs into tracer-bullet tickets that pass the binary kill test. Implement with Red→Green only. Local verification matches CI.

### Teaching points
- Vertical slices that deliver end-to-end observable behavior. Horizontal layers are rejected on sight.
- Binary kill test: one-sentence user-observable behavior + recorded blockers (native links or explicit text edges). Fail either → re-slice immediately.
- `/implement` drives Red→Green at pre-agreed seams only. Refactor is a `/code-review` output.
- Before any commit is complete, the project’s real CI-equivalent commands must be green.
- Context is cleared between tickets. Each `/implement` starts fresh.

### Live demo
Same small ticket: “just build it” vs full `/implement` path (Red→Green + auto review). Side-by-side diff, coverage, residual risk.

### Practice
Convert a Day 2 spec into tickets. Pair-review applies the binary kill test to every ticket. Take one ticket through `/implement`. Confirm Red→Green commits and that CI-matching commands were run.

### Success criteria (binary)
- Ticket graph has zero circular blockers and zero tickets failing the one-sentence test.
- At least one `/implement` diff shows Red→Green only (no in-loop refactor).
- Students can state why refactor moved to code review.

### Stop / Start
- Stop teaching red-green-**refactor** inside implement.
- Start Red→Green only; refactor in review.
- Stop subjective ticket sizing. Start the binary kill test.

---

## MODULE 4 — Debugging, Review, Architecture, Prototype (Day 4)

**Goal:** Give repeatable, model-invoked disciplines for cleaning AI-generated mess and settling design questions that cannot be answered on paper.

### Teaching points
- `/diagnosing-bugs` loop: reproduce → minimise → hypothesise → instrument → fix → regression-test. State the current hypothesis and next smallest experiment before changing code.
- Dual-axis `/code-review`: Standards (repo conventions + explicit Fowler smells) ‖ Spec. Parallel sub-agents. Must-fix findings committed the same day.
- `/improve-codebase-architecture`: visual HTML report, then the skill itself grills the selected opportunity. Reject large-rewrite proposals.
- `/prototype`: throwaway code that answers one design question. Two exclusive branches (LOGIC terminal app / UI toggleable variants). Locate next to real code, mark as prototype, one command to run, no persistence by default, capture verdict on a throwaway branch, never harden into production.

### Practice gate
Every must-fix finding from today’s reviews has a corresponding committed diff before 17:00. A review with zero fixes is a failed exercise.

### Success criteria (binary)
- Diagnosing loop runnable with hypothesis stated before each fix attempt.
- Dual-axis review names at least two Fowler smells by name.
- Every must-fix has a committed fix.
- One prototype produced on the correct branch, removed from main tree, verdict recorded.

### Stop / Start
- Stop leaving review findings unacted.
- Start requiring committed fixes before day close.
- Stop settling “does this feel right?” questions during implement. Start routing them to `/prototype`.

---

## MODULE 5 — Full Workflow + Reality Check (Day 5)

**Goal:** Make the process survive real deadline pressure. Leave with `/ask-matt` decision logs, not hand-built frameworks.

### Teaching points
- No new theoretical content. Execution + artifact inspection only.
- Instructor role is enforcement: force missing pillars, kill oversized tickets, stop context pollution.
- `/ask-matt` is the router. Run it against three real scenarios from the student’s own week; log the routing decision; write one sentence of agreement or disagreement per scenario.

### Practice
Full end-to-end on real open work: triage → grill → `/to-spec` (if multi-session) → `/to-tickets` → `/implement` (context cleared, Red→Green, CI commands) → `/code-review` (auto). Group reviews with named smells and explicit residual risk. `/ask-matt` decision log.

### Success criteria (binary)
- One complete, artifact-inspectable end-to-end cycle per student.
- Three `/ask-matt` transcripts + written agreement/deviation sentences.
- Instructor has direct evidence (not self-report) of quality improvement from Day 1 to Day 5.

### Stop / Start
- Stop hand-building “personal decision frameworks.”
- Start from `/ask-matt` transcripts.
- Stop inserting new theory into the Day 5 reality-check block.

---

## Certification Homework (certification.html)

Within 5 business days of course completion, submit the full artifact trail on real shipping work:

1. Proof of `/setup-matt-pocock-skills` completion.
2. Triage decision record + transcript.
3. Published 3-section spec.
4. Ticket graph passing the binary kill test.
5. At least one `/implement` Red→Green diff + CI-matching verification evidence.
6. Dual-axis `/code-review` transcript naming ≥2 Fowler smells + committed must-fix fixes.
7. Three `/ask-matt` transcripts with agreement/deviation sentences.
8. (If used) `/prototype` throwaway branch + recorded verdict.

Missing any required artifact → fail. No partial credit. Measure only real experiments.
