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


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b15, space35) {
  float4 _time;
  float4 _timeNoScale;
  uint4 _frameNumber;
  float4 _screenSizeAndInvSize;
  float4 _bufferSizeAndInvSize;
  float4 _hiZUVScaleAndInvScale;
  float4 _resolutionScale;
  float4 _temporalReprojectionParams;
  float4 _viewPos;
  float4 _viewDir;
  column_major float4x4 _viewProj;
  column_major float4x4 _viewProjNoJitter;
  column_major float4x4 _viewProjRelative;
  column_major float4x4 _viewProjRelativeNoJitter;
  column_major float4x4 _invViewProj;
  column_major float4x4 _invViewProjRelative;
  column_major float4x4 _invViewProjRelativeNoJitter;
  column_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  column_major float4x4 _view;
  column_major float4x4 _viewRelative;
  column_major float4x4 _viewRelativePrev;
  column_major float4x4 _proj;
  column_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  column_major float4x4 _viewProjNoJitterPrev;
  column_major float4x4 _viewProjRelativePrev;
  column_major float4x4 _viewProjRelativeNoJitterPrev;
  column_major float4x4 _invViewProjPrev;
  column_major float4x4 _invViewProjRelativePrev;
  column_major float4x4 _projToPrevProj;
  column_major float4x4 _projToPrevProjNoTranslation;
  column_major float4x4 _viewProjectionTexScale;
  float4 _temporalAAJitter;
  float4 _temporalAAJitterParams;
  float4 _frustumPlanes[6];
  float4 _frustumPlanesPrev[6];
  float4 _frustumCornerDirs[4];
  float4 _screenPercentage;
  float4 _nearFarProj;
  float4 _renderingOriginPos;
  float4 _renderingOriginPosPrev;
  float4 _lodMaskRenderRate;
  float4 _terrainNormalParams;
  int4 _hiZMapInfo;
  int4 _hiZMapInfoCurrent;
  float4 _treeParams;
  uint4 _clusterSize;
  uint4 _globalLightParams;
  float4 _bevelParams;
  float4 _variableRateShadingParams;
  float4 _cavityParams;
  float4 _customRenderPassSizeInvSize;
  uint4 _impostorParams;
  float4 _clusterDecalSizeAndInvSize;
  uint4 _globalWindParams;
  float4 _windFluidVolumeParams;
  float4 _windFluidTextureParams;
  float4 _raytracingAccelerationStructureOrigin;
  float4 _debugBaseColor;
  float4 _debugNormal;
  float4 _debugMaterial;
  float4 _debugMultiplier;
  half4 _debugBaseColor16;
  half4 _debugNormal16;
  half4 _debugMaterial16;
  half4 _debugMultiplier16;
  float4 _debugCursorWorldPos;
  uint4 _debugRenderToggle01;
  uint4 _debugTreeShapeVariation;
  float4 _positionBasedDynamicsParameter;
  float _effectiveMetallicForVelvet;
  float _debugCharacterSnowRate;
  uint _systemRandomSeed;
  uint _skinnedMeshDebugFlag;
  float4 _viewPosShifted;
  float4 _viewPosShiftedPrev;
  float4 _viewTileRelativePos;
  float4 _viewTileRelativePosPrev;
  int2 _viewTileIndex;
  int2 _viewTileIndexPrev;
  float4 _worldVolume;
  float3 _diffViewPosAccurate;
  uint _isPhotosensitiveMode_isAllolwBlood;
};

#define RENODX_TONEMAP_EXTERNAL_SCENE_CONSTANT_BUFFER 1
#define RENODX_TONEMAP_SCENE_TIME_W _time.w
#include "../tonemap.hlsli"



#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b30, space35) {
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
  int _nightToneParm : packoffset(c012.x);
  int3 _padding : packoffset(c012.y);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

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

