#include "./uncharted2.hlsl"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float scene_reference = t1.Load(int3(0, 0, 0)).x;
  float white = CustomPixelConsts_256.x * 11.199999809265137f;
  float exposure = CustomPixelConsts_256.x
      / (exp2(
             log2(max(clamp(scene_reference, CustomPixelConsts_064.y, CustomPixelConsts_064.z), 9.999999747378752e-05f) / white)
             * CustomPixelConsts_256.z)
         * white);

  float3 source = t0.Load(int3(uint2(SV_Position.xy), 0)).rgb * exposure;
    float3 output_color;

    [branch]
    if (RENODX_TONE_MAP_TYPE == 3.f) {
        output_color = ApplyPsychoV25ToneMap(
                source,
                BuildUncharted2PsychoV25Match1());
    } else {
        [branch]
        if (RENODX_TONE_MAP_TYPE == 2.f) {
            output_color = Uncharted2Extended1(source);
        } else {
            output_color = Uncharted2Tonemap1(source);
        }

        if (RENODX_TONE_MAP_TYPE != 1.f) {
            output_color = ApplyVanillaPlusGrading(
                    output_color,
                    BuildUncharted2ToneMapAnchor1().output);
        }
    }

  if (CUSTOM_SCENE_GRADE_HUE_CORRECTION > 0.f && RENODX_TONE_MAP_TYPE == 3.f) {
    float3 vanilla_sdr = Uncharted2Tonemap1(source);
    float3 hue_reference = lerp(
        output_color,
        vanilla_sdr,
                saturate(renodx::math::Max(Uncharted2Extended1(source))));
    output_color = renodx::color::correct::Hue(
        output_color,
        hue_reference,
        CUSTOM_SCENE_GRADE_HUE_CORRECTION,
        CUSTOM_SCENE_HUE_METHOD);
  }

    float output_alpha = 1.f;
    [branch]
    if (RENODX_TONE_MAP_TYPE >= 2.f && all(uint2(SV_Position.xy) == 0u)) {
        output_alpha = Uncharted2Tonemap1(100.f);
    }

  // Carry the original dynamic peak in the top-left alpha texel for bloom.
    return float4(output_color, output_alpha);
}