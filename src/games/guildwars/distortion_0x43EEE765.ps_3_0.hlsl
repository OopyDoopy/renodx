#include "./tonemap.hlsli"

// 0x43EEE765 -- ps_2_0 -> ps_3_0 HLSL rewrite
// c0, c1, c2 are game-provided shader constants.
// t0/t1/t2 were interpolated texcoords; all samplers are 2D.
// Compiled original had a projected lookup on sampler s2.
float4 c0 : register(c0);
float4 c1 : register(c1);
float4 c2 : register(c2);
sampler2D s0 : register(s0);
sampler2D s1 : register(s1);
sampler2D s2 : register(s2);

float4 main(
    float3 t0 : TEXCOORD0,
    float2 t1 : TEXCOORD1,
    float3 t2 : TEXCOORD2) : COLOR0
{
    const float3 luminanceWeights = float3(0.2125, 0.7154, 0.0721);
    float4 offsetSample = tex2D(s1, t1);
    float2 projectedUVNumerator = offsetSample.xy * c0.xy * t2.z + t2.xy;
    float4 projectedCoords = float4(projectedUVNumerator, 0.0, t2.z);
    float4 detail = tex2Dproj(s2, projectedCoords);
    float4 base = tex2D(s0, t0.xy);
    float4 result;
    if (RENODX_TONE_MAP_TYPE == 0.f) {
        detail.rgb = saturate(detail.rgb);
        float luminance = dot(detail.rgb, luminanceWeights);
        float3 modulation = detail.rgb + 2.0 * detail.rgb * luminance * c1.rgb * (1.0 - detail.rgb);
        result.rgb = saturate(base.rgb * modulation);
    } else {
        // Preserve the projected HDR scene instead of multiplying it by the
        // effect texture, which can darken foreground highlights severely.
        result.rgb = detail.rgb;
    }
    result.a = base.a * t0.z * c2.w;
    if (RENODX_TONE_MAP_TYPE != 0.f) {
        float3 undistorted = tex2Dproj(s2, float4(t2.xy, 0.0, t2.z)).rgb;
        float source_luminance = max(dot(renodx::color::srgb::DecodeSafe(undistorted), luminanceWeights), 0.f);
        float warped_luminance = max(dot(renodx::color::srgb::DecodeSafe(detail.rgb), luminanceWeights), 0.f);
        // Reduce replacement across darkening boundaries while retaining the
        // game's original alpha when the two scene samples agree.
        result.a *= 0.5f * saturate((warped_luminance + 0.01f) / (source_luminance + 0.01f));
    }
    result.a *= CUSTOM_DISTORTION_STRENGTH;

    result.rgb = renodx::color::srgb::EncodeSafe(
        renodx::color::srgb::DecodeSafe(result.rgb) * (RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS));
    return result;
}
