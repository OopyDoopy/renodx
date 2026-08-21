// #include "./shared.h"
#include "./psychov_custom.hlsl"
#include "./lilium_rcas.hlsl"
#include "./tonemap/tonemap.hlsli"

float3 CustomPostProcessing(float3 color, float2 uv, Texture2D<float4> t1, SamplerState s1) {
  color = ApplyRCAS(color, uv, t1, s1);
  color = renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return color;
}

float3 CustomTonemap(
    float3 untonemapped_bt709,
    helldivers2::tonemap::ACESParameters aces_parameters) {
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    return helldivers2::tonemap::ApplyACES(untonemapped_bt709, aces_parameters);
  } else if (RENODX_TONE_MAP_TYPE == 2.f) {
    float3 tonemapped_bt709 = renodx::tonemap::psycho::psychotm_customized(
        untonemapped_bt709,
        RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS,
        RENODX_TONE_MAP_EXPOSURE,
        RENODX_TONE_MAP_HIGHLIGHTS,
        RENODX_TONE_MAP_SHADOWS,
        (CUSTOM_CURVE == 0 ? 1.46f : 1.f) * RENODX_TONE_MAP_CONTRAST,
        RENODX_TONE_MAP_SATURATION,
        RENODX_TONE_MAP_BLOWOUT,
        RENODX_TONE_MAP_FLARE,
        100.f,
        RENODX_TONE_MAP_HUE_RESTORE,
        1.f,
        0,
        0,
        1.f,
        CUSTOM_CURVE == 0 ? 0.18f : RENODX_TONE_MAP_MID_GRAY_IN,
        CUSTOM_CURVE == 0 ? 0.10f : RENODX_TONE_MAP_MID_GRAY_OUT
      );
    return renodx::color::pq::EncodeSafe(
        renodx::color::bt2020::from::BT709(tonemapped_bt709),
        RENODX_DIFFUSE_WHITE_NITS);
  }

  return untonemapped_bt709;
}