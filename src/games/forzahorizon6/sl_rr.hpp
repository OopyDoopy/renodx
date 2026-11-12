/*
 * Copyright (C) 2026 Carlos Lopez, speedlemur
 * SPDX-License-Identifier: MIT
 *
 * forzahorizon6-rr: Streamline interception layer.
 *
 * Requests DLSS Ray Reconstruction at slInit, loads it at runtime if the
 * request did not stick, and answers the game's DLSS-SR evaluation with
 * DLSS-RR. The DLSS options are mirrored from the game's own slDLSSSetOptions
 * capture, so the in-game settings keep controlling internal resolution. RR
 * receives the game's real G-buffer guides (guides.hpp) plus the raw resolve
 * signal (on High RTGI the game's denoisers are bypassed in denoise.hpp).
 * Any failure for a frame falls back to the untouched SR call.
 */

#pragma once

#include <windows.h>
#include <d3d12.h>

#include <detours.h>
#include <intrin.h>

#include <array>
#include <algorithm>
#include <atomic>
#include <climits>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <mutex>
#include <string>
#include <vector>

#include <sl.h>
#include <sl_helpers.h>
#include <sl_matrix_helpers.h>

#include <include/reshade.hpp>

#include "../../utils/platform.hpp"

#include "./guides.hpp"

