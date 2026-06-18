#include "./shared.h"

#define LMS_WHITE renodx::color::lms::from::BT709(1.f)

// Linear in, linear out.
float3 GammaCorrectionLMS(float3 color, bool invert = false, float gamma = 2.2f) {
  if (RENODX_GAMMA_CORRECTION == 0.f) {
    return color;
  }

  float3 lms_color = renodx::color::lms::from::BT709(color) / LMS_WHITE;
  lms_color = renodx::color::correct::GammaSafe(lms_color, invert, gamma);
  return renodx::color::bt709::from::LMS(lms_color * LMS_WHITE);
}

float3 IntermediatePass(float3 color) {
  color = GammaCorrectionLMS(color);
  color *= RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS;
  color = renodx::color::srgb::EncodeSafe(color);
  return color;
}

float3 InvertIntermediatePass(float3 color) {
  color = renodx::color::srgb::DecodeSafe(color);
  color *= RENODX_GRAPHICS_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  color = GammaCorrectionLMS(color, true);
  return color;
}

struct SceneGradeGamutCompressionState {
  float3 adaptive_state_lms;
  float gamut_compression_scale;
  float max_channel_scale;
};

SceneGradeGamutCompressionState SetupSceneGradeGamutCompression(inout float3 color) {
  SceneGradeGamutCompressionState state;
  state.adaptive_state_lms = renodx::color::lms::from::BT709(0.18f.xxx);
  state.gamut_compression_scale = 1.f;
  state.max_channel_scale = 1.f;

  if (RENODX_TONE_MAP_TYPE != 0) {
    state.gamut_compression_scale = renodx::color::gamut::ComputeGamutCompressionScaleBT709AdaptiveD65(
        color,
        state.adaptive_state_lms,
        1.f);
    color = renodx::color::gamut::GamutCompressBT709AdaptiveD65(
        color,
        state.adaptive_state_lms,
        state.gamut_compression_scale);
    state.max_channel_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(color);
    color *= state.max_channel_scale;
  }

  return state;
}

float3 InvertSceneGradeGamutCompression(float3 color, SceneGradeGamutCompressionState state) {
  if (RENODX_TONE_MAP_TYPE == 0) {
    return color;
  }

  color = renodx::math::DivideSafe(color, state.max_channel_scale.xxx, color);
  color = renodx::color::gamut::GamutDecompressBT709AdaptiveD65(
      color,
      state.adaptive_state_lms,
      state.gamut_compression_scale);
  return color;
}

float3 FinalPass(float3 color) {
  color = renodx::color::srgb::DecodeSafe(color);
  color = renodx::color::bt2020::from::BT709(color);
  color *= RENODX_GRAPHICS_WHITE_NITS;
  color = min(color, RENODX_PEAK_WHITE_NITS);
  color = renodx::color::pq::EncodeSafe(color, 1.f);
  return color;
}