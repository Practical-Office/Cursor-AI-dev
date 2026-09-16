# Cursor and Matt Skills course review

**Live course:** https://practical-office.github.io/Cursor-AI-dev/  
**Repo:** Practical-Office/Cursor-AI-dev  
**Reviewed against:** learner HTML as of 2026-09-10, compared to earlier reviewer notes that quote the same module text  
**Audience this review optimizes for:** competent software engineers with basic Cursor experience (same as `docs/reference/WORKSHOP-AGENDA.md`) — clearer learner language on the existing chain, not a retarget for low-experience business teams

This document is a review, not a permission to edit the live course. Keep the published site frozen until priorities in this file are chosen.

**Implementation status (2026-09-16):** P0+P1 accepted and implemented per grill decisions below. P2 (real MODULES-SOURCE-v4 republish) deferred.

**Locked grill decisions:**
- **Q1:** P0 + P1 now; P2 deferred
- **Q2:** Rename everywhere → **Route before grill**; `/triage` = tracker intake only
- **Q3:** Item 15 pre-Build agent review — **taught once on Day 4**; not Evidence Pack hard gate
- **Q4:** **Slice test** rename in learner HTML + CONTEXT + living process (alias: formerly binary kill test; not BML kill)

---

## Goal

Keep the current Matt Pocock skill chain. Change the **learner-facing pages** so engineers with basic Cursor can run that chain without the instructor translating slogans, colliding terms, or a mislabeled “triage” table.

Preferred chain (do not replace):

`/setup-matt-pocock-skills` → route (`/wayfinder` | `/grill-with-docs`) and, when needed, tracker `/triage` → `/to-spec` → `/to-tickets` → `/implement` → `/code-review` (model-invoked inside implement)

Success for a taught cohort: rework down, committed artifacts (CONTEXT.md / ADR, three-section spec, tickets that pass the slice test, Red→Green implement, dual-axis review with committed must-fixes) — not first-draft speed.

---

## Constraints

- Keep the preferred skill chain. Do not invent a second process.
- Learner pages explain a term in the same sentence they use it (or link a glossary on the learner path).
- Instructor Textbook stays the enforcement layer (reset scripts, binary gates). Do not dump textbook density onto student pages.
- Domain language matches `CONTEXT.md` where a term already exists; split colliding names on learner pages (ticket **slice test** vs BML kill; **route before grill** vs `/triage` intake).
- No person names in course or review artifacts.
- Do not retarget this rewrite for low-experience / non-engineer rooms (out of scope here).

**Out of scope for a first implement pass:** changing what Matt skills *mean*; merging this course into another SOP; shipping HTML in the same run as only *reading* this review; Day 0 basics blocks or seeded FDE teaching kits.

---

## Sources (read-only)

| What | Path or URL |
|---|---|
| Hub | `docs/index.html` · https://practical-office.github.io/Cursor-AI-dev/ |
| Setup | `docs/setup.html` |
| Modules | `docs/module-1.html` … `docs/module-5.html` |
| Next steps / certification | `docs/next-steps.html`, `docs/certification.html` |
| CSS | `docs/css/cursor-ai-dev.css` |
| Instructional source (still what modules match) | `docs/reference/MODULES-SOURCE-v3.md` (dated 2026-07-25) |
| Claimed v4 source | `docs/reference/MODULES-SOURCE-v4.md` (stub only) |
| Living process | `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md` |
| Instructor Textbook | `docs/instructor-textbook.html` · `docs/reference/Cursor-AI-dev-Instructor-Textbook-v4.md` |
| Workshop agenda | `docs/reference/WORKSHOP-AGENDA.md` |
| Glossary (repo, not in learner nav) | `CONTEXT.md` |
| Skill defs (routing vs intake) | mattpocock `/triage`, `/wayfinder`, `/grill-with-docs` (installed under agent skills) |

---

## Evidence: notes vs today’s course

Earlier review notes quote current success-criteria and Stop/Start lines **verbatim**. Learner Modules 1–5 are the same substance as the 2026-07-25 v3 publish (`git diff 391a636..HEAD -- docs/module-*.html` empty as of the original review pass).

