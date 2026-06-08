#include "../common.hlsl"

struct _241
{
    uint2 _m0;
    uint _m1;
};

static const float2 _182[7] = { float2(-4.0f, -0.718548238277435302734375f), float2(-4.0f, 2.0810306072235107421875f), float2(-3.1573765277862548828125f, 3.66812419891357421875f), float2(-0.485249996185302734375f, 4.0f), float2(1.84773242473602294921875f, 4.0f), float2(1.84773242473602294921875f, 4.0f), 0.0f.xx };

cbuffer cb0_buf : register(b0)
{
    float4 cb0_m[4096] : packoffset(c0);
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

float dp3_f32(float3 a, float3 b)
{
    precise float _229 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _229));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

float dp2_f32(float2 a, float2 b)
{
    precise float _205 = a.x * b.x;
    return mad(a.y, b.y, _205);
}

void comp_main()
{
    uint _240_dummy_parameter;
    _241 _242 = { spvImageSize(u0, _240_dummy_parameter), 1u };
    uint _257 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _261 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_257, 1u, 3u);
    uint _262 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _257, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    if ((_242._m0.x < _261) || (_242._m0.y < _262))
    {
        return;
    }
    uint2 _268 = uint2(_261, _262);
    float3 _273 = float3(u0[_268].xyz);
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

        float3 scene_color = _273;
        float3 output_color = CustomTonemap(scene_color, aces_parameters);
        u0[_268] = float4(output_color, 1.f);

        return;
    }
    #endif
    float _280 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _273) * 2.5f, 65504.0f);
    float _281 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _273) * 2.5f, 65504.0f);
    float _282 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _273) * 2.5f, 65504.0f);
    float _286 = max(max(_281, _280), _282);
    float _291 = (max(_286, 9.9999997473787516355514526367188e-05f) - max(min(min(_281, _280), _282), 9.9999997473787516355514526367188e-05f)) / max(_286, 0.00999999977648258209228515625f);
    float _302 = mad(sqrt(mad(_280, _280 - _282, ((_282 - _281) * _282) + (_281 * (_281 - _280)))), 1.75f, (_282 + _281) + _280);
    float _303 = _291 - 0.4000000059604644775390625f;
    float _308 = max(1.0f - abs(_303 * 2.5f), 0.0f);
    float _315 = mad(mad(clamp(mad(_303, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_308, _308, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _323 = ((_302 <= 0.1599999964237213134765625f) ? _315 : ((_302 >= 0.4799999892711639404296875f) ? 0.0f : (_315 * ((0.07999999821186065673828125f / (_302 * 0.3333333432674407958984375f)) - 0.5f)))) + 1.0f;
    float _324 = _323 * _280;
    float _325 = _323 * _281;
    float _326 = _323 * _282;
    float _331 = (_325 - _326) * 1.73205077648162841796875f;
    float _333 = (_324 * 2.0f) - _325;
    float _335 = mad(-_323, _282, _333);
    float _336 = abs(_335);
    float _337 = abs(_331);
    float _341 = min(_336, _337) * (1.0f / max(_336, _337));
    float _342 = _341 * _341;
    float _346 = mad(_342, mad(_342, mad(_342, mad(_342, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _356 = mad(_341, _346, (_336 < _337) ? mad(_341 * _346, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_335 < mad(_323, _282, -_333)) ? (-3.1415927410125732421875f) : 0.0f);
    float _357 = min(_331, _335);
    float _358 = max(_331, _335);
    float _367 = ((_324 == _325) && (_326 == _325)) ? 0.0f : ((((_357 < (-_357)) && (_358 >= (-_358))) ? (-_356) : _356) * 57.295780181884765625f);
    float _370 = (_367 < 0.0f) ? (_367 + 360.0f) : _367;
    float _380 = max(1.0f - abs(((_370 < (-180.0f)) ? (_370 + 360.0f) : ((_370 > 180.0f) ? (_370 - 360.0f) : _370)) * 0.01481481455266475677490234375f), 0.0f);
    float _383 = mad(_380, -2.0f, 3.0f) * (_380 * _380);
    float3 _394 = float3(clamp(_324 + (((_291 * (_383 * _383)) * mad(-_323, _280, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_325, 0.0f, 65504.0f), clamp(_326, 0.0f, 65504.0f));
    float _398 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _394), 0.0f, 65504.0f);
    float _399 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _394), 0.0f, 65504.0f);
    float _400 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _394), 0.0f, 65504.0f);
    float _402 = dp3_f32(float3(_398, _399, _400), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _406 = mad(_398 - _402, 0.959999978542327880859375f, _402);
    float _407 = mad(_399 - _402, 0.959999978542327880859375f, _402);
    float _408 = mad(_400 - _402, 0.959999978542327880859375f, _402);
    float _415 = (_406 <= 0.0f) ? (-14.0f) : log2(_406);
    float _416 = (_407 <= 0.0f) ? (-14.0f) : log2(_407);
    float _417 = (_408 <= 0.0f) ? (-14.0f) : log2(_408);
    float _501;
    if (_415 <= (-17.4739322662353515625f))
    {
        _501 = -4.0f;
    }
    else
    {
        float _500;
        if (_415 < (-2.4739310741424560546875f))
        {
            float _428 = mad(_415, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _429 = _428 * 0.6643855571746826171875f;
            int _430 = cvt_f32_i32(_429);
            float _433 = mad(_428, 0.6643855571746826171875f, -trunc(_429));
            uint _440 = min(uint(_430), 6u);
            uint _447 = min(uint(_430 + 1), 6u);
            uint _451 = min(uint(_430 + 2), 6u);
            float2 _457 = float2(_182[_440].x, _182[_447].x);
            _500 = dp3_f32(float3(_433 * _433, _433, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_440].x, _182[_447].x, _182[_451].x)), dp2_f32(float2(-1.0f, 1.0f), _457), dp2_f32(0.5f.xx, _457)));
        }
        else
        {
            float _499;
            if (_415 < 15.52606868743896484375f)
            {
                float _467 = mad(_415, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _468 = _467 * 0.55365467071533203125f;
                int _469 = cvt_f32_i32(_468);
                float _472 = mad(_467, 0.55365467071533203125f, -trunc(_468));
                uint _479 = min(uint(_469), 6u);
                uint _483 = min(uint(_469 + 1), 6u);
                uint _487 = min(uint(_469 + 2), 6u);
                float2 _493 = float2(_182[_479].y, _182[_483].y);
                _499 = dp3_f32(float3(_472 * _472, _472, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_479].y, _182[_483].y, _182[_487].y)), dp2_f32(float2(-1.0f, 1.0f), _493), dp2_f32(0.5f.xx, _493)));
            }
            else
            {
                _499 = 4.0f;
            }
            _500 = _499;
        }
        _501 = _500;
    }
    float _581;
    if (_416 <= (-17.4739322662353515625f))
    {
        _581 = -4.0f;
    }
    else
    {
        float _580;
        if (_416 < (-2.4739310741424560546875f))
        {
            float _511 = mad(_416, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _512 = _511 * 0.6643855571746826171875f;
            int _513 = cvt_f32_i32(_512);
            float _516 = mad(_511, 0.6643855571746826171875f, -trunc(_512));
            uint _523 = min(uint(_513), 6u);
            uint _527 = min(uint(_513 + 1), 6u);
            uint _531 = min(uint(_513 + 2), 6u);
            float2 _537 = float2(_182[_523].x, _182[_527].x);
            _580 = dp3_f32(float3(_516 * _516, _516, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_523].x, _182[_527].x, _182[_531].x)), dp2_f32(float2(-1.0f, 1.0f), _537), dp2_f32(0.5f.xx, _537)));
        }
        else
        {
            float _579;
            if (_416 < 15.52606868743896484375f)
            {
                float _547 = mad(_416, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _548 = _547 * 0.55365467071533203125f;
                int _549 = cvt_f32_i32(_548);
                float _552 = mad(_547, 0.55365467071533203125f, -trunc(_548));
                uint _559 = min(uint(_549), 6u);
                uint _563 = min(uint(_549 + 1), 6u);
                uint _567 = min(uint(_549 + 2), 6u);
                float2 _573 = float2(_182[_559].y, _182[_563].y);
                _579 = dp3_f32(float3(_552 * _552, _552, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_559].y, _182[_563].y, _182[_567].y)), dp2_f32(float2(-1.0f, 1.0f), _573), dp2_f32(0.5f.xx, _573)));
            }
            else
            {
                _579 = 4.0f;
            }
            _580 = _579;
        }
        _581 = _580;
    }
    float _661;
    if (_417 <= (-17.4739322662353515625f))
    {
        _661 = -4.0f;
    }
    else
    {
        float _660;
        if (_417 < (-2.4739310741424560546875f))
        {
            float _591 = mad(_417, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _592 = _591 * 0.6643855571746826171875f;
            int _593 = cvt_f32_i32(_592);
            float _596 = mad(_591, 0.6643855571746826171875f, -trunc(_592));
            uint _603 = min(uint(_593), 6u);
            uint _607 = min(uint(_593 + 1), 6u);
            uint _611 = min(uint(_593 + 2), 6u);
            float2 _617 = float2(_182[_603].x, _182[_607].x);
            _660 = dp3_f32(float3(_596 * _596, _596, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_603].x, _182[_607].x, _182[_611].x)), dp2_f32(float2(-1.0f, 1.0f), _617), dp2_f32(0.5f.xx, _617)));
        }
        else
        {
            float _659;
            if (_417 < 15.52606868743896484375f)
            {
                float _627 = mad(_417, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _628 = _627 * 0.55365467071533203125f;
                int _629 = cvt_f32_i32(_628);
                float _632 = mad(_627, 0.55365467071533203125f, -trunc(_628));
                uint _639 = min(uint(_629), 6u);
                uint _643 = min(uint(_629 + 1), 6u);
                uint _647 = min(uint(_629 + 2), 6u);
                float2 _653 = float2(_182[_639].y, _182[_643].y);
                _659 = dp3_f32(float3(_632 * _632, _632, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_182[_639].y, _182[_643].y, _182[_647].y)), dp2_f32(float2(-1.0f, 1.0f), _653), dp2_f32(0.5f.xx, _653)));
            }
            else
            {
                _659 = 4.0f;
            }
            _660 = _659;
        }
        _661 = _660;
    }
    float3 _664 = float3(exp2(_501 * 3.3219280242919921875f), exp2(_581 * 3.3219280242919921875f), exp2(_661 * 3.3219280242919921875f));
    float3 _668 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _664), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _664), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _664));
    float _669 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _668);
    float _670 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _668);
    float _671 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _668);
    float _675 = (_669 <= 0.0f) ? (-4.0f) : (log2(_669) * 0.3010300099849700927734375f);
    float _680 = log2(cb0_m[19u].y);
    float _681 = _680 * 0.3010300099849700927734375f;
    float _789;
    if (_681 >= _675)
    {
        _789 = mad(cb0_m[21u].x, _675, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_681 * cb0_m[21u].x));
    }
    else
    {
        float _698 = log2(cb0_m[20u].x);
        float _699 = _698 * 0.3010300099849700927734375f;
        float _788;
        if ((_681 < _675) && (_699 > _675))
        {
            float _708 = (mad(_680, -0.3010300099849700927734375f, _675) * 7.0f) / (_699 - _681);
            int _709 = cvt_f32_i32(_708);
            float _711 = _708 - trunc(_708);
            uint _713 = uint(_709 + 1);
            uint _715 = uint(_709 + 2);
            uint _717 = uint(_709);
            float2 _729 = float2(cb0_m[_717].x, cb0_m[_713].x);
            _788 = dp3_f32(float3(_711 * _711, _711, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_717].x, cb0_m[_713].x, cb0_m[_715].x)), dp2_f32(float2(-1.0f, 1.0f), _729), dp2_f32(0.5f.xx, _729)));
        }
        else
        {
            float _739 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _787;
            if ((_699 <= _675) && (_739 > _675))
            {
                float _748 = (mad(_698, -0.3010300099849700927734375f, _675) * 7.0f) / (_739 - _699);
                int _749 = cvt_f32_i32(_748);
                float _751 = _748 - trunc(_748);
                uint _756 = uint(_749 + 10);
                uint _761 = uint((_749 + 1) + 10);
                uint _766 = uint((_749 + 2) + 10);
                float2 _772 = float2(cb0_m[_756].x, cb0_m[_761].x);
                _787 = dp3_f32(float3(_751 * _751, _751, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_756].x, cb0_m[_761].x, cb0_m[_766].x)), dp2_f32(float2(-1.0f, 1.0f), _772), dp2_f32(0.5f.xx, _772)));
            }
            else
            {
                _787 = mad(cb0_m[21u].y, _675, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_739 * cb0_m[21u].y));
            }
            _788 = _787;
        }
        _789 = _788;
    }
    float _795 = (_670 <= 0.0f) ? (-4.0f) : (log2(_670) * 0.3010300099849700927734375f);
    float _903;
    if (_681 >= _795)
    {
        _903 = mad(cb0_m[21u].x, _795, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_681 * cb0_m[21u].x));
    }
    else
    {
        float _812 = log2(cb0_m[20u].x);
        float _813 = _812 * 0.3010300099849700927734375f;
        float _902;
        if ((_681 < _795) && (_813 > _795))
        {
            float _822 = (mad(_680, -0.3010300099849700927734375f, _795) * 7.0f) / (_813 - _681);
            int _823 = cvt_f32_i32(_822);
            float _825 = _822 - trunc(_822);
            uint _827 = uint(_823 + 1);
            uint _829 = uint(_823 + 2);
            uint _831 = uint(_823);
            float2 _843 = float2(cb0_m[_831].x, cb0_m[_827].x);
            _902 = dp3_f32(float3(_825 * _825, _825, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_831].x, cb0_m[_827].x, cb0_m[_829].x)), dp2_f32(float2(-1.0f, 1.0f), _843), dp2_f32(0.5f.xx, _843)));
        }
        else
        {
            float _853 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _901;
            if ((_813 <= _795) && (_853 > _795))
            {
                float _862 = (mad(_812, -0.3010300099849700927734375f, _795) * 7.0f) / (_853 - _813);
                int _863 = cvt_f32_i32(_862);
                float _865 = _862 - trunc(_862);
                uint _870 = uint(_863 + 10);
                uint _875 = uint((_863 + 1) + 10);
                uint _880 = uint((_863 + 2) + 10);
                float2 _886 = float2(cb0_m[_870].x, cb0_m[_875].x);
                _901 = dp3_f32(float3(_865 * _865, _865, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_870].x, cb0_m[_875].x, cb0_m[_880].x)), dp2_f32(float2(-1.0f, 1.0f), _886), dp2_f32(0.5f.xx, _886)));
            }
            else
            {
                _901 = mad(cb0_m[21u].y, _795, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_853 * cb0_m[21u].y));
            }
            _902 = _901;
        }
        _903 = _902;
    }
    float _909 = (_671 <= 0.0f) ? (-4.0f) : (log2(_671) * 0.3010300099849700927734375f);
    float _1017;
    if (_681 >= _909)
    {
        _1017 = mad(cb0_m[21u].x, _909, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_681 * cb0_m[21u].x));
    }
    else
    {
        float _926 = log2(cb0_m[20u].x);
        float _927 = _926 * 0.3010300099849700927734375f;
        float _1016;
        if ((_681 < _909) && (_927 > _909))
        {
            float _936 = (mad(_680, -0.3010300099849700927734375f, _909) * 7.0f) / (_927 - _681);
            int _937 = cvt_f32_i32(_936);
            float _939 = _936 - trunc(_936);
            uint _941 = uint(_937 + 1);
            uint _943 = uint(_937 + 2);
            uint _945 = uint(_937);
            float2 _957 = float2(cb0_m[_945].x, cb0_m[_941].x);
            _1016 = dp3_f32(float3(_939 * _939, _939, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_945].x, cb0_m[_941].x, cb0_m[_943].x)), dp2_f32(float2(-1.0f, 1.0f), _957), dp2_f32(0.5f.xx, _957)));
        }
        else
        {
            float _967 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _1015;
            if ((_927 <= _909) && (_967 > _909))
            {
                float _976 = (mad(_926, -0.3010300099849700927734375f, _909) * 7.0f) / (_967 - _927);
                int _977 = cvt_f32_i32(_976);
                float _979 = _976 - trunc(_976);
                uint _984 = uint(_977 + 10);
                uint _989 = uint((_977 + 1) + 10);
                uint _994 = uint((_977 + 2) + 10);
                float2 _1000 = float2(cb0_m[_984].x, cb0_m[_989].x);
                _1015 = dp3_f32(float3(_979 * _979, _979, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_984].x, cb0_m[_989].x, cb0_m[_994].x)), dp2_f32(float2(-1.0f, 1.0f), _1000), dp2_f32(0.5f.xx, _1000)));
            }
            else
            {
                _1015 = mad(cb0_m[21u].y, _909, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_967 * cb0_m[21u].y));
            }
            _1016 = _1015;
        }
        _1017 = _1016;
    }
    float3 _1023 = float3(exp2(_789 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_903 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1017 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
    float3 _1027 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1023), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1023), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1023));
    float3 _1031 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1027), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1027), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1027));
    float _1040 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1031) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1051 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1031) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1061 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1031) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    u0[_268] = float4(min(exp2(log2(mad(_1040, 18.8515625f, 0.8359375f) / mad(_1040, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1051, 18.8515625f, 0.8359375f) / mad(_1051, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1061, 18.8515625f, 0.8359375f) / mad(_1061, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
