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
  float _31;
  int _32;
  float _40;
  int _41;
  float _49;
  int _50;
  float _58;
  bool _59;
  bool _60;
  float _71;
  float _72;
  float _73;
  float _74;
  float _120;
  float _121;
  float _122;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  int _220;
  float _240;
  float _241;
  float _242;
  float _366;
  float _367;
  float _368;
  float _382;
  float _587;
  float _588;
  float _589;
  float _682;
  float _683;
  float _684;
  float _804;
  float _805;
  float _806;
  float _827;
  float _828;
  float _829;
  float _862;
  float _863;
  float _864;
  float _878;
  float _879;
  float _880;
  float4 _65;
  int _76;
  float _84;
  int _85;
  float _94;
  float _95;
  float _97;
  float _98;
  float _109;
  int _128;
  float _136;
  int _139;
  float _148;
  float _149;
  float _153;
  float _154;
  float4 _157;
  float _163;
  float _169;
  float _170;
  float _171;
  int _172;
  float _180;
  int _181;
  float _189;
  float _191;
  float _192;
  float _203;
  float _221;
  float _222;
  float4 _225;
  float _229;
  float _233;
  float _234;
  float _235;
  int _237;
  int _243;
  float _253;
  float _254;
  float _255;
  float _259;
  float _261;
  float _263;
  float _268;
  int _285;
  float _293;
  float _294;
  float _301;
  float _302;
  float _303;
  int _305;
  int _313;
  float _316;
  float _319;
  float _321;
  float _352;
  uint _369;
  float _391;
  float _440;
  float _441;
  float _442;
  float _444;
  float _451;
  float _452;
  float _453;
  float _472;
  float _473;
  float _474;
  float _475;
  float _476;
  float _477;
  float _478;
  float _479;
  float _480;
  float _526;
  float _527;
  float _528;
  float _529;
  float _530;
  float _531;
  float _532;
  float _549;
  float _550;
  float _551;
  float _552;
  float _558;
  float _561;
  float _568;
  float _569;
  float _570;
  float _599;
  float _624;
  float _625;
  float _626;
  float _645;
  float _646;
  float _647;
  float _653;
  float _657;
  float _658;
  float _659;
  float _660;
  float _665;
  float _690;
  float _694;
  float _695;
  float _696;
  float _697;
  int _738;
  float _793;
  float _817;
  float _818;
  float _822;
  float _869;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _31 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _32 = WaveReadLaneFirst(_materialIndex);
  _40 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_32 < (uint)170000), _32, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurIntensity);
  _41 = WaveReadLaneFirst(_materialIndex);
  _49 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurClampInnerRadius);
  _50 = WaveReadLaneFirst(_materialIndex);
  _58 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_50 < (uint)170000), _50, 0)) + 0u))].BindlessParameters_PostProcessAction._borderRatio);
  _59 = (_40 > 0.0f);
  _60 = (_58 > 0.0f);
  if (_59 || _60) {
    _65 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _71 = _65.x;
    _72 = _65.y;
    _73 = _65.z;
    _74 = _65.w;
  } else {
    _71 = 0.0f;
    _72 = 0.0f;
    _73 = 0.0f;
    _74 = 0.0f;
  }
  if (_59) {
    _76 = WaveReadLaneFirst(_materialIndex);
    _84 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurClampHardness);
    _85 = WaveReadLaneFirst(_materialIndex);
    _94 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurPosition.x);
    _95 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurPosition.y);
    _97 = (TEXCOORD.x - _94) * _31;
    _98 = TEXCOORD.y - _95;
    _109 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, _49)) * sqrt(dot(float2(_97, _98), float2(_97, _98))))) * (1.0f / max((1.0f - _84), 9.999999747378752e-06f)));
    _120 = ((_109 * (_24.x - _71)) + _71);
    _121 = ((_109 * (_24.y - _72)) + _72);
    _122 = ((_109 * (_24.z - _73)) + _73);
  } else {
    _120 = _24.x;
    _121 = _24.y;
    _122 = _24.z;
  }
  _128 = WaveReadLaneFirst(_materialIndex);
  _136 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurIntensity);
  if (_136 > 0.0f) {
    _139 = WaveReadLaneFirst(_materialIndex);
    _148 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurPosition.x);
    _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurPosition.y);
    _153 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    _154 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    _157 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_153, _154));
    _163 = 32.0f / _136;
    _214 = _153;
    _215 = _154;
    _216 = _157.x;
    _217 = _157.y;
    _218 = _157.z;
    _219 = 1.0f;
    _220 = 0;
    while(true) {
      _221 = _214 + (((_148 - _153) / _163) * 0.10000000149011612f);
      _222 = _215 + (((_149 - _154) / _163) * 0.10000000149011612f);
      _225 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_221, _222));
      _229 = _219 * 0.8999999761581421f;
      _233 = (_225.x * _229) + _216;
      _234 = (_225.y * _229) + _217;
      _235 = (_225.z * _229) + _218;
      _237 = _220 + 1;
      if (!(_237 == 10)) {
        _214 = _221;
        _215 = _222;
        _216 = _233;
        _217 = _234;
        _218 = _235;
        _219 = (_219 * 0.9900000095367432f);
        _220 = _237;
        continue;
      }
      while(true) {
        _169 = _233 * 0.10000000149011612f;
        _170 = _234 * 0.10000000149011612f;
        _171 = _235 * 0.10000000149011612f;
        _172 = WaveReadLaneFirst(_materialIndex);
        _180 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_172 < (uint)170000), _172, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurClampInnerRadius);
        _181 = WaveReadLaneFirst(_materialIndex);
        _189 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_181 < (uint)170000), _181, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurClampHardness);
        _191 = (TEXCOORD.x - _148) * _31;
        _192 = TEXCOORD.y - _149;
        _203 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, _180)) * sqrt(dot(float2(_191, _192), float2(_191, _192))))) * (1.0f / max((1.0f - _189), 9.999999747378752e-06f)));
        _240 = ((_203 * (_120 - _169)) + _169);
        _241 = ((_203 * (_121 - _170)) + _170);
        _242 = ((_203 * (_122 - _171)) + _171);
        break;
      }
      break;
    }
  } else {
    _240 = _120;
    _241 = _121;
    _242 = _122;
  }
  _243 = WaveReadLaneFirst(_materialIndex);
  _253 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.x);
  _254 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.y);
  _255 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))].BindlessParameters_PostProcessAction._saturation.z);
  _259 = (1.0f - _253) * 0.3086000084877014f;
  _261 = (1.0f - _254) * 0.6093999743461609f;
  _263 = (1.0f - _255) * 0.0820000022649765f;
  _268 = _259 * _240;
  _285 = WaveReadLaneFirst(_materialIndex);
  _293 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_285 < (uint)170000), _285, 0)) + 0u))].BindlessParameters_PostProcessAction._contrast);
  _294 = max(_293, 0.0f);
  _301 = max(0.0f, ((_294 * (mad(_242, _263, mad(_241, _261, ((_259 + _253) * _240))) + -0.5f)) + 0.5f));
  _302 = max(0.0f, ((_294 * (mad(_242, _263, mad(_241, (_261 + _254), _268)) + -0.5f)) + 0.5f));
  _303 = max(0.0f, ((_294 * (mad(_242, (_263 + _255), mad(_241, _261, _268)) + -0.5f)) + 0.5f));
  if (_60) {
    _305 = WaveReadLaneFirst(_materialIndex);
    _313 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_305 < (uint)170000), _305, 0)) + 0u))].BindlessParameters_PostProcessAction._borderColor);
    _316 = float((uint)((uint)(((uint)(_313) >> 16) & 255)));
    _319 = float((uint)((uint)(((uint)(_313) >> 8) & 255)));
    _321 = float((uint)((uint)(_313 & 255)));
    _352 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _366 = ((((_352 * select(((_316 * 0.003921568859368563f) < 0.040449999272823334f), (_316 * 0.0003035269910469651f), exp2(log2((_316 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _301) * _74) + _301);
    _367 = ((((_352 * select(((_319 * 0.003921568859368563f) < 0.040449999272823334f), (_319 * 0.0003035269910469651f), exp2(log2((_319 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _302) * _74) + _302);
    _368 = ((((_352 * select(((_321 * 0.003921568859368563f) < 0.040449999272823334f), (_321 * 0.0003035269910469651f), exp2(log2((_321 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _303) * _74) + _303);
  } else {
    _366 = _301;
    _367 = _302;
    _368 = _303;
  }
  _369 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _382 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _369, 0)))).x) & 127))) + 0.5f);
  } else {
    _382 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_366, _367, _368));
    _804 = output_color.x;
    _805 = output_color.y;
    _806 = output_color.z;
  } else {
    _804 = _366;
    _805 = _367;
    _806 = _368;
  }
  if (_etcParams.y > 1.0f) {
    _817 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _818 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _822 = saturate(1.0f - (dot(float2(_817, _818), float2(_817, _818)) * saturate(_etcParams.y + -1.0f)));
    _827 = (_822 * _804);
    _828 = (_822 * _805);
    _829 = (_822 * _806);
  } else {
    _827 = _804;
    _828 = _805;
    _829 = _806;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _862 = select((_827 <= 0.0031308000907301903f), (_827 * 12.920000076293945f), (((pow(_827, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _863 = select((_828 <= 0.0031308000907301903f), (_828 * 12.920000076293945f), (((pow(_828, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _864 = select((_829 <= 0.0031308000907301903f), (_829 * 12.920000076293945f), (((pow(_829, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _862 = _827;
    _863 = _828;
    _864 = _829;
  }
  if (!(_etcParams.y < 1.0f)) {
    _869 = float((uint)_369);
    if (!(_869 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_869 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _878 = _862;
        _879 = _863;
        _880 = _864;
      } else {
        _878 = 0.0f;
        _879 = 0.0f;
        _880 = 0.0f;
      }
    } else {
      _878 = 0.0f;
      _879 = 0.0f;
      _880 = 0.0f;
    }
  } else {
    _878 = _862;
    _879 = _863;
    _880 = _864;
  }
  SV_Target.x = _878;
  SV_Target.y = _879;
  SV_Target.z = _880;
  SV_Target.w = _382;
  return SV_Target;
}