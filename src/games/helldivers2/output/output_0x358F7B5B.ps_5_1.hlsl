#include "./output.hlsl"

cbuffer cb0_buf : register(b0)
{
    uint4 cb0_m[46] : packoffset(c0);
};

cbuffer cb1_buf : register(b1)
{
    uint2 cb1_m0 : packoffset(c0);
    float2 cb1_m1 : packoffset(c0.z);
    float4 cb1_m2 : packoffset(c1);
    uint4 cb1_m3 : packoffset(c2);
    uint4 cb1_m4 : packoffset(c3);
    float4 cb1_m5 : packoffset(c4);
    float2 cb1_m6 : packoffset(c5);
    float2 cb1_m7 : packoffset(c5.z);
    float2 cb1_m8 : packoffset(c6);
    float2 cb1_m9 : packoffset(c6.z);
    float4 cb1_m10 : packoffset(c7);
    float4 cb1_m11 : packoffset(c8);
};

SamplerState s0 : register(s0);
SamplerState s1 : register(s1);
Texture2D<float4> t0 : register(t0);
Texture2DMS<float4> t1 : register(t1);

static float2 TEXCOORD;
static float4 SV_TARGET;

struct SPIRV_Cross_Input
{
    float4 SV_POSITION : SV_Position0;
    float2 TEXCOORD : TEXCOORD0;
};

struct SPIRV_Cross_Output
{
    float4 SV_TARGET : SV_Target0;
};

uint2 spvTextureSize(Texture2DMS<float4> Tex, uint Level, out uint Param)
{
    uint2 ret;
    Tex.GetDimensions(ret.x, ret.y, Param);
    return ret;
}

float dp2_f32(float2 a, float2 b)
{
    precise float _173 = a.x * b.x;
    return mad(a.y, b.y, _173);
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

float dp3_f32(float3 a, float3 b)
{
    precise float _148 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _148));
}

uint cvt_f32_u32(float v)
{
    return (v > 4294967040.0f) ? 4294967295u : uint(max(v, 0.0f));
}

