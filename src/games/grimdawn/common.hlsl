#include "./shared.h"

// renodx::draw::Config BuildConfig() {
//   renodx::draw::Config config = renodx::draw::BuildConfig();
//     config.nits_peak = 100.f;
//     config.mid_gray_value = 0.18f;
//     config.mid_gray_nits = 18.f;
//     config.exposure = 1.f;
//     config.highlights = 1.f;
//     config.shadows = 1.f;
//     config.contrast = 1.5f;
//     config.saturation = 1.f;
//     config.dechroma = 0.f;
//     config.flare = 0.f;
//     config.per_channel = true;
//     config.tone_map_method = 1u;
//     config.white_clip = 4.f;
//     config.hue_correction_strength = 0.f;
//     config.working_color_space = 0u;
//     config.clamp_color_space = 0u;
//     return config;
// }

// float3 applyUserToneMap(float3 ungraded, float3 graded, ) {
//   if (shader_injection.tone_map_hue_shift != 0) {

//     renodx::tonemap::renodrt::Config renodrt_config = renodx::tonemap::renodrt::config::Create();
//     renodrt_config.nits_peak = 100.f;
//     renodrt_config.mid_gray_value = 0.18f;
//     renodrt_config.mid_gray_nits = 18.f;
//     renodrt_config.exposure = 1.f;
//     renodrt_config.highlights = 1.f;
//     renodrt_config.shadows = 1.f;
//     renodrt_config.contrast = 1.5f;
//     renodrt_config.saturation = 1.f;
//     renodrt_config.dechroma = 0.f;
//     renodrt_config.flare = 0.f;
//     renodrt_config.per_channel = true;
//     renodrt_config.tone_map_method = 1u;
//     renodrt_config.white_clip = 4.f;
//     renodrt_config.hue_correction_strength = 0.f;
//     renodrt_config.working_color_space = 0u;
//     renodrt_config.clamp_color_space = 0u;

//     tone_map_config.hue_correction_color = lerp(
//         ungraded,
//         renodx::tonemap::renodrt::BT709(graded, renodrt_config),
//         shader_injection.tone_map_hue_shift);
//   }
//   return tonemapped;
// }