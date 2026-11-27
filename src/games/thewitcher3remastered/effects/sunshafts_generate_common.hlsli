#ifndef SRC_THEWITCHER3REMASTERED_SUNSHAFTS_GENERATE_COMMON_HLSLI_
#define SRC_THEWITCHER3REMASTERED_SUNSHAFTS_GENERATE_COMMON_HLSLI_

#include "../shared.h"

Texture2D<float4> t0 : register(t0);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c000.x);
  float4 CustomPixelConsts_016 : packoffset(c001.x);
  float4 CustomPixelConsts_032 : packoffset(c002.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
  float4 CustomPixelConsts_064 : packoffset(c004.x);
  float4 CustomPixelConsts_080 : packoffset(c005.x);
  float4 CustomPixelConsts_096 : packoffset(c006.x);
  float4 CustomPixelConsts_112 : packoffset(c007.x);
  float4 CustomPixelConsts_128 : packoffset(c008.x);
  float4 CustomPixelConsts_144 : packoffset(c009.x);
  float4 CustomPixelConsts_160 : packoffset(c010.x);
  float4 CustomPixelConsts_176 : packoffset(c011.x);
  float4 CustomPixelConsts_192 : packoffset(c012.x);
  float4 CustomPixelConsts_208 : packoffset(c013.x);
  float4 CustomPixelConsts_224 : packoffset(c014.x);
  float4 CustomPixelConsts_240 : packoffset(c015.x);
  float4 CustomPixelConsts_256 : packoffset(c016.x);
  float4 CustomPixelConsts_272 : packoffset(c017.x);
  float4 CustomPixelConsts_288 : packoffset(c018.x);
  float4 CustomPixelConsts_304 : packoffset(c019.x);
  float4 CustomPixelConsts_320 : packoffset(c020.x);
  row_major float4x4 CustomPixelConsts_336 : packoffset(c021.x);
};

SamplerState s0 : register(s0);

float4 GenerateSunshafts(float4 SV_Position, int sample_count) {
  const float inv_samples = 1.f / float(sample_count);
  // Match the original DXIL; the 28-tap step rounds differently from 1 / (28 * 28).
  const float inv_samples_sq = (sample_count == 28) ? 0.0012755102943629026f : 1.f / float(sample_count * sample_count);

  float _22 = float((int)(int(CustomPixelConsts_048.x)));
  float _23 = float((int)(int(CustomPixelConsts_048.y)));
  float _24 = _22 + 0.5f;
  float _25 = _23 + 0.5f;
  float _35 = (_22 - 0.5f) + CustomPixelConsts_032.x;
  float _37 = (_23 - 0.5f) + CustomPixelConsts_032.y;
  float _38 = float((int)(int(SV_Position.x - float((int)(int(CustomPixelConsts_048.z))))));
  float _39 = float((int)(int(SV_Position.y - float((int)(int(CustomPixelConsts_048.w))))));
  float _40 = _24 + _38;
  float _41 = _25 + _39;
  float _42 = _40 / CustomPixelConsts_000.x;
  float _43 = _41 / CustomPixelConsts_000.y;
  float _50 = (_37 - _25) / CustomPixelConsts_000.y;
  float _53 = (CustomPixelConsts_064.x * ((_35 - _24) / CustomPixelConsts_000.x)) + (_24 / CustomPixelConsts_000.x);
  float _54 = (CustomPixelConsts_064.y * _50) + (_25 / CustomPixelConsts_000.y);
  float _55 = _53 - _42;
  float _56 = _54 - _43;
  float _64 = rsqrt(dot(float2(_55, _56), float2(_55, _56)));
  float shaft_radius = CustomPixelConsts_080.x * _50;
  float _66 = shaft_radius * _64;
  float _70 = _64 * _56;
  float _71 = CustomPixelConsts_000.x / CustomPixelConsts_000.y;
  float _72 = (_64 * _55) * _71;
  float _76 = sqrt((_72 * _72) + (_70 * _70));
  float _77 = (_66 * _55) / _76;
  float _78 = (_66 * _56) / _76;
  float _79 = _77 * inv_samples;
  float _80 = _78 * inv_samples;
  bool _87 = int(CustomPixelConsts_064.z) == 0;
  float _96;
  float _97;
  float _98;
  if (!_87) {
    float _89 = _77 * inv_samples_sq;
    float _90 = _78 * inv_samples_sq;
    _96 = _89;
    _97 = _90;
    _98 = sqrt((_90 * _90) + (_89 * _89));
  } else {
    _96 = _79;
    _97 = _80;
    _98 = sqrt((_80 * _80) + (_79 * _79));
  }
  int _119 = min(
      min(
          int((sqrt((_55 * _55) + (_56 * _56)) / _98) + 1.f),
          int((select(_96 > 0.f, _35 - _40, _38)
                   / (CustomPixelConsts_000.x * abs(_96)))
              + 1.f)),
      int((select(_97 > 0.f, _37 - _41, _39)
               / (CustomPixelConsts_000.y * abs(_97)))
          + 1.f));
  float _121 = _43 - _54;
  float _122 = _71 * (_42 - _53);
  float _128 = saturate(sqrt((_122 * _122) + (_121 * _121)) / shaft_radius);

  float3 result = 0.f;
  [branch]
  if (_128 < 1.f) {
    float3 accum = 0.f;
    [branch]
    if (!_87) {
      [unroll]
      for (int i = 0; i < sample_count; ++i) {
        float w = _119 > i ? 1.f : 0.f;
        float2 uv = float2(_42 + _96 * float(i), _43 + _97 * float(i));
        accum += t0.SampleLevel(s0, uv, 0.f).rgb * w;
      }
      accum *= CustomPixelConsts_096.rgb;
    } else {
      [unroll]
      for (int i = 0; i < sample_count; ++i) {
        float w = _119 > i ? 1.f : 0.f;
        float2 uv = float2(_42 + _96 * float(i), _43 + _97 * float(i));
        float3 s = t0.SampleLevel(s0, uv, 0.f).rgb;
        float luma = dot(s, float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
        float excess = max(0.f, luma - CustomPixelConsts_112.x);
        float scale = (saturate(CustomPixelConsts_112.y * excess) * excess) / max(0.0001f, luma) * w;
        accum += s * scale;
      }
    }

    float3 scaled = accum * inv_samples;
    if (!_87) {
      float falloff;
      if (CustomPixelConsts_128.x > 0.f) {
        float _854 = max(0.01f, CustomPixelConsts_128.y) * -1.4426950216293335f;
        float _855 = exp2(_854);
        falloff = ((exp2(exp2(log2(max(saturate(_128), 1.0e-6f)) * max(0.01f, CustomPixelConsts_128.z)) * _854) - _855) / (1.f - _855));
      } else {
        float _868 = saturate((_128 - CustomPixelConsts_016.z) / max(0.0001f, 1.f - CustomPixelConsts_016.z));
        float _876 = ((((_868 * _868) * (3.f - (_868 * 2.f))) - _868) * CustomPixelConsts_016.w) + _868;
        falloff = (exp2(log2(1.f - _876) * CustomPixelConsts_080.y) / (((_876 * _876) * CustomPixelConsts_080.z) + 1.f));
      }
      result = scaled * falloff;
    } else {
      result = scaled;
    }
  }

  return float4(result * CUSTOM_SUNSHAFTS_STRENGTH, 1.f);
}

#endif  // SRC_THEWITCHER3REMASTERED_SUNSHAFTS_GENERATE_COMMON_HLSLI_
