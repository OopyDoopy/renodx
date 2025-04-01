// ---- Created with 3Dmigoto v1.4.1 on Fri Mar 28 15:29:43 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[129];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 0;
  r0.yw = float2(3.23076916,1.38461542) * cb0[128].yy;
  r1.xyzw = v1.xyxy + -r0.xyxw;
  r0.xyzw = v1.xyxy + r0.xwxy;
  r2.xyzw = t0.SampleBias(s0_s, r1.zw, cb0[19].x).xyzw;
  r1.xyzw = t0.SampleBias(s0_s, r1.xy, cb0[19].x).xyzw;
  r2.xyz = float3(0.31621623,0.31621623,0.31621623) * r2.xyz;
  r1.xyz = r1.xyz * float3(0.0702702701,0.0702702701,0.0702702701) + r2.xyz;
  r2.xyzw = t0.SampleBias(s0_s, v1.xy, cb0[19].x).xyzw;
  r1.xyz = r2.xyz * float3(0.227027029,0.227027029,0.227027029) + r1.xyz;
  r2.xyzw = t0.SampleBias(s0_s, r0.xy, cb0[19].x).xyzw;
  r0.xyzw = t0.SampleBias(s0_s, r0.zw, cb0[19].x).xyzw;
  r1.xyz = r2.xyz * float3(0.31621623,0.31621623,0.31621623) + r1.xyz;
  o0.xyz = r0.xyz * float3(0.0702702701,0.0702702701,0.0702702701) + r1.xyz;
  o0.w = 1;
  return;
}