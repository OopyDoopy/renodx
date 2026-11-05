// 0x4BC8B33E -- ps_1_1 -> ps_3_0 HLSL rewrite
// The ps_1_1 multiply destination shift=1 doubles its output.
// c0 is a game-provided float4; both sampled alpha channels are preserved.
#include "./shared.h"

float4 c0 : register(c0);
sampler2D s0 : register(s0);
sampler2D s1 : register(s1);

float4 main(float2 t0 : TEXCOORD0, float2 t1 : TEXCOORD1) : COLOR0
{
    float4 tex0 = tex2D(s0, t0);
    float4 tex1 = tex2D(s1, t1);
    if (CUSTOM_BLOOM_TYPE == 1.f) {
        return float4(lerp(tex0.rgb, tex1.rgb, 0.3f * CUSTOM_BLOOM_STRENGTH * (2.f * c0.rgb)), tex0.a);
    }
    tex1.rgb *= CUSTOM_BLOOM_STRENGTH;
    float4 factor = 1.0 - 2.0 * (tex1 * c0);
    return 1.0 - factor * (1.0 - tex0);
}
