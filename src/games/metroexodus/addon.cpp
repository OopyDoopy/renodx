/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0


#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#define RENODX_MODS_SWAPCHAIN_VERSION 2

#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;


renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;

const std::unordered_map<std::string, float> DO_NOT_PRESET_VALUES = {
  {"ToneMapPeakNits", 1000.f},
  {"ToneMapGameNits", 203.f},
  {"ToneMapUINits", 203.f},
  {"FxFilmGrain", 0.f},
};

const std::unordered_map<std::string, float> VANILLA_PLUS_VALUES = {
   {"GammaCorrection", 1.f},
   {"ToneMapType", 1.f},
   {"CustomLUTScaling", 0.f},
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
        .labels = {"Simple", "Advanced"},
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nSDR Extended uses the SDR tone mapping curve extended to HDR range.\nPsychoV uses a custom psychovisual tone mapper as a replacement for the game's tone mapping system and pre-tuned to be faithful.",
        .labels = {"Vanilla HDR", "SDR Extended", "PsychoV"},
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
        .tooltip = "Sets the value of peak white in nits",
        .min = 80.f,
        .max = 4000.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    diffuse_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 80.f,
        .max = 500.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "GammaCorrection",
        .binding = &shader_injection.gamma_correction,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "SDR EOTF Emulation",
        .section = "Tone Mapping",
        .tooltip = "Emulates the look of the game when viewed with SDR gamma.",
        .labels = {"Off", "2.2"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
        new renodx::utils::settings::Setting{
        .key = "GammaCorrectionUI",
        .binding = &shader_injection.gamma_correction_ui,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "UI SDR EOTF Emulation",
        .section = "Tone Mapping",
        .tooltip = "Emulates the look of the game when viewed with SDR gamma.",
        .labels = {"Off", "2.2"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "CustomClampType",
    //     .binding = &shader_injection.custom_clamp_type,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 0.f,
    //     .label = "Overshoot Clamp",
    //     .section = "Tone Mapping",
    //     .tooltip = "Controls how overshoot is clamped. Impact is scene dependent.\nPer Channel means each channel is clipped invidually, skewing to white. Matches SDR LUT overshoot behavior.\nMax Channel scales all channels based on whether any channel is at the clip point. Hue preserving.",
    //     .labels = {"Per Channel", "Max Channel"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "TonemapUnderUI",
    //     .binding = &shader_injection.tonemap_under_ui,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "Tone Map Under UI",
    //     .section = "Tone Mapping",
    //     .tooltip = "Applies tone mapping under UI elements.",
    //     .labels = {"Off", "On"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },
        new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended",
        .section = "Presets",
        .group = "button-line-1",
        .on_change = []() {
          for (auto setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (setting->is_global) continue;
            if (DO_NOT_PRESET_VALUES.contains(setting->key)) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
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
            if (DO_NOT_PRESET_VALUES.contains(setting->key)) continue;
            if (VANILLA_PLUS_VALUES.contains(setting->key)) {
              renodx::utils::settings::UpdateSetting(setting->key, VANILLA_PLUS_VALUES.at(setting->key));
            } else {
              renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
            }
          }
        },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "SceneGradeScaling",
    //     .binding = &shader_injection.scene_grade_scaling,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 0.f,
    //     .label = "Tone Map Scaling",
    //     .section = "Advanced Tone Mapping Properties",
    //     .tooltip = "Controls working space for the tone mapper.\nLuminance+ scales by luminance with the chrominance and hue of per channel in BT.709.\nLMS Per Channel scales each channel in LMS space, which has its own unique look.",
    //     .labels = {"Luminance+", "LMS Per Channel"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "SceneGradeSaturationCorrection",
    //     .binding = &shader_injection.scene_grade_saturation_correction,
    //     .default_value = 100.f,
    //     .label = "Saturation Correction",
    //     .section = "Advanced Tone Mapping Properties",
    //     .tooltip = "Adjusts the amount of saturation taken from per channel tone mapping.",
    //     .min = 0.f,
    //     .max = 100.f,
    //     .is_enabled = []() { return SCENE_GRADE_SCALING == 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "SceneGradeHueShift",
    //     .binding = &shader_injection.scene_grade_hue_shift,
    //     .default_value = 50.f,
    //     .label = "Hue Shift",
    //     .section = "Advanced Tone Mapping Properties",
    //     .tooltip = "Adjusts the hue caused by per channel tone mapping.",
    //     .min = 0.f,
    //     .max = 100.f,
    //     .is_enabled = []() { return SCENE_GRADE_SCALING == 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeConeResponse",
        .binding = &shader_injection.tone_map_cone_response,
        .default_value = 50.f,
        .label = "Cone Response",
        .section = "Color Grading",
        .tooltip = "Adjusts contrast in a way that naturally adjusts saturation.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 2; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return value * 0.02f; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return fmax(0.0001f, value * 0.01f); },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

        new renodx::utils::settings::Setting{
        .key = "CustomLUTScaling",
        .binding = &shader_injection.custom_lut_scaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    //     new renodx::utils::settings::Setting{
    //     .key = "CustomLUTScalingBrightness",
    //     .binding = &shader_injection.custom_lut_scaling_brightness,
    //     .default_value = 0.f,
    //     .label = "LUT Scaling Brightness",
    //     .section = "Color Grading",
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0 && CUSTOM_LUT_SCALING > 0.f; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
    // },

        new renodx::utils::settings::Setting{
        .key = "CustomLUTRecolor",
        .binding = &shader_injection.custom_lut_recolor,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "LUT Recolor",
        .section = "Color Grading",
        .tooltip = "Applies the color of the unscaled image onto the LUT scaled image.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0 && CUSTOM_LUT_SCALING > 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 10.f,
        .label = "FilmGrain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain. Reduces banding. 0 = Vanilla.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return value * 0.01f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "Video Improvements",
        .binding = &shader_injection.custom_video,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2,
        .label = "Video AutoHDR",
        .section = "Effects",
        .tooltip = "Fixes pre-rendered video playback with optional inverse tone mapping. Subtle = 2x game brightness, Strong = peak brightness.",
        .labels = {"Vanilla", "Fixed", "Fixed + Subtle ITM", "Fixed + Strong ITM"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    //     new renodx::utils::settings::Setting{
    //     .key = "FxVignette",
    //     .binding = &shader_injection.custom_vignette,
    //     .default_value = 100.f,
    //     .label = "Vignette",
    //     .section = "Effects",
    //     .tooltip = "Adjusts vignette strength.",
    //     .max = 100.f,
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .label = "Special thanks to Musa for his help with this.",
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
    renodx::utils::settings::UpdateSetting("GammaCorrection", 0.f);

  renodx::utils::settings::UpdateSetting("SceneGradeHueShift", 50.f);
  renodx::utils::settings::UpdateSetting("SceneGradeBlowoutRestoration", 0.f);

  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
  //renodx::utils::settings::UpdateSetting("SwapChainCustomColorSpace", 0.f);

  renodx::utils::settings::UpdateSetting("FxFilmGrainType", 0.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 50.f);
  //renodx::utils::settings::UpdateSetting("FxVignette", 100.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {

  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    peak_white_nits_setting->default_value = roundf(peak.value());
  } else {
    peak_white_nits_setting->default_value = 1000.f;
  }

  //peak_white_nits_setting->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(diffuse_white_setting->default_value), 203.f);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX | Metro Exodus";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Metro Exodus";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      // while (IsDebuggerPresent() == 0) Sleep(100);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;

      renodx::mods::swapchain::force_borderless = true;
      renodx::mods::swapchain::prevent_full_screen = true;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain

      //renodx::mods::shader::revert_constant_buffer_ranges = true;

      // renodx::mods::swapchain::use_resource_cloning = true;
      // renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      // renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;

      // renodx::mods::swapchain::swapchain_proxy_revert_state = true;

      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;
      // renodx::mods::shader::on_create_pipeline_layout = [](auto, auto params) {
      //     return static_cast<bool>(params.size() < 20);
      // };
      //renodx::mods::shader::use_pipeline_layout_cloning = true;
      //renodx::mods::swapchain::use_resource_cloning = true;

      //renodx::utils::shader::use_replace_async = true; 

      // renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //     .old_format = reshade::api::format::r8g8b8a8_typeless,
      //     .new_format = reshade::api::format::r16g16b16a16_float,
      // });

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);
  //renodx::mods::swapchain::Use(fdw_reason);


  return TRUE;
}
