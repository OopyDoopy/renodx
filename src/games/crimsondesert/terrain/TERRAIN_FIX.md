# TerrainMesh_0x0147674F.ps_6_6.hlsl — Decompilation Fixes

Base shader: raw DXC decompilation of `TerrainMesh_0x0147674F` (ps_6_6)
Disassembly reference: `TerrainMesh_0x0147674F_disasm.txt`

---

## 1. ConstantBuffer name collision (Pitfall #14)

**2 sites**

The decompiler gave the wrapper struct type and the `ConstantBuffer` variable the same name, creating an ambiguous reference that prevents compilation.

```hlsl
// BEFORE — compile error: ambiguous reference
struct BindlessParameters_MaterialOverrideParameters {
  MaterialOverrideParametersStruct BindlessParameters_MaterialOverrideParameters;
};
ConstantBuffer<BindlessParameters_MaterialOverrideParameters> BindlessParameters_MaterialOverrideParameters[] : register(b0, space101);

struct BindlessParameters_TerrainMeshParameters {
  TerrainMeshParametersStruct BindlessParameters_TerrainMeshParameters;
};
ConstantBuffer<BindlessParameters_TerrainMeshParameters> BindlessParameters_TerrainMeshParameters[] : register(b0, space100);

// AFTER — struct types renamed with _t suffix, variable and member names unchanged
struct BindlessParameters_MaterialOverrideParameters_t { ... };
ConstantBuffer<BindlessParameters_MaterialOverrideParameters_t> BindlessParameters_MaterialOverrideParameters[] : register(b0, space101);

struct BindlessParameters_TerrainMeshParameters_t { ... };
ConstantBuffer<BindlessParameters_TerrainMeshParameters_t> BindlessParameters_TerrainMeshParameters[] : register(b0, space100);
```

---

## 2. Quaternion NaN — division by zero (Pitfall #14 from reference terrain shader)

**4 quaternion sites + 2 displacement gradient normalization sites = 6 total**

The tile-breaker rotation and detail normal blend use a quaternion-from-two-vectors construction where `sqrt((dot+1)*2)` is the denominator. When the two normals are antiparallel (dot ≈ -1), the denominator is zero, producing NaN that propagates through the entire GBuffer output. The displacement gradient normalization has the same issue when the gradient is zero-length.

Each site appears twice because the shader has two duplicated code paths (the `_993`/terrain-blend path and the `!_991` fallthrough path).

```hlsl
// Displacement gradient normalization (2 sites)
// BEFORE
_1429 = rsqrt(_1428);
// AFTER
_1429 = rsqrt(max(_1428, 1e-12f)); // NaN guard: zero displacement gradient

// Tile-breaker quaternion (2 sites)
// BEFORE
_1448 = sqrt(_1447);
// AFTER
_1448 = max(sqrt(_1447), 1e-6f); // NaN guard: antiparallel normals -> div-by-zero

// Detail normal blend quaternion (2 sites)
// BEFORE
_1620 = sqrt(_1619);
// AFTER
_1620 = max(sqrt(_1619), 1e-6f); // NaN guard: antiparallel normals -> div-by-zero
```

**Note:** The vanilla compiled bytecode of `0x0147674F` does not appear to trigger these NaN conditions in practice (likely due to upstream data changes by Pearl Abyss), but the vulnerability is latent in the code. DXC recompilation with different `fast` math optimization decisions could re-expose the singularity. The guards are zero-cost insurance (single `max` instruction each).

---

## 3. NaN safety net at GBuffer output

**1 site (end of shader)**

Catches any remaining NaN from upstream math before writing to render targets. Writes neutral gray base color (128,128) and up-facing normal as a safe fallback. Position and height outputs are preserved since they don't depend on the NaN-prone normal/color paths.

```hlsl
// BEFORE — direct output, NaN propagates to GBuffer
SV_Target.x = _1820;
...

// AFTER — NaN check before output
if (any(isnan(float4(float(_1794), float(_1795), float(_1796), 0)))
 || any(isnan(float3(_1729, _1730, _1731)))) {
    // Safe fallback: neutral gray base color, up-facing normal
    SV_Target.x = min(65535u, (128u << 8) | 128u);
    SV_Target.y = min(65535u, (128u << 8) | 0u);
    SV_Target.z = min(65535u, (128u << 8) | 0u);
    SV_Target.w = _1950;
    ...
    return output_signature;
}
SV_Target.x = _1820;
...
```

---

## 4. Broken inner VT clipmap lookup loop (Pitfall #4)

**2 sites**

This was the primary visual bug — terrain appeared washed out with wrong virtual texture sampling, as if SSDM wasn't applying and the virtual texturing was broken.

### Root cause

The shader has a binary search that displaces the virtual texture sample position along the view direction. Inside each binary search iteration, there is an inner loop that walks through virtual texture clipmap levels (0–7) to find the finest level with valid tile data for the displaced position.

The DXIL has this inner loop at labels `%260`→`%310`→`%260` with a back-edge when `%314 = icmp ult i32 %313, 8` is true. The decompiler reconstructed it as:

```hlsl
// BROKEN — loop body executes exactly once
while(true) {
    // ... clipmap level lookup ...
    do {
        if (outOfBounds) {
            // increment level, set __loop_continue_2 = true
            break;  // exits do-while(false)
        } else {
            // check tile data, maybe set __loop_continue_2 = true
            break;  // exits do-while(false)
        }
    } while(false);
    break;  // ← ALWAYS exits while(true), __loop_continue_2 is never checked
}
```

The unconditional `break;` after `} while(false);` exits the `while(true)` on every iteration regardless of `__loop_continue_2`. The VT lookup always uses the first clipmap level it tries, even if that level has no valid data. This produces wrong UVs → wrong texture samples → the washed-out/flat terrain appearance.

### Fix

Added the missing continue check before the unconditional break, matching the pattern used by the outer loops which were correctly reconstructed:

```hlsl
// FIXED — loop iterates through clipmap levels as intended
while(true) {
    // ... clipmap level lookup ...
    do {
        if (outOfBounds) { ...; __loop_continue_2 = true; break; }
        else { ...; __loop_continue_2 = true; break; }
    } while(false);
    if (__loop_continue_2) { __loop_continue_2 = false; continue; }  // ← ADDED
    break;
}
```

Applied to both inner VT lookup loops:
- `__loop_continue_2` — inside the SSDM-OFF binary search path (`if (_344)`)
- `__loop_continue_4` — inside the SSDM-ON binary search path (`if (_439)`)

### Verification

The DXIL confirms the loop structure:
```
; <label>:260          ; preds = %310, %259       ← loop header, receives back-edge from %310
  %263 = phi i32 [ %313, %310 ], [ %257, %259 ]   ← clipmap level counter
  ...
; <label>:310          ; preds = %303, %260
  %313 = add nuw nsw i32 %263, 1                   ← increment level
  %314 = icmp ult i32 %313, 8                      ← level < 8?
  br i1 %314, label %260, label %315               ← back-edge to %260 if true
```

The phi node at `%263` receives `%313` (incremented level) from `%310` and `%257` (initial level) from `%259`, confirming this is a real loop with iteration count up to 8.
