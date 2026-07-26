# Deployment

GitHub Pages is built from the `/docs` folder on the `main` branch.

## Enable (once)

1. Repo **Settings → Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main` / `/docs`
4. Save

Site: https://practical-office.github.io/Cursor-AI-dev/

CLI equivalent (org admin):

```bash
gh api -X POST repos/Practical-Office/Cursor-AI-dev/pages \
  -f build_type=legacy \
  -f source[branch]=main \
  -f source[path]=/docs
```

## Verify after push

- [ ] https://practical-office.github.io/Cursor-AI-dev/ loads the hub
- [ ] Setup + Modules 1–5 navigate and checklists persist in localStorage
- [ ] Quick reference / Certification / Next steps / course-full print path work
- [ ] Living process link opens `docs/reference/CURSOR-MATT-SKILLS-PROCESS.md` on GitHub
- [ ] Hub https://practical-office.github.io/dev-sops/ links to this course

## Local preview

```bash
cd docs && python3 -m http.server 4177
```

Open http://localhost:4177
