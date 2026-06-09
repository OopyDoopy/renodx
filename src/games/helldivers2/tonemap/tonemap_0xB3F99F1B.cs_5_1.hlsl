#include "../common.hlsl"

struct _451
{
    uint2 _m0;
    uint _m1;
};

static const float _62[1] = { 0.0f };
static const float4 _349[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
RWTexture2D<float4> u1 : register(u1);

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
    precise float _442 = a.x * b.x;
    return mad(a.y, b.y, _442);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _428 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _428));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _410 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _410)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _450_dummy_parameter;
    _451 _452 = { spvImageSize(u0, _450_dummy_parameter), 1u };
    uint _467 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _471 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_467, 1u, 3u);
    uint _472 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _467, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _479 = (float(_471) + 0.5f) / float(_452._m0.x);
    float _480 = (float(_472) + 0.5f) / float(_452._m0.y);
    bool _483 = (_452._m0.x < _471) || (_452._m0.y < _472);
    bool _488 = cb3_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _488) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _503 = float2(_479, _480);
    float _508 = mad(t4.SampleLevel(s3, _503, 0.0f).x, 2.0f, -1.0f);
    float _523;
    if (_508 > 0.0f)
    {
        _523 = min(sqrt(_508), t0.Load(8u).x);
    }
    else
    {
        _523 = max(_508, -t0.Load(7u).x);
    }
    float4 _527 = t3.SampleLevel(s2, _503, 0.0f);
    float2 _537 = float2(_527.x * cb3_m2.x, _527.y * cb3_m2.y);
    bool _549 = (cb3_m10.x != 0.0f) && (cb3_m10.y != 0.0f);
    bool _553 = (cb3_m8.w != 0.0f) && (cb3_m9.x != 0.0f);
    float _557 = abs(_523);
    float _565 = exp2(max(_549 ? clamp((sqrt(dp2_f32(_537, _537)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _553 ? clamp((_557 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _566 = _479 - 0.5f;
    float _567 = _480 - 0.5f;
    float2 _568 = float2(_566, _567);
    float _569 = dp2_f32(_568, _568);
    float _572 = mad(_569, cb3_m12.y, 1.0f);
    float _594 = mad(exp2(log2(clamp(cb3_m12.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb3_m13.x, -0.089999973773956298828125f, 1.0f);
    float _595 = (_572 * mad(mad(cb3_m13.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb3_m13.x, 1.0f)) * _594;
    float _596 = _594 * (_572 * mad(mad(cb3_m13.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb3_m13.x, 1.0f));
    float _597 = _594 * (_572 * mad(cb3_m13.x, mad(cb3_m13.y, 0.0f, 0.04500000178813934326171875f), 1.0f));
    float _598 = mad(_566, _595, 0.5f);
    float _599 = mad(_595, _567, 0.5f);
    float _600 = mad(_566, _596, 0.5f);
    float _601 = mad(_596, _567, 0.5f);
    float2 _604 = float2(_598, _599);
    float4 _606 = t1.SampleLevel(s0, _604, 0.0f);
    float _607 = _606.x;
    bool _608 = _553 || _549;
    float _642;
    if (_608)
    {
        float4 _614 = t2.SampleLevel(s1, _604, 0.0f);
        float _615 = _614.x;
        float _623 = asfloat(cb0_m[43u].w) * 20.0f;
        float _639 = mad(mad(t7.SampleLevel(s5, float2(mad(_598, 30.0f, sin(_623)), mad(_599, 30.0f, cos(_623))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_615, max(_614.y, _614.z)), 1.0000000133514319600180897396058e-10f)), _615);
        _642 = mad(_565, _607 - _639, _639);
    }
    else
    {
        _642 = _607;
    }
    float2 _643 = float2(_600, _601);
    float4 _645 = t1.SampleLevel(s0, _643, 0.0f);
    float _646 = _645.y;
    float _679;
    if (_608)
    {
        float4 _652 = t2.SampleLevel(s1, _643, 0.0f);
        float _654 = _652.y;
        float _660 = asfloat(cb0_m[43u].w) * 20.0f;
        float _676 = mad(mad(t7.SampleLevel(s5, float2(mad(_600, 30.0f, sin(_660)), mad(_601, 30.0f, cos(_660))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_652.x, max(_654, _652.z)), 1.0000000133514319600180897396058e-10f)), _654);
        _679 = mad(_565, _646 - _676, _676);
    }
    else
    {
        _679 = _646;
    }
    float _680 = mad(_566, _597, 0.5f);
    float _681 = mad(_597, _567, 0.5f);
    float2 _682 = float2(_680, _681);
    float4 _684 = t1.SampleLevel(s0, _682, 0.0f);
    float _685 = _684.z;
    float _718;
    if (_608)
    {
        float4 _691 = t2.SampleLevel(s1, _682, 0.0f);
        float _694 = _691.z;
        float _699 = asfloat(cb0_m[43u].w) * 20.0f;
        float _715 = mad(mad(t7.SampleLevel(s5, float2(mad(_680, 30.0f, sin(_699)), mad(_681, 30.0f, cos(_699))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_691.x, max(_691.y, _694)), 1.0000000133514319600180897396058e-10f)), _694);
        _718 = mad(_565, _685 - _715, _715);
    }
    else
    {
        _718 = _685;
    }
    float _723 = _488 ? g0[0u] : cb3_m3.x;
    float4 _727 = t5.SampleLevel(s4, _503, 0.0f);
    float _728 = _727.x;
    float _736 = max(cb3_m4.y - dp3_f32(float3(_728, _727.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _740 = mad(_642, _723, _728 / _736);
    float _741 = mad(_679, _723, _727.y / _736);
    float _742 = mad(_718, _723, _727.z / _736);
    float _746 = 1.0f / (max(_740, max(_742, _741)) + 1.0f);
    float _747 = _740 * _746;
    float _749 = _746 * _742;
    float3 _750 = float3(_747, _749, _746 * _741);
    float _751 = dp3_f32(_750, float3(0.25f, 0.25f, 0.5f));
    float _752 = dp3_f32(_750, float3(-0.25f, -0.25f, 0.5f));
    float _754 = dp2_f32(float2(_747, _749), float2(0.5f, -0.5f));
    uint2 _756 = uint2(_471, _472);
    u1[_756] = _751.xxxx;
    float _758 = _751 - _752;
    float _759 = _754 + _758;
    float _760 = _751 + _752;
    float _761 = _758 - _754;
    bool _762 = !_483;
    float _1133;
    float _1134;
    float _1135;
    if (_762)
    {
        float _766 = dp3_f32(float3(_759, _760, _761), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _773 = mad(-_557, cb3_m9.y, 1.0f) * cb3_m8.x;
        float _777 = mad(_773, _759 - _766, _766);
        float _778 = mad(_773, _760 - _766, _766);
        float _779 = mad(_773, _761 - _766, _766);
        float _780 = _567 + _567;
        float _781 = _566 + _566;
        float _782 = abs(_781);
        float _783 = abs(_780);
        float _787 = min(_782, _783) * (1.0f / max(_782, _783));
        float _788 = _787 * _787;
        float _792 = mad(_788, mad(_788, mad(_788, mad(_788, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _801 = mad(_787, _792, (_782 < _783) ? mad(_787 * _792, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_781) > _781) ? (-3.1415927410125732421875f) : 0.0f);
        float _802 = min(_780, _781);
        float _803 = max(_780, _781);
        float _810 = ((_802 < (-_802)) && (_803 >= (-_803))) ? (-_801) : _801;
        float4 _814 = t8.SampleLevel(s6, _503, 0.0f);
        float _815 = _814.x;
        float _816 = _814.y;
        float _817 = _814.z;
        float _818 = _814.w;
        float _823 = (_778 - _779) * 1.73205077648162841796875f;
        float _825 = mad(_777, 2.0f, -_778);
        float _826 = _825 - _779;
        float _827 = abs(_823);
        float _828 = abs(_826);
        float _832 = min(_827, _828) * (1.0f / max(_827, _828));
        float _833 = _832 * _832;
        float _837 = mad(_833, mad(_833, mad(_833, mad(_833, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _846 = mad(_832, _837, (_827 > _828) ? mad(_832 * _837, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_826 < (_779 - _825)) ? (-3.1415927410125732421875f) : 0.0f);
        float _847 = min(_823, _826);
        float _848 = max(_823, _826);
        float _857 = ((_777 == _778) && (_779 == _778)) ? 0.0f : ((((_847 < (-_847)) && (_848 >= (-_848))) ? (-_846) : _846) * 57.295780181884765625f);
        float _866 = mad(cb3_m15.x, -360.0f, (_857 < 0.0f) ? (_857 + 360.0f) : _857);
        float _876 = clamp(1.0f - (abs((_866 < (-180.0f)) ? (_866 + 360.0f) : ((_866 > 180.0f) ? (_866 - 360.0f) : _866)) / (cb3_m15.y * 180.0f)), 0.0f, 1.0f);
        float _881 = dp3_f32(float3(_777, _778, _779), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _884 = (mad(_876, -2.0f, 3.0f) * (_876 * _876)) * cb3_m15.z;
        float _896 = mad(mad(_884, _777 - _881, _881) - _777, cb3_m14.x, _777);
        float _897 = mad(cb3_m14.x, mad(_884, _778 - _881, _881) - _778, _778);
        float _898 = mad(cb3_m14.x, mad(_884, _779 - _881, _881) - _779, _779);
        float _900;
        _900 = 0.0f;
        float _901;
        uint _904;
        uint _903 = 0u;
        for (;;)
        {
            if (_903 >= 8u)
            {
                break;
            }
            uint _915 = min((_903 & 3u), 10u);
            float _935 = mad(float(_903), 0.785398185253143310546875f, -_810);
            float _936 = _935 + 1.57079637050628662109375f;
            _901 = mad(_818 * (dp4_f32(t9.Load((_903 >> 2u) + 10u), float4(_349[_915].x, _349[_915].y, _349[_915].z, _349[_915].w)) * clamp((abs((_936 > 3.1415927410125732421875f) ? (_935 - 4.7123889923095703125f) : _936) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _900, _900);
            _904 = _903 + 1u;
            _900 = _901;
            _903 = _904;
            continue;
        }
        float _947 = clamp(_900, 0.0f, 1.0f);
        float _960 = asfloat(cb0_m[43u].w);
        float _966 = abs(t9.Load(8u).x);
        float2 _969 = float2(_566 * 1.40999996662139892578125f, _567 * 1.40999996662139892578125f);
        float _971 = sqrt(dp2_f32(_969, _969));
        float _972 = min(_971, 1.0f);
        float _973 = _972 * _972;
        float _978 = clamp(_971 - 0.5f, 0.0f, 1.0f);
        float _981 = (_972 * _973) + (mad(-_972, _973, 1.0f) * (_978 * _978));
        float _982 = mad(mad(mad(sin(_960 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _966, -1.0f);
        float _984 = _816 + _982;
        float _986 = clamp((_817 + _982) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _993 = clamp(_984 + _984, 0.0f, 1.0f);
        float _1010 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1016 = mad(sin(_816 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_1010)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1018 = _1016 * 0.02999999932944774627685546875f;
        float _1019 = mad(_966, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1023 = mad(mad(-_981, _981, 1.0f), 1.0f - _1019, _1019);
        float _1024 = min((exp2(log2(_981) * 0.699999988079071044921875f) * (mad(_993, -2.0f, 3.0f) * (_993 * _993))) + (mad(_986, -2.0f, 3.0f) * (_986 * _986)), 1.0f);
        float _1034 = mad(_1024, mad(_1023, _1016 * 0.62000000476837158203125f, mad(_896, _947, -_896)), mad(-_896, _947, _896));
        float _1035 = mad(_1024, mad(_1023, _1018, mad(_947, _897, -_897)), mad(-_947, _897, _897));
        float _1036 = mad(_1024, mad(_1023, _1018, mad(_947, _898, -_898)), mad(-_947, _898, _898));
        float _1039 = mad(_816, _817 * (1.0f - _818), _818);
        float _1041;
        _1041 = 0.0f;
        float _1042;
        uint _1045;
        uint _1044 = 0u;
        for (;;)
        {
            if (int(_1044) >= 8)
            {
                break;
            }
            float4 _1052 = t9.Load(_1044);
            float _1054 = _1052.y;
            float _1056 = _1052.x - _810;
            _1042 = mad(_1039 * (_1052.w * clamp((abs((_1056 > 3.1415927410125732421875f) ? (_1056 - 6.283185482025146484375f) : ((_1056 < (-3.1415927410125732421875f)) ? (_1056 + 6.283185482025146484375f) : _1056)) + (_1054 - 3.1415927410125732421875f)) / max(_1054 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1041, _1041);
            _1045 = _1044 + 1u;
            _1041 = _1042;
            _1044 = _1045;
            continue;
        }
        float _1075 = clamp(_1041 + _1041, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1079 = mad(_1075, 0.310000002384185791015625f - _1034, _1034);
        float _1080 = mad(_1075, 0.014999999664723873138427734375f - _1035, _1035);
        float _1081 = mad(_1075, 0.014999999664723873138427734375f - _1036, _1036);
        float4 _1082 = t9.Load(12u);
        float _1083 = _1082.x;
        float _1111;
        float _1112;
        float _1113;
        if (_1083 != 0.0f)
        {
            float _1090 = clamp(_1010, 0.0f, 1.0f);
            float _1100 = clamp((_815 + (_1083 - 1.0f)) / max(mad(_1083, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1104 = clamp(_1083 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1107 = mad(_1104, -2.0f, 3.0f) * (_1104 * _1104);
            _1111 = mad(_1107, _1100 * (_1090 * (_815 * 0.930000007152557373046875f)), _1081);
            _1112 = mad(_1107, _1100 * (_1090 * (_815 * 0.85000002384185791015625f)), _1080);
            _1113 = mad((_1090 * (_815 * 0.790000021457672119140625f)) * _1100, _1107, _1079);
        }
        else
        {
            _1111 = _1081;
            _1112 = _1080;
            _1113 = _1079;
        }
        bool _1116 = cb3_m14.y > 0.0f;
        bool _1120 = frac((_480 * 420.0f) + (_960 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1121 = _1120 ? 0.300000011920928955078125f : 0.0f;
        float _1122 = _1121 * cb3_m14.y;
        _1133 = _1116 ? mad(_1122, 0.0f - _1113, _1113) : _1113;
        _1134 = _1116 ? mad((_1120 ? 0.100000001490116119384765625f : 0.0f) - _1112, _1122, _1112) : _1112;
        _1135 = _1116 ? mad(_1121 - _1111, _1122, _1111) : _1111;
    }
    else
    {
        _1133 = _759;
        _1134 = _760;
        _1135 = _761;
    }
    float _1140 = 1.0f / max(1.0f - max(max(_1134, _1135), _1133), 6.099999882280826568603515625e-05f);
    float _1147 = min(-(_1140 * _1133), 0.0f);
    float _1148 = min(-(_1140 * _1134), 0.0f);
    float _1149 = min(-(_1140 * _1135), 0.0f);
    float _1159 = clamp(-((1.0f / cb3_m7.y) * (sqrt(_569) - cb3_m7.x)), 0.0f, 1.0f);
    float _1160 = mad(_1159, -2.0f, 3.0f);
    float _1161 = _1159 * _1159;
    float _1162 = _1160 * _1161;
    float _1164 = mad(-_1160, _1161, 1.0f);
    float _1187 = cb3_m7.z * cb3_m7.w;
    float3 _1200 = float3(_483 ? (-_1147) : mad(_1147 + ((_1164 * cb3_m5.x) - (_1147 * _1162)), _1187, -_1147), _483 ? (-_1148) : mad(_1187, _1148 + ((_1164 * cb3_m5.y) - (_1148 * _1162)), -_1148), _483 ? (-_1149) : mad(_1187, _1149 + ((_1164 * cb3_m5.z) - (_1149 * _1162)), -_1149));
    float _1201 = dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1200);
    float _1202 = dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1200);
    float _1203 = dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1200);
    bool _1207 = cb2_m0.x != 0.0f;
    float _1224;
    float _1225;
    float _1226;
    if (!_1207)
    {
        _1224 = clamp(mad(cb2_m1.x, mad(_1203, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1225 = clamp(mad(cb2_m1.x, mad(_1202, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1226 = clamp(mad(cb2_m1.x, mad(_1201, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1224 = _1203;
        _1225 = _1202;
        _1226 = _1201;
    }
    float _1229 = mad(cb2_m0.y, -0.0005000000237487256526947021484375f, 0.312709987163543701171875f);
    float _1236 = mad(cb2_m0.z, 0.0005000000237487256526947021484375f, (_1229 * 2.86999988555908203125f) - ((_1229 * _1229) * 3.0f));
    float _1237 = _1236 - 0.2750950753688812255859375f;
    float _1238 = _1229 / _1237;
    float _1242 = ((1.0f - _1229) + (0.2750950753688812255859375f - _1236)) / _1237;
    float3 _1252 = float3(_1226, _1225, _1224);
    float3 _1259 = float3((0.94923698902130126953125f / mad(_1242, -0.1624000072479248046875f, mad(_1238, 0.732800006866455078125f, 0.4296000003814697265625f))) * dp3_f32(float3(0.390404999256134033203125f, 0.549941003322601318359375f, 0.008926319889724254608154296875f), _1252), dp3_f32(float3(0.070841602981090545654296875f, 0.963172018527984619140625f, 0.001357750035822391510009765625f), _1252) * (1.035419940948486328125f / mad(_1242, 0.006099999882280826568603515625f, mad(_1238, -0.703599989414215087890625f, 1.6974999904632568359375f))), dp3_f32(float3(0.02310819923877716064453125f, 0.1280210018157958984375f, 0.936245024204254150390625f), _1252) * (1.0872800350189208984375f / mad(_1242, 0.98339998722076416015625f, mad(_1238, 0.0030000000260770320892333984375f, 0.013600000180304050445556640625f))));
    float3 _1269 = float3(dp3_f32(float3(2.85846996307373046875f, -1.62879002094268798828125f, -0.0248910002410411834716796875f), _1259), dp3_f32(float3(-0.21018199622631072998046875f, 1.1582000255584716796875f, 0.0003242809907533228397369384765625f), _1259), dp3_f32(float3(-0.0418119989335536956787109375f, -0.118169002234935760498046875f, 1.0686700344085693359375f), _1259));
    float _1271 = dp3_f32(_1269, float3(cb2_m1.w, cb2_m2));
    float _1279 = dp3_f32(_1269, float3(cb2_m3, cb2_m4));
    float _1282 = dp3_f32(_1269, cb2_m5);
    float _1284 = dp3_f32(float3(_1271, _1279, _1282), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1293 = clamp((_1284 - cb2_m11) * (1.0f / (cb2_m12.x - cb2_m11)), 0.0f, 1.0f);
    float _1297 = mad(-mad(_1293, -2.0f, 3.0f), _1293 * _1293, 1.0f);
    float _1306 = clamp((_1284 - cb2_m12.y) * (1.0f / (cb2_m12.z - cb2_m12.y)), 0.0f, 1.0f);
    float _1307 = mad(_1306, -2.0f, 3.0f);
    float _1308 = _1306 * _1306;
    float _1309 = _1307 * _1308;
    float _1312 = 1.0f - clamp(mad(_1307, _1308, _1297), 0.0f, 1.0f);
    float _1337;
    float _1338;
    float _1339;
    if (_1207)
    {
        _1337 = cb2_m13.y + 1.0f;
        _1338 = cb2_m12.w + 1.0f;
        _1339 = cb2_m13.x + 1.0f;
    }
    else
    {
        _1337 = cb2_m13.y + mad(cb2_m13.x, 0.5f, mad(cb2_m12.w, 0.25f, 1.0f));
        _1338 = cb2_m12.w + 1.0f;
        _1339 = mad(cb2_m12.w, 0.5f, cb2_m13.x) + 1.0f;
    }
    float _1382 = mad(_1309 * (cb2_m10.y * _1279), _1337, ((_1297 * (cb2_m6.y * _1279)) * _1338) + ((_1312 * (cb2_m8.y * _1279)) * _1339));
    float _1383 = mad(_1309 * (cb2_m10.z * _1282), _1337, ((_1297 * (cb2_m6.z * _1282)) * _1338) + ((_1312 * (cb2_m8.z * _1282)) * _1339));
    float _1384 = mad(_1309 * (_1271 * cb2_m10.x), _1337, ((_1312 * (_1271 * cb2_m8.x)) * _1339) + ((_1297 * (cb2_m6.x * _1271)) * _1338));
    float _1388 = float(_1382 >= _1383);
    float _1389 = mad(_1382 - _1383, _1388, _1383);
    float _1390 = mad(_1388, _1383 - _1382, _1382);
    float _1392 = mad(_1388, -1.0f, 0.666666686534881591796875f);
    float _1398 = float(_1389 <= _1384);
    float _1399 = mad(_1384 - _1389, _1398, _1389);
    float _1400 = mad(_1398, _1390 - _1390, _1390);
    float _1402 = mad(_1398, _1389 - _1384, _1384);
    float _1404 = _1399 - min(_1402, _1400);
    float _1410 = _1404 / (_1399 + 9.9999997473787516355514526367188e-05f);
    float _1414 = abs(((_1402 - _1400) / mad(_1404, 6.0f, 9.9999997473787516355514526367188e-05f)) + mad(_1398, mad(_1388, 1.0f, -1.0f) - _1392, _1392)) + cb2_m1.z;
    float _1420 = (_1414 < 0.0f) ? (_1414 + 1.0f) : ((_1414 > 1.0f) ? (_1414 - 1.0f) : _1414);
    float _1442 = mad(_1410, clamp(abs(mad(frac(_1420 + 1.0f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1443 = mad(_1410, clamp(abs(mad(frac(_1420 + 0.666666686534881591796875f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1444 = mad(_1410, clamp(abs(mad(frac(_1420 + 0.3333333432674407958984375f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1449 = dp3_f32(float3(_1399 * _1442, _1399 * _1443, _1399 * _1444), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1458 = mad(mad(_1399, _1442, -_1449), cb2_m0.w, _1449);
    float _1459 = mad(mad(_1399, _1443, -_1449), cb2_m0.w, _1449);
    float _1460 = mad(mad(_1399, _1444, -_1449), cb2_m0.w, _1449);
    float _1479;
    float _1480;
    float _1481;
    if (_1207)
    {
        _1479 = cb2_m1.y * clamp(mad(cb2_m1.x, _1460 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
        _1480 = cb2_m1.y * clamp(mad(cb2_m1.x, _1459 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
        _1481 = cb2_m1.y * clamp(mad(cb2_m1.x, _1458 - 0.1800537109375f, 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1479 = _1460;
        _1480 = _1459;
        _1481 = _1458;
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
         if (_762) {
            float3 scene_color = mul(renodx::color::XYZ_TO_BT709_MAT, mul(renodx::color::D60_TO_D65_MAT, mul(renodx::color::AP0_TO_XYZ_MAT, float3(_1481, _1480, _1479))));
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_756] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1485 = min(_1481 * 2.5f, 65504.0f);
    float _1486 = min(_1480 * 2.5f, 65504.0f);
    float _1487 = min(_1479 * 2.5f, 65504.0f);
    float _1491 = max(max(_1485, _1486), _1487);
    float _1496 = (max(_1491, 9.9999997473787516355514526367188e-05f) - max(min(min(_1485, _1486), _1487), 9.9999997473787516355514526367188e-05f)) / max(_1491, 0.00999999977648258209228515625f);
    float _1507 = mad(sqrt(mad(_1485, _1485 - _1487, ((_1487 - _1486) * _1487) + ((_1486 - _1485) * _1486))), 1.75f, _1485 + (_1487 + _1486));
    float _1508 = _1496 - 0.4000000059604644775390625f;
    float _1512 = max(1.0f - abs(_1508 * 2.5f), 0.0f);
    float _1520 = mad(mad(clamp(mad(_1508, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1512, _1512, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1528 = ((_1507 <= 0.1599999964237213134765625f) ? _1520 : ((_1507 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1507 * 0.3333333432674407958984375f)) - 0.5f) * _1520))) + 1.0f;
    float _1529 = _1485 * _1528;
    float _1530 = _1528 * _1486;
    float _1531 = _1528 * _1487;
    float _1536 = (_1530 - _1531) * 1.73205077648162841796875f;
    float _1538 = (_1529 * 2.0f) - _1530;
    float _1540 = mad(-_1528, _1487, _1538);
    float _1541 = abs(_1540);
    float _1542 = abs(_1536);
    float _1546 = min(_1541, _1542) * (1.0f / max(_1541, _1542));
    float _1547 = _1546 * _1546;
    float _1551 = mad(_1547, mad(_1547, mad(_1547, mad(_1547, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1561 = mad(_1546, _1551, (_1541 < _1542) ? mad(_1546 * _1551, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1540 < mad(_1528, _1487, -_1538)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1562 = min(_1536, _1540);
    float _1563 = max(_1536, _1540);
    float _1572 = ((_1529 == _1530) && (_1531 == _1530)) ? 0.0f : ((((_1562 < (-_1562)) && (_1563 >= (-_1563))) ? (-_1561) : _1561) * 57.295780181884765625f);
    float _1575 = (_1572 < 0.0f) ? (_1572 + 360.0f) : _1572;
    float _1585 = max(1.0f - abs(((_1575 < (-180.0f)) ? (_1575 + 360.0f) : ((_1575 > 180.0f) ? (_1575 - 360.0f) : _1575)) * 0.01481481455266475677490234375f), 0.0f);
    float _1588 = mad(_1585, -2.0f, 3.0f) * (_1585 * _1585);
    float3 _1599 = float3(clamp(_1529 + (((_1496 * (_1588 * _1588)) * mad(-_1485, _1528, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1530, 0.0f, 65504.0f), clamp(_1531, 0.0f, 65504.0f));
    float _1603 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1599), 0.0f, 65504.0f);
    float _1604 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1599), 0.0f, 65504.0f);
    float _1605 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1599), 0.0f, 65504.0f);
    float _1607 = dp3_f32(float3(_1603, _1604, _1605), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1611 = mad(_1603 - _1607, 0.959999978542327880859375f, _1607);
    float _1612 = mad(_1604 - _1607, 0.959999978542327880859375f, _1607);
    float _1613 = mad(_1605 - _1607, 0.959999978542327880859375f, _1607);
    float _1620 = (_1611 <= 0.0f) ? (-14.0f) : log2(_1611);
    float _1621 = (_1612 <= 0.0f) ? (-14.0f) : log2(_1612);
    float _1622 = (_1613 <= 0.0f) ? (-14.0f) : log2(_1613);
    float _1709;
    if (_1620 <= (-17.4739322662353515625f))
    {
        _1709 = -4.0f;
    }
    else
    {
        float _1708;
        if (_1620 < (-2.4739310741424560546875f))
        {
            float _1633 = mad(_1620, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1634 = _1633 * 0.6643855571746826171875f;
            int _1635 = cvt_f32_i32(_1634);
            float _1638 = mad(_1633, 0.6643855571746826171875f, -trunc(_1634));
            uint _1644 = min(uint(_1635 + 4), 10u);
            uint _1650 = min(uint((_1635 + 1) + 4), 10u);
            uint _1656 = min(uint((_1635 + 2) + 4), 10u);
            float2 _1662 = float2(_349[_1644].x, _349[_1650].x);
            _1708 = dp3_f32(float3(_1638 * _1638, _1638, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1644].x, _349[_1650].x, _349[_1656].x)), dp2_f32(float2(-1.0f, 1.0f), _1662), dp2_f32(0.5f.xx, _1662)));
        }
        else
        {
            float _1707;
            if (_1620 < 15.52606868743896484375f)
            {
                float _1672 = mad(_1620, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1673 = _1672 * 0.55365467071533203125f;
                int _1674 = cvt_f32_i32(_1673);
                float _1677 = mad(_1672, 0.55365467071533203125f, -trunc(_1673));
                uint _1683 = min(uint(_1674 + 4), 10u);
                uint _1689 = min(uint((_1674 + 1) + 4), 10u);
                uint _1695 = min(uint((_1674 + 2) + 4), 10u);
                float2 _1701 = float2(_349[_1683].y, _349[_1689].y);
                _1707 = dp3_f32(float3(_1677 * _1677, _1677, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1683].y, _349[_1689].y, _349[_1695].y)), dp2_f32(float2(-1.0f, 1.0f), _1701), dp2_f32(0.5f.xx, _1701)));
            }
            else
            {
                _1707 = 4.0f;
            }
            _1708 = _1707;
        }
        _1709 = _1708;
    }
    float _1795;
    if (_1621 <= (-17.4739322662353515625f))
    {
        _1795 = -4.0f;
    }
    else
    {
        float _1794;
        if (_1621 < (-2.4739310741424560546875f))
        {
            float _1719 = mad(_1621, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1720 = _1719 * 0.6643855571746826171875f;
            int _1721 = cvt_f32_i32(_1720);
            float _1724 = mad(_1719, 0.6643855571746826171875f, -trunc(_1720));
            uint _1730 = min(uint(_1721 + 4), 10u);
            uint _1736 = min(uint((_1721 + 1) + 4), 10u);
            uint _1742 = min(uint((_1721 + 2) + 4), 10u);
            float2 _1748 = float2(_349[_1730].x, _349[_1736].x);
            _1794 = dp3_f32(float3(_1724 * _1724, _1724, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1730].x, _349[_1736].x, _349[_1742].x)), dp2_f32(float2(-1.0f, 1.0f), _1748), dp2_f32(0.5f.xx, _1748)));
        }
        else
        {
            float _1793;
            if (_1621 < 15.52606868743896484375f)
            {
                float _1758 = mad(_1621, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1759 = _1758 * 0.55365467071533203125f;
                int _1760 = cvt_f32_i32(_1759);
                float _1763 = mad(_1758, 0.55365467071533203125f, -trunc(_1759));
                uint _1769 = min(uint(_1760 + 4), 10u);
                uint _1775 = min(uint((_1760 + 1) + 4), 10u);
                uint _1781 = min(uint((_1760 + 2) + 4), 10u);
                float2 _1787 = float2(_349[_1769].y, _349[_1775].y);
                _1793 = dp3_f32(float3(_1763 * _1763, _1763, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1769].y, _349[_1775].y, _349[_1781].y)), dp2_f32(float2(-1.0f, 1.0f), _1787), dp2_f32(0.5f.xx, _1787)));
            }
            else
            {
                _1793 = 4.0f;
            }
            _1794 = _1793;
        }
        _1795 = _1794;
    }
    float _1881;
    if (_1622 <= (-17.4739322662353515625f))
    {
        _1881 = -4.0f;
    }
    else
    {
        float _1880;
        if (_1622 < (-2.4739310741424560546875f))
        {
            float _1805 = mad(_1622, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1806 = _1805 * 0.6643855571746826171875f;
            int _1807 = cvt_f32_i32(_1806);
            float _1810 = mad(_1805, 0.6643855571746826171875f, -trunc(_1806));
            uint _1816 = min(uint(_1807 + 4), 10u);
            uint _1822 = min(uint((_1807 + 1) + 4), 10u);
            uint _1828 = min(uint((_1807 + 2) + 4), 10u);
            float2 _1834 = float2(_349[_1816].x, _349[_1822].x);
            _1880 = dp3_f32(float3(_1810 * _1810, _1810, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1816].x, _349[_1822].x, _349[_1828].x)), dp2_f32(float2(-1.0f, 1.0f), _1834), dp2_f32(0.5f.xx, _1834)));
        }
        else
        {
            float _1879;
            if (_1622 < 15.52606868743896484375f)
            {
                float _1844 = mad(_1622, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1845 = _1844 * 0.55365467071533203125f;
                int _1846 = cvt_f32_i32(_1845);
                float _1849 = mad(_1844, 0.55365467071533203125f, -trunc(_1845));
                uint _1855 = min(uint(_1846 + 4), 10u);
                uint _1861 = min(uint((_1846 + 1) + 4), 10u);
                uint _1867 = min(uint((_1846 + 2) + 4), 10u);
                float2 _1873 = float2(_349[_1855].y, _349[_1861].y);
                _1879 = dp3_f32(float3(_1849 * _1849, _1849, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_349[_1855].y, _349[_1861].y, _349[_1867].y)), dp2_f32(float2(-1.0f, 1.0f), _1873), dp2_f32(0.5f.xx, _1873)));
            }
            else
            {
                _1879 = 4.0f;
            }
            _1880 = _1879;
        }
        _1881 = _1880;
    }
    float3 _1884 = float3(exp2(_1709 * 3.3219280242919921875f), exp2(_1795 * 3.3219280242919921875f), exp2(_1881 * 3.3219280242919921875f));
    float3 _1888 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1884), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1884), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1884));
    float _1889 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1888);
    float _1890 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1888);
    float _1891 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1888);
    float _1895 = (_1889 <= 0.0f) ? (-4.0f) : (log2(_1889) * 0.3010300099849700927734375f);
    float _1899 = log2(cb1_m[19u].y);
    float _1900 = _1899 * 0.3010300099849700927734375f;
    float _2008;
    if (_1900 >= _1895)
    {
        _2008 = mad(cb1_m[21u].x, _1895, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1900 * cb1_m[21u].x));
    }
    else
    {
        float _1917 = log2(cb1_m[20u].x);
        float _1918 = _1917 * 0.3010300099849700927734375f;
        float _2007;
        if ((_1900 < _1895) && (_1918 > _1895))
        {
            float _1927 = (mad(_1899, -0.3010300099849700927734375f, _1895) * 7.0f) / (_1918 - _1900);
            int _1928 = cvt_f32_i32(_1927);
            float _1930 = _1927 - trunc(_1927);
            uint _1932 = uint(_1928 + 1);
            uint _1934 = uint(_1928 + 2);
            uint _1936 = uint(_1928);
            float2 _1948 = float2(cb1_m[_1936].x, cb1_m[_1932].x);
            _2007 = dp3_f32(float3(_1930 * _1930, _1930, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1936].x, cb1_m[_1932].x, cb1_m[_1934].x)), dp2_f32(float2(-1.0f, 1.0f), _1948), dp2_f32(0.5f.xx, _1948)));
        }
        else
        {
            float _1958 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2006;
            if ((_1918 <= _1895) && (_1958 > _1895))
            {
                float _1967 = (mad(_1917, -0.3010300099849700927734375f, _1895) * 7.0f) / (_1958 - _1918);
                int _1968 = cvt_f32_i32(_1967);
                float _1970 = _1967 - trunc(_1967);
                uint _1975 = uint(_1968 + 10);
                uint _1980 = uint((_1968 + 1) + 10);
                uint _1985 = uint((_1968 + 2) + 10);
                float2 _1991 = float2(cb1_m[_1975].x, cb1_m[_1980].x);
                _2006 = dp3_f32(float3(_1970 * _1970, _1970, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1975].x, cb1_m[_1980].x, cb1_m[_1985].x)), dp2_f32(float2(-1.0f, 1.0f), _1991), dp2_f32(0.5f.xx, _1991)));
            }
            else
            {
                _2006 = mad(cb1_m[21u].y, _1895, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1958 * cb1_m[21u].y));
            }
            _2007 = _2006;
        }
        _2008 = _2007;
    }
    float _2012 = (_1890 <= 0.0f) ? (-4.0f) : (log2(_1890) * 0.3010300099849700927734375f);
    float _2120;
    if (_1900 >= _2012)
    {
        _2120 = mad(cb1_m[21u].x, _2012, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1900 * cb1_m[21u].x));
    }
    else
    {
        float _2029 = log2(cb1_m[20u].x);
        float _2030 = _2029 * 0.3010300099849700927734375f;
        float _2119;
        if ((_1900 < _2012) && (_2030 > _2012))
        {
            float _2039 = (mad(_1899, -0.3010300099849700927734375f, _2012) * 7.0f) / (_2030 - _1900);
            int _2040 = cvt_f32_i32(_2039);
            float _2042 = _2039 - trunc(_2039);
            uint _2044 = uint(_2040 + 1);
            uint _2046 = uint(_2040 + 2);
            uint _2048 = uint(_2040);
            float2 _2060 = float2(cb1_m[_2048].x, cb1_m[_2044].x);
            _2119 = dp3_f32(float3(_2042 * _2042, _2042, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2048].x, cb1_m[_2044].x, cb1_m[_2046].x)), dp2_f32(float2(-1.0f, 1.0f), _2060), dp2_f32(0.5f.xx, _2060)));
        }
        else
        {
            float _2070 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2118;
            if ((_2030 <= _2012) && (_2070 > _2012))
            {
                float _2079 = (mad(_2029, -0.3010300099849700927734375f, _2012) * 7.0f) / (_2070 - _2030);
                int _2080 = cvt_f32_i32(_2079);
                float _2082 = _2079 - trunc(_2079);
                uint _2087 = uint(_2080 + 10);
                uint _2092 = uint((_2080 + 1) + 10);
                uint _2097 = uint((_2080 + 2) + 10);
                float2 _2103 = float2(cb1_m[_2087].x, cb1_m[_2092].x);
                _2118 = dp3_f32(float3(_2082 * _2082, _2082, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2087].x, cb1_m[_2092].x, cb1_m[_2097].x)), dp2_f32(float2(-1.0f, 1.0f), _2103), dp2_f32(0.5f.xx, _2103)));
            }
            else
            {
                _2118 = mad(cb1_m[21u].y, _2012, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2070 * cb1_m[21u].y));
            }
            _2119 = _2118;
        }
        _2120 = _2119;
    }
    float _2124 = (_1891 <= 0.0f) ? (-4.0f) : (log2(_1891) * 0.3010300099849700927734375f);
    float _2232;
    if (_1900 >= _2124)
    {
        _2232 = mad(cb1_m[21u].x, _2124, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1900 * cb1_m[21u].x));
    }
    else
    {
        float _2141 = log2(cb1_m[20u].x);
        float _2142 = _2141 * 0.3010300099849700927734375f;
        float _2231;
        if ((_1900 < _2124) && (_2142 > _2124))
        {
            float _2151 = (mad(_1899, -0.3010300099849700927734375f, _2124) * 7.0f) / (_2142 - _1900);
            int _2152 = cvt_f32_i32(_2151);
            float _2154 = _2151 - trunc(_2151);
            uint _2156 = uint(_2152 + 1);
            uint _2158 = uint(_2152 + 2);
            uint _2160 = uint(_2152);
            float2 _2172 = float2(cb1_m[_2160].x, cb1_m[_2156].x);
            _2231 = dp3_f32(float3(_2154 * _2154, _2154, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2160].x, cb1_m[_2156].x, cb1_m[_2158].x)), dp2_f32(float2(-1.0f, 1.0f), _2172), dp2_f32(0.5f.xx, _2172)));
        }
        else
        {
            float _2182 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2230;
            if ((_2142 <= _2124) && (_2182 > _2124))
            {
                float _2191 = (mad(_2141, -0.3010300099849700927734375f, _2124) * 7.0f) / (_2182 - _2142);
                int _2192 = cvt_f32_i32(_2191);
                float _2194 = _2191 - trunc(_2191);
                uint _2199 = uint(_2192 + 10);
                uint _2204 = uint((_2192 + 1) + 10);
                uint _2209 = uint((_2192 + 2) + 10);
                float2 _2215 = float2(cb1_m[_2199].x, cb1_m[_2204].x);
                _2230 = dp3_f32(float3(_2194 * _2194, _2194, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2199].x, cb1_m[_2204].x, cb1_m[_2209].x)), dp2_f32(float2(-1.0f, 1.0f), _2215), dp2_f32(0.5f.xx, _2215)));
            }
            else
            {
                _2230 = mad(cb1_m[21u].y, _2124, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2182 * cb1_m[21u].y));
            }
            _2231 = _2230;
        }
        _2232 = _2231;
    }
    if (_762)
    {
        float3 _2244 = float3(exp2(_2008 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2120 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2232 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2248 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2244), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2244), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2244));
        float3 _2252 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2248), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2248), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2248));
        float _2261 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2252) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2272 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2252) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2282 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2252) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_756] = float4(min(exp2(log2(mad(_2261, 18.8515625f, 0.8359375f) / mad(_2261, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2272, 18.8515625f, 0.8359375f) / mad(_2272, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2282, 18.8515625f, 0.8359375f) / mad(_2282, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
