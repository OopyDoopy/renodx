#include "./common.hlsl"

#version 450

/*
 * No Man's Sky's pre-tonemap fullscreen pass.
 *
 * The original 0x7A10D6D6 shader applies a Hable-style curve before the
 * retained 0x348B2353 tonemap. Keep that transfer for Vanilla, but
 * leave the scene signal untouched for Prism so the later tonemap receives
 * the HDR range present in the preceding r11g11b10_float resource.
 */

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
  vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
  const vec3 source_color =
      textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;

  if (RENODX_TONE_MAP_TYPE == 1.0)
  {
    out_color0 = vec4(source_color, 1.0);
    return;
  }

  const vec3 scaled_color = source_color * 0.2199999988079071044921875;
  out_color0 = vec4(
      ((fma(
            source_color,
            scaled_color + vec3(0.0300000011920928955078125),
            vec3(0.00200000009499490261077880859375))
        / fma(
            source_color,
            scaled_color + vec3(0.300000011920928955078125),
            vec3(0.060000002384185791015625)))
       - vec3(0.0333333313465118408203125))
          * vec3(2.492836475372314453125),
      1.0);
}