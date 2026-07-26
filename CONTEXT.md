# CONTEXT.md — Cursor + Matt Pocock Skills Course

## Language

**Issue tracker**: The tool that hosts a repo’s issues (GitHub Issues, Linear, or local `.scratch/` markdown). Skills such as `to-tickets`, `to-spec`, `triage` read from and write to it.

**Issue**: A single tracked unit of work inside an Issue tracker — bug, task, spec, or slice produced by `to-tickets`.

**User-invoked skill**: Typed by the human. Model invocation disabled. Orchestrators.

**Model-invoked skill**: Reached by the agent or by an orchestrator. Never a typed primary flow step.

**Tracer-bullet ticket**: A vertical slice that delivers end-to-end observable behavior and declares its blocking edges. Sized for one focused agent session.

**Binary kill test**: One-sentence user-observable behavior + recorded blockers. Fail either → re-slice.

**Three Pillars**: Context Engineering, Assumption Destruction, Stress Testing — properties of the underlying grilling engine.

**Red→Green only**: The TDD loop inside `/implement`. Refactor is deferred to `/code-review`.

**Dual-axis review**: Standards (repo conventions + Fowler smells) ‖ Spec (match to originating ticket). Parallel sub-agents.

## Relationships

- A user-invoked skill may invoke model-invoked skills.
- A model-invoked skill is never the primary typed entry point of the preferred chain.
- `/grill-with-docs` reaches `/domain-modeling`.
- `/implement` reaches `/tdd` and `/code-review`.
- `/prototype` answers one design question and is thrown away after the answer is captured.
