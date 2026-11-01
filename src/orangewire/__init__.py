"""Helpers for the *Beyond the Orange Wire* application note.

Kept deliberately small and dependency-free so the numbers can be checked by
hand. Figure scripts live in ``scripts/`` and may use numpy/matplotlib.
"""

import math

__all__ = ["line_current", "shortcut_current"]


def line_current(s_va: float, v_ll: float, poles: int) -> float:
    """Exact line-current magnitude for a single balanced load.

    poles = 2: single-phase load connected line to line, I = S / V_LL.
    poles = 3: balanced three-phase load, I = S / (sqrt(3) * V_LL).
    """
    if poles == 2:
        return s_va / v_ll
    if poles == 3:
        return s_va / (math.sqrt(3) * v_ll)
    raise ValueError("poles must be 2 or 3 (one-pole loads: use S / V_LN)")


def shortcut_current(s_va: float, poles: int, v_ln: float = 120.0) -> float:
    """The common spreadsheet shortcut: split VA equally across the poles,
    then divide each share by the line-to-neutral voltage."""
    return (s_va / poles) / v_ln