ConstantBuffer<PostProcessFocusStruct> BindlessParameters_PostProcessFocus[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _28 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float4 _31 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _41 = (pow(_31.x, 0.012683313339948654f));
  float _42 = (pow(_31.y, 0.012683313339948654f));
  float _43 = (pow(_31.z, 0.012683313339948654f));
  float _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _71 = WaveReadLaneFirst(_materialIndex);
  float _79 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._focusRatio);
  float _409;
  float _410;
  float _411;
  float _412;
  float _413;
  float _414;
  float _415;
  float _597;
  float _603;
  float _604;
  float _605;
  float _606;
  float _607;
  float _608;
  float _609;
  float _784;
  float _790;
  float _791;
  float _1016;
  float _1033;
  float _1034;
  float _1163;
  float _1231;
  float _1232;
  float _1233;
  float _1270;
  float _1271;
  float _1272;
  float _1286;
  float _1491;
  float _1492;
  float _1493;
  float _1586;
  float _1587;
  float _1588;
  float _1642;
  float _1643;
  float _1644;
  float _1663;
  float _1664;
  float _1665;
  float _1695;
  float _1696;
  float _1697;
  float _1711;
  float _1712;
  float _1713;
  if (!(!(_79 >= 0.0010000000474974513f))) {
    float _84 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _87 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _89 = 1.0f - (TEXCOORD.y * 2.0f);
    float _90 = max(1.0000000116860974e-07f, _84.x);
    float _126 = mad((_invViewProj[3].z), _90, mad((_invViewProj[3].y), _89, ((_invViewProj[3].x) * _87))) + (_invViewProj[3].w);
    float _127 = (mad((_invViewProj[0].z), _90, mad((_invViewProj[0].y), _89, ((_invViewProj[0].x) * _87))) + (_invViewProj[0].w)) / _126;
    float _128 = (mad((_invViewProj[1].z), _90, mad((_invViewProj[1].y), _89, ((_invViewProj[1].x) * _87))) + (_invViewProj[1].w)) / _126;
    float _129 = (mad((_invViewProj[2].z), _90, mad((_invViewProj[2].y), _89, ((_invViewProj[2].x) * _87))) + (_invViewProj[2].w)) / _126;
    int _130 = WaveReadLaneFirst(_materialIndex);
    int _138 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_130 < (uint)170000), _130, 0)) + 0u))]._focusColor);
    float _141 = float((uint)((uint)(((uint)((uint)(_138)) >> 16) & 255)));
    float _144 = float((uint)((uint)(((uint)((uint)(_138)) >> 8) & 255)));
    float _146 = float((uint)((uint)(_138 & 255)));
    float _176 = max(0.0010000000474974513f, _exposure0.x);
    int _180 = WaveReadLaneFirst(_materialIndex);
    float _188 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))]._focusColorBrightness);
    float _189 = _188 * (select(((_141 * 0.003921568859368563f) < 0.040449999272823334f), (_141 * 0.0003035269910469651f), exp2(log2((_141 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _176);
    float _190 = _188 * (select(((_144 * 0.003921568859368563f) < 0.040449999272823334f), (_144 * 0.0003035269910469651f), exp2(log2((_144 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _176);
    float _191 = _188 * (select(((_146 * 0.003921568859368563f) < 0.040449999272823334f), (_146 * 0.0003035269910469651f), exp2(log2((_146 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _176);
    int _192 = WaveReadLaneFirst(_materialIndex);
    float _200 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_192 < (uint)170000), _192, 0)) + 0u))]._playerFocusRadius);
    int _201 = WaveReadLaneFirst(_materialIndex);
    float _209 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_201 < (uint)170000), _201, 0)) + 0u))]._targetFocusRadius);
    int _210 = WaveReadLaneFirst(_materialIndex);
    float _218 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_210 < (uint)170000), _210, 0)) + 0u))]._worldFocusRadius);
    int _219 = WaveReadLaneFirst(_materialIndex);
    float _227 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_219 < (uint)170000), _219, 0)) + 0u))]._focus3DBlend);
    if (!(!(_200 >= 0.0010000000474974513f))) {
      int _230 = WaveReadLaneFirst(_materialIndex);
      float _238 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_230 < (uint)170000), _230, 0)) + 0u))]._playerFocusCenterRadius);
      int _243 = WaveReadLaneFirst(_materialIndex);
      float _256 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._playerFocusPositionOffset.x) + _mainPosition.x;
      float _257 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._playerFocusPositionOffset.y) + _mainPosition.y;
      float _258 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._playerFocusPositionOffset.z) + _mainPosition.z;
      int _259 = WaveReadLaneFirst(_materialIndex);
      float _267 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_259 < (uint)170000), _259, 0)) + 0u))]._playerFocusPower);
      float _276 = _256 - _viewPos.x;
      float _277 = _257 - _viewPos.y;
      float _278 = _258 - _viewPos.z;
      float _279 = dot(float3(_276, _277, _278), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _280 = _127 - _256;
      float _281 = _128 - _257;
      float _282 = _129 - _258;
      float _292 = saturate((sqrt(((_281 * _281) + (_280 * _280)) + (_282 * _282)) - _238) / max(0.0010000000474974513f, _200));
      if (_227 < 1.0f) {
        float _322 = mad((_viewProjRelative[3].z), _278, mad((_viewProjRelative[3].y), _277, ((_viewProjRelative[3].x) * _276))) + (_viewProjRelative[3].w);
        float _323 = (mad((_viewProjRelative[0].z), _278, mad((_viewProjRelative[0].y), _277, ((_viewProjRelative[0].x) * _276))) + (_viewProjRelative[0].w)) / _322;
        float _327 = 0.5f - (((mad((_viewProjRelative[1].z), _278, mad((_viewProjRelative[1].y), _277, ((_viewProjRelative[1].x) * _276))) + (_viewProjRelative[1].w)) / _322) * 0.5f);
        float _337 = ((_view[0].x) * _200) + _276;
        float _338 = ((_view[0].y) * _200) + _277;
        float _339 = ((_view[0].z) * _200) + _278;
        float _351 = mad((_viewProjRelative[3].z), _339, mad((_viewProjRelative[3].y), _338, (_337 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _357 = (0.5f - (((mad((_viewProjRelative[1].z), _339, mad((_viewProjRelative[1].y), _338, (_337 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _351) * 0.5f)) - _327;
        float _358 = _28 * 0.5f;
        float _359 = _358 * (((mad((_viewProjRelative[0].z), _339, mad((_viewProjRelative[0].y), _338, (_337 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _351) - _323);
        float _367 = ((_view[0].x) * _238) + _276;
        float _368 = ((_view[0].y) * _238) + _277;
        float _369 = ((_view[0].z) * _238) + _278;
        float _381 = mad((_viewProjRelative[3].z), _369, mad((_viewProjRelative[3].y), _368, (_367 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _387 = (0.5f - (((mad((_viewProjRelative[1].z), _369, mad((_viewProjRelative[1].y), _368, (_367 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _381) * 0.5f)) - _327;
        float _388 = _358 * (((mad((_viewProjRelative[0].z), _369, mad((_viewProjRelative[0].y), _368, (_367 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _381) - _323);
        float _395 = TEXCOORD.y - _327;
        float _396 = ((TEXCOORD.x + -0.5f) - (_323 * 0.5f)) * _28;
        float _404 = saturate((sqrt((_395 * _395) + (_396 * _396)) - sqrt((_387 * _387) + (_388 * _388))) / max(0.0010000000474974513f, sqrt((_357 * _357) + (_359 * _359))));
        _409 = (lerp(_404, _292, _227));
        _410 = _238;
        _411 = _267;
        _412 = _256;
        _413 = _257;
        _414 = _258;
        _415 = _279;
      } else {
        _409 = _292;
        _410 = _238;
        _411 = _267;
        _412 = _256;
        _413 = _257;
        _414 = _258;
        _415 = _279;
      }
    } else {
      _409 = 1.0f;
      _410 = 0.0f;
      _411 = 1.0f;
      _412 = 0.0f;
      _413 = 0.0f;
      _414 = 0.0f;
      _415 = 1.0f;
    }
    if (!(!(_209 >= 0.0010000000474974513f))) {
      int _418 = WaveReadLaneFirst(_materialIndex);
      float _426 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_418 < (uint)170000), _418, 0)) + 0u))]._targetFocusCenterRadius);
      int _431 = WaveReadLaneFirst(_materialIndex);
      float _444 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x;
      float _445 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y;
      float _446 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z;
      int _447 = WaveReadLaneFirst(_materialIndex);
      float _464 = _444 - _viewPos.x;
      float _465 = _445 - _viewPos.y;
      float _466 = _446 - _viewPos.z;
      float _467 = dot(float3(_464, _465, _466), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _468 = _127 - _444;
      float _469 = _128 - _445;
      float _470 = _129 - _446;
      float _480 = saturate((sqrt(((_469 * _469) + (_468 * _468)) + (_470 * _470)) - _426) / max(0.0010000000474974513f, _209));
      if (_227 < 1.0f) {
        float _510 = mad((_viewProjRelative[3].z), _466, mad((_viewProjRelative[3].y), _465, ((_viewProjRelative[3].x) * _464))) + (_viewProjRelative[3].w);
        float _511 = (mad((_viewProjRelative[0].z), _466, mad((_viewProjRelative[0].y), _465, ((_viewProjRelative[0].x) * _464))) + (_viewProjRelative[0].w)) / _510;
        float _515 = 0.5f - (((mad((_viewProjRelative[1].z), _466, mad((_viewProjRelative[1].y), _465, ((_viewProjRelative[1].x) * _464))) + (_viewProjRelative[1].w)) / _510) * 0.5f);
        float _525 = ((_view[0].x) * _209) + _464;
        float _526 = ((_view[0].y) * _209) + _465;
        float _527 = ((_view[0].z) * _209) + _466;
        float _539 = mad((_viewProjRelative[3].z), _527, mad((_viewProjRelative[3].y), _526, (_525 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _545 = (0.5f - (((mad((_viewProjRelative[1].z), _527, mad((_viewProjRelative[1].y), _526, (_525 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _539) * 0.5f)) - _515;
        float _546 = _28 * 0.5f;
        float _547 = _546 * (((mad((_viewProjRelative[0].z), _527, mad((_viewProjRelative[0].y), _526, (_525 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _539) - _511);
        float _555 = ((_view[0].x) * _426) + _464;
        float _556 = ((_view[0].y) * _426) + _465;
        float _557 = ((_view[0].z) * _426) + _466;
        float _569 = mad((_viewProjRelative[3].z), _557, mad((_viewProjRelative[3].y), _556, (_555 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _575 = (0.5f - (((mad((_viewProjRelative[1].z), _557, mad((_viewProjRelative[1].y), _556, (_555 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _569) * 0.5f)) - _515;
        float _576 = _546 * (((mad((_viewProjRelative[0].z), _557, mad((_viewProjRelative[0].y), _556, (_555 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _569) - _511);
        float _583 = TEXCOORD.y - _515;
        float _584 = ((TEXCOORD.x + -0.5f) - (_511 * 0.5f)) * _28;
        float _592 = saturate((sqrt((_583 * _583) + (_584 * _584)) - sqrt((_575 * _575) + (_576 * _576))) / max(0.0010000000474974513f, sqrt((_545 * _545) + (_547 * _547))));
        _597 = (lerp(_592, _480, _227));
      } else {
        _597 = _480;
      }
      _603 = ((saturate(_467) * (_597 + -1.0f)) + 1.0f);
      _604 = _426;
      _605 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_447 < (uint)170000), _447, 0)) + 0u))]._targetFocusPower);
      _606 = _444;
      _607 = _445;
      _608 = _446;
      _609 = _467;
    } else {
      _603 = 1.0f;
      _604 = 0.0f;
      _605 = 1.0f;
      _606 = 0.0f;
      _607 = 0.0f;
      _608 = 0.0f;
      _609 = 1.0f;
    }
    if (!(!(_218 >= 0.0010000000474974513f))) {
      int _612 = WaveReadLaneFirst(_materialIndex);
      float _620 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_612 < (uint)170000), _612, 0)) + 0u))]._worldFocusCenterRadius);
      int _621 = WaveReadLaneFirst(_materialIndex);
      float _631 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_621 < (uint)170000), _621, 0)) + 0u))]._worldFocusPosition.x);
      float _632 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_621 < (uint)170000), _621, 0)) + 0u))]._worldFocusPosition.y);
      float _633 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_621 < (uint)170000), _621, 0)) + 0u))]._worldFocusPosition.z);
      int _634 = WaveReadLaneFirst(_materialIndex);
      float _651 = _631 - _viewPos.x;
      float _652 = _632 - _viewPos.y;
      float _653 = _633 - _viewPos.z;
      float _655 = _127 - _631;
      float _656 = _128 - _632;
      float _657 = _129 - _633;
      float _667 = saturate((sqrt(((_656 * _656) + (_655 * _655)) + (_657 * _657)) - _620) / max(0.0010000000474974513f, _218));
      if (_227 < 1.0f) {
        float _697 = mad((_viewProjRelative[3].z), _653, mad((_viewProjRelative[3].y), _652, ((_viewProjRelative[3].x) * _651))) + (_viewProjRelative[3].w);
        float _698 = (mad((_viewProjRelative[0].z), _653, mad((_viewProjRelative[0].y), _652, ((_viewProjRelative[0].x) * _651))) + (_viewProjRelative[0].w)) / _697;
        float _702 = 0.5f - (((mad((_viewProjRelative[1].z), _653, mad((_viewProjRelative[1].y), _652, ((_viewProjRelative[1].x) * _651))) + (_viewProjRelative[1].w)) / _697) * 0.5f);
        float _712 = ((_view[0].x) * _218) + _651;
        float _713 = ((_view[0].y) * _218) + _652;
        float _714 = ((_view[0].z) * _218) + _653;
        float _726 = mad((_viewProjRelative[3].z), _714, mad((_viewProjRelative[3].y), _713, (_712 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _732 = (0.5f - (((mad((_viewProjRelative[1].z), _714, mad((_viewProjRelative[1].y), _713, (_712 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _726) * 0.5f)) - _702;
        float _733 = _28 * 0.5f;
        float _734 = _733 * (((mad((_viewProjRelative[0].z), _714, mad((_viewProjRelative[0].y), _713, (_712 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _726) - _698);
        float _742 = ((_view[0].x) * _620) + _651;
        float _743 = ((_view[0].y) * _620) + _652;
        float _744 = ((_view[0].z) * _620) + _653;
        float _756 = mad((_viewProjRelative[3].z), _744, mad((_viewProjRelative[3].y), _743, (_742 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _762 = (0.5f - (((mad((_viewProjRelative[1].z), _744, mad((_viewProjRelative[1].y), _743, (_742 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _756) * 0.5f)) - _702;
        float _763 = _733 * (((mad((_viewProjRelative[0].z), _744, mad((_viewProjRelative[0].y), _743, (_742 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _756) - _698);
        float _770 = TEXCOORD.y - _702;
        float _771 = ((TEXCOORD.x + -0.5f) - (_698 * 0.5f)) * _28;
        float _779 = saturate((sqrt((_770 * _770) + (_771 * _771)) - sqrt((_762 * _762) + (_763 * _763))) / max(0.0010000000474974513f, sqrt((_732 * _732) + (_734 * _734))));
        _784 = (lerp(_779, _667, _227));
      } else {
        _784 = _667;
      }
      _790 = ((saturate(dot(float3(_651, _652, _653), float3(_viewDir.x, _viewDir.y, _viewDir.z))) * (_784 + -1.0f)) + 1.0f);
      _791 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_634 < (uint)170000), _634, 0)) + 0u))]._worldFocusPower);
    } else {
      _790 = 1.0f;
      _791 = 1.0f;
    }
    int _792 = WaveReadLaneFirst(_materialIndex);
    float _800 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_792 < (uint)170000), _792, 0)) + 0u))]._connectPlayerTargetDistance);
    if (((_209 >= 0.0010000000474974513f)) && ((((_200 >= 0.0010000000474974513f)) && ((_800 >= 0.009999999776482582f))))) {
      int _807 = WaveReadLaneFirst(_materialIndex);
      float _816 = _410 + _200;
      float _817 = _604 + _209;
      float _818 = _606 - _412;
      float _819 = _607 - _413;
      float _820 = _608 - _414;
      float _821 = _127 - _412;
      float _822 = _128 - _413;
      float _823 = _129 - _414;
      float _827 = saturate(dot(float3(_818, _819, _820), float3(_821, _822, _823)) / dot(float3(_818, _819, _820), float3(_818, _819, _820)));
      float _834 = _821 - (_827 * _818);
      float _835 = _822 - (_827 * _819);
      float _836 = _823 - (_827 * _820);
      float _845 = saturate(sqrt(((_834 * _834) + (_835 * _835)) + (_836 * _836)) / max(0.0010000000474974513f, ((_827 * (_817 - _816)) + _816)));
      if (_227 < 1.0f) {
        float _852 = _412 - _viewPos.x;
        float _853 = _413 - _viewPos.y;
        float _854 = _414 - _viewPos.z;
        float _882 = mad((_viewProjRelative[3].z), _854, mad((_viewProjRelative[3].y), _853, ((_viewProjRelative[3].x) * _852))) + (_viewProjRelative[3].w);
        float _883 = (mad((_viewProjRelative[0].z), _854, mad((_viewProjRelative[0].y), _853, ((_viewProjRelative[0].x) * _852))) + (_viewProjRelative[0].w)) / _882;
        float _888 = 0.5f - (((mad((_viewProjRelative[1].z), _854, mad((_viewProjRelative[1].y), _853, ((_viewProjRelative[1].x) * _852))) + (_viewProjRelative[1].w)) / _882) * 0.5f);
        float _898 = ((_view[0].x) * _816) + _852;
        float _899 = ((_view[0].y) * _816) + _853;
        float _900 = ((_view[0].z) * _816) + _854;
        float _912 = mad((_viewProjRelative[3].z), _900, mad((_viewProjRelative[3].y), _899, (_898 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _918 = (0.5f - (((mad((_viewProjRelative[1].z), _900, mad((_viewProjRelative[1].y), _899, (_898 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _912) * 0.5f)) - _888;
        float _919 = _28 * 0.5f;
        float _920 = _919 * (((mad((_viewProjRelative[0].z), _900, mad((_viewProjRelative[0].y), _899, (_898 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _912) - _883);
        float _924 = sqrt((_918 * _918) + (_920 * _920));
        float _925 = _606 - _viewPos.x;
        float _926 = _607 - _viewPos.y;
        float _927 = _608 - _viewPos.z;
        float _939 = mad((_viewProjRelative[3].z), _927, mad((_viewProjRelative[3].y), _926, ((_viewProjRelative[3].x) * _925))) + (_viewProjRelative[3].w);
        float _940 = (mad((_viewProjRelative[0].z), _927, mad((_viewProjRelative[0].y), _926, ((_viewProjRelative[0].x) * _925))) + (_viewProjRelative[0].w)) / _939;
        float _943 = 0.5f - (((mad((_viewProjRelative[1].z), _927, mad((_viewProjRelative[1].y), _926, ((_viewProjRelative[1].x) * _925))) + (_viewProjRelative[1].w)) / _939) * 0.5f);
        float _947 = ((_view[0].x) * _817) + _925;
        float _948 = ((_view[0].y) * _817) + _926;
        float _949 = ((_view[0].z) * _817) + _927;
        float _961 = mad((_viewProjRelative[3].z), _949, mad((_viewProjRelative[3].y), _948, (_947 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _967 = (0.5f - (((mad((_viewProjRelative[1].z), _949, mad((_viewProjRelative[1].y), _948, (_947 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _961) * 0.5f)) - _943;
        float _968 = _919 * (((mad((_viewProjRelative[0].z), _949, mad((_viewProjRelative[0].y), _948, (_947 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _961) - _940);
        float _988 = float((int)(((int)(uint)((int)(_609 > 0.0f))) - ((int)(uint)((int)(_609 < 0.0f))))) * float((int)(((int)(uint)((int)(_415 > 0.0f))) - ((int)(uint)((int)(_415 < 0.0f)))));
        float _989 = ((_940 - _883) * 0.5f) * _988;
        float _990 = (_943 - _888) * _988;
        float _991 = TEXCOORD.x - ((_883 * 0.5f) + 0.5f);
        float _992 = TEXCOORD.y - _888;
        float _996 = saturate(dot(float2(_991, _992), float2(_989, _990)) / dot(float2(_989, _990), float2(_989, _990)));
        float _1003 = _992 - (_996 * _990);
        float _1004 = (_991 - (_996 * _989)) * _28;
        float _1011 = saturate(sqrt((_1004 * _1004) + (_1003 * _1003)) / max(0.0010000000474974513f, ((_996 * (sqrt((_967 * _967) + (_968 * _968)) - _924)) + _924)));
        _1016 = (lerp(_1011, _845, _227));
      } else {
        _1016 = _845;
      }
      float _1017 = _412 - _606;
      float _1018 = _413 - _607;
      float _1019 = _414 - _608;
      float _1026 = _800 * 0.5f;
      _1033 = ((1.0f - saturate((sqrt(((_1018 * _1018) + (_1017 * _1017)) + (_1019 * _1019)) - _1026) / _1026)) * _1016);
      _1034 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_807 < (uint)170000), _807, 0)) + 0u))]._connectPlayerTargetPower);
    } else {
      _1033 = 1.0f;
      _1034 = 1.0f;
    }
    float4 _1037 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _1044 = (pow(_1037.x, 0.012683313339948654f));
    float _1045 = (pow(_1037.y, 0.012683313339948654f));
    int _1066 = WaveReadLaneFirst(_materialIndex);
    float4 _1087 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    float _1091 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    uint2 _1112 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    int _1114 = _1112.x & 127;
    bool _1118 = ((_1114 != 57)) && (((uint)(_1114 + -53) > (uint)14));
    int _1126 = WaveReadLaneFirst(_materialIndex);
    float _1137 = (WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1126 < (uint)170000), _1126, 0)) + 0u))]._maskRatio) * (saturate(((1.0f - saturate(exp2(log2(max(0.0f, (_1045 + -0.8359375f)) / (18.8515625f - (_1045 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) + exp2(log2(1.0f - saturate(exp2(log2(max(0.0f, (_1044 + -0.8359375f)) / (18.8515625f - (_1044 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1066 < (uint)170000), _1066, 0)) + 0u))]._maskBlurPower))) + float((bool)((uint)(((!((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _1091.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1087.x))))) == 0.0f))) && (_1118))))) + -1.0f)) + 1.0f;
    int _1138 = WaveReadLaneFirst(_materialIndex);
    if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1138 < (uint)170000), _1138, 0)) + 0u))]._focusCharacterMaterialMask) >= 0.0010000000474974513f))) {
      int _1150 = WaveReadLaneFirst(_materialIndex);
      _1163 = ((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1150 < (uint)170000), _1150, 0)) + 0u))]._focusCharacterMaterialMask) * (float((bool)(uint)(_1118)) - _1137)) + _1137);
    } else {
      _1163 = _1137;
    }
    float _1176 = _1163 * _1163;
    int _1182 = WaveReadLaneFirst(_materialIndex);
    int _1195 = WaveReadLaneFirst(_materialIndex);
    float _1205 = min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1195 < (uint)170000), _1195, 0)) + 0u))]._focusColorRemap), -1.0f), 1.0f);
    if (!(_1205 == 0.0f)) {
      if (((!(_191 == 0.0f))) || ((((!(_189 == 0.0f))) || ((!(_190 == 0.0f)))))) {
        float _1217 = dot(float3(_68, _69, _70), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_189, _190, _191), float3(_189, _190, _191)));
        _1231 = ((((_1217 * _189) - _68) * _1205) + _68);
        _1232 = ((((_1217 * _190) - _69) * _1205) + _69);
        _1233 = ((((_1217 * _191) - _70) * _1205) + _70);
      } else {
        _1231 = _68;
        _1232 = _69;
        _1233 = _70;
      }
    } else {
      _1231 = _68;
      _1232 = _69;
      _1233 = _70;
    }
    int _1234 = WaveReadLaneFirst(_materialIndex);
    float _1246 = (((((_1176 * _1176) * (pow(_409, _411))) * (pow(_603, _605))) * (pow(_1033, _1034))) * (pow(_790, _791))) * exp2(log2(1.0f - _84.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1182 < (uint)170000), _1182, 0)) + 0u))]._focusSceneDepthFade));
    float _1248 = (_1246 * 0.5f) * (1.0f - min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1234 < (uint)170000), _1234, 0)) + 0u))]._focusBackgroundSaturation), -1.0f), 1.0f));
    float _1249 = dot(float3(_1231, _1232, _1233), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _1256 = (_1248 * (_1249 - _1231)) + _1231;
    float _1257 = (_1248 * (_1249 - _1232)) + _1232;
    float _1258 = (_1248 * (_1249 - _1233)) + _1233;
    float _1259 = _1246 * _79;
    _1270 = (lerp(_1256, _189, _1259));
    _1271 = (lerp(_1257, _190, _1259));
    _1272 = (lerp(_1258, _191, _1259));
  } else {
    _1270 = _68;
    _1271 = _69;
    _1272 = _70;
  }
  uint _1273 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1280 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1273), 0));
    _1286 = (float((uint)((uint)(_1280.x & 127))) + 0.5f);
  } else {
    _1286 = 1.0f;
  }
  bool _1289 = (_localToneMappingParams.w > 0.0f);
  if (_1289) {
    float3 output_color = TonemapReplacer(float3(_1270, _1271, _1272));
    _1642 = output_color.x;
    _1643 = output_color.y;
    _1644 = output_color.z;
  } else {
    _1642 = _1270;
    _1643 = _1271;
    _1644 = _1272;
  }
  if (_etcParams.y > 1.0f) {
    float _1653 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1654 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1658 = saturate(1.0f - (dot(float2(_1653, _1654), float2(_1653, _1654)) * saturate(_etcParams.y + -1.0f)));
    _1663 = (_1658 * _1642);
    _1664 = (_1658 * _1643);
    _1665 = (_1658 * _1644);
  } else {
    _1663 = _1642;
    _1664 = _1643;
    _1665 = _1644;
  }
  if ((_1289) && ((_etcParams.z > 0.0f))) {
    _1695 = select((_1663 <= 0.0031308000907301903f), (_1663 * 12.920000076293945f), (((pow(_1663, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1696 = select((_1664 <= 0.0031308000907301903f), (_1664 * 12.920000076293945f), (((pow(_1664, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1697 = select((_1665 <= 0.0031308000907301903f), (_1665 * 12.920000076293945f), (((pow(_1665, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1695 = _1663;
    _1696 = _1664;
    _1697 = _1665;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1702 = float((uint)_1273);
    if (!(_1702 < _viewDir.w)) {
      if (!(_1702 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1711 = _1695;
        _1712 = _1696;
        _1713 = _1697;
      } else {
        _1711 = 0.0f;
        _1712 = 0.0f;
        _1713 = 0.0f;
      }
    } else {
      _1711 = 0.0f;
      _1712 = 0.0f;
      _1713 = 0.0f;
    }
  } else {
    _1711 = _1695;
    _1712 = _1696;
    _1713 = _1697;
  }
  float _1723 = exp2(log2(_1711 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1724 = exp2(log2(_1712 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1725 = exp2(log2(_1713 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1723 * 18.6875f) + 1.0f)) * ((_1723 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1724 * 18.6875f) + 1.0f)) * ((_1724 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1725 * 18.6875f) + 1.0f)) * ((_1725 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1286;
  return SV_Target;
}