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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = float2(8,6) * cb0[128].xx;
  r0.yw = float2(0,0);
  r1.xyzw = v1.xyxy + -r0.xyzw;
  r0.xyzw = v1.xyxy + r0.zwxw;
  r2.xyzw = t0.SampleBias(s0_s, r1.zw, cb0[19].x).xyzw;
  r1.xyzw = t0.SampleBias(s0_s, r1.xy, cb0[19].x).xyzw;
  r2.xyz = float3(0.0540540516,0.0540540516,0.0540540516) * r2.xyz;
  r1.xyz = r1.xyz * float3(0.0162162203,0.0162162203,0.0162162203) + r2.xyz;
  r2.xz = float2(4,2) * cb0[128].xx;
  r2.yw = float2(0,0);
  r3.xyzw = v1.xyxy + -r2.xyzw;
  r2.xyzw = v1.xyxy + r2.zwxy;
  r4.xyzw = t0.SampleBias(s0_s, r3.xy, cb0[19].x).xyzw;
  r3.xyzw = t0.SampleBias(s0_s, r3.zw, cb0[19].x).xyzw;
  r1.xyz = r4.xyz * float3(0.121621624,0.121621624,0.121621624) + r1.xyz;
  r1.xyz = r3.xyz * float3(0.194594592,0.194594592,0.194594592) + r1.xyz;
  r3.xyzw = t0.SampleBias(s0_s, v1.xy, cb0[19].x).xyzw;
  r1.xyz = r3.xyz * float3(0.227027029,0.227027029,0.227027029) + r1.xyz;
  r3.xyzw = t0.SampleBias(s0_s, r2.xy, cb0[19].x).xyzw;
  r2.xyzw = t0.SampleBias(s0_s, r2.zw, cb0[19].x).xyzw;
  r1.xyz = r3.xyz * float3(0.194594592,0.194594592,0.194594592) + r1.xyz;
  r1.xyz = r2.xyz * float3(0.121621624,0.121621624,0.121621624) + r1.xyz;
  r2.xyzw = t0.SampleBias(s0_s, r0.xy, cb0[19].x).xyzw;
  r0.xyzw = t0.SampleBias(s0_s, r0.zw, cb0[19].x).xyzw;
  r1.xyz = r2.xyz * float3(0.0540540516,0.0540540516,0.0540540516) + r1.xyz;
  o0.xyz = r0.xyz * float3(0.0162162203,0.0162162203,0.0162162203) + r1.xyz;
  o0.w = 1;
  return;
}