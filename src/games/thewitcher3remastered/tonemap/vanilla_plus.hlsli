#ifndef THEWITCHER3REMASTERED_TONEMAP_VANILLA_PLUS_HLSLI_
#define THEWITCHER3REMASTERED_TONEMAP_VANILLA_PLUS_HLSLI_

#include "./agx_tonemap.hlsli"
#include "./anchored_grading.hlsli"
#include "../../../shaders/color/gamut.hlsl"

static const float3x3 DISPLAYP3_TO_LMS_WEIGHTED_MAT = mul(
  renodx::color::macleod_boynton::XYZ_TO_LMS_WEIGHTED_MAT,
  renodx::color::DISPLAYP3_TO_XYZ_MAT);

float LimitMBSaturationIncrease(float3 mb, float saturation, bool is_hdr) {
  if (saturation <= 1.f || mb.z <= renodx::color::gamut::EPSILON) return saturation;

  float2 bound_r, bound_g, bound_b;
  renodx::color::gamut::MakeRGBTriangleInMBWeighted(
    is_hdr ? DISPLAYP3_TO_LMS_WEIGHTED_MAT
       : renodx::color::macleod_boynton::BT709_TO_LMS_WEIGHTED_MAT,
    bound_r, bound_g, bound_b);
  float2 white = renodx::color::macleod_boynton::from::BT709(1.f.xxx).xy;
  bool has_boundary;
  float boundary = renodx::color::gamut::RayMaxT_RGBTriangleInMB(
    white, mb.xy - white, bound_r, bound_g, bound_b, has_boundary);
  if (!has_boundary) return saturation;

  float headroom = max(boundary - 1.f, 0.f);
  float increase = saturation - 1.f;
  return 1.f + (headroom > 0.f ? renodx::tonemap::Neutwo(increase, headroom) : 0.f);
}

float3 VanillaPlusGrading(float3 bt709, AgxToneCurveSettings curve, bool has_curve, float exposure_scale) {
  float peak = LAST_IS_HDR ? max(RENODX_PEAK_WHITE_NITS / max(RENODX_DIFFUSE_WHITE_NITS, 1e-6f), 0.1801f) : 1.f;
  float3 color = mul(BT2020_TO_CUSTOM_PRIMARIES_MAT, renodx::color::bt2020::from::BT709(bt709));
  float3 anchor = 0.18f;
  if (has_curve) {
    AgxApplyBlackFloor(curve.low_shoulder, curve.post_curve_scale, curve.post_curve_power,
                       curve.curve_scale, curve.low_power, curve.pivot, curve.use_parametric_curve,
                       LAST_IS_HDR ? max(RENODX_DIFFUSE_WHITE_NITS, 1e-6f) : 100.f);
    float mid = max(0.18f * exposure_scale, 1e-6f);
    float3 match = AgxApplyExtendedToneCurveOnly(mid.xxx, curve) / mid;
    float inflection = AgxToneCurveInflectionInput(curve.log_range_scale, curve.use_parametric_curve,
        float4(curve.curve_scale, curve.low_power, curve.low_shoulder, curve.pivot), exposure_scale);
    float strength = saturate(CUSTOM_AGX_CURVE_STRENGTH);
    anchor = lerp(inflection * match, AgxApplyExtendedToneCurveOnly(inflection.xxx, curve), strength);
    color = lerp(color * match, AgxApplyExtendedToneCurveOnly(color, curve), strength);
  }
  anchor = max(anchor, 1e-6f);
  float neutral = dot(CUSTOM_PRIMARIES_LUMINANCE_WEIGHTS, color) / dot(CUSTOM_PRIMARIES_LUMINANCE_WEIGHTS, anchor);
  float purity = RENODX_TONE_MAP_SATURATION;
  if (RENODX_TONE_MAP_HIGHLIGHT_SATURATION != 1.f) {
    float rolloff_position = saturate(log2(max(neutral, 1.f)) / (2.75f * log2(10.f)));
    float rolloff = rolloff_position * rolloff_position * rolloff_position
        * mad(rolloff_position, mad(6.f, rolloff_position, -15.f), 10.f);
    float highlight_rolloff = rolloff * rolloff * lerp(1.f, rolloff, 0.5f);
    purity *= mad(RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f, highlight_rolloff * (2.f / 3.f), 1.f);
  }
  if (purity != 1.f || RENODX_TONE_MAP_BLOWOUT != 0.f) {
    float3 color_bt2020 = mul(CUSTOM_PRIMARIES_TO_BT2020_MAT, color);
    float3 mb = renodx::color::macleod_boynton::from::BT2020(color_bt2020);
    if (mb.z > renodx::color::gamut::EPSILON) {
      purity = LimitMBSaturationIncrease(mb, purity, LAST_IS_HDR);
      if (RENODX_TONE_MAP_BLOWOUT != 0.f) {
        purity *= lerp(1.f, rcp(1.f + peak / 0.18f), saturate(RENODX_TONE_MAP_BLOWOUT));
      }
      float2 white = renodx::color::macleod_boynton::from::BT709(1.f.xxx).xy;
      mb.xy = lerp(white, mb.xy, purity);
      color = mul(BT2020_TO_CUSTOM_PRIMARIES_MAT, renodx::color::bt2020::from::MacLeodBoynton(mb));
    }
  }
  color = ApplyAnchoredTonalGrading(color, anchor, anchor,
      max(RENODX_TONE_MAP_CONTRAST, 1e-4f), RENODX_TONE_MAP_FLARE,
      RENODX_TONE_MAP_HIGHLIGHT_CONTRAST, RENODX_TONE_MAP_SHADOW_CONTRAST,
      RENODX_TONE_MAP_HIGHLIGHTS, RENODX_TONE_MAP_SHADOWS);
  color = renodx::tonemap::neutwo::PerChannel(color, 100.f);
  return renodx::color::bt709::from::BT2020(mul(CUSTOM_PRIMARIES_TO_BT2020_MAT, color));
}

float3 VanillaPlusShoulder(float3 bt709, float peak) {
  float3 working = mul(BT2020_TO_CUSTOM_PRIMARIES_MAT,
      renodx::color::bt2020::from::BT709(bt709));
  working = ApplyAnchoredCInfinityShoulder(working, max(peak, 0.1801f).xxx, 0.18f.xxx, 1.5f);
  return renodx::color::bt709::from::BT2020(mul(CUSTOM_PRIMARIES_TO_BT2020_MAT, working));
}

#endif