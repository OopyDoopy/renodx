#include "../tonemap.hlsli"

struct PostProcessDamageStruct {
  uint _bloodColor;
  float _bloodRatio;
  uint _dirtTexture;
  uint _dirtMaskTexture;
  float _dirtRatio1;
  float _dirtRatio2;
  float _dirtRatio3;
  uint _waterNormalTexture;
  uint _waterMaskTexture;
  float _waterRatio1;
  float _waterRatio2;
  float _waterRatio3;
  float _isDead;
  float _isBloodEffect;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessDamage {
  PostProcessDamageStruct BindlessParameters_PostProcessDamage;
};

typedef BindlessParameters_PostProcessDamage BindlessParameters_PostProcessDamage_t;
ConstantBuffer<BindlessParameters_PostProcessDamage_t> BindlessParameters_PostProcessDamage[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _21;
  int _29;
  float4 _36;
  int _39;
  int _47;
  float4 _54;
  int _58;
  float _66;
  int _67;
  float _75;
  int _76;
  float _84;
  float _85;
  float4 _98;
  int _102;
  float _110;
  float _111;
  float _118;
  float _119;
  float _120;
  float _123;
  float _126;
  int _130;
  int _138;
  float _141;
  float _144;
  float _146;
  float _171;
  int _174;
  float _182;
  bool _188;
  float _189;
  int _193;
  int _201;
  float4 _208;
  int _213;
  int _221;
  float4 _228;
  int _232;
  float _240;
  int _241;
  float _249;
  int _250;
  float _258;
  float _260;
  float _267;
  float _268;
  float _269;
  int _270;
  float _278;
  float _279;
  float _289;
  float _290;
  float _291;
  uint _292;
  float _306;
  float _511;
  float _512;
  float _513;
  float _606;
  float _607;
  float _608;
  float _728;
  float _729;
  float _730;
  float _745;
  float _746;
  float _747;
  float _780;
  float _781;
  float _782;
  float _796;
  float _797;
  float _798;
  float _315;
  float _364;
  float _365;
  float _366;
  float _368;
  float _375;
  float _376;
  float _377;
  float _396;
  float _397;
  float _398;
  float _399;
  float _400;
  float _401;
  float _402;
  float _403;
  float _404;
  float _450;
  float _451;
  float _452;
  float _453;
  float _454;
  float _455;
  float _456;
  float _473;
  float _474;
  float _475;
  float _476;
  float _482;
  float _485;
  float _492;
  float _493;
  float _494;
  float _523;
  float _548;
  float _549;
  float _550;
  float _569;
  float _570;
  float _571;
  float _577;
  float _581;
  float _582;
  float _583;
  float _584;
  float _589;
  float _614;
  float _618;
  float _619;
  float _620;
  float _621;
  int _662;
  float _717;
  float _740;
  float _787;
  float _16[36];
  _21 = WaveReadLaneFirst(_materialIndex);
  _29 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterNormalTexture);
  _36 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_29 < (uint)65000), _29, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _39 = WaveReadLaneFirst(_materialIndex);
  _47 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterMaskTexture);
  _54 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_47 < (uint)65000), _47, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _58 = WaveReadLaneFirst(_materialIndex);
  _66 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio1);
  _67 = WaveReadLaneFirst(_materialIndex);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio2);
  _76 = WaveReadLaneFirst(_materialIndex);
  _84 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio3);
  _85 = dot(float3(_54.x, _54.y, _54.z), float3(_66, _75, _84));
  _98 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_85 * ((_36.x * 0.20000000298023224f) + -0.09960784763097763f)) + TEXCOORD.x), abs(TEXCOORD.y - (_85 * ((_36.y * 0.20000000298023224f) + -0.09960784763097763f)))));
  _102 = WaveReadLaneFirst(_materialIndex);
  _110 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_102 < (uint)170000), _102, 0)) + 0u))].BindlessParameters_PostProcessDamage._isDead);
  _111 = dot(float3(_98.x, _98.y, _98.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _118 = ((_111 - _98.x) * _110) + _98.x;
  _119 = ((_111 - _98.y) * _110) + _98.y;
  _120 = ((_111 - _98.z) * _110) + _98.z;
  _123 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  _126 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  _130 = WaveReadLaneFirst(_materialIndex);
  _138 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_130 < (uint)170000), _130, 0)) + 0u))].BindlessParameters_PostProcessDamage._bloodColor);
  _141 = float((uint)((uint)(((uint)(_138) >> 16) & 255)));
  _144 = float((uint)((uint)(((uint)(_138) >> 8) & 255)));
  _146 = float((uint)((uint)(_138 & 255)));
  _171 = select(((_141 * 0.003921568859368563f) < 0.040449999272823334f), (_141 * 0.0003035269910469651f), exp2(log2((_141 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _174 = WaveReadLaneFirst(_materialIndex);
  _182 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_174 < (uint)170000), _174, 0)) + 0u))].BindlessParameters_PostProcessDamage._isBloodEffect);
  _188 = (_182 > 0.0010000000474974513f) && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
  _189 = _171 * 0.4000000059604645f;
  _193 = WaveReadLaneFirst(_materialIndex);
  _201 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtTexture);
  _208 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_201 < (uint)65000), _201, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _213 = WaveReadLaneFirst(_materialIndex);
  _221 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_213 < (uint)170000), _213, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtMaskTexture);
  _228 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_221 < (uint)65000), _221, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _232 = WaveReadLaneFirst(_materialIndex);
  _240 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio1);
  _241 = WaveReadLaneFirst(_materialIndex);
  _249 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_241 < (uint)170000), _241, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio2);
  _250 = WaveReadLaneFirst(_materialIndex);
  _258 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_250 < (uint)170000), _250, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio3);
  _260 = dot(float3(_228.x, _228.y, _228.z), float3(_240, _249, _258)) * _208.w;
  _267 = (_260 * (_208.x - _118)) + _118;
  _268 = (_260 * (_208.y - _119)) + _119;
  _269 = (_260 * (_208.z - _120)) + _120;
  _270 = WaveReadLaneFirst(_materialIndex);
  _278 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))].BindlessParameters_PostProcessDamage._bloodRatio);
  _279 = _278 * max((_123 * _123), (_126 * _126));
  _289 = _267 - ((_267 * (1.0f - select(_188, _189, _171))) * _279);
  _290 = _268 - ((_268 * (1.0f - select(_188, _189, select(((_144 * 0.003921568859368563f) < 0.040449999272823334f), (_144 * 0.0003035269910469651f), exp2(log2((_144 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _279);
  _291 = _269 - ((_269 * (1.0f - select(_188, _189, select(((_146 * 0.003921568859368563f) < 0.040449999272823334f), (_146 * 0.0003035269910469651f), exp2(log2((_146 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _279);
  _292 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _306 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _292, 0)))).x) & 127))) + 0.5f);
  } else {
    _306 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_289, _290, _291));
    _728 = output_color.x;
    _729 = output_color.y;
    _730 = output_color.z;
  } else {
    _728 = _289;
    _729 = _290;
    _730 = _291;
  }
  if (_etcParams.y > 1.0f) {
    _740 = saturate(1.0f - (dot(float2(_123, _126), float2(_123, _126)) * saturate(_etcParams.y + -1.0f)));
    _745 = (_740 * _728);
    _746 = (_740 * _729);
    _747 = (_740 * _730);
  } else {
    _745 = _728;
    _746 = _729;
    _747 = _730;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _780 = select((_745 <= 0.0031308000907301903f), (_745 * 12.920000076293945f), (((pow(_745, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _781 = select((_746 <= 0.0031308000907301903f), (_746 * 12.920000076293945f), (((pow(_746, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _782 = select((_747 <= 0.0031308000907301903f), (_747 * 12.920000076293945f), (((pow(_747, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _780 = _745;
    _781 = _746;
    _782 = _747;
  }
  if (!(_etcParams.y < 1.0f)) {
    _787 = float((uint)_292);
    if (!(_787 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_787 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _796 = _780;
        _797 = _781;
        _798 = _782;
      } else {
        _796 = 0.0f;
        _797 = 0.0f;
        _798 = 0.0f;
      }
    } else {
      _796 = 0.0f;
      _797 = 0.0f;
      _798 = 0.0f;
    }
  } else {
    _796 = _780;
    _797 = _781;
    _798 = _782;
  }
  SV_Target.x = _796;
  SV_Target.y = _797;
  SV_Target.z = _798;
  SV_Target.w = _306;
  return SV_Target;
}