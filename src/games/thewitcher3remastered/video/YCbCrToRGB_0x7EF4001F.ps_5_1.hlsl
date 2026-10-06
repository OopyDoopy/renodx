// Decompiled from 0x7EF4001F.ps_5_1.cso
// Shader model: ps_5_1
//
// Reconstructed directly from the DXBC token stream.
//
// IMPORTANT SM5.1 BINDING DETAIL:
// The original shader declares one contiguous resource range t0[0:2]
// and one contiguous sampler range s0[0:2]. Representing these as arrays
// preserves that binding structure much more faithfully than declaring
// three unrelated Texture2D / SamplerState objects.
//
// Input signature:
//   COLOR0    -> v0.xyzw   (only .w is used)
//   TEXCOORD0 -> v1.xy
//
// Output:
//   SV_Target0 -> o0.xyzw

#include "../shared.h"

Texture2D<float4> gPlane[3] : register(t0);
SamplerState      gSampler[3] : register(s0);

struct PSInput
{
    float4 color    : COLOR0;
    float2 texcoord : TEXCOORD0;
};

float4 main(PSInput input) : SV_Target0
{
    // Original instructions:
    //
    // sample r0.x, v1.xyxx, t0[0].xyzw, s0[0]
    // add    r0.x, r0.x, -0.06274510175
    //
    // sample r0.y, v1.xyxx, t0[1].yxzw, s0[1]
    // add    r0.y, r0.y, -0.50196081400
    //
    // sample r0.z, v1.xyxx, t0[2].yzxw, s0[2]
    // add    r0.z, r0.z, -0.50196081400
    //
    // The unusual resource swizzles place the sampled texture's X channel
    // into the destination lane being written. Semantically all three planes
    // are read from their .x channel.

    float Y_limited  = gPlane[0].Sample(gSampler[0], input.texcoord).x;
    float Cb_limited = gPlane[1].Sample(gSampler[1], input.texcoord).x;
    float Cr_limited = gPlane[2].Sample(gSampler[2], input.texcoord).x;

    if (CUSTOM_VIDEO != 0.f)
    {
        float3 video_color = saturate(renodx::color::bt709::from::YCbCrLimited(
            float3(Y_limited, Cb_limited, Cr_limited)));
        return float4(video_color, input.color.w);
    }

    float Y = Y_limited;
    float Cb = Cb_limited;
    float Cr = Cr_limited;

    // Limited-range YCbCr offsets.
    Y  -= 0.06274510175f;  // 16 / 255
    Cb -= 0.50196081400f;  // 128 / 255
    Cr -= 0.50196081400f;  // 128 / 255

    // Exact arithmetic reconstructed from:
    //
    // mul r1.xyz, r0.zzzz, l(1.596, -0.813, 0, 0)
    //
    // mad r0.xzw, r0.xxxx,
    //     l(1.164, 0, 1.164, 1.164),
    //     r1.xxyz
    //
    // mad o0.xyz, r0.yyyy,
    //     l(0, -0.392, 2.017, 0),
    //     r0.xzwx

    const float YScale = 1.16400003433f;

    float3 rgb;
    rgb.r = YScale * Y + 1.59599995613f * Cr;
    rgb.g = YScale * Y - 0.39199998975f * Cb
                       - 0.81300002337f * Cr;
    rgb.b = YScale * Y + 2.01699995995f * Cb;

    // mov o0.w, v0.w
    return float4(rgb, input.color.w);
}
