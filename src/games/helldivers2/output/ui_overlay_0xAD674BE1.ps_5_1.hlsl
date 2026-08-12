#include "../shared.h"

cbuffer cb0_buf : register(b0)
{
    uint4 cb0_m[49] : packoffset(c0);
};

cbuffer cb1_buf : register(b1)
{
    uint4 cb1_m0 : packoffset(c0);
    uint4 cb1_m1 : packoffset(c1);
    uint4 cb1_m2 : packoffset(c2);
    uint4 cb1_m3 : packoffset(c3);
    float4 cb1_m4 : packoffset(c4);
};

cbuffer cb2_buf : register(b2)
{
    float2 cb2_m0 : packoffset(c0);
    float2 cb2_m1 : packoffset(c0.z);
    float4 cb2_m2 : packoffset(c1);
    float2 cb2_m3 : packoffset(c2);
    float2 cb2_m4 : packoffset(c2.z);
    float4 cb2_m5 : packoffset(c3);
    uint4 cb2_m6 : packoffset(c4);
    uint4 cb2_m7 : packoffset(c5);
    uint4 cb2_m8 : packoffset(c6);
    uint4 cb2_m9 : packoffset(c7);
    float2 cb2_m10 : packoffset(c8);
    float2 cb2_m11 : packoffset(c8.z);
    float4 cb2_m12 : packoffset(c9);
};

SamplerState s0 : register(s0);
Texture2D<float4> t0 : register(t0);

static float4 gl_FragCoord;
static float4 COLOR;
static float4 SV_TARGET;

struct SPIRV_Cross_Input
{
    float4 SV_POSITION : SV_Position0;
    float4 COLOR : COLOR0;
};

struct SPIRV_Cross_Output
{
    float4 SV_TARGET : SV_Target0;
};

float dp2_f32(float2 a, float2 b)
{
    precise float _105 = a.x * b.x;
    return mad(a.y, b.y, _105);
}

uint cvt_f32_u32(float v)
{
    return (v > 4294967040.0f) ? 4294967295u : uint(max(v, 0.0f));
}

float dp3_f32(float3 a, float3 b)
{
    precise float _81 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _81));
}

