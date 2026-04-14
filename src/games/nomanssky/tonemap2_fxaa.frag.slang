#version 450

#include "./tonemapping.hlsl"

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
    noperspective vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    vec4 _239 = texture(gBufferMap, In.mTexCoordsVec2);
    vec3 _244 = _239.xyz;
    if (RENODX_TONE_MAP_TYPE < 2) _244.xyz = clamp(_244.xyz, vec3(0.0), vec3(1.0));
    vec3 _535 = Uncharted2Extended(_244);
    _535 = CustomTonemap(_535, In.mTexCoordsVec2);
    out_color0 = vec4(CustomGammaEncode(_535), 1.0);
}