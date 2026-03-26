/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0


#include <embed/shaders.h>

#include <d3d12.h>
#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

bool last_is_hdr = false;
bool debug = false;

// VRS disable toggle (CPU-side only, not in cbuffer)
float disable_vrs = 0.f;

// --- VRS override via pre-draw injection ---
// The game uses Tier 2 VRS (per-primitive via SV_ShadingRate in vertex shaders),
// not per-draw RSSetShadingRate calls. To disable VRS we must inject
// RSSetShadingRate(1X1, {OVERRIDE, OVERRIDE}) before each draw, which tells
// the hardware to ignore the per-primitive and per-tile shading rates.
using PFN_RSSetShadingRate = void(STDMETHODCALLTYPE*)(
    ID3D12GraphicsCommandList5*, D3D12_SHADING_RATE, const D3D12_SHADING_RATE_COMBINER*);

static bool vrs_native_ptr_resolved = false;
static PFN_RSSetShadingRate native_RSSetShadingRate = nullptr;

// Resolve the native RSSetShadingRate function pointer once from a command list
static void ResolveVRSNativePtr(reshade::api::command_list* cmd_list) {
  if (vrs_native_ptr_resolved) return;

  auto* native_cmd_list = reinterpret_cast<ID3D12GraphicsCommandList*>(cmd_list->get_native());
  if (native_cmd_list == nullptr) return;

  ID3D12GraphicsCommandList5* cmd_list5 = nullptr;
  HRESULT hr = native_cmd_list->QueryInterface(__uuidof(ID3D12GraphicsCommandList5), reinterpret_cast<void**>(&cmd_list5));
  if (FAILED(hr) || cmd_list5 == nullptr) return;

  void** vtable = *reinterpret_cast<void***>(cmd_list5);
  native_RSSetShadingRate = reinterpret_cast<PFN_RSSetShadingRate>(vtable[77]);
  vrs_native_ptr_resolved = true;

  reshade::log::message(reshade::log::level::info, "VRS: Resolved native RSSetShadingRate function pointer for pre-draw injection");
  cmd_list5->Release();
}

