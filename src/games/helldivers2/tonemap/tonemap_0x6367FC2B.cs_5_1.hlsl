#include "../common.hlsl"

struct _377
{
    uint2 _m0;
    uint _m1;
};

static const float _57[1] = { 0.0f };
static const float4 _280[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

cbuffer cb0_buf : register(b0)
{
    uint4 cb0_m[44] : packoffset(c0);
};

cbuffer cb1_buf : register(b1)
{
    float4 cb1_m[4096] : packoffset(c0);
};

cbuffer cb2_buf : register(b2)
{
    uint4 cb2_m0 : packoffset(c0);
    uint4 cb2_m1 : packoffset(c1);
    float2 cb2_m2 : packoffset(c2);
    float2 cb2_m3 : packoffset(c2.z);
    float4 cb2_m4 : packoffset(c3);
    float3 cb2_m5 : packoffset(c4);
    uint cb2_m6 : packoffset(c4.w);
    float4 cb2_m7 : packoffset(c5);
    float4 cb2_m8 : packoffset(c6);
    float2 cb2_m9 : packoffset(c7);
    float2 cb2_m10 : packoffset(c7.z);
    uint4 cb2_m11 : packoffset(c8);
    uint4 cb2_m12 : packoffset(c9);
    float4 cb2_m13 : packoffset(c10);
    float4 cb2_m14 : packoffset(c11);
};

SamplerState s0 : register(s0);
SamplerState s1 : register(s1);
SamplerState s2 : register(s2);
SamplerState s3 : register(s3);
SamplerState s4 : register(s4);
SamplerState s5 : register(s5);
SamplerState s6 : register(s6);
Buffer<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t6 : register(t6);
Texture2D<float4> t7 : register(t7);
Texture2D<float4> t8 : register(t8);
Buffer<float4> t9 : register(t9);
Buffer<float4> t10 : register(t10);
RWTexture2D<float4> u0 : register(u0);

static uint3 gl_LocalInvocationID;
static uint3 gl_GlobalInvocationID;
struct SPIRV_Cross_Input
{
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

groupshared float g0[1];

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
    precise float _368 = a.x * b.x;
    return mad(a.y, b.y, _368);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _354 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _354));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _336 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _336)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _376_dummy_parameter;
    _377 _378 = { spvImageSize(u0, _376_dummy_parameter), 1u };
    uint _393 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _397 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_393, 1u, 3u);
    uint _398 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _393, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _405 = (float(_397) + 0.5f) / float(_378._m0.x);
    float _406 = (float(_398) + 0.5f) / float(_378._m0.y);
    bool _409 = (_378._m0.x < _397) || (_378._m0.y < _398);
    bool _414 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _414) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _429 = float2(_405, _406);
    float _434 = mad(t4.SampleLevel(s3, _429, 0.0f).x, 2.0f, -1.0f);
    float _449;
    if (_434 > 0.0f)
    {
        _449 = min(sqrt(_434), t0.Load(8u).x);
    }
    else
    {
        _449 = max(_434, -t0.Load(7u).x);
    }
    bool _460 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
    bool _464 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
    float4 _468 = t1.SampleLevel(s0, _429, 0.0f);
    float _469 = _468.x;
    float _470 = _468.y;
    float _471 = _468.z;
    float _539;
    float _540;
    float _541;
    if (_464 || _460)
    {
        float4 _478 = t3.SampleLevel(s2, _429, 0.0f);
        float2 _487 = float2(_478.x * cb2_m2.x, _478.y * cb2_m2.y);
        float _501 = exp2(max(_460 ? clamp((sqrt(dp2_f32(_487, _487)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _464 ? clamp((abs(_449) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float4 _505 = t2.SampleLevel(s1, _429, 0.0f);
        float _506 = _505.x;
        float _507 = _505.y;
        float _508 = _505.z;
        float _514 = asfloat(cb0_m[43u].w) * 20.0f;
        float _525 = mad(t7.SampleLevel(s5, float2(mad(_405, 30.0f, sin(_514)), mad(_406, 30.0f, cos(_514))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
        float _529 = sqrt(max(max(_506, max(_507, _508)), 1.0000000133514319600180897396058e-10f));
        float _530 = mad(_525, _529, _506);
        float _531 = mad(_525, _529, _507);
        float _532 = mad(_525, _529, _508);
        _539 = mad(_501, _471 - _532, _532);
        _540 = mad(_501, _470 - _531, _531);
        _541 = mad(_501, _469 - _530, _530);
    }
    else
    {
        _539 = _471;
        _540 = _470;
        _541 = _469;
    }
    float _546 = _414 ? g0[0u] : cb2_m3.x;
    float4 _550 = t5.SampleLevel(s4, _429, 0.0f);
    float _551 = _550.x;
    float _559 = max(cb2_m4.y - dp3_f32(float3(_551, _550.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _563 = mad(_546, _541, _551 / _559);
    float _564 = mad(_546, _540, _550.y / _559);
    float _565 = mad(_546, _539, _550.z / _559);
    float _569 = 1.0f / (max(_563, max(_565, _564)) + 1.0f);
    float _570 = _563 * _569;
    float _572 = _569 * _565;
    float3 _573 = float3(_570, _572, _569 * _564);
    float _574 = dp3_f32(_573, float3(0.25f, 0.25f, 0.5f));
    float _575 = dp3_f32(_573, float3(-0.25f, -0.25f, 0.5f));
    float _577 = dp2_f32(float2(_570, _572), float2(0.5f, -0.5f));
    float _578 = _574 - _575;
    float _579 = _577 + _578;
    float _580 = _574 + _575;
    float _581 = _578 - _577;
    bool _582 = !_409;
    float _956;
    float _957;
    float _958;
    if (_582)
    {
        float _586 = dp3_f32(float3(_579, _580, _581), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _594 = mad(-abs(_449), cb2_m9.y, 1.0f) * cb2_m8.x;
        float _598 = mad(_594, _579 - _586, _586);
        float _599 = mad(_594, _580 - _586, _586);
        float _600 = mad(_594, _581 - _586, _586);
        float _601 = _405 - 0.5f;
        float _602 = _406 - 0.5f;
        float _603 = _602 + _602;
        float _604 = _601 + _601;
        float _605 = abs(_604);
        float _606 = abs(_603);
        float _610 = min(_605, _606) * (1.0f / max(_605, _606));
        float _611 = _610 * _610;
        float _615 = mad(_611, mad(_611, mad(_611, mad(_611, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _624 = mad(_610, _615, (_605 < _606) ? mad(_610 * _615, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_604) > _604) ? (-3.1415927410125732421875f) : 0.0f);
        float _625 = min(_603, _604);
        float _626 = max(_603, _604);
        float _633 = ((_625 < (-_625)) && (_626 >= (-_626))) ? (-_624) : _624;
        float4 _637 = t8.SampleLevel(s6, _429, 0.0f);
        float _638 = _637.x;
        float _639 = _637.y;
        float _640 = _637.z;
        float _641 = _637.w;
        float _646 = (_599 - _600) * 1.73205077648162841796875f;
        float _648 = mad(_598, 2.0f, -_599);
        float _649 = _648 - _600;
        float _650 = abs(_646);
        float _651 = abs(_649);
        float _655 = min(_650, _651) * (1.0f / max(_650, _651));
        float _656 = _655 * _655;
        float _660 = mad(_656, mad(_656, mad(_656, mad(_656, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _669 = mad(_655, _660, (_650 > _651) ? mad(_655 * _660, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_649 < (_600 - _648)) ? (-3.1415927410125732421875f) : 0.0f);
        float _670 = min(_646, _649);
        float _671 = max(_646, _649);
        float _680 = ((_598 == _599) && (_600 == _599)) ? 0.0f : ((((_670 < (-_670)) && (_671 >= (-_671))) ? (-_669) : _669) * 57.295780181884765625f);
        float _689 = mad(cb2_m14.x, -360.0f, (_680 < 0.0f) ? (_680 + 360.0f) : _680);
        float _699 = clamp(1.0f - (abs((_689 < (-180.0f)) ? (_689 + 360.0f) : ((_689 > 180.0f) ? (_689 - 360.0f) : _689)) / (cb2_m14.y * 180.0f)), 0.0f, 1.0f);
        float _704 = dp3_f32(float3(_598, _599, _600), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _707 = (mad(_699, -2.0f, 3.0f) * (_699 * _699)) * cb2_m14.z;
        float _719 = mad(mad(_707, _598 - _704, _704) - _598, cb2_m13.x, _598);
        float _720 = mad(cb2_m13.x, mad(_707, _599 - _704, _704) - _599, _599);
        float _721 = mad(cb2_m13.x, mad(_707, _600 - _704, _704) - _600, _600);
        float _723;
        _723 = 0.0f;
        float _724;
        uint _727;
        uint _726 = 0u;
        for (;;)
        {
            if (_726 >= 8u)
            {
                break;
            }
            uint _738 = min((_726 & 3u), 10u);
            float _758 = mad(float(_726), 0.785398185253143310546875f, -_633);
            float _759 = _758 + 1.57079637050628662109375f;
            _724 = mad(_641 * (dp4_f32(t9.Load((_726 >> 2u) + 10u), float4(_280[_738].x, _280[_738].y, _280[_738].z, _280[_738].w)) * clamp((abs((_759 > 3.1415927410125732421875f) ? (_758 - 4.7123889923095703125f) : _759) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _723, _723);
            _727 = _726 + 1u;
            _723 = _724;
            _726 = _727;
            continue;
        }
        float _770 = clamp(_723, 0.0f, 1.0f);
        float _783 = asfloat(cb0_m[43u].w);
        float _789 = abs(t9.Load(8u).x);
        float2 _792 = float2(_601 * 1.40999996662139892578125f, _602 * 1.40999996662139892578125f);
        float _794 = sqrt(dp2_f32(_792, _792));
        float _795 = min(_794, 1.0f);
        float _796 = _795 * _795;
        float _801 = clamp(_794 - 0.5f, 0.0f, 1.0f);
        float _804 = (_795 * _796) + (mad(-_795, _796, 1.0f) * (_801 * _801));
        float _805 = mad(mad(mad(sin(_783 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _789, -1.0f);
        float _807 = _639 + _805;
        float _809 = clamp((_640 + _805) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _816 = clamp(_807 + _807, 0.0f, 1.0f);
        float _833 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _839 = mad(sin(_639 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_833)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _841 = _839 * 0.02999999932944774627685546875f;
        float _842 = mad(_789, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _846 = mad(mad(-_804, _804, 1.0f), 1.0f - _842, _842);
        float _847 = min((exp2(log2(_804) * 0.699999988079071044921875f) * (mad(_816, -2.0f, 3.0f) * (_816 * _816))) + (mad(_809, -2.0f, 3.0f) * (_809 * _809)), 1.0f);
        float _857 = mad(_847, mad(_846, _839 * 0.62000000476837158203125f, mad(_719, _770, -_719)), mad(-_719, _770, _719));
        float _858 = mad(_847, mad(_846, _841, mad(_770, _720, -_720)), mad(-_770, _720, _720));
        float _859 = mad(_847, mad(_846, _841, mad(_770, _721, -_721)), mad(-_770, _721, _721));
        float _862 = mad(_639, _640 * (1.0f - _641), _641);
        float _864;
        _864 = 0.0f;
        float _865;
        uint _868;
        uint _867 = 0u;
        for (;;)
        {
            if (int(_867) >= 8)
            {
                break;
            }
            float4 _875 = t9.Load(_867);
            float _877 = _875.y;
            float _879 = _875.x - _633;
            _865 = mad(_862 * (_875.w * clamp((abs((_879 > 3.1415927410125732421875f) ? (_879 - 6.283185482025146484375f) : ((_879 < (-3.1415927410125732421875f)) ? (_879 + 6.283185482025146484375f) : _879)) + (_877 - 3.1415927410125732421875f)) / max(_877 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _864, _864);
            _868 = _867 + 1u;
            _864 = _865;
            _867 = _868;
            continue;
        }
        float _898 = clamp(_864 + _864, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _902 = mad(0.310000002384185791015625f - _857, _898, _857);
        float _903 = mad(0.014999999664723873138427734375f - _858, _898, _858);
        float _904 = mad(0.014999999664723873138427734375f - _859, _898, _859);
        float4 _905 = t9.Load(12u);
        float _906 = _905.x;
        float _934;
        float _935;
        float _936;
        if (_906 != 0.0f)
        {
            float _913 = clamp(_833, 0.0f, 1.0f);
            float _923 = clamp((_638 + (_906 - 1.0f)) / max(mad(_906, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _927 = clamp(_906 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _930 = mad(_927, -2.0f, 3.0f) * (_927 * _927);
            _934 = mad(((_638 * 0.930000007152557373046875f) * _913) * _923, _930, _904);
            _935 = mad(((_638 * 0.85000002384185791015625f) * _913) * _923, _930, _903);
            _936 = mad(((_638 * 0.790000021457672119140625f) * _913) * _923, _930, _902);
        }
        else
        {
            _934 = _904;
            _935 = _903;
            _936 = _902;
        }
        bool _939 = cb2_m13.y > 0.0f;
        bool _943 = frac((_406 * 420.0f) + (_783 * 0.20000000298023223876953125f)) >= 0.5f;
        float _944 = _943 ? 0.300000011920928955078125f : 0.0f;
        float _945 = _944 * cb2_m13.y;
        _956 = _939 ? mad(_945, 0.0f - _936, _936) : _936;
        _957 = _939 ? mad(_945, (_943 ? 0.100000001490116119384765625f : 0.0f) - _935, _935) : _935;
        _958 = _939 ? mad(_945, _944 - _934, _934) : _934;
    }
    else
    {
        _956 = _579;
        _957 = _580;
        _958 = _581;
    }
    float _963 = 1.0f / max(1.0f - max(max(_957, _958), _956), 6.099999882280826568603515625e-05f);
    float _970 = min(-(_963 * _956), 0.0f);
    float _971 = min(-(_963 * _957), 0.0f);
    float _972 = min(-(_963 * _958), 0.0f);
    float2 _975 = float2(_405 - 0.5f, _406 - 0.5f);
    float _986 = clamp(-((sqrt(dp2_f32(_975, _975)) - cb2_m7.x) * (1.0f / cb2_m7.y)), 0.0f, 1.0f);
    float _987 = mad(_986, -2.0f, 3.0f);
    float _988 = _986 * _986;
    float _989 = _987 * _988;
    float _991 = mad(-_987, _988, 1.0f);
    float _1014 = cb2_m7.z * cb2_m7.w;
    float3 _1027 = float3(_409 ? (-_970) : mad(_970 + ((_991 * cb2_m5.x) - (_970 * _989)), _1014, -_970), _409 ? (-_971) : mad(_1014, ((_991 * cb2_m5.y) - (_989 * _971)) + _971, -_971), _409 ? (-_972) : mad(_1014, ((_991 * cb2_m5.z) - (_989 * _972)) + _972, -_972));
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
        aces_parameters.coefficients[i] = cb1_m[i].x;
    }
    aces_parameters.low_input = cb1_m[19u].y;
    aces_parameters.low_output = cb1_m[19u].z;
    aces_parameters.middle_input = cb1_m[20u].x;
    aces_parameters.high_input = cb1_m[20u].z;
    aces_parameters.high_output = cb1_m[20u].w;
    aces_parameters.low_slope = cb1_m[21u].x;
    aces_parameters.high_slope = cb1_m[21u].y;
    aces_parameters.target_peak_nits = RENODX_PEAK_WHITE_NITS;
    aces_parameters.diffuse_white_nits = RENODX_DIFFUSE_WHITE_NITS;

    if (RENODX_TONE_MAP_TYPE != 0.f) {
         if (_582) {
            float3 scene_color = _1027;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[uint2(_397, _398)] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1034 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1027) * 2.5f, 65504.0f);
    float _1035 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1027) * 2.5f, 65504.0f);
    float _1036 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1027) * 2.5f, 65504.0f);
    float _1040 = max(max(_1035, _1034), _1036);
    float _1045 = (max(_1040, 9.9999997473787516355514526367188e-05f) - max(min(min(_1035, _1034), _1036), 9.9999997473787516355514526367188e-05f)) / max(_1040, 0.00999999977648258209228515625f);
    float _1056 = mad(sqrt(mad(_1034 - _1036, _1034, ((_1036 - _1035) * _1036) + ((_1035 - _1034) * _1035))), 1.75f, (_1036 + _1035) + _1034);
    float _1057 = _1045 - 0.4000000059604644775390625f;
    float _1061 = max(1.0f - abs(_1057 * 2.5f), 0.0f);
    float _1069 = mad(mad(clamp(mad(_1057, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1061, _1061, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1077 = ((_1056 <= 0.1599999964237213134765625f) ? _1069 : ((_1056 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1056 * 0.3333333432674407958984375f)) - 0.5f) * _1069))) + 1.0f;
    float _1078 = _1077 * _1034;
    float _1079 = _1077 * _1035;
    float _1080 = _1077 * _1036;
    float _1085 = (_1079 - _1080) * 1.73205077648162841796875f;
    float _1087 = (_1078 * 2.0f) - _1079;
    float _1089 = mad(-_1077, _1036, _1087);
    float _1090 = abs(_1089);
    float _1091 = abs(_1085);
    float _1095 = min(_1090, _1091) * (1.0f / max(_1090, _1091));
    float _1096 = _1095 * _1095;
    float _1100 = mad(_1096, mad(_1096, mad(_1096, mad(_1096, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1110 = mad(_1095, _1100, (_1090 < _1091) ? mad(_1095 * _1100, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1089 < mad(_1077, _1036, -_1087)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1111 = min(_1085, _1089);
    float _1112 = max(_1085, _1089);
    float _1121 = ((_1078 == _1079) && (_1080 == _1079)) ? 0.0f : ((((_1111 < (-_1111)) && (_1112 >= (-_1112))) ? (-_1110) : _1110) * 57.295780181884765625f);
    float _1124 = (_1121 < 0.0f) ? (_1121 + 360.0f) : _1121;
    float _1134 = max(1.0f - abs(((_1124 < (-180.0f)) ? (_1124 + 360.0f) : ((_1124 > 180.0f) ? (_1124 - 360.0f) : _1124)) * 0.01481481455266475677490234375f), 0.0f);
    float _1137 = mad(_1134, -2.0f, 3.0f) * (_1134 * _1134);
    float3 _1148 = float3(clamp(_1078 + (((_1045 * (_1137 * _1137)) * mad(-_1077, _1034, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1079, 0.0f, 65504.0f), clamp(_1080, 0.0f, 65504.0f));
    float _1152 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1148), 0.0f, 65504.0f);
    float _1153 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1148), 0.0f, 65504.0f);
    float _1154 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1148), 0.0f, 65504.0f);
    float _1156 = dp3_f32(float3(_1152, _1153, _1154), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1160 = mad(_1152 - _1156, 0.959999978542327880859375f, _1156);
    float _1161 = mad(_1153 - _1156, 0.959999978542327880859375f, _1156);
    float _1162 = mad(_1154 - _1156, 0.959999978542327880859375f, _1156);
    float _1169 = (_1160 <= 0.0f) ? (-14.0f) : log2(_1160);
    float _1170 = (_1161 <= 0.0f) ? (-14.0f) : log2(_1161);
    float _1171 = (_1162 <= 0.0f) ? (-14.0f) : log2(_1162);
    float _1258;
    if (_1169 <= (-17.4739322662353515625f))
    {
        _1258 = -4.0f;
    }
    else
    {
        float _1257;
        if (_1169 < (-2.4739310741424560546875f))
        {
            float _1182 = mad(_1169, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1183 = _1182 * 0.6643855571746826171875f;
            int _1184 = cvt_f32_i32(_1183);
            float _1187 = mad(_1182, 0.6643855571746826171875f, -trunc(_1183));
            uint _1193 = min(uint(_1184 + 4), 10u);
            uint _1199 = min(uint((_1184 + 1) + 4), 10u);
            uint _1205 = min(uint((_1184 + 2) + 4), 10u);
            float2 _1211 = float2(_280[_1193].x, _280[_1199].x);
            _1257 = dp3_f32(float3(_1187 * _1187, _1187, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1193].x, _280[_1199].x, _280[_1205].x)), dp2_f32(float2(-1.0f, 1.0f), _1211), dp2_f32(0.5f.xx, _1211)));
        }
        else
        {
            float _1256;
            if (_1169 < 15.52606868743896484375f)
            {
                float _1221 = mad(_1169, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1222 = _1221 * 0.55365467071533203125f;
                int _1223 = cvt_f32_i32(_1222);
                float _1226 = mad(_1221, 0.55365467071533203125f, -trunc(_1222));
                uint _1232 = min(uint(_1223 + 4), 10u);
                uint _1238 = min(uint((_1223 + 1) + 4), 10u);
                uint _1244 = min(uint((_1223 + 2) + 4), 10u);
                float2 _1250 = float2(_280[_1232].y, _280[_1238].y);
                _1256 = dp3_f32(float3(_1226 * _1226, _1226, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1232].y, _280[_1238].y, _280[_1244].y)), dp2_f32(float2(-1.0f, 1.0f), _1250), dp2_f32(0.5f.xx, _1250)));
            }
            else
            {
                _1256 = 4.0f;
            }
            _1257 = _1256;
        }
        _1258 = _1257;
    }
    float _1344;
    if (_1170 <= (-17.4739322662353515625f))
    {
        _1344 = -4.0f;
    }
    else
    {
        float _1343;
        if (_1170 < (-2.4739310741424560546875f))
        {
            float _1268 = mad(_1170, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1269 = _1268 * 0.6643855571746826171875f;
            int _1270 = cvt_f32_i32(_1269);
            float _1273 = mad(_1268, 0.6643855571746826171875f, -trunc(_1269));
            uint _1279 = min(uint(_1270 + 4), 10u);
            uint _1285 = min(uint((_1270 + 1) + 4), 10u);
            uint _1291 = min(uint((_1270 + 2) + 4), 10u);
            float2 _1297 = float2(_280[_1279].x, _280[_1285].x);
            _1343 = dp3_f32(float3(_1273 * _1273, _1273, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1279].x, _280[_1285].x, _280[_1291].x)), dp2_f32(float2(-1.0f, 1.0f), _1297), dp2_f32(0.5f.xx, _1297)));
        }
        else
        {
            float _1342;
            if (_1170 < 15.52606868743896484375f)
            {
                float _1307 = mad(_1170, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1308 = _1307 * 0.55365467071533203125f;
                int _1309 = cvt_f32_i32(_1308);
                float _1312 = mad(_1307, 0.55365467071533203125f, -trunc(_1308));
                uint _1318 = min(uint(_1309 + 4), 10u);
                uint _1324 = min(uint((_1309 + 1) + 4), 10u);
                uint _1330 = min(uint((_1309 + 2) + 4), 10u);
                float2 _1336 = float2(_280[_1318].y, _280[_1324].y);
                _1342 = dp3_f32(float3(_1312 * _1312, _1312, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1318].y, _280[_1324].y, _280[_1330].y)), dp2_f32(float2(-1.0f, 1.0f), _1336), dp2_f32(0.5f.xx, _1336)));
            }
            else
            {
                _1342 = 4.0f;
            }
            _1343 = _1342;
        }
        _1344 = _1343;
    }
    float _1430;
    if (_1171 <= (-17.4739322662353515625f))
    {
        _1430 = -4.0f;
    }
    else
    {
        float _1429;
        if (_1171 < (-2.4739310741424560546875f))
        {
            float _1354 = mad(_1171, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1355 = _1354 * 0.6643855571746826171875f;
            int _1356 = cvt_f32_i32(_1355);
            float _1359 = mad(_1354, 0.6643855571746826171875f, -trunc(_1355));
            uint _1365 = min(uint(_1356 + 4), 10u);
            uint _1371 = min(uint((_1356 + 1) + 4), 10u);
            uint _1377 = min(uint((_1356 + 2) + 4), 10u);
            float2 _1383 = float2(_280[_1365].x, _280[_1371].x);
            _1429 = dp3_f32(float3(_1359 * _1359, _1359, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1365].x, _280[_1371].x, _280[_1377].x)), dp2_f32(float2(-1.0f, 1.0f), _1383), dp2_f32(0.5f.xx, _1383)));
        }
        else
        {
            float _1428;
            if (_1171 < 15.52606868743896484375f)
            {
                float _1393 = mad(_1171, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1394 = _1393 * 0.55365467071533203125f;
                int _1395 = cvt_f32_i32(_1394);
                float _1398 = mad(_1393, 0.55365467071533203125f, -trunc(_1394));
                uint _1404 = min(uint(_1395 + 4), 10u);
                uint _1410 = min(uint((_1395 + 1) + 4), 10u);
                uint _1416 = min(uint((_1395 + 2) + 4), 10u);
                float2 _1422 = float2(_280[_1404].y, _280[_1410].y);
                _1428 = dp3_f32(float3(_1398 * _1398, _1398, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_280[_1404].y, _280[_1410].y, _280[_1416].y)), dp2_f32(float2(-1.0f, 1.0f), _1422), dp2_f32(0.5f.xx, _1422)));
            }
            else
            {
                _1428 = 4.0f;
            }
            _1429 = _1428;
        }
        _1430 = _1429;
    }
    float3 _1433 = float3(exp2(_1258 * 3.3219280242919921875f), exp2(_1344 * 3.3219280242919921875f), exp2(_1430 * 3.3219280242919921875f));
    float3 _1437 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1433), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1433), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1433));
    float _1438 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1437);
    float _1439 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1437);
    float _1440 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1437);
    float _1444 = (_1438 <= 0.0f) ? (-4.0f) : (log2(_1438) * 0.3010300099849700927734375f);
    float _1448 = log2(cb1_m[19u].y);
    float _1449 = _1448 * 0.3010300099849700927734375f;
    float _1557;
    if (_1449 >= _1444)
    {
        _1557 = mad(cb1_m[21u].x, _1444, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1449 * cb1_m[21u].x));
    }
    else
    {
        float _1466 = log2(cb1_m[20u].x);
        float _1467 = _1466 * 0.3010300099849700927734375f;
        float _1556;
        if ((_1449 < _1444) && (_1467 > _1444))
        {
            float _1476 = (mad(_1448, -0.3010300099849700927734375f, _1444) * 7.0f) / (_1467 - _1449);
            int _1477 = cvt_f32_i32(_1476);
            float _1479 = _1476 - trunc(_1476);
            uint _1481 = uint(_1477 + 1);
            uint _1483 = uint(_1477 + 2);
            uint _1485 = uint(_1477);
            float2 _1497 = float2(cb1_m[_1485].x, cb1_m[_1481].x);
            _1556 = dp3_f32(float3(_1479 * _1479, _1479, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1485].x, cb1_m[_1481].x, cb1_m[_1483].x)), dp2_f32(float2(-1.0f, 1.0f), _1497), dp2_f32(0.5f.xx, _1497)));
        }
        else
        {
            float _1507 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1555;
            if ((_1467 <= _1444) && (_1507 > _1444))
            {
                float _1516 = (mad(_1466, -0.3010300099849700927734375f, _1444) * 7.0f) / (_1507 - _1467);
                int _1517 = cvt_f32_i32(_1516);
                float _1519 = _1516 - trunc(_1516);
                uint _1524 = uint(_1517 + 10);
                uint _1529 = uint((_1517 + 1) + 10);
                uint _1534 = uint((_1517 + 2) + 10);
                float2 _1540 = float2(cb1_m[_1524].x, cb1_m[_1529].x);
                _1555 = dp3_f32(float3(_1519 * _1519, _1519, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1524].x, cb1_m[_1529].x, cb1_m[_1534].x)), dp2_f32(float2(-1.0f, 1.0f), _1540), dp2_f32(0.5f.xx, _1540)));
            }
            else
            {
                _1555 = mad(cb1_m[21u].y, _1444, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1507 * cb1_m[21u].y));
            }
            _1556 = _1555;
        }
        _1557 = _1556;
    }
    float _1561 = (_1439 <= 0.0f) ? (-4.0f) : (log2(_1439) * 0.3010300099849700927734375f);
    float _1669;
    if (_1449 >= _1561)
    {
        _1669 = mad(cb1_m[21u].x, _1561, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1449 * cb1_m[21u].x));
    }
    else
    {
        float _1578 = log2(cb1_m[20u].x);
        float _1579 = _1578 * 0.3010300099849700927734375f;
        float _1668;
        if ((_1449 < _1561) && (_1579 > _1561))
        {
            float _1588 = (mad(_1448, -0.3010300099849700927734375f, _1561) * 7.0f) / (_1579 - _1449);
            int _1589 = cvt_f32_i32(_1588);
            float _1591 = _1588 - trunc(_1588);
            uint _1593 = uint(_1589 + 1);
            uint _1595 = uint(_1589 + 2);
            uint _1597 = uint(_1589);
            float2 _1609 = float2(cb1_m[_1597].x, cb1_m[_1593].x);
            _1668 = dp3_f32(float3(_1591 * _1591, _1591, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1597].x, cb1_m[_1593].x, cb1_m[_1595].x)), dp2_f32(float2(-1.0f, 1.0f), _1609), dp2_f32(0.5f.xx, _1609)));
        }
        else
        {
            float _1619 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1667;
            if ((_1579 <= _1561) && (_1619 > _1561))
            {
                float _1628 = (mad(_1578, -0.3010300099849700927734375f, _1561) * 7.0f) / (_1619 - _1579);
                int _1629 = cvt_f32_i32(_1628);
                float _1631 = _1628 - trunc(_1628);
                uint _1636 = uint(_1629 + 10);
                uint _1641 = uint((_1629 + 1) + 10);
                uint _1646 = uint((_1629 + 2) + 10);
                float2 _1652 = float2(cb1_m[_1636].x, cb1_m[_1641].x);
                _1667 = dp3_f32(float3(_1631 * _1631, _1631, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1636].x, cb1_m[_1641].x, cb1_m[_1646].x)), dp2_f32(float2(-1.0f, 1.0f), _1652), dp2_f32(0.5f.xx, _1652)));
            }
            else
            {
                _1667 = mad(cb1_m[21u].y, _1561, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1619 * cb1_m[21u].y));
            }
            _1668 = _1667;
        }
        _1669 = _1668;
    }
    float _1673 = (_1440 <= 0.0f) ? (-4.0f) : (log2(_1440) * 0.3010300099849700927734375f);
    float _1781;
    if (_1449 >= _1673)
    {
        _1781 = mad(cb1_m[21u].x, _1673, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1449 * cb1_m[21u].x));
    }
    else
    {
        float _1690 = log2(cb1_m[20u].x);
        float _1691 = _1690 * 0.3010300099849700927734375f;
        float _1780;
        if ((_1449 < _1673) && (_1691 > _1673))
        {
            float _1700 = (mad(_1448, -0.3010300099849700927734375f, _1673) * 7.0f) / (_1691 - _1449);
            int _1701 = cvt_f32_i32(_1700);
            float _1703 = _1700 - trunc(_1700);
            uint _1705 = uint(_1701 + 1);
            uint _1707 = uint(_1701 + 2);
            uint _1709 = uint(_1701);
            float2 _1721 = float2(cb1_m[_1709].x, cb1_m[_1705].x);
            _1780 = dp3_f32(float3(_1703 * _1703, _1703, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1709].x, cb1_m[_1705].x, cb1_m[_1707].x)), dp2_f32(float2(-1.0f, 1.0f), _1721), dp2_f32(0.5f.xx, _1721)));
        }
        else
        {
            float _1731 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1779;
            if ((_1691 <= _1673) && (_1731 > _1673))
            {
                float _1740 = (mad(_1690, -0.3010300099849700927734375f, _1673) * 7.0f) / (_1731 - _1691);
                int _1741 = cvt_f32_i32(_1740);
                float _1743 = _1740 - trunc(_1740);
                uint _1748 = uint(_1741 + 10);
                uint _1753 = uint((_1741 + 1) + 10);
                uint _1758 = uint((_1741 + 2) + 10);
                float2 _1764 = float2(cb1_m[_1748].x, cb1_m[_1753].x);
                _1779 = dp3_f32(float3(_1743 * _1743, _1743, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1748].x, cb1_m[_1753].x, cb1_m[_1758].x)), dp2_f32(float2(-1.0f, 1.0f), _1764), dp2_f32(0.5f.xx, _1764)));
            }
            else
            {
                _1779 = mad(cb1_m[21u].y, _1673, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1731 * cb1_m[21u].y));
            }
            _1780 = _1779;
        }
        _1781 = _1780;
    }
    if (_582)
    {
        float3 _1793 = float3(exp2(_1557 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1669 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1781 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _1797 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1793), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1793), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1793));
        float3 _1801 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1797), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1797), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1797));
        float _1810 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1801) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1821 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1801) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1831 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1801) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[uint2(_397, _398)] = float4(min(exp2(log2(mad(_1810, 18.8515625f, 0.8359375f) / mad(_1810, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1821, 18.8515625f, 0.8359375f) / mad(_1821, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1831, 18.8515625f, 0.8359375f) / mad(_1831, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
