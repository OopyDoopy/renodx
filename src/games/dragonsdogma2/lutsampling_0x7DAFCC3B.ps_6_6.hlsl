#include "./common.hlsl"

Texture2D<float4> SrcTexture : register(t0);

Texture3D<float4> SrcLUT : register(t1);

SamplerState PointBorder : register(s2, space32);

SamplerState TrilinearClamp : register(s9, space32);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD) : SV_Target {
  float4 SV_Target;
  float4 _9 = SrcTexture.SampleLevel(PointBorder, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);

  float4 ungraded_ap1 = _9;
  float3 ungraded_bt709 = renodx::color::bt709::from::AP1(ungraded_ap1.xyz);

  float calculated_peak = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;

  float3 output_color = ungraded_bt709;
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    // The unmodified LUT builder expects ACEScct and returns BT.2020 PQ.
    float3 acescct = renodx::color::acescct::EncodeSafe(ungraded_ap1.xyz);
    SV_Target.xyz = SrcLUT.SampleLevel(
        TrilinearClamp,
        acescct * 0.984375f + 0.0078125f,
        0.f).xyz;
    SV_Target.w = 1.f;
    return SV_Target;
  } else if (RENODX_TONE_MAP_TYPE == 2.f) {  // RenoDX Custom
    float3 psycho_peak = calculated_peak;
    if (RENODX_GAMMA_CORRECTION > 0.f) {
      psycho_peak = GammaCorrectionLMS(calculated_peak, true);
    }
    renodx::tonemap::psycho::config::Config psycho_config =
      renodx::tonemap::psycho::config::BuildConfig();
    psycho_config.peak_value = psycho_peak;

    if (VANILLA_CURVE_MATCH == 1) {
      // Approximate the former 1.6 shadow and 1.12 highlight contrast slopes
      // using a single continuous contrast curve biased toward the shadows.
      psycho_config.shadow_biased_contrast = 1.32f;
      psycho_config.contrast_shadow_bias = 0.450f;
      psycho_config.current_adaptive_state_bt709 = 0.18f;
      psycho_config.current_background_state_bt709 = 0.17f;
    }

    output_color = renodx::tonemap::psycho::psychotm_customized(
        ungraded_bt709,
      psycho_config);
    output_color = min(output_color, psycho_peak); // clamp overshoot
  } else if (RENODX_TONE_MAP_TYPE == 1.f) {  // ACES
    SV_Target.xyz = ApplyCustomACESToneMapEncodePQ(
        _9.rgb,
        RENODX_PEAK_WHITE_NITS,
        RENODX_DIFFUSE_WHITE_NITS * 1.5f,  // Matches vanilla ACES at 1.f exposure scale.
        TEXCOORD);
    SV_Target.w = 1.f;
    return SV_Target;
  }

  output_color = CustomPostProcessing(output_color, TEXCOORD);

  if (RENODX_GAMMA_CORRECTION > 0.f) {
    output_color = RENODX_GAMMA_CORRECTION == 1.f ? renodx::color::correct::GammaSafe(output_color) : GammaCorrectionLMS(output_color);
  }
  output_color = renodx::color::bt2020::from::BT709(output_color);
  output_color = renodx::color::pq::EncodeSafe(output_color, RENODX_DIFFUSE_WHITE_NITS);
  SV_Target.xyz = output_color;

  SV_Target.w = 1.0f;
  return SV_Target;
}
