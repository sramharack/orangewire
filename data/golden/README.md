# Golden values

Reference numbers that every tool in this repo (workbook, explorer, Python,
OpenDSS) must reproduce. Regenerate with `uv run python scripts/make_golden.py`;
`uv run pytest` checks them.

| File | What it holds |
|---|---|
| `headline_errors.csv` | Exact line current vs the "phase VA ÷ 120" shortcut, per 1 kVA |
