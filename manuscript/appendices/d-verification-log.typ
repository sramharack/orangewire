#import "../style.typ": *

= Verification log <app-verification>

Every code citation, number and external source used in the note. *Unverified:* candidate, not yet checked against the primary source. *Found:* source located, content not yet checked in full. *Verified:* checked against the primary source (by whom, when). *Rejected:* checked and not usable (reason given).

#let row-rule = table.hline(stroke: 0.3pt + hair)

#place(top, scope: "parent", float: true, clearance: 6mm)[
#figure(kind: table, caption: [Code citations (NEC 2023).],
  table(columns: (auto, auto, 1fr, auto, auto),
    table.hline(stroke: 1.2pt + ow-orange),
    table.header([ID], [Citation], [Used for], [Status], [Checked by / date]),
    table.hline(stroke: 0.5pt + hair),
    [C01], [110.15], [High-leg marking], [unverified], [],
    row-rule, [C02], [230.56], [Service conductor with higher voltage to ground], [unverified], [],
    row-rule, [C03], [215.12, 210.5], [Feeder and branch identification], [unverified], [],
    row-rule, [C04], [408.3(E)(1)], [Phase B arrangement], [unverified], [],
    row-rule, [C05], [408.3(F)(1)], [High-leg field marking], [unverified], [],
    row-rule, [C06], [240.85], [Slash-rated breakers], [unverified], [],
    row-rule, [C07], [220.61], [Neutral load], [unverified], [],
    row-rule, [C08], [Article 242], [Surge protective devices], [unverified], [],
    row-rule, [C09], [220.56], [Kitchen equipment demand], [unverified], [],
    row-rule, [C10], [220.88], [Optional calculation, new restaurants], [unverified], [],
    row-rule, [C11], [430.250, 430.24], [Motor FLC; motor feeders], [unverified], [],
    table.hline(stroke: 0.5pt + hair),
  ))
]

#place(top, scope: "parent", float: true, clearance: 6mm)[
#figure(kind: table, caption: [External sources.],
  table(columns: (auto, 1fr, 1fr, auto, 1fr),
    table.hline(stroke: 1.2pt + ow-orange),
    table.header([ID], [Source], [Claim used], [Status], [Note]),
    table.hline(stroke: 0.5pt + hair),
    [S01], [Moyer Diebel Nexus DHT dishwasher listing (retailer page)], [Booster 7.5 kW at 208 V, 10.0 kW at 240 V], [found], [Confirm against the manufacturer's spec sheet],
    row-rule, [S02], [Infield (2002), _Desalination_ 153], [Small SWRO below 3.5 kWh/m³], [found], [Peer-reviewed; abstract checked],
    row-rule, [S03], [Energy Recovery Inc. case study, Red Sea resort plants], [2.7 kWh/m³ after ERD retrofit], [found], [Vendor case study; indicative only],
    row-rule, [S04], [Energy Recovery Inc. case study, Sharm El-Sheikh hotel], [500 m³/day hotel plant], [found], [Vendor case study],
    row-rule, [S05], [Fluke 1750 datasheet], [Analyser setups include high leg and open leg], [found], [Manufacturer datasheet],
    row-rule, [S06], [Kersting, IEEE Trans. Industry Applications (four-wire delta banks)], [Prior work on motor plus lighting loads], [found], [Full papers not yet read],
    row-rule, [S07], [IEEE Four-Wire Delta Test Feeder], [Validation benchmark], [found], [Locate the official data set],
    row-rule, [S08], [Mike Holt forum threads on high-leg loads], [Practice evidence for Chapter 5], [found], [Code each post per the Chapter 5 method],
    row-rule, [S09], [Wikipedia: "High-leg delta"], [Manufacturer guidance of 5 % high-leg-to-neutral loading], [found], [Trace to the original manufacturer document before use],
    table.hline(stroke: 0.5pt + hair),
  ))
]

#figure(kind: table, caption: [Golden values.],
  table(columns: (auto, 1fr, 1fr),
    table.hline(stroke: 1.2pt + ow-orange),
    table.header([ID], [File], [Status]),
    table.hline(stroke: 0.5pt + hair),
    [G01], [`data/golden/headline_errors.csv`], [Checked by `tests/test_headline_errors.py`; needs author review],
    table.hline(stroke: 0.5pt + hair),
  ))
