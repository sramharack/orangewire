// Page layout for the application note.
// Two body columns, with a narrow left column for figure captions and notes.
#import "theme.typ": *

#let app-note(code: "", edition: "", body) = {
  set text(font: "Fira Sans", size: 9pt, fill: ink, lang: "en", region: "gb")
  show math.equation: set text(font: "Fira Math")
  set math.equation(numbering: "(1)")
  set par(leading: 0.62em, spacing: 0.95em, justify: false)
  set list(marker: text(fill: ow-orange)[–])

  set page(
    paper: "a4",
    margin: (left: 16mm + margin-col + gutter, right: 16mm, top: 26mm, bottom: 20mm),
    columns: 2,
    header: context {
      let n = counter(page).get().first()
      move(dx: -(margin-col + gutter), block(width: 100% + margin-col + gutter, {
        set text(size: 6.5pt, tracking: 0.08em, fill: grey)
        text(fill: ow-orange, weight: "semibold")[#n]
        h(6mm)
        text(weight: "semibold", fill: ink)[BEYOND THE ORANGE WIRE]
        [ #h(0.4em) APPLICATION NOTE #code]
      }))
    },
    footer: align(right, text(size: 6pt, fill: grey)[#edition]),
  )
  set columns(gutter: gutter)

  // Chapter headings: new page, full width, number in the margin column.
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    place(top, scope: "parent", float: true, block(width: 100%, below: 8mm, {
      move(dx: -(margin-col + gutter), grid(columns: (margin-col, gutter, 1fr),
        align(right + bottom, if it.numbering != none {
          text(size: 26pt, weight: "light", fill: ow-orange, context counter(heading).display(it.numbering))
        }),
        [],
        align(bottom, text(size: 20pt, weight: "semibold", it.body)),
      ))
      v(2mm)
      move(dx: -(margin-col + gutter), line(length: 100% + margin-col + gutter, stroke: 0.5pt + hair))
    }))
  }
  show heading.where(level: 2): it => block(above: 1.4em, below: 0.7em, sticky: true, {
    set text(size: 10.5pt, weight: "semibold")
    if it.numbering != none {
      text(fill: ow-orange, context counter(heading).display(it.numbering))
      h(0.6em)
    }
    it.body
  })
  show heading.where(level: 3): it => block(above: 1.2em, below: 0.6em, sticky: true,
    text(size: 9pt, weight: "semibold", style: "italic", it.body))

  // Figures: captions in the left margin column. Tables: caption above, in the column.
  set figure(gap: 0pt)
  show figure.caption: it => {
    set text(size: 7.5pt, fill: grey)
    set par(leading: 0.5em)
    text(weight: "semibold", fill: ow-orange)[#it.supplement #context it.counter.display(it.numbering)]
    linebreak()
    it.body
  }
  show figure: it => {
    if it.kind == image {
      block(width: 100%, above: 1.2em, below: 1.2em, {
        place(left + top, dx: -(margin-col + gutter), box(width: margin-col, {
          line(length: 6mm, stroke: 1.2pt + ow-orange)
          v(1.5mm)
          it.caption
        }))
        it.body
      })
    } else {
      block(width: 100%, above: 1.2em, below: 1.2em, { align(left, it.caption); v(2mm); it.body })
    }
  }

  // Tables: hairlines, no boxes.
  set table(stroke: none, inset: (x: 5pt, y: 4pt), align: left)
  show table.cell.where(y: 0): set text(weight: "semibold")
  show table: set text(size: 8pt)

  // Contents page
  show outline.entry.where(level: 1): set text(weight: "semibold")
  show outline.entry.where(level: 1): set block(above: 1.1em)

  body
}

// Full-width figure that floats to the top of the page.
// Usage: #wide-figure(caption: [...])[ body ] <fig-label>
#let wide-figure(body, caption: none) = place(top, scope: "parent", float: true, clearance: 6mm,
  figure(body, caption: caption, kind: image))

// Note in the left margin column. Use it only in the left body column.
#let margin-note(body) = place(left, dx: -(margin-col + gutter), box(width: margin-col, {
  set text(size: 7.5pt, fill: grey)
  body
}))

// Grey planning note. Replace with real text as each section is drafted.
#let plan(body) = block(width: 100%, inset: (left: 6pt), stroke: (left: 1.5pt + hair), {
  set text(size: 8pt, fill: grey)
  body
})

// Chapter status line.
#let status(body) = block(below: 1em, text(size: 7.5pt, tracking: 0.06em, fill: ow-orange, weight: "semibold")[STATUS: #upper(body)])
