Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

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

SamplerState s1 : register(s1);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float2 TEXCOORD_1 : TEXCOORD1,
  linear float2 TEXCOORD_2 : TEXCOORD2
) : SV_Target {
  float4 SV_Target;
  float4 _10 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _14 = t1.Sample(s1, float2(TEXCOORD_1.x, TEXCOORD_1.y));

  float3 untonemapped = _14.rgb;

  float _20 = dot(float3(_14.x, _14.y, _14.z), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f));
  float _23 = _20 * -3.0f;
  float _24 = exp2(_23);
  float _25 = _24 * CustomPixelConsts_032.w;

  float _26 = saturate(_25);
  //float _26 = _25;

  float _27 = _26 + -1.0f;
  float _28 = _27 * CustomPixelConsts_048.x;
  float _29 = _28 + 1.0f;
  float _33 = CustomPixelConsts_032.x * _10.x;
  float _34 = CustomPixelConsts_032.y * _10.y;
  float _35 = CustomPixelConsts_032.z * _10.z;
  float _36 = _33 * _29;
  float _37 = _34 * _29;
  float _38 = _35 * _29;

  float _39 = saturate(_36);
  float _40 = saturate(_37);
  float _41 = saturate(_38);
  // float _39 = _36;
  // float _40 = _37;
  // float _41 = _38;

  float _42 = 1.0f - _14.x;
  float _43 = 1.0f - _14.y;
  float _44 = 1.0f - _14.z;
  float _45 = 1.0f - _39;
  float _46 = 1.0f - _40;
  float _47 = 1.0f - _41;
  float _48 = _45 * _42;
  float _49 = _46 * _43;
  float _50 = _47 * _44;
  float _51 = 1.0f - _48;
  float _52 = 1.0f - _49;
  float _53 = 1.0f - _50;
  SV_Target.x = _51;
  SV_Target.y = _52;
  SV_Target.z = _53;
  SV_Target.w = 1.0f;

  //SV_Target.rgb = untonemapped;
  return SV_Target;
}
