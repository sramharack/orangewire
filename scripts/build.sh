#!/usr/bin/env bash
# Build the manuscript PDF.
#   ./scripts/build.sh          one-off build  -> build/orangewire.pdf
#   ./scripts/build.sh watch    rebuild on every save
set -euo pipefail
cd "$(dirname "$0")/.."

want="0.15.0"
have="$(typst --version 2>/dev/null | awk '{print $2}')" || true
if [ -z "${have}" ]; then
  echo "error: typst not found. Install Typst ${want} (see README)." >&2
  exit 1
fi
if [ "${have}" != "${want}" ]; then
  echo "warning: found Typst ${have}; this repo is tested with ${want}." >&2
fi

mode="${1:-compile}"
mkdir -p build
exec typst "${mode}" \
  --root . \
  --font-path fonts \
  --ignore-system-fonts \
  --package-path vendor/typst-packages \
  manuscript/main.typ build/orangewire.pdf
