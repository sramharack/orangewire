"""Regenerate data/golden/headline_errors.csv. Run: uv run python scripts/make_golden.py"""

import csv
from pathlib import Path

from orangewire import line_current, shortcut_current

CASES = [
    # case, system, v_ll, poles
    ("three_pole_240_delta", "120/240 V delta", 240.0, 3),
    ("two_pole_208_wye", "120/208Y", 208.0, 2),
    ("two_pole_240_delta", "120/240 V delta", 240.0, 2),
]
S_VA = 1000.0

out = Path(__file__).resolve().parents[1] / "data" / "golden" / "headline_errors.csv"
with out.open("w", newline="") as f:
    w = csv.writer(f, lineterminator="\n")
    w.writerow(["case", "system", "v_ll", "poles", "s_va", "true_a", "shortcut_a", "ratio"])
    for case, system, v_ll, poles in CASES:
        true_a = line_current(S_VA, v_ll, poles)
        short_a = shortcut_current(S_VA, poles)
        w.writerow([case, system, v_ll, poles, S_VA,
                    f"{true_a:.4f}", f"{short_a:.4f}", f"{short_a / true_a:.4f}"])
print(f"wrote {out}")
