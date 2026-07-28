# AGENTS: RenoDX Upgrade addon

This folder implements the RenoDX Upgrade ReShade addon. It upgrades swapchain/resource formats and provides configurable mid-frame ReShade technique insertion for D3D11 and D3D12 games.

## Scope and constraints

- Keep changes local to this addon unless a shared utility change is required.
- Preserve the vanilla/default game look when the feature is disabled or no insertion is selected.
- Do not change global CMake presets, CI, or vendored dependencies without explicit approval.
- Validate with the `upgrade` target. A running game can lock `build/Release/renodx-upgrade.addon64`; close it before linking.
- Avoid temporary runtime logging. Prefer the in-overlay Automatic Status section for targeted insertion diagnostics.

## Effect insertion lifecycle

`EffectInsertionCallback` intercepts a game draw and may replay it through `command_action` before calling `effect_runtime::render_effects` on the chosen target. Calling `render_effects` marks that ReShade runtime as rendered for the frame, so the normal end-of-frame effect pass is suppressed.

`OnReshadeOverlay` restores the later stage deliberately:

- It tracks pending final work per `effect_runtime*`, not globally.
- After an inserted render, it manually runs enabled, non-inserted techniques on the current backbuffer.
- When Automatic did not insert, it manually runs selected techniques that were disabled for insertion, so the normal ReShade path remains usable.

Do not remove or collapse this split lifecycle without proving the selected effects do not rely on it.

## Automatic insertion

Automatic uses `automatic_detection::Detector` and records every observed writer even after an insertion succeeds.

### Swapchain mode

For frames with multiple swapchain writers, writers are recorded in execution order as:

```text
(shader hash, RTV index, target resource)
```

Preserve every swapchain writer occurrence and its execution order, including repeated pixel-shader hashes. Assign every occurrence of a shader hash the same conservative aggregate classification: any draw without a Texture2D SRV classifies all occurrences as `NO_TEXTURE2D`; otherwise any non-matching draw classifies all occurrences as `OTHER`; only a shader whose every draw has a matching-size SRV classifies as `MATCH`.

Prefer the first `MATCH` writer when the following writer is `OTHER`. This identifies the game output immediately before UI-like work. `NO_TEXTURE2D` and `OTHER` writers are not eligible. If no such boundary exists, promote the first `MATCH` writer that attempts to write to the tracked swapchain resource. Do not promote a candidate when no shader classifies as `MATCH`.

Learned candidates are keyed by `shader_hash` only. Target resources select which draws are observed; they are not part of candidate matching.

Once a swapchain writer is learned, remain in swapchain mode until Automatic is reset. Do not transition from swapchain mode to final-target mode. At every present, select the best current-frame candidate using the SRV boundary heuristic, falling back to the first current-frame writer with a matching-size SRV. If the learned shader also ran, require the same replacement candidate to be promoted for two consecutive frames before replacing it. If the learned shader did not run, replace it immediately. With no learned shader, learn the promoted candidate immediately. If no eligible writer is observed, retain the previous candidate. Final-target mode may fall back permanently to swapchain mode when its single-writer condition is lost.

### Final-target mode

When exactly one swapchain writer is observed and it has a matching source resource, Automatic immediately treats that writer as the **final shader** and tracks its matching source as the final target. Classify and promote writers to that resource with the same per-shader SRV aggregation, output/UI boundary heuristic, matching-source requirement, fallback, and replacement confirmation used for swapchain writers. The two modes differ only in the resource whose writers they track.

Re-evaluate the best final-target writer at the end of every frame while final-target mode remains active. Unlike the choice of swapchain versus final-target mode, final-target output learning is not permanently latched.

Terminology in the UI:

- **True output shader/resource**: learned no-UI game output writer and the target where inserted effects execute.
- **Final shader/resource**: stable game shader and resource that write the swapchain.

Reset final-target state and detector data when the single-writer condition no longer holds. Final-target matching must run only while final-target mode is active.

## D3D12 ordering

D3D12 writer records are accumulated in `EffectInsertionCommandListData` and appended in `OnExecuteCommandList`, preserving command-list submission order. Do not promote D3D12 candidates at draw-record time.

## RenoFX split-effect compatibility

`RenoFX` can be inserted mid-frame while `RenoFXOutput` runs at presentation. Their per-runtime final-stage sequencing is intentional.

For RenoFX final-target flows:

- An RGBA16F direct swapchain target uses the normal single-output path; it must not use scene/UI handoff clearing or alpha compositing.
- A normalized final target without presentation metadata preserves scene data in `SplitIntermediateTexture`, clears the game target to transparent black, lets later game UI render there, then composites decoded/re-encoded UI over the scene in `RenoFXOutput`.
- Do not assume clone handling is the cause of an insertion issue; resource clones are already resolved by the existing resource helpers.
