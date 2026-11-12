/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#include <include/reshade_api_format.hpp>
#define ImTextureID ImU64

#include <algorithm>
#include <array>
#include <atomic>
#include <iomanip>
#include <optional>
#include <sstream>

#define DEBUG_LEVEL_0

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../utils/bitwise.hpp"
#include "../../utils/pipeline.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/random.hpp"

// #include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"
#include "./denoise.hpp"
#include "./guides.hpp"
#include "./nvngx_responsivity.hpp"
#include "./sl_rr.hpp"
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

renodx::mods::shader::CustomShaders custom_shaders = [] {
  renodx::mods::shader::CustomShaders shaders = {__ALL_CUSTOM_SHADERS};
  std::erase_if(shaders, [](const auto& shader) {
    return std::ranges::any_of(denoise::bypasses, [&shader](const auto& bypass) {
      return std::ranges::any_of(bypass.replacements, [&shader](const auto& replacement) {
        return shader.first == replacement.hash;
      });
    });
  });
  return shaders;
}();

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;
float developer_mode_enabled = 0.f;
std::atomic<bool> rr_nvidia_d3d12_device{false};
std::atomic<reshade::api::device*> rr_device = nullptr;

float rr_enable_setting = 0.f;
float rr_preset_setting = 2.f;
float rr_debug_log_setting = 0.f;
float rr_responsivity_setting = 0.f;
float rr_responsivity_auto_setting = 0.f;

constexpr uint32_t kRrPresetValues[3] = {
    static_cast<uint32_t>(sl::DLSSDPreset::ePresetD),
    static_cast<uint32_t>(sl::DLSSDPreset::ePresetE),
    static_cast<uint32_t>(sl::DLSSDPreset::ePresetF),
};

constexpr uint32_t kGiMissLimit = 8;
struct TierDetection {
  std::atomic<bool> bound{false};
  bool active = false;
  uint32_t presents_without = 0;
};
TierDetection high_gi;
TierDetection medium_gi;
bool warned_no_gi = false;

bool IsNvidiaRrVisible() {
  return rr_nvidia_d3d12_device.load();
}

bool IsNvidiaRrAdditionalSettingsVisible() {
  return IsNvidiaRrVisible() && current_settings_mode >= 1.f;
}

bool IsDeveloperMenuVisible() {
  return developer_mode_enabled != 0.f && current_settings_mode >= 2.f;
}

bool RrActive() {
  return rr_nvidia_d3d12_device.load() && rr_enable_setting != 0.f;
}

extern "C" IMAGE_DOS_HEADER __ImageBase;
void PinModule() {
  HMODULE self = nullptr;
  if (GetModuleHandleExW(
          GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_PIN,
          reinterpret_cast<LPCWSTR>(&__ImageBase), &self)
      == 0) {
    sl_rr::LogWarn("could NOT pin the addon module — hooks may dangle on unload");
  }
}

