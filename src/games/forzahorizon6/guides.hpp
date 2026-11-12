/*
 * Copyright (C) 2026 Carlos Lopez, speedlemur
 * SPDX-License-Identifier: MIT
 *
 * forzahorizon6-rr: real DLSS-RR guide buffers (M3a, experimental).
 *
 * Captures the game's live G-buffer render targets and generates the RR guide
 * buffers from them:
 *   - NormalRoughness: decoded from the packed normal target (R32_UINT, the
 *     12+12-bit packing used by the game's own resolve chain) plus a
 *     roughness candidate from the material target, by our own compute pass
 *     (rayreconstruction/fh6_guide_nr.cs_6_6.hlsl) dispatched on the game's command list right
 *     before the RR evaluate.
 *   - Albedo: linearized copy written by the same pass (DLSS-RR requires
 *     linear albedo; the captured G-buffer target is sRGB and unsupported).
 *   - SpecularAlbedo: generated in the same pass from albedo (approximation;
 *     no first-class specular target has been confirmed live yet).
 *
 * Capture is keyed on the live render-target FORMAT SIGNATURE, not on shader
 * hashes — the writer shaders are recompiled per game build/quality tier and
 * their hashes drift (this was the initial "captures 0" cause). Verified live
 * from a garage snapshot via DevKit:
 *   RT2 r8g8b8a8_uint  = material bits
 *   RT3 r32_uint       = packed normal bits
 *   RT4 r8g8b8a8_srgb  = albedo (image-confirmed: car paint)
 *
 * Everything fails closed: any missing capture, format mismatch or pipeline
 * failure keeps the placeholder guides in charge for that frame.
 */

#pragma once

#include <windows.h>
#include <d3d12.h>

#include <array>
#include <atomic>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <map>
#include <mutex>
#include <sstream>
#include <string>

#include <include/reshade.hpp>
#include <embed/shaders.h>

#include "../../utils/shader.hpp"

#pragma comment(lib, "d3d12.lib")

