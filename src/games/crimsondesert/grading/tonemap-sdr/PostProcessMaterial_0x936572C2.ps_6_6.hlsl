#include "../tonemap.hlsli"

struct PostProcessActionStruct {
  float _contrast;
  float3 _saturation;
  float _gaussianBlurIntensity;
  float2 _gaussianBlurPosition;
  float _gaussianBlurClampInnerRadius;
  float _gaussianBlurClampHardness;
  float2 _radialBlurPosition;
  float _radialBlurIntensity;
  float _radialBlurClampInnerRadius;
  float _radialBlurClampHardness;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessAction {
  PostProcessActionStruct BindlessParameters_PostProcessAction;
};

typedef BindlessParameters_PostProcessAction BindlessParameters_PostProcessAction_t;
ConstantBuffer<BindlessParameters_PostProcessAction_t> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _24;
  float _34;
  float _35;
  float _36;
  float _61;
  float _62;
  float _63;
  float _67;
  int _68;
  float _76;
  int _77;
  float _85;
  int _86;
  float _94;
  bool _95;
  bool _96;
  float _143;
  float _144;
  float _145;
  float _146;
  float _192;
  float _193;
  float _194;
  float _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  int _328;
  float _381;
  float _382;
  float _383;
  float _507;
  float _508;
  float _509;
  float _523;
  float _728;
  float _729;
  float _730;
  float _823;
  float _824;
  float _825;
  float _945;
  float _946;
  float _947;
  float _968;
  float _969;
  float _970;
  float _1003;
  float _1004;
  float _1005;
  float _1019;
  float _1020;
  float _1021;
  float4 _101;
  float _112;
  float _113;
  float _114;
  int _148;
  float _156;
  int _157;
  float _166;
  float _167;
  float _169;
  float _170;
  float _181;
  int _200;
  float _208;
  int _211;
  float _220;
  float _221;
  float _225;
  float _226;
  float4 _229;
  float _239;
  float _240;
  float _241;
  float _271;
  float _277;
  float _278;
  float _279;
  int _280;
  float _288;
  int _289;
  float _297;
  float _299;
  float _300;
  float _311;
  float _329;
  float _330;
  float4 _333;
  float _343;
  float _344;
  float _345;
  float _370;
  float _374;
  float _375;
  float _376;
  int _378;
  int _384;
  float _394;
  float _395;
  float _396;
  float _400;
  float _402;
  float _404;
  float _409;
  int _426;
  float _434;
  float _435;
  float _442;
  float _443;
  float _444;
  int _446;
  int _454;
  float _457;
  float _460;
  float _462;
  float _493;
  uint _510;
  float _532;
  float _581;
  float _582;
  float _583;
  float _585;
  float _592;
  float _593;
  float _594;
  float _613;
  float _614;
  float _615;
  float _616;
  float _617;
  float _618;
  float _619;
  float _620;
  float _621;
  float _667;
  float _668;
  float _669;
  float _670;
  float _671;
  float _672;
  float _673;
  float _690;
  float _691;
  float _692;
  float _693;
  float _699;
  float _702;
  float _709;
  float _710;
  float _711;
  float _740;
  float _765;
  float _766;
  float _767;
  float _786;
  float _787;
  float _788;
  float _794;
  float _798;
  float _799;
  float _800;
  float _801;
  float _806;
  float _831;
  float _835;
  float _836;
  float _837;
  float _838;
  int _879;
  float _934;
  float _958;
  float _959;
  float _963;
  float _1010;
  float _1031;
  float _1032;
  float _1033;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = (pow(_24.x, 0.012683313339948654f));
  _35 = (pow(_24.y, 0.012683313339948654f));
  _36 = (pow(_24.z, 0.012683313339948654f));
  _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _67 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _68 = WaveReadLaneFirst(_materialIndex);
  _76 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurIntensity);
  _77 = WaveReadLaneFirst(_materialIndex);
  _85 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurClampInnerRadius);
  _86 = WaveReadLaneFirst(_materialIndex);
  _94 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_86 < (uint)170000), _86, 0)) + 0u))].BindlessParameters_PostProcessAction._borderRatio);
  _95 = (_76 > 0.0f);
  _96 = (_94 > 0.0f);
  if (_95 || _96) {
    _101 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _112 = (pow(_101.x, 0.012683313339948654f));
    _113 = (pow(_101.y, 0.012683313339948654f));
    _114 = (pow(_101.z, 0.012683313339948654f));
    _143 = (exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _144 = (exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _145 = (exp2(log2(max(0.0f, (_114 + -0.8359375f)) / (18.8515625f - (_114 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _146 = _101.w;
  } else {
    _143 = 0.0f;
    _144 = 0.0f;
    _145 = 0.0f;
    _146 = 0.0f;
  }
  if (_95) {
    _148 = WaveReadLaneFirst(_materialIndex);
    _156 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_148 < (uint)170000), _148, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurClampHardness);
    _157 = WaveReadLaneFirst(_materialIndex);
    _166 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurPosition.x);
    _167 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurPosition.y);
    _169 = (TEXCOORD.x - _166) * _67;
    _170 = TEXCOORD.y - _167;
    _181 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, _85)) * sqrt(dot(float2(_169, _170), float2(_169, _170))))) * (1.0f / max((1.0f - _156), 9.999999747378752e-06f)));
    _192 = ((_181 * (_61 - _143)) + _143);
    _193 = ((_181 * (_62 - _144)) + _144);
    _194 = ((_181 * (_63 - _145)) + _145);
  } else {
    _192 = _61;
    _193 = _62;
    _194 = _63;
  }
  _200 = WaveReadLaneFirst(_materialIndex);
  _208 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_200 < (uint)170000), _200, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurIntensity);
  if (_208 > 0.0f) {
    _211 = WaveReadLaneFirst(_materialIndex);
    _220 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurPosition.x);
    _221 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurPosition.y);
    _225 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    _226 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    _229 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_225, _226));
    _239 = (pow(_229.x, 0.012683313339948654f));
    _240 = (pow(_229.y, 0.012683313339948654f));
    _241 = (pow(_229.z, 0.012683313339948654f));
    _271 = 32.0f / _208;
    _322 = _225;
    _323 = _226;
    _324 = (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _325 = (exp2(log2(max(0.0f, (_240 + -0.8359375f)) / (18.8515625f - (_240 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _326 = (exp2(log2(max(0.0f, (_241 + -0.8359375f)) / (18.8515625f - (_241 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _327 = 1.0f;
    _328 = 0;
    while(true) {
      _329 = _322 + (((_220 - _225) / _271) * 0.10000000149011612f);
      _330 = _323 + (((_221 - _226) / _271) * 0.10000000149011612f);
      _333 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_329, _330));
      _343 = (pow(_333.x, 0.012683313339948654f));
      _344 = (pow(_333.y, 0.012683313339948654f));
      _345 = (pow(_333.z, 0.012683313339948654f));
      _370 = _327 * 9000.0f;
      _374 = (exp2(log2(max(0.0f, (_343 + -0.8359375f)) / (18.8515625f - (_343 * 18.6875f))) * 6.277394771575928f) * _370) + _324;
      _375 = (exp2(log2(max(0.0f, (_344 + -0.8359375f)) / (18.8515625f - (_344 * 18.6875f))) * 6.277394771575928f) * _370) + _325;
      _376 = (exp2(log2(max(0.0f, (_345 + -0.8359375f)) / (18.8515625f - (_345 * 18.6875f))) * 6.277394771575928f) * _370) + _326;
      _378 = _328 + 1;
      if (!(_378 == 10)) {
        _322 = _329;
        _323 = _330;
        _324 = _374;
        _325 = _375;
        _326 = _376;
        _327 = (_327 * 0.9900000095367432f);
        _328 = _378;
        continue;
      }
      while(true) {
        _277 = _374 * 0.10000000149011612f;
        _278 = _375 * 0.10000000149011612f;
        _279 = _376 * 0.10000000149011612f;
        _280 = WaveReadLaneFirst(_materialIndex);
        _288 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_280 < (uint)170000), _280, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurClampInnerRadius);
        _289 = WaveReadLaneFirst(_materialIndex);
        _297 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_289 < (uint)170000), _289, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurClampHardness);
        _299 = (TEXCOORD.x - _220) * _67;
        _300 = TEXCOORD.y - _221;
        _311 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, _288)) * sqrt(dot(float2(_299, _300), float2(_299, _300))))) * (1.0f / max((1.0f - _297), 9.999999747378752e-06f)));
        _381 = ((_311 * (_192 - _277)) + _277);
        _382 = ((_311 * (_193 - _278)) + _278);
        _383 = ((_311 * (_194 - _279)) + _279);
        break;
      }
      break;
    }
  } else {
    _381 = _192;
    _382 = _193;
    _383 = _194;
  }
  _384 = WaveReadLaneFirst(_materialIndex);
  _394 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.x);
  _395 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.y);
  _396 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.z);
  _400 = (1.0f - _394) * 0.3086000084877014f;
  _402 = (1.0f - _395) * 0.6093999743461609f;
  _404 = (1.0f - _396) * 0.0820000022649765f;
  _409 = _400 * _381;
  _426 = WaveReadLaneFirst(_materialIndex);
  _434 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))].BindlessParameters_PostProcessAction._contrast);
  _435 = max(_434, 0.0f);
  _442 = max(0.0f, ((_435 * (mad(_383, _404, mad(_382, _402, ((_400 + _394) * _381))) + -0.5f)) + 0.5f));
  _443 = max(0.0f, ((_435 * (mad(_383, _404, mad(_382, (_402 + _395), _409)) + -0.5f)) + 0.5f));
  _444 = max(0.0f, ((_435 * (mad(_383, (_404 + _396), mad(_382, _402, _409)) + -0.5f)) + 0.5f));
  if (_96) {
    _446 = WaveReadLaneFirst(_materialIndex);
    _454 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_446 < (uint)170000), _446, 0)) + 0u))].BindlessParameters_PostProcessAction._borderColor);
    _457 = float((uint)((uint)(((uint)(_454) >> 16) & 255)));
    _460 = float((uint)((uint)(((uint)(_454) >> 8) & 255)));
    _462 = float((uint)((uint)(_454 & 255)));
    _493 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _507 = ((((_493 * select(((_457 * 0.003921568859368563f) < 0.040449999272823334f), (_457 * 0.0003035269910469651f), exp2(log2((_457 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _442) * _146) + _442);
    _508 = ((((_493 * select(((_460 * 0.003921568859368563f) < 0.040449999272823334f), (_460 * 0.0003035269910469651f), exp2(log2((_460 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _443) * _146) + _443);
    _509 = ((((_493 * select(((_462 * 0.003921568859368563f) < 0.040449999272823334f), (_462 * 0.0003035269910469651f), exp2(log2((_462 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _444) * _146) + _444);
  } else {
    _507 = _442;
    _508 = _443;
    _509 = _444;
  }
  _510 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _523 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _510, 0)))).x) & 127))) + 0.5f);
  } else {
    _523 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_507, _508, _509));
    _945 = output_color.x;
    _946 = output_color.y;
    _947 = output_color.z;
  } else {
    _945 = _507;
    _946 = _508;
    _947 = _509;
  }
  if (_etcParams.y > 1.0f) {
    _958 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _959 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _963 = saturate(1.0f - (dot(float2(_958, _959), float2(_958, _959)) * saturate(_etcParams.y + -1.0f)));
    _968 = (_963 * _945);
    _969 = (_963 * _946);
    _970 = (_963 * _947);
  } else {
    _968 = _945;
    _969 = _946;
    _970 = _947;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1003 = select((_968 <= 0.0031308000907301903f), (_968 * 12.920000076293945f), (((pow(_968, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1004 = select((_969 <= 0.0031308000907301903f), (_969 * 12.920000076293945f), (((pow(_969, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1005 = select((_970 <= 0.0031308000907301903f), (_970 * 12.920000076293945f), (((pow(_970, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1003 = _968;
    _1004 = _969;
    _1005 = _970;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1010 = float((uint)_510);
    if (!(_1010 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1010 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1019 = _1003;
        _1020 = _1004;
        _1021 = _1005;
      } else {
        _1019 = 0.0f;
        _1020 = 0.0f;
        _1021 = 0.0f;
      }
    } else {
      _1019 = 0.0f;
      _1020 = 0.0f;
      _1021 = 0.0f;
    }
  } else {
    _1019 = _1003;
    _1020 = _1004;
    _1021 = _1005;
  }
  _1031 = exp2(log2(_1019 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1032 = exp2(log2(_1020 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1033 = exp2(log2(_1021 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1031 * 18.6875f) + 1.0f)) * ((_1031 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1032 * 18.6875f) + 1.0f)) * ((_1032 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1033 * 18.6875f) + 1.0f)) * ((_1033 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _523;
  return SV_Target;
}