void ApplyRrState() {
  const bool active = RrActive();
  const bool bypass_high = active && high_gi.active;
  const bool bypass_medium = active && medium_gi.active;
  sl_rr::SetInitInjection(rr_enable_setting != 0.f);
  sl_rr::SetRuntimeLoad(active);
  sl_rr::SetRrRedirect(active);
  responsivity::enabled.store(active);
  responsivity::SetAuto(active && rr_responsivity_auto_setting != 0.f);
  if (!responsivity::GetAuto()) {
    responsivity::value.store(rr_responsivity_setting);
  }
  guides::enabled.store(active);
  denoise::SetEnabled(denoise::kTemporalFilterHighHash, bypass_high);
  denoise::SetEnabled(denoise::kResolveHighHash, bypass_high);
  denoise::SetEnabled(denoise::kTemporalFilterMediumHash, bypass_medium);
  denoise::SetEnabled(denoise::kUpscale2xMediumHash, bypass_medium);
  denoise::SetEnabled(denoise::kSpatialFilterDiskHash, bypass_high || bypass_medium);
}

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
std::optional<float> detected_peak_nits;
renodx::utils::settings::Settings settings = {
  new renodx::utils::settings::Setting{
    .key = "ForzaHorizon6DeveloperMode",
    .binding = &developer_mode_enabled,
    .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
    .default_value = 0.f,
    .can_reset = false,
    .label = "Developer Mode",
    .is_global = true,
    .is_visible = []() { return false; },
  },
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
        .default_value = 1.f,
        .label = "Tone Curve",
        .section = "Tone Mapping",
        .tooltip = "Punchy: Aesthetically similar to the vanilla tonemap's contrast profile, with some improvements.\n"
        "Natural: Tuned to look more true to life, with balanced contrast and saturation.\n"
        "Custom: A neutral base + shoulder. Meant to be tweaked in the advanced menu.",
        .labels = {"Punchy", "Natural", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    },
    peak_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
        .default_value = 47.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the peak white in nits. Auto uses the detected display peak.",
        .min = 47.f,
        .max = 10000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) {
          if (peak_white_nits_setting != nullptr) {
            if (value == 47.f && detected_peak_nits.has_value()) {
              peak_white_nits_setting->format = "Auto (" + std::to_string(static_cast<int>(*detected_peak_nits + 0.5f)) + " nits)";
            } else {
              peak_white_nits_setting->format = (value == 47.f ? "Auto" : "%.0f");
            }
          }
          return (value == 47.f ? detected_peak_nits.value_or(1000.f) : value);
        },
        .on_change = []() {
          if (peak_white_nits_setting->value > 47.f && peak_white_nits_setting->value < 48.f) {
            peak_white_nits_setting->value = (peak_white_nits_setting->value < 47.5f ? 47.f : 48.f);
          }
        },
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
    .tooltip = "Selects the hand-tuned color space used by the Prism tonemapper. Warm White will blowout to a slightly more yellowish tone.",
    .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f; },
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
        ResolvePrismInjection();
      }
      return changed;
    },
    .is_visible = []() {
      return current_settings_mode == 1.f;
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
    .is_visible = []() { return IsDeveloperMenuVisible(); },
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
            return IsDeveloperMenuVisible()
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE == 2; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE == 2; },
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
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "DLSS Ray Reconstruction",
      .section = "DLSS Ray Reconstruction",
      .is_visible = &IsNvidiaRrVisible,
    },
    new renodx::utils::settings::Setting{
      .key = "RrEnable",
      .binding = &rr_enable_setting,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Enable DLSS Ray Reconstruction",
      .section = "DLSS Ray Reconstruction",
      .tooltip = "Redirects the game's DLSS Super Resolution evaluation to DLSS Ray Reconstruction.",
      .on_change_value = [](float, float) { ApplyRrState(); },
      .is_visible = &IsNvidiaRrVisible,
    },
    new renodx::utils::settings::Setting{
      .key = "RrHighGiNotice",
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Ray Traced Global Illumination at Medium or High enables the raw-signal denoiser bypasses.",
      .section = "DLSS Ray Reconstruction",
      .tint = 0xE0484C,
      .is_visible = [] { return IsNvidiaRrVisible() && !high_gi.active && !medium_gi.active; },
    },
    new renodx::utils::settings::Setting{
      .key = "RrVramNotice",
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Ray Reconstruction is rendering over the DLSS VRAM budget. Expect stutter; disabling Frame Generation may free VRAM.",
      .section = "DLSS Ray Reconstruction",
      .tint = 0xE0484C,
      .is_visible = [] { return IsNvidiaRrVisible() && sl_rr::GetVramWarned(); },
    },
    new renodx::utils::settings::Setting{
      .key = "RrOldDllNotice",
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Ray Reconstruction could not start because nvngx_dlssd.dll is out of date. Update DLSS or your GPU driver, then restart.",
      .section = "DLSS Ray Reconstruction",
      .tint = 0xE0484C,
      .is_visible = [] {
        return IsNvidiaRrVisible() && sl_rr::GetRrTrip()
           && sl_rr::GetRrTripResult()
              == static_cast<uint32_t>(sl::Result::eErrorExceptionHandler);
      },
    },
    new renodx::utils::settings::Setting{
      .key = "RrTrippedNotice",
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Ray Reconstruction stopped after a failed evaluation. DLSS Super Resolution is running; restart the game to retry.",
      .section = "DLSS Ray Reconstruction",
      .tint = 0xE0484C,
      .is_visible = [] { return IsNvidiaRrVisible() && sl_rr::GetRrTrip(); },
    },
    new renodx::utils::settings::Setting{
      .key = "RrPreset",
      .binding = &rr_preset_setting,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 2.f,
      .label = "RR preset",
      .section = "DLSS Ray Reconstruction",
      .tooltip = "DLSS Ray Reconstruction render preset: D (default transformer), E (latest transformer), or F (RR 4.5 default).",
      .labels = {"D", "E", "F"},
      .on_change_value = [](float, float value) {
        sl_rr::SetRrPreset(kRrPresetValues[std::clamp(static_cast<int>(value), 0, 2)]);
      },
      .is_visible = &IsNvidiaRrAdditionalSettingsVisible,
    },
    new renodx::utils::settings::Setting{
      .key = "RRResponsivity",
      .binding = &rr_responsivity_setting,
      .value_type = renodx::utils::settings::SettingValueType::FLOAT,
      .default_value = 0.f,
      .label = "RR responsivity",
      .section = "DLSS Ray Reconstruction",
      .tooltip = "Preset F only. Lower values favour stability; higher values favour responsiveness. Zero leaves the DLSS default unchanged.",
      .min = -1.f,
      .max = 1.f,
      .format = "%.2f",
      .is_enabled = [] { return rr_responsivity_auto_setting == 0.f; },
      .on_change_value = [](float, float) { ApplyRrState(); },
      .is_visible = &IsNvidiaRrAdditionalSettingsVisible,
    },
    new renodx::utils::settings::Setting{
      .key = "RrResponsivityAuto",
      .binding = &rr_responsivity_auto_setting,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Speed-relative responsivity",
      .section = "DLSS Ray Reconstruction",
      .tooltip = "Uses camera motion to favour stability while still and responsiveness while moving.",
      .on_change_value = [](float, float) { ApplyRrState(); },
      .is_visible = &IsNvidiaRrAdditionalSettingsVisible,
    },
    new renodx::utils::settings::Setting{
      .key = "RrDebugLog",
      .binding = &rr_debug_log_setting,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Debug logging",
      .section = "DLSS Ray Reconstruction",
      .tooltip = "Logs distinct RR guide and Streamline outcomes. Enable before restarting the game to route verbose Streamline and NGX logs to ReShade.log.",
      .on_change_value = [](float, float value) { guides::SetDiagnostics(value != 0.f); },
      .is_visible = &IsNvidiaRrAdditionalSettingsVisible,
    },
    new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BULLET,
      .label = "Turn DLSS on in the game.",
      .section = "DLSS Ray Reconstruction",
      .is_visible = [] { return current_settings_mode == 0.f; },
    },
    new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BULLET,
      .label = "Ray Traced Global Illumination at Medium or High enables the game's RTGI denoiser replacements.",
      .section = "DLSS Ray Reconstruction",
      .is_visible = [] { return current_settings_mode == 0.f; },
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
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Toru's Patreon",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://www.patreon.com/cw/Toru77");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Tonemapping and Grading by Jon (OopyDoopy/Kickfister), Ray Reconstruction by Toru, RenoDX Framework by Shortfuse",
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
      {"RrEnable", 0.f},
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
  ApplyRrState();
}

