// Beyond the Orange Wire — application note OW-AN 001.
// Build from the repository root with ./scripts/build.sh
#import "theme.typ": *
#import "style.typ": *
#import "figures/delta-bank.typ": delta-bank

#let doc-code = "OW-AN 001"
#let edition = "Edition 0.1 · Draft"

#set document(title: "Beyond the Orange Wire", author: "Shankar Ramharack")

// ---------- cover ----------
#page(margin: (left: 22mm, right: 18mm, top: 20mm, bottom: 18mm), header: none, footer: none)[
  #set text(font: "Fira Sans", fill: ink)
  #grid(columns: (1fr, auto),
    text(size: 7.5pt, tracking: 0.12em, fill: grey)[APPLICATION NOTE],
    text(size: 7.5pt, tracking: 0.12em, fill: grey)[#upper(doc-code) · #upper(edition)])
  #v(16mm)
  #text(size: 38pt, weight: "semibold", tracking: -0.01em)[Beyond the \ Orange Wire]
  #v(5mm)
  #line(length: 28mm, stroke: 3pt + ow-orange)
  #v(5mm)
  #block(width: 120mm, text(size: 14pt, weight: "light", fill: grey)[Designing, loading and troubleshooting high-leg and open-delta services])
  #v(12mm)
  #align(center, delta-bank(scale: 1.35))
  #v(1fr)
  #grid(columns: (1fr, 1fr), column-gutter: 12mm,
    [
      #text(size: 7.5pt, weight: "semibold", tracking: 0.08em, fill: ow-orange)[THIS NOTE COVERS]
      #v(1mm)
      #set text(size: 8.5pt)
      #set list(marker: text(fill: ow-orange)[–])
      - One design method for the closed (high-leg) and open delta
      - Worked examples: a restaurant and a 250 m³/day SWRO plant
      - NEC 2023 references, each checked and logged
    ],
    [
      #text(size: 7.5pt, weight: "semibold", tracking: 0.08em, fill: ow-orange)[AUTHOR]
      #v(1mm)
      #text(size: 10pt, weight: "semibold")[Shankar Ramharack] \
      #text(size: 8.5pt, fill: grey)[Author biography goes here: two or three lines on background and experience.]
    ],
  )
  #v(6mm)
  #line(length: 100%, stroke: 0.5pt + hair)
  #v(2mm)
  #text(size: 7pt, fill: grey)[Text and figures: CC BY 4.0. Code: MIT. This note does not replace the adopted electrical code, the authority having jurisdiction, the serving utility's requirements or manufacturers' instructions.]
]

// ---------- body ----------
#show: app-note.with(code: doc-code, edition: edition)

#outline(title: [Contents], depth: 2)

#set heading(supplement: [Chapter])

#include "chapters/00-preface.typ"
#include "chapters/01-what-and-when.typ"
#include "chapters/02-high-leg-nec.typ"
#include "chapters/03-phasors-math.typ"
#include "chapters/04-open-delta.typ"
#include "chapters/05-the-208v-question.typ"
#include "chapters/06-restaurant.typ"
#include "chapters/07-swro-plant.typ"
#include "chapters/08-common-issues.typ"
#include "chapters/09-waveforms.typ"
#include "chapters/10-caribbean.typ"
#include "chapters/11-validation.typ"

#bibliography("refs.bib", title: [References], full: true)

// ---------- appendices ----------
#counter(heading).update(0)
#set heading(numbering: "A.1", supplement: [Appendix])
#include "appendices/a-notation.typ"
#include "appendices/b-reproducing.typ"
#include "appendices/c-professional-development.typ"
#include "appendices/d-verification-log.typ"
