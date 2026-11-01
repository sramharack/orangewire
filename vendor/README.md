# Vendored Typst packages

Exact copies of the Typst packages the manuscript imports, so the PDF builds
offline and keeps building if the package server ever changes. The build
script points Typst here with `--package-path vendor/typst-packages`.

| Package | Version | Licence | Source |
|---|---|---|---|
| cetz | 0.5.3 | LGPL-3.0-or-later | https://github.com/cetz-package/cetz |
| oxifmt | 1.0.0 | MIT or Apache-2.0 | https://github.com/PgBiel/typst-oxifmt (dependency of cetz) |

The cetz gallery and manual were removed to save space; nothing else was changed.
