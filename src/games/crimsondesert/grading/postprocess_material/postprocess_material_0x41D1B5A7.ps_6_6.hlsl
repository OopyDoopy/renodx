#include "../tonemap.hlsli"

struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessAbyssCommon_CDStruct> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _20[36];
  float _25 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _28 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _29 = TEXCOORD.y * 2.0f;
  float _30 = 1.0f - _29;
  float _31 = max(1.0000000116860974e-07f, _25.x);
  float _67 = mad((_invViewProjRelative[3].z), _31, mad((_invViewProjRelative[3].y), _30, ((_invViewProjRelative[3].x) * _28))) + (_invViewProjRelative[3].w);
  int _71 = WaveReadLaneFirst(_materialIndex);
  float _86 = -0.0f - ((mad((_invViewProjRelative[0].z), _31, mad((_invViewProjRelative[0].y), _30, ((_invViewProjRelative[0].x) * _28))) + (_invViewProjRelative[0].w)) / _67);
  float _87 = -0.0f - ((mad((_invViewProjRelative[1].z), _31, mad((_invViewProjRelative[1].y), _30, ((_invViewProjRelative[1].x) * _28))) + (_invViewProjRelative[1].w)) / _67);
  float _88 = -0.0f - ((mad((_invViewProjRelative[2].z), _31, mad((_invViewProjRelative[2].y), _30, ((_invViewProjRelative[2].x) * _28))) + (_invViewProjRelative[2].w)) / _67);
  float _90 = rsqrt(dot(float3(_86, _87, _88), float3(_86, _87, _88)));
  float _91 = _90 * _86;
  float _92 = _90 * _87;
  float _93 = _90 * _88;
  int _94 = WaveReadLaneFirst(_materialIndex);
  int _102 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))]._noiseTex);
  float4 _109 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_102 < (uint)65000), _102, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_93, _91));
  int _116 = WaveReadLaneFirst(_materialIndex);
  int _124 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))]._noiseTex);
  float4 _131 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_124 < (uint)65000), _124, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_93, ((_time.x * 0.05000000074505806f) + _92)));
  int _140 = WaveReadLaneFirst(_materialIndex);
  int _148 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_140 < (uint)170000), _140, 0)) + 0u))]._noiseTex);
  float4 _155 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_148 < (uint)65000), _148, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_93 * 2.0f), ((_92 - (_time.x * 0.10000000149011612f)) * 2.0f)));
  float _158 = _155.x + _131.x;
  float _159 = _155.y + _131.y;
  int _164 = WaveReadLaneFirst(_materialIndex);
  int _172 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))]._noiseTex);
  float4 _179 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_172 < (uint)65000), _172, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.12999999523162842f) + _92), _91));
  int _188 = WaveReadLaneFirst(_materialIndex);
  int _196 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_188 < (uint)170000), _188, 0)) + 0u))]._noiseTex);
  float4 _203 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_196 < (uint)65000), _196, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * 0.10000000149011612f) + _92) * 2.0f), (_91 * 2.0f)));
  float _209 = abs(dot(float3(_91, _92, _93), float3(0.0f, 1.0f, 0.0f)));
  float _211 = abs(dot(float3(_91, _92, _93), float3(0.0f, 0.0f, 1.0f)));
  float _216 = (_209 * (_109.x - _158)) + _158;
  float _217 = (_209 * (_109.y - _159)) + _159;
  float _222 = (((_203.x + _179.x) - _216) * _211) + _216;
  float _223 = (((_203.y + _179.y) - _217) * _211) + _217;
  float _225 = saturate(_25.x * 35.0f);
  int _232 = WaveReadLaneFirst(_materialIndex);
  int _240 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._noiseTex);
  float4 _247 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_240 < (uint)65000), _240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (_time.x * 0.009999999776482582f)), ((_time.x * 0.10000000149011612f) + TEXCOORD.y)));
  float _256 = TEXCOORD.x + -0.5f;
  float _257 = TEXCOORD.y + -0.5f;
  int _265 = WaveReadLaneFirst(_materialIndex);
  float _276 = ((sqrt((_257 * _257) + (_256 * _256)) * 0.009999999776482582f) * float((uint)(uint)(_enableChromaticAberration))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_265 < (uint)170000), _265, 0)) + 0u))]._chromaticShiftValue);
  float _278 = rsqrt(dot(float2(_256, _257), float2(_256, _257)));
  float _279 = _278 * _256;
  float _280 = _278 * _257;
  float _284 = ((lerp(_222, _247.x, _225)) * 4.0f) + -1.9921568632125854f;
  float _286 = ((lerp(_223, _247.y, _225)) * 4.0f) + -1.9921568632125854f;
  float4 _301 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((TEXCOORD.x - (_276 * _284)) - (_279 * _276)), ((TEXCOORD.y - (_276 * _286)) - (_280 * _276))));
  float _305 = (pow(_301.x, 0.012683313339948654f));
  float4 _315 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _319 = (pow(_315.y, 0.012683313339948654f));
  float4 _329 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((((_279 + _284) * _276) + TEXCOORD.x), (((_280 + _286) * _276) + TEXCOORD.y)));
  float _333 = (pow(_329.z, 0.012683313339948654f));
  float _346 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  float _347 = _346 * (1.0f - saturate(exp2(log2(_25.x) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._fogDepth)) * 4.0f));
  float _348 = _347 * 0.08000000566244125f;
  float _349 = _347 * 0.08999999612569809f;
  float _350 = _347 * 0.11000000685453415f;
  float _363 = ((saturate(_348) * 0.05999999865889549f) * ((exp2(log2(max(0.0f, (_305 + -0.8359375f)) / (18.8515625f - (_305 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _348)) + _348;
  float _364 = ((saturate(_349) * 0.05999999865889549f) * ((exp2(log2(max(0.0f, (_319 + -0.8359375f)) / (18.8515625f - (_319 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _349)) + _349;
  float _365 = ((((exp2(log2(max(0.0f, (_333 + -0.8359375f)) / (18.8515625f - (_333 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _350) * 0.05999999865889549f) * saturate(_350)) + _350;
  uint _366 = uint(SV_Position.y);
  float _380;
  float _624;
  float _625;
  float _626;
  float _746;
  float _747;
  float _748;
  float _766;
  float _767;
  float _768;
  float _801;
  float _802;
  float _803;
  float _817;
  float _818;
  float _819;
  if (_etcParams.y == 1.0f) {
    uint2 _374 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_366), 0));
    _380 = (float((uint)((uint)(_374.x & 127))) + 0.5f);
  } else {
    _380 = _346;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_363, _364, _365));
    _746 = output_color.x;
    _747 = output_color.y;
    _748 = output_color.z;
  } else {
    _746 = _363;
    _747 = _364;
    _748 = _365;
  }
  if (_etcParams.y > 1.0f) {
    float _756 = abs(_28);
    float _757 = abs(_29 + -1.0f);
    float _761 = saturate(1.0f - (dot(float2(_756, _757), float2(_756, _757)) * saturate(_etcParams.y + -1.0f)));
    _766 = (_761 * _746);
    _767 = (_761 * _747);
    _768 = (_761 * _748);
  } else {
    _766 = _746;
    _767 = _747;
    _768 = _748;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _801 = select((_766 <= 0.0031308000907301903f), (_766 * 12.920000076293945f), (((pow(_766, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _802 = select((_767 <= 0.0031308000907301903f), (_767 * 12.920000076293945f), (((pow(_767, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _803 = select((_768 <= 0.0031308000907301903f), (_768 * 12.920000076293945f), (((pow(_768, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _801 = _766;
    _802 = _767;
    _803 = _768;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _808 = float((uint)_366);
    if (!(_808 < _viewDir.w)) {
      if (!(_808 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _817 = _801;
        _818 = _802;
        _819 = _803;
      } else {
        _817 = 0.0f;
        _818 = 0.0f;
        _819 = 0.0f;
      }
    } else {
      _817 = 0.0f;
      _818 = 0.0f;
      _819 = 0.0f;
    }
  } else {
    _817 = _801;
    _818 = _802;
    _819 = _803;
  }
  float _829 = exp2(log2(_817 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _830 = exp2(log2(_818 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _831 = exp2(log2(_819 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_829 * 18.6875f) + 1.0f)) * ((_829 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_830 * 18.6875f) + 1.0f)) * ((_830 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_831 * 18.6875f) + 1.0f)) * ((_831 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _380;
  return SV_Target;
}