void OnInitRayReconstructionDevice(reshade::api::device* device) {
  if (device == nullptr) return;
  int vendor_id = 0;
  if (device->get_api() != reshade::api::device_api::d3d12
      || !device->get_property(reshade::api::device_properties::vendor_id, &vendor_id)
      || vendor_id != 0x10DE) {
    return;
  }

  rr_device.store(device);
  rr_nvidia_d3d12_device.store(true);
  denoise::OnInitDevice(device);
  ApplyRrState();
}

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool /*resize*/) {
  RENODX_IS_HDR_COLOR_SPACE =
      renodx::utils::swapchain::IsHDRColorSpace(swapchain) ? 1.f : 0.f;
  if (const auto peak = renodx::utils::swapchain::GetPeakNits(swapchain); peak.has_value()) {
    detected_peak_nits = *peak;
    peak_white_nits_setting->Write();
  }
  OnInitRayReconstructionDevice(swapchain->get_device());
}

void OnDestroyRayReconstructionDevice(reshade::api::device* device) {
  if (rr_device.load() != device) return;
  rr_device.store(nullptr);
  rr_nvidia_d3d12_device.store(false);
  sl_rr::SetRuntimeLoad(false);
  sl_rr::SetRrRedirect(false);
  responsivity::enabled.store(false);
  guides::enabled.store(false);
  high_gi.active = false;
  medium_gi.active = false;
  high_gi.presents_without = 0;
  medium_gi.presents_without = 0;
  high_gi.bound.store(false);
  medium_gi.bound.store(false);
}

