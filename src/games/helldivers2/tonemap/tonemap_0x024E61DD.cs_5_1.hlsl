#include "../common.hlsl"

struct _485
{
    uint2 _m0;
    uint _m1;
};

static const float _3130[30] = { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f };
static const float _73[10][30] = { { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f } };
static const float _78[1] = { 0.0f };
static const float4 _377[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    float4 cb3_m0 : packoffset(c0);
    uint4 cb3_m1 : packoffset(c1);
    float4 cb3_m2 : packoffset(c2);
    float4 cb3_m3 : packoffset(c3);
    float3 cb3_m4 : packoffset(c4);
    uint cb3_m5 : packoffset(c4.w);
    float4 cb3_m6 : packoffset(c5);
    float4 cb3_m7 : packoffset(c6);
    float2 cb3_m8 : packoffset(c7);
    float2 cb3_m9 : packoffset(c7.z);
    uint4 cb3_m10 : packoffset(c8);
    float2 cb3_m11 : packoffset(c9);
    float2 cb3_m12 : packoffset(c9.z);
    float4 cb3_m13 : packoffset(c10);
    float4 cb3_m14 : packoffset(c11);
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
    precise float _476 = a.x * b.x;
    return mad(a.y, b.y, _476);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _462 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _462));
}

uint cvt_f32_u32(float v)
{
    return (v > 4294967040.0f) ? 4294967295u : uint(max(v, 0.0f));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _436 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _436)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _484_dummy_parameter;
    _485 _486 = { spvImageSize(u0, _484_dummy_parameter), 1u };
    uint _498 = gl_GlobalInvocationID.x - gl_LocalInvocationID.x;
    uint _499 = gl_GlobalInvocationID.y - gl_LocalInvocationID.y;
    uint _501 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _502 = spvBitfieldUExtract(_501, 1u, 3u);
    uint _504 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _501, 0u, 1u);
    uint _505 = _498 + _502;
    uint _506 = _504 + _499;
    float _507 = float(_505);
    float _508 = float(_506);
    float _511 = float(_486._m0.x);
    float _512 = float(_486._m0.y);
    float _513 = (_507 + 0.5f) / _511;
    float _514 = (_508 + 0.5f) / _512;
    bool _517 = (_486._m0.x < _505) || (_486._m0.y < _506);
    bool _522 = cb3_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _522) && (gl_LocalInvocationID.y == 0u))
    {
        g1[0u] = t9.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    if (_501 < 36u)
    {
        bool _550 = _501 < 4u;
        bool _551 = _501 < 12u;
        bool _552 = _501 < 20u;
        bool _553 = _501 < 28u;
        uint _564 = _550 ? ((_501 >> 1u) * 9u) : (_551 ? 0u : (_552 ? 9u : (_553 ? (((_501 - 20u) & 7u) + 1u) : (((_501 - 28u) & 7u) + 1u))));
        uint _565 = _550 ? ((_501 & 1u) * 9u) : (_551 ? (((_501 - 4u) & 7u) + 1u) : (_552 ? (((_501 - 12u) & 7u) + 1u) : (_553 ? 0u : 9u)));
        float _566 = 1.0f / _511;
        float _567 = 1.0f / _512;
        float _586 = clamp((_566 * (float(int(_564 - 1u)) + 0.5f)) + (_566 * float(int(_498))), 0.0f, 1.0f);
        float _587 = clamp((_567 * float(int(_499))) + (_567 * (float(int(_565 - 1u)) + 0.5f)), 0.0f, 1.0f);
        float2 _590 = float2(_586, _587);
        float _595 = mad(t7.SampleLevel(s5, _590, 0.0f).x, 2.0f, -1.0f);
        float _610;
        if (_595 > 0.0f)
        {
            _610 = min(sqrt(_595), t1.Load(8u).x);
        }
        else
        {
            _610 = max(_595, -t1.Load(7u).x);
        }
        float4 _614 = t6.SampleLevel(s4, _590, 0.0f);
        float2 _624 = float2(_614.x * cb3_m2.z, _614.y * cb3_m2.w);
        bool _637 = (cb3_m9.x != 0.0f) && (cb3_m9.y != 0.0f);
        bool _641 = (cb3_m7.w != 0.0f) && (cb3_m8.x != 0.0f);
        float _653 = exp2(max(_637 ? clamp((sqrt(dp2_f32(_624, _624)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _641 ? clamp((abs(_610) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float _655 = _586 - 0.5f;
        float _656 = _587 - 0.5f;
        float2 _657 = float2(_655, _656);
        float _661 = mad(dp2_f32(_657, _657), cb3_m11.y, 1.0f);
        float _683 = mad(exp2(log2(clamp(cb3_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb3_m12.x, -0.089999973773956298828125f, 1.0f);
        float _684 = (_661 * mad(cb3_m12.x, mad(cb3_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), 1.0f)) * _683;
        float _685 = _683 * (_661 * mad(cb3_m12.x, mad(cb3_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), 1.0f));
        float _686 = _683 * (_661 * mad(cb3_m12.x, mad(cb3_m12.y, 0.0f, 0.04500000178813934326171875f), 1.0f));
        float _687 = mad(_655, _684, 0.5f);
        float _688 = mad(_684, _656, 0.5f);
        float _689 = mad(_655, _685, 0.5f);
        float _690 = mad(_685, _656, 0.5f);
        float2 _693 = float2(_687, _688);
        float4 _695 = t2.SampleLevel(s0, _693, 0.0f);
        float _696 = _695.x;
        bool _697 = _641 || _637;
        float _731;
        if (_697)
        {
            float4 _703 = t3.SampleLevel(s1, _693, 0.0f);
            float _704 = _703.x;
            float _712 = asfloat(cb0_m[43u].w) * 20.0f;
            float _728 = mad(mad(t10.SampleLevel(s7, float2(mad(_687, 30.0f, sin(_712)), mad(_688, 30.0f, cos(_712))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_704, max(_703.y, _703.z)), 1.0000000133514319600180897396058e-10f)), _704);
            _731 = mad(_653, _696 - _728, _728);
        }
        else
        {
            _731 = _696;
        }
        float2 _732 = float2(_689, _690);
        float4 _734 = t2.SampleLevel(s0, _732, 0.0f);
        float _735 = _734.y;
        float _768;
        if (_697)
        {
            float4 _741 = t3.SampleLevel(s1, _732, 0.0f);
            float _743 = _741.y;
            float _749 = asfloat(cb0_m[43u].w) * 20.0f;
            float _765 = mad(mad(t10.SampleLevel(s7, float2(mad(_689, 30.0f, sin(_749)), mad(_690, 30.0f, cos(_749))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_741.x, max(_743, _741.z)), 1.0000000133514319600180897396058e-10f)), _743);
            _768 = mad(_653, _735 - _765, _765);
        }
        else
        {
            _768 = _735;
        }
        float _769 = mad(_655, _686, 0.5f);
        float _770 = mad(_686, _656, 0.5f);
        float2 _771 = float2(_769, _770);
        float4 _773 = t2.SampleLevel(s0, _771, 0.0f);
        float _774 = _773.z;
        float _807;
        if (_697)
        {
            float4 _780 = t3.SampleLevel(s1, _771, 0.0f);
            float _783 = _780.z;
            float _788 = asfloat(cb0_m[43u].w) * 20.0f;
            float _804 = mad(mad(t10.SampleLevel(s7, float2(mad(_769, 30.0f, sin(_788)), mad(_770, 30.0f, cos(_788))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_780.x, max(_780.y, _783)), 1.0000000133514319600180897396058e-10f)), _783);
            _807 = mad(_653, _774 - _804, _804);
        }
        else
        {
            _807 = _774;
        }
        float _812 = _522 ? g1[0u] : cb3_m3.x;
        float4 _816 = t8.SampleLevel(s6, _590, 0.0f);
        float _817 = _816.x;
        float _825 = max(cb3_m3.w - dp3_f32(float3(_817, _816.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
        float _829 = mad(_731, _812, _817 / _825);
        float _830 = mad(_768, _812, _816.y / _825);
        float _831 = mad(_807, _812, _816.z / _825);
        float _835 = 1.0f / (max(_829, max(_830, _831)) + 1.0f);
        float _836 = _829 * _835;
        float _838 = _835 * _831;
        float3 _839 = float3(_836, _838, _835 * _830);
        uint _844 = (_565 * 12u) >> 2u;
        g0[_564][_844] = dp3_f32(_839, float3(0.25f, 0.25f, 0.5f));
        uint _847 = _844 + 1u;
        g0[_564][_847] = dp2_f32(float2(_836, _838), float2(0.5f, -0.5f));
        uint _850 = _844 + 2u;
        g0[_564][_850] = dp3_f32(_839, float3(-0.25f, -0.25f, 0.5f));
    }
    float2 _855 = float2(_513, _514);
    float _859 = mad(t7.SampleLevel(s5, _855, 0.0f).x, 2.0f, -1.0f);
    float _874;
    if (_859 > 0.0f)
    {
        _874 = min(sqrt(_859), t1.Load(8u).x);
    }
    else
    {
        _874 = max(_859, -t1.Load(7u).x);
    }
    float4 _878 = t6.SampleLevel(s4, _855, 0.0f);
    float _879 = _878.x;
    float _880 = _878.y;
    float2 _891 = float2(_879 * cb3_m2.z, _880 * cb3_m2.w);
    bool _903 = (cb3_m9.x != 0.0f) && (cb3_m9.y != 0.0f);
    bool _907 = (cb3_m7.w != 0.0f) && (cb3_m8.x != 0.0f);
    float _911 = abs(_874);
    float _919 = exp2(max(_903 ? clamp((sqrt(dp2_f32(_891, _891)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _907 ? clamp((_911 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _920 = _513 - 0.5f;
    float _921 = _514 - 0.5f;
    float2 _922 = float2(_920, _921);
    float _923 = dp2_f32(_922, _922);
    float _926 = mad(_923, cb3_m11.y, 1.0f);
    float _948 = mad(exp2(log2(clamp(cb3_m11.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb3_m12.x, -0.089999973773956298828125f, 1.0f);
    float _949 = (_926 * mad(mad(cb3_m12.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb3_m12.x, 1.0f)) * _948;
    float _950 = _948 * (_926 * mad(mad(cb3_m12.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb3_m12.x, 1.0f));
    float _951 = _948 * (_926 * mad(mad(cb3_m12.y, 0.0f, 0.04500000178813934326171875f), cb3_m12.x, 1.0f));
    float _952 = mad(_920, _949, 0.5f);
    float _953 = mad(_949, _921, 0.5f);
    float _954 = mad(_920, _950, 0.5f);
    float _955 = mad(_921, _950, 0.5f);
    float2 _958 = float2(_952, _953);
    float4 _960 = t2.SampleLevel(s0, _958, 0.0f);
    float _961 = _960.x;
    bool _962 = _907 || _903;
    float _995;
    if (_962)
    {
        float4 _968 = t3.SampleLevel(s1, _958, 0.0f);
        float _969 = _968.x;
        float _976 = asfloat(cb0_m[43u].w) * 20.0f;
        float _992 = mad(mad(t10.SampleLevel(s7, float2(mad(_952, 30.0f, sin(_976)), mad(_953, 30.0f, cos(_976))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_969, max(_968.y, _968.z)), 1.0000000133514319600180897396058e-10f)), _969);
        _995 = mad(_919, _961 - _992, _992);
    }
    else
    {
        _995 = _961;
    }
    float2 _996 = float2(_954, _955);
    float4 _998 = t2.SampleLevel(s0, _996, 0.0f);
    float _999 = _998.y;
    float _1032;
    if (_962)
    {
        float4 _1005 = t3.SampleLevel(s1, _996, 0.0f);
        float _1007 = _1005.y;
        float _1013 = asfloat(cb0_m[43u].w) * 20.0f;
        float _1029 = mad(mad(t10.SampleLevel(s7, float2(mad(_954, 30.0f, sin(_1013)), mad(_955, 30.0f, cos(_1013))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_1005.x, max(_1007, _1005.z)), 1.0000000133514319600180897396058e-10f)), _1007);
        _1032 = mad(_919, _999 - _1029, _1029);
    }
    else
    {
        _1032 = _999;
    }
    float _1033 = mad(_920, _951, 0.5f);
    float _1034 = mad(_921, _951, 0.5f);
    float2 _1035 = float2(_1033, _1034);
    float4 _1037 = t2.SampleLevel(s0, _1035, 0.0f);
    float _1038 = _1037.z;
    float _1071;
    if (_962)
    {
        float4 _1044 = t3.SampleLevel(s1, _1035, 0.0f);
        float _1047 = _1044.z;
        float _1052 = asfloat(cb0_m[43u].w) * 20.0f;
        float _1068 = mad(mad(t10.SampleLevel(s7, float2(mad(_1033, 30.0f, sin(_1052)), mad(_1034, 30.0f, cos(_1052))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_1044.x, max(_1044.y, _1047)), 1.0000000133514319600180897396058e-10f)), _1047);
        _1071 = mad(_919, _1038 - _1068, _1068);
    }
    else
    {
        _1071 = _1038;
    }
    float _1076 = _522 ? g1[0u] : cb3_m3.x;
    float4 _1080 = t8.SampleLevel(s6, _855, 0.0f);
    float _1081 = _1080.x;
    float _1089 = max(cb3_m3.w - dp3_f32(float3(_1081, _1080.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _1093 = mad(_995, _1076, _1081 / _1089);
    float _1094 = mad(_1032, _1076, _1080.y / _1089);
    float _1095 = mad(_1071, _1076, _1080.z / _1089);
    float _1099 = 1.0f / (max(_1093, max(_1095, _1094)) + 1.0f);
    float _1100 = _1093 * _1099;
    float _1102 = _1099 * _1095;
    float3 _1103 = float3(_1100, _1102, _1099 * _1094);
    float _1104 = dp3_f32(_1103, float3(0.25f, 0.25f, 0.5f));
    float _1105 = dp3_f32(_1103, float3(-0.25f, -0.25f, 0.5f));
    float _1107 = dp2_f32(float2(_1100, _1102), float2(0.5f, -0.5f));
    uint _1108 = _502 + 1u;
    uint _1109 = _502 + 2u;
    uint _1110 = _504 * 12u;
    uint _1113 = (_1110 + 12u) >> 2u;
    g0[_1108][_1113] = _1104;
    uint _1116 = _1113 + 1u;
    g0[_1108][_1116] = _1107;
    uint _1119 = _1113 + 2u;
    g0[_1108][_1119] = _1105;
    float2 _1122 = float2(_879 * cb3_m2.x, _880 * cb3_m2.y);
    float _1126 = min(sqrt(dp2_f32(_1122, _1122)) * 0.07500000298023223876953125f, 1.0f);
    float _1127 = _513 - _879;
    float _1128 = _514 - _880;
    float _1136 = (max(abs(mad(_1128, 2.0f, -1.0f)), abs(mad(_1127, 2.0f, -1.0f))) >= 1.0f) ? (-_1126) : _1126;
    float _1143 = floor(mad(_1127, cb3_m2.x, -0.5f));
    float _1144 = floor(mad(_1128, cb3_m2.y, -0.5f));
    float _1145 = _1143 + 0.5f;
    float _1146 = _1144 + 0.5f;
    float _1150 = mad(_1127, cb3_m2.x, -_1145);
    float _1152 = mad(_1128, cb3_m2.y, -_1146);
    float _1154 = mad(-_1127, cb3_m2.x, _1145);
    float _1156 = mad(-_1128, cb3_m2.y, _1146);
    float _1163 = mad(_1150, mad(_1154, 1.5f, 2.0f), 0.5f);
    float _1164 = mad(_1152, mad(_1156, 1.5f, 2.0f), 0.5f);
    float _1165 = _1150 * _1150;
    float _1166 = _1152 * _1152;
    float _1171 = _1165 * mad(_1150, 0.5f, -0.5f);
    float _1172 = mad(_1152, 0.5f, -0.5f) * _1166;
    float _1175 = _1150 * mad(_1150, mad(_1154, 0.5f, 1.0f), -0.5f);
    float _1176 = _1152 * mad(_1152, mad(_1156, 0.5f, 1.0f), -0.5f);
    float _1179 = mad(_1150, _1163, mad(_1165, mad(_1150, 1.5f, -2.5f), 1.0f));
    float _1180 = mad(_1152, _1164, mad(mad(_1152, 1.5f, -2.5f), _1166, 1.0f));
    float _1187 = (_1143 - 0.5f) / cb3_m2.x;
    float _1188 = (_1144 - 0.5f) / cb3_m2.y;
    float _1189 = (_1143 + 2.5f) / cb3_m2.x;
    float _1190 = (_1144 + 2.5f) / cb3_m2.y;
    float _1191 = (((_1152 * _1164) / _1180) + _1146) / cb3_m2.y;
    float _1192 = (_1145 + ((_1150 * _1163) / _1179)) / cb3_m2.x;
    float4 _1197 = t4.SampleLevel(s2, float2(_1187, _1188), 0.0f);
    float4 _1206 = t4.SampleLevel(s2, float2(_1189, _1188), 0.0f);
    float4 _1224 = t4.SampleLevel(s2, float2(_1192, _1188), 0.0f);
    float4 _1236 = t4.SampleLevel(s2, float2(_1187, _1191), 0.0f);
    float4 _1248 = t4.SampleLevel(s2, float2(_1192, _1191), 0.0f);
    float4 _1260 = t4.SampleLevel(s2, float2(_1189, _1191), 0.0f);
    float4 _1272 = t4.SampleLevel(s2, float2(_1187, _1190), 0.0f);
    float4 _1284 = t4.SampleLevel(s2, float2(_1192, _1190), 0.0f);
    float4 _1296 = t4.SampleLevel(s2, float2(_1189, _1190), 0.0f);
    float _1303 = mad(_1171 * _1296.x, _1172, mad(_1179 * _1284.x, _1172, mad(_1175 * _1272.x, _1172, mad(_1171 * _1260.x, _1180, mad(_1179 * _1248.x, _1180, mad(_1175 * _1236.x, _1180, mad(_1179 * _1224.x, _1176, ((_1171 * _1206.x) * _1176) + ((_1175 * _1197.x) * _1176))))))));
    float _1305 = mad(_1171 * _1296.z, _1172, mad(_1179 * _1284.z, _1172, mad(_1175 * _1272.z, _1172, mad(_1171 * _1260.z, _1180, mad(_1179 * _1248.z, _1180, mad(_1180, _1175 * _1236.z, mad(_1176, _1179 * _1224.z, ((_1175 * _1197.z) * _1176) + ((_1171 * _1206.z) * _1176))))))));
    float3 _1306 = float3(_1303, _1305, mad(_1171 * _1296.y, _1172, mad(_1179 * _1284.y, _1172, mad(_1175 * _1272.y, _1172, mad(_1171 * _1260.y, _1180, mad(_1179 * _1248.y, _1180, mad(_1180, _1175 * _1236.y, mad(_1176, _1179 * _1224.y, ((_1175 * _1197.y) * _1176) + (_1176 * (_1171 * _1206.y))))))))));
    float _1307 = dp3_f32(_1306, float3(0.25f, 0.25f, 0.5f));
    float _1308 = dp3_f32(_1306, float3(-0.25f, -0.25f, 0.5f));
    float _1310 = dp2_f32(float2(_1303, _1305), float2(0.5f, -0.5f));
    GroupMemoryBarrierWithGroupSync();
    uint _1311 = _1110 >> 2u;
    uint _1315 = _1311 + 1u;
    uint _1319 = _1311 + 2u;
    uint _1405 = (_1110 + 24u) >> 2u;
    uint _1409 = _1405 + 1u;
    uint _1413 = _1405 + 2u;
    float _1434 = min(min(min(min(_1104, g0[_1108][_1311]), g0[_502][_1113]), g0[_1109][_1113]), g0[_1108][_1405]);
    float _1435 = max(max(max(max(_1104, g0[_1108][_1311]), g0[_502][_1113]), g0[_1109][_1113]), g0[_1108][_1405]);
    float _1453 = (((((((_1104 + g0[_1108][_1311]) + g0[_502][_1311]) + g0[_502][_1113]) + g0[_1109][_1311]) + g0[_1109][_1113]) + g0[_502][_1405]) + g0[_1108][_1405]) + g0[_1109][_1405];
    float _1467 = _1453 * 0.111111111938953399658203125f;
    float _1468 = (g0[_1109][_1409] + (g0[_1108][_1409] + (g0[_502][_1409] + (g0[_1109][_1116] + (g0[_1109][_1315] + (g0[_502][_1116] + ((_1107 + g0[_1108][_1315]) + g0[_502][_1315]))))))) * 0.111111111938953399658203125f;
    float _1469 = (g0[_1109][_1413] + (g0[_1108][_1413] + (g0[_502][_1413] + (g0[_1109][_1119] + (g0[_1109][_1319] + (g0[_502][_1119] + ((_1105 + g0[_1108][_1319]) + g0[_502][_1319]))))))) * 0.111111111938953399658203125f;
    float _1482 = sqrt(max((mad(g0[_1109][_1405], g0[_1109][_1405], mad(g0[_1108][_1405], g0[_1108][_1405], mad(g0[_502][_1405], g0[_502][_1405], mad(g0[_1109][_1113], g0[_1109][_1113], mad(g0[_1109][_1311], g0[_1109][_1311], mad(g0[_502][_1113], g0[_502][_1113], mad(g0[_502][_1311], g0[_502][_1311], (g0[_1108][_1311] * g0[_1108][_1311]) + (_1104 * _1104)))))))) * 0.111111111938953399658203125f) - (_1467 * _1467), 1.0000000133514319600180897396058e-10f));
    float _1483 = sqrt(max((mad(g0[_1109][_1409], g0[_1109][_1409], mad(g0[_1108][_1409], g0[_1108][_1409], mad(g0[_502][_1409], g0[_502][_1409], mad(g0[_1109][_1116], g0[_1109][_1116], mad(g0[_1109][_1315], g0[_1109][_1315], mad(g0[_502][_1116], g0[_502][_1116], mad(g0[_502][_1315], g0[_502][_1315], (g0[_1108][_1315] * g0[_1108][_1315]) + (_1107 * _1107)))))))) * 0.111111111938953399658203125f) - (_1468 * _1468), 1.0000000133514319600180897396058e-10f));
    float _1484 = sqrt(max((mad(g0[_1109][_1413], g0[_1109][_1413], mad(g0[_1108][_1413], g0[_1108][_1413], mad(g0[_502][_1413], g0[_502][_1413], mad(g0[_1109][_1119], g0[_1109][_1119], mad(g0[_1109][_1319], g0[_1109][_1319], mad(g0[_502][_1119], g0[_502][_1119], mad(g0[_502][_1319], g0[_502][_1319], (_1105 * _1105) + (g0[_1108][_1319] * g0[_1108][_1319])))))))) * 0.111111111938953399658203125f) - (_1469 * _1469), 1.0000000133514319600180897396058e-10f));
    float _1488 = asfloat(cb0_m[46u].z);
    uint4 _1495 = t0.Load(int3(uint2(cvt_f32_u32(_507 / _1488), cvt_f32_u32(_508 / _1488)), 0u));
    uint _1496 = _1495.x;
    float _1500 = float(spvBitfieldUExtract(_1496, 2u, 2u) + (_1496 & 3u));
    float _1510 = mad(_1307 / max(mad(_1453, 0.111111111938953399658203125f, _1307), 1.0000000116860974230803549289703e-07f), 0.5f, 0.75f);
    float _1511 = mad(_1482 * _1500, 0.5f, _1482) * _1510;
    float _1512 = _1510 * mad(_1500 * _1483, 0.5f, _1483);
    float _1513 = _1510 * mad(_1500 * _1484, 0.5f, _1484);
    float _1517 = _1467 + _1511;
    float _1518 = _1512 + _1468;
    float _1519 = _1513 + _1469;
    float _1520 = (_1467 - _1511) + _1517;
    float _1521 = _1518 + (_1468 - _1512);
    float _1522 = _1519 + (_1469 - _1513);
    float _1532 = mad(_1520, -0.5f, _1307);
    float _1533 = mad(_1521, -0.5f, _1310);
    float _1534 = mad(_1522, -0.5f, _1308);
    float _1542 = max(max(abs(_1533 / mad((_1512 - _1468) + _1518, 0.5f, 9.9999997473787516355514526367188e-05f)), abs(_1532 / mad(_1517 + (_1511 - _1467), 0.5f, 9.9999997473787516355514526367188e-05f))), abs(_1534 / mad((_1513 - _1469) + _1519, 0.5f, 9.9999997473787516355514526367188e-05f)));
    bool _1543 = _1542 > 1.0f;
    float _1554 = mad(_1435, 0.5f, max(_1435 * 0.5f, max(max(max(max(_1104, g0[_502][_1311]), g0[_1109][_1311]), g0[_502][_1405]), g0[_1109][_1405]) * 0.5f)) - mad(_1434, 0.5f, min(_1434 * 0.5f, min(min(min(min(_1104, g0[_502][_1311]), g0[_1109][_1311]), g0[_502][_1405]), g0[_1109][_1405]) * 0.5f));
    uint2 _1564 = uint2(_505, _506);
    float4 _1565 = u2[_1564];
    float _1568 = max(mad(abs(_1136), 0.85000002384185791015625f, 0.100000001490116119384765625f) * ((min(_1307, _1554) / ((_1307 + _1554) + 1.0000000116860974230803549289703e-07f)) * (_1543 ? 0.85000002384185791015625f : 1.0f)), _1565.x * 0.75f);
    bool _1569 = _1136 < 0.0f;
    float _1570 = _1569 ? _1104 : (_1543 ? mad(_1520, 0.5f, _1532 / _1542) : _1307);
    float _1571 = _1569 ? _1107 : (_1543 ? mad(_1521, 0.5f, _1533 / _1542) : _1310);
    float _1572 = _1569 ? _1105 : (_1543 ? mad(_1522, 0.5f, _1534 / _1542) : _1308);
    float _1580 = clamp(mad(t5.SampleLevel(s3, _855, 0.0f).y, 1.0f - _1568, _1568), 0.0039215688593685626983642578125f, 0.949999988079071044921875f);
    float _1584 = mad(1.0f - _1580, cb3_m0.x, _1580);
    float _1588 = mad(_1584, _1104 - _1570, _1570);
    float _1589 = mad(_1584, _1107 - _1571, _1571);
    float _1590 = mad(_1584, _1105 - _1572, _1572);
    float _1591 = _1588 - _1590;
    float _1592 = _1591 + _1589;
    float _1593 = _1588 + _1590;
    float _1594 = _1591 - _1589;
    u1[_1564] = float4(_1592, _1593, _1594, 0.0f);
    u2[_1564] = _1584.xxxx;
    u3[_1564] = _1588.xxxx;
    bool _1600 = !_517;
    float _1970;
    float _1971;
    float _1972;
    if (_1600)
    {
        float _1604 = dp3_f32(float3(_1592, _1593, _1594), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1611 = mad(-_911, cb3_m8.y, 1.0f) * cb3_m7.x;
        float _1615 = mad(_1611, _1592 - _1604, _1604);
        float _1616 = mad(_1611, _1593 - _1604, _1604);
        float _1617 = mad(_1611, _1594 - _1604, _1604);
        float _1618 = _921 + _921;
        float _1619 = _920 + _920;
        float _1620 = abs(_1619);
        float _1621 = abs(_1618);
        float _1625 = min(_1620, _1621) * (1.0f / max(_1620, _1621));
        float _1626 = _1625 * _1625;
        float _1630 = mad(_1626, mad(_1626, mad(_1626, mad(_1626, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1639 = mad(_1625, _1630, (_1620 < _1621) ? mad(_1625 * _1630, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_1619) > _1619) ? (-3.1415927410125732421875f) : 0.0f);
        float _1640 = min(_1618, _1619);
        float _1641 = max(_1618, _1619);
        float _1648 = ((_1640 < (-_1640)) && (_1641 >= (-_1641))) ? (-_1639) : _1639;
        float4 _1652 = t11.SampleLevel(s8, _855, 0.0f);
        float _1653 = _1652.x;
        float _1654 = _1652.y;
        float _1655 = _1652.z;
        float _1656 = _1652.w;
        float _1661 = (_1616 - _1617) * 1.73205077648162841796875f;
        float _1663 = mad(_1615, 2.0f, -_1616);
        float _1664 = _1663 - _1617;
        float _1665 = abs(_1664);
        float _1666 = abs(_1661);
        float _1670 = min(_1665, _1666) * (1.0f / max(_1665, _1666));
        float _1671 = _1670 * _1670;
        float _1675 = mad(_1671, mad(_1671, mad(_1671, mad(_1671, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _1684 = mad(_1670, _1675, (_1665 < _1666) ? mad(_1670 * _1675, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1664 < (_1617 - _1663)) ? (-3.1415927410125732421875f) : 0.0f);
        float _1685 = min(_1661, _1664);
        float _1686 = max(_1661, _1664);
        float _1695 = ((_1615 == _1616) && (_1617 == _1616)) ? 0.0f : ((((_1685 < (-_1685)) && (_1686 >= (-_1686))) ? (-_1684) : _1684) * 57.295780181884765625f);
        float _1704 = mad(cb3_m14.x, -360.0f, (_1695 < 0.0f) ? (_1695 + 360.0f) : _1695);
        float _1714 = clamp(1.0f - (abs((_1704 < (-180.0f)) ? (_1704 + 360.0f) : ((_1704 > 180.0f) ? (_1704 - 360.0f) : _1704)) / (cb3_m14.y * 180.0f)), 0.0f, 1.0f);
        float _1719 = dp3_f32(float3(_1615, _1616, _1617), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1722 = (mad(_1714, -2.0f, 3.0f) * (_1714 * _1714)) * cb3_m14.z;
        float _1734 = mad(mad(_1722, _1615 - _1719, _1719) - _1615, cb3_m13.x, _1615);
        float _1735 = mad(mad(_1722, _1616 - _1719, _1719) - _1616, cb3_m13.x, _1616);
        float _1736 = mad(mad(_1722, _1617 - _1719, _1719) - _1617, cb3_m13.x, _1617);
        float _1738;
        _1738 = 0.0f;
        float _1739;
        uint _1742;
        uint _1741 = 0u;
        for (;;)
        {
            if (_1741 >= 8u)
            {
                break;
            }
            uint _1753 = min((_1741 & 3u), 10u);
            float _1773 = mad(float(_1741), 0.785398185253143310546875f, -_1648);
            float _1774 = _1773 + 1.57079637050628662109375f;
            _1739 = mad(_1656 * (dp4_f32(t12.Load((_1741 >> 2u) + 10u), float4(_377[_1753].x, _377[_1753].y, _377[_1753].z, _377[_1753].w)) * clamp((abs((_1774 > 3.1415927410125732421875f) ? (_1773 - 4.7123889923095703125f) : _1774) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _1738, _1738);
            _1742 = _1741 + 1u;
            _1738 = _1739;
            _1741 = _1742;
            continue;
        }
        float _1785 = clamp(_1738, 0.0f, 1.0f);
        float _1797 = asfloat(cb0_m[43u].w);
        float _1803 = abs(t12.Load(8u).x);
        float2 _1806 = float2(_920 * 1.40999996662139892578125f, _921 * 1.40999996662139892578125f);
        float _1808 = sqrt(dp2_f32(_1806, _1806));
        float _1809 = min(_1808, 1.0f);
        float _1810 = _1809 * _1809;
        float _1815 = clamp(_1808 - 0.5f, 0.0f, 1.0f);
        float _1818 = (_1809 * _1810) + (mad(-_1809, _1810, 1.0f) * (_1815 * _1815));
        float _1819 = mad(mad(mad(sin(_1797 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _1803, -1.0f);
        float _1821 = _1654 + _1819;
        float _1823 = clamp((_1655 + _1819) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _1830 = clamp(_1821 + _1821, 0.0f, 1.0f);
        float _1847 = dp3_f32(float3(t13.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _1853 = mad(sin(_1654 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_1847)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _1855 = _1853 * 0.02999999932944774627685546875f;
        float _1856 = mad(_1803, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _1860 = mad(mad(-_1818, _1818, 1.0f), 1.0f - _1856, _1856);
        float _1861 = min((exp2(log2(_1818) * 0.699999988079071044921875f) * (mad(_1830, -2.0f, 3.0f) * (_1830 * _1830))) + (mad(_1823, -2.0f, 3.0f) * (_1823 * _1823)), 1.0f);
        float _1871 = mad(_1861, mad(_1860, _1853 * 0.62000000476837158203125f, mad(_1734, _1785, -_1734)), mad(-_1734, _1785, _1734));
        float _1872 = mad(_1861, mad(_1860, _1855, mad(_1785, _1735, -_1735)), mad(-_1785, _1735, _1735));
        float _1873 = mad(_1861, mad(_1860, _1855, mad(_1785, _1736, -_1736)), mad(-_1785, _1736, _1736));
        float _1876 = mad(_1654, _1655 * (1.0f - _1656), _1656);
        float _1878;
        _1878 = 0.0f;
        float _1879;
        uint _1882;
        uint _1881 = 0u;
        for (;;)
        {
            if (int(_1881) >= 8)
            {
                break;
            }
            float4 _1889 = t12.Load(_1881);
            float _1891 = _1889.y;
            float _1893 = _1889.x - _1648;
            _1879 = mad(_1876 * (_1889.w * clamp((abs((_1893 > 3.1415927410125732421875f) ? (_1893 - 6.283185482025146484375f) : ((_1893 < (-3.1415927410125732421875f)) ? (_1893 + 6.283185482025146484375f) : _1893)) + (_1891 - 3.1415927410125732421875f)) / max(_1891 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _1878, _1878);
            _1882 = _1881 + 1u;
            _1878 = _1879;
            _1881 = _1882;
            continue;
        }
        float _1912 = clamp(_1878 + _1878, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1916 = mad(_1912, 0.310000002384185791015625f - _1871, _1871);
        float _1917 = mad(_1912, 0.014999999664723873138427734375f - _1872, _1872);
        float _1918 = mad(_1912, 0.014999999664723873138427734375f - _1873, _1873);
        float4 _1919 = t12.Load(12u);
        float _1920 = _1919.x;
        float _1948;
        float _1949;
        float _1950;
        if (_1920 != 0.0f)
        {
            float _1927 = clamp(_1847, 0.0f, 1.0f);
            float _1937 = clamp((_1653 + (_1920 - 1.0f)) / max(mad(_1920, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1941 = clamp(_1920 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1944 = mad(_1941, -2.0f, 3.0f) * (_1941 * _1941);
            _1948 = mad(_1944, _1937 * (_1927 * (_1653 * 0.930000007152557373046875f)), _1918);
            _1949 = mad(_1944, _1937 * (_1927 * (_1653 * 0.85000002384185791015625f)), _1917);
            _1950 = mad((_1927 * (_1653 * 0.790000021457672119140625f)) * _1937, _1944, _1916);
        }
        else
        {
            _1948 = _1918;
            _1949 = _1917;
            _1950 = _1916;
        }
        bool _1953 = cb3_m13.y > 0.0f;
        bool _1957 = frac((_514 * 420.0f) + (_1797 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1958 = _1957 ? 0.300000011920928955078125f : 0.0f;
        float _1959 = _1958 * cb3_m13.y;
        _1970 = _1953 ? mad(_1959, 0.0f - _1950, _1950) : _1950;
        _1971 = _1953 ? mad(_1959, (_1957 ? 0.100000001490116119384765625f : 0.0f) - _1949, _1949) : _1949;
        _1972 = _1953 ? mad(_1959, _1958 - _1948, _1948) : _1948;
    }
    else
    {
        _1970 = _1592;
        _1971 = _1593;
        _1972 = _1594;
    }
    float _1977 = 1.0f / max(1.0f - max(max(_1971, _1972), _1970), 6.099999882280826568603515625e-05f);
    float _1984 = min(-(_1977 * _1970), 0.0f);
    float _1985 = min(-(_1977 * _1971), 0.0f);
    float _1986 = min(-(_1977 * _1972), 0.0f);
    float _1996 = clamp(-((sqrt(_923) - cb3_m6.x) * (1.0f / cb3_m6.y)), 0.0f, 1.0f);
    float _1997 = mad(_1996, -2.0f, 3.0f);
    float _1998 = _1996 * _1996;
    float _1999 = _1997 * _1998;
    float _2001 = mad(-_1997, _1998, 1.0f);
    float _2024 = cb3_m6.z * cb3_m6.w;
    float3 _2037 = float3(_517 ? (-_1984) : mad(_1984 + ((_2001 * cb3_m4.x) - (_1984 * _1999)), _2024, -_1984), _517 ? (-_1985) : mad(_2024, ((_2001 * cb3_m4.y) - (_1999 * _1985)) + _1985, -_1985), _517 ? (-_1986) : mad(_2024, ((_2001 * cb3_m4.z) - (_1999 * _1986)) + _1986, -_1986));
    float _2038 = dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _2037);
    float _2039 = dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _2037);
    float _2040 = dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _2037);
    bool _2044 = cb2_m0.x != 0.0f;
    float _2061;
    float _2062;
    float _2063;
    if (!_2044)
    {
        _2061 = clamp(mad(cb2_m1.x, mad(cb2_m1.y, _2040, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _2062 = clamp(mad(cb2_m1.x, mad(cb2_m1.y, _2039, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _2063 = clamp(mad(cb2_m1.x, mad(cb2_m1.y, _2038, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _2061 = _2040;
        _2062 = _2039;
        _2063 = _2038;
    }
    float _2066 = mad(cb2_m0.y, -0.0005000000237487256526947021484375f, 0.312709987163543701171875f);
    float _2073 = mad(cb2_m0.z, 0.0005000000237487256526947021484375f, (_2066 * 2.86999988555908203125f) - (_2066 * (_2066 * 3.0f)));
    float _2074 = _2073 - 0.2750950753688812255859375f;
    float _2075 = _2066 / _2074;
    float _2079 = ((1.0f - _2066) + (0.2750950753688812255859375f - _2073)) / _2074;
    float3 _2089 = float3(_2063, _2062, _2061);
    float3 _2096 = float3((0.94923698902130126953125f / mad(_2079, -0.1624000072479248046875f, mad(_2075, 0.732800006866455078125f, 0.4296000003814697265625f))) * dp3_f32(float3(0.390404999256134033203125f, 0.549941003322601318359375f, 0.008926319889724254608154296875f), _2089), dp3_f32(float3(0.070841602981090545654296875f, 0.963172018527984619140625f, 0.001357750035822391510009765625f), _2089) * (1.035419940948486328125f / mad(_2079, 0.006099999882280826568603515625f, mad(_2075, -0.703599989414215087890625f, 1.6974999904632568359375f))), dp3_f32(float3(0.02310819923877716064453125f, 0.1280210018157958984375f, 0.936245024204254150390625f), _2089) * (1.0872800350189208984375f / mad(_2079, 0.98339998722076416015625f, mad(_2075, 0.0030000000260770320892333984375f, 0.013600000180304050445556640625f))));
    float3 _2106 = float3(dp3_f32(float3(2.85846996307373046875f, -1.62879002094268798828125f, -0.0248910002410411834716796875f), _2096), dp3_f32(float3(-0.21018199622631072998046875f, 1.1582000255584716796875f, 0.0003242809907533228397369384765625f), _2096), dp3_f32(float3(-0.0418119989335536956787109375f, -0.118169002234935760498046875f, 1.0686700344085693359375f), _2096));
    float _2108 = dp3_f32(_2106, float3(cb2_m1.w, cb2_m2));
    float _2116 = dp3_f32(_2106, float3(cb2_m3, cb2_m4));
    float _2119 = dp3_f32(_2106, cb2_m5);
    float _2121 = dp3_f32(float3(_2108, _2116, _2119), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _2130 = clamp((_2121 - cb2_m11) * (1.0f / (cb2_m12.x - cb2_m11)), 0.0f, 1.0f);
    float _2134 = mad(-mad(_2130, -2.0f, 3.0f), _2130 * _2130, 1.0f);
    float _2143 = clamp((_2121 - cb2_m12.y) * (1.0f / (cb2_m12.z - cb2_m12.y)), 0.0f, 1.0f);
    float _2144 = mad(_2143, -2.0f, 3.0f);
    float _2145 = _2143 * _2143;
    float _2146 = _2144 * _2145;
    float _2149 = 1.0f - clamp(mad(_2144, _2145, _2134), 0.0f, 1.0f);
    float _2174;
    float _2175;
    float _2176;
    if (_2044)
    {
        _2174 = cb2_m13.y + 1.0f;
        _2175 = cb2_m12.w + 1.0f;
        _2176 = cb2_m13.x + 1.0f;
    }
    else
    {
        _2174 = cb2_m13.y + mad(cb2_m13.x, 0.5f, mad(cb2_m12.w, 0.25f, 1.0f));
        _2175 = cb2_m12.w + 1.0f;
        _2176 = mad(cb2_m12.w, 0.5f, cb2_m13.x) + 1.0f;
    }
    float _2219 = mad(_2146 * (_2116 * cb2_m10.y), _2174, ((_2134 * (cb2_m6.y * _2116)) * _2175) + ((_2149 * (cb2_m8.y * _2116)) * _2176));
    float _2220 = mad(_2146 * (_2119 * cb2_m10.z), _2174, ((_2134 * (cb2_m6.z * _2119)) * _2175) + ((_2149 * (cb2_m8.z * _2119)) * _2176));
    float _2221 = mad(_2146 * (_2108 * cb2_m10.x), _2174, ((_2149 * (_2108 * cb2_m8.x)) * _2176) + ((_2134 * (_2108 * cb2_m6.x)) * _2175));
    float _2225 = float(_2219 >= _2220);
    float _2226 = mad(_2219 - _2220, _2225, _2220);
    float _2227 = mad(_2225, _2220 - _2219, _2219);
    float _2229 = mad(_2225, -1.0f, 0.666666686534881591796875f);
    float _2235 = float(_2226 <= _2221);
    float _2236 = mad(_2221 - _2226, _2235, _2226);
    float _2237 = mad(_2235, _2227 - _2227, _2227);
    float _2239 = mad(_2235, _2226 - _2221, _2221);
    float _2241 = _2236 - min(_2239, _2237);
    float _2247 = _2241 / (_2236 + 9.9999997473787516355514526367188e-05f);
    float _2251 = abs(((_2239 - _2237) / mad(_2241, 6.0f, 9.9999997473787516355514526367188e-05f)) + mad(_2235, mad(_2225, 1.0f, -1.0f) - _2229, _2229)) + cb2_m1.z;
    float _2257 = (_2251 < 0.0f) ? (_2251 + 1.0f) : ((_2251 > 1.0f) ? (_2251 - 1.0f) : _2251);
    float _2279 = mad(_2247, clamp(abs(mad(frac(_2257 + 1.0f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _2280 = mad(_2247, clamp(abs(mad(frac(_2257 + 0.666666686534881591796875f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _2281 = mad(_2247, clamp(abs(mad(frac(_2257 + 0.3333333432674407958984375f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _2286 = dp3_f32(float3(_2236 * _2279, _2236 * _2280, _2236 * _2281), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _2295 = mad(mad(_2236, _2279, -_2286), cb2_m0.w, _2286);
    float _2296 = mad(mad(_2236, _2280, -_2286), cb2_m0.w, _2286);
    float _2297 = mad(mad(_2236, _2281, -_2286), cb2_m0.w, _2286);
    float _2316;
    float _2317;
    float _2318;
    if (_2044)
    {
        _2316 = cb2_m1.y * clamp(mad(_2297 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f);
        _2317 = cb2_m1.y * clamp(mad(_2296 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f);
        _2318 = cb2_m1.y * clamp(mad(_2295 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _2316 = _2297;
        _2317 = _2296;
        _2318 = _2295;
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
         if (_1600) {
            float3 scene_color = float3(_2318, _2317, _2316);
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_1564] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _2322 = min(_2318 * 2.5f, 65504.0f);
    float _2323 = min(_2317 * 2.5f, 65504.0f);
    float _2324 = min(_2316 * 2.5f, 65504.0f);
    float _2328 = max(max(_2322, _2323), _2324);
    float _2333 = (max(_2328, 9.9999997473787516355514526367188e-05f) - max(min(min(_2322, _2323), _2324), 9.9999997473787516355514526367188e-05f)) / max(_2328, 0.00999999977648258209228515625f);
    float _2344 = mad(sqrt(mad(_2322, _2322 - _2324, ((_2324 - _2323) * _2324) + ((_2323 - _2322) * _2323))), 1.75f, _2322 + (_2324 + _2323));
    float _2345 = _2333 - 0.4000000059604644775390625f;
    float _2349 = max(1.0f - abs(_2345 * 2.5f), 0.0f);
    float _2357 = mad(mad(clamp(mad(_2345, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_2349, _2349, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _2365 = ((_2344 <= 0.1599999964237213134765625f) ? _2357 : ((_2344 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_2344 * 0.3333333432674407958984375f)) - 0.5f) * _2357))) + 1.0f;
    float _2366 = _2322 * _2365;
    float _2367 = _2365 * _2323;
    float _2368 = _2365 * _2324;
    float _2373 = (_2367 - _2368) * 1.73205077648162841796875f;
    float _2375 = (_2366 * 2.0f) - _2367;
    float _2377 = mad(-_2365, _2324, _2375);
    float _2378 = abs(_2377);
    float _2379 = abs(_2373);
    float _2383 = min(_2378, _2379) * (1.0f / max(_2378, _2379));
    float _2384 = _2383 * _2383;
    float _2388 = mad(_2384, mad(_2384, mad(_2384, mad(_2384, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _2398 = mad(_2383, _2388, (_2378 < _2379) ? mad(_2383 * _2388, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_2377 < mad(_2365, _2324, -_2375)) ? (-3.1415927410125732421875f) : 0.0f);
    float _2399 = min(_2373, _2377);
    float _2400 = max(_2373, _2377);
    float _2409 = ((_2366 == _2367) && (_2368 == _2367)) ? 0.0f : ((((_2399 < (-_2399)) && (_2400 >= (-_2400))) ? (-_2398) : _2398) * 57.295780181884765625f);
    float _2412 = (_2409 < 0.0f) ? (_2409 + 360.0f) : _2409;
    float _2422 = max(1.0f - abs(((_2412 < (-180.0f)) ? (_2412 + 360.0f) : ((_2412 > 180.0f) ? (_2412 - 360.0f) : _2412)) * 0.01481481455266475677490234375f), 0.0f);
    float _2425 = mad(_2422, -2.0f, 3.0f) * (_2422 * _2422);
    float3 _2436 = float3(clamp(_2366 + (((_2333 * (_2425 * _2425)) * mad(-_2322, _2365, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_2367, 0.0f, 65504.0f), clamp(_2368, 0.0f, 65504.0f));
    float _2440 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2436), 0.0f, 65504.0f);
    float _2441 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2436), 0.0f, 65504.0f);
    float _2442 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2436), 0.0f, 65504.0f);
    float _2444 = dp3_f32(float3(_2440, _2441, _2442), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _2448 = mad(_2440 - _2444, 0.959999978542327880859375f, _2444);
    float _2449 = mad(_2441 - _2444, 0.959999978542327880859375f, _2444);
    float _2450 = mad(_2442 - _2444, 0.959999978542327880859375f, _2444);
    float _2457 = (_2448 <= 0.0f) ? (-14.0f) : log2(_2448);
    float _2458 = (_2449 <= 0.0f) ? (-14.0f) : log2(_2449);
    float _2459 = (_2450 <= 0.0f) ? (-14.0f) : log2(_2450);
    float _2546;
    if (_2457 <= (-17.4739322662353515625f))
    {
        _2546 = -4.0f;
    }
    else
    {
        float _2545;
        if (_2457 < (-2.4739310741424560546875f))
        {
            float _2470 = mad(_2457, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2471 = _2470 * 0.6643855571746826171875f;
            int _2472 = cvt_f32_i32(_2471);
            float _2475 = mad(_2470, 0.6643855571746826171875f, -trunc(_2471));
            uint _2481 = min(uint(_2472 + 4), 10u);
            uint _2487 = min(uint((_2472 + 1) + 4), 10u);
            uint _2493 = min(uint((_2472 + 2) + 4), 10u);
            float2 _2499 = float2(_377[_2481].x, _377[_2487].x);
            _2545 = dp3_f32(float3(_2475 * _2475, _2475, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2481].x, _377[_2487].x, _377[_2493].x)), dp2_f32(float2(-1.0f, 1.0f), _2499), dp2_f32(0.5f.xx, _2499)));
        }
        else
        {
            float _2544;
            if (_2457 < 15.52606868743896484375f)
            {
                float _2509 = mad(_2457, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2510 = _2509 * 0.55365467071533203125f;
                int _2511 = cvt_f32_i32(_2510);
                float _2514 = mad(_2509, 0.55365467071533203125f, -trunc(_2510));
                uint _2520 = min(uint(_2511 + 4), 10u);
                uint _2526 = min(uint((_2511 + 1) + 4), 10u);
                uint _2532 = min(uint((_2511 + 2) + 4), 10u);
                float2 _2538 = float2(_377[_2520].y, _377[_2526].y);
                _2544 = dp3_f32(float3(_2514 * _2514, _2514, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2520].y, _377[_2526].y, _377[_2532].y)), dp2_f32(float2(-1.0f, 1.0f), _2538), dp2_f32(0.5f.xx, _2538)));
            }
            else
            {
                _2544 = 4.0f;
            }
            _2545 = _2544;
        }
        _2546 = _2545;
    }
    float _2632;
    if (_2458 <= (-17.4739322662353515625f))
    {
        _2632 = -4.0f;
    }
    else
    {
        float _2631;
        if (_2458 < (-2.4739310741424560546875f))
        {
            float _2556 = mad(_2458, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2557 = _2556 * 0.6643855571746826171875f;
            int _2558 = cvt_f32_i32(_2557);
            float _2561 = mad(_2556, 0.6643855571746826171875f, -trunc(_2557));
            uint _2567 = min(uint(_2558 + 4), 10u);
            uint _2573 = min(uint((_2558 + 1) + 4), 10u);
            uint _2579 = min(uint((_2558 + 2) + 4), 10u);
            float2 _2585 = float2(_377[_2567].x, _377[_2573].x);
            _2631 = dp3_f32(float3(_2561 * _2561, _2561, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2567].x, _377[_2573].x, _377[_2579].x)), dp2_f32(float2(-1.0f, 1.0f), _2585), dp2_f32(0.5f.xx, _2585)));
        }
        else
        {
            float _2630;
            if (_2458 < 15.52606868743896484375f)
            {
                float _2595 = mad(_2458, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2596 = _2595 * 0.55365467071533203125f;
                int _2597 = cvt_f32_i32(_2596);
                float _2600 = mad(_2595, 0.55365467071533203125f, -trunc(_2596));
                uint _2606 = min(uint(_2597 + 4), 10u);
                uint _2612 = min(uint((_2597 + 1) + 4), 10u);
                uint _2618 = min(uint((_2597 + 2) + 4), 10u);
                float2 _2624 = float2(_377[_2606].y, _377[_2612].y);
                _2630 = dp3_f32(float3(_2600 * _2600, _2600, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2606].y, _377[_2612].y, _377[_2618].y)), dp2_f32(float2(-1.0f, 1.0f), _2624), dp2_f32(0.5f.xx, _2624)));
            }
            else
            {
                _2630 = 4.0f;
            }
            _2631 = _2630;
        }
        _2632 = _2631;
    }
    float _2718;
    if (_2459 <= (-17.4739322662353515625f))
    {
        _2718 = -4.0f;
    }
    else
    {
        float _2717;
        if (_2459 < (-2.4739310741424560546875f))
        {
            float _2642 = mad(_2459, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _2643 = _2642 * 0.6643855571746826171875f;
            int _2644 = cvt_f32_i32(_2643);
            float _2647 = mad(_2642, 0.6643855571746826171875f, -trunc(_2643));
            uint _2653 = min(uint(_2644 + 4), 10u);
            uint _2659 = min(uint((_2644 + 1) + 4), 10u);
            uint _2665 = min(uint((_2644 + 2) + 4), 10u);
            float2 _2671 = float2(_377[_2653].x, _377[_2659].x);
            _2717 = dp3_f32(float3(_2647 * _2647, _2647, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2653].x, _377[_2659].x, _377[_2665].x)), dp2_f32(float2(-1.0f, 1.0f), _2671), dp2_f32(0.5f.xx, _2671)));
        }
        else
        {
            float _2716;
            if (_2459 < 15.52606868743896484375f)
            {
                float _2681 = mad(_2459, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _2682 = _2681 * 0.55365467071533203125f;
                int _2683 = cvt_f32_i32(_2682);
                float _2686 = mad(_2681, 0.55365467071533203125f, -trunc(_2682));
                uint _2692 = min(uint(_2683 + 4), 10u);
                uint _2698 = min(uint((_2683 + 1) + 4), 10u);
                uint _2704 = min(uint((_2683 + 2) + 4), 10u);
                float2 _2710 = float2(_377[_2692].y, _377[_2698].y);
                _2716 = dp3_f32(float3(_2686 * _2686, _2686, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_377[_2692].y, _377[_2698].y, _377[_2704].y)), dp2_f32(float2(-1.0f, 1.0f), _2710), dp2_f32(0.5f.xx, _2710)));
            }
            else
            {
                _2716 = 4.0f;
            }
            _2717 = _2716;
        }
        _2718 = _2717;
    }
    float3 _2721 = float3(exp2(_2546 * 3.3219280242919921875f), exp2(_2632 * 3.3219280242919921875f), exp2(_2718 * 3.3219280242919921875f));
    float3 _2725 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _2721), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _2721), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _2721));
    float _2726 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _2725);
    float _2727 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _2725);
    float _2728 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _2725);
    float _2732 = (_2726 <= 0.0f) ? (-4.0f) : (log2(_2726) * 0.3010300099849700927734375f);
    float _2736 = log2(cb1_m[19u].y);
    float _2737 = _2736 * 0.3010300099849700927734375f;
    float _2845;
    if (_2737 >= _2732)
    {
        _2845 = mad(cb1_m[21u].x, _2732, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2737 * cb1_m[21u].x));
    }
    else
    {
        float _2754 = log2(cb1_m[20u].x);
        float _2755 = _2754 * 0.3010300099849700927734375f;
        float _2844;
        if ((_2737 < _2732) && (_2755 > _2732))
        {
            float _2764 = (mad(_2736, -0.3010300099849700927734375f, _2732) * 7.0f) / (_2755 - _2737);
            int _2765 = cvt_f32_i32(_2764);
            float _2767 = _2764 - trunc(_2764);
            uint _2769 = uint(_2765 + 1);
            uint _2771 = uint(_2765 + 2);
            uint _2773 = uint(_2765);
            float2 _2785 = float2(cb1_m[_2773].x, cb1_m[_2769].x);
            _2844 = dp3_f32(float3(_2767 * _2767, _2767, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2773].x, cb1_m[_2769].x, cb1_m[_2771].x)), dp2_f32(float2(-1.0f, 1.0f), _2785), dp2_f32(0.5f.xx, _2785)));
        }
        else
        {
            float _2795 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2843;
            if ((_2755 <= _2732) && (_2795 > _2732))
            {
                float _2804 = (mad(_2754, -0.3010300099849700927734375f, _2732) * 7.0f) / (_2795 - _2755);
                int _2805 = cvt_f32_i32(_2804);
                float _2807 = _2804 - trunc(_2804);
                uint _2812 = uint(_2805 + 10);
                uint _2817 = uint((_2805 + 1) + 10);
                uint _2822 = uint((_2805 + 2) + 10);
                float2 _2828 = float2(cb1_m[_2812].x, cb1_m[_2817].x);
                _2843 = dp3_f32(float3(_2807 * _2807, _2807, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2812].x, cb1_m[_2817].x, cb1_m[_2822].x)), dp2_f32(float2(-1.0f, 1.0f), _2828), dp2_f32(0.5f.xx, _2828)));
            }
            else
            {
                _2843 = mad(cb1_m[21u].y, _2732, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2795 * cb1_m[21u].y));
            }
            _2844 = _2843;
        }
        _2845 = _2844;
    }
    float _2849 = (_2727 <= 0.0f) ? (-4.0f) : (log2(_2727) * 0.3010300099849700927734375f);
    float _2957;
    if (_2737 >= _2849)
    {
        _2957 = mad(cb1_m[21u].x, _2849, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2737 * cb1_m[21u].x));
    }
    else
    {
        float _2866 = log2(cb1_m[20u].x);
        float _2867 = _2866 * 0.3010300099849700927734375f;
        float _2956;
        if ((_2737 < _2849) && (_2867 > _2849))
        {
            float _2876 = (mad(_2736, -0.3010300099849700927734375f, _2849) * 7.0f) / (_2867 - _2737);
            int _2877 = cvt_f32_i32(_2876);
            float _2879 = _2876 - trunc(_2876);
            uint _2881 = uint(_2877 + 1);
            uint _2883 = uint(_2877 + 2);
            uint _2885 = uint(_2877);
            float2 _2897 = float2(cb1_m[_2885].x, cb1_m[_2881].x);
            _2956 = dp3_f32(float3(_2879 * _2879, _2879, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2885].x, cb1_m[_2881].x, cb1_m[_2883].x)), dp2_f32(float2(-1.0f, 1.0f), _2897), dp2_f32(0.5f.xx, _2897)));
        }
        else
        {
            float _2907 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2955;
            if ((_2867 <= _2849) && (_2907 > _2849))
            {
                float _2916 = (mad(_2866, -0.3010300099849700927734375f, _2849) * 7.0f) / (_2907 - _2867);
                int _2917 = cvt_f32_i32(_2916);
                float _2919 = _2916 - trunc(_2916);
                uint _2924 = uint(_2917 + 10);
                uint _2929 = uint((_2917 + 1) + 10);
                uint _2934 = uint((_2917 + 2) + 10);
                float2 _2940 = float2(cb1_m[_2924].x, cb1_m[_2929].x);
                _2955 = dp3_f32(float3(_2919 * _2919, _2919, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2924].x, cb1_m[_2929].x, cb1_m[_2934].x)), dp2_f32(float2(-1.0f, 1.0f), _2940), dp2_f32(0.5f.xx, _2940)));
            }
            else
            {
                _2955 = mad(cb1_m[21u].y, _2849, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2907 * cb1_m[21u].y));
            }
            _2956 = _2955;
        }
        _2957 = _2956;
    }
    float _2961 = (_2728 <= 0.0f) ? (-4.0f) : (log2(_2728) * 0.3010300099849700927734375f);
    float _3069;
    if (_2737 >= _2961)
    {
        _3069 = mad(cb1_m[21u].x, _2961, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_2737 * cb1_m[21u].x));
    }
    else
    {
        float _2978 = log2(cb1_m[20u].x);
        float _2979 = _2978 * 0.3010300099849700927734375f;
        float _3068;
        if ((_2737 < _2961) && (_2979 > _2961))
        {
            float _2988 = (mad(_2736, -0.3010300099849700927734375f, _2961) * 7.0f) / (_2979 - _2737);
            int _2989 = cvt_f32_i32(_2988);
            float _2991 = _2988 - trunc(_2988);
            uint _2993 = uint(_2989 + 1);
            uint _2995 = uint(_2989 + 2);
            uint _2997 = uint(_2989);
            float2 _3009 = float2(cb1_m[_2997].x, cb1_m[_2993].x);
            _3068 = dp3_f32(float3(_2991 * _2991, _2991, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2997].x, cb1_m[_2993].x, cb1_m[_2995].x)), dp2_f32(float2(-1.0f, 1.0f), _3009), dp2_f32(0.5f.xx, _3009)));
        }
        else
        {
            float _3019 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _3067;
            if ((_2979 <= _2961) && (_3019 > _2961))
            {
                float _3028 = (mad(_2978, -0.3010300099849700927734375f, _2961) * 7.0f) / (_3019 - _2979);
                int _3029 = cvt_f32_i32(_3028);
                float _3031 = _3028 - trunc(_3028);
                uint _3036 = uint(_3029 + 10);
                uint _3041 = uint((_3029 + 1) + 10);
                uint _3046 = uint((_3029 + 2) + 10);
                float2 _3052 = float2(cb1_m[_3036].x, cb1_m[_3041].x);
                _3067 = dp3_f32(float3(_3031 * _3031, _3031, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_3036].x, cb1_m[_3041].x, cb1_m[_3046].x)), dp2_f32(float2(-1.0f, 1.0f), _3052), dp2_f32(0.5f.xx, _3052)));
            }
            else
            {
                _3067 = mad(cb1_m[21u].y, _2961, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_3019 * cb1_m[21u].y));
            }
            _3068 = _3067;
        }
        _3069 = _3068;
    }
    if (_1600)
    {
        float3 _3081 = float3(exp2(_2845 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2957 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_3069 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _3085 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _3081), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _3081), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _3081));
        float3 _3089 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _3085), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _3085), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _3085));
        float _3098 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _3089) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _3109 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _3089) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _3119 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _3089) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_1564] = float4(min(exp2(log2(mad(_3098, 18.8515625f, 0.8359375f) / mad(_3098, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_3109, 18.8515625f, 0.8359375f) / mad(_3109, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_3119, 18.8515625f, 0.8359375f) / mad(_3119, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
