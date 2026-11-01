# Roadmap: Beyond the Orange Wire (updated 2026-10-31)

Replaces the 2026-10-30 roadmap.

## Decisions

- **Title:** *Beyond the Orange Wire: Designing, Loading and Troubleshooting
  High-Leg and Open-Delta Services*. **Repo:** `orangewire`.
- **Publishing:** repo only. PDF attached to each tagged release. Optional
  Zenodo DOI at v1.0.
- **Scope:** closed (high-leg) delta and open delta, with equal weight.
- **Code basis:** NEC 2023 throughout. Every citation goes in the verification
  log and stays "unverified" until checked against the code text.
- **Nominal voltage:** 120/240 V in all examples. A Caribbean chapter covers
  115/230 V supply (high leg ≈ 199 V to neutral), imported equipment and 50/60 Hz.
- **Examples (designed from scratch, no client data):**
  - Commercial: casual-dining restaurant, ~3,000 ft², ~100 seats, all-electric
    cooking line, closed high-leg delta, 240Δ–120/208Y transformer for the
    front-of-house panel.
  - Industrial: 250 m³/day SWRO plant on a utility open-delta service; the
    loss-of-one-transformer scenario and a closed-bank comparison.
- **The 208 V question** gets its own chapter. It answers two questions with
  evidence (code, manufacturers, textbooks, utility rules, practitioner forums,
  and engineering analysis): should the high-leg-to-neutral voltage ever be
  used, and what happens when 208 V-rated equipment meets a 240 V service (and
  the reverse).
- **Waveforms:** no field captures are available. All waveforms are simulated
  or proxied from published/open sources, and every one is labelled as such.
- **Professional development:** a public appendix maps the work to UK-SPEC (CEng)
  and BOETT registration criteria, once both are verified against current text.

## Reproducibility (layers, each usable alone)

1. PDF attached to each release (no software).
2. Macro-free `.xlsx` workbook; no dynamic arrays or LAMBDA, so Excel 2016+ and
   LibreOffice behave the same.
3. Explorer: one self-contained HTML file, plain JS, libraries vendored.
4. Python 3.12 pinned with uv (`uv.lock`); minimal dependencies; all outputs
   committed, so nobody has to run anything to read the note.
5. OpenDSS `.dss` text models; OpenDSSDirect.py added at the validation stage.

Rules: the manuscript never executes code at build time. Golden values in
`data/golden/` must be reproduced by the workbook, the explorer and the
Python code. A monthly CI run re-checks everything.

Tooling: Typst 0.15.0, written directly (no Quarto). Layout styled after vendor
application notes: two body columns, a left caption column, Fira Sans and Fira
Math, line-work figures drawn with CeTZ. Fonts and Typst packages are stored in
the repo. Overleaf is not used: GitHub sync is a paid feature, and the
manuscript must live in the repo.

## Phases (about 4–5 hours a week, ~20 weeks to v1.0)

| Version | Weeks | Content |
|---|---|---|
| v0.1 | 1–4 | Scaffold, full outline, Ch 1–2 drafted, 208 V evidence log started |
| v0.2 | 5–8 | Ch 3 (phasors and math), Ch 5 (208 V question), workbook v0.1 |
| v0.3 | 9–12 | Ch 4 (open delta), Ch 6–7 (worked examples) |
| v0.4 | 13–16 | Ch 8 (common issues), Ch 9 (waveforms), explorer |
| v0.5 | 17–20 | Ch 10 (Caribbean), Ch 11 (OpenDSS validation), Appendix C |
| v1.0 | — | Tagged release, optional Zenodo DOI, optional webinar |

In parallel: add high-leg mode to the panel schedule tool.

## Division of work

- **Shankar:** writes the engineering: derivations, chapter text, worked
  examples, the 208 V investigation. Owns authorship and every final
  engineering statement.
- **Claude:** guides and reviews, asks before producing work, checks sources
  and citations, and handles tooling (layout, build, CI) on request.
