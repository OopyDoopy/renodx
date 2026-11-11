#include "../tonemap/prism_tonemap.hlsli"
#include "../tonemap/vanilla_plus.hlsli"
#include "../include/pixel_constants.hlsli"
#include "../../../shaders/color/oklab.hlsl"
#include "../../../shaders/color/macleod_boynton.hlsl"
#include "../tonemap/lms_gamut_compression.hlsli"

// BT.2100 ICtCp uses a fixed 100-nit reference for this scene-relative grade.
// Signed PQ extends the transform through negative LMS values without clipping.
static const float3x3 ICTCP_BT2020_TO_LMS = float3x3(
    1688.f, 2146.f, 262.f,
    683.f, 2951.f, 462.f,
    99.f, 309.f, 3688.f) / 4096.f;
static const float3x3 ICTCP_PQ_LMS_TO_ICTCP = float3x3(
    2048.f, 2048.f, 0.f,
    6610.f, -13613.f, 7003.f,
    17933.f, -17390.f, -543.f) / 4096.f;

float3 NativeGradeICtCpFromBT709(float3 color) {
  float3 lms = mul(ICTCP_BT2020_TO_LMS, renodx::color::bt2020::from::BT709(color));
  float3 pq_lms = sign(lms) * renodx::color::pq::Encode(abs(lms), 100.f);
  return mul(ICTCP_PQ_LMS_TO_ICTCP, pq_lms);
}

float3 NativeGradeBT709FromICtCp(float3 color) {
  float3 pq_lms = mul(renodx::math::Invert3x3(ICTCP_PQ_LMS_TO_ICTCP), color);
  // Avoid the PQ inverse's asymptote for extreme out-of-gamut chroma.
  float3 lms = sign(pq_lms) * renodx::color::pq::Decode(min(abs(pq_lms), 1.5f), 100.f);
  return renodx::color::bt709::from::BT2020(mul(renodx::math::Invert3x3(ICTCP_BT2020_TO_LMS), lms));
}

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
      CustomPixelConsts_224.x
          * renodx::math::SafePow(source_linear, CustomPixelConsts_128.x)
        + CustomPixelConsts_224.y,
      CustomPixelConsts_224.z);
}

float3 EncodeNativeGradingGamma(float3 color) {
  return float3(
      CustomGammaEncode(color.r),
      CustomGammaEncode(color.g),
      CustomGammaEncode(color.b));
}

    float3 ProtectNativeShaperShadows(float3 source_linear, float3 shaped_linear) {
      // For (a*x^p+b)^(q*2.2), solve the linear-output second derivative.
      // Pure powers and invalid or absent positive inflections use the previous anchor.
      float p = CustomPixelConsts_128.x;
      float a = CustomPixelConsts_224.x;
      float b = CustomPixelConsts_224.y;
      float q = CustomPixelConsts_224.z * 2.2f;
      float denominator = a * (p * q - 1.f);
      float root_power = abs(denominator) > 1e-6f ? -(p - 1.f) * b / denominator : -1.f;
      float anchor = 0.18f;
      if (p > 1e-6f && root_power > 0.f && root_power < 1e20f) {
        float candidate = pow(root_power, rcp(p));
        if (candidate > 1e-6f && candidate < 1e4f && a * root_power + b > 0.f && q > 0.f) {
          anchor = candidate;
        }
      }
      float3 t = saturate(source_linear / anchor);
      float3 fade = t * t * t * (t * (t * 6.f - 15.f) + 10.f);
      return lerp(shaped_linear, source_linear,
      saturate(CUSTOM_GAME_GRADING_SHADOW_PROTECTION) * (1.f - fade));
    }

