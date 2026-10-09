#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.4.1 on Wed Jan 29 15:53:31 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[9];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float2 v1: TEXCOORD0,
    float2 w1: TEXCOORD1,
    out float4 o0: SV_Target0) {
  float4 r0, r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = w1.xy * cb0[8].xy + cb0[8].zw;

  r0.xyzw = t1.Sample(s1_s, r0.xy).xyzw;

  r0.xyz *= CUSTOM_SUN_SHAFTS;

  r0.xyzw = saturate(cb0[3].xyzw * r0.xyzw);
  // r0.xyzw = cb0[3].xyzw * r0.xyzw;

  r0.xyzw = float4(1, 1, 1, 1) + -r0.xyzw;

  r1.xy = v1.xy * cb0[7].xy + cb0[7].zw;

  r1.xyzw = t0.Sample(s0_s, r1.xy).xyzw;

  // lerp, included in following if statement
  // r1.xyzw = float4(1, 1, 1, 1) + -r1.xyzw;
  // o0.xyzw = -r1.xyzw * r0.xyzw + float4(1,1,1,1);

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    o0.xyzw = lerp(1, r1.xyzw, r0.xyzw);
  } else {
    float y_in = renodx::color::y::from::BT709(r1.rgb);
    float y_out = renodx::tonemap::Neutwo(y_in);
    float scale = y_in > 0 ? y_out / y_in : 1;
    r1.xyz = r1.xyz * scale;
    o0.xyzw = lerp(1.f, r1.xyzw, r0.xyzw);  // adjust brightness of rays
    o0.xyz /= scale;

    if (RENODX_TONE_MAP_TYPE == 1.f) {
      static const float ACES_MIN = 0.0001f;

      const float aces_max = renodx::math::Select(
          RENODX_SWAP_CHAIN_OUTPUT_PRESET == renodx::draw::SWAP_CHAIN_OUTPUT_PRESET_SDR,
          1.f,
          RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS
        );
      const float aces_min = renodx::math::Select(
        RENODX_SWAP_CHAIN_OUTPUT_PRESET == renodx::draw::SWAP_CHAIN_OUTPUT_PRESET_SDR,
        ACES_MIN,
        ACES_MIN / RENODX_DIFFUSE_WHITE_NITS
      );

      float3 ap0_color = mul(renodx::color::BT709_TO_AP0_MAT, o0.xyz);
      ap0_color *= RENODX_TONE_MAP_EXPOSURE;
      float3 ap1_color = renodx::tonemap::aces::RRT(ap0_color);
      ap1_color = renodx::tonemap::prism::ApplyAnchoredTonalGrading(
          ap1_color,
          float3(0.10f, 0.10f, 0.10f),
          float3(0.10f, 0.10f, 0.10f),
          RENODX_TONE_MAP_CONTRAST,
          RENODX_TONE_MAP_FLARE,
          1.f,
          1.f,
          RENODX_TONE_MAP_HIGHLIGHTS,
          RENODX_TONE_MAP_SHADOWS
      );
      o0.rgb = renodx::tonemap::aces::ODT(ap1_color, aces_min * 48.f, aces_max * 48.f) / 48.f;
    } else {
      o0.rgb = ApplyPrismToneMap(o0.rgb);
    }
  }
  o0.rgb = IntermediatePass(o0.rgb);
  // o0.rgb = renodx::effects::ApplyFilmGrain(
  //     o0.rgb,
  //     v1.xy,
  //     CUSTOM_RANDOM,
  //     CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return;
}