void OnBindPipeline(
    reshade::api::command_list* cmd_list,
    reshade::api::pipeline_stage stage,
    reshade::api::pipeline pipeline) {
  (void)cmd_list;
  if (!rr_nvidia_d3d12_device.load()
      || !renodx::utils::bitwise::HasFlag(stage, reshade::api::pipeline_stage::compute_shader)) {
    return;
  }
  renodx::utils::pipeline::GetPipelineInfo(pipeline, [](const renodx::utils::pipeline::PipelineInfo& info) {
    for (const auto& shader : info.shader_details) {
      if (shader.shader_hash == denoise::kTemporalFilterHighHash
          || shader.shader_hash == denoise::kResolveHighHash) {
        high_gi.bound.store(true);
      }
      if (shader.shader_hash == denoise::kTemporalFilterMediumHash) {
        medium_gi.bound.store(true);
      }
    }
  });
}

void PollTier(TierDetection& tier, const char* name) {
  if (tier.bound.exchange(false)) {
    tier.presents_without = 0;
    if (!tier.active) {
      tier.active = true;
      if (guides::DiagGuidesEnabled()) {
        guides::LogEvent(std::string(name) + " RTGI pipeline detected");
      }
      ApplyRrState();
    }
  } else if (++tier.presents_without >= kGiMissLimit && tier.active) {
    tier.active = false;
    if (guides::DiagGuidesEnabled()) {
      guides::LogEvent(std::string(name) + " RTGI pipeline no longer bound; bypasses released");
    }
    ApplyRrState();
  }
}

void OnPresent(
    reshade::api::command_queue* queue, reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect, const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count, const reshade::api::rect* dirty_rects) {
  (void)queue;
  (void)swapchain;
  (void)source_rect;
  (void)dest_rect;
  (void)dirty_rect_count;
  (void)dirty_rects;
  if (!RrActive()) return;

  sl_rr::Poll();
  responsivity::Poll();
  responsivity::UpdateMotion(sl_rr::GetCameraMotion());
  PollTier(high_gi, "High");
  PollTier(medium_gi, "Medium");
  if (!high_gi.active && !medium_gi.active
      && high_gi.presents_without >= kGiMissLimit && !warned_no_gi) {
    warned_no_gi = true;
    sl_rr::LogWarn("no Medium/High RTGI pipeline detected; denoiser bypasses stay off");
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX | Forza Horizon 6";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Forza Horizon 6";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::init_device>(OnInitRayReconstructionDevice);
      reshade::register_event<reshade::addon_event::destroy_device>(OnDestroyRayReconstructionDevice);
      reshade::register_event<reshade::addon_event::present>(OnPresent);
      reshade::register_event<reshade::addon_event::bind_pipeline>(OnBindPipeline);

      renodx::utils::settings::use_presets = true;

      // Denoiser replacements are consumed by the bind-time async path.
      renodx::utils::shader::use_replace_async = true;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::expected_constant_buffer_space = 50;

      renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&ResolvePrismInjection);
      renodx::utils::settings::on_preset_changed_callbacks.emplace_back(&ApplyRrState);
      ResolvePrismInjection();

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::init_device>(OnInitRayReconstructionDevice);
      reshade::unregister_event<reshade::addon_event::destroy_device>(OnDestroyRayReconstructionDevice);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_event<reshade::addon_event::bind_pipeline>(OnBindPipeline);
      sl_rr::UninstallHooks();
      responsivity::Disarm();
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  if (fdw_reason == DLL_PROCESS_ATTACH && developer_mode_enabled == 0.f) {
    if (auto* settings_mode = renodx::utils::settings::FindSetting("SettingsMode");
        settings_mode != nullptr) {
      settings_mode->labels.resize(2);
      if (current_settings_mode >= 2.f) {
        renodx::utils::settings::UpdateSetting("SettingsMode", 1.f);
      }
    }
  }
  denoise::Use(fdw_reason);
  guides::Use(fdw_reason);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  if (fdw_reason == DLL_PROCESS_ATTACH) {
    guides::SetDiagnostics(rr_debug_log_setting != 0.f);
    const int preset_index = std::clamp(static_cast<int>(rr_preset_setting), 0, 2);
    sl_rr::SetRrPreset(kRrPresetValues[preset_index]);
    ApplyRrState();
    // Arm before later addons and before the game can initialize Streamline.
    PinModule();
    sl_rr::InstallLoaderHooks();
  }

  return TRUE;
}
