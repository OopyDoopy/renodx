// ---- Created with 3Dmigoto v1.4.1 on Fri Apr 11 13:17:40 2025

cbuffer ShaderP : register(b0)
{
  int GbxTextureRgbIsPreModWithA_Diffuse : packoffset(c0);
  int GbxTextureInvertY_Diffuse : packoffset(c0.y);
  int GbxTextureInvertY_Alpha : packoffset(c0.z);
}

SamplerState SMapDiffuse_s : register(s0);
Texture2D<float4> TMapDiffuse : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 1 + -v2.y;
  r0.y = GbxTextureInvertY_Diffuse ? r0.x : v2.y;
  r0.x = v2.x;
  r0.xyzw = TMapDiffuse.Sample(SMapDiffuse_s, r0.xy).xyzw;
  r0.xyzw = v1.xyzw * r0.xyzw;
  r1.x = log2(abs(r0.w));
  r1.x = 0.725000024 * r1.x;
  r1.w = exp2(r1.x);
  r2.xyz = r0.xyz * r0.www;
  r1.xyz = r0.xyz;
  r2.w = r0.w;
  o0.xyzw = GbxTextureRgbIsPreModWithA_Diffuse ? r1.xyzw : r2.xyzw;
  return;
}