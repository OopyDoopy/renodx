#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

struct LUTSamplingCoordinates {
  float2 coords1;
  float2 coords2;
  float lerp_t;
};

// The game stores its 64^3 LUT as an 8x8 grid of blue slices.
LUTSamplingCoordinates VanillaSamplingCoords(float3 color) {
  float _35 = color.z;
  float _37 = _35 * 63.75f;
  float _38 = floor(_37);
  float _41 = _37 - _38;

  float _45 = min(0.9999899864196777f, saturate((_35 * 0.99609375f) + 0.015625f));
  float _52 = min(max(((saturate(color.x) + 0.0078125f) * 0.99609375f), 0.015625f), 0.984375f);
  float _53 = min(max(((saturate(color.y) + 0.0078125f) * 0.99609375f), 0.015625f), 0.984375f);

  float _56 = floor(_45 * 8.0f);
  float _61 = (floor((_45 * 64.0f) - (_56 * 8.0f)) + _52) * 0.125f;
  float _63 = (_56 + _53) * 0.125f;
  float _69 = min(0.9999899864196777f, saturate(_38 * 0.015625f));
  float _72 = floor(_69 * 8.0f);
  float _77 = (floor((_69 * 64.0f) - (_72 * 8.0f)) + _52) * 0.125f;
  float _79 = (_72 + _53) * 0.125f;
  LUTSamplingCoordinates value;
  value.lerp_t = _41;
  value.coords1 = float2(_61, _63);
  value.coords2 = float2(_77, _79);
  return value;
}

float3 VanillaSampling(LUTSamplingCoordinates values, Texture2D<float4> lut, SamplerState sampler) {
  float4 _64 = lut.SampleLevel(sampler, values.coords1, 0.0f);
  float4 _80 = lut.SampleLevel(sampler, values.coords2, 0.0f);
  return lerp(_80.xyz, _64.xyz, values.lerp_t);
}

float3 VanillaOutput1(float3 lut_sampled_sdr, float3 ungraded_sdr) {
  return (((CustomPixelConsts_016.z * lut_sampled_sdr.xyz) - ungraded_sdr.xyz) * CustomPixelConsts_016.y) + ungraded_sdr.xyz;
}

float3 VanillaOutput2(float3 lut_sampled_sdr1, float3 lut_sampled_sdr2, float3 ungraded_sdr) {
  return ((CustomPixelConsts_016.z * ((lut_sampled_sdr2.xyz - lut_sampled_sdr1.xyz) * CustomPixelConsts_016.x + lut_sampled_sdr1.xyz) - ungraded_sdr.xyz) * CustomPixelConsts_016.y) + ungraded_sdr.xyz;
}

float3 VanillaOutput3(float3 lut_sampled_sdr1, float3 lut_sampled_sdr2, float3 ungraded_sdr) {
  lut_sampled_sdr1 = ((CustomPixelConsts_016.z * lut_sampled_sdr1) - ungraded_sdr) * CustomPixelConsts_016.y;
  return ((lut_sampled_sdr1.xyz + ungraded_sdr.xyz) + ((((CustomPixelConsts_032.z * lut_sampled_sdr2.xyz) - ungraded_sdr.xyz) * CustomPixelConsts_032.y) - lut_sampled_sdr1.xyz) * CustomPixelConsts_032.w);
}

float3 UnclampLUTGamma(
    float3 lut_output_gamma,
    float3 lut_black_gamma,
    float3 lut_mid_gamma,
    float3 neutral_gamma) {
  float black_floor = min(lut_black_gamma.r, min(lut_black_gamma.g, lut_black_gamma.b));
  float mid_y = max(0.f, renodx::color::yf::from::BT709(lut_mid_gamma));
  float neutral_y = max(0.f, renodx::color::yf::from::BT709(neutral_gamma));
  float floor_scale = mid_y > 0.f ? saturate((mid_y - neutral_y) / mid_y) : 0.f;
  float floor_remove = black_floor * floor_scale;
  return max(0.f, lut_output_gamma - floor_remove);
}

// Linear in, linear out. Caller owns HDR gamut/tonemap scaling around this.
float3 LUTSampling(float3 color, float3 color_coord, Texture2D<float4> lut, SamplerState sampler) {
  float3 gamma_color = renodx::color::gamma::EncodeSafe(color);
  float3 gamma_color_coord = renodx::color::gamma::Encode(max(color_coord, 0.f));
  LUTSamplingCoordinates values = VanillaSamplingCoords(gamma_color_coord);
  float3 output_color = VanillaSampling(values, lut, sampler);

  if (CUSTOM_LUT_SCALING != 0.f) {
    float lutBlackGamma = 0.f;
    LUTSamplingCoordinates lutBlackCoords = VanillaSamplingCoords(lutBlackGamma.xxx);
    float3 lutBlack = saturate(VanillaSampling(lutBlackCoords, lut, sampler));

    if ((lutBlack.x != lutBlackGamma) && (lutBlack.y != lutBlackGamma) && (lutBlack.z != lutBlackGamma)) {
      LUTSamplingCoordinates lutMidCoords = VanillaSamplingCoords(lutBlack);
      float3 lutMid = saturate(VanillaSampling(lutMidCoords, lut, sampler));

      float3 unclamped_gamma = UnclampLUTGamma(
          output_color,
          lutBlack,
          lutMid,
          gamma_color);
      output_color = lerp(
          output_color,
          unclamped_gamma,
          saturate(CUSTOM_LUT_SCALING));
    }
    output_color = renodx::color::gamma::DecodeSafe(output_color);
  } else {
    output_color = renodx::color::gamma::DecodeSafe(output_color);
  }

  return output_color;
}
