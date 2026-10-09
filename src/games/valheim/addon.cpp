/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <algorithm>
#include <array>
#include <chrono>
#include <iomanip>
#include <optional>
#include <random>
#include <sstream>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

float output_mode = 0.f;
float current_settings_mode = 0.f;
float developer_mode_enabled = 0.f;

renodx::utils::settings::Setting* output_mode_setting = nullptr;
renodx::utils::settings::Setting* tone_map_peak_nits_setting = nullptr;
renodx::utils::settings::Setting* tone_map_game_nits_setting = nullptr;
renodx::utils::settings::Setting* tone_map_ui_nits_setting = nullptr;
reshade::api::swapchain* tracked_swapchain = nullptr;
std::optional<reshade::api::color_space> next_color_space = std::nullopt;
std::optional<bool> windows_hdr_enabled = std::nullopt;

float prism_primary_mode = 3.f;
float prism_temperature = 6501.7344f;
float prism_tint = 0.0031730535f;
float prism_strength = 1.f;
float prism_global_reach = 1.f;
float prism_global_hue = 0.f;
float prism_red_reach = 1.f;
float prism_red_hue = 0.f;
float prism_green_reach = 1.f;
float prism_green_hue = 0.f;
float prism_blue_reach = 1.f;
float prism_blue_hue = 0.f;
float prism_use_hand_tuned_matrix = 0.f;
float prism_highlight_contrast = 1.f;
float prism_shadow_contrast = 1.f;
renodx::utils::prism::ResolvedConfig prism_resolved = {};

bool IsHDREnabled();

void HandleOutputModeChange() {
  const bool is_hdr = IsHDREnabled();
  if (is_hdr) {
    next_color_space = reshade::api::color_space::hdr10_st2084;
    shader_injection.swap_chain_output_preset = 1.f;
    shader_injection.peak_white_nits = tone_map_peak_nits_setting->GetValue();
    shader_injection.diffuse_white_nits = tone_map_game_nits_setting->GetValue();
    shader_injection.graphics_white_nits = tone_map_ui_nits_setting->GetValue();
  } else {
    next_color_space = reshade::api::color_space::srgb_nonlinear;
    shader_injection.swap_chain_output_preset = 0.f;
    shader_injection.peak_white_nits = 1.f;
    shader_injection.diffuse_white_nits = 1.f;
    shader_injection.graphics_white_nits = 1.f;
  }
}

bool IsAutoOutputMode() {
  return output_mode_setting != nullptr && output_mode_setting->GetValue() == 0.f;
}

bool IsHDREnabled() {
  if (output_mode_setting == nullptr) {
    return shader_injection.swap_chain_output_preset == 1.f;
  }

  const float selected_output_mode = output_mode_setting->GetValue();
  return selected_output_mode == 2.f
         || (selected_output_mode == 0.f && windows_hdr_enabled.value_or(false));
}

bool UpdateWindowsHDRState(reshade::api::swapchain* swapchain) {
  if (!IsAutoOutputMode() || swapchain == nullptr) return false;

  const auto display_info = renodx::utils::swapchain::GetDisplayInfo(swapchain);
  const bool is_hdr = display_info.hdr_supported && display_info.hdr_enabled;
  if (windows_hdr_enabled.has_value() && windows_hdr_enabled.value() == is_hdr) {
    return false;
  }

  windows_hdr_enabled = is_hdr;
  return true;
}

// Matrix from DD2 mod
// constexpr std::array<std::array<float, 4>, 3> HAND_TUNED_PRISM_MATRIX = {{
//     {{0.601409376f, 0.319229364f, 0.059557181f, 0.f}},
//     {{0.119388245f, 0.964542985f, -0.091308258f, 0.f}},
//     {{0.033780906f, 0.162302926f, 0.870757520f, 0.f}},
// }};

