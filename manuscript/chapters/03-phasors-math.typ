#import "../style.typ": *

= Phasors and the math of four-wire delta <sec-phasors>
#status[outline · drafting in v0.2]

== Conventions
#plan[- Phase sequence, reference phasor, sign conventions, per-unit choices.]

== Voltage phasors in a closed delta with a centre tap
#plan[
  - Line-to-line and line-to-neutral voltages; the geometry of the high leg.
  - Scaling to 115/230 V supply.
]

== Line currents for each kind of load
#plan[
  - 120 V loads (A–N, C–N).
  - 240 V two-pole loads on each phase pair (A–B, B–C, C–A).
  - 240 V three-pole loads.
  - Superposition for a whole panel.
]

== Why "phase VA ÷ 120" fails
#plan[
  - Exact error for three-pole loads on 240 V delta (+15.5 %).
  - Exact error for two-pole loads on 120/208Y (−13.3 %).
  - Two-pole loads on 240 V delta: the shortcut is exact.
  - A correct per-line method that still fits a spreadsheet.
  - Golden values: `data/golden/headline_errors.csv`.
]

== Phasor sum vs magnitude sum
#plan[- How conservative magnitude summation is under mixed loads.]

== Neutral current

== Loading the utility bank
#plan[- Lighting transformer vs power transformer loading under mixed loads.]

== Voltage unbalance definitions
#plan[- NEMA and IEC definitions and how they differ (to be verified).]
