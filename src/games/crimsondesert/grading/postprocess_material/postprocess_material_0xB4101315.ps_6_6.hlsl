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


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
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

#if 0
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
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
  int3 _padding : packoffset(c012.y);
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

ConstantBuffer<PostProcessFocusStruct> BindlessParameters_PostProcessFocus[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _21[36];
  float _27 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float4 _30 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _34 = WaveReadLaneFirst(_materialIndex);
  float _42 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_34 < (uint)170000), _34, 0)) + 0u))]._focusRatio);
  float _372;
  float _373;
  float _374;
  float _375;
  float _376;
  float _377;
  float _378;
  float _560;
  float _566;
  float _567;
  float _568;
  float _569;
  float _570;
  float _571;
  float _572;
  float _747;
  float _753;
  float _754;
  float _979;
  float _996;
  float _997;
  float _1102;
  float _1170;
  float _1171;
  float _1172;
  float _1209;
  float _1210;
  float _1211;
  float _1225;
  float _1471;
  float _1472;
  float _1473;
  float _1593;
  float _1594;
  float _1595;
  float _1616;
  float _1617;
  float _1618;
  float _1651;
  float _1652;
  float _1653;
  float _1667;
  float _1668;
  float _1669;
  if (!(!(_42 >= 0.0010000000474974513f))) {
    float _47 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _50 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _52 = 1.0f - (TEXCOORD.y * 2.0f);
    float _53 = max(1.0000000116860974e-07f, _47.x);
    float _89 = mad((_invViewProj[3].z), _53, mad((_invViewProj[3].y), _52, ((_invViewProj[3].x) * _50))) + (_invViewProj[3].w);
    float _90 = (mad((_invViewProj[0].z), _53, mad((_invViewProj[0].y), _52, ((_invViewProj[0].x) * _50))) + (_invViewProj[0].w)) / _89;
    float _91 = (mad((_invViewProj[1].z), _53, mad((_invViewProj[1].y), _52, ((_invViewProj[1].x) * _50))) + (_invViewProj[1].w)) / _89;
    float _92 = (mad((_invViewProj[2].z), _53, mad((_invViewProj[2].y), _52, ((_invViewProj[2].x) * _50))) + (_invViewProj[2].w)) / _89;
    int _93 = WaveReadLaneFirst(_materialIndex);
    int _101 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._focusColor);
    float _104 = float((uint)((uint)(((uint)((uint)(_101)) >> 16) & 255)));
    float _107 = float((uint)((uint)(((uint)((uint)(_101)) >> 8) & 255)));
    float _109 = float((uint)((uint)(_101 & 255)));
    float _139 = max(0.0010000000474974513f, _exposure0.x);
    int _143 = WaveReadLaneFirst(_materialIndex);
    float _151 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))]._focusColorBrightness);
    float _152 = _151 * (select(((_104 * 0.003921568859368563f) < 0.040449999272823334f), (_104 * 0.0003035269910469651f), exp2(log2((_104 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    float _153 = _151 * (select(((_107 * 0.003921568859368563f) < 0.040449999272823334f), (_107 * 0.0003035269910469651f), exp2(log2((_107 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    float _154 = _151 * (select(((_109 * 0.003921568859368563f) < 0.040449999272823334f), (_109 * 0.0003035269910469651f), exp2(log2((_109 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    int _155 = WaveReadLaneFirst(_materialIndex);
    float _163 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_155 < (uint)170000), _155, 0)) + 0u))]._playerFocusRadius);
    int _164 = WaveReadLaneFirst(_materialIndex);
    float _172 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))]._targetFocusRadius);
    int _173 = WaveReadLaneFirst(_materialIndex);
    float _181 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_173 < (uint)170000), _173, 0)) + 0u))]._worldFocusRadius);
    int _182 = WaveReadLaneFirst(_materialIndex);
    float _190 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_182 < (uint)170000), _182, 0)) + 0u))]._focus3DBlend);
    if (!(!(_163 >= 0.0010000000474974513f))) {
      int _193 = WaveReadLaneFirst(_materialIndex);
      float _201 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))]._playerFocusCenterRadius);
      int _206 = WaveReadLaneFirst(_materialIndex);
      float _219 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._playerFocusPositionOffset.x) + _mainPosition.x;
      float _220 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._playerFocusPositionOffset.y) + _mainPosition.y;
      float _221 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._playerFocusPositionOffset.z) + _mainPosition.z;
      int _222 = WaveReadLaneFirst(_materialIndex);
      float _230 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))]._playerFocusPower);
      float _239 = _219 - _viewPos.x;
      float _240 = _220 - _viewPos.y;
      float _241 = _221 - _viewPos.z;
      float _242 = dot(float3(_239, _240, _241), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _243 = _90 - _219;
      float _244 = _91 - _220;
      float _245 = _92 - _221;
      float _255 = saturate((sqrt(((_244 * _244) + (_243 * _243)) + (_245 * _245)) - _201) / max(0.0010000000474974513f, _163));
      if (_190 < 1.0f) {
        float _285 = mad((_viewProjRelative[3].z), _241, mad((_viewProjRelative[3].y), _240, ((_viewProjRelative[3].x) * _239))) + (_viewProjRelative[3].w);
        float _286 = (mad((_viewProjRelative[0].z), _241, mad((_viewProjRelative[0].y), _240, ((_viewProjRelative[0].x) * _239))) + (_viewProjRelative[0].w)) / _285;
        float _290 = 0.5f - (((mad((_viewProjRelative[1].z), _241, mad((_viewProjRelative[1].y), _240, ((_viewProjRelative[1].x) * _239))) + (_viewProjRelative[1].w)) / _285) * 0.5f);
        float _300 = ((_view[0].x) * _163) + _239;
        float _301 = ((_view[0].y) * _163) + _240;
        float _302 = ((_view[0].z) * _163) + _241;
        float _314 = mad((_viewProjRelative[3].z), _302, mad((_viewProjRelative[3].y), _301, (_300 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _320 = (0.5f - (((mad((_viewProjRelative[1].z), _302, mad((_viewProjRelative[1].y), _301, (_300 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _314) * 0.5f)) - _290;
        float _321 = _27 * 0.5f;
        float _322 = _321 * (((mad((_viewProjRelative[0].z), _302, mad((_viewProjRelative[0].y), _301, (_300 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _314) - _286);
        float _330 = ((_view[0].x) * _201) + _239;
        float _331 = ((_view[0].y) * _201) + _240;
        float _332 = ((_view[0].z) * _201) + _241;
        float _344 = mad((_viewProjRelative[3].z), _332, mad((_viewProjRelative[3].y), _331, (_330 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _350 = (0.5f - (((mad((_viewProjRelative[1].z), _332, mad((_viewProjRelative[1].y), _331, (_330 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _344) * 0.5f)) - _290;
        float _351 = _321 * (((mad((_viewProjRelative[0].z), _332, mad((_viewProjRelative[0].y), _331, (_330 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _344) - _286);
        float _358 = TEXCOORD.y - _290;
        float _359 = ((TEXCOORD.x + -0.5f) - (_286 * 0.5f)) * _27;
        float _367 = saturate((sqrt((_358 * _358) + (_359 * _359)) - sqrt((_350 * _350) + (_351 * _351))) / max(0.0010000000474974513f, sqrt((_320 * _320) + (_322 * _322))));
        _372 = (lerp(_367, _255, _190));
        _373 = _201;
        _374 = _230;
        _375 = _219;
        _376 = _220;
        _377 = _221;
        _378 = _242;
      } else {
        _372 = _255;
        _373 = _201;
        _374 = _230;
        _375 = _219;
        _376 = _220;
        _377 = _221;
        _378 = _242;
      }
    } else {
      _372 = 1.0f;
      _373 = 0.0f;
      _374 = 1.0f;
      _375 = 0.0f;
      _376 = 0.0f;
      _377 = 0.0f;
      _378 = 1.0f;
    }
    if (!(!(_172 >= 0.0010000000474974513f))) {
      int _381 = WaveReadLaneFirst(_materialIndex);
      float _389 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_381 < (uint)170000), _381, 0)) + 0u))]._targetFocusCenterRadius);
      int _394 = WaveReadLaneFirst(_materialIndex);
      float _407 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x;
      float _408 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y;
      float _409 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z;
      int _410 = WaveReadLaneFirst(_materialIndex);
      float _427 = _407 - _viewPos.x;
      float _428 = _408 - _viewPos.y;
      float _429 = _409 - _viewPos.z;
      float _430 = dot(float3(_427, _428, _429), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _431 = _90 - _407;
      float _432 = _91 - _408;
      float _433 = _92 - _409;
      float _443 = saturate((sqrt(((_432 * _432) + (_431 * _431)) + (_433 * _433)) - _389) / max(0.0010000000474974513f, _172));
      if (_190 < 1.0f) {
        float _473 = mad((_viewProjRelative[3].z), _429, mad((_viewProjRelative[3].y), _428, ((_viewProjRelative[3].x) * _427))) + (_viewProjRelative[3].w);
        float _474 = (mad((_viewProjRelative[0].z), _429, mad((_viewProjRelative[0].y), _428, ((_viewProjRelative[0].x) * _427))) + (_viewProjRelative[0].w)) / _473;
        float _478 = 0.5f - (((mad((_viewProjRelative[1].z), _429, mad((_viewProjRelative[1].y), _428, ((_viewProjRelative[1].x) * _427))) + (_viewProjRelative[1].w)) / _473) * 0.5f);
        float _488 = ((_view[0].x) * _172) + _427;
        float _489 = ((_view[0].y) * _172) + _428;
        float _490 = ((_view[0].z) * _172) + _429;
        float _502 = mad((_viewProjRelative[3].z), _490, mad((_viewProjRelative[3].y), _489, (_488 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _508 = (0.5f - (((mad((_viewProjRelative[1].z), _490, mad((_viewProjRelative[1].y), _489, (_488 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _502) * 0.5f)) - _478;
        float _509 = _27 * 0.5f;
        float _510 = _509 * (((mad((_viewProjRelative[0].z), _490, mad((_viewProjRelative[0].y), _489, (_488 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _502) - _474);
        float _518 = ((_view[0].x) * _389) + _427;
        float _519 = ((_view[0].y) * _389) + _428;
        float _520 = ((_view[0].z) * _389) + _429;
        float _532 = mad((_viewProjRelative[3].z), _520, mad((_viewProjRelative[3].y), _519, (_518 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _538 = (0.5f - (((mad((_viewProjRelative[1].z), _520, mad((_viewProjRelative[1].y), _519, (_518 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _532) * 0.5f)) - _478;
        float _539 = _509 * (((mad((_viewProjRelative[0].z), _520, mad((_viewProjRelative[0].y), _519, (_518 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _532) - _474);
        float _546 = TEXCOORD.y - _478;
        float _547 = ((TEXCOORD.x + -0.5f) - (_474 * 0.5f)) * _27;
        float _555 = saturate((sqrt((_546 * _546) + (_547 * _547)) - sqrt((_538 * _538) + (_539 * _539))) / max(0.0010000000474974513f, sqrt((_508 * _508) + (_510 * _510))));
        _560 = (lerp(_555, _443, _190));
      } else {
        _560 = _443;
      }
      _566 = ((saturate(_430) * (_560 + -1.0f)) + 1.0f);
      _567 = _389;
      _568 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_410 < (uint)170000), _410, 0)) + 0u))]._targetFocusPower);
      _569 = _407;
      _570 = _408;
      _571 = _409;
      _572 = _430;
    } else {
      _566 = 1.0f;
      _567 = 0.0f;
      _568 = 1.0f;
      _569 = 0.0f;
      _570 = 0.0f;
      _571 = 0.0f;
      _572 = 1.0f;
    }
    if (!(!(_181 >= 0.0010000000474974513f))) {
      int _575 = WaveReadLaneFirst(_materialIndex);
      float _583 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_575 < (uint)170000), _575, 0)) + 0u))]._worldFocusCenterRadius);
      int _584 = WaveReadLaneFirst(_materialIndex);
      float _594 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))]._worldFocusPosition.x);
      float _595 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))]._worldFocusPosition.y);
      float _596 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))]._worldFocusPosition.z);
      int _597 = WaveReadLaneFirst(_materialIndex);
      float _614 = _594 - _viewPos.x;
      float _615 = _595 - _viewPos.y;
      float _616 = _596 - _viewPos.z;
      float _618 = _90 - _594;
      float _619 = _91 - _595;
      float _620 = _92 - _596;
      float _630 = saturate((sqrt(((_619 * _619) + (_618 * _618)) + (_620 * _620)) - _583) / max(0.0010000000474974513f, _181));
      if (_190 < 1.0f) {
        float _660 = mad((_viewProjRelative[3].z), _616, mad((_viewProjRelative[3].y), _615, ((_viewProjRelative[3].x) * _614))) + (_viewProjRelative[3].w);
        float _661 = (mad((_viewProjRelative[0].z), _616, mad((_viewProjRelative[0].y), _615, ((_viewProjRelative[0].x) * _614))) + (_viewProjRelative[0].w)) / _660;
        float _665 = 0.5f - (((mad((_viewProjRelative[1].z), _616, mad((_viewProjRelative[1].y), _615, ((_viewProjRelative[1].x) * _614))) + (_viewProjRelative[1].w)) / _660) * 0.5f);
        float _675 = ((_view[0].x) * _181) + _614;
        float _676 = ((_view[0].y) * _181) + _615;
        float _677 = ((_view[0].z) * _181) + _616;
        float _689 = mad((_viewProjRelative[3].z), _677, mad((_viewProjRelative[3].y), _676, (_675 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _695 = (0.5f - (((mad((_viewProjRelative[1].z), _677, mad((_viewProjRelative[1].y), _676, (_675 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _689) * 0.5f)) - _665;
        float _696 = _27 * 0.5f;
        float _697 = _696 * (((mad((_viewProjRelative[0].z), _677, mad((_viewProjRelative[0].y), _676, (_675 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _689) - _661);
        float _705 = ((_view[0].x) * _583) + _614;
        float _706 = ((_view[0].y) * _583) + _615;
        float _707 = ((_view[0].z) * _583) + _616;
        float _719 = mad((_viewProjRelative[3].z), _707, mad((_viewProjRelative[3].y), _706, (_705 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _725 = (0.5f - (((mad((_viewProjRelative[1].z), _707, mad((_viewProjRelative[1].y), _706, (_705 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _719) * 0.5f)) - _665;
        float _726 = _696 * (((mad((_viewProjRelative[0].z), _707, mad((_viewProjRelative[0].y), _706, (_705 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _719) - _661);
        float _733 = TEXCOORD.y - _665;
        float _734 = ((TEXCOORD.x + -0.5f) - (_661 * 0.5f)) * _27;
        float _742 = saturate((sqrt((_733 * _733) + (_734 * _734)) - sqrt((_725 * _725) + (_726 * _726))) / max(0.0010000000474974513f, sqrt((_695 * _695) + (_697 * _697))));
        _747 = (lerp(_742, _630, _190));
      } else {
        _747 = _630;
      }
      _753 = ((saturate(dot(float3(_614, _615, _616), float3(_viewDir.x, _viewDir.y, _viewDir.z))) * (_747 + -1.0f)) + 1.0f);
      _754 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_597 < (uint)170000), _597, 0)) + 0u))]._worldFocusPower);
    } else {
      _753 = 1.0f;
      _754 = 1.0f;
    }
    int _755 = WaveReadLaneFirst(_materialIndex);
    float _763 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_755 < (uint)170000), _755, 0)) + 0u))]._connectPlayerTargetDistance);
    if (((_172 >= 0.0010000000474974513f)) && ((((_163 >= 0.0010000000474974513f)) && ((_763 >= 0.009999999776482582f))))) {
      int _770 = WaveReadLaneFirst(_materialIndex);
      float _779 = _373 + _163;
      float _780 = _567 + _172;
      float _781 = _569 - _375;
      float _782 = _570 - _376;
      float _783 = _571 - _377;
      float _784 = _90 - _375;
      float _785 = _91 - _376;
      float _786 = _92 - _377;
      float _790 = saturate(dot(float3(_781, _782, _783), float3(_784, _785, _786)) / dot(float3(_781, _782, _783), float3(_781, _782, _783)));
      float _797 = _784 - (_790 * _781);
      float _798 = _785 - (_790 * _782);
      float _799 = _786 - (_790 * _783);
      float _808 = saturate(sqrt(((_797 * _797) + (_798 * _798)) + (_799 * _799)) / max(0.0010000000474974513f, ((_790 * (_780 - _779)) + _779)));
      if (_190 < 1.0f) {
        float _815 = _375 - _viewPos.x;
        float _816 = _376 - _viewPos.y;
        float _817 = _377 - _viewPos.z;
        float _845 = mad((_viewProjRelative[3].z), _817, mad((_viewProjRelative[3].y), _816, ((_viewProjRelative[3].x) * _815))) + (_viewProjRelative[3].w);
        float _846 = (mad((_viewProjRelative[0].z), _817, mad((_viewProjRelative[0].y), _816, ((_viewProjRelative[0].x) * _815))) + (_viewProjRelative[0].w)) / _845;
        float _851 = 0.5f - (((mad((_viewProjRelative[1].z), _817, mad((_viewProjRelative[1].y), _816, ((_viewProjRelative[1].x) * _815))) + (_viewProjRelative[1].w)) / _845) * 0.5f);
        float _861 = ((_view[0].x) * _779) + _815;
        float _862 = ((_view[0].y) * _779) + _816;
        float _863 = ((_view[0].z) * _779) + _817;
        float _875 = mad((_viewProjRelative[3].z), _863, mad((_viewProjRelative[3].y), _862, (_861 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _881 = (0.5f - (((mad((_viewProjRelative[1].z), _863, mad((_viewProjRelative[1].y), _862, (_861 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _875) * 0.5f)) - _851;
        float _882 = _27 * 0.5f;
        float _883 = _882 * (((mad((_viewProjRelative[0].z), _863, mad((_viewProjRelative[0].y), _862, (_861 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _875) - _846);
        float _887 = sqrt((_881 * _881) + (_883 * _883));
        float _888 = _569 - _viewPos.x;
        float _889 = _570 - _viewPos.y;
        float _890 = _571 - _viewPos.z;
        float _902 = mad((_viewProjRelative[3].z), _890, mad((_viewProjRelative[3].y), _889, ((_viewProjRelative[3].x) * _888))) + (_viewProjRelative[3].w);
        float _903 = (mad((_viewProjRelative[0].z), _890, mad((_viewProjRelative[0].y), _889, ((_viewProjRelative[0].x) * _888))) + (_viewProjRelative[0].w)) / _902;
        float _906 = 0.5f - (((mad((_viewProjRelative[1].z), _890, mad((_viewProjRelative[1].y), _889, ((_viewProjRelative[1].x) * _888))) + (_viewProjRelative[1].w)) / _902) * 0.5f);
        float _910 = ((_view[0].x) * _780) + _888;
        float _911 = ((_view[0].y) * _780) + _889;
        float _912 = ((_view[0].z) * _780) + _890;
        float _924 = mad((_viewProjRelative[3].z), _912, mad((_viewProjRelative[3].y), _911, (_910 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _930 = (0.5f - (((mad((_viewProjRelative[1].z), _912, mad((_viewProjRelative[1].y), _911, (_910 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _924) * 0.5f)) - _906;
        float _931 = _882 * (((mad((_viewProjRelative[0].z), _912, mad((_viewProjRelative[0].y), _911, (_910 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _924) - _903);
        float _951 = float((int)(((int)(uint)((int)(_572 > 0.0f))) - ((int)(uint)((int)(_572 < 0.0f))))) * float((int)(((int)(uint)((int)(_378 > 0.0f))) - ((int)(uint)((int)(_378 < 0.0f)))));
        float _952 = ((_903 - _846) * 0.5f) * _951;
        float _953 = (_906 - _851) * _951;
        float _954 = TEXCOORD.x - ((_846 * 0.5f) + 0.5f);
        float _955 = TEXCOORD.y - _851;
        float _959 = saturate(dot(float2(_954, _955), float2(_952, _953)) / dot(float2(_952, _953), float2(_952, _953)));
        float _966 = _955 - (_959 * _953);
        float _967 = (_954 - (_959 * _952)) * _27;
        float _974 = saturate(sqrt((_967 * _967) + (_966 * _966)) / max(0.0010000000474974513f, ((_959 * (sqrt((_930 * _930) + (_931 * _931)) - _887)) + _887)));
        _979 = (lerp(_974, _808, _190));
      } else {
        _979 = _808;
      }
      float _980 = _375 - _569;
      float _981 = _376 - _570;
      float _982 = _377 - _571;
      float _989 = _763 * 0.5f;
      _996 = ((1.0f - saturate((sqrt(((_981 * _981) + (_980 * _980)) + (_982 * _982)) - _989) / _989)) * _979);
      _997 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_770 < (uint)170000), _770, 0)) + 0u))]._connectPlayerTargetPower);
    } else {
      _996 = 1.0f;
      _997 = 1.0f;
    }
    float4 _1000 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    int _1005 = WaveReadLaneFirst(_materialIndex);
    float4 _1026 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    float _1030 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    uint2 _1051 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    int _1053 = _1051.x & 127;
    bool _1057 = ((_1053 != 57)) && (((uint)(_1053 + -53) > (uint)14));
    int _1065 = WaveReadLaneFirst(_materialIndex);
    float _1076 = (WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1065 < (uint)170000), _1065, 0)) + 0u))]._maskRatio) * (saturate(((1.0f - saturate(_1000.y)) + exp2(log2(1.0f - saturate(_1000.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1005 < (uint)170000), _1005, 0)) + 0u))]._maskBlurPower))) + float((bool)((uint)(((!((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _1030.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1026.x))))) == 0.0f))) && (_1057))))) + -1.0f)) + 1.0f;
    int _1077 = WaveReadLaneFirst(_materialIndex);
    if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1077 < (uint)170000), _1077, 0)) + 0u))]._focusCharacterMaterialMask) >= 0.0010000000474974513f))) {
      int _1089 = WaveReadLaneFirst(_materialIndex);
      _1102 = ((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1089 < (uint)170000), _1089, 0)) + 0u))]._focusCharacterMaterialMask) * (float((bool)(uint)(_1057)) - _1076)) + _1076);
    } else {
      _1102 = _1076;
    }
    float _1115 = _1102 * _1102;
    int _1121 = WaveReadLaneFirst(_materialIndex);
    int _1134 = WaveReadLaneFirst(_materialIndex);
    float _1144 = min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1134 < (uint)170000), _1134, 0)) + 0u))]._focusColorRemap), -1.0f), 1.0f);
    if (!(_1144 == 0.0f)) {
      if (((!(_154 == 0.0f))) || ((((!(_152 == 0.0f))) || ((!(_153 == 0.0f)))))) {
        float _1156 = dot(float3(_30.x, _30.y, _30.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
        _1170 = ((((_1156 * _152) - _30.x) * _1144) + _30.x);
        _1171 = ((((_1156 * _153) - _30.y) * _1144) + _30.y);
        _1172 = ((((_1156 * _154) - _30.z) * _1144) + _30.z);
      } else {
        _1170 = _30.x;
        _1171 = _30.y;
        _1172 = _30.z;
      }
    } else {
      _1170 = _30.x;
      _1171 = _30.y;
      _1172 = _30.z;
    }
    int _1173 = WaveReadLaneFirst(_materialIndex);
    float _1185 = (((((_1115 * _1115) * (pow(_372, _374))) * (pow(_566, _568))) * (pow(_996, _997))) * (pow(_753, _754))) * exp2(log2(1.0f - _47.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1121 < (uint)170000), _1121, 0)) + 0u))]._focusSceneDepthFade));
    float _1187 = (_1185 * 0.5f) * (1.0f - min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1173 < (uint)170000), _1173, 0)) + 0u))]._focusBackgroundSaturation), -1.0f), 1.0f));
    float _1188 = dot(float3(_1170, _1171, _1172), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _1195 = (_1187 * (_1188 - _1170)) + _1170;
    float _1196 = (_1187 * (_1188 - _1171)) + _1171;
    float _1197 = (_1187 * (_1188 - _1172)) + _1172;
    float _1198 = _1185 * _42;
    _1209 = (lerp(_1195, _152, _1198));
    _1210 = (lerp(_1196, _153, _1198));
    _1211 = (lerp(_1197, _154, _1198));
  } else {
    _1209 = _30.x;
    _1210 = _30.y;
    _1211 = _30.z;
  }
  uint _1212 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1219 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1212), 0));
    _1225 = (float((uint)((uint)(_1219.x & 127))) + 0.5f);
  } else {
    _1225 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1209, _1210, _1211));
    _1593 = output_color.x;
    _1594 = output_color.y;
    _1595 = output_color.z;
  } else {
    _1593 = _1209;
    _1594 = _1210;
    _1595 = _1211;
  }
  if (_etcParams.y > 1.0f) {
    float _1606 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1607 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1611 = saturate(1.0f - (dot(float2(_1606, _1607), float2(_1606, _1607)) * saturate(_etcParams.y + -1.0f)));
    _1616 = (_1611 * _1593);
    _1617 = (_1611 * _1594);
    _1618 = (_1611 * _1595);
  } else {
    _1616 = _1593;
    _1617 = _1594;
    _1618 = _1595;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1651 = select((_1616 <= 0.0031308000907301903f), (_1616 * 12.920000076293945f), (((pow(_1616, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1652 = select((_1617 <= 0.0031308000907301903f), (_1617 * 12.920000076293945f), (((pow(_1617, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1653 = select((_1618 <= 0.0031308000907301903f), (_1618 * 12.920000076293945f), (((pow(_1618, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1651 = _1616;
    _1652 = _1617;
    _1653 = _1618;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1658 = float((uint)_1212);
    if (!(_1658 < _viewDir.w)) {
      if (!(_1658 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1667 = _1651;
        _1668 = _1652;
        _1669 = _1653;
      } else {
        _1667 = 0.0f;
        _1668 = 0.0f;
        _1669 = 0.0f;
      }
    } else {
      _1667 = 0.0f;
      _1668 = 0.0f;
      _1669 = 0.0f;
    }
  } else {
    _1667 = _1651;
    _1668 = _1652;
    _1669 = _1653;
  }
  SV_Target.x = _1667;
  SV_Target.y = _1668;
  SV_Target.z = _1669;
  SV_Target.w = _1225;
  return SV_Target;
}

