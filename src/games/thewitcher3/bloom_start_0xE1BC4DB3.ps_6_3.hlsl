#include "./common.hlsl"

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
  float4 CustomPixelConsts_336[4] : packoffset(c021.x);
};

SamplerState s0 : register(s0);

float4 main(
  noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target;

  float _35 = float(int(CustomPixelConsts_064.x)) + (CustomPixelConsts_016.x * ((float((uint)((int)(int(SV_Position.x)) - (int)(int(CustomPixelConsts_064.z)))) + 0.5f) / CustomPixelConsts_048.x));
  float _36 = float(int(CustomPixelConsts_064.y)) + (CustomPixelConsts_016.y * ((float((uint)((int)(int(SV_Position.y)) - (int)(int(CustomPixelConsts_064.w)))) + 0.5f) / CustomPixelConsts_048.y));

  float _45 = (CustomPixelConsts_080.x + 0.5f) / CustomPixelConsts_000.x;
  float _46 = (CustomPixelConsts_080.y + 0.5f) / CustomPixelConsts_000.y;
  float _51 = (CustomPixelConsts_080.z + 0.5f) / CustomPixelConsts_000.x;
  float _52 = (CustomPixelConsts_080.w + 0.5f) / CustomPixelConsts_000.y;
  float _59 = min(max(((_35 + -1.0f) / CustomPixelConsts_000.x), _45), _51);
  float _60 = min(max(((_36 + -1.0f) / CustomPixelConsts_000.y), _46), _52);

  float4 _61 = t0.SampleLevel(s0, float2(_59, _60), 0.0f);

  //_61.rgb = renodx::tonemap::uncharted2::BT709(_61.rgb, 11.2f);
  _61.rgb = CustomBloomTonemap(_61.rgb);

  float _68 = min(max(((_35 + 1.0f) / CustomPixelConsts_000.x), _45), _51);
  float4 _69 = t0.SampleLevel(s0, float2(_68, _60), 0.0f);

  //_69.rgb = renodx::tonemap::uncharted2::BT709(_69.rgb, 11.2f);
  _69.rgb = CustomBloomTonemap(_69.rgb);

  float _79 = min(max(((_36 + 1.0f) / CustomPixelConsts_000.y), _46), _52);
  float4 _80 = t0.SampleLevel(s0, float2(_59, _79), 0.0f);

  //_80.rgb = renodx::tonemap::uncharted2::BT709(_80.rgb, 11.2f);
  _80.rgb = CustomBloomTonemap(_80.rgb);

  float4 _87 = t0.SampleLevel(s0, float2(_68, _79), 0.0f);

  //_87.rgb = renodx::tonemap::uncharted2::BT709(_87.rgb, 11.2f);
  _87.rgb = CustomBloomTonemap(_87.rgb);

  float _91 = ((_69.x + _61.x) + _80.x) + _87.x;
  float _92 = ((_69.y + _61.y) + _80.y) + _87.y;
  float _93 = ((_69.z + _61.z) + _80.z) + _87.z;

  //float3 test = CustomBloomTonemap(float3(_91, _92, _93), 1.f, GetPostProcessingMaxCLL());
  // _91 = test.x;
  // _92 = test.y;
  // _93 = test.z;

  bool _102 = (((abs(_92 * 0.25f) + abs(_91 * 0.25f)) + abs(_93 * 0.25f)) > 1.0000000116860974e-07f);
  float _106 = select(_102, (_91 * 0.2500000298023224f), 0.0f);
  float _107 = select(_102, (_92 * 0.2500000298023224f), 0.0f);
  float _108 = select(_102, (_93 * 0.2500000298023224f), 0.0f);
  float _113 = dot(float3(CustomPixelConsts_144.x, CustomPixelConsts_144.y, CustomPixelConsts_144.z), float3(_106, _107, _108));
  float _117 = max(0.0f, (_113 - CustomPixelConsts_128.x));
  float _126 = min(CustomPixelConsts_112.x, (saturate(CustomPixelConsts_128.y * _117) * _117)) / max(9.999999747378752e-05f, _113);
  SV_Target.x = ((_126 * _106) * CustomPixelConsts_096.x);
  SV_Target.y = ((_126 * _107) * CustomPixelConsts_096.x);
  SV_Target.z = ((_126 * _108) * CustomPixelConsts_096.x);

  //SV_Target.rgb *= GetPostProcessingScale();

  //SV_Target.rgb = CustomBloomTonemap(SV_Target.rgb, 1.f, GetPostProcessingMaxCLL());
  // SV_Target.rgb = applyDice(SV_Target.rgb);
  //SV_Target.rgb = renodx::tonemap::renodrt::NeutralSDR(SV_Target.rgb);

  SV_Target.w = 0.0f;
  return SV_Target;
}
