#version 450

#include "./tonemapping.hlsl"

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    vec3 _122 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz * vec3(0.2199999988079071044921875, 0.3300000131130218505859375, 0.9900000095367431640625);

    float3 color;
    if (RENODX_TONE_MAP_TYPE == 0.f) {
      vec3 _232 = _122 * 0.2199999988079071044921875;
      vec3 _131 = ((fma(_122, _232 + vec3(0.0300000011920928955078125), vec3(0.00200000009499490261077880859375)) / fma(_122, _232 + vec3(0.300000011920928955078125), vec3(0.060000002384185791015625))) - vec3(0.0333333313465118408203125)) * vec3(1.11718451976776123046875);
      color = _131;
    }
    else {
      color = Uncharted2Extended_5DA105E2(_122);
    }
    
    out_color0 = vec4(color * color, 1.0);

    //out_color0 = vec4(_131 * _131, 1.0);
}

