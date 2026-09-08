/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#include <atomic>
#include <iomanip>
#include <sstream>

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../utils/platform.hpp"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "../../utils/random.hpp"
#include "../../utils/vtable.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;
bool is_hdr_color_space = false;

renodx::utils::prism::ResolvedConfig prism_resolved = {};
std::atomic_bool tonemap_lut_needs_refresh = false;

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

constexpr std::array<std::array<float, 4>, 3> HAND_TUNED_PRISM_MATRIX = {{
  {{0.601409376f, 0.319229364f, 0.059557181f, 0.f}},
  {{0.119388245f, 0.964542985f, -0.091308258f, 0.f}},
  {{0.033780906f, 0.162302926f, 0.870757520f, 0.f}},
}};


renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;
float disable_reshade_logging = 1.f;

int GetPrismPrimaryMode() {
  return std::clamp(static_cast<int>(prism_primary_mode), 0, 5);
}

bool IsPrismCustomMode() {
  return GetPrismPrimaryMode() == 5;
}

bool IsTonemapRealtime() {
  return RENODX_TONE_MAP_OPTIMIZATION == 0.f;
}

bool IsPrismAuthoringEnabled() {
  return RENODX_TONE_MAP_TYPE == 1.f
      && IsTonemapRealtime()
      && prism_use_hand_tuned_matrix == 0.f;
}