| Layer | What moved |
|---|---|
| Modules 1–5, Setup, Certification, Quick reference | Unchanged |
| Hub `docs/index.html` | Chip says **v4**. Principles line gained parentheses. Textbook and agenda links added. |
| `docs/reference/MODULES-SOURCE-v4.md` | Stub (“too large for API write”). Not a real v4 curriculum. |
| Commit claiming CSS contrast fix (2026-08-13) | Did not change module HTML or CSS contrast in practice. |
| Instructor Textbook | Live page with how/why. Students rarely open it; jargon still hits learner pages unexplained. |

**Score:** about 2 of ~35 earlier review items acted on, and those only in part (hub parentheses; contrast claimed but not fixed for dark mode).

**Skill vs course clash (routing):** Living process labels the Wayfinder-vs-Grill table “TRIAGE FIRST.” The `/triage` skill is a different job (tracker intake: category, state, verify, brief; grill only if needed). Module 1’s stand-alone table teaches the routing gate and never explains `/triage`. That mismatch is a primary clarity fix.

Optional check before implementing: hub principles, Instructor Textbook chapters 0–4, Setup, Certification, dark-mode Next / Open Certification buttons. Full Modules 1–5 re-read not required if acting from this file.

---

## Ranked batches

| Priority | Batch | Intent |
|---|---|---|
| **P0** | Contrast; glossary / in-sentence defs; hub “when / what” sentences | Pages are readable |
| **P1** | Module wording (routing vs `/triage`, slice test, pre-Build agent review, dual-axis without Fowler names, M5 chain) | Same five days, teachable moves |
| **P2** | Real `MODULES-SOURCE-v4` and republish HTML from it | Source of truth matches what students see |

Do P0–P1 before claiming v4 on the hub. P2 last so v4 is not another stub.

---

## Numbered change items

### P0

#### 1. Dark-mode Next and Certification buttons (and topbar title)

**Pain:** Primary buttons and “Module N — …” topbar titles are hard to read (white-on-white or faint-on-white), especially with OS dark mode.

**Where:** `docs/css/cursor-ai-dev.css` — `.btn-primary` is `background: var(--ink); color: #fff`. In dark theme `--ink` is `#e8edf2`. `.topbar` stays `background: rgba(255, 255, 255, 0.82)` while `.topbar-title` uses `--ink-faint`. Next is `btn-primary` from `docs/js/cursor-ai-dev.js`. Certification CTA on `docs/next-steps.html`.

**Suggested change:** Dark theme: primary button uses a dark fill and light text (or brand fill and dark text) with contrast that passes a quick visual check. Theme the topbar with the canvas/surface tokens so title ink is not light-gray on white. Verify light theme still readable.

**Done when:** In light and dark (OS preference and in-page Theme toggle), Next and Open Certification show clearly readable label text; module topbar titles are clearly darker than the bar.

#### 2. Glossary on the learner path

**Pain:** Hub and modules assume CI, ADR, dual-axis, synthesis, model-invoked, foggy, refactor, kill test / slice test. Definitions live in `CONTEXT.md` and the Instructor Textbook, not in sidebar/nav.

**Where:** `docs/index.html` (principles dump); all `docs/module-*.html`; `CONTEXT.md`.

**Suggested change:** Add a learner glossary page (or hub section) in course nav, sourced from `CONTEXT.md` plus teaching terms (CI, foggy, group review, **slice test** vs BML kill, **route before grill** vs `/triage`). Every first use on a module either defines in-sentence or links that glossary. Do not reintroduce Fowler names into the glossary.

**Done when:** Glossary is linked from hub and each module; a reader can resolve jargon on Module 1 without opening GitHub-only markdown.

#### 3. Hub principles are slogans, not procedures

**Pain:** “Triage first” and “Spec synthesis only” still need the reader to already know when/what. Parentheses helped a little; they are not a procedure. “Triage first” also collides with the `/triage` skill.

**Where:** `docs/index.html` Why / Principles.

**Suggested change:** Prefer **Route before grill**: decide Wayfinder vs Grill (and when `/triage` intake applies) before grilling — point to Module 1. *Spec synthesis only* = `/to-spec` writes the spec from the grill that already happened; it does not interview — point to Module 2. Replace ticket “binary kill test” wording on the hub with **slice test** (item 12).

