/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#include <string>
#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <embed/shaders.h>

#include <d3d12.h>
#include <deps/imgui/imgui.h>
#include <atomic>
#include <chrono>
#include <include/reshade.hpp>
#include <mutex>


#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

bool last_is_hdr = false;
float hdr_settings_toggle = 0.f;

bool debug = false;

// VRS is always disabled — forces full resolution 1x1 shading rate
// Decomp breaks shaders that use VRS so we hardcode to avoid issues
// with missing or transparent shaders like foliage

float disable_vrs = 1.f;
float disable_ui_shaders = 0.f;

// --- VRS override via pre-draw injection ---
// The game uses Tier 2 VRS (per primitive via SV_ShadingRate in vertex shaders),
// not per-draw RSSetShadingRate calls. To disable VRS we must inject
// RSSetShadingRate(1X1, {OVERRIDE, OVERRIDE}) before each draw, which tells
// the hardware to ignore the per primitive and per tile shading rates.

using PFN_RSSetShadingRate = void(STDMETHODCALLTYPE*)(
    ID3D12GraphicsCommandList5*, D3D12_SHADING_RATE, const D3D12_SHADING_RATE_COMBINER*);

// 0 = not yet checked, 1 = resolved (may still be null if unsupported), -1 = unsupported
static std::atomic<int> vrs_resolve_state{0};
static std::atomic<PFN_RSSetShadingRate> native_rs_set_shading_rate{nullptr};
static std::mutex vrs_resolve_mutex;

// Pre draw hook: inject RSSetShadingRate(1X1, {OVERRIDE, OVERRIDE}) to disable per primitive VRS
static void OnVRSPreDraw(reshade::api::command_list* cmd_list) {
  if (cmd_list->get_device()->get_api() != reshade::api::device_api::d3d12) return;
  if (disable_vrs == 0.f) return;

  // Fast path: already determined VRS is unsupported on this GPU
  int state = vrs_resolve_state.load(std::memory_order_relaxed);
  if (state == -1) return;

  auto* native_cmd_list = reinterpret_cast<IUnknown*>(cmd_list->get_native());
  if (native_cmd_list == nullptr) return;

  ID3D12GraphicsCommandList5* cmd_list5 = nullptr;
  HRESULT hr = native_cmd_list->QueryInterface(__uuidof(ID3D12GraphicsCommandList5), reinterpret_cast<void**>(&cmd_list5));
  if (FAILED(hr) || cmd_list5 == nullptr) return;

  // Resolve the vtable function pointer once (double-checked lock)
  auto resolved = native_rs_set_shading_rate.load(std::memory_order_relaxed);
  if (resolved == nullptr && state == 0) {
    const std::lock_guard lock(vrs_resolve_mutex);
    resolved = native_rs_set_shading_rate.load(std::memory_order_relaxed);
    if (resolved == nullptr && vrs_resolve_state.load(std::memory_order_relaxed) == 0) {
      // Check VRS Tier 2 support before resolving — AMD exposes the interface
      // but calling RSSetShadingRate without Tier 2 causes DXGI_ERROR_DEVICE_HUNG
      ID3D12Device* device = nullptr;
      hr = cmd_list5->GetDevice(__uuidof(ID3D12Device), reinterpret_cast<void**>(&device));
      if (SUCCEEDED(hr) && device != nullptr) {
        D3D12_FEATURE_DATA_D3D12_OPTIONS6 options6 = {};
        hr = device->CheckFeatureSupport(D3D12_FEATURE_D3D12_OPTIONS6, &options6, sizeof(options6));
        device->Release();

        if (SUCCEEDED(hr) && options6.VariableShadingRateTier >= D3D12_VARIABLE_SHADING_RATE_TIER_2) {
          void** vtable = *reinterpret_cast<void***>(cmd_list5);
          resolved = reinterpret_cast<PFN_RSSetShadingRate>(vtable[77]);
          if (resolved != nullptr) {
            native_rs_set_shading_rate.store(resolved, std::memory_order_relaxed);
            vrs_resolve_state.store(1, std::memory_order_relaxed);
            reshade::log::message(reshade::log::level::info, "VRS: Resolved native RSSetShadingRate function pointer for pre-draw injection");
          }
        } else {
          reshade::log::message(reshade::log::level::warning, "VRS: GPU does not support VRS Tier 2 — VRS override disabled");
          vrs_resolve_state.store(-1, std::memory_order_relaxed);
        }
      } else {
        reshade::log::message(reshade::log::level::warning, "VRS: Could not get ID3D12Device — VRS override disabled");
        vrs_resolve_state.store(-1, std::memory_order_relaxed);
      }
    }
  }

  if (resolved == nullptr) {
    cmd_list5->Release();
    return;
  }

  D3D12_SHADING_RATE_COMBINER combiners[2] = {
      D3D12_SHADING_RATE_COMBINER_OVERRIDE,  // overrides per-primitive (VS SV_ShadingRate)
      D3D12_SHADING_RATE_COMBINER_OVERRIDE   // overrides per-tile (shading rate image)
  };
  resolved(cmd_list5, D3D12_SHADING_RATE_1X1, combiners);
  cmd_list5->Release();
}

static bool OnVRSDraw(reshade::api::command_list* cmd_list, uint32_t, uint32_t, uint32_t, uint32_t) {
  OnVRSPreDraw(cmd_list);
  return false;  // don't skip the draw
}
static bool OnVRSDrawIndexed(reshade::api::command_list* cmd_list, uint32_t, uint32_t, uint32_t, int32_t, uint32_t) {
  OnVRSPreDraw(cmd_list);
  return false;
}
static bool OnVRSDrawOrDispatchIndirect(reshade::api::command_list* cmd_list, reshade::api::indirect_command, reshade::api::resource, uint64_t, uint32_t, uint32_t) {
  OnVRSPreDraw(cmd_list);
  return false;
}

const std::unordered_map<std::string, float> VANILLA_VALUES = {
    {"BlackCrushFix", 0.f},
    {"ToneMapType", 0.f},

    {"LocalLightHueCorrection", 0.f},
    {"LocalLightSaturation", 50.f},

    {"ImprovedAutoExposure", 0.f},
    // {"AE_PerceptualMinBrightness", 0.f},
    // {"AE_PerceptualMaxBrightness", 0.f},
    // {"AE_TargetSmoothing", 13.f},
    // {"AE_EnvironmentBias", 100.f},
    // {"AE_DarkToLightTime", 1.6f},
    // {"AE_LightToDarkTime", 4.3f},
    //{"AE_DynamismHigh", 50.f},

    {"DisableAWB", 0.f},

    {"FxFilmGrainType", 0.f},
    {"FxChromaticAberration", 100.f},
    {"FxSharpeningType", 0.f},
    {"FxSharpening", 100.f},
    {"FxLensFlareStrength", 100.f},
    {"BloomStrength", 100.f},
    {"FxVignette", 100.f},

    {"SkyScattering", 0.f},
    {"SunImprovements", 0.f},
    {"MoonAdjustments", 0.f},
    {"MoonDiskSize", 1.f},
    {"StylizedLunarPhase", 0.f},
    {"ContactShadowQuality", 0.f},
    {"FoliageImprovements", 0.f},
    {"MaterialImprovements", 0.f},
    {"FoliageSpeedTreeWindCoherence", 0.f},
    {"ShadowEdgeNoiseFix", 0.f},
    {"DawnDuskImprovements", 0.f},
    {"CustomWeatherEditing", 0.f},
    {"SnowFogFix", 0.f},
    {"RaytracingQuality", 0.f},
    {"AuroraBorealis", 0.f},
    {"AuroraBrightness", 25.f},
    {"AuroraChance", 40.f},
    {"NightSkyAttenuation", 0.f},
    {"MilkyWayLightIntensity", 1.f},
    {"MilkyWayAlphaOcclusion", 0.f},
    {"PurkinjeEffect", 0.f},
    {"DisableUIShaders", 0.f},
};

