#include "./shared.h"

float3 CustomPostProcessing(float3 color, float2 uv) {
  //color = ApplyRCAS(color, uv, t1, s1);
  color = renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return color;
}

float3 GammaCorrectionByLuminosity(float3 color, bool pow_to_srgb = false, float gamma = 2.2f) {
  float lumin_in = renodx::color::yf::from::BT709(color);
  float lumin_out = renodx::color::correct::GammaSafe(lumin_in, pow_to_srgb, gamma);
  float3 color_out = renodx::color::correct::Luminance(color, lumin_in, lumin_out);
  return color_out;
}
