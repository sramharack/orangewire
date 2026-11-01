#import "../style.typ": *

= What a four-wire delta is, and when to use it <sec-what-when>
#status[outline · drafting in v0.1]

== The three services you will meet
#plan[
  - 120/208Y: the reference point most designers know.
  - 120/240 V closed (high-leg) delta: three transformers, one centre-tapped.
  - 120/240 V open delta: two transformers, one centre-tapped.
  - 240 V three-wire delta (no neutral) for context.
]

== Where the high leg comes from
#plan[
  - The centre-tapped lighting transformer and the neutral.
  - Why one phase sits at about 208 V to neutral (derived in @sec-phasors).
  - Trade names: high leg, wild leg, stinger leg, red leg; orange marking.
]

== Prior work
#plan[
  - IEEE Transactions on Industry Applications papers on four-wire delta banks serving motor and lighting loads.
  - The IEEE Four-Wire Delta Test Feeder.
  - What this note adds.
]

== Where you still find it
#plan[
  - Legacy utility practice; light industrial and rural services.
  - Motor-heavy loads with a small amount of 120 V load.
  - Caribbean utilities (detail in @sec-caribbean).
]

== Choosing between four-wire delta and 120/208Y
#plan[
  Decision table, criterion by criterion:
  - share of three-phase motor load vs 120 V load;
  - 240 V single-phase equipment vs 208 V equipment;
  - what the serving utility actually offers;
  - PV and battery inverter compatibility;
  - standby generator and transfer switch selection;
  - panelboard and breaker availability and cost;
  - risk of a future utility conversion to wye;
  - maintenance and labelling risk over the life of the building.
]

== When open delta makes sense
#plan[
  - Mostly three-phase load, light single-phase load, cost or capacity constraints.
  - When to ask the utility for a closed bank instead.
]

== What this note does not cover
#plan[
  - Medium-voltage design, utility primary protection, corner-grounded delta (mentioned only for contrast).
]