const std::unordered_map<std::string, float> EXPERIMENTAL_RECOMMENDED_VALUES = {
    {"RaytracingQuality", 0.f},
    {"AuroraBorealis", 0.f},
    {"AuroraBrightness", 25.f},
    {"AuroraChance", 40.f},
    {"StylizedLunarPhase", 100.f},
    {"MilkyWayAlphaOcclusion", 0.f},
    {"DisableUIShaders", 0.f},
};

const std::unordered_map<std::string, float> NEUTRAL_VALUES = {
    {"ColorGradeShadows", 50.f},
    {"ToneMapFlare", 0.f},
    {"ColorGradeContrast", 50.f},
    {"ColorGradeSaturation", 50.f},
    {"ColorGradeHighlightSaturation", 50.f},
    {"ColorGradeHighlights", 50.f},
    {"CustomToneMapMidgrayAdjust", 0.f},
    //{"LocalLightHueCorrection", 15.f},
    //{"LocalLightSaturation", 50.f},
};

const std::unordered_map<std::string, float> HDR_LOOK_VALUES = {
    {"ColorGradeExposure", 1.f},
    {"ColorGradeShadows", 50.f},
    {"ToneMapFlare", 5.f},
    {"ColorGradeContrast", 60.f},
    {"ColorGradeSaturation", 55.f},
    {"ColorGradeHighlightSaturation", 60.f},
    {"ColorGradeHighlights", 60.f},
    {"ToneMapHueRestore", 100.f},
    {"ToneMapBlowout", 5.f},
    {"CustomToneMapMidgrayAdjust", 50.f},
    {"ColorGradeWhitePointKelvin", 65.f},
};

bool rr_draw = false;
int rr_draw_counter = 0;
bool is_nvidia = true;

// --- Aurora night detection ---
// SceneShadowTiledNight shaders only dispatch during night.
// We track when they start/stop firing to detect night transitions.
bool night_shader_active = false;
bool night_shader_was_active = false;
int night_check_counter = 0;
uint32_t aurora_night_counter = 0;
uint32_t dawn_dusk_day_counter = 0;
std::chrono::steady_clock::time_point dawn_dusk_blend_start{};
float dawn_dusk_blend_duration = 60.f;  // seconds to crossfade between presets
bool postprocess_material_draw = false;
bool final_sdr_draw = false;

renodx::mods::shader::CustomShader CreateDetectionShader(
    uint32_t crc32,
    std::function<bool(reshade::api::command_list*)> callback) {
  renodx::mods::shader::CustomShader shader = {};
  shader.crc32 = crc32;
  shader.on_replace = std::move(callback);
  return shader;
}

void MarkShaderDraw(renodx::mods::shader::CustomShader& shader, bool* marker) {
  auto previous_on_replace = std::move(shader.on_replace);
  shader.on_replace = [previous_on_replace = std::move(previous_on_replace), marker](reshade::api::command_list* cmd_list) {
    *marker = true;
    return previous_on_replace == nullptr || previous_on_replace(cmd_list);
  };
}

void AttachUIShaderDrawGate(renodx::mods::shader::CustomShaders& shaders, uint32_t hash) {
  auto [it, inserted] = shaders.try_emplace(hash);
  if (inserted) it->second.crc32 = hash;

  auto previous_on_draw = std::move(it->second.on_draw);
  it->second.on_draw = [previous_on_draw = std::move(previous_on_draw)](reshade::api::command_list* cmd_list) {
    if (disable_ui_shaders != 0.f) return false;
    return previous_on_draw == nullptr || previous_on_draw(cmd_list);
  };
}

renodx::mods::shader::CustomShaders custom_shaders = [] {
  auto shaders = renodx::mods::shader::CustomShaders{__ALL_CUSTOM_SHADERS};

  // 1.12 Ray Reconstruction/Regeneration detectors:
  // - kDlssRayReconstructionDetectorHash: DLSS RR prep signal, observed in NVIDIA RR-on lanes.
  // - kSpecularRayRegenerationDetectorHash: specular Ray Regeneration signal from EvaluateSpecularRadianceCS.
  constexpr uint32_t kDlssRayReconstructionDetectorHash = 0x3E2E5981u;    // PrepareDlssRRCS
  constexpr uint32_t kSpecularRayRegenerationDetectorHash = 0x542B9F0Au;  // EvaluateSpecularRadianceCS
  for (uint32_t hash : {kDlssRayReconstructionDetectorHash, kSpecularRayRegenerationDetectorHash}) {
    if (auto it = shaders.find(hash); it != shaders.end()) {
      MarkShaderDraw(it->second, &rr_draw);
    } else {
      shaders[hash] = CreateDetectionShader(hash, [](reshade::api::command_list*) {
        rr_draw = true;
        return false;
      });
    }
  }

  // 1.12 night-only shadow tiled compute replacements.
  // These are draw detectors for SceneShadowTiledNight variants; they do not change
  // rendering by themselves, but mark night_shader_active for transition timing.
  constexpr uint32_t kSceneShadowTiledNightHashA = 0xAD47167Fu;  // SceneShadowTiledNightCS
  constexpr uint32_t kSceneShadowTiledNightHashB = 0x8254FE23u;  // SceneShadowTiledNightCS
  for (uint32_t hash : {kSceneShadowTiledNightHashA, kSceneShadowTiledNightHashB}) {
    if (auto it = shaders.find(hash); it != shaders.end()) {
      MarkShaderDraw(it->second, &night_shader_active);
    } else {
      shaders[hash] = CreateDetectionShader(hash, [](reshade::api::command_list*) {
        night_shader_active = true;
        return false;
      });
    }
  }

  // SDR material/postprocess draw gates. These paths can be the final visible SDR
  // postprocess output even though they are not the standalone final-pass shaders.
  // When one runs without a standalone SDR final in the same present window,
  // OnPresent sets BASIC_POSTPROCESS_FINAL so shared helpers use the basic SDR path.
  // 0x9884336C: psPostProcessMaterial SDR tonemap.
  // 0x21212A93: psPostProcessCompositeMaterial SDR tonemap.
  for (uint32_t hash : {0x9884336Cu, 0x21212A93u}) {
    if (auto it = shaders.find(hash); it != shaders.end()) {
      MarkShaderDraw(it->second, &postprocess_material_draw);
    }
  }

  // SDR standalone final-pass draw gates. These replacements already run the
  // standalone SDR finalization path, so their presence suppresses the material
  // fallback gate above. HDR finals call FinalizeHDR directly and are not listed here.
  // 0xE5C29C6A: RenderPostProcessPS SDR final.
  // 0x96C827AE / 0xF6FF6DB9: postprocessing_final SDR variants.
  // 0xA9F53F51 / 0xDFBDBD09: postprocessing_final_fsr SDR variants.
  for (uint32_t hash : {
           0xE5C29C6Au,
           0x96C827AEu,
           0xF6FF6DB9u,
           0xA9F53F51u,
           0xDFBDBD09u,
       }) {
    if (auto it = shaders.find(hash); it != shaders.end()) {
      MarkShaderDraw(it->second, &final_sdr_draw);
    }
  }

  // 1.12 UI/HUD draw gates from SDR/HDR DevKit snapshots.
  // These VSMain families cover the observed UI pixel shader variants
  for (uint32_t hash : {
           0x8D440999u,
           0xC6582593u,
       }) {
    AttachUIShaderDrawGate(shaders, hash);
  }

  return shaders;
}();

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;

int crimson = 0xD7263D;
int gold = 0xF2C14E;

