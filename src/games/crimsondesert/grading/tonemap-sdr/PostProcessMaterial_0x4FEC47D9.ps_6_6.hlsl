#include "../tonemap.hlsli"

struct PostProcessFocusStruct {
  float _focusRatio;
  float _focusSceneDepthFade;
  float _focusBackgroundSaturation;
  float _focus3DBlend;
  float _focusCharacterMaterialMask;
  float _focusColorBrightness;
  uint _focusColor;
  float _focusColorRemap;
  float _maskRatio;
  float _maskNoiseIntensity;
  float _maskBlurThickness;
  float _maskBlurPower;
  uint _maskNoiseTexture;
  float _playerFocusRadius;
  float _playerFocusCenterRadius;
  float _playerFocusPower;
  float3 _playerFocusPositionOffset;
  float _targetFocusRadius;
  float _targetFocusCenterRadius;
  float _targetFocusPower;
  float3 _targetFocusPositionOffset;
  float _connectPlayerTargetDistance;
  float _connectPlayerTargetPower;
  float _worldFocusRadius;
  float _worldFocusCenterRadius;
  float _worldFocusPower;
  float3 _worldFocusPosition;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

struct BindlessParameters_PostProcessFocus {
  PostProcessFocusStruct BindlessParameters_PostProcessFocus;
};

typedef BindlessParameters_PostProcessFocus BindlessParameters_PostProcessFocus_t;
ConstantBuffer<BindlessParameters_PostProcessFocus_t> BindlessParameters_PostProcessFocus[] : register(b0, space100);

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
  float _39;
  int _42;
  int _50;
  int _60;
  float _68;
  int _74;
  float _82;
  float _86;
  float _192;
  float _193;
  float _194;
  float _208;
  float _413;
  float _414;
  float _415;
  float _508;
  float _509;
  float _510;
  float _630;
  float _631;
  float _632;
  float _653;
  float _654;
  float _655;
  float _688;
  float _689;
  float _690;
  float _704;
  float _705;
  float _706;
  uint2 _90;
  int _107;
  float4 _116;
  float4 _134;
  float _137;
  float _138;
  float _145;
  float4 _165;
  float _168;
  float _169;
  float _176;
  uint _195;
  float _217;
  float _266;
  float _267;
  float _268;
  float _270;
  float _277;
  float _278;
  float _279;
  float _298;
  float _299;
  float _300;
  float _301;
  float _302;
  float _303;
  float _304;
  float _305;
  float _306;
  float _352;
  float _353;
  float _354;
  float _355;
  float _356;
  float _357;
  float _358;
  float _375;
  float _376;
  float _377;
  float _378;
  float _384;
  float _387;
  float _394;
  float _395;
  float _396;
  float _425;
  float _450;
  float _451;
  float _452;
  float _471;
  float _472;
  float _473;
  float _479;
  float _483;
  float _484;
  float _485;
  float _486;
  float _491;
  float _516;
  float _520;
  float _521;
  float _522;
  float _523;
  int _564;
  float _619;
  float _643;
  float _644;
  float _648;
  float _695;
  float _24[36];
  _39 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f;
  _42 = WaveReadLaneFirst(_materialIndex);
  _50 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskNoiseTexture);
  _60 = WaveReadLaneFirst(_materialIndex);
  _68 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskNoiseIntensity);
  _74 = WaveReadLaneFirst(_materialIndex);
  _82 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskBlurThickness);
  _86 = ((((_68 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_50 < (uint)65000), _50, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_39 + (TEXCOORD.x * 16.0f)), (_39 + (TEXCOORD.y * 16.0f)))))).z) + -0.5f)) + 1.0f) * 50.0f) * ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x)) * _82;
  if (_passIndex == 0) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_90.x, _90.y);
    _107 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_90.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_90.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255;
    _116 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0));
    if ((_107 == _renderPassTargetFocus) | ((_107 == _renderPassSelfPlayer) || (_107 == _renderPassTest))) {
      _192 = 1.0f;
      _193 = _116.x;
      _194 = _116.x;
    } else {
      _192 = 0.0f;
      _193 = 0.0f;
      _194 = 0.0f;
    }
  } else {
    if (_passIndex == 1) {
      _134 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _137 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.x));
      _138 = _137 * 1.384615421295166f;
      _145 = _137 * 3.230769157409668f;
      _192 = (((((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _138), TEXCOORD.y)))).x) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_138 + TEXCOORD.x), TEXCOORD.y)))).x)) * 0.31621623039245605f) + (_134.x * 0.227027028799057f)) + (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _145), TEXCOORD.y)))).x) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_145 + TEXCOORD.x), TEXCOORD.y)))).x)) * 0.07027027010917664f));
      _193 = (_134.y * 25.0f);
      _194 = 0.0f;
    } else {
      if (_passIndex == 2) {
        _165 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        _168 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.y));
        _169 = _168 * 1.384615421295166f;
        _176 = _168 * 3.230769157409668f;
        _192 = (((((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _169))))).x) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_169 + TEXCOORD.y))))).x)) * 0.31621623039245605f) + (_165.x * 0.227027028799057f)) + (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _176))))).x) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_176 + TEXCOORD.y))))).x)) * 0.07027027010917664f));
        _193 = (_165.y * 25.0f);
        _194 = 0.0f;
      } else {
        _192 = 0.0f;
        _193 = 0.0f;
        _194 = 0.0f;
      }
    }
  }
  _195 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _208 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _195, 0)))).x) & 127))) + 0.5f);
  } else {
    _208 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_192, _193, _194));
    _630 = output_color.x;
    _631 = output_color.y;
    _632 = output_color.z;
  } else {
    _630 = _192;
    _631 = _193;
    _632 = _194;
  }
  if (_etcParams.y > 1.0f) {
    _643 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _644 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _648 = saturate(1.0f - (dot(float2(_643, _644), float2(_643, _644)) * saturate(_etcParams.y + -1.0f)));
    _653 = (_648 * _630);
    _654 = (_648 * _631);
    _655 = (_648 * _632);
  } else {
    _653 = _630;
    _654 = _631;
    _655 = _632;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _688 = select((_653 <= 0.0031308000907301903f), (_653 * 12.920000076293945f), (((pow(_653, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _689 = select((_654 <= 0.0031308000907301903f), (_654 * 12.920000076293945f), (((pow(_654, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _690 = select((_655 <= 0.0031308000907301903f), (_655 * 12.920000076293945f), (((pow(_655, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _688 = _653;
    _689 = _654;
    _690 = _655;
  }
  if (!(_etcParams.y < 1.0f)) {
    _695 = float((uint)_195);
    if (!(_695 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_695 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _704 = _688;
        _705 = _689;
        _706 = _690;
      } else {
        _704 = 0.0f;
        _705 = 0.0f;
        _706 = 0.0f;
      }
    } else {
      _704 = 0.0f;
      _705 = 0.0f;
      _706 = 0.0f;
    }
  } else {
    _704 = _688;
    _705 = _689;
    _706 = _690;
  }
  SV_Target.x = _704;
  SV_Target.y = _705;
  SV_Target.z = _706;
  SV_Target.w = _208;
  return SV_Target;
}