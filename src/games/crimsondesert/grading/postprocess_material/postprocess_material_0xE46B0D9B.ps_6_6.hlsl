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
  float _40 = (pow(_30.x, 0.012683313339948654f));
  float _41 = (pow(_30.y, 0.012683313339948654f));
  float _42 = (pow(_30.z, 0.012683313339948654f));
  float _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _70 = WaveReadLaneFirst(_materialIndex);
  float _78 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_70 < (uint)170000), _70, 0)) + 0u))]._focusRatio);
  float _408;
  float _409;
  float _410;
  float _411;
  float _412;
  float _413;
  float _414;
  float _596;
  float _602;
  float _603;
  float _604;
  float _605;
  float _606;
  float _607;
  float _608;
  float _783;
  float _789;
  float _790;
  float _1015;
  float _1032;
  float _1033;
  float _1162;
  float _1230;
  float _1231;
  float _1232;
  float _1269;
  float _1270;
  float _1271;
  float _1285;
  float _1531;
  float _1532;
  float _1533;
  float _1653;
  float _1654;
  float _1655;
  float _1676;
  float _1677;
  float _1678;
  float _1711;
  float _1712;
  float _1713;
  float _1727;
  float _1728;
  float _1729;
  if (!(!(_78 >= 0.0010000000474974513f))) {
    float _83 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _86 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _88 = 1.0f - (TEXCOORD.y * 2.0f);
    float _89 = max(1.0000000116860974e-07f, _83.x);
    float _125 = mad((_invViewProj[3].z), _89, mad((_invViewProj[3].y), _88, ((_invViewProj[3].x) * _86))) + (_invViewProj[3].w);
    float _126 = (mad((_invViewProj[0].z), _89, mad((_invViewProj[0].y), _88, ((_invViewProj[0].x) * _86))) + (_invViewProj[0].w)) / _125;
    float _127 = (mad((_invViewProj[1].z), _89, mad((_invViewProj[1].y), _88, ((_invViewProj[1].x) * _86))) + (_invViewProj[1].w)) / _125;
    float _128 = (mad((_invViewProj[2].z), _89, mad((_invViewProj[2].y), _88, ((_invViewProj[2].x) * _86))) + (_invViewProj[2].w)) / _125;
    int _129 = WaveReadLaneFirst(_materialIndex);
    int _137 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._focusColor);
    float _140 = float((uint)((uint)(((uint)((uint)(_137)) >> 16) & 255)));
    float _143 = float((uint)((uint)(((uint)((uint)(_137)) >> 8) & 255)));
    float _145 = float((uint)((uint)(_137 & 255)));
    float _175 = max(0.0010000000474974513f, _exposure0.x);
    int _179 = WaveReadLaneFirst(_materialIndex);
    float _187 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._focusColorBrightness);
    float _188 = _187 * (select(((_140 * 0.003921568859368563f) < 0.040449999272823334f), (_140 * 0.0003035269910469651f), exp2(log2((_140 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    float _189 = _187 * (select(((_143 * 0.003921568859368563f) < 0.040449999272823334f), (_143 * 0.0003035269910469651f), exp2(log2((_143 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    float _190 = _187 * (select(((_145 * 0.003921568859368563f) < 0.040449999272823334f), (_145 * 0.0003035269910469651f), exp2(log2((_145 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    int _191 = WaveReadLaneFirst(_materialIndex);
    float _199 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_191 < (uint)170000), _191, 0)) + 0u))]._playerFocusRadius);
    int _200 = WaveReadLaneFirst(_materialIndex);
    float _208 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_200 < (uint)170000), _200, 0)) + 0u))]._targetFocusRadius);
    int _209 = WaveReadLaneFirst(_materialIndex);
    float _217 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_209 < (uint)170000), _209, 0)) + 0u))]._worldFocusRadius);
    int _218 = WaveReadLaneFirst(_materialIndex);
    float _226 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))]._focus3DBlend);
    if (!(!(_199 >= 0.0010000000474974513f))) {
      int _229 = WaveReadLaneFirst(_materialIndex);
      float _237 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_229 < (uint)170000), _229, 0)) + 0u))]._playerFocusCenterRadius);
      int _242 = WaveReadLaneFirst(_materialIndex);
      float _255 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))]._playerFocusPositionOffset.x) + _mainPosition.x;
      float _256 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))]._playerFocusPositionOffset.y) + _mainPosition.y;
      float _257 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))]._playerFocusPositionOffset.z) + _mainPosition.z;
      int _258 = WaveReadLaneFirst(_materialIndex);
      float _266 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))]._playerFocusPower);
      float _275 = _255 - _viewPos.x;
      float _276 = _256 - _viewPos.y;
      float _277 = _257 - _viewPos.z;
      float _278 = dot(float3(_275, _276, _277), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _279 = _126 - _255;
      float _280 = _127 - _256;
      float _281 = _128 - _257;
      float _291 = saturate((sqrt(((_280 * _280) + (_279 * _279)) + (_281 * _281)) - _237) / max(0.0010000000474974513f, _199));
      if (_226 < 1.0f) {
        float _321 = mad((_viewProjRelative[3].z), _277, mad((_viewProjRelative[3].y), _276, ((_viewProjRelative[3].x) * _275))) + (_viewProjRelative[3].w);
        float _322 = (mad((_viewProjRelative[0].z), _277, mad((_viewProjRelative[0].y), _276, ((_viewProjRelative[0].x) * _275))) + (_viewProjRelative[0].w)) / _321;
        float _326 = 0.5f - (((mad((_viewProjRelative[1].z), _277, mad((_viewProjRelative[1].y), _276, ((_viewProjRelative[1].x) * _275))) + (_viewProjRelative[1].w)) / _321) * 0.5f);
        float _336 = ((_view[0].x) * _199) + _275;
        float _337 = ((_view[0].y) * _199) + _276;
        float _338 = ((_view[0].z) * _199) + _277;
        float _350 = mad((_viewProjRelative[3].z), _338, mad((_viewProjRelative[3].y), _337, (_336 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _356 = (0.5f - (((mad((_viewProjRelative[1].z), _338, mad((_viewProjRelative[1].y), _337, (_336 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _350) * 0.5f)) - _326;
        float _357 = _27 * 0.5f;
        float _358 = _357 * (((mad((_viewProjRelative[0].z), _338, mad((_viewProjRelative[0].y), _337, (_336 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _350) - _322);
        float _366 = ((_view[0].x) * _237) + _275;
        float _367 = ((_view[0].y) * _237) + _276;
        float _368 = ((_view[0].z) * _237) + _277;
        float _380 = mad((_viewProjRelative[3].z), _368, mad((_viewProjRelative[3].y), _367, (_366 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _386 = (0.5f - (((mad((_viewProjRelative[1].z), _368, mad((_viewProjRelative[1].y), _367, (_366 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _380) * 0.5f)) - _326;
        float _387 = _357 * (((mad((_viewProjRelative[0].z), _368, mad((_viewProjRelative[0].y), _367, (_366 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _380) - _322);
        float _394 = TEXCOORD.y - _326;
        float _395 = ((TEXCOORD.x + -0.5f) - (_322 * 0.5f)) * _27;
        float _403 = saturate((sqrt((_394 * _394) + (_395 * _395)) - sqrt((_386 * _386) + (_387 * _387))) / max(0.0010000000474974513f, sqrt((_356 * _356) + (_358 * _358))));
        _408 = (lerp(_403, _291, _226));
        _409 = _237;
        _410 = _266;
        _411 = _255;
        _412 = _256;
        _413 = _257;
        _414 = _278;
      } else {
        _408 = _291;
        _409 = _237;
        _410 = _266;
        _411 = _255;
        _412 = _256;
        _413 = _257;
        _414 = _278;
      }
    } else {
      _408 = 1.0f;
      _409 = 0.0f;
      _410 = 1.0f;
      _411 = 0.0f;
      _412 = 0.0f;
      _413 = 0.0f;
      _414 = 1.0f;
    }
    if (!(!(_208 >= 0.0010000000474974513f))) {
      int _417 = WaveReadLaneFirst(_materialIndex);
      float _425 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_417 < (uint)170000), _417, 0)) + 0u))]._targetFocusCenterRadius);
      int _430 = WaveReadLaneFirst(_materialIndex);
      float _443 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x;
      float _444 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y;
      float _445 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z;
      int _446 = WaveReadLaneFirst(_materialIndex);
      float _463 = _443 - _viewPos.x;
      float _464 = _444 - _viewPos.y;
      float _465 = _445 - _viewPos.z;
      float _466 = dot(float3(_463, _464, _465), float3(_viewDir.x, _viewDir.y, _viewDir.z));
      float _467 = _126 - _443;
      float _468 = _127 - _444;
      float _469 = _128 - _445;
      float _479 = saturate((sqrt(((_468 * _468) + (_467 * _467)) + (_469 * _469)) - _425) / max(0.0010000000474974513f, _208));
      if (_226 < 1.0f) {
        float _509 = mad((_viewProjRelative[3].z), _465, mad((_viewProjRelative[3].y), _464, ((_viewProjRelative[3].x) * _463))) + (_viewProjRelative[3].w);
        float _510 = (mad((_viewProjRelative[0].z), _465, mad((_viewProjRelative[0].y), _464, ((_viewProjRelative[0].x) * _463))) + (_viewProjRelative[0].w)) / _509;
        float _514 = 0.5f - (((mad((_viewProjRelative[1].z), _465, mad((_viewProjRelative[1].y), _464, ((_viewProjRelative[1].x) * _463))) + (_viewProjRelative[1].w)) / _509) * 0.5f);
        float _524 = ((_view[0].x) * _208) + _463;
        float _525 = ((_view[0].y) * _208) + _464;
        float _526 = ((_view[0].z) * _208) + _465;
        float _538 = mad((_viewProjRelative[3].z), _526, mad((_viewProjRelative[3].y), _525, (_524 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _544 = (0.5f - (((mad((_viewProjRelative[1].z), _526, mad((_viewProjRelative[1].y), _525, (_524 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _538) * 0.5f)) - _514;
        float _545 = _27 * 0.5f;
        float _546 = _545 * (((mad((_viewProjRelative[0].z), _526, mad((_viewProjRelative[0].y), _525, (_524 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _538) - _510);
        float _554 = ((_view[0].x) * _425) + _463;
        float _555 = ((_view[0].y) * _425) + _464;
        float _556 = ((_view[0].z) * _425) + _465;
        float _568 = mad((_viewProjRelative[3].z), _556, mad((_viewProjRelative[3].y), _555, (_554 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _574 = (0.5f - (((mad((_viewProjRelative[1].z), _556, mad((_viewProjRelative[1].y), _555, (_554 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _568) * 0.5f)) - _514;
        float _575 = _545 * (((mad((_viewProjRelative[0].z), _556, mad((_viewProjRelative[0].y), _555, (_554 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _568) - _510);
        float _582 = TEXCOORD.y - _514;
        float _583 = ((TEXCOORD.x + -0.5f) - (_510 * 0.5f)) * _27;
        float _591 = saturate((sqrt((_582 * _582) + (_583 * _583)) - sqrt((_574 * _574) + (_575 * _575))) / max(0.0010000000474974513f, sqrt((_544 * _544) + (_546 * _546))));
        _596 = (lerp(_591, _479, _226));
      } else {
        _596 = _479;
      }
      _602 = ((saturate(_466) * (_596 + -1.0f)) + 1.0f);
      _603 = _425;
      _604 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_446 < (uint)170000), _446, 0)) + 0u))]._targetFocusPower);
      _605 = _443;
      _606 = _444;
      _607 = _445;
      _608 = _466;
    } else {
      _602 = 1.0f;
      _603 = 0.0f;
      _604 = 1.0f;
      _605 = 0.0f;
      _606 = 0.0f;
      _607 = 0.0f;
      _608 = 1.0f;
    }
    if (!(!(_217 >= 0.0010000000474974513f))) {
      int _611 = WaveReadLaneFirst(_materialIndex);
      float _619 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_611 < (uint)170000), _611, 0)) + 0u))]._worldFocusCenterRadius);
      int _620 = WaveReadLaneFirst(_materialIndex);
      float _630 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))]._worldFocusPosition.x);
      float _631 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))]._worldFocusPosition.y);
      float _632 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))]._worldFocusPosition.z);
      int _633 = WaveReadLaneFirst(_materialIndex);
      float _650 = _630 - _viewPos.x;
      float _651 = _631 - _viewPos.y;
      float _652 = _632 - _viewPos.z;
      float _654 = _126 - _630;
      float _655 = _127 - _631;
      float _656 = _128 - _632;
      float _666 = saturate((sqrt(((_655 * _655) + (_654 * _654)) + (_656 * _656)) - _619) / max(0.0010000000474974513f, _217));
      if (_226 < 1.0f) {
        float _696 = mad((_viewProjRelative[3].z), _652, mad((_viewProjRelative[3].y), _651, ((_viewProjRelative[3].x) * _650))) + (_viewProjRelative[3].w);
        float _697 = (mad((_viewProjRelative[0].z), _652, mad((_viewProjRelative[0].y), _651, ((_viewProjRelative[0].x) * _650))) + (_viewProjRelative[0].w)) / _696;
        float _701 = 0.5f - (((mad((_viewProjRelative[1].z), _652, mad((_viewProjRelative[1].y), _651, ((_viewProjRelative[1].x) * _650))) + (_viewProjRelative[1].w)) / _696) * 0.5f);
        float _711 = ((_view[0].x) * _217) + _650;
        float _712 = ((_view[0].y) * _217) + _651;
        float _713 = ((_view[0].z) * _217) + _652;
        float _725 = mad((_viewProjRelative[3].z), _713, mad((_viewProjRelative[3].y), _712, (_711 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _731 = (0.5f - (((mad((_viewProjRelative[1].z), _713, mad((_viewProjRelative[1].y), _712, (_711 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _725) * 0.5f)) - _701;
        float _732 = _27 * 0.5f;
        float _733 = _732 * (((mad((_viewProjRelative[0].z), _713, mad((_viewProjRelative[0].y), _712, (_711 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _725) - _697);
        float _741 = ((_view[0].x) * _619) + _650;
        float _742 = ((_view[0].y) * _619) + _651;
        float _743 = ((_view[0].z) * _619) + _652;
        float _755 = mad((_viewProjRelative[3].z), _743, mad((_viewProjRelative[3].y), _742, (_741 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _761 = (0.5f - (((mad((_viewProjRelative[1].z), _743, mad((_viewProjRelative[1].y), _742, (_741 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _755) * 0.5f)) - _701;
        float _762 = _732 * (((mad((_viewProjRelative[0].z), _743, mad((_viewProjRelative[0].y), _742, (_741 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _755) - _697);
        float _769 = TEXCOORD.y - _701;
        float _770 = ((TEXCOORD.x + -0.5f) - (_697 * 0.5f)) * _27;
        float _778 = saturate((sqrt((_769 * _769) + (_770 * _770)) - sqrt((_761 * _761) + (_762 * _762))) / max(0.0010000000474974513f, sqrt((_731 * _731) + (_733 * _733))));
        _783 = (lerp(_778, _666, _226));
      } else {
        _783 = _666;
      }
      _789 = ((saturate(dot(float3(_650, _651, _652), float3(_viewDir.x, _viewDir.y, _viewDir.z))) * (_783 + -1.0f)) + 1.0f);
      _790 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_633 < (uint)170000), _633, 0)) + 0u))]._worldFocusPower);
    } else {
      _789 = 1.0f;
      _790 = 1.0f;
    }
    int _791 = WaveReadLaneFirst(_materialIndex);
    float _799 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_791 < (uint)170000), _791, 0)) + 0u))]._connectPlayerTargetDistance);
    if (((_208 >= 0.0010000000474974513f)) && ((((_199 >= 0.0010000000474974513f)) && ((_799 >= 0.009999999776482582f))))) {
      int _806 = WaveReadLaneFirst(_materialIndex);
      float _815 = _409 + _199;
      float _816 = _603 + _208;
      float _817 = _605 - _411;
      float _818 = _606 - _412;
      float _819 = _607 - _413;
      float _820 = _126 - _411;
      float _821 = _127 - _412;
      float _822 = _128 - _413;
      float _826 = saturate(dot(float3(_817, _818, _819), float3(_820, _821, _822)) / dot(float3(_817, _818, _819), float3(_817, _818, _819)));
      float _833 = _820 - (_826 * _817);
      float _834 = _821 - (_826 * _818);
      float _835 = _822 - (_826 * _819);
      float _844 = saturate(sqrt(((_833 * _833) + (_834 * _834)) + (_835 * _835)) / max(0.0010000000474974513f, ((_826 * (_816 - _815)) + _815)));
      if (_226 < 1.0f) {
        float _851 = _411 - _viewPos.x;
        float _852 = _412 - _viewPos.y;
        float _853 = _413 - _viewPos.z;
        float _881 = mad((_viewProjRelative[3].z), _853, mad((_viewProjRelative[3].y), _852, ((_viewProjRelative[3].x) * _851))) + (_viewProjRelative[3].w);
        float _882 = (mad((_viewProjRelative[0].z), _853, mad((_viewProjRelative[0].y), _852, ((_viewProjRelative[0].x) * _851))) + (_viewProjRelative[0].w)) / _881;
        float _887 = 0.5f - (((mad((_viewProjRelative[1].z), _853, mad((_viewProjRelative[1].y), _852, ((_viewProjRelative[1].x) * _851))) + (_viewProjRelative[1].w)) / _881) * 0.5f);
        float _897 = ((_view[0].x) * _815) + _851;
        float _898 = ((_view[0].y) * _815) + _852;
        float _899 = ((_view[0].z) * _815) + _853;
        float _911 = mad((_viewProjRelative[3].z), _899, mad((_viewProjRelative[3].y), _898, (_897 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _917 = (0.5f - (((mad((_viewProjRelative[1].z), _899, mad((_viewProjRelative[1].y), _898, (_897 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _911) * 0.5f)) - _887;
        float _918 = _27 * 0.5f;
        float _919 = _918 * (((mad((_viewProjRelative[0].z), _899, mad((_viewProjRelative[0].y), _898, (_897 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _911) - _882);
        float _923 = sqrt((_917 * _917) + (_919 * _919));
        float _924 = _605 - _viewPos.x;
        float _925 = _606 - _viewPos.y;
        float _926 = _607 - _viewPos.z;
        float _938 = mad((_viewProjRelative[3].z), _926, mad((_viewProjRelative[3].y), _925, ((_viewProjRelative[3].x) * _924))) + (_viewProjRelative[3].w);
        float _939 = (mad((_viewProjRelative[0].z), _926, mad((_viewProjRelative[0].y), _925, ((_viewProjRelative[0].x) * _924))) + (_viewProjRelative[0].w)) / _938;
        float _942 = 0.5f - (((mad((_viewProjRelative[1].z), _926, mad((_viewProjRelative[1].y), _925, ((_viewProjRelative[1].x) * _924))) + (_viewProjRelative[1].w)) / _938) * 0.5f);
        float _946 = ((_view[0].x) * _816) + _924;
        float _947 = ((_view[0].y) * _816) + _925;
        float _948 = ((_view[0].z) * _816) + _926;
        float _960 = mad((_viewProjRelative[3].z), _948, mad((_viewProjRelative[3].y), _947, (_946 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
        float _966 = (0.5f - (((mad((_viewProjRelative[1].z), _948, mad((_viewProjRelative[1].y), _947, (_946 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _960) * 0.5f)) - _942;
        float _967 = _918 * (((mad((_viewProjRelative[0].z), _948, mad((_viewProjRelative[0].y), _947, (_946 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _960) - _939);
        float _987 = float((int)(((int)(uint)((int)(_608 > 0.0f))) - ((int)(uint)((int)(_608 < 0.0f))))) * float((int)(((int)(uint)((int)(_414 > 0.0f))) - ((int)(uint)((int)(_414 < 0.0f)))));
        float _988 = ((_939 - _882) * 0.5f) * _987;
        float _989 = (_942 - _887) * _987;
        float _990 = TEXCOORD.x - ((_882 * 0.5f) + 0.5f);
        float _991 = TEXCOORD.y - _887;
        float _995 = saturate(dot(float2(_990, _991), float2(_988, _989)) / dot(float2(_988, _989), float2(_988, _989)));
        float _1002 = _991 - (_995 * _989);
        float _1003 = (_990 - (_995 * _988)) * _27;
        float _1010 = saturate(sqrt((_1003 * _1003) + (_1002 * _1002)) / max(0.0010000000474974513f, ((_995 * (sqrt((_966 * _966) + (_967 * _967)) - _923)) + _923)));
        _1015 = (lerp(_1010, _844, _226));
      } else {
        _1015 = _844;
      }
      float _1016 = _411 - _605;
      float _1017 = _412 - _606;
      float _1018 = _413 - _607;
      float _1025 = _799 * 0.5f;
      _1032 = ((1.0f - saturate((sqrt(((_1017 * _1017) + (_1016 * _1016)) + (_1018 * _1018)) - _1025) / _1025)) * _1015);
      _1033 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_806 < (uint)170000), _806, 0)) + 0u))]._connectPlayerTargetPower);
    } else {
      _1032 = 1.0f;
      _1033 = 1.0f;
    }
    float4 _1036 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _1043 = (pow(_1036.x, 0.012683313339948654f));
    float _1044 = (pow(_1036.y, 0.012683313339948654f));
    int _1065 = WaveReadLaneFirst(_materialIndex);
    float4 _1086 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    float _1090 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    uint2 _1111 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    int _1113 = _1111.x & 127;
    bool _1117 = ((_1113 != 57)) && (((uint)(_1113 + -53) > (uint)14));
    int _1125 = WaveReadLaneFirst(_materialIndex);
    float _1136 = (WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1125 < (uint)170000), _1125, 0)) + 0u))]._maskRatio) * (saturate(((1.0f - saturate(exp2(log2(max(0.0f, (_1044 + -0.8359375f)) / (18.8515625f - (_1044 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) + exp2(log2(1.0f - saturate(exp2(log2(max(0.0f, (_1043 + -0.8359375f)) / (18.8515625f - (_1043 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1065 < (uint)170000), _1065, 0)) + 0u))]._maskBlurPower))) + float((bool)((uint)(((!((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _1090.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1086.x))))) == 0.0f))) && (_1117))))) + -1.0f)) + 1.0f;
    int _1137 = WaveReadLaneFirst(_materialIndex);
    if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1137 < (uint)170000), _1137, 0)) + 0u))]._focusCharacterMaterialMask) >= 0.0010000000474974513f))) {
      int _1149 = WaveReadLaneFirst(_materialIndex);
      _1162 = ((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1149 < (uint)170000), _1149, 0)) + 0u))]._focusCharacterMaterialMask) * (float((bool)(uint)(_1117)) - _1136)) + _1136);
    } else {
      _1162 = _1136;
    }
    float _1175 = _1162 * _1162;
    int _1181 = WaveReadLaneFirst(_materialIndex);
    int _1194 = WaveReadLaneFirst(_materialIndex);
    float _1204 = min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1194 < (uint)170000), _1194, 0)) + 0u))]._focusColorRemap), -1.0f), 1.0f);
    if (!(_1204 == 0.0f)) {
      if (((!(_190 == 0.0f))) || ((((!(_188 == 0.0f))) || ((!(_189 == 0.0f)))))) {
        float _1216 = dot(float3(_67, _68, _69), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_188, _189, _190), float3(_188, _189, _190)));
        _1230 = ((((_1216 * _188) - _67) * _1204) + _67);
        _1231 = ((((_1216 * _189) - _68) * _1204) + _68);
        _1232 = ((((_1216 * _190) - _69) * _1204) + _69);
      } else {
        _1230 = _67;
        _1231 = _68;
        _1232 = _69;
      }
    } else {
      _1230 = _67;
      _1231 = _68;
      _1232 = _69;
    }
    int _1233 = WaveReadLaneFirst(_materialIndex);
    float _1245 = (((((_1175 * _1175) * (pow(_408, _410))) * (pow(_602, _604))) * (pow(_1032, _1033))) * (pow(_789, _790))) * exp2(log2(1.0f - _83.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1181 < (uint)170000), _1181, 0)) + 0u))]._focusSceneDepthFade));
    float _1247 = (_1245 * 0.5f) * (1.0f - min(max(WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1233 < (uint)170000), _1233, 0)) + 0u))]._focusBackgroundSaturation), -1.0f), 1.0f));
    float _1248 = dot(float3(_1230, _1231, _1232), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _1255 = (_1247 * (_1248 - _1230)) + _1230;
    float _1256 = (_1247 * (_1248 - _1231)) + _1231;
    float _1257 = (_1247 * (_1248 - _1232)) + _1232;
    float _1258 = _1245 * _78;
    _1269 = (lerp(_1255, _188, _1258));
    _1270 = (lerp(_1256, _189, _1258));
    _1271 = (lerp(_1257, _190, _1258));
  } else {
    _1269 = _67;
    _1270 = _68;
    _1271 = _69;
  }
  uint _1272 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1279 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1272), 0));
    _1285 = (float((uint)((uint)(_1279.x & 127))) + 0.5f);
  } else {
    _1285 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1269, _1270, _1271));
    _1653 = output_color.x;
    _1654 = output_color.y;
    _1655 = output_color.z;
  } else {
    _1653 = _1269;
    _1654 = _1270;
    _1655 = _1271;
  }
  if (_etcParams.y > 1.0f) {
    float _1666 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1667 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1671 = saturate(1.0f - (dot(float2(_1666, _1667), float2(_1666, _1667)) * saturate(_etcParams.y + -1.0f)));
    _1676 = (_1671 * _1653);
    _1677 = (_1671 * _1654);
    _1678 = (_1671 * _1655);
  } else {
    _1676 = _1653;
    _1677 = _1654;
    _1678 = _1655;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1711 = select((_1676 <= 0.0031308000907301903f), (_1676 * 12.920000076293945f), (((pow(_1676, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1712 = select((_1677 <= 0.0031308000907301903f), (_1677 * 12.920000076293945f), (((pow(_1677, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1713 = select((_1678 <= 0.0031308000907301903f), (_1678 * 12.920000076293945f), (((pow(_1678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1711 = _1676;
    _1712 = _1677;
    _1713 = _1678;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1718 = float((uint)_1272);
    if (!(_1718 < _viewDir.w)) {
      if (!(_1718 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1727 = _1711;
        _1728 = _1712;
        _1729 = _1713;
      } else {
        _1727 = 0.0f;
        _1728 = 0.0f;
        _1729 = 0.0f;
      }
    } else {
      _1727 = 0.0f;
      _1728 = 0.0f;
      _1729 = 0.0f;
    }
  } else {
    _1727 = _1711;
    _1728 = _1712;
    _1729 = _1713;
  }
  float _1739 = exp2(log2(_1727 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1740 = exp2(log2(_1728 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1741 = exp2(log2(_1729 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1739 * 18.6875f) + 1.0f)) * ((_1739 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1740 * 18.6875f) + 1.0f)) * ((_1740 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1741 * 18.6875f) + 1.0f)) * ((_1741 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1285;
  return SV_Target;
}

