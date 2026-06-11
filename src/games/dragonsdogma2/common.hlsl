#include "./shared.h"
#include "./psychov_custom.hlsl"

#define LMS_WHITE renodx::color::lms::from::BT709(float3(1.f, 1.f, 1.f))

float3 CustomPostProcessing(float3 color, float2 uv) {
  //color = ApplyRCAS(color, uv, t1, s1);
  color = renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return color;
}

float3 GammaCorrectionLMS(float3 color_bt709, bool inverse = false) {
  float3 color_lms = renodx::color::lms::from::BT709(color_bt709) / LMS_WHITE;
  color_lms = renodx::color::correct::GammaSafe(color_lms, inverse);
  return renodx::color::bt709::from::LMS(color_lms * LMS_WHITE);
}

namespace renodx_custom {
namespace tonemap {
namespace aces {

float InvSSTS(float y, renodx::tonemap::aces::ODTConfig config) {
  static const int N_KNOTS_LOW = 4;
  static const int N_KNOTS_HIGH = 4;

  float min_x = config.y_min.x;
  float mid_x = config.y_mid.x;
  float max_x = config.y_max.x;

  float knot_inc_low = (mid_x - min_x) / (N_KNOTS_LOW - 1.f);
  float knot_inc_high = (max_x - mid_x) / (N_KNOTS_HIGH - 1.f);

  float knot_y_low[N_KNOTS_LOW];
  float knot_y_high[N_KNOTS_HIGH];

  [unroll]
  for (int i = 0; i < N_KNOTS_LOW; ++i) {
    knot_y_low[i] = 0.5f * (config.coefs_low[i] + config.coefs_low[i + 1]);
  }

  [unroll]
  for (int i = 0; i < N_KNOTS_HIGH; ++i) {
    knot_y_high[i] = 0.5f * (config.coefs_high[i] + config.coefs_high[i + 1]);
  }

  float log_y = log10(max(y, renodx::math::FLT_MIN));
  float log_x;

  if (log_y >= config.y_max.y) {
    log_x = max_x;
  } else if (log_y > config.y_mid.y) {
    uint j = 0u;
    float3 cf = float3(config.coefs_high[0], config.coefs_high[1], config.coefs_high[2]);

    if (log_y > knot_y_high[1] && log_y <= knot_y_high[2]) {
      cf = float3(config.coefs_high[1], config.coefs_high[2], config.coefs_high[3]);
      j = 1u;
    } else if (log_y > knot_y_high[2]) {
      cf = float3(config.coefs_high[2], config.coefs_high[3], config.coefs_high[4]);
      j = 2u;
    }

    float3 quad = mul(renodx::tonemap::aces::M, cf);
    float a = quad.x;
    float b = quad.y;
    float c = quad.z - log_y;
    float d = sqrt(max(b * b - 4.f * a * c, 0.f));
    float denominator = -d - b;
    if (abs(denominator) < 1e-10f) {
      denominator = denominator >= 0.f ? 1e-10f : -1e-10f;
    }
    float t = (2.f * c) / denominator;

    log_x = mid_x + (t + (float)j) * knot_inc_high;
  } else if (log_y > config.y_min.y) {
    uint j = 0u;
    float3 cf = float3(config.coefs_low[0], config.coefs_low[1], config.coefs_low[2]);

    if (log_y > knot_y_low[1] && log_y <= knot_y_low[2]) {
      cf = float3(config.coefs_low[1], config.coefs_low[2], config.coefs_low[3]);
      j = 1u;
    } else if (log_y > knot_y_low[2]) {
      cf = float3(config.coefs_low[2], config.coefs_low[3], config.coefs_low[4]);
      j = 2u;
    }

    float3 quad = mul(renodx::tonemap::aces::M, cf);
    float a = quad.x;
    float b = quad.y;
    float c = quad.z - log_y;
    float d = sqrt(max(b * b - 4.f * a * c, 0.f));
    float denominator = -d - b;
    if (abs(denominator) < 1e-10f) {
      denominator = denominator >= 0.f ? 1e-10f : -1e-10f;
    }
    float t = (2.f * c) / denominator;

    log_x = min_x + (t + (float)j) * knot_inc_low;
  } else {
    log_x = min_x;
  }

  return pow(10.f, log_x);
}

renodx::tonemap::aces::ODTConfig CreateODTConfig(
    float min_y,
    float max_y,
    float mid_y,
    bool stable_peak_exp_shift = false,
    float exp_shift_max_reference = 1000.f,
    float exp_shift_min_reference = 0.0001f) {
  renodx::tonemap::aces::ODTConfig config = renodx::tonemap::aces::CreateODTConfig(min_y, max_y);

  if (mid_y != 4.8f) {
    renodx::tonemap::aces::ODTConfig exp_shift_config = config;
    const bool use_stable_reference =
        stable_peak_exp_shift && (exp_shift_max_reference != max_y || exp_shift_min_reference != min_y);
    if (use_stable_reference) {
      exp_shift_config = renodx::tonemap::aces::CreateODTConfig(
          exp_shift_min_reference,
          exp_shift_max_reference);
    }

    float exp_shift = log2(InvSSTS(mid_y, exp_shift_config)) - log2(0.18f);
    float shift_log10 = exp_shift * log10(2.f);
    config.y_min.x -= shift_log10;
    config.y_mid.x -= shift_log10;
    config.y_max.x -= shift_log10;
  }

  return config;
}

}  // namespace aces
}  // namespace tonemap
}  // namespace renodx_custom

