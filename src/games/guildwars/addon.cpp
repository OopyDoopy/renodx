/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0
// #define RENODX_MODS_SWAPCHAIN_VERSION 1

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/device_proxy.hpp"
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {
    __ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

float current_settings_mode = 0;
float output_mode = 0.f;
float fps_limiter_enabled = 0.f;
float fps_limit_value = 60.f;

renodx::utils::settings::Setting* tone_map_type_setting = nullptr;
renodx::utils::settings::Setting* tone_map_peak_nits_setting = nullptr;
renodx::utils::settings::Setting* tone_map_game_nits_setting = nullptr;
renodx::utils::settings::Setting* tone_map_ui_nits_setting = nullptr;

reshade::api::swapchain* tracked_swapchain = nullptr;

float GetDisplayRefreshRate() {
  if (tracked_swapchain == nullptr) return 0.f;

  const auto monitor = MonitorFromWindow(static_cast<HWND>(tracked_swapchain->get_hwnd()), MONITOR_DEFAULTTONEAREST);
  const auto display_path = renodx::utils::platform::GetPathInfo(monitor);
  if (!display_path.has_value()) return 0.f;

  const auto refresh_rate = display_path->targetInfo.refreshRate;
  if (refresh_rate.Denominator == 0u) return 0.f;

  return static_cast<float>(refresh_rate.Numerator) / static_cast<float>(refresh_rate.Denominator);
}

void SetFPSLimit(float fps_limit) {
  if (fps_limit <= 0.f) return;
  renodx::utils::settings::UpdateSetting("FPSLimiterEnabled", 1.f);
  renodx::utils::settings::UpdateSetting("FPSLimit", fps_limit);
}

void ApplyFPSLimit(float limiter_enabled, float limit_value) {
  renodx::utils::swapchain::fps_limit = limiter_enabled != 0.f ? limit_value * 2.f : 0.f;
}

void SetFPSLimitToRefreshRateDivisor(float divisor) {
  if (divisor <= 0.f) return;

  const float refresh_rate = GetDisplayRefreshRate();
  if (refresh_rate <= 0.f) return;

  SetFPSLimit(refresh_rate / divisor);
}

void SetFPSLimitToVRR() {
  const float refresh_rate = GetDisplayRefreshRate();
  if (refresh_rate <= 0.f) return;

  SetFPSLimit(refresh_rate * (1.f - (refresh_rate / 3600.f)));
}

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
      .key = "OutputMode",
      .binding = &output_mode,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 0.f,
      .can_reset = true,
      .label = "Output Mode",
      .section = "Output",
      .tooltip = "Auto matches Windows HDR state; SDR and HDR override it.",
      .labels = {"Auto", "SDR", "HDR"},
      .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "OutputEncoding",
        .binding = &shader_injection.sdr_encoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Output Encoding",
        .section = "Output",
        .tooltip = "Adjusts the final encoding used by the game, which should match the gamma target of your display. If unsure, 2.2 is probably correct.",
        .labels = {"sRGB", "2.2", "2.4"},
        .is_visible = []() { return shader_injection.swap_chain_output_preset == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "C-Infinity Rolloff"},
        .parse = [](float value) { return value; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
      .key = "ToneCurve",
      .binding = &shader_injection.tone_curve,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 0.f,
      .label = "Tone Curve",
      .section = "Tone Mapping",
      .tooltip = "Recommended is tuned for balanced contrast, targeting roughly the gamma/shadow levels as originally experienced on CRT.\n"
      "Custom is the vanilla look with a highlight rolloff, good for creating your own look.",
      .labels = {"Recommended", "Custom"},
      .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
    },
    tone_map_peak_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 10000.f,
        .is_visible = []() { return shader_injection.swap_chain_output_preset == 1.f; },
    },
    tone_map_game_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 48.f,
        .max = 500.f,
        .is_visible = []() { return shader_injection.swap_chain_output_preset == 1.f; },
    },
    tone_map_ui_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &shader_injection.graphics_white_nits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 48.f,
        .max = 500.f,
        .is_visible = []() { return shader_injection.swap_chain_output_preset == 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
      .key = "ColorGradeHighlightContrast",
      .binding = &shader_injection.tone_map_highlight_contrast,
      .default_value = 50.f,
      .label = "Highlight Contrast",
      .section = "Color Grading",
      .max = 100.f,
      .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
      .parse = [](float value) { return value * 0.02f; },
      .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
      .key = "ColorGradeShadowContrast",
      .binding = &shader_injection.tone_map_shadow_contrast,
      .default_value = 50.f,
      .label = "Shadow Contrast",
      .section = "Color Grading",
      .max = 100.f,
      .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
      .parse = [](float value) { return value * 0.02f; },
      .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type >= 1.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1; },
        .parse = [](float value) { return value * 0.0005f; },
        .is_visible = []() { return current_settings_mode == 1; },
    },
    new renodx::utils::settings::Setting{
      .key = "FxBloomType",
      .binding = &shader_injection.bloom_type,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .label = "Bloom Mode",
      .section = "Effects",
      .tooltip = "Vanilla: The original game's bloom, less clipped thanks to the addition of tone mapping.\n"
      "Froyok-inspired: Adjustments to the bloom's functionality, inspired by https://www.froyok.fr/blog/2021-12-ue4-custom-bloom/. Energy conserving and tuned to look vanilla friendly, with an exposure adjustment to match the original bloom's vibe.",
      .labels = {"Vanilla", "Froyok-inspired"},
    },
    new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &shader_injection.bloom_strength,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .tooltip = "Scales bloom intensity. In Froyok-inspired mode, 50 corresponds to a 15% blend.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxDistortion",
        .binding = &shader_injection.distortion_strength,
        .default_value = 100.f,
        .label = "Distortion",
        .section = "Effects",
        .tooltip = "Scales distortion effect opacity.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
      .key = "FxAA",
      .binding = &shader_injection.fxaa_enabled,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 1.f,
      .label = "FXAA",
      .section = "Effects",
      .labels = {"Off", "On"},
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 0.f,
        .label = "Film Grain",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FPSLimiterEnabled",
        .binding = &fps_limiter_enabled,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .can_reset = false,
        .label = "FPS Limiter",
        .section = "Utilities",
        .tooltip = "Enables the built-in FPS limiter. Recommended to smoothly present frames due to the device proxy used to enable HDR. Other limiters may struggle.",
        .labels = {"Off", "On"},
        .parse = [](float value) {
          ApplyFPSLimit(value, fps_limit_value);
          return value;
        },
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "FPSLimit",
        .binding = &fps_limit_value,
        .default_value = 60.f,
        .can_reset = false,
        .label = "FPS Limit",
        .section = "Utilities",
        .tooltip = "Limits your framerate.",
        .min = 30.f,
        .max = 480.f,
        .is_enabled = []() { return fps_limiter_enabled != 0.f; },
        .parse = [](float value) {
          ApplyFPSLimit(fps_limiter_enabled, value);
          return value; },
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "VRR Limit",
        .section = "Utilities",
        .group = "button-line-1",
        .tooltip = "Sets FPS Limit to refresh rate * (1 - refresh rate / 3600).",
        .on_change = []() { SetFPSLimitToVRR(); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "1/1 VSync",
        .section = "Utilities",
        .group = "button-line-1",
        .tooltip = "Sets FPS Limit to the current refresh rate.",
        .on_change = []() { SetFPSLimitToRefreshRateDivisor(1.f); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "1/2 VSync",
        .section = "Utilities",
        .group = "button-line-1",
        .tooltip = "Sets FPS Limit to half the current refresh rate.",
        .on_change = []() { SetFPSLimitToRefreshRateDivisor(2.f); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "1/3 VSync",
        .section = "Utilities",
        .group = "button-line-1",
        .tooltip = "Sets FPS Limit to one third of the current refresh rate.",
        .on_change = []() { SetFPSLimitToRefreshRateDivisor(3.f); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Presets",
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
        .label = "Discord",
        .section = "About",
        .group = "button-line-3",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://discord.gg/", "F6AUTeWJHM");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "About",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx");
        },
    },

};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadowContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloomType", 0.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
  renodx::utils::settings::UpdateSetting("FxDistortion", 100.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 0.f);
}

