#include "./shared.h"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

SamplerState s6 : register(s6);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float3 TEXCOORD : TEXCOORD,
  linear float TEXCOORD_2 : TEXCOORD2,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _33;
  float _34;
  float _35;
  float _17;
  float4 _18;
  float _20;
  float _22;
  float _45;
  float _46;
  float _47;
  float _48;
  float _49;
  float _53;
  float _54;
  float _55;
  float _77;
  float _78;
  float _79;
  float _101;
  float _102;
  float _103;
  if ((bool)(TEXCOORD.y <= 1.0f) && ((bool)((bool)(TEXCOORD.x <= 1.0f) && ((bool)((bool)(TEXCOORD.x >= 0.0f) && (bool)(TEXCOORD.y >= 0.0f)))))) {
    _17 = (((float4)(t0.Sample(s6, float2(TEXCOORD.x, TEXCOORD.y)))).x) + -0.0625f;
    _18 = t1.Sample(s6, float2(TEXCOORD.x, TEXCOORD.y));
    if (CUSTOM_VIDEO == 0 && RENODX_TONE_MAP_TYPE != 0) {
      _20 = _18.x + -0.5f;
      _22 = _18.y + -0.5f;
      _33 = min(1.0f, max(0.0f, dot(float3(1.164383053779602f, 0.0f, 1.5960270166397095f), float3(_17, _20, _22))));
      _34 = min(1.0f, max(0.0f, dot(float3(1.164383053779602f, -0.39176198840141296f, -0.8129680156707764f), float3(_17, _20, _22))));
      _35 = min(1.0f, max(0.0f, dot(float3(1.164383053779602f, 2.0172319412231445f, 0.0f), float3(_17, _20, _22))));
    } else {
      float3 video_color = saturate(renodx::color::bt709::from::YCbCrLimited(float3(_17, _18.x, _18.y)));
      _33 = video_color.r;
      _34 = video_color.g;
      _35 = video_color.b;
    }
  } else {
    _33 = 0.0f;
    _34 = 0.0f;
    _35 = 0.0f;
  }
  if (CUSTOM_VIDEO != 0 && RENODX_TONE_MAP_TYPE != 0) {
    float3 video_color = float3(_33, _34, _35);
    float3 linear_video_color = renodx::color::srgb::DecodeSafe(video_color);
    if (CUSTOM_VIDEO > 1) {
      renodx::draw::Config config = renodx::draw::BuildConfig();
      config.gamma_correction = 1.f;  // Handled manually
      if (CUSTOM_VIDEO == 2) config.peak_white_nits = min(config.diffuse_white_nits * 2, config.peak_white_nits);
      config.peak_white_nits = renodx::color::correct::Gamma(config.peak_white_nits, true);
      float3 gamma_video_color = renodx::color::gamma::EncodeSafe(linear_video_color, 2.4f);
      float3 itm_gamma_video_color = renodx::draw::UpscaleVideoPass(gamma_video_color, config);
      linear_video_color = renodx::color::gamma::DecodeSafe(itm_gamma_video_color, 2.4f);
    }
    linear_video_color = renodx::color::correct::GammaSafe(linear_video_color);
    float3 pq_color = renodx::color::pq::Encode(renodx::color::bt2020::from::BT709(linear_video_color), RENODX_DIFFUSE_WHITE_NITS);
    SV_Target = float4(pq_color, 1.0f);
    return SV_Target;
  }
  _45 = frac(sin(dot(float2((TEXCOORD.x + TEXCOORD_2), (TEXCOORD.y + TEXCOORD_2)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f;
  _46 = dot(float3(_45, _45, _45), float3(0.003332519670948386f, 0.003332519670948386f, 0.003332519670948386f));
  _47 = _46 + sqrt(_33);
  _48 = _46 + sqrt(_34);
  _49 = _46 + sqrt(_35);
  _53 = max(6.103519990574569e-05f, (_47 * _47));
  _54 = max(6.103519990574569e-05f, (_48 * _48));
  _55 = max(6.103519990574569e-05f, (_49 * _49));
  _77 = select((_53 > 0.040449999272823334f), exp2(log2((_53 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_53 * 0.07739938050508499f));
  _78 = select((_54 > 0.040449999272823334f), exp2(log2((_54 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_54 * 0.07739938050508499f));
  _79 = select((_55 > 0.040449999272823334f), exp2(log2((_55 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_55 * 0.07739938050508499f));
  _101 = exp2(log2(abs(mad(0.04331360012292862f, _79, mad(0.3292819857597351f, _78, (_77 * 0.627403974533081f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _102 = exp2(log2(abs(mad(0.011361200362443924f, _79, mad(0.9195399880409241f, _78, (_77 * 0.06909699738025665f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _103 = exp2(log2(abs(mad(0.8955950140953064f, _79, mad(0.08801320195198059f, _78, (_77 * 0.01639159955084324f))) * 0.02500000037252903f)) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_101 * 18.8515625f) + 0.8359375f) / ((_101 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_102 * 18.8515625f) + 0.8359375f) / ((_102 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_103 * 18.8515625f) + 0.8359375f) / ((_103 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}