/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

    float g_draw_ssao_filter = 1.f;

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0x20133A8B),  // Final
    //CustomShaderEntry(0x1920DC80),  // SSAO2
    CustomShaderEntry(0x99D271BE),   // Lutsample
    CustomShaderEntry(0x103B8DEE),   // Sun Shafts 1
    CustomShaderEntry(0xBCC908FC),   // Sun Shafts 2
    CustomShaderEntry(0x9325D090),   // Sun Shafts 3 (+ intermediate pass)
{
    0xF369BD33, {                    // SSAO3 bypass
        .crc32 = 0xF369BD33,
        .on_draw = [](auto* cmd_list)
        {
            return g_draw_ssao_filter == 1.f;
        },
    },  
},
};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Intermediate", "Advanced"},
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &RENODX_TONE_MAP_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "ACES", "RenoDRT"},
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapConfiguration",
        .binding = &CUSTOM_TONE_MAP_CONFIGURATION,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Tonemapping Behavior",
        .section = "Tone Mapping",
        .tooltip = "Set whether the RenoDRT Tonemapper behaves like an upgraded Vanilla tonemapper or uses Custom properties.",
        .labels = {"Vanilla", "Custom"},
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .is_visible = []() { return (settings[1]->GetValue() == 3 && settings[0]->GetValue() >= 1); },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
        .default_value = 1000.f,
        .can_reset = false,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 4000.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &RENODX_DIFFUSE_WHITE_NITS,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &RENODX_GRAPHICS_WHITE_NITS,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueProcessor",
        .binding = &RENODX_TONE_MAP_HUE_PROCESSOR,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Hue Processor",
        .section = "Tone Mapping",
        .tooltip = "Selects hue processor",
        .labels = {"OKLab", "ICtCp"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueShift",
        .binding = &RENODX_TONE_MAP_HUE_SHIFT,
        .default_value = 50.f,
        .label = "Hue Shift",
        .section = "Tone Mapping",
        .tooltip = "Hue-shift emulation strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapWorkingColorSpace",
        .binding = &RENODX_TONE_MAP_WORKING_COLOR_SPACE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Working Color Space",
        .section = "Tone Mapping",
        .labels = {"BT709", "BT2020", "AP1"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueCorrection",
        .binding = &RENODX_TONE_MAP_HUE_CORRECTION,
        .default_value = 100.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Hue retention strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "GammaCorrection",
        .binding = &RENODX_GAMMA_CORRECTION,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a display EOTF.",
        .labels = {"Off", "2.2", "BT.1886"},
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapScaling",
        .binding = &RENODX_TONE_MAP_PER_CHANNEL,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Scaling",
        .section = "Tone Mapping",
        .tooltip = "Luminance scales colors consistently while per-channel saturates and blows out sooner",
        .labels = {"Luminance", "Per Channel"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &RENODX_TONE_MAP_EXPOSURE,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &RENODX_TONE_MAP_SHADOWS,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &RENODX_TONE_MAP_CONTRAST,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &RENODX_TONE_MAP_SATURATION,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .parse = [](float value) { return max(value * 0.01f, 0.000001f); },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &RENODX_TONE_MAP_FLARE,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTStrength",
        .binding = &CUSTOM_LUT_STRENGTH,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "ColorGradeLUTScaling",
    //     .binding = &CUSTOM_LUT_SCALING,
    //     .default_value = 100.f,
    //     .label = "LUT Scaling",
    //     .section = "Color Grading",
    //     .tooltip = "Scales the color grade LUT to full range when size is clamped.",
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
    //     .parse = [](float value) { return value * 0.01f; },
    // },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTSampling",
        .binding = &CUSTOM_LUT_TETRAHEDRAL,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "LUT Sampling",
        .section = "Color Grading",
        .labels = {"Trilinear", "Tetrahedral"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxChromaticAberration",
        .binding = &CUSTOM_CHROMATIC_ABERRATION,
        .default_value = 50.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tooltip = "Adjust the intensity of color fringing.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &CUSTOM_BLOOM,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
        new renodx::utils::settings::Setting{
        .key = "FxLensDirt",
        .binding = &CUSTOM_LENS_DIRT,
        .default_value = 50.f,
        .label = "Lens Dirt",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSunShafts",
        .binding = &CUSTOM_SUN_SHAFTS,
        .default_value = 13.f,
        .label = "Sun Shafts",
        .section = "Effects",
        .tooltip = "Adjust the intensity of sun shafts.",
        .max = 20.f,
        .parse = [](float value) { return value * 0.005f; },
    },
        new renodx::utils::settings::Setting{
        .key = "DisplayMapConfiguration",
        .binding = &RENODX_DISPLAY_MAP,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Display Map Sunshafts",
        .section = "Effects",
        .tooltip = "Sunshafts are run after tonemapping, and can exhibit clipping issues. This applies an Exponential Roll Off to the sunshafts.",
        .labels = {"Off", "On"},
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .is_visible = []() { return (settings[1]->GetValue() > 0); },
    },

    new renodx::utils::settings::Setting{
        .key = "DrawSSAOFilter",
        .binding = &g_draw_ssao_filter,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.0f,
        .label = "SSAO Filtering",
        .section = "Effects",
        .tooltip = "Toggles SSAO filtering. Off is sharper. Off recommended with TAA enabled.",
        .labels = {"Off", "On"},
        //.is_global = true,
        //.is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        //.is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Fantasy HDR",
        .section = "Presets",
        .group = "button-line-1",
        .tint = 0xeb141e,
        .on_change = []() {
            renodx::utils::settings::UpdateSetting("ToneMapType", 3.f);
            renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueShift", 20.f);
            renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 2.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
            renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeExposure", 0.70);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 74.f);
            renodx::utils::settings::UpdateSetting("ColorGradeShadows", 53.f);
            renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 62.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 58.f);
            renodx::utils::settings::UpdateSetting("ColorGradeFlare", 72.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTStrength", 95.f);
            //renodx::utils::settings::UpdateSetting("ColorGradeLUTScaling", 100.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTSampling", 1.f);
            renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
            renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
             renodx::utils::settings::UpdateSetting("FxSunShafts", 14.f);
        }
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Filmic HDR",
        .section = "Presets",
        .group = "button-line-1",
        .tint = 0x2f4858,
        .on_change = []() {
            renodx::utils::settings::UpdateSetting("ToneMapType", 3.f);
            renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueShift", 50.f);
            renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
            renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.15);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 66.f);
            renodx::utils::settings::UpdateSetting("ColorGradeShadows", 55.f);
            renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 55.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 75.f);
            renodx::utils::settings::UpdateSetting("ColorGradeFlare", 86.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTStrength", 100.f);
            //renodx::utils::settings::UpdateSetting("ColorGradeLUTScaling", 100.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTSampling", 1.f);
            renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
            renodx::utils::settings::UpdateSetting("FxBloom", 60.f);
            renodx::utils::settings::UpdateSetting("FxSunShafts", 11.f);
        }
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla SDR",
        .section = "Presets",
        .group = "button-line-1",
        .tint = 0xb5b2b1,
        .on_change = []() {
            renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapGameNits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapUINits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueShift", 50.f);
            renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
            renodx::utils::settings::UpdateSetting("GammaCorrection", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 60.f);
            renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTStrength", 100.f);
            //renodx::utils::settings::UpdateSetting("ColorGradeLUTScaling", 100.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTSampling", 1.f);
            renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
            renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
            renodx::utils::settings::UpdateSetting("FxSunShafts", 13.f);
        }
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Vanilla+ SDR",
        .section = "Presets",
        .group = "button-line-1",
        .tint = 0xb5b2b1,
        .on_change = []() {
            renodx::utils::settings::UpdateSetting("ToneMapType", 3.f);
            renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapGameNits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapUINits", 80.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueShift", 50.f);
            renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
            renodx::utils::settings::UpdateSetting("GammaCorrection", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeContrast", 58.f);
            renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 51.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 60.f);
            renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTStrength", 100.f);
            //renodx::utils::settings::UpdateSetting("ColorGradeLUTScaling", 100.f);
            renodx::utils::settings::UpdateSetting("ColorGradeLUTSampling", 1.f);
            renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
            renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
            renodx::utils::settings::UpdateSetting("FxSunShafts", 13.f);
        }
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
    },
    
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Discord Thread",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch(
              "https://discord.com/channels/1161035767917850784/1335008139980050454");
        },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More RenoDX Mods",
        .section = "Links",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::Launch(
              "https://github.com/clshortfuse/renodx/wiki/Mods");
        },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-3",
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx");
        },
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueShift", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 1.f);
  renodx::utils::settings::UpdateSetting("GammaCorrection", 0.f);
  // renodx::utils::settings::UpdateSetting("ToneMapScaling", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeShadows", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeContrast", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeFlare", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeLUTStrength", 100.f);
  //renodx::utils::settings::UpdateSetting("ColorGradeLUTScaling", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeLUTSampling", 0.f);
  renodx::utils::settings::UpdateSetting("FxChromaticAberration", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
    renodx::utils::settings::UpdateSetting("FxSunShafts", 13.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[3]->default_value = peak.value();
    settings[3]->can_reset = true;
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Valheim";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;


      renodx::mods::swapchain::use_resource_cloning = true;
      //renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      //renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;

      // Always upgrade first of format
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .index = 0,
          .ignore_size = true,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          //.ignore_size = true,
          .aspect_ratio = -1,
      });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_addon(h_module);
      break;
  }
  
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);

  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);

  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

 
  return TRUE;
}
