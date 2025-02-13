Texture2D<float4> pRenderTarget : register(t0);

Texture2D<float4> pDistortTexture : register(t1);

cbuffer $Globals : register(b0) {
  float $Globals_000x : packoffset(c000.x);
};

cbuffer cbPsPerFrame : register(b4) {
  float cbPsPerFrame_000z : packoffset(c000.z);
  float cbPsPerFrame_000w : packoffset(c000.w);
};

SamplerState pRenderTargetS : register(s0);

SamplerState pDistortTextureS : register(s1);

SamplerState pPointClampSampler : register(s2);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _13 = pDistortTexture.Sample(pDistortTextureS, float2((TEXCOORD.x), (TEXCOORD.y)));
  float _18 = ((_13.x) * (cbPsPerFrame_000z)) + (TEXCOORD.x);
  float _19 = ((_13.y) * (cbPsPerFrame_000w)) + (TEXCOORD.y);
  float _23 = saturate(((((float4)(pDistortTexture.Sample(pPointClampSampler, float2(_18, _19)))).x) * 1e+06f));
  float _27 = (_23 * _23) * (3.0f - (_23 * 2.0f));
  float4 _34 = pRenderTarget.Sample(pRenderTargetS, float2(((_27 * (_18 - (TEXCOORD.x))) + (TEXCOORD.x)), ((_27 * (_19 - (TEXCOORD.y))) + (TEXCOORD.y))));
  SV_Target.x = (_34.x);
  SV_Target.y = (_34.y);
  SV_Target.z = (_34.z);
  SV_Target.w = ($Globals_000x);
  return SV_Target;
}