// Colors
int tone_mapping = gold;
int advanced_tone_mapping = crimson;
int color_grading = gold;
int local_lighting = crimson;
int auto_exposure = gold;
int effects = gold;
int rendering = gold;
int wiprendering = crimson;

// Menu Groupings
#define BASIC         0.f
#define COLOR_GRADING 1.f
#define GRAPHICS      2.f
#define EXPERIMENTAL  3.f
float basic_group = BASIC;
float tone_mapping_group = COLOR_GRADING;
float color_grading_group = COLOR_GRADING;
float local_lighting_group = COLOR_GRADING;
float auto_exposure_group = GRAPHICS;
float effects_group = GRAPHICS;
float rendering_group = GRAPHICS;
float experimental_group = EXPERIMENTAL;

renodx::utils::settings::Setting* tone_map_peak_nits_setting = nullptr;
renodx::utils::settings::Setting* tone_map_diffuse_white_setting = nullptr;

bool IsGraphicsRecommendedPresetSection(const std::string& section) {
  return section.starts_with("Auto Exposure")
         || section.starts_with("Post Processing")
         || section.starts_with("Sky / Celestial")
         || section.starts_with("Atmosphere / Weather")
         || section.starts_with("World / Materials")
         || section.starts_with("Shadows")
         || section.starts_with("Local Lighting");
}

bool IsGraphicsVanillaPresetSection(const std::string& section) {
  return section.starts_with("Auto Exposure")
         || section.starts_with("Post Processing")
         || section.starts_with("Sky / Celestial")
         || section.starts_with("Atmosphere / Weather")
         || section.starts_with("World / Materials")
         || section.starts_with("Shadows");
}

bool IsExperimentalPresetSection(const std::string& section) {
  return section.starts_with("Experimental Raytracing")
         || section.starts_with("Aurora")
         || section.starts_with("Sky / Celestial")
         || section.starts_with("Capture Tools");
}

