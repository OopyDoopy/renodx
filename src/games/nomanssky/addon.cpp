/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0
// #define DEBUG_LEVEL_1
// #define DEBUG_LEVEL_2
// #define DEBUG_LEVEL_3
#include <algorithm>
#include <array>
#include <iomanip>
#include <sstream>


#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/swapchain.hpp"
#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/date.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/random.hpp"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;
int draw_counter = 0;
bool final_draw = false;

float current_settings_mode = 0;

float PRISM_PRIMARY_MODE = 0.f;
float PRISM_GAMUT = 3.f;
float PRISM_TEMPERATURE = 6501.7344f;
float PRISM_TINT = 0.0031730535f;
float PRISM_STRENGTH = 1.f;
float PRISM_GLOBAL_REACH = 1.f;
float PRISM_GLOBAL_HUE = 0.f;
float PRISM_RED_REACH = 1.f;
float PRISM_RED_HUE = 0.f;
float PRISM_GREEN_REACH = 1.f;
float PRISM_GREEN_HUE = 0.f;
float PRISM_BLUE_REACH = 1.f;
float PRISM_BLUE_HUE = 0.f;
renodx::utils::prism::ResolvedConfig prism_resolved = {};

constexpr std::array<std::array<float, 4>, 3> RECOMMENDED_PRISM_MATRIX = {{
  {{0.604203820f, 0.378966302f, 0.016829902f, 0.f}},
  {{0.026408589f, 0.938620269f, 0.034971133f, 0.f}},
  {{0.012595000f, 0.087343633f, 0.900061369f, 0.f}},
}};

  #define FinalShaderEntry(value)                         \
  {                                                               \
    value,                                                        \
        {                                                         \
            .crc32 = value,                                       \
            .code = __##value,                                    \
            .on_drawn = [](auto cmd_list) {                       \
              final_draw = true;                                  \
              return true;                                        \
            },                                                    \
        },                                                        \
  }

renodx::mods::shader::CustomShaders custom_shaders = {
  FinalShaderEntry(0x9610E0B4),
  __ALL_CUSTOM_SHADERS,
};






int GetPrismPrimaryMode() {
  return std::clamp(static_cast<int>(PRISM_PRIMARY_MODE), 0, 1);
}

bool IsPrismCustomMode() {
  return GetPrismPrimaryMode() == 1;
}

bool IsPrismEnabled() {
  return RENODX_TONE_MAP_TYPE == 1.f;
}

renodx::utils::prism::Gamut GetPrismGamut() {
  if (!IsPrismCustomMode()) {
    return renodx::utils::prism::Gamut::AP1;
  }

  switch (std::clamp(static_cast<int>(PRISM_GAMUT), 0, 4)) {
    case 0: return renodx::utils::prism::Gamut::BT709;
    case 1: return renodx::utils::prism::Gamut::DCI_P3;
    case 2: return renodx::utils::prism::Gamut::BT2020;
    case 3: return renodx::utils::prism::Gamut::AP1;
    case 4: return renodx::utils::prism::Gamut::LMS_BT709_WHITE;
    default: return renodx::utils::prism::Gamut::AP1;
  }
}

