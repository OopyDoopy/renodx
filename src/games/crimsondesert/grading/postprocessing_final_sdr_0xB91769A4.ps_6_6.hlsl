#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _15;
  float _38;
  float _39;
  float _83;
  float _84;
  float _85;
  float _168;
  float _169;
  float _170;
  float _230;
  float _231;
  float _232;
  float _402;
  float _424;
  float _425;
  float _426;
  float _49;
  float _50;
  float _54;
  float _59;
  float _63;
  float _68;
  float _72;
  float _78;
  uint _91;
  uint _92;
  float _94;
  float _102;
  float4 _109;
  float4 _114;
  float4 _119;
  float4 _124;
  float _135;
  float _142;
  float _145;
  float _201;
  float _205;
  float _206;
  float _207;
  float _208;
  float _213;
  float _239;
  float _243;
  float _244;
  float _245;
  float _246;
  int _287;
  float _342;
  float _353;
  float _354;
  float _355;
  float _383;
  float _386;
  float _387;
  float _405;
  float _406;
  float _410;
  float _12[36];
  _15 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (_postProcessParams.w > 0.0f) {
    _38 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f))).x);
    _39 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f))).z);
  } else {
    _38 = _15.x;
    _39 = _15.z;
  }

  _38 = lerp(_15.x, _38, CUSTOM_CHROMATIC_ABERRATION);
  _39 = lerp(_15.z, _39, CUSTOM_CHROMATIC_ABERRATION);

  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  if (vanilla_film_grain) {
    _49 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
    _50 = _49 * 0.7692307829856873f;
    _54 = frac(abs(_50));
    _59 = _49 * 0.08130080997943878f;
    _63 = frac(abs(_59));
    _68 = ((select((_59 >= (-0.0f - _59)), _63, (-0.0f - _63)) * 1230.0f) + 10.0f) * ((select((_50 >= (-0.0f - _50)), _54, (-0.0f - _54)) * 13.0f) + 1.0f);
    _72 = frac(abs(_68));
    _78 = ((0.007500052452087402f - (select((_68 >= (-0.0f - _68)), _72, (-0.0f - _72)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _83 = (_78 * _38);
    _84 = (_78 * _15.y);
    _85 = (_78 * _39);
  } else {
    _83 = _38;
    _84 = _15.y;
    _85 = _39;
  }

  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_bt709 = float3(_83, _84, _85);
    color_bt709 = renodx::color::srgb::Decode(color_bt709);
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    color_bt709 = renodx::color::srgb::Encode(color_bt709);
    _83 = color_bt709.x;
    _84 = color_bt709.y;
    _85 = color_bt709.z;
  }

  _91 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) * TEXCOORD.x);
  _92 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) * TEXCOORD.y);
  _94 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (!((_94.x < 1.0000000116860974e-07f) || (_94.x == 1.0f))) {
    _102 = select((_postProcessParams.z >= 1.0f), 1.0f, 0.25f);
    _109 = __3__36__0__0__g_sceneColor.Load(int3(_91, ((int)(_92 + (uint)(-1))), 0));
    _114 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_91 + (uint)(-1))), _92, 0));
    _119 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_91 + 1u)), _92, 0));
    _124 = __3__36__0__0__g_sceneColor.Load(int3(_91, ((int)(_92 + 1u)), 0));
    _135 = max(max(_84, _109.y), max(max(_114.y, _119.y), _124.y));
    _142 = sqrt(saturate(min(min(min(_84, _109.y), min(min(_114.y, _119.y), _124.y)), (1.0f - _135)) * (1.0f / _135))) * (-1.0f / (((1.0f - _102) * 8.0f) + (_102 * 5.0f)));
    _145 = 1.0f / ((_142 * 4.0f) + 1.0f);
    _168 = saturate(((_142 * (((_114.x + _109.x) + _119.x) + _124.x)) + _83) * _145);
    _169 = saturate(((_142 * (((_114.y + _109.y) + _119.y) + _124.y)) + _84) * _145);
    _170 = saturate(((_142 * (((_114.z + _109.z) + _119.z) + _124.z)) + _85) * _145);
    _168 = lerp(_83, _168, CUSTOM_SHARPENING);
    _169 = lerp(_84, _169, CUSTOM_SHARPENING);
    _170 = lerp(_85, _170, CUSTOM_SHARPENING);
  } else {
    _168 = _83;
    _169 = _84;
    _170 = _85;
  }
  _201 = 1.0f - abs(_etcParams.w);
  _205 = saturate(_etcParams.w);
  _206 = (_201 * saturate(select((_168 < 0.040449999272823334f), (_168 * 0.07739938050508499f), exp2(log2((_168 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  _207 = (_201 * saturate(select((_169 < 0.040449999272823334f), (_169 * 0.07739938050508499f), exp2(log2((_169 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  _208 = (_201 * saturate(select((_170 < 0.040449999272823334f), (_170 * 0.07739938050508499f), exp2(log2((_170 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  if (_colorGradingParams.w > 0.0f) {
    _213 = saturate(_colorGradingParams.w);
    _230 = (((max(0.0f, (1.0f - _206)) - _206) * _213) + _206);
    _231 = (((max(0.0f, (1.0f - _207)) - _207) * _213) + _207);
    _232 = (((max(0.0f, (1.0f - _208)) - _208) * _213) + _208);
  } else {
    _230 = _206;
    _231 = _207;
    _232 = _208;
  }
  _239 = _userImageAdjust.y + 1.0f;
  _243 = _userImageAdjust.x + 0.5f;
  _244 = (_239 * (_230 + -0.5f)) + _243;
  _245 = (_239 * (_231 + -0.5f)) + _243;
  _246 = (_239 * (_232 + -0.5f)) + _243;
  _12[0] = 1.0f;
  _12[1] = 0.0f;
  _12[2] = 0.0f;
  _12[3] = 0.0f;
  _12[4] = 1.0f;
  _12[5] = 0.0f;
  _12[6] = 0.0f;
  _12[7] = 0.0f;
  _12[8] = 1.0f;
  _12[9] = 0.800000011920929f;
  _12[10] = 0.25832998752593994f;
  _12[11] = 0.0f;
  _12[12] = 0.20000000298023224f;
  _12[13] = 0.7416700124740601f;
  _12[14] = 0.14167000353336334f;
  _12[15] = 0.0f;
  _12[16] = 0.0f;
  _12[17] = 0.8583300113677979f;
  _12[18] = 0.8166700005531311f;
  _12[19] = 0.3333300054073334f;
  _12[20] = 0.0f;
  _12[21] = 0.1833299994468689f;
  _12[22] = 0.666670024394989f;
  _12[23] = 0.125f;
  _12[24] = 0.0f;
  _12[25] = 0.0f;
  _12[26] = 0.875f;
  _12[27] = 0.9666699767112732f;
  _12[28] = 0.0f;
  _12[29] = 0.0f;
  _12[30] = 0.033330000936985016f;
  _12[31] = 0.7333300113677979f;
  _12[32] = 0.1833299994468689f;
  _12[33] = 0.0f;
  _12[34] = 0.26666998863220215f;
  _12[35] = 0.8166700005531311f;
  _287 = min((int)(max((int)(_colorBlindParam), (int)(0))), (int)(3));
  _342 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  _353 = (TEXCOORD.x * 2.0f) + -1.0f;
  _354 = TEXCOORD.y * 2.0f;
  _355 = 1.0f - _354;
  _383 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _355, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _353))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _386 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _355, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _353))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _383) - _353;
  _387 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _355, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _353))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _383) - _355;
  if (_localToneMappingParams.w > 0.0f) {
    _402 = saturate(1.0f - (sqrt((_387 * _387) + (_386 * _386)) * 2.0f));
  } else {
    _402 = 1.0f;
  }
  _405 = abs(_353);
  _406 = abs(_354 + -1.0f);
  _410 = saturate(1.0f - ((_402 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_405, _406), float2(_405, _406))));
  if (!(SV_Position.y < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
    if (SV_Position.y < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      _424 = (_410 * exp2(log2(saturate(mad((_12[min((uint)(((int)(6u + (_287 * 9)))), 35u)]), _246, mad((_12[min((uint)(((int)(3u + (_287 * 9)))), 35u)]), _245, ((_12[min((uint)(((int)(0u + (_287 * 9)))), 35u)]) * _244))))) * _342));
      _425 = (_410 * exp2(log2(saturate(mad((_12[min((uint)(((int)(7u + (_287 * 9)))), 35u)]), _246, mad((_12[min((uint)(((int)(4u + (_287 * 9)))), 35u)]), _245, ((_12[min((uint)(((int)(1u + (_287 * 9)))), 35u)]) * _244))))) * _342));
      _426 = (_410 * exp2(log2(saturate(mad((_12[min((uint)(((int)(8u + (_287 * 9)))), 35u)]), _246, mad((_12[min((uint)(((int)(5u + (_287 * 9)))), 35u)]), _245, ((_12[min((uint)(((int)(2u + (_287 * 9)))), 35u)]) * _244))))) * _342));
    } else {
      _424 = 0.0f;
      _425 = 0.0f;
      _426 = 0.0f;
    }
  } else {
    _424 = 0.0f;
    _425 = 0.0f;
    _426 = 0.0f;
  }
  SV_Target.x = _424;
  SV_Target.y = _425;
  SV_Target.z = _426;
  SV_Target.w = _15.w;

  // RenoDX: >>> [Patch: FinalizePostProcessSDR] [Version: 1.10]
  // Description: Retained SDR final variants can still be selected by older output permutations. This patch applies the existing SDR color-temperature, Purkinje, and black-crush finalization using the live sun and moon elevation fields, preserving the shipped 1.09 final-output behavior without adding late final-space color grading.
  SV_Target.xyz = FinalizeSDR(
      SV_Target.xyz,
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y),
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y));
  // RenoDX: <<< [Patch: FinalizePostProcessSDR]

  return SV_Target;
}
