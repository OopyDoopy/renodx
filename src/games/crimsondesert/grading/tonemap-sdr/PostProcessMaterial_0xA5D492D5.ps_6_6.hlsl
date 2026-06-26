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
  int _35 = WaveReadLaneFirst(_materialIndex);
  float _43 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_35 < (uint)170000), _35, 0)) + 0u))]._focusRatio);
  float _373;
  float _374;
  float _375;
  float _376;
  float _377;
  float _378;
  float _379;
  float _561;
  float _567;
  float _568;
  float _569;
  float _570;
  float _571;
  float _572;
  float _573;
  float _748;
  float _754;
  float _755;
  float _980;
  float _997;
  float _998;
  float _1103;
  float _1171;
  float _1172;
  float _1173;
  float _1210;
  float _1211;
  float _1212;
  float _1226;
  float _1431;
  float _1432;
  float _1433;
  float _1526;
  float _1527;
  float _1528;
  float _1582;
  float _1583;
  float _1584;
  float _1603;
  float _1604;
  float _1605;
  float _1635;
  float _1636;
  float _1637;
  float _1651;
  float _1652;
  float _1653;
  if (!(!(_43 >= 0.0010000000474974513f))) {
    float _48 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _51 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _53 = 1.0f - (TEXCOORD.y * 2.0f);
    float _54 = max(1.0000000116860974e-07f, _48.x);
    float _90 = mad((_invViewProj[3].z), _54, mad((_invViewProj[3].y), _53, ((_invViewProj[3].x) * _51))) + (_invViewProj[3].w);
    float _91 = (mad((_invViewProj[0].z), _54, mad((_invViewProj[0].y), _53, ((_invViewProj[0].x) * _51))) + (_invViewProj[0].w)) / _90;
    float _92 = (mad((_invViewProj[1].z), _54, mad((_invViewProj[1].y), _53, ((_invViewProj[1].x) * _51))) + (_invViewProj[1].w)) / _90;
    float _93 = (mad((_invViewProj[2].z), _54, mad((_invViewProj[2].y), _53, ((_invViewProj[2].x) * _51))) + (_invViewProj[2].w)) / _90;
    int _94 = WaveReadLaneFirst(_materialIndex);
    int _102 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))]._focusColor);
    float _105 = float((uint)((uint)(((uint)((uint)(_102)) >> 16) & 255)));
    float _108 = float((uint)((uint)(((uint)((uint)(_102)) >> 8) & 255)));
    float _110 = float((uint)((uint)(_102 & 255)));
    float _140 = max(0.0010000000474974513f, _exposure0.x);
    int _144 = WaveReadLaneFirst(_materialIndex);
    float _152 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))]._focusColorBrightness);
    float _153 = _152 * (select(((_105 * 0.003921568859368563f) < 0.040449999272823334f), (_105 * 0.0003035269910469651f), exp2(log2((_105 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _140);
    float _154 = _152 * (select(((_108 * 0.003921568859368563f) < 0.040449999272823334f), (_108 * 0.0003035269910469651f), exp2(log2((_108 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _140);
    float _155 = _152 * (select(((_110 * 0.003921568859368563f) < 0.040449999272823334f), (_110 * 0.0003035269910469651f), exp2(log2((_110 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _140);
    int _156 = WaveReadLaneFirst(_materialIndex);
    float _164 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_156 < (uint)170000), _156, 0)) + 0u))]._playerFocusRadius);
    int _165 = WaveReadLaneFirst(_materialIndex);
    float _173 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_165 < (uint)170000), _165, 0)) + 0u))]._targetFocusRadius);
    int _174 = WaveReadLaneFirst(_materialIndex);
    float _182 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_174 < (uint)170000), _174, 0)) + 0u))]._worldFocusRadius);
    int _183 = WaveReadLaneFirst(_materialIndex);
    float _191 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_183 < (uint)170000), _183, 0)) + 0u))]._focus3DBlend);
    if (!(!(_164 >= 0.0010000000474974513f))) {
      int _194 = WaveReadLaneFirst(_materialIndex);
      float _202 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_194 < (uint)170000), _194, 0)) + 0u))]._playerFocusCenterRadius);
      int _207 = WaveReadLaneFirst(_materialIndex);
      float _220 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._playerFocusPositionOffset.x) + _mainPosition.x;
      float _221 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._playerFocusPositionOffset.y) + _mainPosition.y;
      float _222 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._playerFocusPositionOffset.z) + _mainPosition.z;
      int _223 = WaveReadLaneFirst(_materialIndex);
      float _231 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_223 < (uint)170000), _223, 0)) + 0u))]._playerFocusPower);
      float _240 = _220 - _viewPos.x;
      float _241 = _221 - _viewPos.y;
      float _242 = _222 - _viewPos.z;
      float _243 = dot(float3(_240, _241, _242), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _244 = _91 - _220;
      float _245 = _92 - _221;
      float _246 = _93 - _222;
      float _256 = saturate((sqrt(((_245 * _245) + (_244 * _244)) + (_246 * _246)) - _202) / max(0.0010000000474974513f, _164));
      if (_191 < 1.0f) {
        float _286 = mad((_viewProjRelative[3].z), _242, mad((_viewProjRelative[3].y), _241, ((_viewProjRelative[3].x) * _240))) + (_viewProjRelative[3].w);
        float _287 = (mad((_viewProjRelative[0].z), _242, mad((_viewProjRelative[0].y), _241, ((_viewProjRelative[0].x) * _240))) + (_viewProjRelative[0].w)) / _286;
        float _291 = 0.5f - (((mad((_viewProjRelative[1].z), _242, mad((_viewProjRelative[1].y), _241, ((_viewProjRelative[1].x) * _240))) + (_viewProjRelative[1].w)) / _286) * 0.5f);
        float _301 = ((_view[0].x) * _164) + _240;
        float _302 = ((_view[0].y) * _164) + _241;
        float _303 = ((_view[0].z) * _164) + _242;
        float _315 = mad((_viewProjRelative[3].z), _303, mad((_viewProjRelative[3].y), _302, (_301 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _321 = (0.5f - (((mad((_viewProjRelative[1].z), _303, mad((_viewProjRelative[1].y), _302, (_301 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _315) * 0.5f)) - _291;
        float _322 = _28 * 0.5f;
        float _323 = _322 * (((mad((_viewProjRelative[0].z), _303, mad((_viewProjRelative[0].y), _302, (_301 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _315) - _287);
        float _331 = ((_view[0].x) * _202) + _240;
        float _332 = ((_view[0].y) * _202) + _241;
        float _333 = ((_view[0].z) * _202) + _242;
        float _345 = mad((_viewProjRelative[3].z), _333, mad((_viewProjRelative[3].y), _332, (_331 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _351 = (0.5f - (((mad((_viewProjRelative[1].z), _333, mad((_viewProjRelative[1].y), _332, (_331 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _345) * 0.5f)) - _291;
        float _352 = _322 * (((mad((_viewProjRelative[0].z), _333, mad((_viewProjRelative[0].y), _332, (_331 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _345) - _287);
        float _359 = TEXCOORD.y - _291;
        float _360 = ((TEXCOORD.x + -0.5f) - (_287 * 0.5f)) * _28;
        float _368 = saturate((sqrt((_359 * _359) + (_360 * _360)) - sqrt((_351 * _351) + (_352 * _352))) / max(0.0010000000474974513f, sqrt((_321 * _321) + (_323 * _323))));
        _373 = (lerp(_368, _256, _191));
        _374 = _202;
        _375 = _231;
        _376 = _220;
        _377 = _221;
        _378 = _222;
        _379 = _243;
      } else {
        _373 = _256;
        _374 = _202;
        _375 = _231;
        _376 = _220;
        _377 = _221;
        _378 = _222;
        _379 = _243;
      }
    } else {
      _373 = 1.0f;
      _374 = 0.0f;
      _375 = 1.0f;
      _376 = 0.0f;
      _377 = 0.0f;
      _378 = 0.0f;
      _379 = 1.0f;
    }
    if (!(!(_173 >= 0.0010000000474974513f))) {
      int _382 = WaveReadLaneFirst(_materialIndex);
      float _390 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_382 < (uint)170000), _382, 0)) + 0u))]._targetFocusCenterRadius);
      int _395 = WaveReadLaneFirst(_materialIndex);
      float _408 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x;
      float _409 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y;
      float _410 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z;
      int _411 = WaveReadLaneFirst(_materialIndex);
      float _428 = _408 - _viewPos.x;
      float _429 = _409 - _viewPos.y;
      float _430 = _410 - _viewPos.z;
      float _431 = dot(float3(_428, _429, _430), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _432 = _91 - _408;
      float _433 = _92 - _409;
      float _434 = _93 - _410;
      float _444 = saturate((sqrt(((_433 * _433) + (_432 * _432)) + (_434 * _434)) - _390) / max(0.0010000000474974513f, _173));
      if (_191 < 1.0f) {
        float _474 = mad((_viewProjRelative[3].z), _430, mad((_viewProjRelative[3].y), _429, ((_viewProjRelative[3].x) * _428))) + (_viewProjRelative[3].w);
        float _475 = (mad((_viewProjRelative[0].z), _430, mad((_viewProjRelative[0].y), _429, ((_viewProjRelative[0].x) * _428))) + (_viewProjRelative[0].w)) / _474;
        float _479 = 0.5f - (((mad((_viewProjRelative[1].z), _430, mad((_viewProjRelative[1].y), _429, ((_viewProjRelative[1].x) * _428))) + (_viewProjRelative[1].w)) / _474) * 0.5f);
        float _489 = ((_view[0].x) * _173) + _428;
        float _490 = ((_view[0].y) * _173) + _429;
        float _491 = ((_view[0].z) * _173) + _430;
        float _503 = mad((_viewProjRelative[3].z), _491, mad((_viewProjRelative[3].y), _490, (_489 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _509 = (0.5f - (((mad((_viewProjRelative[1].z), _491, mad((_viewProjRelative[1].y), _490, (_489 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _503) * 0.5f)) - _479;
        float _510 = _28 * 0.5f;
        float _511 = _510 * (((mad((_viewProjRelative[0].z), _491, mad((_viewProjRelative[0].y), _490, (_489 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _503) - _475);
        float _519 = ((_view[0].x) * _390) + _428;
        float _520 = ((_view[0].y) * _390) + _429;
        float _521 = ((_view[0].z) * _390) + _430;
        float _533 = mad((_viewProjRelative[3].z), _521, mad((_viewProjRelative[3].y), _520, (_519 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _539 = (0.5f - (((mad((_viewProjRelative[1].z), _521, mad((_viewProjRelative[1].y), _520, (_519 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _533) * 0.5f)) - _479;
        float _540 = _510 * (((mad((_viewProjRelative[0].z), _521, mad((_viewProjRelative[0].y), _520, (_519 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _533) - _475);
        float _547 = TEXCOORD.y - _479;
        float _548 = ((TEXCOORD.x + -0.5f) - (_475 * 0.5f)) * _28;
        float _556 = saturate((sqrt((_547 * _547) + (_548 * _548)) - sqrt((_539 * _539) + (_540 * _540))) / max(0.0010000000474974513f, sqrt((_509 * _509) + (_511 * _511))));
        _561 = (lerp(_556, _444, _191));
      } else {
        _561 = _444;
      }
      _567 = ((saturate(_431) * (_561 + -1.0f)) + 1.0f);
      _568 = _390;
      _569 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_411 < (uint)170000), _411, 0)) + 0u))]._targetFocusPower);
      _570 = _408;
      _571 = _409;
      _572 = _410;
      _573 = _431;
    } else {
      _567 = 1.0f;
      _568 = 0.0f;
      _569 = 1.0f;
      _570 = 0.0f;
      _571 = 0.0f;
      _572 = 0.0f;
      _573 = 1.0f;
    }
    if (!(!(_182 >= 0.0010000000474974513f))) {
      int _576 = WaveReadLaneFirst(_materialIndex);
      float _584 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_576 < (uint)170000), _576, 0)) + 0u))]._worldFocusCenterRadius);
      int _585 = WaveReadLaneFirst(_materialIndex);
      float _595 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_585 < (uint)170000), _585, 0)) + 0u))]._worldFocusPosition.x);
      float _596 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_585 < (uint)170000), _585, 0)) + 0u))]._worldFocusPosition.y);
      float _597 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_585 < (uint)170000), _585, 0)) + 0u))]._worldFocusPosition.z);
      int _598 = WaveReadLaneFirst(_materialIndex);
      float _615 = _595 - _viewPos.x;
      float _616 = _596 - _viewPos.y;
      float _617 = _597 - _viewPos.z;
      float _619 = _91 - _595;
      float _620 = _92 - _596;
      float _621 = _93 - _597;
      float _631 = saturate((sqrt(((_620 * _620) + (_619 * _619)) + (_621 * _621)) - _584) / max(0.0010000000474974513f, _182));
      if (_191 < 1.0f) {
        float _661 = mad((_viewProjRelative[3].z), _617, mad((_viewProjRelative[3].y), _616, ((_viewProjRelative[3].x) * _615))) + (_viewProjRelative[3].w);
        float _662 = (mad((_viewProjRelative[0].z), _617, mad((_viewProjRelative[0].y), _616, ((_viewProjRelative[0].x) * _615))) + (_viewProjRelative[0].w)) / _661;
        float _666 = 0.5f - (((mad((_viewProjRelative[1].z), _617, mad((_viewProjRelative[1].y), _616, ((_viewProjRelative[1].x) * _615))) + (_viewProjRelative[1].w)) / _661) * 0.5f);
        float _676 = ((_view[0].x) * _182) + _615;
        float _677 = ((_view[0].y) * _182) + _616;
        float _678 = ((_view[0].z) * _182) + _617;
        float _690 = mad((_viewProjRelative[3].z), _678, mad((_viewProjRelative[3].y), _677, (_676 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _696 = (0.5f - (((mad((_viewProjRelative[1].z), _678, mad((_viewProjRelative[1].y), _677, (_676 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _690) * 0.5f)) - _666;
        float _697 = _28 * 0.5f;
        float _698 = _697 * (((mad((_viewProjRelative[0].z), _678, mad((_viewProjRelative[0].y), _677, (_676 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _690) - _662);
        float _706 = ((_view[0].x) * _584) + _615;
        float _707 = ((_view[0].y) * _584) + _616;
        float _708 = ((_view[0].z) * _584) + _617;
        float _720 = mad((_viewProjRelative[3].z), _708, mad((_viewProjRelative[3].y), _707, (_706 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _726 = (0.5f - (((mad((_viewProjRelative[1].z), _708, mad((_viewProjRelative[1].y), _707, (_706 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _720) * 0.5f)) - _666;
        float _727 = _697 * (((mad((_viewProjRelative[0].z), _708, mad((_viewProjRelative[0].y), _707, (_706 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _720) - _662);
        float _734 = TEXCOORD.y - _666;
        float _735 = ((TEXCOORD.x + -0.5f) - (_662 * 0.5f)) * _28;
        float _743 = saturate((sqrt((_734 * _734) + (_735 * _735)) - sqrt((_726 * _726) + (_727 * _727))) / max(0.0010000000474974513f, sqrt((_696 * _696) + (_698 * _698))));
        _748 = (lerp(_743, _631, _191));
      } else {
        _748 = _631;
      }
      _754 = ((saturate(dot(float3(_615, _616, _617), float3(_viewDir.x, _viewDir.y, _viewDir.z))) * (_748 + -1.0f)) + 1.0f);
      _755 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_598 < (uint)170000), _598, 0)) + 0u))]._worldFocusPower);
    } else {
      _754 = 1.0f;
      _755 = 1.0f;
    }
    int _756 = WaveReadLaneFirst(_materialIndex);
    float _764 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_756 < (uint)170000), _756, 0)) + 0u))]._connectPlayerTargetDistance);
    if (((_173 >= 0.0010000000474974513f)) && ((((_164 >= 0.0010000000474974513f)) && ((_764 >= 0.009999999776482582f))))) {
      int _771 = WaveReadLaneFirst(_materialIndex);
      float _780 = _374 + _164;
      float _781 = _568 + _173;
      float _782 = _570 - _376;
      float _783 = _571 - _377;
      float _784 = _572 - _378;
      float _785 = _91 - _376;
      float _786 = _92 - _377;
      float _787 = _93 - _378;
      float _791 = saturate(dot(float3(_782, _783, _784), float3(_785, _786, _787)) / dot(float3(_782, _783, _784), float3(_782, _783, _784)));
      float _798 = _785 - (_791 * _782);
      float _799 = _786 - (_791 * _783);
      float _800 = _787 - (_791 * _784);
      float _809 = saturate(sqrt(((_798 * _798) + (_799 * _799)) + (_800 * _800)) / max(0.0010000000474974513f, ((_791 * (_781 - _780)) + _780)));
      if (_191 < 1.0f) {
        float _816 = _376 - _viewPos.x;
        float _817 = _377 - _viewPos.y;
        float _818 = _378 - _viewPos.z;
        float _846 = mad((_viewProjRelative[3].z), _818, mad((_viewProjRelative[3].y), _817, ((_viewProjRelative[3].x) * _816))) + (_viewProjRelative[3].w);
        float _847 = (mad((_viewProjRelative[0].z), _818, mad((_viewProjRelative[0].y), _817, ((_viewProjRelative[0].x) * _816))) + (_viewProjRelative[0].w)) / _846;
        float _852 = 0.5f - (((mad((_viewProjRelative[1].z), _818, mad((_viewProjRelative[1].y), _817, ((_viewProjRelative[1].x) * _816))) + (_viewProjRelative[1].w)) / _846) * 0.5f);
        float _862 = ((_view[0].x) * _780) + _816;
        float _863 = ((_view[0].y) * _780) + _817;
        float _864 = ((_view[0].z) * _780) + _818;
        float _876 = mad((_viewProjRelative[3].z), _864, mad((_viewProjRelative[3].y), _863, (_862 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _882 = (0.5f - (((mad((_viewProjRelative[1].z), _864, mad((_viewProjRelative[1].y), _863, (_862 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _876) * 0.5f)) - _852;
        float _883 = _28 * 0.5f;
        float _884 = _883 * (((mad((_viewProjRelative[0].z), _864, mad((_viewProjRelative[0].y), _863, (_862 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _876) - _847);
        float _888 = sqrt((_882 * _882) + (_884 * _884));
        float _889 = _570 - _viewPos.x;
        float _890 = _571 - _viewPos.y;
        float _891 = _572 - _viewPos.z;
        float _903 = mad((_viewProjRelative[3].z), _891, mad((_viewProjRelative[3].y), _890, ((_viewProjRelative[3].x) * _889))) + (_viewProjRelative[3].w);
        float _904 = (mad((_viewProjRelative[0].z), _891, mad((_viewProjRelative[0].y), _890, ((_viewProjRelative[0].x) * _889))) + (_viewProjRelative[0].w)) / _903;
        float _907 = 0.5f - (((mad((_viewProjRelative[1].z), _891, mad((_viewProjRelative[1].y), _890, ((_viewProjRelative[1].x) * _889))) + (_viewProjRelative[1].w)) / _903) * 0.5f);
        float _911 = ((_view[0].x) * _781) + _889;
        float _912 = ((_view[0].y) * _781) + _890;
        float _913 = ((_view[0].z) * _781) + _891;
        float _925 = mad((_viewProjRelative[3].z), _913, mad((_viewProjRelative[3].y), _912, (_911 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _931 = (0.5f - (((mad((_viewProjRelative[1].z), _913, mad((_viewProjRelative[1].y), _912, (_911 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _925) * 0.5f)) - _907;
        float _932 = _883 * (((mad((_viewProjRelative[0].z), _913, mad((_viewProjRelative[0].y), _912, (_911 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _925) - _904);
        float _952 = float((int)(((int)(uint)((int)(_573 > 0.0f))) - ((int)(uint)((int)(_573 < 0.0f))))) * float((int)(((int)(uint)((int)(_379 > 0.0f))) - ((int)(uint)((int)(_379 < 0.0f)))));
        float _953 = ((_904 - _847) * 0.5f) * _952;
        float _954 = (_907 - _852) * _952;
        float _955 = TEXCOORD.x - ((_847 * 0.5f) + 0.5f);
        float _956 = TEXCOORD.y - _852;
        float _960 = saturate(dot(float2(_955, _956), float2(_953, _954)) / dot(float2(_953, _954), float2(_953, _954)));
        float _967 = _956 - (_960 * _954);
        float _968 = (_955 - (_960 * _953)) * _28;
        float _975 = saturate(sqrt((_968 * _968) + (_967 * _967)) / max(0.0010000000474974513f, ((_960 * (sqrt((_931 * _931) + (_932 * _932)) - _888)) + _888)));
        _980 = (lerp(_975, _809, _191));
      } else {
        _980 = _809;
      }
      float _981 = _376 - _570;
      float _982 = _377 - _571;
      float _983 = _378 - _572;
      float _990 = _764 * 0.5f;
      _997 = ((1.0f - saturate((sqrt(((_982 * _982) + (_981 * _981)) + (_983 * _983)) - _990) / _990)) * _980);
      _998 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_771 < (uint)170000), _771, 0)) + 0u))]._connectPlayerTargetPower);
    } else {
      _997 = 1.0f;
      _998 = 1.0f;
    }
    float4 _1001 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    int _1006 = WaveReadLaneFirst(_materialIndex);
    float4 _1027 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    float _1031 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    uint2 _1052 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    int _1054 = _1052.x & 127;
    bool _1058 = ((_1054 != 57)) && (((uint)(_1054 + -53) > (uint)14));
    int _1066 = WaveReadLaneFirst(_materialIndex);
    float _1077 = (WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1066 < (uint)170000), _1066, 0)) + 0u))]._maskRatio) * (saturate(((1.0f - saturate(_1001.y)) + exp2(log2(1.0f - saturate(_1001.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1006 < (uint)170000), _1006, 0)) + 0u))]._maskBlurPower))) + float((bool)((uint)(((!((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _1031.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1027.x))))) == 0.0f))) && (_1058))))) + -1.0f)) + 1.0f;
    int _1078 = WaveReadLaneFirst(_materialIndex);
    if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1078 < (uint)170000), _1078, 0)) + 0u))]._focusCharacterMaterialMask) >= 0.0010000000474974513f))) {
      int _1090 = WaveReadLaneFirst(_materialIndex);
      _1103 = ((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1090 < (uint)170000), _1090, 0)) + 0u))]._focusCharacterMaterialMask) * (float((bool)(uint)(_1058)) - _1077)) + _1077);
    } else {
      _1103 = _1077;
    }
    float _1116 = _1103 * _1103;
    int _1122 = WaveReadLaneFirst(_materialIndex);
    int _1135 = WaveReadLaneFirst(_materialIndex);
    float _1145 = min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1135 < (uint)170000), _1135, 0)) + 0u))]._focusColorRemap), -1.0f), 1.0f);
    if (!(_1145 == 0.0f)) {
      if (((!(_155 == 0.0f))) || ((((!(_153 == 0.0f))) || ((!(_154 == 0.0f)))))) {
        float _1157 = dot(float3(_31.x, _31.y, _31.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_153, _154, _155), float3(_153, _154, _155)));
        _1171 = ((((_1157 * _153) - _31.x) * _1145) + _31.x);
        _1172 = ((((_1157 * _154) - _31.y) * _1145) + _31.y);
        _1173 = ((((_1157 * _155) - _31.z) * _1145) + _31.z);
      } else {
        _1171 = _31.x;
        _1172 = _31.y;
        _1173 = _31.z;
      }
    } else {
      _1171 = _31.x;
      _1172 = _31.y;
      _1173 = _31.z;
    }
    int _1174 = WaveReadLaneFirst(_materialIndex);
    float _1186 = (((((_1116 * _1116) * (pow(_373, _375))) * (pow(_567, _569))) * (pow(_997, _998))) * (pow(_754, _755))) * exp2(log2(1.0f - _48.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1122 < (uint)170000), _1122, 0)) + 0u))]._focusSceneDepthFade));
    float _1188 = (_1186 * 0.5f) * (1.0f - min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1174 < (uint)170000), _1174, 0)) + 0u))]._focusBackgroundSaturation), -1.0f), 1.0f));
    float _1189 = dot(float3(_1171, _1172, _1173), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _1196 = (_1188 * (_1189 - _1171)) + _1171;
    float _1197 = (_1188 * (_1189 - _1172)) + _1172;
    float _1198 = (_1188 * (_1189 - _1173)) + _1173;
    float _1199 = _1186 * _43;
    _1210 = (lerp(_1196, _153, _1199));
    _1211 = (lerp(_1197, _154, _1199));
    _1212 = (lerp(_1198, _155, _1199));
  } else {
    _1210 = _31.x;
    _1211 = _31.y;
    _1212 = _31.z;
  }
  uint _1213 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1220 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1213), 0));
    _1226 = (float((uint)((uint)(_1220.x & 127))) + 0.5f);
  } else {
    _1226 = 1.0f;
  }
  bool _1229 = (_localToneMappingParams.w > 0.0f);
  if (_1229) {
    float3 output_color = TonemapReplacer(float3(_1210, _1211, _1212));
    _1582 = output_color.x;
    _1583 = output_color.y;
    _1584 = output_color.z;
  } else {
    _1582 = _1210;
    _1583 = _1211;
    _1584 = _1212;
  }
  if (_etcParams.y > 1.0f) {
    float _1593 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1594 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1598 = saturate(1.0f - (dot(float2(_1593, _1594), float2(_1593, _1594)) * saturate(_etcParams.y + -1.0f)));
    _1603 = (_1598 * _1582);
    _1604 = (_1598 * _1583);
    _1605 = (_1598 * _1584);
  } else {
    _1603 = _1582;
    _1604 = _1583;
    _1605 = _1584;
  }
  if ((_1229) && ((_etcParams.z > 0.0f))) {
    _1635 = select((_1603 <= 0.0031308000907301903f), (_1603 * 12.920000076293945f), (((pow(_1603, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1636 = select((_1604 <= 0.0031308000907301903f), (_1604 * 12.920000076293945f), (((pow(_1604, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1637 = select((_1605 <= 0.0031308000907301903f), (_1605 * 12.920000076293945f), (((pow(_1605, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1635 = _1603;
    _1636 = _1604;
    _1637 = _1605;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1642 = float((uint)_1213);
    if (!(_1642 < _viewDir.w)) {
      if (!(_1642 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1651 = _1635;
        _1652 = _1636;
        _1653 = _1637;
      } else {
        _1651 = 0.0f;
        _1652 = 0.0f;
        _1653 = 0.0f;
      }
    } else {
      _1651 = 0.0f;
      _1652 = 0.0f;
      _1653 = 0.0f;
    }
  } else {
    _1651 = _1635;
    _1652 = _1636;
    _1653 = _1637;
  }
  SV_Target.x = _1651;
  SV_Target.y = _1652;
  SV_Target.z = _1653;
  SV_Target.w = _1226;
  return SV_Target;
}