constexpr std::array<std::array<float, 4>, 3> HAND_TUNED_PRISM_MATRIX = {{{{0.553717375f, 0.371007562f, 0.075275056f, 0.f}},
                                                                          {{0.037809514f, 0.816623986f, 0.145566508f, 0.f}},
                                                                          {{0.009873773f, 0.102929868f, 0.887196362f, 0.f}}

}};

bool IsDeveloperMenuVisible() {
  return developer_mode_enabled != 0.f
         && current_settings_mode >= 2.f;
}

bool IsPrismDeveloperMenuVisible() {
  return IsDeveloperMenuVisible()
         && RENODX_TONE_MAP_TYPE == 2.f;
}

bool IsPrismPrimaryControlsEnabled() {
  return IsPrismDeveloperMenuVisible()
         && prism_use_hand_tuned_matrix == 0.f;
}

int GetPrismPrimaryMode() {
  return std::clamp(static_cast<int>(prism_primary_mode), 0, 5);
}

renodx::utils::prism::Gamut GetPrismGamut() {
  switch (GetPrismPrimaryMode()) {
    case 0:  return renodx::utils::prism::Gamut::BT709;
    case 1:  return renodx::utils::prism::Gamut::DCI_P3;
    case 2:  return renodx::utils::prism::Gamut::BT2020;
    case 3:  return renodx::utils::prism::Gamut::AP1;
    case 4:  return renodx::utils::prism::Gamut::LMS_BT709_WHITE;
    case 5:  return renodx::utils::prism::Gamut::BT2020;
    default: return renodx::utils::prism::Gamut::AP1;
  }
}

std::string FormatPrismMatrix() {
  std::ostringstream message;
  message << std::fixed << std::setprecision(9);

  const auto& matrix = prism_use_hand_tuned_matrix != 0.f
                           ? HAND_TUNED_PRISM_MATRIX
                           : prism_resolved.inset_rows;
  for (const auto& row : matrix) {
    message << "  ["
            << row[0] << ", "
            << row[1] << ", "
            << row[2] << "]\n";
  }
  return message.str();
}

void ResolvePrismInjection() {
  auto config = renodx::utils::prism::AuthoringConfig{};
  config.gamut = GetPrismGamut();
  if (GetPrismPrimaryMode() == 5) {
    config.gamut = renodx::utils::prism::Gamut::BT2020;
    config.allow_primary_extrapolation = true;
    config.temperature_kelvin = prism_temperature;
    config.tint_duv = prism_tint;
    config.strength = prism_strength;
    config.global_reach = prism_global_reach;
    config.global_hue_degrees = prism_global_hue;
    config.red_reach = prism_red_reach;
    config.red_hue_degrees = prism_red_hue;
    config.green_reach = prism_green_reach;
    config.green_hue_degrees = prism_green_hue;
    config.blue_reach = prism_blue_reach;
    config.blue_hue_degrees = prism_blue_hue;
  } else {
    auto white = renodx::utils::prism::WhitePreset::D65;
    if (config.gamut == renodx::utils::prism::Gamut::AP1) {
      white = renodx::utils::prism::WhitePreset::D60;
    } else if (config.gamut == renodx::utils::prism::Gamut::DCI_P3) {
      white = renodx::utils::prism::WhitePreset::DCI;
    }
    const auto preset = renodx::utils::prism::TemperatureTintFromXY(
        static_cast<float>(white[0]), static_cast<float>(white[1]));
    config.temperature_kelvin = preset.kelvin;
    config.tint_duv = preset.tint_duv;
  }

  prism_resolved = renodx::utils::prism::Resolve(config);
  const auto& matrix = prism_use_hand_tuned_matrix != 0.f
                           ? HAND_TUNED_PRISM_MATRIX
                           : prism_resolved.inset_rows;
  shader_injection.prism_inset_00 = matrix[0][0];
  shader_injection.prism_inset_01 = matrix[0][1];
  shader_injection.prism_inset_02 = matrix[0][2];
  shader_injection.prism_inset_10 = matrix[1][0];
  shader_injection.prism_inset_11 = matrix[1][1];
  shader_injection.prism_inset_12 = matrix[1][2];
  shader_injection.prism_inset_20 = matrix[2][0];
  shader_injection.prism_inset_21 = matrix[2][1];
  shader_injection.prism_inset_22 = matrix[2][2];
  shader_injection.prism_highlight_contrast = prism_highlight_contrast;
  shader_injection.prism_shadow_contrast = prism_shadow_contrast;
}

