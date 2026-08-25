#include "./uncharted2extended.hlsli"
#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

float Uncharted2Tonemap1(float color) {
  float _42;
  float _43;
  float _44;
  float _45;
  float _52;
  float _62;
  float _69;
  float _79;
  float _88;

  _42 = color * CustomPixelConsts_112.x;
  _45 = CustomPixelConsts_112.z * CustomPixelConsts_112.y;
  _52 = CustomPixelConsts_128.x * CustomPixelConsts_128.y;
  _62 = CustomPixelConsts_128.x * CustomPixelConsts_128.z;
  _69 = CustomPixelConsts_128.y / CustomPixelConsts_128.z;
  _79 = CustomPixelConsts_112.x * 11.199999809265137f;
  _88 = max(0.0f, (((((_79 + _45) * 11.199999809265137f) + _52) / (((_79 + CustomPixelConsts_112.y) * 11.199999809265137f) + _62)) - _69));
  return ((max(0.0f, (((((_42 + _45) * color) + _52) / (((_42 + CustomPixelConsts_112.y) * color) + _62)) - _69)) * CustomPixelConsts_256.y) / _88);
}

float Uncharted2Tonemap2(float color) {
  float _120, _123, _130, _140, _147, _157, _166;

  _120 = color * CustomPixelConsts_176.x;
  _123 = CustomPixelConsts_176.z * CustomPixelConsts_176.y;
  _130 = CustomPixelConsts_192.x * CustomPixelConsts_192.y;
  _140 = CustomPixelConsts_192.x * CustomPixelConsts_192.z;
  _147 = CustomPixelConsts_192.y / CustomPixelConsts_192.z;
  _157 = CustomPixelConsts_176.x * 11.199999809265137f;
  _166 = max(0.0f, (((((_157 + _123) * 11.199999809265137f) + _130) / (((_157 + CustomPixelConsts_176.y) * 11.199999809265137f) + _140)) - _147));
  return (max(0.0f, (((((_120 + _123) * color) + _130) / (((_120 + CustomPixelConsts_176.y) * color) + _140)) - _147)) * CustomPixelConsts_272.y) / _166;
}

float3 Uncharted2Tonemap1(float3 color) {
  float3 outputColor;
  outputColor.x = Uncharted2Tonemap1(color.x);
  outputColor.y = Uncharted2Tonemap1(color.y);
  outputColor.z = Uncharted2Tonemap1(color.z);
  return outputColor;
}

float3 Uncharted2Tonemap2(float3 color) {
  float3 outputColor;
  outputColor.x = Uncharted2Tonemap2(color.x);
  outputColor.y = Uncharted2Tonemap2(color.y);
  outputColor.z = Uncharted2Tonemap2(color.z);
  return outputColor;
}

struct Uncharted2PsychoV25Match {
  float anchor_in;
  float anchor_out;
  float cone_response;
};

struct Uncharted2ToneMapAnchor {
  float input;
  float output;
};

Uncharted2ToneMapAnchor BuildUncharted2ToneMapAnchor(
    float A, float B, float C, float D, float E, float F,
    float white_precompute) {
  Uncharted2ToneMapAnchor anchor;
  anchor.input = max(Uncharted2::FindSecondDerivativeRoot(A, B, C, D, E, F), 1e-6f);
  anchor.output = max(
      renodx::tonemap::ApplyCurve(anchor.input, A, B, C, D, E, F) * white_precompute,
      1e-6f);
  return anchor;
}

Uncharted2ToneMapAnchor BuildUncharted2ToneMapAnchor1() {
  float A = CustomPixelConsts_112.x, B = CustomPixelConsts_112.y, C = CustomPixelConsts_112.z;
  float D = CustomPixelConsts_128.x, E = CustomPixelConsts_128.y, F = CustomPixelConsts_128.z;
  const float W = 11.199999809265137f;
  float white_precompute = CustomPixelConsts_256.y / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  return BuildUncharted2ToneMapAnchor(A, B, C, D, E, F, white_precompute);
}

Uncharted2ToneMapAnchor BuildUncharted2ToneMapAnchor2() {
  float A = CustomPixelConsts_176.x, B = CustomPixelConsts_176.y, C = CustomPixelConsts_176.z;
  float D = CustomPixelConsts_192.x, E = CustomPixelConsts_192.y, F = CustomPixelConsts_192.z;
  const float W = 11.199999809265137f;
  float white_precompute = CustomPixelConsts_272.y / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  return BuildUncharted2ToneMapAnchor(A, B, C, D, E, F, white_precompute);
}