// Pre-draw hook: inject RSSetShadingRate(1X1, {OVERRIDE, OVERRIDE}) to disable per-primitive VRS
static void OnVRSPreDraw(reshade::api::command_list* cmd_list) {
  if (disable_vrs == 0.f) return;
  if (!vrs_native_ptr_resolved) ResolveVRSNativePtr(cmd_list);
  if (native_RSSetShadingRate == nullptr) return;

  auto* native = reinterpret_cast<ID3D12GraphicsCommandList5*>(cmd_list->get_native());
  D3D12_SHADING_RATE_COMBINER combiners[2] = {
    D3D12_SHADING_RATE_COMBINER_OVERRIDE,  // overrides per-primitive (VS SV_ShadingRate)
    D3D12_SHADING_RATE_COMBINER_OVERRIDE   // overrides per-tile (shading rate image)
  };
  native_RSSetShadingRate(native, D3D12_SHADING_RATE_1X1, combiners);
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

// Rendering Presets
const std::unordered_map<std::string, float> VANILLA_VALUES = {
    {"LocalLightHueCorrection", 0.f},
    {"LocalLightSaturation", 50.f},

    {"ImprovedAutoExposure", 0.f},
    {"DisableAWB", 0.f},
    {"DisableHeroLights", 0.f},

    {"FxFilmGrainType", 0.f},
    {"FxFilmGrain", 0.f},
    {"FxChromaticAberration", 100.f},
    {"FxSharpeningType", 0.f},
    {"FxSharpening", 100.f},
    {"FxLensFlareStrength", 100.f},
    {"BloomStrength", 100.f},

    {"SkyScattering", 0.f},
    {"SunMoonAdjustments", 0.f},
    {"MoonDiskSize", 1.f},
    {"DiffuseBRDF", 0.f},
    {"SmoothTerminator", 0.f},
    {"SpecularAA",0.f},
    {"Diffraction", 0.f},
    {"DisableVRS", 0.f}
};
// const std::unordered_map<std::string, float> RECOMMENDED_SAFE_VALUES = {
//     {"LocalLightHueCorrection", 25.f},
//     {"LocalLightSaturation", 43.f},

//     {"ImprovedAutoExposure", 0.f},
//     {"DisableAWB", 1.f},
//     {"DisableHeroLights", 1.f},

//     {"FilmGrainType", 1.f},
//     {"FxChromaticAberration", 0.f},
//     {"FxSharpeningType", 1.f},
//     {"FxSharpening", 0.f},
//     {"FxLensFlareStrength", 100.f},
//     {"BloomStrength", 100.f},

//     {"SkyScattering", 1.f},
//     {"SunMoonAdjustments", 1.f},
//     {"MoonDiskSize", 4.f},
//     {"DiffuseBRDF", 0.f},
//     {"SmoothTerminator", 0.f},
//     {"SpecularAA", 0.f},
//     {"Diffraction", 0.f},
//     {"DisableVRS", 1.f}
// };
const std::unordered_map<std::string, float> RECOMMENDED_VALUES = {
    {"LocalLightHueCorrection", 25.f},
    {"LocalLightSaturation", 43.f},

    {"ImprovedAutoExposure", 1.f},
    {"DisableAWB", 1.f},
    {"DisableHeroLights", 1.f},

    {"FxFilmGrainType", 1.f},
    {"FxFilmGrain", 10.f},
    {"FxChromaticAberration", 0.f},
    {"FxSharpeningType", 1.f},
    {"FxSharpening", 0.f},
    {"FxLensFlareStrength", 100.f},
    {"BloomStrength", 100.f},

    {"SkyScattering", 1.f},
    {"SunMoonAdjustments", 1.f},
    {"MoonDiskSize", 4.f},
    {"DiffuseBRDF", 2.f},
    {"SmoothTerminator", 1.f},
    {"SpecularAA", 1.f},
    {"Diffraction", 1.f},
    {"DisableVRS", 1.f}
};


renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};
//renodx::mods::shader::CustomShaders custom_shaders;

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
int effects = crimson;
int rendering = gold;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "HDR10+ is not to be used, it is irrelevant for this mod. We have curated presets buttons below depending on user preferences for visuals\n",
    },
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Advanced"},
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla uses the unmodified ACESv2 tone mapper with in-game sliders.\nPsychoV uses our custom psychovisual tone mapping system.",
        .labels = {"Vanilla (ACESv2)","PsychoV-11"},
        .tint = tone_mapping,
        .parse = [](float value) { return value; },
        .is_visible = []() { return last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
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
        .is_visible = []() { return last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
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
        .is_visible = []() { return last_is_hdr; },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Adjust UI brightness with the in-game slider.\n",
        .section = "Tone Mapping",
        //.tint = tone_mapping,
        .is_visible = []() { return last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
        .key = "SDRBlackCrushFix",
        .binding = &shader_injection.sdr_black_crush_fix,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Black Crush Fix",
        .section = "Tone Mapping",
        .tooltip = "Intended for gamma 2.2 displays, this fixes the gamma mismatch causing black levels to crush.",
        .labels = {"Off", "On"},
        .tint = tone_mapping,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return !last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueRestore",
        .binding = &shader_injection.tone_map_hue_restore,
        .default_value = 10.f,
        .label = "Hue Restore",
        .section = "Advanced Tone Mapping Properties",
        .tooltip = "Hue retention strength.",
        .tint = advanced_tone_mapping,
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && last_is_hdr; },
    },
        new renodx::utils::settings::Setting{
        .key = "ToneMapBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Advanced Tone Mapping Properties",
        .tooltip = "Desaturates the brightest portions of the image, also relative to peak brightness.",
        .tint = advanced_tone_mapping,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && last_is_hdr; },
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
    //     .is_visible = []() { return current_settings_mode >= 1 && last_is_hdr; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeAdaptationContrast",
        .binding = &shader_injection.tone_map_adaptation_contrast,
        .default_value = 50.f,
        .label = "Adaptation Contrast",
        .section = "Color Grading",
        .tooltip = "Adds contrast primarily to shadowed regions",
        .tint = color_grading,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 || !last_is_hdr; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
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
            if (setting->is_global) continue;
            if (RECOMMENDED_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_VALUES.at(setting->key));
            }
          }
        },
    },
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Vanilla",
    //     .section = "Graphics Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (RECOMMENDED_SAFE_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_SAFE_VALUES.at(setting->key));
    //         }
    //       }
    //     },
    // },
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
            if (setting->is_global) continue;
            if (VANILLA_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, VANILLA_VALUES.at(setting->key));
            }
          }
        },
    },
    new renodx::utils::settings::Setting{
        .key = "LocalLightHueCorrection",
        .binding = &shader_injection.local_light_hue_correction,
        .default_value = 25.f,
        .can_reset = true,
        .label = "Flame Hue Correction",
        .section = "Local Lighting",
        .tooltip = "Corrects pink/red flame and torch colors toward warm orange/yellow.\n"
                   "Uses MacLeod-Boynton chromaticity rotation in Stockman-Sharp LMS.\n"
                   "0 = no correction (vanilla pink/red), 100 = full warm fire hue.",
        .tint = local_lighting,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "LocalLightSaturation",
        .binding = &shader_injection.local_light_saturation,
        .default_value = 43.f,
        .can_reset = true,
        .label = "Flame Saturation",
        .section = "Local Lighting",
        .tooltip = "Adjusts saturation of local light sources (fire, torches, braziers).\n"
                   "Controls MacLeod-Boynton purity distance from achromatic axis.\n"
                   "0 = fully desaturated, 50 = unchanged, 100 = maximum saturation.",
        .tint = local_lighting,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Alternative Auto Exposure was made with HDR output + max settings + RR in mind (other settings may result in overly dark or blown out scenes). It fixes nuclear highlight issues whilst also making night scenes actually dark\n",
        .section = "Auto Exposure",
        //.tint = auto_exposure,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ImprovedAutoExposure",
        .binding = &shader_injection.improved_auto_exposure,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Alternative Auto Exposure",
        .section = "Auto Exposure",
        .tooltip = "Customised AE that makes nights darker throughout the game whilst solving nuclear lighting for interiors.\n"
                   "Off = vanilla exposure adaptation.\n"
                   "On = Customised auto exposure",
        .labels = {"Off", "On"},
        .tint = auto_exposure,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "DisableAWB",
        .binding = &shader_injection.disable_awb,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Disable Auto White Balance",
        .section = "Auto Exposure",
        .tooltip = "Disables the game's per-channel auto white balance.\n"
                   "Off = vanilla AWB (can cause hue shifts in HDR).\n"
                   "On = AWB disabled (stable hue).",
        .labels = {"Off", "On"},
        .tint = auto_exposure,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "DisableHeroLights",
        .binding = &shader_injection.disable_hero_lights,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Disable Hero Lights",
        .section = "Auto Exposure",
        .tooltip = "Disables hero lights and character fill lights.\n"
                   "These are close-up lighting effects applied to characters.\n"
                   "Only effective when Disable Auto White Balance is also On.",
        .labels = {"Off", "On"},
        .tint = auto_exposure,
        .is_enabled = []() { return shader_injection.disable_awb > 0.5f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_DarkPowerOutdoor",
        .binding = &shader_injection.ae_dark_power_outdoor,
        .default_value = 75.f,
        .can_reset = true,
        .label = "Dark Power (Outdoor)",
        .section = "Auto Exposure",
        .tooltip = "Controls how aggressively auto exposure compensates for dark outdoor scenes.\n"
                   "Lower = less brightening of dark areas.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_DarkPowerIndoor",
        .binding = &shader_injection.ae_dark_power_indoor,
        .default_value = 55.f,
        .can_reset = true,
        .label = "Dark Power (Indoor)",
        .section = "Auto Exposure",
        .tooltip = "Controls how aggressively auto exposure compensates for dark indoor scenes.\n"
                   "Lower = less brightening of dark areas.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_BrightPowerOutdoor",
        .binding = &shader_injection.ae_bright_power_outdoor,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Bright Power (Outdoor)",
        .section = "Auto Exposure",
        .tooltip = "Controls how aggressively auto exposure compensates for bright outdoor scenes.\n"
                   "Lower = less dimming of bright areas.",
        .tint = auto_exposure,
        .max = 150.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_BrightPowerIndoor",
        .binding = &shader_injection.ae_bright_power_indoor,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Bright Power (Indoor)",
        .section = "Auto Exposure",
        .tooltip = "Controls how aggressively auto exposure compensates for bright indoor scenes.\n"
                   "Lower = less dimming of bright areas.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_AdaptSpeedBoost",
        .binding = &shader_injection.ae_adapt_speed_boost,
        .default_value = 30.f,
        .can_reset = true,
        .label = "Adaptation Speed Boost",
        .section = "Auto Exposure",
        .tooltip = "Multiplier for temporal adaptation speed.\n"
                   "Higher = faster eye adaptation.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.1f; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_EVBias",
        .binding = &shader_injection.ae_ev_bias,
        .default_value = -1.f,
        .can_reset = true,
        .label = "EV Bias",
        .section = "Auto Exposure",
        .tooltip = "Exposure Value bias applied to the final exposure output.\n"
                   "Negative = darker, Positive = brighter.",
        .tint = auto_exposure,
        .min = -4.f,
        .max = 4.f,
        .format = "%.1f EV",
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_MinLum",
        .binding = &shader_injection.ae_min_lum,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Min Luminance",
        .section = "Auto Exposure",
        .tooltip = "Minimum luminance clamp (overrides per region/ToD values).\n"
                   "Slider value is multiplied by 0.001.",
        .tint = auto_exposure,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.001f; },
        .is_visible = []() { return debug; },
    },
    new renodx::utils::settings::Setting{
        .key = "AE_MaxLum",
        .binding = &shader_injection.ae_max_lum,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Max Luminance",
        .section = "Auto Exposure",
        .tooltip = "Maximum luminance clamp (overrides per region/ToD values).\n"
                   "Slider value is multiplied by 0.1.",
        .tint = auto_exposure,
        .min = 1.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.improved_auto_exposure == 1; },
        .parse = [](float value) { return value * 0.1f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrainType",
        .binding = &shader_injection.custom_film_grain_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Film Grain Type",
        .section = "Effects",
        .tooltip = "Selects between original or RenoDX film grain",
        .labels = {"Vanilla", "Perceptual"},
        .tint = effects,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 10.f,
        .label = "FilmGrain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .tint = effects,
        .max = 100.f,
        .is_enabled = []() { return CUSTOM_FILM_GRAIN_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
            new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &shader_injection.custom_chromatic_aberration,
        .default_value = 0.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tooltip = "Adjusts chromatic aberration strength. 100 = Vanilla",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpeningType",
        .binding = &shader_injection.custom_sharpening_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Sharpening Type",
        .section = "Effects",
        .tooltip = "Selects between original or Lilium's RCAS sharpening",
        .labels = {"Vanilla", "RCAS"},
        .tint = effects,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxSharpening",
        .binding = &shader_injection.custom_sharpening,
        .default_value = 0.f,
        .label = "Sharpening",
        .section = "Effects",
        .tooltip = "Adjusts sharpening strength. 100 = Vanilla",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxLensFlareStrength",
        .binding = &shader_injection.lens_flare_strength,
        .default_value = 100.f,
        .label = "Lens Flare Strength",
        .section = "Effects",
        .tooltip = "Controls the intensity of all lens flare effects. 100 = Vanilla, 0 = Off.",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
        new renodx::utils::settings::Setting{
        .key = "BloomStrength",
        .binding = &shader_injection.bloom_strength,
        .default_value = 100.f,
        .can_reset = true,
        .label = "Bloom Strength",
        .section = "Effects",
        .tooltip = "Controls the overall intensity of the bloom effect.\n"
                   "100 = Vanilla strength, 0 = bloom disabled.",
        .tint = effects,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This section includes graphical changes to various parts of the game, was built with RR + max graphics settings in mind\n",
        .section = "Rendering",
        //.tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "SkyScattering",
        .binding = &shader_injection.sky_scattering,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Spectral Sky Scattering",
        .section = "Rendering",
        .tooltip = "Toggles Spectral rendering atmospheric scattering.\n"
                   "Off = vanilla RGB Rayleigh scattering.\n"
                   "On = Garcia Linan spectral rendering scattering.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "SunMoonAdjustments",
        .binding = &shader_injection.sun_moon_adjustments,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Sun Improvements + Moon Adjustments",
        .section = "Rendering",
        .tooltip = "Improves Sun and applies a 10x brightness reduction to the moon disk.\n"
                   "Off = vanilla (Default shimmery sun blob + moon uses sun scale luminance, clips to white ball).\n"
                   "On = Physically based sun additions + moon luminance reduced to reveal texture detail.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "MoonDiskSize",
        .binding = &shader_injection.moon_disk_size,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Moon Disk Size",
        .section = "Rendering",
        .tooltip = "Scales the angular size of the moon disk.\n"
                   "1 = vanilla size. 10 = 10x larger.",
        .tint = rendering,
        .min = 1.f,
        .max = 10.f,
        .format = "%.1fx",
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "ContactShadowQuality",
        .binding = &shader_injection.contact_shadow_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Screen-Space Shadow Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX contact shadow improvements.\n"
                   "Off = vanilla 8-step contact shadows.\n"
                   "On = 60-step ray march with bilinear depth, adaptive thickness, improved stencil filtering, fade-out, and contrast boost.",
        .labels = {"Off", "On"},
        .tint = rendering,
        //.is_visible = []() { return current_settings_mode >= 1.f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowQuality",
        .binding = &shader_injection.shadow_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX shadow quality improvements.\n"
                   "Off = vanilla shadow sampling (per-frame PCF rotation causes shimmer).\n"
                   "On = temporally stable PCF sampling (removes frame-dependent rotation from all shadow layers).",
        .labels = {"Off", "On"},
        .tint = rendering,
        //.is_visible = []() { return current_settings_mode >= 1.f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .key = "RaytracingQuality",
        .binding = &shader_injection.rt_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Raytracing Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX raytracing noise improvements.\n"
                   "Off = vanilla white noise (TEA+MCG) for all RT sampling.\n"
                   "SPMIS = R2 blue noise + Stochastic Pairwise MIS spatial resampling.\n"
                   "Debug Noise = visualizes the raw noise texture sample as colour output.",
        .labels = {"Off", "SPMIS", "Debug Noise"},
        .tint = rendering,
        //.is_visible = []() { return current_settings_mode >= 1.f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .key = "DiffuseBRDF",
        .binding = &shader_injection.diffuse_brdf_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Diffuse BRDF",
        .section = "Rendering",
        .tooltip = "Selects the diffuse BRDF model used in deferred lighting.\n"
                   "Vanilla (Burley / Lambert mix) = game's default Disney/Burley diffuse with extended retro-reflection.\n"
                   "Hammon 2017 = Earl Hammon's energy-conserving diffuse with multi-scatter compensation.\n"
                   "EON 2025 = Portsmouth/Kutz/Hill energy-preserving Oren-Nayar with exact directional albedo.",
        .labels = {"Vanilla (Burley / Lambert mix)", "Hammon 2017", "EON 2025"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "SmoothTerminator",
        .binding = &shader_injection.smooth_terminator,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Smooth Terminator",
        .section = "Rendering",
        .tooltip = "Callisto Smooth Terminator (Striking Distance Studios, SIGGRAPH 2023).\n"
                   "Softens the hard shadow/light boundary on low-poly geometry where interpolated\n"
                   "normals create visible faceted terminator lines.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "SpecularAA",
        .binding = &shader_injection.specular_aa,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Specular Anti-Aliasing",
        .section = "Rendering",
        .tooltip = "Geometric Specular Anti-Aliasing (Tokuyoshi & Kaplanyan 2021).\n"
                   "Widens roughness based on screen-space normal derivatives to eliminate\n"
                   "specular shimmer/fireflies on distant surfaces.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "Diffraction",
        .binding = &shader_injection.diffraction,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Diffraction",
        .section = "Rendering",
        .tooltip = "Diffraction on Rough Surfaces (Werner et al. 2024, JCGT).\n"
                   "Adds wavelength-dependent spectral colour fringing to metallic\n"
                   "specular highlights. Only affects metals.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "DisableVRS",
        .binding = &disable_vrs,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Disable VRS",
        .section = "Rendering",
        .tooltip = "Disables Variable Rate Shading (VRS).\n"
                   "Off = vanilla VRS (game controls shading rate per-tile).\n"
                   "On = forces full-resolution 1x1 shading rate everywhere.",
        .labels = {"Off", "On"},
        .tint = rendering,
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowDebugMode",
        .binding = SHADOW_DEBUG_MODE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Debug View",
        .section = "Debug",
        .tooltip = "Visualizes internal shadow layer data. Replaces the shadow buffer output with a diagnostic color.\n"
                   "Off = normal rendering.\n"
                   "Terrain Shadow = grey: dark=shadowed, white=lit.\n"
                   "Dynamic Cascade = cyan=cascade0, yellow=cascade1, dark-red=not covered.\n"
                   "Static Cascade = green=static0, blue=static1, dark-red=not covered.\n"
                   "Active Layer Map = false-color which cascade layer is active per pixel.\n"
                   "Pre-Contact PCF = combined shadow after cascades/near-field, before contact shadows.\n"
                   "Contact Shadow = dark=occluded by screen-space contact shadow.\n"
                   "Depth Delta = heatmap of depth-behind-shadowmap (bias diagnosis).\n"
                   "Penumbra Channel = raw W-channel (gamma-stretched depth advance).\n"
                   "Stencil ID = false-color by material stencil group.\n"
                   "Cascade Seams = yellow highlight at dynamic cascade UV boundaries.",
        .labels = {"Off", "Terrain Shadow", "Dynamic Cascade", "Static Cascade",
                   "Active Layer Map", "Pre-Contact PCF", "Contact Shadow",
                   "Depth Delta", "Penumbra Channel", "Stencil ID", "Cascade Seams"},
        //.is_visible = []() { return current_settings_mode >= 1.f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowDisableLayer",
        .binding = SHADOW_DISABLE_LAYER,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Layer Disable",
        .section = "Debug",
        .tooltip = "Disables a specific shadow layer so you can see its contribution by toggling it off.\n"
                   "None = all layers active (normal rendering).\n"
                   "Terrain Shadow = heightmap PCF.\n"
                   "Dynamic Cascade = character/object cascade shadow maps.\n"
                   "Static Cascade = baked environment cascade shadow maps.\n"
                   "Near-Field Contact = ray-marched near-field contact shadows.\n"
                   "Screen-Space Contact = screen-space contact shadow pass.",
        .labels = {"None", "Terrain Shadow", "Dynamic Cascade", "Static Cascade",
                   "Near-Field Contact", "Screen-Space Contact"},
        //.is_visible = []() { return current_settings_mode >= 1.f; },
        .is_visible = []() { return debug; },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Options",
        .group = "button-line-2",
        .on_change = []() {
          for (auto setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
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
          return false;
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Game mod by Forge and Jon (OopyDoopy/Kickfister), RenoDX Framework by Shortfuse",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Extra special thanks to Shortfuse for all the extra work on the shader decompiler for this one!",
        .section = "About",
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Credit to Lilium for the RCAS implementation!",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This build was compiled on " + build_date + " at " + build_time + ".",
        .section = "About",
    },
};

void OnPresetOff() {
    renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
    renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 1000.f);
    renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
    renodx::utils::settings::UpdateSetting("SDRBlackCrushFix", 0.f);

    renodx::utils::settings::UpdateSetting("ToneMapHueRestore", 10.f);
    renodx::utils::settings::UpdateSetting("ToneMapBlowout", 0.f);
    renodx::utils::settings::UpdateSetting("ColorGradeStrength", 100.f);

    renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
    renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeAdaptationContrast", 50.f);

    renodx::utils::settings::UpdateSetting("FxFilmGrainType", 0.f);
    renodx::utils::settings::UpdateSetting("FxFilmGrain", 50.f);
    renodx::utils::settings::UpdateSetting("FxChromaticAberration", 100.f);
    renodx::utils::settings::UpdateSetting("FxLensFlareStrength", 100.f);
    renodx::utils::settings::UpdateSetting("FxSharpeningType", 0.f);
    renodx::utils::settings::UpdateSetting("FxSharpening", 100.f);

    renodx::utils::settings::UpdateSetting("BloomQuality", 0.f);
    renodx::utils::settings::UpdateSetting("BloomStrength", 100.f);

    renodx::utils::settings::UpdateSetting("LocalLightHueCorrection", 0.f);
    renodx::utils::settings::UpdateSetting("LocalLightSaturation", 50.f);
    
    renodx::utils::settings::UpdateSetting("SkyScattering", 0.f);
    renodx::utils::settings::UpdateSetting("SunMoonAdjustments", 0.f);
    renodx::utils::settings::UpdateSetting("MoonDiskSize", 1.f);
    renodx::utils::settings::UpdateSetting("ContactShadowQuality", 0.f);
    renodx::utils::settings::UpdateSetting("ShadowQuality", 0.f);
    renodx::utils::settings::UpdateSetting("RaytracingQuality", 0.f);
    renodx::utils::settings::UpdateSetting("DiffuseBRDF", 0.f);
    renodx::utils::settings::UpdateSetting("SmoothTerminator", 0.f);
    renodx::utils::settings::UpdateSetting("SpecularAA", 0.f);
    renodx::utils::settings::UpdateSetting("Diffraction", 0.f);
    renodx::utils::settings::UpdateSetting("DisableVRS", 0.f);
    renodx::utils::settings::UpdateSetting("DisableAWB", 0.f);
    renodx::utils::settings::UpdateSetting("DisableHeroLights", 0.f);
    renodx::utils::settings::UpdateSetting("ImprovedAutoExposure", 0.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  last_is_hdr = renodx::utils::swapchain::IsHDRColorSpace(swapchain);
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[3]->default_value = roundf(peak.value());
  } else {
    settings[3]->default_value = 1000.f;
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Crimson Desert";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
            reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      // while (IsDebuggerPresent() == 0) Sleep(100);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain

      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      // Register VRS override hooks BEFORE mods::shader registers its draw hooks,
      // so our pre-draw injection fires first
      reshade::register_event<reshade::addon_event::draw>(OnVRSDraw);
      reshade::register_event<reshade::addon_event::draw_indexed>(OnVRSDrawIndexed);
      reshade::register_event<reshade::addon_event::draw_or_dispatch_indirect>(OnVRSDrawOrDispatchIndirect);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::draw>(OnVRSDraw);
      reshade::unregister_event<reshade::addon_event::draw_indexed>(OnVRSDrawIndexed);
      reshade::unregister_event<reshade::addon_event::draw_or_dispatch_indirect>(OnVRSDrawOrDispatchIndirect);

      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}