// Mirrors the OCIO bake pass contract: linear AP1 in, BT.2020 PQ out.
float3 ApplyCustomACESToneMapEncodePQ(
    float3 untonemapped_ap1,
    float peak_nits,
    float diffuse_white_nits,
    float2 uv) {
  untonemapped_ap1 = renodx::tonemap::aces::RRT(
      mul(renodx::color::AP1_TO_AP0_MAT, untonemapped_ap1));

  const float ACES_MID = 15.f;
  const float ACES_DIFFUSE = ACES_MID * 10.f;
  const float ACES_MIN = 0.0001f;
  const float EXP_SHIFT_REFERENCE_MAX = 100.f;
  const float EXP_SHIFT_REFERENCE_MIN = 0.02f;

  float aces_min = ACES_MIN / diffuse_white_nits;
  float aces_max = peak_nits / diffuse_white_nits;
  if (RENODX_GAMMA_CORRECTION == 1.f) {
    aces_max = renodx::color::correct::Gamma(aces_max, true);
    aces_min = renodx::color::correct::Gamma(aces_min, true);
  } else if (RENODX_GAMMA_CORRECTION == 2.f) {
    aces_min /= 10.f;
  }

  // Onimusha grades the AP1 image after the RRT and before the ODT.
  renodx::draw::Config grade_config = renodx::draw::BuildConfig();
  float3 rrt_bt709 = renodx::color::bt709::from::AP1(untonemapped_ap1);
  rrt_bt709 = renodx::tonemap::psycho::ApplyGrading(
      rrt_bt709,
      aces_max,
      0.18f,
      0.18f,
      0,
      grade_config);
  untonemapped_ap1 = renodx::color::ap1::from::BT709(rrt_bt709);

  renodx::tonemap::aces::ODTConfig odt_config = renodx_custom::tonemap::aces::CreateODTConfig(
      aces_min * ACES_DIFFUSE,
      aces_max * ACES_DIFFUSE,
      ACES_MID,
      true,
      EXP_SHIFT_REFERENCE_MAX,
      EXP_SHIFT_REFERENCE_MIN);

  float3 tonemapped_ap1 = renodx::tonemap::aces::ODTToneMap(untonemapped_ap1, odt_config) / ACES_DIFFUSE;
  float3 tonemapped_bt709 = renodx::color::bt709::from::AP1(tonemapped_ap1);
  if (RENODX_GAMMA_CORRECTION == 1.f) {
    tonemapped_bt709 = renodx::color::correct::GammaSafe(tonemapped_bt709);
  }

  float3 tonemapped_bt2020 = renodx::color::bt2020::from::BT709(tonemapped_bt709);
  tonemapped_bt2020 = CustomPostProcessing(tonemapped_bt2020, uv);
  return renodx::color::pq::EncodeSafe(tonemapped_bt2020, diffuse_white_nits);
}

// float3 CustomTonemap(float3 untonemapped_bt709, float3 graded_bt709, float mid_gray, float2 uv) {

//   float calculated_peak = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;

//   if (RENODX_GAMMA_CORRECTION > 0.f) {
//     calculated_peak = RENODX_GAMMA_CORRECTION == 1.f ? renodx::color::correct::GammaSafe(calculated_peak, true) : GammaCorrectionLMS(calculated_peak, true).x;
//   }

//   float3 output_color = untonemapped_bt709;
//   if (RENODX_TONE_MAP_TYPE == 0.f) {
//     // graded_bt709 = PreTonemapSliders(graded_bt709, mid_gray);
//     // graded_bt709 = PostTonemapSliders(graded_bt709);
//     // output_color = renodx::tonemap::neutwo::MaxChannel(graded_bt709, calculated_peak);
//     output_color = renodx::tonemap::psycho::psychotm_customized(
//         graded_bt709,
//         calculated_peak,
//         RENODX_TONE_MAP_EXPOSURE,
//         RENODX_TONE_MAP_HIGHLIGHTS,
//         RENODX_TONE_MAP_SHADOWS,
//         RENODX_TONE_MAP_CONTRAST,
//         RENODX_TONE_MAP_SATURATION,
//         RENODX_TONE_MAP_BLOWOUT,
//         RENODX_TONE_MAP_FLARE,
//         100.f,
//         1.f,
//         1.f,
//         0,
//         0,
//         1.f,
//         0.15f,
//         0.15f,
//         1.f,
//         1,
//         1.f
//     );
//   }
//   else if (RENODX_TONE_MAP_TYPE == 1.f) {  // ACES

