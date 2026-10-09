/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <algorithm>
#include <array>
#include <chrono>
#include <iomanip>
#include <random>
#include <sstream>
#include <string>

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/swapchain.hpp"
#include "./shared.h"
#include "./prism/prism.hpp"
#include "./prism/prism_ui.hpp"

namespace {

ShaderInjectData shader_injection;

bool final_hdr_drawn_this_frame = false;
bool final_hdr_draw_history[10] = {};
uint32_t final_hdr_draw_history_index = 0;

void OnFinalHDRDrawn([[maybe_unused]] reshade::api::command_list* cmd_list) {
    shader_injection.last_is_hdr = true;
  final_hdr_drawn_this_frame = true;
}

renodx::mods::shader::CustomShaders custom_shaders = {
    {0x8F5737B5, {.crc32 = 0x8F5737B5, .code = __0x8F5737B5, .on_drawn = &OnFinalHDRDrawn}},
    {0x496222DA, {.crc32 = 0x496222DA, .code = __0x496222DA, .on_drawn = &OnFinalHDRDrawn}},
    {0x9F54CB3F, {.crc32 = 0x9F54CB3F, .code = __0x9F54CB3F, .on_drawn = &OnFinalHDRDrawn}},
    __ALL_CUSTOM_SHADERS,
};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

float current_settings_mode = 0;
float developer_mode_enabled = 0.f;

renodx::utils::settings::Setting* peak_white_nits_setting = nullptr;
renodx::utils::settings::Setting* diffuse_white_nits_setting = nullptr;

renodx::utils::prism::ResolvedConfig prism_resolved = {};
float prism_primary_mode = 3.f;
float prism_temperature = 6501.7344f;
float prism_tint = 0.0031730535f;
float prism_strength = 1.f;
float prism_global_reach = 1.f;
float prism_global_hue = 0.f;
float prism_red_reach = 1.f;
float prism_red_hue = 0.f;
float prism_green_reach = 1.f;
float prism_green_hue = 0.f;
float prism_blue_reach = 1.f;
float prism_blue_hue = 0.f;
float prism_use_recommended_matrix = 1.f;

constexpr std::array<std::array<float, 4>, 3> RECOMMENDED_PRISM_MATRIX = {{
        {{0.621425450f, 0.358117968f, 0.020456584f, 0.f}},
        {{0.108147234f, 0.833376706f, 0.058476083f, 0.f}},
        {{0.035512406f, 0.113029048f, 0.851458549f, 0.f}},
}};

bool IsPrismDeveloperMenuVisible() {
    return developer_mode_enabled != 0.f
            && current_settings_mode >= 2.f
            && RENODX_TONE_MAP_TYPE == 2.f;
}

bool IsPrismPrimaryControlsEnabled() {
    return IsPrismDeveloperMenuVisible()
            && prism_use_recommended_matrix == 0.f;
}

int GetPrismPrimaryMode() {
    return std::clamp(static_cast<int>(prism_primary_mode), 0, 5);
}

bool IsPrismCustomMode() {
    return GetPrismPrimaryMode() == 5;
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
    const auto& matrix = prism_use_recommended_matrix != 0.f
        ? RECOMMENDED_PRISM_MATRIX
        : prism_resolved.inset_rows;
    for (const auto& row : matrix) {
        message << "  [" << row[0] << ", " << row[1] << ", " << row[2] << "]\n";
    }
    return message.str();
}

void ResolvePrismInjection() {
    auto config = renodx::utils::prism::AuthoringConfig{};
    const auto gamut = GetPrismGamut();
    config.gamut = gamut;
    if (IsPrismCustomMode()) {
        config.gamut = renodx::utils::prism::Gamut::BT2020;
        config.allow_primary_extrapolation = true;
        config.temperature_kelvin = prism_temperature;
        config.tint_duv = prism_tint;
        config.strength = prism_strength;
        config.global_reach = prism_global_reach;
        config.global_hue_degrees = prism_global_hue;
        config.red_reach = prism_red_reach;
        config.red_hue_degrees = prism_red_hue;
        config.green_reach = prism_green_reach;
        config.green_hue_degrees = prism_green_hue;
        config.blue_reach = prism_blue_reach;
        config.blue_hue_degrees = prism_blue_hue;
    } else {
        auto white = renodx::utils::prism::WhitePreset::D65;
        if (gamut == renodx::utils::prism::Gamut::AP1) {
            white = renodx::utils::prism::WhitePreset::D60;
        } else if (gamut == renodx::utils::prism::Gamut::DCI_P3) {
            white = renodx::utils::prism::WhitePreset::DCI;
        }
        const auto white_temperature_tint = renodx::utils::prism::TemperatureTintFromXY(
                static_cast<float>(white[0]),
                static_cast<float>(white[1]));
        config.temperature_kelvin = white_temperature_tint.kelvin;
        config.tint_duv = white_temperature_tint.tint_duv;
    }

    prism_resolved = renodx::utils::prism::Resolve(config);
    const auto& matrix = prism_use_recommended_matrix != 0.f
        ? RECOMMENDED_PRISM_MATRIX
        : prism_resolved.inset_rows;
    shader_injection.prism_inset_00 = matrix[0][0];
    shader_injection.prism_inset_01 = matrix[0][1];
    shader_injection.prism_inset_02 = matrix[0][2];
    shader_injection.prism_inset_10 = matrix[1][0];
    shader_injection.prism_inset_11 = matrix[1][1];
    shader_injection.prism_inset_12 = matrix[1][2];
    shader_injection.prism_inset_20 = matrix[2][0];
    shader_injection.prism_inset_21 = matrix[2][1];
    shader_injection.prism_inset_22 = matrix[2][2];
    if (prism_use_recommended_matrix != 0.f) {
        using renodx::utils::prism::detail::Mat3;
        const Mat3 inset = {{
            {matrix[0][0], matrix[0][1], matrix[0][2]},
            {matrix[1][0], matrix[1][1], matrix[1][2]},
            {matrix[2][0], matrix[2][1], matrix[2][2]},
        }};
        const auto outset = renodx::utils::prism::detail::Inverse(inset);
        const auto bt709_to_lms = renodx::utils::prism::detail::Mul(
            renodx::utils::prism::detail::kXYZToStockmanSharpLMS,
            renodx::utils::prism::detail::kBT709ToXYZ);
        const auto bt709_to_xfyfzf = renodx::utils::prism::detail::Mul(
            renodx::utils::prism::detail::kStockmanSharpLMSToXfYfZf,
            bt709_to_lms);
        const auto yf_bt709 = renodx::utils::prism::detail::Row(bt709_to_xfyfzf, 1);
        const float yf_weight_0 = static_cast<float>(
            (yf_bt709.x * outset.m[0][0])
            + (yf_bt709.y * outset.m[1][0])
            + (yf_bt709.z * outset.m[2][0]));
        const float yf_weight_1 = static_cast<float>(
            (yf_bt709.x * outset.m[0][1])
            + (yf_bt709.y * outset.m[1][1])
            + (yf_bt709.z * outset.m[2][1]));
        const float yf_weight_2 = static_cast<float>(
            (yf_bt709.x * outset.m[0][2])
            + (yf_bt709.y * outset.m[1][2])
            + (yf_bt709.z * outset.m[2][2]));
        const float neutral_yf = yf_weight_0 + yf_weight_1 + yf_weight_2;
        shader_injection.prism_yf_weight_0 = yf_weight_0;
        shader_injection.prism_yf_weight_1 = yf_weight_1;
        shader_injection.prism_yf_weight_2 = yf_weight_2;
        shader_injection.prism_yf_neutral_axis_0 = 1.f;
        shader_injection.prism_yf_neutral_axis_1 = 1.f;
        shader_injection.prism_yf_neutral_axis_2 = 1.f;
        shader_injection.prism_yf_neutral_reciprocal =
            std::abs(neutral_yf) > 1e-12f ? 1.f / neutral_yf : 1.f;
    } else {
        shader_injection.prism_yf_weight_0 = prism_resolved.yf_weights[0];
        shader_injection.prism_yf_weight_1 = prism_resolved.yf_weights[1];
        shader_injection.prism_yf_weight_2 = prism_resolved.yf_weights[2];
        shader_injection.prism_yf_neutral_axis_0 = prism_resolved.yf_neutral_axis[0];
        shader_injection.prism_yf_neutral_axis_1 = prism_resolved.yf_neutral_axis[1];
        shader_injection.prism_yf_neutral_axis_2 = prism_resolved.yf_neutral_axis[2];
        shader_injection.prism_yf_neutral_reciprocal = prism_resolved.yf_weights[3];
    }
}

void OnPrismSettingChange(float previous_value, float current_value) {
    (void)previous_value;
    (void)current_value;
    ResolvePrismInjection();
}

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "TheWitcher3RemasteredDeveloperMode",
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
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Theses options are purely to adjust to taste.",
        .section = "NOTICE",
        .group = "button-line-2",
        .tint = 0xFF0000,
        .is_visible = []() { return current_settings_mode >= 1.f; }},
    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Vanilla (AgX): Vanilla SDR/HDR output. HDR has an inverse tone mapping option so you can see the native HDR or original SDR output.\n"
        "Vanilla+ (AgX Extended): Extends the original AgX curve and reworks the grading chain to be HDR friendly, before getting mapped to the display for either SDR or HDR modes.\n"
        "Prism: Uses our custom tone mapping solution with a custom working space. Can use the original tone curve, our recommended one, or define your own.",
        .labels = {"Vanilla (AgX)", "Vanilla+ (AgX Extended)", "RenoDX (Prism)"},
        .parse = [](float value) { return value; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismMatrixSource",
        .binding = &prism_use_recommended_matrix,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Primary Matrix",
        .section = "Prism Primaries",
        .tooltip = "Selects between tunable Prism primary controls and the recommended hand-tuned matrix.",
        .labels = {"Prism Controls", "Recommended"},
        .is_enabled = []() { return IsPrismDeveloperMenuVisible(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismPrimaryMode",
        .binding = &prism_primary_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .label = "Primary Mode",
        .section = "Prism Primaries",
        .tooltip = "Selects the working primary basis. Custom starts from BT.2020 and enables primary tuning.",
        .labels = {"BT.709", "DCI-P3", "BT.2020", "AP1", "LMS", "Custom"},
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismTemperature",
        .binding = &prism_temperature,
        .default_value = 6501.7344f,
        .label = "White Temperature",
        .section = "Prism Primaries",
        .tooltip = "Sets the custom primary white point on the Planckian locus.",
        .min = 1667.f,
        .max = 25000.f,
        .format = "%.0f K",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismTint",
        .binding = &prism_tint,
        .default_value = 0.0031730535f,
        .label = "White Tint (Duv)",
        .section = "Prism Primaries",
        .tooltip = "Offsets the custom white point in CIE 1960 UCS. Positive values shift toward green.",
        .min = -0.05f,
        .max = 0.05f,
        .format = "%.4f",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismStrength",
        .binding = &prism_strength,
        .default_value = 100.f,
        .label = "Primary Strength",
        .section = "Prism Primaries",
        .tooltip = "Scales all custom primary reach and hue changes.",
        .max = 100.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGlobalReach",
        .binding = &prism_global_reach,
        .default_value = 100.f,
        .label = "Global Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales all RGB basis axes. Values above 100% extrapolate the BT.2020 starting basis, capped at 200%.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGlobalHue",
        .binding = &prism_global_hue,
        .default_value = 0.f,
        .label = "Global Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates all three RGB basis axes in CIE 1931 xy.",
        .min = -180.f,
        .max = 180.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismRedReach",
        .binding = &prism_red_reach,
        .default_value = 100.f,
        .label = "Red Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the red basis axis around the authored white.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismRedHue",
        .binding = &prism_red_hue,
        .default_value = 0.f,
        .label = "Red Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the red basis axis in CIE 1931 xy.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGreenReach",
        .binding = &prism_green_reach,
        .default_value = 100.f,
        .label = "Green Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the green basis axis around the authored white.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismGreenHue",
        .binding = &prism_green_hue,
        .default_value = 0.f,
        .label = "Green Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the green basis axis in CIE 1931 xy.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismBlueReach",
        .binding = &prism_blue_reach,
        .default_value = 100.f,
        .label = "Blue Reach",
        .section = "Prism Primaries",
        .tooltip = "Scales the blue basis axis around the authored white.",
        .max = 200.f,
        .format = "%.0f%%",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismBlueHue",
        .binding = &prism_blue_hue,
        .default_value = 0.f,
        .label = "Blue Rotation",
        .section = "Prism Primaries",
        .tooltip = "Rotates the blue basis axis in CIE 1931 xy.",
        .min = -45.f,
        .max = 45.f,
        .format = "%.1f°",
        .is_enabled = []() { return IsPrismPrimaryControlsEnabled() && IsPrismCustomMode(); },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .section = "Prism Primaries",
        .on_draw = []() {
          ResolvePrismInjection();
                    if (prism_use_recommended_matrix == 0.f) {
                        renodx::utils::prism::ui::DrawCIE1931Chart(prism_resolved, GetPrismGamut());
                    } else {
                        ImGui::TextDisabled("Recommended matrix selected; primary controls are bypassed.");
                    }
          ImGui::TextUnformatted("BT.709 to Prism Inset Matrix");
          static std::string matrix_text;
          matrix_text = FormatPrismMatrix();
          ImVec2 matrix_size = ImGui::GetContentRegionAvail();
          matrix_size.y = ImGui::GetTextLineHeightWithSpacing() * 4.f;
          ImGui::InputTextMultiline(
              "##PrismInsetMatrix",
              matrix_text.data(),
              matrix_text.size() + 1,
              matrix_size,
              ImGuiInputTextFlags_ReadOnly);
          return false;
        },
        .is_visible = []() {
                    return IsPrismDeveloperMenuVisible();
        },
    },
    peak_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = true,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits.",
        .min = 80.f,
        .max = 10000.f,
        .is_enabled = []() { return shader_injection.last_is_hdr; },
        .is_visible = []() { return current_settings_mode >= 0 && shader_injection.last_is_hdr; },
        .is_logarithmic = true,
    },
    diffuse_white_nits_setting = new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .can_reset = true,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits.",
        .min = 80.f,
        .max = 500.f,
        .is_visible = []() { return shader_injection.last_is_hdr; },
        .is_logarithmic = true,
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
        .is_visible = []() { return shader_injection.last_is_hdr; },
        .is_logarithmic = true,
    },
    new renodx::utils::settings::Setting{
        .key = "SDROutputEncoding",
        .binding = &shader_injection.custom_sdr_output_encoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Output Encoding",
        .section = "Tone Mapping",
        .tooltip = "This should match the display gamma. If unsure, 2.2 is likely correct.",
        .labels = {"sRGB", "2.2", "2.4"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0.f && !shader_injection.last_is_hdr; },
        .is_visible = []() { return current_settings_mode >= 0.f && !shader_injection.last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapAgxVanillaBend",
        .binding = &shader_injection.agx_vanilla_bend,
        .default_value = 66.f,
        .label = "Shoulder Blend",
        .section = "Tone Mapping",
        .tooltip = "Blends the extended shoulder strength toward the vanilla tonemapper.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapInverseToneMap",
        .binding = &shader_injection.custom_inverse_tone_map,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Inverse Tone Mapping",
        .section = "Tone Mapping",
        .tooltip = "Toggles the inverse tone mapping used by the vanilla HDR.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 0.f; },
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
        .key = "PrismBlackFloor",
        .binding = &shader_injection.prism_black_floor,
        .default_value = 100.f,
        .label = "Black Floor",
        .section = "Tone Mapping",
        .tooltip = "Controls the toe of the curve. 0 targets a perfect black floor, 100 is vanilla.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return true; },
        .parse = [](float value) { return value * 0.01f; },
        .on_change_value = &OnPrismSettingChange,
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "DebugAgxCurveCanvas",
        .binding = &shader_injection.custom_debug_show_agx_curve_values,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "AgX Curve Canvas",
        .section = "Developer",
        .tooltip = "Draws the AgX parameters over the game image.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return IsPrismDeveloperMenuVisible(); },
        .is_visible = []() { return IsPrismDeveloperMenuVisible(); },
    },
    //   new renodx::utils::settings::Setting{
    //     .key = "CustomGammaType",
    //     .binding = &CUSTOM_GAMMA_TYPE,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .can_reset = true,
    //     .label = "SDR EOTF Emulation",
    //     .section = "Tone Mapping",
    //     .tooltip = "Emulates SDR gamma response. In SDR mode, this assumes the display is calibrated to 2.2 gamma.",
    //     .labels = {"sRGB", "Power Gamma"},
    //     //.is_enabled = []() { return shader_injection.tone_map_type >= 2.f; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return settings[0]->GetValue() >= 2; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "CustomGammaValue",
    //     .binding = &CUSTOM_GAMMA_VALUE,
    //     .default_value = 2.2f,
    //     .label = "Power Gamma",
    //     .section = "Tone Mapping",
    //     .tooltip = "Artificial but pleasing boost to highlight strength.",
    //     .min = 2.0f,
    //     .max = 2.4f,
    //     .format = "%.2f",
    //     .is_enabled = []() { return CUSTOM_GAMMA_TYPE == 1; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2;},
    // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Recommended",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (RECOMMENDED_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Purist",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (PURIST_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, PURIST_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Filmic",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (FILMIC_VALUES.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, FILMIC_VALUES.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return shader_injection.last_is_hdr; }
    // },

    // // SDR PRESETS
    //     new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Recommended",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (RECOMMENDED_VALUES_SDR.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, RECOMMENDED_VALUES_SDR.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // },
    // //     new renodx::utils::settings::Setting{
    // //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    // //     .label = "Purist",
    // //     .section = "Presets",
    // //     .group = "button-line-1",
    // //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    // //     .on_change = []() {
    // //       for (auto* setting : settings) {
    // //         if (setting->key.empty()) continue;
    // //         if (!setting->can_reset) continue;
    // //         if (setting->is_global) continue;
    // //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    // //         if (PURIST_VALUES_SDR.contains(setting->key)) {
    // //           renodx::utils::settings::UpdateSetting(setting->key, PURIST_VALUES_SDR.at(setting->key));
    // //         } else {
    // //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    // //         }
    // //       }
    // //     },
    // //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Filmic",
    //     .section = "Presets",
    //     .group = "button-line-1",
    //     //.is_enabled = []() { return shader_injection.last_is_hdr; },
    //     .on_change = []() {
    //       for (auto* setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->is_global) continue;
    //         if (CANNOT_PRESET_VALUES.contains(setting->key)) continue;
    //         if (FILMIC_VALUES_SDR.contains(setting->key)) {
    //           renodx::utils::settings::UpdateSetting(setting->key, FILMIC_VALUES_SDR.at(setting->key));
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    //     .is_visible = []() { return !shader_injection.last_is_hdr; }
    // },
    new renodx::utils::settings::Setting{
        .key = "LutGradeStrength",
        .binding = &shader_injection.custom_lut_strength,
        .default_value = 100.f,
        .label = "LUT Grading Strength",
        .section = "Scene Grading",
        .tooltip = "Strength of the original color grading LUTs.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "LutScaling",
        .binding = &shader_injection.custom_lut_scaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Scene Grading",
        .tooltip = "Scales the LUTs so they're full range (i.e. fixes raised blacks in some scenes). 0 = Vanilla",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeStrength",
        .binding = &shader_injection.custom_color_grading,
        .default_value = 100.f,
        .label = "Color Grading Strength",
        .section = "Scene Grading",
        .tooltip = "Strength of the original color grading, applied after LUTs.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "GradingImprovements",
        .binding = &shader_injection.custom_grading_improvements,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Grading Improvements",
        .section = "Scene Grading",
        .tooltip = "Upgrades the game's color grading to prevent hue clipping.",
        .labels = {"Vanilla", "Upgraded"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .key = "ColorGradeHighlightContrast",
        .binding = &shader_injection.tone_map_highlight_contrast,
        .default_value = 50.f,
        .label = "Highlight Contrast",
        .section = "Color Grading",
        .tooltip = "Adjusts contrast above the tonal anchor. 50 is neutral.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadowContrast",
        .binding = &shader_injection.tone_map_shadow_contrast,
        .default_value = 50.f,
        .label = "Shadow Contrast",
        .section = "Color Grading",
        .tooltip = "Adjusts contrast below the tonal anchor. 50 is neutral.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.0001f; },
        .is_visible = []() { return current_settings_mode >= 1; },
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
        .is_visible = []() { return current_settings_mode >= 1.f; },
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
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
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
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },

    // new renodx::utils::settings::Setting{
    //     .key = "TonemapGradeStrength",
    //     .binding = &shader_injection.scene_grade_strength,
    //     .default_value = 100.f,
    //     .label = "Tonemapping Grade",
    //     .section = "Color Grading",
    //     .tooltip = "Strength of the original tonemapper's grading",
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .parse = [](float value) { return value * 0.01f; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "FxPostProcessingMaxCLL",
    //     .binding = &shader_injection.custom_post_maxcll,
    //     .default_value = 10.f,
    //     .label = "Post Processing MaxCLL",
    //     .section = "Effects",
    //     .tooltip = "Controls the max nits used when tonemapping color for post processing effects. Strongly affects bloom and sunshafts. Value * 10 = nits.",
    //     .min = 10.f,
    //     .max = 100.f,
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    //     .parse = [](float value) { return value * 0.1f; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
    //     new renodx::utils::settings::Setting{
    //     .key = "BloomEmulation",
    //     .binding = &shader_injection.bloom_emulation,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .can_reset = true,
    //     .label = "Bloom Emulation",
    //     .section = "Effects",
    //     .tooltip = "Approximately emulate SDR behavior, or upgrade bloom parameters for an HDR input.",
    //     .labels = {"SDR Approximate", "HDR Upgrade"},
    //     .is_enabled = []() { return RENODX_TONE_MAP_TYPE > 1; },
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2.f && shader_injection.last_is_hdr; },
    // },
    new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &shader_injection.custom_bloom,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .tooltip = "Adjusts bloom response. 50 matches the Vanilla intensity reference; lower values reduce bloom and higher values extend compressed HDR highlights.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxLensDirt",
        .binding = &shader_injection.custom_lens_dirt,
        .default_value = 50.f,
        .label = "Lens Dirt",
        .section = "Effects",
        .tooltip = "Adjusts the strength of the dirt effect when sun shafts are on screen.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSunShaftStrength",
        .binding = &shader_injection.custom_sunshafts_strength,
        .default_value = 50.f,
        .label = "Sunshafts Strength",
        .section = "Effects",
        .tooltip = "Adjusts sunshaft response. 50 matches the Vanilla intensity reference; lower values reduce sunshafts and higher values extend compressed HDR highlights.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxVignetteBlackLevel",
        .binding = &shader_injection.custom_vignette_black_level,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Vignette Black Level",
        .section = "Effects",
        .tooltip = "Controls whether the vignette uses the game's dynamic black level adjustment or a value fixed at perfect black.",
        .labels = {"Vanilla", "Perfect Black"},
        .parse = [](float value) {
          if (value == 0) return 1.f;
          return 0.f;
        },
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.last_is_hdr; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxVignette",
        .binding = &shader_injection.custom_vignette,
        .default_value = 66.f,
        .label = "Vignette",
        .section = "Effects",
        .tooltip = "Adjusts the strength of vignette effect. 100 = Vanilla strength.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxDepthBlur",
        .binding = &shader_injection.custom_depth_blur,
        .default_value = 50.f,
        .label = "Depth Blur Amount",
        .section = "Effects",
        .tooltip = "Adjusts the amount of depth blur.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        //.is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "VideoPlayback",
        .binding = &shader_injection.custom_video,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Video Playback",
        .section = "Effects",
        .tooltip = "Corrects video YCbCr conversion to Rec. 709.",
        .labels = {"Vanilla (Rec. 601)", "Fixed (Rec. 709)"},
        .parse = [](float value) { return value; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpeningType",
        .binding = &shader_injection.custom_sharpening_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Sharpening Type",
        .section = "RenoFX",
        .tooltip = "Select sharpening method for SDR and HDR output. NIS only available with DLSS.",
        .labels = {"NIS", "Lilium's RCAS"},
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpness",
        .binding = &shader_injection.custom_sharpness,
        .default_value = 0.f,
        .label = "Sharpness",
        .section = "RenoFX",
        .tooltip = "Controls Sharpness",
        .max = 100.f,
        .parse = [](float value) { 
        if (CUSTOM_SHARPENING_TYPE == 0) {
            return value * 0.02f; // NIS
        }
        return value == 0 ? 0.f : exp2(-(1.f - (value * 0.01f))); },
    },
    new renodx::utils::settings::Setting{
        .key = "FxFilmGrain",
        .binding = &shader_injection.custom_film_grain,
        .default_value = 0.f,
        .label = "Film Grain",
        .section = "RenoFX",
        .tooltip = "Controls new perceptual film grain. Reduces banding.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "UtilHUD",
    //     .binding = &shader_injection.utility_hud,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "HUD",
    //     .section = "Utility",
    //     .tooltip = "Show or hide the HUD",
    //     .labels = {"Off", "On"},
    //     .parse = [](float value) { return value; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
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
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = " - In-game HDR/Gamma settings are disabled by RenoDX, adjust peak/game/ui brightness in the mod.",
        .section = "Notes",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "RenoDX Discord",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch(("https://discord.gg/QgXDC") + std::string("fccRy"));
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
        .label = "Game mod by Jon (OopyDoopy/Kickfister)",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "RCAS by Lilium",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "HUGE thanks to the whole community of RenoDX modders for their help on this one <3",
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
  renodx::utils::settings::UpdateSetting("SDROutputEncoding", 1.f);
  renodx::utils::settings::UpdateSetting("ToneMapAgxVanillaBend", 0.f);
  renodx::utils::settings::UpdateSetting("VideoPlayback", 0.f);

  renodx::utils::settings::UpdateSetting("SceneGradeHueCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("LutGradeStrength", 100.f);
  renodx::utils::settings::UpdateSetting("LutScaling", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeStrength", 100.f);
  renodx::utils::settings::UpdateSetting("GradingImprovements", 0.f);

  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadowContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);

  renodx::utils::settings::UpdateSetting("SwapChainCustomColorSpace", 0.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 0.f);
  renodx::utils::settings::UpdateSetting("FxPostProcessingMaxCLL", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
  renodx::utils::settings::UpdateSetting("FxLensDirt", 50.f);
  renodx::utils::settings::UpdateSetting("FxSunShaftStrength", 50.f);
  renodx::utils::settings::UpdateSetting("FxVignetteBlackLevel", 0.f);
  renodx::utils::settings::UpdateSetting("FxVignette", 100.f);
  renodx::utils::settings::UpdateSetting("FxDepthBlur", 50.f);
  renodx::utils::settings::UpdateSetting("FxSharpeningType", 0.f);
  renodx::utils::settings::UpdateSetting("FxSharpness", 50.f);
    ResolvePrismInjection();
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    peak_white_nits_setting->default_value = roundf(peak.value());
  } else {
    peak_white_nits_setting->default_value = 1000.f;
  }
  fired_on_init_swapchain = true;
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  constexpr uint32_t hdr_detection_window_frames = 10;
  final_hdr_draw_history[final_hdr_draw_history_index] = final_hdr_drawn_this_frame;
  final_hdr_draw_history_index =
      (final_hdr_draw_history_index + 1) % hdr_detection_window_frames;

  bool final_hdr_seen_in_window = false;
  for (uint32_t frame_index = 0; frame_index < hdr_detection_window_frames; ++frame_index) {
    final_hdr_seen_in_window = final_hdr_seen_in_window
                               || final_hdr_draw_history[frame_index];
  }
    shader_injection.last_is_hdr = final_hdr_seen_in_window;
  final_hdr_drawn_this_frame = false;

  static std::mt19937 random_generator(std::chrono::system_clock::now().time_since_epoch().count());
  static auto random_range = static_cast<float>(std::mt19937::max() - std::mt19937::min());
  CUSTOM_RANDOM = static_cast<float>(random_generator() + std::mt19937::min()) / random_range;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for The Witcher 3: Wild Hunt";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      // while (IsDebuggerPresent() == 0) Sleep(100);

      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::use_root_signature_cbv = true;
      // renodx::mods::shader::allow_multiple_push_constants = true;
      // renodx::mods::shader::force_pipeline_cloning = true;
      //  renodx::mods::shader::on_create_pipeline_layout = [](auto, auto params) {
      //      return static_cast<bool>(params.size() < 20);
      //  };
      // renodx::mods::shader::use_pipeline_layout_cloning = true;
      // renodx::mods::swapchain::use_resource_cloning = true;

      // renodx::utils::shader::use_replace_async = true;
      renodx::mods::swapchain::use_resource_cloning = true;

      // renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //     .old_format = reshade::api::format::r8g8b8a8_unorm,
      //     .new_format = reshade::api::format::r16g16b16a16_float,
      //     .ignore_size = false,
      //     .use_resource_view_cloning = true,
      //     .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::ANY,
      // });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
    if (fdw_reason == DLL_PROCESS_ATTACH) {
        if (developer_mode_enabled == 0.f) {
            auto* settings_mode = renodx::utils::settings::FindSetting("SettingsMode");
            if (settings_mode != nullptr) {
                settings_mode->labels.resize(2);
                if (current_settings_mode >= 2.f) {
                    renodx::utils::settings::UpdateSetting("SettingsMode", 1.f);
                }
            }
        }
        ResolvePrismInjection();
    }
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

    if (fdw_reason == DLL_PROCESS_DETACH) {
        reshade::unregister_addon(h_module);
    }

  return TRUE;
}
