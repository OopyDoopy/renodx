// ---- Created with 3Dmigoto v1.4.1 on Thu Feb  6 20:00:28 2025

cbuffer _Globals : register(b0)
{
  float4 vConfigParam : packoffset(c0);
  float4 vOETFParam : packoffset(c1);
}

SamplerState __smpsScreen_s : register(s0);
SamplerState __smpsToneCurv_s : register(s1);
Texture2D<float4> sScreen : register(t0);
Texture2D<float4> sToneCurv : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = sScreen.Sample(__smpsScreen_s, v1.xy).xyzw;
  r1.x = dot(float3(0.627399981,0.329299986,0.0432999991), r0.xyz);
  r1.y = dot(float3(0.0691,0.919499993,0.0114000002), r0.xyz);
  r1.z = dot(float3(0.0164000001,0.0879999995,0.895600021), r0.xyz);
  r1.w = dot(r1.xyz, float3(0.262699991,0.677999973,0.0593000017));
  r1.xyz = r1.xyz + -r1.www;
  r1.xyz = vConfigParam.yyy * r1.xyz + r1.www;
  r2.xyz = cmp(float3(1,1,1) >= r1.xyz);
  r3.xyz = r1.xyz * vConfigParam.zzz + vConfigParam.www;
  r3.w = 0.5;
  r1.w = sToneCurv.Sample(__smpsToneCurv_s, r3.xw).x;
  r4.x = r2.x ? r1.w : r1.x;
  r1.x = sToneCurv.Sample(__smpsToneCurv_s, r3.yw).y;
  r1.w = sToneCurv.Sample(__smpsToneCurv_s, r3.zw).z;
  r4.yz = r2.yz ? r1.xw : r1.yz;
  r1.xyz = float3(-0.5,-0.5,-0.5) + r4.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = float3(1,1,1) + r1.xyz;

  // r1.xyz = saturate(r4.xyz / r1.xyz);
  r1.xyz = r4.xyz / r1.xyz;

  r1.xyz = log2(r1.xyz);
  r1.w = -1 + vConfigParam.x;
  r1.xyz = r1.www * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r1.xyz = r4.xyz * r1.xyz;
  r0.xyz = vOETFParam.xxx * r1.xyz;
  r0.xyzw = float4(0.00999999978,0.00999999978,0.00999999978,0.00999999978) * r0.xyzw;
  r0.xyz = log2(r0.xyz);
  o0.w = r0.w;
  r0.xyz = float3(0.159301996,0.159301996,0.159301996) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = r0.xyz * float3(18.8515587,18.8515587,18.8515587) + float3(0.835937023,0.835937023,0.835937023);
  r0.xyz = r0.xyz * float3(18.6875,18.6875,18.6875) + float3(1,1,1);
  r0.xyz = r1.xyz / r0.xyz;
  r0.xyz = log2(r0.xyz);
  r0.xyz = float3(78.8437576,78.8437576,78.8437576) * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  return;
}