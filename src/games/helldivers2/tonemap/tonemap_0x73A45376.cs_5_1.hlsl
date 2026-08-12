#include "../common.hlsl"

struct _423
{
    uint2 _m0;
    uint _m1;
};

static const float _2791[30] = { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f };
static const float _69[10][30] = { { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f } };
static const float _74[1] = { 0.0f };
static const float4 _319[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    precise float _414 = a.x * b.x;
    return mad(a.y, b.y, _414);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _400 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _400));
}

uint cvt_f32_u32(float v)
{
    return (v > 4294967040.0f) ? 4294967295u : uint(max(v, 0.0f));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _374 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _374)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _422_dummy_parameter;
    _423 _424 = { spvImageSize(u0, _422_dummy_parameter), 1u };
    uint _436 = gl_GlobalInvocationID.x - gl_LocalInvocationID.x;
    uint _437 = gl_GlobalInvocationID.y - gl_LocalInvocationID.y;
    uint _439 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _440 = spvBitfieldUExtract(_439, 1u, 3u);
    uint _442 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _439, 0u, 1u);
    uint _443 = _436 + _440;
    uint _444 = _442 + _437;
    float _445 = float(_443);
    float _446 = float(_444);
    float _449 = float(_424._m0.x);
    float _450 = float(_424._m0.y);
    float _451 = (_445 + 0.5f) / _449;
    float _452 = (_446 + 0.5f) / _450;
    bool _455 = (_424._m0.x < _443) || (_424._m0.y < _444);
    bool _460 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _460) && (gl_LocalInvocationID.y == 0u))
    {
        g1[0u] = t9.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    if (_439 < 36u)
    {
        bool _488 = _439 < 4u;
        bool _489 = _439 < 12u;
        bool _490 = _439 < 20u;
        bool _491 = _439 < 28u;
        uint _502 = _488 ? ((_439 >> 1u) * 9u) : (_489 ? 0u : (_490 ? 9u : (_491 ? (((_439 - 20u) & 7u) + 1u) : (((_439 - 28u) & 7u) + 1u))));
        uint _503 = _488 ? ((_439 & 1u) * 9u) : (_489 ? (((_439 - 4u) & 7u) + 1u) : (_490 ? (((_439 - 12u) & 7u) + 1u) : (_491 ? 0u : 9u)));
        float _504 = 1.0f / _449;
        float _505 = 1.0f / _450;
        float _524 = clamp((_504 * (float(int(_502 - 1u)) + 0.5f)) + (_504 * float(int(_436))), 0.0f, 1.0f);
        float _525 = clamp((_505 * float(int(_437))) + (_505 * (float(int(_503 - 1u)) + 0.5f)), 0.0f, 1.0f);
        float2 _528 = float2(_524, _525);
        float _533 = mad(t7.SampleLevel(s5, _528, 0.0f).x, 2.0f, -1.0f);
        float _548;
        if (_533 > 0.0f)
        {
            _548 = min(sqrt(_533), t1.Load(8u).x);
        }
        else
        {
            _548 = max(_533, -t1.Load(7u).x);
        }
        float4 _552 = t6.SampleLevel(s4, _528, 0.0f);
        float2 _562 = float2(_552.x * cb2_m2.z, _552.y * cb2_m2.w);
        bool _575 = (cb2_m9.x != 0.0f) && (cb2_m9.y != 0.0f);
        bool _579 = (cb2_m7.w != 0.0f) && (cb2_m8.x != 0.0f);
        float _591 = exp2(max(_575 ? clamp((sqrt(dp2_f32(_562, _562)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _579 ? clamp((abs(_548) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float _593 = _524 - 0.5f;
        float _594 = _525 - 0.5f;
        float2 _595 = float2(_593, _594);
        float _599 = mad(dp2_f32(_595, _595), cb2_m11.y, 1.0f);
        float _621 = mad(exp2(log2(clamp(cb2_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m12.x, -0.089999973773956298828125f, 1.0f);
        float _622 = (_599 * mad(cb2_m12.x, mad(cb2_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), 1.0f)) * _621;
        float _623 = _621 * (_599 * mad(mad(cb2_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m12.x, 1.0f));
        float _624 = _621 * (_599 * mad(mad(cb2_m12.y, 0.0f, 0.04500000178813934326171875f), cb2_m12.x, 1.0f));
        float _625 = mad(_593, _622, 0.5f);
        float _626 = mad(_622, _594, 0.5f);
        float _627 = mad(_593, _623, 0.5f);
        float _628 = mad(_623, _594, 0.5f);
        float2 _631 = float2(_625, _626);
        float4 _633 = t2.SampleLevel(s0, _631, 0.0f);
        float _634 = _633.x;
        bool _635 = _579 || _575;
        float _669;
        if (_635)
        {
            float4 _641 = t3.SampleLevel(s1, _631, 0.0f);
            float _642 = _641.x;
            float _650 = asfloat(cb0_m[43u].w) * 20.0f;
            float _666 = mad(mad(t10.SampleLevel(s7, float2(mad(_625, 30.0f, sin(_650)), mad(_626, 30.0f, cos(_650))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_642, max(_641.y, _641.z)), 1.0000000133514319600180897396058e-10f)), _642);
            _669 = mad(_591, _634 - _666, _666);
        }
        else
        {
            _669 = _634;
        }
        float2 _670 = float2(_627, _628);
        float4 _672 = t2.SampleLevel(s0, _670, 0.0f);
        float _673 = _672.y;
        float _706;
        if (_635)
        {
            float4 _679 = t3.SampleLevel(s1, _670, 0.0f);
            float _681 = _679.y;
            float _687 = asfloat(cb0_m[43u].w) * 20.0f;
            float _703 = mad(mad(t10.SampleLevel(s7, float2(mad(_627, 30.0f, sin(_687)), mad(_628, 30.0f, cos(_687))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_679.x, max(_681, _679.z)), 1.0000000133514319600180897396058e-10f)), _681);
            _706 = mad(_591, _673 - _703, _703);
        }
        else
        {
            _706 = _673;
        }
        float _707 = mad(_593, _624, 0.5f);
        float _708 = mad(_624, _594, 0.5f);
        float2 _709 = float2(_707, _708);
        float4 _711 = t2.SampleLevel(s0, _709, 0.0f);
        float _712 = _711.z;
        float _745;
        if (_635)
        {
            float4 _718 = t3.SampleLevel(s1, _709, 0.0f);
            float _721 = _718.z;
            float _726 = asfloat(cb0_m[43u].w) * 20.0f;
            float _742 = mad(mad(t10.SampleLevel(s7, float2(mad(_707, 30.0f, sin(_726)), mad(_708, 30.0f, cos(_726))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_718.x, max(_718.y, _721)), 1.0000000133514319600180897396058e-10f)), _721);
            _745 = mad(_591, _712 - _742, _742);
        }
        else
        {
            _745 = _712;
        }
        float _750 = _460 ? g1[0u] : cb2_m3.x;
        float4 _754 = t8.SampleLevel(s6, _528, 0.0f);
        float _755 = _754.x;
        float _763 = max(cb2_m3.w - dp3_f32(float3(_755, _754.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
        float _767 = mad(_669, _750, _755 / _763);
        float _768 = mad(_706, _750, _754.y / _763);
        float _769 = mad(_745, _750, _754.z / _763);
        float _773 = 1.0f / (max(_767, max(_768, _769)) + 1.0f);
        float _774 = _767 * _773;
        float _776 = _773 * _769;
        float3 _777 = float3(_774, _776, _773 * _768);
        uint _782 = (_503 * 12u) >> 2u;
        g0[_502][_782] = dp3_f32(_777, float3(0.25f, 0.25f, 0.5f));
        uint _785 = _782 + 1u;
        g0[_502][_785] = dp2_f32(float2(_774, _776), float2(0.5f, -0.5f));
        uint _788 = _782 + 2u;
        g0[_502][_788] = dp3_f32(_777, float3(-0.25f, -0.25f, 0.5f));
    }
    float2 _793 = float2(_451, _452);
    float _797 = mad(t7.SampleLevel(s5, _793, 0.0f).x, 2.0f, -1.0f);
    float _812;
    if (_797 > 0.0f)
    {
        _812 = min(sqrt(_797), t1.Load(8u).x);
    }
    else
    {
        _812 = max(_797, -t1.Load(7u).x);
    }
    float4 _816 = t6.SampleLevel(s4, _793, 0.0f);
    float _817 = _816.x;
    float _818 = _816.y;
    float2 _829 = float2(_817 * cb2_m2.z, _818 * cb2_m2.w);
    bool _841 = (cb2_m9.x != 0.0f) && (cb2_m9.y != 0.0f);
    bool _845 = (cb2_m7.w != 0.0f) && (cb2_m8.x != 0.0f);
    float _849 = abs(_812);
    float _857 = exp2(max(_841 ? clamp((sqrt(dp2_f32(_829, _829)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _845 ? clamp((_849 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _858 = _451 - 0.5f;
    float _859 = _452 - 0.5f;
    float2 _860 = float2(_858, _859);
    float _861 = dp2_f32(_860, _860);
    float _864 = mad(_861, cb2_m11.y, 1.0f);
    float _886 = mad(exp2(log2(clamp(cb2_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m12.x, -0.089999973773956298828125f, 1.0f);
    float _887 = (_864 * mad(mad(cb2_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb2_m12.x, 1.0f)) * _886;
    float _888 = _886 * (_864 * mad(mad(cb2_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m12.x, 1.0f));
    float _889 = _886 * (_864 * mad(mad(cb2_m12.y, 0.0f, 0.04500000178813934326171875f), cb2_m12.x, 1.0f));
    float _890 = mad(_858, _887, 0.5f);
    float _891 = mad(_887, _859, 0.5f);
    float _892 = mad(_858, _888, 0.5f);
    float _893 = mad(_859, _888, 0.5f);
    float2 _896 = float2(_890, _891);
    float4 _898 = t2.SampleLevel(s0, _896, 0.0f);
    float _899 = _898.x;
    bool _900 = _845 || _841;
    float _933;
    if (_900)
    {
        float4 _906 = t3.SampleLevel(s1, _896, 0.0f);
        float _907 = _906.x;
        float _914 = asfloat(cb0_m[43u].w) * 20.0f;
        float _930 = mad(mad(t10.SampleLevel(s7, float2(mad(_890, 30.0f, sin(_914)), mad(_891, 30.0f, cos(_914))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_907, max(_906.y, _906.z)), 1.0000000133514319600180897396058e-10f)), _907);
        _933 = mad(_857, _899 - _930, _930);
    }
    else
    {
        _933 = _899;
    }
    float2 _934 = float2(_892, _893);
    float4 _936 = t2.SampleLevel(s0, _934, 0.0f);
    float _937 = _936.y;
    float _970;
    if (_900)
    {
        float4 _943 = t3.SampleLevel(s1, _934, 0.0f);
        float _945 = _943.y;
        float _951 = asfloat(cb0_m[43u].w) * 20.0f;
        float _967 = mad(mad(t10.SampleLevel(s7, float2(mad(_892, 30.0f, sin(_951)), mad(_893, 30.0f, cos(_951))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_943.x, max(_945, _943.z)), 1.0000000133514319600180897396058e-10f)), _945);
        _970 = mad(_857, _937 - _967, _967);
    }
    else
    {
        _970 = _937;
    }
    float _971 = mad(_858, _889, 0.5f);
    float _972 = mad(_859, _889, 0.5f);
    float2 _973 = float2(_971, _972);
    float4 _975 = t2.SampleLevel(s0, _973, 0.0f);
    float _976 = _975.z;
    float _1009;
    if (_900)
    {
        float4 _982 = t3.SampleLevel(s1, _973, 0.0f);
        float _985 = _982.z;
        float _990 = asfloat(cb0_m[43u].w) * 20.0f;
        float _1006 = mad(mad(t10.SampleLevel(s7, float2(mad(_971, 30.0f, sin(_990)), mad(_972, 30.0f, cos(_990))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_982.x, max(_982.y, _985)), 1.0000000133514319600180897396058e-10f)), _985);
        _1009 = mad(_857, _976 - _1006, _1006);
    }
    else
    {
        _1009 = _976;
    }
    float _1014 = _460 ? g1[0u] : cb2_m3.x;
    float4 _1018 = t8.SampleLevel(s6, _793, 0.0f);
    float _1019 = _1018.x;
    float _1027 = max(cb2_m3.w - dp3_f32(float3(_1019, _1018.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _1031 = mad(_933, _1014, _1019 / _1027);
    float _1032 = mad(_970, _1014, _1018.y / _1027);
    float _1033 = mad(_1009, _1014, _1018.z / _1027);
    float _1037 = 1.0f / (max(_1031, max(_1033, _1032)) + 1.0f);
    float _1038 = _1031 * _1037;
    float _1040 = _1037 * _1033;
    float3 _1041 = float3(_1038, _1040, _1037 * _1032);
    float _1042 = dp3_f32(_1041, float3(0.25f, 0.25f, 0.5f));
    float _1043 = dp3_f32(_1041, float3(-0.25f, -0.25f, 0.5f));
    float _1045 = dp2_f32(float2(_1038, _1040), float2(0.5f, -0.5f));
    uint _1046 = _440 + 1u;
    uint _1047 = _440 + 2u;
    uint _1048 = _442 * 12u;
    uint _1051 = (_1048 + 12u) >> 2u;
    g0[_1046][_1051] = _1042;
    uint _1054 = _1051 + 1u;
    g0[_1046][_1054] = _1045;
    uint _1057 = _1051 + 2u;
    g0[_1046][_1057] = _1043;
    float2 _1060 = float2(_817 * cb2_m2.x, _818 * cb2_m2.y);
    float _1064 = min(sqrt(dp2_f32(_1060, _1060)) * 0.07500000298023223876953125f, 1.0f);
    float _1065 = _451 - _817;
    float _1066 = _452 - _818;
    float _1074 = (max(abs(mad(_1066, 2.0f, -1.0f)), abs(mad(_1065, 2.0f, -1.0f))) >= 1.0f) ? (-_1064) : _1064;
    float _1081 = floor(mad(_1065, cb2_m2.x, -0.5f));
    float _1082 = floor(mad(cb2_m2.y, _1066, -0.5f));
    float _1083 = _1081 + 0.5f;
    float _1084 = _1082 + 0.5f;
    float _1088 = mad(_1065, cb2_m2.x, -_1083);
    float _1090 = mad(cb2_m2.y, _1066, -_1084);
    float _1092 = mad(-_1065, cb2_m2.x, _1083);
    float _1094 = mad(-cb2_m2.y, _1066, _1084);
    float _1101 = mad(_1088, mad(_1092, 1.5f, 2.0f), 0.5f);
    float _1102 = mad(_1090, mad(_1094, 1.5f, 2.0f), 0.5f);
    float _1103 = _1088 * _1088;
    float _1104 = _1090 * _1090;
    float _1109 = _1103 * mad(_1088, 0.5f, -0.5f);
    float _1110 = mad(_1090, 0.5f, -0.5f) * _1104;
    float _1113 = _1088 * mad(_1088, mad(_1092, 0.5f, 1.0f), -0.5f);
    float _1114 = _1090 * mad(_1090, mad(_1094, 0.5f, 1.0f), -0.5f);
    float _1117 = mad(_1088, _1101, mad(_1103, mad(_1088, 1.5f, -2.5f), 1.0f));
    float _1118 = mad(_1090, _1102, mad(mad(_1090, 1.5f, -2.5f), _1104, 1.0f));
    float _1125 = (_1081 - 0.5f) / cb2_m2.x;
    float _1126 = (_1082 - 0.5f) / cb2_m2.y;
    float _1127 = (_1081 + 2.5f) / cb2_m2.x;
    float _1128 = (_1082 + 2.5f) / cb2_m2.y;
    float _1129 = (((_1090 * _1102) / _1118) + _1084) / cb2_m2.y;
    float _1130 = (_1083 + ((_1088 * _1101) / _1117)) / cb2_m2.x;
    float4 _1135 = t4.SampleLevel(s2, float2(_1125, _1126), 0.0f);
    float4 _1144 = t4.SampleLevel(s2, float2(_1127, _1126), 0.0f);
    float4 _1162 = t4.SampleLevel(s2, float2(_1130, _1126), 0.0f);
    float4 _1174 = t4.SampleLevel(s2, float2(_1125, _1129), 0.0f);
    float4 _1186 = t4.SampleLevel(s2, float2(_1130, _1129), 0.0f);
    float4 _1198 = t4.SampleLevel(s2, float2(_1127, _1129), 0.0f);
    float4 _1210 = t4.SampleLevel(s2, float2(_1125, _1128), 0.0f);
    float4 _1222 = t4.SampleLevel(s2, float2(_1130, _1128), 0.0f);
    float4 _1234 = t4.SampleLevel(s2, float2(_1127, _1128), 0.0f);
    float _1241 = mad(_1109 * _1234.x, _1110, mad(_1117 * _1222.x, _1110, mad(_1113 * _1210.x, _1110, mad(_1109 * _1198.x, _1118, mad(_1117 * _1186.x, _1118, mad(_1113 * _1174.x, _1118, mad(_1117 * _1162.x, _1114, ((_1109 * _1144.x) * _1114) + ((_1113 * _1135.x) * _1114))))))));
    float _1243 = mad(_1110, _1109 * _1234.z, mad(_1117 * _1222.z, _1110, mad(_1113 * _1210.z, _1110, mad(_1109 * _1198.z, _1118, mad(_1117 * _1186.z, _1118, mad(_1113 * _1174.z, _1118, mad(_1117 * _1162.z, _1114, (_1114 * (_1113 * _1135.z)) + ((_1109 * _1144.z) * _1114))))))));
    float3 _1244 = float3(_1241, _1243, mad(_1110, _1109 * _1234.y, mad(_1117 * _1222.y, _1110, mad(_1113 * _1210.y, _1110, mad(_1109 * _1198.y, _1118, mad(_1117 * _1186.y, _1118, mad(_1113 * _1174.y, _1118, mad(_1117 * _1162.y, _1114, ((_1109 * _1144.y) * _1114) + ((_1113 * _1135.y) * _1114)))))))));
    float _1245 = dp3_f32(_1244, float3(0.25f, 0.25f, 0.5f));
    float _1246 = dp3_f32(_1244, float3(-0.25f, -0.25f, 0.5f));
    float _1248 = dp2_f32(float2(_1241, _1243), float2(0.5f, -0.5f));
    GroupMemoryBarrierWithGroupSync();
    uint _1249 = _1048 >> 2u;
    uint _1253 = _1249 + 1u;
    uint _1257 = _1249 + 2u;
    uint _1343 = (_1048 + 24u) >> 2u;
    uint _1347 = _1343 + 1u;
    uint _1351 = _1343 + 2u;
    float _1372 = min(min(min(min(_1042, g0[_1046][_1249]), g0[_440][_1051]), g0[_1047][_1051]), g0[_1046][_1343]);
    float _1373 = max(max(max(max(_1042, g0[_1046][_1249]), g0[_440][_1051]), g0[_1047][_1051]), g0[_1046][_1343]);
    float _1391 = (((((((_1042 + g0[_1046][_1249]) + g0[_440][_1249]) + g0[_440][_1051]) + g0[_1047][_1249]) + g0[_1047][_1051]) + g0[_440][_1343]) + g0[_1046][_1343]) + g0[_1047][_1343];
    float _1405 = _1391 * 0.111111111938953399658203125f;
    float _1406 = (g0[_1047][_1347] + (g0[_1046][_1347] + (g0[_440][_1347] + (g0[_1047][_1054] + (g0[_1047][_1253] + (g0[_440][_1054] + (g0[_440][_1253] + (_1045 + g0[_1046][_1253])))))))) * 0.111111111938953399658203125f;
    float _1407 = (g0[_1047][_1351] + (g0[_1046][_1351] + (g0[_440][_1351] + (g0[_1047][_1057] + (g0[_1047][_1257] + (g0[_440][_1057] + (g0[_440][_1257] + (_1043 + g0[_1046][_1257])))))))) * 0.111111111938953399658203125f;
    float _1420 = sqrt(max((mad(g0[_1047][_1343], g0[_1047][_1343], mad(g0[_1046][_1343], g0[_1046][_1343], mad(g0[_440][_1343], g0[_440][_1343], mad(g0[_1047][_1051], g0[_1047][_1051], mad(g0[_1047][_1249], g0[_1047][_1249], mad(g0[_440][_1051], g0[_440][_1051], mad(g0[_440][_1249], g0[_440][_1249], (g0[_1046][_1249] * g0[_1046][_1249]) + (_1042 * _1042)))))))) * 0.111111111938953399658203125f) - (_1405 * _1405), 1.0000000133514319600180897396058e-10f));
    float _1421 = sqrt(max((mad(g0[_1047][_1347], g0[_1047][_1347], mad(g0[_1046][_1347], g0[_1046][_1347], mad(g0[_440][_1347], g0[_440][_1347], mad(g0[_1047][_1054], g0[_1047][_1054], mad(g0[_1047][_1253], g0[_1047][_1253], mad(g0[_440][_1054], g0[_440][_1054], mad(g0[_440][_1253], g0[_440][_1253], (_1045 * _1045) + (g0[_1046][_1253] * g0[_1046][_1253])))))))) * 0.111111111938953399658203125f) - (_1406 * _1406), 1.0000000133514319600180897396058e-10f));
    float _1422 = sqrt(max((mad(g0[_1047][_1351], g0[_1047][_1351], mad(g0[_1046][_1351], g0[_1046][_1351], mad(g0[_440][_1351], g0[_440][_1351], mad(g0[_1047][_1057], g0[_1047][_1057], mad(g0[_1047][_1257], g0[_1047][_1257], mad(g0[_440][_1057], g0[_440][_1057], mad(g0[_440][_1257], g0[_440][_1257], (_1043 * _1043) + (g0[_1046][_1257] * g0[_1046][_1257])))))))) * 0.111111111938953399658203125f) - (_1407 * _1407), 1.0000000133514319600180897396058e-10f));
    float _1426 = asfloat(cb0_m[46u].z);
    uint4 _1433 = t0.Load(int3(uint2(cvt_f32_u32(_445 / _1426), cvt_f32_u32(_446 / _1426)), 0u));
    uint _1434 = _1433.x;
    float _1438 = float(spvBitfieldUExtract(_1434, 2u, 2u) + (_1434 & 3u));
    float _1448 = mad(_1245 / max(mad(_1391, 0.111111111938953399658203125f, _1245), 1.0000000116860974230803549289703e-07f), 0.5f, 0.75f);
    float _1449 = mad(_1420 * _1438, 0.5f, _1420) * _1448;
    float _1450 = _1448 * mad(_1438 * _1421, 0.5f, _1421);
    float _1451 = _1448 * mad(_1438 * _1422, 0.5f, _1422);
    float _1455 = _1405 + _1449;
    float _1456 = _1450 + _1406;
    float _1457 = _1451 + _1407;
    float _1458 = (_1405 - _1449) + _1455;
    float _1459 = _1456 + (_1406 - _1450);
    float _1460 = _1457 + (_1407 - _1451);
    float _1470 = mad(_1458, -0.5f, _1245);
    float _1471 = mad(_1459, -0.5f, _1248);
    float _1472 = mad(_1460, -0.5f, _1246);
    float _1480 = max(max(abs(_1471 / mad((_1450 - _1406) + _1456, 0.5f, 9.9999997473787516355514526367188e-05f)), abs(_1470 / mad(_1455 + (_1449 - _1405), 0.5f, 9.9999997473787516355514526367188e-05f))), abs(_1472 / mad((_1451 - _1407) + _1457, 0.5f, 9.9999997473787516355514526367188e-05f)));
    bool _1481 = _1480 > 1.0f;
    float _1492 = mad(_1373, 0.5f, max(_1373 * 0.5f, max(max(max(max(_1042, g0[_440][_1249]), g0[_1047][_1249]), g0[_440][_1343]), g0[_1047][_1343]) * 0.5f)) - mad(_1372, 0.5f, min(_1372 * 0.5f, min(min(min(min(_1042, g0[_440][_1249]), g0[_1047][_1249]), g0[_440][_1343]), g0[_1047][_1343]) * 0.5f));
    uint2 _1502 = uint2(_443, _444);
    float4 _1503 = u2[_1502];
    float _1506 = max(mad(abs(_1074), 0.85000002384185791015625f, 0.100000001490116119384765625f) * ((min(_1245, _1492) / ((_1245 + _1492) + 1.0000000116860974230803549289703e-07f)) * (_1481 ? 0.85000002384185791015625f : 1.0f)), _1503.x * 0.75f);
    bool _1507 = _1074 < 0.0f;
    float _1508 = _1507 ? _1042 : (_1481 ? mad(_1458, 0.5f, _1470 / _1480) : _1245);
    float _1509 = _1507 ? _1045 : (_1481 ? mad(_1459, 0.5f, _1471 / _1480) : _1248);
    float _1510 = _1507 ? _1043 : (_1481 ? mad(_1460, 0.5f, _1472 / _1480) : _1246);
    float _1518 = clamp(mad(t5.SampleLevel(s3, _793, 0.0f).y, 1.0f - _1506, _1506), 0.0039215688593685626983642578125f, 0.949999988079071044921875f);
    float _1522 = mad(1.0f - _1518, cb2_m0.x, _1518);
    float _1526 = mad(_1522, _1042 - _1508, _1508);
    float _1527 = mad(_1522, _1045 - _1509, _1509);
    float _1528 = mad(_1522, _1043 - _1510, _1510);
    float _1529 = _1526 - _1528;
    float _1530 = _1529 + _1527;
    float _1531 = _1526 + _1528;
    float _1532 = _1529 - _1527;
    u1[_1502] = float4(_1530, _1531, _1532, 0.0f);
    u2[_1502] = _1522.xxxx;
    u3[_1502] = _1526.xxxx;
    bool _1538 = !_455;
    float _1909;
    float _1910;
    float _1911;
    if (_1538)
    {
        float _1542 = dp3_f32(float3(_1530, _1531, _1532), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1549 = mad(-_849, cb2_m8.y, 1.0f) * cb2_m7.x;
        float _1553 = mad(_1549, _1530 - _1542, _1542);
        float _1554 = mad(_1549, _1531 - _1542, _1542);
        float _1555 = mad(_1549, _1532 - _1542, _1542);
        float _1556 = _859 + _859;
        float _1557 = _858 + _858;
        float _1558 = abs(_1557);
        float _1559 = abs(_1556);
        float _1563 = min(_1558, _1559) * (1.0f / max(_1558, _1559));
        float _1564 = _1563 * _1563;
        float _1568 = mad(_1564, mad(_1564, mad(_1564, mad(_1564, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1577 = mad(_1563, _1568, (_1558 < _1559) ? mad(_1563 * _1568, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_1557) > _1557) ? (-3.1415927410125732421875f) : 0.0f);
        float _1578 = min(_1556, _1557);
        float _1579 = max(_1556, _1557);
        float _1586 = ((_1578 < (-_1578)) && (_1579 >= (-_1579))) ? (-_1577) : _1577;
        float4 _1590 = t11.SampleLevel(s8, _793, 0.0f);
        float _1591 = _1590.x;
        float _1592 = _1590.y;
        float _1593 = _1590.z;
        float _1594 = _1590.w;
        float _1599 = (_1554 - _1555) * 1.73205077648162841796875f;
        float _1601 = mad(_1553, 2.0f, -_1554);
        float _1602 = _1601 - _1555;
        float _1603 = abs(_1602);
        float _1604 = abs(_1599);
        float _1608 = min(_1603, _1604) * (1.0f / max(_1603, _1604));
        float _1609 = _1608 * _1608;
        float _1613 = mad(_1609, mad(_1609, mad(_1609, mad(_1609, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1622 = mad(_1608, _1613, (_1603 < _1604) ? mad(_1608 * _1613, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1602 < (_1555 - _1601)) ? (-3.1415927410125732421875f) : 0.0f);
        float _1623 = min(_1599, _1602);
        float _1624 = max(_1599, _1602);
        float _1633 = ((_1553 == _1554) && (_1555 == _1554)) ? 0.0f : ((((_1623 < (-_1623)) && (_1624 >= (-_1624))) ? (-_1622) : _1622) * 57.295780181884765625f);
        float _1642 = mad(cb2_m14.x, -360.0f, (_1633 < 0.0f) ? (_1633 + 360.0f) : _1633);
        float _1652 = clamp(1.0f - (abs((_1642 < (-180.0f)) ? (_1642 + 360.0f) : ((_1642 > 180.0f) ? (_1642 - 360.0f) : _1642)) / (cb2_m14.y * 180.0f)), 0.0f, 1.0f);
        float _1657 = dp3_f32(float3(_1553, _1554, _1555), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1660 = (mad(_1652, -2.0f, 3.0f) * (_1652 * _1652)) * cb2_m14.z;
        float _1672 = mad(mad(_1660, _1553 - _1657, _1657) - _1553, cb2_m13.x, _1553);
        float _1673 = mad(cb2_m13.x, mad(_1660, _1554 - _1657, _1657) - _1554, _1554);
        float _1674 = mad(cb2_m13.x, mad(_1660, _1555 - _1657, _1657) - _1555, _1555);
        float _1676;
        _1676 = 0.0f;
        float _1677;
        uint _1680;
        uint _1679 = 0u;
        for (;;)
        {
            if (_1679 >= 8u)
            {
                break;
            }
            uint _1691 = min((_1679 & 3u), 10u);
            float _1711 = mad(float(_1679), 0.785398185253143310546875f, -_1586);
            float _1712 = _1711 + 1.57079637050628662109375f;
            _1677 = mad(_1594 * (dp4_f32(t12.Load((_1679 >> 2u) + 10u), float4(_319[_1691].x, _319[_1691].y, _319[_1691].z, _319[_1691].w)) * clamp((abs((_1712 > 3.1415927410125732421875f) ? (_1711 - 4.7123889923095703125f) : _1712) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _1676, _1676);
            _1680 = _1679 + 1u;
            _1676 = _1677;
            _1679 = _1680;
            continue;
        }
        float _1723 = clamp(_1676, 0.0f, 1.0f);
        float _1735 = asfloat(cb0_m[43u].w);
        float _1741 = abs(t12.Load(8u).x);
        float2 _1744 = float2(_858 * 1.40999996662139892578125f, _859 * 1.40999996662139892578125f);
        float _1746 = sqrt(dp2_f32(_1744, _1744));
        float _1747 = min(_1746, 1.0f);
        float _1748 = _1747 * _1747;
        float _1753 = clamp(_1746 - 0.5f, 0.0f, 1.0f);
        float _1756 = (_1747 * _1748) + (mad(-_1747, _1748, 1.0f) * (_1753 * _1753));
        float _1757 = mad(mad(mad(sin(_1735 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _1741, -1.0f);
        float _1759 = _1592 + _1757;
        float _1761 = clamp((_1593 + _1757) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _1768 = clamp(_1759 + _1759, 0.0f, 1.0f);
        float _1778 = mad(sin(_1592 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f);
        float _1785 = dp3_f32(float3(t13.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1790 = mad(exp2(log2(abs(_1785)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1794 = _1778 * (_1790 * 0.02999999932944774627685546875f);
        float _1795 = mad(_1741, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1799 = mad(mad(-_1756, _1756, 1.0f), 1.0f - _1795, _1795);
        float _1800 = min((exp2(log2(_1756) * 0.699999988079071044921875f) * (mad(_1768, -2.0f, 3.0f) * (_1768 * _1768))) + (mad(_1761, -2.0f, 3.0f) * (_1761 * _1761)), 1.0f);
        float _1810 = mad(_1800, mad((_1778 * _1790) * 0.62000000476837158203125f, _1799, mad(_1672, _1723, -_1672)), mad(-_1672, _1723, _1672));
        float _1811 = mad(_1800, mad(_1799, _1794, mad(_1723, _1673, -_1673)), mad(-_1723, _1673, _1673));
        float _1812 = mad(_1800, mad(_1799, _1794, mad(_1723, _1674, -_1674)), mad(-_1723, _1674, _1674));
        float _1815 = mad(_1592, _1593 * (1.0f - _1594), _1594);
        float _1817;
        _1817 = 0.0f;
        float _1818;
        uint _1821;
        uint _1820 = 0u;
        for (;;)
        {
            if (int(_1820) >= 8)
            {
                break;
            }
            float4 _1828 = t12.Load(_1820);
            float _1830 = _1828.y;
            float _1832 = _1828.x - _1586;
            _1818 = mad(_1815 * (_1828.w * clamp((abs((_1832 > 3.1415927410125732421875f) ? (_1832 - 6.283185482025146484375f) : ((_1832 < (-3.1415927410125732421875f)) ? (_1832 + 6.283185482025146484375f) : _1832)) + (_1830 - 3.1415927410125732421875f)) / max(_1830 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1817, _1817);
            _1821 = _1820 + 1u;
            _1817 = _1818;
            _1820 = _1821;
            continue;
        }
        float _1851 = clamp(_1817 + _1817, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1855 = mad(_1851, 0.310000002384185791015625f - _1810, _1810);
        float _1856 = mad(_1851, 0.014999999664723873138427734375f - _1811, _1811);
        float _1857 = mad(_1851, 0.014999999664723873138427734375f - _1812, _1812);
        float4 _1858 = t12.Load(12u);
        float _1859 = _1858.x;
        float _1887;
        float _1888;
        float _1889;
        if (_1859 != 0.0f)
        {
            float _1866 = clamp(_1785, 0.0f, 1.0f);
            float _1876 = clamp((_1591 + (_1859 - 1.0f)) / max(mad(_1859, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1880 = clamp(_1859 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1883 = mad(_1880, -2.0f, 3.0f) * (_1880 * _1880);
            _1887 = mad(_1883, _1876 * (_1866 * (_1591 * 0.930000007152557373046875f)), _1857);
            _1888 = mad(_1883, _1876 * (_1866 * (_1591 * 0.85000002384185791015625f)), _1856);
            _1889 = mad((_1866 * (_1591 * 0.790000021457672119140625f)) * _1876, _1883, _1855);
        }
        else
        {
            _1887 = _1857;
            _1888 = _1856;
            _1889 = _1855;
        }
        bool _1892 = cb2_m13.y > 0.0f;
        bool _1896 = frac((_452 * 420.0f) + (_1735 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1897 = _1896 ? 0.300000011920928955078125f : 0.0f;
        float _1898 = cb2_m13.y * _1897;
        _1909 = _1892 ? mad(_1898, 0.0f - _1889, _1889) : _1889;
        _1910 = _1892 ? mad(_1898, (_1896 ? 0.100000001490116119384765625f : 0.0f) - _1888, _1888) : _1888;
        _1911 = _1892 ? mad(_1898, _1897 - _1887, _1887) : _1887;
    }
    else
    {
        _1909 = _1530;
        _1910 = _1531;
        _1911 = _1532;
    }
    float _1916 = 1.0f / max(1.0f - max(max(_1910, _1911), _1909), 6.099999882280826568603515625e-05f);
    float _1923 = min(-(_1916 * _1909), 0.0f);
    float _1924 = min(-(_1916 * _1910), 0.0f);
    float _1925 = min(-(_1916 * _1911), 0.0f);
    float _1935 = clamp(-((sqrt(_861) - cb2_m6.x) * (1.0f / cb2_m6.y)), 0.0f, 1.0f);
    float _1936 = mad(_1935, -2.0f, 3.0f);
    float _1937 = _1935 * _1935;
    float _1938 = _1936 * _1937;
    float _1940 = mad(-_1936, _1937, 1.0f);
    float _1963 = cb2_m6.z * cb2_m6.w;
    float3 _1976 = float3(_455 ? (-_1923) : mad(_1923 + ((_1940 * cb2_m4.x) - (_1923 * _1938)), _1963, -_1923), _455 ? (-_1924) : mad(_1963, ((cb2_m4.y * _1940) - (_1938 * _1924)) + _1924, -_1924), _455 ? (-_1925) : mad(_1963, ((cb2_m4.z * _1940) - (_1938 * _1925)) + _1925, -_1925));
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
         if (_1538) {
            float3 scene_color = _1976;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_1502] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1983 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1976) * 2.5f, 65504.0f);
    float _1984 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1976) * 2.5f, 65504.0f);
    float _1985 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1976) * 2.5f, 65504.0f);
    float _1989 = max(max(_1984, _1983), _1985);
    float _1994 = (max(_1989, 9.9999997473787516355514526367188e-05f) - max(min(min(_1984, _1983), _1985), 9.9999997473787516355514526367188e-05f)) / max(_1989, 0.00999999977648258209228515625f);
    float _2005 = mad(sqrt(mad(_1983 - _1985, _1983, ((_1985 - _1984) * _1985) + ((_1984 - _1983) * _1984))), 1.75f, (_1985 + _1984) + _1983);
    float _2006 = _1994 - 0.4000000059604644775390625f;
    float _2010 = max(1.0f - abs(_2006 * 2.5f), 0.0f);
    float _2018 = mad(mad(clamp(mad(_2006, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_2010, _2010, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _2026 = ((_2005 <= 0.1599999964237213134765625f) ? _2018 : ((_2005 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_2005 * 0.3333333432674407958984375f)) - 0.5f) * _2018))) + 1.0f;
    float _2027 = _2026 * _1983;
    float _2028 = _2026 * _1984;
    float _2029 = _2026 * _1985;
    float _2034 = (_2028 - _2029) * 1.73205077648162841796875f;
    float _2036 = (_2027 * 2.0f) - _2028;
    float _2038 = mad(-_2026, _1985, _2036);
    float _2039 = abs(_2038);
    float _2040 = abs(_2034);
    float _2044 = min(_2039, _2040) * (1.0f / max(_2039, _2040));
    float _2045 = _2044 * _2044;
    float _2049 = mad(_2045, mad(_2045, mad(_2045, mad(_2045, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _2059 = mad(_2044, _2049, (_2039 < _2040) ? mad(_2044 * _2049, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_2038 < mad(_2026, _1985, -_2036)) ? (-3.1415927410125732421875f) : 0.0f);
    float _2060 = min(_2034, _2038);
    float _2061 = max(_2034, _2038);
    float _2070 = ((_2027 == _2028) && (_2029 == _2028)) ? 0.0f : ((((_2060 < (-_2060)) && (_2061 >= (-_2061))) ? (-_2059) : _2059) * 57.295780181884765625f);
    float _2073 = (_2070 < 0.0f) ? (_2070 + 360.0f) : _2070;
    float _2083 = max(1.0f - abs(((_2073 < (-180.0f)) ? (_2073 + 360.0f) : ((_2073 > 180.0f) ? (_2073 - 360.0f) : _2073)) * 0.01481481455266475677490234375f), 0.0f);
    float _2086 = mad(_2083, -2.0f, 3.0f) * (_2083 * _2083);
    float3 _2097 = float3(clamp(_2027 + (((_1994 * (_2086 * _2086)) * mad(-_2026, _1983, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_2028, 0.0f, 65504.0f), clamp(_2029, 0.0f, 65504.0f));
    float _2101 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2097), 0.0f, 65504.0f);
    float _2102 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2097), 0.0f, 65504.0f);
    float _2103 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2097), 0.0f, 65504.0f);
    float _2105 = dp3_f32(float3(_2101, _2102, _2103), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _2109 = mad(_2101 - _2105, 0.959999978542327880859375f, _2105);
    float _2110 = mad(_2102 - _2105, 0.959999978542327880859375f, _2105);
    float _2111 = mad(_2103 - _2105, 0.959999978542327880859375f, _2105);
    float _2118 = (_2109 <= 0.0f) ? (-14.0f) : log2(_2109);
    float _2119 = (_2110 <= 0.0f) ? (-14.0f) : log2(_2110);
    float _2120 = (_2111 <= 0.0f) ? (-14.0f) : log2(_2111);
    float _2207;
    if (_2118 <= (-17.4739322662353515625f))
    {
        _2207 = -4.0f;
    }
    else
    {
        float _2206;
        if (_2118 < (-2.4739310741424560546875f))
        {
            float _2131 = mad(_2118, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2132 = _2131 * 0.6643855571746826171875f;
            int _2133 = cvt_f32_i32(_2132);
            float _2136 = mad(_2131, 0.6643855571746826171875f, -trunc(_2132));
            uint _2142 = min(uint(_2133 + 4), 10u);
            uint _2148 = min(uint((_2133 + 1) + 4), 10u);
            uint _2154 = min(uint((_2133 + 2) + 4), 10u);
            float2 _2160 = float2(_319[_2142].x, _319[_2148].x);
            _2206 = dp3_f32(float3(_2136 * _2136, _2136, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2142].x, _319[_2148].x, _319[_2154].x)), dp2_f32(float2(-1.0f, 1.0f), _2160), dp2_f32(0.5f.xx, _2160)));
        }
        else
        {
            float _2205;
            if (_2118 < 15.52606868743896484375f)
            {
                float _2170 = mad(_2118, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2171 = _2170 * 0.55365467071533203125f;
                int _2172 = cvt_f32_i32(_2171);
                float _2175 = mad(_2170, 0.55365467071533203125f, -trunc(_2171));
                uint _2181 = min(uint(_2172 + 4), 10u);
                uint _2187 = min(uint((_2172 + 1) + 4), 10u);
                uint _2193 = min(uint((_2172 + 2) + 4), 10u);
                float2 _2199 = float2(_319[_2181].y, _319[_2187].y);
                _2205 = dp3_f32(float3(_2175 * _2175, _2175, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2181].y, _319[_2187].y, _319[_2193].y)), dp2_f32(float2(-1.0f, 1.0f), _2199), dp2_f32(0.5f.xx, _2199)));
            }
            else
            {
                _2205 = 4.0f;
            }
            _2206 = _2205;
        }
        _2207 = _2206;
    }
    float _2293;
    if (_2119 <= (-17.4739322662353515625f))
    {
        _2293 = -4.0f;
    }
    else
    {
        float _2292;
        if (_2119 < (-2.4739310741424560546875f))
        {
            float _2217 = mad(_2119, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2218 = _2217 * 0.6643855571746826171875f;
            int _2219 = cvt_f32_i32(_2218);
            float _2222 = mad(_2217, 0.6643855571746826171875f, -trunc(_2218));
            uint _2228 = min(uint(_2219 + 4), 10u);
            uint _2234 = min(uint((_2219 + 1) + 4), 10u);
            uint _2240 = min(uint((_2219 + 2) + 4), 10u);
            float2 _2246 = float2(_319[_2228].x, _319[_2234].x);
            _2292 = dp3_f32(float3(_2222 * _2222, _2222, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2228].x, _319[_2234].x, _319[_2240].x)), dp2_f32(float2(-1.0f, 1.0f), _2246), dp2_f32(0.5f.xx, _2246)));
        }
        else
        {
            float _2291;
            if (_2119 < 15.52606868743896484375f)
            {
                float _2256 = mad(_2119, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2257 = _2256 * 0.55365467071533203125f;
                int _2258 = cvt_f32_i32(_2257);
                float _2261 = mad(_2256, 0.55365467071533203125f, -trunc(_2257));
                uint _2267 = min(uint(_2258 + 4), 10u);
                uint _2273 = min(uint((_2258 + 1) + 4), 10u);
                uint _2279 = min(uint((_2258 + 2) + 4), 10u);
                float2 _2285 = float2(_319[_2267].y, _319[_2273].y);
                _2291 = dp3_f32(float3(_2261 * _2261, _2261, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2267].y, _319[_2273].y, _319[_2279].y)), dp2_f32(float2(-1.0f, 1.0f), _2285), dp2_f32(0.5f.xx, _2285)));
            }
            else
            {
                _2291 = 4.0f;
            }
            _2292 = _2291;
        }
        _2293 = _2292;
    }
    float _2379;
    if (_2120 <= (-17.4739322662353515625f))
    {
        _2379 = -4.0f;
    }
    else
    {
        float _2378;
        if (_2120 < (-2.4739310741424560546875f))
        {
            float _2303 = mad(_2120, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2304 = _2303 * 0.6643855571746826171875f;
            int _2305 = cvt_f32_i32(_2304);
            float _2308 = mad(_2303, 0.6643855571746826171875f, -trunc(_2304));
            uint _2314 = min(uint(_2305 + 4), 10u);
            uint _2320 = min(uint((_2305 + 1) + 4), 10u);
            uint _2326 = min(uint((_2305 + 2) + 4), 10u);
            float2 _2332 = float2(_319[_2314].x, _319[_2320].x);
            _2378 = dp3_f32(float3(_2308 * _2308, _2308, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2314].x, _319[_2320].x, _319[_2326].x)), dp2_f32(float2(-1.0f, 1.0f), _2332), dp2_f32(0.5f.xx, _2332)));
        }
        else
        {
            float _2377;
            if (_2120 < 15.52606868743896484375f)
            {
                float _2342 = mad(_2120, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2343 = _2342 * 0.55365467071533203125f;
                int _2344 = cvt_f32_i32(_2343);
                float _2347 = mad(_2342, 0.55365467071533203125f, -trunc(_2343));
                uint _2353 = min(uint(_2344 + 4), 10u);
                uint _2359 = min(uint((_2344 + 1) + 4), 10u);
                uint _2365 = min(uint((_2344 + 2) + 4), 10u);
                float2 _2371 = float2(_319[_2353].y, _319[_2359].y);
                _2377 = dp3_f32(float3(_2347 * _2347, _2347, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_319[_2353].y, _319[_2359].y, _319[_2365].y)), dp2_f32(float2(-1.0f, 1.0f), _2371), dp2_f32(0.5f.xx, _2371)));
            }
            else
            {
                _2377 = 4.0f;
            }
            _2378 = _2377;
        }
        _2379 = _2378;
    }
    float3 _2382 = float3(exp2(_2207 * 3.3219280242919921875f), exp2(_2293 * 3.3219280242919921875f), exp2(_2379 * 3.3219280242919921875f));
    float3 _2386 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _2382), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _2382), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _2382));
    float _2387 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2386);
    float _2388 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2386);
    float _2389 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2386);
    float _2393 = (_2387 <= 0.0f) ? (-4.0f) : (log2(_2387) * 0.3010300099849700927734375f);
    float _2397 = log2(cb1_m[19u].y);
    float _2398 = _2397 * 0.3010300099849700927734375f;
    float _2506;
    if (_2398 >= _2393)
    {
        _2506 = mad(cb1_m[21u].x, _2393, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2398 * cb1_m[21u].x));
    }
    else
    {
        float _2415 = log2(cb1_m[20u].x);
        float _2416 = _2415 * 0.3010300099849700927734375f;
        float _2505;
        if ((_2398 < _2393) && (_2416 > _2393))
        {
            float _2425 = (mad(_2397, -0.3010300099849700927734375f, _2393) * 7.0f) / (_2416 - _2398);
            int _2426 = cvt_f32_i32(_2425);
            float _2428 = _2425 - trunc(_2425);
            uint _2430 = uint(_2426 + 1);
            uint _2432 = uint(_2426 + 2);
            uint _2434 = uint(_2426);
            float2 _2446 = float2(cb1_m[_2434].x, cb1_m[_2430].x);
            _2505 = dp3_f32(float3(_2428 * _2428, _2428, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2434].x, cb1_m[_2430].x, cb1_m[_2432].x)), dp2_f32(float2(-1.0f, 1.0f), _2446), dp2_f32(0.5f.xx, _2446)));
        }
        else
        {
            float _2456 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2504;
            if ((_2416 <= _2393) && (_2456 > _2393))
            {
                float _2465 = (mad(_2415, -0.3010300099849700927734375f, _2393) * 7.0f) / (_2456 - _2416);
                int _2466 = cvt_f32_i32(_2465);
                float _2468 = _2465 - trunc(_2465);
                uint _2473 = uint(_2466 + 10);
                uint _2478 = uint((_2466 + 1) + 10);
                uint _2483 = uint((_2466 + 2) + 10);
                float2 _2489 = float2(cb1_m[_2473].x, cb1_m[_2478].x);
                _2504 = dp3_f32(float3(_2468 * _2468, _2468, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2473].x, cb1_m[_2478].x, cb1_m[_2483].x)), dp2_f32(float2(-1.0f, 1.0f), _2489), dp2_f32(0.5f.xx, _2489)));
            }
            else
            {
                _2504 = mad(cb1_m[21u].y, _2393, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2456 * cb1_m[21u].y));
            }
            _2505 = _2504;
        }
        _2506 = _2505;
    }
    float _2510 = (_2388 <= 0.0f) ? (-4.0f) : (log2(_2388) * 0.3010300099849700927734375f);
    float _2618;
    if (_2398 >= _2510)
    {
        _2618 = mad(cb1_m[21u].x, _2510, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2398 * cb1_m[21u].x));
    }
    else
    {
        float _2527 = log2(cb1_m[20u].x);
        float _2528 = _2527 * 0.3010300099849700927734375f;
        float _2617;
        if ((_2398 < _2510) && (_2528 > _2510))
        {
            float _2537 = (mad(_2397, -0.3010300099849700927734375f, _2510) * 7.0f) / (_2528 - _2398);
            int _2538 = cvt_f32_i32(_2537);
            float _2540 = _2537 - trunc(_2537);
            uint _2542 = uint(_2538 + 1);
            uint _2544 = uint(_2538 + 2);
            uint _2546 = uint(_2538);
            float2 _2558 = float2(cb1_m[_2546].x, cb1_m[_2542].x);
            _2617 = dp3_f32(float3(_2540 * _2540, _2540, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2546].x, cb1_m[_2542].x, cb1_m[_2544].x)), dp2_f32(float2(-1.0f, 1.0f), _2558), dp2_f32(0.5f.xx, _2558)));
        }
        else
        {
            float _2568 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2616;
            if ((_2528 <= _2510) && (_2568 > _2510))
            {
                float _2577 = (mad(_2527, -0.3010300099849700927734375f, _2510) * 7.0f) / (_2568 - _2528);
                int _2578 = cvt_f32_i32(_2577);
                float _2580 = _2577 - trunc(_2577);
                uint _2585 = uint(_2578 + 10);
                uint _2590 = uint((_2578 + 1) + 10);
                uint _2595 = uint((_2578 + 2) + 10);
                float2 _2601 = float2(cb1_m[_2585].x, cb1_m[_2590].x);
                _2616 = dp3_f32(float3(_2580 * _2580, _2580, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2585].x, cb1_m[_2590].x, cb1_m[_2595].x)), dp2_f32(float2(-1.0f, 1.0f), _2601), dp2_f32(0.5f.xx, _2601)));
            }
            else
            {
                _2616 = mad(cb1_m[21u].y, _2510, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2568 * cb1_m[21u].y));
            }
            _2617 = _2616;
        }
        _2618 = _2617;
    }
    float _2622 = (_2389 <= 0.0f) ? (-4.0f) : (log2(_2389) * 0.3010300099849700927734375f);
    float _2730;
    if (_2398 >= _2622)
    {
        _2730 = mad(cb1_m[21u].x, _2622, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2398 * cb1_m[21u].x));
    }
    else
    {
        float _2639 = log2(cb1_m[20u].x);
        float _2640 = _2639 * 0.3010300099849700927734375f;
        float _2729;
        if ((_2398 < _2622) && (_2640 > _2622))
        {
            float _2649 = (mad(_2397, -0.3010300099849700927734375f, _2622) * 7.0f) / (_2640 - _2398);
            int _2650 = cvt_f32_i32(_2649);
            float _2652 = _2649 - trunc(_2649);
            uint _2654 = uint(_2650 + 1);
            uint _2656 = uint(_2650 + 2);
            uint _2658 = uint(_2650);
            float2 _2670 = float2(cb1_m[_2658].x, cb1_m[_2654].x);
            _2729 = dp3_f32(float3(_2652 * _2652, _2652, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2658].x, cb1_m[_2654].x, cb1_m[_2656].x)), dp2_f32(float2(-1.0f, 1.0f), _2670), dp2_f32(0.5f.xx, _2670)));
        }
        else
        {
            float _2680 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2728;
            if ((_2640 <= _2622) && (_2680 > _2622))
            {
                float _2689 = (mad(_2639, -0.3010300099849700927734375f, _2622) * 7.0f) / (_2680 - _2640);
                int _2690 = cvt_f32_i32(_2689);
                float _2692 = _2689 - trunc(_2689);
                uint _2697 = uint(_2690 + 10);
                uint _2702 = uint((_2690 + 1) + 10);
                uint _2707 = uint((_2690 + 2) + 10);
                float2 _2713 = float2(cb1_m[_2697].x, cb1_m[_2702].x);
                _2728 = dp3_f32(float3(_2692 * _2692, _2692, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2697].x, cb1_m[_2702].x, cb1_m[_2707].x)), dp2_f32(float2(-1.0f, 1.0f), _2713), dp2_f32(0.5f.xx, _2713)));
            }
            else
            {
                _2728 = mad(cb1_m[21u].y, _2622, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2680 * cb1_m[21u].y));
            }
            _2729 = _2728;
        }
        _2730 = _2729;
    }
    if (_1538)
    {
        float3 _2742 = float3(exp2(_2506 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2618 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2730 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2746 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2742), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2742), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2742));
        float3 _2750 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2746), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2746), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2746));
        float _2759 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2750) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2770 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2750) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2780 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2750) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_1502] = float4(min(exp2(log2(mad(_2759, 18.8515625f, 0.8359375f) / mad(_2759, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2770, 18.8515625f, 0.8359375f) / mad(_2770, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2780, 18.8515625f, 0.8359375f) / mad(_2780, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
