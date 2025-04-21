#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 14:45:27 2025

cbuffer _Globals : register(b0)
{
  float4 DofParamsA : packoffset(c0);
  float4 DofParamsB : packoffset(c1);
  float4 BloomColour : packoffset(c2);
  float4 VignetteInnerRgbPlusMul : packoffset(c3);
  float4 VignetteOuterRgbPlusAdd : packoffset(c4);
  float4 MotionBlurAmounts : packoffset(c5);
  float4 BlurMatrixZZZ : packoffset(c6);
  float4 FisheyeWarpScalePowerOffset : packoffset(c7);
  float4 ColourCubeScalesOffsetsAndHeadroom : packoffset(c8);
  float4 g_DOF_True_K4K5 : packoffset(c9);
  float4 HeatHazeCoeffs : packoffset(c10);
  float4 ScreenSize : packoffset(c11);
  float4 ChromaticAberrationParams : packoffset(c12);
  float4 Gamma : packoffset(c13);
}

SamplerState SamplerSource_s : register(s0);
SamplerState SamplerBloom_s : register(s1);
SamplerState Sampler3dTint_s : register(s3);
SamplerState SamplerDepth_s : register(s4);
SamplerState SamplerNoise_s : register(s5);
Texture2D<float4> SamplerSourceTexture : register(t0);
Texture2D<float4> SamplerBloomTexture : register(t1);
Texture3D<float4> Sampler3dTintTexture : register(t3);
Texture2D<float4> SamplerDepthTexture : register(t4);
Texture2D<float4> SamplerNoiseTexture : register(t5);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = SamplerNoiseTexture.Sample(SamplerNoise_s, v2.zw).yz;
  r0.xyzw = r0.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = 1 + -abs(v5.x);
  r1.x = max(0, r1.x);
  r1.y = SamplerDepthTexture.Sample(SamplerDepth_s, v1.xy).x;

  r1.z = saturate(HeatHazeCoeffs.x * r1.y + HeatHazeCoeffs.y);
  //r1.z = HeatHazeCoeffs.x * r1.y + HeatHazeCoeffs.y;

  r1.x = r1.z * r1.x;
  r0.xyzw = r1.xxxx * r0.xyzw;
  r1.x = dot(v2.xy, v2.xy);
  r1.x = log2(r1.x);
  r1.x = FisheyeWarpScalePowerOffset.z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = r1.x * FisheyeWarpScalePowerOffset.x + FisheyeWarpScalePowerOffset.y;
  r1.xz = r1.xx * v2.xy + float2(0.5,0.5);
  r1.w = SamplerSourceTexture.Sample(SamplerSource_s, r1.xz).w;
  r1.w = cmp(r1.w >= 0.501960814);
  r1.w = r1.w ? 1.000000 : 0;
  r2.xyzw = r1.wwww * MotionBlurAmounts.xxzz + MotionBlurAmounts.yyww;
  r3.xyzw = BlurMatrixZZZ.wxyz * r1.yyyy + v3.wxyz;
  r1.y = cmp(r1.y >= 1);
  r4.xyzw = v1.xyxy * r3.wwww + r3.yzyz;

  r3.x = saturate(r3.x);
  //r3.x = r3.x;

  r1.y = r1.y ? 0 : r3.x;
  r2.xyzw = r4.xyzw * r2.xyzw;
  r3.xyzw = r2.xyzw * float4(0.125,0.125,0.125,0.125) + r1.xzxz;
  r4.xyzw = SamplerBloomTexture.Sample(SamplerBloom_s, r1.xz).xyzw;
  r5.xyzw = float4(-1,2,12,12) / ScreenSize.xyxy;

  //r0.xyzw = saturate(r0.xyzw * r5.zwzw + r3.xyzw);
  r0.xyzw = r0.xyzw * r5.zwzw + r3.xyzw;

  r1.x = v4.y * v4.z + v4.x;
  r1.x = frac(r1.x);
  r1.zw = float2(0.125,0.125) * r2.xy;
  r0.xyzw = r1.zwzw * r1.xxxx + r0.xyzw;
  r2.xyzw = r2.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  r3.y = 1 / ScreenSize.y;
  r3.z = -0.00249999994;
  r1.xzw = float3(-2,2,-1) / ScreenSize.yxy;
  r3.xw = r1.zw;
  r5.w = r1.x;
  r2.xyzw = r1.yyyy * r3.xyzw + r2.xyzw;
  r3.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, r2.xy).xyzw;
  r2.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, r2.zw).xyzw;
  r1.x = cmp(r3.w >= 0.501960814);
  r6.z = r1.x ? 1.000000 : 0;
  r1.x = cmp(r2.w >= 0.501960814);
  r6.w = r1.x ? 1.000000 : 0;
  r5.z = 0.00124999997;
  r0.xyzw = r1.yyyy * r5.xyzw + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, r0.xy).xyzw;
  r0.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, r0.zw).xyzw;
  r1.w = cmp(r1.w >= 0.501960814);
  r6.x = r1.w ? 1.000000 : 0;
  r0.w = cmp(r0.w >= 0.501960814);
  r6.y = r0.w ? 1.000000 : 0;
  r5.xyzw = r6.xyzw * float4(100,100,100,100) + float4(-99,-99,-99,-99);
  r5.xyzw = max(float4(0,0,0,0), r5.xyzw);
  r5.xyzw = r5.xyzw * MotionBlurAmounts.xxxx + MotionBlurAmounts.yyyy;
  r0.xyz = r5.yyy * r0.xyz;
  r0.xyz = r1.xyz * r5.xxx + r0.xyz;
  r0.xyz = r3.xyz * r5.zzz + r0.xyz;
  r0.xyz = r2.xyz * r5.www + r0.xyz;
  r0.w = dot(r5.xyzw, float4(1,1,1,1));
  r0.xyz = r0.xyz / r0.www;

  r0.xyz = saturate(ColourCubeScalesOffsetsAndHeadroom.zzz * r0.xyz);
  //r0.xyz = ColourCubeScalesOffsetsAndHeadroom.zzz * r0.xyz;

  r1.xyz = r0.xyz + r4.xyz;
  r2.xyz = -r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * r2.xyz + r1.xyz;
  r0.xyz = r0.xyz * r4.www;
  r0.w = dot(v1.zw, v1.zw);
  r0.w = sqrt(r0.w);

  r0.w = saturate(VignetteOuterRgbPlusAdd.w + r0.w);


  r1.x = r0.w * -2 + 3;
  r0.w = r0.w * r0.w;
  r0.w = r1.x * r0.w;
  r1.xyz = VignetteOuterRgbPlusAdd.xyz * r0.www + VignetteInnerRgbPlusMul.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = Gamma.yyy * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = r0.xyz * ColourCubeScalesOffsetsAndHeadroom.xxx + ColourCubeScalesOffsetsAndHeadroom.yyy;
  o0.xyzw = Sampler3dTintTexture.Sample(Sampler3dTint_s, r0.xyz).xyzw;

  //o0.rgb *= 3;
  return;
}