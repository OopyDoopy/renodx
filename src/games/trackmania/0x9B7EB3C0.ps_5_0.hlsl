// ---- Created with 3Dmigoto v1.4.1 on Fri Apr 11 13:17:40 2025



// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0.xyz = v1.www * v1.xyz;
  o0.w = v1.w;
  return;
}