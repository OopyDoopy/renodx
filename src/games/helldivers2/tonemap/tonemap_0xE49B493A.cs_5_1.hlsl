#include "../common.hlsl"

struct _387
{
    uint2 _m0;
    uint _m1;
};

static const float _57[1] = { 0.0f };
static const float4 _289[11] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), float4(-4.0f, -0.718548238277435302734375f, 0.0f, 0.0f), float4(-4.0f, 2.0810306072235107421875f, 0.0f, 0.0f), float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.0f, 0.0f), float4(-0.485249996185302734375f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), float4(1.84773242473602294921875f, 4.0f, 0.0f, 0.0f), 0.0f.xxxx };

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
    precise float _378 = a.x * b.x;
    return mad(a.y, b.y, _378);
}

float dp3_f32(float3 a, float3 b)
{
    precise float _364 = a.x * b.x;
    return mad(a.z, b.z, mad(a.y, b.y, _364));
}

float dp4_f32(float4 a, float4 b)
{
    precise float _346 = a.x * b.x;
    return mad(a.w, b.w, mad(a.z, b.z, mad(a.y, b.y, _346)));
}

int cvt_f32_i32(float v)
{
    return isnan(v) ? 0 : ((v < (-2147483648.0f)) ? int(0x80000000) : ((v > 2147483520.0f) ? 2147483647 : int(v)));
}

