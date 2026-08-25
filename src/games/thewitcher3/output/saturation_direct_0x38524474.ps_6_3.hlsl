#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);
SamplerState s0 : register(s0);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD) : SV_Target {
  SaturationGrade grade = ApplySaturationGrade(
      t0.SampleLevel(s0, TEXCOORD, 0.f).rgb);
  float3 gamma_color = ApplyUserColorGrading(grade);
  gamma_color = ApplyOutputRange(gamma_color);
  return float4(ApplySaturationTonemap(gamma_color), 1.f);
}