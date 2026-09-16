# Cursor + Matt Pocock Skills — Living Process

**Version:** 1.1  
**Last Updated:** September 16, 2026  
**Owner:** Practical AI Engineering  
**Purpose:** Single source of truth for the preferred skill chain, taxonomy, and non-negotiable rules when using Cursor + mattpocock/skills.

The Published Course (Five-Day Modules) must stay aligned with this document.  
Course modules lag this process. Never lead it.

**Skills source:** https://github.com/mattpocock/skills  

**Glossary / domain language:** CONTEXT.md (per repo). Use exact terms from the skills repo.

---

## 1. Goals

- Raise engineering signal: fewer rework cycles, clearer domain models, verifiable tickets.
- Make every non-trivial change skills-driven.
- Keep the agent inside the reliable context zone.
- Enforce TDD (Red→Green only) and dual-axis code review on every Bug and non-trivial Update/BML.
- Protect team time: cut any step that does not demonstrably reduce rework.

---

## 2. Skill Taxonomy (non-negotiable)

**User-invoked** (typed by the human; `disable-model-invocation: true`):

- `/ask-matt`
- `/grill-with-docs`
- `/wayfinder`
- `/triage`
- `/improve-codebase-architecture`
- `/setup-matt-pocock-skills`
- `/to-spec`
- `/to-tickets`
- `/implement`

**Model-invoked** (reached by the agent or by an orchestrator; never typed as a normal flow step):

- `/prototype`
- `/diagnosing-bugs`
- `/research`
- `/tdd`
- `/domain-modeling`
- `/codebase-design`
- `/code-review`
- `/resolving-merge-conflicts`

Students who type `/domain-modeling` or `/code-review` as a primary flow step have misunderstood the architecture.  
`/grill-with-docs` reaches `/domain-modeling`.  
`/implement` reaches `/tdd` and `/code-review`.

---

## 3. Preferred Chain (main build flow)

```
SETUP (once per repo — hard gate)
  /setup-matt-pocock-skills
  /setup-pre-commit          (local gates must match CI)

ROUTE BEFORE GRILL (typed — not the /triage skill)
  Foggy / >1 session?          → /wayfinder
  Scoped + codebase exists?    → /grill-with-docs
                                 (reaches model-invoked /domain-modeling)
  No codebase yet?             → route via /wayfinder or scaffold minimal repo;
                                 attach minimal correct @ when code exists → /grill-with-docs

TRACKER INTAKE (when work is already an issue/PR)
  /triage                      — categorize, state, verify, brief; may grill inside

MAIN BUILD
  1. (routed grilling skill)
  2. /to-spec          — synthesis only; three mandatory sections; never an interview
  3. /to-tickets        — tracer-bullet vertical slices + recorded blockers; slice test
  4. pre-Build review   — separate agent review of ticket + plan; ≥2 concrete findings
                          (gaps, risks, missing seams) before code is written
  5. /implement         — Red → Green only at seams; runs project CI-equivalent commands;
                          auto-invokes /code-review at closeout
                          (refactor is a code-review output, never inside the loop)
  6. /code-review       — dual-axis (Standards ‖ Spec) — model-invoked

SUPPORTING (model-invoked or opportunistic)
  /prototype            — throwaway answer to one design question (LOGIC or UI branch)
  /diagnosing-bugs
  /tdd
  /domain-modeling
  /codebase-design
  /resolving-merge-conflicts
  /research

ROUTER
  /ask-matt — when unsure which typed skill fits; log the decision
```

---

## 4. Non-Negotiable Rules

1. **Route before grill.** Never default every item into `/grill-with-docs`. The route gate is not the same as typing `/triage`.
2. **Three Pillars** are properties of the underlying grilling engine: Context Engineering, Assumption Destruction, Stress Testing. Grilling without all three is theater.
3. **`/to-spec` is synthesis only.** A spec missing acceptance criteria, non-goals, or residual risks fails review.
4. **Vertical tracer-bullet tickets only.** Slice test: one-sentence user-observable behavior + recorded blockers. Fail either → re-slice immediately. Not BML kill criteria.
5. **Pre-Build review before `/implement`.** Separate agent review of ticket + plan. Record ≥2 concrete findings. Surfaces gaps before code is written.
6. **Red → Green only inside `/implement`.** Refactor belongs to `/code-review`.
7. **Local verification matches CI.** Before any commit is considered complete, the project’s real CI-equivalent commands must be green.
8. **Dual-axis review findings are acted on the same day.** Must-fix items require a committed fix.
9. **`/prototype` for design questions that cannot be settled on paper.** Throwaway from day one; capture verdict; never harden into production code inside the prototype.
10. **CONTEXT.md + ADRs are mandatory.** Vague language is rejected.
11. **Measure only real experiments.** No fake Measure/Learn. No self-reported confidence as a success metric.

---

## 5. Three Pillars (grilling engine)

1. **Context Engineering** — Prime with the correct `@` files/folders before the grill starts.
2. **Assumption Destruction** — Force every assumption into the open, then attack it. Distinguish facts (look up yourself) from decisions (grill them).
3. **Stress Testing** — Failure modes, scale, future regret, removal test.

---

## 6. Ticket Slice Test

Formerly “binary kill test.” Not BML experiment kill criteria.

A ticket fails and must be re-sliced if:

- It cannot state, in one sentence, a user-observable behavior change, **or**
- Its blocking edges are missing or circular.

---

## 7. Spec Mandatory Sections

Every published `/to-spec` output must contain:

1. Acceptance criteria (verifiable)
2. Non-goals
3. Residual risks

Missing any section → reject on the spot.

---

## 8. Updating This Document

This is a living document.  
Propose improvements via a ticket on the course repo using the same process.  
Course modules must be updated when process wording here changes.

**Approval:** Team lead + engineering manager.