renodx::utils::prism::Gamut GetPrismGamut() {
  switch (GetPrismPrimaryMode()) {
    case 0: return renodx::utils::prism::Gamut::BT709;
    case 1: return renodx::utils::prism::Gamut::DCI_P3;
    case 2: return renodx::utils::prism::Gamut::BT2020;
    case 3: return renodx::utils::prism::Gamut::AP1;
    case 4: return renodx::utils::prism::Gamut::LMS_BT709_WHITE;
    case 5: return renodx::utils::prism::Gamut::BT2020;
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
  const auto gamut = GetPrismGamut();
  config.gamut = gamut;
  if (IsPrismCustomMode()) {
    // Custom starts from BT.2020 and allows the authored RGB basis to extend
    // beyond its starting primary radius.
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
    // Named modes use their conventional/reference white points. D65 is used
    // for BT.709, BT.2020, and LMS; AP1 uses D60; DCI-P3 uses DCI white.
    auto white_xy = renodx::utils::prism::WhitePreset::D65;
    if (gamut == renodx::utils::prism::Gamut::AP1) {
      white_xy = renodx::utils::prism::WhitePreset::D60;
    } else if (gamut == renodx::utils::prism::Gamut::DCI_P3) {
      white_xy = renodx::utils::prism::WhitePreset::DCI;
    }
    const auto preset_white = renodx::utils::prism::TemperatureTintFromXY(
        static_cast<float>(white_xy[0]),
        static_cast<float>(white_xy[1]));
    config.temperature_kelvin = preset_white.kelvin;
    config.tint_duv = preset_white.tint_duv;
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
}

void MarkTonemapLutDirty() {
  tonemap_lut_needs_refresh.store(
      RENODX_TONE_MAP_OPTIMIZATION != 0.f && RENODX_TONE_MAP_TYPE == 1.f,
      std::memory_order_relaxed);
}

void OnTonemapSettingChange(float previous_value, float current_value) {
  (void)previous_value;
  (void)current_value;
  MarkTonemapLutDirty();
}

void OnPrismSettingChange(float previous_value, float current_value) {
  (void)previous_value;
  (void)current_value;
  ResolvePrismInjection();
  MarkTonemapLutDirty();
}

void OnPresetChanged() {
  ResolvePrismInjection();
  MarkTonemapLutDirty();
}

void OnLutBuilderDrawn(reshade::api::command_list* command_list) {
  (void)command_list;
  tonemap_lut_needs_refresh.store(false, std::memory_order_relaxed);
}

void AttachLutBuilderCallbacks() {
  constexpr std::array<uint32_t, 3> lutbuilder_hashes = {
      0xA387A14B,
      0x0A72472F,
      0x960797FD,
  };
  for (const auto hash : lutbuilder_hashes) {
    if (auto shader = custom_shaders.find(hash); shader != custom_shaders.end()) {
      shader->second.on_drawn = &OnLutBuilderDrawn;
    }
  }
}


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
        .label = "This menu is truly advanced and should be ignored by most people",
        .section = "Warning",
        .tint = 0xFF0000,
        .is_visible = []() { return current_settings_mode >= 2.f; },
      },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Requires changing brightness options or restarting the game to apply tonemapping changes.",
        .section = "Warning",
        .tint = 0xFF0000,
        .is_visible = []() {
          return tonemap_lut_needs_refresh.load(std::memory_order_relaxed);
        },
        .is_sticky = true,
      },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla uses the game's original LUT and tone mapping.\nPrism replaces the game's tone mapper with a custom tone mapper, hand tuned to enhance the look of the game faithfully.",
        .labels = {"Vanilla", "Prism"},
        .is_enabled = []() { return IsTonemapRealtime(); },
        .parse = [](float value) { return value; },
        .on_change_value = &OnTonemapSettingChange,
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "ToneMapCurve",
        .binding = &RENODX_TONE_MAP_CURVE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Tone Curve",
        .section = "Tone Mapping",
        .tooltip = "Recommended uses my hand tuned configuration. Custom starts from scratch and you need to heavily adjust the look.",
        .labels = {"Recommended", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f && IsTonemapRealtime(); },
        .on_change_value = &OnTonemapSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f; },
      },
    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 80.f,
        .max = 10000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .on_change_value = &OnTonemapSettingChange,
        .is_visible = []() { return current_settings_mode >= 0.f && is_hdr_color_space; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 80.f,
        .max = 500.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .on_change_value = &OnTonemapSettingChange,
        .is_visible = []() { return current_settings_mode >= 0.f && is_hdr_color_space; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &shader_injection.graphics_white_nits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 80.f,
        .max = 500.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .is_visible = []() { return current_settings_mode >= 0.f && is_hdr_color_space; },
      },
      new renodx::utils::settings::Setting{
        .key = "SDRLUTEncoding",
        .binding = &shader_injection.sdr_encoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Display Gamma",
        .section = "Tone Mapping",
        .tooltip = "This should match the gamma target used by your display. If unsure, 2.2 is probably correct.",
        .labels = {"sRGB", "2.2", "2.4"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value; },
        .on_change_value = &OnTonemapSettingChange,
        .is_visible = []() { return !is_hdr_color_space; },
    },
    new renodx::utils::settings::Setting{
      .key = "SceneGradeLUTStrength",
      .binding = &SCENE_GRADE_LUT_STRENGTH,
      .default_value = 100.f,
      .label = "LUT Strength",
      .section = "Scene Grading",
      .tooltip = "Adjusts the strength of the scene color-grading LUTs.",
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
      .parse = [](float value) { return value * 0.01f; },
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
      .key = "SceneGradeLUTScaling",
      .binding = &SCENE_GRADE_LUT_SCALING,
      .default_value = 100.f,
      .label = "LUT Scaling",
      .section = "Scene Grading",
      .tooltip = "Scales the color down proportionate to the amount of black level raise.",
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
      .parse = [](float value) { return value * 0.01f; },
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
      .key = "SceneGradeLUTScalingTarget",
      .binding = &SCENE_GRADE_LUT_SCALING_TARGET,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "LUT Scaling Target",
      .section = "Scene Grading",
      .tooltip = "Hue Preserving uses the minimum channel, fully preserving the tint of the LUT while lowering the raise as much as possible\nPerfect Black uses the maximum channel, ensuring that LUTs will always reach black",
      .labels = {"Hue Preserving", "Perfect Black"},
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
      .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.02f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.02f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
      .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.02f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.02f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adjusts saturation in highlights.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.02f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
      },
        new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return fmax(0.0001f, value * 0.01f); },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
      .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value * 0.001f; },
        .on_change_value = &OnTonemapSettingChange,
          .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayIn",
        .binding = &RENODX_TONE_MAP_MID_GRAY_IN,
        .default_value = 0.18f,
        .label = "Mid Gray In",
        .section = "Color Grading",
        .tooltip = "Controls the pivot point used by grading sliders. When mismatched with Mid Gray Out, average brightness is scaled linearly.",
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_CURVE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value; },
        .on_change_value = &OnTonemapSettingChange,
           .is_visible = []() { return current_settings_mode >= 2.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayOut",
        .binding = &RENODX_TONE_MAP_MID_GRAY_OUT,
      .default_value = 0.18f,
        .label = "Mid Gray Out",
        .section = "Color Grading",
        .tooltip = "Controls the output level corresponding to Mid Gray In. When mismatched, average brightness is scaled linearly.",
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_CURVE != 0.f && IsTonemapRealtime(); },
        .parse = [](float value) { return value; },
        .on_change_value = &OnTonemapSettingChange,
            .is_visible = []() { return current_settings_mode >= 2.f; },
    },
      new renodx::utils::settings::Setting{
          .key = "PrismMatrixSource",
          .binding = &prism_use_hand_tuned_matrix,
          .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
          .default_value = 1.f,
          .label = "Primary Matrix",
          .section = "Prism Primaries",
          .tooltip = "Selects between Prism's generated primary matrix and the hand-tuned matrix.",
          .labels = {"Prism Controls", "Recommended"},
          .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f && IsTonemapRealtime(); },
          .on_change_value = &OnPrismSettingChange,
          .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
        },
        new renodx::utils::settings::Setting{
        .key = "PrismPrimaryMode",
        .binding = &prism_primary_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .label = "Primary Mode",
        .section = "Prism Primaries",
        .tooltip = "Selects the fixed working basis. Custom starts from BT.2020 and enables primary tuning controls.",
        .labels = {"BT.709", "DCI-P3", "BT.2020", "AP1", "LMS", "Custom"},
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsTonemapRealtime(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismTemperature",
        .binding = &prism_temperature,
        .default_value = 6501.7344f,
        .label = "White Temperature",
        .section = "Prism Primaries",
        .tooltip = "Sets the primary-authoring white point on the Planckian locus.",
        .min = 1667.f,
        .max = 25000.f,
        .format = "%.0f K",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismTint",
        .binding = &prism_tint,
        .default_value = 0.0031730535f,
        .label = "White Tint (Duv)",
        .section = "Prism Primaries",
        .tooltip = "Offsets the authoring white in CIE 1960 UCS. Positive values shift toward green.",
        .min = -0.05f,
        .max = 0.05f,
        .format = "%.4f",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismStrength",
        .binding = &prism_strength,
        .default_value = 100.f,
        .label = "Primary Strength",
        .section = "Prism Primaries",
        .tooltip = "Scales all authored reach and hue changes.",
        .max = 100.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGlobalReach",
        .binding = &prism_global_reach,
        .default_value = 100.f,
        .label = "Global Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales all three RGB basis axes around the selected white. Custom values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGlobalHue",
        .binding = &prism_global_hue,
        .default_value = 0.f,
        .label = "Global Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates all three RGB basis axes coherently in CIE 1931 xy.",
        .min = -180.f,
        .max = 180.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismRedReach",
        .binding = &prism_red_reach,
        .default_value = 100.f,
        .label = "Red Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the R basis axis around the selected white. Custom values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismRedHue",
        .binding = &prism_red_hue,
        .default_value = 0.f,
        .label = "Red Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the R basis axis in CIE 1931 xy within the safe angular limit.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGreenReach",
        .binding = &prism_green_reach,
        .default_value = 100.f,
        .label = "Green Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the G basis axis around the selected white. Custom values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGreenHue",
        .binding = &prism_green_hue,
        .default_value = 0.f,
        .label = "Green Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the G basis axis in CIE 1931 xy within the safe angular limit.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismBlueReach",
        .binding = &prism_blue_reach,
        .default_value = 100.f,
        .label = "Blue Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the B basis axis around the selected white. Custom values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismBlueHue",
        .binding = &prism_blue_hue,
        .default_value = 0.f,
        .label = "Blue Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the B basis axis in CIE 1931 xy within the safe angular limit.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .section = "Prism Primaries",
        .on_draw = []() {
          ResolvePrismInjection();
          if (prism_use_hand_tuned_matrix == 0.f) {
            renodx::utils::prism::ui::DrawCIE1931Chart(prism_resolved, GetPrismGamut());
          } else {
            ImGui::TextDisabled("Hand-Tuned Matrix is active; Prism primary controls are bypassed.");
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
          return false;
        },
        .is_visible = []() {
          return current_settings_mode >= 2.f
             && RENODX_TONE_MAP_TYPE == 1.f;
        },
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
          .is_visible = []() { return current_settings_mode >= 0.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 30.f,
        .label = "FilmGrain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .max = 100.f,
        .is_enabled = []() { return CUSTOM_FILM_GRAIN_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
          .is_visible = []() { return current_settings_mode >= 0.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxVignette",
        .binding = &shader_injection.custom_vignette,
        .default_value = 100.f,
        .label = "Vignette",
        .section = "Effects",
        .tooltip = "Adjusts vignette strength.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
          .is_visible = []() { return current_settings_mode >= 0.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "FxFXAA",
        .binding = &shader_injection.custom_fxaa,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .label = "FXAA",
        .section = "Effects",
        .tooltip = "Enables the game's FXAA pass. Vanilla is On (not ideal with DLSS/FSR).",
          .is_visible = []() { return current_settings_mode >= 0.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "ToneMapOptimization",
        .binding = &RENODX_TONE_MAP_OPTIMIZATION,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .label = "Optimize Tonemapping",
        .section = "Utility",
        .tooltip = "Increases performance but you lose real-time grading and tone map type selection.\nThe performance increase is relatively minor, but can matter on lower end hardware.\nTo use correctly, configure your desired settings, switch to On, then restart the game or change in-game brightness settings.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return true; },
        .on_change_value = [](float, float) { MarkTonemapLutDirty(); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
      },
    new renodx::utils::settings::Setting{
      .key = "DisableReShadeLogging",
      .binding = &disable_reshade_logging,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 1.f,
      .label = "Disable Logging",
      .section = "Utility",
      .tooltip = "The game causes ReShade to write an abnormal amount of info into the log, quickly ballooning in size and potentially hampering CPU performance. Disable logging by default to prevent this problem.\nThis option is provided in case logging is needed for troubleshooting.",
      .labels = {"Off", "On"},
      .parse = [](float value) {
        reshade::set_config_value(nullptr, "INSTALL", "Logging", value == 0.f ? 1 : 0);
        return value;
      },
      .is_global = true,
      .is_visible = []() { return current_settings_mode >= 1.f; },
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
          ResolvePrismInjection();
        },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "RenoDX Discord",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch("https://discord.gg/QgXDCfccRy");
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
        .label = "Game mod by Jon (OopyDoopy/Kickfister), RenoDX Framework by Shortfuse",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This build was compiled on " + build_date + " at " + build_time + ".",
        .section = "About",
    },
};

float hide_freesync_hdr = 1.f;

constexpr int AMD_AGS_SUCCESS = 0;
constexpr int AMD_AGS_FAILURE = 1;

struct AmdAgsRect {
  int offset_x;
  int offset_y;
  int width;
  int height;
};

struct AmdAgsDisplayInfo {
  char name[256];
  char display_device_name[32];
  unsigned int is_primary_display : 1;
  unsigned int hdr10 : 1;
  unsigned int dolby_vision : 1;
  unsigned int freesync : 1;
  unsigned int freesync_hdr : 1;
  unsigned int eyefinity_in_group : 1;
  unsigned int eyefinity_preferred_display : 1;
  unsigned int eyefinity_in_portrait_mode : 1;
  unsigned int reserved_padding : 24;
  int max_resolution_x;
  int max_resolution_y;
  float max_refresh_rate;
  AmdAgsRect current_resolution;
  AmdAgsRect visible_resolution;
  float current_refresh_rate;
  int eyefinity_grid_coord_x;
  int eyefinity_grid_coord_y;
  double chromaticity_red_x;
  double chromaticity_red_y;
  double chromaticity_green_x;
  double chromaticity_green_y;
  double chromaticity_blue_x;
  double chromaticity_blue_y;
  double chromaticity_white_point_x;
  double chromaticity_white_point_y;
  double screen_diffuse_reflectance;
  double screen_specular_reflectance;
  double min_luminance;
  double max_luminance;
  double avg_luminance;
  int logical_display_index;
  int adl_adapter_index;
  int reserved;
};

struct AmdAgsDeviceInfo {
  const char* adapter_string;
  int asic_family;
  unsigned int is_apu : 1;
  unsigned int is_primary_device : 1;
  unsigned int is_external : 1;
  unsigned int reserved_padding : 29;
  int vendor_id;
  int device_id;
  int revision_id;
  int num_cus;
  int num_wgps;
  int num_rops;
  int core_clock;
  int memory_clock;
  int memory_bandwidth;
  float tera_flops;
  unsigned long long local_memory_in_bytes;
  unsigned long long shared_memory_in_bytes;
  int num_displays;
  AmdAgsDisplayInfo* displays;
  int eyefinity_enabled;
  int eyefinity_grid_width;
  int eyefinity_grid_height;
  int eyefinity_resolution_x;
  int eyefinity_resolution_y;
  int eyefinity_bezel_compensated;
  int adl_adapter_index;
  int reserved;
};

struct AmdAgsGpuInfo {
  const char* driver_version;
  const char* radeon_software_version;
  int num_devices;
  AmdAgsDeviceInfo* devices;
};

static void MaskAmdAgsGpuInfo(AmdAgsGpuInfo* gpu_info) {
  if (gpu_info == nullptr || gpu_info->devices == nullptr || hide_freesync_hdr == 0.f) return;
  if (gpu_info->num_devices < 0 || gpu_info->num_devices > 16) return;

  bool masked = false;

  for (int device_index = 0; device_index < gpu_info->num_devices; ++device_index) {
    auto& device_info = gpu_info->devices[device_index];
    if (device_info.displays == nullptr) continue;
    if (device_info.num_displays < 0 || device_info.num_displays > 32) continue;

    for (int display_index = 0; display_index < device_info.num_displays; ++display_index) {
      auto& display_info = device_info.displays[display_index];
      if (display_info.freesync_hdr != 0u) {
        display_info.freesync_hdr = 0u;
        masked = true;
      }
    }
  }

  if (masked) {
    static bool logged = false;
    if (!logged) {
      logged = true;
      reshade::log::message(
          reshade::log::level::info,
          "Hiding AMD FreeSync Premium HDR support via AGS while preserving normal HDR10 support.");
    }
  }
}

using PfnAgsInitialize = int (*)(int ags_version, const void* config, void** context, AmdAgsGpuInfo* gpu_info);
using PfnAgsGetGpuInfo = int (*)(void* context, AmdAgsGpuInfo* gpu_info);

PfnAgsInitialize real_ags_initialize = nullptr;
int HookAgsInitialize(int ags_version, const void* config, void** context, AmdAgsGpuInfo* gpu_info) {
  if (real_ags_initialize == nullptr) return AMD_AGS_FAILURE;

  const auto result = real_ags_initialize(ags_version, config, context, gpu_info);
  if (result == AMD_AGS_SUCCESS) {
    MaskAmdAgsGpuInfo(gpu_info);
  }
  return result;
}

PfnAgsGetGpuInfo real_ags_get_gpu_info = nullptr;
int HookAgsGetGpuInfo(void* context, AmdAgsGpuInfo* gpu_info) {
  if (real_ags_get_gpu_info == nullptr) return AMD_AGS_FAILURE;

  const auto result = real_ags_get_gpu_info(context, gpu_info);
  if (result == AMD_AGS_SUCCESS) {
    MaskAmdAgsGpuInfo(gpu_info);
  }
  return result;
}

void SetupPrototypeHooks() {
  static bool setup_complete = false;
  static renodx::utils::vtable::HookItem g_ags_hook_items[] = {
      {"agsInitialize", reinterpret_cast<void**>(&real_ags_initialize), reinterpret_cast<void*>(&HookAgsInitialize)},
      {"agsGetGPUInfo", reinterpret_cast<void**>(&real_ags_get_gpu_info), reinterpret_cast<void*>(&HookAgsGetGpuInfo)},
  };

  if (setup_complete) return;

  HMODULE h_ags = GetModuleHandleW(L"amd_ags_x64.dll");
  if (h_ags == nullptr) {
    h_ags = GetModuleHandleW(L"amd_ags.dll");
  }
  if (h_ags == nullptr) {
    return;
  }

  if (!renodx::utils::vtable::Hook(h_ags, g_ags_hook_items)) {
    reshade::log::message(reshade::log::level::error, "Failed to hook AMD AGS FreeSync HDR capability queries");
    return;
  }

  setup_complete = true;
}

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapOptimization", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 1000.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("SceneGradeLUTStrength", 100.f);
  renodx::utils::settings::UpdateSetting("SceneGradeLUTScaling", 100.f);
  renodx::utils::settings::UpdateSetting("SceneGradeLUTScalingTarget", 1.f);
  renodx::utils::settings::UpdateSetting("PrismMatrixSource", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
  renodx::utils::settings::UpdateSetting("SDRLUTEncoding", 1.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrainType", 0.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 50.f);
  renodx::utils::settings::UpdateSetting("FxVignette", 100.f);
  renodx::utils::settings::UpdateSetting("FxFXAA", 1.f);
  tonemap_lut_needs_refresh.store(false, std::memory_order_relaxed);
  ResolvePrismInjection();
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  is_hdr_color_space = renodx::utils::swapchain::IsHDRColorSpace(swapchain);
  if (fired_on_init_swapchain) return;
  SetupPrototypeHooks();

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  const float default_peak_nits = peak.has_value() ? roundf(peak.value()) : 1000.f;
  if (auto* peak_setting = renodx::utils::settings::FindSetting("ToneMapPeakNits"); peak_setting != nullptr) {
    peak_setting->default_value = default_peak_nits;
  }

  fired_on_init_swapchain = true;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Dragon's Dogma 2";

bool initialized = false;

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain
      if (!initialized) {
        renodx::mods::shader::allow_multiple_push_constants = true;
        renodx::mods::shader::expected_constant_buffer_space = 50;
        renodx::mods::shader::expected_constant_buffer_index = 13;

        SetupPrototypeHooks();
        AttachLutBuilderCallbacks();
        initialized = true;
      }

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      reshade::unregister_addon(h_module);
      break;
  }

  if (fdw_reason == DLL_PROCESS_ATTACH) {
    renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&OnPresetChanged);
  }
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  if (fdw_reason == DLL_PROCESS_ATTACH) {
    MarkTonemapLutDirty();
    ResolvePrismInjection();
  }
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}
