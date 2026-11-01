#import "../style.typ": *

= Reproducing this note <app-reproducing>

You do not need to run anything to use this note. Each layer below works on its own, so if one stops working in a few years the others still do.

+ *Read:* the PDF attached to each tagged release.
+ *Check by hand:* the workbook in `workbook/`. Excel 2016+ or LibreOffice; no macros, no dynamic arrays, no LAMBDA.
+ *Explore:* `explorer/index.html` in any browser, offline.
+ *Regenerate numbers:* Python 3.12 pinned with uv (`uv sync`, then `uv run pytest`).
+ *Validate:* OpenDSS models in `models/`.

== Building the PDF
The manuscript is written in Typst. Install Typst 0.15.0 (one program, no other dependencies) and run `./scripts/build.sh` from the repository root. The fonts (Fira Sans and Fira Math) and the Typst packages the manuscript uses are stored in the repository, so the build works offline and gives the same result on every machine.

== Golden values
Reference numbers live in `data/golden/`. The workbook, the explorer and the Python code must all reproduce them.