**Done when:** Hub answers “when?” and “synthesizing what?” without requiring Module 1; does not equate “triage first” with typing `/triage`.

---

### P1 — Module wording (same five days)

#### 4. Split “route before grill” from `/triage` intake

**Pain:** Module 1 “Triage before grill” only shows Wayfinder vs Grill. Practice asks for a “triage decision.” Success says “correct triage … without prompting” while `/triage` is listed as user-invoked. The stand-alone table does not fit the overall explanation and is not the `/triage` skill.

**Where:** `docs/module-1.html` (table, practice, success `m1-c3`, taxonomy); `docs/quick-reference.html`; living process “TRIAGE FIRST” block; skill defs for `/triage`, `/wayfinder`, `/grill-with-docs`.

**Suggested change:** Teach **two beats** on Module 1:

1. **Route before grill** (rename the section; this is the living-process routing gate, not the `/triage` skill): foggy / more than one session → `/wayfinder`; scoped + codebase exists → `/grill-with-docs`. Define foggy in-sentence (item 9).
2. **`/triage` = tracker intake** (short separate block): use when work is already an issue/PR that needs category, state, verify, and an agent brief; may grill *inside* triage. Day 1 pair practice on backlog items stays route → grill/wayfinder → committed CONTEXT/ADR unless the item is a real tracker issue.

Success criterion: “I can route a new item (Wayfinder vs Grill) and say when I’d use `/triage` instead (tracker intake).”

**Done when:** Table is not titled as if it were `/triage`; both jobs are explained; success criterion matches the page.

#### 5. “Setup gate still holds” has no referent on Module 1

**Pain:** Success checkbox does not say what the gate is.

**Where:** `docs/module-1.html` success `m1-c1`. Gate itself: `docs/setup.html`.

**Suggested change:** Checkbox text: setup output (tracker, labels, domain-doc layout) still visible in *this* repo — same hard gate as Setup.

**Done when:** The criterion names the inspectable files, or links Setup.

#### 6. User-invoked vs model-invoked is a label dump

**Pain:** Success requires “stated with examples.” The page lists skill names. It does not show one worked example.

**Where:** `docs/module-1.html` taxonomy + success `m1-c4`.

**Suggested change:** One example: *You type* `/implement`. *The agent then runs* `/code-review`. Typing `/code-review` as the main step is the wrong architecture. Same pattern for `/grill-with-docs` → `/domain-modeling`.

**Done when:** Success criterion is “I can give one typed skill and one skill the agent reaches,” and the page contains that example.

#### 7. Stop accepting verbal share is too vague

**Pain:** Sounds like “stop having the agent explain.” Intent: chat summary is not the graded record.

**Where:** `docs/module-1.html` Stop/Start, Practice deliverable, hard truth. Artifact location: committed `CONTEXT.md` entry or ADR stub in the **learner’s own working repo** (from Setup domain-doc layout). No LMS upload — instructor inspects the repo / Evidence Pack.

**Suggested change:** Stop treating a verbal or chat-only recap as the deliverable. Start requiring a committed `CONTEXT.md` entry or ADR that states what was decided. Chat explanation is allowed; credit requires the commit.

**Done when:** Stop/Start cannot be read as “do not let the agent explain”; page states where the artifact lives (repo commit).

#### 8. Module 1 and Module 2 both own “triage then grill” and the Three Pillars

**Pain:** Duplicate goal. Pillars named on Day 1, practiced on Day 2, never shown as example questions.

**Where:** `docs/module-1.html` (pillars list, routing goal); `docs/module-2.html` (goal still “triage-then-grill becomes default”; practice “full three-pillar grill” with no how).

**Suggested change:** Day 1: route + one pillar example each (Context = attach the right `@` files; Assumption = attack one unstated bet; Stress = “what fails at 10× / if we remove it?”). Day 2 goal: publish a three-section spec. Day 2 opens with a 5-minute routing gate, not a second “make triage default” goal.

**Done when:** Module 2 goal does not repeat Module 1’s routing drill; each pillar has one example question on the learner page.

#### 9. “Foggy” and “weak-context vs properly primed” are undefined

**Pain:** Wayfinder is for “foggy.” `/to-spec` demo is weak-context vs primed. Neither is defined on the learner page.

**Where:** `docs/module-1.html` table; `docs/module-2.html` live demo and Stop/Start.

