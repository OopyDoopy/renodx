// Shader that spawns when using the disable interior fog mod, breaks HDR rendering
#include "../shared.h"

struct ShaderCommonEnvProbeParams {
  float ShaderCommonEnvProbeParams_000;
  float3 ShaderCommonEnvProbeParams_004;
  float3 ShaderCommonEnvProbeParams_016;
  row_major float4x4 ShaderCommonEnvProbeParams_028;
  float4 ShaderCommonEnvProbeParams_092;
  row_major float4x4 ShaderCommonEnvProbeParams_108;
  int ShaderCommonEnvProbeParams_172;
};

struct ShaderCullingEnvProbeParams {
  row_major float4x3 ShaderCullingEnvProbeParams_000;
  float3 ShaderCullingEnvProbeParams_048;
  int ShaderCullingEnvProbeParams_060;
};

struct ShaderWorldTear {
  float4 ShaderWorldTear_000;
  float4 ShaderWorldTear_016;
  float ShaderWorldTear_032;
  float ShaderWorldTear_036;
  float ShaderWorldTear_040;
  float ShaderWorldTear_044;
};

struct ShaderWorldTearArray {
  int ShaderWorldTearArray_000;
  float ShaderWorldTearArray_004;
  float ShaderWorldTearArray_008;
  float ShaderWorldTearArray_012;
  ShaderWorldTear ShaderWorldTearArray_016[10];
};

struct ShaderWorldTearConstants {
  int4 ShaderWorldTearConstants_000[16];
};


Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t2 : register(t2);

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

cbuffer cb12 : register(b12) {
  float cb12_073x : packoffset(c073.x);
  float cb12_073y : packoffset(c073.y);
  float cb12_204x : packoffset(c204.x);
  float cb12_204y : packoffset(c204.y);
  float cb12_204z : packoffset(c204.z);
  float cb12_204w : packoffset(c204.w);
  float cb12_205x : packoffset(c205.x);
  float cb12_205y : packoffset(c205.y);
  float cb12_205z : packoffset(c205.z);
  float cb12_205w : packoffset(c205.w);
  float cb12_206x : packoffset(c206.x);
  float cb12_206y : packoffset(c206.y);
  float cb12_206z : packoffset(c206.z);
  float cb12_206w : packoffset(c206.w);
  float cb12_207x : packoffset(c207.x);
  float cb12_207y : packoffset(c207.y);
  float cb12_207z : packoffset(c207.z);
  float cb12_207w : packoffset(c207.w);
  float cb12_279x : packoffset(c279.x);
  float cb12_279y : packoffset(c279.y);
  uint cb12_padding : packoffset(c333.w);
};

SamplerState s0 : register(s0);

SamplerState s1 : register(s1);

SamplerState s2 : register(s2);

float4 main(
  linear float2 TEXCOORD : TEXCOORD,
  noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target = 0;
  float4 _17 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _34 = t1.Sample(s1, float2(((cb12_279x / cb12_073x) + TEXCOORD.x), (TEXCOORD.y - (cb12_279y / cb12_073y))));
  float _71 = mad(cb12_206w, _34.x, mad(cb12_205w, SV_Position.y, (cb12_204w * SV_Position.x))) + cb12_207w;
  float _79 = ((mad(cb12_206x, _34.x, mad(cb12_205x, SV_Position.y, (cb12_204x * SV_Position.x))) + cb12_207x) / _71) - CustomPixelConsts_064.x;
  float _80 = ((mad(cb12_206y, _34.x, mad(cb12_205y, SV_Position.y, (cb12_204y * SV_Position.x))) + cb12_207y) / _71) - CustomPixelConsts_064.y;
  float _81 = ((mad(cb12_206z, _34.x, mad(cb12_205z, SV_Position.y, (cb12_204z * SV_Position.x))) + cb12_207z) / _71) - CustomPixelConsts_064.z;
  float _87 = sqrt(((_79 * _79) + (_80 * _80)) + (_81 * _81));
  float _89 = saturate(_87 * 0.10000000149011612f);
  float _94 = min((CustomPixelConsts_016.x * _87), 1.0f);
  float _100 = CustomPixelConsts_000.w * 0.25f;
  float _103 = ((_89 * _89) * (((CustomPixelConsts_000.w * (1.0f - _94)) + CustomPixelConsts_000.w) - _100)) + _100;
  float _105 = 1.0f - (_94 * _94);
  // Treat signed wide-gamut luminance as a positive fog-strength magnitude.
  float _106 = abs(dot(float3(_17.x, _17.y, _17.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)));
  float _107 = _103 * 0.20000000298023224f;
  float _119 = _107 * CustomPixelConsts_048.x;
  float _120 = _107 * CustomPixelConsts_048.y;
  float _121 = _107 * CustomPixelConsts_048.z;
  float _143 = CustomPixelConsts_096.z * 0.7070000171661377f;
  float _145 = CustomPixelConsts_096.w * 0.7070000171661377f;
  float4 _148 = t2.Sample(s2, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _153 = t2.Sample(s2, float2((_143 + TEXCOORD.x), TEXCOORD.y));
  float4 _159 = t2.Sample(s2, float2((TEXCOORD.x - _143), TEXCOORD.y));
  float4 _165 = t2.Sample(s2, float2(TEXCOORD.x, (_145 + TEXCOORD.y)));
  float4 _171 = t2.Sample(s2, float2(TEXCOORD.x, (TEXCOORD.y - _145)));
  float _181 = (((((_153.x + _148.x) + _159.x) + _165.x) + _171.x) * 0.20000000298023224f) * CustomPixelConsts_000.x;
  SV_Target.x = (((_181 * CustomPixelConsts_080.x) + (((((((_103 * CustomPixelConsts_032.x) - _119) * _105) + _119) * _106) - _17.x) * CustomPixelConsts_000.y)) * CustomPixelConsts_000.x) + _17.x;
  SV_Target.y = (((_181 * CustomPixelConsts_080.y) + (((((((_103 * CustomPixelConsts_032.y) - _120) * _105) + _120) * _106) - _17.y) * CustomPixelConsts_000.y)) * CustomPixelConsts_000.x) + _17.y;
  SV_Target.z = (((_181 * CustomPixelConsts_080.z) + (((((((_103 * CustomPixelConsts_032.z) - _121) * _105) + _121) * _106) - _17.z) * CustomPixelConsts_000.y)) * CustomPixelConsts_000.x) + _17.z;
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    SV_Target.rgb = min(SV_Target.rgb, 1.100000023841858f);
  }
  SV_Target.w = _17.w;
  return SV_Target;
}