SaturationGrade ApplySaturationGrade(float3 source_linear) {
  SaturationGrade result;
  // In the remaster, mode 0 is vanilla and upgraded grading starts at mode 1.
  bool use_upgraded_grading = CUSTOM_GAME_GRADING_SATURATION_SPACE != 0.f
                              && RENODX_TONE_MAP_TYPE != 0.f;
  bool use_oklab_grading = use_upgraded_grading
                           && CUSTOM_GAME_GRADING_SATURATION_SPACE == 2.f;
  bool use_ictcp_grading = use_upgraded_grading
                           && CUSTOM_GAME_GRADING_SATURATION_SPACE == 3.f;
  float shaping_strength = RENODX_TONE_MAP_TYPE != 0.f
      ? saturate(CUSTOM_GAME_GRADING_SHAPING)
      : 1.f;
  float3 neutral_gamma = EncodeNativeGradingGamma(source_linear);
  float3 shaped_gamma = ApplyVanillaSaturationShaper(source_linear);
  float3 grading_input;
  float3 grading_oklab;
  float3 grading_ictcp;
  float ictcp_neutral_linear = 0.f;
  result.ungraded = source_linear;
  [branch]
  if (use_upgraded_grading) {
    if (use_oklab_grading) {
      float3 source_oklab = renodx::color::oklab::from::BT709(source_linear);
      float source_lightness = source_oklab.x;
      float neutral_linear = source_lightness * source_lightness * source_lightness;
      float neutral_shaped_gamma = lerp(
          CustomGammaEncode(neutral_linear),
          ApplyUpgradedSaturationShaper(neutral_linear.xxx).x,
          shaping_strength);
      float shaped_neutral_linear = renodx::color::gamma::DecodeSafe(neutral_shaped_gamma);
      if (CUSTOM_GAME_GRADING_SHADOW_PROTECTION > 0.f) {
        shaped_neutral_linear = ProtectNativeShaperShadows(neutral_linear.xxx, shaped_neutral_linear.xxx).x;
      }
      float shaped_lightness = renodx::math::Cbrt(shaped_neutral_linear);
        // Don't let a lifted shadow toe amplify low-light chroma.
        float chroma_scale = abs(source_lightness) > 1e-6f
          ? saturate(shaped_lightness / source_lightness)
          : 1.f;
      grading_oklab = float3(shaped_lightness, source_oklab.yz * chroma_scale);
      grading_input = renodx::color::bt709::from::OkLab(grading_oklab);
      shaped_gamma = EncodeNativeGradingGamma(grading_input);
    } else if (use_ictcp_grading) {
      float3 source_ictcp = NativeGradeICtCpFromBT709(source_linear);
      float source_intensity = source_ictcp.x;
      float neutral_linear = NativeGradeBT709FromICtCp(float3(source_intensity, 0.f, 0.f)).x;
      float neutral_shaped_gamma = lerp(
        CustomGammaEncode(neutral_linear),
        ApplyUpgradedSaturationShaper(neutral_linear.xxx).x,
        shaping_strength);
      ictcp_neutral_linear = renodx::color::gamma::DecodeSafe(neutral_shaped_gamma);
      if (CUSTOM_GAME_GRADING_SHADOW_PROTECTION > 0.f) {
        ictcp_neutral_linear = ProtectNativeShaperShadows(neutral_linear.xxx, ictcp_neutral_linear.xxx).x;
      }
      float shaped_intensity = NativeGradeICtCpFromBT709(ictcp_neutral_linear.xxx).x;
      float chroma_scale = abs(source_intensity) > 1e-6f
        ? saturate(shaped_intensity / source_intensity)
        : 1.f;
      grading_ictcp = float3(shaped_intensity, source_ictcp.yz * chroma_scale);
      grading_input = NativeGradeBT709FromICtCp(grading_ictcp);
      shaped_gamma = EncodeNativeGradingGamma(grading_input);
    } else {
      shaped_gamma = ApplyUpgradedSaturationShaper(source_linear);
      shaped_gamma = lerp(neutral_gamma, shaped_gamma, shaping_strength);
      grading_input = renodx::color::gamma::DecodeSafe(shaped_gamma);
      if (CUSTOM_GAME_GRADING_SHADOW_PROTECTION > 0.f) {
        grading_input = ProtectNativeShaperShadows(source_linear, grading_input);
      }
      shaped_gamma = EncodeNativeGradingGamma(grading_input);
    }
  } else {
    shaped_gamma = lerp(neutral_gamma, shaped_gamma, shaping_strength);
    grading_input = exp2(log2(max(0.f, shaped_gamma)) * 2.200000047683716f);
  }

  float game_luminance = use_oklab_grading
      ? CustomGammaEncode(grading_oklab.x * grading_oklab.x * grading_oklab.x)
      : use_ictcp_grading
      ? CustomGammaEncode(ictcp_neutral_linear)
      : dot(
            float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f),
            shaped_gamma);
  float lower_mask = saturate((game_luminance - CustomPixelConsts_160.x) * CustomPixelConsts_160.y);
  float upper_mask = saturate((game_luminance - CustomPixelConsts_160.z) * CustomPixelConsts_160.w);

  float luminance = dot(
      float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f),
      grading_input);
  float4 lower_grade = lerp(CustomPixelConsts_192, CustomPixelConsts_176, lower_mask);
  float3 channel_grade = lerp(lower_grade.rgb, CustomPixelConsts_208.rgb, upper_mask);
  channel_grade = lerp(1.f.xxx, channel_grade, shaping_strength);
  float lower_saturation = lerp(
      1.f,
      lower_grade.a,
      RENODX_TONE_MAP_TYPE != 0.f
          ? saturate(CUSTOM_GAME_GRADING_SATURATION_LOWER)
          : 1.f);
  float upper_saturation = lerp(
      1.f,
      CustomPixelConsts_208.a,
      RENODX_TONE_MAP_TYPE != 0.f
          ? saturate(CUSTOM_GAME_GRADING_SATURATION_UPPER)
          : 1.f);
  float saturation = lerp(lower_saturation, upper_saturation, upper_mask);

  float3 saturated;
  if (use_oklab_grading) {
    grading_oklab.yz *= saturation;
  } else if (use_ictcp_grading) {
    grading_ictcp.yz *= saturation;
  } else if (use_upgraded_grading) {
    if (CUSTOM_GAME_GRADING_SATURATION_SPACE == 1.f) {
      float3 mb = renodx::color::macleod_boynton::from::BT709(grading_input);
      const float3 mb_neutral = renodx::color::macleod_boynton::from::BT709(1.f.xxx);
      saturation = LimitMBSaturationIncrease(mb, saturation, LAST_IS_HDR);
      mb.xy = lerp(mb_neutral.xy, mb.xy, saturation);
      saturated = renodx::color::bt709::from::MacLeodBoynton(mb);
    } else {
      saturated = lerp(luminance.xxx, grading_input, saturation);
    }
  } else {
    saturated = lerp(luminance.xxx, grading_input, saturation);
  }
  float3 graded_linear;
  if (use_oklab_grading) {
    float neutral_lightness = grading_oklab.x;
    float neutral_linear = neutral_lightness * neutral_lightness * neutral_lightness;
    float3 neutral_oklab = renodx::color::oklab::from::BT709(neutral_linear.xxx);
    float3 graded_neutral_oklab = renodx::color::oklab::from::BT709(
        neutral_linear.xxx * channel_grade);
    grading_oklab += graded_neutral_oklab - neutral_oklab;
    graded_linear = renodx::color::bt709::from::OkLab(grading_oklab);
  } else if (use_ictcp_grading) {
    float3 neutral_ictcp = NativeGradeICtCpFromBT709(ictcp_neutral_linear.xxx);
    float3 graded_neutral_ictcp = NativeGradeICtCpFromBT709(ictcp_neutral_linear.xxx * channel_grade);
    grading_ictcp += graded_neutral_ictcp - neutral_ictcp;
    graded_linear = NativeGradeBT709FromICtCp(grading_ictcp);
  } else {
    graded_linear = saturated * channel_grade;
  }
  result.graded_gamma = CustomPixelConsts_144.rgb * EncodeNativeGradingGamma(graded_linear);

  return result;
}

