# Industrial example: 250 m³/day SWRO plant on open delta (base case)

Designed from scratch; no client data. Hotel or small-community seawater
reverse-osmosis plant with a pressure-exchanger energy-recovery device, on a
utility 120/240 V open-delta service. About 30 kW running.

## Sanity check on the high-pressure pump (author to verify)

With a pressure exchanger, the high-pressure pump handles roughly the permeate
flow: 250 m³/day ≈ 10.4 m³/h at about 60 bar.

- Hydraulic power ≈ (10.4 / 3600) m³/s × 57 × 10⁵ Pa ≈ 16.5 kW
- Shaft and motor losses → about 22 kW (30 hp) at the motor
- ≈ 2.1 kWh/m³ for this pump; ≈ 2.9 kWh/m³ for the whole plant, inside the
  published 2.7–3.5 kWh/m³ range for small plants with energy recovery
  (see the verification log, sources S02–S03).

## Load list

| Load | Rating | Starting / drive | What it demonstrates |
|---|---|---|---|
| High-pressure pump | 30 hp (~22 kW) | VFD | Drive on open delta: unbalance, harmonics, phase-loss trip |
| Seawater intake (beach well) pump | 7.5 hp | Soft starter | Motor starting on a weak bank |
| Media filter feed pump | 5 hp | Direct on line | Single-phasing risk |
| Pressure-exchanger booster | 3 hp | VFD | Second drive |
| Product transfer pumps | 2 × 5 hp, duty/standby | Direct on line | Standby logic |
| Membrane cleaning (CIP) pump | 3 hp | Direct on line, intermittent | Non-coincident load |
| Dosing pumps (×3), UV, analysers | small | 120 V | Light single-phase load |
| PLC/SCADA panel with UPS | ~1.5 kVA | 120 V | Critical controls |
| Control building: lighting, receptacles, split AC, exhaust fan | small | 120 V and 240 V 2-pole | General building load |
