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
    out_color0 = vec4(Uncharted2Extended(_108), 1.0);
}