void frag_main()
{
    float _125 = gl_FragCoord.x / asfloat(cb0_m[48u].x);
    float _126 = gl_FragCoord.y / asfloat(cb0_m[48u].y);
    bool _131 = cb2_m1.x < 0.0f;
    float _139 = asfloat(cb0_m[45u].y) / asfloat(cb0_m[45u].x);
    float _144 = mad(_125, 2.0f, -1.0f);
    float _145 = mad(_126, 2.0f, -1.0f);
    float _176 = _131 ? (((_144 / mad(abs(_145 * _145), _139 * cb1_m4.y, mad(-_139, cb1_m4.y, 1.0f))) + 1.0f) * 0.5f) : (-(cb2_m3.x / cb2_m4.x));
    float _177 = _131 ? (((_145 / mad(abs(_144 * _144), cb1_m4.z, 1.0f - cb1_m4.z)) + 1.0f) * 0.5f) : (-(cb2_m3.y / cb2_m4.y));
    float _182 = abs(cb2_m0.x);
    float _183 = abs(cb2_m0.y);
    float _190 = abs(cb2_m1.x);
    float _191 = abs(cb2_m1.y);
    float2 _194 = float2((_182 - _176) / _190, (_183 - _177) / _191);
    bool _200 = cb2_m2.x > 1.5f;
    if (_131 && ((((((_177 < _183) || ((_182 > _176) || (_190 < _176))) || (_177 > _191)) && (cb2_m2.x > 0.5f)) && (!_200)) || ((sqrt(dp2_f32(_194, _194)) >= 1.0f) && _200)))
    {
        discard;
    }
    float4 _222 = t0.Sample(s0, float2(_125, _126));
    float _223 = _222.x;
    float _224 = _222.y;
    float _225 = _222.z;
    float _237 = (float(cvt_f32_u32(gl_FragCoord.y)) * 0.271002709865570068359375f) + (float(cvt_f32_u32(gl_FragCoord.x) + cvt_f32_u32(asfloat(cb0_m[44u].y))) * 1.61803400516510009765625f);
    float _239 = _237 - floor(_237);
    float _243 = floor(_223 * 255.0f);
    float _244 = floor(_224 * 255.0f);
    float _245 = floor(_225 * 255.0f);
    float _249 = mad(_243, 0.0039215688593685626983642578125f, 0.0039215688593685626983642578125f);
    float _250 = mad(_244, 0.0039215688593685626983642578125f, 0.0039215688593685626983642578125f);
    float _251 = mad(_245, 0.0039215688593685626983642578125f, 0.0039215688593685626983642578125f);
    float _253 = mad(_243, 0.0039215688593685626983642578125f, -_249);
    float _255 = mad(_244, 0.0039215688593685626983642578125f, -_250);
    float _257 = mad(_245, 0.0039215688593685626983642578125f, -_251);
    float _264 = asfloat(2129764351u - asuint(_253));
    float _265 = asfloat(2129764351u - asuint(_255));
    float _266 = asfloat(2129764351u - asuint(_257));
    float _294 = clamp((clamp(mad(_264 * mad(-_253, _264, 2.0f), _249 - _223, _239) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.0039215688593685626983642578125f) + (_243 * 0.0039215688593685626983642578125f), 0.0f, 1.0f);
    float _295 = clamp((clamp(mad(_250 - _224, _265 * mad(-_265, _255, 2.0f), _239) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.0039215688593685626983642578125f) + (_244 * 0.0039215688593685626983642578125f), 0.0f, 1.0f);
    float _296 = clamp((clamp(mad(_251 - _225, _266 * mad(-_266, _257, 2.0f), _239) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.0039215688593685626983642578125f) + (_245 * 0.0039215688593685626983642578125f), 0.0f, 1.0f);
    float _298 = dp3_f32(float3(_294, _295, _296), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
    float _304 = 1.0f - (cb2_m5.y * UNDER_UI_DESATURATION);
    SV_TARGET.x = mad(_294 - _298, _304, _298) * COLOR.x;
    SV_TARGET.y = mad(_295 - _298, _304, _298) * COLOR.y;
    SV_TARGET.z = mad(_296 - _298, _304, _298) * COLOR.z;
    float _346 = asfloat(cb0_m[48u].y) - gl_FragCoord.y;
    SV_TARGET.w = ((((cb2_m12.z == (-1.0f)) && (cb2_m12.x == (-1.0f))) && ((cb2_m12.w == (-1.0f)) && (cb2_m12.y == (-1.0f)))) || (((cb2_m12.z == 0.0f) && (cb2_m12.x == 0.0f)) && ((cb2_m12.w == 0.0f) && (cb2_m12.y == 0.0f)))) ? COLOR.w : (min(min(1.0f - clamp((_346 + (cb2_m12.w - cb2_m11.y)) / max(cb2_m12.w, 9.9999997473787516355514526367188e-05f), 0.0f, 1.0f), clamp((_346 - cb2_m10.y) / max(cb2_m12.y, 9.9999997473787516355514526367188e-05f), 0.0f, 1.0f)), min(clamp((gl_FragCoord.x - cb2_m10.x) / max(cb2_m12.x, 9.9999997473787516355514526367188e-05f), 0.0f, 1.0f), 1.0f - clamp((gl_FragCoord.x + (cb2_m12.z - cb2_m11.x)) / max(cb2_m12.z, 9.9999997473787516355514526367188e-05f), 0.0f, 1.0f))) * COLOR.w);
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.SV_POSITION;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    COLOR = stage_input.COLOR;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.SV_TARGET = SV_TARGET;
    return stage_output;
}
