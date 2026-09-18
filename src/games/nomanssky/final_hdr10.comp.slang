#include "./common.hlsl"

[[vk::binding(0, 1)]] Sampler2D gBufferMap;

[[vk::binding(0, 2)]] RWTexture2D<float4> gOutTexture0;

[[vk::binding(1, 1)]] Sampler3D gHdrLut;

/*
 * No Man's Sky's HDR10 final conversion pass.
 *
 * The native HDR10 permutation decodes the game's dual-gamma intermediate,
 * shapes it into the HDR LUT domain, and writes the LUT result directly to
 * an R10G10B10A2 target. Unlike the scRGB permutation, it does not decode the
 * LUT result back to linear RGB or apply a second output transfer.
 */

[numthreads(8, 8, 1)]
void main(uint3 tid: SV_DispatchThreadID)
{
  uint2 dim;
  gOutTexture0.GetDimensions(dim.x, dim.y);

  const float2 uv = (float2(tid.xy) + float2(0.5, 0.5)) / float2(dim);
  float4 hdr_color = gBufferMap.SampleLevel(uv, 0.0);
  hdr_color.xyz = CustomGammaDecode(hdr_color.xyz);

  if (RENODX_TONE_MAP_TYPE == 1.0f)
  {
    // This permutation writes directly to the game's HDR10 target. Override
    // the non-frame-generation scRGB default for the custom output path.
    renodx::draw::Config output_config = renodx::draw::BuildConfig();
    output_config.swap_chain_output_preset =
        renodx::draw::SWAP_CHAIN_OUTPUT_PRESET_HDR10;
    hdr_color.xyz = renodx::draw::SwapChainPass(
        hdr_color.xyz,
        uv,
        output_config);
  }
  else
  {
    // Native HDR10 path: the game's HDR LUT already contains the PQ-encoded
    // output, so preserve its result exactly instead of decoding it.
    const float3 lut_input = hdr_color.xyz * 3.0f;
    const float3 lut_working = max(
        float3(0.0),
        mul(
            float3x3(
                float3(0.627399981021881103515625, 0.329299986362457275390625, 0.0432999990880489349365234375),
                float3(0.069099999964237213134765625, 0.91949999332427978515625, 0.011400000192224979400634765625),
                float3(0.01640000008046627044677734375, 0.087999999523162841796875, 0.895600020885467529296875)),
            lut_input));
    const float3 lut_shaped = clamp(
        fma(
            lut_working,
            fma(
                lut_working,
                fma(
                    lut_working,
                    fma(
                        lut_working,
                        (lut_working * 533095.75) + 47438308.0,
                        29063622.0),
                    575216.75),
                383.091033935546875),
            0.000487781013362109661102294921875)
            / fma(
                lut_working,
                fma(
                    lut_working,
                    fma(
                        lut_working,
                        (lut_working * 66391356.0) + 81884528.0,
                        4182885.0),
                    10668.404296875),
                1.0),
        float3(0.0),
        float3(1.0));
    const float3 lut_uv =
        lut_shaped * 1.01587307453155517578125 + float3(0.0078125);
    hdr_color.xyz = gHdrLut.SampleLevel(lut_uv, 0.0).xyz;
  }

  hdr_color.w = 1.0f;
  gOutTexture0[tid.xy] = hdr_color;
}