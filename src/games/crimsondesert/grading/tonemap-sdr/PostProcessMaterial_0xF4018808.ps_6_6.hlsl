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

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

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
  float _259;
  float _260;
  float4 _269;
  float _298;
  float _313;
  float _317;
  float _320;
  float _330;
  float _331;
  float _332;
  float _333;
  float _334;
  int _335;
  float _389;
  float _594;
  float _595;
  float _596;
  float _689;
  float _690;
  float _691;
  float _811;
  float _812;
  float _813;
  float _831;
  float _832;
  float _833;
  float _866;
  float _867;
  float _868;
  float _882;
  float _883;
  float _884;
  float _336;
  float4 _345;
  float _352;
  float _353;
  float _354;
  int _357;
  float _366;
  float _373;
  float _374;
  float _375;
  uint _376;
  float _398;
  float _447;
  float _448;
  float _449;
  float _451;
  float _458;
  float _459;
  float _460;
  float _479;
  float _480;
  float _481;
  float _482;
  float _483;
  float _484;
  float _485;
  float _486;
  float _487;
  float _533;
  float _534;
  float _535;
  float _536;
  float _537;
  float _538;
  float _539;
  float _556;
  float _557;
  float _558;
  float _559;
  float _565;
  float _568;
  float _575;
  float _576;
  float _577;
  float _606;
  float _631;
  float _632;
  float _633;
  float _652;
  float _653;
  float _654;
  float _660;
  float _664;
  float _665;
  float _666;
  float _667;
  float _672;
  float _697;
  float _701;
  float _702;
  float _703;
  float _704;
  int _745;
  float _800;
  float _821;
  float _822;
  float _826;
  float _873;
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
  _259 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(TEXCOORD.x))));
  _260 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(TEXCOORD.y))));
  _269 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_259 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_260 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0));
  _298 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), _269.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _313 = _236 + -0.4000000059604645f;
  _317 = min(max(((_313 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
  _320 = (_313 * 0.020000001415610313f) + -0.003000000026077032f;
  _330 = _320;
  _331 = _320;
  _332 = 0.0f;
  _333 = 0.0f;
  _334 = 0.0f;
  _335 = 1;
  while(true) {
    _336 = float((int)(_335));
    _345 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_330 * (((((((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), _269.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _298) - _21) * 2.5f) + -0.5f) + frac(frac(dot(float2(_259, _260), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - (_317 * 8.742277657347586e-08f))) * _336)), (TEXCOORD.y - ((_331 * (((((((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), _269.x, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _23, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _21))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _298) - _23) * 2.5f) + -0.5f) + frac(frac(dot(float2((_259 + 32.665000915527344f), (_260 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - _317)) * _336))));
    _352 = (_345.x * 0.125f) + _332;
    _353 = (_345.y * 0.125f) + _333;
    _354 = (_345.z * 0.125f) + _334;
    _357 = _335 + 1;
    if (!(_357 == 8)) {
      _330 = (_330 * 0.8999999761581421f);
      _331 = (_331 * 0.8999999761581421f);
      _332 = _352;
      _333 = _353;
      _334 = _354;
      _335 = _357;
      continue;
    }
    _366 = dot(float3(_246.x, _246.y, _246.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 0.30000001192092896f;
    _373 = ((_366 - _352) * 0.20000000298023224f) + _352;
    _374 = ((_366 - _353) * 0.20000000298023224f) + _353;
    _375 = ((_366 - _354) * 0.20000000298023224f) + _354;
    _376 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _389 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _376, 0)))).x) & 127))) + 0.5f);
    } else {
      _389 = 0.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_373, _374, _375));
      _811 = output_color.x;
      _812 = output_color.y;
      _813 = output_color.z;
    } else {
      _811 = _373;
      _812 = _374;
      _813 = _375;
    }
    if (_etcParams.y > 1.0f) {
      _821 = abs(_21);
      _822 = abs(_22 + -1.0f);
      _826 = saturate(1.0f - (dot(float2(_821, _822), float2(_821, _822)) * saturate(_etcParams.y + -1.0f)));
      _831 = (_826 * _811);
      _832 = (_826 * _812);
      _833 = (_826 * _813);
    } else {
      _831 = _811;
      _832 = _812;
      _833 = _813;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _866 = select((_831 <= 0.0031308000907301903f), (_831 * 12.920000076293945f), (((pow(_831, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _867 = select((_832 <= 0.0031308000907301903f), (_832 * 12.920000076293945f), (((pow(_832, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _868 = select((_833 <= 0.0031308000907301903f), (_833 * 12.920000076293945f), (((pow(_833, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _866 = _831;
      _867 = _832;
      _868 = _833;
    }
    if (!(_etcParams.y < 1.0f)) {
      _873 = float((uint)_376);
      if (!(_873 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_873 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _882 = _866;
          _883 = _867;
          _884 = _868;
        } else {
          _882 = 0.0f;
          _883 = 0.0f;
          _884 = 0.0f;
        }
      } else {
        _882 = 0.0f;
        _883 = 0.0f;
        _884 = 0.0f;
      }
    } else {
      _882 = _866;
      _883 = _867;
      _884 = _868;
    }
    SV_Target.x = _882;
    SV_Target.y = _883;
    SV_Target.z = _884;
    SV_Target.w = _389;
    break;
  }
  return SV_Target;
}