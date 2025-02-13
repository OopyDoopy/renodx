#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Wed Feb 12 18:09:14 2025

cbuffer _Globals : register(b0)
{
  float4 pProjectionParams : packoffset(c0);
  float4 pBlurParams : packoffset(c1);
  float4 pCLUTParams : packoffset(c2);
}

SamplerState FrameBufferS_s : register(s0);
SamplerState DepthBufferS_s : register(s1);
SamplerState pBlurredFrameBufferS_s : register(s2);
SamplerState pCLUT_s : register(s3);
Texture3D<float4> pCLUT : register(t0);
Texture2D<float4> FrameBuffer : register(t1);
Texture2D<float4> DepthBuffer : register(t2);
Texture2D<float4> pBlurredFrameBuffer : register(t3);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;


  r0.x = -pProjectionParams.y * pProjectionParams.z;
  r1.xyzw = DepthBuffer.Sample(DepthBufferS_s, v1.xy).xyzw;
  r0.y = dot(r1.xyz, float3(0.99609375,0.00389099121,1.51991844e-05));
  r0.z = -pProjectionParams.z + r0.y;

  //not much difference between this on and off, variable names didn't make me think it was tonemapping in the first place *shrug*
  //r0.y = cmp(0.999989986 >= r0.y);
  //r0.y = r0.y ? 1.000000 : 0;

  r0.x = r0.x / r0.z;
  r0.x = -pProjectionParams.x + r0.x;
  r0.x = -pBlurParams.x + abs(r0.x);
  r0.x = max(0, r0.x);

  r0.x = saturate(pBlurParams.y * r0.x);
  //r0.x = pBlurParams.y * r0.x;

  r0.x = pBlurParams.z * r0.x;
  r0.x = r0.x * r0.y;
  r1.xyzw = pBlurredFrameBuffer.Sample(pBlurredFrameBufferS_s, v1.xy).xyzw;
  r2.xyzw = FrameBuffer.Sample(FrameBufferS_s, v1.xy).xyzw;
  r0.yzw = -r2.xyz + r1.xyz;
  r0.xyz = r0.xxx * r0.yzw + r2.xyz;

  //not much difference moving it here.
  float3 ungraded = r0.rgb; 

  o0.w = r2.w;
  r1.xyz = pCLUTParams.xxx * r0.xyz + pCLUTParams.yyy;
  r1.xyzw = pCLUT.Sample(pCLUT_s, r1.xyz).xyzw;
  r1.xyz = r1.xyz + -r0.xyz;
  o0.xyz = pCLUTParams.zzz * r1.xyz + r0.xyz;

  float3 graded_bt709 = o0.rgb;

  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.lut_sampler = pCLUT_s;
  lut_config.strength = CUSTOM_LUT_STRENGTH;
  lut_config.scaling = CUSTOM_LUT_SCALING;
  lut_config.size = 32;
  //lut_config.precompute = pCLUTParams.xyz * float3(10,10,10);
  lut_config.tetrahedral = CUSTOM_LUT_TETRAHEDRAL == 1.f;
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.type_output = renodx::lut::config::type::SRGB;

  float3 outputColor;
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    //outputColor = renodx::color::srgb::DecodeSafe(tonemapped_bt709);
    outputColor = graded_bt709;
  } else {
    ungraded = renodx::color::srgb::DecodeSafe(ungraded);
    outputColor = renodx::draw::ToneMapPass(ungraded, renodx::lut::Sample(renodx::tonemap::renodrt::NeutralSDR(ungraded), lut_config, pCLUT));
    outputColor = renodx::color::srgb::EncodeSafe(outputColor);
  }

  o0.rgb = outputColor;
  return;
}