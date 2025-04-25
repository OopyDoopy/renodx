// ---- Created with 3Dmigoto v1.4.1 on Tue Apr 22 01:01:38 2025
Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb4 : register(b4)
{
  float4 cb4[236];
}

cbuffer cb3 : register(b3)
{
  float4 cb3[77];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD8,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD9,
  float4 v5 : TEXCOORD0,
  float4 v6 : TEXCOORD1,
  float4 v7 : TEXCOORD2,
  float4 v8 : TEXCOORD3,
  float4 v9 : TEXCOORD4,
  float4 v10 : TEXCOORD5,
  float4 v11 : TEXCOORD6,
  float4 v12 : TEXCOORD7,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t6.Sample(s6_s, v5.xy).xyzw;
 //r0.xyzw = (int4)r0.xyzw & asint(cb3[56].xyzw);
 //r0.xyzw = (int4)r0.xyzw | asint(cb3[57].xyzw);
  r1.xyzw = t0.Sample(s0_s, v5.xy).xyzw;
 //r1.xyzw = (int4)r1.xyzw & asint(cb3[44].xyzw);
 //r1.xyzw = (int4)r1.xyzw | asint(cb3[45].xyzw);
  r1.xyzw = r1.xyzw * float4(255,255,255,255) + float4(0.5,0.5,0.5,0.5);
  r0.xyzw = r0.xyzw * float4(255,255,255,255) + float4(0.5,0.5,0.5,0.5);
  r2.xyzw = frac(r1.xyzw);
  r3.xyzw = frac(r0.xyzw);
  r1.xyzw = -r2.xyzw + r1.xyzw;
  r0.xyzw = -r3.xyzw + r0.xyzw;
  r1.xyzw = float4(0.00392200006,0.00392200006,0.00392200006,0.00392200006) * r1.xyzw;
  r0.xyzw = float4(0.00392200006,0.00392200006,0.00392200006,0.00392200006) * r0.xyzw;
  r1.xyz = r1.xyz * r1.www;
  r0.xyz = r0.xyz * r0.www;
  r2.xyz = float3(32,32,32) * r1.xyz;
  r3.xyz = r0.xyz * float3(32,32,32) + -r2.xyz;
  r0.xyzw = t5.Sample(s5_s, v5.xy).xyzw;
 //r0.xyzw = (int4)r0.xyzw & asint(cb3[54].xyzw);
 //r0.xyzw = (int4)r0.xyzw | asint(cb3[55].xyzw);
  r1.xyzw = t1.Sample(s1_s, float2(0.5,0.5)).xyzw;
 //r1.xyzw = (int4)r1.xyzw & asint(cb3[46].xyzw);
 //r1.xyzw = (int4)r1.xyzw | asint(cb3[47].xyzw);
  r4.w = -cb4[10].x + r1.x;
  r3.w = cb4[10].y * r4.w + cb4[10].x;
  r0.xyz = r0.www * r3.xyz + r2.xyz;
  r4.y = cmp(0 < abs(r3.w));
  r4.x = rcp(r3.w);
  r0.w = r4.y ? r4.x : 99999999;
  r3.xyz = cb4[8].xxx * r0.xyz;
  r3.w = cb4[10].x * r0.w;
  r0.xyzw = t2.Sample(s2_s, v5.xy).xyzw;
 //r0.xyzw = (int4)r0.xyzw & asint(cb3[48].xyzw);
 //r0.xyzw = (int4)r0.xyzw | asint(cb3[49].xyzw);
  r0.xyzw = float4(0.25,0.25,0.25,0.25) * r0.xyzw;
  r1.xyzw = t4.Sample(s4_s, v5.xy).xyzw;
 //r1.xyzw = (int4)r1.xyzw & asint(cb3[52].xyzw);
 //r1.xyzw = (int4)r1.xyzw | asint(cb3[53].xyzw);
  r1.w = saturate(cb4[9].x * r1.y);
  r0.xyz = r3.xyz * r3.www + r0.xyz;
  r1.w = 1 + -r1.w;
  r0.xyz = r1.www * r0.xyz;
  r0.x = exp2(-r0.x);
  r0.y = exp2(-r0.y);
  r0.z = exp2(-r0.z);
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.xyz = cb4[11].zzz * r0.xyz;
  r4.y = rsqrt(abs(r0.x));
  r4.x = cmp((int)r4.y == 0x7f800000);
  r0.x = r4.x ? 99999999 : r4.y;
  r4.y = rsqrt(abs(r0.y));
  r4.x = cmp((int)r4.y == 0x7f800000);
  r0.y = r4.x ? 99999999 : r4.y;
  r4.y = rsqrt(abs(r0.z));
  r4.x = cmp((int)r4.y == 0x7f800000);
  r0.z = r4.x ? 99999999 : r4.y;
  r4.y = cmp(0 < abs(r0.x));
  r4.x = rcp(r0.x);
  r0.x = r4.y ? r4.x : 99999999;
  r4.y = cmp(0 < abs(r0.y));
  r4.x = rcp(r0.y);
  r0.y = r4.y ? r4.x : 99999999;
  r4.y = cmp(0 < abs(r0.z));
  r4.x = rcp(r0.z);
  r0.z = r4.y ? r4.x : 99999999;
  r1.xyzw = t7.Sample(s7_s, v5.xy).xyzw;
 //r1.xyzw = (int4)r1.xyzw & asint(cb3[58].xyzw);
 //r1.xyzw = (int4)r1.xyzw | asint(cb3[59].xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  o0.xyzw = saturate(-cb4[10].zzzz + r0.xyzw);
  //o0.rgb = 100;
  return;
}