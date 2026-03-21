/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0


#include <embed/shaders.h>

#include <atomic>
#include <d3d12.h>
#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

// VRS disable toggle (CPU-side only, not in cbuffer)
float disable_vrs = 0.f;

// --- VRS vtable hook ---
using PFN_RSSetShadingRate = void(STDMETHODCALLTYPE*)(
    ID3D12GraphicsCommandList5*, D3D12_SHADING_RATE, const D3D12_SHADING_RATE_COMBINER*);
using PFN_RSSetShadingRateImage = void(STDMETHODCALLTYPE*)(
    ID3D12GraphicsCommandList5*, ID3D12Resource*);

static PFN_RSSetShadingRate     original_RSSetShadingRate = nullptr;
static PFN_RSSetShadingRateImage original_RSSetShadingRateImage = nullptr;
static bool vrs_hook_installed = false;
static std::atomic<uint32_t> vrs_rate_call_count{0};
static std::atomic<uint32_t> vrs_image_call_count{0};

// Diagnostic: log first N calls in detail, then periodic summaries
static constexpr uint32_t VRS_LOG_DETAIL_COUNT = 32;
static constexpr uint32_t VRS_LOG_PERIODIC_INTERVAL = 1000;

static const char* ShadingRateToString(D3D12_SHADING_RATE rate) {
  switch (rate) {
    case D3D12_SHADING_RATE_1X1: return "1X1";
    case D3D12_SHADING_RATE_1X2: return "1X2";
    case D3D12_SHADING_RATE_2X1: return "2X1";
    case D3D12_SHADING_RATE_2X2: return "2X2";
    case D3D12_SHADING_RATE_2X4: return "2X4";
    case D3D12_SHADING_RATE_4X2: return "4X2";
    case D3D12_SHADING_RATE_4X4: return "4X4";
    default: return "UNKNOWN";
  }
}

static const char* CombinerToString(D3D12_SHADING_RATE_COMBINER c) {
  switch (c) {
    case D3D12_SHADING_RATE_COMBINER_PASSTHROUGH: return "PASSTHROUGH";
    case D3D12_SHADING_RATE_COMBINER_OVERRIDE:    return "OVERRIDE";
    case D3D12_SHADING_RATE_COMBINER_MIN:         return "MIN";
    case D3D12_SHADING_RATE_COMBINER_MAX:         return "MAX";
    case D3D12_SHADING_RATE_COMBINER_SUM:         return "SUM";
    default: return "UNKNOWN";
  }
}

void STDMETHODCALLTYPE Hooked_RSSetShadingRate(
    ID3D12GraphicsCommandList5* cmd_list,
    D3D12_SHADING_RATE baseShadingRate,
    const D3D12_SHADING_RATE_COMBINER* combiners) {
  uint32_t count = vrs_rate_call_count.fetch_add(1, std::memory_order_relaxed) + 1;

  if (count <= VRS_LOG_DETAIL_COUNT || (count % VRS_LOG_PERIODIC_INTERVAL) == 0) {
    char buf[256];
    if (combiners) {
      snprintf(buf, sizeof(buf),
        "VRS: RSSetShadingRate #%u  rate=%s  combiners=[%s, %s]%s",
        count, ShadingRateToString(baseShadingRate),
        CombinerToString(combiners[0]), CombinerToString(combiners[1]),
        (disable_vrs != 0.f) ? "  -> OVERRIDDEN to 1X1" : "");
    } else {
      snprintf(buf, sizeof(buf),
        "VRS: RSSetShadingRate #%u  rate=%s  combiners=null%s",
        count, ShadingRateToString(baseShadingRate),
        (disable_vrs != 0.f) ? "  -> OVERRIDDEN to 1X1" : "");
    }
    reshade::log::message(reshade::log::level::info, buf);
  }

  if (disable_vrs != 0.f) {
    original_RSSetShadingRate(cmd_list, D3D12_SHADING_RATE_1X1, nullptr);
  } else {
    original_RSSetShadingRate(cmd_list, baseShadingRate, combiners);
  }
}

