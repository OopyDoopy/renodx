#include "../common.hlsl"

struct _248
{
    uint2 _m0;
    uint _m1;
};

static const float2 _185[7] = { float2(-4.0f, -0.718548238277435302734375f), float2(-4.0f, 2.0810306072235107421875f), float2(-3.1573765277862548828125f, 3.66812419891357421875f), float2(-0.485249996185302734375f, 4.0f), float2(1.84773242473602294921875f, 4.0f), float2(1.84773242473602294921875f, 4.0f), 0.0f.xx };

cbuffer cb0_buf : register(b0)
{
    float4 cb0_m[4096] : packoffset(c0);
};

cbuffer cb1_buf : register(b1)
{
    float3 cb1_m0 : packoffset(c0);
    uint cb1_m1 : packoffset(c0.w);
    float4 cb1_m2 : packoffset(c1);
};

RWTexture2D<float4> u0 : register(u0);

static uint3 gl_LocalInvocationID;
static uint3 gl_GlobalInvocationID;
struct SPIRV_Cross_Input
{
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

uint2 spvImageSize(RWTexture2D<float4> Tex, out uint Param)
{
    uint2 ret;
    Tex.GetDimensions(ret.x, ret.y);
    Param = 0u;
    return ret;
}

uint spvBitfieldInsert(uint Base, uint Insert, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : (((1u << Count) - 1) << (Offset & 31));
    return (Base & ~Mask) | ((Insert << Offset) & Mask);
}

uint2 spvBitfieldInsert(uint2 Base, uint2 Insert, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : (((1u << Count) - 1) << (Offset & 31));
    return (Base & ~Mask) | ((Insert << Offset) & Mask);
}

uint3 spvBitfieldInsert(uint3 Base, uint3 Insert, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : (((1u << Count) - 1) << (Offset & 31));
    return (Base & ~Mask) | ((Insert << Offset) & Mask);
}

uint4 spvBitfieldInsert(uint4 Base, uint4 Insert, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : (((1u << Count) - 1) << (Offset & 31));
    return (Base & ~Mask) | ((Insert << Offset) & Mask);
}

uint spvBitfieldUExtract(uint Base, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : ((1 << Count) - 1);
    return (Base >> Offset) & Mask;
}

uint2 spvBitfieldUExtract(uint2 Base, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : ((1 << Count) - 1);
    return (Base >> Offset) & Mask;
}

uint3 spvBitfieldUExtract(uint3 Base, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : ((1 << Count) - 1);
    return (Base >> Offset) & Mask;
}

uint4 spvBitfieldUExtract(uint4 Base, uint Offset, uint Count)
{
    uint Mask = Count == 32 ? 0xffffffff : ((1 << Count) - 1);
    return (Base >> Offset) & Mask;
}

int spvBitfieldSExtract(int Base, int Offset, int Count)
{
    int Mask = Count == 32 ? -1 : ((1 << Count) - 1);
    int Masked = (Base >> Offset) & Mask;
    int ExtendShift = (32 - Count) & 31;
    return (Masked << ExtendShift) >> ExtendShift;
}

int2 spvBitfieldSExtract(int2 Base, int Offset, int Count)
{
    int Mask = Count == 32 ? -1 : ((1 << Count) - 1);
    int2 Masked = (Base >> Offset) & Mask;
    int ExtendShift = (32 - Count) & 31;
    return (Masked << ExtendShift) >> ExtendShift;
}

int3 spvBitfieldSExtract(int3 Base, int Offset, int Count)
{
    int Mask = Count == 32 ? -1 : ((1 << Count) - 1);
    int3 Masked = (Base >> Offset) & Mask;
    int ExtendShift = (32 - Count) & 31;
    return (Masked << ExtendShift) >> ExtendShift;
}

int4 spvBitfieldSExtract(int4 Base, int Offset, int Count)
{
    int Mask = Count == 32 ? -1 : ((1 << Count) - 1);
    int4 Masked = (Base >> Offset) & Mask;
    int ExtendShift = (32 - Count) & 31;
    return (Masked << ExtendShift) >> ExtendShift;
}

float dp2_f32(float2 a, float2 b)
{
    precise float _239 = a.x * b.x;
    return mad(a.y, b.y, _239);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _224 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _224));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _247_dummy_parameter;
    _248 _249 = { spvImageSize(u0, _247_dummy_parameter), 1u };
    uint _264 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _268 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_264, 1u, 3u);
    uint _269 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _264, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    if ((_249._m0.x < _268) || (_249._m0.y < _269))
    {
        return;
    }
    uint2 _283 = uint2(_268, _269);
    float4 _284 = u0[_283];
    float _285 = _284.x;
    float _286 = _284.y;
    float _287 = _284.z;
    float2 _290 = float2(((float(_268) + 0.5f) / float(_249._m0.x)) - 0.5f, ((float(_269) + 0.5f) / float(_249._m0.y)) - 0.5f);
    float _303 = clamp(-((1.0f / cb1_m2.y) * (sqrt(dp2_f32(_290, _290)) - cb1_m2.x)), 0.0f, 1.0f);
    float _304 = mad(_303, -2.0f, 3.0f);
    float _305 = _303 * _303;
    float _306 = _304 * _305;
    float _308 = mad(-_304, _305, 1.0f);
    float _328 = cb1_m2.z * cb1_m2.w;
    float3 _335 = float3(mad(_328, ((_308 * cb1_m0.x) + (_285 * _306)) - _285, _285), mad(_328, ((_286 * _306) + (_308 * cb1_m0.y)) - _286, _286), mad(_328, ((_287 * _306) + (_308 * cb1_m0.z)) - _287, _287));
    #if 1
    helldivers2::tonemap::ACESParameters aces_parameters = {
        {
            0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f,
            0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f,
        },
        1.f, 1.f, 1.f, 1.f, 1.f, 0.f, 0.f, 1.f, 100.f,
    };
    [unroll]
    for (uint i = 0u; i < 20u; i++) {
        aces_parameters.coefficients[i] = cb0_m[i].x;
    }
    aces_parameters.low_input = cb0_m[19u].y;
    aces_parameters.low_output = cb0_m[19u].z;
    aces_parameters.middle_input = cb0_m[20u].x;
    aces_parameters.high_input = cb0_m[20u].z;
    aces_parameters.high_output = cb0_m[20u].w;
    aces_parameters.low_slope = cb0_m[21u].x;
    aces_parameters.high_slope = cb0_m[21u].y;
    aces_parameters.target_peak_nits = RENODX_PEAK_WHITE_NITS;
    aces_parameters.diffuse_white_nits = RENODX_DIFFUSE_WHITE_NITS;

    if (RENODX_TONE_MAP_TYPE != 0.f) {

        float3 scene_color = _335;
        float3 output_color = CustomTonemap(scene_color, aces_parameters);
        u0[_283] = float4(output_color, 1.f);

        return;
    }
    #endif
    float _342 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _335) * 2.5f, 65504.0f);
    float _343 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _335) * 2.5f, 65504.0f);
    float _344 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _335) * 2.5f, 65504.0f);
    float _348 = max(max(_343, _342), _344);
    float _353 = (max(_348, 9.9999997473787516355514526367188e-05f) - max(min(min(_343, _342), _344), 9.9999997473787516355514526367188e-05f)) / max(_348, 0.00999999977648258209228515625f);
    float _364 = mad(sqrt(mad(_342, _342 - _344, ((_344 - _343) * _344) + (_343 * (_343 - _342)))), 1.75f, (_343 + _344) + _342);
    float _365 = _353 - 0.4000000059604644775390625f;
    float _370 = max(1.0f - abs(_365 * 2.5f), 0.0f);
    float _377 = mad(mad(clamp(mad(_365, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_370, _370, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _385 = ((_364 <= 0.1599999964237213134765625f) ? _377 : ((_364 >= 0.4799999892711639404296875f) ? 0.0f : (_377 * ((0.07999999821186065673828125f / (_364 * 0.3333333432674407958984375f)) - 0.5f)))) + 1.0f;
    float _386 = _385 * _342;
    float _387 = _385 * _343;
    float _388 = _385 * _344;
    float _393 = (_387 - _388) * 1.73205077648162841796875f;
    float _395 = (_386 * 2.0f) - _387;
    float _397 = mad(-_385, _344, _395);
    float _398 = abs(_397);
    float _399 = abs(_393);
    float _403 = min(_398, _399) * (1.0f / max(_398, _399));
    float _404 = _403 * _403;
    float _408 = mad(_404, mad(_404, mad(_404, mad(_404, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _418 = mad(_403, _408, (_398 < _399) ? mad(_403 * _408, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_397 < mad(_385, _344, -_395)) ? (-3.1415927410125732421875f) : 0.0f);
    float _419 = min(_393, _397);
    float _420 = max(_393, _397);
    float _429 = ((_386 == _387) && (_388 == _387)) ? 0.0f : ((((_419 < (-_419)) && (_420 >= (-_420))) ? (-_418) : _418) * 57.295780181884765625f);
    float _432 = (_429 < 0.0f) ? (_429 + 360.0f) : _429;
    float _442 = max(1.0f - abs(((_432 < (-180.0f)) ? (_432 + 360.0f) : ((_432 > 180.0f) ? (_432 - 360.0f) : _432)) * 0.01481481455266475677490234375f), 0.0f);
    float _445 = mad(_442, -2.0f, 3.0f) * (_442 * _442);
    float3 _456 = float3(clamp(_386 + (((_353 * (_445 * _445)) * mad(-_385, _342, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_387, 0.0f, 65504.0f), clamp(_388, 0.0f, 65504.0f));
    float _460 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _456), 0.0f, 65504.0f);
    float _461 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _456), 0.0f, 65504.0f);
    float _462 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _456), 0.0f, 65504.0f);
    float _464 = dp3_f32(float3(_460, _461, _462), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _468 = mad(_460 - _464, 0.959999978542327880859375f, _464);
    float _469 = mad(_461 - _464, 0.959999978542327880859375f, _464);
    float _470 = mad(_462 - _464, 0.959999978542327880859375f, _464);
    float _477 = (_468 <= 0.0f) ? (-14.0f) : log2(_468);
    float _478 = (_469 <= 0.0f) ? (-14.0f) : log2(_469);
    float _479 = (_470 <= 0.0f) ? (-14.0f) : log2(_470);
    float _563;
    if (_477 <= (-17.4739322662353515625f))
    {
        _563 = -4.0f;
    }
    else
    {
        float _562;
        if (_477 < (-2.4739310741424560546875f))
        {
            float _490 = mad(_477, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _491 = _490 * 0.6643855571746826171875f;
            int _492 = cvt_f32_i32(_491);
            float _495 = mad(_490, 0.6643855571746826171875f, -trunc(_491));
            uint _502 = min(uint(_492), 6u);
            uint _509 = min(uint(_492 + 1), 6u);
            uint _513 = min(uint(_492 + 2), 6u);
            float2 _519 = float2(_185[_502].x, _185[_509].x);
            _562 = dp3_f32(float3(_495 * _495, _495, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_502].x, _185[_509].x, _185[_513].x)), dp2_f32(float2(-1.0f, 1.0f), _519), dp2_f32(0.5f.xx, _519)));
        }
        else
        {
            float _561;
            if (_477 < 15.52606868743896484375f)
            {
                float _529 = mad(_477, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _530 = _529 * 0.55365467071533203125f;
                int _531 = cvt_f32_i32(_530);
                float _534 = mad(_529, 0.55365467071533203125f, -trunc(_530));
                uint _541 = min(uint(_531), 6u);
                uint _545 = min(uint(_531 + 1), 6u);
                uint _549 = min(uint(_531 + 2), 6u);
                float2 _555 = float2(_185[_541].y, _185[_545].y);
                _561 = dp3_f32(float3(_534 * _534, _534, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_541].y, _185[_545].y, _185[_549].y)), dp2_f32(float2(-1.0f, 1.0f), _555), dp2_f32(0.5f.xx, _555)));
            }
            else
            {
                _561 = 4.0f;
            }
            _562 = _561;
        }
        _563 = _562;
    }
    float _643;
    if (_478 <= (-17.4739322662353515625f))
    {
        _643 = -4.0f;
    }
    else
    {
        float _642;
        if (_478 < (-2.4739310741424560546875f))
        {
            float _573 = mad(_478, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _574 = _573 * 0.6643855571746826171875f;
            int _575 = cvt_f32_i32(_574);
            float _578 = mad(_573, 0.6643855571746826171875f, -trunc(_574));
            uint _585 = min(uint(_575), 6u);
            uint _589 = min(uint(_575 + 1), 6u);
            uint _593 = min(uint(_575 + 2), 6u);
            float2 _599 = float2(_185[_585].x, _185[_589].x);
            _642 = dp3_f32(float3(_578 * _578, _578, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_585].x, _185[_589].x, _185[_593].x)), dp2_f32(float2(-1.0f, 1.0f), _599), dp2_f32(0.5f.xx, _599)));
        }
        else
        {
            float _641;
            if (_478 < 15.52606868743896484375f)
            {
                float _609 = mad(_478, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _610 = _609 * 0.55365467071533203125f;
                int _611 = cvt_f32_i32(_610);
                float _614 = mad(_609, 0.55365467071533203125f, -trunc(_610));
                uint _621 = min(uint(_611), 6u);
                uint _625 = min(uint(_611 + 1), 6u);
                uint _629 = min(uint(_611 + 2), 6u);
                float2 _635 = float2(_185[_621].y, _185[_625].y);
                _641 = dp3_f32(float3(_614 * _614, _614, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_621].y, _185[_625].y, _185[_629].y)), dp2_f32(float2(-1.0f, 1.0f), _635), dp2_f32(0.5f.xx, _635)));
            }
            else
            {
                _641 = 4.0f;
            }
            _642 = _641;
        }
        _643 = _642;
    }
    float _723;
    if (_479 <= (-17.4739322662353515625f))
    {
        _723 = -4.0f;
    }
    else
    {
        float _722;
        if (_479 < (-2.4739310741424560546875f))
        {
            float _653 = mad(_479, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _654 = _653 * 0.6643855571746826171875f;
            int _655 = cvt_f32_i32(_654);
            float _658 = mad(_653, 0.6643855571746826171875f, -trunc(_654));
            uint _665 = min(uint(_655), 6u);
            uint _669 = min(uint(_655 + 1), 6u);
            uint _673 = min(uint(_655 + 2), 6u);
            float2 _679 = float2(_185[_665].x, _185[_669].x);
            _722 = dp3_f32(float3(_658 * _658, _658, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_665].x, _185[_669].x, _185[_673].x)), dp2_f32(float2(-1.0f, 1.0f), _679), dp2_f32(0.5f.xx, _679)));
        }
        else
        {
            float _721;
            if (_479 < 15.52606868743896484375f)
            {
                float _689 = mad(_479, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _690 = _689 * 0.55365467071533203125f;
                int _691 = cvt_f32_i32(_690);
                float _694 = mad(_689, 0.55365467071533203125f, -trunc(_690));
                uint _701 = min(uint(_691), 6u);
                uint _705 = min(uint(_691 + 1), 6u);
                uint _709 = min(uint(_691 + 2), 6u);
                float2 _715 = float2(_185[_701].y, _185[_705].y);
                _721 = dp3_f32(float3(_694 * _694, _694, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_185[_701].y, _185[_705].y, _185[_709].y)), dp2_f32(float2(-1.0f, 1.0f), _715), dp2_f32(0.5f.xx, _715)));
            }
            else
            {
                _721 = 4.0f;
            }
            _722 = _721;
        }
        _723 = _722;
    }
    float3 _726 = float3(exp2(_563 * 3.3219280242919921875f), exp2(_643 * 3.3219280242919921875f), exp2(_723 * 3.3219280242919921875f));
    float3 _730 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _726), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _726), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _726));
    float _731 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _730);
    float _732 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _730);
    float _733 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _730);
    float _737 = (_731 <= 0.0f) ? (-4.0f) : (log2(_731) * 0.3010300099849700927734375f);
    float _741 = log2(cb0_m[19u].y);
    float _742 = _741 * 0.3010300099849700927734375f;
    float _850;
    if (_742 >= _737)
    {
        _850 = mad(cb0_m[21u].x, _737, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_742 * cb0_m[21u].x));
    }
    else
    {
        float _759 = log2(cb0_m[20u].x);
        float _760 = _759 * 0.3010300099849700927734375f;
        float _849;
        if ((_742 < _737) && (_760 > _737))
        {
            float _769 = (mad(_741, -0.3010300099849700927734375f, _737) * 7.0f) / (_760 - _742);
            int _770 = cvt_f32_i32(_769);
            float _772 = _769 - trunc(_769);
            uint _774 = uint(_770 + 1);
            uint _776 = uint(_770 + 2);
            uint _778 = uint(_770);
            float2 _790 = float2(cb0_m[_778].x, cb0_m[_774].x);
            _849 = dp3_f32(float3(_772 * _772, _772, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_778].x, cb0_m[_774].x, cb0_m[_776].x)), dp2_f32(float2(-1.0f, 1.0f), _790), dp2_f32(0.5f.xx, _790)));
        }
        else
        {
            float _800 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _848;
            if ((_760 <= _737) && (_800 > _737))
            {
                float _809 = (mad(_759, -0.3010300099849700927734375f, _737) * 7.0f) / (_800 - _760);
                int _810 = cvt_f32_i32(_809);
                float _812 = _809 - trunc(_809);
                uint _817 = uint(_810 + 10);
                uint _822 = uint((_810 + 1) + 10);
                uint _827 = uint((_810 + 2) + 10);
                float2 _833 = float2(cb0_m[_817].x, cb0_m[_822].x);
                _848 = dp3_f32(float3(_812 * _812, _812, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_817].x, cb0_m[_822].x, cb0_m[_827].x)), dp2_f32(float2(-1.0f, 1.0f), _833), dp2_f32(0.5f.xx, _833)));
            }
            else
            {
                _848 = mad(cb0_m[21u].y, _737, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_800 * cb0_m[21u].y));
            }
            _849 = _848;
        }
        _850 = _849;
    }
    float _856 = (_732 <= 0.0f) ? (-4.0f) : (log2(_732) * 0.3010300099849700927734375f);
    float _964;
    if (_742 >= _856)
    {
        _964 = mad(cb0_m[21u].x, _856, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_742 * cb0_m[21u].x));
    }
    else
    {
        float _873 = log2(cb0_m[20u].x);
        float _874 = _873 * 0.3010300099849700927734375f;
        float _963;
        if ((_742 < _856) && (_874 > _856))
        {
            float _883 = (mad(_741, -0.3010300099849700927734375f, _856) * 7.0f) / (_874 - _742);
            int _884 = cvt_f32_i32(_883);
            float _886 = _883 - trunc(_883);
            uint _888 = uint(_884 + 1);
            uint _890 = uint(_884 + 2);
            uint _892 = uint(_884);
            float2 _904 = float2(cb0_m[_892].x, cb0_m[_888].x);
            _963 = dp3_f32(float3(_886 * _886, _886, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_892].x, cb0_m[_888].x, cb0_m[_890].x)), dp2_f32(float2(-1.0f, 1.0f), _904), dp2_f32(0.5f.xx, _904)));
        }
        else
        {
            float _914 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _962;
            if ((_874 <= _856) && (_914 > _856))
            {
                float _923 = (mad(_873, -0.3010300099849700927734375f, _856) * 7.0f) / (_914 - _874);
                int _924 = cvt_f32_i32(_923);
                float _926 = _923 - trunc(_923);
                uint _931 = uint(_924 + 10);
                uint _936 = uint((_924 + 1) + 10);
                uint _941 = uint((_924 + 2) + 10);
                float2 _947 = float2(cb0_m[_931].x, cb0_m[_936].x);
                _962 = dp3_f32(float3(_926 * _926, _926, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_931].x, cb0_m[_936].x, cb0_m[_941].x)), dp2_f32(float2(-1.0f, 1.0f), _947), dp2_f32(0.5f.xx, _947)));
            }
            else
            {
                _962 = mad(cb0_m[21u].y, _856, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_914 * cb0_m[21u].y));
            }
            _963 = _962;
        }
        _964 = _963;
    }
    float _970 = (_733 <= 0.0f) ? (-4.0f) : (log2(_733) * 0.3010300099849700927734375f);
    float _1078;
    if (_742 >= _970)
    {
        _1078 = mad(cb0_m[21u].x, _970, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_742 * cb0_m[21u].x));
    }
    else
    {
        float _987 = log2(cb0_m[20u].x);
        float _988 = _987 * 0.3010300099849700927734375f;
        float _1077;
        if ((_742 < _970) && (_988 > _970))
        {
            float _997 = (mad(_741, -0.3010300099849700927734375f, _970) * 7.0f) / (_988 - _742);
            int _998 = cvt_f32_i32(_997);
            float _1000 = _997 - trunc(_997);
            uint _1002 = uint(_998 + 1);
            uint _1004 = uint(_998 + 2);
            uint _1006 = uint(_998);
            float2 _1018 = float2(cb0_m[_1006].x, cb0_m[_1002].x);
            _1077 = dp3_f32(float3(_1000 * _1000, _1000, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_1006].x, cb0_m[_1002].x, cb0_m[_1004].x)), dp2_f32(float2(-1.0f, 1.0f), _1018), dp2_f32(0.5f.xx, _1018)));
        }
        else
        {
            float _1028 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _1076;
            if ((_988 <= _970) && (_1028 > _970))
            {
                float _1037 = (mad(_987, -0.3010300099849700927734375f, _970) * 7.0f) / (_1028 - _988);
                int _1038 = cvt_f32_i32(_1037);
                float _1040 = _1037 - trunc(_1037);
                uint _1045 = uint(_1038 + 10);
                uint _1050 = uint((_1038 + 1) + 10);
                uint _1055 = uint((_1038 + 2) + 10);
                float2 _1061 = float2(cb0_m[_1045].x, cb0_m[_1050].x);
                _1076 = dp3_f32(float3(_1040 * _1040, _1040, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_1045].x, cb0_m[_1050].x, cb0_m[_1055].x)), dp2_f32(float2(-1.0f, 1.0f), _1061), dp2_f32(0.5f.xx, _1061)));
            }
            else
            {
                _1076 = mad(cb0_m[21u].y, _970, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_1028 * cb0_m[21u].y));
            }
            _1077 = _1076;
        }
        _1078 = _1077;
    }
    float3 _1084 = float3(exp2(_850 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_964 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1078 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
    float3 _1088 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1084), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1084), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1084));
    float3 _1092 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1088), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1088), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1088));
    float _1101 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1092) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1112 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1092) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1122 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1092) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    u0[_283] = float4(min(exp2(log2(mad(_1101, 18.8515625f, 0.8359375f) / mad(_1101, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1112, 18.8515625f, 0.8359375f) / mad(_1112, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1122, 18.8515625f, 0.8359375f) / mad(_1122, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