bool IsPresetBrightnessSetting(const std::string& key) {
  return key == "ToneMapPeakNits" || key == "ToneMapGameNits";
}

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Basic", "Color Grading", "Graphics", "Experimental"},
        .is_global = true,
    },
    // ----------------Basic Menu Presets - Controls everything------------------
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended",
        .section = "Presets",
        .group = "button-line-1",
        .tooltip = "Default settings",
        .on_change = []() {
          for (auto setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla",
        .section = "Presets",
        .group = "button-line-1",
        .tooltip = "Sets everything to Vanilla values and behavior",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (VANILLA_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, VANILLA_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    // ------------------------End Basic Presets--------------------------------
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended",
        .section = "Grading Presets",
        .group = "button-line-1",
        .tooltip = "Default settings, which are our hand-tuned adjustments that we feel look good.",
        .on_change = []() {
          for (auto setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (!setting->section.starts_with("Tone Mapping")
                && !setting->section.starts_with("Color Grading")
                && !setting->section.starts_with("Local Lighting")) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Neutral",
        .section = "Grading Presets",
        .group = "button-line-1",
        .tooltip = "Neutral color and contrast.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (!setting->section.starts_with("Tone Mapping")
                && !setting->section.starts_with("Color Grading")
                && !setting->section.starts_with("Local Lighting")) continue;
            if (NEUTRAL_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, NEUTRAL_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Look",
        .section = "Grading Presets",
        .group = "button-line-1",
        .tooltip = "Preset values that align with people's expectations for how HDR should look. Does not work well in SDR.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (!setting->section.starts_with("Tone Mapping")
                && !setting->section.starts_with("Color Grading")
                && !setting->section.starts_with("Local Lighting")) continue;
            if (HDR_LOOK_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, HDR_LOOK_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == color_grading_group && hdr_settings_toggle == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__TONE_MAP_TYPE},
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type."
                   "\nVanilla SDR uses a per channel BT.709 curve"
                   "\nVanilla HDR uses an unmodified ACESv2 tone mapper with in-game sliders."
                   "\nPsychoV uses a custom psychovisual tone mapping system.",
        .labels = {"Vanilla (Per-Channel SDR/ACESv2 HDR)", "PsychoV Custom"},
        .tint = tone_mapping,
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode == tone_mapping_group; },
    },
    tone_map_peak_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .tint = tone_mapping,
        .min = 80.f,
        .max = 4000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return hdr_settings_toggle == 1 && (current_settings_mode == basic_group || current_settings_mode == tone_mapping_group); },
    },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "Adjust brightness with the perceptual auto exposure controls.\n",
    //     .section = "Tone Mapping",
    //     //.tint = tone_mapping,
    //     .is_visible = []() { return hdr_settings_toggle == 1 && ((current_settings_mode == basic_group || current_settings_mode == tone_mapping_group) && IMPROVED_AUTO_EXPOSURE == 2); },
    // },
    tone_map_diffuse_white_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .tint = tone_mapping,
        .min = 80.f,
        .max = 500.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return hdr_settings_toggle == 1 && (current_settings_mode == basic_group || current_settings_mode == tone_mapping_group); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Adjust UI brightness with the in-game slider.\n",
        .section = "Tone Mapping",
        //.tint = tone_mapping,
        .is_visible = []() { return hdr_settings_toggle == 1 && (current_settings_mode == basic_group || current_settings_mode == tone_mapping_group); },
    },
    new renodx::utils::settings::Setting{
        .key = "SDRBlackCrushFix",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__SDR_BLACK_CRUSH_FIX},
        .label = "Gamma",
        .section = "Tone Mapping",
        .tooltip = "Adjusts the game's final encoding. This should match the gamma used by your display. If you aren't sure, 2.2 is probably correct.",
        .labels = {"sRGB", "2.2"},
        .tint = tone_mapping,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return hdr_settings_toggle == 0 && (current_settings_mode == basic_group || current_settings_mode == tone_mapping_group); },
    },
    //     new renodx::utils::settings::Setting{
    //     .key = "ColorGradeStrength",
    //     .binding = &shader_injection.color_grade_strength,
    //     .default_value = 100.f,
    //     .label = "Pre-Tonemap Grade Strength",
    //     .section = "Advanced Tone Mapping Properties",
    //     .tooltip = "Adjusts how much of the game's dynamic grading applies to the image.",
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 1 && hdr_settings_toggle == 1; },
    // },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 60.f,
        .label = "Contrast",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 55.f,
        .label = "Saturation",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes color from highlights.",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Raises shadow contrast response in the PsychoV tone mapper.",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value * 0.0005f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueRestore",
        .binding = &shader_injection.tone_map_hue_restore,
        .default_value = 100.f,
        .label = "Hue Restore",
        .section = "Color Grading",
        .tooltip = "Hue retention strength.",
        .tint = tone_mapping,
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Desaturates the brightest portions of the image, also relative to peak brightness.",
        .tint = tone_mapping,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return fmax(value * 0.01f, 0.000001f); },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "CustomToneMapMidgrayAdjust",
        .binding = &shader_injection.custom_tone_map_midgray_adjust,
        .default_value = 50.f,
        .label = "Original Midgray",
        .section = "Color Grading",
        .tooltip = "Controls matching mid-gray of the SDR tone mapper. Applies to Vanilla/Custom AE only. 100 = Vanilla, 0 = Neutral.",
        .tint = tone_mapping,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && IMPROVED_AUTO_EXPOSURE != 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeWhitePointKelvin",
        .binding = &shader_injection.color_temp_kelvin,
        .default_value = 65.f,
        .can_reset = true,
        .label = "White Point",
        .section = "Color Grading",
        .tooltip = "Adjusts white point.\n"
                   "6500 K = neutral. Higher values are cooler, lower values are warmer.",
        .tint = color_grading,
        .min = 40.f,
        .max = 93.f,
        .format = "%.0f00K",  // Written this way to increment by 100s
        .is_visible = []() { return current_settings_mode == color_grading_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended",
        .section = "Graphics Presets",
        .group = "button-line-1",
        //.is_enabled = []() { return shader_injection.last_is_hdr; },
        .tooltip = "Settings built and tested at max settings with Ray Reconstruction. There may be graphical issues with other congfigurations.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (setting->is_global) continue;
            if (!IsGraphicsRecommendedPresetSection(setting->section)) continue;
            if (!setting->section.starts_with("Local Lighting")
                && setting->is_visible != nullptr
                && !setting->is_visible()) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == 2.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla",
        .section = "Graphics Presets",
        .group = "button-line-1",
        //.is_enabled = []() { return shader_injection.last_is_hdr; },
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (setting->is_global) continue;
            if (!IsGraphicsVanillaPresetSection(setting->section)) continue;
            if (setting->is_visible != nullptr && !setting->is_visible()) continue;
            if (VANILLA_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, VANILLA_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "LocalLightHueCorrection",
        .binding = &shader_injection.local_light_hue_correction,
        .default_value = 15.f,
        .can_reset = true,
        .label = "Flame Hue Correction",
        .section = "Local Lighting",
        .tooltip = "Corrects pink/red flame and torch colors toward warm orange/yellow.\n"
                   "Uses MacLeod-Boynton chromaticity rotation in Stockman-Sharp LMS.\n"
                   "0 = no correction (vanilla pink/red), 100 = full warm fire hue.",
        .tint = local_lighting,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == local_lighting_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "LocalLightSaturation",
        .binding = &shader_injection.local_light_saturation,
        .default_value = 50.f,
        .can_reset = true,
        .label = "Flame Saturation",
        .section = "Local Lighting",
        .tooltip = "Adjusts saturation of local light sources (fire, torches, braziers).\n"
                   "Controls MacLeod-Boynton purity distance from achromatic axis.\n"
                   "0 = fully desaturated, 50 = unchanged, 100 = maximum saturation.",
        .tint = local_lighting,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == local_lighting_group; },
    },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "Alternative Auto Exposure was made with HDR output + max settings + RR in mind (other settings may result in overly dark or blown out scenes). It fixes nuclear highlight issues whilst also making night scenes actually dark\n",
    //     .section = "Auto Exposure",
    //     //.tint = auto_exposure,
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
    // },
    new renodx::utils::settings::Setting{
        .key = "ImprovedAutoExposure",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE, CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE_PERCEPTUAL},
        .can_reset = true,
        .label = "Auto Exposure",
        .section = "Auto Exposure",
        .tooltip = "Enables control over the brightness of dark and bright scenes.\nCustom provides control over dark and bright scene brightness, anchored in vanilla behavior.\nCustom Perceptual uses a more advanced system that attempts to emulate the human eye.",
        .labels = {"Vanilla", "Custom", "Perceptual"},
        .tint = auto_exposure,
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    //     new renodx::utils::settings::Setting{
    //     .key = "AE_DarkPowerOutdoor",
    //     .binding = &shader_injection.ae_dark_power_outdoor,
    //     .default_value = 50.f,
    //     .can_reset = true,
    //     .label = "Low Light Exposure Limit",
    //     .section = "Auto Exposure",
    //     .tooltip = "Adjusts the max exposure value that can be applied, controlling how dark the game is allowed to get.",
    //     .tint = auto_exposure,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
    //     //.is_visible = []() { return debug; },
    // },
    new renodx::utils::settings::Setting{
        .key = "AE_DynamismHigh",
        .binding = &shader_injection.ae_dynamism_high,
        .default_value = 40.f,
        .can_reset = true,
        .label = "Auto Exposure Darkness",
        .section = "Auto Exposure",
        .tooltip = "Controls brightness level of dark scenes. 50 = neutral",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_DynamismLow",
        .binding = &shader_injection.ae_dynamism_low,
        .default_value = 50.f,
        .can_reset = true,
        .label = "Auto Exposure Brightness",
        .section = "Auto Exposure",
        .tooltip = "Controls brightness level of bright scenes. 50 = neutral",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_Speed",
        .binding = &shader_injection.ae_speed,
        .default_value = 50.f,
        .can_reset = true,
        .label = "Adaptation Speed",
        .section = "Auto Exposure",
        .tooltip = "Controls the speed of Custom auto exposure adaptation. 0 = Vanilla speed",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_PerceptualMinBrightness",
        .binding = &shader_injection.ae_perceptual_min_brightness,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Minimum Brightness",
        .section = "Auto Exposure",
        .tooltip = "Minimum brightness bound for Perceptual.\nValues are percentages of diffuse white.\n0 = no minimum bound.\nWith both min and max at 0, Perceptual targets its adapted field directly.",
        .tint = auto_exposure,
        .min = 0.f,
        .max = 2.f,
        .format = "%.2f%%",
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_PerceptualMaxBrightness",
        .binding = &shader_injection.ae_perceptual_max_brightness,
        .default_value = 5.f,
        .can_reset = true,
        .label = "Maximum Brightness",
        .section = "Auto Exposure",
        .tooltip = "Maximum brightness bound for Perceptual.\nValues are percentages of diffuse white.\n0 = no maximum bound.\nWith both min and max at 0, Perceptual targets its adapted field directly.",
        .tint = auto_exposure,
        .min = 0.f,
        .max = 30.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_DarkToLightTime",
        .binding = &shader_injection.ae_dark_to_light_time,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Short-Term Adaptation",
        .section = "Auto Exposure",
        .tooltip = "Controls the short adaptation time constant in Perceptual.\nUsed directly for brightening, and as the fast branch for darkening before bleaching becomes significant.\nLower values react faster to short scene changes.\nHigher values reduce snapping and transient flicker.",
        .tint = auto_exposure,
        .min = 0.5f,
        .max = 20.f,
        .format = "%.1f s",
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 2.f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .key = "AE_LightToDarkTime",
        .binding = &shader_injection.ae_light_to_dark_time,
        .default_value = 4.3f,
        .can_reset = true,
        .label = "Long-Term Adaptation",
        .section = "Auto Exposure",
        .tooltip = "Controls the slow dark-adaptation time constant in Perceptual.\nThe actual darkening rate blends from Short-Term Adaptation toward this value using the Rushton-Henry bleached fraction of the previous adaptation state.\nLower values settle to the new scene sooner.\nHigher values preserve longer recovery only after very bright preadaptation.",
        .tint = auto_exposure,
        .min = 1.f,
        .max = 90.f,
        .format = "%.1f s",
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 2.f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .key = "AE_EnvironmentBias",
        .binding = &shader_injection.ae_environment_bias,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Environment Bias",
        .section = "Auto Exposure",
        .tooltip = "Controls how strongly Perceptual keeps the game's raw-meter clamp pair.\nAE2 now solves exposure from its own perceptual field; the old sky-visibility placement curve no longer drives the live AE2 exposure solve.\n0 = ignore the game's clamp pair.\n100 = use the full game clamp pair on the raw meter.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE == 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_TargetSmoothing",
        .binding = &shader_injection.ae_target_smoothing_time,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Metering Delay",
        .section = "Auto Exposure",
        .tooltip = "Smooths measured scene brightness before auto exposure reacts.\nValues are in milliseconds.\n0 = off.\nHigher values reduce pulsing but make the meter react more slowly.",
        .tint = auto_exposure,
        .min = 0.f,
        .max = 1000.f,
        .format = "%.0f ms",
        .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 0.f; },
        .parse = [](float value) { return value * 0.001f; },
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_DarkPowerIndoor",
    //     .binding = &shader_injection.ae_dark_power_indoor,
    //     .default_value = 55.f,
    //     .can_reset = true,
    //     .label = "Dark Power (Indoor)",
    //     .section = "Auto Exposure",
    //     .tooltip = "Controls how aggressively auto exposure compensates for dark indoor scenes.\n"
    //                "Lower = less brightening of dark areas.",
    //     .tint = auto_exposure,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_BrightPowerOutdoor",
    //     .binding = &shader_injection.ae_bright_power_outdoor,
    //     .default_value = 100.f,
    //     .can_reset = true,
    //     .label = "Bright Power (Outdoor)",
    //     .section = "Auto Exposure",
    //     .tooltip = "Controls how aggressively auto exposure compensates for bright outdoor scenes.\n"
    //                "Lower = less dimming of bright areas.",
    //     .tint = auto_exposure,
    //     .max = 150.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_BrightPowerIndoor",
    //     .binding = &shader_injection.ae_bright_power_indoor,
    //     .default_value = 100.f,
    //     .can_reset = true,
    //     .label = "Bright Power (Indoor)",
    //     .section = "Auto Exposure",
    //     .tooltip = "Controls how aggressively auto exposure compensates for bright indoor scenes.\n"
    //                "Lower = less dimming of bright areas.",
    //     .tint = auto_exposure,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_AdaptSpeedBoost",
    //     .binding = &shader_injection.ae_adapt_speed_boost,
    //     .default_value = 30.f,
    //     .can_reset = true,
    //     .label = "Adaptation Speed Boost",
    //     .section = "Auto Exposure",
    //     .tooltip = "Multiplier for temporal adaptation speed.\n"
    //                "Higher = faster eye adaptation.",
    //     .tint = auto_exposure,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.1f; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_EVBias",
    //     .binding = &shader_injection.ae_ev_bias,
    //     .default_value = -1.f,
    //     .can_reset = true,
    //     .label = "EV Bias",
    //     .section = "Auto Exposure",
    //     .tooltip = "Exposure Value bias applied to the final exposure output.\n"
    //                "Negative = darker, Positive = brighter.",
    //     .tint = auto_exposure,
    //     .min = -4.f,
    //     .max = 4.f,
    //     .format = "%.1f EV",
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_MinLum",
    //     .binding = &shader_injection.ae_min_lum,
    //     .default_value = 1.f,
    //     .can_reset = true,
    //     .label = "Min Luminance",
    //     .section = "Auto Exposure",
    //     .tooltip = "Minimum luminance clamp (overrides per region/ToD values).\n"
    //                "Slider value is multiplied by 0.001.",
    //     .tint = auto_exposure,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.001f; },
    //     .is_visible = []() { return debug; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "AE_MaxLum",
    //     .binding = &shader_injection.ae_max_lum,
    //     .default_value = 100.f,
    //     .can_reset = true,
    //     .label = "Max Luminance",
    //     .section = "Auto Exposure",
    //     .tooltip = "Maximum luminance clamp (overrides per region/ToD values).\n"
    //                "Slider value is multiplied by 0.1.",
    //     .tint = auto_exposure,
    //     .min = 1.f,
    //     .max = 100.f,
    //     .is_enabled = []() { return IMPROVED_AUTO_EXPOSURE > 1; },
    //     .parse = [](float value) { return value * 0.1f; },
    //     .is_visible = []() { return debug; },
    // },
    new renodx::utils::settings::Setting{
        .key = "DisableAWB",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .packed_values = {0u, CUSTOM_FLAGS__DISABLE_AWB, CUSTOM_FLAGS__DISABLE_AWB | CUSTOM_FLAGS__DISABLE_HERO_LIGHTS},
        .can_reset = true,
        .label = "Auto White Balance",
        .section = "Auto Exposure",
        .tooltip = "Controls the game's per channel auto white balance and hero lights.\n"
                   "Vanilla = AWB enabled (can cause hue shifts in HDR).\n"
                   "Disable AWB = AWB disabled, hero/fill lights remain.\n"
                   "Disable AWB + No Hero Lights = AWB and hero lights disabled.",
        .labels = {"Vanilla", "Disable AWB", "Disable AWB + No Hero Lights"},
        .tint = auto_exposure,
        .is_visible = []() { return current_settings_mode == auto_exposure_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrainType",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__FILM_GRAIN_TYPE},
        .label = "Film Grain Type",
        .section = "Post Processing",
        .tooltip = "Selects between original or RenoDX film grain",
        .labels = {"Vanilla", "Perceptual"},
        .tint = effects,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode == effects_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 10.f,
        .label = "FilmGrain",
        .section = "Post Processing",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .tint = effects,
        .max = 100.f,
        .is_enabled = []() { return CUSTOM_FILM_GRAIN_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group || current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &shader_injection.custom_chromatic_aberration,
        .default_value = 0.f,
        .label = "Chromatic Aberration",
        .section = "Post Processing",
        .tooltip = "Adjusts chromatic aberration strength. 100 = Vanilla",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group || current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxVignette",
        .binding = &shader_injection.custom_vignette,
        .default_value = 0.f,
        .label = "Vignette",
        .section = "Post Processing",
        .tooltip = "Adjusts vignette strength. 100 = Vanilla",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group || current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpeningType",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__SHARPENING_TYPE},
        .label = "Sharpening Type",
        .section = "Post Processing",
        .tooltip = "Selects between original or Lilium's RCAS sharpening",
        .labels = {"Vanilla", "RCAS"},
        .tint = effects,
        .is_visible = []() { return current_settings_mode == effects_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpening",
        .binding = &shader_injection.custom_sharpening,
        .default_value = 0.f,
        .label = "Sharpening",
        .section = "Post Processing",
        .tooltip = "Adjusts sharpening strength. 100 = Vanilla",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group || current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxLensFlareStrength",
        .binding = &shader_injection.lens_flare_strength,
        .default_value = 100.f,
        .label = "Lens Flare Strength",
        .section = "Post Processing",
        .tooltip = "Controls the intensity of all lens flare effects. 100 = Vanilla, 0 = Off.",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "BloomStrength",
        .binding = &shader_injection.bloom_strength,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Bloom Strength",
        .section = "Post Processing",
        .tooltip = "Controls the overall intensity of the bloom effect.\n"
                   "100 = Vanilla strength, 0 = bloom disabled.",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == effects_group; },
    },
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "This section includes graphical changes to various parts of the game\n",
    //     .section = "Rendering",
    //     //.tint = rendering,
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
    // },

    new renodx::utils::settings::Setting{
        .key = "SkyScattering",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__SKY_SCATTERING},
        .can_reset = true,
        .label = "Spectral Sky Scattering",
        .section = "Sky / Celestial",
        .tooltip = "Toggles Spectral rendering atmospheric scattering.\n"
                   "Off = vanilla RGB Rayleigh scattering.\n"
                   "On = Garcia Linan spectral rendering scattering.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "SunImprovements",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__SUN_IMPROVEMENTS},
        .can_reset = true,
        .label = "Sun Improvements",
        .section = "Sky / Celestial",
        .tooltip = "Improves the visible sun disk and suppresses vanilla sun bloom blowout.\n"
                   "Off = vanilla hard/shimmery sun disk.\n"
                   "On = wider softened disk, chromatic edge, limb darkening, corona, and Mie halo.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "MoonAdjustments",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__MOON_ADJUSTMENTS},
        .can_reset = true,
        .label = "Moon Adjustments",
        .section = "Sky / Celestial",
        .tooltip = "Improves moon disk rendering.\n"
                   "Off = vanilla moon size, luminance, and simple shading.\n"
                   "On = Moon Disk Size slider, reduced luminance, limb darkening, inner glow, EON diffuse shading, and stylized phase styling.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "MoonDiskSize",
        .binding = &shader_injection.moon_disk_size,
        .default_value = 4.f,
        .can_reset = true,
        .label = "Moon Disk Size",
        .section = "Sky / Celestial",
        .tooltip = "Scales the angular size of the moon disk.\n"
                   "1 = vanilla size. 10 = 10x larger.",
        .tint = rendering,
        .min = 1.f,
        .max = 200.f,
        .slider_max = 20.f,
        .format = "%.1fx",
        .is_enabled = []() { return MOON_ADJUSTMENTS == 1.f; },
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "MilkyWayLightIntensity",
        .binding = &shader_injection.milky_way_light_intensity,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Milky Way Light Intensity",
        .section = "Sky / Celestial",
        .tooltip = "Scales the Milky Way texture contribution in the night sky.\n"
                   "1 = vanilla intensity. 10 = 10x.\n"
                   "Stars, moon, aurora, and atmospheric scattering are unchanged.",
        .tint = rendering,
        .min = 0.f,
        .max = 200.f,
        .slider_max = 10.f,
        .format = "%.1fx",
        .parse = [](float value) { return value * 100.f; },
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "DawnDuskImprovements",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__DAWN_DUSK_IMPROVEMENTS},
        .can_reset = true,
        .label = "Dawn/Dusk Improvements (WIP)",
        .section = "Atmosphere / Weather",
        .tooltip = "Directionality additions to atmospheric lighting at dawn/dusk.\n",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "NightSkyAttenuation",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__NIGHT_SKY_ATTENUATION},
        .can_reset = true,
        .label = "Darker Nights/Dawn/Dusk (WIP)",
        .section = "Atmosphere / Weather",
        .tooltip = "Reduces sky brightness at night and during dawn/dusk.\n"
                   "Fixes the overly bright sky at 3-5am and after sunset.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "SnowFogFix",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__SNOW_FOG_FIX},
        .can_reset = true,
        .label = "Snow Fog Scattering Fix (WIP)",
        .section = "Atmosphere / Weather",
        .tooltip = "Fixes massive brightness swings for both the sky and GI in snowy regions with heavy fog especially.\n",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Detected: Ray Reconstruction / Ray Regeneration is active.\n",
        .section = "Atmosphere / Weather",
        .is_visible = []() { return current_settings_mode == rendering_group && RR_ENABLED; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Not detected: controls below require Ray Reconstruction / Ray Regeneration.\n",
        .section = "Atmosphere / Weather",
        .tint = 0xaa0000,
        .is_visible = []() { return current_settings_mode == rendering_group && !RR_ENABLED; },
    },
    new renodx::utils::settings::Setting{
        .key = "CustomWeatherEditing",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__CUSTOM_WEATHER_EDITING},
        .can_reset = true,
        .label = "Dynamic Dawn/Dusk Hues (WIP)",
        .section = "Atmosphere / Weather",
        .tooltip = "Randomises dawn/dusk colour hues each day cycle.\n"
                   "Off = vanilla dawn/dusk hues.\n"
                   "On = uses randomised hue presets that vary per dawn.\n"
                   "Disabled until Ray Reconstruction / Ray Regeneration is detected and Dawn/Dusk Improvements is enabled.",
        .labels = {"Off", "On"},
        .tint = wiprendering,
        .is_enabled = []() { return RR_ENABLED && DAWN_DUSK_IMPROVEMENTS == 1.f; },
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "PurkinjeEffect",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__PURKINJE_EFFECT},
        .can_reset = true,
        .label = "Purkinje Effect",
        .section = "Atmosphere / Weather",
        .tooltip = "Shifts nights from yellow toward blue.\n"
                   "Simulates the Purkinje effect at low light levels\n"
                   "Off = vanilla yellow moonlight.\n"
                   "On = cooler and desaturated night scenes.\n"
                   "Disabled until Ray Reconstruction / Ray Regeneration is detected.",
        .labels = {"Off", "On"},
        .tint = wiprendering,
        .is_enabled = []() { return RR_ENABLED; },
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FoliageImprovements",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .packed_values = {0u, CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS, CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS | CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS_BIT1},
        .can_reset = true,
        .label = "Grass/Foliage Improvements",
        .section = "World / Materials",
        .tooltip = "Toggles foliage rendering improvements.\n"
                   "Off = vanilla foliage.\n"
                   "AO = adds ambient occlusion for foliage materials (base game lacks it entirely).\n"
                   "AO + Desaturation/Hue = also applies dynamic colour correction, selective colour,\n"
                   "and transmission (diffuse scattering through vegetation).\n"
                   "Tuned for Lighting: Max; other lighting quality settings may have reduced coverage or visual artifacts.",
        .labels = {"Off", "AO", "AO + Desaturation/Hue"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "FoliageSpeedTreeWindCoherence",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__FOLIAGE_SPEEDTREE_WIND_COHERENCE},
        .can_reset = true,
        .label = "Foliage Wind Fixes",
        .section = "World / Materials",
        .tooltip = "Reduces black flicker or unstable shadows on wind-animated foliage.",
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "MaterialImprovements",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .packed_values = {0u, CUSTOM_FLAGS__MATERIAL_IMPROVEMENTS},
        .can_reset = true,
        .label = "Material Improvements",
        .section = "World / Materials",
        .tooltip = "Enables material/lighting improvements:\n"
                   "- Applies in all renderer modes: glass/refraction fixes\n"
                   "- Requires Ray Reconstruction / Ray Regeneration: smooth terminator for direct lighting\n"
                   "- Requires Ray Reconstruction / Ray Regeneration: geometric specular anti aliasing\n"
                   "Currently disabled: EON diffuse BRDF, spectral diffraction.",
        .labels = {"Off", "On"},
        .tint = wiprendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ContactShadowQuality",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = MICRO_SHADOW_QUALITY_BALANCED,
        .packed_values = {0u, CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT0, CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT1, CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT0 | CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT1},
        .can_reset = true,
        .label = "Contact Micro Shadows",
        .section = "Shadows",
        .tooltip = "Controls contact micro shadow detail.\n"
                   "Off = stock contact shadows.\n"
                   "Low = subtle contact detail with conservative reach and strength.\n"
                   "Balanced = recommended contact micro shadow tuning.\n"
                   "Full = strongest contact micro shadow tuning.\n"
                   "Tuned for Lighting: Max; other lighting quality settings may have reduced coverage or visual artifacts.",
        .labels = {"Off", "Low", "Balanced", "Full"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "ShadowEdgeNoiseFix",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .packed_values = {0u, CUSTOM_FLAGS__SHADOW_EDGE_NOISE_FIX},
        .can_reset = true,
        .label = "Screen Edge Flicker",
        .section = "Shadows",
        .tooltip = "Reduces stretched or flickering contact shadows along the left and right edges of the screen, especially while turning the camera.",
        .tint = rendering,
        .is_visible = []() { return current_settings_mode == rendering_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Experimental settings may change, break, or be removed at any time.\n",
        .section = "Experimental Presets",
        .tint = wiprendering,
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended",
        .section = "Experimental Presets",
        .group = "button-line-1",
        .tooltip = "Applies recommended values for visible experimental controls.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (setting->is_global) continue;
            if (!IsExperimentalPresetSection(setting->section)) continue;
            if (setting->is_visible != nullptr && !setting->is_visible()) continue;
            if (EXPERIMENTAL_RECOMMENDED_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, EXPERIMENTAL_RECOMMENDED_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla",
        .section = "Experimental Presets",
        .group = "button-line-1",
        .tooltip = "Restores visible experimental controls to vanilla/off behavior.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (IsPresetBrightnessSetting(setting->key)) continue;
            if (setting->is_global) continue;
            if (!IsExperimentalPresetSection(setting->section)) continue;
            if (setting->is_visible != nullptr && !setting->is_visible()) continue;
            if (VANILLA_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, VANILLA_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "RaytracingQuality",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        // SPMIS is disabled for 1.12 until active RT replacement shaders are restored.
        // Keep this UI breadcrumb visible, but force all choices to Off so saved values do not set RT_QUALITY.
        .packed_values = {0u, 0u, 0u},
        .can_reset = true,
        .label = "Raytracing Improvements (Temporarily Disabled)",
        .section = "Experimental Raytracing",
        .tooltip = "Toggles RenoDX raytracing noise improvements.\n"
                   "Off = vanilla white noise (TEA+MCG) for all RT sampling.\n"
                   "SPMIS = R2 blue noise + Stochastic Pairwise MIS spatial resampling.\n"
                   "Debug Noise = visualizes the raw noise texture sample as colour output.",
        .labels = {"Off", "SPMIS", "Debug Noise"},
        .tint = wiprendering,
        .is_enabled = []() { return false; },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Aurora now work using in game time + has randomisation, however lack per region gating\n",
        .section = "Aurora",
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Detected: Ray Reconstruction / Ray Regeneration is active.\n",
        .section = "Aurora",
        .is_visible = []() { return current_settings_mode == experimental_group && RR_ENABLED; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Not detected: controls below require Ray Reconstruction / Ray Regeneration.\n",
        .section = "Aurora",
        .tint = 0xaa0000,
        .is_visible = []() { return current_settings_mode == experimental_group && !RR_ENABLED; },
    },
    new renodx::utils::settings::Setting{
        .key = "AuroraBorealis",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .packed_values = {0u, CUSTOM_FLAGS__AURORA_BOREALIS},
        .can_reset = true,
        .label = "Aurora Borealis",
        .section = "Aurora",
        .tooltip = "Adds a aurora borealis effect to the night sky.\n"
                   "Off = no aurora. On = aurora enabled.\n"
                   "Disabled until Ray Reconstruction / Ray Regeneration is detected.",
        .labels = {"Off", "On"},
        .tint = wiprendering,
        .is_enabled = []() { return RR_ENABLED; },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AuroraBrightness",
        .binding = &shader_injection.aurora_brightness,
        .default_value = 25.f,
        .label = "Aurora Brightness",
        .section = "Aurora",
        .tooltip = "Controls the overall brightness of the aurora borealis effect.\n"
                   "Disabled until Ray Reconstruction / Ray Regeneration is detected and Aurora Borealis is enabled.",
        .tint = wiprendering,
        .max = 100.f,
        .is_enabled = []() { return RR_ENABLED && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__AURORA_BOREALIS) != 0u; },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "AuroraChance",
        .binding = &shader_injection.aurora_chance,
        .default_value = 40.f,
        .label = "Aurora Appearance Chance",
        .section = "Aurora",
        .tooltip = "Percentage chance for the aurora to appear each night.\n"
                   "0 = never appears, 100 = always appears.\n"
                   "Disabled until Ray Reconstruction / Ray Regeneration is detected and Aurora Borealis is enabled.",
        .tint = wiprendering,
        .max = 100.f,
        .is_enabled = []() { return RR_ENABLED && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__AURORA_BOREALIS) != 0u; },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "StylizedLunarPhase",
        .binding = &shader_injection.stylized_lunar_phase,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Stylized Lunar Phase / Eclipse",
        .section = "Sky / Celestial",
        .tooltip = "Controls a stylized lunar phase/eclipse effect with eclipsing shadow, shadow-side fill, and red terminator glow.\n"
                   "This is not a realistic lunar phase or eclipse simulation.\n"
                   "0 = vanilla/no stylized eclipse. 100 = recommended stylized crescent. 200 = full stylized eclipse.",
        .min = 0.f,
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return MOON_ADJUSTMENTS == 1.f; },
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "MilkyWayAlphaOcclusion",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .packed_values = {0u, CUSTOM_FLAGS__MILKY_WAY_ALPHA_OCCLUSION},
        .can_reset = true,
        .label = "Milky Way Alpha Occlusion",
        .section = "Sky / Celestial",
        .tooltip = "Experimental support for CrimsonWeather Milky Way replacement textures with authored alpha coverage.\n"
                   "Off = current addon behavior; Milky Way texture alpha is ignored.\n"
                   "On = alpha controls procedural star and sparkle visibility in the visible sky. Alpha 0 leaves stars visible; alpha 1 fully occludes them behind custom texture content.\n"
                   "Do not use with the game's vanilla Milky Way texture or replacement textures without authored alpha coverage; no-alpha/full-alpha textures can make stars and sparkle highlights disappear.",
        .labels = {"Off", "On"},
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "DisableUIShaders",
        .binding = &disable_ui_shaders,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Disable UI/HUD",
        .section = "Capture Tools",
        .tooltip = "Skips known UI vertex shader draw families for gameplay captures.\n"
                   "Off = normal UI/HUD rendering.",
        .labels = {"Off", "On"},
        .is_visible = []() { return current_settings_mode == experimental_group; },
    },
    new renodx::utils::settings::Setting{
        .key = "TonemapDebugMode",
        .binding = &shader_injection.custom_flags,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .packed_values = {0u, CUSTOM_FLAGS__TONEMAP_DEBUG_BIT0, CUSTOM_FLAGS__TONEMAP_DEBUG_BIT1, CUSTOM_FLAGS__TONEMAP_DEBUG_BIT0 | CUSTOM_FLAGS__TONEMAP_DEBUG_BIT1},
        .can_reset = true,
        .label = "Tonemap Debug",
        .section = "Debug",
        .tooltip = "Diagnostic overlay for the Crimson Desert tonemap passes.\n"
                   "Off = normal rendering.\n"
                   "Graph = RenoDX graph through HDR/SDR tonemapping.\n"
                   "Stats = HDR canvas panel with perceptual AE anchors.\n"
                   "Both = graph and stats together.",
        .labels = {"Off", "Graph", "Stats", "Both"},
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "SDRHDRToggle",
        .binding = &hdr_settings_toggle,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = false,
        .label = "UI Mode Override",
        .section = "Utility",
        .tooltip = "This is automatically set based on the detected color space, but this control is provided in case of errors.",
        .labels = {"SDR", "HDR"},
        .is_global = true,
        .is_visible = []() { return current_settings_mode == tone_mapping_group || current_settings_mode == basic_group; },
    },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Reset All",
    //     .section = "Options",
    //     .group = "button-line-2",
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //       }
    //     },
    // },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Out of the box, the mod uses our recommended settings. These have been carefully selected to offer a good balance for everybody. A ton of controls are provided for tuning to preference by adjusting the settings mode, if desired.",
        .section = "Tips",
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .label = "Links",
        .section = "Links",
        .group = "button-line-1",
        .on_draw = []() {
          ImGui::TextLinkOpenURL("RenoDX Discord", "https://discord.gg/QgXDCfccRy");
          ImGui::SameLine();
          ImGui::TextLinkOpenURL("Github", "https://github.com/clshortfuse/renodx");
          ImGui::SameLine();
          ImGui::TextLinkOpenURL("More RenoDX Mods", "https://github.com/clshortfuse/renodx/wiki/Mods/");
          ImGui::SameLine();
          ImGui::TextLinkOpenURL("Forge's Ko-Fi", "https://ko-fi.com/forge87682");
          ImGui::SameLine();
          ImGui::TextLinkOpenURL("Jon's Ko-Fi", "https://ko-fi.com/kickfister");
          ImGui::SameLine();
          ImGui::TextLinkOpenURL("ShortFuse's Ko-Fi", "https://ko-fi.com/shortfuse");
          return false; },
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Game mod by Forge, Jon (OopyDoopy/Kickfister), and Shortfuse, RenoDX Framework by Shortfuse",
        .section = "About",
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Credit to Lilium for the RCAS implementation!",
        .section = "About",
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Credits and ty to both Gerardo LCDF for Godot & KnighTec for Blitz-FX source which helped with aurora borealis implementation",
        .section = "About",
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This build was compiled on " + build_date + " at " + build_time + ".",
        .section = "About",
        .is_visible = []() { return current_settings_mode == basic_group; },
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 1000.f},
      {"ToneMapGameNits", 203.f},
      {"SDRBlackCrushFix", 0.f},

      {"ToneMapHueRestore", 10.f},
      {"ToneMapBlowout", 0.f},

      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ToneMapFlare", 0.f},
      {"ColorGradeWhitePointKelvin", 65.f},
      {"CustomToneMapMidgrayAdjust", 100.f},

      {"FxFilmGrainType", 0.f},
      {"FxFilmGrain", 50.f},
      {"FxChromaticAberration", 100.f},
      {"FxLensFlareStrength", 100.f},
      {"FxSharpeningType", 0.f},
      {"FxSharpening", 100.f},
      {"FxVignette", 100.f},

      {"BloomStrength", 100.f},

      {"LocalLightHueCorrection", 0.f},
      {"LocalLightSaturation", 50.f},

      {"SkyScattering", 0.f},
      {"SunImprovements", 0.f},
      {"MoonAdjustments", 0.f},
      {"MoonDiskSize", 1.f},
      {"StylizedLunarPhase", 0.f},
      {"ContactShadowQuality", 0.f},
      {"FoliageImprovements", 0.f},
      {"RaytracingQuality", 0.f},
      {"MaterialImprovements", 0.f},
      {"FoliageSpeedTreeWindCoherence", 0.f},
      {"ShadowEdgeNoiseFix", 0.f},
      {"DawnDuskImprovements", 0.f},
      {"CustomWeatherEditing", 0.f},
      {"SnowFogFix", 0.f},
      {"DisableAWB", 0.f},
      {"AuroraBorealis", 0.f},
      {"AuroraBrightness", 25.f},
      {"AuroraChance", 40.f},
      {"NightSkyAttenuation", 0.f},
      {"MilkyWayLightIntensity", 1.f},
      {"PurkinjeEffect", 0.f},
      {"DisableUIShaders", 0.f},

      {"ImprovedAutoExposure", 0.f},
      {"AE_PerceptualMinBrightness", 0.f},
      {"AE_PerceptualMaxBrightness", 0.f},
      {"AE_TargetSmoothing", 0.f},
      {"AE_DynamismHigh", 40.f},
      {"AE_DynamismLow", 50.f},
      {"AE_Speed", 0.f},
      {"AE_DarkToLightTime", 1.6f},
      {"AE_LightToDarkTime", 4.3f},
      {"AE_EnvironmentBias", 100.f},
  });
}