Uncharted2PsychoV25Match BuildUncharted2PsychoV25Match(
    Uncharted2ToneMapAnchor anchor,
    float A, float B, float C, float D, float E, float F,
    float white_precompute) {
  Uncharted2PsychoV25Match match;
  match.anchor_in = anchor.input;
  match.anchor_out = anchor.output;
  float slope = Uncharted2::Derivative(anchor.input, A, B, C, D, E, F) * white_precompute;
  match.cone_response = max(anchor.input * slope / anchor.output, 1e-6f);
  return match;
}

Uncharted2PsychoV25Match BuildUncharted2PsychoV25Match1() {
  float A = CustomPixelConsts_112.x, B = CustomPixelConsts_112.y, C = CustomPixelConsts_112.z;
  float D = CustomPixelConsts_128.x, E = CustomPixelConsts_128.y, F = CustomPixelConsts_128.z;
  const float W = 11.199999809265137f;
  float white_precompute = CustomPixelConsts_256.y / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  return BuildUncharted2PsychoV25Match(
      BuildUncharted2ToneMapAnchor(A, B, C, D, E, F, white_precompute),
      A, B, C, D, E, F,
      white_precompute);
}

Uncharted2PsychoV25Match BuildUncharted2PsychoV25Match2() {
  float A = CustomPixelConsts_176.x, B = CustomPixelConsts_176.y, C = CustomPixelConsts_176.z;
  float D = CustomPixelConsts_192.x, E = CustomPixelConsts_192.y, F = CustomPixelConsts_192.z;
  const float W = 11.199999809265137f;
  float white_precompute = CustomPixelConsts_272.y / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  return BuildUncharted2PsychoV25Match(
      BuildUncharted2ToneMapAnchor(A, B, C, D, E, F, white_precompute),
      A, B, C, D, E, F,
      white_precompute);
}

Uncharted2::Config::Uncharted2ExtendedConfig BuildUncharted2ExtendedConfig(
    float A, float B, float C, float D, float E, float F,
    float output_scale) {
  const float W = 11.199999809265137f;
  float coeffs[6] = {A, B, C, D, E, F};
  float white_precompute = output_scale / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  return Uncharted2::Config::CreateUncharted2ExtendedConfig(coeffs, white_precompute);
}

float3 Uncharted2Extended1(float3 untonemapped) {
  Uncharted2::Config::Uncharted2ExtendedConfig uc2_config = BuildUncharted2ExtendedConfig(
      CustomPixelConsts_112.x,
      CustomPixelConsts_112.y,
      CustomPixelConsts_112.z,
      CustomPixelConsts_128.x,
      CustomPixelConsts_128.y,
      CustomPixelConsts_128.z,
      CustomPixelConsts_256.y);

  return Uncharted2::ApplyExtended(untonemapped, uc2_config);
}

float3 Uncharted2Extended2(float3 untonemapped) {
  Uncharted2::Config::Uncharted2ExtendedConfig uc2_config = BuildUncharted2ExtendedConfig(
      CustomPixelConsts_176.x,
      CustomPixelConsts_176.y,
      CustomPixelConsts_176.z,
      CustomPixelConsts_192.x,
      CustomPixelConsts_192.y,
      CustomPixelConsts_192.z,
      CustomPixelConsts_272.y);

  return Uncharted2::ApplyExtended(untonemapped, uc2_config);
}

float3 ApplyPsychoV25ToneMap(
    float3 untonemapped,
    Uncharted2PsychoV25Match psychov25_match) {
  return ApplyCustomPsychoV25ToneMap(
      untonemapped * RENODX_TONE_MAP_EXPOSURE,
      100.f,
      RENODX_TONE_MAP_HIGHLIGHTS,
      RENODX_TONE_MAP_SHADOWS,
      psychov25_match.cone_response * RENODX_TONE_MAP_CONTRAST,
      RENODX_TONE_MAP_FLARE,
      RENODX_TONE_MAP_SATURATION,
      RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
      RENODX_TONE_MAP_BLOWOUT,
      1.f,
      psychov25_match.anchor_in.xxx,
      psychov25_match.anchor_out.xxx,
      0,
      0.f,
      1.5f,
      PSYCHO_HUE_VALUES,
      PSYCHO_HUE_METHOD,
      false);
}