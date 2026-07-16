/*
 * Copyright (C) 2026 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#include <array>
#include <sstream>
#include <string>
#include <utility>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/swapchain.hpp"  // IWYU pragma: keep
#include "../../utils/device_proxy.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"

namespace {

using Setting = renodx::utils::settings::Setting;
using SettingValueType = renodx::utils::settings::SettingValueType;

constexpr float UPGRADE_TYPE_OUTPUT_SIZE = 1.f;
constexpr float UPGRADE_TYPE_OUTPUT_RATIO = 2.f;
constexpr float UPGRADE_TYPE_ANY_SIZE = 3.f;

constexpr std::array UPGRADE_TARGETS = {
    std::pair{"R8G8B8A8_TYPELESS", reshade::api::format::r8g8b8a8_typeless},
    std::pair{"B8G8R8A8_TYPELESS", reshade::api::format::b8g8r8a8_typeless},
    std::pair{"R8G8B8A8_UNORM", reshade::api::format::r8g8b8a8_unorm},
    std::pair{"B8G8R8A8_UNORM", reshade::api::format::b8g8r8a8_unorm},
    std::pair{"R8G8B8A8_SNORM", reshade::api::format::r8g8b8a8_snorm},
    std::pair{"R8G8B8A8_UNORM_SRGB", reshade::api::format::r8g8b8a8_unorm_srgb},
    std::pair{"B8G8R8A8_UNORM_SRGB", reshade::api::format::b8g8r8a8_unorm_srgb},
    std::pair{"R10G10B10A2_TYPELESS", reshade::api::format::r10g10b10a2_typeless},
    std::pair{"R10G10B10A2_UNORM", reshade::api::format::r10g10b10a2_unorm},
    std::pair{"B10G10R10A2_UNORM", reshade::api::format::b10g10r10a2_unorm},
    std::pair{"R11G11B10_FLOAT", reshade::api::format::r11g11b10_float},
    std::pair{"R16G16B16A16_TYPELESS", reshade::api::format::r16g16b16a16_typeless},
};

renodx::utils::settings::Settings settings = {};
Setting* device_proxy_setting = nullptr;
float fps_limiter_enabled = 0.f;
float fps_limit_value = 60.f;
reshade::api::swapchain* tracked_swapchain = nullptr;
bool initialized = false;

Setting* AddGlobalSetting(Setting* setting) {
  setting->is_global = true;
  renodx::utils::settings::LoadSetting(
      renodx::utils::settings::global_name,
      setting);
  settings.push_back(setting);
  return setting;
}

void AddStartupNotice() {
  settings.push_back(new Setting{
      .value_type = SettingValueType::TEXT,
            .label = "Swapchain, device proxy, and resource upgrade changes are applied the next time the game starts.",
      .section = "Startup",
  });
}

float GetDisplayRefreshRate() {
    if (tracked_swapchain == nullptr) return 0.f;

    const auto display_info =
            renodx::utils::swapchain::GetDisplayInfo(tracked_swapchain);
    if (!display_info.display_config.has_value()) return 0.f;

    const auto refresh_rate =
            display_info.display_config->targetInfo.refreshRate;
    if (refresh_rate.Denominator == 0u) return 0.f;

    return static_cast<float>(refresh_rate.Numerator)
                 / static_cast<float>(refresh_rate.Denominator);
}

void ApplyFPSLimit(float limiter_enabled, float limit_value) {
    if (limiter_enabled == 0.f) {
        renodx::utils::swapchain::fps_limit = 0.f;
        return;
    }

    // The limiter receives both source and proxy presents when the device proxy
    // is active, so compensate to retain the user-facing frame limit.
    const float proxy_multiplier =
            renodx::utils::device_proxy::UseProxyRequested() ? 2.f : 1.f;
    renodx::utils::swapchain::fps_limit = limit_value * proxy_multiplier;
}

void SetFPSLimit(float fps_limit) {
    if (fps_limit <= 0.f) return;
    renodx::utils::settings::UpdateSetting("FPSLimiterEnabled", 1.f);
    renodx::utils::settings::UpdateSetting("FPSLimit", fps_limit);
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

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
    tracked_swapchain = swapchain;
}

void OnDestroySwapchain(reshade::api::swapchain* swapchain, bool resize) {
    if (tracked_swapchain == swapchain) {
        tracked_swapchain = nullptr;
    }
}

void ConfigureSwapchain() {
  renodx::mods::swapchain::use_resource_cloning = true;
  renodx::mods::swapchain::use_resize_buffer = false;
  renodx::mods::swapchain::swap_chain_proxy_shaders = {
      {
          reshade::api::device_api::d3d11,
          {
              .vertex_shader = __swap_chain_proxy_vertex_shader_dx11,
              .pixel_shader = __swap_chain_proxy_pixel_shader_dx11,
          },
      },
      {
          reshade::api::device_api::d3d12,
          {
              .vertex_shader = __swap_chain_proxy_vertex_shader_dx12,
              .pixel_shader = __swap_chain_proxy_pixel_shader_dx12,
          },
      },
  };

  auto* output_setting = AddGlobalSetting(new Setting{
      .key = "OutputFormat",
      .value_type = SettingValueType::INTEGER,
            .default_value = 1.f,
      .label = "Output Format",
      .section = "Swapchain Upgrade",
      .tooltip = "Selects the upgraded swapchain format and color space. The paired ReShade FX is responsible for output encoding.",
            .labels = {"scRGB (RGBA16F)", "HDR10 (RGB10A2)"},
  });
    renodx::mods::swapchain::SetUseHDR10(output_setting->GetValue() == 1.f);
  renodx::utils::device_proxy::SetIntermediateFormat(
      reshade::api::format::r16g16b16a16_float);

  auto* force_borderless_setting = AddGlobalSetting(new Setting{
      .key = "ForceBorderless",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Force Borderless",
      .section = "Swapchain Upgrade",
      .tooltip = "Removes the game window border when exclusive fullscreen would interfere with the upgraded output.",
  });
  renodx::mods::swapchain::force_borderless =
      force_borderless_setting->GetValue() == 1.f;

  auto* prevent_fullscreen_setting = AddGlobalSetting(new Setting{
      .key = "PreventExclusiveFullscreen",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Prevent Exclusive Fullscreen",
      .section = "Swapchain Upgrade",
      .tooltip = "Virtualizes exclusive fullscreen as borderless fullscreen for output compatibility.",
  });
  renodx::mods::swapchain::prevent_full_screen =
      prevent_fullscreen_setting->GetValue() == 1.f;

  auto* allow_tearing_setting = AddGlobalSetting(new Setting{
      .key = "AllowTearing",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 1.f,
      .label = "Allow Tearing",
      .section = "Swapchain Upgrade",
      .tooltip = "Adds DXGI tearing support when the swapchain is converted to a flip presentation model.",
  });
  renodx::mods::swapchain::force_screen_tearing =
      allow_tearing_setting->GetValue() == 1.f;

  auto* restore_state_setting = AddGlobalSetting(new Setting{
      .key = "SwapchainProxyRevertState",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 1.f,
      .label = "Restore Graphics State",
      .section = "Swapchain Upgrade",
      .tooltip = "Restores the game's render targets, pipelines, descriptors, viewport, and scissor after the swapchain proxy pass. Disable only to troubleshoot compatibility or performance issues.",
  });
  renodx::mods::swapchain::swapchain_proxy_revert_state =
      restore_state_setting->GetValue() == 1.f;
}

void ConfigureDeviceProxy() {
  device_proxy_setting = AddGlobalSetting(new Setting{
      .key = "UseDeviceProxy",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Use Device Proxy",
      .section = "Device Proxy",
      .tooltip = "Presents through a separate D3D11 device and swapchain. Use this when the game's rendering API cannot create the requested output directly.",
  });

  const bool use_device_proxy = device_proxy_setting->GetValue() == 1.f;
  renodx::mods::swapchain::use_device_proxy = use_device_proxy;
  renodx::mods::swapchain::set_color_space = !use_device_proxy;

  auto* source_wait_setting = AddGlobalSetting(new Setting{
      .key = "DeviceProxySourceWaitIdle",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Wait for Source Device",
      .section = "Device Proxy",
      .tooltip = "Waits for the game's device before transferring each frame. Enable only to troubleshoot synchronization issues.",
      .is_visible = []() {
        return device_proxy_setting != nullptr
               && device_proxy_setting->GetValue() == 1.f;
      },
  });
  renodx::mods::swapchain::device_proxy_wait_idle_source =
      source_wait_setting->GetValue() == 1.f;

  auto* destination_wait_setting = AddGlobalSetting(new Setting{
      .key = "DeviceProxyDestinationWaitIdle",
      .value_type = SettingValueType::BOOLEAN,
      .default_value = 0.f,
      .label = "Wait for Proxy Device",
      .section = "Device Proxy",
      .tooltip = "Waits for the proxy device before presenting each frame. Enable only to troubleshoot synchronization issues.",
      .is_visible = []() {
        return device_proxy_setting != nullptr
               && device_proxy_setting->GetValue() == 1.f;
      },
  });
  renodx::mods::swapchain::device_proxy_wait_idle_destination =
      destination_wait_setting->GetValue() == 1.f;
}

void ConfigureResourceUpgrades() {
  for (const auto& [name, format] : UPGRADE_TARGETS) {
    auto* setting = AddGlobalSetting(new Setting{
        .key = std::string("Upgrade_") + name,
        .value_type = SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = name,
        .section = "Resource Upgrades",
        .tooltip = "Upgrades matching render targets to RGBA16F using resource-view cloning.",
        .labels = {"Off", "Output Size", "Output Aspect Ratio", "Any Size"},
    });

    const float value = setting->GetValue();
    if (value <= 0.f) continue;

    renodx::mods::swapchain::resource_upgrade_infos.push_back({
        .old_format = format,
        .new_format = reshade::api::format::r16g16b16a16_float,
        .ignore_size = value == UPGRADE_TYPE_ANY_SIZE,
        .use_resource_view_cloning = true,
        .aspect_ratio = static_cast<float>(
            value == UPGRADE_TYPE_OUTPUT_RATIO
                ? renodx::mods::swapchain::ResourceUpgradeInfo::BACK_BUFFER
                : renodx::mods::swapchain::ResourceUpgradeInfo::ANY),
        .usage_include = reshade::api::resource_usage::render_target,
    });

    std::stringstream message;
    message << "RenoDX Upgrade: enabling " << name << " resource upgrades (mode="
            << value << ")";
    reshade::log::message(
        reshade::log::level::info,
        message.str().c_str());
  }
}

void ConfigureFPSLimiter() {
    AddGlobalSetting(new Setting{
            .key = "FPSLimiterEnabled",
            .binding = &fps_limiter_enabled,
            .value_type = SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .can_reset = false,
            .label = "FPS Limiter",
            .section = "Frame Limiter",
            .tooltip = "Enables the built-in presentation limiter. Device proxy presentation is compensated automatically.",
            .labels = {"Off", "On"},
            .parse = [](float value) {
                ApplyFPSLimit(value, fps_limit_value);
                return value;
            },
    });

    AddGlobalSetting(new Setting{
            .key = "FPSLimit",
            .binding = &fps_limit_value,
            .default_value = 60.f,
            .can_reset = false,
            .label = "FPS Limit",
            .section = "Frame Limiter",
            .tooltip = "Limits the displayed frame rate.",
            .min = 30.f,
            .max = 480.f,
            .is_enabled = []() { return fps_limiter_enabled != 0.f; },
            .parse = [](float value) {
                ApplyFPSLimit(fps_limiter_enabled, value);
                return value;
            },
    });

    settings.push_back(new Setting{
            .value_type = SettingValueType::BUTTON,
            .label = "VRR Limit",
            .section = "Frame Limiter",
            .group = "refresh-rate-presets",
            .tooltip = "Sets the limit to refresh rate * (1 - refresh rate / 3600).",
            .on_change = []() { SetFPSLimitToVRR(); },
    });
    settings.push_back(new Setting{
            .value_type = SettingValueType::BUTTON,
            .label = "1/1 VSync",
            .section = "Frame Limiter",
            .group = "refresh-rate-presets",
            .tooltip = "Sets the limit to the current display refresh rate.",
            .on_change = []() { SetFPSLimitToRefreshRateDivisor(1.f); },
    });
    settings.push_back(new Setting{
            .value_type = SettingValueType::BUTTON,
            .label = "1/2 VSync",
            .section = "Frame Limiter",
            .group = "refresh-rate-presets",
            .tooltip = "Sets the limit to half the current display refresh rate.",
            .on_change = []() { SetFPSLimitToRefreshRateDivisor(2.f); },
    });
    settings.push_back(new Setting{
            .value_type = SettingValueType::BUTTON,
            .label = "1/3 VSync",
            .section = "Frame Limiter",
            .group = "refresh-rate-presets",
            .tooltip = "Sets the limit to one third of the current display refresh rate.",
            .on_change = []() { SetFPSLimitToRefreshRateDivisor(3.f); },
    });
}

void Initialize() {
  renodx::utils::settings::overlay_title = "RenoDX Upgrade";
  renodx::utils::settings::global_name = "renodx-upgrade";
  renodx::utils::settings::use_presets = false;

  AddStartupNotice();
  ConfigureSwapchain();
  ConfigureDeviceProxy();
  ConfigureResourceUpgrades();
    ConfigureFPSLimiter();
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX Upgrade";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION =
    "Generic resource and swapchain upgrade utility with frame limiter";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD reason, LPVOID reserved) {
  switch (reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      if (!initialized) {
        Initialize();
        initialized = true;
      }
            reshade::register_event<reshade::addon_event::init_swapchain>(
                    OnInitSwapchain);
            reshade::register_event<reshade::addon_event::destroy_swapchain>(
                    OnDestroySwapchain);
      break;
    case DLL_PROCESS_DETACH:
            reshade::unregister_event<reshade::addon_event::init_swapchain>(
                    OnInitSwapchain);
            reshade::unregister_event<reshade::addon_event::destroy_swapchain>(
                    OnDestroySwapchain);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(reason, &settings);
  renodx::mods::swapchain::Use(reason);

  return TRUE;
}