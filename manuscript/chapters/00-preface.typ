#import "../style.typ": *

#heading(numbering: none)[Preface] <sec-preface>
#status[outline]

== Who this is for
#plan[
  - Practising designers and field engineers who meet 120/240 V four-wire delta services.
  - Students who want to understand them properly. Full derivations sit in @sec-phasors and Appendix A.
]

== What makes this note different
#plan[
  - One method for both the closed (high-leg) and the open delta.
  - Quantified errors in common shortcuts, such as the "phase VA ÷ 120" spreadsheet method.
  - An evidence-based answer to the 208 V question (@sec-208v).
  - Two worked examples designed from scratch: a restaurant and an SWRO plant.
  - Everything reproducible: workbook, browser explorer, Python and OpenDSS.
]

== Conventions
#plan[
  - Reference code: NFPA 70, National Electrical Code, 2023 edition @nfpa70_2023. Section numbers appear as "NEC 2023 xxx.xx".
  - Nominal voltage 120/240 V, 60 Hz, unless stated.
  - The high leg is phase B throughout (see @sec-nec).
  - Every code citation and external figure is listed in the verification log (Appendix D) with its status.
]
