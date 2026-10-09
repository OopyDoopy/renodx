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

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t3 : register(t3);

cbuffer cb0 : register(b0) {
  float4 GlobalShaderConsts_000 : packoffset(c000.x);
  float4 GlobalShaderConsts_016 : packoffset(c001.x);
  float4 GlobalShaderConsts_032 : packoffset(c002.x);
  float4 GlobalShaderConsts_048 : packoffset(c003.x);
  float4 GlobalShaderConsts_064 : packoffset(c004.x);
  float4 GlobalShaderConsts_080 : packoffset(c005.x);
  float4 GlobalShaderConsts_096 : packoffset(c006.x);
  float4 GlobalShaderConsts_112 : packoffset(c007.x);
  float4 GlobalShaderConsts_128 : packoffset(c008.x);
  float4 GlobalShaderConsts_144 : packoffset(c009.x);
  float4 GlobalShaderConsts_160 : packoffset(c010.x);
  float4 GlobalShaderConsts_176 : packoffset(c011.x);
  float4 GlobalShaderConsts_192 : packoffset(c012.x);
  float4 GlobalShaderConsts_208 : packoffset(c013.x);
  float4 GlobalShaderConsts_224 : packoffset(c014.x);
  float4 GlobalShaderConsts_240 : packoffset(c015.x);
};

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
  float cb12_286x : packoffset(c286.x);
  float cb12_286y : packoffset(c286.y);
  float cb12_287x : packoffset(c287.x);
  uint cb12_padding : packoffset(c340.w);
};

SamplerState s0 : register(s0);

SamplerState s2 : register(s2);

float4 main(
    noperspective float4 SV_Position: SV_Position) : SV_Target {
  float4 SV_Target = 0;
  float _21 = SV_Position.x / CustomPixelConsts_144.x;
  float _22 = SV_Position.y / CustomPixelConsts_144.y;
  float aspect_ratio = CustomPixelConsts_144.x / CustomPixelConsts_144.y;
  float aspect_scale = aspect_ratio / (16.0f / 9.0f);
  float inverse_aspect_scale = rcp(aspect_scale);
  float _44 = exp2(log2(saturate(((aspect_ratio * abs((_21 * 2.0f) + -1.0f)) - CustomPixelConsts_032.x) * 0.5555555820465088f)) * 2.5f);
  float _45 = exp2(log2(saturate((abs((_22 * 2.0f) + -1.0f) - CustomPixelConsts_032.y) * 0.5555555820465088f)) * 2.5f);
  float _53 = saturate(CustomPixelConsts_096.x);
  float _74 = ((SV_Position.x * 2.0f) / CustomPixelConsts_144.x) + -1.0f;
  float _75 = ((SV_Position.y * 2.0f) / CustomPixelConsts_144.y) + -1.0f;
  // Preserve the original 16:9 response while scaling radial distance for wider or narrower viewports.
  float2 aspect_corrected_position = float2(_74 * aspect_scale, _75);
  float _78 = (_53 * 0.10000000149011612f) * dot(aspect_corrected_position, aspect_corrected_position);
  float _87 = min(max((_78 * _74), -0.4000000059604645f), 0.4000000059604645f) * CustomPixelConsts_016.x;
  float _88 = min(max((_78 * _75), -0.4000000059604645f), 0.4000000059604645f) * CustomPixelConsts_016.x;
  float _94 = (CustomPixelConsts_128.z * SV_Position.x) - (CustomPixelConsts_144.z * _87);
  float _95 = (CustomPixelConsts_128.w * SV_Position.y) - (CustomPixelConsts_144.w * _88);
  float4 _98 = t0.Sample(s0, float2(_94, _95));
  float _101 = _94 * 0.5f;
  float _102 = _95 * 0.5f;
  float4 _105 = t2.Sample(s2, float2(_101, _102));
  float4 _111 = t2.Sample(s2, float2((_101 + 0.5f), _102));
  float _199;
  float _200;
  float _201;
  float _202;
  float _203;
  int _204;
  _199 = 0.0f;
  _200 = 0.0f;
  _201 = 0.0f;
  _202 = (_105.x * 0.125f);
  _203 = (_111.x * 0.125f);
  _204 = 0;
  while (true) {
    float _210 = (float((int)(_204)) * 0.7853749394416809f) - (GlobalShaderConsts_000.x * 0.10000000149011612f);
    float _214 = (1.0f - saturate((((saturate(0.029999999329447746f - _22) + saturate(0.029999999329447746f - _21)) + saturate(_21 + -0.9700000286102295f)) + saturate(_22 + -0.9700000286102295f)) * 20.0f)) * 0.029999999329447746f;
    float _215 = cos(_210) * _214 * inverse_aspect_scale;
    float _216 = sin(_210) * _214;
    float _221 = ((_215 * 0.125f) + _94) * 0.5f;
    float _222 = ((_216 * 0.125f) + _95) * 0.5f;
    float4 _225 = t2.Sample(s2, float2(_221, _222));
    float _228 = (_225.x * 0.125f) + _202;
    float4 _230 = t2.Sample(s2, float2((_221 + 0.5f), _222));
    float _233 = (_230.x * 0.125f) + _203;
    float4 _240 = t0.Sample(s0, float2(((_215 * _87) + _94), ((_216 * _88) + _95)));
    float _247 = (_240.x * 0.125f) + _199;
    float _248 = (_240.y * 0.125f) + _200;
    float _249 = (_240.z * 0.125f) + _201;
    int _250 = _204 + 1;
    if (!(_250 == 8)) {
      _199 = _247;
      _200 = _248;
      _201 = _249;
      _202 = _228;
      _203 = _233;
      _204 = _250;
      continue;
    }
    while (true) {
      float _116 = 1.0f - saturate(sqrt((_45 * _45) + (_44 * _44)));
      float4 _135 = t3.Sample(s0, float2((((cb12_286x / cb12_073x) + _94) * cb12_287x), ((_95 - (cb12_286y / cb12_073y)) * cb12_287x)));
      float _142 = saturate(_228 - (_135.x * 0.800000011920929f));
      float _144 = dot(float3(_247, _248, _249), float3(0.30000001192092896f, 0.30000001192092896f, 0.30000001192092896f));
      float _163 = ((((lerp(_144, _247, _116)) * 0.6000000238418579f) - _98.x) * _53) + _98.x;
      float _164 = ((((lerp(_144, _248, _116)) * 0.6000000238418579f) - _98.y) * _53) + _98.y;
      float _165 = ((((lerp(_144, _249, _116)) * 0.6000000238418579f) - _98.z) * _53) + _98.z;
      float _170 = saturate(_233 - (_135.y * 0.75f)) * 1.2000000476837158f;
      float _181 = (CustomPixelConsts_080.x * _142) + (CustomPixelConsts_064.x * _170);
      float _182 = (CustomPixelConsts_080.y * _142) + (CustomPixelConsts_064.y * _170);
      float _183 = (CustomPixelConsts_080.z * _142) + (CustomPixelConsts_064.z * _170);
      float _185 = saturate(dot(float3(_181, _182, _183), float3(1.0f, 1.0f, 1.0f)));
      SV_Target.x = (((saturate(_181) - _163) * _185) + _163);
      SV_Target.y = (((saturate(_182) - _164) * _185) + _164);
      SV_Target.z = (((saturate(_183) - _165) * _185) + _165);
      SV_Target.w = _98.w;
      break;
    }
    return SV_Target;
  }
}
