# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow
the roadmap milestones (v0.1, v0.2, ...).

## [Unreleased]

### Added
- Repository scaffold: Typst manuscript with a vendor-style layout, bundled
  fonts and vendored Typst packages, uv-pinned Python environment, MIT and
  CC BY 4.0 licences, CITATION.cff, CI and release workflows.
- Full manuscript outline (preface, 11 chapters, 4 appendices).
- Base-case load lists for the restaurant and SWRO plant examples.
- Golden values for the headline shortcut errors, with tests.
- Verification log (Appendix D).
- Phasor scratchpad notebook (`notebooks/01_phasor_scratchpad.ipynb`) with the
  derivation of the high-leg voltage, V_BN = 120√3 ∠−90° V.
- Figure script (`notebooks/hl_figures.py`) generating, in IEEE style:
  the high-leg phasor diagram, a wye vs high-leg delta comparison, and
  line-to-neutral and line-to-line waveforms over one cycle.
- TikZ figure of a closed-delta bank of three pole-mounted transformers with a
  floating-wye primary.
- Section 3.2, *Voltage phasors in a closed delta with a centre tap*, drafted
  (LaTeX, snapshot in `manuscript-tex/`).

### Changed
- Drafting moved from Typst to LaTeX on Overleaf; the source is snapshotted
  into `manuscript-tex/` at each milestone. The final layout is decided at v0.3.
- Branches: `main` holds only what is in active use, `dev` is the working
  branch, and `future` keeps the full original scaffold.
- Moved to the `future` branch: `manuscript/` (Typst), `explorer/`, `models/`,
  `examples/`, `workbook/`, `scripts/`, `vendor/`.
- CI now runs the golden-value tests only (on every push and monthly); the
  Typst PDF build is no longer part of CI on `main`.

### Removed
- Release workflow from `main` (it built the Typst PDF). It is kept on
  `future` and will be replaced with a LaTeX build at v1.0.

### Fixed
- Removed Windows `:Zone.Identifier` metadata files that stopped the repo
  cloning on Windows, and ignored them in `.gitignore`.