void OnPrismSettingChange(float previous_value, float current_value) {
  (void)previous_value;
  (void)current_value;
  ResolvePrismInjection();
}

float SetSDR();

float SetHDR();

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0x20133A8B),  // Final
    CustomShaderEntry(0x99D271BE),  // Lutsample
    CustomShaderEntry(0x103B8DEE),  // Sun Shafts 1
    CustomShaderEntry(0xBCC908FC),  // Sun Shafts 2
    CustomShaderEntry(0x9325D090),  // Sun Shafts 3 (+ intermediate pass)
    CustomShaderEntry(0x56B8D689),  // Lutbuilder (alternate hash)
    CustomShaderEntry(0xF70A0EED),  // Lutbuilder
};

const std::unordered_map<std::string, float> FANTASY_HDR_VALUES = {
    {"ToneMapCurve", 0.f},
    {"ColorGradeExposure", 0.70f},
    {"ColorGradeHighlights", 74.f},
    {"ColorGradeShadows", 53.f},
    {"ColorGradeContrast", 50.f},
    {"ColorGradeSaturation", 62.f},
    {"ColorGradeHighlightSaturation", 50.f},
    {"ColorGradeBlowout", 58.f},
    {"ColorGradeFlare", 72.f},
    {"SceneGradeLutStrength", 95.f},
    {"FxChromaticAberration", 0.f},
    {"FxLensDirt", 0.f},
    {"FxSunShafts", 52.f},
};

const std::unordered_map<std::string, float> FILMIC_HDR_VALUES = {
    {"ToneMapCurve", 0.f},
    {"ColorGradeExposure", 1.15f},
    {"ColorGradeHighlights", 66.f},
    {"ColorGradeShadows", 55.f},
    {"ColorGradeContrast", 50.f},
    {"ColorGradeSaturation", 55.f},
    {"ColorGradeHighlightSaturation", 50.f},
    {"ColorGradeBlowout", 75.f},
    {"ColorGradeFlare", 86.f},
    {"FxBloom", 60.f},
    {"FxSunShafts", 36.f},
};

const std::unordered_map<std::string, float> VANILLA_SDR_VALUES = {
    {"ToneMapType", 0.f},
    {"ToneMapPeakNits", 80.f},
    {"ToneMapGameNits", 80.f},
    {"ToneMapUINits", 80.f},
};

const std::unordered_map<std::string, float> VANILLA_PLUS_SDR_VALUES = {
    {"ToneMapPeakNits", 80.f},
    {"ToneMapGameNits", 80.f},
    {"ToneMapUINits", 80.f},
    {"ColorGradeHighlights", 70.f},
    {"ColorGradeContrast", 60.f},
    {"ColorGradeSaturation", 54.f},
    {"ColorGradeBlowout", 50.f},
    {"FxSunShafts", 44.f},
};

