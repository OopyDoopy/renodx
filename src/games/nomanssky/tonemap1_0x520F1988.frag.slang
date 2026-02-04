#include "./tonemapping.hlsl"

#version 450

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    vec3 _108 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;
    // vec3 _215 = _108 * 0.2199999988079071044921875;
    // out_color0 = vec4(((fma(_108, _215 + vec3(0.0300000011920928955078125), vec3(0.00200000009499490261077880859375)) / fma(_108, _215 + vec3(0.300000011920928955078125), vec3(0.060000002384185791015625))) - vec3(0.0333333313465118408203125)) * vec3(2.492836475372314453125), 1.0);
    out_color0 = vec4(Uncharted2Extended(_108), 1.0);
}