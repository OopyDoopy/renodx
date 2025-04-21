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

  r0.xy = float2(0,0);
  while (true) {
    r0.z = cmp((int)r0.y >= 16);
    if (r0.z != 0) break;
    r0.zw = g_avSampleOffsets[r0.y].xy + v1.xy;
    r0.z = DiffuseSamplerTexture.Sample(DiffuseSampler_s, r0.zw).x;
    r0.x = r0.x + r0.z;
    r0.y = (int)r0.y + 1;
  }
  o0.xyz = float3(0.0625,0.0625,0.0625) * r0.xxx;
  o0.w = 1;
  return;
}