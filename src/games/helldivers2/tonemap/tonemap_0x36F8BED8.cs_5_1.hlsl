#include "../common.hlsl"

struct _407
{
    uint2 _m0;
    uint _m1;
};

static const float _2749[30] = { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f };
static const float _65[10][30] = { { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f } };
static const float _70[1] = { 0.0f };
static const float4 _313[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    uint4 cb2_m1 : packoffset(c1);
    float4 cb2_m2 : packoffset(c2);
    float4 cb2_m3 : packoffset(c3);
    float3 cb2_m4 : packoffset(c4);
    uint cb2_m5 : packoffset(c4.w);
    float4 cb2_m6 : packoffset(c5);
    float4 cb2_m7 : packoffset(c6);
    float2 cb2_m8 : packoffset(c7);
    float2 cb2_m9 : packoffset(c7.z);
    uint4 cb2_m10 : packoffset(c8);
    float2 cb2_m11 : packoffset(c9);
    float2 cb2_m12 : packoffset(c9.z);
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
SamplerState s7 : register(s7);
SamplerState s8 : register(s8);
Buffer<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t6 : register(t6);
Texture2D<float4> t7 : register(t7);
Texture2D<float4> t8 : register(t8);
Texture2D<float4> t9 : register(t9);
Texture2D<float4> t10 : register(t10);
Buffer<float4> t11 : register(t11);
Buffer<float4> t12 : register(t12);
RWTexture2D<float4> u0 : register(u0);
RWTexture2D<float4> u1 : register(u1);
RWTexture2D<float4> u2 : register(u2);

static uint3 gl_LocalInvocationID;
static uint3 gl_GlobalInvocationID;
struct SPIRV_Cross_Input
{
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

groupshared float g0[10][30];
groupshared float g1[1];

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
    precise float _398 = a.x * b.x;
    return mad(a.y, b.y, _398);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _384 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _384));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _366 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _366)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _406_dummy_parameter;
    _407 _408 = { spvImageSize(u0, _406_dummy_parameter), 1u };
    uint _420 = gl_GlobalInvocationID.x - gl_LocalInvocationID.x;
    uint _421 = gl_GlobalInvocationID.y - gl_LocalInvocationID.y;
    uint _423 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _424 = spvBitfieldUExtract(_423, 1u, 3u);
    uint _426 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _423, 0u, 1u);
    uint _427 = _420 + _424;
    uint _428 = _426 + _421;
    float _433 = float(_408._m0.x);
    float _434 = float(_408._m0.y);
    float _435 = (float(_427) + 0.5f) / _433;
    float _436 = (float(_428) + 0.5f) / _434;
    bool _439 = (_408._m0.x < _427) || (_408._m0.y < _428);
    bool _444 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _444) && (gl_LocalInvocationID.y == 0u))
    {
        g1[0u] = t8.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    if (_423 < 36u)
    {
        bool _472 = _423 < 4u;
        bool _473 = _423 < 12u;
        bool _474 = _423 < 20u;
        bool _475 = _423 < 28u;
        uint _486 = _472 ? ((_423 >> 1u) * 9u) : (_473 ? 0u : (_474 ? 9u : (_475 ? (((_423 - 20u) & 7u) + 1u) : (((_423 - 28u) & 7u) + 1u))));
        uint _487 = _472 ? ((_423 & 1u) * 9u) : (_473 ? (((_423 - 4u) & 7u) + 1u) : (_474 ? (((_423 - 12u) & 7u) + 1u) : (_475 ? 0u : 9u)));
        float _488 = 1.0f / _433;
        float _489 = 1.0f / _434;
        float _508 = clamp((_488 * (float(int(_486 - 1u)) + 0.5f)) + (_488 * float(int(_420))), 0.0f, 1.0f);
        float _509 = clamp((float(int(_421)) * _489) + ((float(int(_487 - 1u)) + 0.5f) * _489), 0.0f, 1.0f);
        float2 _512 = float2(_508, _509);
        float _517 = mad(t6.SampleLevel(s5, _512, 0.0f).x, 2.0f, -1.0f);
        float _532;
        if (_517 > 0.0f)
        {
            _532 = min(sqrt(_517), t0.Load(8u).x);
        }
        else
        {
            _532 = max(_517, -t0.Load(7u).x);
        }
        float4 _536 = t5.SampleLevel(s4, _512, 0.0f);
        float2 _546 = float2(_536.x * cb2_m2.z, _536.y * cb2_m2.w);
        bool _559 = (cb2_m9.x != 0.0f) && (cb2_m9.y != 0.0f);
        bool _563 = (cb2_m7.w != 0.0f) && (cb2_m8.x != 0.0f);
        float _575 = exp2(max(_559 ? clamp((sqrt(dp2_f32(_546, _546)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _563 ? clamp((abs(_532) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float _577 = _508 - 0.5f;
        float _578 = _509 - 0.5f;
        float2 _579 = float2(_577, _578);
        float _583 = mad(dp2_f32(_579, _579), cb2_m11.y, 1.0f);
        float _605 = mad(exp2(log2(clamp(cb2_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m12.x, -0.089999973773956298828125f, 1.0f);
        float _606 = (_583 * mad(mad(cb2_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb2_m12.x, 1.0f)) * _605;
        float _607 = _605 * (_583 * mad(mad(cb2_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m12.x, 1.0f));
        float _608 = _605 * (_583 * mad(mad(cb2_m12.y, 0.0f, 0.04500000178813934326171875f), cb2_m12.x, 1.0f));
        float _609 = mad(_577, _606, 0.5f);
        float _610 = mad(_606, _578, 0.5f);
        float _611 = mad(_577, _607, 0.5f);
        float _612 = mad(_607, _578, 0.5f);
        float2 _615 = float2(_609, _610);
        float4 _617 = t1.SampleLevel(s0, _615, 0.0f);
        float _618 = _617.x;
        bool _619 = _563 || _559;
        float _653;
        if (_619)
        {
            float4 _625 = t2.SampleLevel(s1, _615, 0.0f);
            float _626 = _625.x;
            float _634 = asfloat(cb0_m[43u].w) * 20.0f;
            float _650 = mad(mad(t9.SampleLevel(s7, float2(mad(_609, 30.0f, sin(_634)), mad(_610, 30.0f, cos(_634))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_626, max(_625.y, _625.z)), 1.0000000133514319600180897396058e-10f)), _626);
            _653 = mad(_575, _618 - _650, _650);
        }
        else
        {
            _653 = _618;
        }
        float2 _654 = float2(_611, _612);
        float4 _656 = t1.SampleLevel(s0, _654, 0.0f);
        float _657 = _656.y;
        float _690;
        if (_619)
        {
            float4 _663 = t2.SampleLevel(s1, _654, 0.0f);
            float _665 = _663.y;
            float _671 = asfloat(cb0_m[43u].w) * 20.0f;
            float _687 = mad(mad(t9.SampleLevel(s7, float2(mad(_611, 30.0f, sin(_671)), mad(_612, 30.0f, cos(_671))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_663.x, max(_665, _663.z)), 1.0000000133514319600180897396058e-10f)), _665);
            _690 = mad(_575, _657 - _687, _687);
        }
        else
        {
            _690 = _657;
        }
        float _691 = mad(_577, _608, 0.5f);
        float _692 = mad(_608, _578, 0.5f);
        float2 _693 = float2(_691, _692);
        float4 _695 = t1.SampleLevel(s0, _693, 0.0f);
        float _696 = _695.z;
        float _729;
        if (_619)
        {
            float4 _702 = t2.SampleLevel(s1, _693, 0.0f);
            float _705 = _702.z;
            float _710 = asfloat(cb0_m[43u].w) * 20.0f;
            float _726 = mad(mad(t9.SampleLevel(s7, float2(mad(_691, 30.0f, sin(_710)), mad(_692, 30.0f, cos(_710))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_702.x, max(_702.y, _705)), 1.0000000133514319600180897396058e-10f)), _705);
            _729 = mad(_575, _696 - _726, _726);
        }
        else
        {
            _729 = _696;
        }
        float _734 = _444 ? g1[0u] : cb2_m3.x;
        float4 _738 = t7.SampleLevel(s6, _512, 0.0f);
        float _739 = _738.x;
        float _747 = max(cb2_m3.w - dp3_f32(float3(_739, _738.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
        float _751 = mad(_653, _734, _739 / _747);
        float _752 = mad(_690, _734, _738.y / _747);
        float _753 = mad(_729, _734, _738.z / _747);
        float _757 = 1.0f / (max(_751, max(_753, _752)) + 1.0f);
        float _758 = _751 * _757;
        float _760 = _757 * _753;
        float3 _761 = float3(_758, _760, _757 * _752);
        uint _766 = (_487 * 12u) >> 2u;
        g0[_486][_766] = dp3_f32(_761, float3(0.25f, 0.25f, 0.5f));
        uint _769 = _766 + 1u;
        g0[_486][_769] = dp2_f32(float2(_758, _760), float2(0.5f, -0.5f));
        uint _772 = _766 + 2u;
        g0[_486][_772] = dp3_f32(_761, float3(-0.25f, -0.25f, 0.5f));
    }
    float2 _777 = float2(_435, _436);
    float _781 = mad(t6.SampleLevel(s5, _777, 0.0f).x, 2.0f, -1.0f);
    float _796;
    if (_781 > 0.0f)
    {
        _796 = min(sqrt(_781), t0.Load(8u).x);
    }
    else
    {
        _796 = max(_781, -t0.Load(7u).x);
    }
    float4 _800 = t5.SampleLevel(s4, _777, 0.0f);
    float _801 = _800.x;
    float _802 = _800.y;
    float2 _813 = float2(_801 * cb2_m2.z, _802 * cb2_m2.w);
    bool _825 = (cb2_m9.x != 0.0f) && (cb2_m9.y != 0.0f);
    bool _829 = (cb2_m7.w != 0.0f) && (cb2_m8.x != 0.0f);
    float _833 = abs(_796);
    float _841 = exp2(max(_825 ? clamp((sqrt(dp2_f32(_813, _813)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _829 ? clamp((_833 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _842 = _435 - 0.5f;
    float _843 = _436 - 0.5f;
    float2 _844 = float2(_842, _843);
    float _845 = dp2_f32(_844, _844);
    float _848 = mad(_845, cb2_m11.y, 1.0f);
    float _870 = mad(exp2(log2(clamp(cb2_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m12.x, -0.089999973773956298828125f, 1.0f);
    float _871 = (_848 * mad(mad(cb2_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb2_m12.x, 1.0f)) * _870;
    float _872 = _870 * (_848 * mad(mad(cb2_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m12.x, 1.0f));
    float _873 = _870 * (_848 * mad(mad(cb2_m12.y, 0.0f, 0.04500000178813934326171875f), cb2_m12.x, 1.0f));
    float _874 = mad(_842, _871, 0.5f);
    float _875 = mad(_871, _843, 0.5f);
    float _876 = mad(_842, _872, 0.5f);
    float _877 = mad(_872, _843, 0.5f);
    float2 _880 = float2(_874, _875);
    float4 _882 = t1.SampleLevel(s0, _880, 0.0f);
    float _883 = _882.x;
    bool _884 = _829 || _825;
    float _917;
    if (_884)
    {
        float4 _890 = t2.SampleLevel(s1, _880, 0.0f);
        float _891 = _890.x;
        float _898 = asfloat(cb0_m[43u].w) * 20.0f;
        float _914 = mad(mad(t9.SampleLevel(s7, float2(mad(_874, 30.0f, sin(_898)), mad(_875, 30.0f, cos(_898))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_891, max(_890.y, _890.z)), 1.0000000133514319600180897396058e-10f)), _891);
        _917 = mad(_841, _883 - _914, _914);
    }
    else
    {
        _917 = _883;
    }
    float2 _918 = float2(_876, _877);
    float4 _920 = t1.SampleLevel(s0, _918, 0.0f);
    float _921 = _920.y;
    float _954;
    if (_884)
    {
        float4 _927 = t2.SampleLevel(s1, _918, 0.0f);
        float _929 = _927.y;
        float _935 = asfloat(cb0_m[43u].w) * 20.0f;
        float _951 = mad(mad(t9.SampleLevel(s7, float2(mad(_876, 30.0f, sin(_935)), mad(_877, 30.0f, cos(_935))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_927.x, max(_929, _927.z)), 1.0000000133514319600180897396058e-10f)), _929);
        _954 = mad(_841, _921 - _951, _951);
    }
    else
    {
        _954 = _921;
    }
    float _955 = mad(_842, _873, 0.5f);
    float _956 = mad(_873, _843, 0.5f);
    float2 _957 = float2(_955, _956);
    float4 _959 = t1.SampleLevel(s0, _957, 0.0f);
    float _960 = _959.z;
    float _993;
    if (_884)
    {
        float4 _966 = t2.SampleLevel(s1, _957, 0.0f);
        float _969 = _966.z;
        float _974 = asfloat(cb0_m[43u].w) * 20.0f;
        float _990 = mad(mad(t9.SampleLevel(s7, float2(mad(_955, 30.0f, sin(_974)), mad(_956, 30.0f, cos(_974))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_966.x, max(_966.y, _969)), 1.0000000133514319600180897396058e-10f)), _969);
        _993 = mad(_841, _960 - _990, _990);
    }
    else
    {
        _993 = _960;
    }
    float _998 = _444 ? g1[0u] : cb2_m3.x;
    float4 _1002 = t7.SampleLevel(s6, _777, 0.0f);
    float _1003 = _1002.x;
    float _1011 = max(cb2_m3.w - dp3_f32(float3(_1003, _1002.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _1015 = mad(_917, _998, _1003 / _1011);
    float _1016 = mad(_954, _998, _1002.y / _1011);
    float _1017 = mad(_993, _998, _1002.z / _1011);
    float _1021 = 1.0f / (max(_1015, max(_1017, _1016)) + 1.0f);
    float _1022 = _1015 * _1021;
    float _1024 = _1021 * _1017;
    float3 _1025 = float3(_1022, _1024, _1021 * _1016);
    float _1026 = dp3_f32(_1025, float3(0.25f, 0.25f, 0.5f));
    float _1027 = dp3_f32(_1025, float3(-0.25f, -0.25f, 0.5f));
    float _1029 = dp2_f32(float2(_1022, _1024), float2(0.5f, -0.5f));
    uint _1030 = _424 + 1u;
    uint _1031 = _424 + 2u;
    uint _1032 = _426 * 12u;
    uint _1035 = (_1032 + 12u) >> 2u;
    g0[_1030][_1035] = _1026;
    uint _1038 = _1035 + 1u;
    g0[_1030][_1038] = _1029;
    uint _1041 = _1035 + 2u;
    g0[_1030][_1041] = _1027;
    float2 _1044 = float2(_801 * cb2_m2.x, _802 * cb2_m2.y);
    float _1048 = min(sqrt(dp2_f32(_1044, _1044)) * 0.07500000298023223876953125f, 1.0f);
    float _1049 = _435 - _801;
    float _1050 = _436 - _802;
    float _1058 = (max(abs(mad(_1050, 2.0f, -1.0f)), abs(mad(_1049, 2.0f, -1.0f))) >= 1.0f) ? (-_1048) : _1048;
    float _1065 = floor(mad(_1049, cb2_m2.x, -0.5f));
    float _1066 = floor(mad(cb2_m2.y, _1050, -0.5f));
    float _1067 = _1065 + 0.5f;
    float _1068 = _1066 + 0.5f;
    float _1072 = mad(_1049, cb2_m2.x, -_1067);
    float _1074 = mad(cb2_m2.y, _1050, -_1068);
    float _1076 = mad(-_1049, cb2_m2.x, _1067);
    float _1078 = mad(-cb2_m2.y, _1050, _1068);
    float _1085 = mad(_1072, mad(_1076, 1.5f, 2.0f), 0.5f);
    float _1086 = mad(_1074, mad(_1078, 1.5f, 2.0f), 0.5f);
    float _1087 = _1072 * _1072;
    float _1088 = _1074 * _1074;
    float _1093 = _1087 * mad(_1072, 0.5f, -0.5f);
    float _1094 = mad(_1074, 0.5f, -0.5f) * _1088;
    float _1097 = _1072 * mad(_1072, mad(_1076, 0.5f, 1.0f), -0.5f);
    float _1098 = _1074 * mad(_1074, mad(_1078, 0.5f, 1.0f), -0.5f);
    float _1101 = mad(_1072, _1085, mad(_1087, mad(_1072, 1.5f, -2.5f), 1.0f));
    float _1102 = mad(_1074, _1086, mad(mad(_1074, 1.5f, -2.5f), _1088, 1.0f));
    float _1109 = (_1065 - 0.5f) / cb2_m2.x;
    float _1110 = (_1066 - 0.5f) / cb2_m2.y;
    float _1111 = (_1065 + 2.5f) / cb2_m2.x;
    float _1112 = (_1066 + 2.5f) / cb2_m2.y;
    float _1113 = (((_1074 * _1086) / _1102) + _1068) / cb2_m2.y;
    float _1114 = (_1067 + ((_1072 * _1085) / _1101)) / cb2_m2.x;
    float4 _1119 = t3.SampleLevel(s2, float2(_1109, _1110), 0.0f);
    float4 _1128 = t3.SampleLevel(s2, float2(_1111, _1110), 0.0f);
    float4 _1146 = t3.SampleLevel(s2, float2(_1114, _1110), 0.0f);
    float4 _1158 = t3.SampleLevel(s2, float2(_1109, _1113), 0.0f);
    float4 _1170 = t3.SampleLevel(s2, float2(_1114, _1113), 0.0f);
    float4 _1182 = t3.SampleLevel(s2, float2(_1111, _1113), 0.0f);
    float4 _1194 = t3.SampleLevel(s2, float2(_1109, _1112), 0.0f);
    float4 _1206 = t3.SampleLevel(s2, float2(_1114, _1112), 0.0f);
    float4 _1218 = t3.SampleLevel(s2, float2(_1111, _1112), 0.0f);
    float _1225 = mad(_1093 * _1218.x, _1094, mad(_1101 * _1206.x, _1094, mad(_1097 * _1194.x, _1094, mad(_1093 * _1182.x, _1102, mad(_1101 * _1170.x, _1102, mad(_1097 * _1158.x, _1102, mad(_1101 * _1146.x, _1098, ((_1093 * _1128.x) * _1098) + ((_1097 * _1119.x) * _1098))))))));
    float _1227 = mad(_1094, _1093 * _1218.z, mad(_1094, _1101 * _1206.z, mad(_1094, _1097 * _1194.z, mad(_1093 * _1182.z, _1102, mad(_1101 * _1170.z, _1102, mad(_1097 * _1158.z, _1102, mad(_1101 * _1146.z, _1098, ((_1097 * _1119.z) * _1098) + ((_1093 * _1128.z) * _1098))))))));
    float3 _1228 = float3(_1225, _1227, mad(_1094, _1093 * _1218.y, mad(_1094, _1101 * _1206.y, mad(_1094, _1097 * _1194.y, mad(_1093 * _1182.y, _1102, mad(_1101 * _1170.y, _1102, mad(_1097 * _1158.y, _1102, mad(_1101 * _1146.y, _1098, ((_1097 * _1119.y) * _1098) + ((_1093 * _1128.y) * _1098)))))))));
    float _1229 = dp3_f32(_1228, float3(0.25f, 0.25f, 0.5f));
    float _1230 = dp3_f32(_1228, float3(-0.25f, -0.25f, 0.5f));
    float _1232 = dp2_f32(float2(_1225, _1227), float2(0.5f, -0.5f));
    GroupMemoryBarrierWithGroupSync();
    uint _1233 = _1032 >> 2u;
    uint _1237 = _1233 + 1u;
    uint _1241 = _1233 + 2u;
    uint _1327 = (_1032 + 24u) >> 2u;
    uint _1331 = _1327 + 1u;
    uint _1335 = _1327 + 2u;
    float _1356 = min(min(min(min(_1026, g0[_1030][_1233]), g0[_424][_1035]), g0[_1031][_1035]), g0[_1030][_1327]);
    float _1357 = max(max(max(max(_1026, g0[_1030][_1233]), g0[_424][_1035]), g0[_1031][_1035]), g0[_1030][_1327]);
    float _1375 = (((((((_1026 + g0[_1030][_1233]) + g0[_424][_1233]) + g0[_424][_1035]) + g0[_1031][_1233]) + g0[_1031][_1035]) + g0[_424][_1327]) + g0[_1030][_1327]) + g0[_1031][_1327];
    float _1389 = _1375 * 0.111111111938953399658203125f;
    float _1390 = (g0[_1031][_1331] + (g0[_1030][_1331] + (g0[_424][_1331] + (g0[_1031][_1038] + (g0[_1031][_1237] + (g0[_424][_1038] + (g0[_424][_1237] + (_1029 + g0[_1030][_1237])))))))) * 0.111111111938953399658203125f;
    float _1391 = (g0[_1031][_1335] + (g0[_1030][_1335] + (g0[_424][_1335] + (g0[_1031][_1041] + (g0[_1031][_1241] + (g0[_424][_1041] + (g0[_424][_1241] + (_1027 + g0[_1030][_1241])))))))) * 0.111111111938953399658203125f;
    float _1410 = mad(_1229 / max(mad(_1375, 0.111111111938953399658203125f, _1229), 1.0000000116860974230803549289703e-07f), 0.5f, 0.75f);
    float _1411 = sqrt(max((mad(g0[_1031][_1327], g0[_1031][_1327], mad(g0[_1030][_1327], g0[_1030][_1327], mad(g0[_424][_1327], g0[_424][_1327], mad(g0[_1031][_1035], g0[_1031][_1035], mad(g0[_1031][_1233], g0[_1031][_1233], mad(g0[_424][_1035], g0[_424][_1035], mad(g0[_424][_1233], g0[_424][_1233], (g0[_1030][_1233] * g0[_1030][_1233]) + (_1026 * _1026)))))))) * 0.111111111938953399658203125f) - (_1389 * _1389), 1.0000000133514319600180897396058e-10f)) * _1410;
    float _1412 = _1410 * sqrt(max((mad(g0[_1031][_1331], g0[_1031][_1331], mad(g0[_1030][_1331], g0[_1030][_1331], mad(g0[_424][_1331], g0[_424][_1331], mad(g0[_1031][_1038], g0[_1031][_1038], mad(g0[_1031][_1237], g0[_1031][_1237], mad(g0[_424][_1038], g0[_424][_1038], mad(g0[_424][_1237], g0[_424][_1237], (_1029 * _1029) + (g0[_1030][_1237] * g0[_1030][_1237])))))))) * 0.111111111938953399658203125f) - (_1390 * _1390), 1.0000000133514319600180897396058e-10f));
    float _1413 = _1410 * sqrt(max((mad(g0[_1031][_1335], g0[_1031][_1335], mad(g0[_1030][_1335], g0[_1030][_1335], mad(g0[_424][_1335], g0[_424][_1335], mad(g0[_1031][_1041], g0[_1031][_1041], mad(g0[_1031][_1241], g0[_1031][_1241], mad(g0[_424][_1041], g0[_424][_1041], mad(g0[_424][_1241], g0[_424][_1241], (_1027 * _1027) + (g0[_1030][_1241] * g0[_1030][_1241])))))))) * 0.111111111938953399658203125f) - (_1391 * _1391), 1.0000000133514319600180897396058e-10f));
    float _1417 = _1389 + _1411;
    float _1418 = _1412 + _1390;
    float _1419 = _1413 + _1391;
    float _1420 = (_1389 - _1411) + _1417;
    float _1421 = _1418 + (_1390 - _1412);
    float _1422 = _1419 + (_1391 - _1413);
    float _1432 = mad(_1420, -0.5f, _1229);
    float _1433 = mad(_1421, -0.5f, _1232);
    float _1434 = mad(_1422, -0.5f, _1230);
    float _1442 = max(max(abs(_1433 / mad((_1412 - _1390) + _1418, 0.5f, 9.9999997473787516355514526367188e-05f)), abs(_1432 / mad(_1417 + (_1411 - _1389), 0.5f, 9.9999997473787516355514526367188e-05f))), abs(_1434 / mad((_1413 - _1391) + _1419, 0.5f, 9.9999997473787516355514526367188e-05f)));
    bool _1443 = _1442 > 1.0f;
    uint2 _1461 = uint2(_427, _428);
    float _1465 = max((_1229 / ((_1229 + (mad(_1357, 0.5f, max(_1357 * 0.5f, max(max(max(max(_1026, g0[_424][_1233]), g0[_1031][_1233]), g0[_424][_1327]), g0[_1031][_1327]) * 0.5f)) - mad(_1356, 0.5f, min(_1356 * 0.5f, min(min(min(min(_1026, g0[_424][_1233]), g0[_1031][_1233]), g0[_424][_1327]), g0[_1031][_1327]) * 0.5f)))) + 1.0000000116860974230803549289703e-07f)) * mad(abs(_1058), 0.85000002384185791015625f, 0.100000001490116119384765625f), u2[_1461].x * 0.75f);
    bool _1466 = _1058 < 0.0f;
    float _1467 = _1466 ? _1026 : (_1443 ? mad(_1420, 0.5f, _1432 / _1442) : _1229);
    float _1468 = _1466 ? _1029 : (_1443 ? mad(_1421, 0.5f, _1433 / _1442) : _1232);
    float _1469 = _1466 ? _1027 : (_1443 ? mad(_1422, 0.5f, _1434 / _1442) : _1230);
    float _1477 = clamp(mad(t4.SampleLevel(s3, _777, 0.0f).y, 1.0f - _1465, _1465), 0.0039215688593685626983642578125f, 0.949999988079071044921875f);
    float _1481 = mad(1.0f - _1477, cb2_m0.x, _1477);
    float _1485 = mad(_1481, _1026 - _1467, _1467);
    float _1486 = mad(_1481, _1029 - _1468, _1468);
    float _1487 = mad(_1481, _1027 - _1469, _1469);
    float _1488 = _1485 - _1487;
    float _1489 = _1488 + _1486;
    float _1490 = _1485 + _1487;
    float _1491 = _1488 - _1486;
    u1[_1461] = float4(_1489, _1490, _1491, 0.0f);
    u2[_1461] = _1481.xxxx;
    bool _1495 = !_439;
    float _1867;
    float _1868;
    float _1869;
    if (_1495)
    {
        float _1499 = dp3_f32(float3(_1489, _1490, _1491), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1506 = mad(-_833, cb2_m8.y, 1.0f) * cb2_m7.x;
        float _1510 = mad(_1506, _1489 - _1499, _1499);
        float _1511 = mad(_1506, _1490 - _1499, _1499);
        float _1512 = mad(_1506, _1491 - _1499, _1499);
        float _1513 = _843 + _843;
        float _1514 = _842 + _842;
        float _1515 = abs(_1514);
        float _1516 = abs(_1513);
        float _1520 = min(_1515, _1516) * (1.0f / max(_1515, _1516));
        float _1521 = _1520 * _1520;
        float _1525 = mad(_1521, mad(_1521, mad(_1521, mad(_1521, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1534 = mad(_1520, _1525, (_1515 < _1516) ? mad(_1520 * _1525, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_1514) > _1514) ? (-3.1415927410125732421875f) : 0.0f);
        float _1535 = min(_1513, _1514);
        float _1536 = max(_1513, _1514);
        float _1543 = ((_1535 < (-_1535)) && (_1536 >= (-_1536))) ? (-_1534) : _1534;
        float4 _1547 = t10.SampleLevel(s8, _777, 0.0f);
        float _1548 = _1547.x;
        float _1549 = _1547.y;
        float _1550 = _1547.z;
        float _1551 = _1547.w;
        float _1556 = (_1511 - _1512) * 1.73205077648162841796875f;
        float _1558 = mad(_1510, 2.0f, -_1511);
        float _1559 = _1558 - _1512;
        float _1560 = abs(_1556);
        float _1561 = abs(_1559);
        float _1565 = min(_1560, _1561) * (1.0f / max(_1560, _1561));
        float _1566 = _1565 * _1565;
        float _1570 = mad(_1566, mad(_1566, mad(_1566, mad(_1566, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1579 = mad(_1565, _1570, (_1560 > _1561) ? mad(_1565 * _1570, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1559 < (_1512 - _1558)) ? (-3.1415927410125732421875f) : 0.0f);
        float _1580 = min(_1556, _1559);
        float _1581 = max(_1556, _1559);
        float _1590 = ((_1510 == _1511) && (_1512 == _1511)) ? 0.0f : ((((_1580 < (-_1580)) && (_1581 >= (-_1581))) ? (-_1579) : _1579) * 57.295780181884765625f);
        float _1599 = mad(cb2_m14.x, -360.0f, (_1590 < 0.0f) ? (_1590 + 360.0f) : _1590);
        float _1609 = clamp(1.0f - (abs((_1599 < (-180.0f)) ? (_1599 + 360.0f) : ((_1599 > 180.0f) ? (_1599 - 360.0f) : _1599)) / (cb2_m14.y * 180.0f)), 0.0f, 1.0f);
        float _1614 = dp3_f32(float3(_1510, _1511, _1512), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1617 = (mad(_1609, -2.0f, 3.0f) * (_1609 * _1609)) * cb2_m14.z;
        float _1629 = mad(mad(_1617, _1510 - _1614, _1614) - _1510, cb2_m13.x, _1510);
        float _1630 = mad(cb2_m13.x, mad(_1617, _1511 - _1614, _1614) - _1511, _1511);
        float _1631 = mad(cb2_m13.x, mad(_1617, _1512 - _1614, _1614) - _1512, _1512);
        float _1633;
        _1633 = 0.0f;
        float _1634;
        uint _1637;
        uint _1636 = 0u;
        for (;;)
        {
            if (_1636 >= 8u)
            {
                break;
            }
            uint _1648 = min((_1636 & 3u), 10u);
            float _1668 = mad(float(_1636), 0.785398185253143310546875f, -_1543);
            float _1669 = _1668 + 1.57079637050628662109375f;
            _1634 = mad(_1551 * (dp4_f32(t11.Load((_1636 >> 2u) + 10u), float4(_313[_1648].x, _313[_1648].y, _313[_1648].z, _313[_1648].w)) * clamp((abs((_1669 > 3.1415927410125732421875f) ? (_1668 - 4.7123889923095703125f) : _1669) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _1633, _1633);
            _1637 = _1636 + 1u;
            _1633 = _1634;
            _1636 = _1637;
            continue;
        }
        float _1680 = clamp(_1633, 0.0f, 1.0f);
        float _1693 = asfloat(cb0_m[43u].w);
        float _1699 = abs(t11.Load(8u).x);
        float2 _1702 = float2(_842 * 1.40999996662139892578125f, _843 * 1.40999996662139892578125f);
        float _1704 = sqrt(dp2_f32(_1702, _1702));
        float _1705 = min(_1704, 1.0f);
        float _1706 = _1705 * _1705;
        float _1711 = clamp(_1704 - 0.5f, 0.0f, 1.0f);
        float _1714 = (_1705 * _1706) + (mad(-_1705, _1706, 1.0f) * (_1711 * _1711));
        float _1715 = mad(mad(mad(sin(_1693 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _1699, -1.0f);
        float _1717 = _1549 + _1715;
        float _1719 = clamp((_1550 + _1715) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _1726 = clamp(_1717 + _1717, 0.0f, 1.0f);
        float _1736 = mad(sin(_1549 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f);
        float _1743 = dp3_f32(float3(t12.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1748 = mad(exp2(log2(abs(_1743)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1752 = _1736 * (_1748 * 0.02999999932944774627685546875f);
        float _1753 = mad(_1699, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1757 = mad(mad(-_1714, _1714, 1.0f), 1.0f - _1753, _1753);
        float _1758 = min((exp2(log2(_1714) * 0.699999988079071044921875f) * (mad(_1726, -2.0f, 3.0f) * (_1726 * _1726))) + (mad(_1719, -2.0f, 3.0f) * (_1719 * _1719)), 1.0f);
        float _1768 = mad(_1758, mad((_1736 * _1748) * 0.62000000476837158203125f, _1757, mad(_1629, _1680, -_1629)), mad(-_1629, _1680, _1629));
        float _1769 = mad(_1758, mad(_1757, _1752, mad(_1680, _1630, -_1630)), mad(-_1680, _1630, _1630));
        float _1770 = mad(_1758, mad(_1757, _1752, mad(_1680, _1631, -_1631)), mad(-_1680, _1631, _1631));
        float _1773 = mad(_1549, _1550 * (1.0f - _1551), _1551);
        float _1775;
        _1775 = 0.0f;
        float _1776;
        uint _1779;
        uint _1778 = 0u;
        for (;;)
        {
            if (int(_1778) >= 8)
            {
                break;
            }
            float4 _1786 = t11.Load(_1778);
            float _1788 = _1786.y;
            float _1790 = _1786.x - _1543;
            _1776 = mad(_1773 * (_1786.w * clamp(((_1788 - 3.1415927410125732421875f) + abs((_1790 > 3.1415927410125732421875f) ? (_1790 - 6.283185482025146484375f) : ((_1790 < (-3.1415927410125732421875f)) ? (_1790 + 6.283185482025146484375f) : _1790))) / max(_1788 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1775, _1775);
            _1779 = _1778 + 1u;
            _1775 = _1776;
            _1778 = _1779;
            continue;
        }
        float _1809 = clamp(_1775 + _1775, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1813 = mad(_1809, 0.310000002384185791015625f - _1768, _1768);
        float _1814 = mad(_1809, 0.014999999664723873138427734375f - _1769, _1769);
        float _1815 = mad(_1809, 0.014999999664723873138427734375f - _1770, _1770);
        float4 _1816 = t11.Load(12u);
        float _1817 = _1816.x;
        float _1845;
        float _1846;
        float _1847;
        if (_1817 != 0.0f)
        {
            float _1824 = clamp(_1743, 0.0f, 1.0f);
            float _1834 = clamp((_1548 + (_1817 - 1.0f)) / max(mad(_1817, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1838 = clamp(_1817 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1841 = mad(_1838, -2.0f, 3.0f) * (_1838 * _1838);
            _1845 = mad(_1841, _1834 * (_1824 * (_1548 * 0.930000007152557373046875f)), _1815);
            _1846 = mad(_1841, _1834 * (_1824 * (_1548 * 0.85000002384185791015625f)), _1814);
            _1847 = mad((_1824 * (_1548 * 0.790000021457672119140625f)) * _1834, _1841, _1813);
        }
        else
        {
            _1845 = _1815;
            _1846 = _1814;
            _1847 = _1813;
        }
        bool _1850 = cb2_m13.y > 0.0f;
        bool _1854 = frac((_436 * 420.0f) + (_1693 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1855 = _1854 ? 0.300000011920928955078125f : 0.0f;
        float _1856 = cb2_m13.y * _1855;
        _1867 = _1850 ? mad(_1856, 0.0f - _1847, _1847) : _1847;
        _1868 = _1850 ? mad(_1856, (_1854 ? 0.100000001490116119384765625f : 0.0f) - _1846, _1846) : _1846;
        _1869 = _1850 ? mad(_1856, _1855 - _1845, _1845) : _1845;
    }
    else
    {
        _1867 = _1489;
        _1868 = _1490;
        _1869 = _1491;
    }
    float _1874 = 1.0f / max(1.0f - max(max(_1868, _1869), _1867), 6.099999882280826568603515625e-05f);
    float _1881 = min(-(_1874 * _1867), 0.0f);
    float _1882 = min(-(_1874 * _1868), 0.0f);
    float _1883 = min(-(_1874 * _1869), 0.0f);
    float _1893 = clamp(-((sqrt(_845) - cb2_m6.x) * (1.0f / cb2_m6.y)), 0.0f, 1.0f);
    float _1894 = mad(_1893, -2.0f, 3.0f);
    float _1895 = _1893 * _1893;
    float _1896 = _1894 * _1895;
    float _1898 = mad(-_1894, _1895, 1.0f);
    float _1921 = cb2_m6.w * cb2_m6.z;
    float3 _1934 = float3(_439 ? (-_1881) : mad(_1881 + ((cb2_m4.x * _1898) - (_1881 * _1896)), _1921, -_1881), _439 ? (-_1882) : mad(_1921, ((_1898 * cb2_m4.y) - (_1896 * _1882)) + _1882, -_1882), _439 ? (-_1883) : mad(_1921, ((cb2_m4.z * _1898) - (_1896 * _1883)) + _1883, -_1883));
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
         if (_1495) {
            float3 scene_color = _1934;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_1461] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1941 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1934) * 2.5f, 65504.0f);
    float _1942 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1934) * 2.5f, 65504.0f);
    float _1943 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1934) * 2.5f, 65504.0f);
    float _1947 = max(max(_1942, _1941), _1943);
    float _1952 = (max(_1947, 9.9999997473787516355514526367188e-05f) - max(min(min(_1942, _1941), _1943), 9.9999997473787516355514526367188e-05f)) / max(_1947, 0.00999999977648258209228515625f);
    float _1963 = mad(sqrt(mad(_1941 - _1943, _1941, ((_1943 - _1942) * _1943) + ((_1942 - _1941) * _1942))), 1.75f, (_1943 + _1942) + _1941);
    float _1964 = _1952 - 0.4000000059604644775390625f;
    float _1968 = max(1.0f - abs(_1964 * 2.5f), 0.0f);
    float _1976 = mad(mad(clamp(mad(_1964, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1968, _1968, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1984 = ((_1963 <= 0.1599999964237213134765625f) ? _1976 : ((_1963 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1963 * 0.3333333432674407958984375f)) - 0.5f) * _1976))) + 1.0f;
    float _1985 = _1984 * _1941;
    float _1986 = _1984 * _1942;
    float _1987 = _1984 * _1943;
    float _1992 = (_1986 - _1987) * 1.73205077648162841796875f;
    float _1994 = (_1985 * 2.0f) - _1986;
    float _1996 = mad(-_1984, _1943, _1994);
    float _1997 = abs(_1996);
    float _1998 = abs(_1992);
    float _2002 = min(_1997, _1998) * (1.0f / max(_1997, _1998));
    float _2003 = _2002 * _2002;
    float _2007 = mad(_2003, mad(_2003, mad(_2003, mad(_2003, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _2017 = mad(_2002, _2007, (_1997 < _1998) ? mad(_2002 * _2007, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1996 < mad(_1984, _1943, -_1994)) ? (-3.1415927410125732421875f) : 0.0f);
    float _2018 = min(_1992, _1996);
    float _2019 = max(_1992, _1996);
    float _2028 = ((_1985 == _1986) && (_1987 == _1986)) ? 0.0f : ((((_2018 < (-_2018)) && (_2019 >= (-_2019))) ? (-_2017) : _2017) * 57.295780181884765625f);
    float _2031 = (_2028 < 0.0f) ? (_2028 + 360.0f) : _2028;
    float _2041 = max(1.0f - abs(((_2031 < (-180.0f)) ? (_2031 + 360.0f) : ((_2031 > 180.0f) ? (_2031 - 360.0f) : _2031)) * 0.01481481455266475677490234375f), 0.0f);
    float _2044 = mad(_2041, -2.0f, 3.0f) * (_2041 * _2041);
    float3 _2055 = float3(clamp(_1985 + (((_1952 * (_2044 * _2044)) * mad(-_1984, _1941, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1986, 0.0f, 65504.0f), clamp(_1987, 0.0f, 65504.0f));
    float _2059 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2055), 0.0f, 65504.0f);
    float _2060 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2055), 0.0f, 65504.0f);
    float _2061 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2055), 0.0f, 65504.0f);
    float _2063 = dp3_f32(float3(_2059, _2060, _2061), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _2067 = mad(_2059 - _2063, 0.959999978542327880859375f, _2063);
    float _2068 = mad(_2060 - _2063, 0.959999978542327880859375f, _2063);
    float _2069 = mad(_2061 - _2063, 0.959999978542327880859375f, _2063);
    float _2076 = (_2067 <= 0.0f) ? (-14.0f) : log2(_2067);
    float _2077 = (_2068 <= 0.0f) ? (-14.0f) : log2(_2068);
    float _2078 = (_2069 <= 0.0f) ? (-14.0f) : log2(_2069);
    float _2165;
    if (_2076 <= (-17.4739322662353515625f))
    {
        _2165 = -4.0f;
    }
    else
    {
        float _2164;
        if (_2076 < (-2.4739310741424560546875f))
        {
            float _2089 = mad(_2076, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2090 = _2089 * 0.6643855571746826171875f;
            int _2091 = cvt_f32_i32(_2090);
            float _2094 = mad(_2089, 0.6643855571746826171875f, -trunc(_2090));
            uint _2100 = min(uint(_2091 + 4), 10u);
            uint _2106 = min(uint((_2091 + 1) + 4), 10u);
            uint _2112 = min(uint((_2091 + 2) + 4), 10u);
            float2 _2118 = float2(_313[_2100].x, _313[_2106].x);
            _2164 = dp3_f32(float3(_2094 * _2094, _2094, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2100].x, _313[_2106].x, _313[_2112].x)), dp2_f32(float2(-1.0f, 1.0f), _2118), dp2_f32(0.5f.xx, _2118)));
        }
        else
        {
            float _2163;
            if (_2076 < 15.52606868743896484375f)
            {
                float _2128 = mad(_2076, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2129 = _2128 * 0.55365467071533203125f;
                int _2130 = cvt_f32_i32(_2129);
                float _2133 = mad(_2128, 0.55365467071533203125f, -trunc(_2129));
                uint _2139 = min(uint(_2130 + 4), 10u);
                uint _2145 = min(uint((_2130 + 1) + 4), 10u);
                uint _2151 = min(uint((_2130 + 2) + 4), 10u);
                float2 _2157 = float2(_313[_2139].y, _313[_2145].y);
                _2163 = dp3_f32(float3(_2133 * _2133, _2133, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2139].y, _313[_2145].y, _313[_2151].y)), dp2_f32(float2(-1.0f, 1.0f), _2157), dp2_f32(0.5f.xx, _2157)));
            }
            else
            {
                _2163 = 4.0f;
            }
            _2164 = _2163;
        }
        _2165 = _2164;
    }
    float _2251;
    if (_2077 <= (-17.4739322662353515625f))
    {
        _2251 = -4.0f;
    }
    else
    {
        float _2250;
        if (_2077 < (-2.4739310741424560546875f))
        {
            float _2175 = mad(_2077, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2176 = _2175 * 0.6643855571746826171875f;
            int _2177 = cvt_f32_i32(_2176);
            float _2180 = mad(_2175, 0.6643855571746826171875f, -trunc(_2176));
            uint _2186 = min(uint(_2177 + 4), 10u);
            uint _2192 = min(uint((_2177 + 1) + 4), 10u);
            uint _2198 = min(uint((_2177 + 2) + 4), 10u);
            float2 _2204 = float2(_313[_2186].x, _313[_2192].x);
            _2250 = dp3_f32(float3(_2180 * _2180, _2180, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2186].x, _313[_2192].x, _313[_2198].x)), dp2_f32(float2(-1.0f, 1.0f), _2204), dp2_f32(0.5f.xx, _2204)));
        }
        else
        {
            float _2249;
            if (_2077 < 15.52606868743896484375f)
            {
                float _2214 = mad(_2077, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2215 = _2214 * 0.55365467071533203125f;
                int _2216 = cvt_f32_i32(_2215);
                float _2219 = mad(_2214, 0.55365467071533203125f, -trunc(_2215));
                uint _2225 = min(uint(_2216 + 4), 10u);
                uint _2231 = min(uint((_2216 + 1) + 4), 10u);
                uint _2237 = min(uint((_2216 + 2) + 4), 10u);
                float2 _2243 = float2(_313[_2225].y, _313[_2231].y);
                _2249 = dp3_f32(float3(_2219 * _2219, _2219, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2225].y, _313[_2231].y, _313[_2237].y)), dp2_f32(float2(-1.0f, 1.0f), _2243), dp2_f32(0.5f.xx, _2243)));
            }
            else
            {
                _2249 = 4.0f;
            }
            _2250 = _2249;
        }
        _2251 = _2250;
    }
    float _2337;
    if (_2078 <= (-17.4739322662353515625f))
    {
        _2337 = -4.0f;
    }
    else
    {
        float _2336;
        if (_2078 < (-2.4739310741424560546875f))
        {
            float _2261 = mad(_2078, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2262 = _2261 * 0.6643855571746826171875f;
            int _2263 = cvt_f32_i32(_2262);
            float _2266 = mad(_2261, 0.6643855571746826171875f, -trunc(_2262));
            uint _2272 = min(uint(_2263 + 4), 10u);
            uint _2278 = min(uint((_2263 + 1) + 4), 10u);
            uint _2284 = min(uint((_2263 + 2) + 4), 10u);
            float2 _2290 = float2(_313[_2272].x, _313[_2278].x);
            _2336 = dp3_f32(float3(_2266 * _2266, _2266, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2272].x, _313[_2278].x, _313[_2284].x)), dp2_f32(float2(-1.0f, 1.0f), _2290), dp2_f32(0.5f.xx, _2290)));
        }
        else
        {
            float _2335;
            if (_2078 < 15.52606868743896484375f)
            {
                float _2300 = mad(_2078, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2301 = _2300 * 0.55365467071533203125f;
                int _2302 = cvt_f32_i32(_2301);
                float _2305 = mad(_2300, 0.55365467071533203125f, -trunc(_2301));
                uint _2311 = min(uint(_2302 + 4), 10u);
                uint _2317 = min(uint((_2302 + 1) + 4), 10u);
                uint _2323 = min(uint((_2302 + 2) + 4), 10u);
                float2 _2329 = float2(_313[_2311].y, _313[_2317].y);
                _2335 = dp3_f32(float3(_2305 * _2305, _2305, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_313[_2311].y, _313[_2317].y, _313[_2323].y)), dp2_f32(float2(-1.0f, 1.0f), _2329), dp2_f32(0.5f.xx, _2329)));
            }
            else
            {
                _2335 = 4.0f;
            }
            _2336 = _2335;
        }
        _2337 = _2336;
    }
    float3 _2340 = float3(exp2(_2165 * 3.3219280242919921875f), exp2(_2251 * 3.3219280242919921875f), exp2(_2337 * 3.3219280242919921875f));
    float3 _2344 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _2340), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _2340), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _2340));
    float _2345 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2344);
    float _2346 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2344);
    float _2347 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2344);
    float _2351 = (_2345 <= 0.0f) ? (-4.0f) : (log2(_2345) * 0.3010300099849700927734375f);
    float _2355 = log2(cb1_m[19u].y);
    float _2356 = _2355 * 0.3010300099849700927734375f;
    float _2464;
    if (_2356 >= _2351)
    {
        _2464 = mad(cb1_m[21u].x, _2351, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2356 * cb1_m[21u].x));
    }
    else
    {
        float _2373 = log2(cb1_m[20u].x);
        float _2374 = _2373 * 0.3010300099849700927734375f;
        float _2463;
        if ((_2356 < _2351) && (_2374 > _2351))
        {
            float _2383 = (mad(_2355, -0.3010300099849700927734375f, _2351) * 7.0f) / (_2374 - _2356);
            int _2384 = cvt_f32_i32(_2383);
            float _2386 = _2383 - trunc(_2383);
            uint _2388 = uint(_2384 + 1);
            uint _2390 = uint(_2384 + 2);
            uint _2392 = uint(_2384);
            float2 _2404 = float2(cb1_m[_2392].x, cb1_m[_2388].x);
            _2463 = dp3_f32(float3(_2386 * _2386, _2386, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2392].x, cb1_m[_2388].x, cb1_m[_2390].x)), dp2_f32(float2(-1.0f, 1.0f), _2404), dp2_f32(0.5f.xx, _2404)));
        }
        else
        {
            float _2414 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2462;
            if ((_2374 <= _2351) && (_2414 > _2351))
            {
                float _2423 = (mad(_2373, -0.3010300099849700927734375f, _2351) * 7.0f) / (_2414 - _2374);
                int _2424 = cvt_f32_i32(_2423);
                float _2426 = _2423 - trunc(_2423);
                uint _2431 = uint(_2424 + 10);
                uint _2436 = uint((_2424 + 1) + 10);
                uint _2441 = uint((_2424 + 2) + 10);
                float2 _2447 = float2(cb1_m[_2431].x, cb1_m[_2436].x);
                _2462 = dp3_f32(float3(_2426 * _2426, _2426, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2431].x, cb1_m[_2436].x, cb1_m[_2441].x)), dp2_f32(float2(-1.0f, 1.0f), _2447), dp2_f32(0.5f.xx, _2447)));
            }
            else
            {
                _2462 = mad(cb1_m[21u].y, _2351, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2414 * cb1_m[21u].y));
            }
            _2463 = _2462;
        }
        _2464 = _2463;
    }
    float _2468 = (_2346 <= 0.0f) ? (-4.0f) : (log2(_2346) * 0.3010300099849700927734375f);
    float _2576;
    if (_2356 >= _2468)
    {
        _2576 = mad(cb1_m[21u].x, _2468, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2356 * cb1_m[21u].x));
    }
    else
    {
        float _2485 = log2(cb1_m[20u].x);
        float _2486 = _2485 * 0.3010300099849700927734375f;
        float _2575;
        if ((_2356 < _2468) && (_2486 > _2468))
        {
            float _2495 = (mad(_2355, -0.3010300099849700927734375f, _2468) * 7.0f) / (_2486 - _2356);
            int _2496 = cvt_f32_i32(_2495);
            float _2498 = _2495 - trunc(_2495);
            uint _2500 = uint(_2496 + 1);
            uint _2502 = uint(_2496 + 2);
            uint _2504 = uint(_2496);
            float2 _2516 = float2(cb1_m[_2504].x, cb1_m[_2500].x);
            _2575 = dp3_f32(float3(_2498 * _2498, _2498, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2504].x, cb1_m[_2500].x, cb1_m[_2502].x)), dp2_f32(float2(-1.0f, 1.0f), _2516), dp2_f32(0.5f.xx, _2516)));
        }
        else
        {
            float _2526 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2574;
            if ((_2486 <= _2468) && (_2526 > _2468))
            {
                float _2535 = (mad(_2485, -0.3010300099849700927734375f, _2468) * 7.0f) / (_2526 - _2486);
                int _2536 = cvt_f32_i32(_2535);
                float _2538 = _2535 - trunc(_2535);
                uint _2543 = uint(_2536 + 10);
                uint _2548 = uint((_2536 + 1) + 10);
                uint _2553 = uint((_2536 + 2) + 10);
                float2 _2559 = float2(cb1_m[_2543].x, cb1_m[_2548].x);
                _2574 = dp3_f32(float3(_2538 * _2538, _2538, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2543].x, cb1_m[_2548].x, cb1_m[_2553].x)), dp2_f32(float2(-1.0f, 1.0f), _2559), dp2_f32(0.5f.xx, _2559)));
            }
            else
            {
                _2574 = mad(cb1_m[21u].y, _2468, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2526 * cb1_m[21u].y));
            }
            _2575 = _2574;
        }
        _2576 = _2575;
    }
    float _2580 = (_2347 <= 0.0f) ? (-4.0f) : (log2(_2347) * 0.3010300099849700927734375f);
    float _2688;
    if (_2356 >= _2580)
    {
        _2688 = mad(cb1_m[21u].x, _2580, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2356 * cb1_m[21u].x));
    }
    else
    {
        float _2597 = log2(cb1_m[20u].x);
        float _2598 = _2597 * 0.3010300099849700927734375f;
        float _2687;
        if ((_2356 < _2580) && (_2598 > _2580))
        {
            float _2607 = (mad(_2355, -0.3010300099849700927734375f, _2580) * 7.0f) / (_2598 - _2356);
            int _2608 = cvt_f32_i32(_2607);
            float _2610 = _2607 - trunc(_2607);
            uint _2612 = uint(_2608 + 1);
            uint _2614 = uint(_2608 + 2);
            uint _2616 = uint(_2608);
            float2 _2628 = float2(cb1_m[_2616].x, cb1_m[_2612].x);
            _2687 = dp3_f32(float3(_2610 * _2610, _2610, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2616].x, cb1_m[_2612].x, cb1_m[_2614].x)), dp2_f32(float2(-1.0f, 1.0f), _2628), dp2_f32(0.5f.xx, _2628)));
        }
        else
        {
            float _2638 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2686;
            if ((_2598 <= _2580) && (_2638 > _2580))
            {
                float _2647 = (mad(_2597, -0.3010300099849700927734375f, _2580) * 7.0f) / (_2638 - _2598);
                int _2648 = cvt_f32_i32(_2647);
                float _2650 = _2647 - trunc(_2647);
                uint _2655 = uint(_2648 + 10);
                uint _2660 = uint((_2648 + 1) + 10);
                uint _2665 = uint((_2648 + 2) + 10);
                float2 _2671 = float2(cb1_m[_2655].x, cb1_m[_2660].x);
                _2686 = dp3_f32(float3(_2650 * _2650, _2650, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2655].x, cb1_m[_2660].x, cb1_m[_2665].x)), dp2_f32(float2(-1.0f, 1.0f), _2671), dp2_f32(0.5f.xx, _2671)));
            }
            else
            {
                _2686 = mad(cb1_m[21u].y, _2580, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2638 * cb1_m[21u].y));
            }
            _2687 = _2686;
        }
        _2688 = _2687;
    }
    if (_1495)
    {
        float3 _2700 = float3(exp2(_2464 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2576 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2688 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2704 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2700), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2700), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2700));
        float3 _2708 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2704), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2704), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2704));
        float _2717 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2708) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2728 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2708) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2738 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2708) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_1461] = float4(min(exp2(log2(mad(_2717, 18.8515625f, 0.8359375f) / mad(_2717, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2728, 18.8515625f, 0.8359375f) / mad(_2728, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2738, 18.8515625f, 0.8359375f) / mad(_2738, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
