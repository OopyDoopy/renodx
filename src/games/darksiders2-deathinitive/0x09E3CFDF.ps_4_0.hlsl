// ---- Created with 3Dmigoto v1.4.1 on Thu Feb 13 02:44:26 2025

cbuffer _Globals : register(b0)
{
  float4 pBlurWeightsAndOffsets[2] : packoffset(c0);
}

SamplerState pImageS_s : register(s0);
Texture2D<float4> pImage : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = pBlurWeightsAndOffsets[0].xzxw + v1.xyxy;
  r1.xyzw = pImage.Sample(pImageS_s, r0.zw).xyzw;
  r0.xyzw = pImage.Sample(pImageS_s, r0.xy).xyzw;
  r1.xyzw = pBlurWeightsAndOffsets[1].yyyy * r1.xyzw;
  r0.xyzw = pBlurWeightsAndOffsets[1].xxxx * r0.xyzw + r1.xyzw;
  r1.xyzw = pBlurWeightsAndOffsets[0].yzyw + v1.xyxy;
  r2.xyzw = pImage.Sample(pImageS_s, r1.xy).xyzw;
  r1.xyzw = pImage.Sample(pImageS_s, r1.zw).xyzw;
  r0.xyzw = pBlurWeightsAndOffsets[1].zzzz * r2.xyzw + r0.xyzw;
  o0.xyzw = pBlurWeightsAndOffsets[1].wwww * r1.xyzw + r0.xyzw;
  return;
}