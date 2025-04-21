// ---- Created with 3Dmigoto v1.3.16 on Tue Mar 25 18:55:52 2025



// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0.xyw = v1.xyw;
  o0.z = v2.z;
  //o0 = saturate(o0);
  return;
}