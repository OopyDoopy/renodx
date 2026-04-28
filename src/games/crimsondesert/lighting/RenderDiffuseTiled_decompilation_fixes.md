# RenderDiffuseTiled Decompilation Fixes

Tracks control flow bugs found in decompiled RenderDiffuseTiled shaders and the fixes applied.
Reference the disassembly at `dump/RenderDiffuseTiled_0xE6F4C69F_disasm.txt` as ground truth.

---

## Fix 1: Stencil 66 hair — phi-node merge flattening (0xE6F4C69F)

**Symptom:** Hair appears overly plastic with a monochromatic white specular blob instead of colored Marschner iridescence/rainbow shine.

**Root cause:** The decompiler flattened a multi-target branch that skips the GGX/cloth directional light block for stencil 66 hair pixels. In the DXIL:

```
; After computing Marschner scattering at block %3654:
br i1 %3636, label %4343, label %3925
; %3636 = (_3524 == 66)
; Stencil 66 jumps DIRECTLY to %4343, skipping the entire GGX/cloth block
```

The decompiler linearized this into sequential `if/else` where stencil 66 falls through into the GGX block (`if (!_3637)` only guards stencil 54). The GGX block overwrites `_4344` (the hair scattering result) with `_3926` (which was 0 for stencil 66 due to a phi-split into separate variables).

**Fix applied (two parts):**

1. In the stencil 66 branch of the first Marschner computation (~line 4116), duplicate the scattering result into both `_4344` and `_3926` variable sets so downstream code gets the correct values regardless of which variable it reads:

```hlsl
} else {
    _4344 = _3913; _4345 = _3914; ... _4352 = _3906;
    _3926 = _3913; _3927 = _3914; ... _3934 = _3906;  // ADDED
}
```

2. Guard the GGX/cloth block with `_3636` so stencil 66 skips it entirely, matching the DXIL's direct jump to `%4343`:

```hlsl
// BEFORE (broken):
if (_3936) {
    // GGX path — overwrites _4344 for stencil 66
} else {
    // cloth path
}

// AFTER (fixed):
if (_3636) {
    // Stencil 66: pass through Marschner values, skip GGX/cloth
    _4344 = _3926; ... _4352 = _3934;
} else if (_3936) {
    // GGX path (unchanged)
} else {
    // cloth path (unchanged)
}
```

**Affected shaders:** `0xE6F4C69F` (new binding layout, extended variant). Check `0x9C8EEC3F` (old binding layout, extended variant) for the same issue if it gets re-decompiled.

**How to verify:** With the fix applied, hair should show colored iridescent specular highlights matching the vanilla shader. Without the fix, hair has a white/monochromatic GGX blob.

---

## Fix 2: `__branch_chain_1829` — phi overwrite (0xE6F4C69F)

**Symptom:** Subtle — affects `_1836` for stencils outside 11-19 and 105-106 ranges.

**Root cause:** The decompiler's `__branch_chain_1829` pattern unconditionally overwrites `_1836 = _175` for all paths where `__branch_chain_1829 = true`, but the DXIL phi `%1836 = phi i1 [ false, %1832 ], [ %175, %1829 ]` only sets `_175` for the stencil 105/106 path. All other stencils should get `false`.

**Fix:** Remove the `if (__branch_chain_1829) { _1836 = _175; }` block. The `_1836` value is already correctly set in the branches above.

**Impact:** Low for hair specifically (doesn't change output for stencil 66), but incorrect for other stencils where `_1838` could be wrong.

---

## General notes

- Always keep the disassembly (`_disasm.txt`) alongside decompiled shaders
- When two decompilers produce different results (one breaks hair, the other breaks snow), the bug is in the control flow reconstruction, not the math
- The dump folder decompiler uses `do { } while(false)` + `switch(__phi_sel_N)` patterns; the lighting folder decompiler uses `if/else` + `__branch_chain_*` booleans — both can have errors
- For material-routing shaders, trace every stencil value through the DXIL CFG and verify the decompiled path matches
