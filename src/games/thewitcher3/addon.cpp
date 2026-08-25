/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <chrono>
#include <random>

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

thread_local bool sunshafts_drawn = false;

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntryCallback(0x0B6D0F0A, [](auto*) {
      sunshafts_drawn = true;
      return true;
    }),
    CustomShaderEntryCallback(0xE1BC4DB3, [](auto*) {
      const bool replace = !sunshafts_drawn;
      sunshafts_drawn = false;
      return replace;
    }),
    __ALL_CUSTOM_SHADERS,
};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;

const std::unordered_map<std::string, float> RECOMMENDED_VALUES = {

};

const std::unordered_map<std::string, float> PURIST_VALUES = {
    {"FxVignetteBlackLevel", 0.f},
    {"FxVignette", 100.f},
    {"LutScaling", 0.f},
    //{"ColorGradeHighlights", 50.f},
    //{"BloomEmulation", 0.f},
};

const std::unordered_map<std::string, float> FILMIC_VALUES = {
    {"ColorGradeExposure", 0.70f},
    {"ColorGradeHighlights", 58.f},
    {"ColorGradeShadows", 50.f},
    {"ColorGradeContrast", 39.f},
    {"ColorGradeSaturation", 47.f},
    {"ColorGradeHighlightSaturation", 54.f},
    {"ColorGradeBlowout", 50.f},
    {"ColorGradeFlare", 2.f},
    {"LutScaling", 0.f},
   // {"SwapChainCustomColorSpace", 0.f},
    //{"LutGradeStrength", 100.f},
   // {"TonemapGradeStrength", 100.f},
    {"FxFilmGrain", 50.f},
    //{"FxPostProcessingMaxCLL", 40.f},
    //{"FxBloom", 15.f},
    //{"FxDepthBlur", 100.f},
    //{"FxLensDirt", 50.f},
    //{"FxSunShaftStrength", 60.f},
};

const std::unordered_map<std::string, float> RECOMMENDED_VALUES_SDR = {
{"ColorGradeHighlights", 60.f},
//{"ColorGradingHighlightSaturation", 100.f},
    //{"BloomEmulation", 0.f},
    {"GradingImprovements", 0.f},
};

const std::unordered_map<std::string, float> FILMIC_VALUES_SDR = {
    {"ColorGradeExposure", 0.70f},
    {"ColorGradeHighlights", 58.f},
    {"ColorGradeShadows", 50.f},
    {"ColorGradeContrast", 39.f},
    {"ColorGradeSaturation", 47.f},
    {"ColorGradeHighlightSaturation", 54.f},
    {"ColorGradeBlowout", 50.f},
    {"ColorGradeFlare", 2.f},
    {"LutScaling", 0.f},
   // {"SwapChainCustomColorSpace", 0.f},
    //{"LutGradeStrength", 100.f},
   // {"TonemapGradeStrength", 100.f},
    {"FxFilmGrain", 50.f},
    //{"FxPostProcessingMaxCLL", 40.f},
    //{"FxBloom", 15.f},
    //{"FxDepthBlur", 100.f},
    //{"FxLensDirt", 50.f},
    //{"FxSunShaftStrength", 60.f},
    {"GradingImprovements", 0.f},
};

const std::unordered_map<std::string, float> CANNOT_PRESET_VALUES = {
    {"ToneMapPeakNits", 0},
    {"ToneMapGameNits", 0},
    {"ToneMapUINits", 0},
    //{"FxPostProcessingMaxCLL", 0},
    //{"FxFilmGrain", 0},
    {"FxLensDirt", 0},
    {"FxSharpness", 0},
    {"FxSunShaftStrength", 0},
    {"FXBloom", 0},
};

