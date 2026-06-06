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
#include "../../utils/random.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
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

float tone_map_variant = 2.f;           // Setting binding (0=Vanilla SDR HDR, 1=Vanilla SDR Extended, 2=PsychoV)
float current_tone_map_variant = -1.f;  // -1 forces first-frame update

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

// namespace shader_toggle {
// namespace runtime {
// float g_use_shaders = 1.f;          // Controlled by slider
// float g_current_use_shaders = 1.f;  // Will be overridden on startup

// void OnPresent(
//     reshade::api::command_queue*,
//     reshade::api::swapchain* swapchain,
//     const reshade::api::rect*,
//     const reshade::api::rect*,
//     uint32_t,
//     const reshade::api::rect*) {
//   if (g_use_shaders != g_current_use_shaders) {
//     reshade::log::message(
//         reshade::log::level::info,
//         (g_use_shaders != 0.f) ? "Enabling shaders (toggle)" : "Disabling shaders (toggle)");

//     auto* device = swapchain->get_device();
//     if (device == nullptr) {
//       reshade::log::message(reshade::log::level::error, "Device is null in OnPresent");
//       g_current_use_shaders = g_use_shaders;
//       return;
//     }

//     if (g_use_shaders != 0.f) {
//       for (const auto& [hash, shader] : custom_shaders) {
//         renodx::utils::shader::AddRuntimeReplacement(device, hash, shader.code);
//       }
//       reshade::log::message(
//           reshade::log::level::info,
//           ("Injected " + std::to_string(custom_shaders.size()) + " shaders").c_str());
//     } else {
//       renodx::utils::shader::RemoveRuntimeReplacements(device);
//       reshade::log::message(reshade::log::level::info, "Removed all shader replacements.");
//     }

//     g_current_use_shaders = g_use_shaders;
//   }
// }

// void RegisterEvents() {
//   g_current_use_shaders = -1.0f;
//   reshade::register_event<reshade::addon_event::present>(OnPresent);
// }

// void UnregisterEvents() {
//   reshade::unregister_event<reshade::addon_event::present>(OnPresent);
// }

// renodx::utils::settings::Setting* GetSetting() {
//   return new renodx::utils::settings::Setting{
//       .key = "",
//       .binding = &g_use_shaders,
//       .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
//       .default_value = 1.f,
//       .label = "Enable Mod",
//       .section = "Options",
//       .on_change = []() {
//         g_current_use_shaders = -1.f;
//       },
//   };
// }
// }  // namespace runtime
// }  // namespace shader_toggle

// void OnVariantPresent(
//     reshade::api::command_queue*,
//     reshade::api::swapchain* swapchain,
//     const reshade::api::rect*,
//     const reshade::api::rect*,
//     uint32_t,
//     const reshade::api::rect*) {
//   if (shader_toggle::runtime::g_use_shaders == 0.f) {
//     current_tone_map_variant = -1.f;  // Force re-apply when toggled back on
//     return;
//   }
//   if (tone_map_variant == current_tone_map_variant) return;
//   auto* device = swapchain->get_device();
//   if (device == nullptr) { return; }

//   // Clamp each macro variable to its valid range, then compute flat combo index.
//   // For multi-macro add further v_n terms and multiply by downstream label counts.
//   const int v0 = std::clamp(
//       static_cast<int>(tone_map_variant), 0,
//       static_cast<int>(__SHADER_VARIANT_LABELS_0x2FE5A0BE_TONE_MAP_TYPE.size()) - 1);
//   const int idx = v0;

//   const std::span<const uint8_t> variants[] = {__SHADER_VARIANTS_0x2FE5A0BE};
//   renodx::utils::shader::AddRuntimeReplacement(device, 0x2FE5A0BEu, variants[idx]);
//   current_tone_map_variant = tone_map_variant;
// }

