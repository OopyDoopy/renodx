#ifndef SRC_MHWILDS_OUTPUT_HLSL_
#define SRC_MHWILDS_OUTPUT_HLSL_
#include "./common.hlsl"
#include "./lilium_rcas.hlsl"

Texture2D<float4> SrcTexture : register(t0);

Texture3D<float4> SrcLUT : register(t1);

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

SamplerState PointBorder : register(s2, space32);

SamplerState TrilinearClamp : register(s9, space32);

float3 PrepareLutInput(float3 color) {
  //return renodx::color::pq::EncodeSafe(renodx::color::ap1::from::BT709(color), 100.f);
  return renodx::color::ap1::from::BT709(color);
}

// float3 DecodeLutOutput(float3 color, bool is_sdr = false) {
//   if (is_sdr) {
//     color = renodx::color::srgb::DecodeSafe(color);
//   } else {
//     color = renodx::color::pq::DecodeSafe(color, 100.f);
//     color = renodx::color::bt709::from::BT2020(color);
//   }
//   return color;
// }

float4 OutputTonemap(noperspective float4 SV_Position: SV_Position,
                     linear float2 TEXCOORD: TEXCOORD, bool is_sdr = false) {
  float4 _11 = SrcTexture.SampleLevel(PointBorder, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  // float _17 = whitePaperNits * 0.009999999776482582f;  // overall brightness (defaullt 100.f);
  float3 input_color_bt709 = renodx::color::bt709::from::AP1(_11.rgb);

  renodx::draw::Config swapchainConfig = renodx::draw::BuildConfig();
  swapchainConfig.swap_chain_clamp_nits = 10000.f;
  swapchainConfig.swap_chain_output_preset = 1.f;

  float3 output_color_bt709 = ApplyRCAS(input_color_bt709, TEXCOORD, SrcTexture, PointBorder);

  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.lut_sampler = TrilinearClamp;
  lut_config.size = 64u;
  lut_config.tetrahedral = true;
  lut_config.type_input = renodx::lut::config::type::PQ; 
  lut_config.type_output = renodx::lut::config::type::PQ;
  lut_config.scaling = 0.f;

  float peak_nits = 1.f;
  float lut_peak = 20.f; // Clip point for HDR LUT
  if (is_sdr) {
    swapchainConfig.swap_chain_output_preset = 0.f;

    lut_config.type_output = renodx::lut::config::type::SRGB;

    if (CUSTOM_TONE_MAP_PARAMETERS == 1 || RENODX_TONE_MAP_TYPE == 2.f) {
      peak_nits = renodx::color::correct::GammaSafe(peak_nits, false);
    }

  } 
  else {

    peak_nits = swapchainConfig.peak_white_nits / swapchainConfig.diffuse_white_nits;

    if (CUSTOM_TONE_MAP_PARAMETERS == 0 && RENODX_TONE_MAP_TYPE != 2.f) {
      peak_nits = renodx::color::correct::GammaSafe(peak_nits, true);
    }
  }

  const float mid_gray = 0.18f;
  float mid_gray_out = renodx::lut::Sample(SrcLUT, lut_config, mid_gray).x;

  // NEW INVERSE SCALE
  float scale = renodx::math::Select(RENODX_TONE_MAP_TYPE == 0, 1.f, ComputeReinhardSmoothClampScale(output_color_bt709, 0.375f, lut_peak));
  output_color_bt709 = output_color_bt709 * scale;
  output_color_bt709 = renodx::lut::Sample(SrcLUT, lut_config, output_color_bt709);
  output_color_bt709 = renodx::math::DivideSafe(output_color_bt709, scale, renodx::math::FLT_MAX);

  if (RENODX_TONE_MAP_TYPE != 2.f) {
    output_color_bt709 = PreTonemapSliders(output_color_bt709);
    output_color_bt709 = PostTonemapSliders(output_color_bt709);  // Needs to go before display map to prevent hue clip
  }

  int gamut_compression_mode = (int)(!is_sdr);  // 0 = bt.709, 1 = bt.2020
  output_color_bt709 = ProcessDisplayMap(output_color_bt709, peak_nits, gamut_compression_mode, 0.18f, 0.18f);

  if (CUSTOM_FILM_GRAIN_STRENGTH != 0) {
    output_color_bt709 = renodx::effects::ApplyFilmGrain(
        output_color_bt709.rgb,
        TEXCOORD.xy,
        CUSTOM_RANDOM,
        CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  }

  if (!is_sdr && CUSTOM_TONE_MAP_PARAMETERS == 0 && RENODX_TONE_MAP_TYPE != 2.f) {
    output_color_bt709 = renodx::color::correct::GammaSafe(output_color_bt709);
  } else if (is_sdr && (CUSTOM_TONE_MAP_PARAMETERS == 1 || RENODX_TONE_MAP_TYPE == 2.f)) {
    output_color_bt709 = renodx::color::correct::GammaSafe(output_color_bt709, true);
  }

  float3 output_color = renodx::draw::SwapChainPass(output_color_bt709, TEXCOORD, swapchainConfig);

  return float4(output_color, 1.f);
}

#endif  // SRC_MHWILDS_OUTPUT_HLSL_
