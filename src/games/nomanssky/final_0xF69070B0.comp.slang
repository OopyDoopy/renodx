#include "./common.hlsl"

[[vk::binding(0, 1)]] Sampler2D gBufferMap;

[[vk::binding(0, 2)]] RWTexture2D<float4> gOutTexture0;

[[vk::binding(1, 1)]] Sampler3D gHdrLut;

[numthreads(8, 8, 1)]
void main(uint3 tid: SV_DispatchThreadID)
{
  uint2 dim;
  gOutTexture0.GetDimensions(dim.x, dim.y);

  float2 uv = (float2(tid.xy) + float2(0.5, 0.5)) / float2(dim);
  float4 _504 = gBufferMap.SampleLevel(uv, 0.0);

  float4 hdr_color = _504;
  hdr_color.xyz = CustomGammaDecode(hdr_color.xyz);
  hdr_color.xyz = renodx::draw::SwapChainPass(hdr_color.xyz, uv);

  gOutTexture0[tid.xy] = hdr_color;
}