// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

SamplerState SamplerSource_s : register(s0);
Texture2D<float4> SamplerSourceTexture : register(t0);


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

  r0.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.zx).xyzw;
  r0.xyzw = float4(0.0662822425,0.0662822425,0.0662822425,0.0662822425) * r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.yx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.0276305508,0.0276305508,0.0276305508,0.0276305508) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.wx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.12383154,0.12383154,0.12383154,0.12383154) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.yx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.180173814,0.180173814,0.180173814,0.180173814) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.zx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.2041637,0.2041637,0.2041637,0.2041637) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v2.wx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.180173814,0.180173814,0.180173814,0.180173814) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.yx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.12383154,0.12383154,0.12383154,0.12383154) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.zx).xyzw;
  r0.xyzw = r1.xyzw * float4(0.0662822425,0.0662822425,0.0662822425,0.0662822425) + r0.xyzw;
  r1.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v3.wx).xyzw;
  o0.xyzw = r1.xyzw * float4(0.0276305508,0.0276305508,0.0276305508,0.0276305508) + r0.xyzw;
  return;
}