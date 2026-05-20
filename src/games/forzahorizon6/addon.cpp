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
//#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
//#include "../../utils/swapchain.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;
float r11g11b10_upgrade_enabled = 1.f;

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

  renodx::utils::resource::upgrade::SetUpgradeInfos(device, upgrade_infos);
}

namespace shader_toggle {
namespace runtime {
float g_use_shaders = 1.f;          // Controlled by slider
float g_current_use_shaders = 1.f;  // Will be overridden on startup

void OnPresent(
    reshade::api::command_queue*,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect*,
    const reshade::api::rect*,
    uint32_t,
    const reshade::api::rect*) {
  if (g_use_shaders != g_current_use_shaders) {
    reshade::log::message(
        reshade::log::level::info,
        (g_use_shaders != 0.f) ? "Enabling shaders (toggle)" : "Disabling shaders (toggle)");

    auto* device = swapchain->get_device();
    if (device == nullptr) {
      reshade::log::message(reshade::log::level::error, "Device is null in OnPresent");
      g_current_use_shaders = g_use_shaders;
      return;
    }

    if (g_use_shaders != 0.f) {
      for (const auto& [hash, shader] : custom_shaders) {
        renodx::utils::shader::AddRuntimeReplacement(device, hash, shader.code);
      }
      reshade::log::message(
          reshade::log::level::info,
          ("Injected " + std::to_string(custom_shaders.size()) + " shaders").c_str());
    } else {
      renodx::utils::shader::RemoveRuntimeReplacements(device);
      reshade::log::message(reshade::log::level::info, "Removed all shader replacements.");
    }

    g_current_use_shaders = g_use_shaders;
  }
}

void RegisterEvents() {
  g_current_use_shaders = -1.0f;
  reshade::register_event<reshade::addon_event::present>(OnPresent);
}

void UnregisterEvents() {
  reshade::unregister_event<reshade::addon_event::present>(OnPresent);
}

renodx::utils::settings::Setting* GetSetting() {
  return new renodx::utils::settings::Setting{
      .key = "",
      .binding = &g_use_shaders,
      .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
      .default_value = 1.f,
      .label = "Enable Mod",
      .section = "Options",
      .on_change = []() {
        g_current_use_shaders = -1.f;
      },
  };
}
}  // namespace runtime
}  // namespace shader_toggle

// renodx::utils::settings::Setting* peak_white_nits_setting = nullptr;
// renodx::utils::settings::Setting* diffuse_white_nits_setting = nullptr;
renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "HDR Calibration is handled via the in-game options!",
        .section = "Instructions",
    },
    shader_toggle::runtime::GetSetting(),
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

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX | Forza Horizon 6";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Forza Horizon 6";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;


      //renodx::utils::resource::upgrade::Use(fdw_reason);  // fp11 upgrades, not working :(
      //reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);

      shader_toggle::runtime::g_current_use_shaders = -1.0f;
      reshade::register_event<reshade::addon_event::present>(shader_toggle::runtime::OnPresent);

      renodx::utils::shader::use_replace_async = true;
      renodx::utils::settings::use_presets = false;

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::present>(shader_toggle::runtime::OnPresent);
      reshade::unregister_addon(h_module);
      break;
  }

  // No cbuffers allowed
  renodx::utils::settings::Use(fdw_reason, &settings);
  renodx::mods::shader::Use(fdw_reason, custom_shaders);

  return TRUE;
}
