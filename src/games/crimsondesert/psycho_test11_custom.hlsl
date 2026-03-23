#include "./psycho_test11.hlsl"

float3 psycho_grading_only(float3 bt709_linear_input,
                           float exposure = 1.f,
                           float highlights = 1.f,
                           float shadows = 1.f,
                           float contrast = 1.f,
                           float purity_scale = 1.f,
                           float adaptation_contrast = 1.f,
                           float cone_response_exponent = 1.f) {
  const float kEps = 1e-6f;
  const float kHalfBleachTrolands = 20000.f;
  const int kWhiteCurveNeutwo = 0;
  const int kWhiteCurveNakaRushton = 1;
  const float3 lms_midgray_raw = psycho11_LMSFromBT2020(0.18f.xxx);
  const float lum_midgray = psycho11_StockmanLuminanceFromLMS(lms_midgray_raw);

  float3 bt2020 = psycho11_BT2020FromBT709(bt709_linear_input * exposure);
  float3 lms_color_raw = psycho11_LMSFromBT2020(bt2020);
  lms_color_raw = psycho11_GamutCompressAddWhiteBT2020Bounded(lms_color_raw);

  float lum_current = psycho11_StockmanLuminanceFromLMS(lms_color_raw);
  float lum_target = lum_current;

  if (highlights != 1.f) {
    lum_target = psycho11_Highlights(lum_target, highlights, lum_midgray);
  }
  if (shadows != 1.f) {
    lum_target = psycho11_Shadows(lum_target, shadows, lum_midgray);
  }
  if (contrast != 1.f) {
    lum_target = psycho11_ContrastSafe(lum_target, contrast, lum_midgray);
  }

  float lum_scale = psycho11_DivideSafe(lum_target, lum_current, 1.f);
  //clip_point *= lum_scale;

  float3 lms_scene_unit = lms_color_raw * lum_scale;
  float3 lms_midgray_unit = lms_midgray_raw;

  if (purity_scale != 1.f) {
    lms_scene_unit = psycho11_ScalePurityMB2(lms_scene_unit, purity_scale, kEps);
  }

  float3 lms_scene_unit_source = lms_scene_unit;
  if (adaptation_contrast != 1.f) {
    float3 lms_sigma_unit = max(lms_midgray_unit, kEps.xxx);
    float exponent = max(adaptation_contrast, kEps);

    float3 ax = abs(lms_scene_unit);
    float3 ax_n = pow(ax, exponent);
    float3 s_n = pow(lms_sigma_unit, exponent);
    float3 response_target = ax_n / max(ax_n + s_n, kEps.xxx);
    float3 response_baseline = ax / max(ax + lms_sigma_unit, kEps.xxx);
    float3 gain = response_target / max(response_baseline, kEps.xxx);
    float3 sign_raw = float3(
        lms_scene_unit.x < 0.f ? -1.f : 1.f,
        lms_scene_unit.y < 0.f ? -1.f : 1.f,
        lms_scene_unit.z < 0.f ? -1.f : 1.f);
    lms_scene_unit = sign_raw * (ax * gain);
  }
  return psycho11_BT709FromBT2020(psycho11_BT2020FromLMS(lms_scene_unit));
}