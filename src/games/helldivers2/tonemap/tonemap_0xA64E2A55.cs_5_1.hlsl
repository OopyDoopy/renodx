#include "../common.hlsl"

struct _388
{
    uint2 _m0;
    uint _m1;
};

static const float _58[1] = { 0.0f };
static const float4 _290[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    float2 cb2_m12 : packoffset(c9);
    float2 cb2_m13 : packoffset(c9.z);
    float4 cb2_m14 : packoffset(c10);
    float4 cb2_m15 : packoffset(c11);
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
    precise float _379 = a.x * b.x;
    return mad(a.y, b.y, _379);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _365 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _365));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _347 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _347)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _387_dummy_parameter;
    _388 _389 = { spvImageSize(u0, _387_dummy_parameter), 1u };
    uint _404 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _408 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_404, 1u, 3u);
    uint _409 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _404, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _416 = (float(_408) + 0.5f) / float(_389._m0.x);
    float _417 = (float(_409) + 0.5f) / float(_389._m0.y);
    bool _420 = (_389._m0.x < _408) || (_389._m0.y < _409);
    bool _425 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _425) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _440 = float2(_416, _417);
    float _445 = mad(t4.SampleLevel(s3, _440, 0.0f).x, 2.0f, -1.0f);
    float _460;
    if (_445 > 0.0f)
    {
        _460 = min(sqrt(_445), t0.Load(8u).x);
    }
    else
    {
        _460 = max(_445, -t0.Load(7u).x);
    }
    float4 _464 = t3.SampleLevel(s2, _440, 0.0f);
    float2 _474 = float2(_464.x * cb2_m2.x, _464.y * cb2_m2.y);
    bool _486 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
    bool _490 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
    float _494 = abs(_460);
    float _502 = exp2(max(_486 ? clamp((sqrt(dp2_f32(_474, _474)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _490 ? clamp((_494 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _503 = _416 - 0.5f;
    float _504 = _417 - 0.5f;
    float2 _505 = float2(_503, _504);
    float _506 = dp2_f32(_505, _505);
    float _509 = mad(_506, cb2_m12.y, 1.0f);
    float _531 = mad(exp2(log2(clamp(cb2_m12.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m13.x, -0.089999973773956298828125f, 1.0f);
    float _532 = (_509 * mad(mad(cb2_m13.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), cb2_m13.x, 1.0f)) * _531;
    float _533 = _531 * (_509 * mad(mad(cb2_m13.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m13.x, 1.0f));
    float _534 = _531 * (_509 * mad(cb2_m13.x, mad(cb2_m13.y, 0.0f, 0.04500000178813934326171875f), 1.0f));
    float _535 = mad(_503, _532, 0.5f);
    float _536 = mad(_532, _504, 0.5f);
    float _537 = mad(_503, _533, 0.5f);
    float _538 = mad(_533, _504, 0.5f);
    float2 _541 = float2(_535, _536);
    float4 _543 = t1.SampleLevel(s0, _541, 0.0f);
    float _544 = _543.x;
    bool _545 = _490 || _486;
    float _579;
    if (_545)
    {
        float4 _551 = t2.SampleLevel(s1, _541, 0.0f);
        float _552 = _551.x;
        float _560 = asfloat(cb0_m[43u].w) * 20.0f;
        float _576 = mad(mad(t7.SampleLevel(s5, float2(mad(_535, 30.0f, sin(_560)), mad(_536, 30.0f, cos(_560))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_552, max(_551.y, _551.z)), 1.0000000133514319600180897396058e-10f)), _552);
        _579 = mad(_502, _544 - _576, _576);
    }
    else
    {
        _579 = _544;
    }
    float2 _580 = float2(_537, _538);
    float4 _582 = t1.SampleLevel(s0, _580, 0.0f);
    float _583 = _582.y;
    float _616;
    if (_545)
    {
        float4 _589 = t2.SampleLevel(s1, _580, 0.0f);
        float _591 = _589.y;
        float _597 = asfloat(cb0_m[43u].w) * 20.0f;
        float _613 = mad(mad(t7.SampleLevel(s5, float2(mad(_537, 30.0f, sin(_597)), mad(_538, 30.0f, cos(_597))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_589.x, max(_591, _589.z)), 1.0000000133514319600180897396058e-10f)), _591);
        _616 = mad(_502, _583 - _613, _613);
    }
    else
    {
        _616 = _583;
    }
    float _617 = mad(_503, _534, 0.5f);
    float _618 = mad(_534, _504, 0.5f);
    float2 _619 = float2(_617, _618);
    float4 _621 = t1.SampleLevel(s0, _619, 0.0f);
    float _622 = _621.z;
    float _655;
    if (_545)
    {
        float4 _628 = t2.SampleLevel(s1, _619, 0.0f);
        float _631 = _628.z;
        float _636 = asfloat(cb0_m[43u].w) * 20.0f;
        float _652 = mad(mad(t7.SampleLevel(s5, float2(mad(_617, 30.0f, sin(_636)), mad(_618, 30.0f, cos(_636))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_628.x, max(_628.y, _631)), 1.0000000133514319600180897396058e-10f)), _631);
        _655 = mad(_502, _622 - _652, _652);
    }
    else
    {
        _655 = _622;
    }
    float _660 = _425 ? g0[0u] : cb2_m3.x;
    float4 _664 = t5.SampleLevel(s4, _440, 0.0f);
    float _665 = _664.x;
    float _673 = max(cb2_m4.y - dp3_f32(float3(_665, _664.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _677 = mad(_660, _579, _665 / _673);
    float _678 = mad(_660, _616, _664.y / _673);
    float _679 = mad(_660, _655, _664.z / _673);
    float _683 = 1.0f / (max(_677, max(_679, _678)) + 1.0f);
    float _684 = _677 * _683;
    float _686 = _683 * _679;
    float3 _687 = float3(_684, _686, _683 * _678);
    float _688 = dp3_f32(_687, float3(0.25f, 0.25f, 0.5f));
    float _689 = dp3_f32(_687, float3(-0.25f, -0.25f, 0.5f));
    float _691 = dp2_f32(float2(_684, _686), float2(0.5f, -0.5f));
    uint2 _693 = uint2(_408, _409);
    u1[_693] = _688.xxxx;
    float _695 = _688 - _689;
    float _696 = _691 + _695;
    float _697 = _688 + _689;
    float _698 = _695 - _691;
    bool _699 = !_420;
    float _1070;
    float _1071;
    float _1072;
    if (_699)
    {
        float _703 = dp3_f32(float3(_696, _697, _698), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _710 = mad(-_494, cb2_m9.y, 1.0f) * cb2_m8.x;
        float _714 = mad(_710, _696 - _703, _703);
        float _715 = mad(_710, _697 - _703, _703);
        float _716 = mad(_710, _698 - _703, _703);
        float _717 = _504 + _504;
        float _718 = _503 + _503;
        float _719 = abs(_718);
        float _720 = abs(_717);
        float _724 = min(_719, _720) * (1.0f / max(_719, _720));
        float _725 = _724 * _724;
        float _729 = mad(_725, mad(_725, mad(_725, mad(_725, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _738 = mad(_724, _729, (_719 < _720) ? mad(_724 * _729, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_718) > _718) ? (-3.1415927410125732421875f) : 0.0f);
        float _739 = min(_717, _718);
        float _740 = max(_717, _718);
        float _747 = ((_739 < (-_739)) && (_740 >= (-_740))) ? (-_738) : _738;
        float4 _751 = t8.SampleLevel(s6, _440, 0.0f);
        float _752 = _751.x;
        float _753 = _751.y;
        float _754 = _751.z;
        float _755 = _751.w;
        float _760 = (_715 - _716) * 1.73205077648162841796875f;
        float _762 = mad(_714, 2.0f, -_715);
        float _763 = _762 - _716;
        float _764 = abs(_760);
        float _765 = abs(_763);
        float _769 = min(_764, _765) * (1.0f / max(_764, _765));
        float _770 = _769 * _769;
        float _774 = mad(_770, mad(_770, mad(_770, mad(_770, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _783 = mad(_769, _774, (_764 > _765) ? mad(_769 * _774, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_763 < (_716 - _762)) ? (-3.1415927410125732421875f) : 0.0f);
        float _784 = min(_760, _763);
        float _785 = max(_760, _763);
        float _794 = ((_714 == _715) && (_716 == _715)) ? 0.0f : ((((_784 < (-_784)) && (_785 >= (-_785))) ? (-_783) : _783) * 57.295780181884765625f);
        float _803 = mad(cb2_m15.x, -360.0f, (_794 < 0.0f) ? (_794 + 360.0f) : _794);
        float _813 = clamp(1.0f - (abs((_803 < (-180.0f)) ? (_803 + 360.0f) : ((_803 > 180.0f) ? (_803 - 360.0f) : _803)) / (cb2_m15.y * 180.0f)), 0.0f, 1.0f);
        float _818 = dp3_f32(float3(_714, _715, _716), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _821 = (mad(_813, -2.0f, 3.0f) * (_813 * _813)) * cb2_m15.z;
        float _833 = mad(mad(_821, _714 - _818, _818) - _714, cb2_m14.x, _714);
        float _834 = mad(cb2_m14.x, mad(_821, _715 - _818, _818) - _715, _715);
        float _835 = mad(cb2_m14.x, mad(_821, _716 - _818, _818) - _716, _716);
        float _837;
        _837 = 0.0f;
        float _838;
        uint _841;
        uint _840 = 0u;
        for (;;)
        {
            if (_840 >= 8u)
            {
                break;
            }
            uint _852 = min((_840 & 3u), 10u);
            float _872 = mad(float(_840), 0.785398185253143310546875f, -_747);
            float _873 = _872 + 1.57079637050628662109375f;
            _838 = mad(_755 * (dp4_f32(t9.Load((_840 >> 2u) + 10u), float4(_290[_852].x, _290[_852].y, _290[_852].z, _290[_852].w)) * clamp((abs((_873 > 3.1415927410125732421875f) ? (_872 - 4.7123889923095703125f) : _873) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _837, _837);
            _841 = _840 + 1u;
            _837 = _838;
            _840 = _841;
            continue;
        }
        float _884 = clamp(_837, 0.0f, 1.0f);
        float _897 = asfloat(cb0_m[43u].w);
        float _903 = abs(t9.Load(8u).x);
        float2 _906 = float2(_503 * 1.40999996662139892578125f, _504 * 1.40999996662139892578125f);
        float _908 = sqrt(dp2_f32(_906, _906));
        float _909 = min(_908, 1.0f);
        float _910 = _909 * _909;
        float _915 = clamp(_908 - 0.5f, 0.0f, 1.0f);
        float _918 = (_909 * _910) + (mad(-_909, _910, 1.0f) * (_915 * _915));
        float _919 = mad(mad(mad(sin(_897 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _903, -1.0f);
        float _921 = _753 + _919;
        float _923 = clamp((_754 + _919) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _930 = clamp(_921 + _921, 0.0f, 1.0f);
        float _947 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _953 = mad(sin(_753 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_947)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _955 = _953 * 0.02999999932944774627685546875f;
        float _956 = mad(_903, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _960 = mad(mad(-_918, _918, 1.0f), 1.0f - _956, _956);
        float _961 = min((exp2(log2(_918) * 0.699999988079071044921875f) * (mad(_930, -2.0f, 3.0f) * (_930 * _930))) + (mad(_923, -2.0f, 3.0f) * (_923 * _923)), 1.0f);
        float _971 = mad(_961, mad(_960, _953 * 0.62000000476837158203125f, mad(_833, _884, -_833)), mad(-_833, _884, _833));
        float _972 = mad(_961, mad(_960, _955, mad(_884, _834, -_834)), mad(-_884, _834, _834));
        float _973 = mad(_961, mad(_960, _955, mad(_884, _835, -_835)), mad(-_884, _835, _835));
        float _976 = mad(_753, _754 * (1.0f - _755), _755);
        float _978;
        _978 = 0.0f;
        float _979;
        uint _982;
        uint _981 = 0u;
        for (;;)
        {
            if (int(_981) >= 8)
            {
                break;
            }
            float4 _989 = t9.Load(_981);
            float _991 = _989.y;
            float _993 = _989.x - _747;
            _979 = mad(_976 * (_989.w * clamp((abs((_993 > 3.1415927410125732421875f) ? (_993 - 6.283185482025146484375f) : ((_993 < (-3.1415927410125732421875f)) ? (_993 + 6.283185482025146484375f) : _993)) + (_991 - 3.1415927410125732421875f)) / max(_991 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _978, _978);
            _982 = _981 + 1u;
            _978 = _979;
            _981 = _982;
            continue;
        }
        float _1012 = clamp(_978 + _978, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1016 = mad(_1012, 0.310000002384185791015625f - _971, _971);
        float _1017 = mad(_1012, 0.014999999664723873138427734375f - _972, _972);
        float _1018 = mad(_1012, 0.014999999664723873138427734375f - _973, _973);
        float4 _1019 = t9.Load(12u);
        float _1020 = _1019.x;
        float _1048;
        float _1049;
        float _1050;
        if (_1020 != 0.0f)
        {
            float _1027 = clamp(_947, 0.0f, 1.0f);
            float _1037 = clamp((_752 + (_1020 - 1.0f)) / max(mad(_1020, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1041 = clamp(_1020 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1044 = mad(_1041, -2.0f, 3.0f) * (_1041 * _1041);
            _1048 = mad(((_752 * 0.930000007152557373046875f) * _1027) * _1037, _1044, _1018);
            _1049 = mad((_1027 * (_752 * 0.85000002384185791015625f)) * _1037, _1044, _1017);
            _1050 = mad((_1027 * (_752 * 0.790000021457672119140625f)) * _1037, _1044, _1016);
        }
        else
        {
            _1048 = _1018;
            _1049 = _1017;
            _1050 = _1016;
        }
        bool _1053 = cb2_m14.y > 0.0f;
        bool _1057 = frac((_417 * 420.0f) + (_897 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1058 = _1057 ? 0.300000011920928955078125f : 0.0f;
        float _1059 = _1058 * cb2_m14.y;
        _1070 = _1053 ? mad(_1059, 0.0f - _1050, _1050) : _1050;
        _1071 = _1053 ? mad((_1057 ? 0.100000001490116119384765625f : 0.0f) - _1049, _1059, _1049) : _1049;
        _1072 = _1053 ? mad(_1058 - _1048, _1059, _1048) : _1048;
    }
    else
    {
        _1070 = _696;
        _1071 = _697;
        _1072 = _698;
    }
    float _1077 = 1.0f / max(1.0f - max(max(_1071, _1072), _1070), 6.099999882280826568603515625e-05f);
    float _1084 = min(-(_1077 * _1070), 0.0f);
    float _1085 = min(-(_1077 * _1071), 0.0f);
    float _1086 = min(-(_1077 * _1072), 0.0f);
    float _1096 = clamp(-((sqrt(_506) - cb2_m7.x) * (1.0f / cb2_m7.y)), 0.0f, 1.0f);
    float _1097 = mad(_1096, -2.0f, 3.0f);
    float _1098 = _1096 * _1096;
    float _1099 = _1097 * _1098;
    float _1101 = mad(-_1097, _1098, 1.0f);
    float _1124 = cb2_m7.z * cb2_m7.w;
    float3 _1137 = float3(_420 ? (-_1084) : mad(_1084 + ((_1101 * cb2_m5.x) - (_1084 * _1099)), _1124, -_1084), _420 ? (-_1085) : mad(_1124, ((_1101 * cb2_m5.y) - (_1099 * _1085)) + _1085, -_1085), _420 ? (-_1086) : mad(_1124, ((_1101 * cb2_m5.z) - (_1099 * _1086)) + _1086, -_1086));
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
         if (_699) {
            float3 scene_color = _1137;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_693] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1144 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1137) * 2.5f, 65504.0f);
    float _1145 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1137) * 2.5f, 65504.0f);
    float _1146 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1137) * 2.5f, 65504.0f);
    float _1150 = max(max(_1145, _1144), _1146);
    float _1155 = (max(_1150, 9.9999997473787516355514526367188e-05f) - max(min(min(_1145, _1144), _1146), 9.9999997473787516355514526367188e-05f)) / max(_1150, 0.00999999977648258209228515625f);
    float _1166 = mad(sqrt(mad(_1144 - _1146, _1144, ((_1146 - _1145) * _1146) + ((_1145 - _1144) * _1145))), 1.75f, (_1146 + _1145) + _1144);
    float _1167 = _1155 - 0.4000000059604644775390625f;
    float _1171 = max(1.0f - abs(_1167 * 2.5f), 0.0f);
    float _1179 = mad(mad(clamp(mad(_1167, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1171, _1171, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1187 = ((_1166 <= 0.1599999964237213134765625f) ? _1179 : ((_1166 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1166 * 0.3333333432674407958984375f)) - 0.5f) * _1179))) + 1.0f;
    float _1188 = _1187 * _1144;
    float _1189 = _1187 * _1145;
    float _1190 = _1187 * _1146;
    float _1195 = (_1189 - _1190) * 1.73205077648162841796875f;
    float _1197 = (_1188 * 2.0f) - _1189;
    float _1199 = mad(-_1187, _1146, _1197);
    float _1200 = abs(_1199);
    float _1201 = abs(_1195);
    float _1205 = min(_1200, _1201) * (1.0f / max(_1200, _1201));
    float _1206 = _1205 * _1205;
    float _1210 = mad(_1206, mad(_1206, mad(_1206, mad(_1206, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1220 = mad(_1205, _1210, (_1200 < _1201) ? mad(_1205 * _1210, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1199 < mad(_1187, _1146, -_1197)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1221 = min(_1195, _1199);
    float _1222 = max(_1195, _1199);
    float _1231 = ((_1188 == _1189) && (_1190 == _1189)) ? 0.0f : ((((_1221 < (-_1221)) && (_1222 >= (-_1222))) ? (-_1220) : _1220) * 57.295780181884765625f);
    float _1234 = (_1231 < 0.0f) ? (_1231 + 360.0f) : _1231;
    float _1244 = max(1.0f - abs(((_1234 < (-180.0f)) ? (_1234 + 360.0f) : ((_1234 > 180.0f) ? (_1234 - 360.0f) : _1234)) * 0.01481481455266475677490234375f), 0.0f);
    float _1247 = mad(_1244, -2.0f, 3.0f) * (_1244 * _1244);
    float3 _1258 = float3(clamp(_1188 + (((_1155 * (_1247 * _1247)) * mad(-_1187, _1144, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1189, 0.0f, 65504.0f), clamp(_1190, 0.0f, 65504.0f));
    float _1262 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1258), 0.0f, 65504.0f);
    float _1263 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1258), 0.0f, 65504.0f);
    float _1264 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1258), 0.0f, 65504.0f);
    float _1266 = dp3_f32(float3(_1262, _1263, _1264), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1270 = mad(_1262 - _1266, 0.959999978542327880859375f, _1266);
    float _1271 = mad(_1263 - _1266, 0.959999978542327880859375f, _1266);
    float _1272 = mad(_1264 - _1266, 0.959999978542327880859375f, _1266);
    float _1279 = (_1270 <= 0.0f) ? (-14.0f) : log2(_1270);
    float _1280 = (_1271 <= 0.0f) ? (-14.0f) : log2(_1271);
    float _1281 = (_1272 <= 0.0f) ? (-14.0f) : log2(_1272);
    float _1368;
    if (_1279 <= (-17.4739322662353515625f))
    {
        _1368 = -4.0f;
    }
    else
    {
        float _1367;
        if (_1279 < (-2.4739310741424560546875f))
        {
            float _1292 = mad(_1279, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1293 = _1292 * 0.6643855571746826171875f;
            int _1294 = cvt_f32_i32(_1293);
            float _1297 = mad(_1292, 0.6643855571746826171875f, -trunc(_1293));
            uint _1303 = min(uint(_1294 + 4), 10u);
            uint _1309 = min(uint((_1294 + 1) + 4), 10u);
            uint _1315 = min(uint((_1294 + 2) + 4), 10u);
            float2 _1321 = float2(_290[_1303].x, _290[_1309].x);
            _1367 = dp3_f32(float3(_1297 * _1297, _1297, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1303].x, _290[_1309].x, _290[_1315].x)), dp2_f32(float2(-1.0f, 1.0f), _1321), dp2_f32(0.5f.xx, _1321)));
        }
        else
        {
            float _1366;
            if (_1279 < 15.52606868743896484375f)
            {
                float _1331 = mad(_1279, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1332 = _1331 * 0.55365467071533203125f;
                int _1333 = cvt_f32_i32(_1332);
                float _1336 = mad(_1331, 0.55365467071533203125f, -trunc(_1332));
                uint _1342 = min(uint(_1333 + 4), 10u);
                uint _1348 = min(uint((_1333 + 1) + 4), 10u);
                uint _1354 = min(uint((_1333 + 2) + 4), 10u);
                float2 _1360 = float2(_290[_1342].y, _290[_1348].y);
                _1366 = dp3_f32(float3(_1336 * _1336, _1336, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1342].y, _290[_1348].y, _290[_1354].y)), dp2_f32(float2(-1.0f, 1.0f), _1360), dp2_f32(0.5f.xx, _1360)));
            }
            else
            {
                _1366 = 4.0f;
            }
            _1367 = _1366;
        }
        _1368 = _1367;
    }
    float _1454;
    if (_1280 <= (-17.4739322662353515625f))
    {
        _1454 = -4.0f;
    }
    else
    {
        float _1453;
        if (_1280 < (-2.4739310741424560546875f))
        {
            float _1378 = mad(_1280, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1379 = _1378 * 0.6643855571746826171875f;
            int _1380 = cvt_f32_i32(_1379);
            float _1383 = mad(_1378, 0.6643855571746826171875f, -trunc(_1379));
            uint _1389 = min(uint(_1380 + 4), 10u);
            uint _1395 = min(uint((_1380 + 1) + 4), 10u);
            uint _1401 = min(uint((_1380 + 2) + 4), 10u);
            float2 _1407 = float2(_290[_1389].x, _290[_1395].x);
            _1453 = dp3_f32(float3(_1383 * _1383, _1383, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1389].x, _290[_1395].x, _290[_1401].x)), dp2_f32(float2(-1.0f, 1.0f), _1407), dp2_f32(0.5f.xx, _1407)));
        }
        else
        {
            float _1452;
            if (_1280 < 15.52606868743896484375f)
            {
                float _1417 = mad(_1280, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1418 = _1417 * 0.55365467071533203125f;
                int _1419 = cvt_f32_i32(_1418);
                float _1422 = mad(_1417, 0.55365467071533203125f, -trunc(_1418));
                uint _1428 = min(uint(_1419 + 4), 10u);
                uint _1434 = min(uint((_1419 + 1) + 4), 10u);
                uint _1440 = min(uint((_1419 + 2) + 4), 10u);
                float2 _1446 = float2(_290[_1428].y, _290[_1434].y);
                _1452 = dp3_f32(float3(_1422 * _1422, _1422, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1428].y, _290[_1434].y, _290[_1440].y)), dp2_f32(float2(-1.0f, 1.0f), _1446), dp2_f32(0.5f.xx, _1446)));
            }
            else
            {
                _1452 = 4.0f;
            }
            _1453 = _1452;
        }
        _1454 = _1453;
    }
    float _1540;
    if (_1281 <= (-17.4739322662353515625f))
    {
        _1540 = -4.0f;
    }
    else
    {
        float _1539;
        if (_1281 < (-2.4739310741424560546875f))
        {
            float _1464 = mad(_1281, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1465 = _1464 * 0.6643855571746826171875f;
            int _1466 = cvt_f32_i32(_1465);
            float _1469 = mad(_1464, 0.6643855571746826171875f, -trunc(_1465));
            uint _1475 = min(uint(_1466 + 4), 10u);
            uint _1481 = min(uint((_1466 + 1) + 4), 10u);
            uint _1487 = min(uint((_1466 + 2) + 4), 10u);
            float2 _1493 = float2(_290[_1475].x, _290[_1481].x);
            _1539 = dp3_f32(float3(_1469 * _1469, _1469, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1475].x, _290[_1481].x, _290[_1487].x)), dp2_f32(float2(-1.0f, 1.0f), _1493), dp2_f32(0.5f.xx, _1493)));
        }
        else
        {
            float _1538;
            if (_1281 < 15.52606868743896484375f)
            {
                float _1503 = mad(_1281, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1504 = _1503 * 0.55365467071533203125f;
                int _1505 = cvt_f32_i32(_1504);
                float _1508 = mad(_1503, 0.55365467071533203125f, -trunc(_1504));
                uint _1514 = min(uint(_1505 + 4), 10u);
                uint _1520 = min(uint((_1505 + 1) + 4), 10u);
                uint _1526 = min(uint((_1505 + 2) + 4), 10u);
                float2 _1532 = float2(_290[_1514].y, _290[_1520].y);
                _1538 = dp3_f32(float3(_1508 * _1508, _1508, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_290[_1514].y, _290[_1520].y, _290[_1526].y)), dp2_f32(float2(-1.0f, 1.0f), _1532), dp2_f32(0.5f.xx, _1532)));
            }
            else
            {
                _1538 = 4.0f;
            }
            _1539 = _1538;
        }
        _1540 = _1539;
    }
    float3 _1543 = float3(exp2(_1368 * 3.3219280242919921875f), exp2(_1454 * 3.3219280242919921875f), exp2(_1540 * 3.3219280242919921875f));
    float3 _1547 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1543), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1543), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1543));
    float _1548 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1547);
    float _1549 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1547);
    float _1550 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1547);
    float _1554 = (_1548 <= 0.0f) ? (-4.0f) : (log2(_1548) * 0.3010300099849700927734375f);
    float _1558 = log2(cb1_m[19u].y);
    float _1559 = _1558 * 0.3010300099849700927734375f;
    float _1667;
    if (_1559 >= _1554)
    {
        _1667 = mad(cb1_m[21u].x, _1554, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1559 * cb1_m[21u].x));
    }
    else
    {
        float _1576 = log2(cb1_m[20u].x);
        float _1577 = _1576 * 0.3010300099849700927734375f;
        float _1666;
        if ((_1559 < _1554) && (_1577 > _1554))
        {
            float _1586 = (mad(_1558, -0.3010300099849700927734375f, _1554) * 7.0f) / (_1577 - _1559);
            int _1587 = cvt_f32_i32(_1586);
            float _1589 = _1586 - trunc(_1586);
            uint _1591 = uint(_1587 + 1);
            uint _1593 = uint(_1587 + 2);
            uint _1595 = uint(_1587);
            float2 _1607 = float2(cb1_m[_1595].x, cb1_m[_1591].x);
            _1666 = dp3_f32(float3(_1589 * _1589, _1589, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1595].x, cb1_m[_1591].x, cb1_m[_1593].x)), dp2_f32(float2(-1.0f, 1.0f), _1607), dp2_f32(0.5f.xx, _1607)));
        }
        else
        {
            float _1617 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1665;
            if ((_1577 <= _1554) && (_1617 > _1554))
            {
                float _1626 = (mad(_1576, -0.3010300099849700927734375f, _1554) * 7.0f) / (_1617 - _1577);
                int _1627 = cvt_f32_i32(_1626);
                float _1629 = _1626 - trunc(_1626);
                uint _1634 = uint(_1627 + 10);
                uint _1639 = uint((_1627 + 1) + 10);
                uint _1644 = uint((_1627 + 2) + 10);
                float2 _1650 = float2(cb1_m[_1634].x, cb1_m[_1639].x);
                _1665 = dp3_f32(float3(_1629 * _1629, _1629, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1634].x, cb1_m[_1639].x, cb1_m[_1644].x)), dp2_f32(float2(-1.0f, 1.0f), _1650), dp2_f32(0.5f.xx, _1650)));
            }
            else
            {
                _1665 = mad(cb1_m[21u].y, _1554, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1617 * cb1_m[21u].y));
            }
            _1666 = _1665;
        }
        _1667 = _1666;
    }
    float _1671 = (_1549 <= 0.0f) ? (-4.0f) : (log2(_1549) * 0.3010300099849700927734375f);
    float _1779;
    if (_1559 >= _1671)
    {
        _1779 = mad(cb1_m[21u].x, _1671, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1559 * cb1_m[21u].x));
    }
    else
    {
        float _1688 = log2(cb1_m[20u].x);
        float _1689 = _1688 * 0.3010300099849700927734375f;
        float _1778;
        if ((_1559 < _1671) && (_1689 > _1671))
        {
            float _1698 = (mad(_1558, -0.3010300099849700927734375f, _1671) * 7.0f) / (_1689 - _1559);
            int _1699 = cvt_f32_i32(_1698);
            float _1701 = _1698 - trunc(_1698);
            uint _1703 = uint(_1699 + 1);
            uint _1705 = uint(_1699 + 2);
            uint _1707 = uint(_1699);
            float2 _1719 = float2(cb1_m[_1707].x, cb1_m[_1703].x);
            _1778 = dp3_f32(float3(_1701 * _1701, _1701, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1707].x, cb1_m[_1703].x, cb1_m[_1705].x)), dp2_f32(float2(-1.0f, 1.0f), _1719), dp2_f32(0.5f.xx, _1719)));
        }
        else
        {
            float _1729 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1777;
            if ((_1689 <= _1671) && (_1729 > _1671))
            {
                float _1738 = (mad(_1688, -0.3010300099849700927734375f, _1671) * 7.0f) / (_1729 - _1689);
                int _1739 = cvt_f32_i32(_1738);
                float _1741 = _1738 - trunc(_1738);
                uint _1746 = uint(_1739 + 10);
                uint _1751 = uint((_1739 + 1) + 10);
                uint _1756 = uint((_1739 + 2) + 10);
                float2 _1762 = float2(cb1_m[_1746].x, cb1_m[_1751].x);
                _1777 = dp3_f32(float3(_1741 * _1741, _1741, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1746].x, cb1_m[_1751].x, cb1_m[_1756].x)), dp2_f32(float2(-1.0f, 1.0f), _1762), dp2_f32(0.5f.xx, _1762)));
            }
            else
            {
                _1777 = mad(cb1_m[21u].y, _1671, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1729 * cb1_m[21u].y));
            }
            _1778 = _1777;
        }
        _1779 = _1778;
    }
    float _1783 = (_1550 <= 0.0f) ? (-4.0f) : (log2(_1550) * 0.3010300099849700927734375f);
    float _1891;
    if (_1559 >= _1783)
    {
        _1891 = mad(cb1_m[21u].x, _1783, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1559 * cb1_m[21u].x));
    }
    else
    {
        float _1800 = log2(cb1_m[20u].x);
        float _1801 = _1800 * 0.3010300099849700927734375f;
        float _1890;
        if ((_1559 < _1783) && (_1801 > _1783))
        {
            float _1810 = (mad(_1558, -0.3010300099849700927734375f, _1783) * 7.0f) / (_1801 - _1559);
            int _1811 = cvt_f32_i32(_1810);
            float _1813 = _1810 - trunc(_1810);
            uint _1815 = uint(_1811 + 1);
            uint _1817 = uint(_1811 + 2);
            uint _1819 = uint(_1811);
            float2 _1831 = float2(cb1_m[_1819].x, cb1_m[_1815].x);
            _1890 = dp3_f32(float3(_1813 * _1813, _1813, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1819].x, cb1_m[_1815].x, cb1_m[_1817].x)), dp2_f32(float2(-1.0f, 1.0f), _1831), dp2_f32(0.5f.xx, _1831)));
        }
        else
        {
            float _1841 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1889;
            if ((_1801 <= _1783) && (_1841 > _1783))
            {
                float _1850 = (mad(_1800, -0.3010300099849700927734375f, _1783) * 7.0f) / (_1841 - _1801);
                int _1851 = cvt_f32_i32(_1850);
                float _1853 = _1850 - trunc(_1850);
                uint _1858 = uint(_1851 + 10);
                uint _1863 = uint((_1851 + 1) + 10);
                uint _1868 = uint((_1851 + 2) + 10);
                float2 _1874 = float2(cb1_m[_1858].x, cb1_m[_1863].x);
                _1889 = dp3_f32(float3(_1853 * _1853, _1853, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1858].x, cb1_m[_1863].x, cb1_m[_1868].x)), dp2_f32(float2(-1.0f, 1.0f), _1874), dp2_f32(0.5f.xx, _1874)));
            }
            else
            {
                _1889 = mad(cb1_m[21u].y, _1783, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1841 * cb1_m[21u].y));
            }
            _1890 = _1889;
        }
        _1891 = _1890;
    }
    if (_699)
    {
        float3 _1903 = float3(exp2(_1667 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1779 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1891 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _1907 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1903), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1903), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1903));
        float3 _1911 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1907), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1907), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1907));
        float _1920 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1911) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1931 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1911) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1941 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1911) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_693] = float4(min(exp2(log2(mad(_1920, 18.8515625f, 0.8359375f) / mad(_1920, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1931, 18.8515625f, 0.8359375f) / mad(_1931, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1941, 18.8515625f, 0.8359375f) / mad(_1941, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
