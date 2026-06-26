struct PostProcessScopeStruct {
  float _progress;
  float _lensRadius;
  float _lensDistance;
  float _lensYOffset;
  float _edgeSmoothness;
  float _distortionIntensity;
  float _chromaticRatio;
  float _opacity;
  uint _lensDirtTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

ConstantBuffer<PostProcessScopeStruct> BindlessParameters_PostProcessScope[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _28 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _38 = max(WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._lensRadius), 9.999999747378752e-05f);
  int _39 = WaveReadLaneFirst(_materialIndex);
  float _48 = max(WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))]._edgeSmoothness), 9.999999747378752e-05f);
  int _49 = WaveReadLaneFirst(_materialIndex);
  float _57 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_49 < (uint)170000), _49, 0)) + 0u))]._lensDistance);
  int _61 = WaveReadLaneFirst(_materialIndex);
  int _70 = WaveReadLaneFirst(_materialIndex);
  int _79 = WaveReadLaneFirst(_materialIndex);
  float _87 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))]._opacity);
  float _90 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _91 = (TEXCOORD.y * 2.0f) + -1.0f;
  float _92 = _28 * _90;
  int _94 = WaveReadLaneFirst(_materialIndex);
  float _103 = _57 * -0.5f;
  float _104 = _57 * 0.5f;
  float _105 = _48 * _38;
  float _106 = _105 - _38;
  float _107 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))]._lensYOffset) + _91;
  float _108 = _107 * _107;
  float _155;
  float _156;
  float _455;
  float _658;
  float _659;
  float _660;
  float _753;
  float _754;
  float _755;
  float _809;
  float _810;
  float _811;
  float _826;
  float _827;
  float _828;
  float _858;
  float _859;
  float _860;
  float _874;
  float _875;
  float _876;
  if (_57 > 0.10000000149011612f) {
    float _110 = _92 - _103;
    float _111 = _92 - _104;
    float _114 = sqrt(_108 + (_110 * _110));
    float _118 = sqrt(_108 + (_111 * _111));
    float _122 = _38 * 0.6000000238418579f;
    float _127 = saturate((((_118 - _114) * 0.5f) / _122) + 0.5f);
    float _137 = saturate((((_118 + _106) + (_127 * (_114 - _118))) - ((_127 * _122) * (1.0f - _127))) / _105);
    _155 = ((_137 * _137) * (3.0f - (_137 * 2.0f)));
    _156 = select(((_114 / _38) < (_118 / _38)), _103, _104);
  } else {
    float _149 = saturate((sqrt((_92 * _92) + (_91 * _91)) + _106) / _105);
    _155 = ((_149 * _149) * (3.0f - (_149 * 2.0f)));
    _156 = 0.0f;
  }
  float _158 = _92 - _156;
  float _161 = sqrt((_158 * _158) + _108);
  float _162 = _161 / _38;
  bool _163 = (_161 > 9.999999747378752e-06f);
  float _167 = select(_163, (_107 / _161), 1.0f);
  float _173 = saturate(abs(TEXCOORD.x + -0.5f) / (saturate(_57) * 0.07999999821186066f));
  float _177 = (_173 * _173) * (3.0f - (_173 * 2.0f));
  float _178 = 1.0f - _48;
  float _181 = saturate((_162 - _178) / _48);
  float _185 = (_181 * _181) * (3.0f - (_181 * 2.0f));
  float _186 = select(_163, (_158 / _161), 0.0f) / _28;
  float _188 = (_177 * WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_70 < (uint)170000), _70, 0)) + 0u))]._distortionIntensity)) * _185;
  float _191 = (_188 * _186) + TEXCOORD.x;
  float _192 = (_188 * _167) + TEXCOORD.y;
  float _193 = _186 * _177;
  float _197 = sqrt((_193 * _193) + (_167 * _167));
  bool _198 = (_197 > 9.999999747378752e-06f);
  float _205 = ((float((uint)(uint)(_enableChromaticAberration)) * 0.014999999664723873f) * WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))]._chromaticRatio)) * _185;
  float _206 = select(_198, (_193 / _197), 0.0f) * _205;
  float _207 = select(_198, (_167 / _197), 1.0f) * _205;
  float4 _214 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_191 - _206), (_192 - _207)));
  float _218 = (pow(_214.x, 0.012683313339948654f));
  float4 _227 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_191, _192));
  float _231 = (pow(_227.y, 0.012683313339948654f));
  float4 _240 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_206 + _191), (_207 + _192)));
  float _244 = (pow(_240.z, 0.012683313339948654f));
  float _257 = saturate((_sunDirection.y + 0.10000000149011612f) * 5.0f);
  float _263 = rsqrt(dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)));
  float _272 = rsqrt(dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)));
  float _273 = _272 * _moonDirection.x;
  float _274 = _272 * _moonDirection.y;
  float _275 = _272 * _moonDirection.z;
  float _277 = (3.0f - (_257 * 2.0f)) * (_257 * _257);
  float _284 = (((_263 * _sunDirection.x) - _273) * _277) + _273;
  float _285 = (((_263 * _sunDirection.y) - _274) * _277) + _274;
  float _286 = (((_263 * _sunDirection.z) - _275) * _277) + _275;
  float _288 = rsqrt(dot(float3(_284, _285, _286), float3(_284, _285, _286)));
  float _294 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _330 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _294, ((_invViewProjRelative[3].x) * _90));
  float _331 = ((mad((_invViewProjRelative[0].y), _294, ((_invViewProjRelative[0].x) * _90)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _330;
  float _332 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _294, ((_invViewProjRelative[1].x) * _90))) / _330;
  float _333 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _294, ((_invViewProjRelative[2].x) * _90))) / _330;
  float _335 = rsqrt(dot(float3(_331, _332, _333), float3(_331, _332, _333)));
  float _342 = saturate((dot(float3((_335 * _331), (_335 * _332), (_335 * _333)), float3((_284 * _288), (_285 * _288), (_286 * _288))) + -0.5f) * 2.0f);
  float _351 = max(0.5f, _178);
  float _355 = saturate(((_162 + -0.4000000059604645f) - _351) * 4.999999523162842f);
  float _363 = saturate((0.5f - _155) * -2.0f);
  float _372 = (_351 + 0.4000000059604645f) * 2.0f;
  float _376 = saturate((_162 - _372) / (((_351 + 0.6000000238418579f) * 0.009999999776482582f) - _372));
  float _380 = (_376 * _376) * (3.0f - (_376 * 2.0f));
  float _382 = (_380 * _380) * max((((_355 * _355) * _177) * (3.0f - (_355 * 2.0f))), ((_363 * _363) * (3.0f - (_363 * 2.0f))));
  float _388 = (((_277 * 1.3999998569488525f) + 5.599999904632568f) * saturate(exp2(log2((_342 * _342) * (3.0f - (_342 * 2.0f))) * 3.0f))) * saturate(1.399999976158142f - _155);
  float _389 = _382 * _388;
  int _395 = WaveReadLaneFirst(_materialIndex);
  int _403 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._lensDirtTexture);
  float4 _410 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_403 < (uint)65000), _403, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 1.2000000476837158f) * _28), (TEXCOORD.y * 1.2000000476837158f)));
  float _414 = dot(float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f), float3(_410.x, _410.y, _410.z));
  float _428 = (1.0f / max(0.0010000000474974513f, _exposure0.x)) * (_382 * (_388 + 3.0f));
  float _432 = (1.0f - _155) * 10000.0f;
  float _439 = ((_428 * (lerp(_414, _410.x, _389))) + (exp2(log2(max(0.0f, (_218 + -0.8359375f)) / (18.8515625f - (_218 * 18.6875f))) * 6.277394771575928f) * _432)) * _87;
  float _440 = ((_428 * (lerp(_414, _410.y, _389))) + (exp2(log2(max(0.0f, (_231 + -0.8359375f)) / (18.8515625f - (_231 * 18.6875f))) * 6.277394771575928f) * _432)) * _87;
  float _441 = ((_428 * (lerp(_414, _410.z, _389))) + (exp2(log2(max(0.0f, (_244 + -0.8359375f)) / (18.8515625f - (_244 * 18.6875f))) * 6.277394771575928f) * _432)) * _87;
  uint _442 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _449 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_442), 0));
    _455 = (float((uint)((uint)(_449.x & 127))) + 0.5f);
  } else {
    _455 = 1.0f;
  }
  bool _458 = (_localToneMappingParams.w > 0.0f);
  if (_458) {
    float3 output_color = TonemapReplacer(float3(_439, _440, _441));
    _809 = output_color.x;
    _810 = output_color.y;
    _811 = output_color.z;
  } else {
    _809 = _439;
    _810 = _440;
    _811 = _441;
  }
  if (_etcParams.y > 1.0f) {
    float _816 = abs(_90);
    float _817 = abs(_91);
    float _821 = saturate(1.0f - (dot(float2(_816, _817), float2(_816, _817)) * saturate(_etcParams.y + -1.0f)));
    _826 = (_821 * _809);
    _827 = (_821 * _810);
    _828 = (_821 * _811);
  } else {
    _826 = _809;
    _827 = _810;
    _828 = _811;
  }
  if ((_458) && ((_etcParams.z > 0.0f))) {
    _858 = select((_826 <= 0.0031308000907301903f), (_826 * 12.920000076293945f), (((pow(_826, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _859 = select((_827 <= 0.0031308000907301903f), (_827 * 12.920000076293945f), (((pow(_827, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _860 = select((_828 <= 0.0031308000907301903f), (_828 * 12.920000076293945f), (((pow(_828, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _858 = _826;
    _859 = _827;
    _860 = _828;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _865 = float((uint)_442);
    if (!(_865 < _viewDir.w)) {
      if (!(_865 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _874 = _858;
        _875 = _859;
        _876 = _860;
      } else {
        _874 = 0.0f;
        _875 = 0.0f;
        _876 = 0.0f;
      }
    } else {
      _874 = 0.0f;
      _875 = 0.0f;
      _876 = 0.0f;
    }
  } else {
    _874 = _858;
    _875 = _859;
    _876 = _860;
  }
  float _886 = exp2(log2(_874 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _887 = exp2(log2(_875 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _888 = exp2(log2(_876 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_886 * 18.6875f) + 1.0f)) * ((_886 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_887 * 18.6875f) + 1.0f)) * ((_887 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_888 * 18.6875f) + 1.0f)) * ((_888 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _455;
  return SV_Target;
}