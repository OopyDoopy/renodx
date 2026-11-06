#include "./shared.h"

float3 ApplyPostProcessing(float3 color, float2 uv) {
  return renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
}

float3 EncodeDisplay(float3 color) {
  if (RENODX_TONE_MAP_TYPE == 0.f || RENODX_SDR_ENCODING == 0.f) {
    return renodx::color::srgb::EncodeSafe(color);
  }
  if (RENODX_SDR_ENCODING == 1.f) {
    return renodx::color::gamma::EncodeSafe(color, 2.2f);
  }
  return renodx::color::gamma::EncodeSafe(color, 2.4f);
}

float3x3 InvertMatrix(float3x3 matrix) {
  const float determinant = dot(matrix[0], cross(matrix[1], matrix[2]));
  const float determinant_rcp = rcp(
      abs(determinant) > renodx::math::FLT_MIN ? determinant : 1.f);

  return transpose(float3x3(
      cross(matrix[1], matrix[2]) * determinant_rcp,
      cross(matrix[2], matrix[0]) * determinant_rcp,
      cross(matrix[0], matrix[1]) * determinant_rcp));
}

float3 HDREncodePQ(float3 linear_bt709) {
  float3 linear_bt2020 = renodx::color::bt2020::from::BT709(linear_bt709);
  //linear_bt2020 = min((RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS), linear_bt2020);
  float3 pq_bt2020 = renodx::color::pq::EncodeSafe(linear_bt2020, RENODX_DIFFUSE_WHITE_NITS);
  return pq_bt2020;
}

float3 HDREncodeSRGB(float3 linear_bt709) {
  linear_bt709 *= RENODX_DIFFUSE_WHITE_NITS;
  linear_bt709 = min(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, linear_bt709);
  float3 srgb_bt709 = renodx::color::srgb::EncodeSafe(linear_bt709);
  return srgb_bt709;
}