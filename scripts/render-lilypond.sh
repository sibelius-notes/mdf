#!/usr/bin/env bash
# Compile every .ly file under lilypond/ to a cropped SVG under static/scores/.
# Usage:
#   ./scripts/render-lilypond.sh               # render all .ly files
#   ./scripts/render-lilypond.sh path/to/f.ly  # render one file
set -euo pipefail
export PATH="/opt/homebrew/bin:/opt/homebrew/Cellar/lilypond/2.24.4/bin:$PATH"

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC_ROOT="$REPO_ROOT/lilypond"
OUT_ROOT="$REPO_ROOT/static/scores"

if [[ $# -ge 1 ]]; then
  # Accept absolute or relative paths; normalise to absolute
  FILES=()
  for f in "$@"; do
    [[ "$f" = /* ]] && FILES+=("$f") || FILES+=("$REPO_ROOT/$f")
  done
else
  IFS=$'\n' read -r -d '' -a FILES < <(find "$SRC_ROOT" -name "*.ly" | sort && printf '\0')
fi

for SRC in "${FILES[@]}"; do
  # Derive course/name from path relative to $SRC_ROOT
  REL="${SRC#$SRC_ROOT/}"        # e.g. music272/01-parallel-fifths.ly
  STEM="${REL%.ly}"               # e.g. music272/01-parallel-fifths
  COURSE="$(dirname "$STEM")"    # e.g. music272
  NAME="$(basename "$STEM")"     # e.g. 01-parallel-fifths
  OUT_DIR="$OUT_ROOT/$COURSE"
  mkdir -p "$OUT_DIR"
  TMP="$(mktemp -d)"
  /opt/homebrew/Cellar/lilypond/2.24.4/bin/lilypond \
    --svg -dcrop -dno-print-pages \
    -o "$TMP/$NAME" "$SRC" 2>/dev/null
  if [[ -f "$TMP/${NAME}.cropped.svg" ]]; then
    mv "$TMP/${NAME}.cropped.svg" "$OUT_DIR/${NAME}.svg"
  elif [[ -f "$TMP/${NAME}.svg" ]]; then
    mv "$TMP/${NAME}.svg" "$OUT_DIR/${NAME}.svg"
  else
    echo "WARNING: no SVG produced for $SRC" >&2
  fi
  rm -rf "$TMP"
  echo "  rendered: $STEM"
done
echo "Done. SVGs in $OUT_ROOT"
