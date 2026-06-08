#include "../common.hlsl"

struct _440
{
    uint2 _m0;
    uint _m1;
};

static const float _61[1] = { 0.0f };
static const float4 _339[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    precise float _431 = a.x * b.x;
    return mad(a.y, b.y, _431);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _417 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _417));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _399 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _399)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _439_dummy_parameter;
    _440 _441 = { spvImageSize(u0, _439_dummy_parameter), 1u };
    uint _456 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _460 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_456, 1u, 3u);
    uint _461 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _456, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _468 = (float(_460) + 0.5f) / float(_441._m0.x);
    float _469 = (float(_461) + 0.5f) / float(_441._m0.y);
    bool _472 = (_441._m0.x < _460) || (_441._m0.y < _461);
    bool _477 = cb3_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _477) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _492 = float2(_468, _469);
    float _497 = mad(t4.SampleLevel(s3, _492, 0.0f).x, 2.0f, -1.0f);
    float _512;
    if (_497 > 0.0f)
    {
        _512 = min(sqrt(_497), t0.Load(8u).x);
    }
    else
    {
        _512 = max(_497, -t0.Load(7u).x);
    }
    bool _523 = (cb3_m10.x != 0.0f) && (cb3_m10.y != 0.0f);
    bool _527 = (cb3_m8.w != 0.0f) && (cb3_m9.x != 0.0f);
    float4 _531 = t1.SampleLevel(s0, _492, 0.0f);
    float _532 = _531.x;
    float _533 = _531.y;
    float _534 = _531.z;
    float _602;
    float _603;
    float _604;
    if (_527 || _523)
    {
        float4 _541 = t3.SampleLevel(s2, _492, 0.0f);
        float2 _550 = float2(cb3_m2.x * _541.x, _541.y * cb3_m2.y);
        float _564 = exp2(max(_523 ? clamp((sqrt(dp2_f32(_550, _550)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _527 ? clamp((abs(_512) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float4 _568 = t2.SampleLevel(s1, _492, 0.0f);
        float _569 = _568.x;
        float _570 = _568.y;
        float _571 = _568.z;
        float _577 = asfloat(cb0_m[43u].w) * 20.0f;
        float _588 = mad(t7.SampleLevel(s5, float2(mad(_468, 30.0f, sin(_577)), mad(_469, 30.0f, cos(_577))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
        float _592 = sqrt(max(max(_569, max(_570, _571)), 1.0000000133514319600180897396058e-10f));
        float _593 = mad(_588, _592, _569);
        float _594 = mad(_588, _592, _570);
        float _595 = mad(_588, _592, _571);
        _602 = mad(_564, _534 - _595, _595);
        _603 = mad(_564, _533 - _594, _594);
        _604 = mad(_564, _532 - _593, _593);
    }
    else
    {
        _602 = _534;
        _603 = _533;
        _604 = _532;
    }
    float _609 = _477 ? g0[0u] : cb3_m3.x;
    float4 _613 = t5.SampleLevel(s4, _492, 0.0f);
    float _614 = _613.x;
    float _622 = max(cb3_m4.y - dp3_f32(float3(_614, _613.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _626 = mad(_604, _609, _614 / _622);
    float _627 = mad(_603, _609, _613.y / _622);
    float _628 = mad(_602, _609, _613.z / _622);
    float _632 = 1.0f / (max(_626, max(_628, _627)) + 1.0f);
    float _633 = _626 * _632;
    float _635 = _632 * _628;
    float3 _636 = float3(_633, _635, _632 * _627);
    float _637 = dp3_f32(_636, float3(0.25f, 0.25f, 0.5f));
    float _638 = dp3_f32(_636, float3(-0.25f, -0.25f, 0.5f));
    float _640 = dp2_f32(float2(_633, _635), float2(0.5f, -0.5f));
    float _641 = _637 - _638;
    float _642 = _640 + _641;
    float _643 = _637 + _638;
    float _644 = _641 - _640;
    bool _645 = !_472;
    float _1019;
    float _1020;
    float _1021;
    if (_645)
    {
        float _649 = dp3_f32(float3(_642, _643, _644), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _657 = cb3_m8.x * mad(-abs(_512), cb3_m9.y, 1.0f);
        float _661 = mad(_657, _642 - _649, _649);
        float _662 = mad(_657, _643 - _649, _649);
        float _663 = mad(_657, _644 - _649, _649);
        float _664 = _468 - 0.5f;
        float _665 = _469 - 0.5f;
        float _666 = _665 + _665;
        float _667 = _664 + _664;
        float _668 = abs(_667);
        float _669 = abs(_666);
        float _673 = min(_668, _669) * (1.0f / max(_668, _669));
        float _674 = _673 * _673;
        float _678 = mad(_674, mad(_674, mad(_674, mad(_674, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _687 = mad(_673, _678, (_668 < _669) ? mad(_673 * _678, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_667) > _667) ? (-3.1415927410125732421875f) : 0.0f);
        float _688 = min(_666, _667);
        float _689 = max(_666, _667);
        float _696 = ((_688 < (-_688)) && (_689 >= (-_689))) ? (-_687) : _687;
        float4 _700 = t8.SampleLevel(s6, _492, 0.0f);
        float _701 = _700.x;
        float _702 = _700.y;
        float _703 = _700.z;
        float _704 = _700.w;
        float _709 = (_662 - _663) * 1.73205077648162841796875f;
        float _711 = mad(_661, 2.0f, -_662);
        float _712 = _711 - _663;
        float _713 = abs(_709);
        float _714 = abs(_712);
        float _718 = min(_713, _714) * (1.0f / max(_713, _714));
        float _719 = _718 * _718;
        float _723 = mad(_719, mad(_719, mad(_719, mad(_719, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _732 = mad(_718, _723, (_713 > _714) ? mad(_718 * _723, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_712 < (_663 - _711)) ? (-3.1415927410125732421875f) : 0.0f);
        float _733 = min(_709, _712);
        float _734 = max(_709, _712);
        float _743 = ((_661 == _662) && (_663 == _662)) ? 0.0f : ((((_733 < (-_733)) && (_734 >= (-_734))) ? (-_732) : _732) * 57.295780181884765625f);
        float _752 = mad(cb3_m14.x, -360.0f, (_743 < 0.0f) ? (_743 + 360.0f) : _743);
        float _762 = clamp(1.0f - (abs((_752 < (-180.0f)) ? (_752 + 360.0f) : ((_752 > 180.0f) ? (_752 - 360.0f) : _752)) / (cb3_m14.y * 180.0f)), 0.0f, 1.0f);
        float _767 = dp3_f32(float3(_661, _662, _663), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _770 = (mad(_762, -2.0f, 3.0f) * (_762 * _762)) * cb3_m14.z;
        float _782 = mad(mad(_770, _661 - _767, _767) - _661, cb3_m13.x, _661);
        float _783 = mad(mad(_770, _662 - _767, _767) - _662, cb3_m13.x, _662);
        float _784 = mad(mad(_770, _663 - _767, _767) - _663, cb3_m13.x, _663);
        float _786;
        _786 = 0.0f;
        float _787;
        uint _790;
        uint _789 = 0u;
        for (;;)
        {
            if (_789 >= 8u)
            {
                break;
            }
            uint _801 = min((_789 & 3u), 10u);
            float _821 = mad(float(_789), 0.785398185253143310546875f, -_696);
            float _822 = _821 + 1.57079637050628662109375f;
            _787 = mad(_704 * (dp4_f32(t9.Load((_789 >> 2u) + 10u), float4(_339[_801].x, _339[_801].y, _339[_801].z, _339[_801].w)) * clamp((abs((_822 > 3.1415927410125732421875f) ? (_821 - 4.7123889923095703125f) : _822) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _786, _786);
            _790 = _789 + 1u;
            _786 = _787;
            _789 = _790;
            continue;
        }
        float _833 = clamp(_786, 0.0f, 1.0f);
        float _846 = asfloat(cb0_m[43u].w);
        float _852 = abs(t9.Load(8u).x);
        float2 _855 = float2(_664 * 1.40999996662139892578125f, _665 * 1.40999996662139892578125f);
        float _857 = sqrt(dp2_f32(_855, _855));
        float _858 = min(_857, 1.0f);
        float _859 = _858 * _858;
        float _864 = clamp(_857 - 0.5f, 0.0f, 1.0f);
        float _867 = (_858 * _859) + (mad(-_858, _859, 1.0f) * (_864 * _864));
        float _868 = mad(mad(mad(sin(_846 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _852, -1.0f);
        float _870 = _702 + _868;
        float _872 = clamp((_703 + _868) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _879 = clamp(_870 + _870, 0.0f, 1.0f);
        float _896 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _902 = mad(sin(_702 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_896)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _904 = _902 * 0.02999999932944774627685546875f;
        float _905 = mad(_852, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _909 = mad(mad(-_867, _867, 1.0f), 1.0f - _905, _905);
        float _910 = min((exp2(log2(_867) * 0.699999988079071044921875f) * (mad(_879, -2.0f, 3.0f) * (_879 * _879))) + (mad(_872, -2.0f, 3.0f) * (_872 * _872)), 1.0f);
        float _920 = mad(_910, mad(_909, _902 * 0.62000000476837158203125f, mad(_782, _833, -_782)), mad(-_782, _833, _782));
        float _921 = mad(_910, mad(_909, _904, mad(_833, _783, -_783)), mad(-_833, _783, _783));
        float _922 = mad(_910, mad(_909, _904, mad(_833, _784, -_784)), mad(-_833, _784, _784));
        float _925 = mad(_702, _703 * (1.0f - _704), _704);
        float _927;
        _927 = 0.0f;
        float _928;
        uint _931;
        uint _930 = 0u;
        for (;;)
        {
            if (int(_930) >= 8)
            {
                break;
            }
            float4 _938 = t9.Load(_930);
            float _940 = _938.y;
            float _942 = _938.x - _696;
            _928 = mad(_925 * (_938.w * clamp((abs((_942 > 3.1415927410125732421875f) ? (_942 - 6.283185482025146484375f) : ((_942 < (-3.1415927410125732421875f)) ? (_942 + 6.283185482025146484375f) : _942)) + (_940 - 3.1415927410125732421875f)) / max(_940 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _927, _927);
            _931 = _930 + 1u;
            _927 = _928;
            _930 = _931;
            continue;
        }
        float _961 = clamp(_927 + _927, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _965 = mad(_961, 0.310000002384185791015625f - _920, _920);
        float _966 = mad(_961, 0.014999999664723873138427734375f - _921, _921);
        float _967 = mad(_961, 0.014999999664723873138427734375f - _922, _922);
        float4 _968 = t9.Load(12u);
        float _969 = _968.x;
        float _997;
        float _998;
        float _999;
        if (_969 != 0.0f)
        {
            float _976 = clamp(_896, 0.0f, 1.0f);
            float _986 = clamp((_701 + (_969 - 1.0f)) / max(mad(_969, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _990 = clamp(_969 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _993 = mad(_990, -2.0f, 3.0f) * (_990 * _990);
            _997 = mad(((_701 * 0.930000007152557373046875f) * _976) * _986, _993, _967);
            _998 = mad((_976 * (_701 * 0.85000002384185791015625f)) * _986, _993, _966);
            _999 = mad((_976 * (_701 * 0.790000021457672119140625f)) * _986, _993, _965);
        }
        else
        {
            _997 = _967;
            _998 = _966;
            _999 = _965;
        }
        bool _1002 = cb3_m13.y > 0.0f;
        bool _1006 = frac((_469 * 420.0f) + (_846 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1007 = _1006 ? 0.300000011920928955078125f : 0.0f;
        float _1008 = _1007 * cb3_m13.y;
        _1019 = _1002 ? mad(_1008, 0.0f - _999, _999) : _999;
        _1020 = _1002 ? mad((_1006 ? 0.100000001490116119384765625f : 0.0f) - _998, _1008, _998) : _998;
        _1021 = _1002 ? mad(_1007 - _997, _1008, _997) : _997;
    }
    else
    {
        _1019 = _642;
        _1020 = _643;
        _1021 = _644;
    }
    float _1026 = 1.0f / max(1.0f - max(max(_1020, _1021), _1019), 6.099999882280826568603515625e-05f);
    float _1033 = min(-(_1026 * _1019), 0.0f);
    float _1034 = min(-(_1026 * _1020), 0.0f);
    float _1035 = min(-(_1026 * _1021), 0.0f);
    float2 _1038 = float2(_468 - 0.5f, _469 - 0.5f);
    float _1049 = clamp(-((sqrt(dp2_f32(_1038, _1038)) - cb3_m7.x) * (1.0f / cb3_m7.y)), 0.0f, 1.0f);
    float _1050 = mad(_1049, -2.0f, 3.0f);
    float _1051 = _1049 * _1049;
    float _1052 = _1050 * _1051;
    float _1054 = mad(-_1050, _1051, 1.0f);
    float _1077 = cb3_m7.z * cb3_m7.w;
    float3 _1090 = float3(_472 ? (-_1033) : mad(_1033 + ((_1054 * cb3_m5.x) - (_1033 * _1052)), _1077, -_1033), _472 ? (-_1034) : mad(_1077, ((_1054 * cb3_m5.y) - (_1052 * _1034)) + _1034, -_1034), _472 ? (-_1035) : mad(_1077, ((_1054 * cb3_m5.z) - (_1052 * _1035)) + _1035, -_1035));
    float _1091 = dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1090);
    float _1092 = dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1090);
    float _1093 = dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1090);
    bool _1097 = cb2_m0.x != 0.0f;
    float _1114;
    float _1115;
    float _1116;
    if (!_1097)
    {
        _1114 = clamp(mad(cb2_m1.x, mad(_1093, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1115 = clamp(mad(cb2_m1.x, mad(_1092, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
        _1116 = clamp(mad(cb2_m1.x, mad(_1091, cb2_m1.y, -0.1800537109375f), 0.1800537109375f), 0.0f, 65504.0f);
    }
    else
    {
        _1114 = _1093;
        _1115 = _1092;
        _1116 = _1091;
    }
    float _1119 = mad(cb2_m0.y, -0.0005000000237487256526947021484375f, 0.312709987163543701171875f);
    float _1126 = mad(cb2_m0.z, 0.0005000000237487256526947021484375f, (_1119 * 2.86999988555908203125f) - ((_1119 * _1119) * 3.0f));
    float _1127 = _1126 - 0.2750950753688812255859375f;
    float _1128 = _1119 / _1127;
    float _1132 = ((1.0f - _1119) + (0.2750950753688812255859375f - _1126)) / _1127;
    float3 _1142 = float3(_1116, _1115, _1114);
    float3 _1149 = float3((0.94923698902130126953125f / mad(_1132, -0.1624000072479248046875f, mad(_1128, 0.732800006866455078125f, 0.4296000003814697265625f))) * dp3_f32(float3(0.390404999256134033203125f, 0.549941003322601318359375f, 0.008926319889724254608154296875f), _1142), dp3_f32(float3(0.070841602981090545654296875f, 0.963172018527984619140625f, 0.001357750035822391510009765625f), _1142) * (1.035419940948486328125f / mad(_1132, 0.006099999882280826568603515625f, mad(_1128, -0.703599989414215087890625f, 1.6974999904632568359375f))), dp3_f32(float3(0.02310819923877716064453125f, 0.1280210018157958984375f, 0.936245024204254150390625f), _1142) * (1.0872800350189208984375f / mad(_1132, 0.98339998722076416015625f, mad(_1128, 0.0030000000260770320892333984375f, 0.013600000180304050445556640625f))));
    float3 _1159 = float3(dp3_f32(float3(2.85846996307373046875f, -1.62879002094268798828125f, -0.0248910002410411834716796875f), _1149), dp3_f32(float3(-0.21018199622631072998046875f, 1.1582000255584716796875f, 0.0003242809907533228397369384765625f), _1149), dp3_f32(float3(-0.0418119989335536956787109375f, -0.118169002234935760498046875f, 1.0686700344085693359375f), _1149));
    float _1161 = dp3_f32(_1159, float3(cb2_m1.w, cb2_m2));
    float _1169 = dp3_f32(_1159, float3(cb2_m3, cb2_m4));
    float _1172 = dp3_f32(_1159, cb2_m5);
    float _1174 = dp3_f32(float3(_1161, _1169, _1172), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1183 = clamp((_1174 - cb2_m11) * (1.0f / (cb2_m12.x - cb2_m11)), 0.0f, 1.0f);
    float _1187 = mad(-mad(_1183, -2.0f, 3.0f), _1183 * _1183, 1.0f);
    float _1196 = clamp((_1174 - cb2_m12.y) * (1.0f / (cb2_m12.z - cb2_m12.y)), 0.0f, 1.0f);
    float _1197 = mad(_1196, -2.0f, 3.0f);
    float _1198 = _1196 * _1196;
    float _1199 = _1197 * _1198;
    float _1202 = 1.0f - clamp(mad(_1197, _1198, _1187), 0.0f, 1.0f);
    float _1227;
    float _1228;
    float _1229;
    if (_1097)
    {
        _1227 = cb2_m13.y + 1.0f;
        _1228 = cb2_m12.w + 1.0f;
        _1229 = cb2_m13.x + 1.0f;
    }
    else
    {
        _1227 = mad(cb2_m13.x, 0.5f, mad(cb2_m12.w, 0.25f, 1.0f)) + cb2_m13.y;
        _1228 = cb2_m12.w + 1.0f;
        _1229 = mad(cb2_m12.w, 0.5f, cb2_m13.x) + 1.0f;
    }
    float _1272 = mad(_1199 * (_1169 * cb2_m10.y), _1227, ((_1187 * (cb2_m6.y * _1169)) * _1228) + ((_1202 * (cb2_m8.y * _1169)) * _1229));
    float _1273 = mad(_1199 * (_1172 * cb2_m10.z), _1227, ((_1187 * (cb2_m6.z * _1172)) * _1228) + ((_1202 * (cb2_m8.z * _1172)) * _1229));
    float _1274 = mad(_1199 * (cb2_m10.x * _1161), _1227, ((_1202 * (cb2_m8.x * _1161)) * _1229) + ((_1187 * (cb2_m6.x * _1161)) * _1228));
    float _1278 = float(_1272 >= _1273);
    float _1279 = mad(_1272 - _1273, _1278, _1273);
    float _1280 = mad(_1278, _1273 - _1272, _1272);
    float _1282 = mad(_1278, -1.0f, 0.666666686534881591796875f);
    float _1288 = float(_1279 <= _1274);
    float _1289 = mad(_1274 - _1279, _1288, _1279);
    float _1290 = mad(_1288, _1280 - _1280, _1280);
    float _1292 = mad(_1288, _1279 - _1274, _1274);
    float _1294 = _1289 - min(_1292, _1290);
    float _1300 = _1294 / (_1289 + 9.9999997473787516355514526367188e-05f);
    float _1304 = cb2_m1.z + abs(((_1292 - _1290) / mad(_1294, 6.0f, 9.9999997473787516355514526367188e-05f)) + mad(_1288, mad(_1278, 1.0f, -1.0f) - _1282, _1282));
    float _1310 = (_1304 < 0.0f) ? (_1304 + 1.0f) : ((_1304 > 1.0f) ? (_1304 - 1.0f) : _1304);
    float _1332 = mad(_1300, clamp(abs(mad(frac(_1310 + 1.0f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1333 = mad(_1300, clamp(abs(mad(frac(_1310 + 0.666666686534881591796875f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1334 = mad(_1300, clamp(abs(mad(frac(_1310 + 0.3333333432674407958984375f), 6.0f, -3.0f)) - 1.0f, 0.0f, 1.0f) - 1.0f, 1.0f);
    float _1339 = dp3_f32(float3(_1289 * _1332, _1289 * _1333, _1289 * _1334), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f));
    float _1348 = mad(cb2_m0.w, mad(_1289, _1332, -_1339), _1339);
    float _1349 = mad(cb2_m0.w, mad(_1289, _1333, -_1339), _1339);
    float _1350 = mad(cb2_m0.w, mad(_1289, _1334, -_1339), _1339);
    float _1369;
    float _1370;
    float _1371;
    if (_1097)
    {
        _1369 = clamp(mad(_1350 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
        _1370 = clamp(mad(_1349 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
        _1371 = clamp(mad(_1348 - 0.1800537109375f, cb2_m1.x, 0.1800537109375f), 0.0f, 65504.0f) * cb2_m1.y;
    }
    else
    {
        _1369 = _1350;
        _1370 = _1349;
        _1371 = _1348;
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
         if (_645) {
            float3 scene_color = float3(_1371, _1370, _1369);
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[uint2(_460, _461)] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1375 = min(_1371 * 2.5f, 65504.0f);
    float _1376 = min(_1370 * 2.5f, 65504.0f);
    float _1377 = min(_1369 * 2.5f, 65504.0f);
    float _1381 = max(max(_1375, _1376), _1377);
    float _1386 = (max(_1381, 9.9999997473787516355514526367188e-05f) - max(min(min(_1375, _1376), _1377), 9.9999997473787516355514526367188e-05f)) / max(_1381, 0.00999999977648258209228515625f);
    float _1397 = mad(sqrt(mad(_1375, _1375 - _1377, ((_1377 - _1376) * _1377) + ((_1376 - _1375) * _1376))), 1.75f, _1375 + (_1377 + _1376));
    float _1398 = _1386 - 0.4000000059604644775390625f;
    float _1402 = max(1.0f - abs(_1398 * 2.5f), 0.0f);
    float _1410 = mad(mad(clamp(mad(_1398, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1402, _1402, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1418 = ((_1397 <= 0.1599999964237213134765625f) ? _1410 : ((_1397 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1397 * 0.3333333432674407958984375f)) - 0.5f) * _1410))) + 1.0f;
    float _1419 = _1375 * _1418;
    float _1420 = _1418 * _1376;
    float _1421 = _1418 * _1377;
    float _1426 = (_1420 - _1421) * 1.73205077648162841796875f;
    float _1428 = (_1419 * 2.0f) - _1420;
    float _1430 = mad(-_1418, _1377, _1428);
    float _1431 = abs(_1430);
    float _1432 = abs(_1426);
    float _1436 = min(_1431, _1432) * (1.0f / max(_1431, _1432));
    float _1437 = _1436 * _1436;
    float _1441 = mad(_1437, mad(_1437, mad(_1437, mad(_1437, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1451 = mad(_1436, _1441, (_1431 < _1432) ? mad(_1436 * _1441, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1430 < mad(_1418, _1377, -_1428)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1452 = min(_1426, _1430);
    float _1453 = max(_1426, _1430);
    float _1462 = ((_1419 == _1420) && (_1421 == _1420)) ? 0.0f : ((((_1452 < (-_1452)) && (_1453 >= (-_1453))) ? (-_1451) : _1451) * 57.295780181884765625f);
    float _1465 = (_1462 < 0.0f) ? (_1462 + 360.0f) : _1462;
    float _1475 = max(1.0f - abs(((_1465 < (-180.0f)) ? (_1465 + 360.0f) : ((_1465 > 180.0f) ? (_1465 - 360.0f) : _1465)) * 0.01481481455266475677490234375f), 0.0f);
    float _1478 = mad(_1475, -2.0f, 3.0f) * (_1475 * _1475);
    float3 _1489 = float3(clamp(_1419 + (((_1386 * (_1478 * _1478)) * mad(-_1375, _1418, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1420, 0.0f, 65504.0f), clamp(_1421, 0.0f, 65504.0f));
    float _1493 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1489), 0.0f, 65504.0f);
    float _1494 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1489), 0.0f, 65504.0f);
    float _1495 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1489), 0.0f, 65504.0f);
    float _1497 = dp3_f32(float3(_1493, _1494, _1495), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1501 = mad(_1493 - _1497, 0.959999978542327880859375f, _1497);
    float _1502 = mad(_1494 - _1497, 0.959999978542327880859375f, _1497);
    float _1503 = mad(_1495 - _1497, 0.959999978542327880859375f, _1497);
    float _1510 = (_1501 <= 0.0f) ? (-14.0f) : log2(_1501);
    float _1511 = (_1502 <= 0.0f) ? (-14.0f) : log2(_1502);
    float _1512 = (_1503 <= 0.0f) ? (-14.0f) : log2(_1503);
    float _1599;
    if (_1510 <= (-17.4739322662353515625f))
    {
        _1599 = -4.0f;
    }
    else
    {
        float _1598;
        if (_1510 < (-2.4739310741424560546875f))
        {
            float _1523 = mad(_1510, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1524 = _1523 * 0.6643855571746826171875f;
            int _1525 = cvt_f32_i32(_1524);
            float _1528 = mad(_1523, 0.6643855571746826171875f, -trunc(_1524));
            uint _1534 = min(uint(_1525 + 4), 10u);
            uint _1540 = min(uint((_1525 + 1) + 4), 10u);
            uint _1546 = min(uint((_1525 + 2) + 4), 10u);
            float2 _1552 = float2(_339[_1534].x, _339[_1540].x);
            _1598 = dp3_f32(float3(_1528 * _1528, _1528, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1534].x, _339[_1540].x, _339[_1546].x)), dp2_f32(float2(-1.0f, 1.0f), _1552), dp2_f32(0.5f.xx, _1552)));
        }
        else
        {
            float _1597;
            if (_1510 < 15.52606868743896484375f)
            {
                float _1562 = mad(_1510, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1563 = _1562 * 0.55365467071533203125f;
                int _1564 = cvt_f32_i32(_1563);
                float _1567 = mad(_1562, 0.55365467071533203125f, -trunc(_1563));
                uint _1573 = min(uint(_1564 + 4), 10u);
                uint _1579 = min(uint((_1564 + 1) + 4), 10u);
                uint _1585 = min(uint((_1564 + 2) + 4), 10u);
                float2 _1591 = float2(_339[_1573].y, _339[_1579].y);
                _1597 = dp3_f32(float3(_1567 * _1567, _1567, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1573].y, _339[_1579].y, _339[_1585].y)), dp2_f32(float2(-1.0f, 1.0f), _1591), dp2_f32(0.5f.xx, _1591)));
            }
            else
            {
                _1597 = 4.0f;
            }
            _1598 = _1597;
        }
        _1599 = _1598;
    }
    float _1685;
    if (_1511 <= (-17.4739322662353515625f))
    {
        _1685 = -4.0f;
    }
    else
    {
        float _1684;
        if (_1511 < (-2.4739310741424560546875f))
        {
            float _1609 = mad(_1511, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1610 = _1609 * 0.6643855571746826171875f;
            int _1611 = cvt_f32_i32(_1610);
            float _1614 = mad(_1609, 0.6643855571746826171875f, -trunc(_1610));
            uint _1620 = min(uint(_1611 + 4), 10u);
            uint _1626 = min(uint((_1611 + 1) + 4), 10u);
            uint _1632 = min(uint((_1611 + 2) + 4), 10u);
            float2 _1638 = float2(_339[_1620].x, _339[_1626].x);
            _1684 = dp3_f32(float3(_1614 * _1614, _1614, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1620].x, _339[_1626].x, _339[_1632].x)), dp2_f32(float2(-1.0f, 1.0f), _1638), dp2_f32(0.5f.xx, _1638)));
        }
        else
        {
            float _1683;
            if (_1511 < 15.52606868743896484375f)
            {
                float _1648 = mad(_1511, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1649 = _1648 * 0.55365467071533203125f;
                int _1650 = cvt_f32_i32(_1649);
                float _1653 = mad(_1648, 0.55365467071533203125f, -trunc(_1649));
                uint _1659 = min(uint(_1650 + 4), 10u);
                uint _1665 = min(uint((_1650 + 1) + 4), 10u);
                uint _1671 = min(uint((_1650 + 2) + 4), 10u);
                float2 _1677 = float2(_339[_1659].y, _339[_1665].y);
                _1683 = dp3_f32(float3(_1653 * _1653, _1653, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1659].y, _339[_1665].y, _339[_1671].y)), dp2_f32(float2(-1.0f, 1.0f), _1677), dp2_f32(0.5f.xx, _1677)));
            }
            else
            {
                _1683 = 4.0f;
            }
            _1684 = _1683;
        }
        _1685 = _1684;
    }
    float _1771;
    if (_1512 <= (-17.4739322662353515625f))
    {
        _1771 = -4.0f;
    }
    else
    {
        float _1770;
        if (_1512 < (-2.4739310741424560546875f))
        {
            float _1695 = mad(_1512, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1696 = _1695 * 0.6643855571746826171875f;
            int _1697 = cvt_f32_i32(_1696);
            float _1700 = mad(_1695, 0.6643855571746826171875f, -trunc(_1696));
            uint _1706 = min(uint(_1697 + 4), 10u);
            uint _1712 = min(uint((_1697 + 1) + 4), 10u);
            uint _1718 = min(uint((_1697 + 2) + 4), 10u);
            float2 _1724 = float2(_339[_1706].x, _339[_1712].x);
            _1770 = dp3_f32(float3(_1700 * _1700, _1700, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1706].x, _339[_1712].x, _339[_1718].x)), dp2_f32(float2(-1.0f, 1.0f), _1724), dp2_f32(0.5f.xx, _1724)));
        }
        else
        {
            float _1769;
            if (_1512 < 15.52606868743896484375f)
            {
                float _1734 = mad(_1512, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1735 = _1734 * 0.55365467071533203125f;
                int _1736 = cvt_f32_i32(_1735);
                float _1739 = mad(_1734, 0.55365467071533203125f, -trunc(_1735));
                uint _1745 = min(uint(_1736 + 4), 10u);
                uint _1751 = min(uint((_1736 + 1) + 4), 10u);
                uint _1757 = min(uint((_1736 + 2) + 4), 10u);
                float2 _1763 = float2(_339[_1745].y, _339[_1751].y);
                _1769 = dp3_f32(float3(_1739 * _1739, _1739, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_339[_1745].y, _339[_1751].y, _339[_1757].y)), dp2_f32(float2(-1.0f, 1.0f), _1763), dp2_f32(0.5f.xx, _1763)));
            }
            else
            {
                _1769 = 4.0f;
            }
            _1770 = _1769;
        }
        _1771 = _1770;
    }
    float3 _1774 = float3(exp2(_1599 * 3.3219280242919921875f), exp2(_1685 * 3.3219280242919921875f), exp2(_1771 * 3.3219280242919921875f));
    float3 _1778 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1774), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1774), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1774));
    float _1779 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1778);
    float _1780 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1778);
    float _1781 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1778);
    float _1785 = (_1779 <= 0.0f) ? (-4.0f) : (log2(_1779) * 0.3010300099849700927734375f);
    float _1789 = log2(cb1_m[19u].y);
    float _1790 = _1789 * 0.3010300099849700927734375f;
    float _1898;
    if (_1790 >= _1785)
    {
        _1898 = mad(cb1_m[21u].x, _1785, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1790 * cb1_m[21u].x));
    }
    else
    {
        float _1807 = log2(cb1_m[20u].x);
        float _1808 = _1807 * 0.3010300099849700927734375f;
        float _1897;
        if ((_1790 < _1785) && (_1808 > _1785))
        {
            float _1817 = (mad(_1789, -0.3010300099849700927734375f, _1785) * 7.0f) / (_1808 - _1790);
            int _1818 = cvt_f32_i32(_1817);
            float _1820 = _1817 - trunc(_1817);
            uint _1822 = uint(_1818 + 1);
            uint _1824 = uint(_1818 + 2);
            uint _1826 = uint(_1818);
            float2 _1838 = float2(cb1_m[_1826].x, cb1_m[_1822].x);
            _1897 = dp3_f32(float3(_1820 * _1820, _1820, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1826].x, cb1_m[_1822].x, cb1_m[_1824].x)), dp2_f32(float2(-1.0f, 1.0f), _1838), dp2_f32(0.5f.xx, _1838)));
        }
        else
        {
            float _1848 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1896;
            if ((_1808 <= _1785) && (_1848 > _1785))
            {
                float _1857 = (mad(_1807, -0.3010300099849700927734375f, _1785) * 7.0f) / (_1848 - _1808);
                int _1858 = cvt_f32_i32(_1857);
                float _1860 = _1857 - trunc(_1857);
                uint _1865 = uint(_1858 + 10);
                uint _1870 = uint((_1858 + 1) + 10);
                uint _1875 = uint((_1858 + 2) + 10);
                float2 _1881 = float2(cb1_m[_1865].x, cb1_m[_1870].x);
                _1896 = dp3_f32(float3(_1860 * _1860, _1860, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1865].x, cb1_m[_1870].x, cb1_m[_1875].x)), dp2_f32(float2(-1.0f, 1.0f), _1881), dp2_f32(0.5f.xx, _1881)));
            }
            else
            {
                _1896 = mad(cb1_m[21u].y, _1785, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1848 * cb1_m[21u].y));
            }
            _1897 = _1896;
        }
        _1898 = _1897;
    }
    float _1902 = (_1780 <= 0.0f) ? (-4.0f) : (log2(_1780) * 0.3010300099849700927734375f);
    float _2010;
    if (_1790 >= _1902)
    {
        _2010 = mad(cb1_m[21u].x, _1902, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1790 * cb1_m[21u].x));
    }
    else
    {
        float _1919 = log2(cb1_m[20u].x);
        float _1920 = _1919 * 0.3010300099849700927734375f;
        float _2009;
        if ((_1790 < _1902) && (_1920 > _1902))
        {
            float _1929 = (mad(_1789, -0.3010300099849700927734375f, _1902) * 7.0f) / (_1920 - _1790);
            int _1930 = cvt_f32_i32(_1929);
            float _1932 = _1929 - trunc(_1929);
            uint _1934 = uint(_1930 + 1);
            uint _1936 = uint(_1930 + 2);
            uint _1938 = uint(_1930);
            float2 _1950 = float2(cb1_m[_1938].x, cb1_m[_1934].x);
            _2009 = dp3_f32(float3(_1932 * _1932, _1932, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1938].x, cb1_m[_1934].x, cb1_m[_1936].x)), dp2_f32(float2(-1.0f, 1.0f), _1950), dp2_f32(0.5f.xx, _1950)));
        }
        else
        {
            float _1960 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2008;
            if ((_1920 <= _1902) && (_1960 > _1902))
            {
                float _1969 = (mad(_1919, -0.3010300099849700927734375f, _1902) * 7.0f) / (_1960 - _1920);
                int _1970 = cvt_f32_i32(_1969);
                float _1972 = _1969 - trunc(_1969);
                uint _1977 = uint(_1970 + 10);
                uint _1982 = uint((_1970 + 1) + 10);
                uint _1987 = uint((_1970 + 2) + 10);
                float2 _1993 = float2(cb1_m[_1977].x, cb1_m[_1982].x);
                _2008 = dp3_f32(float3(_1972 * _1972, _1972, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1977].x, cb1_m[_1982].x, cb1_m[_1987].x)), dp2_f32(float2(-1.0f, 1.0f), _1993), dp2_f32(0.5f.xx, _1993)));
            }
            else
            {
                _2008 = mad(cb1_m[21u].y, _1902, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1960 * cb1_m[21u].y));
            }
            _2009 = _2008;
        }
        _2010 = _2009;
    }
    float _2014 = (_1781 <= 0.0f) ? (-4.0f) : (log2(_1781) * 0.3010300099849700927734375f);
    float _2122;
    if (_1790 >= _2014)
    {
        _2122 = mad(cb1_m[21u].x, _2014, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1790 * cb1_m[21u].x));
    }
    else
    {
        float _2031 = log2(cb1_m[20u].x);
        float _2032 = _2031 * 0.3010300099849700927734375f;
        float _2121;
        if ((_1790 < _2014) && (_2032 > _2014))
        {
            float _2041 = (mad(_1789, -0.3010300099849700927734375f, _2014) * 7.0f) / (_2032 - _1790);
            int _2042 = cvt_f32_i32(_2041);
            float _2044 = _2041 - trunc(_2041);
            uint _2046 = uint(_2042 + 1);
            uint _2048 = uint(_2042 + 2);
            uint _2050 = uint(_2042);
            float2 _2062 = float2(cb1_m[_2050].x, cb1_m[_2046].x);
            _2121 = dp3_f32(float3(_2044 * _2044, _2044, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2050].x, cb1_m[_2046].x, cb1_m[_2048].x)), dp2_f32(float2(-1.0f, 1.0f), _2062), dp2_f32(0.5f.xx, _2062)));
        }
        else
        {
            float _2072 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _2120;
            if ((_2032 <= _2014) && (_2072 > _2014))
            {
                float _2081 = (mad(_2031, -0.3010300099849700927734375f, _2014) * 7.0f) / (_2072 - _2032);
                int _2082 = cvt_f32_i32(_2081);
                float _2084 = _2081 - trunc(_2081);
                uint _2089 = uint(_2082 + 10);
                uint _2094 = uint((_2082 + 1) + 10);
                uint _2099 = uint((_2082 + 2) + 10);
                float2 _2105 = float2(cb1_m[_2089].x, cb1_m[_2094].x);
                _2120 = dp3_f32(float3(_2084 * _2084, _2084, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_2089].x, cb1_m[_2094].x, cb1_m[_2099].x)), dp2_f32(float2(-1.0f, 1.0f), _2105), dp2_f32(0.5f.xx, _2105)));
            }
            else
            {
                _2120 = mad(cb1_m[21u].y, _2014, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_2072 * cb1_m[21u].y));
            }
            _2121 = _2120;
        }
        _2122 = _2121;
    }
    if (_645)
    {
        float3 _2134 = float3(exp2(_1898 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2010 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_2122 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _2138 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _2134), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _2134), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _2134));
        float3 _2142 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _2138), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _2138), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _2138));
        float _2151 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _2142) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2162 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _2142) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _2172 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _2142) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[uint2(_460, _461)] = float4(min(exp2(log2(mad(_2151, 18.8515625f, 0.8359375f) / mad(_2151, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2162, 18.8515625f, 0.8359375f) / mad(_2162, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_2172, 18.8515625f, 0.8359375f) / mad(_2172, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
