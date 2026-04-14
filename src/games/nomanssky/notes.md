# No Man's Sky Shader Notes

## Folder Layout

- Root `.slang` files are the canonical family implementations.
- Hash-specific permutations live in family subfolders and should usually be thin wrappers.
- Wrapper files should follow this pattern:

```slang
#include "../tonemap2_noaa.frag.slang"
```

- Current family layout:
  - `final.comp.slang` with wrappers in `final/`
  - `hud_effects.frag.slang` with wrappers in `hud_effects/`
  - `tonemap1.frag.slang` with wrappers in `tonemap1/`
  - `tonemap2.frag.slang` with wrappers in `tonemap2/`
  - `tonemap2_fxaa.frag.slang` with wrappers in `tonemap2_fxaa/`
  - `tonemap2_noaa.frag.slang` with wrappers in `tonemap2_noaa/`
  - `tonemap_bloom.frag.slang` with wrappers in `tonemap_bloom/`
  - `grading/` is the exception: multiple grading variants are materially different and should not be collapsed blindly.

## Naming Rules

- Canonical files use stable family names such as `tonemap2.frag.slang`.
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
- The FXAA path contains two separate concepts:
  - a tonemap pass that prepares the input for FXAA
  - the FXAA filter itself
- Do not map the FXAA filter shader into the tonemap family just because it appears in the same path.
- The no-AA path is usually a direct combine or combine-HDR style fullscreen pass with only `gBufferMap`.

## Known Classification Rules

- `POSTPROCESS_FRAG_COMBINE_NO_LUM_*` belongs with `tonemap2`.
- `POSTPROCESS_FRAG_COMBINEHDR_*` belongs with `tonemap2_noaa`.
- `POSTPROCESS_FRAG_FXAA_*` is the FXAA filter, not the tonemap pass feeding it.
- A shader that writes both color and a luma target is a strong candidate for the tonemap pass associated with the FXAA route.
- Grading shaders need extra care. Several of them are close, but not actually interchangeable.

## Build And Validation

- Preferred validation target: `nomanssky-shaders`.
- This is enough to confirm shader compilation and embed generation without depending on the loaded addon DLL.
- Check generated output under `build.clang/nomanssky.include/embed/`.
- Confirm both:
  - `0xHASH.h` exists
  - `shaders.h` includes `CustomShaderEntry(0xHASH)`
- Full `nomanssky` builds can fail even when the shader change is correct if the addon binary is locked by the game.

## Common Pitfalls

- Do not trust the family name guessed from the current file tree alone.
- Do not assume a hash belongs to `tonemap1`, `tonemap2`, `tonemap2_fxaa`, or `tonemap2_noaa` without checking the live source tag.
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