#include "./shared.h"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 HDRReconstructionParams_000 : packoffset(c000.x);
  float HDRReconstructionParams_016 : packoffset(c001.x);
  float HDRReconstructionParams_020 : packoffset(c001.y);
  float HDRReconstructionParams_024 : packoffset(c001.z);
};

SamplerState s0 : register(s3);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _6 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  float _19 = HDRReconstructionParams_020 / (HDRReconstructionParams_016);
  float _21 = _19 / (_19 + -1.0f);
  float _25 = 1.0f - ((_21 * 0.5f) / (_21 + -0.5f));
  float _44 = dot(float3((_6.x), (_6.y), (_6.z)), float3(0.27000001072883606f, 0.6700000166893005f, 0.05999999865889549f));
  float _52 = select((_44 > 0.5f), (_25 + ((_21 * _44) / (_21 - _44))), (_44 / (1.000100016593933f - _44)));
  float _53 = _44 + 9.999999747378752e-05f;
  float _57 = _52 * ((_6.x) / _53);
  float _58 = ((_6.y) / _53) * _52;
  float _59 = ((_6.z) / _53) * _52;
  float _73 = (HDRReconstructionParams_016) * 0.012500000186264515f;
  SV_Target.x = exp2(log2(abs(((HDRReconstructionParams_000.x * (select(((_6.x) > 0.5f), (_25 + ((_21 * (_6.x)) / (_21 - (_6.x)))), ((_6.x) / (1.000100016593933f - (_6.x)))) - _57)) + _57) * _73)) * HDRReconstructionParams_024);
  SV_Target.y = exp2(log2(abs(((HDRReconstructionParams_000.y * (select(((_6.y) > 0.5f), (((_21 * (_6.y)) / (_21 - (_6.y))) + _25), ((_6.y) / (1.000100016593933f - (_6.y)))) - _58)) + _58) * _73)) * HDRReconstructionParams_024);
  SV_Target.z = exp2(log2(abs(((HDRReconstructionParams_000.z * (select(((_6.z) > 0.5f), (((_21 * (_6.z)) / (_21 - (_6.z))) + _25), ((_6.z) / (1.000100016593933f - (_6.z)))) - _59)) + _59) * _73)) * HDRReconstructionParams_024);
  SV_Target.w = 1.0f;

  SV_Target = _6;
  return SV_Target;
  //return renodx::draw::SwapChainPass(t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y)));
}
