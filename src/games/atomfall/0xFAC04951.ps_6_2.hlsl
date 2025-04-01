Texture2D<float4> t0 : register(t2);

Texture2D<float4> t1 : register(t3);

Texture2D<float4> t2 : register(t4);

cbuffer cb0 : register(b10) {
  float LensDirtFSParams_000 : packoffset(c000.x);
  float LensDirtFSParams_004 : packoffset(c000.y);
  float LensDirtFSParams_008 : packoffset(c000.z);
};

SamplerState s0 : register(s2);

SamplerState s1 : register(s3);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _9 = t0.Sample(s1, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _13 = t1.Sample(s1, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _20 = t2.Sample(s0, float2((LensDirtFSParams_000 * TEXCOORD.x), TEXCOORD.y));
  SV_Target.x = (((_20.x * _9.x) * LensDirtFSParams_008) + (LensDirtFSParams_004 * _13.x));
  SV_Target.y = (((_20.y * _9.y) * LensDirtFSParams_008) + (LensDirtFSParams_004 * _13.y));
  SV_Target.z = (((_20.z * _9.z) * LensDirtFSParams_008) + (LensDirtFSParams_004 * _13.z));
  SV_Target.w = _20.w;
  return SV_Target;
  //return float4(2, 2, 2, 2);
}