renodx::utils::settings::Setting* peak_white_nits_setting = nullptr;
renodx::utils::settings::Setting* diffuse_white_nits_setting = nullptr;
renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Intermediate", "Advanced"},
        .is_global = true,
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Theses options are purely to adjust to taste.",
        .section = "NOTICE",
        .group = "button-line-2",
        .tint = 0xFF0000,
        .is_visible = []() { return current_settings_mode >= 1.f;}
    },
    //         new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "These options are for the sick freaks that want to adjust anything and everything.",
    //     .section = "NOTICE",
    //     .group = "button-line-2",
    //     .tint = 0xFF0000,
    //     .is_visible = []() { return current_settings_mode == 2.f;}
    // },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla = The game's standard HDR, which is the SDR curve without the SDR clip.\nSDR in HDR = Vanilla tone map with SDR clipping.\nVanilla+ = Vanilla HDR with the curve extended and tonemapped to peak\nPsychoV25 Custom = Fully custom tone mapping system, configured to roughly match the shadows/midtones of Vanilla with brighter highlights, and with much improved color handling.",
        .labels = {"Vanilla", "SDR in HDR", "Vanilla+", "PsychoV25 Custom"},
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    peak_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits.",
        .min = 80.f,
        .max = 10000.f,
        .is_enabled = []() { return shader_injection.last_is_hdr; },
        .is_visible = []() { return current_settings_mode >= 0 && shader_injection.last_is_hdr; },
        .is_logarithmic = true,
    },
    diffuse_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits.",
        .min = 80.f,
        .max = 500.f,
        .is_visible = []() { return shader_injection.last_is_hdr; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &shader_injection.graphics_white_nits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits.",
        .min = 80.f,
        .max = 500.f,
        .is_visible = []() { return shader_injection.last_is_hdr; },
        .is_logarithmic = true,
    },
    //   new renodx::utils::settings::Setting{
    //     .key = "CustomGammaType",
    //     .binding = &CUSTOM_GAMMA_TYPE,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .can_reset = true,
    //     .label = "SDR EOTF Emulation",
    //     .section = "Tone Mapping",
    //     .tooltip = "Emulates SDR gamma response. In SDR mode, this assumes the display is calibrated to 2.2 gamma.",
    //     .labels = {"sRGB", "Power Gamma"},
    //     //.is_enabled = []() { return shader_injection.tone_map_type >= 2.f; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 2; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "CustomGammaValue",
    //     .binding = &CUSTOM_GAMMA_VALUE,
    //     .default_value = 2.2f,
    //     .label = "Power Gamma",
    //     .section = "Tone Mapping",
    //     .tooltip = "Artificial but pleasing boost to highlight strength.",
    //     .min = 2.0f,
    //     .max = 2.4f,
    //     .format = "%.2f",
    //     .is_enabled = []() { return CUSTOM_GAMMA_TYPE == 1; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2;},
    // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Recommended",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (RECOMMENDED_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Purist",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (PURIST_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, PURIST_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Filmic",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (FILMIC_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, FILMIC_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },

    // // SDR PRESETS
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Recommended",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (RECOMMENDED_VALUES_SDR.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_VALUES_SDR.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // },
    // //     new renodx::utils::settings::Setting{
    // //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    // //     .label = "Purist",
    // //     .section = "Presets",
    // //     .group = "button-line-1",
    // //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    // //     .on_change = []() {
    // //       for (auto* setting : settings) {
    // //         if (setting->key.empty()) continue;
    // //         if (!setting->can_reset) continue;
    // //         if (setting->is_global) continue;
    // //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    // //         if (PURIST_VALUES_SDR.contains(setting->key)) {
    // //           renodx::utils::settings::UpdateSetting(setting->key, PURIST_VALUES_SDR.at(setting->key));
    // //         } else {
    // //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    // //         }
    // //       }
    // //     },
    // //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Filmic",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (FILMIC_VALUES_SDR.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, FILMIC_VALUES_SDR.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // },
    new renodx::utils::settings::Setting{
      .key = "SceneGradeHueCorrection",
      .binding = &shader_injection.scene_grade_hue_correction,
      .default_value = 0.f,
      .label = "Hue Correction",
      .section = "Scene Grading",
      .tooltip = "Shifts PsychoV25 hues towards the original SDR tonemap.",
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3.f; },
      .parse = [](float value) { return value * 0.01f; },
      .is_visible = []() { return current_settings_mode >= 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "LutGradeStrength",
        .binding = &shader_injection.custom_lut_strength,
        .default_value = 100.f,
        .label = "LUT Grading Strength",
        .section = "Scene Grading",
        .tooltip = "Strength of the original color grading LUTs.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    },
          new renodx::utils::settings::Setting{
        .key = "LutScaling",
        .binding = &shader_injection.custom_lut_scaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Scene Grading",
        .tooltip = "Scales the LUTs so they're full range (i.e. fixes raised blacks in some scenes). 0 = Vanilla",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    },
          new renodx::utils::settings::Setting{
        .key = "ColorGradeStrength",
        .binding = &shader_injection.custom_color_grading,
        .default_value = 100.f,
        .label = "Color Grading Strength",
        .section = "Scene Grading",
        .tooltip = "Strength of the original color grading, applied after LUTs.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "GradingImprovements",
        .binding = &shader_injection.custom_grading_improvements,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Grading Improvements",
        .section = "Scene Grading",
        .tooltip = "Upgrades the game's color grading with HDR range and wide-gamut preservation.",
        .labels = {"Vanilla", "Upgraded"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 1; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.0001f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "SwapChainCustomColorSpace",
        .binding = &shader_injection.swap_chain_custom_color_space,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Custom Color Space",
        .section = "Color Grading",
        .tooltip = "Selects output color space"
                   "\nUS Modern for BT.709 D65."
                   "\nJPN Modern for BT.709 D93."
                   "\nUS CRT for BT.601 (NTSC-U)."
                   "\nJPN CRT for BT.601 ARIB-TR-B9 D93 (NTSC-J)."
                   "\nDefault: US CRT",
        .labels = {
            "US Modern",
            "JPN Modern",
            "US CRT",
            "JPN CRT",
        },
        .is_visible = []() { return settings[0]->GetValue() >= 1 && shader_injection.last_is_hdr; },
    },

    // new renodx::utils::settings::Setting{
    //     .key = "TonemapGradeStrength",
    //     .binding = &shader_injection.scene_grade_strength,
    //     .default_value = 100.f,
    //     .label = "Tonemapping Grade",
    //     .section = "Color Grading",
    //     .tooltip = "Strength of the original tonemapper's grading",
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "FxPostProcessingMaxCLL",
    //     .binding = &shader_injection.custom_post_maxcll,
    //     .default_value = 10.f,
    //     .label = "Post Processing MaxCLL",
    //     .section = "Effects",
    //     .tooltip = "Controls the max nits used when tonemapping color for post processing effects. Strongly affects bloom and sunshafts. Value * 10 = nits.",
    //     .min = 10.f,
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .parse = [](float value) { return value * 0.1f; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "BloomEmulation",
    //     .binding = &shader_injection.bloom_emulation,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .can_reset = true,
    //     .label = "Bloom Emulation",
    //     .section = "Effects",
    //     .tooltip = "Approximately emulate SDR behavior, or upgrade bloom parameters for an HDR input.",
    //     .labels = {"SDR Approximate", "HDR Upgrade"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 1; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2.f && shader_injection.last_is_hdr; },
    // },
        new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &shader_injection.custom_bloom,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .tooltip = "Adjusts bloom response. 50 matches the Vanilla intensity reference; lower values reduce bloom and higher values extend compressed HDR highlights.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
      new renodx::utils::settings::Setting{
        .key = "FxLensDirt",
        .binding = &shader_injection.custom_lens_dirt,
        .default_value = 50.f,
        .label = "Lens Dirt",
        .section = "Effects",
        .tooltip = "Adjusts the strength of the dirt effect when sun shafts are on screen.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxSunShaftStrength",
        .binding = &shader_injection.custom_sunshafts_strength,
        .default_value = 50.f,
        .label = "Sunshafts Strength",
        .section = "Effects",
        .tooltip = "Adjusts sunshaft response. 50 matches the Vanilla intensity reference; lower values reduce sunshafts and higher values extend compressed HDR highlights.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "FxVignetteBlackLevel",
        .binding = &shader_injection.custom_vignette_black_level,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Vignette Black Level",
        .section = "Effects",
        .tooltip = "Controls whether the vignette uses the game's dynamic black level adjustment or a value fixed at perfect black.",
        .labels = {"Vanilla", "Perfect Black"},
        .parse = [](float value) { if (value == 0) return 1.f;
        return 0.f;
       },
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.last_is_hdr; },
    },
            new renodx::utils::settings::Setting{
        .key = "FxVignette",
        .binding = &shader_injection.custom_vignette,
        .default_value = 66.f,
        .label = "Vignette",
        .section = "Effects",
        .tooltip = "Adjusts the strength of vignette effect. 100 = Vanilla strength.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxDepthBlur",
        .binding = &shader_injection.custom_depth_blur,
        .default_value = 50.f,
        .label = "Depth Blur Amount",
        .section = "Effects",
        .tooltip = "Adjusts the amount of depth blur.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpeningType",
        .binding = &shader_injection.custom_sharpening_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Sharpening Type",
        .section = "RenoFX",
        .tooltip = "Select sharpening method. NIS only available with DLSS.",
        .labels = {"NIS", "Lilium's HDR RCAS"},
    },
    new renodx::utils::settings::Setting{
    .key = "FxSharpness",
    .binding = &shader_injection.custom_sharpness,
    .default_value = 0.f,
    .label = "Sharpness",
    .section = "RenoFX",
    .tooltip = "Controls Sharpness",
    .max = 100.f,
    .parse = [](float value) { 
        if (CUSTOM_SHARPENING_TYPE == 0) {
            return value * 0.02f; // NIS
        }
        return value == 0 ? 0.f : exp2(-(1.f - (value * 0.01f))); },
},
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 0.f,
        .label = "FilmGrain",
        .section = "RenoFX",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "UtilHUD",
    //     .binding = &shader_injection.utility_hud,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "HUD",
    //     .section = "Utility",
    //     .tooltip = "Show or hide the HUD",
    //     .labels = {"Off", "On"},
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
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
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = " - In-game HDR/Gamma settings are disabled by RenoDX, adjust peak/game/ui brightness in the mod.",
        .section = "Notes",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "RenoDX Discord",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch(("https://discord.gg/QgXDC") + std::string("fccRy"));
        },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github Discussions",
        .section = "Links",
        .group = "button-line-1",
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx/discussions/254");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-1",
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx");
        },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More RenoDX Mods",
        .section = "Links",
        .group = "button-line-1",
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx/wiki/Mods/");
        },
    },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Jon's Ko-Fi",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/kickfister");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Game mod by Jon (OopyDoopy/Kickfister)",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "HDR RCAS by Lilium",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "HUGE thanks to the whole community of RenoDX modders for their help on this one <3",
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
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);

  renodx::utils::settings::UpdateSetting("SceneGradeHueCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("LutGradeStrength", 100.f);
  renodx::utils::settings::UpdateSetting("LutScaling", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeStrength", 100.f);
    renodx::utils::settings::UpdateSetting("GradingImprovements", 0.f);

  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);

  renodx::utils::settings::UpdateSetting("SwapChainCustomColorSpace", 0.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 0.f);
  renodx::utils::settings::UpdateSetting("FxPostProcessingMaxCLL", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
  renodx::utils::settings::UpdateSetting("FxLensDirt", 50.f);
  renodx::utils::settings::UpdateSetting("FxSunShaftStrength", 50.f);
  renodx::utils::settings::UpdateSetting("FxVignetteBlackLevel", 0.f);
  renodx::utils::settings::UpdateSetting("FxVignette", 100.f);
  renodx::utils::settings::UpdateSetting("FxDepthBlur", 50.f);
  renodx::utils::settings::UpdateSetting("FxSharpeningType", 0.f);
  renodx::utils::settings::UpdateSetting("FxSharpness", 50.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  shader_injection.last_is_hdr = renodx::utils::swapchain::IsHDRColorSpace(swapchain);
  if (fired_on_init_swapchain) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    peak_white_nits_setting->default_value = roundf(peak.value());
  } else {
    peak_white_nits_setting->default_value = 1000.f;
  }
  fired_on_init_swapchain = true;
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  static std::mt19937 random_generator(std::chrono::system_clock::now().time_since_epoch().count());
  static auto random_range = static_cast<float>(std::mt19937::max() - std::mt19937::min());
  CUSTOM_RANDOM = static_cast<float>(random_generator() + std::mt19937::min()) / random_range;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for The Witcher 3: Wild Hunt";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      // while (IsDebuggerPresent() == 0) Sleep(100);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;
      //renodx::mods::shader::allow_multiple_push_constants = true;
      //renodx::mods::shader::force_pipeline_cloning = true;
      // renodx::mods::shader::on_create_pipeline_layout = [](auto, auto params) {
      //     return static_cast<bool>(params.size() < 20);
      // };
      //renodx::mods::shader::use_pipeline_layout_cloning = true;
      //renodx::mods::swapchain::use_resource_cloning = true;

      //renodx::utils::shader::use_replace_async = true; 
      renodx::mods::swapchain::use_resource_cloning = true;

      // renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //     .old_format = reshade::api::format::r8g8b8a8_unorm,
      //     .new_format = reshade::api::format::r16g16b16a16_float,
      //     .ignore_size = false,
      //     .use_resource_view_cloning = true,
      //     .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::ANY,
      // });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);

      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
