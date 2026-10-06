#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);

SamplerState s0 : register(s0);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_2 : TEXCOORD2) : SV_Target {
  float4 source = t0.SampleLevel(s0, TEXCOORD, 0.f);
  SaturationGrade grade = ApplySaturationGrade(source.rgb);
  float3 gamma_color = ApplyUserColorGrading(grade);

  float2 vignette_position = TEXCOORD_2 - 0.5f;
  float radial = saturate(length(vignette_position) * 2.4390244483947754f - 0.6707317233085632f);
  float radial_squared = radial * radial;
  float radial_cubed = radial_squared * radial;
  float radial_fourth = radial_squared * radial_squared;
  float vignette_shape = min(
      dot(
          float4(-0.10000000149011612f, -0.10499999672174454f, 1.1200000047683716f, 0.09000000357627869f),
          float4(radial_fourth, radial_cubed, radial_squared, radial)),
      0.9399999976158142f);
  float vignette_luminance = dot(
      renodx::color::gamma::DecodeSafe(gamma_color),
      CustomPixelConsts_096.rgb);
  float vignette = saturate(
      CustomPixelConsts_096.w
          * vignette_shape
          * saturate(1.f - vignette_luminance)
          * CUSTOM_VIGNETTE);
  float3 vignetted_gamma = lerp(
      gamma_color,
      CustomPixelConsts_112.rgb * CUSTOM_VIGNETTE_BLACK_LEVEL,
      vignette);
    vignetted_gamma = ApplyOutputRange(vignetted_gamma);
    return float4(ApplyFinalGradingTonemap(vignetted_gamma), source.a);
}