**Suggested change:** Foggy = cannot name the outcome in one sentence, or it will take more than one agent session. Weak-context `/to-spec` = ran spec without `@` of the files the decision depends on. Properly primed = those files are attached.

**Done when:** Both phrases are defined in-sentence on the page that uses them.

#### 10. Group review / reject incomplete in the room

**Pain:** “Group review of every spec” and “incomplete sections rejected in the room” never say who reviews or how.

**Where:** `docs/module-2.html` Practice.

**Suggested change:** Instructor and peers read the three sections aloud (acceptance criteria, non-goals, residual risks). Missing any section → reject, return to grill, re-run `/to-spec`.

**Done when:** Practice names who reviews and the reject rule in plain language.

#### 11. CI vs “tests passed in the session”

**Pain:** “Local verification matches real CI commands” is undefined for engineers who have not wired CI themselves.

**Where:** `docs/module-3.html` Goal and core concepts. Instructor Textbook already distinguishes session green vs pipeline commands.

**Suggested change:** CI = the same checks the project runs on the pull request (the command in the pipeline, e.g. the repo’s test/lint script). “Agent said tests passed” is not done. Run that command locally; it must be green before the implement step is complete. Link glossary.

**Done when:** Module 3 states that difference in one paragraph the learner can act on.

#### 12. Two different “kill tests” → rename ticket rule to slice test

**Pain:** Ticket **binary kill test** (slice quality) collides with BML kill (stop the experiment).

**Where:** `docs/module-3.html`; hub principles; BML course linked from hub; `CONTEXT.md` / living process if mirrored on learner pages.

**Suggested change:** On learner pages call the ticket rule a **slice test**: one sentence of user-visible behavior + recorded blockers; fail → re-slice. Reserve “kill” for BML experiment criteria. One line: this is not the BML kill. Update hub / quick reference / certification wording that still says “kill test” for tickets.

**Done when:** Module 3 (and hub learner copy) cannot be misread as BML go/no-go.

#### 13. Refactor / “why refactor moved to code review”

**Pain:** Success asks learners to explain a move that was never taught. “Refactor” is never defined. Stop teaching red-green-refactor inside implement assumes classic TDD baggage.

**Where:** `docs/module-3.html` hard truth, core concepts, success `m3-c3`, Stop/Start.

**Suggested change:** Define refactor: cleanup that does not add the ticket’s user-visible behavior. `/implement` only adds the behavior (Red→Green at seams). Cleanup happens in `/code-review`. Success: “I can say refactor is cleanup after behavior exists, in review, not during implement.”

**Done when:** That definition is on Module 3; the odd “moved to” wording is gone.

#### 14. Dual-axis `/code-review` without Fowler names + must-fix clarity

**Pain:** Dual-axis and “must-fix same day” are jargon. Standards axis currently pairs conventions with named Fowler smells on the learner page.

**Where:** `docs/module-4.html` core concepts; living process / textbook may still mention Fowler — learner pages drop Fowler names.

**Suggested change:** Dual-axis = (1) **Spec:** does the diff match the ticket/spec (2) **Standards:** is the code messy vs repo conventions — **no Fowler naming requirement**. Must-fix = a blocking finding; every one gets a commit before the day ends. Keep timing one-liners for diagnosis / prototype / architecture. This is the **post-implement** closeout review (auto from `/implement`). It does **not** replace item 15.

**Done when:** Both axes and the commit-before-leave rule are in plain language; Fowler names are absent from learner Module 4.

#### 15. Pre-Build separate agent review (replaces Fowler success criterion)

**Pain:** Success “Review names ≥2 Fowler smells” is unexplained and wrong for this course rewrite. Learners need a taught step: stress the **ticket + plan before Build**, not smell trivia.

**Where:** `docs/module-4.html` (and any Day 3/4 practice that leads into implement). Today’s Fowler criterion: success `m4-c2`.

**Suggested change:**