namespace guides {

// Real guides are generated from the game's live G-buffer every evaluate; the
// placeholder guides stay as the fail-closed fallback. `enabled` is driven by
// the mod's single RR switch.
inline std::atomic<bool> enabled = false;

// ---------------------------------------------------------------------------
// diagnostic logging
//
// Off by default; driven by the overlay's "Debug logging" switch, so it needs
// no environment variable and no rebuild. Every distinct outcome is logged once,
// so a per-frame loop cannot flood the log: the goal is to learn which gate
// rejects on a given machine, not to trace every frame.
// ---------------------------------------------------------------------------

inline std::atomic<bool> diagnostics = false;

inline bool DiagGuidesEnabled() { return diagnostics.load(); }

// Shared state for the once-per-reason log, so SetDiagnostics can clear it and
// let a later toggle-on re-report every gate.
inline std::mutex& OnceMutex() {
  static std::mutex m;
  return m;
}

inline std::map<std::string, bool>& OnceSeen() {
  static std::map<std::string, bool> seen;
  return seen;
}

// Logs `msg` the first time `key` is seen. Thread-safe.
inline void LogOnce(const std::string& key, const std::string& msg) {
  const std::lock_guard lock(OnceMutex());
  if (OnceSeen().emplace(key, true).second) {
    reshade::log::message(reshade::log::level::info, ("sl-rr guides: " + msg).c_str());
  }
}

// Logs every time (for state transitions, which are rare by construction).
inline void LogEvent(const std::string& msg) {
  reshade::log::message(reshade::log::level::info, ("sl-rr guides: " + msg).c_str());
}

// Rate-limits a message that would otherwise repeat per frame. Logs the first
// occurrence, then at most one line per interval, reporting how many repeats
// were folded in. This keeps a per-frame event visible without letting it
// crowd out everything else in the log, which is the whole point of the
// diagnostic: the capture line was producing ~53k lines out of 5.5 MB and
// burying the NGX error text we are trying to read.
struct ThrottleSlot {
  std::chrono::steady_clock::time_point last{};
  uint32_t suppressed = 0;
};

inline std::map<std::string, ThrottleSlot>& ThrottleSeen() {
  static std::map<std::string, ThrottleSlot> slots;
  return slots;
}

inline void LogThrottled(const std::string& key, const std::string& msg,
                         std::chrono::milliseconds interval = std::chrono::seconds(5)) {
  const auto now = std::chrono::steady_clock::now();
  std::string out;
  {
    const std::lock_guard lock(OnceMutex());
    ThrottleSlot& slot = ThrottleSeen()[key];
    // First sighting, or the quiet window has elapsed, emits. Otherwise just
    // count the occurrence and wait for the next emit.
    if (slot.last.time_since_epoch().count() != 0 && now - slot.last < interval) {
      ++slot.suppressed;
      return;
    }
    if (slot.suppressed != 0) {
      out = msg + " (+" + std::to_string(slot.suppressed) + " more)";
      slot.suppressed = 0;
    } else {
      out = msg;
    }
    slot.last = now;
  }
  reshade::log::message(reshade::log::level::info, ("sl-rr guides: " + out).c_str());
}

inline void SetDiagnostics(bool on) {
  const bool was = diagnostics.exchange(on);
  if (on == was) return;
  {
    const std::lock_guard lock(OnceMutex());
    OnceSeen().clear();
    ThrottleSeen().clear();
  }
  LogEvent(on ? "debug logging enabled" : "debug logging disabled");
}

// Captured G-buffer targets. `handle` is a borrowed ID3D12Resource pointer from
// the render-target bind callback, which runs on several recording threads, so
// it is NOT atomic here: `capture_mutex` serialises every read and write of
// this struct. `ref` keeps the resource alive for as long as it is captured, so
// the evaluate thread can never dereference a freed texture.
struct CapturedTexture {
  uint64_t handle = 0;
  ID3D12Resource* ref = nullptr;
  uint32_t format = 0;
  uint32_t width = 0;
  uint32_t height = 0;
};

// One lock covers capture and evaluate. The bind callback runs on every
// recording thread and PrepareEvaluate runs on the evaluate thread; without
// this they race on the handles and on the descriptor-group bookkeeping.
inline std::mutex capture_mutex;

inline CapturedTexture captured_albedo;    // RT4 r8g8b8a8_srgb
inline CapturedTexture captured_material;  // RT2 r8g8b8a8_uint
inline CapturedTexture captured_normal;    // RT3 r32_uint

// Releases the currently held reference. Caller must hold capture_mutex.
inline void ClearCapture(CapturedTexture& out) {
  if (out.ref != nullptr) {
    out.ref->Release();
    out.ref = nullptr;
  }
  out.handle = 0;
  out.format = 0;
  out.width = 0;
  out.height = 0;
}

inline void StoreCapture(reshade::api::resource resource, CapturedTexture& out) {
  auto* native = reinterpret_cast<ID3D12Resource*>(resource.handle);
  if (native == nullptr) return;
  const D3D12_RESOURCE_DESC native_desc = native->GetDesc();
  // Take the new reference before dropping the old one: if this capture is the
  // resource we already hold, that keeps it alive across the swap.
  native->AddRef();
  ClearCapture(out);
  out.ref = native;
  out.handle = resource.handle;
  out.format = static_cast<uint32_t>(native_desc.Format);
  out.width = static_cast<uint32_t>(native_desc.Width);
  out.height = static_cast<uint32_t>(native_desc.Height);
}

// Capture the live G-buffer from a bound render-target list, identified by
// its format signature. Accepts both event shapes (bind + render pass).
inline void CaptureFromViews(
    reshade::api::command_list* cmd_list, const reshade::api::resource_view* views,
    uint32_t count) {
  const bool diag = DiagGuidesEnabled();
  if (!enabled.load()) {
    if (diag) LogOnce("capture:disabled", "render targets bound but guides are disabled");
    return;
  }
  if (views == nullptr || count < 8) {
    if (diag) {
      LogOnce("capture:targetcount",
              "render target list too small to be the 8-target G-buffer (count="
                  + std::to_string(count) + ")");
    }
    return;
  }
  auto* device = cmd_list->get_device();
  if (device == nullptr) {
    if (diag) LogOnce("capture:nodevice", "render targets bound with a null device");
    return;
  }

  const auto resolve = [&](uint32_t index) -> reshade::api::resource {
    if (views[index].handle == 0u) return {0};
    return device->get_resource_from_view(views[index]);
  };
  const reshade::api::resource albedo = resolve(4);
  const reshade::api::resource material = resolve(2);
  const reshade::api::resource normal = resolve(3);
  if (albedo.handle == 0u || material.handle == 0u || normal.handle == 0u) {
    if (diag) {
      LogOnce("capture:nullviews",
              "G-buffer slots 2/3/4 are not all bound (material=0x"
                  + std::to_string(material.handle) + " normal=0x"
                  + std::to_string(normal.handle) + " albedo=0x"
                  + std::to_string(albedo.handle) + ")");
    }
    return;
  }

  const reshade::api::resource_desc albedo_desc = device->get_resource_desc(albedo);
  const reshade::api::resource_desc material_desc = device->get_resource_desc(material);
  const reshade::api::resource_desc normal_desc = device->get_resource_desc(normal);
  if (albedo_desc.type != reshade::api::resource_type::texture_2d
      || material_desc.type != reshade::api::resource_type::texture_2d
      || normal_desc.type != reshade::api::resource_type::texture_2d) {
    if (diag) LogOnce("capture:not2d", "G-buffer slots are not 2D textures");
    return;
  }
  if (albedo_desc.texture.width < 320u || albedo_desc.texture.height < 180u) {
    if (diag) {
      LogOnce("capture:small",
              "G-buffer too small to be the main pass (" + std::to_string(albedo_desc.texture.width)
                  + "x" + std::to_string(albedo_desc.texture.height) + ")");
    }
    return;
  }
  if (albedo_desc.texture.width != material_desc.texture.width
      || albedo_desc.texture.height != material_desc.texture.height
      || albedo_desc.texture.width != normal_desc.texture.width
      || albedo_desc.texture.height != normal_desc.texture.height) {
    if (diag) {
      LogOnce("capture:mismatch",
              "G-buffer slot sizes disagree (albedo "
                  + std::to_string(albedo_desc.texture.width) + "x"
                  + std::to_string(albedo_desc.texture.height) + ", material "
                  + std::to_string(material_desc.texture.width) + "x"
                  + std::to_string(material_desc.texture.height) + ", normal "
                  + std::to_string(normal_desc.texture.width) + "x"
                  + std::to_string(normal_desc.texture.height) + ")");
    }
    return;
  }
  if (albedo_desc.texture.format != reshade::api::format::r8g8b8a8_unorm_srgb
      || material_desc.texture.format != reshade::api::format::r8g8b8a8_uint
      || normal_desc.texture.format != reshade::api::format::r32_uint) {
    if (diag) {
      LogOnce("capture:format",
              "G-buffer formats do not match the expected signature (albedo "
                  + std::to_string(static_cast<uint32_t>(albedo_desc.texture.format))
                  + ", material "
                  + std::to_string(static_cast<uint32_t>(material_desc.texture.format))
                  + ", normal "
                  + std::to_string(static_cast<uint32_t>(normal_desc.texture.format))
                  + ")");
    }
    return;
  }

  // Throttled rather than once-per-distinct-size: the capture fires on every
  // recording thread every frame, so a plain LogEvent buried the log. Keyed on
  // dimensions so a resolution change is still reported on its own line.
  if (diag) {
    const std::string dims = std::to_string(albedo_desc.texture.width) + "x"
                             + std::to_string(albedo_desc.texture.height);
    LogThrottled("capture:gbuffer:" + dims, "captured G-buffer " + dims);
  }
  {
    const std::lock_guard lock(capture_mutex);
    StoreCapture(albedo, captured_albedo);
    StoreCapture(material, captured_material);
    StoreCapture(normal, captured_normal);
  }
}

inline void OnBindRenderTargetsAndDepthStencil(
    reshade::api::command_list* cmd_list, uint32_t count,
    const reshade::api::resource_view* rtvs, reshade::api::resource_view dsv) {
  (void)dsv;
  CaptureFromViews(cmd_list, rtvs, count);
}

inline void OnBeginRenderPass(
    reshade::api::command_list* cmd_list, uint32_t count,
    const reshade::api::render_pass_render_target_desc* rts,
    const reshade::api::render_pass_depth_stencil_desc* ds) {
  (void)ds;
  if (rts == nullptr || count < 8) return;
  std::array<reshade::api::resource_view, 8> views{};
  const uint32_t n = count < 8u ? count : 8u;
  for (uint32_t i = 0; i < n; ++i) views[i] = rts[i].view;
  CaptureFromViews(cmd_list, views.data(), n);
}

// --- NormalRoughness + specular guide pass (native D3D12) ------------------

struct GuidePass {
  ID3D12Resource* normal_roughness = nullptr;
  D3D12_RESOURCE_STATES normal_roughness_state = D3D12_RESOURCE_STATE_COMMON;
  ID3D12Resource* specular = nullptr;
  D3D12_RESOURCE_STATES specular_state = D3D12_RESOURCE_STATE_COMMON;
  ID3D12Resource* albedo_linear = nullptr;
  D3D12_RESOURCE_STATES albedo_linear_state = D3D12_RESOURCE_STATE_COMMON;
  uint32_t width = 0;
  uint32_t height = 0;
  ID3D12RootSignature* root_signature = nullptr;
  ID3D12PipelineState* pso = nullptr;
  // Typed texture access is not allowed through root descriptors, so all six
  // bindings live in a shader-visible descriptor heap (validated offline on
  // WARP: only descriptor tables satisfy these resource declarations). The six
  // descriptors are rewritten every evaluate from the currently captured
  // handles; a cached per-set table would outlive the G-buffer it points at.
  ID3D12DescriptorHeap* heap = nullptr;
  UINT heap_increment = 0;
  bool init_failed = false;
};

inline GuidePass guide_pass;

inline bool EnsureGuideTextures(ID3D12Device* device, uint32_t width, uint32_t height) {
  if (guide_pass.normal_roughness != nullptr && guide_pass.width == width
      && guide_pass.height == height) {
    return true;
  }
  if (guide_pass.normal_roughness != nullptr) {
    guide_pass.normal_roughness->Release();
    guide_pass.normal_roughness = nullptr;
    guide_pass.normal_roughness_state = D3D12_RESOURCE_STATE_COMMON;
  }
  if (guide_pass.specular != nullptr) {
    guide_pass.specular->Release();
    guide_pass.specular = nullptr;
    guide_pass.specular_state = D3D12_RESOURCE_STATE_COMMON;
  }
  if (guide_pass.albedo_linear != nullptr) {
    guide_pass.albedo_linear->Release();
    guide_pass.albedo_linear = nullptr;
    guide_pass.albedo_linear_state = D3D12_RESOURCE_STATE_COMMON;
  }

  D3D12_HEAP_PROPERTIES heap{};
  heap.Type = D3D12_HEAP_TYPE_DEFAULT;

  D3D12_RESOURCE_DESC nr_desc{};
  nr_desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
  nr_desc.Width = width;
  nr_desc.Height = height;
  nr_desc.DepthOrArraySize = 1;
  nr_desc.MipLevels = 1;
  nr_desc.Format = DXGI_FORMAT_R16G16B16A16_FLOAT;
  nr_desc.SampleDesc.Count = 1;
  nr_desc.Flags = D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS;
  const HRESULT nr_hr = device->CreateCommittedResource(
      &heap, D3D12_HEAP_FLAG_NONE, &nr_desc, D3D12_RESOURCE_STATE_COMMON,
      nullptr, IID_PPV_ARGS(&guide_pass.normal_roughness));
  if (FAILED(nr_hr) || guide_pass.normal_roughness == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("textures:nr",
              "CreateCommittedResource(NormalRoughness) failed hr=0x" + std::to_string(
                  static_cast<uint32_t>(nr_hr)) + " size " + std::to_string(width) + "x"
                  + std::to_string(height));
    }
    guide_pass.normal_roughness = nullptr;
    return false;
  }

