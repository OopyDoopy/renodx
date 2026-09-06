#ifndef SRC_DRAGONSDOGMA2_LUTSAMPLING_HLSLI_
#define SRC_DRAGONSDOGMA2_LUTSAMPLING_HLSLI_

#include "./common.hlsl"

Texture2D<float4> SrcTexture : register(t0);
Texture3D<float4> SrcLUT : register(t1);

#if defined(LUTSAMPLING_NEW_CBUFFER_LAYOUT)
cbuffer HDRMapping : register(b0) {
  float whitePaperNits : packoffset(c000.x);
  float configImageAlphaScale : packoffset(c000.y);
  float displayMaxNits : packoffset(c000.z);
  float displayMinNits : packoffset(c000.w);
  float4 displayMaxNitsRect : packoffset(c001.x);
  float4 secondaryDisplayMaxNitsRect : packoffset(c002.x);
  float4 standardMaxNitsRect : packoffset(c003.x);
  float4 secondaryStandardMaxNitsRect : packoffset(c004.x);
  float2 displayMaxNitsRectSize : packoffset(c005.x);
  float2 standardMaxNitsRectSize : packoffset(c005.z);
  float4 mdrOutRangeRect : packoffset(c006.x);
  uint drawMode : packoffset(c007.x);
  float gammaForHDR : packoffset(c007.y);
  float displayMaxNitsST2084 : packoffset(c007.z);
  float displayMinNitsST2084 : packoffset(c007.w);
  uint drawModeOnMDRPass : packoffset(c008.x);
  float saturationForHDR : packoffset(c008.y);
  float2 targetInvSize : packoffset(c008.z);
  float toeEnd : packoffset(c009.x);
  float toeStrength : packoffset(c009.y);
  float blackPoint : packoffset(c009.z);
  float shoulderStartPoint : packoffset(c009.w);
  float shoulderStrength : packoffset(c010.x);
  float whitePaperNitsForOverlay : packoffset(c010.y);
  float saturationOnDisplayMapping : packoffset(c010.z);
  float graphScale : packoffset(c010.w);
  float4 hdrImageRect : packoffset(c011.x);
  float2 hdrImageRectSize : packoffset(c012.x);
  float secondaryDisplayMaxNits : packoffset(c012.z);
  float secondaryDisplayMinNits : packoffset(c012.w);
  float2 secondaryDisplayMaxNitsRectSize : packoffset(c013.x);
  float2 secondaryStandardMaxNitsRectSize : packoffset(c013.z);
  float shoulderAngle : packoffset(c014.x);
  uint enableHDRAdjustmentForOverlay : packoffset(c014.y);
  float brightnessAdjustmentForOverlay : packoffset(c014.z);
  float saturateAdjustmentForOverlay : packoffset(c014.w);
};
#elif defined(LUTSAMPLING_OLD_CBUFFER_LAYOUT)
cbuffer HDRMapping : register(b0) {
  float whitePaperNits : packoffset(c000.x);
};
#endif

SamplerState PointBorder : register(s2, space32);
SamplerState TrilinearClamp : register(s9, space32);

float4 CustomLutSampling(float2 uv, float white_paper_nits) {
  float4 source = SrcTexture.SampleLevel(PointBorder, uv, 0.f);
  float3 ungraded_bt709 = renodx::color::bt709::from::AP1(source.xyz);

  float calculated_diffuse_white = RENODX_DIFFUSE_WHITE_NITS;
  float calculated_peak = RENODX_PEAK_WHITE_NITS / calculated_diffuse_white;
  float3 output_color = ungraded_bt709;

  if (RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_OPTIMIZATION != 0.f) {
    const float3 post_processed_ap1 = renodx::color::ap1::from::BT709(
        CustomPostProcessing(ungraded_bt709, uv));
    const float3 lut_uv = renodx::color::pq::EncodeSafe(
        post_processed_ap1,
        calculated_diffuse_white);
    return float4(SrcLUT.SampleLevel(
        TrilinearClamp,
        lut_uv * 0.984375f + 0.0078125f,
        0.f).xyz, 1.f);
  }

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    source.xyz *= white_paper_nits * 0.009999999776482582f;
    float3 acescct = renodx::color::acescct::EncodeSafe(source.xyz);
    return float4(SrcLUT.SampleLevel(TrilinearClamp, acescct * 0.984375f + 0.0078125f, 0.f).xyz, 1.f);
  }

  if (RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_OPTIMIZATION == 0.f) {
    output_color = ApplyPrismToneMap(
        ungraded_bt709,
      calculated_peak,
        calculated_diffuse_white);
  }

  output_color = CustomPostProcessing(output_color, uv);
  output_color = renodx::color::gamut::GamutCompressBT2020(output_color);

  return float4(renodx::color::pq::EncodeSafe(
      renodx::color::bt2020::from::BT709(output_color), calculated_diffuse_white), 1.f);
}

float4 CustomLutSamplingSDR(float2 uv) {
  float4 source = SrcTexture.SampleLevel(PointBorder, uv, 0.f);
  float3 ungraded_bt709 = renodx::color::bt709::from::AP1(source.xyz);

  float3 output_color = ungraded_bt709;

  if (RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_OPTIMIZATION != 0.f) {
    const float3 post_processed_ap1 = renodx::color::ap1::from::BT709(
      CustomPostProcessing(ungraded_bt709, uv));
    const float3 lut_uv = renodx::color::pq::EncodeSafe(post_processed_ap1, 100.f);
    return float4(SrcLUT.SampleLevel(
      TrilinearClamp,
      lut_uv * 0.984375f + 0.0078125f,
      0.f).xyz, 1.f);
  }

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    float3 acescct = renodx::color::acescct::EncodeSafe(source.xyz);
    return float4(SrcLUT.SampleLevel(TrilinearClamp, acescct * 0.984375f + 0.0078125f, 0.f).xyz, 1.f);
  }

  if (RENODX_TONE_MAP_TYPE == 1.f && RENODX_TONE_MAP_OPTIMIZATION == 0.f) {
    output_color = ApplyPrismToneMap(ungraded_bt709, 1.f, 100.f);
  }

  output_color = CustomPostProcessing(output_color, uv);
  output_color = renodx::color::gamut::GamutCompressBT709(output_color);
  output_color = EncodePrismSDR(output_color);
  return float4(output_color, 1.f);
}

#endif  // SRC_DRAGONSDOGMA2_LUTSAMPLING_HLSLI_