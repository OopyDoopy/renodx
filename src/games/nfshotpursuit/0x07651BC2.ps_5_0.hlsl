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
SamplerState PrevResultsSampler_s : register(s1);
Texture2D<float4> DiffuseSamplerTexture : register(t0);
Texture2D<float4> PrevResultsSamplerTexture : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
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
  r0.yz = PrevResultsSamplerTexture.Sample(PrevResultsSampler_s, float2(0.5,0.5)).xy;
  r0.w = -7.21347523 * abs(TonemapExposureConstants.w);
  r0.w = exp2(r0.w);
  r0.x = r0.x * 0.0625 + -r0.z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = TonemapExposureConstants.z * TonemapExposureConstants.w;
  r0.w = TonemapExposureConstants.x + -TonemapExposureConstants.y;
  r0.w = cmp(r0.x < r0.w);
  r1.x = r0.y + abs(r0.z);
  r1.y = TonemapExposureConstants.x + TonemapExposureConstants.y;
  r1.y = cmp(r1.y < r0.x);
  r0.z = r0.y + -abs(r0.z);
  r0.y = r1.y ? r0.z : r0.y;
  r0.y = r0.w ? r1.x : r0.y;
  r0.z = cmp(r0.y < TonemapCameraConstants.x);
  r0.y = r0.z ? TonemapCameraConstants.x : r0.y;
  r0.z = cmp(TonemapCameraConstants.y < r0.y);
  o0.x = r0.z ? TonemapCameraConstants.y : r0.y;
  o0.zw = float2(0,0);
  o0.y = r0.x;
  return;
}