- **Teach in the module body** (not only in a checkbox): after tickets and plan exist, **before** hitting Build / running `/implement`, run a **separate** review agent (Grok architect preferred; a separate Cursor agent is fine). That agent must return about **two** concrete improvements or disagreements — not a rubber stamp. Record the findings (issue comment, plan note, or CONTEXT/ADR pointer).
- **Then** proceed to implement; keep dual-axis `/code-review` at closeout (item 14).
- **Success criteria:** short pointer only, e.g. “Separate agent reviewed ticket + plan before Build; ≥2 concrete findings recorded.” Do not jam the full procedure into the checkbox label.

**Done when:** Module explains when, what artifact, which agent pattern, and how to record findings; success criteria reference that step in one line; Fowler smell criterion is gone.

#### 16. Prototype “removed from main”

**Pain:** Sounds like prototypes belong on `main` then get deleted. They should never land on the team default branch.

**Where:** `docs/module-4.html` practice.

**Suggested change:** Throwaway branch (or clearly marked throwaway folder). Never merge to the team’s default branch. Record the verdict on the ticket.

**Done when:** Practice cannot be read as “merge then remove from main.”

#### 17. Module 5 executed chain: routing vs `/triage`, auto `/code-review`

**Pain:** Chain looks like triage *is* Wayfinder/Grill. `/code-review` is a sibling bullet though implement already auto-runs it. “If multi-session” is unexplained.

**Where:** `docs/module-5.html` executed chain; `docs/quick-reference.html` main chain.

**Suggested change:** Nested list aligned with item 4: **route** (`/wayfinder` *or* `/grill-with-docs`); use `/triage` when the work is tracker intake; `/to-spec` when the work spans more than one session or needs a published spec; `/to-tickets` (slice test); `/implement` (Red→Green, CI command, auto `/code-review`). Put auto review in parentheses under implement, not as a separate typed step. Mention pre-Build agent review (item 15) in the Day 5 trail if that day replays the full chain.

**Done when:** Chain does not conflate routing with `/triage`; `/code-review` is not a separate typed bullet.

#### 18. Module 5 rules, ask-matt log, Day 1→5 evidence

**Pain:** “Zero new theoretical content” looks like a student rule. Group reviews still vague. Ask-matt log does not show the sentence template. Week success “instructor has evidence of Day 1→5 improvement” does not say which artifacts to compare.

**Where:** `docs/module-5.html` Rules, group reviews, ask-matt, week success `m5-c3`.

**Suggested change:** Relabel Rules as practice gate (like Module 4). Ask-matt: three scenarios; for each, skill chosen + one sentence “I agree because …” or “I would do X instead because …”. Day 1→5: instructor compares the same artifact types (CONTEXT/ADR, spec three sections, ticket one-sentence + blockers, implement diff; plus pre-Build agent-review findings if item 15 landed).

**Done when:** Learners know what to write for ask-matt; instructor knows which artifact types prove improvement.

---

### P2 — Source of truth

#### 19. Real instructional source v4, then republish

**Pain:** Hub points at `MODULES-SOURCE-v4.md`; that file is a stub. Modules still match v3. Next steps still link v3 in places.

**Where:** `docs/index.html` source of truth; `docs/reference/MODULES-SOURCE-v4.md`; `docs/next-steps.html` (still MODULES-SOURCE-v3).

**Suggested change:** After P0–P1 copy is agreed, write a real MODULES-SOURCE-v4 that includes the learner-language items above, then regenerate HTML from it. Do not claim v4 on the hub until the modules match.

**Done when:** v4 file is full instructional source; published modules match it; hub chip and links agree.

---

## Explicit non-goals

- Do not replace Matt skills with a custom in-house framework (Module 5 already forbids this).
- Do not harden `/prototype` into production.
- Do not put refactor inside the `/implement` Red→Green loop.
- Do not retarget learner pages for low-experience non-engineer cohorts in this rewrite.
- Do not add Day 0 curriculum or seeded FDE teaching kits in this rewrite.
- Do not treat this review as permission to ship HTML until P0–P1 are prioritized.

---

## Suggested implement order (after this review is accepted)

1. Contrast (item 1) + glossary + hub sentences (items 2–3).
2. Module 1–5 wording (items 4–18), especially routing vs `/triage` (4), slice test (12), pre-Build agent review (15), dual-axis without Fowler (14).
3. Real v4 republish (item 19).

---

## Ask

Choose which batches to do (P0 / P1 / P2). Then implement against this file’s numbered items. Do not change the live course in the same pass as only reading this review.