//     const float ACES_MIN = 0.0001f;

//     float3 untonemapped_ap0 = mul(renodx::color::BT709_TO_AP0_MAT, untonemapped_bt709);
//     float3 rrt_out = renodx::tonemap::aces::RRT(untonemapped_ap0);
//     float3 tonemapped_bt709_ch = renodx::tonemap::aces::ODT(rrt_out, (ACES_MIN) * 48.f, calculated_peak * 48.f) / 48.f;

//     output_color = tonemapped_bt709_ch;
//   }
//   else if (RENODX_TONE_MAP_TYPE == 2.f) {  // PsychoV
//     output_color = renodx::tonemap::psycho::psychotm_customized(
//         untonemapped_bt709,
//         calculated_peak,
//         RENODX_TONE_MAP_EXPOSURE,
//         RENODX_TONE_MAP_HIGHLIGHTS,
//         RENODX_TONE_MAP_SHADOWS,
//         RENODX_TONE_MAP_CONTRAST,
//         RENODX_TONE_MAP_SATURATION,
//         RENODX_TONE_MAP_BLOWOUT,
//         RENODX_TONE_MAP_FLARE,
//         100.f,
//         1.f,
//         1.f,
//         0,
//         0,
//         1.f,
//         mid_gray,
//         mid_gray,
//         1.f,
//         1,
//         1.f
//     );
//   }

//   output_color = CustomPostProcessing(output_color, uv);

//   if (RENODX_GAMMA_CORRECTION > 0.f) {
//     output_color = RENODX_GAMMA_CORRECTION == 1.f ? renodx::color::correct::GammaSafe(output_color) : GammaCorrectionLMS(output_color);
//   }
//   output_color = renodx::color::bt2020::from::BT709(output_color);
//   return renodx::color::pq::EncodeSafe(output_color, RENODX_DIFFUSE_WHITE_NITS);
// }

void CustomVignette(inout float vignette) {
  vignette = lerp(1.f, vignette, CUSTOM_VIGNETTE);
}

float3 SampleSDRLUT(float3 color, SamplerState TrilinearClamp, Texture3D SrcLUT) {
  //color = renodx::color::pq::EncodeSafe(mul(renodx::color::AP1_TO_AP0_MAT, color), 100.f);  // Mimic first LUT
  color = renodx::color::pq::EncodeSafe(color, 100.f); // encode for lutbuilder input
  float4 _66 = SrcLUT.SampleLevel(TrilinearClamp, float3(((color.x * 0.984375f) + 0.0078125f), ((color.y * 0.984375f) + 0.0078125f), ((color.z * 0.984375f) + 0.0078125f)), 0.0f);
  _66.xyz = renodx::color::pq::DecodeSafe(_66.xyz, 100.f); // decode so it's linear out
  return _66.xyz;
}

float3 UpgradeToneMapMaxChannel(
    float3 color_untonemapped,
    float3 color_tonemapped,
    float3 color_tonemapped_graded,
    float post_process_strength = 1.f,
    float auto_correction = 1.f) {
  float ratio = 1.f;

  float max_untonemapped = renodx::math::Max(color_untonemapped);
  float max_tonemapped = renodx::math::Max(color_tonemapped);
  float max_tonemapped_graded = renodx::math::Max(color_tonemapped_graded);

  if (max_untonemapped < max_tonemapped) {
    // If substracting (user contrast or paperwhite) scale down instead
    // Should only apply on mismatched HDR
    ratio = max_untonemapped / max_tonemapped;
  } else {
    float max_delta = max_untonemapped - max_tonemapped;
    max_delta = max(0, max_delta);  // Cleans up NaN
    const float max_new = max_tonemapped_graded + max_delta;

    const bool max_valid = (max_tonemapped_graded > 0);  // Cleans up NaN and ignore black
    ratio = max_valid ? (max_new / max_tonemapped_graded) : 0;
  }
  float auto_correct_ratio = lerp(1.f, ratio, saturate(max_untonemapped));
  ratio = lerp(ratio, auto_correct_ratio, auto_correction);

  float3 color_scaled = color_tonemapped_graded * ratio;

  return lerp(color_untonemapped, color_scaled, post_process_strength);
}