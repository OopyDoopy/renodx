/*
 * Copyright (C) 2026 Carlos Lopez, speedlemur
 * SPDX-License-Identifier: MIT
 *
 * forzahorizon6-rr: DLSSD.ResponsivityMask injection.
 *
 * DLSS Ray Reconstruction's temporal response has no control in Streamline's
 * DLSSDOptions, so it cannot be reached through the API this mod otherwise
 * uses. It exists one layer down, as an NGX parameter: DLSSD.ResponsivityMask,
 * an optional R8_SNORM texture at render resolution holding one constant value,
 * signed [-1, 1]. On preset F negative values favour stability (more history)
 * and positive values favour responsiveness (more current frame); zero omits
 * the texture entirely, which is not the same as a zero-valued mask.
 *
 * Streamline's DLSSD plugin calls the NGX D3D12 entry points, so detouring them
 * catches its calls exactly as it catches a game's. The parameter is written on
 * the parameter object the caller passes, before forwarding. This is the same
 * mechanism the sibling control-rr mod uses to expose the control.
 *
 * Nothing here touches the signal: no clamping, no filtering, no change to the
 * ray-traced data. It only changes how much history RR may blend, which is what
 * lets a 1 spp firefly average out over frames instead of staying on screen.
 */

#pragma once

#include <windows.h>
#include <d3d12.h>

#include <detours.h>

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdint>
#include <mutex>
#include <string>

#include <nvsdk_ngx.h>
#include <nvsdk_ngx_defs.h>

