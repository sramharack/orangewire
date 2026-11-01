// Closed delta bank feeding a panelboard. Line work only; the high leg is orange.
#import "@preview/cetz:0.5.3"
#import "../theme.typ": *

// Winding symbol: a row of semicircular humps from p to q.
#let winding(p, q, n: 4, side: 1, st: 0.9pt) = {
  import cetz.draw: *
  let (px, py) = p
  let (qx, qy) = q
  let L = calc.sqrt((qx - px) * (qx - px) + (qy - py) * (qy - py))
  let ux = (qx - px) / L
  let uy = (qy - py) / L
  let d = L / n
  let th = calc.atan2(ux, uy)
  for i in range(n) {
    let cx = px + (i + 0.5) * d * ux
    let cy = py + (i + 0.5) * d * uy
    arc((cx, cy), start: th + 180deg, delta: -side * 180deg, radius: d / 2, anchor: "origin", stroke: st)
  }
}

#let delta-bank(scale: 1) = cetz.canvas(length: 1cm * scale, {
  import cetz.draw: *
  let w = 0.8pt
  let A = (0, 3.2); let C = (0, 0); let N = (0, 1.6); let B = (2.77, 1.6)
  winding(A, N, n: 4, side: -1, st: w + ink)
  winding(N, C, n: 4, side: -1, st: w + ink)
  winding(A, B, n: 8, side: 1, st: w + ink)
  winding(B, C, n: 8, side: 1, st: w + ink)
  let px = 6.4
  line(A, (px, 3.2), stroke: w + ink)
  line(B, (px, 1.6), stroke: 1.5pt + ow-orange)
  line(C, (px, 0), stroke: w + ink)
  line(N, (-0.9, 1.6), (-0.9, -0.8), (px, -0.8), stroke: w + ink)
  line((-0.9, -0.8), (-0.9, -1.2), stroke: w + ink)
  for (i, half) in ((0, 0.26), (1, 0.16), (2, 0.07)) {
    line((-0.9 - half, -1.2 - i * 0.11), (-0.9 + half, -1.2 - i * 0.11), stroke: w + ink)
  }
  for p in (A, C, N) { circle(p, radius: 0.055, fill: ink, stroke: none) }
  circle(B, radius: 0.075, fill: ow-orange, stroke: none)
  let t(c, fill: ink, size: 8pt, weight: "semibold") = text(size: size, weight: weight, fill: fill, c)
  content((-0.32, 3.3), t[A], anchor: "south-east")
  content((-0.32, -0.1), t[C], anchor: "north-east")
  content((-0.6, 1.66), t[N], anchor: "south")
  content((2.95, 1.68), t(fill: ow-orange)[B], anchor: "south-west")
  content((-0.4, 2.45), t(fill: grey, size: 6.5pt, weight: "regular")[T1], anchor: "east")
  content((1.15, 2.95), t(fill: grey, size: 6.5pt, weight: "regular")[T2], anchor: "south-east")
  content((1.15, 0.25), t(fill: grey, size: 6.5pt, weight: "regular")[T3], anchor: "north-east")
  content((4.6, 1.6), t(fill: ow-orange, size: 6.5pt, weight: "regular")[high leg], anchor: "south", padding: 0.08)
  rect((px, -1.2), (px + 1.3, 3.6), stroke: w + ink, radius: 0.04)
  content((px + 0.65, 3.75), t(fill: grey, size: 6pt, weight: "regular")[PANELBOARD], anchor: "south")
  for (y, c, f) in ((3.2, [A], ink), (1.6, [B], ow-orange), (0, [C], ink), (-0.8, [N], ink)) {
    circle((px, y), radius: 0.055, fill: f, stroke: none)
    content((px + 0.2, y), t(fill: f, c), anchor: "west")
  }
})