bool fired_on_init_swapchain = false;

void OnPresent(reshade::api::command_queue* /*queue*/,
               reshade::api::swapchain* /*swapchain*/,
               const reshade::api::rect* /*source_rect*/,
               const reshade::api::rect* /*dest_rect*/,
               uint32_t /*dirty_rect_count*/,
               const reshade::api::rect* /*dirty_rects*/) {
  rr_draw_counter++;
  if (rr_draw_counter >= 30) {
    uint32_t custom_flags = CUSTOM_FLAGS_AS_UINT & ~CUSTOM_FLAGS__RR_ENABLED & ~CUSTOM_FLAGS__BASIC_POSTPROCESS_FINAL;
    if (rr_draw) {
      custom_flags |= CUSTOM_FLAGS__RR_ENABLED;
    }
    if (!last_is_hdr && postprocess_material_draw && !final_sdr_draw) {
      custom_flags |= CUSTOM_FLAGS__BASIC_POSTPROCESS_FINAL;
    }

    shader_injection.custom_flags = std::bit_cast<float>(custom_flags);
    rr_draw = false;
    postprocess_material_draw = false;
    final_sdr_draw = false;
    rr_draw_counter = 0;
  }

  // --- Aurora night seed: detect night transitions via SceneShadowTiledNight ---
  // SceneShadowTiledNight shaders only run during night, this allows us to use
  // them as a proxy to re roll the aurora seed
  night_check_counter++;
  if (night_check_counter >= 30) {
    // Rising edge: night just started → re-roll aurora seed
    if (night_shader_active && !night_shader_was_active) {
      aurora_night_counter++;
      uint32_t seed_bits = aurora_night_counter * 2654435761u;
      shader_injection.aurora_night_seed = static_cast<float>(seed_bits & 0xFFFFu) / 65535.f;

      // Re-roll dawn/dusk weather seed at dusk (rising edge of night).
      // Start a blend from old preset → new preset so there's no hard pop.
      // Pass the raw counter as the seed (not hashed) so the shader can
      // derive the previous preset via sessionIndex - 1.
      dawn_dusk_day_counter++;
      shader_injection.dawn_dusk_weather_seed = static_cast<float>(dawn_dusk_day_counter) / 65535.f;
      dawn_dusk_blend_start = std::chrono::steady_clock::now();
    }
    night_shader_was_active = night_shader_active;
    night_shader_active = false;
    night_check_counter = 0;
  }

  // --- Dawn/dusk weather blend ramp ---
  // After a seed re-roll, ramp blend from 0→1 over dawn_dusk_blend_duration seconds.
  // The shader lerps between previous and current preset using this value.
  {
    auto elapsed = std::chrono::steady_clock::now() - dawn_dusk_blend_start;
    float seconds = std::chrono::duration<float>(elapsed).count();
    float blend = (dawn_dusk_blend_duration > 0.f) ? (seconds / dawn_dusk_blend_duration) : 1.f;
    shader_injection.dawn_dusk_weather_blend = (blend >= 1.f) ? 1.f : blend;
  }
}

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  last_is_hdr = renodx::utils::swapchain::IsHDRColorSpace(swapchain);

  hdr_settings_toggle = last_is_hdr ? 1.f : 0.f;
  renodx::utils::settings::UpdateSetting("SDRHDRToggle", hdr_settings_toggle);

  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    tone_map_peak_nits_setting->default_value = roundf(peak.value());
  } else {
    tone_map_peak_nits_setting->default_value = 1000.f;
  }
  tone_map_diffuse_white_setting->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(tone_map_peak_nits_setting->default_value), 203.f);
}