namespace sl_rr {

// ---------------------------------------------------------------------------
// logging — hook arming and hard failures only
// ---------------------------------------------------------------------------

inline void LogInfo(const std::string& msg) {
  reshade::log::message(reshade::log::level::info, ("sl-rr: " + msg).c_str());
}

inline void LogWarn(const std::string& msg) {
  reshade::log::message(reshade::log::level::warning, ("sl-rr: " + msg).c_str());
}

inline std::string ModuleNameOf(void* address) {
  if (address == nullptr) return "?";
  HMODULE module = nullptr;
  if (GetModuleHandleExA(
          GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
          static_cast<LPCSTR>(address), &module)
      == 0) {
    return "?";
  }
  char path[MAX_PATH] = {};
  if (GetModuleFileNameA(module, path, MAX_PATH) == 0) return "?";
  const char* slash = strrchr(path, '\\');
  return slash != nullptr ? slash + 1 : path;
}

constexpr int kNever = INT_MIN;

inline std::string ResultName(int result) {
  if (result == kNever) return "-";
  return sl::getResultAsStr(static_cast<sl::Result>(result));
}

inline std::string HresultLabel(HRESULT hr) {
  char buffer[16] = {};
  snprintf(buffer, sizeof buffer, "0x%08X", static_cast<unsigned>(hr));
  return buffer;
}

// Builds the camera matrices DLSS-RR expects in DLSSDOptions from the camera
// basis the game provides via sl::Constants. Convention follows Streamline's
// own sl_matrix_helpers.h (cameraViewToWorld rows = right/up/fwd/pos,
// worldToCameraView = ortho-normal inverse).
inline bool BuildCameraMatricesFromConstants(
    const sl::Constants& values, sl::float4x4& world_to_camera_view,
    sl::float4x4& camera_view_to_world) {
  const auto length_sq = [](const sl::float3& v) {
    return (v.x * v.x) + (v.y * v.y) + (v.z * v.z);
  };
  sl::float3 right = values.cameraRight;
  sl::float3 forward = values.cameraFwd;
  if (length_sq(right) < 1e-12f || length_sq(forward) < 1e-12f) return false;
  sl::vectorNormalize(right);
  sl::vectorNormalize(forward);
  sl::float3 up;
  sl::vectorCrossProduct(up, forward, right);
  sl::vectorNormalize(up);
  camera_view_to_world[0] = sl::float4(right.x, right.y, right.z, 0.f);
  camera_view_to_world[1] = sl::float4(up.x, up.y, up.z, 0.f);
  camera_view_to_world[2] = sl::float4(forward.x, forward.y, forward.z, 0.f);
  camera_view_to_world[3] =
      sl::float4(values.cameraPos.x, values.cameraPos.y, values.cameraPos.z, 1.f);
  sl::matrixOrthoNormalInvert(world_to_camera_view, camera_view_to_world);
  return true;
}

// ---------------------------------------------------------------------------
// real function pointers
// ---------------------------------------------------------------------------

inline PFun_slInit* real_sl_init = nullptr;
inline PFun_slSetD3DDevice* real_sl_set_d3d_device = nullptr;
inline PFun_slSetTag* real_sl_set_tag = nullptr;
inline PFun_slSetTagForFrame* real_sl_set_tag_for_frame = nullptr;
inline PFun_slSetConstants* real_sl_set_constants = nullptr;
inline PFun_slEvaluateFeature* real_sl_evaluate_feature = nullptr;
inline PFun_slGetFeatureFunction* real_sl_get_feature_function = nullptr;
inline PFun_slIsFeatureLoaded* real_sl_is_feature_loaded = nullptr;
inline PFun_slSetFeatureLoaded* real_sl_set_feature_loaded = nullptr;

// DLSS-RR / DLSS (SR) feature functions resolved at runtime.
inline PFun_slDLSSDSetOptions* real_dlssd_set_options = nullptr;
inline PFun_slDLSSSetOptions* real_dlss_set_options = nullptr;
inline PFun_slDLSSGetOptimalSettings* real_dlss_get_optimal_settings = nullptr;

// slInit feature-list injection. Static storage because Streamline may keep
// the pointer past the slInit call.
constexpr uint32_t kMaxInitFeatures = 16;
inline sl::Feature init_features_patched_storage[kMaxInitFeatures + 1] = {};

// ---------------------------------------------------------------------------
// settings
// ---------------------------------------------------------------------------

inline std::atomic<bool> rr_init_injection_enabled{true};
inline std::atomic<bool> rr_runtime_load_enabled{true};
inline std::atomic<bool> rr_redirect_enabled{true};

// User-selected DLSSD preset applied to every mode (D/E/F; D is the default
// transformer model, E the latest, F reverts to the RR 4.5 default).
inline std::atomic<uint32_t> rr_preset_override{
    static_cast<uint32_t>(sl::DLSSDPreset::ePresetF)};

inline void SetInitInjection(bool enabled) { rr_init_injection_enabled.store(enabled); }
inline bool GetInitInjection() { return rr_init_injection_enabled.load(); }
inline void SetRuntimeLoad(bool enabled) { rr_runtime_load_enabled.store(enabled); }
inline bool GetRuntimeLoad() { return rr_runtime_load_enabled.load(); }
inline void SetRrRedirect(bool enabled) { rr_redirect_enabled.store(enabled); }
inline bool GetRrRedirect() { return rr_redirect_enabled.load(); }

// Latched the first time a failure happens after our guide pass has already
// been recorded onto the game's command list. Once set, the redirect steps
// aside entirely and every later frame takes the untouched DLSS-SR path, which
// is the state a machine that never trips this latch runs in all the time.
// Cleared only by an explicit user toggle, so one failure costs one bad frame
// rather than the rest of the session.
inline std::atomic<bool> rr_trip_latched{false};
inline void ClearRrTrip() { rr_trip_latched.store(false); }
inline bool GetRrTrip() { return rr_trip_latched.load(); }

// The sl::Result that latched RR off. The overlay uses it to tell the Streamline
// exception case apart from the ordinary failure paths, because that one has a
// known environmental cause worth naming.
inline std::atomic<uint32_t> rr_trip_result{0};
inline uint32_t GetRrTripResult() { return rr_trip_result.load(); }

// Version of the nvngx_dlssd.dll sitting next to the game executable, or empty
// when it cannot be read. An outdated copy there is the known cause of the
// exception below: NGX resolves RR's preset hint onto a deprecated preset and
// throws out of CreateDlssInstance, surfacing as eErrorExceptionHandler.
// Replacing the DLL fixes it. Read once, since the file cannot change while the
// game is running.
inline const std::string& DlssdDllVersion() {
  static const std::string version = [] {
    const auto directory =
        renodx::utils::platform::GetCurrentProcessPath().parent_path();
    return renodx::utils::platform::GetFileVersion(directory / "nvngx_dlssd.dll");
  }();
  return version;
}

// Set once RR has rendered a frame that Streamline flagged eWarnOutOfVRAM.
// The frame is valid; this is a performance warning, not a failure.
inline std::atomic<bool> rr_vram_warned{false};
inline bool GetVramWarned() { return rr_vram_warned.load(); }
inline void SetRrPreset(uint32_t preset) { rr_preset_override.store(preset); }
inline uint32_t GetRrPreset() { return rr_preset_override.load(); }

// ---------------------------------------------------------------------------
// state captured from the game, read by the redirect
// ---------------------------------------------------------------------------

inline std::mutex state_mutex;

struct DlssOptionsSnapshot {
  bool captured = false;
  uint32_t mode = 0;
  uint32_t output_width = 0;
  uint32_t output_height = 0;
  float pre_exposure = 1.f;
  float exposure_scale = 1.f;
  int color_buffers_hdr = -1;
  int alpha_upscaling = -1;
};
inline DlssOptionsSnapshot dlss_options;

inline sl::Constants last_constants{};
inline bool constants_seen = false;
inline void* d3d_device = nullptr;
inline uint32_t scaling_input_width = 0;
inline uint32_t scaling_input_height = 0;

// ---------------------------------------------------------------------------
// DLSS-RR load + feature functions
// ---------------------------------------------------------------------------

inline void* FetchRrFunction(const char* name, int& result_out) {
  void* fn = nullptr;
  if (real_sl_get_feature_function == nullptr) {
    result_out = kNever;
    return nullptr;
  }
  result_out = static_cast<int>(real_sl_get_feature_function(sl::kFeatureDLSS_RR, name, fn));
  return fn;
}

// One-shot runtime load, for when the slInit request did not stick (the game
// never asks for RR itself).
inline std::atomic<bool> runtime_load_attempted{false};
inline void ServiceRuntimeLoad() {
  if (runtime_load_attempted.exchange(true)) return;
  if (!GetRuntimeLoad() || real_sl_is_feature_loaded == nullptr
      || real_sl_set_feature_loaded == nullptr) {
    return;
  }
  bool loaded = false;
  if (real_sl_is_feature_loaded(sl::kFeatureDLSS_RR, loaded) == sl::Result::eOk && !loaded) {
    real_sl_set_feature_loaded(sl::kFeatureDLSS_RR, true);
  }
}

// ---------------------------------------------------------------------------
// DLSS (SR) option capture — forward-only wrappers; the game fetches these
// pointers once at startup via slGetFeatureFunction, so every later call is
// captured here and still lands on the real plugin function unchanged.
// ---------------------------------------------------------------------------

inline sl::Result WrappedDlssSetOptions(
    const sl::ViewportHandle& viewport, const sl::DLSSOptions& options) {
  if (real_dlss_set_options == nullptr) return sl::Result::eErrorInvalidState;
  {
    const std::lock_guard lock(state_mutex);
    auto& capture = dlss_options;
    capture.captured = true;
    capture.mode = static_cast<uint32_t>(options.mode);
    capture.output_width = options.outputWidth;
    capture.output_height = options.outputHeight;
    capture.pre_exposure = options.preExposure;
    capture.exposure_scale = options.exposureScale;
    capture.color_buffers_hdr = static_cast<int>(options.colorBuffersHDR);
    capture.alpha_upscaling = static_cast<int>(options.alphaUpscalingEnabled);
  }
  return real_dlss_set_options(viewport, options);
}

inline sl::Result WrappedDlssGetOptimalSettings(
    const sl::DLSSOptions& options, sl::DLSSOptimalSettings& settings) {
  if (real_dlss_get_optimal_settings == nullptr) return sl::Result::eErrorInvalidState;
  return real_dlss_get_optimal_settings(options, settings);
}

// ---------------------------------------------------------------------------
// placeholder guide resources — DLSS-RR refuses to evaluate without Albedo,
// SpecularAlbedo and NormalRoughness, so the redirect supplies render-sized
// constant-filled textures when the real guide pass is not ready. Fail-closed.
// ---------------------------------------------------------------------------

struct GuideResources {
  bool created = false;
  uint32_t width = 0;
  uint32_t height = 0;
  ID3D12Resource* normal_roughness = nullptr;
  ID3D12Resource* normal_roughness_upload = nullptr;
  ID3D12Resource* albedo = nullptr;
  ID3D12Resource* albedo_upload = nullptr;
  ID3D12Resource* specular_albedo = nullptr;
  ID3D12Resource* specular_albedo_upload = nullptr;
};

inline GuideResources guide_resources;
inline std::string guide_last_error;
// Retired resources are never released mid-session: Streamline may still hold
// raw pointers to tagged resources from earlier frames.
inline std::vector<ID3D12Resource*> retired_guide_resources;

inline void RetireGuideResources() {
  const auto retire = [](ID3D12Resource*& texture, ID3D12Resource*& upload) {
    if (texture != nullptr) {
      retired_guide_resources.push_back(texture);
      texture = nullptr;
    }
    if (upload != nullptr) {
      retired_guide_resources.push_back(upload);
      upload = nullptr;
    }
  };
  retire(guide_resources.normal_roughness, guide_resources.normal_roughness_upload);
  retire(guide_resources.albedo, guide_resources.albedo_upload);
  retire(guide_resources.specular_albedo, guide_resources.specular_albedo_upload);
  guide_resources.created = false;
  guide_resources.width = 0;
  guide_resources.height = 0;
}

// Creates one DEFAULT-heap texture, fills it from a single-pixel pattern via a
// row-major UPLOAD staging buffer, records the copy + barrier on the game's
// command list, and leaves it in a shader-readable state.
inline bool CreateGuideTexture(
    ID3D12Device* device, ID3D12GraphicsCommandList* cmd, uint32_t width, uint32_t height,
    DXGI_FORMAT format, const void* pixel, uint32_t pixel_bytes, const char* name,
    ID3D12Resource** out_texture, ID3D12Resource** out_upload) {
  const auto fail = [&](const std::string& stage) {
    guide_last_error = std::string(name) + ": " + stage;
    return false;
  };

  const uint32_t row_bytes = width * pixel_bytes;
  const uint32_t row_pitch =
      (row_bytes + D3D12_TEXTURE_DATA_PITCH_ALIGNMENT - 1) / D3D12_TEXTURE_DATA_PITCH_ALIGNMENT
      * D3D12_TEXTURE_DATA_PITCH_ALIGNMENT;

  D3D12_HEAP_PROPERTIES upload_heap{};
  upload_heap.Type = D3D12_HEAP_TYPE_UPLOAD;

  D3D12_RESOURCE_DESC buffer_desc{};
  buffer_desc.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER;
  buffer_desc.Width = static_cast<uint64_t>(row_pitch) * height;
  buffer_desc.Height = 1;
  buffer_desc.DepthOrArraySize = 1;
  buffer_desc.MipLevels = 1;
  buffer_desc.Format = DXGI_FORMAT_UNKNOWN;
  buffer_desc.SampleDesc = {1, 0};
  buffer_desc.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR;

  ID3D12Resource* upload = nullptr;
  HRESULT hr = device->CreateCommittedResource(
      &upload_heap, D3D12_HEAP_FLAG_NONE, &buffer_desc, D3D12_RESOURCE_STATE_GENERIC_READ,
      nullptr, IID_PPV_ARGS(&upload));
  if (FAILED(hr)) {
    return fail("staging CreateCommittedResource failed (" + HresultLabel(hr) + ")");
  }

  void* mapped = nullptr;
  const D3D12_RANGE read_range{0, 0};
  hr = upload->Map(0, &read_range, &mapped);
  if (FAILED(hr) || mapped == nullptr) {
    upload->Release();
    return fail("staging Map failed (" + HresultLabel(hr) + ")");
  }
  for (uint32_t y = 0; y < height; ++y) {
    auto* row = static_cast<uint8_t*>(mapped) + static_cast<size_t>(row_pitch) * y;
    for (uint32_t x = 0; x < width; ++x) {
      memcpy(row + static_cast<size_t>(x) * pixel_bytes, pixel, pixel_bytes);
    }
  }
  upload->Unmap(0, nullptr);

  D3D12_HEAP_PROPERTIES default_heap{};
  default_heap.Type = D3D12_HEAP_TYPE_DEFAULT;

  D3D12_RESOURCE_DESC texture_desc{};
  texture_desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
  texture_desc.Width = width;
  texture_desc.Height = height;
  texture_desc.DepthOrArraySize = 1;
  texture_desc.MipLevels = 1;
  texture_desc.Format = format;
  texture_desc.SampleDesc = {1, 0};
  texture_desc.Layout = D3D12_TEXTURE_LAYOUT_UNKNOWN;

  ID3D12Resource* texture = nullptr;
  hr = device->CreateCommittedResource(
      &default_heap, D3D12_HEAP_FLAG_NONE, &texture_desc, D3D12_RESOURCE_STATE_COPY_DEST,
      nullptr, IID_PPV_ARGS(&texture));
  if (FAILED(hr)) {
    upload->Release();
    return fail("CreateCommittedResource failed (" + HresultLabel(hr) + ")");
  }

  D3D12_TEXTURE_COPY_LOCATION source{};
  source.pResource = upload;
  source.Type = D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT;
  source.PlacedFootprint.Offset = 0;
  source.PlacedFootprint.Footprint.Format = format;
  source.PlacedFootprint.Footprint.Width = width;
  source.PlacedFootprint.Footprint.Height = height;
  source.PlacedFootprint.Footprint.Depth = 1;
  source.PlacedFootprint.Footprint.RowPitch = row_pitch;

  D3D12_TEXTURE_COPY_LOCATION destination{};
  destination.pResource = texture;
  destination.Type = D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX;
  destination.SubresourceIndex = 0;
  cmd->CopyTextureRegion(&destination, 0, 0, 0, &source, nullptr);

  D3D12_RESOURCE_BARRIER barrier{};
  barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
  barrier.Transition.pResource = texture;
  barrier.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES;
  barrier.Transition.StateBefore = D3D12_RESOURCE_STATE_COPY_DEST;
  barrier.Transition.StateAfter = D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE
                                  | D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE;
  cmd->ResourceBarrier(1, &barrier);

  *out_texture = texture;
  *out_upload = upload;
  return true;
}

inline bool EnsureGuideResources(
    ID3D12Device* device, ID3D12GraphicsCommandList* cmd, uint32_t width, uint32_t height) {
  if (guide_resources.created && guide_resources.width == width
      && guide_resources.height == height) {
    return true;
  }
  if (device == nullptr) {
    guide_last_error = "no D3D12 device captured";
    return false;
  }
  if (cmd == nullptr) {
    guide_last_error = "no command list on evaluate";
    return false;
  }

  RetireGuideResources();
  guide_last_error.clear();

  // Flat view-space normal (0, 0, 1) in RGB, roughness 1.0 in alpha (RGBA16F).
  const uint16_t nr_pixel[4] = {0x0000, 0x0000, 0x3C00, 0x3C00};
  // Neutral gray albedo, black specular albedo (RGBA8, linear).
  const uint8_t albedo_pixel[4] = {128, 128, 128, 255};
  const uint8_t specular_pixel[4] = {0, 0, 0, 255};

  if (!CreateGuideTexture(
          device, cmd, width, height, DXGI_FORMAT_R16G16B16A16_FLOAT, nr_pixel, sizeof(nr_pixel),
          "NormalRoughness", &guide_resources.normal_roughness,
          &guide_resources.normal_roughness_upload)
      || !CreateGuideTexture(
          device, cmd, width, height, DXGI_FORMAT_R8G8B8A8_UNORM, albedo_pixel,
          sizeof(albedo_pixel), "Albedo", &guide_resources.albedo,
          &guide_resources.albedo_upload)
      || !CreateGuideTexture(
          device, cmd, width, height, DXGI_FORMAT_R8G8B8A8_UNORM, specular_pixel,
          sizeof(specular_pixel), "SpecularAlbedo", &guide_resources.specular_albedo,
          &guide_resources.specular_albedo_upload)) {
    RetireGuideResources();
    return false;
  }

  guide_resources.created = true;
  guide_resources.width = width;
  guide_resources.height = height;
  return true;
}

// ---------------------------------------------------------------------------
// hooks — the DLSS-SR evaluate is answered with DLSS-RR; the rest forward
// ---------------------------------------------------------------------------

inline void CaptureScalingInput(const sl::ResourceTag* tags, uint32_t num_tags) {
  if (tags == nullptr) return;
  for (uint32_t i = 0; i < num_tags; ++i) {
    if (tags[i].type != sl::kBufferTypeScalingInputColor) continue;
    scaling_input_width = tags[i].extent.width;
    scaling_input_height = tags[i].extent.height;
    return;
  }
}

// Streamline's logger never writes to ReShade's log: its three sinks are a
// console (only if one is active), OutputDebugStringA (only when no callback is
// set), and a file (only when pathToLogsAndData is set). See
// sl.log/log.cpp:197-222. So routing logLevel up alone produced nothing in
// ReShade.log; this callback is what actually puts SL and NGX text there.
// It is a plain function pointer because sl::Preferences stores one, so it
// cannot be a lambda and has to be a free function. Streamline calls it from
// its own log worker thread, so it must be thread-safe; reshade::log::message
// is, and ReShade stamps the line with its own timestamp.
// Streamline stamps every line with a wall clock and a free-running elapsed
// counter: `[17-12-24][streamline][info][tid:23708][234s:289ms:021us]body`. The
// elapsed field advances on every single call, so without stripping it no two
// lines ever compare equal and nothing downstream can deduplicate them. ReShade
// already supplies both a timestamp and the thread id, so the wall clock, the
// `streamline` tag and the elapsed counter are all redundant here. Removing them
// is what makes the rate limit in ForwardSlLog lossless rather than merely lossy.
inline std::string NormalizeSlLog(const std::string& in) {
  std::string out;
  out.reserve(in.size());
  size_t i = 0;
  while (i < in.size() && in[i] == '[') {
    const size_t close = in.find(']', i);
    if (close == std::string::npos) break;
    const std::string field = in.substr(i + 1, close - i - 1);
    const bool wall_clock = field.size() == 8 && field[2] == '-' && field[5] == '-';
    const bool is_elapsed = field.find(':') != std::string::npos
                         && field.find('s') != std::string::npos
                         && field.find("ms") != std::string::npos;
    if (!wall_clock && field != "streamline" && !is_elapsed) {
      // A level, a tid, or already the source body: keep it verbatim.
      out.append(in, i, close - i + 1);
    }
    i = close + 1;
    if (i < in.size() && in[i] == ' ') ++i;
  }
  out.append(in, i, std::string::npos);
  return out;
}

inline void ForwardSlLog(sl::LogType type, const char* msg) {
  if (!guides::DiagGuidesEnabled() || msg == nullptr) return;
  const char* tag = type == sl::LogType::eError   ? "SL error"
                 : type == sl::LogType::eWarn    ? "SL warn"
                                                  : "SL";
  std::string trimmed(msg);
  while (!trimmed.empty()
         && (trimmed.back() == '\n' || trimmed.back() == '\r' || trimmed.back() == ' ')) {
    trimmed.pop_back();
  }
  if (trimmed.empty()) return;
  // Streamline loggers cap their own dedup when the level is verbose
  // (log.cpp:372), so at eVerbose this fires for every message, including NGX's.
  // Unthrottled that was ~3.6k lines in minutes, nearly all of it identical
  // per-frame VRAM and telemetry spam. Rate limiting by message text keeps every
  // distinct line and reports how many repeats were folded in, so no distinct
  // information is lost.
  const std::string line = NormalizeSlLog(trimmed);
  guides::LogThrottled("sl:" + line, std::string("[") + tag + "] " + line,
                       std::chrono::milliseconds(5000));
}

inline sl::Result HookedSlInit(const sl::Preferences& pref, uint64_t sdk_version) {
  // Reached only if the interposer hook was armed before the game called
  // slInit. The log line below proves which path we took.
  if (guides::DiagGuidesEnabled()) {
    guides::LogOnce("slinit:entered", "HookedSlInit reached (Streamline hook is live)");
  }
  // Build the effective feature list with DLSS-RR appended, unless the game
  // already asked for it or the list is a shape we do not touch. Only the
  // feature-list fields are patched; everything else stays as the game wrote
  // it, and the original fields are restored right after the call.
  const uint32_t requested_count = pref.featuresToLoad != nullptr ? pref.numFeaturesToLoad : 0;
  uint32_t patched_count = 0;
  bool appended_rr = false;
  if (pref.featuresToLoad != nullptr && requested_count <= kMaxInitFeatures) {
    bool rr_requested = false;
    for (uint32_t i = 0; i < requested_count; ++i) {
      init_features_patched_storage[patched_count++] = pref.featuresToLoad[i];
      if (pref.featuresToLoad[i] == sl::kFeatureDLSS_RR) rr_requested = true;
    }
    if (!rr_requested && GetInitInjection()) {
      init_features_patched_storage[patched_count++] = sl::kFeatureDLSS_RR;
      appended_rr = true;
    }
  }

  sl::Preferences& mutable_pref = const_cast<sl::Preferences&>(pref);
  const sl::Feature* const original_features = pref.featuresToLoad;
  const uint32_t original_count = pref.numFeaturesToLoad;
  const sl::LogLevel original_log_level = pref.logLevel;
  // Plain auto: writing the type out would put the const inside the function
// type and trip C4180.
  const auto original_log_callback = pref.logMessageCallback;
  if (appended_rr) {
    mutable_pref.featuresToLoad = init_features_patched_storage;
    mutable_pref.numFeaturesToLoad = patched_count;
  }
  // Debug-logging toggle also raises Streamline's own verbosity, so NGX prints
  // its internal error text instead of only surfacing a sl::Result code. NGX
  // logging level inherits from this (logLevelNGX defaults to it).
  const bool want_verbose = guides::DiagGuidesEnabled();
  if (want_verbose) {
    mutable_pref.logLevel = sl::LogLevel::eVerbose;
    mutable_pref.showConsole = false;  // the callback is the sink, not a console
    mutable_pref.logMessageCallback = &ForwardSlLog;
  }
  if (guides::DiagGuidesEnabled()) {
    guides::LogEvent(
        "slInit hook reached; debug logging is active in this build, raising"
        " Streamline log level to verbose and routing its log into ReShade.log"
        + std::string(want_verbose ? "" : " (NOT applied: toggle off at this point)")
        + "; requested features " + std::to_string(requested_count) + ", appended RR "
        + std::to_string(appended_rr ? 1 : 0));
  }

  const auto result = real_sl_init(pref, sdk_version);

  if (appended_rr) {
    mutable_pref.featuresToLoad = original_features;
    mutable_pref.numFeaturesToLoad = original_count;
  }
  if (want_verbose) {
    mutable_pref.logLevel = original_log_level;
    mutable_pref.logMessageCallback = original_log_callback;
  }
  return result;
}

inline sl::Result HookedSlSetD3DDevice(void* device) {
  const auto result = real_sl_set_d3d_device(device);
  const std::lock_guard lock(state_mutex);
  d3d_device = device;
  return result;
}

// Diagnostic: what the game actually tags, one line per distinct type/format.
inline void LogGameTags(const char* source, const sl::ResourceTag* tags, uint32_t num_tags) {
  if (!guides::DiagGuidesEnabled() || tags == nullptr) return;
  for (uint32_t i = 0; i < num_tags; ++i) {
    const auto& tag = tags[i];
    if (tag.resource == nullptr) continue;
    const uint32_t format = static_cast<uint32_t>(tag.resource->nativeFormat);
    const uint32_t width = tag.extent.width;
    const uint32_t height = tag.extent.height;
    guides::LogOnce(
        std::string("gametag:") + source + ":" + std::to_string(static_cast<uint32_t>(tag.type))
            + ":" + std::to_string(format),
        std::string("game tag via ") + source + ": type="
            + std::to_string(static_cast<uint32_t>(tag.type)) + " format=0x"
            + HresultLabel(static_cast<HRESULT>(format)) + " extent="
            + std::to_string(width) + "x" + std::to_string(height));
  }
}

inline sl::Result HookedSlSetTag(
    const sl::ViewportHandle& viewport, const sl::ResourceTag* tags, uint32_t num_tags,
    sl::CommandBuffer* cmd) {
  ServiceRuntimeLoad();
  const auto result = real_sl_set_tag(viewport, tags, num_tags, cmd);
  LogGameTags("slSetTag", tags, num_tags);
  const std::lock_guard lock(state_mutex);
  CaptureScalingInput(tags, num_tags);
  return result;
}

inline sl::Result HookedSlSetTagForFrame(
    const sl::FrameToken& frame, const sl::ViewportHandle& viewport, const sl::ResourceTag* tags,
    uint32_t num_tags, sl::CommandBuffer* cmd) {
  ServiceRuntimeLoad();
  const auto result = real_sl_set_tag_for_frame(frame, viewport, tags, num_tags, cmd);
  LogGameTags("slSetTagForFrame", tags, num_tags);
  const std::lock_guard lock(state_mutex);
  CaptureScalingInput(tags, num_tags);
  return result;
}

// Camera motion between the last two slSetConstants calls, normalised so that
// roughly 1.0 is "fully moving". Translation and rotation are each divided by
// their own scale and the larger wins, so a pan registers even when the camera
// is not translating. Measured per frame, not per second: reprojection error -
// and therefore ghosting - is a per-frame quantity.
static const float kMotionTranslationScale = 0.5f;  // world units per frame
static const float kMotionRotationScale = 0.01f;    // radians per frame
inline std::atomic<float> camera_motion{0.f};
inline sl::float3 last_camera_position{};
inline sl::float3 last_camera_forward{};
inline sl::float3 last_camera_up{};
inline bool camera_motion_valid = false;

inline float GetCameraMotion() { return camera_motion.load(); }

// Length and normalised dot, written out rather than relying on helper naming.
inline float VectorLength(const sl::float3& v) {
  return sqrtf((v.x * v.x) + (v.y * v.y) + (v.z * v.z));
}

// Must be called with state_mutex held, from the slSetConstants hook.
inline void UpdateCameraMotion(const sl::Constants& values) {
  if (!camera_motion_valid) {
    last_camera_position = values.cameraPos;
    last_camera_forward = values.cameraFwd;
    last_camera_up = values.cameraUp;
    camera_motion_valid = true;
    camera_motion.store(0.f);
    return;
  }

  const float translation = VectorLength(sl::float3{
      values.cameraPos.x - last_camera_position.x,
      values.cameraPos.y - last_camera_position.y,
      values.cameraPos.z - last_camera_position.z});

  const auto angle_between = [](const sl::float3& a, const sl::float3& b) {
    const float la = VectorLength(a);
    const float lb = VectorLength(b);
    if (la <= 0.f || lb <= 0.f) return 0.f;
    const float cosine = ((a.x * b.x) + (a.y * b.y) + (a.z * b.z)) / (la * lb);
    return acosf(std::clamp(cosine, -1.f, 1.f));
  };
  const float rotation = std::max(
      angle_between(values.cameraFwd, last_camera_forward),
      angle_between(values.cameraUp, last_camera_up));

  last_camera_position = values.cameraPos;
  last_camera_forward = values.cameraFwd;
  last_camera_up = values.cameraUp;

  camera_motion.store(std::max(
      translation / kMotionTranslationScale, rotation / kMotionRotationScale));
}

inline sl::Result HookedSlSetConstants(
    const sl::Constants& values, const sl::FrameToken& frame, const sl::ViewportHandle& viewport) {
  ServiceRuntimeLoad();
  const auto result = real_sl_set_constants(values, frame, viewport);
  const std::lock_guard lock(state_mutex);
  last_constants = values;
  constants_seen = true;
  UpdateCameraMotion(values);
  return result;
}

inline sl::Result HookedSlEvaluateFeature(
    sl::Feature feature, const sl::FrameToken& frame, const sl::BaseStructure** inputs,
    uint32_t num_inputs, sl::CommandBuffer* cmd) {
  ServiceRuntimeLoad();

  // Answer the game's DLSS-SR evaluation with DLSS-RR. Options are mirrored
  // from the game's own slDLSSSetOptions capture, so the in-game settings keep
  // controlling internal resolution.
  //
  // Failures split in two. Anything detected before our guide pass is recorded
  // hands the frame to the untouched SR call, which is safe because the command
  // list is still exactly as the game left it. Anything detected after that
  // point hands the frame back with its own error code and latches RR off for
  // the session instead — see the bail lambda below.
  if (feature == sl::kFeatureDLSS && GetRrRedirect() && !GetRrTrip()) {
    // Every early-out below hands the frame back to the untouched SR call. Log
    // each distinct reason once so a machine that never reaches RR says why.
    const auto fallback = [&](const char* reason) {
      if (guides::DiagGuidesEnabled()) {
        guides::LogOnce(std::string("fallback:") + reason,
                        std::string("falling back to SR: ") + reason);
      }
      return real_sl_evaluate_feature(feature, frame, inputs, num_inputs, cmd);
    };

    // Once our guide pass has been recorded onto the game's command list, the
    // list is no longer in the shape Streamline's own evaluate expects, and if
    // the RR evaluate below unwinds through an exception there is no way to put
    // it back. Issuing the untouched SR call on that same list is the one thing
    // we must not do, so from that point on a failure hands the frame back with
    // its own error code and latches RR off for the session. The game loses this
    // one upscale, not the frame: colorOut still holds the previous contents,
    // and every later frame takes the untouched SR path.
    const auto bail = [&](const char* reason, sl::Result code) {
      rr_trip_latched.store(true);
      rr_trip_result.store(static_cast<uint32_t>(code));
      guides::LogEvent(
          std::string("RR latched off for this session after ") + reason
          + ", result=" + std::to_string(static_cast<uint32_t>(code))
          + ". Not calling SR on this command list; the game keeps rendering and"
            " DLSS-SR handles every frame from here.");
      if (code == sl::Result::eErrorExceptionHandler) {
        guides::LogEvent(
            "that result is a Streamline exception; the usual cause is an outdated"
            " nvngx_dlssd.dll next to the game executable. Found version '"
            + DlssdDllVersion() + "'. Update DLSS or the GPU driver and restart.");
      }
      return code;
    };

    DlssOptionsSnapshot captured;
    sl::Constants constants{};
    bool have_constants = false;
    void* device = nullptr;
    uint32_t input_width = 0;
    uint32_t input_height = 0;
    {
      const std::lock_guard lock(state_mutex);
      captured = dlss_options;
      have_constants = constants_seen;
      constants = last_constants;
      device = d3d_device;
      input_width = scaling_input_width;
      input_height = scaling_input_height;
    }

    if (real_dlssd_set_options == nullptr) {
      int fetch_result = kNever;
      real_dlssd_set_options = reinterpret_cast<PFun_slDLSSDSetOptions*>(
          FetchRrFunction("slDLSSDSetOptions", fetch_result));
      if (real_dlssd_set_options == nullptr) return fallback("slDLSSDSetOptions unavailable");
    }
    if (!captured.captured) return fallback("no captured slDLSSOptions yet");
    const bool dims_ok = captured.output_width != 0 && captured.output_width != 0xFFFFFFFFu
                         && captured.output_height != 0
                         && captured.output_height != 0xFFFFFFFFu;
    if (!dims_ok) return fallback("captured options have no output size");
    if (!have_constants) return fallback("slSetConstants not seen yet");

    // DLSS-RR needs the world/view matrices; sl::Constants only carries the
    // camera basis, so build them the way Streamline's own helpers expect.
    sl::float4x4 world_to_view{};
    sl::float4x4 view_to_world{};
    if (!BuildCameraMatricesFromConstants(constants, world_to_view, view_to_world)) {
      return fallback("camera basis missing in slSetConstants");
    }
    if (input_width == 0 || input_height == 0) {
      return fallback("ScalingInputColor extent not seen yet");
    }

    if (!EnsureGuideResources(
            reinterpret_cast<ID3D12Device*>(device),
            reinterpret_cast<ID3D12GraphicsCommandList*>(cmd), input_width, input_height)) {
      return fallback("placeholder guides unavailable");
    }

    // Generate guide buffers from the current frame's G-buffer immediately
    // before RR evaluates, falling back to the placeholders if capture is not ready.
    float world_to_view_rows[3][4] = {};
    for (int row = 0; row < 3; ++row) {
      world_to_view_rows[row][0] = world_to_view[row].x;
      world_to_view_rows[row][1] = world_to_view[row].y;
      world_to_view_rows[row][2] = world_to_view[row].z;
      world_to_view_rows[row][3] = world_to_view[row].w;
    }
    const guides::ReadyGuides real_guides = guides::PrepareEvaluate(
        reinterpret_cast<ID3D12Device*>(device),
        reinterpret_cast<ID3D12GraphicsCommandList*>(cmd), input_width,
        input_height, world_to_view_rows);

    sl::ViewportHandle viewport(0u);
    if (inputs != nullptr) {
      for (uint32_t i = 0; i < num_inputs; ++i) {
        if (inputs[i] == nullptr || inputs[i]->structType.data1 != 0x171b6435) continue;
        viewport = *static_cast<const sl::ViewportHandle*>(inputs[i]);
        break;
      }
    }

    sl::DLSSDOptions options{};
    options.mode = static_cast<sl::DLSSMode>(captured.mode);
    options.outputWidth = captured.output_width;
    options.outputHeight = captured.output_height;
    options.preExposure = captured.pre_exposure;
    options.exposureScale = captured.exposure_scale;
    if (captured.color_buffers_hdr >= 0) {
      options.colorBuffersHDR = static_cast<sl::Boolean>(captured.color_buffers_hdr);
    }
    if (captured.alpha_upscaling >= 0) {
      options.alphaUpscalingEnabled = static_cast<sl::Boolean>(captured.alpha_upscaling);
    }
    options.worldToCameraView = world_to_view;
    options.cameraViewToWorld = view_to_world;
    options.normalRoughnessMode = sl::DLSSDNormalRoughnessMode::ePacked;
    // What NGX's create is about to be handed. The reporter's crash lands inside
    // NGXDLAA::CreateDlssInstance right after Denoise_Mode is logged, so record
    // the exact geometry and mode that produced it; Streamline does not log the
    // guide formats, and it compares every guide extent against colorIn
    // internally (dlss_dEntry.cpp:460,611) and drops mismatches silently.
    if (guides::DiagGuidesEnabled()) {
      guides::LogThrottled(
          "create:params",
          std::string("RR create: mode=") + std::to_string(static_cast<uint32_t>(captured.mode))
              + " render=" + std::to_string(input_width) + "x" + std::to_string(input_height)
              + " out=" + std::to_string(captured.output_width) + "x"
              + std::to_string(captured.output_height) + " nrMode=ePacked preset="
              + std::to_string(static_cast<uint32_t>(GetRrPreset())) + " hdr="
              + std::to_string(captured.color_buffers_hdr) + " alpha="
              + std::to_string(captured.alpha_upscaling),
          std::chrono::milliseconds(10000));
    }
    // User-selected preset applied to every mode (F = RR 4.5 default preset).
    const auto preset_override = static_cast<sl::DLSSDPreset>(GetRrPreset());
    options.dlaaPreset = preset_override;
    options.qualityPreset = preset_override;
    options.balancedPreset = preset_override;
    options.performancePreset = preset_override;
    options.ultraPerformancePreset = preset_override;
    options.ultraQualityPreset = preset_override;

    // Past this point the guide pass is already on the command list, so both
    // remaining failure paths bail rather than fall back.
    const auto set_result = real_dlssd_set_options(viewport, options);
    if (set_result != sl::Result::eOk) {
      return bail("slDLSSDSetOptions failed", set_result);
    }

    // The guide tags ride in the evaluate inputs array — sl.common checks
    // those before the frame's global tag store. Real (captured) guides when
    // ready, placeholders otherwise.
    const uint32_t srv_state =
        D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE | D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE;
    void* nr_texture = guide_resources.normal_roughness;
    uint32_t nr_format = static_cast<uint32_t>(DXGI_FORMAT_R16G16B16A16_FLOAT);
    void* albedo_texture = guide_resources.albedo;
    uint32_t albedo_format = static_cast<uint32_t>(DXGI_FORMAT_R8G8B8A8_UNORM);
    void* specular_texture = guide_resources.specular_albedo;
    uint32_t specular_format = static_cast<uint32_t>(DXGI_FORMAT_R8G8B8A8_UNORM);
    if (real_guides.real) {
      nr_texture = real_guides.normal_roughness;
      albedo_texture = real_guides.albedo;
      albedo_format = real_guides.albedo_format;
      specular_texture = real_guides.specular;
      specular_format = real_guides.specular_format;
    }
    sl::Resource normal_roughness_resource(sl::ResourceType::eTex2d, nr_texture, srv_state);
    normal_roughness_resource.width = input_width;
    normal_roughness_resource.height = input_height;
    normal_roughness_resource.nativeFormat = nr_format;
    sl::Resource albedo_resource(sl::ResourceType::eTex2d, albedo_texture, srv_state);
    albedo_resource.width = input_width;
    albedo_resource.height = input_height;
    albedo_resource.nativeFormat = albedo_format;
    sl::Resource specular_albedo_resource(sl::ResourceType::eTex2d, specular_texture, srv_state);
    specular_albedo_resource.width = input_width;
    specular_albedo_resource.height = input_height;
    specular_albedo_resource.nativeFormat = specular_format;

    sl::Extent guide_extent{0, 0, input_width, input_height};
    // Guide formats are never logged by Streamline, and all three guides carry
    // the render extent, so a mismatch here is invisible from the outside.
    if (guides::DiagGuidesEnabled()) {
      guides::LogThrottled(
          "create:guides",
          std::string("RR guides: source=") + (real_guides.real ? "captured" : "placeholder")
              + " extent=" + std::to_string(guide_extent.width) + "x"
              + std::to_string(guide_extent.height) + " nrFormat=0x"
              + std::to_string(nr_format) + " albedoFormat=0x"
              + std::to_string(albedo_format) + " specularFormat=0x"
              + std::to_string(specular_format),
          std::chrono::milliseconds(10000));
    }
    sl::ResourceTag tag_normal_roughness(
        &normal_roughness_resource, sl::kBufferTypeNormalRoughness,
        sl::ResourceLifecycle::eValidUntilPresent, &guide_extent);
    sl::ResourceTag tag_albedo(
        &albedo_resource, sl::kBufferTypeAlbedo, sl::ResourceLifecycle::eValidUntilPresent,
        &guide_extent);
    sl::ResourceTag tag_specular_albedo(
        &specular_albedo_resource, sl::kBufferTypeSpecularAlbedo,
        sl::ResourceLifecycle::eValidUntilPresent, &guide_extent);

    // The game hands the evaluate its own inputs (viewport handle and its
    // tags) and our three guides ride at the end of the same array. The copy
    // cap must leave room for them: the game passes few inputs, but a cap that
    // fills the array first would silently drop every guide.
    constexpr uint32_t kMaxGameInputs = 12;
    const sl::BaseStructure* extended_inputs[kMaxGameInputs + 3] = {};
    uint32_t extended_count = 0;
    const uint32_t game_inputs_copied =
        (inputs != nullptr && num_inputs < kMaxGameInputs) ? num_inputs : kMaxGameInputs;
    for (uint32_t i = 0; i < game_inputs_copied; ++i) {
      extended_inputs[extended_count++] = inputs[i];
    }
    extended_inputs[extended_count++] = &tag_normal_roughness;
    extended_inputs[extended_count++] = &tag_albedo;
    extended_inputs[extended_count++] = &tag_specular_albedo;

    // Diagnostic: exactly what we hand RR, so a dropped tag shows up here as a
    // total smaller than game + 3.
    if (guides::DiagGuidesEnabled()) {
      guides::LogThrottled(
          "rr:tags",
          "RR evaluate inputs: game=" + std::to_string(num_inputs)
              + " copied=" + std::to_string(game_inputs_copied)
              + " total=" + std::to_string(extended_count) + " (nr+albedo+specular)"
              + " rr_active=" + std::to_string(GetRrRedirect() ? 1 : 0),
          std::chrono::milliseconds(2000));
    }

    const auto rr_result = real_sl_evaluate_feature(
        sl::kFeatureDLSS_RR, frame, extended_inputs, extended_count, cmd);
    // eWarnOutOfVRAM is a rendered frame, not a failure. Streamline only
    // downgrades to it from eOk, when the VRAM budget is exhausted
    // (commonInterface.cpp:542-553), and logs "Exceeded VRAM budget, various
    // performance issues including stuttering can be expected". Treating it as
    // an error latched RR off and discarded working frames at 4K output.
    if (rr_result != sl::Result::eOk && rr_result != sl::Result::eWarnOutOfVRAM) {
      return bail("RR evaluate failed", rr_result);
    }
    if (rr_result == sl::Result::eWarnOutOfVRAM) {
      rr_vram_warned.store(true);
      guides::LogOnce(
          "rr:vram",
          "RR over the VRAM budget: evaluate rendered, but Streamline reports"
          " eWarnOutOfVRAM and warns of stutter. RR stays enabled.");
    }
    return rr_result;
  }

  return real_sl_evaluate_feature(feature, frame, inputs, num_inputs, cmd);
}

inline sl::Result HookedSlGetFeatureFunction(
    sl::Feature feature, const char* function_name, void*& function) {
  const auto result = real_sl_get_feature_function(feature, function_name, function);
  // Forward-only wrapping: hand the game our capture wrapper for the DLSS
  // option calls; the wrapper forwards to the real function unchanged.
  if (result == sl::Result::eOk && function != nullptr && function_name != nullptr
      && feature == sl::kFeatureDLSS) {
    if (std::strcmp(function_name, "slDLSSSetOptions") == 0) {
      real_dlss_set_options = reinterpret_cast<PFun_slDLSSSetOptions*>(function);
      function = reinterpret_cast<void*>(WrappedDlssSetOptions);
    } else if (std::strcmp(function_name, "slDLSSGetOptimalSettings") == 0) {
      real_dlss_get_optimal_settings = reinterpret_cast<PFun_slDLSSGetOptimalSettings*>(function);
      function = reinterpret_cast<void*>(WrappedDlssGetOptimalSettings);
    }
  }
  return result;
}

// ---------------------------------------------------------------------------
// hook installation
// ---------------------------------------------------------------------------

inline std::mutex detour_mutex;
inline std::atomic<bool> armed = false;

inline bool ArmStreamlineHooks(HMODULE interposer) {
  if (armed.load()) return true;
  if (interposer == nullptr) return false;
  const std::lock_guard install_lock(detour_mutex);
  if (armed.load()) return true;

  auto* p_init = reinterpret_cast<PFun_slInit*>(GetProcAddress(interposer, "slInit"));
  auto* p_set_device =
      reinterpret_cast<PFun_slSetD3DDevice*>(GetProcAddress(interposer, "slSetD3DDevice"));
  auto* p_set_tag = reinterpret_cast<PFun_slSetTag*>(GetProcAddress(interposer, "slSetTag"));
  auto* p_set_tag_frame = reinterpret_cast<PFun_slSetTagForFrame*>(
      GetProcAddress(interposer, "slSetTagForFrame"));
  auto* p_constants =
      reinterpret_cast<PFun_slSetConstants*>(GetProcAddress(interposer, "slSetConstants"));
  auto* p_evaluate =
      reinterpret_cast<PFun_slEvaluateFeature*>(GetProcAddress(interposer, "slEvaluateFeature"));
  auto* p_get_function = reinterpret_cast<PFun_slGetFeatureFunction*>(
      GetProcAddress(interposer, "slGetFeatureFunction"));
  auto* p_loaded =
      reinterpret_cast<PFun_slIsFeatureLoaded*>(GetProcAddress(interposer, "slIsFeatureLoaded"));
  auto* p_set_loaded =
      reinterpret_cast<PFun_slSetFeatureLoaded*>(GetProcAddress(interposer, "slSetFeatureLoaded"));

  if (p_init == nullptr || p_evaluate == nullptr || p_constants == nullptr
      || p_set_tag_frame == nullptr) {
    LogWarn("sl.interposer.dll is missing core entry points — hooks not installed");
    return false;
  }

  real_sl_init = p_init;
  real_sl_set_d3d_device = p_set_device;
  real_sl_set_tag = p_set_tag;
  real_sl_set_tag_for_frame = p_set_tag_frame;
  real_sl_set_constants = p_constants;
  real_sl_evaluate_feature = p_evaluate;
  real_sl_get_feature_function = p_get_function;
  real_sl_is_feature_loaded = p_loaded;
  real_sl_set_feature_loaded = p_set_loaded;

  LONG error = DetourTransactionBegin();
  const bool transaction_started = error == NO_ERROR;
  if (error == NO_ERROR) error = DetourUpdateThread(GetCurrentThread());
  if (error == NO_ERROR) {
    error = DetourAttach(reinterpret_cast<void**>(&real_sl_init), HookedSlInit);
  }
  if (error == NO_ERROR && real_sl_set_d3d_device != nullptr) {
    error = DetourAttach(reinterpret_cast<void**>(&real_sl_set_d3d_device), HookedSlSetD3DDevice);
  }
  if (error == NO_ERROR && real_sl_set_tag != nullptr) {
    error = DetourAttach(reinterpret_cast<void**>(&real_sl_set_tag), HookedSlSetTag);
  }
  if (error == NO_ERROR && real_sl_set_tag_for_frame != nullptr) {
    error = DetourAttach(
        reinterpret_cast<void**>(&real_sl_set_tag_for_frame), HookedSlSetTagForFrame);
  }
  if (error == NO_ERROR && real_sl_set_constants != nullptr) {
    error = DetourAttach(reinterpret_cast<void**>(&real_sl_set_constants), HookedSlSetConstants);
  }
  if (error == NO_ERROR) {
    error = DetourAttach(reinterpret_cast<void**>(&real_sl_evaluate_feature), HookedSlEvaluateFeature);
  }
  if (error == NO_ERROR && real_sl_get_feature_function != nullptr) {
    error = DetourAttach(
        reinterpret_cast<void**>(&real_sl_get_feature_function), HookedSlGetFeatureFunction);
  }

  if (error != NO_ERROR) {
    if (transaction_started) DetourTransactionAbort();
  } else {
    error = DetourTransactionCommit();
  }
  if (error != NO_ERROR) {
    LogWarn("Detour commit FAILED for Streamline entry points");
    real_sl_init = nullptr;
    real_sl_set_d3d_device = nullptr;
    real_sl_set_tag = nullptr;
    real_sl_set_tag_for_frame = nullptr;
    real_sl_set_constants = nullptr;
    real_sl_evaluate_feature = nullptr;
    real_sl_get_feature_function = nullptr;
    real_sl_is_feature_loaded = nullptr;
    real_sl_set_feature_loaded = nullptr;
    return false;
  }

  armed.store(true);
  LogInfo("Streamline entry points hooked in " + ModuleNameOf(interposer));
  return true;
}

inline bool TryArmFromLoadedModules() {
  if (armed.load()) return true;
  HMODULE interposer = GetModuleHandleW(L"sl.interposer.dll");
  if (interposer == nullptr) return false;
  return ArmStreamlineHooks(interposer);
}

// Present-time retry: cheap, and only logs when arming actually happens.
inline void Poll() {
  if (!armed.load()) {
    TryArmFromLoadedModules();
  }
}

// ---------------------------------------------------------------------------
// loader hooks — sl.interposer.dll may be imported statically (present before
// this addon loads) or loaded dynamically; watch for both.
// ---------------------------------------------------------------------------

inline decltype(&LoadLibraryW) real_load_library_w = nullptr;
inline decltype(&LoadLibraryExW) real_load_library_ex_w = nullptr;
inline decltype(&LoadLibraryA) real_load_library_a = nullptr;
inline decltype(&LoadLibraryExA) real_load_library_ex_a = nullptr;
inline std::atomic<bool> loader_hooks_installed = false;

inline void MaybeArmFromPath(const wchar_t* path, HMODULE loaded) {
  if (armed.load() || path == nullptr || loaded == nullptr) return;
  const wchar_t* name = wcsrchr(path, L'\\');
  name = (name != nullptr) ? name + 1 : path;
  if (_wcsicmp(name, L"sl.interposer.dll") == 0) {
    ArmStreamlineHooks(loaded);
  }
}

inline void MaybeArmFromPathA(const char* path, HMODULE loaded) {
  if (armed.load() || path == nullptr || loaded == nullptr) return;
  const char* name = strrchr(path, '\\');
  name = (name != nullptr) ? name + 1 : path;
  if (_stricmp(name, "sl.interposer.dll") == 0) {
    ArmStreamlineHooks(loaded);
  }
}

inline HMODULE WINAPI HookedLoadLibraryW(LPCWSTR file_name) {
  HMODULE result = real_load_library_w(file_name);
  MaybeArmFromPath(file_name, result);
  return result;
}

inline HMODULE WINAPI HookedLoadLibraryExW(LPCWSTR file_name, HANDLE file, DWORD flags) {
  HMODULE result = real_load_library_ex_w(file_name, file, flags);
  MaybeArmFromPath(file_name, result);
  return result;
}

inline HMODULE WINAPI HookedLoadLibraryA(LPCSTR file_name) {
  HMODULE result = real_load_library_a(file_name);
  MaybeArmFromPathA(file_name, result);
  return result;
}

inline HMODULE WINAPI HookedLoadLibraryExA(LPCSTR file_name, HANDLE file, DWORD flags) {
  HMODULE result = real_load_library_ex_a(file_name, file, flags);
  MaybeArmFromPathA(file_name, result);
  return result;
}

inline bool IsGameProcess() {
  const auto file_name = renodx::utils::platform::GetCurrentProcessPath().filename().string();
  return _stricmp(file_name.c_str(), "forzahorizon6.exe") == 0;
}

inline void InstallLoaderHooks() {
  if (!IsGameProcess()) {
    LogInfo("not the game process — Streamline hooks not installed");
    return;
  }
  {
    const std::lock_guard install_lock(detour_mutex);
    if (!loader_hooks_installed.load()) {
      real_load_library_w = &LoadLibraryW;
      real_load_library_ex_w = &LoadLibraryExW;
      real_load_library_a = &LoadLibraryA;
      real_load_library_ex_a = &LoadLibraryExA;
      LONG error = DetourTransactionBegin();
      const bool transaction_started = error == NO_ERROR;
      if (error == NO_ERROR) error = DetourUpdateThread(GetCurrentThread());
      if (error == NO_ERROR) {
        error = DetourAttach(reinterpret_cast<void**>(&real_load_library_w), HookedLoadLibraryW);
      }
      if (error == NO_ERROR) {
        error = DetourAttach(reinterpret_cast<void**>(&real_load_library_ex_w), HookedLoadLibraryExW);
      }
      if (error == NO_ERROR) {
        error = DetourAttach(reinterpret_cast<void**>(&real_load_library_a), HookedLoadLibraryA);
      }
      if (error == NO_ERROR) {
        error = DetourAttach(reinterpret_cast<void**>(&real_load_library_ex_a), HookedLoadLibraryExA);
      }
      if (error != NO_ERROR) {
        if (transaction_started) DetourTransactionAbort();
      } else {
        error = DetourTransactionCommit();
      }
      if (error != NO_ERROR) {
        LogWarn("LoadLibrary detours FAILED — will poll for sl.interposer.dll instead");
      } else {
        loader_hooks_installed = true;
      }
    }
  }
  TryArmFromLoadedModules();
}

inline void UninstallHooks() {
  const std::lock_guard install_lock(detour_mutex);
  const bool had_loader = loader_hooks_installed.load();
  const bool had_streamline = armed.load();
  if (!had_loader && !had_streamline) return;
  LONG error = DetourTransactionBegin();
  const bool transaction_started = error == NO_ERROR;
  if (error == NO_ERROR) error = DetourUpdateThread(GetCurrentThread());
  if (had_loader) {
    if (error == NO_ERROR) {
      error = DetourDetach(reinterpret_cast<void**>(&real_load_library_w), HookedLoadLibraryW);
    }
    if (error == NO_ERROR) {
      error = DetourDetach(reinterpret_cast<void**>(&real_load_library_ex_w), HookedLoadLibraryExW);
    }
    if (error == NO_ERROR) {
      error = DetourDetach(reinterpret_cast<void**>(&real_load_library_a), HookedLoadLibraryA);
    }
    if (error == NO_ERROR) {
      error = DetourDetach(reinterpret_cast<void**>(&real_load_library_ex_a), HookedLoadLibraryExA);
    }
  }
  if (had_streamline) {
    if (error == NO_ERROR && real_sl_init != nullptr) {
      error = DetourDetach(reinterpret_cast<void**>(&real_sl_init), HookedSlInit);
    }
    if (error == NO_ERROR && real_sl_set_d3d_device != nullptr) {
      error = DetourDetach(reinterpret_cast<void**>(&real_sl_set_d3d_device), HookedSlSetD3DDevice);
    }
    if (error == NO_ERROR && real_sl_set_tag != nullptr) {
      error = DetourDetach(reinterpret_cast<void**>(&real_sl_set_tag), HookedSlSetTag);
    }
    if (error == NO_ERROR && real_sl_set_tag_for_frame != nullptr) {
      error =
          DetourDetach(reinterpret_cast<void**>(&real_sl_set_tag_for_frame), HookedSlSetTagForFrame);
    }
    if (error == NO_ERROR && real_sl_set_constants != nullptr) {
      error = DetourDetach(reinterpret_cast<void**>(&real_sl_set_constants), HookedSlSetConstants);
    }
    if (error == NO_ERROR && real_sl_evaluate_feature != nullptr) {
      error = DetourDetach(
          reinterpret_cast<void**>(&real_sl_evaluate_feature), HookedSlEvaluateFeature);
    }
    if (error == NO_ERROR && real_sl_get_feature_function != nullptr) {
      error = DetourDetach(
          reinterpret_cast<void**>(&real_sl_get_feature_function), HookedSlGetFeatureFunction);
    }
  }
  if (error != NO_ERROR) {
    if (transaction_started) DetourTransactionAbort();
    LogWarn("hook detach transaction failed");
  } else {
    error = DetourTransactionCommit();
    if (error != NO_ERROR) {
      LogWarn("hook detach commit failed");
    } else {
      if (had_loader) loader_hooks_installed.store(false);
      if (had_streamline) armed.store(false);
    }
  }
}

}  // namespace sl_rr
