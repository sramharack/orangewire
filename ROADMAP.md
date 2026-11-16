# Roadmap: Beyond the Orange Wire (updated 2026-11-16)

Replaces the 2026-10-31 roadmap.

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
- **Journal paper:** possibly carved out later (IEEE Transactions on Industry
  Applications is the natural venue); decide around v0.3.

## Tooling (changed 2026-11-02)

- **Drafting:** LaTeX on Overleaf, plain arXiv-style article. Typst was
  overkill while the content is being written. Overleaf's GitHub sync is a paid
  feature, so the source is downloaded and committed to `manuscript-tex/` at
  each milestone; that keeps a dated history in the repo.
- **Final layout:** the vendor application-note look (two body columns, a left
  caption column, line-work figures, styled after ABB, Schneider and Eaton
  notes) is decided at about v0.3, once there is real content. Either the LaTeX
  is styled to match, or the text moves to Typst. The original Typst layout is
  kept on the `future` branch.
- **Figures:** data figures (phasor diagrams, waveforms) are generated in
  Python from `notebooks/` into `figures/`, in IEEE style (Times-like fonts,
  column-width sizing, PDF output). Line drawings (transformer banks, winding
  connections) are drawn in TikZ and committed as source plus PDF. One colour
  per line throughout; B, the high leg, is always orange.
- **Environment:** Python 3.12 pinned with uv (`uv.lock`); packages added with
  `uv add` only. CI runs the golden-value tests on every push and monthly.

## Branches

- `main`: only what is in active use; updated from `dev` at milestones.
- `dev`: day-to-day work.
- `future`: frozen snapshot of the original scaffold (Typst manuscript and
  layout, explorer, OpenDSS models, workbook, example load lists, build scripts,
  vendored packages, release workflow). Each part is restored to `dev` when its
  phase starts.

## Reproducibility (layers, each usable alone)

1. PDF attached to each release (no software).
2. Macro-free `.xlsx` workbook; no dynamic arrays or LAMBDA, so Excel 2016+ and
   LibreOffice behave the same. *(On `future` until v0.2.)*
3. Explorer: one self-contained HTML file, plain JS, libraries vendored.
   *(On `future` until v0.4.)*
4. Python 3.12 pinned with uv; minimal dependencies; all outputs, including
   figures, committed, so nobody has to run anything to read the note.
5. OpenDSS `.dss` text models; OpenDSSDirect.py added at the validation stage.
   *(On `future` until v0.5.)*

Rules: the manuscript never executes code at build time. Golden values in
`data/golden/` must be reproduced by the workbook, the explorer and the
Python code.

## Phases (about 4–5 hours a week)

| Version | Content | Status |
|---|---|---|
| v0.1 | Scaffold, full outline, Ch 1–2 drafted, 208 V evidence log started | Scaffold and outline done. Drafting started with Ch 3 instead: 3.2 drafted |
| v0.2 | Ch 3 (phasors and math), Ch 5 (208 V question), workbook v0.1 | 3.2 done; 3.3 (currents) next |
| v0.3 | Ch 4 (open delta), Ch 6–7 (worked examples); decide final layout and journal paper | — |
| v0.4 | Ch 8 (common issues), Ch 9 (waveforms), explorer | — |
| v0.5 | Ch 10 (Caribbean), Ch 11 (OpenDSS validation), Appendix C | — |
| v1.0 | Tagged release, optional Zenodo DOI, optional webinar | — |

In parallel: add high-leg mode to the panel schedule tool.

## Next up

1. **Section 3.3, currents:** why "phase VA ÷ 120" overstates 3-pole loads by
   about 15%, and what the neutral actually carries. Same notebook approach as
   3.2.
2. **Figure backlog:**
   - open-delta bank (two cans, open-wye primary);
   - padmount option with a centre-tapped delta secondary (planning note in 3.2);
   - typical connection designations (H1/H2, X1/X2/X3);
   - grounded-wye primary on a closed delta, as a what-not-to-do figure;
   - panel and meter view with the orange B bus.
3. **To verify before captioning:** primary connections used by the local
   utility (BL&P, T&TEC); padmount high-leg terminal marking; NEC 110.15 and
   408.3(E), including the meter-socket exception.

## Division of work

- **Shankar:** writes the engineering: derivations, chapter text, worked
  examples, the 208 V investigation. Owns authorship and every final
  engineering statement, and checks every number in every figure.
- **Claude:** guides and reviews, asks before producing work, checks sources
  and citations, draws figures from Shankar's numbers on request, and handles
  tooling (LaTeX, figures, environment, CI, git) on request.
