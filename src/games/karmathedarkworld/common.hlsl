#include "./shared.h"

float4 FinalizeUEOutput(float4 scene, float4 ui) {
  scene.rgb = renodx::color::pq::Decode(scene.rgb, 100.f);
  if (RENODX_TONE_MAP_TYPE) {
    scene.rgb = renodx::draw::ToneMapPass(scene.rgb);
  } else {
    scene.rgb = saturate(scene.rgb);
  }

  ui.rgb = renodx::color::srgb::Decode(ui.rgb);
  ui.rgb = ui.rgb * RENODX_GRAPHICS_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;

  float3 final = lerp(scene.rgb, ui.rgb, ui.a);
  final.rgb = renodx::color::correct::GammaSafe(final.rgb);
  final.rgb = renodx::color::bt2020::from::BT709(final.rgb);
  final.rgb = renodx::color::pq::EncodeSafe(final.rgb, RENODX_DIFFUSE_WHITE_NITS);

  return float4(final.rgb, ui.a);
}

// clang-format off
// clang-format off
static struct UELutBuilderConfig {
  float3 ungraded_ap1;
  float3 untonemapped_ap1;
  float3 untonemapped_bt709;
  float3 tonemapped_bt709;
  float3 graded_bt709;
} RENODX_UE_CONFIG;
// clang-format on

// First instance of 0.272228718, 0.674081743, 0.0536895171
void SetUngradedAP1(float3 color) {
  RENODX_UE_CONFIG.ungraded_ap1 = color;
}

void SetUntonemappedAP1(float3 color) {
  RENODX_UE_CONFIG.untonemapped_ap1 = color;
  RENODX_UE_CONFIG.untonemapped_bt709 = renodx::color::bt709::from::AP1(RENODX_UE_CONFIG.untonemapped_ap1);
  RENODX_UE_CONFIG.tonemapped_bt709 = abs(RENODX_UE_CONFIG.untonemapped_bt709);
}

void SetTonemappedBT709(inout float color_red, inout float color_green, inout float color_blue) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return;
  float3 color = float3(color_red, color_green, color_blue);
  RENODX_UE_CONFIG.tonemapped_bt709 = color;

  if (CUSTOM_COLOR_GRADE_BLOWOUT_RESTORATION != 0.f
      || CUSTOM_COLOR_GRADE_HUE_CORRECTION != 0.f
      || CUSTOM_COLOR_GRADE_SATURATION_CORRECTION != 0.f
      || CUSTOM_COLOR_GRADE_HUE_SHIFT != 0.f) {
    color = renodx::draw::ApplyPerChannelCorrection(
        RENODX_UE_CONFIG.untonemapped_bt709,
        float3(color_red, color_green, color_blue),
        CUSTOM_COLOR_GRADE_BLOWOUT_RESTORATION,
        CUSTOM_COLOR_GRADE_HUE_CORRECTION,
        CUSTOM_COLOR_GRADE_SATURATION_CORRECTION,
        CUSTOM_COLOR_GRADE_HUE_SHIFT);
  }

  color = abs(color);
  color_red = color.r;
  color_green = color.g;
  color_blue = color.b;
}

void SetTonemappedBT709(inout float3 color) {
  SetTonemappedBT709(color.r, color.g, color.b);
}

// Used by LUTs
void SetTonemappedAP1(inout float color_red, inout float color_green, inout float color_blue) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return;
  float3 color = float3(color_red, color_green, color_blue);
  float3 bt709_color = renodx::color::bt709::from::AP1(color);
  SetTonemappedBT709(bt709_color);

  color = renodx::color::ap1::from::BT709(bt709_color);
  color_red = color.r;
  color_green = color.g;
  color_blue = color.b;
}

void SetTonemappedAP1(inout float3 color) {
  SetTonemappedAP1(color.r, color.g, color.b);
}

void SetGradedBT709(inout float3 color) {
  RENODX_UE_CONFIG.graded_bt709 = color;
  RENODX_UE_CONFIG.graded_bt709 *= sign(RENODX_UE_CONFIG.tonemapped_bt709);
}

float3 GenerateToneMap() {
  return renodx::draw::ToneMapPass(RENODX_UE_CONFIG.untonemapped_bt709, RENODX_UE_CONFIG.graded_bt709);
}

float3 GenerateToneMap(float3 graded_bt709) {
  SetGradedBT709(graded_bt709);
  return GenerateToneMap();
}

float4 GenerateOutput() {
  float3 color;
  // color = renodx::draw::ToneMapPass(RENODX_UE_CONFIG.untonemapped_bt709, RENODX_UE_CONFIG.graded_bt709);
  // color = renodx::draw::RenderIntermediatePass(color);
  color = renodx::tonemap::UpgradeToneMap(RENODX_UE_CONFIG.untonemapped_bt709, renodx::tonemap::renodrt::NeutralSDR(RENODX_UE_CONFIG.untonemapped_bt709), RENODX_UE_CONFIG.graded_bt709, 1.f, 1.f);
  color = renodx::color::pq::EncodeSafe(color, 100.f);

  color *= 1.f / 1.05f;
  return float4(color, 1.f);
}

float4 GenerateOutput(float3 graded_bt709) {
  SetGradedBT709(graded_bt709);
  return GenerateOutput();
}

