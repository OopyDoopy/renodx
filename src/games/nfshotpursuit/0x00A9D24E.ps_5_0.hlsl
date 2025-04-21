// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

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

  r0.xyz = DiffuseSamplerTexture.Sample(DiffuseSampler_s, v1.xy).xyz;
  r0.x = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  o0.xyzw = sqrt(r0.xxxx);
  return;
}