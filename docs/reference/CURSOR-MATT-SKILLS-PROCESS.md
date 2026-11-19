# Cursor + Matt Pocock Skills — Living Process

**Version:** 1.2  
**Last Updated:** October 28, 2026  
**Skills pin:** [mattpocock/skills](https://github.com/mattpocock/skills) **v1.3.x** (verified release **1.3.1** on 2026-10-28, from that repo’s CHANGELOG and README)  
**Owner:** Practical AI Engineering  
**Purpose:** Single source of truth for the preferred skill chain, taxonomy, and non-negotiable rules when using Cursor + mattpocock/skills.

The Published Course (Five-Day Modules) must stay aligned with this document.  
Course modules lag this process. Never lead it.

**Skills source:** https://github.com/mattpocock/skills  

**Glossary / domain language:** `GLOSSARY.md` per repo (or `GLOSSARY-MAP.md` when the repo indexes more than one glossary). Use exact terms from the skills repo. Learner wording for this course also lives in repo-root `GLOSSARY.md` and `docs/glossary.html`.

---

## 1. Goals

- Raise engineering signal: fewer rework cycles, clearer domain models, verifiable tickets.
- Make every non-trivial change skills-driven.
- Keep the agent inside the reliable context zone.
- Enforce TDD (Red→Green only) and dual-axis code review on every Bug and non-trivial Update/BML.
- Protect team time: cut any step that does not demonstrably reduce rework.

---

## 2. Skill Taxonomy (non-negotiable)

Install with `npx skills@latest add mattpocock/skills -a cursor`. When the installer asks which skills to take, include `setup-matt-pocock-skills` and the engineering set below. Re-run `npx skills@latest update`, then `add` again, to pick up skills added after the last install.

**User-invoked** (typed by the human; model invocation disabled). Engineering:

- `/ask-matt`
- `/grill-with-docs`
- `/wayfinder`
- `/triage`
- `/improve-codebase-architecture`
- `/setup-matt-pocock-skills`
- `/to-spec`
- `/to-tickets`
- `/implement`
- `/implement-spec`
- `/retro`

**Model-invoked** (reached by the agent or by an orchestrator; not a normal typed flow step). Engineering:

- `/prototype`
- `/diagnosing-bugs`
- `/research`
- `/tdd`
- `/domain-modeling`
- `/codebase-design`
- `/code-review`
- `/pr`
- `/wizard`

**Productivity** (not on the build chain). User-invoked:

- `/wait-what` — re-pitch the message that did not land, using `GLOSSARY.md`
- `/to-questionnaire` — a decision you cannot answer alone, as a questionnaire for the person who can (the interview is about the send, not the subject)

Students who type `/domain-modeling`, `/code-review`, `/tdd`, `/pr`, or `/prototype` as a primary flow step have misunderstood the architecture.  
`/grill-with-docs` reaches `/domain-modeling`.  
`/implement` reaches `/tdd` and `/code-review`.  
`/implement-spec` reaches `/tdd` inside each implementer and `/code-review` at closeout.  
`/pr` is the shape of a pull request body when one is written. It is not a typed chain step.

In-progress merge or rebase conflicts are worked by the agent directly. There is no dedicated skill for them.

---

## 3. Preferred Chain (main build flow)

```
SETUP (once per repo — hard gate)
  /setup-matt-pocock-skills
  Local verification later must match CI (rule 7). There is no setup skill in v1.3.x for pre-commit hooks.

ROUTE BEFORE GRILL (typed — not the /triage skill)
  Foggy / >1 session?          → /wayfinder
  Scoped + codebase exists?    → /grill-with-docs
                                 (reaches model-invoked /domain-modeling)
  No codebase yet?             → route via /wayfinder or scaffold minimal repo;
                                 attach minimal correct @ when code exists → /grill-with-docs

TRACKER INTAKE (when work is already an issue or pull request)
  /triage                      — categorize, state, verify, brief; may grill inside

MAIN BUILD
  1. (routed grilling skill)
  2. /to-spec          — synthesis only; three mandatory sections; never an interview
  3. /to-tickets        — tracer-bullet vertical slices + recorded blockers; slice test
  4. pre-Build review   — separate agent review of ticket + plan; ≥2 concrete findings
                          (gaps, risks, missing seams) before code is written
  5. /implement         — default path. One ticket. Red → Green only at seams;
                          runs project CI-equivalent commands;
                          auto-invokes /code-review at closeout
                          (dual-axis Standards ‖ Spec — model-invoked, not typed;
                           refactor is a code-review output, never inside the loop)
     OR /implement-spec — alternate path when the spec should land as one integration
                          branch. Task graph; implementer subagents on the ready
                          frontier; each uses /tdd; closeout /code-review.
                          Goal is the integration branch, not a pull request.
                          Not the Day 3 exercise.
  6. must-fix committed the same day
  7. /retro             — user-invoked close. Suggestions for the agent’s environment
                          (navigation, checks, standards, steering, tooling), most
                          severe first. Not product code. Not an Evidence Pack item.

SUPPORTING (model-invoked or opportunistic)
  /prototype            — one design question. Logic/state → single shareable HTML file.
                          UI → variations on one route. Keep on a prototype/… branch.
  /diagnosing-bugs
  /tdd
  /domain-modeling
  /codebase-design
  /pr                   — pull request body: smallest visual summary, before/after
                          evidence, merge-danger call (one-way or two-way door + blast radius)
  /wizard               — interactive script for steps only a human can perform
  /research

ROUTER
  /ask-matt — when unsure which typed skill fits; log the decision
```

The spine stays: setup → route → spec → tickets → pre-Build review → implement → must-fix. `/implement-spec` is the alternate at step 5. `/retro` closes a real session. Neither replaces the spine and neither adds a certification artifact.

---

## 4. Non-Negotiable Rules

1. **Route before grill.** Never default every item into `/grill-with-docs`. The route gate is not the same as typing `/triage`.
2. **Three Pillars** are properties of the underlying grilling engine: Context Engineering, Assumption Destruction, Stress Testing. Grilling without all three is theater.
3. **`/to-spec` is synthesis only.** A spec missing acceptance criteria, non-goals, or residual risks fails review.
4. **Vertical tracer-bullet tickets only.** Slice test: one-sentence user-observable behavior + recorded blockers. Fail either → re-slice immediately. Not BML kill criteria.
5. **Pre-Build review before implementation.** Separate agent review of ticket + plan. Record ≥2 concrete findings. Surfaces gaps before code is written. Applies before `/implement` and before `/implement-spec`.
6. **Red → Green only inside implementation.** Refactor belongs to `/code-review`.
7. **Local verification matches CI.** Before any commit is considered complete, the project’s real CI-equivalent commands must be green.
8. **Dual-axis review findings are acted on the same day.** Must-fix items require a committed fix.
9. **`/prototype` for design questions that cannot be settled on paper.** One question. Logic or state → a single shareable HTML file (plain HTML/CSS/JS, no build). UI → several variations on one route. Throwaway from day one and clearly marked. When answered: fold the validated decision into real code; commit the prototype on a `prototype/…` branch that is not the default branch; leave a pointer on the implementation issue; record the verdict and the question. Do not merge that branch. Do not delete it. Do not harden the prototype shell into production code.
10. **`GLOSSARY.md` + ADRs are mandatory.** Vague language is rejected. Skills read `GLOSSARY.md` (or the file `GLOSSARY-MAP.md` points at). They do not read a differently named glossary.
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

## 8. Evidence Pack (certification)

Exactly **eight required** binary artifacts on real shipping work. **Artifact 8** is the throwaway `/prototype` branch (`prototype/…`, not on the default branch) plus the recorded verdict — **required, not optional**.

- **Non-waivable** on full and intensive schedules. Agenda completion does not waive artifact 8. No lead-waiver path.
- **Self-attest is not approval.** A lead must still review the pack.
- **Policy master:** this document. `MODULES-SOURCE-v4.md` and published HTML **mirror** the process; they never lead it.
- **`/retro` is not a ninth artifact.** Run it after a real session. Do not block certification on it.
- **`/implement-spec` does not replace artifact 5.** Artifact 5 is still ≥1 Red→Green implement diff (from `/implement` or from an `/implement-spec` implementer) plus CI-green evidence.

**Course progress UI:** Sidebar and page checklists use `localStorage` on the learner device. They are **honor-system only** — not verified by CI, certification reviewers, or unlock gates.

**When stuck:** Stop. Ask a human lead or facilitator — give your repo path and what you already tried. Do not keep prompting the agent to "make it work."

**Out of scope for certification:** Cloud agents, remote control, and the Agent SDK are current Cursor surfaces (see Setup / Module 1). They are not Evidence Pack items and this course does not certify them.

---

## 9. Updating This Document

This is a living document.  
Propose improvements via a ticket on the course repo using the same process.  
Course modules must be updated when process wording here changes.

**Approval:** Team lead + engineering manager.

---

## 10. Changelog

### 2026-10-28 — process v1.2 (skills v1.3.x)

Aligned to mattpocock/skills **1.3.1** (CHANGELOG and README on that date) and to Cursor agent surfaces on cursor.com/changelog through 2026-10-20. Published HTML sync badge: `HTML synced 2026-10-28 to process v1.2 (process dated 2026-10-28)`.

- **Glossary filename.** Skills v1.3.0 renamed the domain-doc convention from `CONTEXT.md` / `CONTEXT-MAP.md` to `GLOSSARY.md` / `GLOSSARY-MAP.md`. Skills only read the new names. This course repo renamed its root file the same way. Learner pages, the instructor textbook, the agenda, and module source now say `GLOSSARY.md`.
- **`/resolving-merge-conflicts` removed.** Skills v1.3.0 deleted that skill. Nothing replaces it. The agent works an in-progress merge or rebase without a dedicated skill. It is gone from the taxonomy, quick reference, and textbook.
- **Version pin.** Course pin moved from v1.1+ to **v1.3.x** (verified patch 1.3.1).
- **New skills, spine unchanged.** `/implement-spec` is the alternate implementation path (Module 3). `/pr` is the model-invoked pull-request body (Modules 4–5). `/retro` is the user-invoked environment close after review (Modules 4–5) and is not an Evidence Pack item. Taxonomy also lists `/wizard`, `/wait-what`, and `/to-questionnaire`. The eight required artifacts are unchanged.
- **`/prototype` (skills v1.2).** Logic/state is a single shareable HTML file, not a terminal app. The prototype stays on a `prototype/…` branch as runnable evidence. It is not deleted after the verdict. The UI branch is still several variations on one route. Do not merge the branch. Do not harden the shell into production code.
- **Cursor surfaces.** Day 1 no longer frames the product as Chat versus Composer. Agent is the building surface for this course. A short note covers cloud agents, remote control of a local agent, and the Agent SDK (`skills/` packaging for an agent you ship). Those notes are not a rewrite and not a certification.
- **`/setup-pre-commit` dropped.** That name is not a skill in mattpocock/skills v1.3.1. Rule 7 (local commands match CI) stays.

### 2026-09-16 — process v1.1

Previous living-process baseline. Published HTML was synced to it on 2026-09-22. Superseded by the entry above.
