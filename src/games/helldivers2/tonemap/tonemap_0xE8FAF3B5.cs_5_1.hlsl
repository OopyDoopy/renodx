#include "../common.hlsl"

struct _415
{
    uint2 _m0;
    uint _m1;
};

static const float _2581[30] = { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f };
static const float _69[10][30] = { { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f } };
static const float _74[1] = { 0.0f };
static const float4 _310[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

cbuffer cb0_buf : register(b0)
{
    uint4 cb0_m[47] : packoffset(c0);
};

cbuffer cb1_buf : register(b1)
{
    float4 cb1_m[4096] : packoffset(c0);
};

cbuffer cb2_buf : register(b2)
{
    float4 cb2_m0 : packoffset(c0);
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
SamplerState s7 : register(s7);
SamplerState s8 : register(s8);
Texture2D<uint4> t0 : register(t0);
Buffer<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t6 : register(t6);
Texture2D<float4> t7 : register(t7);
Texture2D<float4> t8 : register(t8);
Texture2D<float4> t9 : register(t9);
Texture2D<float4> t10 : register(t10);
Texture2D<float4> t11 : register(t11);
Buffer<float4> t12 : register(t12);
Buffer<float4> t13 : register(t13);
RWTexture2D<float4> u0 : register(u0);
RWTexture2D<float4> u1 : register(u1);
RWTexture2D<float4> u2 : register(u2);
RWTexture2D<float4> u3 : register(u3);

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
    precise float _406 = a.x * b.x;
    return mad(a.y, b.y, _406);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _392 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _392));
}

