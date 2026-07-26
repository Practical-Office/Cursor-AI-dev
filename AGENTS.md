# AGENTS.md — Cursor + Matt Pocock Skills Course

## Course repo conventions

- Living process lives in `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md`. Course modules lag it.
- All domain language is defined in CONTEXT.md. Use exact terms.
- Skills are installed via `npx skills@latest add mattpocock/skills`. Run `/setup-matt-pocock-skills` once per student repo before any engineering skill work.
- Prefer the current mattpocock/skills taxonomy and main flow over any custom or outdated versions.

## Preferred skill chain (summary)

`/setup-matt-pocock-skills` → triage (`/wayfinder` | `/grill-with-docs`) → `/to-spec` → `/to-tickets` → `/implement` (Red→Green + CI-matching verification) → `/code-review` (model-invoked)

## Non-negotiables for agent work in this repo

- Do not invent requirements when no spec exists.
- Do not perform refactor inside the `/implement` Red→Green loop.
- Do not leave dual-axis must-fix findings uncommitted.
- Do not harden `/prototype` output into production code.
