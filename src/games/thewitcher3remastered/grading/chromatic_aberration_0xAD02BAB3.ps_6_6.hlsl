#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);

SamplerState s1 : register(s1);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_2 : TEXCOORD2) : SV_Target {
  float4 source = SampleChromaticAberration(TEXCOORD, t0, s1);
  SaturationGrade grade = ApplySaturationGrade(source.rgb);
  float3 gamma_color = ApplyUserColorGrading(grade);
  gamma_color = ApplyOutputRange(gamma_color);
  return float4(ApplyFinalGradingTonemap(gamma_color), source.a);
}
