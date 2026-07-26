# Cursor + Matt Pocock Skills
## Instructor Textbook (v4 — operational)

**Audience:** Instructors who must teach and enforce the course under real pressure, and engineers who must defend the process.  
**Companion artifacts:** Living process (`CURSOR-MATT-SKILLS-PROCESS.md`), module source (`MODULES-SOURCE-v3.md` and successors), workshop agenda, Evidence Pack.  
**Rule:** Course modules lag the living process. This textbook lags both and expands them for enforcement. It does not invent process.  
**Skills pin:** `npx skills@latest add mattpocock/skills` (official engineering set + `/setup-matt-pocock-skills`). Detect drift by comparing skill front-matter against the living process taxonomy every cohort.

---

# Introduction — Why this course exists

Most engineers treat the agent as faster autocomplete. First draft appears quickly. Cost appears later: rework, review thrash, tickets that cannot be verified, domain language that does not match `CONTEXT.md`.

An unconstrained agent invents requirements, skips edge cases, produces horizontal slices, and leaves a large unreviewable diff. Capability rose; mess size rose faster.

This course replaces that pattern with a skills-driven chain that forces shared understanding before code, vertical slices that fit one context window, Red→Green only, and dual-axis review. Every step exists because the preceding step fails predictably when skipped.

Preferred chain (non-negotiable):

```
/setup-matt-pocock-skills  (once per repo — hard gate)
→ triage decision (/wayfinder | /grill-with-docs | /triage)
→ /to-spec                 (synthesis only; three mandatory sections)
→ /to-tickets              (tracer-bullet vertical slices; binary kill test)
→ /implement               (Red→Green only at seams; CI-matching commands; auto-closes with /code-review)
→ /code-review             (model-invoked; Standards ‖ Spec)
```

Supporting skills (`/prototype`, `/diagnosing-bugs`, `/ask-matt`, `/improve-codebase-architecture`, etc.) are reached when the main chain surfaces the exact failure mode they solve. They are not optional decoration.

The rest of this book states the exact failure mode each piece attacks, the artifact that proves the step occurred, the instructor reset script when the step is skipped, and the binary evidence required for credit.

---

# Chapter 0 — Setup as a hard gate

## Failure mode this chapter attacks

Agent improvises process because tracker location, triage labels, and domain-doc layout are unknown. Later skills invent labels and write fiction into the wrong place. Evidence Pack fails.

## Exact rules

`/setup-matt-pocock-skills` is user-invoked, once per repo. It writes:
- issue-tracker config
- triage-label vocabulary (`docs/agents/triage-labels.md`)
- domain-doc layout (CONTEXT.md + `docs/adr/`)

Until those files exist and are pointed at by the student, no later module begins. Verbal confirmation is rejected.

Rules (`.cursor/rules` or project rules) are always-on static context — short, specific, point at real examples. Skills are loaded only when invoked and refuse to write code until their process steps complete. That refusal is the point.

**Taxonomy (architecture, not preference):**
- User-invoked (typed, `disable-model-invocation: true`): `/ask-matt`, `/grill-with-docs`, `/wayfinder`, `/triage`, `/improve-codebase-architecture`, `/setup-matt-pocock-skills`, `/to-spec`, `/to-tickets`, `/implement`
- Model-invoked (agent or orchestrator reaches; never typed as normal flow step): `/prototype`, `/diagnosing-bugs`, `/research`, `/tdd`, `/domain-modeling`, `/codebase-design`, `/code-review`, `/resolving-merge-conflicts`

Student who types `/code-review` or `/domain-modeling` as primary command has misunderstood the architecture. `/implement` reaches `/tdd` + `/code-review`. `/grill-with-docs` reaches `/domain-modeling`.

## Instructor pre-flight (mandatory before Day 1)

1. Install the official set yourself.
2. Run `/setup-matt-pocock-skills` in a throwaway real repo.
3. Produce the three config files.
4. Confirm local CI-equivalent commands match the project pipeline.
5. Keep the setup transcript; it is the model for student Evidence Pack item 1.

## Teaching note + reset script

