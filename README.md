# Beyond the Orange Wire

**Designing, Loading and Troubleshooting High-Leg and Open-Delta Services**

An open application note on 120/240 V four-wire delta services: the closed
(high-leg) delta and the open delta. It covers the theory, the NEC 2023
requirements, the "208 V question", common field problems, and two worked
examples designed from scratch:

- **Commercial:** a casual-dining restaurant with an all-electric cooking line
  on a closed high-leg delta service.
- **Industrial:** a 250 m³/day seawater reverse-osmosis (SWRO) plant on a
  utility open-delta service.

> **Status:** v0.1 in progress. Outline complete; chapters are being drafted.
> Every code citation is tracked in the verification log (Appendix D) and is
> marked unverified until checked against the NEC 2023 text.

## Read it

The PDF is attached to each tagged release. Every push also builds a preview
PDF, available under the repository's Actions tab.

## What's in the repo

| Folder | Contents |
|---|---|
| `manuscript/` | Typst source: `main.typ`, layout (`style.typ`, `theme.typ`), chapters, appendices, figures |
| `fonts/` | Fira Sans and Fira Math (SIL Open Font License) |
| `vendor/` | Exact copies of the Typst packages the manuscript uses |
| `examples/` | Base-case load lists and worked-example data |
| `workbook/` | Macro-free Excel companion (opens in Excel and LibreOffice) |
| `explorer/` | Single-file interactive explorer (plain HTML/JS, no build step) |
| `models/` | OpenDSS models for validation |
| `src/orangewire/` | Small Python helpers used to generate figures and check numbers |
| `data/golden/` | Reference ("golden") values every tool must reproduce |
| `tests/` | Checks that the golden values still hold |

## Build the PDF

Install [Typst](https://typst.app) **0.15.0** (a single program), then from the
repository root:

```
./scripts/build.sh          # one-off build -> build/orangewire.pdf
./scripts/build.sh watch    # rebuild on every save
```

Fonts and packages are stored in the repo, so the build works offline and
gives the same result on every machine.

## Check the numbers

Python 3.12, pinned with [uv](https://docs.astral.sh/uv/):

```
uv sync
uv run pytest
```

## Licence

- Code (Python, scripts, workbook formulas, explorer, models, layout files): [MIT](LICENSE)
- Text and figures: [CC BY 4.0](LICENSE-text)
- Fonts: SIL Open Font License (see `fonts/`)
- Vendored Typst packages: their own licences (see `vendor/README.md`)

## Cite

See [CITATION.cff](CITATION.cff), or use GitHub's "Cite this repository" button.

## Disclaimer

This note is for education and engineering judgement. It is not a substitute
for the adopted electrical code, the authority having jurisdiction, the
serving utility's requirements, or manufacturers' instructions. The NEC 2023
is the reference code; check which edition (if any) is adopted where you work.

## Author

Shankar Ramharack