renodx::utils::settings::Settings settings = {

    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Advanced", "Developer"},
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ValheimDeveloperMode",
        .binding = &developer_mode_enabled,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Developer Mode",
        .is_global = true,
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This menu is truly advanced and should be ignored by most people",
        .section = "Warning",
        .tint = 0xFF0000,
        .is_visible = []() { return IsDeveloperMenuVisible(); },
    },
    output_mode_setting = new renodx::utils::settings::Setting{
        .key = "OutputMode",
        .binding = &output_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Output Mode",
        .section = "Output",
        .tooltip = "Auto will match system state. SDR and HDR can be selected manually.",
        .labels = {"Auto", "SDR", "HDR"},
        .on_change_value = [](float, float current_value) {
          if (current_value == 0.f) {
            windows_hdr_enabled = std::nullopt;
          }
          HandleOutputModeChange(); },
        .is_visible = []() { return settings[0]->GetValue() >= 1; }},
    new renodx::utils::settings::Setting{
        .key = "OutputEncoding",
        .binding = &RENODX_SDR_ENCODING,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Output Encoding",
        .section = "Output",
        .tooltip = "This should match the gamma target used by your display. If unsure, 2.2 is probably correct.",
        .labels = {"sRGB", "2.2", "2.4"},
        .is_visible = []() { return !IsHDREnabled(); },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &RENODX_TONE_MAP_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla = original\nVanilla+ = RenoDX ACES v1\nPrism = Custom tonemapper with a hand tuned color space for this game\nNOTE: SWITCHING TO OR FROM VANILLA WON'T WORK WITHOUT TRIGGERING A LOADING SCREEN.",
        .labels = {"Vanilla", "Vanilla+", "Prism"},
        .parse = [](float value) { return value; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapCurve",
        .binding = &RENODX_TONE_MAP_CURVE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Tone Map Curve",
        .section = "Tone Mapping",
        .tooltip = "Recommended uses my hand tuned configuration, designed to be vanilla friendly; Custom starts from a neutral base that you can tweak from.",
        .labels = {"Recommended", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1 && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    tone_map_peak_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 10000.f,
        .is_enabled = &IsHDREnabled,
        .is_visible = &IsHDREnabled,
        .is_logarithmic = true,
        //.is_visible = []() { return settings[1]->GetValue() == 1; },
    },
    tone_map_game_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &RENODX_DIFFUSE_WHITE_NITS,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 48.f,
        .max = 500.f,
        .is_enabled = &IsHDREnabled,
        .is_visible = &IsHDREnabled,
        //.is_visible = []() { return settings[1]->GetValue() == 1; },
    },
    tone_map_ui_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &RENODX_GRAPHICS_WHITE_NITS,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 48.f,
        .max = 500.f,
        .is_enabled = &IsHDREnabled,
        .is_visible = &IsHDREnabled,
        //.is_visible = []() { return settings[1]->GetValue() == 1; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "ToneMapHueProcessor",
    //     .binding = &RENODX_TONE_MAP_HUE_PROCESSOR,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "Hue Processor",
    //     .section = "Tone Mapping",
    //     .tooltip = "Selects hue processor",
    //     .labels = {"OKLab", "ICtCp"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
    //     .is_visible = []() { return IsDeveloperMenuVisible(); },
    // },
    // new renodx::utils::settings::Setting{
    //         .key = "SceneGradeHueCorrection",
    //         .binding = &shader_injection.scene_grade_hue_correction,
    //         .default_value = 100.f,
    //         .label = "Hue Correction",
    //         .section = "Scene Grading",
    //         .max = 100.f,
    //         .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //         .parse = [](float value) { return value * 0.01f; },
    //         .is_visible = []() { return IsDeveloperMenuVisible(); },
    //     },
    //             new renodx::utils::settings::Setting{
    //         .key = "SceneGradeHueShift",
    //         .binding = &shader_injection.scene_grade_hue_shift,
    //         .default_value = 100.f,
    //         .label = "Hue Shift",
    //         .section = "Scene Grading",
    //         .max = 100.f,
    //         .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //         .parse = [](float value) { return value * 0.01f; },
    //         .is_visible = []() { return IsDeveloperMenuVisible(); },
    //     },
    //     new renodx::utils::settings::Setting{
    //         .key = "SceneGradeSaturationCorrection",
    //         .binding = &shader_injection.scene_grade_saturation_correction,
    //         .default_value = 100.f,
    //         .label = "Saturation Correction",
    //         .section = "Scene Grading",
    //         .max = 100.f,
    //         .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //         .parse = [](float value) { return value * 0.01f; },
    //         .is_visible = []() { return IsDeveloperMenuVisible(); },
    //     },

    new renodx::utils::settings::Setting{
        .key = "PrismMatrixSource",
        .binding = &prism_use_hand_tuned_matrix,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Primary Matrix",
        .section = "Prism Primaries",
        .labels = {"Prism Controls", "Recommended"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismPrimaryMode",
        .binding = &prism_primary_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .label = "Primary Mode",
        .section = "Prism Primaries",
        .labels = {"BT.709", "DCI-P3", "BT.2020", "AP1", "LMS", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismTemperature",
        .binding = &prism_temperature,
        .default_value = 6501.7344f,
        .label = "White Temperature",
        .section = "Prism Primaries",
        .min = 1667.f,
        .max = 25000.f,
        .format = "%.0f K",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismTint",
        .binding = &prism_tint,
        .default_value = 0.0031730535f,
        .label = "White Tint (Duv)",
        .section = "Prism Primaries",
        .min = -0.05f,
        .max = 0.05f,
        .format = "%.4f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismStrength",
        .binding = &prism_strength,
        .default_value = 100.f,
        .label = "Primary Strength",
        .section = "Prism Primaries",
        .max = 100.f,
        .format = "%.0f%%",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGlobalReach",
        .binding = &prism_global_reach,
        .default_value = 100.f,
        .label = "Global Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGlobalHue",
        .binding = &prism_global_hue,
        .default_value = 0.f,
        .label = "Global Rotation",
        .section = "Prism Primaries",
        .min = -180.f,
        .max = 180.f,
        .format = "%.1fÂ°",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismRedReach",
        .binding = &prism_red_reach,
        .default_value = 100.f,
        .label = "Red Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismRedHue",
        .binding = &prism_red_hue,
        .default_value = 0.f,
        .label = "Red Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1fÂ°",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGreenReach",
        .binding = &prism_green_reach,
        .default_value = 100.f,
        .label = "Green Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGreenHue",
        .binding = &prism_green_hue,
        .default_value = 0.f,
        .label = "Green Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1fÂ°",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismBlueReach",
        .binding = &prism_blue_reach,
        .default_value = 100.f,
        .label = "Blue Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismBlueHue",
        .binding = &prism_blue_hue,
        .default_value = 0.f,
        .label = "Blue Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1fÂ°",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && prism_use_hand_tuned_matrix == 0.f && GetPrismPrimaryMode() == 5; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .section = "Prism Primaries",
        .on_draw = []() {
          ResolvePrismInjection();
          if (prism_use_hand_tuned_matrix != 0.f) {
            ImGui::TextDisabled("Recommended hand-tuned Prism matrix is active.");
          } else {
            renodx::utils::prism::ui::DrawCIE1931Chart(
                prism_resolved,
                GetPrismGamut());
          }
          ImGui::TextUnformatted("BT.709 to Prism Matrix");
          static std::string matrix_text;
          matrix_text = FormatPrismMatrix();
          ImVec2 matrix_size = ImGui::GetContentRegionAvail();
          matrix_size.y = ImGui::GetTextLineHeightWithSpacing() * 4.f;
          ImGui::InputTextMultiline(
              "##PrismMatrix",
              matrix_text.data(),
              matrix_text.size() + 1,
              matrix_size,
              ImGuiInputTextFlags_ReadOnly);
          return false; },
        .is_visible = []() { return IsDeveloperMenuVisible()
                                    && RENODX_TONE_MAP_TYPE == 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "SceneGradeLutStrength",
        .binding = &CUSTOM_LUT_STRENGTH,
        .default_value = 100.f,
        .label = "Grading Strength",
        .section = "Scene Grading",
        .tooltip = "Adjusts how much the original grading affects the image.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "SceneGradeLutScaling",
        .binding = &CUSTOM_LUT_SCALING,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Scene Grading",
        .tooltip = "Scales the black/white point of the grading to use the full range.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "SceneGradeLutScalingTarget",
        .binding = &CUSTOM_LUT_SCALING_TARGET,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .label = "LUT Scaling Target",
        .section = "Scene Grading",
        .tooltip = "Hue Preserving uses the minimum channel; Perfect Black uses the maximum channel.",
        .labels = {"Hue Preserving", "Perfect Black"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &RENODX_TONE_MAP_EXPOSURE,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightContrast",
        .binding = &prism_highlight_contrast,
        .default_value = 50.f,
        .label = "Highlight Contrast",
        .section = "Color Grading",
        .tooltip = "Controls broad contrast above the anchor.",
         .max = 100.f,
         .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
         .parse = [](float value) { return value * 0.02f; },
         .on_change_value = &OnPrismSettingChange,
         .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &RENODX_TONE_MAP_CONTRAST,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 0; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadowContrast",
        .binding = &prism_shadow_contrast,
        .default_value = 50.f,
        .label = "Shadow Contrast",
        .section = "Color Grading",
        .tooltip = "Controls broad contrast below the anchor.",
         .max = 100.f,
         .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
         .parse = [](float value) { return value * 0.02f; },
         .on_change_value = &OnPrismSettingChange,
         .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &RENODX_TONE_MAP_SHADOWS,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &RENODX_TONE_MAP_FLARE,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .parse = [](float value) { return value * 0.001f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &RENODX_TONE_MAP_SATURATION,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f; },
        .parse = [](float value) { return fmax(value * 0.01f, 0.000001f); },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayIn",
        .binding = &RENODX_TONE_MAP_MID_GRAY_IN,
        .default_value = 0.18f,
        .label = "Mid Gray In",
        .section = "Color Grading",
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && RENODX_TONE_MAP_CURVE != 0.f; },
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayOut",
        .binding = &RENODX_TONE_MAP_MID_GRAY_OUT,
        .default_value = 0.18f,
        .label = "Mid Gray Out",
        .section = "Color Grading",
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2.f && RENODX_TONE_MAP_CURVE != 0.f; },
        .is_visible = []() { return IsDeveloperMenuVisible() && RENODX_TONE_MAP_TYPE != 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &CUSTOM_CHROMATIC_ABERRATION,
        .default_value = 50.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tooltip = "Adjust the intensity of color fringing.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &CUSTOM_BLOOM,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxLensDirt",
        .binding = &CUSTOM_LENS_DIRT,
        .default_value = 50.f,
        .label = "Lens Dirt",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSunShafts",
        .binding = &CUSTOM_SUN_SHAFTS,
        .default_value = 50.f,
        .label = "Sun Shafts",
        .section = "Effects",
        .tooltip = "Adjust the intensity of sun shafts.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },

    // new renodx::utils::settings::Setting{
    //     .key = "FxFilmGrain",
    //     .binding = &shader_injection.custom_film_grain,
    //     .default_value = 0.f,
    //     .label = "Film Grain",
    //     .section = "Custom Effects",
    //     .tooltip = "Controls new perceptual film grain. Reduces banding.",
    //     .max = 100.f,
    //     .parse = [](float value) { return value * 0.01f; },
    // },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Options",
        .group = "button-line-2",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "RenoDX Discord",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch(
              "https://discord.gg/QgXDCfccRy");
        },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More RenoDX Mods",
        .section = "Links",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::Launch(
              "https://github.com/clshortfuse/renodx/wiki/Mods");
        },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Donate (Ko-fi)",
        .section = "Links",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::Launch("https://ko-fi.com/kickfister");
        },
    },
};  // namespace

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapCurve", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("ColorGradeMidGrayIn", 0.18f);
  renodx::utils::settings::UpdateSetting("ColorGradeMidGrayOut", 0.15f);
  renodx::utils::settings::UpdateSetting("SceneGradeLutStrength", 100.f);
  renodx::utils::settings::UpdateSetting("SceneGradeLutScaling", 100.f);
  renodx::utils::settings::UpdateSetting("SceneGradeLutScalingTarget", 0.f);
  renodx::utils::settings::UpdateSetting("PrismMatrixSource", 0.f);
  renodx::utils::settings::UpdateSetting("PrismPrimaryMode", 3.f);
  renodx::utils::settings::UpdateSetting("PrismTemperature", 6501.7344f);
  renodx::utils::settings::UpdateSetting("PrismTint", 0.0031730535f);
  renodx::utils::settings::UpdateSetting("PrismStrength", 100.f);
  renodx::utils::settings::UpdateSetting("PrismGlobalReach", 100.f);
  renodx::utils::settings::UpdateSetting("PrismGlobalHue", 0.f);
  renodx::utils::settings::UpdateSetting("PrismRedReach", 100.f);
  renodx::utils::settings::UpdateSetting("PrismRedHue", 0.f);
  renodx::utils::settings::UpdateSetting("PrismGreenReach", 100.f);
  renodx::utils::settings::UpdateSetting("PrismGreenHue", 0.f);
  renodx::utils::settings::UpdateSetting("PrismBlueReach", 100.f);
  renodx::utils::settings::UpdateSetting("PrismBlueHue", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadowContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
  renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
  renodx::utils::settings::UpdateSetting("FxSunShafts", 50.f);
  ResolvePrismInjection();
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    if (auto* peak_setting = renodx::utils::settings::FindSetting("ToneMapPeakNits"); peak_setting != nullptr) {
      peak_setting->default_value = peak.value();
      peak_setting->can_reset = true;
    }
  }
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  if (tracked_swapchain != swapchain) {
    tracked_swapchain = swapchain;
    windows_hdr_enabled = std::nullopt;
    UpdateWindowsHDRState(swapchain);
    HandleOutputModeChange();
  } else {
    if (UpdateWindowsHDRState(swapchain)) {
      HandleOutputModeChange();
    }
    if (next_color_space.has_value()) {
      renodx::utils::swapchain::ChangeColorSpace(
          tracked_swapchain,
          next_color_space.value());
      next_color_space = std::nullopt;
    }
  }

  static std::mt19937 random_generator(std::chrono::system_clock::now().time_since_epoch().count());
  static auto random_range = static_cast<float>(std::mt19937::max() - std::mt19937::min());
  CUSTOM_RANDOM = static_cast<float>(random_generator() + std::mt19937::min()) / random_range;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Valheim";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      renodx::mods::swapchain::use_resource_cloning = true;
      // renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      // renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      renodx::mods::swapchain::force_borderless = true;
      renodx::mods::swapchain::force_screen_tearing = true;

      renodx::mods::shader::force_pipeline_cloning = true;

      renodx::mods::swapchain::SetUseHDR10();

      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          //.ignore_size = true,
          .use_resource_view_cloning = true,
          .aspect_ratio = -1,
      });
      //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r8g8b8a8_typeless,
      //                                                                  .new_format = reshade::api::format::r16g16b16a16_float,
      //                                                                  //.ignore_size = true,
      //                                                                  .dimensions = {.height = 32u}});

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);
      renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&HandleOutputModeChange);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);

  if (fdw_reason == DLL_PROCESS_ATTACH) {
    if (developer_mode_enabled == 0.f) {
      auto* settings_mode = renodx::utils::settings::FindSetting("SettingsMode");
      if (settings_mode != nullptr) {
        settings_mode->labels.resize(2);
        if (current_settings_mode >= 2.f) {
          renodx::utils::settings::UpdateSetting("SettingsMode", 1.f);
        }
      }
    }
    ResolvePrismInjection();
    HandleOutputModeChange();
  }

  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);

  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