// // renodx::utils::settings::Setting* peak_white_nits_setting = nullptr;
// // renodx::utils::settings::Setting* diffuse_white_nits_setting = nullptr;
// renodx::utils::settings::Settings settings = {
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::TEXT,
//         .label = "HDR Calibration is handled via the in-game options!",
//         .section = "Instructions",
//     },
//     shader_toggle::runtime::GetSetting(),
//     new renodx::utils::settings::Setting{
//         .key = "toneMapVariant",
//         .binding = &tone_map_variant,
//         .value_type = renodx::utils::settings::SettingValueType::INTEGER,
//         .default_value = 1.f,
//         .label = "Tone Map Mode",
//         .section = "Options",
//         .tooltip = "Vanilla uses the game's base HDR with gamma correction applied.\nVanilla+ uses the SDR tone curve extended into HDR range, with LMS primaries mapped onto a luminance tone map, full range luminance upgraded grading with gamma correction, and improved display mapping.\nCustom uses a custom tone curve run in LMS space, with color grading LUTs upgraded and scaled to be allowed to reach a 0.0001 nit black floor, and upgraded display mapping.",
//         .labels = std::vector<std::string>(
//             __SHADER_VARIANT_LABELS_0x2FE5A0BE_TONE_MAP_TYPE.begin(),
//             __SHADER_VARIANT_LABELS_0x2FE5A0BE_TONE_MAP_TYPE.end()),
//         .on_change = []() {
//           current_tone_map_variant = -1.f;
//         },
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::BUTTON,
//         .label = "RenoDX Discord",
//         .section = "Links",
//         .group = "button-line-1",
//         .tint = 0x5865F2,
//         .on_change = []() {
//           renodx::utils::platform::Launch("https://discord.gg/QgXDCfccRy");
//         },
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::BUTTON,
//         .label = "Github",
//         .section = "Links",
//         .group = "button-line-1",
//         .on_change = []() {
//           renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx");
//         },
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::BUTTON,
//         .label = "More RenoDX Mods",
//         .section = "Links",
//         .group = "button-line-1",
//         .on_change = []() {
//           renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx/wiki/Mods/");
//         },
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::BUTTON,
//         .label = "Jon's Ko-Fi",
//         .section = "Links",
//         .group = "button-line-1",
//         .tint = 0xFF5F5F,
//         .on_change = []() {
//           renodx::utils::platform::LaunchURL("https://ko-fi.com/kickfister");
//         },
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::TEXT,
//         .label = "Game mod by Jon (OopyDoopy/Kickfister), RenoDX Framework by Shortfuse",
//         .section = "About",
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::TEXT,
//         .label = "Special thanks to Musa for his help with this.",
//         .section = "About",
//     },
//     new renodx::utils::settings::Setting{
//         .value_type = renodx::utils::settings::SettingValueType::TEXT,
//         .label = "This build was compiled on " + build_date + " at " + build_time + ".",
//         .section = "About",
//     },
// };

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
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "By default, this mod improves the game's tone mapping and uses the in-game calibration sliders.\nSwitch to Advanced mode to access more options.\n ",
    //     .section = "Instructions",
    //     .is_visible = []() { return current_settings_mode == 0.f;}
    // },

    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = "Warning: Must use Vanilla+ for all color grading to be present.",
    //     //.section = "Instructions",
    //     .is_visible = []() { return RENODX_TONE_MAP_TYPE > 0.f;}
    // },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &RENODX_TONE_MAP_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla+ uses the vanilla tone mapping with improved brightness scaling, unlocked luminance, and improved display mapping.\nPsychoV uses a version of Shortfuse's PsychoV tonemapper, customized with new features.\nRenoDX ACES replaces the game's tone mapper with our ACES implementation.",
        .labels = {"Vanilla", "Vanilla+", "Custom"},
        .parse = [](float value) { return value; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f || RENODX_TONE_MAP_TYPE == 2.f; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 1.f || RENODX_TONE_MAP_TYPE == 2.f; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
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
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE < 2; },
        .parse = [](float value) { return value * 0.001f; },
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
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Vanilla+",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //       }
    //     },
    // },
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

      // shader_toggle::runtime::g_current_use_shaders = -1.0f;
      // reshade::register_event<reshade::addon_event::present>(shader_toggle::runtime::OnPresent);
      // reshade::register_event<reshade::addon_event::present>(OnVariantPresent);

      // renodx::utils::shader::use_replace_async = true;
      // renodx::utils::settings::use_presets = false;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);

      renodx::utils::random::Use(fdw_reason);

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::expected_constant_buffer_space = 50;
      // renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;

      //   renodx::mods::swapchain::set_color_space = false;
      //   renodx::mods::swapchain::expected_constant_buffer_index = 13;
      //   renodx::mods::swapchain::expected_constant_buffer_space = 50;
      //   renodx::mods::swapchain::use_resource_cloning = true;
      //   renodx::mods::swapchain::swap_chain_proxy_shaders = {
      //       {
      //           reshade::api::device_api::d3d11,
      //           {
      //               .vertex_shader = __swap_chain_proxy_vertex_shader_dx11,
      //               .pixel_shader = __swap_chain_proxy_pixel_shader_dx11,
      //           },
      //       },
      //       {
      //           reshade::api::device_api::d3d12,
      //           {
      //               .vertex_shader = __swap_chain_proxy_vertex_shader_dx12,
      //               .pixel_shader = __swap_chain_proxy_pixel_shader_dx12,
      //           },
      //       },
      //   };

      break;
    case DLL_PROCESS_DETACH:
      // reshade::unregister_event<reshade::addon_event::present>(shader_toggle::runtime::OnPresent);
      // reshade::unregister_event<reshade::addon_event::present>(OnVariantPresent);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_addon(h_module);
      break;
  }

  // No cbuffers allowed
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  // renodx::mods::swapchain::Use(fdw_reason, &shader_injection);

  return TRUE;
}