  D3D12_RESOURCE_DESC spec_desc{};
  spec_desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
  spec_desc.Width = width;
  spec_desc.Height = height;
  spec_desc.DepthOrArraySize = 1;
  spec_desc.MipLevels = 1;
  spec_desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
  spec_desc.SampleDesc.Count = 1;
  spec_desc.Flags = D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS;
  const HRESULT spec_hr = device->CreateCommittedResource(
      &heap, D3D12_HEAP_FLAG_NONE, &spec_desc, D3D12_RESOURCE_STATE_COMMON,
      nullptr, IID_PPV_ARGS(&guide_pass.specular));
  if (FAILED(spec_hr) || guide_pass.specular == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("textures:spec",
              "CreateCommittedResource(Specular) failed hr=0x"
                  + std::to_string(static_cast<uint32_t>(spec_hr)));
    }
    guide_pass.normal_roughness->Release();
    guide_pass.normal_roughness = nullptr;
    guide_pass.specular = nullptr;
    return false;
  }

  D3D12_RESOURCE_DESC alb_desc{};
  alb_desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
  alb_desc.Width = width;
  alb_desc.Height = height;
  alb_desc.DepthOrArraySize = 1;
  alb_desc.MipLevels = 1;
  alb_desc.Format = DXGI_FORMAT_R16G16B16A16_FLOAT;
  alb_desc.SampleDesc.Count = 1;
  alb_desc.Flags = D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS;
  const HRESULT alb_hr = device->CreateCommittedResource(
      &heap, D3D12_HEAP_FLAG_NONE, &alb_desc, D3D12_RESOURCE_STATE_COMMON,
      nullptr, IID_PPV_ARGS(&guide_pass.albedo_linear));
  if (FAILED(alb_hr) || guide_pass.albedo_linear == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("textures:albedo",
              "CreateCommittedResource(AlbedoLinear) failed hr=0x"
                  + std::to_string(static_cast<uint32_t>(alb_hr)));
    }
    guide_pass.normal_roughness->Release();
    guide_pass.normal_roughness = nullptr;
    guide_pass.specular->Release();
    guide_pass.specular = nullptr;
    guide_pass.albedo_linear = nullptr;
    return false;
  }

  guide_pass.width = width;
  guide_pass.height = height;
  guide_pass.normal_roughness_state = D3D12_RESOURCE_STATE_COMMON;
  guide_pass.specular_state = D3D12_RESOURCE_STATE_COMMON;
  guide_pass.albedo_linear_state = D3D12_RESOURCE_STATE_COMMON;

  if (guide_pass.heap == nullptr) {
    D3D12_DESCRIPTOR_HEAP_DESC heap_desc{};
    heap_desc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV;
    heap_desc.NumDescriptors = 64;  // 10 groups of 6 descriptors
    heap_desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
    const HRESULT heap_hr = device->CreateDescriptorHeap(
        &heap_desc, IID_PPV_ARGS(&guide_pass.heap));
    if (FAILED(heap_hr) || guide_pass.heap == nullptr) {
      if (DiagGuidesEnabled()) {
        LogOnce("textures:heap",
                "CreateDescriptorHeap failed hr=0x" + std::to_string(
                    static_cast<uint32_t>(heap_hr)));
      }
      guide_pass.heap = nullptr;
      return false;
    }
    if (DiagGuidesEnabled()) {
      LogOnce("textures:ok",
              "guide textures created at " + std::to_string(width) + "x"
                  + std::to_string(height) + ", heap increment "
                  + std::to_string(device->GetDescriptorHandleIncrementSize(
                      D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV)));
    }
    guide_pass.heap_increment = device->GetDescriptorHandleIncrementSize(
        D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);
  }
  return true;
}

