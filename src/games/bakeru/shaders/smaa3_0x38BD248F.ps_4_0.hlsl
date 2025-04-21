// ---- Created with 3Dmigoto v1.4.1 on Fri Mar 28 22:56:16 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[20];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.SampleBias(s0_s, v1.xy, cb0[19].x).xyzw;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = float3(0.454545468,0.454545468,0.454545468) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyzw = t0.SampleBias(s0_s, v2.xy, cb0[19].x).xyzw;
  r1.xyz = log2(abs(r1.xyz));
  r1.xyz = float3(0.454545468,0.454545468,0.454545468) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = -r1.xyz + r0.xyz;
  r0.w = max(abs(r2.x), abs(r2.y));
  r2.x = max(r0.w, abs(r2.z));
  r3.xyzw = t0.SampleBias(s0_s, v2.zw, cb0[19].x).xyzw;
  r3.xyz = log2(abs(r3.xyz));
  r3.xyz = float3(0.454545468,0.454545468,0.454545468) * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = -r3.xyz + r0.xyz;
  r0.w = max(abs(r4.x), abs(r4.y));
  r2.y = max(r0.w, abs(r4.z));
  r2.zw = cmp(r2.xy >= float2(0.100000001,0.100000001));
  r2.zw = r2.zw ? float2(1,1) : 0;
  r0.w = dot(r2.zw, float2(1,1));
  r0.w = cmp(r0.w == 0.000000);
  if (r0.w != 0) discard;
  r4.xyzw = t0.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r4.xyz = log2(abs(r4.xyz));
  r4.xyz = float3(0.454545468,0.454545468,0.454545468) * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r4.xyz = -r4.xyz + r0.xyz;
  r0.w = max(abs(r4.x), abs(r4.y));
  r4.x = max(r0.w, abs(r4.z));
  r5.xyzw = t0.SampleBias(s0_s, v3.zw, cb0[19].x).xyzw;
  r5.xyz = log2(abs(r5.xyz));
  r5.xyz = float3(0.454545468,0.454545468,0.454545468) * r5.xyz;
  r5.xyz = exp2(r5.xyz);
  r0.xyz = -r5.xyz + r0.xyz;
  r0.x = max(abs(r0.x), abs(r0.y));
  r4.y = max(r0.x, abs(r0.z));
  r0.xy = max(r4.xy, r2.xy);
  r4.xyzw = t0.SampleBias(s0_s, v4.xy, cb0[19].x).xyzw;
  r4.xyz = log2(abs(r4.xyz));
  r4.xyz = float3(0.454545468,0.454545468,0.454545468) * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r1.xyz = -r4.xyz + r1.xyz;
  r0.z = max(abs(r1.x), abs(r1.y));
  r1.x = max(r0.z, abs(r1.z));
  r4.xyzw = t0.SampleBias(s0_s, v4.zw, cb0[19].x).xyzw;
  r4.xyz = log2(abs(r4.xyz));
  r4.xyz = float3(0.454545468,0.454545468,0.454545468) * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r3.xyz = -r4.xyz + r3.xyz;
  r0.z = max(abs(r3.x), abs(r3.y));
  r1.y = max(r0.z, abs(r3.z));
  r0.xy = max(r1.xy, r0.xy);
  r0.x = max(r0.x, r0.y);
  r0.yz = r2.xy + r2.xy;
  r0.xy = cmp(r0.yz >= r0.xx);
  r0.xy = r0.xy ? float2(1,1) : 0;
  r0.xy = r2.zw * r0.xy;
  o0.xy = r0.xy;
  o0.zw = float2(0,0);
  return;
}