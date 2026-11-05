#ifndef GUILDWARS_TONEMAP_HLSLI_
#define GUILDWARS_TONEMAP_HLSLI_

#include "./common.hlsl"
#include "./anchored_grading.hlsli"
#include "../../shaders/color/macleod_boynton.hlsl"
#include "../../shaders/color/gamut.hlsl"

static const float3x3 GUILDWARS_2020_TO_WIDE = float3x3(
    0.962911598f, 0.003151046f, 0.033926831f,
    0.229335471f, 0.710230844f, 0.060434168f,
    0.030816078f, 0.082383413f, 0.887009192f);
static const float3x3 GUILDWARS_WIDE_TO_2020 = float3x3(
    1.039789708f, 0.000000002f, -0.039770468f,
    -0.335327217f, 1.419208998f, -0.083868493f,
    -0.004979475f, -0.131812931f, 1.136555237f);

float ComputeSDREffectScale(float3 color) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return 1.f;
  float clip = max(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, 1.0001f);
  float maximum = max(abs(color.r), max(abs(color.g), abs(color.b)));
  float mapped = CInfinityRollOffWhiteClip(maximum, 1.f, 0.18f, 1.f, clip);
  return maximum > 0.f ? max(mapped / maximum, 1e-6f) : 1.f;
}

// Linear BT.709 in and out.
float3 GuildWarsApplyGrading(float3 color, bool target_bt2020) {
  float recommended = CUSTOM_TONE_CURVE == 0.f ? 1.f : 0.f;
    float3 wide = mul(GUILDWARS_2020_TO_WIDE, renodx::color::bt2020::from::BT709(color * (RENODX_TONE_MAP_EXPOSURE + 0.08f * recommended)));
  wide = ApplyAnchoredTonalGrading(wide, 0.18f, 0.18f,
      max(RENODX_TONE_MAP_CONTRAST + 0.2f * recommended, 0.0001f), RENODX_TONE_MAP_FLARE + 0.0075f * recommended,
      RENODX_TONE_MAP_HIGHLIGHT_CONTRAST, RENODX_TONE_MAP_SHADOW_CONTRAST,
      RENODX_TONE_MAP_HIGHLIGHTS, RENODX_TONE_MAP_SHADOWS);
  float peak = max(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, 0.1801f);
  color = renodx::color::bt709::from::BT2020(mul(GUILDWARS_WIDE_TO_2020, wide));

  // Prism's selector uses scene luminance in stops above mid-gray, reaching
  // full highlight saturation adjustment at 10,000 nits.
  float saturation = RENODX_TONE_MAP_SATURATION;
  if (RENODX_TONE_MAP_HIGHLIGHT_SATURATION != 1.f) {
    float luminance = max(renodx::color::y::from::BT709(color), 0.f);
    float peak_from_neutral = 10000.f / (0.18f * RENODX_DIFFUSE_WHITE_NITS);
    float position = saturate(log2(max(luminance / 0.18f, 1.f)) / log2(max(peak_from_neutral, 1.00001f)));
    float weight = position * position * position * (position * (position * 6.f - 15.f) + 10.f);
    saturation *= 1.f + weight * (RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f);
  }
  // Prism's scalar availability law depends on peak relative to the anchor.
  if (RENODX_TONE_MAP_BLOWOUT != 0.f) {
    saturation *= lerp(1.f, rcp(1.f + peak / 0.18f), RENODX_TONE_MAP_BLOWOUT);
  }
  if (saturation != 1.f) {
    float3 mb = renodx::color::macleod_boynton::from::BT709(color);
    float3 neutral = renodx::color::macleod_boynton::from::BT709(1.f.xxx);
    if (saturation > 1.f && mb.z > renodx::color::gamut::EPSILON) {
      float2 r, g, b;
      if (target_bt2020) {
        renodx::color::gamut::MakeRGBTriangleInMBWeighted(renodx::color::macleod_boynton::BT2020_TO_LMS_WEIGHTED_MAT, r, g, b);
      } else {
        renodx::color::gamut::MakeRGBTriangleInMBWeighted(renodx::color::macleod_boynton::BT709_TO_LMS_WEIGHTED_MAT, r, g, b);
      }
      bool valid;
      float boundary = renodx::color::gamut::RayMaxT_RGBTriangleInMB(neutral.xy, mb.xy - neutral.xy, r, g, b, valid);
      if (valid) {
        float headroom = max(boundary - 1.f, 0.f);
        float increase = saturation - 1.f;
        saturation = 1.f + (headroom > 0.f ? increase * headroom / (increase + headroom) : 0.f);
      }
    }
    mb.xy = lerp(neutral.xy, mb.xy, saturation);
    color = renodx::color::bt709::from::MacLeodBoynton(mb);
  }
  return color;
}

float3 GuildWarsToneMap(float3 color, bool target_bt2020) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return saturate(color);
  color = GuildWarsApplyGrading(color, target_bt2020);
  float3 wide = mul(GUILDWARS_2020_TO_WIDE, renodx::color::bt2020::from::BT709(color));
  float3 graded_clip = mul(GUILDWARS_2020_TO_WIDE, renodx::color::bt2020::from::BT709(GuildWarsApplyGrading(10.f.xxx, target_bt2020)));
  float white_clip = max(max(graded_clip.r, max(graded_clip.g, graded_clip.b)), 0.1802f);
  float peak = min(max(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, 0.1801f), white_clip - 0.0001f);
  wide = float3(
      CInfinityRollOffWhiteClip(wide.r, peak, 0.18f, 1.f, white_clip),
      CInfinityRollOffWhiteClip(wide.g, peak, 0.18f, 1.f, white_clip),
      CInfinityRollOffWhiteClip(wide.b, peak, 0.18f, 1.f, white_clip));
  return renodx::color::bt709::from::BT2020(mul(GUILDWARS_WIDE_TO_2020, wide));
}

// sRGB in, sRGB out
float3 ToneMapAndIntermediatePass(float3 color, bool target_bt2020) {
  color = renodx::color::srgb::DecodeSafe(color);
  return IntermediatePass(GuildWarsToneMap(color, target_bt2020));
}

#endif