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
  float _324;
  float _325;
  float _326;
  float _340;
  float _545;
  float _546;
  float _547;
  float _640;
  float _641;
  float _642;
  float _762;
  float _763;
  float _764;
  float _785;
  float _786;
  float _787;
  float _820;
  float _821;
  float _822;
  float _836;
  float _837;
  float _838;
  uint2 _90;
  int _107;
  float4 _116;
  float4 _134;
  float _141;
  float _142;
  float _159;
  float _160;
  float _166;
  float _180;
  float _189;
  float _195;
  float _209;
  float4 _231;
  float _238;
  float _239;
  float _256;
  float _257;
  float _263;
  float _277;
  float _286;
  float _292;
  float _306;
  uint _327;
  float _349;
  float _398;
  float _399;
  float _400;
  float _402;
  float _409;
  float _410;
  float _411;
  float _430;
  float _431;
  float _432;
  float _433;
  float _434;
  float _435;
  float _436;
  float _437;
  float _438;
  float _484;
  float _485;
  float _486;
  float _487;
  float _488;
  float _489;
  float _490;
  float _507;
  float _508;
  float _509;
  float _510;
  float _516;
  float _519;
  float _526;
  float _527;
  float _528;
  float _557;
  float _582;
  float _583;
  float _584;
  float _603;
  float _604;
  float _605;
  float _611;
  float _615;
  float _616;
  float _617;
  float _618;
  float _623;
  float _648;
  float _652;
  float _653;
  float _654;
  float _655;
  int _696;
  float _751;
  float _775;
  float _776;
  float _780;
  float _827;
  float _848;
  float _849;
  float _850;
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
      _324 = 1.0f;
      _325 = _116.x;
      _326 = _116.x;
    } else {
      _324 = 0.0f;
      _325 = 0.0f;
      _326 = 0.0f;
    }
  } else {
    if (_passIndex == 1) {
      _134 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _141 = (pow(_134.x, 0.012683313339948654f));
      _142 = (pow(_134.y, 0.012683313339948654f));
      _159 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.x));
      _160 = _159 * 1.384615421295166f;
      _166 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_160 + TEXCOORD.x), TEXCOORD.y)))).x) * 0.012683313339948654f);
      _180 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _160), TEXCOORD.y)))).x) * 0.012683313339948654f);
      _189 = _159 * 3.230769157409668f;
      _195 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_189 + TEXCOORD.x), TEXCOORD.y)))).x) * 0.012683313339948654f);
      _209 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _189), TEXCOORD.y)))).x) * 0.012683313339948654f);
      _324 = ((((exp2(log2(max(0.0f, (_180 + -0.8359375f)) / (18.8515625f - (_180 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_166 + -0.8359375f)) / (18.8515625f - (_166 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_141 + -0.8359375f)) / (18.8515625f - (_141 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_209 + -0.8359375f)) / (18.8515625f - (_209 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _325 = (exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
      _326 = 0.0f;
    } else {
      if (_passIndex == 2) {
        _231 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        _238 = (pow(_231.x, 0.012683313339948654f));
        _239 = (pow(_231.y, 0.012683313339948654f));
        _256 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.y));
        _257 = _256 * 1.384615421295166f;
        _263 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_257 + TEXCOORD.y))))).x) * 0.012683313339948654f);
        _277 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _257))))).x) * 0.012683313339948654f);
        _286 = _256 * 3.230769157409668f;
        _292 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_286 + TEXCOORD.y))))).x) * 0.012683313339948654f);
        _306 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _286))))).x) * 0.012683313339948654f);
        _324 = ((((exp2(log2(max(0.0f, (_277 + -0.8359375f)) / (18.8515625f - (_277 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_263 + -0.8359375f)) / (18.8515625f - (_263 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_238 + -0.8359375f)) / (18.8515625f - (_238 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_292 + -0.8359375f)) / (18.8515625f - (_292 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _325 = (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
        _326 = 0.0f;
      } else {
        _324 = 0.0f;
        _325 = 0.0f;
        _326 = 0.0f;
      }
    }
  }
  _327 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _340 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _327, 0)))).x) & 127))) + 0.5f);
  } else {
    _340 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_324, _325, _326));
    _762 = output_color.x;
    _763 = output_color.y;
    _764 = output_color.z;
  } else {
    _762 = _324;
    _763 = _325;
    _764 = _326;
  }
  if (_etcParams.y > 1.0f) {
    _775 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _776 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _780 = saturate(1.0f - (dot(float2(_775, _776), float2(_775, _776)) * saturate(_etcParams.y + -1.0f)));
    _785 = (_780 * _762);
    _786 = (_780 * _763);
    _787 = (_780 * _764);
  } else {
    _785 = _762;
    _786 = _763;
    _787 = _764;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _820 = select((_785 <= 0.0031308000907301903f), (_785 * 12.920000076293945f), (((pow(_785, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _821 = select((_786 <= 0.0031308000907301903f), (_786 * 12.920000076293945f), (((pow(_786, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _822 = select((_787 <= 0.0031308000907301903f), (_787 * 12.920000076293945f), (((pow(_787, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _820 = _785;
    _821 = _786;
    _822 = _787;
  }
  if (!(_etcParams.y < 1.0f)) {
    _827 = float((uint)_327);
    if (!(_827 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_827 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _836 = _820;
        _837 = _821;
        _838 = _822;
      } else {
        _836 = 0.0f;
        _837 = 0.0f;
        _838 = 0.0f;
      }
    } else {
      _836 = 0.0f;
      _837 = 0.0f;
      _838 = 0.0f;
    }
  } else {
    _836 = _820;
    _837 = _821;
    _838 = _822;
  }
  _848 = exp2(log2(_836 * 9.999999747378752e-05f) * 0.1593017578125f);
  _849 = exp2(log2(_837 * 9.999999747378752e-05f) * 0.1593017578125f);
  _850 = exp2(log2(_838 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_848 * 18.6875f) + 1.0f)) * ((_848 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_849 * 18.6875f) + 1.0f)) * ((_849 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_850 * 18.6875f) + 1.0f)) * ((_850 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _340;
  return SV_Target;
}