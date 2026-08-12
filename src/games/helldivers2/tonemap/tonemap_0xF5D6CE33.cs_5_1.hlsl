#include "../common.hlsl"

struct _441
{
    uint2 _m0;
    uint _m1;
};

static const float _62[1] = { 0.0f };
static const float4 _340[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    uint4 cb3_m12 : packoffset(c9);
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
    precise float _432 = a.x * b.x;
    return mad(a.y, b.y, _432);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _418 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _418));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _400 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _400)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _440_dummy_parameter;
    _441 _442 = { spvImageSize(u0, _440_dummy_parameter), 1u };
    uint _457 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _461 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_457, 1u, 3u);
    uint _462 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _457, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _469 = (float(_461) + 0.5f) / float(_442._m0.x);
    float _470 = (float(_462) + 0.5f) / float(_442._m0.y);
    bool _473 = (_442._m0.x < _461) || (_442._m0.y < _462);
    bool _478 = cb3_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _478) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _493 = float2(_469, _470);
    float _498 = mad(t4.SampleLevel(s3, _493, 0.0f).x, 2.0f, -1.0f);
    float _513;
    if (_498 > 0.0f)
    {
        _513 = min(sqrt(_498), t0.Load(8u).x);
    }
    else
    {
        _513 = max(_498, -t0.Load(7u).x);
    }
    bool _524 = (cb3_m10.x != 0.0f) && (cb3_m10.y != 0.0f);
    bool _528 = (cb3_m8.w != 0.0f) && (cb3_m9.x != 0.0f);
    float4 _532 = t1.SampleLevel(s0, _493, 0.0f);
    float _533 = _532.x;
    float _534 = _532.y;
    float _535 = _532.z;
    float _603;
    float _604;
    float _605;
    if (_528 || _524)
    {
        float4 _542 = t3.SampleLevel(s2, _493, 0.0f);
        float2 _551 = float2(_542.x * cb3_m2.x, _542.y * cb3_m2.y);
        float _565 = exp2(max(_524 ? clamp((sqrt(dp2_f32(_551, _551)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _528 ? clamp((abs(_513) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float4 _569 = t2.SampleLevel(s1, _493, 0.0f);
        float _570 = _569.x;
        float _571 = _569.y;
        float _572 = _569.z;
        float _578 = asfloat(cb0_m[43u].w) * 20.0f;
        float _589 = mad(t7.SampleLevel(s5, float2(mad(_469, 30.0f, sin(_578)), mad(_470, 30.0f, cos(_578))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
        float _593 = sqrt(max(max(_570, max(_571, _572)), 1.0000000133514319600180897396058e-10f));
        float _594 = mad(_589, _593, _570);
        float _595 = mad(_589, _593, _571);
        float _596 = mad(_589, _593, _572);
        _603 = mad(_565, _535 - _596, _596);
        _604 = mad(_565, _534 - _595, _595);
        _605 = mad(_565, _533 - _594, _594);
    }
    else
    {
        _603 = _535;
        _604 = _534;
        _605 = _533;
    }
    float _610 = _478 ? g0[0u] : cb3_m3.x;
    float4 _614 = t5.SampleLevel(s4, _493, 0.0f);
    float _615 = _614.x;
    float _623 = max(cb3_m4.y - dp3_f32(float3(_615, _614.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _627 = mad(_605, _610, _615 / _623);
    float _628 = mad(_604, _610, _614.y / _623);
    float _629 = mad(_603, _610, _614.z / _623);
    float _633 = 1.0f / (max(_627, max(_629, _628)) + 1.0f);
    float _634 = _627 * _633;
    float _636 = _633 * _629;
    float3 _637 = float3(_634, _636, _633 * _628);
    float _638 = dp3_f32(_637, float3(0.25f, 0.25f, 0.5f));
    float _639 = dp3_f32(_637, float3(-0.25f, -0.25f, 0.5f));
    float _641 = dp2_f32(float2(_634, _636), float2(0.5f, -0.5f));
    uint2 _643 = uint2(_461, _462);
    u1[_643] = _638.xxxx;
    float _645 = _638 - _639;
    float _646 = _641 + _645;
    float _647 = _638 + _639;
    float _648 = _645 - _641;
    bool _649 = !_473;
    float _1023;
    float _1024;
    float _1025;
    if (_649)
    {
        float _653 = dp3_f32(float3(_646, _647, _648), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _661 = mad(-cb3_m9.y, abs(_513), 1.0f) * cb3_m8.x;
        float _665 = mad(_661, _646 - _653, _653);
        float _666 = mad(_661, _647 - _653, _653);
        float _667 = mad(_661, _648 - _653, _653);
        float _668 = _469 - 0.5f;
        float _669 = _470 - 0.5f;
        float _670 = _669 + _669;
        float _671 = _668 + _668;
        float _672 = abs(_671);
        float _673 = abs(_670);
        float _677 = min(_672, _673) * (1.0f / max(_672, _673));
        float _678 = _677 * _677;
        float _682 = mad(_678, mad(_678, mad(_678, mad(_678, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _691 = mad(_677, _682, (_672 < _673) ? mad(_677 * _682, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_671) > _671) ? (-3.1415927410125732421875f) : 0.0f);
        float _692 = min(_670, _671);
        float _693 = max(_670, _671);
        float _700 = ((_692 < (-_692)) && (_693 >= (-_693))) ? (-_691) : _691;
        float4 _704 = t8.SampleLevel(s6, _493, 0.0f);
        float _705 = _704.x;
        float _706 = _704.y;
        float _707 = _704.z;
        float _708 = _704.w;
        float _713 = (_666 - _667) * 1.73205077648162841796875f;
        float _715 = mad(_665, 2.0f, -_666);
        float _716 = _715 - _667;
        float _717 = abs(_713);
        float _718 = abs(_716);
        float _722 = min(_717, _718) * (1.0f / max(_717, _718));
        float _723 = _722 * _722;
        float _727 = mad(_723, mad(_723, mad(_723, mad(_723, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _736 = mad(_722, _727, (_717 > _718) ? mad(_722 * _727, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_716 < (_667 - _715)) ? (-3.1415927410125732421875f) : 0.0f);
        float _737 = min(_713, _716);
        float _738 = max(_713, _716);
        float _747 = ((_665 == _666) && (_667 == _666)) ? 0.0f : ((((_737 < (-_737)) && (_738 >= (-_738))) ? (-_736) : _736) * 57.295780181884765625f);
        float _756 = mad(cb3_m14.x, -360.0f, (_747 < 0.0f) ? (_747 + 360.0f) : _747);
        float _766 = clamp(1.0f - (abs((_756 < (-180.0f)) ? (_756 + 360.0f) : ((_756 > 180.0f) ? (_756 - 360.0f) : _756)) / (cb3_m14.y * 180.0f)), 0.0f, 1.0f);
        float _771 = dp3_f32(float3(_665, _666, _667), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _774 = (mad(_766, -2.0f, 3.0f) * (_766 * _766)) * cb3_m14.z;
        float _786 = mad(mad(_774, _665 - _771, _771) - _665, cb3_m13.x, _665);
        float _787 = mad(mad(_774, _666 - _771, _771) - _666, cb3_m13.x, _666);
        float _788 = mad(mad(_774, _667 - _771, _771) - _667, cb3_m13.x, _667);
        float _790;
        _790 = 0.0f;
        float _791;
        uint _794;
        uint _793 = 0u;
        for (;;)
        {
            if (_793 >= 8u)
            {
                break;
            }
            uint _805 = min((_793 & 3u), 10u);
            float _825 = mad(float(_793), 0.785398185253143310546875f, -_700);
            float _826 = _825 + 1.57079637050628662109375f;
            _791 = mad(_708 * (dp4_f32(t9.Load((_793 >> 2u) + 10u), float4(_340[_805].x, _340[_805].y, _340[_805].z, _340[_805].w)) * clamp((abs((_826 > 3.1415927410125732421875f) ? (_825 - 4.7123889923095703125f) : _826) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _790, _790);
            _794 = _793 + 1u;
            _790 = _791;
            _793 = _794;
            continue;
        }
        float _837 = clamp(_790, 0.0f, 1.0f);
        float _850 = asfloat(cb0_m[43u].w);
        float _856 = abs(t9.Load(8u).x);
        float2 _859 = float2(_668 * 1.40999996662139892578125f, _669 * 1.40999996662139892578125f);
        float _861 = sqrt(dp2_f32(_859, _859));
        float _862 = min(_861, 1.0f);
        float _863 = _862 * _862;
        float _868 = clamp(_861 - 0.5f, 0.0f, 1.0f);
        float _871 = (_862 * _863) + (mad(-_862, _863, 1.0f) * (_868 * _868));
        float _872 = mad(mad(mad(sin(_850 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _856, -1.0f);
        float _874 = _706 + _872;
        float _876 = clamp((_707 + _872) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _883 = clamp(_874 + _874, 0.0f, 1.0f);
        float _900 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _906 = mad(sin(_706 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_900)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _908 = _906 * 0.02999999932944774627685546875f;
        float _909 = mad(_856, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _913 = mad(mad(-_871, _871, 1.0f), 1.0f - _909, _909);
        float _914 = min((exp2(log2(_871) * 0.699999988079071044921875f) * (mad(_883, -2.0f, 3.0f) * (_883 * _883))) + (mad(_876, -2.0f, 3.0f) * (_876 * _876)), 1.0f);
        float _924 = mad(_914, mad(_913, _906 * 0.62000000476837158203125f, mad(_786, _837, -_786)), mad(-_786, _837, _786));
        float _925 = mad(_914, mad(_913, _908, mad(_837, _787, -_787)), mad(-_837, _787, _787));
        float _926 = mad(_914, mad(_913, _908, mad(_837, _788, -_788)), mad(-_837, _788, _788));
        float _929 = mad(_706, _707 * (1.0f - _708), _708);
        float _931;
        _931 = 0.0f;
        float _932;
        uint _935;
        uint _934 = 0u;
        for (;;)
        {
            if (int(_934) >= 8)
            {
                break;
            }
            float4 _942 = t9.Load(_934);
            float _944 = _942.y;
            float _946 = _942.x - _700;
            _932 = mad(_929 * (_942.w * clamp((abs((_946 > 3.1415927410125732421875f) ? (_946 - 6.283185482025146484375f) : ((_946 < (-3.1415927410125732421875f)) ? (_946 + 6.283185482025146484375f) : _946)) + (_944 - 3.1415927410125732421875f)) / max(_944 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _931, _931);
            _935 = _934 + 1u;
            _931 = _932;
            _934 = _935;
            continue;
        }
        float _965 = clamp(_931 + _931, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _969 = mad(_965, 0.310000002384185791015625f - _924, _924);
        float _970 = mad(_965, 0.014999999664723873138427734375f - _925, _925);
        float _971 = mad(_965, 0.014999999664723873138427734375f - _926, _926);
        float4 _972 = t9.Load(12u);
        float _973 = _972.x;
        float _1001;
        float _1002;
        float _1003;
        if (_973 != 0.0f)
        {
            float _980 = clamp(_900, 0.0f, 1.0f);
            float _990 = clamp((_705 + (_973 - 1.0f)) / max(mad(_973, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _994 = clamp(_973 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _997 = mad(_994, -2.0f, 3.0f) * (_994 * _994);
            _1001 = mad((_980 * (_705 * 0.930000007152557373046875f)) * _990, _997, _971);
            _1002 = mad(_990 * (_980 * (_705 * 0.85000002384185791015625f)), _997, _970);
            _1003 = mad((_980 * (_705 * 0.790000021457672119140625f)) * _990, _997, _969);
        }
        else
        {
            _1001 = _971;
            _1002 = _970;
            _1003 = _969;
        }
        bool _1006 = cb3_m13.y > 0.0f;
        bool _1010 = frac((_470 * 420.0f) + (_850 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1011 = _1010 ? 0.300000011920928955078125f : 0.0f;
        float _1012 = _1011 * cb3_m13.y;
        _1023 = _1006 ? mad(_1012, 0.0f - _1003, _1003) : _1003;
        _1024 = _1006 ? mad((_1010 ? 0.100000001490116119384765625f : 0.0f) - _1002, _1012, _1002) : _1002;
        _1025 = _1006 ? mad(_1011 - _1001, _1012, _1001) : _1001;
    }
    else
    {
        _1023 = _646;
        _1024 = _647;
        _1025 = _648;
    }
    float _1030 = 1.0f / max(1.0f - max(max(_1024, _1025), _1023), 6.099999882280826568603515625e-05f);
    float _1037 = min(-(_1030 * _1023), 0.0f);
    float _1038 = min(-(_1030 * _1024), 0.0f);
    float _1039 = min(-(_1030 * _1025), 0.0f);
    float2 _1042 = float2(_469 - 0.5f, _470 - 0.5f);
    float _1053 = clamp(-((sqrt(dp2_f32(_1042, _1042)) - cb3_m7.x) * (1.0f / cb3_m7.y)), 0.0f, 1.0f);
    float _1054 = mad(_1053, -2.0f, 3.0f);
    float _1055 = _1053 * _1053;
    float _1056 = _1054 * _1055;
    float _1058 = mad(-_1054, _1055, 1.0f);
    float _1081 = cb3_m7.w * cb3_m7.z;
    float3 _1094 = float3(_473 ? (-_1037) : mad(_1037 + ((_1058 * cb3_m5.x) - (_1037 * _1056)), _1081, -_1037), _473 ? (-_1038) : mad(_1081, ((_1058 * cb3_m5.y) - (_1056 * _1038)) + _1038, -_1038), _473 ? (-_1039) : mad(_1081, ((_1058 * cb3_m5.z) - (_1056 * _1039)) + _1039, -_1039));
    float _1095 = dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1094);
    float _1096 = dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1094);
    float _1097 = dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1094);
    bool _1101 = cb2_m0.x != 0.0f;
    float _1118;
    float _1119;
    float _1120;
    if (!_1101)
    {
        _1118 = clamp(mad(cb2_m1.x, mad(_1097, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1119 = clamp(mad(cb2_m1.x, mad(_1096, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1120 = clamp(mad(cb2_m1.x, mad(_1095, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1118 = _1097;
        _1119 = _1096;
        _1120 = _1095;
    }
    float _1123 = mad(cb2_m0.y, -0.0005000000237487256526947021484375f, 0.312709987163543701171875f);
    float _1130 = mad(cb2_m0.z, 0.0005000000237487256526947021484375f, (_1123 * 2.86999988555908203125f) - ((_1123 * _1123) * 3.0f));
    float _1131 = _1130 - 0.2750950753688812255859375f;
    float _1132 = _1123 / _1131;
    float _1136 = ((1.0f - _1123) + (0.2750950753688812255859375f - _1130)) / _1131;
    float3 _1146 = float3(_1120, _1119, _1118);
    float3 _1153 = float3((0.94923698902130126953125f / mad(_1136, -0.1624000072479248046875f, mad(_1132, 0.732800006866455078125f, 0.4296000003814697265625f))) * dp3_f32(float3(0.390404999256134033203125f, 0.549941003322601318359375f, 0.008926319889724254608154296875f), _1146), dp3_f32(float3(0.070841602981090545654296875f, 0.963172018527984619140625f, 0.001357750035822391510009765625f), _1146) * (1.035419940948486328125f / mad(_1136, 0.006099999882280826568603515625f, mad(_1132, -0.703599989414215087890625f, 1.6974999904632568359375f))), dp3_f32(float3(0.02310819923877716064453125f, 0.1280210018157958984375f, 0.936245024204254150390625f), _1146) * (1.0872800350189208984375f / mad(_1136, 0.98339998722076416015625f, mad(_1132, 0.0030000000260770320892333984375f, 0.013600000180304050445556640625f))));
    float3 _1163 = float3(dp3_f32(float3(2.85846996307373046875f, -1.62879002094268798828125f, -0.0248910002410411834716796875f), _1153), dp3_f32(float3(-0.21018199622631072998046875f, 1.1582000255584716796875f, 0.0003242809907533228397369384765625f), _1153), dp3_f32(float3(-0.0418119989335536956787109375f, -0.118169002234935760498046875f, 1.0686700344085693359375f), _1153));
    float _1165 = dp3_f32(_1163, float3(cb2_m1.w, cb2_m2));
    float _1173 = dp3_f32(_1163, float3(cb2_m3, cb2_m4));
    float _1176 = dp3_f32(_1163, cb2_m5);
    float _1178 = dp3_f32(float3(_1165, _1173, _1176), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1187 = clamp((_1178 - cb2_m11) * (1.0f / (cb2_m12.x - cb2_m11)), 0.0f, 1.0f);
    float _1191 = mad(-mad(_1187, -2.0f, 3.0f), _1187 * _1187, 1.0f);
    float _1200 = clamp((_1178 - cb2_m12.y) * (1.0f / (cb2_m12.z - cb2_m12.y)), 0.0f, 1.0f);
    float _1201 = mad(_1200, -2.0f, 3.0f);
    float _1202 = _1200 * _1200;
    float _1203 = _1201 * _1202;
    float _1206 = 1.0f - clamp(mad(_1201, _1202, _1191), 0.0f, 1.0f);
    float _1231;
    float _1232;
    float _1233;
    if (_1101)
    {
        _1231 = cb2_m13.y + 1.0f;
        _1232 = cb2_m12.w + 1.0f;
        _1233 = cb2_m13.x + 1.0f;
    }
    else
    {
        _1231 = mad(cb2_m13.x, 0.5f, mad(cb2_m12.w, 0.25f, 1.0f)) + cb2_m13.y;
        _1232 = cb2_m12.w + 1.0f;
        _1233 = mad(cb2_m12.w, 0.5f, cb2_m13.x) + 1.0f;
    }
    float _1276 = mad(_1203 * (_1173 * cb2_m10.y), _1231, ((_1191 * (cb2_m6.y * _1173)) * _1232) + ((_1206 * (cb2_m8.y * _1173)) * _1233));
    float _1277 = mad(_1203 * (_1176 * cb2_m10.z), _1231, ((_1191 * (cb2_m6.z * _1176)) * _1232) + ((_1206 * (cb2_m8.z * _1176)) * _1233));
    float _1278 = mad(_1203 * (cb2_m10.x * _1165), _1231, ((_1206 * (cb2_m8.x * _1165)) * _1233) + ((_1191 * (cb2_m6.x * _1165)) * _1232));
    float _1282 = float(_1276 >= _1277);
    float _1283 = mad(_1276 - _1277, _1282, _1277);
    float _1284 = mad(_1282, _1277 - _1276, _1276);
    float _1286 = mad(_1282, -1.0f, 0.666666686534881591796875f);
    float _1292 = float(_1283 <= _1278);
    float _1293 = mad(_1278 - _1283, _1292, _1283);
    float _1294 = mad(_1292, _1284 - _1284, _1284);
    float _1296 = mad(_1292, _1283 - _1278, _1278);
    float _1298 = _1293 - min(_1296, _1294);
    float _1304 = _1298 / (_1293 + 9.9999997473787516355514526367188e-05f);
    float _1308 = cb2_m1.z + abs(((_1296 - _1294) / mad(_1298, 6.0f, 9.9999997473787516355514526367188e-05f)) + mad(_1292, mad(_1282, 1.0f, -1.0f) - _1286, _1286));
    float _1314 = (_1308 < 0.0f) ? (_1308 + 1.0f) : ((_1308 > 1.0f) ? (_1308 - 1.0f) : _1308);
    float _1336 = mad(_1304, clamp(abs(mad(frac(_1314 + 1.0f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1337 = mad(_1304, clamp(abs(mad(frac(_1314 + 0.666666686534881591796875f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1338 = mad(_1304, clamp(abs(mad(frac(_1314 + 0.3333333432674407958984375f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1343 = dp3_f32(float3(_1293 * _1336, _1293 * _1337, _1293 * _1338), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1352 = mad(cb2_m0.w, mad(_1293, _1336, -_1343), _1343);
    float _1353 = mad(cb2_m0.w, mad(_1293, _1337, -_1343), _1343);
    float _1354 = mad(cb2_m0.w, mad(_1293, _1338, -_1343), _1343);
    float _1373;
    float _1374;
    float _1375;
    if (_1101)
    {
        _1373 = clamp(mad(_1354 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
        _1374 = clamp(mad(_1353 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
        _1375 = clamp(mad(_1352 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
    }
    else
    {
        _1373 = _1354;
        _1374 = _1353;
        _1375 = _1352;
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
         if (_649) {
            float3 scene_color = mul(renodx::color::XYZ_TO_BT709_MAT, mul(renodx::color::D60_TO_D65_MAT, mul(renodx::color::AP0_TO_XYZ_MAT, float3(_1375, _1374, _1373))));
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_643] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1379 = min(_1375 * 2.5f, 65504.0f);
    float _1380 = min(_1374 * 2.5f, 65504.0f);
    float _1381 = min(_1373 * 2.5f, 65504.0f);
    float _1385 = max(max(_1379, _1380), _1381);
    float _1390 = (max(_1385, 9.9999997473787516355514526367188e-05f) - max(min(min(_1379, _1380), _1381), 9.9999997473787516355514526367188e-05f)) / max(_1385, 0.00999999977648258209228515625f);
    float _1401 = mad(sqrt(mad(_1379, _1379 - _1381, ((_1381 - _1380) * _1381) + ((_1380 - _1379) * _1380))), 1.75f, _1379 + (_1381 + _1380));
    float _1402 = _1390 - 0.4000000059604644775390625f;
    float _1406 = max(1.0f - abs(_1402 * 2.5f), 0.0f);
    float _1414 = mad(mad(clamp(mad(_1402, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1406, _1406, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1422 = ((_1401 <= 0.1599999964237213134765625f) ? _1414 : ((_1401 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1401 * 0.3333333432674407958984375f)) - 0.5f) * _1414))) + 1.0f;
    float _1423 = _1379 * _1422;
    float _1424 = _1422 * _1380;
    float _1425 = _1422 * _1381;
    float _1430 = (_1424 - _1425) * 1.73205077648162841796875f;
    float _1432 = (_1423 * 2.0f) - _1424;
    float _1434 = mad(-_1422, _1381, _1432);
    float _1435 = abs(_1434);
    float _1436 = abs(_1430);
    float _1440 = min(_1435, _1436) * (1.0f / max(_1435, _1436));
    float _1441 = _1440 * _1440;
    float _1445 = mad(_1441, mad(_1441, mad(_1441, mad(_1441, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1455 = mad(_1440, _1445, (_1435 < _1436) ? mad(_1440 * _1445, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1434 < mad(_1422, _1381, -_1432)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1456 = min(_1430, _1434);
    float _1457 = max(_1430, _1434);
    float _1466 = ((_1423 == _1424) && (_1425 == _1424)) ? 0.0f : ((((_1456 < (-_1456)) && (_1457 >= (-_1457))) ? (-_1455) : _1455) * 57.295780181884765625f);
    float _1469 = (_1466 < 0.0f) ? (_1466 + 360.0f) : _1466;
    float _1479 = max(1.0f - abs(((_1469 < (-180.0f)) ? (_1469 + 360.0f) : ((_1469 > 180.0f) ? (_1469 - 360.0f) : _1469)) * 0.01481481455266475677490234375f), 0.0f);
    float _1482 = mad(_1479, -2.0f, 3.0f) * (_1479 * _1479);
    float3 _1493 = float3(clamp(_1423 + (((_1390 * (_1482 * _1482)) * mad(-_1379, _1422, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1424, 0.0f, 65504.0f), clamp(_1425, 0.0f, 65504.0f));
    float _1497 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1493), 0.0f, 65504.0f);
    float _1498 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1493), 0.0f, 65504.0f);
    float _1499 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1493), 0.0f, 65504.0f);
    float _1501 = dp3_f32(float3(_1497, _1498, _1499), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1505 = mad(_1497 - _1501, 0.959999978542327880859375f, _1501);
    float _1506 = mad(_1498 - _1501, 0.959999978542327880859375f, _1501);
    float _1507 = mad(_1499 - _1501, 0.959999978542327880859375f, _1501);
    float _1514 = (_1505 <= 0.0f) ? (-14.0f) : log2(_1505);
    float _1515 = (_1506 <= 0.0f) ? (-14.0f) : log2(_1506);
    float _1516 = (_1507 <= 0.0f) ? (-14.0f) : log2(_1507);
    float _1603;
    if (_1514 <= (-17.4739322662353515625f))
    {
        _1603 = -4.0f;
    }
    else
    {
        float _1602;
        if (_1514 < (-2.4739310741424560546875f))
        {
            float _1527 = mad(_1514, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1528 = _1527 * 0.6643855571746826171875f;
            int _1529 = cvt_f32_i32(_1528);
            float _1532 = mad(_1527, 0.6643855571746826171875f, -trunc(_1528));
            uint _1538 = min(uint(_1529 + 4), 10u);
            uint _1544 = min(uint((_1529 + 1) + 4), 10u);
            uint _1550 = min(uint((_1529 + 2) + 4), 10u);
            float2 _1556 = float2(_340[_1538].x, _340[_1544].x);
            _1602 = dp3_f32(float3(_1532 * _1532, _1532, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1538].x, _340[_1544].x, _340[_1550].x)), dp2_f32(float2(-1.0f, 1.0f), _1556), dp2_f32(0.5f.xx, _1556)));
        }
        else
        {
            float _1601;
            if (_1514 < 15.52606868743896484375f)
            {
                float _1566 = mad(_1514, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1567 = _1566 * 0.55365467071533203125f;
                int _1568 = cvt_f32_i32(_1567);
                float _1571 = mad(_1566, 0.55365467071533203125f, -trunc(_1567));
                uint _1577 = min(uint(_1568 + 4), 10u);
                uint _1583 = min(uint((_1568 + 1) + 4), 10u);
                uint _1589 = min(uint((_1568 + 2) + 4), 10u);
                float2 _1595 = float2(_340[_1577].y, _340[_1583].y);
                _1601 = dp3_f32(float3(_1571 * _1571, _1571, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1577].y, _340[_1583].y, _340[_1589].y)), dp2_f32(float2(-1.0f, 1.0f), _1595), dp2_f32(0.5f.xx, _1595)));
            }
            else
            {
                _1601 = 4.0f;
            }
            _1602 = _1601;
        }
        _1603 = _1602;
    }
    float _1689;
    if (_1515 <= (-17.4739322662353515625f))
    {
        _1689 = -4.0f;
    }
    else
    {
        float _1688;
        if (_1515 < (-2.4739310741424560546875f))
        {
            float _1613 = mad(_1515, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1614 = _1613 * 0.6643855571746826171875f;
            int _1615 = cvt_f32_i32(_1614);
            float _1618 = mad(_1613, 0.6643855571746826171875f, -trunc(_1614));
            uint _1624 = min(uint(_1615 + 4), 10u);
            uint _1630 = min(uint((_1615 + 1) + 4), 10u);
            uint _1636 = min(uint((_1615 + 2) + 4), 10u);
            float2 _1642 = float2(_340[_1624].x, _340[_1630].x);
            _1688 = dp3_f32(float3(_1618 * _1618, _1618, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1624].x, _340[_1630].x, _340[_1636].x)), dp2_f32(float2(-1.0f, 1.0f), _1642), dp2_f32(0.5f.xx, _1642)));
        }
        else
        {
            float _1687;
            if (_1515 < 15.52606868743896484375f)
            {
                float _1652 = mad(_1515, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1653 = _1652 * 0.55365467071533203125f;
                int _1654 = cvt_f32_i32(_1653);
                float _1657 = mad(_1652, 0.55365467071533203125f, -trunc(_1653));
                uint _1663 = min(uint(_1654 + 4), 10u);
                uint _1669 = min(uint((_1654 + 1) + 4), 10u);
                uint _1675 = min(uint((_1654 + 2) + 4), 10u);
                float2 _1681 = float2(_340[_1663].y, _340[_1669].y);
                _1687 = dp3_f32(float3(_1657 * _1657, _1657, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1663].y, _340[_1669].y, _340[_1675].y)), dp2_f32(float2(-1.0f, 1.0f), _1681), dp2_f32(0.5f.xx, _1681)));
            }
            else
            {
                _1687 = 4.0f;
            }
            _1688 = _1687;
        }
        _1689 = _1688;
    }
    float _1775;
    if (_1516 <= (-17.4739322662353515625f))
    {
        _1775 = -4.0f;
    }
    else
    {
        float _1774;
        if (_1516 < (-2.4739310741424560546875f))
        {
            float _1699 = mad(_1516, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1700 = _1699 * 0.6643855571746826171875f;
            int _1701 = cvt_f32_i32(_1700);
            float _1704 = mad(_1699, 0.6643855571746826171875f, -trunc(_1700));
            uint _1710 = min(uint(_1701 + 4), 10u);
            uint _1716 = min(uint((_1701 + 1) + 4), 10u);
            uint _1722 = min(uint((_1701 + 2) + 4), 10u);
            float2 _1728 = float2(_340[_1710].x, _340[_1716].x);
            _1774 = dp3_f32(float3(_1704 * _1704, _1704, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1710].x, _340[_1716].x, _340[_1722].x)), dp2_f32(float2(-1.0f, 1.0f), _1728), dp2_f32(0.5f.xx, _1728)));
        }
        else
        {
            float _1773;
            if (_1516 < 15.52606868743896484375f)
            {
                float _1738 = mad(_1516, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1739 = _1738 * 0.55365467071533203125f;
                int _1740 = cvt_f32_i32(_1739);
                float _1743 = mad(_1738, 0.55365467071533203125f, -trunc(_1739));
                uint _1749 = min(uint(_1740 + 4), 10u);
                uint _1755 = min(uint((_1740 + 1) + 4), 10u);
                uint _1761 = min(uint((_1740 + 2) + 4), 10u);
                float2 _1767 = float2(_340[_1749].y, _340[_1755].y);
                _1773 = dp3_f32(float3(_1743 * _1743, _1743, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_340[_1749].y, _340[_1755].y, _340[_1761].y)), dp2_f32(float2(-1.0f, 1.0f), _1767), dp2_f32(0.5f.xx, _1767)));
            }
            else
            {
                _1773 = 4.0f;
            }
            _1774 = _1773;
        }
        _1775 = _1774;
    }
    float3 _1778 = float3(exp2(_1603 * 3.3219280242919921875f), exp2(_1689 * 3.3219280242919921875f), exp2(_1775 * 3.3219280242919921875f));
    float3 _1782 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1778), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1778), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1778));
    float _1783 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1782);
    float _1784 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1782);
    float _1785 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1782);
    float _1789 = (_1783 <= 0.0f) ? (-4.0f) : (log2(_1783) * 0.3010300099849700927734375f);
    float _1793 = log2(cb1_m[19u].y);
    float _1794 = _1793 * 0.3010300099849700927734375f;
    float _1902;
    if (_1794 >= _1789)
    {
        _1902 = mad(cb1_m[21u].x, _1789, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1794 * cb1_m[21u].x));
    }
    else
    {
        float _1811 = log2(cb1_m[20u].x);
        float _1812 = _1811 * 0.3010300099849700927734375f;
        float _1901;
        if ((_1794 < _1789) && (_1812 > _1789))
        {
            float _1821 = (mad(_1793, -0.3010300099849700927734375f, _1789) * 7.0f) / (_1812 - _1794);
            int _1822 = cvt_f32_i32(_1821);
            float _1824 = _1821 - trunc(_1821);
            uint _1826 = uint(_1822 + 1);
            uint _1828 = uint(_1822 + 2);
            uint _1830 = uint(_1822);
            float2 _1842 = float2(cb1_m[_1830].x, cb1_m[_1826].x);
            _1901 = dp3_f32(float3(_1824 * _1824, _1824, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1830].x, cb1_m[_1826].x, cb1_m[_1828].x)), dp2_f32(float2(-1.0f, 1.0f), _1842), dp2_f32(0.5f.xx, _1842)));
        }
        else
        {
            float _1852 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1900;
            if ((_1812 <= _1789) && (_1852 > _1789))
            {
                float _1861 = (mad(_1811, -0.3010300099849700927734375f, _1789) * 7.0f) / (_1852 - _1812);
                int _1862 = cvt_f32_i32(_1861);
                float _1864 = _1861 - trunc(_1861);
                uint _1869 = uint(_1862 + 10);
                uint _1874 = uint((_1862 + 1) + 10);
                uint _1879 = uint((_1862 + 2) + 10);
                float2 _1885 = float2(cb1_m[_1869].x, cb1_m[_1874].x);
                _1900 = dp3_f32(float3(_1864 * _1864, _1864, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1869].x, cb1_m[_1874].x, cb1_m[_1879].x)), dp2_f32(float2(-1.0f, 1.0f), _1885), dp2_f32(0.5f.xx, _1885)));
            }
            else
            {
                _1900 = mad(cb1_m[21u].y, _1789, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1852 * cb1_m[21u].y));
            }
            _1901 = _1900;
        }
        _1902 = _1901;
    }
    float _1906 = (_1784 <= 0.0f) ? (-4.0f) : (log2(_1784) * 0.3010300099849700927734375f);
    float _2014;
    if (_1794 >= _1906)
    {
        _2014 = mad(cb1_m[21u].x, _1906, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1794 * cb1_m[21u].x));
    }
    else
    {
        float _1923 = log2(cb1_m[20u].x);
        float _1924 = _1923 * 0.3010300099849700927734375f;
        float _2013;
        if ((_1794 < _1906) && (_1924 > _1906))
        {
            float _1933 = (mad(_1793, -0.3010300099849700927734375f, _1906) * 7.0f) / (_1924 - _1794);
            int _1934 = cvt_f32_i32(_1933);
            float _1936 = _1933 - trunc(_1933);
            uint _1938 = uint(_1934 + 1);
            uint _1940 = uint(_1934 + 2);
            uint _1942 = uint(_1934);
            float2 _1954 = float2(cb1_m[_1942].x, cb1_m[_1938].x);
            _2013 = dp3_f32(float3(_1936 * _1936, _1936, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1942].x, cb1_m[_1938].x, cb1_m[_1940].x)), dp2_f32(float2(-1.0f, 1.0f), _1954), dp2_f32(0.5f.xx, _1954)));
        }
        else
        {
            float _1964 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2012;
            if ((_1924 <= _1906) && (_1964 > _1906))
            {
                float _1973 = (mad(_1923, -0.3010300099849700927734375f, _1906) * 7.0f) / (_1964 - _1924);
                int _1974 = cvt_f32_i32(_1973);
                float _1976 = _1973 - trunc(_1973);
                uint _1981 = uint(_1974 + 10);
                uint _1986 = uint((_1974 + 1) + 10);
                uint _1991 = uint((_1974 + 2) + 10);
                float2 _1997 = float2(cb1_m[_1981].x, cb1_m[_1986].x);
                _2012 = dp3_f32(float3(_1976 * _1976, _1976, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1981].x, cb1_m[_1986].x, cb1_m[_1991].x)), dp2_f32(float2(-1.0f, 1.0f), _1997), dp2_f32(0.5f.xx, _1997)));
            }
            else
            {
                _2012 = mad(cb1_m[21u].y, _1906, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1964 * cb1_m[21u].y));
            }
            _2013 = _2012;
        }
        _2014 = _2013;
    }
    float _2018 = (_1785 <= 0.0f) ? (-4.0f) : (log2(_1785) * 0.3010300099849700927734375f);
    float _2126;
    if (_1794 >= _2018)
    {
        _2126 = mad(cb1_m[21u].x, _2018, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1794 * cb1_m[21u].x));
    }
    else
    {
        float _2035 = log2(cb1_m[20u].x);
        float _2036 = _2035 * 0.3010300099849700927734375f;
        float _2125;
        if ((_1794 < _2018) && (_2036 > _2018))
        {
            float _2045 = (mad(_1793, -0.3010300099849700927734375f, _2018) * 7.0f) / (_2036 - _1794);
            int _2046 = cvt_f32_i32(_2045);
            float _2048 = _2045 - trunc(_2045);
            uint _2050 = uint(_2046 + 1);
            uint _2052 = uint(_2046 + 2);
            uint _2054 = uint(_2046);
            float2 _2066 = float2(cb1_m[_2054].x, cb1_m[_2050].x);
            _2125 = dp3_f32(float3(_2048 * _2048, _2048, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2054].x, cb1_m[_2050].x, cb1_m[_2052].x)), dp2_f32(float2(-1.0f, 1.0f), _2066), dp2_f32(0.5f.xx, _2066)));
        }
        else
        {
            float _2076 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2124;
            if ((_2036 <= _2018) && (_2076 > _2018))
            {
                float _2085 = (mad(_2035, -0.3010300099849700927734375f, _2018) * 7.0f) / (_2076 - _2036);
                int _2086 = cvt_f32_i32(_2085);
                float _2088 = _2085 - trunc(_2085);
                uint _2093 = uint(_2086 + 10);
                uint _2098 = uint((_2086 + 1) + 10);
                uint _2103 = uint((_2086 + 2) + 10);
                float2 _2109 = float2(cb1_m[_2093].x, cb1_m[_2098].x);
                _2124 = dp3_f32(float3(_2088 * _2088, _2088, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2093].x, cb1_m[_2098].x, cb1_m[_2103].x)), dp2_f32(float2(-1.0f, 1.0f), _2109), dp2_f32(0.5f.xx, _2109)));
            }
            else
            {
                _2124 = mad(cb1_m[21u].y, _2018, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2076 * cb1_m[21u].y));
            }
            _2125 = _2124;
        }
        _2126 = _2125;
    }
    if (_649)
    {
        float3 _2138 = float3(exp2(_1902 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2014 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2126 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2142 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2138), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2138), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2138));
        float3 _2146 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2142), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2142), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2142));
        float _2155 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2146) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2166 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2146) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2176 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2146) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_643] = float4(min(exp2(log2(mad(_2155, 18.8515625f, 0.8359375f) / mad(_2155, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2166, 18.8515625f, 0.8359375f) / mad(_2166, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2176, 18.8515625f, 0.8359375f) / mad(_2176, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
