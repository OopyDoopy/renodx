Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b3) {
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
  int _6 = int(SV_Position.x);
  int _7 = int(SV_Position.y);
  int _11 = int(CustomPixelConsts_064.z);
  int _12 = int(CustomPixelConsts_064.w);
  uint _13 = _6 - _11;
  uint _14 = _7 - _12;
  float _15 = float(_13);
  float _16 = float(_14);
  float _17 = _15 + 0.5f;
  float _18 = _16 + 0.5f;
  float _22 = _17 / CustomPixelConsts_048.x;
  float _23 = _18 / CustomPixelConsts_048.y;
  float _27 = (CustomPixelConsts_016.x) * _22;
  float _28 = (CustomPixelConsts_016.y) * _23;
  int _31 = int(CustomPixelConsts_064.x);
  int _32 = int(CustomPixelConsts_064.y);
  float _33 = float(_31);
  float _34 = float(_32);
  float _35 = _33 + _27;
  float _36 = _34 + _28;
  float _40 = _35 / CustomPixelConsts_000.x;
  float _41 = _36 / CustomPixelConsts_000.y;
  float _45 = CustomPixelConsts_080.x + 0.5f;
  float _46 = CustomPixelConsts_080.y + 0.5f;
  float _47 = _45 / CustomPixelConsts_000.x;
  float _48 = _46 / CustomPixelConsts_000.y;
  float _51 = CustomPixelConsts_080.z + 0.5f;
  float _52 = CustomPixelConsts_080.w + 0.5f;
  float _53 = _51 / CustomPixelConsts_000.x;
  float _54 = _52 / CustomPixelConsts_000.y;
  float _55 = max(_40, _47);
  float _56 = max(_41, _48);
  float _57 = min(_55, _53);
  float _58 = min(_56, _54);
  float4 _59 = t0.SampleLevel(s0, float2(_57, _58), 0.0f);
  float _67 = (CustomPixelConsts_096.x) * _59.x;
  float _68 = (CustomPixelConsts_096.y) * _59.y;
  float _69 = (CustomPixelConsts_096.z) * _59.z;
  SV_Target.x = _67;
  SV_Target.y = _68;
  SV_Target.z = _69;
  SV_Target.w = 0.0f;
  return SV_Target;
}
