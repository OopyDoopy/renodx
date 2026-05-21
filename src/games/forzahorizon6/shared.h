#ifndef SRC_FORZAHORIZON6_SHARED_H_
#define SRC_FORZAHORIZON6_SHARED_H_

// RENODX_PERMUTATIONS shader=ColourGradeHDRComposite_0x2FE5A0BE macro=TONE_MAP_TYPE
#define VANILLA_SDR_HDR      0  // label="Vanilla"
#define VANILLA_PLUS         1  // label="Vanilla+"
#define FULL_CUSTOM          2  // label="Custom"

#ifndef __cplusplus
#if (__SHADER_TARGET_MAJOR >= 6)
#pragma dxc diagnostic ignored "-Wparentheses-equality"
#endif

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_FORZAHORIZON6_SHARED_H_
