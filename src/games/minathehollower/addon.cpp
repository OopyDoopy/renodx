/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>
#include "../../mods/shader.hpp"
//#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
//#include "../../utils/platform.hpp"
//#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
//#include "../../utils/swapchain.hpp"
#include "./shared.h"


namespace {

ShaderInjectData shader_injection;

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

// Settings mode: 0 = Simple, 1 = Advanced
float ui_mode = 0.f;

renodx::utils::settings::Settings settings = {
    
    new renodx::utils::settings::Setting{
        .key = "UIMode",
        .binding = &ui_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .section = "Settings",
        .tooltip = "Toggle between Simple and Advanced settings",
        .labels = {"Simple", "Advanced"},
    },

    new renodx::utils::settings::Setting{
        .key = "Filter",
        .binding = &shader_injection.filter_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Filter",
        .section = "Graphics",
        .tooltip = "Selects the post-process filter applied to the pixel-art upscale.",
        .labels = {"None", "LCD Grid", "CRT Royale"},
    },

    // ========== LCD Grid V2 Advanced Settings ==========
    new renodx::utils::settings::Setting{
        .key = "LCDGain",
        .binding = &shader_injection.lcd_gain,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.5f,
        .can_reset = true,
        .label = "Gain",
        .section = "Graphics",
        .tooltip = "LCD Grid brightness multiplier.",
        .min = 0.5f,
        .max = 3.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDGamma",
        .binding = &shader_injection.lcd_gamma,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 2.2f,
        .can_reset = true,
        .label = "Gamma",
        .section = "Graphics",
        .tooltip = "LCD Grid gamma correction.",
        .min = 1.0f,
        .max = 3.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDBlacklevel",
        .binding = &shader_injection.lcd_blacklevel,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.0f,
        .can_reset = true,
        .label = "Black Level",
        .section = "Graphics",
        .tooltip = "LCD Grid black level adjustment.",
        .min = -0.2f,
        .max = 0.2f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDAmbient",
        .binding = &shader_injection.lcd_ambient,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.0f,
        .can_reset = true,
        .label = "Ambient",
        .section = "Graphics",
        .tooltip = "LCD Grid ambient light adjustment.",
        .min = 0.0f,
        .max = 0.5f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDBGR",
        .binding = &shader_injection.lcd_bgr,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "BGR Mode",
        .section = "Graphics",
        .tooltip = "Reverse subpixel order for BGR displays.",
        .labels = {"Off", "On"},
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDRedR",
        .binding = &shader_injection.lcd_red_r,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Red Subpixel - R",
        .section = "Graphics",
        .tooltip = "Red channel component of red subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDRedG",
        .binding = &shader_injection.lcd_red_g,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Red Subpixel - G",
        .section = "Graphics",
        .tooltip = "Green channel component of red subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDRedB",
        .binding = &shader_injection.lcd_red_b,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Red Subpixel - B",
        .section = "Graphics",
        .tooltip = "Blue channel component of red subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDGreenR",
        .binding = &shader_injection.lcd_green_r,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Green Subpixel - R",
        .section = "Graphics",
        .tooltip = "Red channel component of green subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDGreenG",
        .binding = &shader_injection.lcd_green_g,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Green Subpixel - G",
        .section = "Graphics",
        .tooltip = "Green channel component of green subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDGreenB",
        .binding = &shader_injection.lcd_green_b,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Green Subpixel - B",
        .section = "Graphics",
        .tooltip = "Blue channel component of green subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDBlueR",
        .binding = &shader_injection.lcd_blue_r,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Blue Subpixel - R",
        .section = "Graphics",
        .tooltip = "Red channel component of blue subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDBlueG",
        .binding = &shader_injection.lcd_blue_g,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.125f,
        .can_reset = true,
        .label = "Blue Subpixel - G",
        .section = "Graphics",
        .tooltip = "Green channel component of blue subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDBlueB",
        .binding = &shader_injection.lcd_blue_b,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Blue Subpixel - B",
        .section = "Graphics",
        .tooltip = "Blue channel component of blue subpixel.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 1.f; },
    },

    // ========== CRT Royale Advanced Settings ==========
    new renodx::utils::settings::Setting{
        .key = "CRTGamma",
        .binding = &shader_injection.crt_gamma,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 2.5f,
        .can_reset = true,
        .label = "CRT Gamma",
        .section = "Graphics",
        .tooltip = "CRT Royale CRT gamma correction.",
        .min = 1.0f,
        .max = 3.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LCDGammaCRT",
        .binding = &shader_injection.lcd_gamma_crt,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 2.2f,
        .can_reset = true,
        .label = "LCD Gamma",
        .section = "Graphics",
        .tooltip = "CRT Royale LCD gamma correction.",
        .min = 1.0f,
        .max = 3.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LevelsContrast",
        .binding = &shader_injection.levels_contrast,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Levels Contrast",
        .section = "Graphics",
        .tooltip = "CRT Royale levels contrast.",
        .min = 0.5f,
        .max = 2.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "LevelsAutodim",
        .binding = &shader_injection.levels_autodim,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.5f,
        .can_reset = true,
        .label = "Levels Autodim",
        .section = "Graphics",
        .tooltip = "CRT Royale levels autodim.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "HalationWeight",
        .binding = &shader_injection.halation_weight,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.0f,
        .can_reset = true,
        .label = "Halation Weight",
        .section = "Graphics",
        .tooltip = "CRT Royale halation effect weight.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "DiffusionWeight",
        .binding = &shader_injection.diffusion_weight,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.075f,
        .can_reset = true,
        .label = "Diffusion Weight",
        .section = "Graphics",
        .tooltip = "CRT Royale diffusion effect weight.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BloomUnderestimateLevels",
        .binding = &shader_injection.bloom_underestimate_levels,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.8f,
        .can_reset = true,
        .label = "Bloom Underestimate",
        .section = "Graphics",
        .tooltip = "CRT Royale bloom underestimate levels.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BloomExcess",
        .binding = &shader_injection.bloom_excess,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.0f,
        .can_reset = true,
        .label = "Bloom Excess",
        .section = "Graphics",
        .tooltip = "CRT Royale bloom excess.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamMinSigma",
        .binding = &shader_injection.beam_min_sigma,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.02f,
        .can_reset = true,
        .label = "Beam Min Sigma",
        .section = "Graphics",
        .tooltip = "CRT Royale beam minimum sigma.",
        .min = 0.01f,
        .max = 0.5f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamMaxSigma",
        .binding = &shader_injection.beam_max_sigma,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.3f,
        .can_reset = true,
        .label = "Beam Max Sigma",
        .section = "Graphics",
        .tooltip = "CRT Royale beam maximum sigma.",
        .min = 0.1f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamMinShape",
        .binding = &shader_injection.beam_min_shape,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 2.0f,
        .can_reset = true,
        .label = "Beam Min Shape",
        .section = "Graphics",
        .tooltip = "CRT Royale beam minimum shape.",
        .min = 1.0f,
        .max = 5.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamMaxShape",
        .binding = &shader_injection.beam_max_shape,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 4.0f,
        .can_reset = true,
        .label = "Beam Max Shape",
        .section = "Graphics",
        .tooltip = "CRT Royale beam maximum shape.",
        .min = 1.0f,
        .max = 8.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamSpotPower",
        .binding = &shader_injection.beam_spot_power,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.333f,
        .can_reset = true,
        .label = "Beam Spot Power",
        .section = "Graphics",
        .tooltip = "CRT Royale beam spot power.",
        .min = 0.1f,
        .max = 1.0f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamShapePower",
        .binding = &shader_injection.beam_shape_power,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.25f,
        .can_reset = true,
        .label = "Beam Shape Power",
        .section = "Graphics",
        .tooltip = "CRT Royale beam shape power.",
        .min = 0.1f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BeamHorizSigma",
        .binding = &shader_injection.beam_horiz_sigma,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.35f,
        .can_reset = true,
        .label = "Beam Horizontal Sigma",
        .section = "Graphics",
        .tooltip = "CRT Royale beam horizontal sigma.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ScanlineStrength",
        .binding = &shader_injection.scanline_strength,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Scanline Strength",
        .section = "Graphics",
        .tooltip = "CRT Royale scanline strength.",
        .min = 0.0f,
        .max = 2.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceRX",
        .binding = &shader_injection.convergence_r_x,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.1f,
        .can_reset = true,
        .label = "Convergence Red X",
        .section = "Graphics",
        .tooltip = "CRT Royale red convergence X offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceRY",
        .binding = &shader_injection.convergence_r_y,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.2f,
        .can_reset = true,
        .label = "Convergence Red Y",
        .section = "Graphics",
        .tooltip = "CRT Royale red convergence Y offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceGX",
        .binding = &shader_injection.convergence_g_x,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.3f,
        .can_reset = true,
        .label = "Convergence Green X",
        .section = "Graphics",
        .tooltip = "CRT Royale green convergence X offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceGY",
        .binding = &shader_injection.convergence_g_y,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.4f,
        .can_reset = true,
        .label = "Convergence Green Y",
        .section = "Graphics",
        .tooltip = "CRT Royale green convergence Y offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceBX",
        .binding = &shader_injection.convergence_b_x,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.5f,
        .can_reset = true,
        .label = "Convergence Blue X",
        .section = "Graphics",
        .tooltip = "CRT Royale blue convergence X offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ConvergenceBY",
        .binding = &shader_injection.convergence_b_y,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.6f,
        .can_reset = true,
        .label = "Convergence Blue Y",
        .section = "Graphics",
        .tooltip = "CRT Royale blue convergence Y offset.",
        .min = -1.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "MaskType",
        .binding = &shader_injection.mask_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = true,
        .label = "Mask Type",
        .section = "Graphics",
        .tooltip = "CRT Royale mask type.",
        .labels = {"Grille", "Slot Mask", "Shadow Mask"},
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "MaskTriadSize",
        .binding = &shader_injection.mask_triad_size,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 3.0f,
        .can_reset = true,
        .label = "Mask Triad Size",
        .section = "Graphics",
        .tooltip = "CRT Royale mask triad size.",
        .min = 1.0f,
        .max = 10.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "MaskStrength",
        .binding = &shader_injection.mask_strength,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 1.0f,
        .can_reset = true,
        .label = "Mask Strength",
        .section = "Graphics",
        .tooltip = "CRT Royale mask strength.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "MaskBrightness",
        .binding = &shader_injection.mask_brightness,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.18f,
        .can_reset = true,
        .label = "Mask Brightness",
        .section = "Graphics",
        .tooltip = "CRT Royale mask brightness.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BorderSize",
        .binding = &shader_injection.border_size,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.015f,
        .can_reset = true,
        .label = "Border Size",
        .section = "Graphics",
        .tooltip = "CRT Royale border size.",
        .min = 0.0f,
        .max = 0.2f,
        .format = "%.3f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BorderDarkness",
        .binding = &shader_injection.border_darkness,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 2.0f,
        .can_reset = true,
        .label = "Border Darkness",
        .section = "Graphics",
        .tooltip = "CRT Royale border darkness.",
        .min = 0.5f,
        .max = 5.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "Curvature",
        .binding = &shader_injection.curvature,
        .value_type = renodx::utils::settings::SettingValueType::FLOAT,
        .default_value = 0.0f,
        .can_reset = true,
        .label = "Screen Curvature",
        .section = "Graphics",
        .tooltip = "CRT Royale screen curvature effect.",
        .min = 0.0f,
        .max = 1.0f,
        .format = "%.2f",
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "GeomMode",
        .binding = &shader_injection.geom_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = true,
        .label = "Geometry Mode",
        .section = "Graphics",
        .tooltip = "CRT Royale geometry mode.",
        .labels = {"Flat", "Curved"},
        .is_visible = []() { return ui_mode >= 1.f && shader_injection.filter_mode == 2.f; },
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
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX | Mina The Hollower";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Mina The Hollower";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      //renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;

      renodx::utils::settings::use_presets = false;

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
