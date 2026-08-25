#include "./uncharted2.hlsl"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float scene_reference = t1.Load(int3(0, 0, 0)).x;
  float3 source = t0.Load(int3(uint2(SV_Position.xy), 0)).rgb;

  float white_1 = CustomPixelConsts_256.x * 11.199999809265137f;
  float exposure_1 = CustomPixelConsts_256.x
      / (exp2(
             log2(max(clamp(scene_reference, CustomPixelConsts_064.y, CustomPixelConsts_064.z), 9.999999747378752e-05f) / white_1)
             * CustomPixelConsts_256.z)
         * white_1);
    float3 untonemapped_1 = source * exposure_1;

  float white_2 = CustomPixelConsts_272.x * 11.199999809265137f;
  float exposure_2 = CustomPixelConsts_272.x
      / (exp2(
             log2(max(clamp(scene_reference, CustomPixelConsts_144.y, CustomPixelConsts_144.z), 9.999999747378752e-05f) / white_2)
             * CustomPixelConsts_272.z)
         * white_2);
    float3 untonemapped_2 = source * exposure_2;

  float blend = CustomPixelConsts_208.x;
    float3 untonemapped = lerp(untonemapped_1, untonemapped_2, blend);
    float3 output_color;

    [branch]
    if (RENODX_TONE_MAP_TYPE == 3.f) {
        Uncharted2PsychoV25Match match_1 = BuildUncharted2PsychoV25Match1();
        Uncharted2PsychoV25Match match_2 = BuildUncharted2PsychoV25Match2();
        Uncharted2PsychoV25Match match;
        match.anchor_in = lerp(match_1.anchor_in, match_2.anchor_in, blend);
        match.anchor_out = lerp(match_1.anchor_out, match_2.anchor_out, blend);
        match.cone_response = lerp(match_1.cone_response, match_2.cone_response, blend);
        output_color = ApplyPsychoV25ToneMap(untonemapped, match);
    } else {
        if (RENODX_TONE_MAP_TYPE == 2.f) {
            output_color = lerp(
                    Uncharted2Extended1(untonemapped_1),
                    Uncharted2Extended2(untonemapped_2),
                    blend);
        } else {
            output_color = lerp(
                    Uncharted2Tonemap1(untonemapped_1),
                    Uncharted2Tonemap2(untonemapped_2),
                    blend);
        }

        if (RENODX_TONE_MAP_TYPE != 1.f) {
            Uncharted2ToneMapAnchor anchor_1 = BuildUncharted2ToneMapAnchor1();
            Uncharted2ToneMapAnchor anchor_2 = BuildUncharted2ToneMapAnchor2();
            output_color = ApplyVanillaPlusGrading(
                    output_color,
                    lerp(anchor_1.output, anchor_2.output, blend));
        }
    }

  if (CUSTOM_SCENE_GRADE_HUE_CORRECTION > 0.f && RENODX_TONE_MAP_TYPE == 3.f) {
    float3 vanilla_sdr = lerp(
                Uncharted2Tonemap1(untonemapped_1),
                Uncharted2Tonemap2(untonemapped_2),
        blend);
    float3 hue_reference = lerp(
        output_color,
        vanilla_sdr,
                saturate(renodx::math::Max(lerp(
                        Uncharted2Extended1(untonemapped_1),
                        Uncharted2Extended2(untonemapped_2),
                        blend))));
    output_color = renodx::color::correct::Hue(
        output_color,
        hue_reference,
        CUSTOM_SCENE_GRADE_HUE_CORRECTION,
        CUSTOM_SCENE_HUE_METHOD);
  }

    float output_alpha = 1.f;
    [branch]
    if (RENODX_TONE_MAP_TYPE >= 2.f && all(uint2(SV_Position.xy) == 0u)) {
        output_alpha = lerp(
                Uncharted2Tonemap1(100.f),
                Uncharted2Tonemap2(100.f),
                blend);
    }

  // Carry the original dynamic peak in the top-left alpha texel for bloom.
    return float4(output_color, output_alpha);
}