std::string FormatPrismMatrix() {
  std::ostringstream message;
  message << std::fixed << std::setprecision(9);
  const auto& matrix = IsPrismCustomMode()
                           ? prism_resolved.inset_rows
                           : RECOMMENDED_PRISM_MATRIX;
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
  config.gamut = renodx::utils::prism::Gamut::AP1;

  const std::array<std::array<float, 4>, 3>* matrix = &RECOMMENDED_PRISM_MATRIX;
  if (IsPrismCustomMode()) {
    config.gamut = GetPrismGamut();
    config.allow_primary_extrapolation = true;
    config.temperature_kelvin = PRISM_TEMPERATURE;
    config.tint_duv = PRISM_TINT;
    config.strength = PRISM_STRENGTH;
    config.global_reach = PRISM_GLOBAL_REACH;
    config.global_hue_degrees = PRISM_GLOBAL_HUE;
    config.red_reach = PRISM_RED_REACH;
    config.red_hue_degrees = PRISM_RED_HUE;
    config.green_reach = PRISM_GREEN_REACH;
    config.green_hue_degrees = PRISM_GREEN_HUE;
    config.blue_reach = PRISM_BLUE_REACH;
    config.blue_hue_degrees = PRISM_BLUE_HUE;
  }

  prism_resolved = renodx::utils::prism::Resolve(config);
  if (IsPrismCustomMode()) matrix = &prism_resolved.inset_rows;

  const auto& selected_matrix = *matrix;
  shader_injection.prism_inset_00 = selected_matrix[0][0];
  shader_injection.prism_inset_01 = selected_matrix[0][1];
  shader_injection.prism_inset_02 = selected_matrix[0][2];
  shader_injection.prism_inset_10 = selected_matrix[1][0];
  shader_injection.prism_inset_11 = selected_matrix[1][1];
  shader_injection.prism_inset_12 = selected_matrix[1][2];
  shader_injection.prism_inset_20 = selected_matrix[2][0];
  shader_injection.prism_inset_21 = selected_matrix[2][1];
  shader_injection.prism_inset_22 = selected_matrix[2][2];
}