void STDMETHODCALLTYPE Hooked_RSSetShadingRateImage(
    ID3D12GraphicsCommandList5* cmd_list,
    ID3D12Resource* shadingRateImage) {
  uint32_t count = vrs_image_call_count.fetch_add(1, std::memory_order_relaxed) + 1;

  if (count <= VRS_LOG_DETAIL_COUNT || (count % VRS_LOG_PERIODIC_INTERVAL) == 0) {
    char buf[256];
    snprintf(buf, sizeof(buf),
      "VRS: RSSetShadingRateImage #%u  image=%s%s",
      count, shadingRateImage ? "non-null" : "null",
      (disable_vrs != 0.f) ? "  -> OVERRIDDEN to null" : "");
    reshade::log::message(reshade::log::level::info, buf);
  }

  if (disable_vrs != 0.f) {
    original_RSSetShadingRateImage(cmd_list, nullptr);
  } else {
    original_RSSetShadingRateImage(cmd_list, shadingRateImage);
  }
}

void OnInitCommandList(reshade::api::command_list* cmd_list) {
  if (vrs_hook_installed) return;

  auto* native_cmd_list = reinterpret_cast<ID3D12GraphicsCommandList*>(cmd_list->get_native());
  if (native_cmd_list == nullptr) return;

  // QI for ID3D12GraphicsCommandList5 to confirm VRS support
  ID3D12GraphicsCommandList5* cmd_list5 = nullptr;
  HRESULT hr = native_cmd_list->QueryInterface(__uuidof(ID3D12GraphicsCommandList5), reinterpret_cast<void**>(&cmd_list5));
  if (FAILED(hr) || cmd_list5 == nullptr) {
    reshade::log::message(reshade::log::level::warning, "VRS: Command list does not support ID3D12GraphicsCommandList5, skipping hook");
    return;
  }

  // Get vtable pointer from the QI'd interface
  void** vtable = *reinterpret_cast<void***>(cmd_list5);

  // ID3D12GraphicsCommandList5::RSSetShadingRate = vtable index 77
  // ID3D12GraphicsCommandList5::RSSetShadingRateImage = vtable index 78
  constexpr int kVtIdx_RSSetShadingRate = 77;
  constexpr int kVtIdx_RSSetShadingRateImage = 78;

  // Self-check: log module containing the vtable entry so we can verify it's d3d12.dll
  {
    HMODULE hmod = nullptr;
    GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                       reinterpret_cast<LPCSTR>(vtable[kVtIdx_RSSetShadingRate]), &hmod);
    char mod_name[MAX_PATH] = {};
    if (hmod) GetModuleFileNameA(hmod, mod_name, MAX_PATH);
    char buf[512];
    snprintf(buf, sizeof(buf), "VRS: vtable[%d] = %p (module: %s)", kVtIdx_RSSetShadingRate, vtable[kVtIdx_RSSetShadingRate], hmod ? mod_name : "UNKNOWN");
    reshade::log::message(reshade::log::level::info, buf);
    snprintf(buf, sizeof(buf), "VRS: vtable[%d] = %p", kVtIdx_RSSetShadingRateImage, vtable[kVtIdx_RSSetShadingRateImage]);
    reshade::log::message(reshade::log::level::info, buf);
  }

  DWORD old_protect;
  if (VirtualProtect(&vtable[kVtIdx_RSSetShadingRate], sizeof(void*) * 2, PAGE_READWRITE, &old_protect)) {
    original_RSSetShadingRate = reinterpret_cast<PFN_RSSetShadingRate>(vtable[kVtIdx_RSSetShadingRate]);
    original_RSSetShadingRateImage = reinterpret_cast<PFN_RSSetShadingRateImage>(vtable[kVtIdx_RSSetShadingRateImage]);

    vtable[kVtIdx_RSSetShadingRate] = reinterpret_cast<void*>(&Hooked_RSSetShadingRate);
    vtable[kVtIdx_RSSetShadingRateImage] = reinterpret_cast<void*>(&Hooked_RSSetShadingRateImage);

    VirtualProtect(&vtable[kVtIdx_RSSetShadingRate], sizeof(void*) * 2, old_protect, &old_protect);
    vrs_hook_installed = true;
    reshade::log::message(reshade::log::level::info, "VRS: Vtable hook installed (RSSetShadingRate @ idx 77, RSSetShadingRateImage @ idx 78)");
  } else {
    reshade::log::message(reshade::log::level::error, "VRS: Failed to VirtualProtect vtable for hook installation");
  }

  cmd_list5->Release();
}

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};
//renodx::mods::shader::CustomShaders custom_shaders;

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;

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
        .default_value = 1.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type.\nVanilla uses the unmodified ACESv2 tone mapper with in-game sliders.\nPsychoV uses our custom psychovisual tone mapping system.",
        .labels = {"Vanilla (ACESv2)","PsychoV-11"},
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
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
    new renodx::utils::settings::Setting{
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
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Adjust UI brightness with the in-game slider.\n",
        .section = "Tone Mapping",
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueRestore",
        .binding = &shader_injection.tone_map_hue_restore,
        .default_value = 10.f,
        .label = "Hue Restore",
        .section = "Advanced Tone Mapping Properties",
        .tooltip = "Hue retention strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
        new renodx::utils::settings::Setting{
        .key = "ToneMapBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Advanced Tone Mapping Properties",
        .tooltip = "Desaturates the brightest portions of the image, also relative to peak brightness.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
        new renodx::utils::settings::Setting{
        .key = "ColorGradeStrength",
        .binding = &shader_injection.color_grade_strength,
        .default_value = 100.f,
        .label = "Pre-Tonemap Grade Strength",
        .section = "Advanced Tone Mapping Properties",
        .tooltip = "Adjusts how much of the game's dynamic grading applies to the image.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .is_visible = []() { return current_settings_mode >= 1; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 60.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 60.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeAdaptationContrast",
        .binding = &shader_injection.tone_map_adaptation_contrast,
        .default_value = 50.f,
        .label = "Adaptation Contrast",
        .section = "Color Grading",
        .tooltip = "Adds contrast primarily to shadowed regions",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
            new renodx::utils::settings::Setting{
        .key = "FxFilmGrainType",
        .binding = &shader_injection.custom_film_grain_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Film Grain Type",
        .section = "Effects",
        .tooltip = "Selects between original or RenoDX film grain",
        .labels = {"Vanilla", "Perceptual"},
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 50.f,
        .label = "FilmGrain",
        .section = "Effects",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .max = 100.f,
        .is_enabled = []() { return CUSTOM_FILM_GRAIN_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
            new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &shader_injection.custom_chromatic_aberration,
        .default_value = 0.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tooltip = "Adjusts chromatic aberration strength. 100 = Vanilla",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxSharpening",
        .binding = &shader_injection.custom_sharpening,
        .default_value = 0.f,
        .label = "Sharpening",
        .section = "Effects",
        .tooltip = "Adjusts sharpening strength. 100 = Vanilla",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "ContactShadowQuality",
        .binding = &shader_injection.contact_shadow_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Screen-Space Shadow Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX contact shadow improvements.\n"
                   "Off = vanilla 8-step contact shadows.\n"
                   "On = 60-step ray march with bilinear depth, adaptive thickness, improved stencil filtering, fade-out, and contrast boost.",
        .labels = {"Off", "On"},
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowQuality",
        .binding = &shader_injection.shadow_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX shadow quality improvements.\n"
                   "Off = vanilla shadow sampling (per-frame PCF rotation causes shimmer).\n"
                   "On = temporally stable PCF sampling (removes frame-dependent rotation from all shadow layers).",
        .labels = {"Off", "On"},
    },
        new renodx::utils::settings::Setting{
        .key = "RaytracingQuality",
        .binding = &shader_injection.rt_quality,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Raytracing Improvements",
        .section = "Rendering",
        .tooltip = "Toggles RenoDX raytracing noise improvements.\n"
                   "Off = vanilla white noise (TEA+MCG) for all RT sampling.\n"
                   "On = IS-FAST spatio-temporal blue noise for ray generation.\n"
                   "Debug Noise = visualizes the raw IS-FAST texture sample as color output.",
        .labels = {"Off", "On", "Debug Noise"},
    },
        new renodx::utils::settings::Setting{
        .key = "DisableVRS",
        .binding = &disable_vrs,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Disable VRS",
        .section = "Rendering",
        .tooltip = "Disables Variable Rate Shading (VRS).\n"
                   "Off = vanilla VRS (game controls shading rate per-tile).\n"
                   "On = forces full-resolution 1x1 shading rate everywhere.",
        .labels = {"Off", "On"},
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowDebugMode",
        .binding = &shader_injection.shadow_debug_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Debug View",
        .section = "Debug",
        .tooltip = "Visualizes internal shadow layer data. Replaces the shadow buffer output with a diagnostic color.\n"
                   "Off = normal rendering.\n"
                   "Terrain Shadow = grey: dark=shadowed, white=lit.\n"
                   "Dynamic Cascade = cyan=cascade0, yellow=cascade1, dark-red=not covered.\n"
                   "Static Cascade = green=static0, blue=static1, dark-red=not covered.\n"
                   "Active Layer Map = false-color which cascade layer is active per pixel.\n"
                   "Pre-Contact PCF = combined shadow after cascades/near-field, before contact shadows.\n"
                   "Contact Shadow = dark=occluded by screen-space contact shadow.\n"
                   "Depth Delta = heatmap of depth-behind-shadowmap (bias diagnosis).\n"
                   "Penumbra Channel = raw W-channel (gamma-stretched depth advance).\n"
                   "Stencil ID = false-color by material stencil group.\n"
                   "Cascade Seams = yellow highlight at dynamic cascade UV boundaries.",
        .labels = {"Off", "Terrain Shadow", "Dynamic Cascade", "Static Cascade",
                   "Active Layer Map", "Pre-Contact PCF", "Contact Shadow",
                   "Depth Delta", "Penumbra Channel", "Stencil ID", "Cascade Seams"},
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
        new renodx::utils::settings::Setting{
        .key = "ShadowDisableLayer",
        .binding = &shader_injection.shadow_disable_layer,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Shadow Layer Disable",
        .section = "Debug",
        .tooltip = "Disables a specific shadow layer so you can see its contribution by toggling it off.\n"
                   "None = all layers active (normal rendering).\n"
                   "Terrain Shadow = heightmap PCF.\n"
                   "Dynamic Cascade = character/object cascade shadow maps.\n"
                   "Static Cascade = baked environment cascade shadow maps.\n"
                   "Near-Field Contact = ray-marched near-field contact shadows.\n"
                   "Screen-Space Contact = screen-space contact shadow pass.",
        .labels = {"None", "Terrain Shadow", "Dynamic Cascade", "Static Cascade",
                   "Near-Field Contact", "Screen-Space Contact"},
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
          }
        },
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
        .label = "Forge's Ko-Fi",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/forge87682");
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
        .label = "ShortFuse's Ko-Fi",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Game mod by Forge and Jon (OopyDoopy/Kickfister), RenoDX Framework by Shortfuse",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Extra special thanks to Shortfuse for all the extra work on the shader decompiler for this one!",
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

    renodx::utils::settings::UpdateSetting("ToneMapHueRestore", 10.f);
    renodx::utils::settings::UpdateSetting("ToneMapBlowout", 0.f);
    renodx::utils::settings::UpdateSetting("ColorGradeStrength", 100.f);

    renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
    renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
    renodx::utils::settings::UpdateSetting("ColorGradeContrast", 60.f);
    renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 60.f);
    renodx::utils::settings::UpdateSetting("ColorGradeAdaptationContrast", 50.f);

    renodx::utils::settings::UpdateSetting("FxFilmGrainType", 0.f);
    renodx::utils::settings::UpdateSetting("FxFilmGrain", 50.f);
    renodx::utils::settings::UpdateSetting("FxChromaticAberration", 100.f);
    renodx::utils::settings::UpdateSetting("FxSharpening", 100.f);
    renodx::utils::settings::UpdateSetting("DisableVRS", 0.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[2]->default_value = roundf(peak.value());
  } else {
    settings[2]->default_value = 1000.f;
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Crimson Desert";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
            reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      // while (IsDebuggerPresent() == 0) Sleep(100);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;

      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain

      renodx::mods::shader::allow_multiple_push_constants = true;
      renodx::mods::shader::force_pipeline_cloning = true;

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::init_command_list>(OnInitCommandList);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::init_command_list>(OnInitCommandList);

      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}
