#ifndef SRC_MINATHEHOLLOWER_SHARED_H_
#define SRC_MINATHEHOLLOWER_SHARED_H_

#define MINA_FILTER_NONE        0
#define MINA_FILTER_LCD_GRID_V2 1
#define MINA_FILTER_CRT_NEWPIXIE 2
#define MINA_FILTER_MODE        shader_injection.filter_mode

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float filter_mode;
};

#ifndef __cplusplus
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer injectedBuffer : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer injectedBuffer : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}

#if (__SHADER_TARGET_MAJOR >= 6)
#pragma dxc diagnostic ignored "-Wparentheses-equality"
#endif

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_MINATHEHOLLOWER_SHARED_H_
