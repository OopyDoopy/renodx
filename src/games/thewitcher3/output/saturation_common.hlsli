#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

struct SaturationGrade {
  float3 ungraded;
  float3 graded_gamma;
};

float4 SampleChromaticAberration(
    float2 texcoord,
    Texture2D<float4> source_texture,
    SamplerState source_sampler) {
  float4 center = source_texture.SampleLevel(source_sampler, texcoord, 0.f);
  float2 normalized_position = (texcoord - CustomPixelConsts_272.xy) / CustomPixelConsts_272.xy;
  float radius = length(normalized_position);
  float aberration = saturate((radius - CustomPixelConsts_256.y) * CustomPixelConsts_256.z);

  [branch]
  if (aberration > 0.f) {
    float radial_scale = aberration * aberration * CustomPixelConsts_256.x;
    radial_scale *= clamp(rcp(radius), -renodx::math::FLT_MAX, renodx::math::FLT_MAX);
    float2 offset = normalized_position * CustomPixelConsts_272.zw * radial_scale;
    center.r = source_texture.SampleLevel(source_sampler, texcoord - offset * 2.f, 0.f).r;
    center.g = source_texture.SampleLevel(source_sampler, texcoord - offset, 0.f).g;
  }
  return center;
}

float3 ApplyVanillaSaturationShaper(float3 source_gamma) {
  return exp2(
      log2(
          max(
              0.f,
              CustomPixelConsts_224.x
                  * exp2(log2(abs(source_gamma)) * CustomPixelConsts_128.x)
                + CustomPixelConsts_224.y))
        * CustomPixelConsts_224.z);
}

float3 ApplyUpgradedSaturationShaper(float3 source_linear) {
  return renodx::math::SafePow(
      max(
          0.f,
          CustomPixelConsts_224.x
              * renodx::math::SafePow(source_linear, CustomPixelConsts_128.x)
            + CustomPixelConsts_224.y),
      CustomPixelConsts_224.z);
}

SaturationGrade ApplySaturationGrade(float3 source_linear) {
  SaturationGrade result;
  bool use_upgraded_grading = CUSTOM_GRADING_IMPROVEMENTS == 1.f
                              && RENODX_TONE_MAP_TYPE != 1.f;
  float3 shaped_gamma = ApplyVanillaSaturationShaper(source_linear);
  result.ungraded = renodx::color::gamma::Decode(shaped_gamma);

  float tonemap_scale = 1.f;
  float gamut_compression_scale = 1.f;
  float3 gamut_adaptive_state_lms = ColorGradeGamutAdaptiveStateLMS();
  float3 grading_input = result.ungraded;

  [branch]
  if (use_upgraded_grading) {
    grading_input = source_linear;
    ColorGradePsychoGamutCompress(
        grading_input,
        gamut_compression_scale,
        gamut_adaptive_state_lms);
    tonemap_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(grading_input);
    grading_input *= tonemap_scale;
    shaped_gamma = ApplyUpgradedSaturationShaper(grading_input);
    grading_input = renodx::color::gamma::DecodeSafe(shaped_gamma);
  }

  float game_luminance = dot(
      float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f),
      shaped_gamma);
  float lower_mask = saturate((game_luminance - CustomPixelConsts_160.x) * CustomPixelConsts_160.y);
  float upper_mask = saturate((game_luminance - CustomPixelConsts_160.z) * CustomPixelConsts_160.w);

  float luminance = renodx::color::y::from::BT709(grading_input);
  float4 lower_grade = lerp(CustomPixelConsts_192, CustomPixelConsts_176, lower_mask);
  float3 channel_grade = lerp(lower_grade.rgb, CustomPixelConsts_208.rgb, upper_mask);
  float saturation = lerp(lower_grade.a, CustomPixelConsts_208.a, upper_mask);
  float3 saturated = lerp(luminance.xxx, grading_input, saturation);
  float3 graded_linear = saturated * channel_grade;
  result.graded_gamma = CustomPixelConsts_144.rgb * float3(
      CustomGammaEncode(graded_linear.r),
      CustomGammaEncode(graded_linear.g),
      CustomGammaEncode(graded_linear.b));

  [branch]
  if (use_upgraded_grading) {
    float3 reconstructed_grade = renodx::color::gamma::DecodeSafe(result.graded_gamma);
    reconstructed_grade = renodx::math::SafeDivision(
        reconstructed_grade,
        tonemap_scale,
        renodx::math::FLT_MAX);
    ColorGradePsychoGamutDecompress(
        reconstructed_grade,
        gamut_compression_scale,
        gamut_adaptive_state_lms);
    result.graded_gamma = renodx::color::gamma::EncodeSafe(reconstructed_grade);
  }

  return result;
}

