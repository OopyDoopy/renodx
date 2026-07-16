Texture2D source_texture : register(t0);
SamplerState source_sampler : register(s0);

float4 main(float4 position : SV_POSITION, float2 uv : TEXCOORD0)
    : SV_TARGET {
  return source_texture.Sample(source_sampler, uv);
}