void OnInitDevice(reshade::api::device* device) {
  int vendor_id;
  auto retrieved = device->get_property(reshade::api::device_properties::vendor_id, &vendor_id);
  is_nvidia = (retrieved && vendor_id == 0x10de);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX - Crimson Desert";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Crimson Desert";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      // while (IsDebuggerPresent() == 0) Sleep(100);

      reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);  // Vendor detection

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);

      // Register VRS override hooks BEFORE mods::shader registers its draw hooks,
      // so our pre draw injection fires first
      reshade::register_event<reshade::addon_event::draw>(OnVRSDraw);
      reshade::register_event<reshade::addon_event::draw_indexed>(OnVRSDrawIndexed);
      reshade::register_event<reshade::addon_event::draw_or_dispatch_indirect>(OnVRSDrawOrDispatchIndirect);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain

      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_event<reshade::addon_event::draw>(OnVRSDraw);
      reshade::unregister_event<reshade::addon_event::draw_indexed>(OnVRSDrawIndexed);
      reshade::unregister_event<reshade::addon_event::draw_or_dispatch_indirect>(OnVRSDrawOrDispatchIndirect);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  if (fdw_reason == DLL_PROCESS_DETACH) {
    reshade::unregister_addon(h_module);
  }

  return TRUE;
}
