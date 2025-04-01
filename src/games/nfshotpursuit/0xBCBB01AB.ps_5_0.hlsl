// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

cbuffer _Globals : register(b0)
{
  float4 kColorAddWeight : packoffset(c0);
}

SamplerState SamplerSource_s : register(s0);
SamplerState SamplerAdd_s : register(s1);
Texture2D<float4> SamplerSourceTexture : register(t0);
Texture2D<float4> SamplerAddTexture : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.xz).xyzw;
  r0.xyzw = float4(0.0662822425,0.0662822425,0.0662822425,0.0662822425) * r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.xy).xyzw;
  r0.xyzw = r1.xyzw * float4(0.0276305508,0.0276305508,0.0276305508,0.0276305508) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.xw).xyzw;
  r0.xyzw = r1.xyzw * float4(0.12383154,0.12383154,0.12383154,0.12383154) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.xy).xyzw;
  r0.xyzw = r1.xyzw * float4(0.180173814,0.180173814,0.180173814,0.180173814) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.xz).xyzw;
  r0.xyzw = r1.xyzw * float4(0.2041637,0.2041637,0.2041637,0.2041637) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.xw).xyzw;
  r0.xyzw = r1.xyzw * float4(0.180173814,0.180173814,0.180173814,0.180173814) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.xy).xyzw;
  r0.xyzw = r1.xyzw * float4(0.12383154,0.12383154,0.12383154,0.12383154) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.xz).xyzw;
  r0.xyzw = r1.xyzw * float4(0.0662822425,0.0662822425,0.0662822425,0.0662822425) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.xw).xyzw;
  r0.xyzw = r1.xyzw * float4(0.0276305508,0.0276305508,0.0276305508,0.0276305508) + r0.xyzw;
  r1.xyz = SamplerAddTexture.Sample(SamplerAdd_s, v2.xz).xyz;
  r1.xyz = kColorAddWeight.www * r1.xyz;
  o0.xyz = r0.xyz * kColorAddWeight.xyz + r1.xyz;
  o0.w = r0.w;
  return;
}