Do not lecture taxonomy for twenty minutes. Install → run setup in each student’s real repo → force the student to point at the files the skill wrote.  
**Reset language when skipped:** “Setup files missing. No Module 1. Run `/setup-matt-pocock-skills` now. Point at the three files. Clock starts when the files are visible.”

---

# Chapter 1 — Reality check and the cost of undisciplined use

## Failure mode

Engineer pastes feature request into Agent, accepts bulk suggestions, merges. Happy path works. Edge case appears two weeks later. Domain language does not match CONTEXT.md. Diff was large; original request never became a verifiable specification. Root cause is missing shared understanding before code, not model quality.

## Cursor surfaces (precise)

- Chat = thinking, exploration, questions. Not the building surface.
- Composer / Agent = multi-file edits, terminal, primary surface for any change that touches more than one file.

Students leave able to state in one sentence why Agent is preferred for multi-file work.

## Triage before grill (mandatory)

Most common early-cohort failure: default every item into `/grill-with-docs`. That skill is correct for scoped work when a codebase already exists. It is wrong for foggy or multi-session work.

| Situation | Typed skill |
|-----------|-------------|
| Foggy or >1 agent session | `/wayfinder` |
| Scoped + codebase exists | `/grill-with-docs` |
| No codebase yet | light priming → `/grill-with-docs` the moment code exists |
| Existing issues that need role movement | `/triage` (state machine of triage roles) |

`/triage` is distinct from the triage decision table. It moves issues through the label state machine defined by setup. Do not collapse the two.

## Three Pillars (properties of the grilling engine)

1. **Context Engineering** — correct `@` files/folders before the grill starts. Wrong context → confident wrong answers.
2. **Assumption Destruction** — force every assumption open and attack it. Facts that can be answered by reading the codebase are answered by reading the codebase. Decisions that require trade-offs are grilled. (v1.1+ explicit facts-vs-decisions distinction.)
3. **Stress Testing** — failure modes, scale, future regret, removal test. Expensive decisions become ADRs.

Grilling that skips any pillar is theater.

## Durable artifact standard

Verbal summary is not an artifact. Committed entry in CONTEXT.md or short ADR under `docs/adr/` is an artifact. Pairs that only talk have not completed the exercise. This trains the Evidence Pack reflex: if it is not in the repo or tracker, it did not happen.

## Live demo (required)

Same real backlog item, three paths, side-by-side residual risk and CONTEXT.md update:
- Path A: raw accept-everything
- Path B: weak grill (no pillars, no artifact)
- Path C: full three-pillar `/grill-with-docs` with correct priming

Students state the difference in residual risk and reviewability in one sentence each.

## Instructor reset scripts

- Defaulting to grill: “Triage decision missing. State the one-sentence reason for the skill you chose. Restart.”
- No artifact: “CONTEXT.md / ADR not committed. Credit is zero until the file exists.”
- Typing model-invoked skill as primary: “Architecture misunderstanding. `/implement` reaches `/code-review`. Restart from the correct user-invoked skill.”

---

# Chapter 2 — From grill to specification

## Failure mode

Teams treat `/to-spec` as a thinking tool. They produce polished documents that were never stress-tested. Implementation discovers missing edge cases, unstated non-goals, residual risks that were never written.

## Exact rule

`/to-spec` is synthesis only. It reads the conversation that already happened and publishes a clean specification to the configured issue tracker. The only reliable input is a completed grill that applied all three pillars. Anything less is fiction with good formatting.

## Three mandatory sections (any missing → reject on the spot)

1. Acceptance criteria — verifiable and observable. “Works better” is rejected. “User can complete checkout with a valid cart and receives confirmation email within 30 s” is accepted.
2. Non-goals — explicit bounds. Without them the agent expands scope under “while we’re here.”
3. Residual risks — named uncertainties that remain after the grill. A claim of zero residual risk after a real grill is usually a grill that stopped too early.

## Context window discipline

Grill + `/to-spec` stay in one unbroken conversation window. Compacting or starting fresh before the specification is published throws away the context the synthesis needs. Implementation sessions start deliberately fresh from the ticket.

## Live demo

Same grilled conversation → weak-context `/to-spec` vs properly primed `/to-spec`. Score both against the three sections in the room. Incomplete sections are rejected immediately.

## Instructor reset

