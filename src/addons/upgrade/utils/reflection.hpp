/*
 * Copyright (C) 2026 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#pragma once

#include <charconv>
#include <cstdint>
#include <regex>
#include <string_view>
#include <unordered_map>
#include <vector>

namespace renodx::addons::upgrade::utils::reflection {

struct SrvBinding {
    uint32_t slot = 0u;
    uint32_t space = 0u;

    bool operator==(const SrvBinding&) const = default;
};

namespace internal {

inline std::string_view Trim(std::string_view value) {
    const auto first = value.find_first_not_of(" \t\r");
    if (first == std::string_view::npos) return {};
    return value.substr(first, value.find_last_not_of(" \t\r") - first + 1u);
}

inline std::vector<std::string_view> SplitMetadataValues(std::string_view value) {
    std::vector<std::string_view> values;
    size_t start = 0u;
    bool quoted = false;
    for (size_t index = 0u; index <= value.size(); ++index) {
        if (index < value.size() && value[index] == '"') quoted = !quoted;
        if (index != value.size() && (value[index] != ',' || quoted)) continue;
        values.push_back(Trim(value.substr(start, index - start)));
        start = index + 1u;
    }
    return values;
}

inline bool ParseI32(std::string_view value, uint32_t& result) {
    value = Trim(value);
    if (!value.starts_with("i32 ")) return false;
    value.remove_prefix(4u);
    const auto conversion = std::from_chars(value.data(), value.data() + value.size(), result);
    return conversion.ec == std::errc() && conversion.ptr == value.data() + value.size();
}

}  // namespace internal

inline std::vector<SrvBinding> ParseDxilSrvBindings(std::string_view disassembly) {
    std::unordered_map<std::string_view, std::vector<std::string_view>> metadata;
    for (size_t start = 0u; start < disassembly.size();) {
        const size_t end = disassembly.find('\n', start);
        const auto line = internal::Trim(disassembly.substr(
            start, end == std::string_view::npos ? disassembly.size() - start : end - start));
        start = end == std::string_view::npos ? disassembly.size() : end + 1u;
        if (!line.starts_with('!')) continue;

        const size_t separator = line.find(" = !{");
        if (separator == std::string_view::npos || !line.ends_with('}')) continue;
        metadata[line.substr(0u, separator)] = internal::SplitMetadataValues(
            line.substr(separator + 5u, line.size() - separator - 6u));
    }

    std::vector<SrvBinding> bindings;
    const auto resources_it = metadata.find("!dx.resources");
    if (resources_it == metadata.end() || resources_it->second.empty()) return bindings;
    const auto resource_lists_it = metadata.find(resources_it->second.front());
    if (resource_lists_it == metadata.end() || resource_lists_it->second.empty()) return bindings;
    const auto srv_list_key = resource_lists_it->second.front();
    if (srv_list_key == "null") return bindings;
    const auto srv_list_it = metadata.find(srv_list_key);
    if (srv_list_it == metadata.end()) return bindings;

    for (const auto srv_key : srv_list_it->second) {
        const auto srv_it = metadata.find(srv_key);
        if (srv_it == metadata.end() || srv_it->second.size() < 5u) continue;
        SrvBinding binding;
        if (internal::ParseI32(srv_it->second[3], binding.space)
            && internal::ParseI32(srv_it->second[4], binding.slot)) {
            bindings.push_back(binding);
        }
    }
    return bindings;
}

inline std::vector<SrvBinding> ParseDxbcSrvBindings(std::string_view disassembly) {
    std::vector<SrvBinding> bindings;
    static const std::regex declaration_regex(
            R"(^.*dcl_(?:resource_\S+|uav_\S+|constantbuffer) (?:\([^)]+\) )?(T|t|U|u|cb|CB)(\d+)(?:\.x?y?z?w?)?(?:\[[^[]+\])?(?:, \d+)?(?:, space=(\d+))?.*$)");
    for (size_t start = 0u; start < disassembly.size();) {
        const size_t end = disassembly.find('\n', start);
        const auto line = internal::Trim(disassembly.substr(
                start, end == std::string_view::npos ? disassembly.size() - start : end - start));
        start = end == std::string_view::npos ? disassembly.size() : end + 1u;

        std::match_results<std::string_view::const_iterator> match;
        if (!std::regex_match(line.begin(), line.end(), match, declaration_regex)
                || (match[1].str() != "T" && match[1].str() != "t")) {
            continue;
        }
        SrvBinding binding;
        const auto slot = match[2].str();
        const auto slot_result = std::from_chars(
                slot.data(), slot.data() + slot.size(), binding.slot);
        if (slot_result.ec != std::errc()) continue;
        const auto space = match[3].str();
        if (!space.empty()) {
            const auto space_result = std::from_chars(
                    space.data(), space.data() + space.size(), binding.space);
            if (space_result.ec != std::errc()) continue;
        }
        bindings.push_back(binding);
    }
    return bindings;
}

}  // namespace renodx::addons::upgrade::utils::reflection