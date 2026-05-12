#include "../tonemap.hlsli"

struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessAbyssCommon_CD {
  PostProcessAbyssCommon_CDStruct BindlessParameters_PostProcessAbyssCommon_CD;
};

typedef BindlessParameters_PostProcessAbyssCommon_CD BindlessParameters_PostProcessAbyssCommon_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssCommon_CD_t> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _21;
  float _22;
  float _23;
  float _26;
  float _28;
  float _64;
  float _68;
  float _69;
  float _70;
  float _72;
  float _73;
  float _74;
  float _75;
  int _76;
  int _84;
  float4 _91;
  int _98;
  int _106;
  float4 _113;
  int _122;
  int _130;
  float4 _137;
  float _140;
  float _141;
  int _146;
  int _154;
  float4 _161;
  int _170;
  int _178;
  float4 _185;
  float _191;
  float _193;
  float _198;
  float _199;
  float _204;
  float _205;
  float _207;
  int _214;
  int _222;
  float4 _229;
  float _236;
  float4 _246;
  float _253;
  float _254;
  float _283;
  float _284;
  float4 _293;
  float _322;
  float _337;
  float _341;
  float _344;
  float _354;
  float _355;
  float _356;
  float _357;
  float _358;
  int _359;
  float _425;
  float _630;
  float _631;
  float _632;
  float _725;
  float _726;
  float _727;
  float _847;
  float _848;
  float _849;
  float _867;
  float _868;
  float _869;
  float _902;
  float _903;
  float _904;
  float _918;
  float _919;
  float _920;
  float _360;
  float4 _369;
  float _376;
  float _377;
  float _378;
  int _381;
  float _390;
  float _402;
  float _409;
  float _410;
  float _411;
  uint _412;
  float _434;
  float _483;
  float _484;
  float _485;
  float _487;
  float _494;
  float _495;
  float _496;
  float _515;
  float _516;
  float _517;
  float _518;
  float _519;
  float _520;
  float _521;
  float _522;
  float _523;
  float _569;
  float _570;
  float _571;
  float _572;
  float _573;
  float _574;
  float _575;
  float _592;
  float _593;
  float _594;
  float _595;
  float _601;
  float _604;
  float _611;
  float _612;
  float _613;
  float _642;
  float _667;
  float _668;
  float _669;
  float _688;
  float _689;
  float _690;
  float _696;
  float _700;
  float _701;
  float _702;
  float _703;
  float _708;
  float _733;
  float _737;
  float _738;
  float _739;
  float _740;
  int _781;
  float _836;
  float _857;
  float _858;
  float _862;
  float _909;
  float _930;
  float _931;
  float _932;
  float _17[36];
  _21 = (TEXCOORD.x * 2.0f) + -1.0f;
  _22 = TEXCOORD.y * 2.0f;
  _23 = 1.0f - _22;
  _26 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _28 = max(1.0000000116860974e-07f, _26.x);
  _64 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _68 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _64);
  _69 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _64);
  _70 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _64);
  _72 = rsqrt(dot(float3(_68, _69, _70), float3(_68, _69, _70)));
  _73 = _72 * _68;
  _74 = _72 * _69;
  _75 = _72 * _70;
  _76 = WaveReadLaneFirst(_materialIndex);
  _84 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _91 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_84 < (uint)65000), _84, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, _73));
  _98 = WaveReadLaneFirst(_materialIndex);
  _106 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _113 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f) + _74)));
  _122 = WaveReadLaneFirst(_materialIndex);
  _130 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_122 < (uint)170000), _122, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _137 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_130 < (uint)65000), _130, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_75 * 2.0f), ((_74 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)) * 2.0f)));
  _140 = _137.x + _113.x;
  _141 = _137.y + _113.y;
  _146 = WaveReadLaneFirst(_materialIndex);
  _154 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.12999999523162842f) + _74), _73));
  _170 = WaveReadLaneFirst(_materialIndex);
  _178 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _185 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_178 < (uint)65000), _178, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _74) * 2.0f), (_73 * 2.0f)));
  _191 = abs(dot(float3(_73, _74, _75), float3(0.0f, 1.0f, 0.0f)));
  _193 = abs(dot(float3(_73, _74, _75), float3(0.0f, 0.0f, 1.0f)));
  _198 = (_191 * (_91.x - _140)) + _140;
  _199 = (_191 * (_91.y - _141)) + _141;
  _204 = (((_185.x + _161.x) - _198) * _193) + _198;
  _205 = (((_185.y + _161.y) - _199) * _193) + _199;
  _207 = saturate(_26.x * 35.0f);
  _214 = WaveReadLaneFirst(_materialIndex);
  _222 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_214 < (uint)170000), _214, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _229 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_222 < (uint)65000), _222, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f)), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + TEXCOORD.y)));
  _236 = ((_229.x - _204) * _207) + _204;
  _246 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((TEXCOORD.x + -0.0019921569619327784f) + (_236 * 0.004000000189989805f)), ((TEXCOORD.y + -0.0019921569619327784f) + ((lerp(_205, _229.y, _207)) * 0.004000000189989805f))));
  _253 = (pow(_246.y, 0.012683313339948654f));
  _254 = (pow(_246.z, 0.012683313339948654f));
  _283 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(TEXCOORD.x))));
  _284 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(TEXCOORD.y))));
  _293 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_283 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_284 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0));
  _322 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), _293.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _337 = _236 + -0.4000000059604645f;
  _341 = min(max(((_337 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
  _344 = (_337 * 0.020000001415610313f) + -0.003000000026077032f;
  _354 = _344;
  _355 = _344;
  _356 = 0.0f;
  _357 = 0.0f;
  _358 = 0.0f;
  _359 = 1;
  while(true) {
    _360 = float((int)(_359));
    _369 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_354 * (((((((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), _293.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _322) - _21) * 2.5f) + -0.5f) + frac(frac(dot(float2(_283, _284), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - (_341 * 8.742277657347586e-08f))) * _360)), (TEXCOORD.y - ((_355 * (((((((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), _293.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _322) - _23) * 2.5f) + -0.5f) + frac(frac(dot(float2((_283 + 32.665000915527344f), (_284 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - _341)) * _360))));
    _376 = (_369.x * 0.125f) + _356;
    _377 = (_369.y * 0.125f) + _357;
    _378 = (_369.z * 0.125f) + _358;
    _381 = _359 + 1;
    if (!(_381 == 8)) {
      _354 = (_354 * 0.8999999761581421f);
      _355 = (_355 * 0.8999999761581421f);
      _356 = _376;
      _357 = _377;
      _358 = _378;
      _359 = _381;
      continue;
    }
    _390 = (pow(_246.x, 0.012683313339948654f));
    _402 = dot(float3((exp2(log2(max(0.0f, (_390 + -0.8359375f)) / (18.8515625f - (_390 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 0.30000001192092896f;
    _409 = ((_402 - _376) * 0.20000000298023224f) + _376;
    _410 = ((_402 - _377) * 0.20000000298023224f) + _377;
    _411 = ((_402 - _378) * 0.20000000298023224f) + _378;
    _412 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _425 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _412, 0)))).x) & 127))) + 0.5f);
    } else {
      _425 = 0.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_409, _410, _411));
      _847 = output_color.x;
      _848 = output_color.y;
      _849 = output_color.z;
    } else {
      _847 = _409;
      _848 = _410;
      _849 = _411;
    }
    if (_etcParams.y > 1.0f) {
      _857 = abs(_21);
      _858 = abs(_22 + -1.0f);
      _862 = saturate(1.0f - (dot(float2(_857, _858), float2(_857, _858)) * saturate(_etcParams.y + -1.0f)));
      _867 = (_862 * _847);
      _868 = (_862 * _848);
      _869 = (_862 * _849);
    } else {
      _867 = _847;
      _868 = _848;
      _869 = _849;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _902 = select((_867 <= 0.0031308000907301903f), (_867 * 12.920000076293945f), (((pow(_867, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _903 = select((_868 <= 0.0031308000907301903f), (_868 * 12.920000076293945f), (((pow(_868, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _904 = select((_869 <= 0.0031308000907301903f), (_869 * 12.920000076293945f), (((pow(_869, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _902 = _867;
      _903 = _868;
      _904 = _869;
    }
    if (!(_etcParams.y < 1.0f)) {
      _909 = float((uint)_412);
      if (!(_909 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_909 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _918 = _902;
          _919 = _903;
          _920 = _904;
        } else {
          _918 = 0.0f;
          _919 = 0.0f;
          _920 = 0.0f;
        }
      } else {
        _918 = 0.0f;
        _919 = 0.0f;
        _920 = 0.0f;
      }
    } else {
      _918 = _902;
      _919 = _903;
      _920 = _904;
    }
    _930 = exp2(log2(_918 * 9.999999747378752e-05f) * 0.1593017578125f);
    _931 = exp2(log2(_919 * 9.999999747378752e-05f) * 0.1593017578125f);
    _932 = exp2(log2(_920 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_930 * 18.6875f) + 1.0f)) * ((_930 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_931 * 18.6875f) + 1.0f)) * ((_931 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_932 * 18.6875f) + 1.0f)) * ((_932 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _425;
    break;
  }
  return SV_Target;
}