void frag_main()
{
    float _189 = (cb1_m2.w > 0.5f) ? (1.0f - TEXCOORD.x) : TEXCOORD.x;
    float4 _197 = t0.Sample(s1, float2(_189, TEXCOORD.y));

    float3 game_color = _197.xyz;

    float _198 = _197.x;
    float _199 = _197.y;
    float _200 = _197.z;
    float _205 = max(cb1_m5.y, cb1_m5.x);
    float _297;
    float _298;
    float _299;
    float _300;
    float _301;
    if (_205 > 0.0f)
    {
        float _218 = (asfloat(cb0_m[43u].w) * cb1_m10.y) * 3.1415927410125732421875f;
        float _223 = cb1_m5.y * cb1_m10.x;
        float2 _230 = float2(_189 - 0.5f, TEXCOORD.y - 0.5f);
        float _239 = mad(sqrt(min(sqrt(dp2_f32(_230, _230)) * 1.41421353816986083984375f, 1.0f)) - 1.0f, cb1_m10.z, 1.0f);
        float _242 = _205 * mad(1.0f - _239, cb1_m5.x, _239);
        float _254 = mad(cb1_m6.x - cb1_m8.x, cb1_m5.x, cb1_m8.x);
        float _256 = mad(_223, cos(_218) - 1.0f, 1.0f) * _254;
        float _257 = _254 * mad(_223, sin(_218) - 0.0f, 0.0f);
        float4 _265 = t0.Sample(s0, float2(mad(_242 * _256, 0.5f, _189), mad(_242 * _257, 0.5f, TEXCOORD.y)));
        float4 _274 = t0.Sample(s0, float2(mad(_242, _256, _189), mad(_242, _257, TEXCOORD.y)));
        float _279 = _242 * mad(cb1_m6.y - cb1_m8.y, cb1_m5.x, cb1_m8.y);
        float _280 = _279 * 0.5f;
        float _285 = mad(_279, _265.x - _198, _198);
        float _286 = mad(_265.y - _199, _279, _199);
        float _287 = mad(_265.z - _200, _279, _200);
        float _288 = mad(_279, _265.w - 1.0f, 1.0f);
        _297 = mad(_280, _274.z - _287, _287);
        _298 = mad(_280, _274.y - _286, _286);
        _299 = mad(_280, _274.x - _285, _285);
        _300 = mad(_280, _274.w - _288, _288);
        _301 = _242;
    }
    else
    {
        _297 = _200;
        _298 = _199;
        _299 = _198;
        _300 = 1.0f;
        _301 = _205;
    }
    float _312 = asfloat(cb0_m[44u].x);

    SV_TARGET.w = (_301 > 0.0f) ? (mad(-exp2(-(mad(cb1_m7.x - cb1_m9.x, cb1_m5.x, cb1_m9.x) * _312)), _301, 1.0f) * _300) : _300;
    uint _323;
    spvTextureSize(t1, 0u, _323);
    float _330 = TEXCOORD.y * cb1_m11.y;
    float _341 = ceil(mad(floor(_330), cb1_m11.x, ceil(mad(cb1_m11.x, _189, frac(sin(ceil(_330) * 9668.8896484375f))))));
    float _356 = (cb1_m10.w > 0.0f) ? ((clamp(ceil(cb1_m10.w - frac(sin((_312 * 0.00999999977648258209228515625f) * _341) * 10010.0f)), 0.0f, 1.0f) * (frac(sin(_341 * 1225.0f) * 1265.0f) - 0.5f)) * 0.0500000007450580596923828125f) : 0.0f;
    int _367 = cvt_f32_i32(frac(_356 + _189) * cb1_m1.x);
    int _368 = cvt_f32_i32(cb1_m1.y * frac(TEXCOORD.y + _356));
    float _370;
    float _373;
    float _375;
    float _377;
    _370 = 0.0f;
    _373 = 0.0f;
    _375 = 0.0f;
    _377 = 0.0f;
    float _371;
    float _374;
    float _376;
    float _378;
    uint _380;
    uint _379 = 0u;
    for (;;)
    {
        if (_323 <= _379)
        {
            break;
        }
        float4 _389 = t1.Load(uint2(uint(_367), uint(_368)), _379);
        float _390 = _389.x;
        float _391 = _389.y;
        float _392 = _389.z;
        _378 = _377 + ((_390 <= 0.040449999272823333740234375f) ? (_390 * 0.077399380505084991455078125f) : exp2(log2((_390 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f));
        _376 = _375 + ((_391 <= 0.040449999272823333740234375f) ? (_391 * 0.077399380505084991455078125f) : exp2(log2((_391 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f));
        _374 = _373 + ((_392 <= 0.040449999272823333740234375f) ? (_392 * 0.077399380505084991455078125f) : exp2(log2((_392 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f));
        _371 = _389.w + _370;
        _380 = _379 + 1u;
        _370 = _371;
        _373 = _374;
        _375 = _376;
        _377 = _378;
        _379 = _380;
        continue;
    }
    float _419 = 1.0f / float(_323);
#if 1
   
    if (RENODX_TONE_MAP_TYPE != 0.f) {
      float4 ui_color = float4(_378, _376, _374, _371) * _419;

      HandleUICompositing(ui_color, game_color, SV_TARGET, TEXCOORD, t0, s1);
      return;
    }
#endif

    float _423 = _419 * _370;
    float _433 = exp2(log2(abs(_299)) * 0.0126833133399486541748046875f);
    float _434 = exp2(log2(abs(_298)) * 0.0126833133399486541748046875f);
    float _435 = exp2(log2(abs(_297)) * 0.0126833133399486541748046875f);
    float3 _460 = float3(exp2(log2(abs((0.8359375f - _433) / mad(_433, 18.6875f, -18.8515625f))) * 6.277394771575927734375f) * 10000.0f, exp2(log2(abs((0.8359375f - _434) / mad(_434, 18.6875f, -18.8515625f))) * 6.277394771575927734375f) * 10000.0f, exp2(log2(abs((0.8359375f - _435) / mad(_435, 18.6875f, -18.8515625f))) * 6.277394771575927734375f) * 10000.0f);
    float _461 = dp3_f32(float3(1.6350400447845458984375f, -0.605629980564117431640625f, -0.0763500034809112548828125f), _460);
    float _462 = dp3_f32(float3(-0.123250000178813934326171875f, 1.1388499736785888671875f, -0.010289999656379222869873046875f), _460);
    float _463 = dp3_f32(float3(-0.01716000027954578399658203125f, -0.101729996502399444580078125f, 1.21072995662689208984375f), _460);
    bool _469 = _423 > 0.0f;
    float _470 = cb1_m11.w * 1.75f;
    float _471 = cb1_m11.w * 3.0625f;
    float _472 = min(_461, _470);
    float _473 = min(_462, _470);
    float _474 = min(_463, _470);
    float _484 = sqrt(_423);
    float _494 = _469 ? mad(_484, mad(_472, mad(cb1_m11.w, 3.5f, -_472) / _471, -_461), _461) : _461;
    float _495 = _469 ? mad(_484, mad(mad(cb1_m11.w, 3.5f, -_473) / _471, _473, -_462), _462) : _462;
    float _496 = _469 ? mad(_484, mad(mad(cb1_m11.w, 3.5f, -_474) / _471, _474, -_463), _463) : _463;
    float _531 = mad(-_419, _370, 1.0f);
    float _532 = mad(sqrt(abs(_494)) * float(int(((_494 < 0.0f) ? 4294967295u : 0u) + uint(_494 > 0.0f))), _531, sqrt(cb1_m11.w * (_419 * _377)));
    float _533 = mad(_531, float(int(uint(_495 > 0.0f) + ((_495 < 0.0f) ? 4294967295u : 0u))) * sqrt(abs(_495)), sqrt(cb1_m11.w * (_419 * _375)));
    float _534 = mad(_531, float(int(uint(_496 > 0.0f) + ((_496 < 0.0f) ? 4294967295u : 0u))) * sqrt(abs(_496)), sqrt(cb1_m11.w * (_419 * _373)));
    float3 _562 = float3((_532 * _532) * float(int(((_532 < 0.0f) ? 4294967295u : 0u) + uint(_532 > 0.0f))), float(int(uint(_533 > 0.0f) + ((_533 < 0.0f) ? 4294967295u : 0u))) * (_533 * _533), float(int(uint(_534 > 0.0f) + ((_534 < 0.0f) ? 4294967295u : 0u))) * (_534 * _534));
    float _570 = exp2(log2(abs(dp3_f32(float3(0.6379201412200927734375f, 0.3430949747562408447265625f, 0.043147623538970947265625f), _562) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _580 = exp2(log2(abs(dp3_f32(float3(0.069171488285064697265625f, 0.915945351123809814453125f, 0.0121505893766880035400390625f), _562) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _590 = exp2(log2(abs(dp3_f32(float3(0.01485129259526729583740234375f, 0.08182524144649505615234375f, 0.827577292919158935546875f), _562) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _600 = max(exp2(1.0f - cb1_m2.z), 0.001000000047497451305389404296875f);
    float _604 = exp2((log2(mad(_570, 18.8515625f, 0.8359375f) / mad(_570, 18.6875f, 1.0f)) * 78.84375f) * _600);
    float _605 = exp2((log2(mad(_580, 18.8515625f, 0.8359375f) / mad(_580, 18.6875f, 1.0f)) * 78.84375f) * _600);
    float _606 = exp2((log2(mad(_590, 18.8515625f, 0.8359375f) / mad(_590, 18.6875f, 1.0f)) * 78.84375f) * _600);
    float _627 = (float(cvt_f32_u32(TEXCOORD.y * asfloat(cb0_m[45u].y))) * 0.271002709865570068359375f) + (float(cvt_f32_u32(asfloat(cb0_m[45u].x) * _189) + cvt_f32_u32(asfloat(cb0_m[44u].y))) * 1.61803400516510009765625f);
    float _629 = _627 - floor(_627);
    float _633 = floor(_604 * 1023.0f);
    float _634 = floor(_605 * 1023.0f);
    float _635 = floor(_606 * 1023.0f);
    float _639 = mad(_633, 0.000977517105638980865478515625f, 0.000977517105638980865478515625f);
    float _640 = mad(_634, 0.000977517105638980865478515625f, 0.000977517105638980865478515625f);
    float _641 = mad(_635, 0.000977517105638980865478515625f, 0.000977517105638980865478515625f);
    float _643 = mad(_633, 0.000977517105638980865478515625f, -_639);
    float _645 = mad(_634, 0.000977517105638980865478515625f, -_640);
    float _647 = mad(_635, 0.000977517105638980865478515625f, -_641);
    float _654 = asfloat(2129764351u - asuint(_643));
    float _655 = asfloat(2129764351u - asuint(_645));
    float _656 = asfloat(2129764351u - asuint(_647));
    SV_TARGET.x = min((_633 * 0.000977517105638980865478515625f) + (clamp(mad(mad(-_643, _654, 2.0f) * _654, _639 - _604, _629) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.000977517105638980865478515625f), 1.0f);
    SV_TARGET.y = min((clamp(mad(_640 - _605, mad(-_645, _655, 2.0f) * _655, _629) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.000977517105638980865478515625f) + (_634 * 0.000977517105638980865478515625f), 1.0f);
    SV_TARGET.z = min((clamp(mad(_641 - _606, mad(-_647, _656, 2.0f) * _656, _629) * asfloat(0x7f800000u /* inf */), 0.0f, 1.0f) * 0.000977517105638980865478515625f) + (_635 * 0.000977517105638980865478515625f), 1.0f);
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    TEXCOORD = stage_input.TEXCOORD;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.SV_TARGET = SV_TARGET;
    return stage_output;
}
