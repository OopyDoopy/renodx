#include "../common.hlsl"

struct _247
{
    uint2 _m0;
    uint _m1;
};

static const float2 _188[7] = { float2(-4.0f, -0.718548238277435302734375f), float2(-4.0f, 2.0810306072235107421875f), float2(-3.1573765277862548828125f, 3.66812419891357421875f), float2(-0.485249996185302734375f, 4.0f), float2(1.84773242473602294921875f, 4.0f), float2(1.84773242473602294921875f, 4.0f), 0.0f.xx };

cbuffer cb0_buf : register(b0)
{
    float4 cb0_m[4096] : packoffset(c0);
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

float dp3_f32(float3 a, float3 b)
{
    precise float _235 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _235));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

float dp2_f32(float2 a, float2 b)
{
    precise float _211 = a.x * b.x;
    return mad(a.y, b.y, _211);
}

void comp_main()
{
    uint _246_dummy_parameter;
    _247 _248 = { spvImageSize(u0, _246_dummy_parameter), 1u };
    uint _263 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _267 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_263, 1u, 3u);
    uint _268 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _263, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    if ((_248._m0.x < _267) || (_248._m0.y < _268))
    {
        return;
    }
    float3 _291 = float3(t0.SampleLevel(s0, float2((float(_267) + 0.5f) / float(_248._m0.x), (float(_268) + 0.5f) / float(_248._m0.y)), 0.0f).xyz);
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

        float3 scene_color = _291;
        float3 output_color = CustomTonemap(scene_color, aces_parameters);
        u0[uint2(_267, _268)] = float4(output_color, 1.f);

        return;
    }
    #endif
    float _298 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _291) * 2.5f, 65504.0f);
    float _299 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _291) * 2.5f, 65504.0f);
    float _300 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _291) * 2.5f, 65504.0f);
    float _304 = max(max(_299, _298), _300);
    float _309 = (max(_304, 9.9999997473787516355514526367188e-05f) - max(min(min(_299, _298), _300), 9.9999997473787516355514526367188e-05f)) / max(_304, 0.00999999977648258209228515625f);
    float _320 = mad(sqrt(mad(_298 - _300, _298, ((_300 - _299) * _300) + (_299 * (_299 - _298)))), 1.75f, (_300 + _299) + _298);
    float _321 = _309 - 0.4000000059604644775390625f;
    float _326 = max(1.0f - abs(_321 * 2.5f), 0.0f);
    float _333 = mad(mad(clamp(mad(_321, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_326, _326, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _341 = ((_320 <= 0.1599999964237213134765625f) ? _333 : ((_320 >= 0.4799999892711639404296875f) ? 0.0f : (_333 * ((0.07999999821186065673828125f / (_320 * 0.3333333432674407958984375f)) - 0.5f)))) + 1.0f;
    float _342 = _341 * _298;
    float _343 = _341 * _299;
    float _344 = _341 * _300;
    float _349 = (_343 - _344) * 1.73205077648162841796875f;
    float _351 = (_342 * 2.0f) - _343;
    float _353 = mad(-_341, _300, _351);
    float _354 = abs(_353);
    float _355 = abs(_349);
    float _359 = min(_354, _355) * (1.0f / max(_354, _355));
    float _360 = _359 * _359;
    float _364 = mad(_360, mad(_360, mad(_360, mad(_360, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _374 = mad(_359, _364, (_354 < _355) ? mad(_359 * _364, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_353 < mad(_341, _300, -_351)) ? (-3.1415927410125732421875f) : 0.0f);
    float _375 = min(_349, _353);
    float _376 = max(_349, _353);
    float _385 = ((_342 == _343) && (_344 == _343)) ? 0.0f : ((((_375 < (-_375)) && (_376 >= (-_376))) ? (-_374) : _374) * 57.295780181884765625f);
    float _388 = (_385 < 0.0f) ? (_385 + 360.0f) : _385;
    float _398 = max(1.0f - abs(((_388 < (-180.0f)) ? (_388 + 360.0f) : ((_388 > 180.0f) ? (_388 - 360.0f) : _388)) * 0.01481481455266475677490234375f), 0.0f);
    float _401 = mad(_398, -2.0f, 3.0f) * (_398 * _398);
    float3 _412 = float3(clamp(_342 + (((_309 * (_401 * _401)) * mad(-_341, _298, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_343, 0.0f, 65504.0f), clamp(_344, 0.0f, 65504.0f));
    float _416 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _412), 0.0f, 65504.0f);
    float _417 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _412), 0.0f, 65504.0f);
    float _418 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _412), 0.0f, 65504.0f);
    float _420 = dp3_f32(float3(_416, _417, _418), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _424 = mad(_416 - _420, 0.959999978542327880859375f, _420);
    float _425 = mad(_417 - _420, 0.959999978542327880859375f, _420);
    float _426 = mad(_418 - _420, 0.959999978542327880859375f, _420);
    float _433 = (_424 <= 0.0f) ? (-14.0f) : log2(_424);
    float _434 = (_425 <= 0.0f) ? (-14.0f) : log2(_425);
    float _435 = (_426 <= 0.0f) ? (-14.0f) : log2(_426);
    float _519;
    if (_433 <= (-17.4739322662353515625f))
    {
        _519 = -4.0f;
    }
    else
    {
        float _518;
        if (_433 < (-2.4739310741424560546875f))
        {
            float _446 = mad(_433, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _447 = _446 * 0.6643855571746826171875f;
            int _448 = cvt_f32_i32(_447);
            float _451 = mad(_446, 0.6643855571746826171875f, -trunc(_447));
            uint _458 = min(uint(_448), 6u);
            uint _465 = min(uint(_448 + 1), 6u);
            uint _469 = min(uint(_448 + 2), 6u);
            float2 _475 = float2(_188[_458].x, _188[_465].x);
            _518 = dp3_f32(float3(_451 * _451, _451, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_458].x, _188[_465].x, _188[_469].x)), dp2_f32(float2(-1.0f, 1.0f), _475), dp2_f32(0.5f.xx, _475)));
        }
        else
        {
            float _517;
            if (_433 < 15.52606868743896484375f)
            {
                float _485 = mad(_433, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _486 = _485 * 0.55365467071533203125f;
                int _487 = cvt_f32_i32(_486);
                float _490 = mad(_485, 0.55365467071533203125f, -trunc(_486));
                uint _497 = min(uint(_487), 6u);
                uint _501 = min(uint(_487 + 1), 6u);
                uint _505 = min(uint(_487 + 2), 6u);
                float2 _511 = float2(_188[_497].y, _188[_501].y);
                _517 = dp3_f32(float3(_490 * _490, _490, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_497].y, _188[_501].y, _188[_505].y)), dp2_f32(float2(-1.0f, 1.0f), _511), dp2_f32(0.5f.xx, _511)));
            }
            else
            {
                _517 = 4.0f;
            }
            _518 = _517;
        }
        _519 = _518;
    }
    float _599;
    if (_434 <= (-17.4739322662353515625f))
    {
        _599 = -4.0f;
    }
    else
    {
        float _598;
        if (_434 < (-2.4739310741424560546875f))
        {
            float _529 = mad(_434, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _530 = _529 * 0.6643855571746826171875f;
            int _531 = cvt_f32_i32(_530);
            float _534 = mad(_529, 0.6643855571746826171875f, -trunc(_530));
            uint _541 = min(uint(_531), 6u);
            uint _545 = min(uint(_531 + 1), 6u);
            uint _549 = min(uint(_531 + 2), 6u);
            float2 _555 = float2(_188[_541].x, _188[_545].x);
            _598 = dp3_f32(float3(_534 * _534, _534, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_541].x, _188[_545].x, _188[_549].x)), dp2_f32(float2(-1.0f, 1.0f), _555), dp2_f32(0.5f.xx, _555)));
        }
        else
        {
            float _597;
            if (_434 < 15.52606868743896484375f)
            {
                float _565 = mad(_434, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _566 = _565 * 0.55365467071533203125f;
                int _567 = cvt_f32_i32(_566);
                float _570 = mad(_565, 0.55365467071533203125f, -trunc(_566));
                uint _577 = min(uint(_567), 6u);
                uint _581 = min(uint(_567 + 1), 6u);
                uint _585 = min(uint(_567 + 2), 6u);
                float2 _591 = float2(_188[_577].y, _188[_581].y);
                _597 = dp3_f32(float3(_570 * _570, _570, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_577].y, _188[_581].y, _188[_585].y)), dp2_f32(float2(-1.0f, 1.0f), _591), dp2_f32(0.5f.xx, _591)));
            }
            else
            {
                _597 = 4.0f;
            }
            _598 = _597;
        }
        _599 = _598;
    }
    float _679;
    if (_435 <= (-17.4739322662353515625f))
    {
        _679 = -4.0f;
    }
    else
    {
        float _678;
        if (_435 < (-2.4739310741424560546875f))
        {
            float _609 = mad(_435, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _610 = _609 * 0.6643855571746826171875f;
            int _611 = cvt_f32_i32(_610);
            float _614 = mad(_609, 0.6643855571746826171875f, -trunc(_610));
            uint _621 = min(uint(_611), 6u);
            uint _625 = min(uint(_611 + 1), 6u);
            uint _629 = min(uint(_611 + 2), 6u);
            float2 _635 = float2(_188[_621].x, _188[_625].x);
            _678 = dp3_f32(float3(_614 * _614, _614, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_621].x, _188[_625].x, _188[_629].x)), dp2_f32(float2(-1.0f, 1.0f), _635), dp2_f32(0.5f.xx, _635)));
        }
        else
        {
            float _677;
            if (_435 < 15.52606868743896484375f)
            {
                float _645 = mad(_435, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _646 = _645 * 0.55365467071533203125f;
                int _647 = cvt_f32_i32(_646);
                float _650 = mad(_645, 0.55365467071533203125f, -trunc(_646));
                uint _657 = min(uint(_647), 6u);
                uint _661 = min(uint(_647 + 1), 6u);
                uint _665 = min(uint(_647 + 2), 6u);
                float2 _671 = float2(_188[_657].y, _188[_661].y);
                _677 = dp3_f32(float3(_650 * _650, _650, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_188[_657].y, _188[_661].y, _188[_665].y)), dp2_f32(float2(-1.0f, 1.0f), _671), dp2_f32(0.5f.xx, _671)));
            }
            else
            {
                _677 = 4.0f;
            }
            _678 = _677;
        }
        _679 = _678;
    }
    float3 _682 = float3(exp2(_519 * 3.3219280242919921875f), exp2(_599 * 3.3219280242919921875f), exp2(_679 * 3.3219280242919921875f));
    float3 _686 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _682), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _682), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _682));
    float _687 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _686);
    float _688 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _686);
    float _689 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _686);
    float _693 = (_687 <= 0.0f) ? (-4.0f) : (log2(_687) * 0.3010300099849700927734375f);
    float _698 = log2(cb0_m[19u].y);
    float _699 = _698 * 0.3010300099849700927734375f;
    float _807;
    if (_699 >= _693)
    {
        _807 = mad(cb0_m[21u].x, _693, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_699 * cb0_m[21u].x));
    }
    else
    {
        float _716 = log2(cb0_m[20u].x);
        float _717 = _716 * 0.3010300099849700927734375f;
        float _806;
        if ((_699 < _693) && (_717 > _693))
        {
            float _726 = (mad(_698, -0.3010300099849700927734375f, _693) * 7.0f) / (_717 - _699);
            int _727 = cvt_f32_i32(_726);
            float _729 = _726 - trunc(_726);
            uint _731 = uint(_727 + 1);
            uint _733 = uint(_727 + 2);
            uint _735 = uint(_727);
            float2 _747 = float2(cb0_m[_735].x, cb0_m[_731].x);
            _806 = dp3_f32(float3(_729 * _729, _729, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_735].x, cb0_m[_731].x, cb0_m[_733].x)), dp2_f32(float2(-1.0f, 1.0f), _747), dp2_f32(0.5f.xx, _747)));
        }
        else
        {
            float _757 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _805;
            if ((_717 <= _693) && (_757 > _693))
            {
                float _766 = (mad(_716, -0.3010300099849700927734375f, _693) * 7.0f) / (_757 - _717);
                int _767 = cvt_f32_i32(_766);
                float _769 = _766 - trunc(_766);
                uint _774 = uint(_767 + 10);
                uint _779 = uint((_767 + 1) + 10);
                uint _784 = uint((_767 + 2) + 10);
                float2 _790 = float2(cb0_m[_774].x, cb0_m[_779].x);
                _805 = dp3_f32(float3(_769 * _769, _769, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_774].x, cb0_m[_779].x, cb0_m[_784].x)), dp2_f32(float2(-1.0f, 1.0f), _790), dp2_f32(0.5f.xx, _790)));
            }
            else
            {
                _805 = mad(cb0_m[21u].y, _693, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_757 * cb0_m[21u].y));
            }
            _806 = _805;
        }
        _807 = _806;
    }
    float _813 = (_688 <= 0.0f) ? (-4.0f) : (log2(_688) * 0.3010300099849700927734375f);
    float _921;
    if (_699 >= _813)
    {
        _921 = mad(cb0_m[21u].x, _813, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_699 * cb0_m[21u].x));
    }
    else
    {
        float _830 = log2(cb0_m[20u].x);
        float _831 = _830 * 0.3010300099849700927734375f;
        float _920;
        if ((_699 < _813) && (_831 > _813))
        {
            float _840 = (mad(_698, -0.3010300099849700927734375f, _813) * 7.0f) / (_831 - _699);
            int _841 = cvt_f32_i32(_840);
            float _843 = _840 - trunc(_840);
            uint _845 = uint(_841 + 1);
            uint _847 = uint(_841 + 2);
            uint _849 = uint(_841);
            float2 _861 = float2(cb0_m[_849].x, cb0_m[_845].x);
            _920 = dp3_f32(float3(_843 * _843, _843, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_849].x, cb0_m[_845].x, cb0_m[_847].x)), dp2_f32(float2(-1.0f, 1.0f), _861), dp2_f32(0.5f.xx, _861)));
        }
        else
        {
            float _871 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _919;
            if ((_831 <= _813) && (_871 > _813))
            {
                float _880 = (mad(_830, -0.3010300099849700927734375f, _813) * 7.0f) / (_871 - _831);
                int _881 = cvt_f32_i32(_880);
                float _883 = _880 - trunc(_880);
                uint _888 = uint(_881 + 10);
                uint _893 = uint((_881 + 1) + 10);
                uint _898 = uint((_881 + 2) + 10);
                float2 _904 = float2(cb0_m[_888].x, cb0_m[_893].x);
                _919 = dp3_f32(float3(_883 * _883, _883, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_888].x, cb0_m[_893].x, cb0_m[_898].x)), dp2_f32(float2(-1.0f, 1.0f), _904), dp2_f32(0.5f.xx, _904)));
            }
            else
            {
                _919 = mad(cb0_m[21u].y, _813, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_871 * cb0_m[21u].y));
            }
            _920 = _919;
        }
        _921 = _920;
    }
    float _927 = (_689 <= 0.0f) ? (-4.0f) : (log2(_689) * 0.3010300099849700927734375f);
    float _1035;
    if (_699 >= _927)
    {
        _1035 = mad(cb0_m[21u].x, _927, (log2(cb0_m[19u].z) * 0.3010300099849700927734375f) - (_699 * cb0_m[21u].x));
    }
    else
    {
        float _944 = log2(cb0_m[20u].x);
        float _945 = _944 * 0.3010300099849700927734375f;
        float _1034;
        if ((_699 < _927) && (_945 > _927))
        {
            float _954 = (mad(_698, -0.3010300099849700927734375f, _927) * 7.0f) / (_945 - _699);
            int _955 = cvt_f32_i32(_954);
            float _957 = _954 - trunc(_954);
            uint _959 = uint(_955 + 1);
            uint _961 = uint(_955 + 2);
            uint _963 = uint(_955);
            float2 _975 = float2(cb0_m[_963].x, cb0_m[_959].x);
            _1034 = dp3_f32(float3(_957 * _957, _957, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_963].x, cb0_m[_959].x, cb0_m[_961].x)), dp2_f32(float2(-1.0f, 1.0f), _975), dp2_f32(0.5f.xx, _975)));
        }
        else
        {
            float _985 = log2(cb0_m[20u].z) * 0.3010300099849700927734375f;
            float _1033;
            if ((_945 <= _927) && (_985 > _927))
            {
                float _994 = (mad(_944, -0.3010300099849700927734375f, _927) * 7.0f) / (_985 - _945);
                int _995 = cvt_f32_i32(_994);
                float _997 = _994 - trunc(_994);
                uint _1002 = uint(_995 + 10);
                uint _1007 = uint((_995 + 1) + 10);
                uint _1012 = uint((_995 + 2) + 10);
                float2 _1018 = float2(cb0_m[_1002].x, cb0_m[_1007].x);
                _1033 = dp3_f32(float3(_997 * _997, _997, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb0_m[_1002].x, cb0_m[_1007].x, cb0_m[_1012].x)), dp2_f32(float2(-1.0f, 1.0f), _1018), dp2_f32(0.5f.xx, _1018)));
            }
            else
            {
                _1033 = mad(cb0_m[21u].y, _927, (log2(cb0_m[20u].w) * 0.3010300099849700927734375f) - (_985 * cb0_m[21u].y));
            }
            _1034 = _1033;
        }
        _1035 = _1034;
    }
    float3 _1041 = float3(exp2(_807 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_921 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1035 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
    float3 _1045 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1041), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1041), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1041));
    float3 _1049 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1045), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1045), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1045));
    float _1058 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1049) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1069 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1049) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    float _1079 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1049) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
    u0[uint2(_267, _268)] = float4(min(exp2(log2(mad(_1058, 18.8515625f, 0.8359375f) / mad(_1058, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1069, 18.8515625f, 0.8359375f) / mad(_1069, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1079, 18.8515625f, 0.8359375f) / mad(_1079, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
