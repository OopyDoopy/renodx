#include "../common.hlsl"

struct _450
{
    uint2 _m0;
    uint _m1;
};

static const float _61[1] = { 0.0f };
static const float4 _348[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    float4 cb2_m0 : packoffset(c0);
    float4 cb2_m1 : packoffset(c1);
    float2 cb2_m2 : packoffset(c2);
    float2 cb2_m3 : packoffset(c2.z);
    float cb2_m4 : packoffset(c3);
    float3 cb2_m5 : packoffset(c3.y);
    float3 cb2_m6 : packoffset(c4);
    uint cb2_m7 : packoffset(c4.w);
    float3 cb2_m8 : packoffset(c5);
    uint cb2_m9 : packoffset(c5.w);
    float3 cb2_m10 : packoffset(c6);
    float cb2_m11 : packoffset(c6.w);
    float4 cb2_m12 : packoffset(c7);
    float2 cb2_m13 : packoffset(c8);
    uint2 cb2_m14 : packoffset(c8.z);
};

cbuffer cb3_buf : register(b3)
{
    uint4 cb3_m0 : packoffset(c0);
    uint4 cb3_m1 : packoffset(c1);
    float2 cb3_m2 : packoffset(c2);
    float2 cb3_m3 : packoffset(c2.z);
    float4 cb3_m4 : packoffset(c3);
    float3 cb3_m5 : packoffset(c4);
    uint cb3_m6 : packoffset(c4.w);
    float4 cb3_m7 : packoffset(c5);
    float4 cb3_m8 : packoffset(c6);
    float2 cb3_m9 : packoffset(c7);
    float2 cb3_m10 : packoffset(c7.z);
    uint4 cb3_m11 : packoffset(c8);
    float2 cb3_m12 : packoffset(c9);
    float2 cb3_m13 : packoffset(c9.z);
    float4 cb3_m14 : packoffset(c10);
    float4 cb3_m15 : packoffset(c11);
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
    precise float _441 = a.x * b.x;
    return mad(a.y, b.y, _441);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _427 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _427));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _409 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _409)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _449_dummy_parameter;
    _450 _451 = { spvImageSize(u0, _449_dummy_parameter), 1u };
    uint _466 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _470 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_466, 1u, 3u);
    uint _471 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _466, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _478 = (float(_470) + 0.5f) / float(_451._m0.x);
    float _479 = (float(_471) + 0.5f) / float(_451._m0.y);
    bool _482 = (_451._m0.x < _470) || (_451._m0.y < _471);
    bool _487 = cb3_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _487) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _502 = float2(_478, _479);
    float _507 = mad(t4.SampleLevel(s3, _502, 0.0f).x, 2.0f, -1.0f);
    float _522;
    if (_507 > 0.0f)
    {
        _522 = min(sqrt(_507), t0.Load(8u).x);
    }
    else
    {
        _522 = max(_507, -t0.Load(7u).x);
    }
    float4 _526 = t3.SampleLevel(s2, _502, 0.0f);
    float2 _536 = float2(_526.x * cb3_m2.x, _526.y * cb3_m2.y);
    bool _548 = (cb3_m10.x != 0.0f) && (cb3_m10.y != 0.0f);
    bool _552 = (cb3_m8.w != 0.0f) && (cb3_m9.x != 0.0f);
    float _556 = abs(_522);
    float _564 = exp2(max(_548 ? clamp((sqrt(dp2_f32(_536, _536)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _552 ? clamp((_556 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _565 = _478 - 0.5f;
    float _566 = _479 - 0.5f;
    float2 _567 = float2(_565, _566);
    float _568 = dp2_f32(_567, _567);
    float _571 = mad(_568, cb3_m12.y, 1.0f);
    float _593 = mad(exp2(log2(clamp(cb3_m12.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb3_m13.x, -0.089999973773956298828125f, 1.0f);
    float _594 = (_571 * mad(cb3_m13.x, mad(cb3_m13.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), 1.0f)) * _593;
    float _595 = _593 * (_571 * mad(mad(cb3_m13.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb3_m13.x, 1.0f));
    float _596 = _593 * (_571 * mad(mad(cb3_m13.y, 0.0f, 0.04500000178813934326171875f), cb3_m13.x, 1.0f));
    float _597 = mad(_565, _594, 0.5f);
    float _598 = mad(_594, _566, 0.5f);
    float _599 = mad(_565, _595, 0.5f);
    float _600 = mad(_566, _595, 0.5f);
    float2 _603 = float2(_597, _598);
    float4 _605 = t1.SampleLevel(s0, _603, 0.0f);
    float _606 = _605.x;
    bool _607 = _552 || _548;
    float _641;
    if (_607)
    {
        float4 _613 = t2.SampleLevel(s1, _603, 0.0f);
        float _614 = _613.x;
        float _622 = asfloat(cb0_m[43u].w) * 20.0f;
        float _638 = mad(mad(t7.SampleLevel(s5, float2(mad(_597, 30.0f, sin(_622)), mad(_598, 30.0f, cos(_622))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_614, max(_613.y, _613.z)), 1.0000000133514319600180897396058e-10f)), _614);
        _641 = mad(_564, _606 - _638, _638);
    }
    else
    {
        _641 = _606;
    }
    float2 _642 = float2(_599, _600);
    float4 _644 = t1.SampleLevel(s0, _642, 0.0f);
    float _645 = _644.y;
    float _678;
    if (_607)
    {
        float4 _651 = t2.SampleLevel(s1, _642, 0.0f);
        float _653 = _651.y;
        float _659 = asfloat(cb0_m[43u].w) * 20.0f;
        float _675 = mad(mad(t7.SampleLevel(s5, float2(mad(_599, 30.0f, sin(_659)), mad(_600, 30.0f, cos(_659))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_651.x, max(_653, _651.z)), 1.0000000133514319600180897396058e-10f)), _653);
        _678 = mad(_564, _645 - _675, _675);
    }
    else
    {
        _678 = _645;
    }
    float _679 = mad(_565, _596, 0.5f);
    float _680 = mad(_566, _596, 0.5f);
    float2 _681 = float2(_679, _680);
    float4 _683 = t1.SampleLevel(s0, _681, 0.0f);
    float _684 = _683.z;
    float _717;
    if (_607)
    {
        float4 _690 = t2.SampleLevel(s1, _681, 0.0f);
        float _693 = _690.z;
        float _698 = asfloat(cb0_m[43u].w) * 20.0f;
        float _714 = mad(mad(t7.SampleLevel(s5, float2(mad(_679, 30.0f, sin(_698)), mad(_680, 30.0f, cos(_698))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_690.x, max(_690.y, _693)), 1.0000000133514319600180897396058e-10f)), _693);
        _717 = mad(_564, _684 - _714, _714);
    }
    else
    {
        _717 = _684;
    }
    float _722 = _487 ? g0[0u] : cb3_m3.x;
    float4 _726 = t5.SampleLevel(s4, _502, 0.0f);
    float _727 = _726.x;
    float _735 = max(cb3_m4.y - dp3_f32(float3(_727, _726.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _739 = mad(_641, _722, _727 / _735);
    float _740 = mad(_678, _722, _726.y / _735);
    float _741 = mad(_717, _722, _726.z / _735);
    float _745 = 1.0f / (max(_739, max(_741, _740)) + 1.0f);
    float _746 = _739 * _745;
    float _748 = _745 * _741;
    float3 _749 = float3(_746, _748, _745 * _740);
    float _750 = dp3_f32(_749, float3(0.25f, 0.25f, 0.5f));
    float _751 = dp3_f32(_749, float3(-0.25f, -0.25f, 0.5f));
    float _753 = dp2_f32(float2(_746, _748), float2(0.5f, -0.5f));
    float _754 = _750 - _751;
    float _755 = _753 + _754;
    float _756 = _750 + _751;
    float _757 = _754 - _753;
    bool _758 = !_482;
    float _1129;
    float _1130;
    float _1131;
    if (_758)
    {
        float _762 = dp3_f32(float3(_755, _756, _757), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _769 = mad(-_556, cb3_m9.y, 1.0f) * cb3_m8.x;
        float _773 = mad(_769, _755 - _762, _762);
        float _774 = mad(_769, _756 - _762, _762);
        float _775 = mad(_769, _757 - _762, _762);
        float _776 = _566 + _566;
        float _777 = _565 + _565;
        float _778 = abs(_777);
        float _779 = abs(_776);
        float _783 = min(_778, _779) * (1.0f / max(_778, _779));
        float _784 = _783 * _783;
        float _788 = mad(_784, mad(_784, mad(_784, mad(_784, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _797 = mad(_783, _788, (_778 < _779) ? mad(_783 * _788, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_777) > _777) ? (-3.1415927410125732421875f) : 0.0f);
        float _798 = min(_776, _777);
        float _799 = max(_776, _777);
        float _806 = ((_798 < (-_798)) && (_799 >= (-_799))) ? (-_797) : _797;
        float4 _810 = t8.SampleLevel(s6, _502, 0.0f);
        float _811 = _810.x;
        float _812 = _810.y;
        float _813 = _810.z;
        float _814 = _810.w;
        float _819 = (_774 - _775) * 1.73205077648162841796875f;
        float _821 = mad(_773, 2.0f, -_774);
        float _822 = _821 - _775;
        float _823 = abs(_819);
        float _824 = abs(_822);
        float _828 = min(_823, _824) * (1.0f / max(_823, _824));
        float _829 = _828 * _828;
        float _833 = mad(_829, mad(_829, mad(_829, mad(_829, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _842 = mad(_828, _833, (_823 > _824) ? mad(_828 * _833, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_822 < (_775 - _821)) ? (-3.1415927410125732421875f) : 0.0f);
        float _843 = min(_819, _822);
        float _844 = max(_819, _822);
        float _853 = ((_773 == _774) && (_775 == _774)) ? 0.0f : ((((_843 < (-_843)) && (_844 >= (-_844))) ? (-_842) : _842) * 57.295780181884765625f);
        float _862 = mad(cb3_m15.x, -360.0f, (_853 < 0.0f) ? (_853 + 360.0f) : _853);
        float _872 = clamp(1.0f - (abs((_862 < (-180.0f)) ? (_862 + 360.0f) : ((_862 > 180.0f) ? (_862 - 360.0f) : _862)) / (cb3_m15.y * 180.0f)), 0.0f, 1.0f);
        float _877 = dp3_f32(float3(_773, _774, _775), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _880 = (mad(_872, -2.0f, 3.0f) * (_872 * _872)) * cb3_m15.z;
        float _892 = mad(mad(_880, _773 - _877, _877) - _773, cb3_m14.x, _773);
        float _893 = mad(cb3_m14.x, mad(_880, _774 - _877, _877) - _774, _774);
        float _894 = mad(cb3_m14.x, mad(_880, _775 - _877, _877) - _775, _775);
        float _896;
        _896 = 0.0f;
        float _897;
        uint _900;
        uint _899 = 0u;
        for (;;)
        {
            if (_899 >= 8u)
            {
                break;
            }
            uint _911 = min((_899 & 3u), 10u);
            float _931 = mad(float(_899), 0.785398185253143310546875f, -_806);
            float _932 = _931 + 1.57079637050628662109375f;
            _897 = mad(_814 * (dp4_f32(t9.Load((_899 >> 2u) + 10u), float4(_348[_911].x, _348[_911].y, _348[_911].z, _348[_911].w)) * clamp((abs((_932 > 3.1415927410125732421875f) ? (_931 - 4.7123889923095703125f) : _932) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _896, _896);
            _900 = _899 + 1u;
            _896 = _897;
            _899 = _900;
            continue;
        }
        float _943 = clamp(_896, 0.0f, 1.0f);
        float _956 = asfloat(cb0_m[43u].w);
        float _962 = abs(t9.Load(8u).x);
        float2 _965 = float2(_565 * 1.40999996662139892578125f, _566 * 1.40999996662139892578125f);
        float _967 = sqrt(dp2_f32(_965, _965));
        float _968 = min(_967, 1.0f);
        float _969 = _968 * _968;
        float _974 = clamp(_967 - 0.5f, 0.0f, 1.0f);
        float _977 = (_968 * _969) + (mad(-_968, _969, 1.0f) * (_974 * _974));
        float _978 = mad(mad(mad(sin(_956 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _962, -1.0f);
        float _980 = _812 + _978;
        float _982 = clamp((_813 + _978) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _989 = clamp(_980 + _980, 0.0f, 1.0f);
        float _1006 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1012 = mad(sin(_812 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_1006)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1014 = _1012 * 0.02999999932944774627685546875f;
        float _1015 = mad(_962, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1019 = mad(mad(-_977, _977, 1.0f), 1.0f - _1015, _1015);
        float _1020 = min((exp2(log2(_977) * 0.699999988079071044921875f) * (mad(_989, -2.0f, 3.0f) * (_989 * _989))) + (mad(_982, -2.0f, 3.0f) * (_982 * _982)), 1.0f);
        float _1030 = mad(_1020, mad(_1019, _1012 * 0.62000000476837158203125f, mad(_892, _943, -_892)), mad(-_892, _943, _892));
        float _1031 = mad(_1020, mad(_1019, _1014, mad(_943, _893, -_893)), mad(-_943, _893, _893));
        float _1032 = mad(_1020, mad(_1019, _1014, mad(_943, _894, -_894)), mad(-_943, _894, _894));
        float _1035 = mad(_812, _813 * (1.0f - _814), _814);
        float _1037;
        _1037 = 0.0f;
        float _1038;
        uint _1041;
        uint _1040 = 0u;
        for (;;)
        {
            if (int(_1040) >= 8)
            {
                break;
            }
            float4 _1048 = t9.Load(_1040);
            float _1050 = _1048.y;
            float _1052 = _1048.x - _806;
            _1038 = mad(_1035 * (_1048.w * clamp((abs((_1052 > 3.1415927410125732421875f) ? (_1052 - 6.283185482025146484375f) : ((_1052 < (-3.1415927410125732421875f)) ? (_1052 + 6.283185482025146484375f) : _1052)) + (_1050 - 3.1415927410125732421875f)) / max(_1050 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1037, _1037);
            _1041 = _1040 + 1u;
            _1037 = _1038;
            _1040 = _1041;
            continue;
        }
        float _1071 = clamp(_1037 + _1037, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1075 = mad(_1071, 0.310000002384185791015625f - _1030, _1030);
        float _1076 = mad(_1071, 0.014999999664723873138427734375f - _1031, _1031);
        float _1077 = mad(_1071, 0.014999999664723873138427734375f - _1032, _1032);
        float4 _1078 = t9.Load(12u);
        float _1079 = _1078.x;
        float _1107;
        float _1108;
        float _1109;
        if (_1079 != 0.0f)
        {
            float _1086 = clamp(_1006, 0.0f, 1.0f);
            float _1096 = clamp((_811 + (_1079 - 1.0f)) / max(mad(_1079, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1100 = clamp(_1079 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1103 = mad(_1100, -2.0f, 3.0f) * (_1100 * _1100);
            _1107 = mad(_1103, _1096 * (_1086 * (_811 * 0.930000007152557373046875f)), _1077);
            _1108 = mad(_1103, _1096 * (_1086 * (_811 * 0.85000002384185791015625f)), _1076);
            _1109 = mad((_1086 * (_811 * 0.790000021457672119140625f)) * _1096, _1103, _1075);
        }
        else
        {
            _1107 = _1077;
            _1108 = _1076;
            _1109 = _1075;
        }
        bool _1112 = cb3_m14.y > 0.0f;
        bool _1116 = frac((_479 * 420.0f) + (_956 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1117 = _1116 ? 0.300000011920928955078125f : 0.0f;
        float _1118 = _1117 * cb3_m14.y;
        _1129 = _1112 ? mad(_1118, 0.0f - _1109, _1109) : _1109;
        _1130 = _1112 ? mad((_1116 ? 0.100000001490116119384765625f : 0.0f) - _1108, _1118, _1108) : _1108;
        _1131 = _1112 ? mad(_1117 - _1107, _1118, _1107) : _1107;
    }
    else
    {
        _1129 = _755;
        _1130 = _756;
        _1131 = _757;
    }
    float _1136 = 1.0f / max(1.0f - max(max(_1130, _1131), _1129), 6.099999882280826568603515625e-05f);
    float _1143 = min(-(_1136 * _1129), 0.0f);
    float _1144 = min(-(_1136 * _1130), 0.0f);
    float _1145 = min(-(_1136 * _1131), 0.0f);
    float _1155 = clamp(-((1.0f / cb3_m7.y) * (sqrt(_568) - cb3_m7.x)), 0.0f, 1.0f);
    float _1156 = mad(_1155, -2.0f, 3.0f);
    float _1157 = _1155 * _1155;
    float _1158 = _1156 * _1157;
    float _1160 = mad(-_1156, _1157, 1.0f);
    float _1183 = cb3_m7.z * cb3_m7.w;
    float3 _1196 = float3(_482 ? (-_1143) : mad(_1143 + ((_1160 * cb3_m5.x) - (_1143 * _1158)), _1183, -_1143), _482 ? (-_1144) : mad(_1183, ((_1160 * cb3_m5.y) - (_1158 * _1144)) + _1144, -_1144), _482 ? (-_1145) : mad(_1183, ((_1160 * cb3_m5.z) - (_1158 * _1145)) + _1145, -_1145));
    float _1197 = dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1196);
    float _1198 = dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1196);
    float _1199 = dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1196);
    bool _1203 = cb2_m0.x != 0.0f;
    float _1220;
    float _1221;
    float _1222;
    if (!_1203)
    {
        _1220 = clamp(mad(cb2_m1.x, mad(_1199, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1221 = clamp(mad(cb2_m1.x, mad(_1198, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1222 = clamp(mad(cb2_m1.x, mad(_1197, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1220 = _1199;
        _1221 = _1198;
        _1222 = _1197;
    }
    float _1225 = mad(cb2_m0.y, -0.0005000000237487256526947021484375f, 0.312709987163543701171875f);
    float _1232 = mad(cb2_m0.z, 0.0005000000237487256526947021484375f, (_1225 * 2.86999988555908203125f) - ((_1225 * _1225) * 3.0f));
    float _1233 = _1232 - 0.2750950753688812255859375f;
    float _1234 = _1225 / _1233;
    float _1238 = ((1.0f - _1225) + (0.2750950753688812255859375f - _1232)) / _1233;
    float3 _1248 = float3(_1222, _1221, _1220);
    float3 _1255 = float3((0.94923698902130126953125f / mad(_1238, -0.1624000072479248046875f, mad(_1234, 0.732800006866455078125f, 0.4296000003814697265625f))) * dp3_f32(float3(0.390404999256134033203125f, 0.549941003322601318359375f, 0.008926319889724254608154296875f), _1248), dp3_f32(float3(0.070841602981090545654296875f, 0.963172018527984619140625f, 0.001357750035822391510009765625f), _1248) * (1.035419940948486328125f / mad(_1238, 0.006099999882280826568603515625f, mad(_1234, -0.703599989414215087890625f, 1.6974999904632568359375f))), dp3_f32(float3(0.02310819923877716064453125f, 0.1280210018157958984375f, 0.936245024204254150390625f), _1248) * (1.0872800350189208984375f / mad(_1238, 0.98339998722076416015625f, mad(_1234, 0.0030000000260770320892333984375f, 0.013600000180304050445556640625f))));
    float3 _1265 = float3(dp3_f32(float3(2.85846996307373046875f, -1.62879002094268798828125f, -0.0248910002410411834716796875f), _1255), dp3_f32(float3(-0.21018199622631072998046875f, 1.1582000255584716796875f, 0.0003242809907533228397369384765625f), _1255), dp3_f32(float3(-0.0418119989335536956787109375f, -0.118169002234935760498046875f, 1.0686700344085693359375f), _1255));
    float _1267 = dp3_f32(_1265, float3(cb2_m1.w, cb2_m2));
    float _1275 = dp3_f32(_1265, float3(cb2_m3, cb2_m4));
    float _1278 = dp3_f32(_1265, cb2_m5);
    float _1280 = dp3_f32(float3(_1267, _1275, _1278), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1289 = clamp((_1280 - cb2_m11) * (1.0f / (cb2_m12.x - cb2_m11)), 0.0f, 1.0f);
    float _1293 = mad(-mad(_1289, -2.0f, 3.0f), _1289 * _1289, 1.0f);
    float _1302 = clamp((_1280 - cb2_m12.y) * (1.0f / (cb2_m12.z - cb2_m12.y)), 0.0f, 1.0f);
    float _1303 = mad(_1302, -2.0f, 3.0f);
    float _1304 = _1302 * _1302;
    float _1305 = _1303 * _1304;
    float _1308 = 1.0f - clamp(mad(_1303, _1304, _1293), 0.0f, 1.0f);
    float _1333;
    float _1334;
    float _1335;
    if (_1203)
    {
        _1333 = cb2_m13.y + 1.0f;
        _1334 = cb2_m12.w + 1.0f;
        _1335 = cb2_m13.x + 1.0f;
    }
    else
    {
        _1333 = cb2_m13.y + mad(cb2_m13.x, 0.5f, mad(cb2_m12.w, 0.25f, 1.0f));
        _1334 = cb2_m12.w + 1.0f;
        _1335 = mad(cb2_m12.w, 0.5f, cb2_m13.x) + 1.0f;
    }
    float _1378 = mad(_1305 * (cb2_m10.y * _1275), _1333, ((_1293 * (cb2_m6.y * _1275)) * _1334) + ((_1308 * (cb2_m8.y * _1275)) * _1335));
    float _1379 = mad(_1305 * (cb2_m10.z * _1278), _1333, ((_1293 * (cb2_m6.z * _1278)) * _1334) + ((_1308 * (cb2_m8.z * _1278)) * _1335));
    float _1380 = mad(_1305 * (_1267 * cb2_m10.x), _1333, ((_1308 * (_1267 * cb2_m8.x)) * _1335) + ((_1293 * (cb2_m6.x * _1267)) * _1334));
    float _1384 = float(_1378 >= _1379);
    float _1385 = mad(_1378 - _1379, _1384, _1379);
    float _1386 = mad(_1384, _1379 - _1378, _1378);
    float _1388 = mad(_1384, -1.0f, 0.666666686534881591796875f);
    float _1394 = float(_1385 <= _1380);
    float _1395 = mad(_1380 - _1385, _1394, _1385);
    float _1396 = mad(_1394, _1386 - _1386, _1386);
    float _1398 = mad(_1394, _1385 - _1380, _1380);
    float _1400 = _1395 - min(_1398, _1396);
    float _1406 = _1400 / (_1395 + 9.9999997473787516355514526367188e-05f);
    float _1410 = abs(((_1398 - _1396) / mad(_1400, 6.0f, 9.9999997473787516355514526367188e-05f)) + mad(_1394, mad(_1384, 1.0f, -1.0f) - _1388, _1388)) + cb2_m1.z;
    float _1416 = (_1410 < 0.0f) ? (_1410 + 1.0f) : ((_1410 > 1.0f) ? (_1410 - 1.0f) : _1410);
    float _1438 = mad(_1406, clamp(abs(mad(frac(_1416 + 1.0f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1439 = mad(_1406, clamp(abs(mad(frac(_1416 + 0.666666686534881591796875f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1440 = mad(_1406, clamp(abs(mad(frac(_1416 + 0.3333333432674407958984375f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1445 = dp3_f32(float3(_1395 * _1438, _1395 * _1439, _1395 * _1440), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1454 = mad(mad(_1395, _1438, -_1445), cb2_m0.w, _1445);
    float _1455 = mad(mad(_1395, _1439, -_1445), cb2_m0.w, _1445);
    float _1456 = mad(mad(_1395, _1440, -_1445), cb2_m0.w, _1445);
    float _1475;
    float _1476;
    float _1477;
    if (_1203)
    {
        _1475 = cb2_m1.y * clamp(mad(cb2_m1.x, _1456 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
        _1476 = cb2_m1.y * clamp(mad(cb2_m1.x, _1455 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
        _1477 = cb2_m1.y * clamp(mad(cb2_m1.x, _1454 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1475 = _1456;
        _1476 = _1455;
        _1477 = _1454;
    }
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
         if (_758) {
            float3 scene_color = float3(_1477, _1476, _1475);
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[uint2(_470, _471)] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1481 = min(_1477 * 2.5f, 65504.0f);
    float _1482 = min(_1476 * 2.5f, 65504.0f);
    float _1483 = min(_1475 * 2.5f, 65504.0f);
    float _1487 = max(max(_1481, _1482), _1483);
    float _1492 = (max(_1487, 9.9999997473787516355514526367188e-05f) - max(min(min(_1481, _1482), _1483), 9.9999997473787516355514526367188e-05f)) / max(_1487, 0.00999999977648258209228515625f);
    float _1503 = mad(sqrt(mad(_1481, _1481 - _1483, ((_1483 - _1482) * _1483) + ((_1482 - _1481) * _1482))), 1.75f, _1481 + (_1483 + _1482));
    float _1504 = _1492 - 0.4000000059604644775390625f;
    float _1508 = max(1.0f - abs(_1504 * 2.5f), 0.0f);
    float _1516 = mad(mad(clamp(mad(_1504, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1508, _1508, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1524 = ((_1503 <= 0.1599999964237213134765625f) ? _1516 : ((_1503 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1503 * 0.3333333432674407958984375f)) - 0.5f) * _1516))) + 1.0f;
    float _1525 = _1481 * _1524;
    float _1526 = _1524 * _1482;
    float _1527 = _1524 * _1483;
    float _1532 = (_1526 - _1527) * 1.73205077648162841796875f;
    float _1534 = (_1525 * 2.0f) - _1526;
    float _1536 = mad(-_1524, _1483, _1534);
    float _1537 = abs(_1536);
    float _1538 = abs(_1532);
    float _1542 = min(_1537, _1538) * (1.0f / max(_1537, _1538));
    float _1543 = _1542 * _1542;
    float _1547 = mad(_1543, mad(_1543, mad(_1543, mad(_1543, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1557 = mad(_1542, _1547, (_1537 < _1538) ? mad(_1542 * _1547, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1536 < mad(_1524, _1483, -_1534)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1558 = min(_1532, _1536);
    float _1559 = max(_1532, _1536);
    float _1568 = ((_1525 == _1526) && (_1527 == _1526)) ? 0.0f : ((((_1558 < (-_1558)) && (_1559 >= (-_1559))) ? (-_1557) : _1557) * 57.295780181884765625f);
    float _1571 = (_1568 < 0.0f) ? (_1568 + 360.0f) : _1568;
    float _1581 = max(1.0f - abs(((_1571 < (-180.0f)) ? (_1571 + 360.0f) : ((_1571 > 180.0f) ? (_1571 - 360.0f) : _1571)) * 0.01481481455266475677490234375f), 0.0f);
    float _1584 = mad(_1581, -2.0f, 3.0f) * (_1581 * _1581);
    float3 _1595 = float3(clamp(_1525 + (((_1492 * (_1584 * _1584)) * mad(-_1481, _1524, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1526, 0.0f, 65504.0f), clamp(_1527, 0.0f, 65504.0f));
    float _1599 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1595), 0.0f, 65504.0f);
    float _1600 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1595), 0.0f, 65504.0f);
    float _1601 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1595), 0.0f, 65504.0f);
    float _1603 = dp3_f32(float3(_1599, _1600, _1601), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1607 = mad(_1599 - _1603, 0.959999978542327880859375f, _1603);
    float _1608 = mad(_1600 - _1603, 0.959999978542327880859375f, _1603);
    float _1609 = mad(_1601 - _1603, 0.959999978542327880859375f, _1603);
    float _1616 = (_1607 <= 0.0f) ? (-14.0f) : log2(_1607);
    float _1617 = (_1608 <= 0.0f) ? (-14.0f) : log2(_1608);
    float _1618 = (_1609 <= 0.0f) ? (-14.0f) : log2(_1609);
    float _1705;
    if (_1616 <= (-17.4739322662353515625f))
    {
        _1705 = -4.0f;
    }
    else
    {
        float _1704;
        if (_1616 < (-2.4739310741424560546875f))
        {
            float _1629 = mad(_1616, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1630 = _1629 * 0.6643855571746826171875f;
            int _1631 = cvt_f32_i32(_1630);
            float _1634 = mad(_1629, 0.6643855571746826171875f, -trunc(_1630));
            uint _1640 = min(uint(_1631 + 4), 10u);
            uint _1646 = min(uint((_1631 + 1) + 4), 10u);
            uint _1652 = min(uint((_1631 + 2) + 4), 10u);
            float2 _1658 = float2(_348[_1640].x, _348[_1646].x);
            _1704 = dp3_f32(float3(_1634 * _1634, _1634, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1640].x, _348[_1646].x, _348[_1652].x)), dp2_f32(float2(-1.0f, 1.0f), _1658), dp2_f32(0.5f.xx, _1658)));
        }
        else
        {
            float _1703;
            if (_1616 < 15.52606868743896484375f)
            {
                float _1668 = mad(_1616, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1669 = _1668 * 0.55365467071533203125f;
                int _1670 = cvt_f32_i32(_1669);
                float _1673 = mad(_1668, 0.55365467071533203125f, -trunc(_1669));
                uint _1679 = min(uint(_1670 + 4), 10u);
                uint _1685 = min(uint((_1670 + 1) + 4), 10u);
                uint _1691 = min(uint((_1670 + 2) + 4), 10u);
                float2 _1697 = float2(_348[_1679].y, _348[_1685].y);
                _1703 = dp3_f32(float3(_1673 * _1673, _1673, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1679].y, _348[_1685].y, _348[_1691].y)), dp2_f32(float2(-1.0f, 1.0f), _1697), dp2_f32(0.5f.xx, _1697)));
            }
            else
            {
                _1703 = 4.0f;
            }
            _1704 = _1703;
        }
        _1705 = _1704;
    }
    float _1791;
    if (_1617 <= (-17.4739322662353515625f))
    {
        _1791 = -4.0f;
    }
    else
    {
        float _1790;
        if (_1617 < (-2.4739310741424560546875f))
        {
            float _1715 = mad(_1617, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1716 = _1715 * 0.6643855571746826171875f;
            int _1717 = cvt_f32_i32(_1716);
            float _1720 = mad(_1715, 0.6643855571746826171875f, -trunc(_1716));
            uint _1726 = min(uint(_1717 + 4), 10u);
            uint _1732 = min(uint((_1717 + 1) + 4), 10u);
            uint _1738 = min(uint((_1717 + 2) + 4), 10u);
            float2 _1744 = float2(_348[_1726].x, _348[_1732].x);
            _1790 = dp3_f32(float3(_1720 * _1720, _1720, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1726].x, _348[_1732].x, _348[_1738].x)), dp2_f32(float2(-1.0f, 1.0f), _1744), dp2_f32(0.5f.xx, _1744)));
        }
        else
        {
            float _1789;
            if (_1617 < 15.52606868743896484375f)
            {
                float _1754 = mad(_1617, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1755 = _1754 * 0.55365467071533203125f;
                int _1756 = cvt_f32_i32(_1755);
                float _1759 = mad(_1754, 0.55365467071533203125f, -trunc(_1755));
                uint _1765 = min(uint(_1756 + 4), 10u);
                uint _1771 = min(uint((_1756 + 1) + 4), 10u);
                uint _1777 = min(uint((_1756 + 2) + 4), 10u);
                float2 _1783 = float2(_348[_1765].y, _348[_1771].y);
                _1789 = dp3_f32(float3(_1759 * _1759, _1759, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1765].y, _348[_1771].y, _348[_1777].y)), dp2_f32(float2(-1.0f, 1.0f), _1783), dp2_f32(0.5f.xx, _1783)));
            }
            else
            {
                _1789 = 4.0f;
            }
            _1790 = _1789;
        }
        _1791 = _1790;
    }
    float _1877;
    if (_1618 <= (-17.4739322662353515625f))
    {
        _1877 = -4.0f;
    }
    else
    {
        float _1876;
        if (_1618 < (-2.4739310741424560546875f))
        {
            float _1801 = mad(_1618, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1802 = _1801 * 0.6643855571746826171875f;
            int _1803 = cvt_f32_i32(_1802);
            float _1806 = mad(_1801, 0.6643855571746826171875f, -trunc(_1802));
            uint _1812 = min(uint(_1803 + 4), 10u);
            uint _1818 = min(uint((_1803 + 1) + 4), 10u);
            uint _1824 = min(uint((_1803 + 2) + 4), 10u);
            float2 _1830 = float2(_348[_1812].x, _348[_1818].x);
            _1876 = dp3_f32(float3(_1806 * _1806, _1806, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1812].x, _348[_1818].x, _348[_1824].x)), dp2_f32(float2(-1.0f, 1.0f), _1830), dp2_f32(0.5f.xx, _1830)));
        }
        else
        {
            float _1875;
            if (_1618 < 15.52606868743896484375f)
            {
                float _1840 = mad(_1618, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1841 = _1840 * 0.55365467071533203125f;
                int _1842 = cvt_f32_i32(_1841);
                float _1845 = mad(_1840, 0.55365467071533203125f, -trunc(_1841));
                uint _1851 = min(uint(_1842 + 4), 10u);
                uint _1857 = min(uint((_1842 + 1) + 4), 10u);
                uint _1863 = min(uint((_1842 + 2) + 4), 10u);
                float2 _1869 = float2(_348[_1851].y, _348[_1857].y);
                _1875 = dp3_f32(float3(_1845 * _1845, _1845, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_348[_1851].y, _348[_1857].y, _348[_1863].y)), dp2_f32(float2(-1.0f, 1.0f), _1869), dp2_f32(0.5f.xx, _1869)));
            }
            else
            {
                _1875 = 4.0f;
            }
            _1876 = _1875;
        }
        _1877 = _1876;
    }
    float3 _1880 = float3(exp2(_1705 * 3.3219280242919921875f), exp2(_1791 * 3.3219280242919921875f), exp2(_1877 * 3.3219280242919921875f));
    float3 _1884 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1880), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1880), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1880));
    float _1885 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1884);
    float _1886 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1884);
    float _1887 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1884);
    float _1891 = (_1885 <= 0.0f) ? (-4.0f) : (log2(_1885) * 0.3010300099849700927734375f);
    float _1895 = log2(cb1_m[19u].y);
    float _1896 = _1895 * 0.3010300099849700927734375f;
    float _2004;
    if (_1896 >= _1891)
    {
        _2004 = mad(cb1_m[21u].x, _1891, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1896 * cb1_m[21u].x));
    }
    else
    {
        float _1913 = log2(cb1_m[20u].x);
        float _1914 = _1913 * 0.3010300099849700927734375f;
        float _2003;
        if ((_1896 < _1891) && (_1914 > _1891))
        {
            float _1923 = (mad(_1895, -0.3010300099849700927734375f, _1891) * 7.0f) / (_1914 - _1896);
            int _1924 = cvt_f32_i32(_1923);
            float _1926 = _1923 - trunc(_1923);
            uint _1928 = uint(_1924 + 1);
            uint _1930 = uint(_1924 + 2);
            uint _1932 = uint(_1924);
            float2 _1944 = float2(cb1_m[_1932].x, cb1_m[_1928].x);
            _2003 = dp3_f32(float3(_1926 * _1926, _1926, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1932].x, cb1_m[_1928].x, cb1_m[_1930].x)), dp2_f32(float2(-1.0f, 1.0f), _1944), dp2_f32(0.5f.xx, _1944)));
        }
        else
        {
            float _1954 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2002;
            if ((_1914 <= _1891) && (_1954 > _1891))
            {
                float _1963 = (mad(_1913, -0.3010300099849700927734375f, _1891) * 7.0f) / (_1954 - _1914);
                int _1964 = cvt_f32_i32(_1963);
                float _1966 = _1963 - trunc(_1963);
                uint _1971 = uint(_1964 + 10);
                uint _1976 = uint((_1964 + 1) + 10);
                uint _1981 = uint((_1964 + 2) + 10);
                float2 _1987 = float2(cb1_m[_1971].x, cb1_m[_1976].x);
                _2002 = dp3_f32(float3(_1966 * _1966, _1966, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1971].x, cb1_m[_1976].x, cb1_m[_1981].x)), dp2_f32(float2(-1.0f, 1.0f), _1987), dp2_f32(0.5f.xx, _1987)));
            }
            else
            {
                _2002 = mad(cb1_m[21u].y, _1891, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1954 * cb1_m[21u].y));
            }
            _2003 = _2002;
        }
        _2004 = _2003;
    }
    float _2008 = (_1886 <= 0.0f) ? (-4.0f) : (log2(_1886) * 0.3010300099849700927734375f);
    float _2116;
    if (_1896 >= _2008)
    {
        _2116 = mad(cb1_m[21u].x, _2008, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1896 * cb1_m[21u].x));
    }
    else
    {
        float _2025 = log2(cb1_m[20u].x);
        float _2026 = _2025 * 0.3010300099849700927734375f;
        float _2115;
        if ((_1896 < _2008) && (_2026 > _2008))
        {
            float _2035 = (mad(_1895, -0.3010300099849700927734375f, _2008) * 7.0f) / (_2026 - _1896);
            int _2036 = cvt_f32_i32(_2035);
            float _2038 = _2035 - trunc(_2035);
            uint _2040 = uint(_2036 + 1);
            uint _2042 = uint(_2036 + 2);
            uint _2044 = uint(_2036);
            float2 _2056 = float2(cb1_m[_2044].x, cb1_m[_2040].x);
            _2115 = dp3_f32(float3(_2038 * _2038, _2038, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2044].x, cb1_m[_2040].x, cb1_m[_2042].x)), dp2_f32(float2(-1.0f, 1.0f), _2056), dp2_f32(0.5f.xx, _2056)));
        }
        else
        {
            float _2066 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2114;
            if ((_2026 <= _2008) && (_2066 > _2008))
            {
                float _2075 = (mad(_2025, -0.3010300099849700927734375f, _2008) * 7.0f) / (_2066 - _2026);
                int _2076 = cvt_f32_i32(_2075);
                float _2078 = _2075 - trunc(_2075);
                uint _2083 = uint(_2076 + 10);
                uint _2088 = uint((_2076 + 1) + 10);
                uint _2093 = uint((_2076 + 2) + 10);
                float2 _2099 = float2(cb1_m[_2083].x, cb1_m[_2088].x);
                _2114 = dp3_f32(float3(_2078 * _2078, _2078, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2083].x, cb1_m[_2088].x, cb1_m[_2093].x)), dp2_f32(float2(-1.0f, 1.0f), _2099), dp2_f32(0.5f.xx, _2099)));
            }
            else
            {
                _2114 = mad(cb1_m[21u].y, _2008, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2066 * cb1_m[21u].y));
            }
            _2115 = _2114;
        }
        _2116 = _2115;
    }
    float _2120 = (_1887 <= 0.0f) ? (-4.0f) : (log2(_1887) * 0.3010300099849700927734375f);
    float _2228;
    if (_1896 >= _2120)
    {
        _2228 = mad(cb1_m[21u].x, _2120, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1896 * cb1_m[21u].x));
    }
    else
    {
        float _2137 = log2(cb1_m[20u].x);
        float _2138 = _2137 * 0.3010300099849700927734375f;
        float _2227;
        if ((_1896 < _2120) && (_2138 > _2120))
        {
            float _2147 = (mad(_1895, -0.3010300099849700927734375f, _2120) * 7.0f) / (_2138 - _1896);
            int _2148 = cvt_f32_i32(_2147);
            float _2150 = _2147 - trunc(_2147);
            uint _2152 = uint(_2148 + 1);
            uint _2154 = uint(_2148 + 2);
            uint _2156 = uint(_2148);
            float2 _2168 = float2(cb1_m[_2156].x, cb1_m[_2152].x);
            _2227 = dp3_f32(float3(_2150 * _2150, _2150, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2156].x, cb1_m[_2152].x, cb1_m[_2154].x)), dp2_f32(float2(-1.0f, 1.0f), _2168), dp2_f32(0.5f.xx, _2168)));
        }
        else
        {
            float _2178 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2226;
            if ((_2138 <= _2120) && (_2178 > _2120))
            {
                float _2187 = (mad(_2137, -0.3010300099849700927734375f, _2120) * 7.0f) / (_2178 - _2138);
                int _2188 = cvt_f32_i32(_2187);
                float _2190 = _2187 - trunc(_2187);
                uint _2195 = uint(_2188 + 10);
                uint _2200 = uint((_2188 + 1) + 10);
                uint _2205 = uint((_2188 + 2) + 10);
                float2 _2211 = float2(cb1_m[_2195].x, cb1_m[_2200].x);
                _2226 = dp3_f32(float3(_2190 * _2190, _2190, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2195].x, cb1_m[_2200].x, cb1_m[_2205].x)), dp2_f32(float2(-1.0f, 1.0f), _2211), dp2_f32(0.5f.xx, _2211)));
            }
            else
            {
                _2226 = mad(cb1_m[21u].y, _2120, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2178 * cb1_m[21u].y));
            }
            _2227 = _2226;
        }
        _2228 = _2227;
    }
    if (_758)
    {
        float3 _2240 = float3(exp2(_2004 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2116 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2228 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2244 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2240), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2240), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2240));
        float3 _2248 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2244), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2244), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2244));
        float _2257 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2248) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2268 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2248) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2278 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2248) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[uint2(_470, _471)] = float4(min(exp2(log2(mad(_2257, 18.8515625f, 0.8359375f) / mad(_2257, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2268, 18.8515625f, 0.8359375f) / mad(_2268, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2278, 18.8515625f, 0.8359375f) / mad(_2278, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
