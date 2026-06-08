#include "../common.hlsl"

struct _378
{
    uint2 _m0;
    uint _m1;
};

static const float _58[1] = { 0.0f };
static const float4 _281[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    precise float _369 = a.x * b.x;
    return mad(a.y, b.y, _369);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _355 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _355));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _337 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _337)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _377_dummy_parameter;
    _378 _379 = { spvImageSize(u0, _377_dummy_parameter), 1u };
    uint _394 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _398 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_394, 1u, 3u);
    uint _399 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _394, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _406 = (float(_398) + 0.5f) / float(_379._m0.x);
    float _407 = (float(_399) + 0.5f) / float(_379._m0.y);
    bool _410 = (_379._m0.x < _398) || (_379._m0.y < _399);
    bool _415 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _415) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _430 = float2(_406, _407);
    float _435 = mad(t4.SampleLevel(s3, _430, 0.0f).x, 2.0f, -1.0f);
    float _450;
    if (_435 > 0.0f)
    {
        _450 = min(sqrt(_435), t0.Load(8u).x);
    }
    else
    {
        _450 = max(_435, -t0.Load(7u).x);
    }
    bool _461 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
    bool _465 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
    float4 _469 = t1.SampleLevel(s0, _430, 0.0f);
    float _470 = _469.x;
    float _471 = _469.y;
    float _472 = _469.z;
    float _540;
    float _541;
    float _542;
    if (_465 || _461)
    {
        float4 _479 = t3.SampleLevel(s2, _430, 0.0f);
        float2 _488 = float2(_479.x * cb2_m2.x, _479.y * cb2_m2.y);
        float _502 = exp2(max(_461 ? clamp((sqrt(dp2_f32(_488, _488)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _465 ? clamp((abs(_450) - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
        float4 _506 = t2.SampleLevel(s1, _430, 0.0f);
        float _507 = _506.x;
        float _508 = _506.y;
        float _509 = _506.z;
        float _515 = asfloat(cb0_m[43u].w) * 20.0f;
        float _526 = mad(t7.SampleLevel(s5, float2(mad(_406, 30.0f, sin(_515)), mad(_407, 30.0f, cos(_515))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f);
        float _530 = sqrt(max(max(_507, max(_508, _509)), 1.0000000133514319600180897396058e-10f));
        float _531 = mad(_526, _530, _507);
        float _532 = mad(_526, _530, _508);
        float _533 = mad(_526, _530, _509);
        _540 = mad(_502, _472 - _533, _533);
        _541 = mad(_502, _471 - _532, _532);
        _542 = mad(_502, _470 - _531, _531);
    }
    else
    {
        _540 = _472;
        _541 = _471;
        _542 = _470;
    }
    float _547 = _415 ? g0[0u] : cb2_m3.x;
    float4 _551 = t5.SampleLevel(s4, _430, 0.0f);
    float _552 = _551.x;
    float _560 = max(cb2_m4.y - dp3_f32(float3(_552, _551.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _564 = mad(_547, _542, _552 / _560);
    float _565 = mad(_547, _541, _551.y / _560);
    float _566 = mad(_547, _540, _551.z / _560);
    float _570 = 1.0f / (max(_564, max(_566, _565)) + 1.0f);
    float _571 = _564 * _570;
    float _573 = _570 * _566;
    float3 _574 = float3(_571, _573, _570 * _565);
    float _575 = dp3_f32(_574, float3(0.25f, 0.25f, 0.5f));
    float _576 = dp3_f32(_574, float3(-0.25f, -0.25f, 0.5f));
    float _578 = dp2_f32(float2(_571, _573), float2(0.5f, -0.5f));
    uint2 _580 = uint2(_398, _399);
    u1[_580] = _575.xxxx;
    float _582 = _575 - _576;
    float _583 = _578 + _582;
    float _584 = _575 + _576;
    float _585 = _582 - _578;
    bool _586 = !_410;
    float _960;
    float _961;
    float _962;
    if (_586)
    {
        float _590 = dp3_f32(float3(_583, _584, _585), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _598 = mad(-abs(_450), cb2_m9.y, 1.0f) * cb2_m8.x;
        float _602 = mad(_598, _583 - _590, _590);
        float _603 = mad(_598, _584 - _590, _590);
        float _604 = mad(_598, _585 - _590, _590);
        float _605 = _406 - 0.5f;
        float _606 = _407 - 0.5f;
        float _607 = _606 + _606;
        float _608 = _605 + _605;
        float _609 = abs(_608);
        float _610 = abs(_607);
        float _614 = min(_609, _610) * (1.0f / max(_609, _610));
        float _615 = _614 * _614;
        float _619 = mad(_615, mad(_615, mad(_615, mad(_615, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _628 = mad(_614, _619, (_609 < _610) ? mad(_614 * _619, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_608) > _608) ? (-3.1415927410125732421875f) : 0.0f);
        float _629 = min(_607, _608);
        float _630 = max(_607, _608);
        float _637 = ((_629 < (-_629)) && (_630 >= (-_630))) ? (-_628) : _628;
        float4 _641 = t8.SampleLevel(s6, _430, 0.0f);
        float _642 = _641.x;
        float _643 = _641.y;
        float _644 = _641.z;
        float _645 = _641.w;
        float _650 = (_603 - _604) * 1.73205077648162841796875f;
        float _652 = mad(_602, 2.0f, -_603);
        float _653 = _652 - _604;
        float _654 = abs(_650);
        float _655 = abs(_653);
        float _659 = min(_654, _655) * (1.0f / max(_654, _655));
        float _660 = _659 * _659;
        float _664 = mad(_660, mad(_660, mad(_660, mad(_660, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _673 = mad(_659, _664, (_654 > _655) ? mad(_659 * _664, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_653 < (_604 - _652)) ? (-3.1415927410125732421875f) : 0.0f);
        float _674 = min(_650, _653);
        float _675 = max(_650, _653);
        float _684 = ((_602 == _603) && (_604 == _603)) ? 0.0f : ((((_674 < (-_674)) && (_675 >= (-_675))) ? (-_673) : _673) * 57.295780181884765625f);
        float _693 = mad(cb2_m14.x, -360.0f, (_684 < 0.0f) ? (_684 + 360.0f) : _684);
        float _703 = clamp(1.0f - (abs((_693 < (-180.0f)) ? (_693 + 360.0f) : ((_693 > 180.0f) ? (_693 - 360.0f) : _693)) / (cb2_m14.y * 180.0f)), 0.0f, 1.0f);
        float _708 = dp3_f32(float3(_602, _603, _604), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _711 = (mad(_703, -2.0f, 3.0f) * (_703 * _703)) * cb2_m14.z;
        float _723 = mad(mad(_711, _602 - _708, _708) - _602, cb2_m13.x, _602);
        float _724 = mad(cb2_m13.x, mad(_711, _603 - _708, _708) - _603, _603);
        float _725 = mad(cb2_m13.x, mad(_711, _604 - _708, _708) - _604, _604);
        float _727;
        _727 = 0.0f;
        float _728;
        uint _731;
        uint _730 = 0u;
        for (;;)
        {
            if (_730 >= 8u)
            {
                break;
            }
            uint _742 = min((_730 & 3u), 10u);
            float _762 = mad(float(_730), 0.785398185253143310546875f, -_637);
            float _763 = _762 + 1.57079637050628662109375f;
            _728 = mad(_645 * (dp4_f32(t9.Load((_730 >> 2u) + 10u), float4(_281[_742].x, _281[_742].y, _281[_742].z, _281[_742].w)) * clamp((abs((_763 > 3.1415927410125732421875f) ? (_762 - 4.7123889923095703125f) : _763) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _727, _727);
            _731 = _730 + 1u;
            _727 = _728;
            _730 = _731;
            continue;
        }
        float _774 = clamp(_727, 0.0f, 1.0f);
        float _787 = asfloat(cb0_m[43u].w);
        float _793 = abs(t9.Load(8u).x);
        float2 _796 = float2(_605 * 1.40999996662139892578125f, _606 * 1.40999996662139892578125f);
        float _798 = sqrt(dp2_f32(_796, _796));
        float _799 = min(_798, 1.0f);
        float _800 = _799 * _799;
        float _805 = clamp(_798 - 0.5f, 0.0f, 1.0f);
        float _808 = (_799 * _800) + (mad(-_799, _800, 1.0f) * (_805 * _805));
        float _809 = mad(mad(mad(sin(_787 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _793, -1.0f);
        float _811 = _643 + _809;
        float _813 = clamp((_644 + _809) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _820 = clamp(_811 + _811, 0.0f, 1.0f);
        float _837 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _843 = mad(sin(_643 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_837)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _845 = _843 * 0.02999999932944774627685546875f;
        float _846 = mad(_793, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _850 = mad(mad(-_808, _808, 1.0f), 1.0f - _846, _846);
        float _851 = min((exp2(log2(_808) * 0.699999988079071044921875f) * (mad(_820, -2.0f, 3.0f) * (_820 * _820))) + (mad(_813, -2.0f, 3.0f) * (_813 * _813)), 1.0f);
        float _861 = mad(_851, mad(_850, _843 * 0.62000000476837158203125f, mad(_723, _774, -_723)), mad(-_723, _774, _723));
        float _862 = mad(_851, mad(_850, _845, mad(_774, _724, -_724)), mad(-_774, _724, _724));
        float _863 = mad(_851, mad(_850, _845, mad(_774, _725, -_725)), mad(-_774, _725, _725));
        float _866 = mad(_643, _644 * (1.0f - _645), _645);
        float _868;
        _868 = 0.0f;
        float _869;
        uint _872;
        uint _871 = 0u;
        for (;;)
        {
            if (int(_871) >= 8)
            {
                break;
            }
            float4 _879 = t9.Load(_871);
            float _881 = _879.y;
            float _883 = _879.x - _637;
            _869 = mad(_866 * (_879.w * clamp((abs((_883 > 3.1415927410125732421875f) ? (_883 - 6.283185482025146484375f) : ((_883 < (-3.1415927410125732421875f)) ? (_883 + 6.283185482025146484375f) : _883)) + (_881 - 3.1415927410125732421875f)) / max(_881 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _868, _868);
            _872 = _871 + 1u;
            _868 = _869;
            _871 = _872;
            continue;
        }
        float _902 = clamp(_868 + _868, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _906 = mad(0.310000002384185791015625f - _861, _902, _861);
        float _907 = mad(0.014999999664723873138427734375f - _862, _902, _862);
        float _908 = mad(0.014999999664723873138427734375f - _863, _902, _863);
        float4 _909 = t9.Load(12u);
        float _910 = _909.x;
        float _938;
        float _939;
        float _940;
        if (_910 != 0.0f)
        {
            float _917 = clamp(_837, 0.0f, 1.0f);
            float _927 = clamp((_642 + (_910 - 1.0f)) / max(mad(_910, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _931 = clamp(_910 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _934 = mad(_931, -2.0f, 3.0f) * (_931 * _931);
            _938 = mad(((_642 * 0.930000007152557373046875f) * _917) * _927, _934, _908);
            _939 = mad(((_642 * 0.85000002384185791015625f) * _917) * _927, _934, _907);
            _940 = mad(((_642 * 0.790000021457672119140625f) * _917) * _927, _934, _906);
        }
        else
        {
            _938 = _908;
            _939 = _907;
            _940 = _906;
        }
        bool _943 = cb2_m13.y > 0.0f;
        bool _947 = frac((_407 * 420.0f) + (_787 * 0.20000000298023223876953125f)) >= 0.5f;
        float _948 = _947 ? 0.300000011920928955078125f : 0.0f;
        float _949 = _948 * cb2_m13.y;
        _960 = _943 ? mad(_949, 0.0f - _940, _940) : _940;
        _961 = _943 ? mad(_949, (_947 ? 0.100000001490116119384765625f : 0.0f) - _939, _939) : _939;
        _962 = _943 ? mad(_949, _948 - _938, _938) : _938;
    }
    else
    {
        _960 = _583;
        _961 = _584;
        _962 = _585;
    }
    float _967 = 1.0f / max(1.0f - max(max(_961, _962), _960), 6.099999882280826568603515625e-05f);
    float _974 = min(-(_967 * _960), 0.0f);
    float _975 = min(-(_967 * _961), 0.0f);
    float _976 = min(-(_967 * _962), 0.0f);
    float2 _979 = float2(_406 - 0.5f, _407 - 0.5f);
    float _990 = clamp(-((sqrt(dp2_f32(_979, _979)) - cb2_m7.x) * (1.0f / cb2_m7.y)), 0.0f, 1.0f);
    float _991 = mad(_990, -2.0f, 3.0f);
    float _992 = _990 * _990;
    float _993 = _991 * _992;
    float _995 = mad(-_991, _992, 1.0f);
    float _1018 = cb2_m7.z * cb2_m7.w;
    float3 _1031 = float3(_410 ? (-_974) : mad(_974 + ((_995 * cb2_m5.x) - (_974 * _993)), _1018, -_974), _410 ? (-_975) : mad(_1018, ((_995 * cb2_m5.y) - (_993 * _975)) + _975, -_975), _410 ? (-_976) : mad(_1018, ((_995 * cb2_m5.z) - (_993 * _976)) + _976, -_976));
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
         if (_586) {
            float3 scene_color = _1031;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[_580] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1038 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1031) * 2.5f, 65504.0f);
    float _1039 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1031) * 2.5f, 65504.0f);
    float _1040 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1031) * 2.5f, 65504.0f);
    float _1044 = max(max(_1039, _1038), _1040);
    float _1049 = (max(_1044, 9.9999997473787516355514526367188e-05f) - max(min(min(_1039, _1038), _1040), 9.9999997473787516355514526367188e-05f)) / max(_1044, 0.00999999977648258209228515625f);
    float _1060 = mad(sqrt(mad(_1038 - _1040, _1038, ((_1040 - _1039) * _1040) + ((_1039 - _1038) * _1039))), 1.75f, (_1040 + _1039) + _1038);
    float _1061 = _1049 - 0.4000000059604644775390625f;
    float _1065 = max(1.0f - abs(_1061 * 2.5f), 0.0f);
    float _1073 = mad(mad(clamp(mad(_1061, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1065, _1065, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1081 = ((_1060 <= 0.1599999964237213134765625f) ? _1073 : ((_1060 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1060 * 0.3333333432674407958984375f)) - 0.5f) * _1073))) + 1.0f;
    float _1082 = _1081 * _1038;
    float _1083 = _1081 * _1039;
    float _1084 = _1081 * _1040;
    float _1089 = (_1083 - _1084) * 1.73205077648162841796875f;
    float _1091 = (_1082 * 2.0f) - _1083;
    float _1093 = mad(-_1081, _1040, _1091);
    float _1094 = abs(_1093);
    float _1095 = abs(_1089);
    float _1099 = min(_1094, _1095) * (1.0f / max(_1094, _1095));
    float _1100 = _1099 * _1099;
    float _1104 = mad(_1100, mad(_1100, mad(_1100, mad(_1100, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1114 = mad(_1099, _1104, (_1094 < _1095) ? mad(_1099 * _1104, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1093 < mad(_1081, _1040, -_1091)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1115 = min(_1089, _1093);
    float _1116 = max(_1089, _1093);
    float _1125 = ((_1082 == _1083) && (_1084 == _1083)) ? 0.0f : ((((_1115 < (-_1115)) && (_1116 >= (-_1116))) ? (-_1114) : _1114) * 57.295780181884765625f);
    float _1128 = (_1125 < 0.0f) ? (_1125 + 360.0f) : _1125;
    float _1138 = max(1.0f - abs(((_1128 < (-180.0f)) ? (_1128 + 360.0f) : ((_1128 > 180.0f) ? (_1128 - 360.0f) : _1128)) * 0.01481481455266475677490234375f), 0.0f);
    float _1141 = mad(_1138, -2.0f, 3.0f) * (_1138 * _1138);
    float3 _1152 = float3(clamp(_1082 + (((_1049 * (_1141 * _1141)) * mad(-_1081, _1038, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1083, 0.0f, 65504.0f), clamp(_1084, 0.0f, 65504.0f));
    float _1156 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1152), 0.0f, 65504.0f);
    float _1157 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1152), 0.0f, 65504.0f);
    float _1158 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1152), 0.0f, 65504.0f);
    float _1160 = dp3_f32(float3(_1156, _1157, _1158), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1164 = mad(_1156 - _1160, 0.959999978542327880859375f, _1160);
    float _1165 = mad(_1157 - _1160, 0.959999978542327880859375f, _1160);
    float _1166 = mad(_1158 - _1160, 0.959999978542327880859375f, _1160);
    float _1173 = (_1164 <= 0.0f) ? (-14.0f) : log2(_1164);
    float _1174 = (_1165 <= 0.0f) ? (-14.0f) : log2(_1165);
    float _1175 = (_1166 <= 0.0f) ? (-14.0f) : log2(_1166);
    float _1262;
    if (_1173 <= (-17.4739322662353515625f))
    {
        _1262 = -4.0f;
    }
    else
    {
        float _1261;
        if (_1173 < (-2.4739310741424560546875f))
        {
            float _1186 = mad(_1173, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1187 = _1186 * 0.6643855571746826171875f;
            int _1188 = cvt_f32_i32(_1187);
            float _1191 = mad(_1186, 0.6643855571746826171875f, -trunc(_1187));
            uint _1197 = min(uint(_1188 + 4), 10u);
            uint _1203 = min(uint((_1188 + 1) + 4), 10u);
            uint _1209 = min(uint((_1188 + 2) + 4), 10u);
            float2 _1215 = float2(_281[_1197].x, _281[_1203].x);
            _1261 = dp3_f32(float3(_1191 * _1191, _1191, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1197].x, _281[_1203].x, _281[_1209].x)), dp2_f32(float2(-1.0f, 1.0f), _1215), dp2_f32(0.5f.xx, _1215)));
        }
        else
        {
            float _1260;
            if (_1173 < 15.52606868743896484375f)
            {
                float _1225 = mad(_1173, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1226 = _1225 * 0.55365467071533203125f;
                int _1227 = cvt_f32_i32(_1226);
                float _1230 = mad(_1225, 0.55365467071533203125f, -trunc(_1226));
                uint _1236 = min(uint(_1227 + 4), 10u);
                uint _1242 = min(uint((_1227 + 1) + 4), 10u);
                uint _1248 = min(uint((_1227 + 2) + 4), 10u);
                float2 _1254 = float2(_281[_1236].y, _281[_1242].y);
                _1260 = dp3_f32(float3(_1230 * _1230, _1230, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1236].y, _281[_1242].y, _281[_1248].y)), dp2_f32(float2(-1.0f, 1.0f), _1254), dp2_f32(0.5f.xx, _1254)));
            }
            else
            {
                _1260 = 4.0f;
            }
            _1261 = _1260;
        }
        _1262 = _1261;
    }
    float _1348;
    if (_1174 <= (-17.4739322662353515625f))
    {
        _1348 = -4.0f;
    }
    else
    {
        float _1347;
        if (_1174 < (-2.4739310741424560546875f))
        {
            float _1272 = mad(_1174, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1273 = _1272 * 0.6643855571746826171875f;
            int _1274 = cvt_f32_i32(_1273);
            float _1277 = mad(_1272, 0.6643855571746826171875f, -trunc(_1273));
            uint _1283 = min(uint(_1274 + 4), 10u);
            uint _1289 = min(uint((_1274 + 1) + 4), 10u);
            uint _1295 = min(uint((_1274 + 2) + 4), 10u);
            float2 _1301 = float2(_281[_1283].x, _281[_1289].x);
            _1347 = dp3_f32(float3(_1277 * _1277, _1277, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1283].x, _281[_1289].x, _281[_1295].x)), dp2_f32(float2(-1.0f, 1.0f), _1301), dp2_f32(0.5f.xx, _1301)));
        }
        else
        {
            float _1346;
            if (_1174 < 15.52606868743896484375f)
            {
                float _1311 = mad(_1174, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1312 = _1311 * 0.55365467071533203125f;
                int _1313 = cvt_f32_i32(_1312);
                float _1316 = mad(_1311, 0.55365467071533203125f, -trunc(_1312));
                uint _1322 = min(uint(_1313 + 4), 10u);
                uint _1328 = min(uint((_1313 + 1) + 4), 10u);
                uint _1334 = min(uint((_1313 + 2) + 4), 10u);
                float2 _1340 = float2(_281[_1322].y, _281[_1328].y);
                _1346 = dp3_f32(float3(_1316 * _1316, _1316, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1322].y, _281[_1328].y, _281[_1334].y)), dp2_f32(float2(-1.0f, 1.0f), _1340), dp2_f32(0.5f.xx, _1340)));
            }
            else
            {
                _1346 = 4.0f;
            }
            _1347 = _1346;
        }
        _1348 = _1347;
    }
    float _1434;
    if (_1175 <= (-17.4739322662353515625f))
    {
        _1434 = -4.0f;
    }
    else
    {
        float _1433;
        if (_1175 < (-2.4739310741424560546875f))
        {
            float _1358 = mad(_1175, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1359 = _1358 * 0.6643855571746826171875f;
            int _1360 = cvt_f32_i32(_1359);
            float _1363 = mad(_1358, 0.6643855571746826171875f, -trunc(_1359));
            uint _1369 = min(uint(_1360 + 4), 10u);
            uint _1375 = min(uint((_1360 + 1) + 4), 10u);
            uint _1381 = min(uint((_1360 + 2) + 4), 10u);
            float2 _1387 = float2(_281[_1369].x, _281[_1375].x);
            _1433 = dp3_f32(float3(_1363 * _1363, _1363, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1369].x, _281[_1375].x, _281[_1381].x)), dp2_f32(float2(-1.0f, 1.0f), _1387), dp2_f32(0.5f.xx, _1387)));
        }
        else
        {
            float _1432;
            if (_1175 < 15.52606868743896484375f)
            {
                float _1397 = mad(_1175, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1398 = _1397 * 0.55365467071533203125f;
                int _1399 = cvt_f32_i32(_1398);
                float _1402 = mad(_1397, 0.55365467071533203125f, -trunc(_1398));
                uint _1408 = min(uint(_1399 + 4), 10u);
                uint _1414 = min(uint((_1399 + 1) + 4), 10u);
                uint _1420 = min(uint((_1399 + 2) + 4), 10u);
                float2 _1426 = float2(_281[_1408].y, _281[_1414].y);
                _1432 = dp3_f32(float3(_1402 * _1402, _1402, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_281[_1408].y, _281[_1414].y, _281[_1420].y)), dp2_f32(float2(-1.0f, 1.0f), _1426), dp2_f32(0.5f.xx, _1426)));
            }
            else
            {
                _1432 = 4.0f;
            }
            _1433 = _1432;
        }
        _1434 = _1433;
    }
    float3 _1437 = float3(exp2(_1262 * 3.3219280242919921875f), exp2(_1348 * 3.3219280242919921875f), exp2(_1434 * 3.3219280242919921875f));
    float3 _1441 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1437), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1437), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1437));
    float _1442 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1441);
    float _1443 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1441);
    float _1444 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1441);
    float _1448 = (_1442 <= 0.0f) ? (-4.0f) : (log2(_1442) * 0.3010300099849700927734375f);
    float _1452 = log2(cb1_m[19u].y);
    float _1453 = _1452 * 0.3010300099849700927734375f;
    float _1561;
    if (_1453 >= _1448)
    {
        _1561 = mad(cb1_m[21u].x, _1448, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1453 * cb1_m[21u].x));
    }
    else
    {
        float _1470 = log2(cb1_m[20u].x);
        float _1471 = _1470 * 0.3010300099849700927734375f;
        float _1560;
        if ((_1453 < _1448) && (_1471 > _1448))
        {
            float _1480 = (mad(_1452, -0.3010300099849700927734375f, _1448) * 7.0f) / (_1471 - _1453);
            int _1481 = cvt_f32_i32(_1480);
            float _1483 = _1480 - trunc(_1480);
            uint _1485 = uint(_1481 + 1);
            uint _1487 = uint(_1481 + 2);
            uint _1489 = uint(_1481);
            float2 _1501 = float2(cb1_m[_1489].x, cb1_m[_1485].x);
            _1560 = dp3_f32(float3(_1483 * _1483, _1483, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1489].x, cb1_m[_1485].x, cb1_m[_1487].x)), dp2_f32(float2(-1.0f, 1.0f), _1501), dp2_f32(0.5f.xx, _1501)));
        }
        else
        {
            float _1511 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1559;
            if ((_1471 <= _1448) && (_1511 > _1448))
            {
                float _1520 = (mad(_1470, -0.3010300099849700927734375f, _1448) * 7.0f) / (_1511 - _1471);
                int _1521 = cvt_f32_i32(_1520);
                float _1523 = _1520 - trunc(_1520);
                uint _1528 = uint(_1521 + 10);
                uint _1533 = uint((_1521 + 1) + 10);
                uint _1538 = uint((_1521 + 2) + 10);
                float2 _1544 = float2(cb1_m[_1528].x, cb1_m[_1533].x);
                _1559 = dp3_f32(float3(_1523 * _1523, _1523, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1528].x, cb1_m[_1533].x, cb1_m[_1538].x)), dp2_f32(float2(-1.0f, 1.0f), _1544), dp2_f32(0.5f.xx, _1544)));
            }
            else
            {
                _1559 = mad(cb1_m[21u].y, _1448, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1511 * cb1_m[21u].y));
            }
            _1560 = _1559;
        }
        _1561 = _1560;
    }
    float _1565 = (_1443 <= 0.0f) ? (-4.0f) : (log2(_1443) * 0.3010300099849700927734375f);
    float _1673;
    if (_1453 >= _1565)
    {
        _1673 = mad(cb1_m[21u].x, _1565, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1453 * cb1_m[21u].x));
    }
    else
    {
        float _1582 = log2(cb1_m[20u].x);
        float _1583 = _1582 * 0.3010300099849700927734375f;
        float _1672;
        if ((_1453 < _1565) && (_1583 > _1565))
        {
            float _1592 = (mad(_1452, -0.3010300099849700927734375f, _1565) * 7.0f) / (_1583 - _1453);
            int _1593 = cvt_f32_i32(_1592);
            float _1595 = _1592 - trunc(_1592);
            uint _1597 = uint(_1593 + 1);
            uint _1599 = uint(_1593 + 2);
            uint _1601 = uint(_1593);
            float2 _1613 = float2(cb1_m[_1601].x, cb1_m[_1597].x);
            _1672 = dp3_f32(float3(_1595 * _1595, _1595, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1601].x, cb1_m[_1597].x, cb1_m[_1599].x)), dp2_f32(float2(-1.0f, 1.0f), _1613), dp2_f32(0.5f.xx, _1613)));
        }
        else
        {
            float _1623 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1671;
            if ((_1583 <= _1565) && (_1623 > _1565))
            {
                float _1632 = (mad(_1582, -0.3010300099849700927734375f, _1565) * 7.0f) / (_1623 - _1583);
                int _1633 = cvt_f32_i32(_1632);
                float _1635 = _1632 - trunc(_1632);
                uint _1640 = uint(_1633 + 10);
                uint _1645 = uint((_1633 + 1) + 10);
                uint _1650 = uint((_1633 + 2) + 10);
                float2 _1656 = float2(cb1_m[_1640].x, cb1_m[_1645].x);
                _1671 = dp3_f32(float3(_1635 * _1635, _1635, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1640].x, cb1_m[_1645].x, cb1_m[_1650].x)), dp2_f32(float2(-1.0f, 1.0f), _1656), dp2_f32(0.5f.xx, _1656)));
            }
            else
            {
                _1671 = mad(cb1_m[21u].y, _1565, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1623 * cb1_m[21u].y));
            }
            _1672 = _1671;
        }
        _1673 = _1672;
    }
    float _1677 = (_1444 <= 0.0f) ? (-4.0f) : (log2(_1444) * 0.3010300099849700927734375f);
    float _1785;
    if (_1453 >= _1677)
    {
        _1785 = mad(cb1_m[21u].x, _1677, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1453 * cb1_m[21u].x));
    }
    else
    {
        float _1694 = log2(cb1_m[20u].x);
        float _1695 = _1694 * 0.3010300099849700927734375f;
        float _1784;
        if ((_1453 < _1677) && (_1695 > _1677))
        {
            float _1704 = (mad(_1452, -0.3010300099849700927734375f, _1677) * 7.0f) / (_1695 - _1453);
            int _1705 = cvt_f32_i32(_1704);
            float _1707 = _1704 - trunc(_1704);
            uint _1709 = uint(_1705 + 1);
            uint _1711 = uint(_1705 + 2);
            uint _1713 = uint(_1705);
            float2 _1725 = float2(cb1_m[_1713].x, cb1_m[_1709].x);
            _1784 = dp3_f32(float3(_1707 * _1707, _1707, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1713].x, cb1_m[_1709].x, cb1_m[_1711].x)), dp2_f32(float2(-1.0f, 1.0f), _1725), dp2_f32(0.5f.xx, _1725)));
        }
        else
        {
            float _1735 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1783;
            if ((_1695 <= _1677) && (_1735 > _1677))
            {
                float _1744 = (mad(_1694, -0.3010300099849700927734375f, _1677) * 7.0f) / (_1735 - _1695);
                int _1745 = cvt_f32_i32(_1744);
                float _1747 = _1744 - trunc(_1744);
                uint _1752 = uint(_1745 + 10);
                uint _1757 = uint((_1745 + 1) + 10);
                uint _1762 = uint((_1745 + 2) + 10);
                float2 _1768 = float2(cb1_m[_1752].x, cb1_m[_1757].x);
                _1783 = dp3_f32(float3(_1747 * _1747, _1747, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1752].x, cb1_m[_1757].x, cb1_m[_1762].x)), dp2_f32(float2(-1.0f, 1.0f), _1768), dp2_f32(0.5f.xx, _1768)));
            }
            else
            {
                _1783 = mad(cb1_m[21u].y, _1677, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1735 * cb1_m[21u].y));
            }
            _1784 = _1783;
        }
        _1785 = _1784;
    }
    if (_586)
    {
        float3 _1797 = float3(exp2(_1561 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1673 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1785 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _1801 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1797), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1797), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1797));
        float3 _1805 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1801), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1801), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1801));
        float _1814 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1805) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1825 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1805) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1835 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1805) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[_580] = float4(min(exp2(log2(mad(_1814, 18.8515625f, 0.8359375f) / mad(_1814, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1825, 18.8515625f, 0.8359375f) / mad(_1825, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1835, 18.8515625f, 0.8359375f) / mad(_1835, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