uint cvt_f32_u32(float v)
{
    return (v > 4294967040.0f) ? 4294967295u : uint(max(v, 0.0f));
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
    uint _414_dummy_parameter;
    _415 _416 = { spvImageSize(u0, _414_dummy_parameter), 1u };
    uint _428 = gl_GlobalInvocationID.x - gl_LocalInvocationID.x;
    uint _429 = gl_GlobalInvocationID.y - gl_LocalInvocationID.y;
    uint _431 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _432 = spvBitfieldUExtract(_431, 1u, 3u);
    uint _434 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _431, 0u, 1u);
    uint _435 = _428 + _432;
    uint _436 = _434 + _429;
    float _437 = float(_435);
    float _438 = float(_436);
    float _441 = float(_416._m0.x);
    float _442 = float(_416._m0.y);
    float _443 = (_437 + 0.5f) / _441;
    float _444 = (_438 + 0.5f) / _442;
    bool _447 = (_416._m0.x < _435) || (_416._m0.y < _436);
    bool _452 = cb2_m4.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _452) && (gl_LocalInvocationID.y == 0u))
    {
        g1[0u] = t9.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    if (_431 < 36u)
    {
        bool _480 = _431 < 4u;
        bool _481 = _431 < 12u;
        bool _482 = _431 < 20u;
        bool _483 = _431 < 28u;
        uint _494 = _480 ? ((_431 >> 1u) * 9u) : (_481 ? 0u : (_482 ? 9u : (_483 ? (((_431 - 20u) & 7u) + 1u) : (((_431 - 28u) & 7u) + 1u))));
        uint _495 = _480 ? ((_431 & 1u) * 9u) : (_481 ? (((_431 - 4u) & 7u) + 1u) : (_482 ? (((_431 - 12u) & 7u) + 1u) : (_483 ? 0u : 9u)));
        float _496 = 1.0f / _441;
        float _497 = 1.0f / _442;
        float _516 = clamp((_496 * (float(int(_494 - 1u)) + 0.5f)) + (_496 * float(int(_428))), 0.0f, 1.0f);
        float _517 = clamp((_497 * (float(int(_495 - 1u)) + 0.5f)) + (float(int(_429)) * _497), 0.0f, 1.0f);
        float2 _520 = float2(_516, _517);
        float _525 = mad(t7.SampleLevel(s5, _520, 0.0f).x, 2.0f, -1.0f);
        float _540;
        if (_525 > 0.0f)
        {
            _540 = min(sqrt(_525), t1.Load(8u).x);
        }
        else
        {
            _540 = max(_525, -t1.Load(7u).x);
        }
        bool _551 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
        bool _555 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
        float4 _560 = t2.SampleLevel(s0, _520, 0.0f);
        float _561 = _560.x;
        float _562 = _560.y;
        float _563 = _560.z;
        float _631;
        float _632;
        float _633;
        if (_555 || _551)
        {
            float4 _570 = t6.SampleLevel(s4, _520, 0.0f);
            float2 _579 = float2(_570.x * cb2_m3.x, _570.y * cb2_m3.y);
            float _593 = exp2(max(_551 ? clamp((sqrt(dp2_f32(_579, _579)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _555 ? clamp((abs(_540) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
            float4 _597 = t3.SampleLevel(s1, _520, 0.0f);
            float _598 = _597.x;
            float _599 = _597.y;
            float _600 = _597.z;
            float _606 = asfloat(cb0_m[43u].w) * 20.0f;
            float _617 = mad(t10.SampleLevel(s7, float2(mad(_516, 30.0f, sin(_606)), mad(_517, 30.0f, cos(_606))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
            float _621 = sqrt(max(max(_598, max(_599, _600)), 1.0000000133514319600180897396058e-10f));
            float _622 = mad(_617, _621, _598);
            float _623 = mad(_617, _621, _599);
            float _624 = mad(_617, _621, _600);
            _631 = mad(_593, _563 - _624, _624);
            _632 = mad(_593, _562 - _623, _623);
            _633 = mad(_593, _561 - _622, _622);
        }
        else
        {
            _631 = _563;
            _632 = _562;
            _633 = _561;
        }
        float _638 = _452 ? g1[0u] : cb2_m4.x;
        float4 _642 = t8.SampleLevel(s6, _520, 0.0f);
        float _643 = _642.x;
        float _651 = max(cb2_m4.w - dp3_f32(float3(_643, _642.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
        float _655 = mad(_633, _638, _643 / _651);
        float _656 = mad(_632, _638, _642.y / _651);
        float _657 = mad(_631, _638, _642.z / _651);
        float _661 = 1.0f / (max(_655, max(_657, _656)) + 1.0f);
        float _662 = _655 * _661;
        float _664 = _661 * _657;
        float3 _665 = float3(_662, _664, _661 * _656);
        uint _670 = (_495 * 12u) >> 2u;
        g0[_494][_670] = dp3_f32(_665, float3(0.25f, 0.25f, 0.5f));
        uint _673 = _670 + 1u;
        g0[_494][_673] = dp2_f32(float2(_662, _664), float2(0.5f, -0.5f));
        uint _676 = _670 + 2u;
        g0[_494][_676] = dp3_f32(_665, float3(-0.25f, -0.25f, 0.5f));
    }
    float2 _681 = float2(_443, _444);
    float _685 = mad(t7.SampleLevel(s5, _681, 0.0f).x, 2.0f, -1.0f);
    float _700;
    if (_685 > 0.0f)
    {
        _700 = min(sqrt(_685), t1.Load(8u).x);
    }
    else
    {
        _700 = max(_685, -t1.Load(7u).x);
    }
    float4 _704 = t6.SampleLevel(s4, _681, 0.0f);
    float _705 = _704.x;
    float _706 = _704.y;
    bool _716 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
    bool _720 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
    float4 _724 = t2.SampleLevel(s0, _681, 0.0f);
    float _725 = _724.x;
    float _726 = _724.y;
    float _727 = _724.z;
    float _788;
    float _789;
    float _790;
    if (_720 || _716)
    {
        float2 _737 = float2(_705 * cb2_m3.x, _706 * cb2_m3.y);
        float _751 = exp2(max(_716 ? clamp((sqrt(dp2_f32(_737, _737)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _720 ? clamp((abs(_700) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float4 _755 = t3.SampleLevel(s1, _681, 0.0f);
        float _756 = _755.x;
        float _757 = _755.y;
        float _758 = _755.z;
        float _763 = asfloat(cb0_m[43u].w) * 20.0f;
        float _774 = mad(t10.SampleLevel(s7, float2(mad(_443, 30.0f, sin(_763)), mad(_444, 30.0f, cos(_763))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
        float _778 = sqrt(max(max(_756, max(_757, _758)), 1.0000000133514319600180897396058e-10f));
        float _779 = mad(_774, _778, _756);
        float _780 = mad(_774, _778, _757);
        float _781 = mad(_774, _778, _758);
        _788 = mad(_751, _727 - _781, _781);
        _789 = mad(_751, _726 - _780, _780);
        _790 = mad(_751, _725 - _779, _779);
    }
    else
    {
        _788 = _727;
        _789 = _726;
        _790 = _725;
    }
    float _795 = _452 ? g1[0u] : cb2_m4.x;
    float4 _799 = t8.SampleLevel(s6, _681, 0.0f);
    float _800 = _799.x;
    float _808 = max(cb2_m4.w - dp3_f32(float3(_800, _799.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _812 = mad(_790, _795, _800 / _808);
    float _813 = mad(_789, _795, _799.y / _808);
    float _814 = mad(_788, _795, _799.z / _808);
    float _818 = 1.0f / (max(_812, max(_814, _813)) + 1.0f);
    float _819 = _812 * _818;
    float _821 = _818 * _814;
    float3 _822 = float3(_819, _821, _818 * _813);
    float _823 = dp3_f32(_822, float3(0.25f, 0.25f, 0.5f));
    float _824 = dp3_f32(_822, float3(-0.25f, -0.25f, 0.5f));
    float _826 = dp2_f32(float2(_819, _821), float2(0.5f, -0.5f));
    uint _827 = _432 + 1u;
    uint _828 = _432 + 2u;
    uint _829 = _434 * 12u;
    uint _832 = (_829 + 12u) >> 2u;
    g0[_827][_832] = _823;
    uint _835 = _832 + 1u;
    g0[_827][_835] = _826;
    uint _838 = _832 + 2u;
    g0[_827][_838] = _824;
    float2 _847 = float2(_705 * cb2_m2.x, _706 * cb2_m2.y);
    float _851 = min(sqrt(dp2_f32(_847, _847)) * 0.07500000298023223876953125f, 1.0f);
    float _852 = _443 - _705;
    float _853 = _444 - _706;
    float _861 = (max(abs(mad(_853, 2.0f, -1.0f)), abs(mad(_852, 2.0f, -1.0f))) >= 1.0f) ? (-_851) : _851;
    float _864 = floor(mad(_852, cb2_m2.x, -0.5f));
    float _865 = floor(mad(cb2_m2.y, _853, -0.5f));
    float _866 = _864 + 0.5f;
    float _867 = _865 + 0.5f;
    float _871 = mad(_852, cb2_m2.x, -_866);
    float _873 = mad(cb2_m2.y, _853, -_867);
    float _875 = mad(-_852, cb2_m2.x, _866);
    float _877 = mad(-cb2_m2.y, _853, _867);
    float _884 = mad(_871, mad(_875, 1.5f, 2.0f), 0.5f);
    float _885 = mad(_873, mad(_877, 1.5f, 2.0f), 0.5f);
    float _886 = _871 * _871;
    float _887 = _873 * _873;
    float _892 = mad(_871, 0.5f, -0.5f) * _886;
    float _893 = mad(_873, 0.5f, -0.5f) * _887;
    float _896 = _871 * mad(_871, mad(_875, 0.5f, 1.0f), -0.5f);
    float _897 = mad(_873, mad(_877, 0.5f, 1.0f), -0.5f) * _873;
    float _900 = mad(_871, _884, mad(mad(_871, 1.5f, -2.5f), _886, 1.0f));
    float _901 = mad(_885, _873, mad(mad(_873, 1.5f, -2.5f), _887, 1.0f));
    float _908 = (_864 - 0.5f) / cb2_m2.x;
    float _909 = (_865 - 0.5f) / cb2_m2.y;
    float _910 = (_864 + 2.5f) / cb2_m2.x;
    float _911 = (_865 + 2.5f) / cb2_m2.y;
    float _912 = (((_885 * _873) / _901) + _867) / cb2_m2.y;
    float _913 = (_866 + ((_871 * _884) / _900)) / cb2_m2.x;
    float4 _918 = t4.SampleLevel(s2, float2(_908, _909), 0.0f);
    float4 _927 = t4.SampleLevel(s2, float2(_910, _909), 0.0f);
    float4 _945 = t4.SampleLevel(s2, float2(_913, _909), 0.0f);
    float4 _957 = t4.SampleLevel(s2, float2(_908, _912), 0.0f);
    float4 _969 = t4.SampleLevel(s2, float2(_913, _912), 0.0f);
    float4 _981 = t4.SampleLevel(s2, float2(_910, _912), 0.0f);
    float4 _993 = t4.SampleLevel(s2, float2(_908, _911), 0.0f);
    float4 _1005 = t4.SampleLevel(s2, float2(_913, _911), 0.0f);
    float4 _1017 = t4.SampleLevel(s2, float2(_910, _911), 0.0f);
    float _1024 = mad(_893, _892 * _1017.x, mad(_893, _900 * _1005.x, mad(_893, _896 * _993.x, mad(_901, _892 * _981.x, mad(_901, _900 * _969.x, mad(_901, _896 * _957.x, mad(_897, _900 * _945.x, (_897 * (_892 * _927.x)) + (_897 * (_896 * _918.x)))))))));
    float _1026 = mad(_893, _892 * _1017.z, mad(_893, _900 * _1005.z, mad(_893, _896 * _993.z, mad(_901, _892 * _981.z, mad(_901, _900 * _969.z, mad(_901, _896 * _957.z, mad(_897, _900 * _945.z, ((_896 * _918.z) * _897) + ((_892 * _927.z) * _897))))))));
    float3 _1027 = float3(_1024, _1026, mad(_893, _892 * _1017.y, mad(_893, _900 * _1005.y, mad(_893, _896 * _993.y, mad(_901, _892 * _981.y, mad(_901, _900 * _969.y, mad(_901, _896 * _957.y, mad(_897, _900 * _945.y, ((_896 * _918.y) * _897) + ((_892 * _927.y) * _897)))))))));
    float _1028 = dp3_f32(_1027, float3(0.25f, 0.25f, 0.5f));
    float _1029 = dp3_f32(_1027, float3(-0.25f, -0.25f, 0.5f));
    float _1031 = dp2_f32(float2(_1024, _1026), float2(0.5f, -0.5f));
    GroupMemoryBarrierWithGroupSync();
    uint _1032 = _829 >> 2u;
    uint _1036 = _1032 + 1u;
    uint _1040 = _1032 + 2u;
    uint _1126 = (_829 + 24u) >> 2u;
    uint _1130 = _1126 + 1u;
    uint _1134 = _1126 + 2u;
    float _1155 = min(min(min(min(_823, g0[_827][_1032]), g0[_432][_832]), g0[_828][_832]), g0[_827][_1126]);
    float _1156 = max(max(max(max(_823, g0[_827][_1032]), g0[_432][_832]), g0[_828][_832]), g0[_827][_1126]);
    float _1174 = (((((((_823 + g0[_827][_1032]) + g0[_432][_1032]) + g0[_432][_832]) + g0[_828][_1032]) + g0[_828][_832]) + g0[_432][_1126]) + g0[_827][_1126]) + g0[_828][_1126];
    float _1188 = _1174 * 0.111111111938953399658203125f;
    float _1189 = (g0[_828][_1130] + (g0[_827][_1130] + (g0[_432][_1130] + (g0[_828][_835] + (g0[_828][_1036] + (g0[_432][_835] + (g0[_432][_1036] + (_826 + g0[_827][_1036])))))))) * 0.111111111938953399658203125f;
    float _1190 = (g0[_828][_1134] + (g0[_827][_1134] + (g0[_432][_1134] + (g0[_828][_838] + (g0[_828][_1040] + (g0[_432][_838] + (g0[_432][_1040] + (_824 + g0[_827][_1040])))))))) * 0.111111111938953399658203125f;
    float _1203 = sqrt(max((mad(g0[_828][_1126], g0[_828][_1126], mad(g0[_827][_1126], g0[_827][_1126], mad(g0[_432][_1126], g0[_432][_1126], mad(g0[_828][_832], g0[_828][_832], mad(g0[_828][_1032], g0[_828][_1032], mad(g0[_432][_832], g0[_432][_832], mad(g0[_432][_1032], g0[_432][_1032], (g0[_827][_1032] * g0[_827][_1032]) + (_823 * _823)))))))) * 0.111111111938953399658203125f) - (_1188 * _1188), 1.0000000133514319600180897396058e-10f));
    float _1204 = sqrt(max((mad(g0[_828][_1130], g0[_828][_1130], mad(g0[_827][_1130], g0[_827][_1130], mad(g0[_432][_1130], g0[_432][_1130], mad(g0[_828][_835], g0[_828][_835], mad(g0[_828][_1036], g0[_828][_1036], mad(g0[_432][_835], g0[_432][_835], mad(g0[_432][_1036], g0[_432][_1036], (_826 * _826) + (g0[_827][_1036] * g0[_827][_1036])))))))) * 0.111111111938953399658203125f) - (_1189 * _1189), 1.0000000133514319600180897396058e-10f));
    float _1205 = sqrt(max((mad(g0[_828][_1134], g0[_828][_1134], mad(g0[_827][_1134], g0[_827][_1134], mad(g0[_432][_1134], g0[_432][_1134], mad(g0[_828][_838], g0[_828][_838], mad(g0[_828][_1040], g0[_828][_1040], mad(g0[_432][_838], g0[_432][_838], mad(g0[_432][_1040], g0[_432][_1040], (_824 * _824) + (g0[_827][_1040] * g0[_827][_1040])))))))) * 0.111111111938953399658203125f) - (_1190 * _1190), 1.0000000133514319600180897396058e-10f));
    float _1209 = asfloat(cb0_m[46u].z);
    uint4 _1216 = t0.Load(int3(uint2(cvt_f32_u32(_437 / _1209), cvt_f32_u32(_438 / _1209)), 0u));
    uint _1217 = _1216.x;
    float _1221 = float(spvBitfieldUExtract(_1217, 2u, 2u) + (_1217 & 3u));
    float _1231 = mad(_1028 / max(mad(_1174, 0.111111111938953399658203125f, _1028), 1.0000000116860974230803549289703e-07f), 0.5f, 0.75f);
    float _1232 = mad(_1203 * _1221, 0.5f, _1203) * _1231;
    float _1233 = _1231 * mad(_1221 * _1204, 0.5f, _1204);
    float _1234 = _1231 * mad(_1221 * _1205, 0.5f, _1205);
    float _1238 = _1188 + _1232;
    float _1239 = _1233 + _1189;
    float _1240 = _1234 + _1190;
    float _1241 = (_1188 - _1232) + _1238;
    float _1242 = _1239 + (_1189 - _1233);
    float _1243 = _1240 + (_1190 - _1234);
    float _1253 = mad(_1241, -0.5f, _1028);
    float _1254 = mad(_1242, -0.5f, _1031);
    float _1255 = mad(_1243, -0.5f, _1029);
    float _1263 = max(max(abs(_1254 / mad((_1233 - _1189) + _1239, 0.5f, 9.9999997473787516355514526367188e-05f)), abs(_1253 / mad(_1238 + (_1232 - _1188), 0.5f, 9.9999997473787516355514526367188e-05f))), abs(_1255 / mad((_1234 - _1190) + _1240, 0.5f, 9.9999997473787516355514526367188e-05f)));
    bool _1264 = _1263 > 1.0f;
    float _1275 = mad(_1156, 0.5f, max(_1156 * 0.5f, max(max(max(max(_823, g0[_432][_1032]), g0[_828][_1032]), g0[_432][_1126]), g0[_828][_1126]) * 0.5f)) - mad(_1155, 0.5f, min(_1155 * 0.5f, min(min(min(min(_823, g0[_432][_1032]), g0[_828][_1032]), g0[_432][_1126]), g0[_828][_1126]) * 0.5f));
    uint2 _1285 = uint2(_435, _436);
    float4 _1286 = u2[_1285];
    float _1289 = max(mad(abs(_861), 0.85000002384185791015625f, 0.100000001490116119384765625f) * ((min(_1028, _1275) / ((_1028 + _1275) + 1.0000000116860974230803549289703e-07f)) * (_1264 ? 0.85000002384185791015625f : 1.0f)), _1286.x * 0.75f);
    bool _1290 = _861 < 0.0f;
    float _1291 = _1290 ? _823 : (_1264 ? mad(_1241, 0.5f, _1253 / _1263) : _1028);
    float _1292 = _1290 ? _826 : (_1264 ? mad(_1242, 0.5f, _1254 / _1263) : _1031);
    float _1293 = _1290 ? _824 : (_1264 ? mad(_1243, 0.5f, _1255 / _1263) : _1029);
    float _1301 = clamp(mad(t5.SampleLevel(s3, _681, 0.0f).y, 1.0f - _1289, _1289), 0.0039215688593685626983642578125f, 0.949999988079071044921875f);
    float _1305 = mad(1.0f - _1301, cb2_m0.x, _1301);
    float _1309 = mad(_1305, _823 - _1291, _1291);
    float _1310 = mad(_1305, _826 - _1292, _1292);
    float _1311 = mad(_1305, _824 - _1293, _1293);
    float _1312 = _1309 - _1311;
    float _1313 = _1312 + _1310;
    float _1314 = _1309 + _1311;
    float _1315 = _1312 - _1310;
    u1[_1285] = float4(_1313, _1314, _1315, 0.0f);
    u2[_1285] = _1305.xxxx;
    u3[_1285] = _1309.xxxx;
    bool _1321 = !_447;
    float _1695;
    float _1696;
    float _1697;
    if (_1321)
    {
        float _1325 = dp3_f32(float3(_1313, _1314, _1315), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1333 = mad(-abs(_700), cb2_m9.y, 1.0f) * cb2_m8.x;
        float _1337 = mad(_1333, _1313 - _1325, _1325);
        float _1338 = mad(_1333, _1314 - _1325, _1325);
        float _1339 = mad(_1333, _1315 - _1325, _1325);
        float _1340 = _443 - 0.5f;
        float _1341 = _444 - 0.5f;
        float _1342 = _1341 + _1341;
        float _1343 = _1340 + _1340;
        float _1344 = abs(_1343);
        float _1345 = abs(_1342);
        float _1349 = min(_1344, _1345) * (1.0f / max(_1344, _1345));
        float _1350 = _1349 * _1349;
        float _1354 = mad(_1350, mad(_1350, mad(_1350, mad(_1350, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1363 = mad(_1349, _1354, (_1344 < _1345) ? mad(_1349 * _1354, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_1343) > _1343) ? (-3.1415927410125732421875f) : 0.0f);
        float _1364 = min(_1342, _1343);
        float _1365 = max(_1342, _1343);
        float _1372 = ((_1364 < (-_1364)) && (_1365 >= (-_1365))) ? (-_1363) : _1363;
        float4 _1376 = t11.SampleLevel(s8, _681, 0.0f);
        float _1377 = _1376.x;
        float _1378 = _1376.y;
        float _1379 = _1376.z;
        float _1380 = _1376.w;
        float _1385 = (_1338 - _1339) * 1.73205077648162841796875f;
        float _1387 = mad(_1337, 2.0f, -_1338);
        float _1388 = _1387 - _1339;
        float _1389 = abs(_1388);
        float _1390 = abs(_1385);
        float _1394 = min(_1389, _1390) * (1.0f / max(_1389, _1390));
        float _1395 = _1394 * _1394;
        float _1399 = mad(_1395, mad(_1395, mad(_1395, mad(_1395, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1408 = mad(_1394, _1399, (_1389 < _1390) ? mad(_1394 * _1399, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1388 < (_1339 - _1387)) ? (-3.1415927410125732421875f) : 0.0f);
        float _1409 = min(_1385, _1388);
        float _1410 = max(_1385, _1388);
        float _1419 = ((_1337 == _1338) && (_1339 == _1338)) ? 0.0f : ((((_1409 < (-_1409)) && (_1410 >= (-_1410))) ? (-_1408) : _1408) * 57.295780181884765625f);
        float _1428 = mad(cb2_m14.x, -360.0f, (_1419 < 0.0f) ? (_1419 + 360.0f) : _1419);
        float _1438 = clamp(1.0f - (abs((_1428 < (-180.0f)) ? (_1428 + 360.0f) : ((_1428 > 180.0f) ? (_1428 - 360.0f) : _1428)) / (cb2_m14.y * 180.0f)), 0.0f, 1.0f);
        float _1443 = dp3_f32(float3(_1337, _1338, _1339), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1446 = (mad(_1438, -2.0f, 3.0f) * (_1438 * _1438)) * cb2_m14.z;
        float _1458 = mad(mad(_1446, _1337 - _1443, _1443) - _1337, cb2_m13.x, _1337);
        float _1459 = mad(cb2_m13.x, mad(_1446, _1338 - _1443, _1443) - _1338, _1338);
        float _1460 = mad(cb2_m13.x, mad(_1446, _1339 - _1443, _1443) - _1339, _1339);
        float _1462;
        _1462 = 0.0f;
        float _1463;
        uint _1466;
        uint _1465 = 0u;
        for (;;)
        {
            if (_1465 >= 8u)
            {
                break;
            }
            uint _1477 = min((_1465 & 3u), 10u);
            float _1497 = mad(float(_1465), 0.785398185253143310546875f, -_1372);
            float _1498 = _1497 + 1.57079637050628662109375f;
            _1463 = mad(_1380 * (dp4_f32(t12.Load((_1465 >> 2u) + 10u), float4(_310[_1477].x, _310[_1477].y, _310[_1477].z, _310[_1477].w)) * clamp((abs((_1498 > 3.1415927410125732421875f) ? (_1497 - 4.7123889923095703125f) : _1498) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _1462, _1462);
            _1466 = _1465 + 1u;
            _1462 = _1463;
            _1465 = _1466;
            continue;
        }
        float _1509 = clamp(_1462, 0.0f, 1.0f);
        float _1521 = asfloat(cb0_m[43u].w);
        float _1527 = abs(t12.Load(8u).x);
        float2 _1530 = float2(_1340 * 1.40999996662139892578125f, _1341 * 1.40999996662139892578125f);
        float _1532 = sqrt(dp2_f32(_1530, _1530));
        float _1533 = min(_1532, 1.0f);
        float _1534 = _1533 * _1533;
        float _1539 = clamp(_1532 - 0.5f, 0.0f, 1.0f);
        float _1542 = (_1533 * _1534) + (mad(-_1533, _1534, 1.0f) * (_1539 * _1539));
        float _1543 = mad(mad(mad(sin(_1521 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _1527, -1.0f);
        float _1545 = _1378 + _1543;
        float _1547 = clamp((_1379 + _1543) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _1554 = clamp(_1545 + _1545, 0.0f, 1.0f);
        float _1564 = mad(sin(_1378 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f);
        float _1571 = dp3_f32(float3(t13.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1576 = mad(exp2(log2(abs(_1571)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1580 = _1564 * (_1576 * 0.02999999932944774627685546875f);
        float _1581 = mad(_1527, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1585 = mad(mad(-_1542, _1542, 1.0f), 1.0f - _1581, _1581);
        float _1586 = min((exp2(log2(_1542) * 0.699999988079071044921875f) * (mad(_1554, -2.0f, 3.0f) * (_1554 * _1554))) + (mad(_1547, -2.0f, 3.0f) * (_1547 * _1547)), 1.0f);
        float _1596 = mad(_1586, mad((_1564 * _1576) * 0.62000000476837158203125f, _1585, mad(_1458, _1509, -_1458)), mad(-_1458, _1509, _1458));
        float _1597 = mad(_1586, mad(_1585, _1580, mad(_1509, _1459, -_1459)), mad(-_1509, _1459, _1459));
        float _1598 = mad(_1586, mad(_1585, _1580, mad(_1509, _1460, -_1460)), mad(-_1509, _1460, _1460));
        float _1601 = mad(_1378, _1379 * (1.0f - _1380), _1380);
        float _1603;
        _1603 = 0.0f;
        float _1604;
        uint _1607;
        uint _1606 = 0u;
        for (;;)
        {
            if (int(_1606) >= 8)
            {
                break;
            }
            float4 _1614 = t12.Load(_1606);
            float _1616 = _1614.y;
            float _1618 = _1614.x - _1372;
            _1604 = mad(_1601 * (_1614.w * clamp((abs((_1618 > 3.1415927410125732421875f) ? (_1618 - 6.283185482025146484375f) : ((_1618 < (-3.1415927410125732421875f)) ? (_1618 + 6.283185482025146484375f) : _1618)) + (_1616 - 3.1415927410125732421875f)) / max(_1616 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1603, _1603);
            _1607 = _1606 + 1u;
            _1603 = _1604;
            _1606 = _1607;
            continue;
        }
        float _1637 = clamp(_1603 + _1603, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1641 = mad(_1637, 0.310000002384185791015625f - _1596, _1596);
        float _1642 = mad(_1637, 0.014999999664723873138427734375f - _1597, _1597);
        float _1643 = mad(_1637, 0.014999999664723873138427734375f - _1598, _1598);
        float4 _1644 = t12.Load(12u);
        float _1645 = _1644.x;
        float _1673;
        float _1674;
        float _1675;
        if (_1645 != 0.0f)
        {
            float _1652 = clamp(_1571, 0.0f, 1.0f);
            float _1662 = clamp((_1377 + (_1645 - 1.0f)) / max(mad(_1645, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1666 = clamp(_1645 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1669 = mad(_1666, -2.0f, 3.0f) * (_1666 * _1666);
            _1673 = mad(_1669, _1662 * (_1652 * (_1377 * 0.930000007152557373046875f)), _1643);
            _1674 = mad(_1669, _1662 * (_1652 * (_1377 * 0.85000002384185791015625f)), _1642);
            _1675 = mad((_1652 * (_1377 * 0.790000021457672119140625f)) * _1662, _1669, _1641);
        }
        else
        {
            _1673 = _1643;
            _1674 = _1642;
            _1675 = _1641;
        }
        bool _1678 = cb2_m13.y > 0.0f;
        bool _1682 = frac((_444 * 420.0f) + (_1521 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1683 = _1682 ? 0.300000011920928955078125f : 0.0f;
        float _1684 = cb2_m13.y * _1683;
        _1695 = _1678 ? mad(_1684, 0.0f - _1675, _1675) : _1675;
        _1696 = _1678 ? mad(_1684, (_1682 ? 0.100000001490116119384765625f : 0.0f) - _1674, _1674) : _1674;
        _1697 = _1678 ? mad(_1684, _1683 - _1673, _1673) : _1673;
    }
    else
    {
        _1695 = _1313;
        _1696 = _1314;
        _1697 = _1315;
    }
    float _1702 = 1.0f / max(1.0f - max(max(_1696, _1697), _1695), 6.099999882280826568603515625e-05f);
    float _1709 = min(-(_1702 * _1695), 0.0f);
    float _1710 = min(-(_1702 * _1696), 0.0f);
    float _1711 = min(-(_1702 * _1697), 0.0f);
    float2 _1714 = float2(_443 - 0.5f, _444 - 0.5f);
    float _1725 = clamp(-((sqrt(dp2_f32(_1714, _1714)) - cb2_m7.x) * (1.0f / cb2_m7.y)), 0.0f, 1.0f);
    float _1726 = mad(_1725, -2.0f, 3.0f);
    float _1727 = _1725 * _1725;
    float _1728 = _1726 * _1727;
    float _1730 = mad(-_1726, _1727, 1.0f);
    float _1753 = cb2_m7.z * cb2_m7.w;
    float3 _1766 = float3(_447 ? (-_1709) : mad(_1709 + ((cb2_m5.x * _1730) - (_1709 * _1728)), _1753, -_1709), _447 ? (-_1710) : mad(_1753, ((cb2_m5.y * _1730) - (_1728 * _1710)) + _1710, -_1710), _447 ? (-_1711) : mad(_1753, ((_1730 * cb2_m5.z) - (_1728 * _1711)) + _1711, -_1711));
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
         if (_1321) {
            float3 scene_color = _1766;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_1285] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1773 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1766) * 2.5f, 65504.0f);
    float _1774 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1766) * 2.5f, 65504.0f);
    float _1775 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1766) * 2.5f, 65504.0f);
    float _1779 = max(max(_1774, _1773), _1775);
    float _1784 = (max(_1779, 9.9999997473787516355514526367188e-05f) - max(min(min(_1774, _1773), _1775), 9.9999997473787516355514526367188e-05f)) / max(_1779, 0.00999999977648258209228515625f);
    float _1795 = mad(sqrt(mad(_1773 - _1775, _1773, ((_1775 - _1774) * _1775) + ((_1774 - _1773) * _1774))), 1.75f, (_1775 + _1774) + _1773);
    float _1796 = _1784 - 0.4000000059604644775390625f;
    float _1800 = max(1.0f - abs(_1796 * 2.5f), 0.0f);
    float _1808 = mad(mad(clamp(mad(_1796, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1800, _1800, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1816 = ((_1795 <= 0.1599999964237213134765625f) ? _1808 : ((_1795 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1795 * 0.3333333432674407958984375f)) - 0.5f) * _1808))) + 1.0f;
    float _1817 = _1816 * _1773;
    float _1818 = _1816 * _1774;
    float _1819 = _1816 * _1775;
    float _1824 = (_1818 - _1819) * 1.73205077648162841796875f;
    float _1826 = (_1817 * 2.0f) - _1818;
    float _1828 = mad(-_1816, _1775, _1826);
    float _1829 = abs(_1828);
    float _1830 = abs(_1824);
    float _1834 = min(_1829, _1830) * (1.0f / max(_1829, _1830));
    float _1835 = _1834 * _1834;
    float _1839 = mad(_1835, mad(_1835, mad(_1835, mad(_1835, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1849 = mad(_1834, _1839, (_1829 < _1830) ? mad(_1834 * _1839, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1828 < mad(_1816, _1775, -_1826)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1850 = min(_1824, _1828);
    float _1851 = max(_1824, _1828);
    float _1860 = ((_1817 == _1818) && (_1819 == _1818)) ? 0.0f : ((((_1850 < (-_1850)) && (_1851 >= (-_1851))) ? (-_1849) : _1849) * 57.295780181884765625f);
    float _1863 = (_1860 < 0.0f) ? (_1860 + 360.0f) : _1860;
    float _1873 = max(1.0f - abs(((_1863 < (-180.0f)) ? (_1863 + 360.0f) : ((_1863 > 180.0f) ? (_1863 - 360.0f) : _1863)) * 0.01481481455266475677490234375f), 0.0f);
    float _1876 = mad(_1873, -2.0f, 3.0f) * (_1873 * _1873);
    float3 _1887 = float3(clamp(_1817 + (((_1784 * (_1876 * _1876)) * mad(-_1816, _1773, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1818, 0.0f, 65504.0f), clamp(_1819, 0.0f, 65504.0f));
    float _1891 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1887), 0.0f, 65504.0f);
    float _1892 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1887), 0.0f, 65504.0f);
    float _1893 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1887), 0.0f, 65504.0f);
    float _1895 = dp3_f32(float3(_1891, _1892, _1893), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1899 = mad(_1891 - _1895, 0.959999978542327880859375f, _1895);
    float _1900 = mad(_1892 - _1895, 0.959999978542327880859375f, _1895);
    float _1901 = mad(_1893 - _1895, 0.959999978542327880859375f, _1895);
    float _1908 = (_1899 <= 0.0f) ? (-14.0f) : log2(_1899);
    float _1909 = (_1900 <= 0.0f) ? (-14.0f) : log2(_1900);
    float _1910 = (_1901 <= 0.0f) ? (-14.0f) : log2(_1901);
    float _1997;
    if (_1908 <= (-17.4739322662353515625f))
    {
        _1997 = -4.0f;
    }
    else
    {
        float _1996;
        if (_1908 < (-2.4739310741424560546875f))
        {
            float _1921 = mad(_1908, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1922 = _1921 * 0.6643855571746826171875f;
            int _1923 = cvt_f32_i32(_1922);
            float _1926 = mad(_1921, 0.6643855571746826171875f, -trunc(_1922));
            uint _1932 = min(uint(_1923 + 4), 10u);
            uint _1938 = min(uint((_1923 + 1) + 4), 10u);
            uint _1944 = min(uint((_1923 + 2) + 4), 10u);
            float2 _1950 = float2(_310[_1932].x, _310[_1938].x);
            _1996 = dp3_f32(float3(_1926 * _1926, _1926, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_1932].x, _310[_1938].x, _310[_1944].x)), dp2_f32(float2(-1.0f, 1.0f), _1950), dp2_f32(0.5f.xx, _1950)));
        }
        else
        {
            float _1995;
            if (_1908 < 15.52606868743896484375f)
            {
                float _1960 = mad(_1908, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1961 = _1960 * 0.55365467071533203125f;
                int _1962 = cvt_f32_i32(_1961);
                float _1965 = mad(_1960, 0.55365467071533203125f, -trunc(_1961));
                uint _1971 = min(uint(_1962 + 4), 10u);
                uint _1977 = min(uint((_1962 + 1) + 4), 10u);
                uint _1983 = min(uint((_1962 + 2) + 4), 10u);
                float2 _1989 = float2(_310[_1971].y, _310[_1977].y);
                _1995 = dp3_f32(float3(_1965 * _1965, _1965, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_1971].y, _310[_1977].y, _310[_1983].y)), dp2_f32(float2(-1.0f, 1.0f), _1989), dp2_f32(0.5f.xx, _1989)));
            }
            else
            {
                _1995 = 4.0f;
            }
            _1996 = _1995;
        }
        _1997 = _1996;
    }
    float _2083;
    if (_1909 <= (-17.4739322662353515625f))
    {
        _2083 = -4.0f;
    }
    else
    {
        float _2082;
        if (_1909 < (-2.4739310741424560546875f))
        {
            float _2007 = mad(_1909, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2008 = _2007 * 0.6643855571746826171875f;
            int _2009 = cvt_f32_i32(_2008);
            float _2012 = mad(_2007, 0.6643855571746826171875f, -trunc(_2008));
            uint _2018 = min(uint(_2009 + 4), 10u);
            uint _2024 = min(uint((_2009 + 1) + 4), 10u);
            uint _2030 = min(uint((_2009 + 2) + 4), 10u);
            float2 _2036 = float2(_310[_2018].x, _310[_2024].x);
            _2082 = dp3_f32(float3(_2012 * _2012, _2012, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_2018].x, _310[_2024].x, _310[_2030].x)), dp2_f32(float2(-1.0f, 1.0f), _2036), dp2_f32(0.5f.xx, _2036)));
        }
        else
        {
            float _2081;
            if (_1909 < 15.52606868743896484375f)
            {
                float _2046 = mad(_1909, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2047 = _2046 * 0.55365467071533203125f;
                int _2048 = cvt_f32_i32(_2047);
                float _2051 = mad(_2046, 0.55365467071533203125f, -trunc(_2047));
                uint _2057 = min(uint(_2048 + 4), 10u);
                uint _2063 = min(uint((_2048 + 1) + 4), 10u);
                uint _2069 = min(uint((_2048 + 2) + 4), 10u);
                float2 _2075 = float2(_310[_2057].y, _310[_2063].y);
                _2081 = dp3_f32(float3(_2051 * _2051, _2051, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_2057].y, _310[_2063].y, _310[_2069].y)), dp2_f32(float2(-1.0f, 1.0f), _2075), dp2_f32(0.5f.xx, _2075)));
            }
            else
            {
                _2081 = 4.0f;
            }
            _2082 = _2081;
        }
        _2083 = _2082;
    }
    float _2169;
    if (_1910 <= (-17.4739322662353515625f))
    {
        _2169 = -4.0f;
    }
    else
    {
        float _2168;
        if (_1910 < (-2.4739310741424560546875f))
        {
            float _2093 = mad(_1910, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2094 = _2093 * 0.6643855571746826171875f;
            int _2095 = cvt_f32_i32(_2094);
            float _2098 = mad(_2093, 0.6643855571746826171875f, -trunc(_2094));
            uint _2104 = min(uint(_2095 + 4), 10u);
            uint _2110 = min(uint((_2095 + 1) + 4), 10u);
            uint _2116 = min(uint((_2095 + 2) + 4), 10u);
            float2 _2122 = float2(_310[_2104].x, _310[_2110].x);
            _2168 = dp3_f32(float3(_2098 * _2098, _2098, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_2104].x, _310[_2110].x, _310[_2116].x)), dp2_f32(float2(-1.0f, 1.0f), _2122), dp2_f32(0.5f.xx, _2122)));
        }
        else
        {
            float _2167;
            if (_1910 < 15.52606868743896484375f)
            {
                float _2132 = mad(_1910, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2133 = _2132 * 0.55365467071533203125f;
                int _2134 = cvt_f32_i32(_2133);
                float _2137 = mad(_2132, 0.55365467071533203125f, -trunc(_2133));
                uint _2143 = min(uint(_2134 + 4), 10u);
                uint _2149 = min(uint((_2134 + 1) + 4), 10u);
                uint _2155 = min(uint((_2134 + 2) + 4), 10u);
                float2 _2161 = float2(_310[_2143].y, _310[_2149].y);
                _2167 = dp3_f32(float3(_2137 * _2137, _2137, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_310[_2143].y, _310[_2149].y, _310[_2155].y)), dp2_f32(float2(-1.0f, 1.0f), _2161), dp2_f32(0.5f.xx, _2161)));
            }
            else
            {
                _2167 = 4.0f;
            }
            _2168 = _2167;
        }
        _2169 = _2168;
    }
    float3 _2172 = float3(exp2(_1997 * 3.3219280242919921875f), exp2(_2083 * 3.3219280242919921875f), exp2(_2169 * 3.3219280242919921875f));
    float3 _2176 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _2172), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _2172), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _2172));
    float _2177 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2176);
    float _2178 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2176);
    float _2179 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2176);
    float _2183 = (_2177 <= 0.0f) ? (-4.0f) : (log2(_2177) * 0.3010300099849700927734375f);
    float _2187 = log2(cb1_m[19u].y);
    float _2188 = _2187 * 0.3010300099849700927734375f;
    float _2296;
    if (_2188 >= _2183)
    {
        _2296 = mad(cb1_m[21u].x, _2183, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2188 * cb1_m[21u].x));
    }
    else
    {
        float _2205 = log2(cb1_m[20u].x);
        float _2206 = _2205 * 0.3010300099849700927734375f;
        float _2295;
        if ((_2188 < _2183) && (_2206 > _2183))
        {
            float _2215 = (mad(_2187, -0.3010300099849700927734375f, _2183) * 7.0f) / (_2206 - _2188);
            int _2216 = cvt_f32_i32(_2215);
            float _2218 = _2215 - trunc(_2215);
            uint _2220 = uint(_2216 + 1);
            uint _2222 = uint(_2216 + 2);
            uint _2224 = uint(_2216);
            float2 _2236 = float2(cb1_m[_2224].x, cb1_m[_2220].x);
            _2295 = dp3_f32(float3(_2218 * _2218, _2218, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2224].x, cb1_m[_2220].x, cb1_m[_2222].x)), dp2_f32(float2(-1.0f, 1.0f), _2236), dp2_f32(0.5f.xx, _2236)));
        }
        else
        {
            float _2246 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2294;
            if ((_2206 <= _2183) && (_2246 > _2183))
            {
                float _2255 = (mad(_2205, -0.3010300099849700927734375f, _2183) * 7.0f) / (_2246 - _2206);
                int _2256 = cvt_f32_i32(_2255);
                float _2258 = _2255 - trunc(_2255);
                uint _2263 = uint(_2256 + 10);
                uint _2268 = uint((_2256 + 1) + 10);
                uint _2273 = uint((_2256 + 2) + 10);
                float2 _2279 = float2(cb1_m[_2263].x, cb1_m[_2268].x);
                _2294 = dp3_f32(float3(_2258 * _2258, _2258, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2263].x, cb1_m[_2268].x, cb1_m[_2273].x)), dp2_f32(float2(-1.0f, 1.0f), _2279), dp2_f32(0.5f.xx, _2279)));
            }
            else
            {
                _2294 = mad(cb1_m[21u].y, _2183, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2246 * cb1_m[21u].y));
            }
            _2295 = _2294;
        }
        _2296 = _2295;
    }
    float _2300 = (_2178 <= 0.0f) ? (-4.0f) : (log2(_2178) * 0.3010300099849700927734375f);
    float _2408;
    if (_2188 >= _2300)
    {
        _2408 = mad(cb1_m[21u].x, _2300, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2188 * cb1_m[21u].x));
    }
    else
    {
        float _2317 = log2(cb1_m[20u].x);
        float _2318 = _2317 * 0.3010300099849700927734375f;
        float _2407;
        if ((_2188 < _2300) && (_2318 > _2300))
        {
            float _2327 = (mad(_2187, -0.3010300099849700927734375f, _2300) * 7.0f) / (_2318 - _2188);
            int _2328 = cvt_f32_i32(_2327);
            float _2330 = _2327 - trunc(_2327);
            uint _2332 = uint(_2328 + 1);
            uint _2334 = uint(_2328 + 2);
            uint _2336 = uint(_2328);
            float2 _2348 = float2(cb1_m[_2336].x, cb1_m[_2332].x);
            _2407 = dp3_f32(float3(_2330 * _2330, _2330, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2336].x, cb1_m[_2332].x, cb1_m[_2334].x)), dp2_f32(float2(-1.0f, 1.0f), _2348), dp2_f32(0.5f.xx, _2348)));
        }
        else
        {
            float _2358 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2406;
            if ((_2318 <= _2300) && (_2358 > _2300))
            {
                float _2367 = (mad(_2317, -0.3010300099849700927734375f, _2300) * 7.0f) / (_2358 - _2318);
                int _2368 = cvt_f32_i32(_2367);
                float _2370 = _2367 - trunc(_2367);
                uint _2375 = uint(_2368 + 10);
                uint _2380 = uint((_2368 + 1) + 10);
                uint _2385 = uint((_2368 + 2) + 10);
                float2 _2391 = float2(cb1_m[_2375].x, cb1_m[_2380].x);
                _2406 = dp3_f32(float3(_2370 * _2370, _2370, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2375].x, cb1_m[_2380].x, cb1_m[_2385].x)), dp2_f32(float2(-1.0f, 1.0f), _2391), dp2_f32(0.5f.xx, _2391)));
            }
            else
            {
                _2406 = mad(cb1_m[21u].y, _2300, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2358 * cb1_m[21u].y));
            }
            _2407 = _2406;
        }
        _2408 = _2407;
    }
    float _2412 = (_2179 <= 0.0f) ? (-4.0f) : (log2(_2179) * 0.3010300099849700927734375f);
    float _2520;
    if (_2188 >= _2412)
    {
        _2520 = mad(cb1_m[21u].x, _2412, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2188 * cb1_m[21u].x));
    }
    else
    {
        float _2429 = log2(cb1_m[20u].x);
        float _2430 = _2429 * 0.3010300099849700927734375f;
        float _2519;
        if ((_2188 < _2412) && (_2430 > _2412))
        {
            float _2439 = (mad(_2187, -0.3010300099849700927734375f, _2412) * 7.0f) / (_2430 - _2188);
            int _2440 = cvt_f32_i32(_2439);
            float _2442 = _2439 - trunc(_2439);
            uint _2444 = uint(_2440 + 1);
            uint _2446 = uint(_2440 + 2);
            uint _2448 = uint(_2440);
            float2 _2460 = float2(cb1_m[_2448].x, cb1_m[_2444].x);
            _2519 = dp3_f32(float3(_2442 * _2442, _2442, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2448].x, cb1_m[_2444].x, cb1_m[_2446].x)), dp2_f32(float2(-1.0f, 1.0f), _2460), dp2_f32(0.5f.xx, _2460)));
        }
        else
        {
            float _2470 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2518;
            if ((_2430 <= _2412) && (_2470 > _2412))
            {
                float _2479 = (mad(_2429, -0.3010300099849700927734375f, _2412) * 7.0f) / (_2470 - _2430);
                int _2480 = cvt_f32_i32(_2479);
                float _2482 = _2479 - trunc(_2479);
                uint _2487 = uint(_2480 + 10);
                uint _2492 = uint((_2480 + 1) + 10);
                uint _2497 = uint((_2480 + 2) + 10);
                float2 _2503 = float2(cb1_m[_2487].x, cb1_m[_2492].x);
                _2518 = dp3_f32(float3(_2482 * _2482, _2482, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2487].x, cb1_m[_2492].x, cb1_m[_2497].x)), dp2_f32(float2(-1.0f, 1.0f), _2503), dp2_f32(0.5f.xx, _2503)));
            }
            else
            {
                _2518 = mad(cb1_m[21u].y, _2412, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2470 * cb1_m[21u].y));
            }
            _2519 = _2518;
        }
        _2520 = _2519;
    }
    if (_1321)
    {
        float3 _2532 = float3(exp2(_2296 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2408 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2520 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2536 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2532), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2532), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2532));
        float3 _2540 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2536), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2536), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2536));
        float _2549 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2540) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2560 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2540) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2570 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2540) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_1285] = float4(min(exp2(log2(mad(_2549, 18.8515625f, 0.8359375f) / mad(_2549, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2560, 18.8515625f, 0.8359375f) / mad(_2560, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2570, 18.8515625f, 0.8359375f) / mad(_2570, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
