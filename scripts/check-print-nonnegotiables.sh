#!/usr/bin/env bash
# Fail if print/quick-ref surfaces drift from docs/reference/QUICK-REFERENCE.md non-negotiables.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MD="$ROOT/docs/reference/QUICK-REFERENCE.md"
PRINT="$ROOT/docs/course-full.html"
HTML="$ROOT/docs/quick-reference.html"

for f in "$MD" "$PRINT" "$HTML"; do
  if [[ ! -f "$f" ]]; then
    echo "missing file: $f"
    exit 1
  fi
done

# Positive non-negotiable anchors (from QUICK-REFERENCE.md ## Non-negotiables)
REQUIRED=(
  "acceptance criteria / non-goals / residual risks"
  "slice test"
  "inside implement; it is a"
  "/code-review"
  "CI = same commands as PR pipeline"
  "Must-fix review findings committed the same day"
  "Prototype is throwaway"
)

for phrase in "${REQUIRED[@]}"; do
  for f in "$PRINT" "$HTML"; do
    if ! grep -qiF "$phrase" "$f"; then
      echo "missing non-negotiable phrase in $(basename "$f"): $phrase"
      exit 1
    fi
  done
done

if ! grep -qF "Refactor is **not** inside implement" "$MD"; then
  echo "QUICK-REFERENCE.md missing canonical refactor non-negotiable"
  exit 1
fi

for f in "$PRINT" "$HTML"; do
  if grep -qiF "refactor inside implement" "$f"; then
    echo "forbidden phrase in $(basename "$f"): refactor inside implement"
    exit 1
  fi
done

echo "print non-negotiables OK"
