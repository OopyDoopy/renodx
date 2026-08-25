#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);
SamplerState s1 : register(s1);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_2 : TEXCOORD2) : SV_Target {
  SaturationGrade grade = ApplySaturationGrade(
      SampleChromaticAberration(TEXCOORD, t0, s1).rgb);
  float3 gamma_color = ApplyUserColorGrading(grade);
  gamma_color = ApplyOutputRange(
      ApplyAnalyticVignette(gamma_color, TEXCOORD_2));
  return float4(ApplySaturationTonemap(gamma_color), 1.f);
}