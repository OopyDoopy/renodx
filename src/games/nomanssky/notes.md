# No Man's Sky Shader Notes

## Folder Layout

- Root `.slang` files are the canonical family implementations.
- Hash-specific permutations live in family subfolders and should usually be thin wrappers.
- Wrapper files should follow this pattern:

```slang
#include "../tonemap.frag.slang"
```

- Current family layout:
  - `final.comp.slang` with wrappers in `final/`
  - `hud_effects.frag.slang` with wrappers in `hud_effects/`
  - `tonemap.frag.slang` with wrappers in `tonemap/`
  - `grading/` is the exception: multiple grading variants are materially different and should not be collapsed blindly.

## Naming Rules

- Canonical files use stable family names such as `tonemap.frag.slang`.
- Wrapper files use `family_0xHASH.ext.slang`.
- Directory names do not drive embed naming. The trailing hash in the filename is what matters.
- If a new permutation is functionally identical to an existing family shader, prefer a wrapper instead of duplicating code.

## Snapshot Workflow

1. Capture a fresh snapshot from the live No Man's Sky session.
2. Inspect the tail of the frame, not the middle. The relevant fullscreen post chain is near the end.
3. Classify the candidate by draw order first, then confirm with decompilation or disassembly.
4. Use the shader source tag from the live bridge as the authoritative family hint.
5. Only after live validation, add the wrapper or move the hash to a different family.

## End-Of-Frame Landmarks

- `0xC3AFEE48` is a final compute pass and is registered through `FinalShaderEntry(...)` in `addon.cpp`.
- UI usually appears after the tonemap and post stack.
- The retained tonemap path is a direct combine-HDR style fullscreen pass with only `gBufferMap`.

## Known Classification Rules

- The retained `POSTPROCESS_FRAG_COMBINEHDR_*` permutation belongs with `tonemap`.
- Grading shaders need extra care. Several of them are close, but not actually interchangeable.

## Tonemap Calibration

- Tone-map type `0` executes the retained decompiled shader path without custom
  Prism processing.
- Tone-map type `1` evaluates the complete runtime `gAcesCurveParams` curve at
  a stable scene-linear cut point of `0.18`. Its live output is Prism's anchor,
  and a central difference over the complete curve supplies the local tangent
  exponent. Prism then extends that tangent-matched point into the HDR
  shoulder, following Metro Exodus's extended-curve pattern.
- The curve's factor-of-10 input scale and factor-of-300 output normalization
  are included in the calibration, while the game's dual-gamma encoding is
  intentionally excluded because Prism operates on linear values.

## Scene LUT Scaling

- The grading pass keeps its four-LUT blend and log-shaped AP1 domain intact.
- `SceneGradeLUTStrength`, `SceneGradeLUTScaling`, and
  `SceneGradeLUTScalingTarget` are applied after LUT decoding and before the
  existing AP1-to-BT.709 transform and gamut limiter.
- LUT black and mid references are sampled through the same base/far/storm/
  effect chain as the current pixel. Hue Preserving removes the common minimum
  black floor. Per Channel weights each channel's floor by its individual
  distance to the LUT shadow reference. Both paths encode the decoded AP1
  values to gamma 2.2, decode back to AP1-linear, and blend back to the input
  by LUT strength.

## Build And Validation

- Preferred validation target: `nomanssky-shaders`.
- This is enough to confirm shader compilation and embed generation without depending on the loaded addon DLL.
- Check generated output under `build/nomanssky.include/embed/`.
- Confirm both:
  - `0xHASH.h` exists
  - `shaders.h` includes `CustomShaderEntry(0xHASH)`
- Full `nomanssky` builds can fail even when the shader change is correct if the addon binary is locked by the game.

## Common Pitfalls

- Do not trust the family name guessed from the current file tree alone.
- Do not assume a hash belongs to `tonemap` without checking the live source tag.
- Do not flatten grading variants into one canonical shader unless the live code really matches.
- If a hash appears wrong, verify whether you picked the post filter instead of the upstream tonemap pass.
- Editor diagnostics around generated embed symbols can be stale even when the actual build output is correct.

## Fast Checklist For New Permutations

1. Capture a new snapshot.
2. Read the final 50 to 100 draws.
3. Identify the postprocess chain near the final compute pass.
4. Pull decompilation for the candidate hash.
5. Match the live source tag to an existing family.
6. Add a thin wrapper if the implementation already exists.
7. Rebuild `nomanssky-shaders`.
8. Confirm embed generation.
9. Only touch `addon.cpp` if the shader is part of the explicit final pass handling.