bool initialized = false;
void OnPresent(reshade::api::command_queue* queue, reshade::api::swapchain* swapchain,
               const reshade::api::rect* source_rect, const reshade::api::rect* dest_rect,
               uint32_t dirty_rect_count, const reshade::api::rect* dirty_rects) {
  if (swapchain != tracked_swapchain) return;
  bool hdr = output_mode == 2.f;
  if (output_mode == 0.f) {
    const auto monitor = MonitorFromWindow(static_cast<HWND>(swapchain->get_hwnd()), MONITOR_DEFAULTTONEAREST);
    const auto path = renodx::utils::platform::GetPathInfo(monitor);
    hdr = path.has_value() && renodx::utils::swapchain::GetHDRSupported(*path)
          && renodx::utils::swapchain::GetHDREnabled(*path);
  }
  renodx::utils::device_proxy::SetTargetColorSpace(hdr ? reshade::api::color_space::hdr10_st2084 : reshade::api::color_space::srgb_nonlinear);
  shader_injection.swap_chain_output_preset = (hdr ? 1.f : 0.f);
  shader_injection.peak_white_nits = (hdr ? tone_map_peak_nits_setting->GetValue() : 1.f);
  shader_injection.diffuse_white_nits = (hdr ? tone_map_game_nits_setting->GetValue() : 1.f);
  shader_injection.graphics_white_nits = (hdr ? tone_map_ui_nits_setting->GetValue() : 1.f);
}

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (swapchain->get_device()->get_api() != reshade::api::device_api::d3d9) return;
  tracked_swapchain = swapchain;
  if (initialized) return;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    tone_map_peak_nits_setting->default_value = roundf(peak.value());
    initialized = true;
  } else {
    tone_map_peak_nits_setting->default_value = 1000.f;
  }
  // settings[3]->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(settings[2]->default_value), 203.f);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Guild Wars";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      // renodx::mods::shader::force_pipeline_cloning = true;
      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::constant_buffer_offset = 50 * 4;

      renodx::mods::swapchain::expected_constant_buffer_index = 13;
      renodx::mods::swapchain::expected_constant_buffer_space = 50;
      renodx::mods::swapchain::force_borderless = false;
      renodx::mods::swapchain::prevent_full_screen = false;
      renodx::mods::swapchain::force_screen_tearing = false;
      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::set_color_space = true;
      renodx::mods::swapchain::use_device_proxy = true;
      renodx::utils::random::binds.push_back(&shader_injection.custom_random);
      renodx::mods::swapchain::ignored_window_class_names = {
          "SplashScreenClass",
      };
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader_dx11;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader_dx11;
      renodx::mods::swapchain::SetUseHDR10();

      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
      });
      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::b8g8r8x8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
      });
      renodx::mods::swapchain::resource_upgrade_infos.push_back({
          .old_format = reshade::api::format::r16g16b16a16_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .ignore_size = true,
          .use_resource_view_cloning = true,
      });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      break;
  }
  renodx::utils::random::Use(fdw_reason);
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