inline bool EnsureGuidePipeline(ID3D12Device* device) {
  if (guide_pass.pso != nullptr && guide_pass.root_signature != nullptr) return true;
  if (guide_pass.init_failed) return false;

  D3D12_DESCRIPTOR_RANGE ranges[2] = {};
  ranges[0].RangeType = D3D12_DESCRIPTOR_RANGE_TYPE_SRV;
  ranges[0].NumDescriptors = 3;  // t0..t2
  ranges[0].BaseShaderRegister = 0;
  ranges[0].RegisterSpace = 0;
  ranges[0].OffsetInDescriptorsFromTableStart = 0;
  ranges[1].RangeType = D3D12_DESCRIPTOR_RANGE_TYPE_UAV;
  ranges[1].NumDescriptors = 3;  // u0..u2
  ranges[1].BaseShaderRegister = 0;
  ranges[1].RegisterSpace = 0;
  ranges[1].OffsetInDescriptorsFromTableStart = 3;

  D3D12_ROOT_PARAMETER params[2] = {};
  params[0].ParameterType = D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS;
  params[0].Constants.ShaderRegister = 0;
  params[0].Constants.RegisterSpace = 0;
  params[0].Constants.Num32BitValues = 16;
  params[0].ShaderVisibility = D3D12_SHADER_VISIBILITY_ALL;
  params[1].ParameterType = D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE;
  params[1].DescriptorTable.NumDescriptorRanges = 2;
  params[1].DescriptorTable.pDescriptorRanges = ranges;
  params[1].ShaderVisibility = D3D12_SHADER_VISIBILITY_ALL;

  D3D12_ROOT_SIGNATURE_DESC root_desc{};
  root_desc.NumParameters = 2;
  root_desc.pParameters = params;
  root_desc.Flags = D3D12_ROOT_SIGNATURE_FLAG_NONE;

  ID3DBlob* signature = nullptr;
  ID3DBlob* error = nullptr;
  const HRESULT serialize = D3D12SerializeRootSignature(
      &root_desc, D3D_ROOT_SIGNATURE_VERSION_1, &signature, &error);
  if (error != nullptr) error->Release();
  if (FAILED(serialize) || signature == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("pipeline:serialize",
              "D3D12SerializeRootSignature failed hr=0x"
                  + std::to_string(static_cast<uint32_t>(serialize)));
    }
    guide_pass.init_failed = true;
    return false;
  }
  const HRESULT created = device->CreateRootSignature(
      0, signature->GetBufferPointer(), signature->GetBufferSize(),
      IID_PPV_ARGS(&guide_pass.root_signature));
  signature->Release();
  if (FAILED(created) || guide_pass.root_signature == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("pipeline:rootsig",
              "CreateRootSignature failed hr=0x" + std::to_string(
                  static_cast<uint32_t>(created)));
    }
    guide_pass.init_failed = true;
    return false;
  }

  D3D12_COMPUTE_PIPELINE_STATE_DESC pso_desc{};
  pso_desc.pRootSignature = guide_pass.root_signature;
  pso_desc.CS.pShaderBytecode = __fh6_guide_nr.data();
  pso_desc.CS.BytecodeLength = __fh6_guide_nr.size();
  const HRESULT pso_created = device->CreateComputePipelineState(
      &pso_desc, IID_PPV_ARGS(&guide_pass.pso));
  if (FAILED(pso_created) || guide_pass.pso == nullptr) {
    if (DiagGuidesEnabled()) {
      LogOnce("pipeline:pso",
              "CreateComputePipelineState failed hr=0x" + std::to_string(
                  static_cast<uint32_t>(pso_created)));
    }
    guide_pass.init_failed = true;
    return false;
  }
  if (DiagGuidesEnabled()) LogOnce("pipeline:ok", "guide compute pipeline created");
  return true;
}

