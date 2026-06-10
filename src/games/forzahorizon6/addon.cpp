/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#include <include/reshade_api_format.hpp>
#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/random.hpp"

// #include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./shared.h"

namespace {
ShaderInjectData shader_injection;

bool is_hdr_color_space = false;

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;
float r11g11b10_upgrade_enabled = 1.f;

const std::unordered_map<std::string, float> CUSTOM_VALUES = {
    {"ToneMapCurve", 1.f},
    {"SceneGradeLUTScaling", 100.f},
    {"ColorGradeHighlights", 58.f},
    {"ColorGradeShadows", 42.f},
};

void OnInitDevice(reshade::api::device* device) {
  std::vector<renodx::utils::resource::ResourceUpgradeInfo> upgrade_infos = {};

  int vendor_id;
  auto retrieved = device->get_property(reshade::api::device_properties::vendor_id, &vendor_id);
  if (retrieved) {
    if (vendor_id == 0x10de) {  // rgba16 for NVIDIA
      upgrade_infos.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
    } else if (vendor_id == 0x1002) {  // rgb9e5 for AMD
      upgrade_infos.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r9g9b9e5,
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
    }
  }
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
        .labels = {"Simple", "Advanced"},
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla+",
        .section = "Presets",
        .group = "button-line-1",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (setting->is_global) continue;
            if (setting->section.starts_with("Effects")) continue;
            if (setting->key == "ToneMapPeakNits" || setting->key == "ToneMapGameNits") continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Custom",
        .section = "Presets",
        .group = "button-line-1",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (setting->is_global) continue;
            if (setting->section.starts_with("Effects")) continue;
            if (setting->key == "ToneMapPeakNits" || setting->key == "ToneMapGameNits") continue;
            if (CUSTOM_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, CUSTOM_VALUES.at(setting->key));
              continue;
            }
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
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
        .labels = {"Vanilla", "RenoDX"},
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
        .tooltip = "Select whether to use the SDR tone curve, extended into HDR range, or to tune your own custom curve.",
        .labels = {"Vanilla+", "Custom"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .max = 4000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return is_hdr_color_space; },
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
        .is_visible = []() { return is_hdr_color_space; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "UI Brightness controlled in-game.",
        .section = "Tone Mapping",
        .is_visible = []() { return is_hdr_color_space; },
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
        .key = "GammaCorrection",
        .binding = &RENODX_GAMMA_CORRECTION,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "SDR EOTF Emulation",
        .section = "Tone Mapping",
        .tooltip = "Emulates the look of the game when viewed with SDR gamma.",
        .labels = {"Off", "2.2"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return is_hdr_color_space && current_settings_mode >= 1.f; },
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
        .default_value = 0.f,
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
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return fmax(0.0001f, value * 0.01f); },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE; },
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
        .max = 1.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0 && CUSTOM_TONE_MAP_CURVE; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
      {"GammaCorrection", 0.f},
      {"SceneGradeLUTStrength", 100.f},
      {"SceneGradeLUTScaling", 100.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
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
  is_hdr_color_space = renodx::utils::swapchain::IsHDRColorSpace(swapchain);
  RENODX_IS_HDR_COLOR_SPACE = is_hdr_color_space ? 1.f : 0.f;
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

      // renodx::utils::resource::upgrade::Use(fdw_reason);  // fp11 upgrades, not working :(
      // reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::expected_constant_buffer_space = 50;
      // renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;

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
