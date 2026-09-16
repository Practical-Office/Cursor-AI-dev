# CONTEXT.md — Cursor + Matt Pocock Skills Course

## Language

**Issue tracker**: The tool that hosts a repo’s issues (GitHub Issues, Linear, or local `.scratch/` markdown). Skills such as `to-tickets`, `to-spec`, `triage` read from and write to it.

**Issue**: A single tracked unit of work inside an Issue tracker — bug, task, spec, or slice produced by `to-tickets`.

**User-invoked skill**: Typed by the human. Model invocation disabled. Orchestrators.

**Model-invoked skill**: Reached by the agent or by an orchestrator. Never a typed primary flow step.

**Route before grill**: Before any grilling skill, decide which typed skill fits (`/wayfinder` or `/grill-with-docs`). Write one sentence of reasoning. This is not the same as typing `/triage`.

**Foggy / weak-context**: Backlog item is underspecified, spans more than one session, or you cannot name the correct `@` files yet. Route to `/wayfinder` first — do not force a single-session grill.

**Properly primed**: Minimal correct `@` files and folders attached before invoking a skill. The agent has the right code and docs in context — not an empty attach list, not a kitchen-sink dump.

**`/triage` (tracker intake)**: User-invoked skill for work already in the issue tracker — categorize, set state, verify, brief the agent. May grill inside triage. Different job from the route-before-grill gate.

**Tracer-bullet ticket**: A vertical slice that delivers end-to-end observable behavior and declares its blocking edges. Sized for one focused agent session.

**Slice test**: One-sentence user-observable behavior + recorded blockers. Fail either → re-slice. Formerly called “binary kill test.” Not the BML experiment kill criteria.

**Three Pillars**: Context Engineering, Assumption Destruction, Stress Testing — properties of the underlying grilling engine.

**Red→Green only**: The TDD loop inside `/implement`. Refactor is deferred to `/code-review`.

**Pre-Build review**: Separate agent review of ticket + plan before `/implement`. Record ≥2 concrete findings (gaps, risks, missing seams). Surfaces problems before code is written.

**Dual-axis review**: Standards (repo conventions and code messiness vs project norms) ‖ Spec (match to originating ticket). Parallel sub-agents. Post-implement closeout; auto from `/implement`.

## Relationships

- A user-invoked skill may invoke model-invoked skills.
- A model-invoked skill is never the primary typed entry point of the preferred chain.
- `/grill-with-docs` reaches `/domain-modeling`.
- `/implement` reaches `/tdd` and `/code-review`.
- `/prototype` answers one design question and is thrown away after the answer is captured.
