/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0
#define DEBUG_LEVEL_1
#define DEBUG_LEVEL_2

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/date.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "Neutwo"},
        .parse = [](float value) { return value; },
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
    },
    new renodx::utils::settings::Setting{
      .key = "CustomHDRBoost",
      .binding = &shader_injection.custom_hdr_boost,
      .default_value = 30.f,
      .label = "HDR Boost",
      .section = "Tone Mapping",
      .tooltip = "Boosts luminance similar to an inverse tonemapper.",
      .max = 50.f,
      .parse = [](float value) { return value * 0.01f; },
    },
      new renodx::utils::settings::Setting{
        .key = "SceneGradePerChannelBlowout",
        .binding = &shader_injection.scene_grade_per_channel_blowout,
        .default_value = 70.f,
        .label = "Per Channel Blowout",
        .section = "Scene Grading",
        .tooltip = "Simulates the highlight desaturation of per-channel tonemapping.",
        .max = 90.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0; },
        .parse = [](float value) { return (0.01f * pow(100.f - value, 2.f)); },
    },
        new renodx::utils::settings::Setting{
        .key = "SceneGradeHueShift",
        .binding = &shader_injection.scene_grade_hue_shift,
        .default_value = 50.f,
        .label = "Per Channel Hue Shift",
        .section = "Scene Grading",
        .tooltip = "Simulates the hue shifting of per-channel tonemapping. Effect is tied to Per Channel Blowout.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 0 && CUSTOM_SCENE_GRADE_PER_CHANNEL_BLOWOUT > 0.f; },
        .parse = [](float value) { return value * 0.01f; },
    },
new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Adds highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.0001f; },
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
    },
        new renodx::utils::settings::Setting{
        .key = "FxDebanding",
        .binding = &shader_injection.swap_chain_output_dither_bits,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Debanding",
        .section = "Effects",
        .labels = {"None", "8+2 Dither", "10+2 Dither"},
        .parse = [](float value) {
          if (value == 0.f) return 0.f;
          if (value == 1.f) return 8.f;
          if (value == 2.f) return 10.f;
          return 0.f;
        },
    },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 0.f,
        .label = "Film Grain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
        // new renodx::utils::settings::Setting{
        //     .key = "FxBloom",
        //     .binding = &shader_injection.custom_bloom,
        //     .default_value = 25.f,
        //     .label = "Bloom Strength",
        //     .section = "Color Grading",
        //     .max = 100.f,
        //     .parse = [](float value) { return value * 0.01f; },
        //     .is_visible = []() { return settings[0]->GetValue() >= 2.f; },
        // },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "RenoDX Discord",
            .section = "Links",
            .group = "button-line-1",
            .tint = 0x5865F2,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://discord.gg/kSTf", "EbcCpC");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "HDR Den Discord",
            .section = "Links",
            .group = "button-line-1",
            .tint = 0x5865F2,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://discord.gg/XUhv", "tR54yc");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "Github",
            .section = "Links",
            .group = "button-line-1",
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx");
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
            .label = "Ritsu's Ko-Fi",
            .section = "Links",
            .group = "button-line-1",
            .tint = 0xFF5F5F,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://ko-fi.com/ritsucecil");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "ShortFuse's Ko-Fi",
            .section = "Links",
            .group = "button-line-1",
            .tint = 0xFF5F5F,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse");
            },
        },
        new renodx::utils::settings::Setting{
            .value_type = renodx::utils::settings::SettingValueType::BUTTON,
            .label = "HDR Den's Ko-Fi",
            .section = "Links",
            .group = "button-line-1",
            .tint = 0xFF5F5F,
            .on_change = []() {
              renodx::utils::platform::LaunchURL("https://ko-fi.com/hdrden");
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
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
      {"ToneMapGammaCorrection", 0.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
      {"SwapChainCustomColorSpace", 0.f},
      {"SceneGradePerChannelBlowout", 0.f},
      {"SceneGradeHueShift", 0.f},
  });
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
      // renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      // renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      renodx::mods::swapchain::target_format = target_format;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);
      renodx::utils::random::binds.push_back(&shader_injection.swap_chain_output_dither_seed);

      /*
        Aux constant buffer (Check shared.h) size is 120, but we force align it to 128.
        This also helps if our shader_injection isn't aligned properly
      */
      // renodx::mods::shader::force_align_constant_buffers_to_16 = true;

      /*
        True means it'll attempt to expand current cbuffer definitions instead of adding a new push constant
        entry. You'll have to experiment with this if cbuffer injection doesn't work
      */
      renodx::mods::shader::expand_existing_constant_buffer = true;

      /*
        If expand_existing_constant_buffer is set to false renoDX will add new cbuffer range (instead of reusing the game's).
        This behaviour is overridden if renoDX finds a cbuffer that targets all shader_stages in minimum_constant_buffer_stages.
        e.g. If a game's cbuffer range targets all stages, renoDX will expand it regardless of expand_existing_constant_buffer value.
        Remove the stages you're not injecting to.
      */
      renodx::mods::shader::minimum_constant_buffer_stages = reshade::api::shader_stage::pixel | reshade::api::shader_stage::compute | reshade::api::shader_stage::vertex;

      renodx::mods::shader::use_pipeline_layout_cloning = true;
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

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .ignore_size = common_ignore_size,
          .use_resource_view_cloning = renodx::mods::swapchain::use_resource_cloning,
          .aspect_ratio = common_aspect_ratio,
          .aspect_ratio_tolerance = common_aspect_ratio_tolerance,
          .view_upgrades = view_upgrades,
          .min_dimensions = min_dimensions,
      });

      if (!initialized) {
        // renodx::utils::random::binds.push_back(&shader_injection.swap_chain_output_dither_seed);
        initialized = true;
      }

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::random::Use(DLL_PROCESS_ATTACH);
  renodx::mods::swapchain::Use(fdw_reason);
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
