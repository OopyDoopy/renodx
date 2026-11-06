/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#include <include/reshade_api_format.hpp>
#define ImTextureID ImU64

#include <algorithm>
#include <array>
#include <iomanip>
#include <sstream>

#define DEBUG_LEVEL_0

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/random.hpp"

// #include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"
#include "./shared.h"

namespace {
ShaderInjectData shader_injection;
renodx::utils::prism::ResolvedConfig prism_resolved = {};

float PRISM_GLOBAL_REACH = 1.f;
float PRISM_GLOBAL_HUE = 0.f;
float PRISM_RED_REACH = 1.f;
float PRISM_RED_HUE = 0.f;
float PRISM_GREEN_REACH = 1.f;
float PRISM_GREEN_HUE = 0.f;
float PRISM_BLUE_REACH = 1.f;
float PRISM_BLUE_HUE = 0.f;
float PRISM_STRENGTH = 1.f;
float PRISM_PRIMARY_MODE = 3.f;
float PRISM_MATRIX_SOURCE = 1.f;
float PRISM_TEMPERATURE = 6501.7344f;
float PRISM_TINT = 0.0031730535f;

// Forza-tuned Recommended matrix: BT.2020 basis with the tuned primary
// reaches/rotations and the existing D65-ish structural white.
constexpr std::array<std::array<float, 4>, 3> RECOMMENDED_PRISM_MATRIX = {{
  {{0.604203820f, 0.378966302f, 0.016829902f, 0.f}},
  {{0.026408589f, 0.938620269f, 0.034971133f, 0.f}},
  {{0.012595000f, 0.087343633f, 0.900061369f, 0.f}},
}};

// Recommended + Warm White: the same tuned primaries with the 5787 K
// structural white shown in the tuning screenshot and the existing Duv tint.
constexpr std::array<std::array<float, 4>, 3> WARM_WHITE_PRISM_MATRIX = {{
  {{0.582662404f, 0.366362303f, 0.015178505f, 0.f}},
  {{0.027366783f, 0.946382761f, 0.036861274f, 0.f}},
  {{0.015750915f, 0.096747212f, 1.010492802f, 0.f}},
}};

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;

int GetPrismMatrixSource() {
  return std::clamp(static_cast<int>(PRISM_MATRIX_SOURCE), 0, 2);
}

int GetPrismPrimaryMode() {
  return std::clamp(static_cast<int>(PRISM_PRIMARY_MODE), 0, 5);
}

bool IsPrismCustomMode() {
  return GetPrismPrimaryMode() == 5;
}

bool IsPrismAuthoringEnabled() {
  return RENODX_TONE_MAP_TYPE == 1.f && GetPrismMatrixSource() == 0;
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

  const auto* matrix = &prism_resolved.inset_rows;
  if (GetPrismMatrixSource() == 1) {
    matrix = &RECOMMENDED_PRISM_MATRIX;
  } else if (GetPrismMatrixSource() == 2) {
    matrix = &WARM_WHITE_PRISM_MATRIX;
  }

  for (const auto& row : *matrix) {
    message << "  ["
            << row[0] << ", "
            << row[1] << ", "
            << row[2] << "]\n";
  }
  return message.str();
}

void ResolvePrismInjection() {
  const int matrix_source = GetPrismMatrixSource();
  const std::array<std::array<float, 4>, 3>* matrix = &RECOMMENDED_PRISM_MATRIX;
  if (matrix_source == 0) {
    auto config = renodx::utils::prism::AuthoringConfig{};
    const auto gamut = IsPrismCustomMode()
                           ? renodx::utils::prism::Gamut::BT2020
                           : GetPrismGamut();
    config.gamut = gamut;
    if (IsPrismCustomMode()) {
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
    } else {
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
    matrix = &prism_resolved.inset_rows;
  } else if (matrix_source == 2) {
    matrix = &WARM_WHITE_PRISM_MATRIX;
  }

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
        .label = "This menu is truly advanced and should be ignored by most people",
        .section = "Warning",
        .tint = 0xFF0000,
        .is_visible = []() { return current_settings_mode >= 2.f; },
      },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &RENODX_TONE_MAP_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.",
        .labels = {"Vanilla", "Prism"},
        .parse = [](float value) { return value; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapCurve",
        .binding = &CUSTOM_TONE_MAP_CURVE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Tone Curve",
        .section = "Tone Mapping",
        .tooltip = "Recommended uses the default grading values with contrast and flare tuned for Forza. Custom uses the controls exactly as set.",
        .labels = {"Recommended", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    },
    peak_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 80.f,
        .max = 10000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return RENODX_IS_HDR_COLOR_SPACE != 0.f; },
        .is_logarithmic = true,
    },
    diffuse_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &RENODX_DIFFUSE_WHITE_NITS,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 80.f,
        .max = 500.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return RENODX_IS_HDR_COLOR_SPACE != 0.f; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "UI Brightness controlled in-game.",
        .section = "Tone Mapping",
        .is_visible = []() { return RENODX_IS_HDR_COLOR_SPACE != 0.f; },
    },
    new renodx::utils::settings::Setting{
      .key = "SDRLUTEncoding",
      .binding = &RENODX_SDR_ENCODING,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .label = "Display Gamma",
      .section = "Tone Mapping",
      .tooltip = "Selects the transfer function used by the SDR display output.",
      .labels = {"sRGB", "2.2", "2.4"},
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
      .is_visible = []() { return RENODX_IS_HDR_COLOR_SPACE == 0.f; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "ToneMapUINits",
    //     .binding = &RENODX_GRAPHICS_WHITE_NITS,
    //     .default_value = 100.f,
    //     .label = "UI Brightness",
    //     .section = "Tone Mapping",
    //     .tooltip = "Sets the brightness of UI and HUD elements in nits",
    //     .min = 80.f,
    //     .max = 500.f,
    //     //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     //.is_visible = []() { return current_settings_mode >= 1.f; },
    // },
  new renodx::utils::settings::Setting{
    .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
    .label = "Primary Matrix",
    .section = "Prism Primaries",
    .tooltip = "Selects the Forza-tuned recommended matrix or its 5787 K warm-white variant.",
    .on_draw = []() {
      bool changed = false;
      if (RENODX_TONE_MAP_TYPE == 1.f && GetPrismMatrixSource() == 0) {
        renodx::utils::settings::UpdateSetting("PrismMatrixSource", 1.f);
        changed = true;
      }
      int selected_source = GetPrismMatrixSource() == 2 ? 1 : 0;
      const char* const labels[] = {
          "Recommended",
          "Recommended + Warm White",
      };
      changed |= ImGui::SliderInt(
          "Primary Matrix",
          &selected_source,
          0,
          1,
          labels[selected_source],
          ImGuiSliderFlags_NoInput);
      if (changed) {
        renodx::utils::settings::UpdateSetting(
            "PrismMatrixSource",
            static_cast<float>(selected_source + 1));
      }
      return changed;
    },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() {
      return current_settings_mode == 1.f && RENODX_TONE_MAP_TYPE == 1.f;
    },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismMatrixSource",
    .binding = &PRISM_MATRIX_SOURCE,
    .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    .default_value = 1.f,
    .label = "Primary Matrix",
    .section = "Prism Primaries",
    .tooltip = "Selects between Prism's CPU-resolved controls, the Forza-tuned recommended matrix, and its 5787 K warm-white variant.",
    .labels = {"Prism Controls", "Recommended", "Recommended + Warm White"},
    .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismPrimaryMode",
    .binding = &PRISM_PRIMARY_MODE,
    .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    .default_value = 3.f,
    .label = "Primary Mode",
    .section = "Prism Primaries",
    .tooltip = "Selects the fixed working basis. Custom starts from BT.2020 and enables primary tuning controls.",
    .labels = {"BT.709", "DCI-P3", "BT.2020", "AP1", "LMS", "Custom"},
    .is_enabled = []() { return IsPrismAuthoringEnabled(); },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismTemperature",
    .binding = &PRISM_TEMPERATURE,
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
    .binding = &PRISM_TINT,
    .default_value = 0.0031730535f,
    .label = "White Tint (Duv)",
    .section = "Prism Primaries",
    .tooltip = "Offsets the authoring white from the Planckian locus in CIE 1960 UCS. Positive values shift toward green.",
    .min = -0.05f,
    .max = 0.05f,
    .format = "%.4f",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismStrength",
    .binding = &PRISM_STRENGTH,
    .default_value = 100.f,
    .label = "Primary Strength",
    .section = "Prism Primaries",
    .tooltip = "Scales all authored reach and hue changes. Zero restores the selected gamut's canonical primaries.",
    .max = 100.f,
    .format = "%.0f%%",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .parse = [](float value) { return value * 0.01f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismGlobalReach",
    .binding = &PRISM_GLOBAL_REACH,
    .default_value = 100.f,
    .label = "Global Reach",
    .section = "Prism Primaries",
    .tooltip = "Scales all three RGB basis axes around the selected white. Values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
    .max = 200.f,
    .format = "%.0f%%",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .parse = [](float value) { return value * 0.01f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
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
    .format = "%.1f°",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismRedReach",
    .binding = &PRISM_RED_REACH,
    .default_value = 100.f,
    .label = "Red Reach",
    .section = "Prism Primaries",
    .tooltip = "Scales the R basis axis around the selected white. Values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
    .max = 200.f,
    .format = "%.0f%%",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .parse = [](float value) { return value * 0.01f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismRedHue",
    .binding = &PRISM_RED_HUE,
    .default_value = 0.f,
    .label = "Red Rotation",
    .section = "Prism Primaries",
    .tooltip = "Rotates the red primary ray in CIE 1931 xy within the safe angular limit.",
    .min = -45.f,
    .max = 45.f,
    .format = "%.1f°",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismGreenReach",
    .binding = &PRISM_GREEN_REACH,
    .default_value = 100.f,
    .label = "Green Reach",
    .section = "Prism Primaries",
    .tooltip = "Scales the G basis axis around the selected white. Values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
    .max = 200.f,
    .format = "%.0f%%",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .parse = [](float value) { return value * 0.01f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismGreenHue",
    .binding = &PRISM_GREEN_HUE,
    .default_value = 0.f,
    .label = "Green Rotation",
    .section = "Prism Primaries",
    .tooltip = "Rotates the green primary ray in CIE 1931 xy within the safe angular limit.",
    .min = -45.f,
    .max = 45.f,
    .format = "%.1f°",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismBlueReach",
    .binding = &PRISM_BLUE_REACH,
    .default_value = 100.f,
    .label = "Blue Reach",
    .section = "Prism Primaries",
    .tooltip = "Scales the B basis axis around the selected white. Values above 100% extrapolate the BT.2020 starting basis; effective reach is capped at 200%.",
    .max = 200.f,
    .format = "%.0f%%",
    .is_enabled = []() { return IsPrismAuthoringEnabled() && IsPrismCustomMode(); },
    .parse = [](float value) { return value * 0.01f; },
    .on_change_value = &OnPrismSettingChange,
    .is_visible = []() { return current_settings_mode >= 2.f && RENODX_TONE_MAP_TYPE == 1.f; },
  },
  new renodx::utils::settings::Setting{
    .key = "PrismBlueHue",
    .binding = &PRISM_BLUE_HUE,
    .default_value = 0.f,
    .label = "Blue Rotation",
    .section = "Prism Primaries",
    .tooltip = "Rotates the blue primary ray in CIE 1931 xy within the safe angular limit.",
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
      if (GetPrismMatrixSource() == 0) {
        renodx::utils::prism::ui::DrawCIE1931Chart(prism_resolved, GetPrismGamut());
      } else {
        ImGui::TextDisabled("Fixed matrix is active; Prism primary controls are bypassed.");
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
        .key = "SceneGradeLUTStrength",
        .binding = &SCENE_GRADE_LUT_STRENGTH,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Scene Grading",
        .tooltip = "Adjusts strenght of the color grading LUTs. Scene depedent behavior.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "SceneGradeLUTScaling",
        .binding = &SCENE_GRADE_LUT_SCALING,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Scene Grading",
        .tooltip = "Scales raised-black color grading LUTs toward full range. Scene dependent behavior.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &RENODX_TONE_MAP_EXPOSURE,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &RENODX_TONE_MAP_SHADOWS,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &RENODX_TONE_MAP_CONTRAST,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .min = 1.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f && RENODX_TONE_MAP_TYPE == 1.f; },
    },
      new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightContrast",
        .binding = &RENODX_TONE_MAP_HIGHLIGHT_CONTRAST,
        .default_value = 50.f,
        .label = "Highlight Contrast",
        .section = "Color Grading",
        .tooltip = "Controls contrast above the tonal anchor.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
      new renodx::utils::settings::Setting{
        .key = "ColorGradeShadowContrast",
        .binding = &RENODX_TONE_MAP_SHADOW_CONTRAST,
        .default_value = 50.f,
        .label = "Shadow Contrast",
        .section = "Color Grading",
        .tooltip = "Controls contrast below the tonal anchor.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f && RENODX_TONE_MAP_TYPE == 1.f; },
      },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &RENODX_TONE_MAP_SATURATION,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes color saturation in highlights.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &RENODX_TONE_MAP_FLARE,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f; },
        .parse = [](float value) { return value * 0.0001f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayIn",
        .binding = &RENODX_TONE_MAP_MID_GRAY_IN,
        .default_value = 0.18f,
        .label = "Mid Gray In",
        .section = "Color Grading",
        .tooltip = "Controls the pivot point used by grading sliders. When mismatched with Mid Gray Out, average brightness is scaled linearly.",
        .min = 0.01f,
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE == 1; },
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeMidGrayOut",
        .binding = &RENODX_TONE_MAP_MID_GRAY_OUT,
        .default_value = 0.18f,
        .label = "Mid Gray Out",
        .section = "Color Grading",
        .tooltip = "Controls the output level corresponding to Mid Gray In. When mismatched, average brightness is scaled linearly.",
        .min = 0.01f,
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE == 1; },
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrainType",
        .binding = &CUSTOM_FILM_GRAIN_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Film Grain Type",
        .section = "Effects",
        .tooltip = "Selects between original or RenoDX film grain",
        .labels = {"Vanilla", "Perceptual", "Perceptual Always On"},
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &CUSTOM_FILM_GRAIN_STRENGTH,
        .default_value = 100.f,
        .label = "FilmGrain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .max = 100.f,
        //.is_enabled = []() { return CUSTOM_FILM_GRAIN_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxVignette",
        .binding = &CUSTOM_VIGNETTE,
        .default_value = 100.f,
        .label = "Vignette",
        .section = "Effects",
        .tooltip = "Adjusts vignette strength.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &CUSTOM_CHROMATIC_ABERRATION,
        .default_value = 100.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tooltip = "Adjusts chromatic aberration strength.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 0.f; },
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
          } },
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

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapCurve", 0.f},
      {"SDRLUTEncoding", 1.f},
      {"PrismMatrixSource", 0.f},
      {"PrismPrimaryMode", 3.f},
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
      {"SceneGradeLUTStrength", 100.f},
      {"SceneGradeLUTScaling", 100.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeHighlightContrast", 50.f},
      {"ColorGradeShadowContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
      {"FxFilmGrainType", 0.f},
      {"FxFilmGrain", 100.f},
      {"FxVignette", 100.f},
      {"FxChromaticAberration", 100.f},
  });
}

bool initialized = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool /*resize*/) {
  RENODX_IS_HDR_COLOR_SPACE =
      renodx::utils::swapchain::IsHDRColorSpace(swapchain) ? 1.f : 0.f;
  if (initialized) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    peak_white_nits_setting->default_value = roundf(peak.value());
  } else {
    peak_white_nits_setting->default_value = 1000.f;
  }
  initialized = true;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX | Forza Horizon 6";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Forza Horizon 6";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::expected_constant_buffer_space = 50;

      renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&ResolvePrismInjection);
      ResolvePrismInjection();

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}
