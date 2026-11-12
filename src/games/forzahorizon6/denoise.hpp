/*
 * Copyright (C) 2026 Carlos Lopez, speedlemur
 * SPDX-License-Identifier: MIT
 *
 * forzahorizon6-rr: RTGI denoiser replacements.
 *
 * On Medium and High RTGI, replaces the denoising stages so DLSS-RR receives
 * the current-frame ray signal. The High RTGI pointwise resolve is also
 * replaced with an equivalent implementation.
 *
 * The swap is a live, per-device runtime replacement on the bind-time
 * replacement path (renodx utility shader framework), so a toggle applies
 * within a frame; the game's pipelines are never modified.
 */

#pragma once

#include <windows.h>

#include <atomic>
#include <cstdint>
#include <span>

#include <include/reshade.hpp>
#include <embed/shaders.h>

#include "../../utils/shader.hpp"

namespace denoise {

inline constexpr uint32_t kSpatialFilterDiskHash = 0x480011D5;
inline constexpr uint32_t kTemporalFilterHighHash = 0xAF4E3D44;
inline constexpr uint32_t kResolveHighHash = 0x019CE131;
inline constexpr uint32_t kTemporalFilterMediumHash = 0x95FA8898;
inline constexpr uint32_t kUpscale2xMediumHash = 0x4067B14C;

struct Replacement {
  uint32_t hash;
  std::span<const uint8_t> data;
};

struct BypassEntry {
  std::span<const Replacement> replacements;
  std::atomic<bool> enabled{false};
  std::atomic<bool> applied{false};
};

inline const Replacement kSpatialFilterDiskReplacements[] = {
    {kSpatialFilterDiskHash, __0x480011D5},
};
inline const Replacement kTemporalFilterHighReplacements[] = {
    {kTemporalFilterHighHash, __0xAF4E3D44},
};
inline const Replacement kResolveHighReplacements[] = {
    {kResolveHighHash, __0x019CE131},
};
inline const Replacement kTemporalFilterMediumReplacements[] = {
    {kTemporalFilterMediumHash, __0x95FA8898},
};
inline const Replacement kUpscale2xMediumReplacements[] = {
    {kUpscale2xMediumHash, __0x4067B14C},
};
inline BypassEntry bypasses[5] = {
    {kSpatialFilterDiskReplacements},
    {kTemporalFilterHighReplacements},
    {kTemporalFilterMediumReplacements},
    {kUpscale2xMediumReplacements},
    {kResolveHighReplacements},
};

inline std::atomic<reshade::api::device*> current_device = nullptr;

inline void ApplyToDevice() {
  reshade::api::device* device = current_device.load();
  if (device == nullptr) {
    for (BypassEntry& entry : bypasses) entry.applied.store(false);
    return;
  }
  for (BypassEntry& entry : bypasses) {
    const bool enabled = entry.enabled.load();
    if (entry.applied.load() == enabled) continue;
    for (const Replacement& replacement : entry.replacements) {
      renodx::utils::shader::RemoveRuntimeReplacements(device, {replacement.hash});
    }
    if (enabled) {
      for (const Replacement& replacement : entry.replacements) {
        renodx::utils::shader::AddRuntimeReplacement(device, replacement.hash, replacement.data);
      }
    }
    entry.applied.store(enabled);
  }
}

inline void SetEnabled(uint32_t hash, bool enabled) {
  for (BypassEntry& entry : bypasses) {
    for (const Replacement& replacement : entry.replacements) {
      if (replacement.hash == hash) entry.enabled.store(enabled);
    }
  }
  ApplyToDevice();
}

inline void OnInitDevice(reshade::api::device* device) {
  int vendor_id = 0;
  if (!device->get_property(reshade::api::device_properties::vendor_id, &vendor_id)
      || vendor_id != 0x10DE) {
    return;
  }
  current_device.store(device);
  ApplyToDevice();
}

inline void OnDestroyDevice(reshade::api::device* device) {
  if (current_device.load() == device) {
    current_device.store(nullptr);
    for (BypassEntry& entry : bypasses) entry.applied.store(false);
  }
}

inline void Use(DWORD fdw_reason) {
  renodx::utils::shader::Use(fdw_reason);
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::register_event<reshade::addon_event::destroy_device>(OnDestroyDevice);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::unregister_event<reshade::addon_event::destroy_device>(OnDestroyDevice);
      break;
  }
}

}  // namespace denoise