struct ReadyGuides {
  bool real = false;
  void* normal_roughness = nullptr;
  void* albedo = nullptr;
  uint32_t albedo_format = 0;
  void* specular = nullptr;
  uint32_t specular_format = 0;
};

inline D3D12_RESOURCE_BARRIER TransitionBarrier(
    ID3D12Resource* resource, D3D12_RESOURCE_STATES before,
    D3D12_RESOURCE_STATES after) {
  D3D12_RESOURCE_BARRIER barrier{};
  barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
  barrier.Transition.pResource = resource;
  barrier.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES;
  barrier.Transition.StateBefore = before;
  barrier.Transition.StateAfter = after;
  return barrier;
}

// Called from the evaluate hook before the guide tags are built. Dispatches
// the guide pass on the game's command list and returns the live guide
// resources, or a not-ready result so placeholders stay in charge.
inline ReadyGuides PrepareEvaluate(
    ID3D12Device* device, ID3D12GraphicsCommandList* cmd_list, uint32_t width,
    uint32_t height, const float world_to_view_rows[3][4]) {
  ReadyGuides ready{};
  const bool diag = DiagGuidesEnabled();
  // Serialise against the capture callback: it mutates the three captured
  // textures and this reads them to build descriptors and dispatch work.
  const std::lock_guard capture_lock(capture_mutex);
  if (!enabled.load()) {
    if (diag) LogOnce("prepare:disabled", "evaluate reached but guides are disabled");
    return ready;
  }
  if (device == nullptr || cmd_list == nullptr) {
    if (diag) LogOnce("prepare:null", "evaluate reached with a null device or command list");
    return ready;
  }
  if (width == 0 || height == 0) {
    if (diag) LogOnce("prepare:dims", "evaluate reached with zero input extent");
    return ready;
  }

  const uint64_t albedo = captured_albedo.handle;
  const uint64_t material = captured_material.handle;
  const uint64_t normal = captured_normal.handle;
  if (normal == 0 || albedo == 0) {
    if (diag) {
      LogOnce("prepare:nocapture",
              "G-buffer targets not captured yet (albedo=0x" + std::to_string(albedo)
                  + " normal=0x" + std::to_string(normal) + ")");
    }
    return ready;  // G-buffer targets not captured yet
  }

  if (!EnsureGuideTextures(device, width, height)) {
    if (diag) LogOnce("prepare:textures", "guide texture creation failed");
    return ready;
  }
  if (!EnsureGuidePipeline(device)) {
    if (diag) LogOnce("prepare:pipeline", "guide pipeline creation failed");
    return ready;
  }

  auto* gbuffer_albedo = reinterpret_cast<ID3D12Resource*>(albedo);
  auto* gbuffer_material = reinterpret_cast<ID3D12Resource*>(material);
  auto* gbuffer_normal = reinterpret_cast<ID3D12Resource*>(normal);

  // Fixed guide configuration: view-space normals (bit0) and material.z as the
  // roughness field (bits1+2), with roughness = 1 - field/127 (bit4; the writer
  // fields are gloss-like).
  uint32_t flags = 1u;
  if (material != 0) flags |= 2u | 4u;
  flags |= 16u;

  const D3D12_RESOURCE_STATES srv_state = static_cast<D3D12_RESOURCE_STATES>(
      D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE
      | D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE);

  D3D12_RESOURCE_BARRIER barriers[3] = {};
  uint32_t barrier_count = 0;
  if (guide_pass.normal_roughness_state != D3D12_RESOURCE_STATE_UNORDERED_ACCESS) {
    barriers[barrier_count++] = TransitionBarrier(
        guide_pass.normal_roughness, guide_pass.normal_roughness_state,
        D3D12_RESOURCE_STATE_UNORDERED_ACCESS);
  }
  if (guide_pass.specular_state != D3D12_RESOURCE_STATE_UNORDERED_ACCESS) {
    barriers[barrier_count++] = TransitionBarrier(
        guide_pass.specular, guide_pass.specular_state,
        D3D12_RESOURCE_STATE_UNORDERED_ACCESS);
  }
  if (guide_pass.albedo_linear_state != D3D12_RESOURCE_STATE_UNORDERED_ACCESS) {
    barriers[barrier_count++] = TransitionBarrier(
        guide_pass.albedo_linear, guide_pass.albedo_linear_state,
        D3D12_RESOURCE_STATE_UNORDERED_ACCESS);
  }
  cmd_list->ResourceBarrier(barrier_count, barriers);

  // Descriptor slots 0..5: (normal, material, albedo, NR, spec, albedo_linear).
  // Rewritten every evaluate from the live captured handles; captured resources
  // are kept referenced by ClearCapture/StoreCapture, so these stay valid.
  {
    const D3D12_CPU_DESCRIPTOR_HANDLE heap_base =
        guide_pass.heap->GetCPUDescriptorHandleForHeapStart();
    const auto slot = [&](uint32_t index) {
      D3D12_CPU_DESCRIPTOR_HANDLE handle = heap_base;
      handle.ptr += static_cast<SIZE_T>(guide_pass.heap_increment) * index;
      return handle;
    };
    device->CreateShaderResourceView(gbuffer_normal, nullptr, slot(0));
    if (material != 0) {
      device->CreateShaderResourceView(gbuffer_material, nullptr, slot(1));
    }
    device->CreateShaderResourceView(gbuffer_albedo, nullptr, slot(2));
    D3D12_UNORDERED_ACCESS_VIEW_DESC nr_uav{};
    nr_uav.Format = DXGI_FORMAT_R16G16B16A16_FLOAT;
    nr_uav.ViewDimension = D3D12_UAV_DIMENSION_TEXTURE2D;
    device->CreateUnorderedAccessView(guide_pass.normal_roughness, nullptr, &nr_uav, slot(3));
    D3D12_UNORDERED_ACCESS_VIEW_DESC spec_uav{};
    spec_uav.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    spec_uav.ViewDimension = D3D12_UAV_DIMENSION_TEXTURE2D;
    device->CreateUnorderedAccessView(guide_pass.specular, nullptr, &spec_uav, slot(4));
    D3D12_UNORDERED_ACCESS_VIEW_DESC alb_uav{};
    alb_uav.Format = DXGI_FORMAT_R16G16B16A16_FLOAT;
    alb_uav.ViewDimension = D3D12_UAV_DIMENSION_TEXTURE2D;
    device->CreateUnorderedAccessView(guide_pass.albedo_linear, nullptr, &alb_uav, slot(5));
  }

  cmd_list->SetComputeRootSignature(guide_pass.root_signature);
  cmd_list->SetPipelineState(guide_pass.pso);
  const uint32_t params[4] = {
      width, height, flags, 500u,  // constant roughness fallback = 0.5
  };
  cmd_list->SetComputeRoot32BitConstants(0, 4, params, 0);
  cmd_list->SetComputeRoot32BitConstants(0, 12, world_to_view_rows, 4);
  ID3D12DescriptorHeap* heaps[1] = {guide_pass.heap};
  cmd_list->SetDescriptorHeaps(1, heaps);
  D3D12_GPU_DESCRIPTOR_HANDLE table =
      guide_pass.heap->GetGPUDescriptorHandleForHeapStart();
  cmd_list->SetComputeRootDescriptorTable(1, table);
  if (diag) {
    LogOnce("prepare:dispatch",
            "dispatching guide pass " + std::to_string((width + 7u) / 8u) + "x"
                + std::to_string((height + 7u) / 8u) + " groups, output "
                + std::to_string(width) + "x" + std::to_string(height));
  }
  cmd_list->Dispatch((width + 7u) / 8u, (height + 7u) / 8u, 1u);

  D3D12_RESOURCE_BARRIER after[6] = {};
  after[0].Type = D3D12_RESOURCE_BARRIER_TYPE_UAV;
  after[0].UAV.pResource = guide_pass.normal_roughness;
  after[1].Type = D3D12_RESOURCE_BARRIER_TYPE_UAV;
  after[1].UAV.pResource = guide_pass.specular;
  after[2].Type = D3D12_RESOURCE_BARRIER_TYPE_UAV;
  after[2].UAV.pResource = guide_pass.albedo_linear;
  after[3] = TransitionBarrier(
      guide_pass.normal_roughness, D3D12_RESOURCE_STATE_UNORDERED_ACCESS, srv_state);
  after[4] = TransitionBarrier(
      guide_pass.specular, D3D12_RESOURCE_STATE_UNORDERED_ACCESS, srv_state);
  after[5] = TransitionBarrier(
      guide_pass.albedo_linear, D3D12_RESOURCE_STATE_UNORDERED_ACCESS, srv_state);
  cmd_list->ResourceBarrier(6, after);
  guide_pass.normal_roughness_state = srv_state;
  guide_pass.specular_state = srv_state;
  guide_pass.albedo_linear_state = srv_state;

  ready.real = true;
  ready.normal_roughness = guide_pass.normal_roughness;
  ready.albedo = guide_pass.albedo_linear;
  ready.albedo_format = static_cast<uint32_t>(DXGI_FORMAT_R16G16B16A16_FLOAT);
  ready.specular = guide_pass.specular;
  ready.specular_format = static_cast<uint32_t>(DXGI_FORMAT_R8G8B8A8_UNORM);
  if (diag) LogOnce("prepare:real", "real guide pass recorded for this frame");
  return ready;
}

inline void Use(DWORD fdw_reason) {
  renodx::utils::shader::Use(fdw_reason);
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      reshade::register_event<reshade::addon_event::bind_render_targets_and_depth_stencil>(
          OnBindRenderTargetsAndDepthStencil);
      reshade::register_event<reshade::addon_event::begin_render_pass>(OnBeginRenderPass);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::bind_render_targets_and_depth_stencil>(
          OnBindRenderTargetsAndDepthStencil);
      reshade::unregister_event<reshade::addon_event::begin_render_pass>(OnBeginRenderPass);
      {
        const std::lock_guard lock(capture_mutex);
        ClearCapture(captured_albedo);
        ClearCapture(captured_material);
        ClearCapture(captured_normal);
      }
      break;
  }
}

}  // namespace guides
