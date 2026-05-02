# Terrain NaN Black Speckle Artifacts — Root Cause & Fix

## Symptom

Thousands of tiny black squares flickering across all terrain surfaces. Visible
on both flat and steep terrain, with and without SSDM/SPOM enabled. The speckles
move even when the camera is static and intensify during camera motion.

## Root Cause: Quaternion-from-Two-Vectors Division by Zero

The terrain pixel shader (`TerrainMesh_0x14E640B1.ps_6_6.hlsl`) uses a
quaternion rotation to blend the tile-breaker displaced normal with the surface
normal. The construction follows the standard "quaternion from two vectors"
formula:

```hlsl
dot_product = dot(surfaceNormal, displacedNormal);  // _1445
one_plus_dot = dot_product + 1.0;                    // _1446
sqrt_term = sqrt(one_plus_dot * 2.0);                // _1448
quat.xyz = cross(surfaceNormal, displacedNormal) / sqrt_term;  // DIVISION
quat.w = one_plus_dot / sqrt_term;                              // DIVISION
```

**When the displaced normal is antiparallel to the surface normal** (dot ≈ -1),
`one_plus_dot` approaches 0, `sqrt_term` becomes 0, and the division produces
NaN. This NaN propagates through the entire quaternion rotation, corrupting the
output normal, base color, roughness, metallic, and height values.

The same pattern exists in two places:
1. **Tile-breaker normal rotation** (lines ~3746, ~4445) — `_1448 = sqrt(...)`
2. **Detail normal blending** (lines ~3918, ~4617) — `_1620 = sqrt(...)`

Each appears twice because the decompiled shader duplicates the code for two
control flow branches.

### Why It Flickers

The tile-breaker displacement gradient is computed from `ddx_coarse`/`ddy_coarse`
of the world-space position. These screen-space derivatives have per-pixel
quantization noise that shifts with subpixel rasterization changes frame-to-frame
(even with a static camera, temporal jitter from TAA/DLSS shifts the sample
positions). When the gradient happens to produce a normal near the antiparallel
singularity, the pixel flips between NaN and valid on consecutive frames.

### Why It Looks Like a Grid of Small Squares

The tile-breaker system operates at a specific texture frequency determined by
`_tileBreakerTileScale`. The displacement gradient that feeds the quaternion
rotation varies at this frequency, so the pixels that hit the antiparallel
singularity cluster at the tile-breaker's spatial frequency — producing the
characteristic pattern of regularly-spaced tiny black squares rather than
random scattered pixels.

### Why It's Not SSDM-Specific

The tile-breaker system operates independently of SSDM/SPOM. It's part of the
base terrain material blending that runs on all terrain pixels. Disabling SSDM
removes the parallax displacement but not the tile-breaker normal rotation.

### Vanilla Engine Bug

This is a bug in the vanilla game engine, not introduced by decompilation or
recompilation. The original shipped shader has the same unguarded division and
the same black speckle artifacts are visible in the unmodded game. The RenoDX
replacement shader inherits the bug from the decompiled source and fixes it.

### Not the Same as the FP Precision UV Shimmer (Issue #10)

This bug is distinct from the floating-point precision loss documented in Known
Pipeline Issues item 10 (`_viewPos` in UV computation chains). That issue causes
smooth shimmer/jitter across entire surfaces due to mantissa exhaustion at large
world coordinates. This bug causes discrete black pixels at specific tile-breaker
texture coordinates due to a quaternion math singularity. Different root cause,
different fix, different visual signature.

### Vertex Shader NaN Culling (Unrelated)

During investigation, the terrain vertex shader (`TerrainMesh_0xA8533DF9.vs_6_6.hlsl`)
was found to intentionally write `asfloat(0x7FC00000u)` (quiet NaN) to position
outputs as a LOD/phase culling mechanism — vertices that fail the phase node
visibility check get NaN positions, which the rasterizer discards. This is a
separate, intentional system and is **not** the cause of the black speckle
artifacts. Do not confuse the two when investigating terrain rendering issues.

### Additional NaN Source: rsqrt of Zero Displacement Gradient

The displacement gradient normal is computed via:
```hlsl
_1428 = dot(gradient_normal, gradient_normal);
_1429 = rsqrt(_1428);  // rsqrt(0) = Inf → Inf × 0 = NaN
```
When the displacement gradient is exactly zero (flat terrain with no tile-breaker
texture variation), `_1428` is 0, `rsqrt(0)` is Inf, and the subsequent
multiplication by the zero-length vector produces NaN.

## Fix Applied

### 1. Quaternion sqrt guard (4 sites)

```hlsl
// Before:
_1448 = sqrt(_1447);

// After:
_1448 = max(sqrt(_1447), 1e-6f);
```

When the normals are antiparallel, the quaternion degenerates but the division
produces a very large (not infinite) result that gets clamped by the downstream
`saturate()` calls. The visual effect is a slight normal perturbation instead of
a black pixel — imperceptible compared to the NaN artifact.

### 2. rsqrt guard (2 sites)

```hlsl
// Before:
_1429 = rsqrt(_1428);

// After:
_1429 = rsqrt(max(_1428, 1e-12f));
```

### 3. NaN safety net at GBuffer output

A final check before writing to the GBuffer catches any remaining NaN from
upstream math and replaces with a neutral gray terrain pixel. This is a
defense-in-depth measure — the quaternion guards should prevent all NaN
production, but the safety net ensures no black pixels reach the screen even
if an unforeseen code path produces NaN.

### 4. Debug view system

A compile-time `TERRAIN_DEBUG_VIEW` define (0-15) enables visualization of
intermediate terrain shader values. Set to 1 for NaN detection (red pixels
where any output is NaN/Inf). See the comment block at the top of the shader
for the full view table.

## Files Modified

- `src/games/crimsondesert/terrain/TerrainMesh_0x14E640B1.ps_6_6.hlsl`
  - 4× quaternion sqrt NaN guard
  - 2× rsqrt NaN guard
  - NaN safety net at GBuffer output
  - Debug view system (16 views)

## Verification

Set `#define TERRAIN_DEBUG_VIEW 1` at the top of the shader and recompile.
All terrain pixels should show dark green (clean). Any red pixels indicate
remaining NaN sources that need investigation.

After confirming no red pixels, set back to `#define TERRAIN_DEBUG_VIEW 0`
for normal rendering.
