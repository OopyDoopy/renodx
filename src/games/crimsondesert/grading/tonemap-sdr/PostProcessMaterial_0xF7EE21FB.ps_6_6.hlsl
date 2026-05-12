#include "../tonemap.hlsli"

struct PostProcessHousing_CDStruct {
  float _housingPreviewRatio;
  uint _housingValidColor;
  uint _housingInvalidColor;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

cbuffer GlobalMaterialGlobalParameter_Common : register(b50, space98) {
  float3 _mainPosition : packoffset(c000.x);
  float3 _mainPositionPrev : packoffset(c001.x);
  float3 _targetFocusPosition : packoffset(c002.x);
  float _hpPercentage : packoffset(c002.w);
  uint _skinnedMeshNoiseTexture : packoffset(c003.x);
  float _highLightForVision : packoffset(c003.y);
  float _highLightForVisionRemoteCatch : packoffset(c003.z);
  float _characterHighlight : packoffset(c003.w);
  uint _specialModeType : packoffset(c004.x);
  float _visionRadius : packoffset(c004.y);
  float _interactionTime : packoffset(c004.z);
  float3 _questGuideWorldPosition : packoffset(c005.x);
  float3 _detectModeUp : packoffset(c006.x);
  float3 _detectModeLook : packoffset(c007.x);
  float3 _detectModePosition : packoffset(c008.x);
  float2 _detectModeLightProfileOffset : packoffset(c009.x);
  uint _detectModeLightProfileIndex : packoffset(c009.z);
  float _detectModeAngle : packoffset(c009.w);
  float _detectModeRadius : packoffset(c010.x);
  uint _useHatMode : packoffset(c010.y);
  uint4 _oreVeinBitMask : packoffset(c011.x);
  uint _oreVeinDissolveIndex : packoffset(c012.x);
  float _oreVeinDissolveRatio : packoffset(c012.y);
  float _hideStateRatio : packoffset(c012.z);
  float3 _hazardAlertPosition : packoffset(c013.x);
  float _wantedRegionRatio : packoffset(c013.w);
  float _wantedRegionOpacity : packoffset(c014.x);
  float _wantedRegionRadius : packoffset(c014.y);
  float3 _wantedRegionPosition : packoffset(c015.x);
  float _elementActivateDuration : packoffset(c015.w);
  float _temperatureWarning : packoffset(c016.x);
  float _electrocutionWarning : packoffset(c016.y);
  float _fleeCount : packoffset(c016.z);
  float _followLearning : packoffset(c016.w);
  float4 _enemyAlert1 : packoffset(c017.x);
  float4 _enemyAlert2 : packoffset(c018.x);
  float _pullingEffectAttractionOffRadius : packoffset(c019.x);
  float _pullingEffectPushFromCharacter : packoffset(c019.y);
  float _pullingEffectPushScale : packoffset(c019.z);
  float _pullingEffectAttractionScale : packoffset(c019.w);
  float _pullingEffectExternalScale : packoffset(c020.x);
  float _pullingEffectVectorFieldScale : packoffset(c020.y);
  float _pullingEffectHeightOffset : packoffset(c020.z);
  float _housingPreviewState : packoffset(c020.w);
  float _customEffectOpacity : packoffset(c021.x);
  uint _renderPassInteraction : packoffset(c021.y);
  uint _renderPassSelfPlayer : packoffset(c021.z);
  uint _renderPassEnemy : packoffset(c021.w);
  uint _renderPassTargetFocus : packoffset(c022.x);
  uint _renderPassLearning : packoffset(c022.y);
  uint _renderPassTest : packoffset(c022.z);
  uint _enableChromaticAberration : packoffset(c022.w);
  uint _renderPassDetectObjective : packoffset(c023.x);
  uint _renderPassDetectItem : packoffset(c023.y);
  uint _renderPassDetectGimmick : packoffset(c023.z);
  uint _renderPassDetectRemoteCatch : packoffset(c023.w);
  uint _renderPassDetectPickedRemoteCatch : packoffset(c024.x);
  uint _renderPassDetectLift : packoffset(c024.y);
  uint _renderPassKnowledgeNPC : packoffset(c024.z);
  uint _renderPassKnowledgeGain : packoffset(c024.w);
  uint _renderPassAnamorphicMural : packoffset(c025.x);
  uint _renderPassMemoryBackground : packoffset(c025.y);
  uint _renderPassMemory : packoffset(c025.z);
  uint _renderPassEnemyBoss : packoffset(c025.w);
  uint _renderPassAimHighlight : packoffset(c026.x);
  float4 _aimHighlightPosition : packoffset(c027.x);
  uint _renderPassNPCGhost : packoffset(c028.x);
  uint _renderPassHousing : packoffset(c028.y);
};

struct BindlessParameters_PostProcessHousing_CD {
  PostProcessHousing_CDStruct BindlessParameters_PostProcessHousing_CD;
};

typedef BindlessParameters_PostProcessHousing_CD BindlessParameters_PostProcessHousing_CD_t;
ConstantBuffer<BindlessParameters_PostProcessHousing_CD_t> BindlessParameters_PostProcessHousing_CD[] : register(b0, space100);

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
  uint2 _29;
  uint _44;
  float _54;
  float _55;
  float _57;
  float _58;
  float _59;
  float _70;
  float _71;
  float _107;
  float _235;
  float _438;
  float _439;
  float _440;
  float _533;
  float _534;
  float _535;
  float _655;
  float _656;
  float _657;
  float _678;
  float _679;
  float _680;
  float _713;
  float _714;
  float _715;
  float _729;
  float _730;
  float _731;
  float _73;
  float _74;
  float _75;
  float _76;
  float _78;
  int _96;
  float _104;
  int _108;
  int _116;
  float _119;
  float _122;
  float _124;
  float _149;
  float _150;
  float _151;
  int _152;
  int _160;
  float _163;
  float _166;
  float _168;
  float _209;
  float _219;
  float _220;
  float _221;
  uint _222;
  float _242;
  float _291;
  float _292;
  float _293;
  float _295;
  float _302;
  float _303;
  float _304;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  float _329;
  float _330;
  float _331;
  float _377;
  float _378;
  float _379;
  float _380;
  float _381;
  float _382;
  float _383;
  float _400;
  float _401;
  float _402;
  float _403;
  float _409;
  float _412;
  float _419;
  float _420;
  float _421;
  float _450;
  float _475;
  float _476;
  float _477;
  float _496;
  float _497;
  float _498;
  float _504;
  float _508;
  float _509;
  float _510;
  float _511;
  float _516;
  float _541;
  float _545;
  float _546;
  float _547;
  float _548;
  int _589;
  float _644;
  float _668;
  float _669;
  float _673;
  float _720;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
  _44 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_29.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_29.y)))))) + 0.5f) * TEXCOORD.y), 0));
  _54 = (float((uint)((uint)((uint)((uint)(_44.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _55 = (float((uint)((uint)(((uint)((uint)(_44.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _57 = 1.0f - abs(_54);
  _58 = abs(_55);
  _59 = _57 - _58;
  if (_59 < 0.0f) {
    _70 = (select((_54 >= 0.0f), 1.0f, -1.0f) * (1.0f - _58));
    _71 = (select((_55 >= 0.0f), 1.0f, -1.0f) * _57);
  } else {
    _70 = _54;
    _71 = _55;
  }
  _73 = rsqrt(dot(float3(_70, _71, _59), float3(_70, _71, _59)));
  _74 = _73 * _70;
  _75 = _73 * _71;
  _76 = _73 * _59;
  _78 = rsqrt(dot(float3(_74, _75, _76), float3(_74, _75, _76)));
  if ((_44.x & 255) == _renderPassHousing) {
    _96 = WaveReadLaneFirst(_materialIndex);
    _104 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingPreviewRatio);
    _107 = (_104 * (1.0f - abs(dot(float3((_78 * _74), (_78 * _75), (_78 * _76)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))))));
  } else {
    _107 = 0.0f;
  }
  _108 = WaveReadLaneFirst(_materialIndex);
  _116 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingValidColor);
  _119 = float((uint)((uint)(((uint)(_116) >> 16) & 255)));
  _122 = float((uint)((uint)(((uint)(_116) >> 8) & 255)));
  _124 = float((uint)((uint)(_116 & 255)));
  _149 = select(((_119 * 0.003921568859368563f) < 0.040449999272823334f), (_119 * 0.0003035269910469651f), exp2(log2((_119 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _150 = select(((_122 * 0.003921568859368563f) < 0.040449999272823334f), (_122 * 0.0003035269910469651f), exp2(log2((_122 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _151 = select(((_124 * 0.003921568859368563f) < 0.040449999272823334f), (_124 * 0.0003035269910469651f), exp2(log2((_124 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _152 = WaveReadLaneFirst(_materialIndex);
  _160 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingInvalidColor);
  _163 = float((uint)((uint)(((uint)(_160) >> 16) & 255)));
  _166 = float((uint)((uint)(((uint)(_160) >> 8) & 255)));
  _168 = float((uint)((uint)(_160 & 255)));
  _209 = max(0.0010000000474974513f, _exposure0.x);
  _219 = (((((_housingPreviewState * (select(((_163 * 0.003921568859368563f) < 0.040449999272823334f), (_163 * 0.0003035269910469651f), exp2(log2((_163 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _149)) + _149) / _209) - _24.x) * _107) + _24.x;
  _220 = (((((_housingPreviewState * (select(((_166 * 0.003921568859368563f) < 0.040449999272823334f), (_166 * 0.0003035269910469651f), exp2(log2((_166 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _150)) + _150) / _209) - _24.y) * _107) + _24.y;
  _221 = (((((_housingPreviewState * (select(((_168 * 0.003921568859368563f) < 0.040449999272823334f), (_168 * 0.0003035269910469651f), exp2(log2((_168 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _151)) + _151) / _209) - _24.z) * _107) + _24.z;
  _222 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _235 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _222, 0)))).x) & 127))) + 0.5f);
  } else {
    _235 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_219, _220, _221));
    _655 = output_color.x;
    _656 = output_color.y;
    _657 = output_color.z;
  } else {
    _655 = _219;
    _656 = _220;
    _657 = _221;
  }
  if (_etcParams.y > 1.0f) {
    _668 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _669 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _673 = saturate(1.0f - (dot(float2(_668, _669), float2(_668, _669)) * saturate(_etcParams.y + -1.0f)));
    _678 = (_673 * _655);
    _679 = (_673 * _656);
    _680 = (_673 * _657);
  } else {
    _678 = _655;
    _679 = _656;
    _680 = _657;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _713 = select((_678 <= 0.0031308000907301903f), (_678 * 12.920000076293945f), (((pow(_678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _714 = select((_679 <= 0.0031308000907301903f), (_679 * 12.920000076293945f), (((pow(_679, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _715 = select((_680 <= 0.0031308000907301903f), (_680 * 12.920000076293945f), (((pow(_680, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _713 = _678;
    _714 = _679;
    _715 = _680;
  }
  if (!(_etcParams.y < 1.0f)) {
    _720 = float((uint)_222);
    if (!(_720 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_720 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _729 = _713;
        _730 = _714;
        _731 = _715;
      } else {
        _729 = 0.0f;
        _730 = 0.0f;
        _731 = 0.0f;
      }
    } else {
      _729 = 0.0f;
      _730 = 0.0f;
      _731 = 0.0f;
    }
  } else {
    _729 = _713;
    _730 = _714;
    _731 = _715;
  }
  SV_Target.x = _729;
  SV_Target.y = _730;
  SV_Target.z = _731;
  SV_Target.w = _235;
  return SV_Target;
}