“Section X missing. Spec rejected. Return to the grill, apply the missing pillar, re-run `/to-spec`. No credit until all three sections are present and published.”

---

# Chapter 3 — Tickets and implementation

## Failure mode

Horizontal slicing produces intermediate states that cannot be demoed and diffs no one wants to review. Multi-session tickets recreate the context pollution the process exists to prevent. Teaching “red-green-refactor” inside `/implement` contradicts the current `tdd` skill definition and mixes concerns the process separated.

## Vertical tracer-bullet rule + binary kill test

A ticket fails and must be re-sliced immediately if:
- it cannot state, in one sentence, a user-observable behavior change, **or**
- its blocking edges are missing or circular.

No negotiation. Subjective sizing is rejected.

## `/implement` exact behavior

1. Drives Red→Green only at pre-agreed seams (per current `tdd` skill: “Refactoring is not part of the loop. It belongs to the review stage”).
2. Runs the project’s real CI-equivalent commands. “Tests passed in the agent session” is not done.
3. Closes by invoking model-invoked `/code-review`.
4. Leaves refactor to the Standards axis of that review.

Each `/implement` starts from a clean context loaded with the ticket. Carrying prior conversation forward produces self-approval bias.

## Live demo

Same small ticket: “just build it” vs full `/implement`. Show diffs, test coverage at seams, review findings, residual risk. Students feel the difference; the lecture is unnecessary.

## Instructor reset

- Kill-test failure: “Ticket fails binary kill test. Re-slice now. One-sentence behavior + blockers required.”
- Refactor inside loop: “Refactor is a code-review output. Revert the refactoring commits. Restart Red→Green only.”
- Local green / CI red: “CI-equivalent commands are red. Not done. Fix inside this session.”

---

# Chapter 4 — Cleaning up and settling design questions

## Systematic diagnosis

Paste-the-error-and-pray fixes symptoms. `/diagnosing-bugs` forces: reproduce → minimise → hypothesise → instrument → fix → regression-test. Hypothesis and next smallest experiment must be stated before any code change. Model-invoked in normal flow; invocable by name for standalone production bugs.

## Dual-axis review (exact)

Parallel sub-agents, fresh context:
- **Standards** — repo conventions + Fowler baseline (Mysterious Name, Duplicated Code, Feature Envy, Data Clumps, Primitive Obsession, Repeated Switches, Shotgun Surgery, Divergent Change, Speculative Generality, Message Chains, Middle Man, Refused Bequest). Name the smell explicitly.
- **Spec** — does the code implement the originating ticket/spec? If no spec can be found, report “no spec available”; do not invent requirements.

Gate: every must-fix finding is committed as a fix the same day. Findings without commits = failed exercise.

## Architecture deepening

`/improve-codebase-architecture` produces a visual HTML report of small, high-leverage deepenings. Large rewrite proposals are rejected. The skill then grills the selected opportunity.

## Prototype (throwaway answer to one design question)

Two exclusive branches:
- LOGIC — tiny interactive terminal app that drives the state machine and prints full state after every action.
- UI — several radically different variations on a single route, switchable via floating bar + URL parameter.

Rules (from current skill):
- Throwaway from day one, clearly marked.
- Lives next to the real module.
- One command to start.
- No persistence by default.
- No tests or abstractions beyond runnable.
- When answered: fold validated decision into real code; capture prototype on throwaway branch; leave pointer on the issue; record verdict. Hardening in place is process failure.

## Instructor enforcement on Day 4

Force named smells. Force same-day commits for every must-fix. Force at least one correctly branched prototype that is removed from main and has a recorded verdict. Use real diffs from Day 3.

Reset language: “Must-fix finding has no committed fix. Day is not complete. Fix now.”

---

# Chapter 5 — Full workflow under pressure

## Why no new theory

Process practiced only when there is no deadline is not learned. Day 5 is pure execution on real open work, group review of artifacts, and structured `/ask-matt` decision log.

Instructor job: enforcement only. Force missing pillars, kill tickets that fail the binary kill test, stop context pollution, protect the working session from new lecture content. Any “reality check” discussion is grounded solely in the artifacts just produced.

## `/ask-matt` decision log (closing artifact)