float3 ApplyUserColorGrading(SaturationGrade grade) {
  return grade.graded_gamma;
}

float3 ApplyFinalGradingTonemap(float3 gamma_color) {
  if (LAST_IS_HDR || RENODX_TONE_MAP_TYPE == TONE_MAP_TYPE_GAME_VANILLA) return gamma_color;

  float3 scene_linear = renodx::color::gamma::DecodeSafe(gamma_color, 2.2f);
  if (RENODX_TONE_MAP_TYPE == TONE_MAP_TYPE_VANILLA_PLUS) {
    scene_linear = VanillaPlusShoulder(scene_linear, 1.f);
  } else if (RENODX_TONE_MAP_TYPE == TONE_MAP_TYPE_PRISM) {
    scene_linear = ApplyPrismShoulderSDR(scene_linear);
  } else {
    scene_linear = CustomTonemapSDR(scene_linear);
  }
  if (CUSTOM_GAME_GRADING_SATURATION_SPACE != 0.f) {
    scene_linear = CompressLMSRadialBT709(SanitizeGamutInputBT709(scene_linear));
  }
  return renodx::color::gamma::EncodeSafe(saturate(scene_linear), 2.2f);
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

float3 ApplySaturationTonemapSDR(float3 gamma_color) {
  return renodx::color::gamma::EncodeSafe(
  CustomTonemapSDR(renodx::color::gamma::DecodeSafe(gamma_color)));
}

float3 ApplySaturationTonemapHDR(float3 gamma_color) {
  return renodx::color::gamma::EncodeSafe(
  CustomTonemapHDR(renodx::color::gamma::DecodeSafe(gamma_color)));
}
