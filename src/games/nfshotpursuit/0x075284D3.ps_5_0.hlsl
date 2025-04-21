// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

cbuffer _Globals : register(b0)
{
  float4 HDRConstants : packoffset(c0);
  float4 HDRToneMapping : packoffset(c1) = {0.888888001,0.888888001,-1,1.125};
  float4 gOffsetXYZ : packoffset(c2);
  float4 gRightUp : packoffset(c3);
  float4 g_avSampleOffsets[16] : packoffset(c4);
  float4 TonemapCameraConstants : packoffset(c20);
  float4 TonemapExposureConstants : packoffset(c21);
}

SamplerState DiffuseSampler_s : register(s0);
Texture2D<float4> DiffuseSamplerTexture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = DiffuseSamplerTexture.Sample(DiffuseSampler_s, float2(0.5,0.5)).x;
  r0.x = TonemapCameraConstants.z + r0.x;
  r0.x = exp2(-r0.x);
  r0.x = 0.419999987 * r0.x;
  r0.y = TonemapCameraConstants.w * r0.x;
  r0.z = r0.x * TonemapCameraConstants.w + r0.x;
  r0.y = r0.z / r0.y;
  r0.y = 0.899999976 * r0.y;
  o0.yw = r0.xy / r0.yx;
  o0.z = -1 / r0.x;
  o0.x = 1 / r0.y;

  //o0.rgb *= float3(0.5, 0.5, 0.5);
  return;
}