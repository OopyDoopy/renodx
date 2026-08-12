#include "../common.hlsl"

struct _254
{
    uint2 _m0;
    uint _m1;
};

static const float2 _191[7] = { float2(-4.0f, -0.718548238277435302734375f), float2(-4.0f, 2.0810306072235107421875f), float2(-3.1573765277862548828125f, 3.66812419891357421875f), float2(-0.485249996185302734375f, 4.0f), float2(1.84773242473602294921875f, 4.0f), float2(1.84773242473602294921875f, 4.0f), 0.0f.xx };

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

SamplerState s0 : register(s0);
Texture2D<float4> t0 : register(t0);
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
    precise float _245 = a.x * b.x;
    return mad(a.y, b.y, _245);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _230 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _230));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _253_dummy_parameter;
    _254 _255 = { spvImageSize(u0, _253_dummy_parameter), 1u };
    uint _270 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _274 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_270, 1u, 3u);
    uint _275 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _270, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    if ((_255._m0.x < _274) || (_255._m0.y < _275))
    {
        return;
    }
    float _287 = (float(_274) + 0.5f) / float(_255._m0.x);
    float _288 = (float(_275) + 0.5f) / float(_255._m0.y);
    float4 _294 = t0.SampleLevel(s0, float2(_287, _288), 0.0f);
    float _295 = _294.x;
    float _296 = _294.y;
    float _297 = _294.z;
    float2 _300 = float2(_287 - 0.5f, _288 - 0.5f);
    float _313 = clamp(-((1.0f / cb1_m2.y) * (sqrt(dp2_f32(_300, _300)) - cb1_m2.x)), 0.0f, 1.0f);
    float _314 = mad(_313, -2.0f, 3.0f);
    float _315 = _313 * _313;
    float _316 = _314 * _315;
    float _318 = mad(-_314, _315, 1.0f);
    float _338 = cb1_m2.z * cb1_m2.w;
    float3 _345 = float3(mad(_338, ((_318 * cb1_m0.x) + (_295 * _316)) - _295, _295), mad(_338, ((_296 * _316) + (_318 * cb1_m0.y)) - _296, _296), mad(_338, ((_297 * _316) + (_318 * cb1_m0.z)) - _297, _297));
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

        float3 scene_color = _345;
        float3 output_color = CustomTonemap(scene_color, aces_parameters);
        u0[uint2(_274, _275)] = float4(output_color, 1.f);

        return;
    }
    #endif
    float _352 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _345) * 2.5f, 65504.0f);
    float _353 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _345) * 2.5f, 65504.0f);
    float _354 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _345) * 2.5f, 65504.0f);
    float _358 = max(max(_353, _352), _354);
    float _363 = (max(_358, 9.9999997473787516355514526367188e-05f) - max(min(min(_353, _352), _354), 9.9999997473787516355514526367188e-05f)) / max(_358, 0.00999999977648258209228515625f);
    float _374 = mad(sqrt(mad(_352, _352 - _354, ((_354 - _353) * _354) + (_353 * (_353 - _352)))), 1.75f, (_353 + _354) + _352);
    float _375 = _363 - 0.4000000059604644775390625f;
    float _380 = max(1.0f - abs(_375 * 2.5f), 0.0f);
    float _387 = mad(mad(clamp(mad(_375, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_380, _380, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _395 = ((_374 <= 0.1599999964237213134765625f) ? _387 : ((_374 >= 0.4799999892711639404296875f) ? 0.0f : (_387 * ((0.07999999821186065673828125f / (_374 * 0.3333333432674407958984375f)) - 0.5f)))) + 1.0f;
    float _396 = _395 * _352;
    float _397 = _395 * _353;
    float _398 = _395 * _354;
    float _403 = (_397 - _398) * 1.73205077648162841796875f;
    float _405 = (_396 * 2.0f) - _397;
    float _407 = mad(-_395, _354, _405);
    float _408 = abs(_407);
    float _409 = abs(_403);
    float _413 = min(_408, _409) * (1.0f / max(_408, _409));
    float _414 = _413 * _413;
    float _418 = mad(_414, mad(_414, mad(_414, mad(_414, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _428 = mad(_413, _418, (_408 < _409) ? mad(_413 * _418, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_407 < mad(_395, _354, -_405)) ? (-3.1415927410125732421875f) : 0.0f);
    float _429 = min(_403, _407);
    float _430 = max(_403, _407);
    float _439 = ((_396 == _397) && (_398 == _397)) ? 0.0f : ((((_429 < (-_429)) && (_430 >= (-_430))) ? (-_428) : _428) * 57.295780181884765625f);
    float _442 = (_439 < 0.0f) ? (_439 + 360.0f) : _439;
    float _452 = max(1.0f - abs(((_442 < (-180.0f)) ? (_442 + 360.0f) : ((_442 > 180.0f) ? (_442 - 360.0f) : _442)) * 0.01481481455266475677490234375f), 0.0f);
    float _455 = mad(_452, -2.0f, 3.0f) * (_452 * _452);
    float3 _466 = float3(clamp(_396 + (((_363 * (_455 * _455)) * mad(-_395, _352, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_397, 0.0f, 65504.0f), clamp(_398, 0.0f, 65504.0f));
    float _470 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _466), 0.0f, 65504.0f);
    float _471 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _466), 0.0f, 65504.0f);
    float _472 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _466), 0.0f, 65504.0f);
    float _474 = dp3_f32(float3(_470, _471, _472), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _478 = mad(_470 - _474, 0.959999978542327880859375f, _474);
    float _479 = mad(_471 - _474, 0.959999978542327880859375f, _474);
    float _480 = mad(_472 - _474, 0.959999978542327880859375f, _474);
    float _487 = (_478 <= 0.0f) ? (-14.0f) : log2(_478);
    float _488 = (_479 <= 0.0f) ? (-14.0f) : log2(_479);
    float _489 = (_480 <= 0.0f) ? (-14.0f) : log2(_480);
    float _573;
    if (_487 <= (-17.4739322662353515625f))
    {
        _573 = -4.0f;
    }
    else
    {
        float _572;
        if (_487 < (-2.4739310741424560546875f))
        {
            float _500 = mad(_487, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _501 = _500 * 0.6643855571746826171875f;
            int _502 = cvt_f32_i32(_501);
            float _505 = mad(_500, 0.6643855571746826171875f, -trunc(_501));
            uint _512 = min(uint(_502), 6u);
            uint _519 = min(uint(_502 + 1), 6u);
            uint _523 = min(uint(_502 + 2), 6u);
            float2 _529 = float2(_191[_512].x, _191[_519].x);
            _572 = dp3_f32(float3(_505 * _505, _505, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_512].x, _191[_519].x, _191[_523].x)), dp2_f32(float2(-1.0f, 1.0f), _529), dp2_f32(0.5f.xx, _529)));
        }
        else
        {
            float _571;
            if (_487 < 15.52606868743896484375f)
            {
                float _539 = mad(_487, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _540 = _539 * 0.55365467071533203125f;
                int _541 = cvt_f32_i32(_540);
                float _544 = mad(_539, 0.55365467071533203125f, -trunc(_540));
                uint _551 = min(uint(_541), 6u);
                uint _555 = min(uint(_541 + 1), 6u);
                uint _559 = min(uint(_541 + 2), 6u);
                float2 _565 = float2(_191[_551].y, _191[_555].y);
                _571 = dp3_f32(float3(_544 * _544, _544, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_551].y, _191[_555].y, _191[_559].y)), dp2_f32(float2(-1.0f, 1.0f), _565), dp2_f32(0.5f.xx, _565)));
            }
            else
            {
                _571 = 4.0f;
            }
            _572 = _571;
        }
        _573 = _572;
    }
    float _653;
    if (_488 <= (-17.4739322662353515625f))
    {
        _653 = -4.0f;
    }
    else
    {
        float _652;
        if (_488 < (-2.4739310741424560546875f))
        {
            float _583 = mad(_488, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _584 = _583 * 0.6643855571746826171875f;
            int _585 = cvt_f32_i32(_584);
            float _588 = mad(_583, 0.6643855571746826171875f, -trunc(_584));
            uint _595 = min(uint(_585), 6u);
            uint _599 = min(uint(_585 + 1), 6u);
            uint _603 = min(uint(_585 + 2), 6u);
            float2 _609 = float2(_191[_595].x, _191[_599].x);
            _652 = dp3_f32(float3(_588 * _588, _588, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_595].x, _191[_599].x, _191[_603].x)), dp2_f32(float2(-1.0f, 1.0f), _609), dp2_f32(0.5f.xx, _609)));
        }
        else
        {
            float _651;
            if (_488 < 15.52606868743896484375f)
            {
                float _619 = mad(_488, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _620 = _619 * 0.55365467071533203125f;
                int _621 = cvt_f32_i32(_620);
                float _624 = mad(_619, 0.55365467071533203125f, -trunc(_620));
                uint _631 = min(uint(_621), 6u);
                uint _635 = min(uint(_621 + 1), 6u);
                uint _639 = min(uint(_621 + 2), 6u);
                float2 _645 = float2(_191[_631].y, _191[_635].y);
                _651 = dp3_f32(float3(_624 * _624, _624, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_631].y, _191[_635].y, _191[_639].y)), dp2_f32(float2(-1.0f, 1.0f), _645), dp2_f32(0.5f.xx, _645)));
            }
            else
            {
                _651 = 4.0f;
            }
            _652 = _651;
        }
        _653 = _652;
    }
    float _733;
    if (_489 <= (-17.4739322662353515625f))
    {
        _733 = -4.0f;
    }
    else
    {
        float _732;
        if (_489 < (-2.4739310741424560546875f))
        {
            float _663 = mad(_489, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _664 = _663 * 0.6643855571746826171875f;
            int _665 = cvt_f32_i32(_664);
            float _668 = mad(_663, 0.6643855571746826171875f, -trunc(_664));
            uint _675 = min(uint(_665), 6u);
            uint _679 = min(uint(_665 + 1), 6u);
            uint _683 = min(uint(_665 + 2), 6u);
            float2 _689 = float2(_191[_675].x, _191[_679].x);
            _732 = dp3_f32(float3(_668 * _668, _668, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_675].x, _191[_679].x, _191[_683].x)), dp2_f32(float2(-1.0f, 1.0f), _689), dp2_f32(0.5f.xx, _689)));
        }
        else
        {
            float _731;
            if (_489 < 15.52606868743896484375f)
            {
                float _699 = mad(_489, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _700 = _699 * 0.55365467071533203125f;
                int _701 = cvt_f32_i32(_700);
                float _704 = mad(_699, 0.55365467071533203125f, -trunc(_700));
                uint _711 = min(uint(_701), 6u);
                uint _715 = min(uint(_701 + 1), 6u);
                uint _719 = min(uint(_701 + 2), 6u);
                float2 _725 = float2(_191[_711].y, _191[_715].y);
                _731 = dp3_f32(float3(_704 * _704, _704, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_191[_711].y, _191[_715].y, _191[_719].y)), dp2_f32(float2(-1.0f, 1.0f), _725), dp2_f32(0.5f.xx, _725)));
            }
            else
            {
                _731 = 4.0f;
            }
            _732 = _731;
        }
        _733 = _732;
    }
    float3 _736 = float3(exp2(_573 * 3.3219280242919921875f), exp2(_653 * 3.3219280242919921875f), exp2(_733 * 3.3219280242919921875f));
    float3 _740 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _736), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _736), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _736));
    float _741 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _740);
    float _742 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _740);
    float _743 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _740);
    float _747 = (_741 <= 0.0f) ? (-4.0f) : (log2(_741) * 0.3010300099849700927734375f);
    float _751 = log2(cb0_m[19u].y);
    float _752 = _751 * 0.3010300099849700927734375f;
    float _860;
    if (_752 >= _747)
    {
        _860 = mad(cb0_m[21u].x, _747, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_752 * cb0_m[21u].x));
    }
    else
    {
        float _769 = log2(cb0_m[20u].x);
        float _770 = _769 * 0.3010300099849700927734375f;
        float _859;
        if ((_752 < _747) && (_770 > _747))
        {
            float _779 = (mad(_751, -0.3010300099849700927734375f, _747) * 7.0f) / (_770 - _752);
            int _780 = cvt_f32_i32(_779);
            float _782 = _779 - trunc(_779);
            uint _784 = uint(_780 + 1);
            uint _786 = uint(_780 + 2);
            uint _788 = uint(_780);
            float2 _800 = float2(cb0_m[_788].x, cb0_m[_784].x);
            _859 = dp3_f32(float3(_782 * _782, _782, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_788].x, cb0_m[_784].x, cb0_m[_786].x)), dp2_f32(float2(-1.0f, 1.0f), _800), dp2_f32(0.5f.xx, _800)));
        }
        else
        {
            float _810 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _858;
            if ((_770 <= _747) && (_810 > _747))
            {
                float _819 = (mad(_769, -0.3010300099849700927734375f, _747) * 7.0f) / (_810 - _770);
                int _820 = cvt_f32_i32(_819);
                float _822 = _819 - trunc(_819);
                uint _827 = uint(_820 + 10);
                uint _832 = uint((_820 + 1) + 10);
                uint _837 = uint((_820 + 2) + 10);
                float2 _843 = float2(cb0_m[_827].x, cb0_m[_832].x);
                _858 = dp3_f32(float3(_822 * _822, _822, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_827].x, cb0_m[_832].x, cb0_m[_837].x)), dp2_f32(float2(-1.0f, 1.0f), _843), dp2_f32(0.5f.xx, _843)));
            }
            else
            {
                _858 = mad(cb0_m[21u].y, _747, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_810 * cb0_m[21u].y));
            }
            _859 = _858;
        }
        _860 = _859;
    }
    float _866 = (_742 <= 0.0f) ? (-4.0f) : (log2(_742) * 0.3010300099849700927734375f);
    float _974;
    if (_752 >= _866)
    {
        _974 = mad(cb0_m[21u].x, _866, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_752 * cb0_m[21u].x));
    }
    else
    {
        float _883 = log2(cb0_m[20u].x);
        float _884 = _883 * 0.3010300099849700927734375f;
        float _973;
        if ((_752 < _866) && (_884 > _866))
        {
            float _893 = (mad(_751, -0.3010300099849700927734375f, _866) * 7.0f) / (_884 - _752);
            int _894 = cvt_f32_i32(_893);
            float _896 = _893 - trunc(_893);
            uint _898 = uint(_894 + 1);
            uint _900 = uint(_894 + 2);
            uint _902 = uint(_894);
            float2 _914 = float2(cb0_m[_902].x, cb0_m[_898].x);
            _973 = dp3_f32(float3(_896 * _896, _896, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_902].x, cb0_m[_898].x, cb0_m[_900].x)), dp2_f32(float2(-1.0f, 1.0f), _914), dp2_f32(0.5f.xx, _914)));
        }
        else
        {
            float _924 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _972;
            if ((_884 <= _866) && (_924 > _866))
            {
                float _933 = (mad(_883, -0.3010300099849700927734375f, _866) * 7.0f) / (_924 - _884);
                int _934 = cvt_f32_i32(_933);
                float _936 = _933 - trunc(_933);
                uint _941 = uint(_934 + 10);
                uint _946 = uint((_934 + 1) + 10);
                uint _951 = uint((_934 + 2) + 10);
                float2 _957 = float2(cb0_m[_941].x, cb0_m[_946].x);
                _972 = dp3_f32(float3(_936 * _936, _936, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_941].x, cb0_m[_946].x, cb0_m[_951].x)), dp2_f32(float2(-1.0f, 1.0f), _957), dp2_f32(0.5f.xx, _957)));
            }
            else
            {
                _972 = mad(cb0_m[21u].y, _866, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_924 * cb0_m[21u].y));
            }
            _973 = _972;
        }
        _974 = _973;
    }
    float _980 = (_743 <= 0.0f) ? (-4.0f) : (log2(_743) * 0.3010300099849700927734375f);
    float _1088;
    if (_752 >= _980)
    {
        _1088 = mad(cb0_m[21u].x, _980, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_752 * cb0_m[21u].x));
    }
    else
    {
        float _997 = log2(cb0_m[20u].x);
        float _998 = _997 * 0.3010300099849700927734375f;
        float _1087;
        if ((_752 < _980) && (_998 > _980))
        {
            float _1007 = (mad(_751, -0.3010300099849700927734375f, _980) * 7.0f) / (_998 - _752);
            int _1008 = cvt_f32_i32(_1007);
            float _1010 = _1007 - trunc(_1007);
            uint _1012 = uint(_1008 + 1);
            uint _1014 = uint(_1008 + 2);
            uint _1016 = uint(_1008);
            float2 _1028 = float2(cb0_m[_1016].x, cb0_m[_1012].x);
            _1087 = dp3_f32(float3(_1010 * _1010, _1010, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_1016].x, cb0_m[_1012].x, cb0_m[_1014].x)), dp2_f32(float2(-1.0f, 1.0f), _1028), dp2_f32(0.5f.xx, _1028)));
        }
        else
        {
            float _1038 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _1086;
            if ((_998 <= _980) && (_1038 > _980))
            {
                float _1047 = (mad(_997, -0.3010300099849700927734375f, _980) * 7.0f) / (_1038 - _998);
                int _1048 = cvt_f32_i32(_1047);
                float _1050 = _1047 - trunc(_1047);
                uint _1055 = uint(_1048 + 10);
                uint _1060 = uint((_1048 + 1) + 10);
                uint _1065 = uint((_1048 + 2) + 10);
                float2 _1071 = float2(cb0_m[_1055].x, cb0_m[_1060].x);
                _1086 = dp3_f32(float3(_1050 * _1050, _1050, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_1055].x, cb0_m[_1060].x, cb0_m[_1065].x)), dp2_f32(float2(-1.0f, 1.0f), _1071), dp2_f32(0.5f.xx, _1071)));
            }
            else
            {
                _1086 = mad(cb0_m[21u].y, _980, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_1038 * cb0_m[21u].y));
            }
            _1087 = _1086;
        }
        _1088 = _1087;
    }
    float3 _1094 = float3(exp2(_860 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_974 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1088 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
    float3 _1098 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1094), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1094), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1094));
    float3 _1102 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1098), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1098), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1098));
    float _1111 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1102) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1122 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1102) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1132 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1102) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    u0[uint2(_274, _275)] = float4(min(exp2(log2(mad(_1111, 18.8515625f, 0.8359375f) / mad(_1111, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1122, 18.8515625f, 0.8359375f) / mad(_1122, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1132, 18.8515625f, 0.8359375f) / mad(_1132, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
