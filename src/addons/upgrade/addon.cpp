/*
 * Copyright (C) 2026 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#include <algorithm>
#include <array>
#include <atomic>
#include <charconv>
#include <cstdint>
#include <format>
#include <mutex>
#include <optional>
#include <shared_mutex>
#include <sstream>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>

#include <d3d11.h>
#include <d3d12.h>
#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/swapchain.hpp"  // IWYU pragma: keep
#include "../../utils/command_action.hpp"
#include "../../utils/data.hpp"
#include "../../utils/descriptor.hpp"
#include "../../utils/device_proxy.hpp"
#include "../../utils/pipeline_layout.hpp"
#include "../../utils/resource.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/state.hpp"
#include "../../utils/swapchain.hpp"

namespace {

using Setting = renodx::utils::settings::Setting;
using SettingValueType = renodx::utils::settings::SettingValueType;

constexpr float UPGRADE_TYPE_OUTPUT_SIZE = 1.f;
constexpr float UPGRADE_TYPE_OUTPUT_RATIO = 2.f;
constexpr float UPGRADE_TYPE_ANY_SIZE = 3.f;
constexpr uint32_t MAX_SIMULTANEOUS_RENDER_TARGETS = 8u;

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
bool effect_insertion_enabled = false;
float fps_limiter_enabled = 0.f;
float fps_limit_value = 60.f;
reshade::api::swapchain* tracked_swapchain = nullptr;
bool initialized = false;

constexpr const char* CONFIG_SECTION = "renodx-upgrade";

enum class EffectInsertionMode : uint32_t {
    automatic = 0u,
    manual = 1u,
};

enum class AutomaticEffectInsertionSourceSize : uint32_t {
    swapchain = 0u,
    aspect_ratio_16_9 = 1u,
};

struct EffectInsertionRule {
    bool enabled = false;
    bool match_format = true;
    bool match_dimensions = true;
    uint32_t shader_hash = 0u;
    uint32_t rtv_index = 0u;
    uint32_t occurrence = 1u;
    reshade::api::format format = reshade::api::format::unknown;
    uint32_t width = 0u;
    uint32_t height = 0u;

    bool operator==(const EffectInsertionRule&) const = default;
};

struct EffectInsertionTechnique {
    std::string effect_name;
    std::string technique_name;

    bool operator==(const EffectInsertionTechnique&) const = default;
};

struct EffectInsertionDrawKey {
    uint32_t shader_hash = 0u;
    uint32_t rtv_index = 0u;
    reshade::api::format format = reshade::api::format::unknown;
    uint32_t width = 0u;
    uint32_t height = 0u;

    bool operator==(const EffectInsertionDrawKey&) const = default;
};

struct EffectInsertionDrawKeyHash {
    [[nodiscard]] size_t operator()(const EffectInsertionDrawKey& key) const {
        size_t value = key.shader_hash;
        const auto combine = [&value](uint32_t part) {
            value ^= static_cast<size_t>(part) + 0x9e3779b9u + (value << 6u) + (value >> 2u);
        };
        combine(key.rtv_index);
        combine(static_cast<uint32_t>(key.format));
        combine(key.width);
        combine(key.height);
        return value;
    }
};

struct EffectInsertionDraw {
    uint32_t draw_index = 0u;
    uint32_t shader_hash = 0u;
    struct Target {
        EffectInsertionDrawKey key = {};
        reshade::api::resource_type resource_type = reshade::api::resource_type::unknown;
        reshade::api::format view_format = reshade::api::format::unknown;
        reshade::api::resource_view view = {0u};
        uint32_t occurrence = 0u;
    };
    std::vector<Target> targets;
};

struct EffectInsertionPreviewSRV {
    reshade::api::resource resource = {0u};
    reshade::api::resource_view view = {0u};
};

struct __declspec(uuid("ae845c75-7314-47b4-832c-b8ab6059772b")) EffectInsertionDeviceData {
    std::mutex mutex;
    std::recursive_mutex effect_runtime_mutex;
    bool effect_runtime_present_lock_held = false;
    std::vector<uint32_t> occurrences;
    uint64_t rule_revision = 0u;
    uint32_t automatic_shader_hash = 0u;
    uint32_t automatic_vertex_shader_hash = 0u;
    reshade::api::pipeline_layout automatic_pipeline_layout = {0u};
    uint32_t automatic_shader_missed_frames = 0u;
    bool rendered = false;
    bool final_effects_pending = false;
    uint32_t automatic_match_count = 0u;
    uint32_t rendered_technique_count = 0u;
    uint32_t automatic_sample_frame_count = 0u;
    EffectInsertionRule render_rule = {};
    std::vector<reshade::api::resource_view> swapchain_rtvs;
    bool capture_requested = false;
    bool capturing = false;
    bool working_capture_truncated = false;
    bool captured_frame_truncated = false;
    uint32_t capture_draw_index = 0u;
    std::vector<EffectInsertionDraw> working_draws;
    std::vector<EffectInsertionDraw> captured_draws;
    std::unordered_map<EffectInsertionDrawKey, uint32_t, EffectInsertionDrawKeyHash> capture_occurrences;
    std::unordered_map<uint64_t, EffectInsertionPreviewSRV> preview_srvs;
};

struct __declspec(uuid("627784c3-9367-48da-ad83-cbefa3fc14fa")) EffectInsertionCommandListData {
    std::mutex mutex;
    uint64_t automatic_candidate_revision = 0u;
    uint32_t automatic_candidate_shader_hash = 0u;
    uint32_t automatic_candidate_vertex_shader_hash = 0u;
    reshade::api::pipeline_layout automatic_candidate_pipeline_layout = {0u};
};

EffectInsertionMode active_effect_insertion_mode = EffectInsertionMode::automatic;
EffectInsertionMode saved_effect_insertion_mode = EffectInsertionMode::automatic;
AutomaticEffectInsertionSourceSize active_automatic_effect_insertion_source_size =
    AutomaticEffectInsertionSourceSize::swapchain;
AutomaticEffectInsertionSourceSize saved_automatic_effect_insertion_source_size =
    AutomaticEffectInsertionSourceSize::swapchain;
std::vector<EffectInsertionRule> active_effect_insertion_rules = {};
std::vector<EffectInsertionRule> saved_effect_insertion_rules = {};
std::vector<EffectInsertionRule> draft_effect_insertion_rules = {};
EffectInsertionRule draft_effect_insertion_rule = {};
std::vector<EffectInsertionTechnique> active_effect_insertion_techniques = {};
std::vector<EffectInsertionTechnique> selected_effect_insertion_techniques = {};
std::array<char, 11u> effect_insertion_shader_hash_text = {};
bool effect_insertion_config_dirty = false;
bool manual_effect_insertion_rules_dirty = false;
thread_local bool is_rendering_inserted_effects = false;
std::atomic<reshade::api::device*> effect_insertion_capture_device = nullptr;
std::mutex active_effect_insertion_rule_mutex;
std::atomic_uint64_t active_effect_insertion_rule_revision = 1u;
uint32_t selected_effect_insertion_shader_hash = 0u;
size_t selected_effect_insertion_rule_index = SIZE_MAX;

constexpr size_t MAX_CAPTURED_EFFECT_INSERTION_DRAWS = 16384u;

[[nodiscard]] const char* GetResourceTypeName(const reshade::api::resource_type type) {
    switch (type) {
        case reshade::api::resource_type::buffer:
            return "Buffer";
        case reshade::api::resource_type::texture_1d:
            return "Texture 1D";
        case reshade::api::resource_type::texture_2d:
            return "Texture 2D";
        case reshade::api::resource_type::texture_3d:
            return "Texture 3D";
        case reshade::api::resource_type::surface:
            return "Surface";
        case reshade::api::resource_type::unknown:
        default:
            return "Unknown";
    }
}

[[nodiscard]] const char* GetFormatName(const reshade::api::format format) {
    switch (format) {
        case reshade::api::format::r8_typeless: return "R8_TYPELESS";
        case reshade::api::format::r8_unorm: return "R8_UNORM";
        case reshade::api::format::r8_uint: return "R8_UINT";
        case reshade::api::format::r8_snorm: return "R8_SNORM";
        case reshade::api::format::r8_sint: return "R8_SINT";
        case reshade::api::format::r8g8_typeless: return "R8G8_TYPELESS";
        case reshade::api::format::r8g8_unorm: return "R8G8_UNORM";
        case reshade::api::format::r8g8_uint: return "R8G8_UINT";
        case reshade::api::format::r8g8_snorm: return "R8G8_SNORM";
        case reshade::api::format::r8g8_sint: return "R8G8_SINT";
        case reshade::api::format::r8g8b8a8_typeless: return "R8G8B8A8_TYPELESS";
        case reshade::api::format::r8g8b8a8_unorm: return "R8G8B8A8_UNORM";
        case reshade::api::format::r8g8b8a8_unorm_srgb: return "R8G8B8A8_UNORM_SRGB";
        case reshade::api::format::r8g8b8a8_uint: return "R8G8B8A8_UINT";
        case reshade::api::format::r8g8b8a8_snorm: return "R8G8B8A8_SNORM";
        case reshade::api::format::r8g8b8a8_sint: return "R8G8B8A8_SINT";
        case reshade::api::format::b8g8r8a8_typeless: return "B8G8R8A8_TYPELESS";
        case reshade::api::format::b8g8r8a8_unorm: return "B8G8R8A8_UNORM";
        case reshade::api::format::b8g8r8a8_unorm_srgb: return "B8G8R8A8_UNORM_SRGB";
        case reshade::api::format::r10g10b10a2_typeless: return "R10G10B10A2_TYPELESS";
        case reshade::api::format::r10g10b10a2_unorm: return "R10G10B10A2_UNORM";
        case reshade::api::format::b10g10r10a2_typeless: return "B10G10R10A2_TYPELESS";
        case reshade::api::format::b10g10r10a2_unorm: return "B10G10R10A2_UNORM";
        case reshade::api::format::r11g11b10_float: return "R11G11B10_FLOAT";
        case reshade::api::format::r16_typeless: return "R16_TYPELESS";
        case reshade::api::format::r16_float: return "R16_FLOAT";
        case reshade::api::format::r16_unorm: return "R16_UNORM";
        case reshade::api::format::r16_uint: return "R16_UINT";
        case reshade::api::format::r16_snorm: return "R16_SNORM";
        case reshade::api::format::r16_sint: return "R16_SINT";
        case reshade::api::format::r16g16_typeless: return "R16G16_TYPELESS";
        case reshade::api::format::r16g16_float: return "R16G16_FLOAT";
        case reshade::api::format::r16g16_unorm: return "R16G16_UNORM";
        case reshade::api::format::r16g16_uint: return "R16G16_UINT";
        case reshade::api::format::r16g16_snorm: return "R16G16_SNORM";
        case reshade::api::format::r16g16_sint: return "R16G16_SINT";
        case reshade::api::format::r16g16b16a16_typeless: return "R16G16B16A16_TYPELESS";
        case reshade::api::format::r16g16b16a16_float: return "R16G16B16A16_FLOAT";
        case reshade::api::format::r16g16b16a16_unorm: return "R16G16B16A16_UNORM";
        case reshade::api::format::r16g16b16a16_uint: return "R16G16B16A16_UINT";
        case reshade::api::format::r16g16b16a16_snorm: return "R16G16B16A16_SNORM";
        case reshade::api::format::r16g16b16a16_sint: return "R16G16B16A16_SINT";
        case reshade::api::format::r32_typeless: return "R32_TYPELESS";
        case reshade::api::format::r32_float: return "R32_FLOAT";
        case reshade::api::format::r32_uint: return "R32_UINT";
        case reshade::api::format::r32_sint: return "R32_SINT";
        case reshade::api::format::r32g32_typeless: return "R32G32_TYPELESS";
        case reshade::api::format::r32g32_float: return "R32G32_FLOAT";
        case reshade::api::format::r32g32_uint: return "R32G32_UINT";
        case reshade::api::format::r32g32_sint: return "R32G32_SINT";
        case reshade::api::format::r32g32b32a32_typeless: return "R32G32B32A32_TYPELESS";
        case reshade::api::format::r32g32b32a32_float: return "R32G32B32A32_FLOAT";
        case reshade::api::format::r32g32b32a32_uint: return "R32G32B32A32_UINT";
        case reshade::api::format::r32g32b32a32_sint: return "R32G32B32A32_SINT";
        case reshade::api::format::unknown: return "UNKNOWN";
        default: return "Other";
    }
}

[[nodiscard]] bool IsExtendedRangeFormat(const reshade::api::format format) {
    switch (format) {
        case reshade::api::format::r16_float:
        case reshade::api::format::r16g16_float:
        case reshade::api::format::r16g16b16_float:
        case reshade::api::format::r16g16b16a16_float:
        case reshade::api::format::r32_float:
        case reshade::api::format::r32g32_float:
        case reshade::api::format::r32g32b32_float:
        case reshade::api::format::r32g32b32a32_float:
        case reshade::api::format::r11g11b10_float:
            return true;
        default:
            return false;
    }
}

[[nodiscard]] bool TryParseShaderHash(std::string_view text, uint32_t& value) {
    if (text.size() != 10u
            || text[0] != '0'
            || (text[1] != 'x' && text[1] != 'X')) {
        return false;
    }

    value = 0u;
    const auto result = std::from_chars(text.data() + 2u, text.data() + text.size(), value, 16);
    return result.ec == std::errc() && result.ptr == text.data() + text.size();
}

void SetShaderHashText(uint32_t shader_hash) {
    const auto value = std::format("0x{:08X}", shader_hash);
    std::ranges::copy(value, effect_insertion_shader_hash_text.begin());
    effect_insertion_shader_hash_text[value.size()] = '\0';
}

[[nodiscard]] std::string ReadConfigString(const char* key) {
    size_t value_size = 0u;
    if (!reshade::get_config_value(
                    nullptr,
                    CONFIG_SECTION,
                    key,
                    nullptr,
                    &value_size)
            || value_size <= 1u) {
        return {};
    }

    std::string value(value_size, '\0');
    if (!reshade::get_config_value(
                nullptr,
                CONFIG_SECTION,
                key,
                value.data(),
                &value_size)
            || value_size == 0u) {
        return {};
    }
    value.resize(value_size - 1u);
    return value;
}

[[nodiscard]] bool ReadLengthPrefixedString(
        std::string_view serialized,
        size_t& offset,
        std::string& value) {
    const size_t separator = serialized.find(':', offset);
    if (separator == std::string_view::npos || separator == offset) return false;

    size_t length = 0u;
    const auto result = std::from_chars(
            serialized.data() + offset,
            serialized.data() + separator,
            length);
    if (result.ec != std::errc()
            || result.ptr != serialized.data() + separator
            || length > serialized.size() - separator - 1u) {
        return false;
    }

    offset = separator + 1u;
    value.assign(serialized.substr(offset, length));
    offset += length;
    return true;
}

[[nodiscard]] std::vector<EffectInsertionTechnique> LoadEffectInsertionTechniques() {
    const auto serialized = ReadConfigString("EffectInsertTechniques");
    std::vector<EffectInsertionTechnique> techniques;
    size_t offset = 0u;
    while (offset < serialized.size()) {
        EffectInsertionTechnique technique;
        if (!ReadLengthPrefixedString(serialized, offset, technique.effect_name)
                || !ReadLengthPrefixedString(serialized, offset, technique.technique_name)
                || technique.effect_name.empty()
                || technique.technique_name.empty()) {
            reshade::log::message(
                    reshade::log::level::warning,
                    "RenoDX Upgrade: EffectInsertTechniques is malformed; no insertion techniques were loaded.");
            return {};
        }
        if (std::ranges::find(techniques, technique) == techniques.end()) {
            techniques.push_back(std::move(technique));
        }
    }
    return techniques;
}

void SaveEffectInsertionTechniques(const std::vector<EffectInsertionTechnique>& techniques) {
    std::string serialized;
    for (const auto& technique : techniques) {
        serialized += std::to_string(technique.effect_name.size());
        serialized += ':';
        serialized += technique.effect_name;
        serialized += std::to_string(technique.technique_name.size());
        serialized += ':';
        serialized += technique.technique_name;
    }
    reshade::set_config_value(
            nullptr,
            CONFIG_SECTION,
            "EffectInsertTechniques",
            serialized.c_str());
}

EffectInsertionRule LoadEffectInsertionRule() {
    EffectInsertionRule rule = {};
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertEnabled", rule.enabled);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertMatchFormat", rule.match_format);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertMatchDimensions", rule.match_dimensions);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertRTVSlot", rule.rtv_index);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertOccurrence", rule.occurrence);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertWidth", rule.width);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertHeight", rule.height);

    uint32_t format = static_cast<uint32_t>(reshade::api::format::unknown);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertFormat", format);
    rule.format = static_cast<reshade::api::format>(format);
    rule.occurrence = std::max(rule.occurrence, 1u);

    const auto shader_hash = ReadConfigString("EffectInsertShaderHash");
    if (!shader_hash.empty() && !TryParseShaderHash(shader_hash, rule.shader_hash)) {
        reshade::log::message(
                reshade::log::level::warning,
                "RenoDX Upgrade: EffectInsertShaderHash must use exact 0xXXXXXXXX notation; insertion is disabled for this run.");
        rule.enabled = false;
    }

    return rule;
}

[[nodiscard]] bool ReadEffectInsertionRuleField(
        std::string_view serialized,
        size_t& offset,
        uint32_t& value) {
    const size_t separator = serialized.find_first_of(",;", offset);
    const size_t end = separator == std::string_view::npos ? serialized.size() : separator;
    if (end == offset) return false;

    const auto result = std::from_chars(
            serialized.data() + offset,
            serialized.data() + end,
            value);
    if (result.ec != std::errc() || result.ptr != serialized.data() + end) return false;
    offset = separator == std::string_view::npos ? end : end + 1u;
    return true;
}

[[nodiscard]] std::vector<EffectInsertionRule> LoadEffectInsertionRules(
        const EffectInsertionRule& legacy_rule) {
    const auto serialized = ReadConfigString("EffectInsertRules");
    if (serialized.empty()) {
        return legacy_rule.enabled ? std::vector<EffectInsertionRule>{legacy_rule}
                                   : std::vector<EffectInsertionRule>{};
    }

    std::vector<EffectInsertionRule> rules;
    size_t offset = 0u;
    while (offset < serialized.size()) {
        std::array<uint32_t, 9u> fields = {};
        for (auto& field : fields) {
            if (!ReadEffectInsertionRuleField(serialized, offset, field)) {
                reshade::log::message(
                        reshade::log::level::warning,
                        "RenoDX Upgrade: EffectInsertRules is malformed; manual insertion points were ignored.");
                return {};
            }
        }
        if (offset < serialized.size() && serialized[offset - 1u] != ';') {
            reshade::log::message(
                    reshade::log::level::warning,
                    "RenoDX Upgrade: EffectInsertRules is malformed; manual insertion points were ignored.");
            return {};
        }

        EffectInsertionRule rule = {
                .enabled = fields[0] != 0u,
                .match_format = fields[1] != 0u,
                .match_dimensions = fields[2] != 0u,
                .shader_hash = fields[3],
                .rtv_index = fields[4],
                .occurrence = std::max(fields[5], 1u),
                .format = static_cast<reshade::api::format>(fields[6]),
                .width = fields[7],
                .height = fields[8],
        };
        if (rule.enabled && rule.shader_hash != 0u
                && rule.rtv_index < MAX_SIMULTANEOUS_RENDER_TARGETS) {
            rules.push_back(rule);
        }
    }
    return rules;
}

void SaveEffectInsertionRule(const EffectInsertionRule& rule) {
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertEnabled", rule.enabled);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertMatchFormat", rule.match_format);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertMatchDimensions", rule.match_dimensions);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertRTVSlot", rule.rtv_index);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertOccurrence", rule.occurrence);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertFormat", static_cast<uint32_t>(rule.format));
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertWidth", rule.width);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertHeight", rule.height);
    const auto shader_hash = std::format("0x{:08X}", rule.shader_hash);
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertShaderHash", shader_hash.c_str());
}

void SaveEffectInsertionRules(const std::vector<EffectInsertionRule>& rules) {
    std::string serialized;
    for (const auto& rule : rules) {
        serialized += std::format(
                "{},{},{},{},{},{},{},{},{};",
                rule.enabled ? 1u : 0u,
                rule.match_format ? 1u : 0u,
                rule.match_dimensions ? 1u : 0u,
                rule.shader_hash,
                rule.rtv_index,
                rule.occurrence,
                static_cast<uint32_t>(rule.format),
                rule.width,
                rule.height);
    }
    reshade::set_config_value(nullptr, CONFIG_SECTION, "EffectInsertRules", serialized.c_str());
}

[[nodiscard]] bool IsEffectInsertionSupportedCommandList(reshade::api::command_list* cmd_list) {
    if (cmd_list == nullptr) return false;

    const auto* device = cmd_list->get_device();
    if (device == nullptr) return false;

    switch (device->get_api()) {
        case reshade::api::device_api::d3d11: {
            auto* native_context = reinterpret_cast<ID3D11DeviceContext*>(
                    static_cast<uintptr_t>(cmd_list->get_native()));  // NOLINT(performance-no-int-to-ptr)
            return native_context != nullptr
                   && native_context->GetType() == D3D11_DEVICE_CONTEXT_IMMEDIATE;
        }
        case reshade::api::device_api::d3d12: {
            auto* native_command_list = reinterpret_cast<ID3D12GraphicsCommandList*>(
                    static_cast<uintptr_t>(cmd_list->get_native()));  // NOLINT(performance-no-int-to-ptr)
            return native_command_list != nullptr
                   && native_command_list->GetType() == D3D12_COMMAND_LIST_TYPE_DIRECT;
        }
        default:
            return false;
    }
}

[[nodiscard]] bool IsEffectInsertionOutsideRenderPass(reshade::api::command_list* cmd_list) {
    if (cmd_list == nullptr) return false;

    const auto* device = cmd_list->get_device();
    if (device == nullptr) return false;
    if (device->get_api() != reshade::api::device_api::d3d12) {
        return true;
    }

    const auto* command_list_data = renodx::utils::swapchain::GetCurrentState(cmd_list);
    return command_list_data != nullptr && command_list_data->pass_count == 0u;
}

[[nodiscard]] bool MatchesAutomaticEffectInsertionSourceSize(
        const reshade::api::resource_desc& desc,
        uint32_t swapchain_width,
        uint32_t swapchain_height,
        AutomaticEffectInsertionSourceSize source_size) {
    if (desc.type != reshade::api::resource_type::texture_2d) return false;

    switch (source_size) {
        case AutomaticEffectInsertionSourceSize::swapchain:
            return desc.texture.width == swapchain_width && desc.texture.height == swapchain_height;
        case AutomaticEffectInsertionSourceSize::aspect_ratio_16_9:
            return static_cast<uint64_t>(desc.texture.width) * 9u
                   == static_cast<uint64_t>(desc.texture.height) * 16u;
        default:
            return false;
    }
}

[[nodiscard]] bool IsAutomaticEffectInsertionSourceResourceView(
        reshade::api::device* device,
        reshade::api::resource_view view,
        uint32_t swapchain_width,
        uint32_t swapchain_height,
        AutomaticEffectInsertionSourceSize source_size) {
    if (view.handle == 0u) return false;
    if (device->get_api() == reshade::api::device_api::d3d12) {
        reshade::api::resource resource = {0u};
        if (!renodx::utils::resource::GetLiveResourceViewInfo(
                    view,
                    [&resource](const renodx::utils::resource::ResourceViewInfo& info) {
                        resource = info.original_resource;
                    })
                || resource.handle == 0u) {
            return false;
        }

        bool matches = false;
        renodx::utils::resource::GetLiveResourceInfo(
                resource,
            [&matches, swapchain_width, swapchain_height, source_size](
                const renodx::utils::resource::ResourceInfo& info) {
                matches = MatchesAutomaticEffectInsertionSourceSize(
                    info.desc,
                    swapchain_width,
                    swapchain_height,
                    source_size);
                });
        return matches;
    }

    const auto resource = renodx::utils::resource::GetResourceFromView(device, view);
    if (resource.handle == 0u) return false;
    const auto desc = renodx::utils::resource::GetResourceDesc(device, resource);
        return MatchesAutomaticEffectInsertionSourceSize(
            desc,
            swapchain_width,
            swapchain_height,
            source_size);
}

[[nodiscard]] bool HasSwapchainSizedPixelShaderResourceD3D11(
        reshade::api::command_list* cmd_list,
        uint32_t width,
    uint32_t height,
    AutomaticEffectInsertionSourceSize source_size) {
    auto* native_context = reinterpret_cast<ID3D11DeviceContext*>(
            static_cast<uintptr_t>(cmd_list->get_native()));  // NOLINT(performance-no-int-to-ptr)
    if (native_context == nullptr) return false;

    std::array<ID3D11ShaderResourceView*, D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT> views = {};
    native_context->PSGetShaderResources(0u, static_cast<uint32_t>(views.size()), views.data());
    const auto* device = cmd_list->get_device();
    bool found = false;
    for (auto* native_view : views) {
        if (native_view == nullptr) continue;
        found |= IsAutomaticEffectInsertionSourceResourceView(
            const_cast<reshade::api::device*>(device),
                {reinterpret_cast<uintptr_t>(native_view)},
            width, height, source_size);
        if (found) break;
    }
    for (auto* native_view : views) {
        if (native_view != nullptr) native_view->Release();
    }
    return found;
}

[[nodiscard]] bool HasSwapchainSizedPixelShaderResourceD3D12(
        reshade::api::command_list* cmd_list,
        uint32_t width,
    uint32_t height,
    AutomaticEffectInsertionSourceSize source_size) {
    auto* command_state = renodx::utils::state::GetCurrentState(cmd_list);
    if (command_state == nullptr) return false;

    reshade::api::pipeline pipeline = {0u};
    for (const auto& [stages, candidate] : command_state->pipelines) {
        if ((static_cast<uint32_t>(stages)
                & static_cast<uint32_t>(reshade::api::pipeline_stage::pixel_shader)) != 0u) {
            pipeline = candidate;
            break;
        }
    }
    if (pipeline.handle == 0u) return false;

    auto* device = cmd_list->get_device();
    auto* descriptor_data = renodx::utils::data::Get<renodx::utils::descriptor::DeviceData>(device);
    if (descriptor_data == nullptr) return false;

    bool found = false;
    renodx::utils::shader::GetPipelineShaderDetails(
            pipeline,
            [&](const renodx::utils::shader::PipelineShaderDetails& shader_details) {
                if (shader_details.layout != command_state->graphics_pipeline_layout) return;
                renodx::utils::pipeline_layout::GetPipelineLayoutData(
                        shader_details.layout,
                        [&](const renodx::utils::pipeline_layout::PipelineLayoutData* layout_data) {
                            for (uint32_t parameter_index = 0u;
                                    parameter_index < layout_data->params.size() && !found;
                                    ++parameter_index) {
                                if (parameter_index >= command_state->graphics_descriptor_tables.size()) continue;
                                const auto descriptor_table = command_state->graphics_descriptor_tables[parameter_index];
                                if (descriptor_table.handle == 0u) continue;

                                const auto& parameter = layout_data->params[parameter_index];
                                const reshade::api::descriptor_range* ranges = nullptr;
                                uint32_t range_count = 0u;
                                switch (parameter.type) {
                                    case reshade::api::pipeline_layout_param_type::descriptor_table:
                                        ranges = parameter.descriptor_table.ranges;
                                        range_count = parameter.descriptor_table.count;
                                        break;
                                    case reshade::api::pipeline_layout_param_type::descriptor_table_with_static_samplers:
                                        ranges = parameter.descriptor_table_with_static_samplers.ranges;
                                        range_count = parameter.descriptor_table_with_static_samplers.count;
                                        break;
                                    default:
                                        continue;
                                }

                                for (uint32_t range_index = 0u; range_index < range_count && !found; ++range_index) {
                                    const auto& range = ranges[range_index];
                                    if (range.count == 0u || range.count == UINT32_MAX
                                            || (static_cast<uint32_t>(range.visibility)
                                                & static_cast<uint32_t>(reshade::api::shader_stage::pixel)) == 0u) {
                                        continue;
                                    }
                                    switch (range.type) {
                                        case reshade::api::descriptor_type::shader_resource_view:
                                        case reshade::api::descriptor_type::sampler_with_resource_view:
                                        case reshade::api::descriptor_type::buffer_shader_resource_view:
                                            break;
                                        default:
                                            continue;
                                    }

                                    reshade::api::descriptor_heap heap = {0u};
                                    uint32_t base_offset = 0u;
                                    device->get_descriptor_heap_offset(
                                            descriptor_table, range.binding, 0u, &heap, &base_offset);

                                    std::vector<reshade::api::resource_view> resource_views;
                                    {
                                        const std::shared_lock lock(descriptor_data->mutex);
                                        const auto heap_pair = descriptor_data->heaps.find(heap.handle);
                                        if (heap_pair == descriptor_data->heaps.end()) continue;
                                        const auto& heap_data = heap_pair->second;
                                        if (base_offset >= heap_data.size()) continue;

                                        constexpr uint32_t max_auto_descriptor_range_size = 256u;
                                        const uint32_t descriptor_count = std::min({
                                            range.count,
                                            static_cast<uint32_t>(heap_data.size() - base_offset),
                                            max_auto_descriptor_range_size,
                                        });
                                        resource_views.reserve(descriptor_count);
                                        for (uint32_t index = 0u; index < descriptor_count; ++index) {
                                            const auto& descriptor = heap_data[base_offset + index];
                                            if (descriptor.HasResourceView()) {
                                                resource_views.push_back(descriptor.resource_view);
                                            }
                                        }
                                    }

                                    for (const auto resource_view : resource_views) {
                                        if (IsAutomaticEffectInsertionSourceResourceView(
                                                    device, resource_view, width, height, source_size)) {
                                            found = true;
                                            break;
                                        }
                                    }
                                }
                            }
                        });
            });
    return found;
}

[[nodiscard]] bool FindAutomaticEffectInsertionRule(
        reshade::api::command_list* cmd_list,
    EffectInsertionRule& rule,
    AutomaticEffectInsertionSourceSize source_size) {
    auto* device = cmd_list->get_device();
    const auto* command_list_data = renodx::utils::swapchain::GetCurrentState(cmd_list);
    if (command_list_data == nullptr) return false;

    for (uint32_t rtv_index = 0u; rtv_index < command_list_data->current_render_targets.size(); ++rtv_index) {
        const auto render_target = command_list_data->current_render_targets[rtv_index];
        const auto resource = renodx::utils::resource::GetResourceFromView(device, render_target);
        if (resource.handle == 0u) continue;

        bool is_swapchain = false;
        renodx::utils::resource::GetResourceInfo(
                resource,
                [&is_swapchain](const renodx::utils::resource::ResourceInfo& info) {
                    is_swapchain = info.is_swap_chain;
                });
        if (!is_swapchain) continue;

        const auto desc = renodx::utils::resource::GetResourceDesc(device, resource);
        const bool has_source = device->get_api() == reshade::api::device_api::d3d11
            ? HasSwapchainSizedPixelShaderResourceD3D11(
                cmd_list, desc.texture.width, desc.texture.height, source_size)
            : HasSwapchainSizedPixelShaderResourceD3D12(
                cmd_list, desc.texture.width, desc.texture.height, source_size);
        if (!has_source) continue;

        rule = {
                .enabled = true,
                .match_format = false,
                .match_dimensions = false,
                .rtv_index = rtv_index,
        };
        return true;
    }
    return false;
}

[[nodiscard]] bool ResolveEffectRenderTarget(
        reshade::api::command_list* cmd_list,
    const EffectInsertionRule& rule,
        reshade::api::resource_view& render_target) {
    if (cmd_list == nullptr) return false;

    auto* device = cmd_list->get_device();
    if (device == nullptr) return false;

    auto* command_list_data =
            renodx::utils::data::Get<renodx::utils::swapchain::CommandListData>(cmd_list);
    if (command_list_data == nullptr
            || rule.rtv_index >= command_list_data->current_render_targets.size()) {
        return false;
    }

    render_target = command_list_data->current_render_targets[rule.rtv_index];
    if (render_target.handle == 0u) return false;

    const auto resource = renodx::utils::resource::GetResourceFromView(device, render_target);
    if (resource.handle == 0u) return false;
    const auto resource_desc = renodx::utils::resource::GetResourceDesc(device, resource);
    if (resource_desc.type != reshade::api::resource_type::texture_2d
            || resource_desc.texture.samples != 1u
            || (rule.match_format && resource_desc.texture.format != rule.format)
            || (rule.match_dimensions
                && (resource_desc.texture.width != rule.width
                    || resource_desc.texture.height != rule.height))) {
        return false;
    }

    renodx::utils::resource::GetResourceViewInfo(
            render_target,
            [&render_target](const renodx::utils::resource::ResourceViewInfo& info) {
                if (!info.destroyed && info.clone.handle != 0u) {
                    render_target = info.clone;
                }
            });

    const auto effect_resource = renodx::utils::resource::GetResourceFromView(device, render_target);
    if (effect_resource.handle == 0u) return false;
    const auto effect_resource_desc = renodx::utils::resource::GetResourceDesc(device, effect_resource);
    return effect_resource_desc.type == reshade::api::resource_type::texture_2d
                 && effect_resource_desc.texture.samples == 1u;
}

[[nodiscard]] std::string GetEffectTechniqueName(
        reshade::api::effect_runtime* runtime,
        reshade::api::effect_technique technique) {
    size_t name_size = 0u;
    runtime->get_technique_name(technique, nullptr, &name_size);
    if (name_size <= 1u) return {};

    std::string name(name_size, '\0');
    runtime->get_technique_name(technique, name.data(), &name_size);
    name.resize(name_size);
    return name;
}

[[nodiscard]] std::string GetEffectTechniqueEffectName(
        reshade::api::effect_runtime* runtime,
        reshade::api::effect_technique technique) {
    size_t name_size = 0u;
    runtime->get_technique_effect_name(technique, nullptr, &name_size);
    if (name_size <= 1u) return {};

    std::string name(name_size, '\0');
    runtime->get_technique_effect_name(technique, name.data(), &name_size);
    name.resize(name_size);
    return name;
}

[[nodiscard]] bool IsLegacyTruncatedTechnique(
        const EffectInsertionTechnique& configured,
        const EffectInsertionTechnique& available) {
    return configured.effect_name.size() + 1u == available.effect_name.size()
           && configured.technique_name.size() + 1u == available.technique_name.size()
           && available.effect_name.starts_with(configured.effect_name)
           && available.technique_name.starts_with(configured.technique_name);
}

struct EffectInsertionCallback {
    template <typename Context>
    static void RenderTechniques(Context& context, const void* post_data) {
        auto* insertion_data = static_cast<EffectInsertionDeviceData*>(const_cast<void*>(post_data));
        if (insertion_data == nullptr) return;
        const std::lock_guard runtime_lock(insertion_data->effect_runtime_mutex);

        EffectInsertionRule rule = {};
        std::vector<EffectInsertionTechnique> techniques;
        {
            const std::lock_guard lock(insertion_data->mutex);
            rule = insertion_data->render_rule;
        }
        {
            const std::lock_guard lock(active_effect_insertion_rule_mutex);
            techniques = active_effect_insertion_techniques;
        }
        if (techniques.empty()) return;
        if (!IsEffectInsertionOutsideRenderPass(context.cmd_list)) return;

        reshade::api::resource_view render_target = {0u};
        if (!ResolveEffectRenderTarget(context.cmd_list, rule, render_target)) return;

        std::optional<renodx::utils::state::CommandListState> previous_state;
        if (context.cmd_list->get_device()->get_api() == reshade::api::device_api::d3d12) {
            const auto* current_state = renodx::utils::state::GetCurrentState(context.cmd_list);
            if (current_state == nullptr) return;
            previous_state = *current_state;
            // ReShade copies the supplied target before its first pass. A D3D12
            // target still bound by the game cannot be transitioned safely for
            // that copy, even when no explicit render pass is active.
            context.cmd_list->bind_render_targets_and_depth_stencil(0u, nullptr, {0u});
        }

        auto* device_data = renodx::utils::data::Get<renodx::utils::swapchain::DeviceData>(
                context.cmd_list->get_device());
        if (device_data == nullptr) return;

        struct EffectRenderingScope {
            EffectRenderingScope() { is_rendering_inserted_effects = true; }
            ~EffectRenderingScope() { is_rendering_inserted_effects = false; }
        } effect_rendering_scope;

        const std::shared_lock lock(device_data->mutex);
        bool rendered_technique = false;
        for (auto* runtime : device_data->effect_runtimes) {
            if (runtime == nullptr) continue;
            struct TechniqueState {
                reshade::api::effect_technique handle = {0u};
                bool enabled = false;
                bool selected = false;
            };
            std::vector<TechniqueState> technique_states;
            runtime->enumerate_techniques(
                    nullptr,
                    [&technique_states, &techniques](
                            reshade::api::effect_runtime* effect_runtime,
                            reshade::api::effect_technique handle) {
                        const EffectInsertionTechnique identifier = {
                                .effect_name = GetEffectTechniqueEffectName(effect_runtime, handle),
                                .technique_name = GetEffectTechniqueName(effect_runtime, handle),
                        };
                        technique_states.push_back({
                                .handle = handle,
                                .enabled = effect_runtime->get_technique_state(handle),
                            .selected = std::ranges::any_of(
                                techniques,
                                [&identifier](const EffectInsertionTechnique& configured) {
                                    return configured == identifier
                                       || IsLegacyTruncatedTechnique(configured, identifier);
                                }),
                        });
                    });

            const bool has_selected_technique = std::ranges::any_of(
                    technique_states,
                    [](const TechniqueState& state) { return state.selected; });
            if (!has_selected_technique) continue;

            for (const auto& state : technique_states) {
                if (state.enabled != state.selected) {
                    runtime->set_technique_state(state.handle, state.selected);
                }
            }
            reshade::log::message(
                    reshade::log::level::debug,
                    "Pipeline insert rendering selected techniques through render_effects.");
            runtime->render_effects(context.cmd_list, render_target, render_target);
            reshade::log::message(
                    reshade::log::level::debug,
                    "Pipeline insert completed render_effects.");
            for (const auto& state : technique_states) {
                if (state.enabled != state.selected) {
                    runtime->set_technique_state(state.handle, state.enabled);
                }
            }
            rendered_technique = true;
        }
        if (rendered_technique && previous_state.has_value()) {
            previous_state->Apply(context.cmd_list);
            reshade::log::message(
                    reshade::log::level::debug,
                    "Pipeline insert restored the D3D12 game state.");
        }
        if (rendered_technique) {
            const std::lock_guard lock(insertion_data->mutex);
            ++insertion_data->rendered_technique_count;
            insertion_data->final_effects_pending = true;
        }
    }

    template <typename Context>
    [[nodiscard]] renodx::utils::command_action::CallbackResult<Context> operator()(Context& context) const {
        if (is_rendering_inserted_effects || context.IsDispatch() || context.cmd_list == nullptr) return {};

        auto* device = context.cmd_list->get_device();
        if (device == nullptr || !IsEffectInsertionSupportedCommandList(context.cmd_list)) return {};
        if (!IsEffectInsertionOutsideRenderPass(context.cmd_list)) return {};

        auto* shader_state = renodx::utils::command_action::GetShaderState(&context);
        if (shader_state == nullptr) return {};
        const uint32_t shader_hash = renodx::utils::shader::GetCurrentPixelShaderHash(shader_state);
        if (shader_hash == 0u) return {};
        const uint32_t vertex_shader_hash = renodx::utils::shader::GetCurrentShaderHash(
            shader_state,
            renodx::utils::shader::VERTEX_INDEX);

        EffectInsertionMode mode = EffectInsertionMode::automatic;
        AutomaticEffectInsertionSourceSize automatic_source_size =
            AutomaticEffectInsertionSourceSize::swapchain;
        std::vector<EffectInsertionRule> rules;
        EffectInsertionRule rule = {};
        size_t rule_index = 0u;
        {
            const std::lock_guard lock(active_effect_insertion_rule_mutex);
            mode = active_effect_insertion_mode;
            automatic_source_size = active_automatic_effect_insertion_source_size;
            rules = active_effect_insertion_rules;
            if (active_effect_insertion_techniques.empty()) return {};
        }

        auto* runtime_data = renodx::utils::data::Get<renodx::utils::swapchain::DeviceData>(device);
        if (runtime_data == nullptr) return {};
        {
            const std::shared_lock lock(runtime_data->mutex);
            if (runtime_data->effect_runtimes.empty()) return {};
        }

        auto* insertion_data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
        if (insertion_data == nullptr) return {};
        {
            const std::lock_guard lock(insertion_data->mutex);
            const uint64_t rule_revision = active_effect_insertion_rule_revision.load();
            if (insertion_data->rule_revision != rule_revision) {
                insertion_data->rule_revision = rule_revision;
                insertion_data->occurrences.assign(rules.size(), 0u);
                insertion_data->automatic_shader_hash = 0u;
                insertion_data->automatic_vertex_shader_hash = 0u;
                insertion_data->automatic_pipeline_layout = {0u};
                insertion_data->automatic_shader_missed_frames = 0u;
                insertion_data->rendered = false;
            }
            if (insertion_data->rendered) return {};

            if (mode == EffectInsertionMode::automatic) {
                if (device->get_api() != reshade::api::device_api::d3d12) {
                    if (!FindAutomaticEffectInsertionRule(context.cmd_list, rule, automatic_source_size)) return {};
                    ++insertion_data->automatic_match_count;
                } else {
                    const auto* current_state = renodx::utils::state::GetCurrentState(context.cmd_list);
                    if (current_state == nullptr) return {};

                    const bool has_automatic_signature = insertion_data->automatic_shader_hash != 0u;
                    if (has_automatic_signature) {
                        if (insertion_data->automatic_vertex_shader_hash != 0u) {
                            if (insertion_data->automatic_vertex_shader_hash != vertex_shader_hash) return {};
                        } else if (insertion_data->automatic_pipeline_layout
                                   != current_state->graphics_pipeline_layout) {
                            return {};
                        }
                    }
                    if (!FindAutomaticEffectInsertionRule(context.cmd_list, rule, automatic_source_size)) return {};
                    if (has_automatic_signature) {
                        ++insertion_data->automatic_match_count;
                        insertion_data->automatic_shader_hash = shader_hash;
                    } else {
                        auto* command_list_data = renodx::utils::data::Get<EffectInsertionCommandListData>(
                                context.cmd_list);
                        if (command_list_data != nullptr) {
                            const std::lock_guard command_list_lock(command_list_data->mutex);
                            if (command_list_data->automatic_candidate_revision != rule_revision) {
                                command_list_data->automatic_candidate_revision = rule_revision;
                                command_list_data->automatic_candidate_shader_hash = 0u;
                                command_list_data->automatic_candidate_vertex_shader_hash = 0u;
                                command_list_data->automatic_candidate_pipeline_layout = {0u};
                            }
                            if (command_list_data->automatic_candidate_shader_hash == 0u) {
                                command_list_data->automatic_candidate_shader_hash = shader_hash;
                                command_list_data->automatic_candidate_vertex_shader_hash = vertex_shader_hash;
                                command_list_data->automatic_candidate_pipeline_layout =
                                        current_state->graphics_pipeline_layout;
                            }
                        }
                        return {};
                    }
                }
            } else {
                if (insertion_data->occurrences.size() != rules.size()) {
                    insertion_data->occurrences.assign(rules.size(), 0u);
                }
                bool found = false;
                for (; rule_index < rules.size(); ++rule_index) {
                    const auto& candidate = rules[rule_index];
                    if (!candidate.enabled || candidate.shader_hash != shader_hash) continue;
                    reshade::api::resource_view render_target = {0u};
                    if (!ResolveEffectRenderTarget(context.cmd_list, candidate, render_target)) continue;
                    if (++insertion_data->occurrences[rule_index] != candidate.occurrence) continue;
                    rule = candidate;
                    found = true;
                    break;
                }
                if (!found) return {};
            }
            insertion_data->rendered = true;
            insertion_data->render_rule = rule;
        }

        return {
            .post_callback = RenderTechniques<Context>,
                .post_data = insertion_data,
        };
    }
};

struct EffectInsertionDrawCaptureCallback {
    template <typename Context>
    [[nodiscard]] renodx::utils::command_action::CallbackResult<Context> operator()(Context& context) const {
        if (is_rendering_inserted_effects || context.IsDispatch() || context.cmd_list == nullptr) return {};

        auto* device = context.cmd_list->get_device();
        if (device == nullptr || !IsEffectInsertionSupportedCommandList(context.cmd_list)) return {};
        if (effect_insertion_capture_device.load() != device) return {};
        if (!IsEffectInsertionOutsideRenderPass(context.cmd_list)) return {};

        auto* insertion_data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
        if (insertion_data == nullptr) return {};

        auto* shader_state = renodx::utils::command_action::GetShaderState(&context);
        const uint32_t shader_hash = shader_state != nullptr
                                       ? renodx::utils::shader::GetCurrentPixelShaderHash(shader_state)
                                       : 0u;
        if (shader_hash == 0u) return {};

        auto* swapchain_state = renodx::utils::command_action::GetSwapchainState(&context);
        if (swapchain_state == nullptr) return {};
        const auto render_targets = swapchain_state->current_render_targets;

        const std::lock_guard lock(insertion_data->mutex);
        if (!insertion_data->capturing) return {};
        EffectInsertionDraw draw = {
            .draw_index = ++insertion_data->capture_draw_index,
            .shader_hash = shader_hash,
        };
        draw.targets.reserve(render_targets.size());
        for (uint32_t rtv_index = 0u; rtv_index < render_targets.size(); ++rtv_index) {
            const auto render_target = render_targets[rtv_index];
            if (render_target.handle == 0u) continue;

            const auto resource = renodx::utils::resource::GetResourceFromView(device, render_target);
            if (resource.handle == 0u) continue;
            const auto resource_desc = renodx::utils::resource::GetResourceDesc(device, resource);
            const auto view_desc = renodx::utils::resource::GetResourceViewDesc(device, render_target);
            if (resource_desc.type != reshade::api::resource_type::texture_2d
                    || resource_desc.texture.samples != 1u) {
                continue;
            }

            const EffectInsertionDrawKey key = {
                    .shader_hash = shader_hash,
                    .rtv_index = rtv_index,
                    .format = resource_desc.texture.format,
                    .width = resource_desc.texture.width,
                    .height = resource_desc.texture.height,
            };
            const uint32_t occurrence = ++insertion_data->capture_occurrences[key];
            draw.targets.push_back({
                    .key = key,
                    .resource_type = resource_desc.type,
                    .view_format = view_desc.format,
                    .view = render_target,
                    .occurrence = occurrence,
            });
        }
        if (draw.targets.empty()) return {};
        if (insertion_data->working_draws.size() == MAX_CAPTURED_EFFECT_INSERTION_DRAWS) {
            insertion_data->working_capture_truncated = true;
            return {};
        }
        insertion_data->working_draws.push_back(std::move(draw));
        return {};
    }
};

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

void ApplyEffectInsertionConfiguration(
        EffectInsertionMode mode,
        const std::vector<EffectInsertionRule>& rules) {
    reshade::set_config_value(
            nullptr,
            CONFIG_SECTION,
            "EffectInsertMode",
            static_cast<uint32_t>(mode));
    SaveEffectInsertionRules(rules);
    saved_effect_insertion_mode = mode;
    saved_effect_insertion_rules = rules;
    {
        const std::lock_guard lock(active_effect_insertion_rule_mutex);
        active_effect_insertion_mode = mode;
        active_effect_insertion_rules = rules;
        ++active_effect_insertion_rule_revision;
    }
    effect_insertion_config_dirty = false;
}

void ApplyAutomaticEffectInsertionSourceSize(AutomaticEffectInsertionSourceSize source_size) {
    reshade::set_config_value(
            nullptr,
            CONFIG_SECTION,
            "EffectInsertAutomaticSourceSize",
            static_cast<uint32_t>(source_size));
    saved_automatic_effect_insertion_source_size = source_size;
    const std::lock_guard lock(active_effect_insertion_rule_mutex);
    active_automatic_effect_insertion_source_size = source_size;
    ++active_effect_insertion_rule_revision;
}

void ApplyEffectInsertionTechniques(const std::vector<EffectInsertionTechnique>& techniques) {
    SaveEffectInsertionTechniques(techniques);
    selected_effect_insertion_techniques = techniques;
    const std::lock_guard lock(active_effect_insertion_rule_mutex);
    active_effect_insertion_techniques = techniques;
}

void SelectEffectInsertionTarget(
        const EffectInsertionDraw& draw,
        const EffectInsertionDraw::Target& target) {
    draft_effect_insertion_rule = {
            .enabled = true,
            .match_format = true,
            .match_dimensions = true,
            .shader_hash = draw.shader_hash,
            .rtv_index = target.key.rtv_index,
            .occurrence = target.occurrence,
            .format = target.key.format,
            .width = target.key.width,
            .height = target.key.height,
    };
    selected_effect_insertion_shader_hash = draw.shader_hash;
    SetShaderHashText(draw.shader_hash);
    auto rules = draft_effect_insertion_rules;
    const auto existing = std::ranges::find(rules, draft_effect_insertion_rule);
    if (existing == rules.end()) {
        rules.push_back(draft_effect_insertion_rule);
        selected_effect_insertion_rule_index = rules.size() - 1u;
    } else {
        selected_effect_insertion_rule_index = static_cast<size_t>(existing - rules.begin());
    }
    draft_effect_insertion_rules = std::move(rules);
    manual_effect_insertion_rules_dirty = true;
}

void RenderEffectInsertionResourcePreview(
        reshade::api::device* device,
        EffectInsertionDeviceData* insertion_data,
        reshade::api::resource_view render_target) {
    if (device->get_api() == reshade::api::device_api::d3d12) {
        ImGui::TextDisabled("Resource previews are unavailable for D3D12 captures because game descriptors are transient.");
        return;
    }

    reshade::api::resource_view preview_view = render_target;
    bool destroyed = false;
    const bool found_view = renodx::utils::resource::GetResourceViewInfo(
            render_target,
            [&](const renodx::utils::resource::ResourceViewInfo& info) {
                destroyed = info.destroyed;
                if (!destroyed && info.clone.handle != 0u) {
                    preview_view = info.clone;
                }
            });
    if (!found_view || destroyed || preview_view.handle == 0u) {
        ImGui::TextDisabled("The selected render target is no longer available.");
        return;
    }

    const auto preview_resource = renodx::utils::resource::GetResourceFromView(device, preview_view);
    if (preview_resource.handle == 0u) {
        ImGui::TextDisabled("The selected render-target view is no longer available.");
        return;
    }

    const auto desc = renodx::utils::resource::GetResourceDesc(device, preview_resource);

    if (desc.type != reshade::api::resource_type::texture_2d
            && desc.type != reshade::api::resource_type::surface) {
        ImGui::TextDisabled("The selected resource type cannot be previewed.");
        return;
    }

    auto format = reshade::api::format_to_default_typed(desc.texture.format);
    switch (desc.texture.format) {
        case reshade::api::format::b10g10r10a2_typeless:
            format = reshade::api::format::b10g10r10a2_unorm;
            break;
        case reshade::api::format::r8g8b8a8_typeless:
            format = reshade::api::format::r8g8b8a8_unorm;
            break;
        case reshade::api::format::r16g16b16a16_typeless:
            format = reshade::api::format::r16g16b16a16_float;
            break;
        default:
            break;
    }
    if (format == reshade::api::format::unknown) {
        ImGui::TextDisabled("The selected resource format cannot be previewed.");
        return;
    }

    const auto target_view_desc = renodx::utils::resource::GetResourceViewDesc(device, preview_view);
    if (target_view_desc.type == reshade::api::resource_view_type::unknown) {
        ImGui::TextDisabled("The selected render-target view cannot be previewed.");
        return;
    }

    reshade::api::resource_view srv = {0u};
    {
        const std::lock_guard lock(insertion_data->mutex);
        const auto pair = insertion_data->preview_srvs.find(preview_view.handle);
        if (pair != insertion_data->preview_srvs.end()) {
            srv = pair->second.view;
        } else if (device->create_resource_view(
                           preview_resource,
                           reshade::api::resource_usage::shader_resource,
                           reshade::api::resource_view_desc(
                                   reshade::api::resource_view_type::texture_2d,
                                   format,
                                   target_view_desc.texture.first_level,
                                   1u,
                                   target_view_desc.texture.first_layer,
                                   1u),
                           &srv)) {
            insertion_data->preview_srvs.emplace(
                    preview_view.handle,
                    EffectInsertionPreviewSRV{
                            .resource = preview_resource,
                            .view = srv,
                    });
        }
    }
    if (srv.handle == 0u) {
        ImGui::TextDisabled("No shader-readable preview view could be created for this target.");
        return;
    }

    const auto available_size = ImGui::GetContentRegionAvail();
    ImVec2 output_size = {
        static_cast<float>(std::max(desc.texture.width >> target_view_desc.texture.first_level, 1u)),
        static_cast<float>(std::max(desc.texture.height >> target_view_desc.texture.first_level, 1u)),
    };
    if (output_size.x > available_size.x && available_size.x > 0.f) {
        const float scale = available_size.x / output_size.x;
        output_size.x *= scale;
        output_size.y *= scale;
    }
    constexpr float max_preview_height = 420.f;
    if (output_size.y > max_preview_height) {
        const float scale = max_preview_height / output_size.y;
        output_size.x *= scale;
        output_size.y *= scale;
    }
    ImGui::Image(srv.handle, output_size, ImVec2(0.f, 0.f), ImVec2(1.f, 1.f));
}

void RenderEffectInsertionDrawView() {
    EffectInsertionDeviceData* insertion_data = nullptr;
    if (tracked_swapchain != nullptr) {
        insertion_data = renodx::utils::data::Get<EffectInsertionDeviceData>(tracked_swapchain->get_device());
    }
    if (insertion_data == nullptr) {
        ImGui::TextDisabled("Draw capture is available for D3D11 and D3D12 swapchains.");
        return;
    }

    bool capture_requested = false;
    bool capturing = false;
    bool captured_frame_truncated = false;
    std::vector<EffectInsertionDraw> captured_draws;
    {
        const std::lock_guard lock(insertion_data->mutex);
        capture_requested = insertion_data->capture_requested;
        capturing = insertion_data->capturing;
        captured_frame_truncated = insertion_data->captured_frame_truncated;
        captured_draws = insertion_data->captured_draws;
    }

    ImGui::BeginDisabled(capture_requested || capturing);
    if (ImGui::Button("Capture next frame")) {
        const std::lock_guard lock(insertion_data->mutex);
        insertion_data->capture_requested = true;
    }
    ImGui::EndDisabled();
    ImGui::SameLine();
    if (capturing) {
        ImGui::TextDisabled("Capturing...");
    } else if (capture_requested) {
        ImGui::TextDisabled("Capture queued...");
    } else {
        ImGui::TextDisabled("%zu shaders captured", captured_draws.size());
    }

    if (captured_frame_truncated) {
        ImGui::TextColored(
                ImVec4(1.f, 0.75f, 0.25f, 1.f),
            "Capture reached the %zu-draw limit before shader deduplication.",
                MAX_CAPTURED_EFFECT_INSERTION_DRAWS);
    }

    if (captured_draws.empty()) return;

    ImGui::TextDisabled("Only the last known draw for each pixel shader is shown. Selection updates the draft manual point.");
    constexpr ImGuiTableFlags table_flags = ImGuiTableFlags_Borders
                                            | ImGuiTableFlags_RowBg
                                            | ImGuiTableFlags_Resizable
                                            | ImGuiTableFlags_ScrollY
                                            | ImGuiTableFlags_SizingFixedFit;
    if (!ImGui::BeginTable("EffectInsertionDrawView", 5, table_flags, ImVec2(0.f, 300.f))) return;

    ImGui::TableSetupScrollFreeze(0, 1);
    ImGui::TableSetupColumn("Draw");
    ImGui::TableSetupColumn("Pixel shader");
    ImGui::TableSetupColumn("Targets");
    ImGui::TableSetupColumn("RTV HDR range");
    ImGui::TableSetupColumn("Manual point");
    ImGui::TableHeadersRow();

    for (const auto& draw : captured_draws) {
            ImGui::PushID(static_cast<int>(draw.draw_index));
            ImGui::TableNextRow();
            ImGui::TableSetColumnIndex(0);
            const bool selected = selected_effect_insertion_shader_hash == draw.shader_hash;
            const auto select_draw = [&draw]() {
                const auto current_target = std::ranges::find_if(
                        draw.targets,
                        [](const EffectInsertionDraw::Target& target) {
                            return target.key.rtv_index == draft_effect_insertion_rule.rtv_index;
                        });
                SelectEffectInsertionTarget(
                        draw,
                        current_target != draw.targets.end() ? *current_target : draw.targets.front());
            };
            if (ImGui::Selectable(
                        std::format("{}##select", draw.draw_index).c_str(),
                        selected,
                        ImGuiSelectableFlags_SpanAllColumns | ImGuiSelectableFlags_AllowOverlap)) {
                select_draw();
            }
            ImGui::TableSetColumnIndex(1);
            ImGui::Text("0x%08X", draw.shader_hash);
            ImGui::TableSetColumnIndex(2);
            ImGui::Text("%zu", draw.targets.size());
            ImGui::TableSetColumnIndex(3);
            for (const auto& target : draw.targets) {
                const bool extended_range = IsExtendedRangeFormat(target.view_format);
                ImGui::TextColored(
                        extended_range ? ImVec4(0.4f, 0.9f, 0.5f, 1.f) : ImVec4(1.f, 0.4f, 0.4f, 1.f),
                        "RTV %u: %s%s",
                        target.key.rtv_index,
                        GetFormatName(target.view_format),
                        extended_range ? "" : " (blocker)");
            }
            ImGui::TableSetColumnIndex(4);
            const bool saved = std::ranges::any_of(
                    saved_effect_insertion_rules,
                    [&draw](const EffectInsertionRule& rule) {
                        return rule.shader_hash == draw.shader_hash;
                    });
            if (saved) {
                ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.15f, 0.55f, 0.25f, 1.f));
                ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.2f, 0.7f, 0.3f, 1.f));
                ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(0.1f, 0.45f, 0.2f, 1.f));
                if (ImGui::SmallButton("Unsave")) {
                    auto rules = saved_effect_insertion_rules;
                    std::erase_if(
                            rules,
                            [&draw](const EffectInsertionRule& rule) {
                                return rule.shader_hash == draw.shader_hash;
                            });
                    ApplyEffectInsertionConfiguration(
                            EffectInsertionMode::manual,
                            rules);
                    draft_effect_insertion_rules = std::move(rules);
                    manual_effect_insertion_rules_dirty = false;
                    if (selected) {
                        draft_effect_insertion_rule = {};
                        selected_effect_insertion_rule_index = SIZE_MAX;
                        selected_effect_insertion_shader_hash = 0u;
                        SetShaderHashText(0u);
                    } else {
                        const auto selected_rule = std::ranges::find(
                                draft_effect_insertion_rules,
                                draft_effect_insertion_rule);
                        selected_effect_insertion_rule_index = selected_rule == draft_effect_insertion_rules.end()
                                                                   ? SIZE_MAX
                                                                   : static_cast<size_t>(selected_rule - draft_effect_insertion_rules.begin());
                    }
                }
                ImGui::PopStyleColor(3);
                ImGui::SetItemTooltip("Remove this shader's manual insertion points and save the change.");
            } else {
                if (ImGui::SmallButton("Save")) {
                    select_draw();
                    auto rules = saved_effect_insertion_rules;
                    std::erase_if(
                        rules,
                        [&draw](const EffectInsertionRule& rule) {
                        return rule.shader_hash == draw.shader_hash;
                        });
                    std::ranges::copy_if(
                        draft_effect_insertion_rules,
                        std::back_inserter(rules),
                        [&draw](const EffectInsertionRule& rule) {
                        return rule.shader_hash == draw.shader_hash;
                        });
                    ApplyEffectInsertionConfiguration(
                            EffectInsertionMode::manual,
                        rules);
                    draft_effect_insertion_rules = std::move(rules);
                    const auto selected_rule = std::ranges::find(
                        draft_effect_insertion_rules,
                        draft_effect_insertion_rule);
                    selected_effect_insertion_rule_index = selected_rule == draft_effect_insertion_rules.end()
                                           ? SIZE_MAX
                                           : static_cast<size_t>(selected_rule - draft_effect_insertion_rules.begin());
                    manual_effect_insertion_rules_dirty = false;
                }
                ImGui::SetItemTooltip("Save all draft manual points and activate manual mode.");
            }
            ImGui::PopID();
    }
    ImGui::EndTable();

    const auto selected_draw = std::ranges::find_if(
            captured_draws,
            [](const EffectInsertionDraw& draw) {
                return draw.shader_hash == selected_effect_insertion_shader_hash;
            });
    if (selected_draw == captured_draws.end()) return;

    const auto selected_target = std::ranges::find_if(
            selected_draw->targets,
            [](const EffectInsertionDraw::Target& target) {
                return target.key.rtv_index == draft_effect_insertion_rule.rtv_index;
            });
    const auto& target = selected_target != selected_draw->targets.end()
                             ? *selected_target
                             : selected_draw->targets.front();
    const auto target_label = std::format(
                            "RTV {} | {}x{} | {} | resource {} | RTV {} | {} | occurrence {}",
            target.key.rtv_index,
            target.key.width,
            target.key.height,
                        GetResourceTypeName(target.resource_type),
                        GetFormatName(target.key.format),
                        GetFormatName(target.view_format),
            IsExtendedRangeFormat(target.view_format) ? "preserves > 1" : "blocker: clamps > 1",
            target.occurrence);
    if (ImGui::BeginCombo("Render target", target_label.c_str())) {
        for (const auto& candidate : selected_draw->targets) {
            const auto candidate_label = std::format(
                        "RTV {} | {}x{} | {} | resource {} | RTV {} | {} | occurrence {}",
                    candidate.key.rtv_index,
                    candidate.key.width,
                    candidate.key.height,
                            GetResourceTypeName(candidate.resource_type),
                            GetFormatName(candidate.key.format),
                            GetFormatName(candidate.view_format),
                    IsExtendedRangeFormat(candidate.view_format) ? "preserves > 1" : "blocker: clamps > 1",
                    candidate.occurrence);
            if (ImGui::Selectable(
                        candidate_label.c_str(),
                        candidate.key.rtv_index == target.key.rtv_index)) {
                SelectEffectInsertionTarget(*selected_draw, candidate);
            }
        }
        ImGui::EndCombo();
    }

    ImGui::SeparatorText("Resource Preview");
    RenderEffectInsertionResourcePreview(
            tracked_swapchain->get_device(),
            insertion_data,
            target.view);
}

void RenderEffectInsertionTechniqueSettings(reshade::api::effect_runtime* runtime) {
    ImGui::SeparatorText("Inserted ReShade Techniques");
    ImGui::TextWrapped(
            "Selected techniques render at the custom insert point regardless of their normal ReShade enabled state.");
    ImGui::TextWrapped(
            "While insertion runs, ReShade's normal end-of-frame effect render is suppressed for that frame; only the selected techniques render.");

    if (runtime == nullptr) {
        ImGui::TextDisabled("No ReShade effect runtime is available.");
        return;
    }
    auto* insertion_data = renodx::utils::data::Get<EffectInsertionDeviceData>(runtime->get_device());
    if (insertion_data == nullptr) {
        ImGui::TextDisabled("No insertion state is available for this effect runtime.");
        return;
    }
    const std::lock_guard runtime_lock(insertion_data->effect_runtime_mutex);

    struct AvailableTechnique {
        EffectInsertionTechnique identifier;
        reshade::api::effect_technique handle = {0u};
        bool enabled = false;
    };
    std::vector<AvailableTechnique> available_techniques;
    runtime->enumerate_techniques(
            nullptr,
            [&available_techniques](
                    reshade::api::effect_runtime* effect_runtime,
                    reshade::api::effect_technique technique) {
                EffectInsertionTechnique identifier = {
                        .effect_name = GetEffectTechniqueEffectName(effect_runtime, technique),
                        .technique_name = GetEffectTechniqueName(effect_runtime, technique),
                };
                if (identifier.effect_name.empty() || identifier.technique_name.empty()) return;
                available_techniques.push_back({
                        .identifier = std::move(identifier),
                    .handle = technique,
                        .enabled = effect_runtime->get_technique_state(technique),
                });
            });
    std::ranges::sort(
            available_techniques,
            [](const AvailableTechnique& left, const AvailableTechnique& right) {
                if (left.identifier.effect_name != right.identifier.effect_name) {
                    return left.identifier.effect_name < right.identifier.effect_name;
                }
                return left.identifier.technique_name < right.identifier.technique_name;
            });

    auto updated_techniques = selected_effect_insertion_techniques;
    bool changed = false;
    for (auto& selected : updated_techniques) {
        const auto replacement = std::ranges::find_if(
                available_techniques,
                [&selected](const AvailableTechnique& available) {
                    return IsLegacyTruncatedTechnique(selected, available.identifier);
                });
        if (replacement != available_techniques.end()) {
            selected = replacement->identifier;
            changed = true;
        }
    }
    if (changed) {
        std::vector<EffectInsertionTechnique> unique_techniques;
        unique_techniques.reserve(updated_techniques.size());
        for (auto& technique : updated_techniques) {
            if (std::ranges::find(unique_techniques, technique) == unique_techniques.end()) {
                unique_techniques.push_back(std::move(technique));
            }
        }
        updated_techniques = std::move(unique_techniques);
    }
    for (auto& available : available_techniques) {
        if (std::ranges::find(updated_techniques, available.identifier) != updated_techniques.end()
            && available.enabled) {
            runtime->set_technique_state(available.handle, false);
            available.enabled = false;
        }
    }
    constexpr ImGuiTableFlags table_flags = ImGuiTableFlags_Borders
                                            | ImGuiTableFlags_RowBg
                                            | ImGuiTableFlags_Resizable
                                            | ImGuiTableFlags_ScrollY
                                            | ImGuiTableFlags_SizingStretchProp;
    if (ImGui::BeginTable("EffectInsertionTechniques", 3, table_flags, ImVec2(0.f, 240.f))) {
        ImGui::TableSetupScrollFreeze(0, 1);
        ImGui::TableSetupColumn("Insert", ImGuiTableColumnFlags_WidthFixed);
        ImGui::TableSetupColumn("Effect / technique");
        ImGui::TableSetupColumn("Normal end-of-frame state");
        ImGui::TableHeadersRow();
        for (auto& available : available_techniques) {
            ImGui::PushID(available.identifier.effect_name.c_str());
            ImGui::PushID(available.identifier.technique_name.c_str());
            ImGui::TableNextRow();
            ImGui::TableSetColumnIndex(0);
            auto selected = std::ranges::find(updated_techniques, available.identifier);
            bool insert = selected != updated_techniques.end();
            if (ImGui::Checkbox("##insert", &insert)) {
                if (insert) {
                    updated_techniques.push_back(available.identifier);
                    if (available.enabled) {
                        runtime->set_technique_state(available.handle, false);
                        available.enabled = false;
                    }
                } else {
                    updated_techniques.erase(selected);
                }
                changed = true;
            }
            ImGui::TableSetColumnIndex(1);
            ImGui::TextUnformatted(available.identifier.effect_name.c_str());
            ImGui::SameLine();
            ImGui::TextDisabled("/ %s", available.identifier.technique_name.c_str());
            ImGui::TableSetColumnIndex(2);
            ImGui::TextDisabled(available.enabled ? "Enabled" : "Disabled");
            ImGui::PopID();
            ImGui::PopID();
        }
        ImGui::EndTable();
    }

    const auto configured_techniques = updated_techniques;
    for (const auto& selected : configured_techniques) {
        const bool available = std::ranges::any_of(
                available_techniques,
                [&selected](const AvailableTechnique& candidate) {
                    return candidate.identifier == selected;
                });
        if (available) continue;

        ImGui::PushID(selected.effect_name.c_str());
        ImGui::PushID(selected.technique_name.c_str());
        bool keep = true;
        if (ImGui::Checkbox("##unavailable-insert", &keep)) {
            const auto configured = std::ranges::find(updated_techniques, selected);
            if (configured != updated_techniques.end()) updated_techniques.erase(configured);
            changed = true;
        }
        ImGui::SameLine();
        ImGui::TextDisabled(
                "%s / %s (not currently loaded)",
                selected.effect_name.c_str(),
                selected.technique_name.c_str());
        ImGui::PopID();
        ImGui::PopID();
    }

    if (changed) ApplyEffectInsertionTechniques(updated_techniques);
    ImGui::TextDisabled(
            "%zu technique%s selected for insertion.",
            selected_effect_insertion_techniques.size(),
            selected_effect_insertion_techniques.size() == 1u ? "" : "s");
}

void RenderEffectInsertionSettings(reshade::api::effect_runtime* runtime) {
    bool changed = false;
    RenderEffectInsertionDrawView();
    RenderEffectInsertionTechniqueSettings(runtime);
    ImGui::SeparatorText("Insertion Mode");

    int mode_value = static_cast<int>(saved_effect_insertion_mode);
    if (ImGui::RadioButton("Automatic", &mode_value, static_cast<int>(EffectInsertionMode::automatic))) {
        ApplyEffectInsertionConfiguration(EffectInsertionMode::automatic, saved_effect_insertion_rules);
    }
    ImGui::SameLine();
    if (ImGui::RadioButton("Manual", &mode_value, static_cast<int>(EffectInsertionMode::manual))) {
        ApplyEffectInsertionConfiguration(EffectInsertionMode::manual, saved_effect_insertion_rules);
    }
    if (saved_effect_insertion_mode == EffectInsertionMode::automatic) {
        int source_size_value = static_cast<int>(saved_automatic_effect_insertion_source_size);
        ImGui::TextUnformatted("Automatic source SRV size");
        if (ImGui::RadioButton(
                "Match swapchain size",
                &source_size_value,
                static_cast<int>(AutomaticEffectInsertionSourceSize::swapchain))) {
            ApplyAutomaticEffectInsertionSourceSize(AutomaticEffectInsertionSourceSize::swapchain);
        }
        ImGui::SameLine();
        if (ImGui::RadioButton(
                "Match 16:9 aspect ratio",
                &source_size_value,
                static_cast<int>(AutomaticEffectInsertionSourceSize::aspect_ratio_16_9))) {
            ApplyAutomaticEffectInsertionSourceSize(AutomaticEffectInsertionSourceSize::aspect_ratio_16_9);
        }
        ImGui::TextWrapped(
            "Runs once after the first pixel-shader draw that writes to a swapchain target and samples a source matching the selected size rule.");
        ImGui::TextDisabled(
            "If no automatic candidate is found, selected techniques run normally at the end of the frame.");
        ImGui::TextDisabled("Automatic matching inspects the live D3D11/D3D12 pixel-shader bindings.");
        return;
    }

    ImGui::SeparatorText("Manual Insertion Points");

    changed |= ImGui::Checkbox("Enable insert point", &draft_effect_insertion_rule.enabled);
    changed |= ImGui::InputText(
            "Pixel shader hash",
            effect_insertion_shader_hash_text.data(),
            effect_insertion_shader_hash_text.size());
    changed |= ImGui::InputScalar(
            "RTV slot",
            ImGuiDataType_U32,
            &draft_effect_insertion_rule.rtv_index);
    changed |= ImGui::InputScalar(
            "Occurrence",
            ImGuiDataType_U32,
            &draft_effect_insertion_rule.occurrence);

    changed |= ImGui::Checkbox("Match target format", &draft_effect_insertion_rule.match_format);
    if (draft_effect_insertion_rule.match_format) {
        uint32_t format = static_cast<uint32_t>(draft_effect_insertion_rule.format);
        if (ImGui::InputScalar("ReShade format ID", ImGuiDataType_U32, &format)) {
            draft_effect_insertion_rule.format = static_cast<reshade::api::format>(format);
            changed = true;
        }
    }

    changed |= ImGui::Checkbox("Match target dimensions", &draft_effect_insertion_rule.match_dimensions);
    if (draft_effect_insertion_rule.match_dimensions) {
        changed |= ImGui::InputScalar("Target width", ImGuiDataType_U32, &draft_effect_insertion_rule.width);
        changed |= ImGui::InputScalar("Target height", ImGuiDataType_U32, &draft_effect_insertion_rule.height);
    }

    if (changed) {
        effect_insertion_config_dirty = true;
    }

    uint32_t parsed_shader_hash = 0u;
    const bool valid_hash = TryParseShaderHash(effect_insertion_shader_hash_text.data(), parsed_shader_hash);
    const bool valid_rule = valid_hash
                            && draft_effect_insertion_rule.rtv_index < MAX_SIMULTANEOUS_RENDER_TARGETS
                            && draft_effect_insertion_rule.occurrence != 0u
                            && (!draft_effect_insertion_rule.enabled || parsed_shader_hash != 0u)
                            && (!draft_effect_insertion_rule.enabled
                                || !draft_effect_insertion_rule.match_format
                                || draft_effect_insertion_rule.format != reshade::api::format::unknown)
                            && (!draft_effect_insertion_rule.enabled
                                || !draft_effect_insertion_rule.match_dimensions
                                || (draft_effect_insertion_rule.width != 0u
                                    && draft_effect_insertion_rule.height != 0u));

    if (!valid_hash) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "Use exact 0xXXXXXXXX notation.");
    } else if (draft_effect_insertion_rule.rtv_index >= MAX_SIMULTANEOUS_RENDER_TARGETS) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "RTV slots range from 0 to 7.");
    } else if (draft_effect_insertion_rule.occurrence == 0u) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "Occurrence starts at 1.");
    } else if (draft_effect_insertion_rule.enabled && parsed_shader_hash == 0u) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "An enabled rule requires a non-zero shader hash.");
    } else if (draft_effect_insertion_rule.enabled
                         && draft_effect_insertion_rule.match_format
                         && draft_effect_insertion_rule.format == reshade::api::format::unknown) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "A matched target format cannot be unknown.");
    } else if (draft_effect_insertion_rule.enabled
                         && draft_effect_insertion_rule.match_dimensions
                         && (draft_effect_insertion_rule.width == 0u
                                 || draft_effect_insertion_rule.height == 0u)) {
        ImGui::TextColored(ImVec4(1.f, 0.4f, 0.4f, 1.f), "Matched dimensions must be non-zero.");
    }

    if (valid_rule && effect_insertion_config_dirty) {
        draft_effect_insertion_rule.shader_hash = parsed_shader_hash;
        auto rules = draft_effect_insertion_rules;
        if (selected_effect_insertion_rule_index < rules.size()) {
            rules[selected_effect_insertion_rule_index] = draft_effect_insertion_rule;
        } else {
            rules.push_back(draft_effect_insertion_rule);
            selected_effect_insertion_rule_index = rules.size() - 1u;
        }
        draft_effect_insertion_rules = std::move(rules);
        manual_effect_insertion_rules_dirty = true;
        effect_insertion_config_dirty = false;
        SetShaderHashText(draft_effect_insertion_rule.shader_hash);
    }

    if (ImGui::Button("Clear manual points")) {
        selected_effect_insertion_rule_index = SIZE_MAX;
        draft_effect_insertion_rules.clear();
        manual_effect_insertion_rules_dirty = true;
    }
    ImGui::SameLine();
    if (ImGui::Button("Reset fields")) {
        draft_effect_insertion_rule = {};
        SetShaderHashText(0u);
        selected_effect_insertion_shader_hash = 0u;
    }

    if (!draft_effect_insertion_rules.empty()) {
        ImGui::TextDisabled("Manual points (first matching point wins each frame):");
        for (size_t index = 0u; index < draft_effect_insertion_rules.size(); ++index) {
            const auto& rule = draft_effect_insertion_rules[index];
            ImGui::PushID(static_cast<int>(index));
            ImGui::Text("0x%08X | RTV %u | occurrence %u", rule.shader_hash, rule.rtv_index, rule.occurrence);
            ImGui::SameLine();
            if (ImGui::SmallButton("Edit")) {
                draft_effect_insertion_rule = rule;
                selected_effect_insertion_rule_index = index;
                selected_effect_insertion_shader_hash = rule.shader_hash;
                SetShaderHashText(rule.shader_hash);
            }
            ImGui::SameLine();
            if (ImGui::SmallButton("Remove")) {
                auto rules = draft_effect_insertion_rules;
                rules.erase(rules.begin() + static_cast<ptrdiff_t>(index));
                if (selected_effect_insertion_rule_index == index) {
                    selected_effect_insertion_rule_index = SIZE_MAX;
                } else if (selected_effect_insertion_rule_index > index
                           && selected_effect_insertion_rule_index < rules.size() + 1u) {
                    --selected_effect_insertion_rule_index;
                }
                draft_effect_insertion_rules = std::move(rules);
                manual_effect_insertion_rules_dirty = true;
                ImGui::PopID();
                break;
            }
            ImGui::PopID();
        }
    } else if (manual_effect_insertion_rules_dirty && ImGui::Button("Save cleared points")) {
        ApplyEffectInsertionConfiguration(EffectInsertionMode::manual, draft_effect_insertion_rules);
        manual_effect_insertion_rules_dirty = false;
    }
    if (manual_effect_insertion_rules_dirty) {
        ImGui::TextColored(ImVec4(1.f, 0.75f, 0.25f, 1.f), "Unsaved changes");
    }

    ImGui::TextDisabled(
            saved_effect_insertion_rules.empty()
            ? "No saved manual insertion points are active."
            : "Saved manual points are active after you select Save manual points.");
        if (!draft_effect_insertion_rules.empty() && selected_effect_insertion_techniques.empty()) {
        ImGui::TextColored(
            ImVec4(1.f, 0.75f, 0.25f, 1.f),
            "Select at least one ReShade technique for the active insert point.");
        }
    ImGui::TextDisabled("Renders only the selected ReShade techniques once per frame after the selected draw.");
    ImGui::TextDisabled("D3D11 immediate contexts and D3D12 direct lists outside render passes are supported.");
    ImGui::TextDisabled("D3D12 occurrence selection follows recording order and is intended for serially recorded passes.");
}

void OnRegisterPipelineInsertOverlay(reshade::api::effect_runtime* runtime) {
    RenderEffectInsertionSettings(runtime);
}

void ConfigureEffectInsertion() {
    const auto legacy_rule = LoadEffectInsertionRule();
    uint32_t mode = static_cast<uint32_t>(EffectInsertionMode::automatic);
    reshade::get_config_value(nullptr, CONFIG_SECTION, "EffectInsertMode", mode);
    saved_effect_insertion_mode = mode == static_cast<uint32_t>(EffectInsertionMode::manual)
                                      ? EffectInsertionMode::manual
                                      : EffectInsertionMode::automatic;
    saved_effect_insertion_rules = LoadEffectInsertionRules(legacy_rule);
        uint32_t automatic_source_size = static_cast<uint32_t>(AutomaticEffectInsertionSourceSize::swapchain);
        reshade::get_config_value(
            nullptr,
            CONFIG_SECTION,
            "EffectInsertAutomaticSourceSize",
            automatic_source_size);
        saved_automatic_effect_insertion_source_size =
            automatic_source_size == static_cast<uint32_t>(AutomaticEffectInsertionSourceSize::aspect_ratio_16_9)
            ? AutomaticEffectInsertionSourceSize::aspect_ratio_16_9
            : AutomaticEffectInsertionSourceSize::swapchain;
    draft_effect_insertion_rules = saved_effect_insertion_rules;
    manual_effect_insertion_rules_dirty = false;
    selected_effect_insertion_techniques = LoadEffectInsertionTechniques();
    active_effect_insertion_mode = saved_effect_insertion_mode;
    active_automatic_effect_insertion_source_size = saved_automatic_effect_insertion_source_size;
    active_effect_insertion_rules = saved_effect_insertion_rules;
    active_effect_insertion_techniques = selected_effect_insertion_techniques;
    draft_effect_insertion_rule = saved_effect_insertion_rules.empty()
                                      ? EffectInsertionRule{}
                                      : saved_effect_insertion_rules.front();
    selected_effect_insertion_rule_index = saved_effect_insertion_rules.empty() ? SIZE_MAX : 0u;
    selected_effect_insertion_shader_hash = draft_effect_insertion_rule.shader_hash;
    SetShaderHashText(draft_effect_insertion_rule.shader_hash);

    renodx::utils::command_action::Register(
            EffectInsertionCallback{},
            {
                    .command_types = renodx::utils::command_action::COMMAND_TYPE_DIRECT_DRAW
                                                     | renodx::utils::command_action::COMMAND_TYPE_INDIRECT,
            });
    renodx::utils::command_action::Register(
            EffectInsertionDrawCaptureCallback{},
            {
                    .command_types = renodx::utils::command_action::COMMAND_TYPE_DIRECT_DRAW
                                                     | renodx::utils::command_action::COMMAND_TYPE_INDIRECT,
            });

        if (active_effect_insertion_mode == EffectInsertionMode::manual && !active_effect_insertion_rules.empty()) {
        reshade::log::message(
                reshade::log::level::info,
                std::format(
            "RenoDX Upgrade: {} manual D3D11/D3D12 ReShade insertion point(s) configured.",
                active_effect_insertion_rules.size())
                        .c_str());
    }
}

void ConfigureEffectInsertionFeature() {
    effect_insertion_enabled = AddGlobalSetting(new Setting{
            .key = "EnableEffectInsertion",
            .value_type = SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "Enable Shader Insertion",
            .section = "Shader Insertion",
            .tooltip = "Enables shader, pipeline, descriptor, command-state, frame-capture, and ReShade effect-insertion tracking. Requires a game restart.",
    })->GetValue() == 1.f;

    if (effect_insertion_enabled) ConfigureEffectInsertion();
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
    auto* device = swapchain->get_device();
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
    if (data == nullptr) return;

    const std::lock_guard lock(data->mutex);
    data->swapchain_rtvs.reserve(swapchain->get_back_buffer_count());
    for (uint32_t index = 0u; index < swapchain->get_back_buffer_count(); ++index) {
        const auto resource = swapchain->get_back_buffer(index);
        const auto desc = device->get_resource_desc(resource);
        reshade::api::resource_view view = {0u};
        device->create_resource_view(
                resource,
                reshade::api::resource_usage::render_target,
                reshade::api::resource_view_desc(
                        reshade::api::resource_view_type::texture_2d,
                        reshade::api::format_to_default_typed(desc.texture.format),
                        0u,
                        1u,
                        0u,
                        1u),
                &view);
        data->swapchain_rtvs.push_back(view);
    }
}

void OnDestroySwapchain(reshade::api::swapchain* swapchain, bool resize) {
    auto* device = swapchain->get_device();
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
    if (data != nullptr) {
        const std::lock_guard lock(data->mutex);
        for (const auto view : data->swapchain_rtvs) {
            if (view.handle != 0u) device->destroy_resource_view(view);
        }
        data->swapchain_rtvs.clear();
    }
    if (tracked_swapchain == swapchain) {
        tracked_swapchain = nullptr;
    }
}

void OnInitCommandList(reshade::api::command_list* cmd_list) {
    if (cmd_list->get_device()->get_api() != reshade::api::device_api::d3d12) return;
    renodx::utils::data::Create<EffectInsertionCommandListData>(cmd_list);
}

void OnDestroyCommandList(reshade::api::command_list* cmd_list) {
    if (cmd_list->get_device()->get_api() != reshade::api::device_api::d3d12) return;
    renodx::utils::data::Delete<EffectInsertionCommandListData>(cmd_list);
}

void OnResetCommandList(reshade::api::command_list* cmd_list) {
    auto* data = renodx::utils::data::Get<EffectInsertionCommandListData>(cmd_list);
    if (data == nullptr) return;

    const std::lock_guard lock(data->mutex);
    data->automatic_candidate_revision = 0u;
    data->automatic_candidate_shader_hash = 0u;
    data->automatic_candidate_vertex_shader_hash = 0u;
    data->automatic_candidate_pipeline_layout = {0u};
}

void OnExecuteCommandList(
        reshade::api::command_queue* queue,
        reshade::api::command_list* cmd_list) {
    if (queue->get_device()->get_api() != reshade::api::device_api::d3d12) return;

    EffectInsertionMode mode = EffectInsertionMode::automatic;
    {
        const std::lock_guard lock(active_effect_insertion_rule_mutex);
        mode = active_effect_insertion_mode;
    }
    if (mode != EffectInsertionMode::automatic) return;

    auto* command_list_data = renodx::utils::data::Get<EffectInsertionCommandListData>(cmd_list);
    if (command_list_data == nullptr) return;

    uint64_t candidate_revision = 0u;
    uint32_t candidate_shader_hash = 0u;
    uint32_t candidate_vertex_shader_hash = 0u;
    reshade::api::pipeline_layout candidate_pipeline_layout = {0u};
    {
        const std::lock_guard lock(command_list_data->mutex);
        candidate_revision = command_list_data->automatic_candidate_revision;
        candidate_shader_hash = command_list_data->automatic_candidate_shader_hash;
        candidate_vertex_shader_hash = command_list_data->automatic_candidate_vertex_shader_hash;
        candidate_pipeline_layout = command_list_data->automatic_candidate_pipeline_layout;
    }
    if (candidate_shader_hash == 0u
            || candidate_revision != active_effect_insertion_rule_revision.load()) {
        return;
    }

    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(queue->get_device());
    if (data == nullptr) return;

    bool selected = false;
    {
        const std::lock_guard lock(data->mutex);
        if (data->rule_revision == candidate_revision && data->automatic_shader_hash == 0u) {
            data->automatic_shader_hash = candidate_shader_hash;
            data->automatic_vertex_shader_hash = candidate_vertex_shader_hash;
            data->automatic_pipeline_layout = candidate_pipeline_layout;
            data->automatic_shader_missed_frames = 0u;
            selected = true;
        }
    }
    if (selected) {
        reshade::log::message(
                reshade::log::level::info,
                std::format(
                    "Pipeline insert automatic selected DX12 pass PS 0x{:08X}, VS 0x{:08X}, layout 0x{:X} from submission order.",
                    candidate_shader_hash,
                    candidate_vertex_shader_hash,
                    candidate_pipeline_layout.handle)
                        .c_str());
    }
}

void OnInitDevice(reshade::api::device* device) {
    if (device->get_api() != reshade::api::device_api::d3d11
            && device->get_api() != reshade::api::device_api::d3d12) {
        return;
    }
    renodx::utils::data::Create<EffectInsertionDeviceData>(device);
}

void OnDestroyDevice(reshade::api::device* device) {
    auto* capture_device = device;
    effect_insertion_capture_device.compare_exchange_strong(capture_device, nullptr);
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
    if (data == nullptr) return;
    {
        const std::lock_guard lock(data->mutex);
        for (const auto& preview_srv : data->preview_srvs) {
            if (preview_srv.second.view.handle != 0u) {
                device->destroy_resource_view(preview_srv.second.view);
            }
        }
        data->preview_srvs.clear();
    }
    renodx::utils::data::Delete(device, data);
}

void OnDestroyResource(reshade::api::device* device, reshade::api::resource resource) {
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
    if (data == nullptr) return;

    const std::lock_guard lock(data->mutex);
    for (auto pair = data->preview_srvs.begin(); pair != data->preview_srvs.end();) {
        if (pair->second.resource.handle != resource.handle) {
            ++pair;
            continue;
        }
        if (pair->second.view.handle != 0u) {
            device->destroy_resource_view(pair->second.view);
        }
        pair = data->preview_srvs.erase(pair);
    }
}

void OnReshadeOverlay(reshade::api::effect_runtime* runtime) {
    if (runtime == nullptr) return;

    auto* device = runtime->get_device();
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(device);
    if (data == nullptr) return;

    reshade::api::resource_view render_target = {0u};
    bool insertion_rendered = false;
    {
        const std::lock_guard lock(data->mutex);
        const uint32_t index = runtime->get_current_back_buffer_index();
        if (index >= data->swapchain_rtvs.size()) return;
        insertion_rendered = data->final_effects_pending;
        if (insertion_rendered) data->final_effects_pending = false;
        render_target = data->swapchain_rtvs[index];
    }
    if (render_target.handle == 0u) return;

    EffectInsertionMode mode = EffectInsertionMode::automatic;
    std::vector<EffectInsertionTechnique> inserted_techniques;
    {
        const std::lock_guard lock(active_effect_insertion_rule_mutex);
        mode = active_effect_insertion_mode;
        inserted_techniques = active_effect_insertion_techniques;
    }
    const bool render_automatic_fallback =
            mode == EffectInsertionMode::automatic && !insertion_rendered;
    if (!insertion_rendered && !render_automatic_fallback) return;

    std::vector<reshade::api::effect_technique> techniques_to_render;
    const std::lock_guard runtime_lock(data->effect_runtime_mutex);
    runtime->enumerate_techniques(
            nullptr,
            [&techniques_to_render, &inserted_techniques, insertion_rendered](
                    reshade::api::effect_runtime* effect_runtime,
                    reshade::api::effect_technique handle) {
                const EffectInsertionTechnique identifier = {
                        .effect_name = GetEffectTechniqueEffectName(effect_runtime, handle),
                        .technique_name = GetEffectTechniqueName(effect_runtime, handle),
                };
                const bool inserted = std::ranges::any_of(
                        inserted_techniques,
                        [&identifier](const EffectInsertionTechnique& configured) {
                            return configured == identifier
                                   || IsLegacyTruncatedTechnique(configured, identifier);
                        });
                if (insertion_rendered) {
                    if (effect_runtime->get_technique_state(handle) && !inserted) {
                        techniques_to_render.push_back(handle);
                    }
                } else if (inserted && !effect_runtime->get_technique_state(handle)) {
                    // Enabled techniques already ran through ReShade's normal
                    // end-of-frame pass. Explicitly render disabled selected
                    // techniques when no mid-frame insertion completed.
                    techniques_to_render.push_back(handle);
                }
            });
    if (techniques_to_render.empty()) return;

    auto* cmd_list = runtime->get_command_queue()->get_immediate_command_list();
    if (cmd_list == nullptr) return;
    const bool needs_barriers = device->get_api() == reshade::api::device_api::d3d12;
    const auto resource = runtime->get_current_back_buffer();
    if (needs_barriers) {
        const auto state_present = reshade::api::resource_usage::present;
        const auto state_render_target = reshade::api::resource_usage::render_target;
        cmd_list->barrier(1u, &resource, &state_present, &state_render_target);
    }

    struct EffectRenderingScope {
        EffectRenderingScope() { is_rendering_inserted_effects = true; }
        ~EffectRenderingScope() { is_rendering_inserted_effects = false; }
    } effect_rendering_scope;
    for (const auto technique : techniques_to_render) {
        runtime->render_technique(technique, cmd_list, render_target, render_target);
    }

    if (needs_barriers) {
        const auto state_render_target = reshade::api::resource_usage::render_target;
        const auto state_present = reshade::api::resource_usage::present;
        cmd_list->barrier(1u, &resource, &state_render_target, &state_present);
    }
}

void OnPresent(
        reshade::api::command_queue* queue,
        reshade::api::swapchain* swapchain,
        const reshade::api::rect* source_rect,
        const reshade::api::rect* dest_rect,
        uint32_t dirty_rect_count,
        const reshade::api::rect* dirty_rects) {
    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(swapchain->get_device());
    if (data == nullptr) return;

    if (swapchain->get_device()->get_api() == reshade::api::device_api::d3d12) {
        bool acquire_effect_runtime_lock = false;
        {
            const std::lock_guard lock(data->mutex);
            if (!data->effect_runtime_present_lock_held) {
                data->effect_runtime_present_lock_held = true;
                acquire_effect_runtime_lock = true;
            }
        }
        if (acquire_effect_runtime_lock) {
            data->effect_runtime_mutex.lock();
        }
    }

    bool sample_automatic_insertion = false;
    {
        const std::lock_guard lock(active_effect_insertion_rule_mutex);
        sample_automatic_insertion = active_effect_insertion_mode == EffectInsertionMode::automatic
                                     && !active_effect_insertion_techniques.empty();
    }
    const std::lock_guard lock(data->mutex);
    if (sample_automatic_insertion && data->automatic_shader_hash != 0u) {
        if (data->rendered) {
            data->automatic_shader_missed_frames = 0u;
        } else if (++data->automatic_shader_missed_frames == 8u) {
            reshade::log::message(
                    reshade::log::level::info,
                    std::format(
                            "Pipeline insert automatic released pixel shader 0x{:08X} after 8 missed frames.",
                            data->automatic_shader_hash)
                            .c_str());
            data->automatic_shader_hash = 0u;
            data->automatic_vertex_shader_hash = 0u;
            data->automatic_pipeline_layout = {0u};
            data->automatic_shader_missed_frames = 0u;
        }
    }
    if (sample_automatic_insertion
            && ++data->automatic_sample_frame_count == 120u) {
        reshade::log::message(
                reshade::log::level::info,
                std::format(
                        "Pipeline insert automatic sample: {} match(es), {} render(s) across 120 presented frames.",
                        data->automatic_match_count,
                        data->rendered_technique_count)
                        .c_str());
        data->automatic_match_count = 0u;
        data->rendered_technique_count = 0u;
        data->automatic_sample_frame_count = 0u;
    }
    std::ranges::fill(data->occurrences, 0u);
    data->rendered = false;
    if (data->capturing) {
        effect_insertion_capture_device = nullptr;
        std::unordered_map<uint32_t, size_t> last_draw_index_by_shader_hash;
        for (size_t draw_index = 0u; draw_index < data->working_draws.size(); ++draw_index) {
            last_draw_index_by_shader_hash[data->working_draws[draw_index].shader_hash] = draw_index;
        }
        std::vector<EffectInsertionDraw> last_draws;
        last_draws.reserve(last_draw_index_by_shader_hash.size());
        for (size_t draw_index = 0u; draw_index < data->working_draws.size(); ++draw_index) {
            auto& draw = data->working_draws[draw_index];
            if (last_draw_index_by_shader_hash[draw.shader_hash] == draw_index) {
                last_draws.push_back(std::move(draw));
            }
        }
        data->captured_draws = std::move(last_draws);
        data->captured_frame_truncated = data->working_capture_truncated;
        data->working_draws.clear();
        data->capture_occurrences.clear();
        data->capturing = false;
    } else if (data->capture_requested) {
        data->capture_requested = false;
        data->capturing = true;
        data->working_capture_truncated = false;
        data->capture_draw_index = 0u;
        data->working_draws.clear();
        data->capture_occurrences.clear();
        effect_insertion_capture_device = swapchain->get_device();
    }
}

void OnFinishPresent(
        reshade::api::command_queue* queue,
        reshade::api::swapchain* swapchain) {
    if (swapchain->get_device()->get_api() != reshade::api::device_api::d3d12) return;

    auto* data = renodx::utils::data::Get<EffectInsertionDeviceData>(swapchain->get_device());
    if (data == nullptr) return;

    bool release_effect_runtime_lock = false;
    {
        const std::lock_guard lock(data->mutex);
        if (data->effect_runtime_present_lock_held) {
            data->effect_runtime_present_lock_held = false;
            release_effect_runtime_lock = true;
        }
    }
    if (release_effect_runtime_lock) {
        data->effect_runtime_mutex.unlock();
    }
}

void ConfigureSwapchain() {
  renodx::mods::swapchain::use_resource_cloning = true;
  renodx::mods::swapchain::use_resize_buffer = false;
    // The compatibility path copies the scRGB back buffer to a temporary clone
    // before drawing it back. That copy-back sequence is not reliable for the
    // generic D3D12 upgrade path, so use the normal clone redirection instead.
    renodx::mods::swapchain::swapchain_proxy_compatibility_mode = false;
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
            .default_value = 0.f,
      .label = "Output Format",
      .section = "Swapchain Upgrade",
    .tooltip = "Selects the upgraded swapchain format and color space. None leaves the game's swapchain unchanged.",
        .labels = {"None", "scRGB (RGBA16F)", "HDR10 (RGB10A2)"},
  });
  renodx::mods::swapchain::use_swapchain_upgrade = output_setting->GetValue() != 0.f;
  renodx::mods::swapchain::SetUseHDR10(output_setting->GetValue() == 2.f);
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
    auto* resource_cloning_setting = AddGlobalSetting(new Setting{
            .key = "UseResourceCloning",
            .value_type = SettingValueType::BOOLEAN,
            .default_value = 1.f,
            .label = "Use Resource Cloning",
            .section = "Resource Upgrades",
            .tooltip = "Creates upgraded resource clones and redirects resource views to them. Disable to upgrade matching resources directly during creation, which may reduce overhead but can be less compatible.",
    });
    const bool use_resource_cloning = resource_cloning_setting->GetValue() == 1.f;

    auto* copy_destinations_setting = AddGlobalSetting(new Setting{
        .key = "Upgrade_CopyDestinations",
        .value_type = SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .label = "Upgrade Copy Destinations",
        .section = "Resource Upgrades",
        .tooltip = "Also upgrades matching copy-destination-only textures so extended values survive resource copies.",
    });
    const auto usage_include = static_cast<reshade::api::resource_usage>(
        static_cast<uint32_t>(reshade::api::resource_usage::render_target)
        | (copy_destinations_setting->GetValue() == 1.f
               ? static_cast<uint32_t>(reshade::api::resource_usage::copy_dest)
               : 0u));

  for (const auto& [name, format] : UPGRADE_TARGETS) {
    auto* setting = AddGlobalSetting(new Setting{
        .key = std::string("Upgrade_") + name,
        .value_type = SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = name,
        .section = "Resource Upgrades",
                .tooltip = "Upgrades matching render targets to RGBA16F using the selected resource upgrade strategy.",
        .labels = {"Off", "Output Size", "Output Aspect Ratio", "Any Size"},
    });

    const float value = setting->GetValue();
    if (value <= 0.f) continue;

    renodx::mods::swapchain::resource_upgrade_infos.push_back({
        .old_format = format,
        .new_format = reshade::api::format::r16g16b16a16_float,
        .ignore_size = value == UPGRADE_TYPE_ANY_SIZE,
        .use_resource_view_cloning = use_resource_cloning,
        .aspect_ratio = static_cast<float>(
            value == UPGRADE_TYPE_OUTPUT_RATIO
                ? renodx::mods::swapchain::ResourceUpgradeInfo::BACK_BUFFER
                : renodx::mods::swapchain::ResourceUpgradeInfo::ANY),
        .usage_include = usage_include,
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
    ConfigureEffectInsertionFeature();
  ConfigureSwapchain();
  ConfigureDeviceProxy();
  ConfigureResourceUpgrades();
    ConfigureFPSLimiter();
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX Upgrade";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION =
    "Generic resource and swapchain upgrade utility with frame limiter and ReShade insert point";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD reason, LPVOID reserved) {
  switch (reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      if (!initialized) {
        Initialize();
        initialized = true;
      }

        renodx::utils::settings::Use(reason, &settings);
                if (effect_insertion_enabled) {
                    reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);
                    reshade::register_event<reshade::addon_event::destroy_device>(OnDestroyDevice);
                    reshade::register_event<reshade::addon_event::init_command_list>(OnInitCommandList);
                    reshade::register_event<reshade::addon_event::destroy_command_list>(OnDestroyCommandList);
                    reshade::register_event<reshade::addon_event::reset_command_list>(OnResetCommandList);
                    reshade::register_event<reshade::addon_event::execute_command_list>(OnExecuteCommandList);
                    reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
                    reshade::register_event<reshade::addon_event::destroy_swapchain>(OnDestroySwapchain);
                    reshade::register_event<reshade::addon_event::present>(OnPresent);
                    reshade::register_event<reshade::addon_event::finish_present>(OnFinishPresent);
                    reshade::register_event<reshade::addon_event::destroy_resource>(OnDestroyResource);
                    reshade::register_event<reshade::addon_event::reshade_overlay>(OnReshadeOverlay);
                    reshade::register_overlay("RenoDX Pipeline Insert", OnRegisterPipelineInsertOverlay);

                    renodx::utils::descriptor::trace_descriptor_tables = true;
                    renodx::utils::descriptor::Use(reason);
                    renodx::utils::pipeline_layout::Use(reason);
                    renodx::utils::shader::Use(reason);
                    renodx::utils::state::Use(reason);
                    renodx::utils::command_action::Use(reason);
                }
        renodx::mods::swapchain::Use(reason);
      break;
    case DLL_PROCESS_DETACH:
        renodx::mods::swapchain::Use(reason);
                if (effect_insertion_enabled) {
                    reshade::unregister_overlay("RenoDX Pipeline Insert", OnRegisterPipelineInsertOverlay);
                    reshade::unregister_event<reshade::addon_event::reshade_overlay>(OnReshadeOverlay);
                    reshade::unregister_event<reshade::addon_event::destroy_resource>(OnDestroyResource);
                    reshade::unregister_event<reshade::addon_event::finish_present>(OnFinishPresent);
                    reshade::unregister_event<reshade::addon_event::present>(OnPresent);
                    reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
                    reshade::unregister_event<reshade::addon_event::destroy_swapchain>(OnDestroySwapchain);
                    reshade::unregister_event<reshade::addon_event::execute_command_list>(OnExecuteCommandList);
                    reshade::unregister_event<reshade::addon_event::reset_command_list>(OnResetCommandList);
                    reshade::unregister_event<reshade::addon_event::destroy_command_list>(OnDestroyCommandList);
                    reshade::unregister_event<reshade::addon_event::init_command_list>(OnInitCommandList);
                    reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
                    reshade::unregister_event<reshade::addon_event::destroy_device>(OnDestroyDevice);

                    renodx::utils::command_action::Unregister(EffectInsertionCallback{});
                    renodx::utils::command_action::Unregister(EffectInsertionDrawCaptureCallback{});
                    renodx::utils::command_action::Use(reason);
                    renodx::utils::state::Use(reason);
                    renodx::utils::shader::Use(reason);
                    renodx::utils::pipeline_layout::Use(reason);
                    renodx::utils::descriptor::Use(reason);
                }
        renodx::utils::settings::Use(reason, &settings);
      reshade::unregister_addon(h_module);
      break;
  }

  return TRUE;
}