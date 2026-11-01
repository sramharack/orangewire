"""The golden values must match what the helpers compute today."""

import csv
from pathlib import Path

import pytest

from orangewire import line_current, shortcut_current

GOLDEN = Path(__file__).resolve().parents[1] / "data" / "golden" / "headline_errors.csv"


def rows():
    with GOLDEN.open() as f:
        return list(csv.DictReader(f))


@pytest.mark.parametrize("row", rows(), ids=lambda r: r["case"])
def test_golden(row):
    s, v, p = float(row["s_va"]), float(row["v_ll"]), int(row["poles"])
    assert line_current(s, v, p) == pytest.approx(float(row["true_a"]), abs=1e-4)
    assert shortcut_current(s, p) == pytest.approx(float(row["shortcut_a"]), abs=1e-4)
    assert shortcut_current(s, p) / line_current(s, v, p) == pytest.approx(
        float(row["ratio"]), abs=1e-4
    )


def test_headline_percentages():
    # Roadmap claims: +15.5 % (3-pole on 240 V delta), -13.3 % (2-pole on 208Y)
    r = {row["case"]: float(row["ratio"]) for row in rows()}
    assert (r["three_pole_240_delta"] - 1) * 100 == pytest.approx(15.47, abs=0.01)
    assert (r["two_pole_208_wye"] - 1) * 100 == pytest.approx(-13.33, abs=0.01)
    assert r["two_pole_240_delta"] == pytest.approx(1.0)