float3 ApplyUserColorGrading(SaturationGrade grade) {
  float3 graded_linear = renodx::color::gamma::DecodeSafe(grade.graded_gamma);
  graded_linear = CustomColorGrading(grade.ungraded, graded_linear);
  return renodx::color::gamma::EncodeSafe(graded_linear);
}

float3 ApplyOutputRange(float3 gamma_color) {
  return gamma_color * (CustomPixelConsts_240.y - CustomPixelConsts_240.x)
      + CustomPixelConsts_240.x;
}

float3 ApplyAnalyticVignette(float3 gamma_color, float2 vignette_coords) {
  float radial = saturate(length(vignette_coords - 0.5f) * 2.4390244483947754f - 0.6707317233085632f);
  float radial_squared = radial * radial;
  float shape = min(
      dot(
          float4(-0.10000000149011612f, -0.10499999672174454f, 1.1200000047683716f, 0.09000000357627869f),
          float4(radial_squared * radial_squared, radial_squared * radial, radial_squared, radial)),
      0.9399999976158142f);
  float luminance_gate = saturate(
      1.f - dot(renodx::math::SafePow(gamma_color, 2.200000047683716f), CustomPixelConsts_096.rgb));
  float vignette = saturate(CustomPixelConsts_096.w * shape * luminance_gate);
  return lerp(
      gamma_color,
      CustomPixelConsts_112.rgb * CUSTOM_VIGNETTE_BLACK_LEVEL,
      saturate(vignette * CUSTOM_VIGNETTE));
}

float3 ApplySampledVignette(float3 gamma_color, float vignette_sample) {
  float luminance_gate = saturate(
      1.f - dot(
          renodx::math::SafePow(gamma_color, 2.200000047683716f),
          CustomPixelConsts_096.rgb));
  float vignette = saturate(CustomPixelConsts_096.w * vignette_sample * luminance_gate);
  return lerp(
      gamma_color,
      CustomPixelConsts_112.rgb * CUSTOM_VIGNETTE_BLACK_LEVEL,
      saturate(vignette * CUSTOM_VIGNETTE));
}

    float3 ApplyPhotoModeVignette(float3 gamma_color, float2 vignette_coords) {
      float radial = saturate(
        (length(vignette_coords - 0.5f) * 2.f - 0.550000011920929f + CustomPixelConsts_112.w)
        * 1.2195122241973877f);
      float radial_squared = radial * radial;
      float shape = min(
        dot(
          float4(-0.10000000149011612f, -0.10499999672174454f, 1.1200000047683716f, 0.09000000357627869f),
          float4(radial_squared * radial_squared, radial_squared * radial, radial_squared, radial)),
        0.9399999976158142f);
      float luminance_gate = saturate(
        1.f - dot(renodx::math::SafePow(gamma_color, 2.200000047683716f), CustomPixelConsts_096.rgb));
      float vignette = saturate(CustomPixelConsts_096.w * shape * luminance_gate);
      return lerp(gamma_color, CustomPixelConsts_112.rgb, vignette);
    }

float3 ApplySaturationTonemap(float3 gamma_color) {
  return renodx::color::gamma::EncodeSafe(
  CustomTonemap(renodx::color::gamma::DecodeSafe(gamma_color)));
}