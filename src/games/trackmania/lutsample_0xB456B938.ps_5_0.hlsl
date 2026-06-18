#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.4.1 on Sat Apr 12 01:37:46 2025

cbuffer ShaderP : register(b0)
{

  struct
  {
    float3 TcScale;
    float wIdentity;
    float3 TcTrans;
    float Pad0;
  } g_CBuffer : packoffset(c0);

}

SamplerState SGbxClamp_Point_s : register(s0);
SamplerState SGbxClamp_Trilinear_s : register(s1);
Texture2D<float4> TMapInput : register(t0);
Texture3D<float4> TMapRemap : register(t1);


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

  r0.xyzw = TMapInput.Sample(SGbxClamp_Point_s, v1.xy).xyzw;

  r0.xyz = InvertIntermediatePass(r0.xyz);

  float3 ungraded = r0.xyz;
  SceneGradeGamutCompressionState gamut_compression_state = SetupSceneGradeGamutCompression(r0.xyz);

  r1.xyz = g_CBuffer.TcScale.xyz * r0.xyz + g_CBuffer.TcTrans.xyz;
  r1.xyz = TMapRemap.Sample(SGbxClamp_Trilinear_s, r1.xyz).xyz;
  o0.xyz = g_CBuffer.wIdentity * r0.xyz + r1.xyz;

  o0.xyz = InvertSceneGradeGamutCompression(o0.xyz, gamut_compression_state);
  o0.xyz = lerp(ungraded, o0.xyz, SCENE_GRADE_COLOR_GRADE_STRENGTH_TWO);

  o0.w = r0.w;

  o0.rgb = IntermediatePass(o0.rgb);
  return;
}