void OnPrismSettingChange(float previous_value, float current_value) {
  (void)previous_value;
  (void)current_value;
  ResolvePrismInjection();
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
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
          .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
          .tooltip = "Vanilla keeps the game's original tonemapping systems. Prism upgrades the game's tonemapping and postprocessing for a higher quality output.",
          .labels = {"Vanilla", "Prism"},
        .parse = [](float value) { return value; },
    },
        new renodx::utils::settings::Setting{
          .key = "ToneMapCurve",
          .binding = &shader_injection.tone_map_curve,
          .value_type = renodx::utils::settings::SettingValueType::INTEGER,
          .default_value = 0.f,
          .can_reset = true,
          .label = "Tone Curve",
          .section = "Tone Mapping",
          .tooltip = "Recommended uses my hand tuned configuration. Custom starts from scratch and you need to adjust the look.",
          .labels = {"Recommended", "Custom"},
          .is_enabled = []() { return IsPrismEnabled(); },
          .is_visible = []() { return current_settings_mode >= 2.f; },
        },
    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits.",
        .min = 80.f,
        .max = 4000.f,
          .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .is_visible = []() { return LAST_IS_HDR == 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits.",
        .min = 80.f,
        .max = 500.f,
          .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .is_visible = []() { return LAST_IS_HDR == 1.f; },
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
          .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .is_visible = []() { return LAST_IS_HDR == 1.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "SDRLUTEncoding",
        .binding = &shader_injection.sdr_encoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Display Gamma",
        .section = "Tone Mapping",
        .tooltip = "Select the gamma transfer that matches your display. If unsure, 2.2 is probably correct.",
        .labels = {"sRGB", "2.2", "2.4"},
        .is_enabled = []() { return IsPrismEnabled(); },
        .is_visible = []() { return current_settings_mode > 0.f && LAST_IS_HDR != 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismPrimaryMode",
        .binding = &PRISM_PRIMARY_MODE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Primary Mode",
        .section = "Prism Primaries",
        .tooltip = "Recommended uses my hand tuned Prism matrix. Custom enables the working-gamut and primary authoring controls.",
        .labels = {"Recommended", "Custom"},
        .is_enabled = []() { return IsPrismEnabled(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGamut",
        .binding = &PRISM_GAMUT,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .label = "Working Gamut",
        .section = "Prism Primaries",
        .tooltip = "Selects the starting gamut for Custom Prism primary authoring.",
        .labels = {"BT.709", "DCI-P3", "BT.2020", "AP1", "LMS"},
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismTemperature",
        .binding = &PRISM_TEMPERATURE,
        .default_value = 6501.7344f,
        .label = "White Temperature",
        .section = "Prism Primaries",
        .tooltip = "Sets the authoring white point on the Planckian locus.",
        .min = 1667.f,
        .max = 25000.f,
        .format = "%.0f K",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismTint",
        .binding = &PRISM_TINT,
        .default_value = 0.0031730535f,
        .label = "White Tint (Duv)",
        .section = "Prism Primaries",
        .tooltip = "Offsets the authoring white from the Planckian locus. Positive values shift toward green.",
        .min = -0.05f,
        .max = 0.05f,
        .format = "%.4f",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismStrength",
        .binding = &PRISM_STRENGTH,
        .default_value = 100.f,
        .label = "Primary Strength",
        .section = "Prism Primaries",
        .tooltip = "Scales all authored reach and hue changes.",
        .max = 100.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGlobalReach",
        .binding = &PRISM_GLOBAL_REACH,
        .default_value = 100.f,
        .label = "Global Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales all three primary axes around the selected white. The effective custom reach is capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGlobalHue",
        .binding = &PRISM_GLOBAL_HUE,
        .default_value = 0.f,
        .label = "Global Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates all three primary rays coherently in CIE 1931 xy.",
        .min = -180.f,
        .max = 180.f,
        .format = "%.1f deg",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismRedReach",
        .binding = &PRISM_RED_REACH,
        .default_value = 100.f,
        .label = "Red Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismRedHue",
        .binding = &PRISM_RED_HUE,
        .default_value = 0.f,
        .label = "Red Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f deg",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGreenReach",
        .binding = &PRISM_GREEN_REACH,
        .default_value = 100.f,
        .label = "Green Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismGreenHue",
        .binding = &PRISM_GREEN_HUE,
        .default_value = 0.f,
        .label = "Green Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f deg",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismBlueReach",
        .binding = &PRISM_BLUE_REACH,
        .default_value = 100.f,
        .label = "Blue Reach",
        .section = "Prism Primaries",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "PrismBlueHue",
        .binding = &PRISM_BLUE_HUE,
        .default_value = 0.f,
        .label = "Blue Rotation",
        .section = "Prism Primaries",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f deg",
        .is_enabled = []() { return IsPrismEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .section = "Prism Primaries",
        .on_draw = []() {
          ResolvePrismInjection();
          renodx::utils::prism::ui::DrawCIE1931Chart(
            prism_resolved,
            GetPrismGamut());
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
        .is_visible = []() { return current_settings_mode >= 2.f && IsPrismEnabled(); },
      },
      new renodx::utils::settings::Setting{
        .key = "SceneGradeLUTStrength",
        .binding = &shader_injection.scene_grade_lut_strength,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Scene Grading",
        .tooltip = "Controls the strength of the game's scene color-grading LUT chain.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "SceneGradeLUTScaling",
        .binding = &shader_injection.scene_grade_lut_scaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Scene Grading",
        .tooltip = "Removes the LUT black-level raise toward the selected reference while preserving scene shadows.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "SceneGradeLUTScalingTarget",
        .binding = &shader_injection.scene_grade_lut_scaling_target,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "LUT Scaling Target",
        .section = "Scene Grading",
        .tooltip = "Hue Preserving uses the minimum LUT-black channel. Detail Restoring weighs each channel's distance to the LUT shadow reference independently.",
        .labels = {"Hue Preserving", "Detail Restoring"},
        .is_enabled = []() { return shader_injection.scene_grade_lut_scaling > 0.f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
      },
new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return IsPrismEnabled(); },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
      .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.0001f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapMidGrayIn",
        .binding = &shader_injection.tone_map_mid_gray_in,
        .default_value = 0.18f,
        .can_reset = true,
        .label = "Mid Gray In",
        .section = "Color Grading",
        .tooltip = "Manual Prism input anchor. Vanilla Match derives this from the live game curve.",
        .min = 0.01f,
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return IsPrismEnabled() && RENODX_TONE_MAP_CURVE != 0.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "ToneMapMidGrayOut",
        .binding = &shader_injection.tone_map_mid_gray_out,
        .default_value = 0.18f,
        .can_reset = true,
        .label = "Mid Gray Out",
        .section = "Color Grading",
        .tooltip = "Manual Prism output anchor corresponding to Mid Gray In.",
        .min = 0.01f,
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return IsPrismEnabled() && RENODX_TONE_MAP_CURVE != 0.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
      },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 0.f,
        .label = "Film Grain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain.",
        .max = 100.f,
        .is_enabled = []() { return IsPrismEnabled(); },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode > 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Tools",
        .group = "button-line-1",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
          ResolvePrismInjection();
        },
    },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "RenoDX Discord",
            .section = "Links",
            .group = "button-line-2",
            .tint = 0x5865F2,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://discord.gg/kSTf", "EbcCpC");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "HDR Den Discord",
            .section = "Links",
            .group = "button-line-2",
            .tint = 0x5865F2,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://discord.gg/XUhv", "tR54yc");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "Github",
            .section = "Links",
            .group = "button-line-2",
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx");
            },
        },
                new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Jon's Ko-Fi",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/kickfister");
        },
    },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "Ritsu's Ko-Fi",
            .section = "Links",
            .group = "button-line-2",
            .tint = 0xFF5F5F,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://ko-fi.com/ritsucecil");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "ShortFuse's Ko-Fi",
            .section = "Links",
            .group = "button-line-2",
            .tint = 0xFF5F5F,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::TEXT,
            .label = "Game mod by Jon, RenoDX Vulkan Support by Ritsu, RenoDX Framework by ShortFuse.",
            .section = "About",
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::TEXT,
            .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
            .section = "About",
        },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
  {"ToneMapCurve", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
  {"ToneMapMidGrayIn", 0.18f},
  {"ToneMapMidGrayOut", 0.18f},
  {"SDRLUTEncoding", 1.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
      {"SceneGradeLUTStrength", 100.f},
      {"SceneGradeLUTScaling", 0.f},
      {"SceneGradeLUTScalingTarget", 0.f},
        {"FxFilmGrain", 0.f},
      {"PrismPrimaryMode", 0.f},
      {"PrismGamut", 3.f},
      {"PrismTemperature", 6501.7344f},
      {"PrismTint", 0.0031730535f},
      {"PrismStrength", 100.f},
      {"PrismGlobalReach", 100.f},
      {"PrismGlobalHue", 0.f},
      {"PrismRedReach", 100.f},
      {"PrismRedHue", 0.f},
      {"PrismGreenReach", 100.f},
      {"PrismGreenHue", 0.f},
      {"PrismBlueReach", 100.f},
      {"PrismBlueHue", 0.f},
  });
  ResolvePrismInjection();
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {

  draw_counter++;

  if (draw_counter > 5) {
    LAST_IS_HDR = final_draw ? 1.f : 0.f;
    final_draw = false;
    draw_counter = 0;
  }
}