void comp_main()
{
    uint _386_dummy_parameter;
    _387 _388 = { spvImageSize(u0, _386_dummy_parameter), 1u };
    uint _403 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 8u);
    uint _407 = (gl_GlobalInvocationID.x - gl_LocalInvocationID.x) + spvBitfieldUExtract(_403, 1u, 3u);
    uint _408 = spvBitfieldInsert(spvBitfieldUExtract(gl_LocalInvocationID.y, 0u, 29u), _403, 0u, 1u) + (gl_GlobalInvocationID.y - gl_LocalInvocationID.y);
    float _415 = (float(_407) + 0.5f) / float(_388._m0.x);
    float _416 = (float(_408) + 0.5f) / float(_388._m0.y);
    bool _419 = (_388._m0.x < _407) || (_388._m0.y < _408);
    bool _424 = cb2_m3.y == 1.0f;
    if (((gl_LocalInvocationID.x == 0u) && _424) && (gl_LocalInvocationID.y == 0u))
    {
        g0[0u] = t6.Load(int3(uint2(0u, 0u), 0u)).x;
    }
    GroupMemoryBarrierWithGroupSync();
    float2 _439 = float2(_415, _416);
    float _444 = mad(t4.SampleLevel(s3, _439, 0.0f).x, 2.0f, -1.0f);
    float _459;
    if (_444 > 0.0f)
    {
        _459 = min(sqrt(_444), t0.Load(8u).x);
    }
    else
    {
        _459 = max(_444, -t0.Load(7u).x);
    }
    float4 _463 = t3.SampleLevel(s2, _439, 0.0f);
    float2 _473 = float2(_463.x * cb2_m2.x, _463.y * cb2_m2.y);
    bool _485 = (cb2_m10.x != 0.0f) && (cb2_m10.y != 0.0f);
    bool _489 = (cb2_m8.w != 0.0f) && (cb2_m9.x != 0.0f);
    float _493 = abs(_459);
    float _501 = exp2(max(_485 ? clamp((sqrt(dp2_f32(_473, _473)) - 2.0f) * 0.0555555559694766998291015625f, 0.0f, 1.0f) : 0.0f, _489 ? clamp((_493 - 0.0471399985253810882568359375f) * 1.0494720935821533203125f, 0.0f, 1.0f) : 0.0f) * (-4.3280849456787109375f));
    float _502 = _415 - 0.5f;
    float _503 = _416 - 0.5f;
    float2 _504 = float2(_502, _503);
    float _505 = dp2_f32(_504, _504);
    float _508 = mad(_505, cb2_m12.y, 1.0f);
    float _530 = mad(exp2(log2(clamp(cb2_m12.y, 0.0f, 1.0f)) * 0.75f), -0.339999973773956298828125f, 1.0f) * mad(cb2_m13.x, -0.089999973773956298828125f, 1.0f);
    float _531 = (_508 * mad(cb2_m13.x, mad(cb2_m13.y, -0.001999996602535247802734375f, 0.092000000178813934326171875f), 1.0f)) * _530;
    float _532 = _530 * (_508 * mad(mad(cb2_m13.y, 0.04500000178813934326171875f, 0.046999998390674591064453125f), cb2_m13.x, 1.0f));
    float _533 = _530 * (_508 * mad(mad(cb2_m13.y, 0.0f, 0.04500000178813934326171875f), cb2_m13.x, 1.0f));
    float _534 = mad(_502, _531, 0.5f);
    float _535 = mad(_531, _503, 0.5f);
    float _536 = mad(_502, _532, 0.5f);
    float _537 = mad(_503, _532, 0.5f);
    float2 _540 = float2(_534, _535);
    float4 _542 = t1.SampleLevel(s0, _540, 0.0f);
    float _543 = _542.x;
    bool _544 = _489 || _485;
    float _578;
    if (_544)
    {
        float4 _550 = t2.SampleLevel(s1, _540, 0.0f);
        float _551 = _550.x;
        float _559 = asfloat(cb0_m[43u].w) * 20.0f;
        float _575 = mad(mad(t7.SampleLevel(s5, float2(mad(_534, 30.0f, sin(_559)), mad(_535, 30.0f, cos(_559))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_551, max(_550.y, _550.z)), 1.0000000133514319600180897396058e-10f)), _551);
        _578 = mad(_501, _543 - _575, _575);
    }
    else
    {
        _578 = _543;
    }
    float2 _579 = float2(_536, _537);
    float4 _581 = t1.SampleLevel(s0, _579, 0.0f);
    float _582 = _581.y;
    float _615;
    if (_544)
    {
        float4 _588 = t2.SampleLevel(s1, _579, 0.0f);
        float _590 = _588.y;
        float _596 = asfloat(cb0_m[43u].w) * 20.0f;
        float _612 = mad(mad(t7.SampleLevel(s5, float2(mad(_536, 30.0f, sin(_596)), mad(_537, 30.0f, cos(_596))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_588.x, max(_590, _588.z)), 1.0000000133514319600180897396058e-10f)), _590);
        _615 = mad(_501, _582 - _612, _612);
    }
    else
    {
        _615 = _582;
    }
    float _616 = mad(_502, _533, 0.5f);
    float _617 = mad(_503, _533, 0.5f);
    float2 _618 = float2(_616, _617);
    float4 _620 = t1.SampleLevel(s0, _618, 0.0f);
    float _621 = _620.z;
    float _654;
    if (_544)
    {
        float4 _627 = t2.SampleLevel(s1, _618, 0.0f);
        float _630 = _627.z;
        float _635 = asfloat(cb0_m[43u].w) * 20.0f;
        float _651 = mad(mad(t7.SampleLevel(s5, float2(mad(_616, 30.0f, sin(_635)), mad(_617, 30.0f, cos(_635))), 0.0f).x, 0.00999999977648258209228515625f, -0.004999999888241291046142578125f), sqrt(max(max(_627.x, max(_627.y, _630)), 1.0000000133514319600180897396058e-10f)), _630);
        _654 = mad(_501, _621 - _651, _651);
    }
    else
    {
        _654 = _621;
    }
    float _659 = _424 ? g0[0u] : cb2_m3.x;
    float4 _663 = t5.SampleLevel(s4, _439, 0.0f);
    float _664 = _663.x;
    float _672 = max(cb2_m4.y - dp3_f32(float3(_664, _663.yz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f)), 6.099999882280826568603515625e-05f);
    float _676 = mad(_659, _578, _664 / _672);
    float _677 = mad(_659, _615, _663.y / _672);
    float _678 = mad(_659, _654, _663.z / _672);
    float _682 = 1.0f / (max(_676, max(_677, _678)) + 1.0f);
    float _683 = _676 * _682;
    float _685 = _682 * _678;
    float3 _686 = float3(_683, _685, _682 * _677);
    float _687 = dp3_f32(_686, float3(0.25f, 0.25f, 0.5f));
    float _688 = dp3_f32(_686, float3(-0.25f, -0.25f, 0.5f));
    float _690 = dp2_f32(float2(_683, _685), float2(0.5f, -0.5f));
    float _691 = _687 - _688;
    float _692 = _690 + _691;
    float _693 = _687 + _688;
    float _694 = _691 - _690;
    bool _695 = !_419;
    float _1066;
    float _1067;
    float _1068;
    if (_695)
    {
        float _699 = dp3_f32(float3(_692, _693, _694), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _706 = mad(-_493, cb2_m9.y, 1.0f) * cb2_m8.x;
        float _710 = mad(_706, _692 - _699, _699);
        float _711 = mad(_706, _693 - _699, _699);
        float _712 = mad(_706, _694 - _699, _699);
        float _713 = _503 + _503;
        float _714 = _502 + _502;
        float _715 = abs(_714);
        float _716 = abs(_713);
        float _720 = min(_715, _716) * (1.0f / max(_715, _716));
        float _721 = _720 * _720;
        float _725 = mad(_721, mad(_721, mad(_721, mad(_721, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _734 = mad(_720, _725, (_715 < _716) ? mad(_720 * _725, -2.0f, 1.57079637050628662109375f) : 0.0f) + (((-_714) > _714) ? (-3.1415927410125732421875f) : 0.0f);
        float _735 = min(_713, _714);
        float _736 = max(_713, _714);
        float _743 = ((_735 < (-_735)) && (_736 >= (-_736))) ? (-_734) : _734;
        float4 _747 = t8.SampleLevel(s6, _439, 0.0f);
        float _748 = _747.x;
        float _749 = _747.y;
        float _750 = _747.z;
        float _751 = _747.w;
        float _756 = (_711 - _712) * 1.73205077648162841796875f;
        float _758 = mad(_710, 2.0f, -_711);
        float _759 = _758 - _712;
        float _760 = abs(_756);
        float _761 = abs(_759);
        float _765 = min(_760, _761) * (1.0f / max(_760, _761));
        float _766 = _765 * _765;
        float _770 = mad(_766, mad(_766, mad(_766, mad(_766, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
        float _779 = mad(_765, _770, (_760 > _761) ? mad(_765 * _770, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_759 < (_712 - _758)) ? (-3.1415927410125732421875f) : 0.0f);
        float _780 = min(_756, _759);
        float _781 = max(_756, _759);
        float _790 = ((_710 == _711) && (_711 == _712)) ? 0.0f : ((((_780 < (-_780)) && (_781 >= (-_781))) ? (-_779) : _779) * 57.295780181884765625f);
        float _799 = mad(cb2_m15.x, -360.0f, (_790 < 0.0f) ? (_790 + 360.0f) : _790);
        float _809 = clamp(1.0f - (abs((_799 < (-180.0f)) ? (_799 + 360.0f) : ((_799 > 180.0f) ? (_799 - 360.0f) : _799)) / (cb2_m15.y * 180.0f)), 0.0f, 1.0f);
        float _814 = dp3_f32(float3(_710, _711, _712), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _817 = (mad(_809, -2.0f, 3.0f) * (_809 * _809)) * cb2_m15.z;
        float _829 = mad(mad(_817, _710 - _814, _814) - _710, cb2_m14.x, _710);
        float _830 = mad(cb2_m14.x, mad(_817, _711 - _814, _814) - _711, _711);
        float _831 = mad(cb2_m14.x, mad(_817, _712 - _814, _814) - _712, _712);
        float _833;
        _833 = 0.0f;
        float _834;
        uint _837;
        uint _836 = 0u;
        for (;;)
        {
            if (_836 >= 8u)
            {
                break;
            }
            uint _848 = min((_836 & 3u), 10u);
            float _868 = mad(float(_836), 0.785398185253143310546875f, -_743);
            float _869 = _868 + 1.57079637050628662109375f;
            _834 = mad(_751 * (dp4_f32(t9.Load((_836 >> 2u) + 10u), float4(_289[_848].x, _289[_848].y, _289[_848].z, _289[_848].w)) * clamp((abs((_869 > 3.1415927410125732421875f) ? (_868 - 4.7123889923095703125f) : _869) - 2.19911479949951171875f) * 2.1220657825469970703125f, 0.0f, 1.0f)), 1.0f - _833, _833);
            _837 = _836 + 1u;
            _833 = _834;
            _836 = _837;
            continue;
        }
        float _880 = clamp(_833, 0.0f, 1.0f);
        float _893 = asfloat(cb0_m[43u].w);
        float _899 = abs(t9.Load(8u).x);
        float2 _902 = float2(_502 * 1.40999996662139892578125f, _503 * 1.40999996662139892578125f);
        float _904 = sqrt(dp2_f32(_902, _902));
        float _905 = min(_904, 1.0f);
        float _906 = _905 * _905;
        float _911 = clamp(_904 - 0.5f, 0.0f, 1.0f);
        float _914 = (_905 * _906) + (mad(-_905, _906, 1.0f) * (_911 * _911));
        float _915 = mad(mad(mad(sin(_893 * 6.0f), 0.5f, 0.5f), 0.089999973773956298828125f, 0.910000026226043701171875f), _899, -1.0f);
        float _917 = _749 + _915;
        float _919 = clamp((_750 + _915) * 1.53846156597137451171875f, 0.0f, 1.0f);
        float _926 = clamp(_917 + _917, 0.0f, 1.0f);
        float _943 = dp3_f32(float3(t10.Load(8u).xyz), float3(0.21269999444484710693359375f, 0.715200006961822509765625f, 0.07209999859333038330078125f));
        float _949 = mad(sin(_749 * 17.52899932861328125f) + 1.0f, -0.1149999797344207763671875f, 0.89999997615814208984375f) * mad(exp2(log2(abs(_943)) * 0.699999988079071044921875f), 0.10000002384185791015625f, 0.89999997615814208984375f);
        float _951 = _949 * 0.02999999932944774627685546875f;
        float _952 = mad(_899, -0.3499999940395355224609375f, 0.3499999940395355224609375f);
        float _956 = mad(mad(-_914, _914, 1.0f), 1.0f - _952, _952);
        float _957 = min((exp2(log2(_914) * 0.699999988079071044921875f) * (mad(_926, -2.0f, 3.0f) * (_926 * _926))) + (mad(_919, -2.0f, 3.0f) * (_919 * _919)), 1.0f);
        float _967 = mad(_957, mad(_956, _949 * 0.62000000476837158203125f, mad(_829, _880, -_829)), mad(-_829, _880, _829));
        float _968 = mad(_957, mad(_956, _951, mad(_880, _830, -_830)), mad(-_880, _830, _830));
        float _969 = mad(_957, mad(_956, _951, mad(_880, _831, -_831)), mad(-_880, _831, _831));
        float _972 = mad(_749, _750 * (1.0f - _751), _751);
        float _974;
        _974 = 0.0f;
        float _975;
        uint _978;
        uint _977 = 0u;
        for (;;)
        {
            if (int(_977) >= 8)
            {
                break;
            }
            float4 _985 = t9.Load(_977);
            float _987 = _985.y;
            float _989 = _985.x - _743;
            _975 = mad(_972 * (_985.w * clamp((abs((_989 > 3.1415927410125732421875f) ? (_989 - 6.283185482025146484375f) : ((_989 < (-3.1415927410125732421875f)) ? (_989 + 6.283185482025146484375f) : _989)) + (_987 - 3.1415927410125732421875f)) / max(_987 * 0.699999988079071044921875f, 0.001000000047497451305389404296875f), 0.0f, 1.0f)), 1.0f - _974, _974);
            _978 = _977 + 1u;
            _974 = _975;
            _977 = _978;
            continue;
        }
        float _1008 = clamp(_974 + _974, 0.0f, 1.0f) * 0.949999988079071044921875f;
        float _1012 = mad(_1008, 0.310000002384185791015625f - _967, _967);
        float _1013 = mad(_1008, 0.014999999664723873138427734375f - _968, _968);
        float _1014 = mad(_1008, 0.014999999664723873138427734375f - _969, _969);
        float4 _1015 = t9.Load(12u);
        float _1016 = _1015.x;
        float _1044;
        float _1045;
        float _1046;
        if (_1016 != 0.0f)
        {
            float _1023 = clamp(_943, 0.0f, 1.0f);
            float _1033 = clamp((_748 + (_1016 - 1.0f)) / max(mad(_1016, 0.5f, 0.5f), 0.001000000047497451305389404296875f), 0.0f, 1.0f);
            float _1037 = clamp(_1016 * 2.857142925262451171875f, 0.0f, 1.0f);
            float _1040 = mad(_1037, -2.0f, 3.0f) * (_1037 * _1037);
            _1044 = mad(((_748 * 0.930000007152557373046875f) * _1023) * _1033, _1040, _1014);
            _1045 = mad(((_748 * 0.85000002384185791015625f) * _1023) * _1033, _1040, _1013);
            _1046 = mad(((_748 * 0.790000021457672119140625f) * _1023) * _1033, _1040, _1012);
        }
        else
        {
            _1044 = _1014;
            _1045 = _1013;
            _1046 = _1012;
        }
        bool _1049 = cb2_m14.y > 0.0f;
        bool _1053 = frac((_416 * 420.0f) + (_893 * 0.20000000298023223876953125f)) >= 0.5f;
        float _1054 = _1053 ? 0.300000011920928955078125f : 0.0f;
        float _1055 = _1054 * cb2_m14.y;
        _1066 = _1049 ? mad(_1055, 0.0f - _1046, _1046) : _1046;
        _1067 = _1049 ? mad((_1053 ? 0.100000001490116119384765625f : 0.0f) - _1045, _1055, _1045) : _1045;
        _1068 = _1049 ? mad(_1054 - _1044, _1055, _1044) : _1044;
    }
    else
    {
        _1066 = _692;
        _1067 = _693;
        _1068 = _694;
    }
    float _1073 = 1.0f / max(1.0f - max(max(_1067, _1068), _1066), 6.099999882280826568603515625e-05f);
    float _1080 = min(-(_1073 * _1066), 0.0f);
    float _1081 = min(-(_1073 * _1067), 0.0f);
    float _1082 = min(-(_1073 * _1068), 0.0f);
    float _1092 = clamp(-((sqrt(_505) - cb2_m7.x) * (1.0f / cb2_m7.y)), 0.0f, 1.0f);
    float _1093 = mad(_1092, -2.0f, 3.0f);
    float _1094 = _1092 * _1092;
    float _1095 = _1093 * _1094;
    float _1097 = mad(-_1093, _1094, 1.0f);
    float _1120 = cb2_m7.z * cb2_m7.w;
    float3 _1133 = float3(_419 ? (-_1080) : mad(_1080 + ((_1097 * cb2_m5.x) - (_1080 * _1095)), _1120, -_1080), _419 ? (-_1081) : mad(_1120, ((_1097 * cb2_m5.y) - (_1095 * _1081)) + _1081, -_1081), _419 ? (-_1082) : mad(_1120, ((_1097 * cb2_m5.z) - (_1095 * _1082)) + _1082, -_1082));
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
         if (_695) {
            float3 scene_color = _1133;
            float3 output_color = CustomTonemap(scene_color, aces_parameters);
            u0[uint2(_407, _408)] = float4(output_color, 1.f);
        }
        return;
    }
    #endif
    float _1140 = min(dp3_f32(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), _1133) * 2.5f, 65504.0f);
    float _1141 = min(dp3_f32(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), _1133) * 2.5f, 65504.0f);
    float _1142 = min(dp3_f32(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), _1133) * 2.5f, 65504.0f);
    float _1146 = max(max(_1141, _1140), _1142);
    float _1151 = (max(_1146, 9.9999997473787516355514526367188e-05f) - max(min(min(_1141, _1140), _1142), 9.9999997473787516355514526367188e-05f)) / max(_1146, 0.00999999977648258209228515625f);
    float _1162 = mad(sqrt(mad(_1140 - _1142, _1140, ((_1142 - _1141) * _1142) + ((_1141 - _1140) * _1141))), 1.75f, (_1142 + _1141) + _1140);
    float _1163 = _1151 - 0.4000000059604644775390625f;
    float _1167 = max(1.0f - abs(_1163 * 2.5f), 0.0f);
    float _1175 = mad(mad(clamp(mad(_1163, asfloat(0x7f800000u /* inf */), 0.5f), 0.0f, 1.0f), 2.0f, -1.0f), mad(-_1167, _1167, 1.0f), 1.0f) * 0.02500000037252902984619140625f;
    float _1183 = ((_1162 <= 0.1599999964237213134765625f) ? _1175 : ((_1162 >= 0.4799999892711639404296875f) ? 0.0f : (((0.07999999821186065673828125f / (_1162 * 0.3333333432674407958984375f)) - 0.5f) * _1175))) + 1.0f;
    float _1184 = _1183 * _1140;
    float _1185 = _1183 * _1141;
    float _1186 = _1183 * _1142;
    float _1191 = (_1185 - _1186) * 1.73205077648162841796875f;
    float _1193 = (_1184 * 2.0f) - _1185;
    float _1195 = mad(-_1183, _1142, _1193);
    float _1196 = abs(_1195);
    float _1197 = abs(_1191);
    float _1201 = min(_1196, _1197) * (1.0f / max(_1196, _1197));
    float _1202 = _1201 * _1201;
    float _1206 = mad(_1202, mad(_1202, mad(_1202, mad(_1202, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
    float _1216 = mad(_1201, _1206, (_1196 < _1197) ? mad(_1201 * _1206, -2.0f, 1.57079637050628662109375f) : 0.0f) + ((_1195 < mad(_1183, _1142, -_1193)) ? (-3.1415927410125732421875f) : 0.0f);
    float _1217 = min(_1191, _1195);
    float _1218 = max(_1191, _1195);
    float _1227 = ((_1184 == _1185) && (_1186 == _1185)) ? 0.0f : ((((_1217 < (-_1217)) && (_1218 >= (-_1218))) ? (-_1216) : _1216) * 57.295780181884765625f);
    float _1230 = (_1227 < 0.0f) ? (_1227 + 360.0f) : _1227;
    float _1240 = max(1.0f - abs(((_1230 < (-180.0f)) ? (_1230 + 360.0f) : ((_1230 > 180.0f) ? (_1230 - 360.0f) : _1230)) * 0.01481481455266475677490234375f), 0.0f);
    float _1243 = mad(_1240, -2.0f, 3.0f) * (_1240 * _1240);
    float3 _1254 = float3(clamp(_1184 + (((_1151 * (_1243 * _1243)) * mad(-_1183, _1140, 0.02999999932944774627685546875f)) * 0.180000007152557373046875f), 0.0f, 65504.0f), clamp(_1185, 0.0f, 65504.0f), clamp(_1186, 0.0f, 65504.0f));
    float _1258 = clamp(dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1254), 0.0f, 65504.0f);
    float _1259 = clamp(dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1254), 0.0f, 65504.0f);
    float _1260 = clamp(dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1254), 0.0f, 65504.0f);
    float _1262 = dp3_f32(float3(_1258, _1259, _1260), float3(0.2722289860248565673828125f, 0.674081981182098388671875f, 0.0536894984543323516845703125f));
    float _1266 = mad(_1258 - _1262, 0.959999978542327880859375f, _1262);
    float _1267 = mad(_1259 - _1262, 0.959999978542327880859375f, _1262);
    float _1268 = mad(_1260 - _1262, 0.959999978542327880859375f, _1262);
    float _1275 = (_1266 <= 0.0f) ? (-14.0f) : log2(_1266);
    float _1276 = (_1267 <= 0.0f) ? (-14.0f) : log2(_1267);
    float _1277 = (_1268 <= 0.0f) ? (-14.0f) : log2(_1268);
    float _1364;
    if (_1275 <= (-17.4739322662353515625f))
    {
        _1364 = -4.0f;
    }
    else
    {
        float _1363;
        if (_1275 < (-2.4739310741424560546875f))
        {
            float _1288 = mad(_1275, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1289 = _1288 * 0.6643855571746826171875f;
            int _1290 = cvt_f32_i32(_1289);
            float _1293 = mad(_1288, 0.6643855571746826171875f, -trunc(_1289));
            uint _1299 = min(uint(_1290 + 4), 10u);
            uint _1305 = min(uint((_1290 + 1) + 4), 10u);
            uint _1311 = min(uint((_1290 + 2) + 4), 10u);
            float2 _1317 = float2(_289[_1299].x, _289[_1305].x);
            _1363 = dp3_f32(float3(_1293 * _1293, _1293, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1299].x, _289[_1305].x, _289[_1311].x)), dp2_f32(float2(-1.0f, 1.0f), _1317), dp2_f32(0.5f.xx, _1317)));
        }
        else
        {
            float _1362;
            if (_1275 < 15.52606868743896484375f)
            {
                float _1327 = mad(_1275, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1328 = _1327 * 0.55365467071533203125f;
                int _1329 = cvt_f32_i32(_1328);
                float _1332 = mad(_1327, 0.55365467071533203125f, -trunc(_1328));
                uint _1338 = min(uint(_1329 + 4), 10u);
                uint _1344 = min(uint((_1329 + 1) + 4), 10u);
                uint _1350 = min(uint((_1329 + 2) + 4), 10u);
                float2 _1356 = float2(_289[_1338].y, _289[_1344].y);
                _1362 = dp3_f32(float3(_1332 * _1332, _1332, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1338].y, _289[_1344].y, _289[_1350].y)), dp2_f32(float2(-1.0f, 1.0f), _1356), dp2_f32(0.5f.xx, _1356)));
            }
            else
            {
                _1362 = 4.0f;
            }
            _1363 = _1362;
        }
        _1364 = _1363;
    }
    float _1450;
    if (_1276 <= (-17.4739322662353515625f))
    {
        _1450 = -4.0f;
    }
    else
    {
        float _1449;
        if (_1276 < (-2.4739310741424560546875f))
        {
            float _1374 = mad(_1276, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1375 = _1374 * 0.6643855571746826171875f;
            int _1376 = cvt_f32_i32(_1375);
            float _1379 = mad(_1374, 0.6643855571746826171875f, -trunc(_1375));
            uint _1385 = min(uint(_1376 + 4), 10u);
            uint _1391 = min(uint((_1376 + 1) + 4), 10u);
            uint _1397 = min(uint((_1376 + 2) + 4), 10u);
            float2 _1403 = float2(_289[_1385].x, _289[_1391].x);
            _1449 = dp3_f32(float3(_1379 * _1379, _1379, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1385].x, _289[_1391].x, _289[_1397].x)), dp2_f32(float2(-1.0f, 1.0f), _1403), dp2_f32(0.5f.xx, _1403)));
        }
        else
        {
            float _1448;
            if (_1276 < 15.52606868743896484375f)
            {
                float _1413 = mad(_1276, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1414 = _1413 * 0.55365467071533203125f;
                int _1415 = cvt_f32_i32(_1414);
                float _1418 = mad(_1413, 0.55365467071533203125f, -trunc(_1414));
                uint _1424 = min(uint(_1415 + 4), 10u);
                uint _1430 = min(uint((_1415 + 1) + 4), 10u);
                uint _1436 = min(uint((_1415 + 2) + 4), 10u);
                float2 _1442 = float2(_289[_1424].y, _289[_1430].y);
                _1448 = dp3_f32(float3(_1418 * _1418, _1418, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1424].y, _289[_1430].y, _289[_1436].y)), dp2_f32(float2(-1.0f, 1.0f), _1442), dp2_f32(0.5f.xx, _1442)));
            }
            else
            {
                _1448 = 4.0f;
            }
            _1449 = _1448;
        }
        _1450 = _1449;
    }
    float _1536;
    if (_1277 <= (-17.4739322662353515625f))
    {
        _1536 = -4.0f;
    }
    else
    {
        float _1535;
        if (_1277 < (-2.4739310741424560546875f))
        {
            float _1460 = mad(_1277, 0.3010300099849700927734375f, 5.2601776123046875f);
            float _1461 = _1460 * 0.6643855571746826171875f;
            int _1462 = cvt_f32_i32(_1461);
            float _1465 = mad(_1460, 0.6643855571746826171875f, -trunc(_1461));
            uint _1471 = min(uint(_1462 + 4), 10u);
            uint _1477 = min(uint((_1462 + 1) + 4), 10u);
            uint _1483 = min(uint((_1462 + 2) + 4), 10u);
            float2 _1489 = float2(_289[_1471].x, _289[_1477].x);
            _1535 = dp3_f32(float3(_1465 * _1465, _1465, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1471].x, _289[_1477].x, _289[_1483].x)), dp2_f32(float2(-1.0f, 1.0f), _1489), dp2_f32(0.5f.xx, _1489)));
        }
        else
        {
            float _1534;
            if (_1277 < 15.52606868743896484375f)
            {
                float _1499 = mad(_1277, 0.3010300099849700927734375f, 0.74472749233245849609375f);
                float _1500 = _1499 * 0.55365467071533203125f;
                int _1501 = cvt_f32_i32(_1500);
                float _1504 = mad(_1499, 0.55365467071533203125f, -trunc(_1500));
                uint _1510 = min(uint(_1501 + 4), 10u);
                uint _1516 = min(uint((_1501 + 1) + 4), 10u);
                uint _1522 = min(uint((_1501 + 2) + 4), 10u);
                float2 _1528 = float2(_289[_1510].y, _289[_1516].y);
                _1534 = dp3_f32(float3(_1504 * _1504, _1504, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(_289[_1510].y, _289[_1516].y, _289[_1522].y)), dp2_f32(float2(-1.0f, 1.0f), _1528), dp2_f32(0.5f.xx, _1528)));
            }
            else
            {
                _1534 = 4.0f;
            }
            _1535 = _1534;
        }
        _1536 = _1535;
    }
    float3 _1539 = float3(exp2(_1364 * 3.3219280242919921875f), exp2(_1450 * 3.3219280242919921875f), exp2(_1536 * 3.3219280242919921875f));
    float3 _1543 = float3(dp3_f32(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), _1539), dp3_f32(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), _1539), dp3_f32(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), _1539));
    float _1544 = dp3_f32(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), _1543);
    float _1545 = dp3_f32(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), _1543);
    float _1546 = dp3_f32(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), _1543);
    float _1550 = (_1544 <= 0.0f) ? (-4.0f) : (log2(_1544) * 0.3010300099849700927734375f);
    float _1554 = log2(cb1_m[19u].y);
    float _1555 = _1554 * 0.3010300099849700927734375f;
    float _1663;
    if (_1555 >= _1550)
    {
        _1663 = mad(cb1_m[21u].x, _1550, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1555 * cb1_m[21u].x));
    }
    else
    {
        float _1572 = log2(cb1_m[20u].x);
        float _1573 = _1572 * 0.3010300099849700927734375f;
        float _1662;
        if ((_1555 < _1550) && (_1573 > _1550))
        {
            float _1582 = (mad(_1554, -0.3010300099849700927734375f, _1550) * 7.0f) / (_1573 - _1555);
            int _1583 = cvt_f32_i32(_1582);
            float _1585 = _1582 - trunc(_1582);
            uint _1587 = uint(_1583 + 1);
            uint _1589 = uint(_1583 + 2);
            uint _1591 = uint(_1583);
            float2 _1603 = float2(cb1_m[_1591].x, cb1_m[_1587].x);
            _1662 = dp3_f32(float3(_1585 * _1585, _1585, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1591].x, cb1_m[_1587].x, cb1_m[_1589].x)), dp2_f32(float2(-1.0f, 1.0f), _1603), dp2_f32(0.5f.xx, _1603)));
        }
        else
        {
            float _1613 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1661;
            if ((_1573 <= _1550) && (_1613 > _1550))
            {
                float _1622 = (mad(_1572, -0.3010300099849700927734375f, _1550) * 7.0f) / (_1613 - _1573);
                int _1623 = cvt_f32_i32(_1622);
                float _1625 = _1622 - trunc(_1622);
                uint _1630 = uint(_1623 + 10);
                uint _1635 = uint((_1623 + 1) + 10);
                uint _1640 = uint((_1623 + 2) + 10);
                float2 _1646 = float2(cb1_m[_1630].x, cb1_m[_1635].x);
                _1661 = dp3_f32(float3(_1625 * _1625, _1625, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1630].x, cb1_m[_1635].x, cb1_m[_1640].x)), dp2_f32(float2(-1.0f, 1.0f), _1646), dp2_f32(0.5f.xx, _1646)));
            }
            else
            {
                _1661 = mad(cb1_m[21u].y, _1550, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1613 * cb1_m[21u].y));
            }
            _1662 = _1661;
        }
        _1663 = _1662;
    }
    float _1667 = (_1545 <= 0.0f) ? (-4.0f) : (log2(_1545) * 0.3010300099849700927734375f);
    float _1775;
    if (_1555 >= _1667)
    {
        _1775 = mad(cb1_m[21u].x, _1667, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1555 * cb1_m[21u].x));
    }
    else
    {
        float _1684 = log2(cb1_m[20u].x);
        float _1685 = _1684 * 0.3010300099849700927734375f;
        float _1774;
        if ((_1555 < _1667) && (_1685 > _1667))
        {
            float _1694 = (mad(_1554, -0.3010300099849700927734375f, _1667) * 7.0f) / (_1685 - _1555);
            int _1695 = cvt_f32_i32(_1694);
            float _1697 = _1694 - trunc(_1694);
            uint _1699 = uint(_1695 + 1);
            uint _1701 = uint(_1695 + 2);
            uint _1703 = uint(_1695);
            float2 _1715 = float2(cb1_m[_1703].x, cb1_m[_1699].x);
            _1774 = dp3_f32(float3(_1697 * _1697, _1697, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1703].x, cb1_m[_1699].x, cb1_m[_1701].x)), dp2_f32(float2(-1.0f, 1.0f), _1715), dp2_f32(0.5f.xx, _1715)));
        }
        else
        {
            float _1725 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1773;
            if ((_1685 <= _1667) && (_1725 > _1667))
            {
                float _1734 = (mad(_1684, -0.3010300099849700927734375f, _1667) * 7.0f) / (_1725 - _1685);
                int _1735 = cvt_f32_i32(_1734);
                float _1737 = _1734 - trunc(_1734);
                uint _1742 = uint(_1735 + 10);
                uint _1747 = uint((_1735 + 1) + 10);
                uint _1752 = uint((_1735 + 2) + 10);
                float2 _1758 = float2(cb1_m[_1742].x, cb1_m[_1747].x);
                _1773 = dp3_f32(float3(_1737 * _1737, _1737, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1742].x, cb1_m[_1747].x, cb1_m[_1752].x)), dp2_f32(float2(-1.0f, 1.0f), _1758), dp2_f32(0.5f.xx, _1758)));
            }
            else
            {
                _1773 = mad(cb1_m[21u].y, _1667, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1725 * cb1_m[21u].y));
            }
            _1774 = _1773;
        }
        _1775 = _1774;
    }
    float _1779 = (_1546 <= 0.0f) ? (-4.0f) : (log2(_1546) * 0.3010300099849700927734375f);
    float _1887;
    if (_1555 >= _1779)
    {
        _1887 = mad(cb1_m[21u].x, _1779, (log2(cb1_m[19u].z) * 0.3010300099849700927734375f) - (_1555 * cb1_m[21u].x));
    }
    else
    {
        float _1796 = log2(cb1_m[20u].x);
        float _1797 = _1796 * 0.3010300099849700927734375f;
        float _1886;
        if ((_1555 < _1779) && (_1797 > _1779))
        {
            float _1806 = (mad(_1554, -0.3010300099849700927734375f, _1779) * 7.0f) / (_1797 - _1555);
            int _1807 = cvt_f32_i32(_1806);
            float _1809 = _1806 - trunc(_1806);
            uint _1811 = uint(_1807 + 1);
            uint _1813 = uint(_1807 + 2);
            uint _1815 = uint(_1807);
            float2 _1827 = float2(cb1_m[_1815].x, cb1_m[_1811].x);
            _1886 = dp3_f32(float3(_1809 * _1809, _1809, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1815].x, cb1_m[_1811].x, cb1_m[_1813].x)), dp2_f32(float2(-1.0f, 1.0f), _1827), dp2_f32(0.5f.xx, _1827)));
        }
        else
        {
            float _1837 = log2(cb1_m[20u].z) * 0.3010300099849700927734375f;
            float _1885;
            if ((_1797 <= _1779) && (_1837 > _1779))
            {
                float _1846 = (mad(_1796, -0.3010300099849700927734375f, _1779) * 7.0f) / (_1837 - _1797);
                int _1847 = cvt_f32_i32(_1846);
                float _1849 = _1846 - trunc(_1846);
                uint _1854 = uint(_1847 + 10);
                uint _1859 = uint((_1847 + 1) + 10);
                uint _1864 = uint((_1847 + 2) + 10);
                float2 _1870 = float2(cb1_m[_1854].x, cb1_m[_1859].x);
                _1885 = dp3_f32(float3(_1849 * _1849, _1849, 1.0f), float3(dp3_f32(float3(0.5f, -1.0f, 0.5f), float3(cb1_m[_1854].x, cb1_m[_1859].x, cb1_m[_1864].x)), dp2_f32(float2(-1.0f, 1.0f), _1870), dp2_f32(0.5f.xx, _1870)));
            }
            else
            {
                _1885 = mad(cb1_m[21u].y, _1779, (log2(cb1_m[20u].w) * 0.3010300099849700927734375f) - (_1837 * cb1_m[21u].y));
            }
            _1886 = _1885;
        }
        _1887 = _1886;
    }
    if (_695)
    {
        float3 _1899 = float3(exp2(_1663 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1775 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f, exp2(_1887 * 3.3219280242919921875f) - 3.5073844628641381859779357910156e-05f);
        float3 _1903 = float3(dp3_f32(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), _1899), dp3_f32(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), _1899), dp3_f32(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), _1899));
        float3 _1907 = float3(dp3_f32(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), _1903), dp3_f32(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), _1903), dp3_f32(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), _1903));
        float _1916 = exp2(log2(abs(dp3_f32(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), _1907) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1927 = exp2(log2(abs(dp3_f32(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), _1907) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        float _1937 = exp2(log2(abs(dp3_f32(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), _1907) * 9.9999997473787516355514526367188e-05f)) * 0.1593017578125f);
        u0[uint2(_407, _408)] = float4(min(exp2(log2(mad(_1916, 18.8515625f, 0.8359375f) / mad(_1916, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1927, 18.8515625f, 0.8359375f) / mad(_1927, 18.6875f, 1.0f)) * 78.84375f), 1.0f), min(exp2(log2(mad(_1937, 18.8515625f, 0.8359375f) / mad(_1937, 18.6875f, 1.0f)) * 78.84375f), 1.0f), 1.0f);
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}
