# AGENTS.md — Cursor + Matt Pocock Skills Course

> **Canonical repo:** [`Practical-Office/Cursor-AI-dev`](https://github.com/Practical-Office/Cursor-AI-dev)  
> **Live course:** https://practical-office.github.io/Cursor-AI-dev/  
> **Local preview:** `cd docs && python3 -m http.server 4177`

## Course repo conventions

- Living process lives in `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md`. Course modules lag it.
- Instructional density for HTML modules: `docs/reference/MODULES-SOURCE-v3.md`.
- Instructor textbook (enforcement): `docs/reference/Cursor-AI-dev-Instructor-Textbook-v4.md` → online page `docs/instructor-textbook.html`.
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
