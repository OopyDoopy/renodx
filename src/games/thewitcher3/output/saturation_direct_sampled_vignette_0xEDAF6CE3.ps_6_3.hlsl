#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t2 : register(t2);

SamplerState s0 : register(s0);
SamplerState s2 : register(s2);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_2 : TEXCOORD2) : SV_Target {
  SaturationGrade grade = ApplySaturationGrade(
      t0.SampleLevel(s0, TEXCOORD, 0.f).rgb);
  float3 gamma_color = ApplyUserColorGrading(grade);
  gamma_color = ApplyOutputRange(ApplySampledVignette(
      gamma_color,
      t2.Sample(s2, TEXCOORD_2).r));
  return float4(ApplySaturationTonemap(gamma_color), 1.f);
}