Three real scenarios from the student’s own week → routing decision the skill returns → one sentence of agreement or disagreement per scenario. Deviation is allowed only when written and defensible. Free-form personal frameworks are rejected; they reinvent what the skill already automates.

## What “done” for the week looks like (binary, inspected)

In the repo and the tracker:
- Completed `/setup-matt-pocock-skills` output.
- At least one triage decision with written reasoning.
- Published specification with all three mandatory sections.
- Ticket graph that passes the binary kill test.
- At least one Red→Green `/implement` diff with CI-matching commands green.
- Dual-axis review that names concrete Fowler smells and has committed fixes for every must-fix.
- Three `/ask-matt` transcripts with written agreement or deviation.
- (If used) prototype on throwaway branch with recorded verdict.

Self-reported confidence is not a metric. The Evidence Pack is the metric.

---

# Cross-cutting teaching principles (enforcement)

1. Artifacts over affirmation. If it is not in the repo or the tracker, it did not happen.
2. Binary gates over gradients. Incomplete specs, tickets that fail the kill test, reviews without fixes are rejected, not scored partially.
3. Demo the cost. Every major teaching point has a side-by-side on the same real item. Residual risk and reviewability are the argument.
4. Enforce in the room. Circulation is mandatory. Pairs that drift into chat-only or skip triage are stopped and reset with the scripts above.
5. Modules lag the living process. When the process document changes, modules and this textbook are updated afterward. The process never lags the course.
6. Skills drift detection. Before each cohort, compare front-matter of installed skills against the living process taxonomy. Re-install if divergence appears.

---

# Instructor pre-work checklist (hard gate for the instructor)

Before the first day:
- [ ] Living process and this textbook read.
- [ ] Official skills installed and `/setup-matt-pocock-skills` run in a real repo; three config files produced.
- [ ] One complete preferred-chain cycle executed on a real team item; Evidence Pack items 1–6 produced personally.
- [ ] Side-by-side residual-risk demo prepared on a real backlog item.
- [ ] Reset scripts memorized for the five most common failure modes (skip setup, default grill, incomplete spec, kill-test failure, findings without fixes).
- [ ] Certification inspection checklist printed.

If any item is missing, the instructor is not ready. Do not start the cohort.

---

# Certification inspection protocol (lead reviewer)

Within 5 business days the student submits the Evidence Pack on real shipping work. Lead reviewer inspects only the artifacts:

1. Setup output files present and correct.
2. Triage decision + reasoning committed or in tracker.
3. Spec published with all three sections; incomplete → fail.
4. Ticket graph passes binary kill test; any failure → fail.
5. At least one Red→Green implement diff; CI commands green; no in-loop refactor.
6. Dual-axis review names ≥2 Fowler smells; every must-fix has a committed fix same day.
7. Three `/ask-matt` transcripts + one-sentence agreement/deviation each.
8. (If claimed) prototype branch exists, marked throwaway, verdict recorded, removed from main.

Missing any required artifact → fail. No partial credit. No self-report accepted.

---

# How to use this textbook

- Before teaching a day: read the corresponding chapter + matching living-process section. Run the live demo yourself on a real item.
- During teaching: keep the failure modes and reset scripts visible. When a student exhibits one, name it and reset.
- After teaching: inspect the artifact trail against the binary success criteria. Self-report is rejected.

The course succeeds only when engineers ship higher-quality work with less rework and clearer domain models. Everything in this book exists to serve that outcome. Anything that does not is cut.

---

# Stop / Start directives for instructors

- Stop accepting verbal confirmation of setup, triage, or review. Start requiring the committed file or tracker entry before credit.
- Stop teaching red-green-refactor inside `/implement`. Start Red→Green only; refactor is a code-review output (current `tdd` skill).
- Stop allowing incomplete specs or tickets that fail the kill test to proceed. Start rejecting on the spot.
- Stop leaving must-fix findings unacted. Start requiring same-day committed fixes.
- Stop inventing personal “when to use what” frameworks. Start from `/ask-matt` transcripts only.
- Stop letting the course lead the living process. Start updating modules and this textbook only after the process document changes.

This is the hardened instructor textbook. Modules and workshop agenda must lag it.