bool initialized = false;

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for No Man's Sky";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  auto use_resource_view_cloning = true;
  auto common_aspect_ratio = -1.f;
  auto common_aspect_ratio_tolerance = 0.00001f;
  auto common_ignore_size = false;
  auto windowed_aspect_ratio = 2582.f / 1452.f;
  const auto target_format = reshade::api::format::r16g16b16a16_float;
  const auto view_upgrades = renodx::utils::resource::VIEW_UPGRADES_RGBA16F;
  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions dimensions = {
      .width = renodx::utils::resource::ResourceUpgradeInfo::BACK_BUFFER,
      .height = renodx::utils::resource::ResourceUpgradeInfo::BACK_BUFFER,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::BACK_BUFFER,
  };

  // Self explanatory
  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions min_dimensions = {
      .width = 720,
      .height = renodx::utils::resource::ResourceUpgradeInfo::ANY,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::ANY,
  };

  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      // Always set to true for Vulkan
      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::swapchain::use_resource_cloning = false;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      renodx::mods::swapchain::target_format = target_format;

      //renodx::mods::swapchain::SetUseHDR10();

      renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&ResolvePrismInjection);
      ResolvePrismInjection();

      /*
        Aux constant buffer (Check shared.h) size is 120, but we force align it to 128.
        This also helps if our shader_injection isn't aligned properly
      */
      // renodx::mods::shader::force_align_constant_buffers_to_16 = true;

      /*
        True means it'll attempt to expand current cbuffer definitions instead of adding a new push constant
        entry. You'll have to experiment with this if cbuffer injection doesn't work
      */
      //renodx::mods::shader::expand_existing_constant_buffer = true;

      /*
        If expand_existing_constant_buffer is set to false renoDX will add new cbuffer range (instead of reusing the game's).
        This behaviour is overridden if renoDX finds a cbuffer that targets all shader_stages in minimum_constant_buffer_stages.
        e.g. If a game's cbuffer range targets all stages, renoDX will expand it regardless of expand_existing_constant_buffer value.
        Remove the stages you're not injecting to.
      */
      renodx::mods::shader::minimum_constant_buffer_stages = reshade::api::shader_stage::pixel | reshade::api::shader_stage::compute | reshade::api::shader_stage::vertex;

      //renodx::mods::shader::use_pipeline_layout_cloning = true;
      //common_aspect_ratio = renodx::utils::resource::ResourceUpgradeInfo::ANY;
      common_aspect_ratio_tolerance = 0.0001f;

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8a8_unorm_srgb,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8a8_unorm,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

      // renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //     .old_format = reshade::api::format::r8g8b8a8_typeless,
      //     .new_format = target_format,
      //     .ignore_size = common_ignore_size,
      //     .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
      //     .aspect_ratio = common_aspect_ratio,
      //     .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
      //     .view_upgrades = view_upgrades,
      //     .min_dimensions = min_dimensions,
      // });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8a8_unorm_srgb,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8x8_unorm,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8x8_unorm_srgb,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::r8g8b8a8_typeless,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_unorm,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_unorm,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = windowed_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_typeless,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = windowed_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_typeless,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_unorm_srgb,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = windowed_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //       .usage_include = reshade::api::resource_usage::render_target | reshade::api::resource_usage::unordered_access,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_typeless,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
    //       .old_format = reshade::api::format::b8g8r8a8_unorm_srgb,
    //       .new_format = target_format,
    //       .ignore_size = common_ignore_size,
    //       .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //       .aspect_ratio = common_aspect_ratio,
    //       .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //       .view_upgrades = view_upgrades,
    //       .min_dimensions = min_dimensions,
    //       .usage_include = reshade::api::resource_usage::render_target | reshade::api::resource_usage::unordered_access,
    //   });

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r10g10b10a2_unorm,
    //                                                                  .new_format = target_format,
    //                                                                  .ignore_size = common_ignore_size,
    //                                                                  .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //                                                                  .aspect_ratio = common_aspect_ratio,
    //                                                                  .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //                                                                  .view_upgrades = view_upgrades});

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r10g10b10a2_typeless,
    //                                                                  .new_format = target_format,
    //                                                                  .ignore_size = common_ignore_size,
    //                                                                  .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //                                                                  .aspect_ratio = common_aspect_ratio,
    //                                                                  .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //                                                                  .view_upgrades = view_upgrades});

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::b10g10r10a2_unorm,
    //                                                                  .new_format = target_format,
    //                                                                  .ignore_size = common_ignore_size,
    //                                                                  .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //                                                                  .aspect_ratio = common_aspect_ratio,
    //                                                                  .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //                                                                  .view_upgrades = view_upgrades});

    //   renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::b10g10r10a2_typeless,
    //                                                                  .new_format = target_format,
    //                                                                  .ignore_size = common_ignore_size,
    //                                                                  .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
    //                                                                  .aspect_ratio = common_aspect_ratio,
    //                                                                  .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
    //                                                                  .view_upgrades = view_upgrades});

      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .ignore_size = common_ignore_size,
          .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
          .aspect_ratio = common_aspect_ratio,
          .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
          .view_upgrades = view_upgrades,
          .min_dimensions = min_dimensions,
      });

      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r10g10b10a2_typeless,
          .ignore_size = common_ignore_size,
          .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
          .aspect_ratio = 1.f,
          .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
          .view_upgrades = view_upgrades,
          //.min_dimensions = min_dimensions,
      });

      if (!initialized) {
        initialized = true;
      }
      reshade::register_event<reshade::addon_event::present>(OnPresent);
      break;
    case DLL_PROCESS_DETACH:
    reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::random::Use(fdw_reason, {&shader_injection.custom_random});
  //renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
