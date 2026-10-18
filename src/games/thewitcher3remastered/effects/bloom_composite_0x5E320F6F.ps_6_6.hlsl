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

float4 main(
  noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target = 0;
  int _7 = int(SV_Position.x);
  int _8 = int(SV_Position.y);
  int _12 = int(CustomPixelConsts_064.z);
  int _13 = int(CustomPixelConsts_064.w);
  uint _14 = _7 - _12;
  uint _15 = _8 - _13;
  float _16 = float((int)(_14));
  float _17 = float((int)(_15));
  float _18 = _16 + 0.5f;
  float _19 = _17 + 0.5f;
  float _23 = _18 / CustomPixelConsts_048.x;
  float _24 = _19 / CustomPixelConsts_048.y;
  float _28 = CustomPixelConsts_016.x * _23;
  float _29 = CustomPixelConsts_016.y * _24;
  int _32 = int(CustomPixelConsts_064.x);
  int _33 = int(CustomPixelConsts_064.y);
  float _34 = float((int)(_32));
  float _35 = float((int)(_33));
  float _36 = _28 + _34;
  float _37 = _29 + _35;
  float _41 = _36 / CustomPixelConsts_000.x;
  float _42 = _37 / CustomPixelConsts_000.y;
  float _46 = CustomPixelConsts_080.x + 0.5f;
  float _47 = CustomPixelConsts_080.y + 0.5f;
  float _48 = _46 / CustomPixelConsts_000.x;
  float _49 = _47 / CustomPixelConsts_000.y;
  float _52 = CustomPixelConsts_080.z + 0.5f;
  float _53 = CustomPixelConsts_080.w + 0.5f;
  float _54 = _52 / CustomPixelConsts_000.x;
  float _55 = _53 / CustomPixelConsts_000.y;
  float _56 = max(_41, _48);
  float _57 = max(_42, _49);
  float _58 = min(_56, _54);
  float _59 = min(_57, _55);
  float4 _62 = t0.SampleLevel(s0, float2(_58, _59), 0.0f);
  float _70 = CustomPixelConsts_096.x * _62.x;
  float _71 = CustomPixelConsts_096.y * _62.y;
  float _72 = CustomPixelConsts_096.z * _62.z;
  SV_Target.x = _70;
  SV_Target.y = _71;
  SV_Target.z = _72;
  SV_Target.w = 0.0f;
  SV_Target.rgb *= CUSTOM_BLOOM;
  return SV_Target;
}