namespace responsivity {

using PFN_NGX_EvaluateFeature = NVSDK_NGX_Result(NVSDK_CONV*)(
    ID3D12GraphicsCommandList*, const NVSDK_NGX_Handle*, const NVSDK_NGX_Parameter*,
    PFN_NVSDK_NGX_ProgressCallback);

inline std::mutex arm_mutex;
inline std::atomic<bool> armed{false};
inline std::atomic<bool> enabled{true};
// 0 = omit the mask entirely (RR's own default). Negative = more stable.
inline std::atomic<float> value{0.f};

// Speed-relative mode. When on, the value above is driven by measured camera
// motion instead of the manual slider: still means maximum stability (more
// history, which is where the fireflies are worst) and movement means
// responsiveness (which is where ghosting would otherwise appear). The two
// requirements never conflict, so the mask can serve both.
inline std::atomic<bool> auto_enabled{false};
inline constexpr float kAutoStill = -0.5f;
inline constexpr float kAutoMoving = 0.5f;

inline void SetAuto(bool on) { auto_enabled.store(on); }
inline bool GetAuto() { return auto_enabled.load(); }

// Live values for the on-screen readout.
inline std::atomic<float> last_motion{0.f};
inline float GetValue() { return value.load(); }
inline float GetMotion() { return last_motion.load(); }

// Motion is normalised by the caller so 1.0 is "fully moving". Called once per
// frame with the camera's motion for that frame.
inline void UpdateMotion(float motion) {
  last_motion.store(motion);
  if (!auto_enabled.load()) return;
  const float t = std::clamp(motion, 0.f, 1.f);
  value.store(kAutoStill + (kAutoMoving - kAutoStill) * (t * t * (3.f - 2.f * t)));
}
inline PFN_NGX_EvaluateFeature real_evaluate_feature = nullptr;

// One constant-value R8_SNORM mask. The upload buffer is created once and left
// persistently mapped, so a refill costs a memset plus the copy, with no
// per-refill Map/Unmap.
inline std::mutex mask_mutex;
inline ID3D12Resource* mask_texture = nullptr;
inline ID3D12Resource* mask_upload = nullptr;
inline void* mask_upload_mapped = nullptr;
inline uint32_t mask_width = 0;
inline uint32_t mask_height = 0;
inline bool mask_filled = false;
// The value the texture actually holds, not the live value: the rebuild test
// below compares against this, so a slow drift accumulates and eventually lands.
inline float mask_filled_value = 0.f;

// A refill lands only once the value has moved this many SNORM8 steps from what
// the texture holds (254 steps span the full -1..1 range). In speed-relative
// mode the value is recomputed every frame, so without a deadband a
// whole-texture memset, copy and barrier pair would run almost every frame; a
// few steps of lag is below what the control can express.
inline constexpr int kRebuildDeadbandSnorm = 8;

inline void Log(const std::string& message) {
  reshade::log::message(reshade::log::level::info, ("responsivity: " + message).c_str());
}

inline void LogWarn(const std::string& message) {
  reshade::log::message(reshade::log::level::warning, ("responsivity: " + message).c_str());
}

// Frees the mask and its staging buffer. The upload buffer is persistently
// mapped, so it is unmapped before release. Caller must hold mask_mutex.
inline void ReleaseMaskResources() {
  if (mask_upload_mapped != nullptr) {
    mask_upload->Unmap(0, nullptr);
    mask_upload_mapped = nullptr;
  }
  if (mask_texture != nullptr) {
    mask_texture->Release();
    mask_texture = nullptr;
  }
  if (mask_upload != nullptr) {
    mask_upload->Release();
    mask_upload = nullptr;
  }
  mask_filled = false;
}

// Creates (or resizes) the mask and fills it with one SNORM8 value. The fill is
// a CopyTextureRegion from a memset upload buffer: no descriptors, no shader.
// Caller must hold mask_mutex.
inline bool EnsureMask(
    ID3D12Device* device, ID3D12GraphicsCommandList* cmd_list, uint32_t width, uint32_t height,
    float target) {
  if (device == nullptr || cmd_list == nullptr || width == 0u || height == 0u) return false;

  if (mask_texture != nullptr && (mask_width != width || mask_height != height)) {
    ReleaseMaskResources();
  }

  if (mask_texture == nullptr) {
    constexpr uint32_t kPitchAlign = 256;  // D3D12_TEXTURE_DATA_PITCH_ALIGNMENT
    const uint32_t pitch = (width + kPitchAlign - 1u) / kPitchAlign * kPitchAlign;

    D3D12_HEAP_PROPERTIES default_heap{};
    default_heap.Type = D3D12_HEAP_TYPE_DEFAULT;
    D3D12_RESOURCE_DESC desc{};
    desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
    desc.Width = width;
    desc.Height = height;
    desc.DepthOrArraySize = 1;
    desc.MipLevels = 1;
    desc.Format = DXGI_FORMAT_R8_SNORM;
    desc.SampleDesc.Count = 1;
    if (FAILED(device->CreateCommittedResource(
            &default_heap, D3D12_HEAP_FLAG_NONE, &desc, D3D12_RESOURCE_STATE_COPY_DEST, nullptr,
            IID_PPV_ARGS(&mask_texture)))) {
      mask_texture = nullptr;
      LogWarn("mask texture creation failed");
      return false;
    }

    D3D12_HEAP_PROPERTIES upload_heap{};
    upload_heap.Type = D3D12_HEAP_TYPE_UPLOAD;
    D3D12_RESOURCE_DESC buffer{};
    buffer.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER;
    buffer.Width = static_cast<uint64_t>(pitch) * height;
    buffer.Height = 1;
    buffer.DepthOrArraySize = 1;
    buffer.MipLevels = 1;
    buffer.Format = DXGI_FORMAT_UNKNOWN;
    buffer.SampleDesc.Count = 1;
    buffer.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR;
    if (FAILED(device->CreateCommittedResource(
            &upload_heap, D3D12_HEAP_FLAG_NONE, &buffer, D3D12_RESOURCE_STATE_GENERIC_READ, nullptr,
            IID_PPV_ARGS(&mask_upload)))) {
      mask_upload = nullptr;
      mask_texture->Release();
      mask_texture = nullptr;
      LogWarn("mask upload buffer creation failed");
      return false;
    }

    // Persistently mapped: every refill rewrites the whole buffer, so mapping it
    // once keeps Map/Unmap off the per-refill path.
    const D3D12_RANGE read_range{0, 0};
    if (FAILED(mask_upload->Map(0, &read_range, &mask_upload_mapped))
        || mask_upload_mapped == nullptr) {
      mask_upload->Release();
      mask_upload = nullptr;
      mask_texture->Release();
      mask_texture = nullptr;
      LogWarn("mask upload map failed");
      return false;
    }

    mask_width = width;
    mask_height = height;
    mask_filled = false;
    Log("mask created " + std::to_string(width) + "x" + std::to_string(height));
  }

  // SNORM8: value * 127. -1 encodes as -127 (and -128 also reads as -1). The
  // value stays continuous; only the rebuild is quantised, by the deadband
  // against the last filled value, and the buffer is already mapped.
  const int snorm = static_cast<int>(std::lround(std::clamp(target, -1.f, 1.f) * 127.f));
  const int delta = snorm - static_cast<int>(std::lround(mask_filled_value * 127.f));
  if (mask_filled && delta <= kRebuildDeadbandSnorm && delta >= -kRebuildDeadbandSnorm) {
    return true;
  }
  memset(mask_upload_mapped, static_cast<uint8_t>(static_cast<int8_t>(snorm)),
         static_cast<size_t>(mask_upload->GetDesc().Width));

  D3D12_TEXTURE_COPY_LOCATION source{};
  source.pResource = mask_upload;
  source.Type = D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT;
  source.PlacedFootprint.Footprint.Format = DXGI_FORMAT_R8_SNORM;
  source.PlacedFootprint.Footprint.Width = mask_width;
  source.PlacedFootprint.Footprint.Height = mask_height;
  source.PlacedFootprint.Footprint.Depth = 1;
  source.PlacedFootprint.Footprint.RowPitch = mask_upload->GetDesc().Width / mask_height;

  D3D12_TEXTURE_COPY_LOCATION destination{};
  destination.pResource = mask_texture;
  destination.Type = D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX;
  destination.SubresourceIndex = 0;

  D3D12_RESOURCE_BARRIER to_copy{};
  to_copy.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
  to_copy.Transition.pResource = mask_texture;
  to_copy.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES;
  to_copy.Transition.StateBefore = D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE;
  to_copy.Transition.StateAfter = D3D12_RESOURCE_STATE_COPY_DEST;
  if (mask_filled) cmd_list->ResourceBarrier(1, &to_copy);

  cmd_list->CopyTextureRegion(&destination, 0, 0, 0, &source, nullptr);

  D3D12_RESOURCE_BARRIER to_srv{};
  to_srv.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
  to_srv.Transition.pResource = mask_texture;
  to_srv.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES;
  to_srv.Transition.StateBefore = D3D12_RESOURCE_STATE_COPY_DEST;
  to_srv.Transition.StateAfter = D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE;
  cmd_list->ResourceBarrier(1, &to_srv);

  mask_filled = true;
  mask_filled_value = target;
  return true;
}

// Writes the parameter on the caller's parameter object before forwarding. The
// object persists across frames, so it is written every call: that is what
// clears it back to "not sent" when the value returns to zero.
inline NVSDK_NGX_Result NVSDK_CONV HookedEvaluateFeature(
    ID3D12GraphicsCommandList* cmd_list, const NVSDK_NGX_Handle* handle,
    const NVSDK_NGX_Parameter* parameters, PFN_NVSDK_NGX_ProgressCallback callback) {
  if (parameters != nullptr && enabled.load()) {
    // One line on the first evaluate we see, so the log shows the hook firing
    // even when the value is left at 0.
    static std::atomic<bool> logged_first{false};
    if (!logged_first.exchange(true)) {
      Log("first NGX evaluate seen on the hooked path");
    }
    auto* writable = const_cast<NVSDK_NGX_Parameter*>(parameters);
    const float target = value.load();
    ID3D12Resource* mask = nullptr;
    if (target != 0.f && cmd_list != nullptr) {
      uint32_t width = 0;
      uint32_t height = 0;
      writable->Get(NVSDK_NGX_Parameter_Width, &width);
      writable->Get(NVSDK_NGX_Parameter_Height, &height);
      ID3D12Device* device = nullptr;
      if (SUCCEEDED(cmd_list->GetDevice(IID_PPV_ARGS(&device))) && device != nullptr) {
        const std::lock_guard lock(mask_mutex);
        if (EnsureMask(device, cmd_list, width, height, target)) {
          mask = mask_texture;
        } else if (width == 0u || height == 0u) {
          // The caller did not publish the render size on its parameter object,
          // so the mask has no shape to take. Warned once.
          static std::atomic<bool> warned{false};
          if (!warned.exchange(true)) {
            LogWarn("no render size on the parameter object; responsivity mask not sent");
          }
        }
        device->Release();
      }
    }
    writable->Set("DLSSD.ResponsivityMask", mask);
  }
  return real_evaluate_feature(cmd_list, handle, parameters, callback);
}

inline bool Arm() {
  if (armed.load()) return true;
  const std::lock_guard lock(arm_mutex);
  if (armed.load()) return true;

  HMODULE ngx = GetModuleHandleW(L"_nvngx.dll");
  if (ngx == nullptr) ngx = GetModuleHandleW(L"nvngx.dll");
  if (ngx == nullptr) return false;

  auto* evaluate = reinterpret_cast<PFN_NGX_EvaluateFeature>(
      GetProcAddress(ngx, "NVSDK_NGX_D3D12_EvaluateFeature"));
  if (evaluate == nullptr) return false;
  real_evaluate_feature = evaluate;

  LONG error = DetourTransactionBegin();
  if (error == NO_ERROR) {
    error = DetourAttach(
        reinterpret_cast<void**>(&real_evaluate_feature), HookedEvaluateFeature);
  }
  if (error != NO_ERROR) {
    DetourTransactionAbort();
    LogWarn("NVSDK_NGX_D3D12_EvaluateFeature detour failed");
    return false;
  }
  error = DetourTransactionCommit();
  if (error != NO_ERROR) {
    LogWarn("NGX detour commit failed");
    return false;
  }
  armed.store(true);
  Log("NVSDK_NGX_D3D12_EvaluateFeature hooked; DLSSD.ResponsivityMask available");
  return true;
}

// Polled per present: the NGX runtime loads when the upscaler first initialises,
// which is after our device hook.
inline void Poll() {
  if (armed.load()) return;
  Arm();
}

inline void Disarm() {
  if (!armed.load()) return;
  const std::lock_guard lock(arm_mutex);
  if (!armed.load()) return;
  DetourTransactionBegin();
  DetourDetach(reinterpret_cast<void**>(&real_evaluate_feature), HookedEvaluateFeature);
  DetourTransactionCommit();
  armed.store(false);
  const std::lock_guard mask_lock(mask_mutex);
  ReleaseMaskResources();
}

}  // namespace responsivity
