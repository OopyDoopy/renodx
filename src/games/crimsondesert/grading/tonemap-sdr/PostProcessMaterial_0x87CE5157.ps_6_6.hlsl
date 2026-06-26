struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessAbyssCommon_CDStruct> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _26 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _29 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _30 = TEXCOORD.y * 2.0f;
  float _31 = 1.0f - _30;
  float _32 = max(1.0000000116860974e-07f, _26.x);
  float _68 = mad((_invViewProjRelative[3].z), _32, mad((_invViewProjRelative[3].y), _31, ((_invViewProjRelative[3].x) * _29))) + (_invViewProjRelative[3].w);
  int _72 = WaveReadLaneFirst(_materialIndex);
  float _87 = -0.0f - ((mad((_invViewProjRelative[0].z), _32, mad((_invViewProjRelative[0].y), _31, ((_invViewProjRelative[0].x) * _29))) + (_invViewProjRelative[0].w)) / _68);
  float _88 = -0.0f - ((mad((_invViewProjRelative[1].z), _32, mad((_invViewProjRelative[1].y), _31, ((_invViewProjRelative[1].x) * _29))) + (_invViewProjRelative[1].w)) / _68);
  float _89 = -0.0f - ((mad((_invViewProjRelative[2].z), _32, mad((_invViewProjRelative[2].y), _31, ((_invViewProjRelative[2].x) * _29))) + (_invViewProjRelative[2].w)) / _68);
  float _91 = rsqrt(dot(float3(_87, _88, _89), float3(_87, _88, _89)));
  float _92 = _91 * _87;
  float _93 = _91 * _88;
  float _94 = _91 * _89;
  int _95 = WaveReadLaneFirst(_materialIndex);
  int _103 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_95 < (uint)170000), _95, 0)) + 0u))]._noiseTex);
  float4 _110 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_103 < (uint)65000), _103, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_94, _92));
  int _117 = WaveReadLaneFirst(_materialIndex);
  int _125 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_117 < (uint)170000), _117, 0)) + 0u))]._noiseTex);
  float4 _132 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_125 < (uint)65000), _125, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_94, ((_time.x * 0.05000000074505806f) + _93)));
  int _141 = WaveReadLaneFirst(_materialIndex);
  int _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_141 < (uint)170000), _141, 0)) + 0u))]._noiseTex);
  float4 _156 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_149 < (uint)65000), _149, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_94 * 2.0f), ((_93 - (_time.x * 0.10000000149011612f)) * 2.0f)));
  float _159 = _156.x + _132.x;
  float _160 = _156.y + _132.y;
  int _165 = WaveReadLaneFirst(_materialIndex);
  int _173 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_165 < (uint)170000), _165, 0)) + 0u))]._noiseTex);
  float4 _180 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_173 < (uint)65000), _173, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.12999999523162842f) + _93), _92));
  int _189 = WaveReadLaneFirst(_materialIndex);
  int _197 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._noiseTex);
  float4 _204 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_197 < (uint)65000), _197, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * 0.10000000149011612f) + _93) * 2.0f), (_92 * 2.0f)));
  float _210 = abs(dot(float3(_92, _93, _94), float3(0.0f, 1.0f, 0.0f)));
  float _212 = abs(dot(float3(_92, _93, _94), float3(0.0f, 0.0f, 1.0f)));
  float _217 = (_210 * (_110.x - _159)) + _159;
  float _218 = (_210 * (_110.y - _160)) + _160;
  float _223 = (((_204.x + _180.x) - _217) * _212) + _217;
  float _224 = (((_204.y + _180.y) - _218) * _212) + _218;
  float _226 = saturate(_26.x * 35.0f);
  int _233 = WaveReadLaneFirst(_materialIndex);
  int _241 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_233 < (uint)170000), _233, 0)) + 0u))]._noiseTex);
  float4 _248 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_241 < (uint)65000), _241, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (_time.x * 0.009999999776482582f)), ((_time.x * 0.10000000149011612f) + TEXCOORD.y)));
  float _257 = TEXCOORD.x + -0.5f;
  float _258 = TEXCOORD.y + -0.5f;
  int _266 = WaveReadLaneFirst(_materialIndex);
  float _277 = ((sqrt((_258 * _258) + (_257 * _257)) * 0.009999999776482582f) * float((uint)(uint)(_enableChromaticAberration))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_266 < (uint)170000), _266, 0)) + 0u))]._chromaticShiftValue);
  float _279 = rsqrt(dot(float2(_257, _258), float2(_257, _258)));
  float _280 = _279 * _257;
  float _281 = _279 * _258;
  float _285 = ((lerp(_223, _248.x, _226)) * 4.0f) + -1.9921568632125854f;
  float _287 = ((lerp(_224, _248.y, _226)) * 4.0f) + -1.9921568632125854f;
  float4 _302 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((TEXCOORD.x - (_277 * _285)) - (_280 * _277)), ((TEXCOORD.y - (_277 * _287)) - (_281 * _277))));
  float4 _304 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _306 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((((_280 + _285) * _277) + TEXCOORD.x), (((_281 + _287) * _277) + TEXCOORD.y)));
  float _311 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  float _312 = _311 * (1.0f - saturate(exp2(log2(_26.x) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._fogDepth)) * 4.0f));
  float _313 = _312 * 0.08000000566244125f;
  float _314 = _312 * 0.08999999612569809f;
  float _315 = _312 * 0.11000000685453415f;
  float _328 = ((saturate(_313) * 0.05999999865889549f) * (_302.x - _313)) + _313;
  float _329 = ((saturate(_314) * 0.05999999865889549f) * (_304.y - _314)) + _314;
  float _330 = (((_306.z - _315) * 0.05999999865889549f) * saturate(_315)) + _315;
  uint _331 = uint(SV_Position.y);
  float _345;
  float _548;
  float _549;
  float _550;
  float _643;
  float _644;
  float _645;
  float _699;
  float _700;
  float _701;
  float _717;
  float _718;
  float _719;
  float _749;
  float _750;
  float _751;
  float _765;
  float _766;
  float _767;
  if (_etcParams.y == 1.0f) {
    uint2 _339 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_331), 0));
    _345 = (float((uint)((uint)(_339.x & 127))) + 0.5f);
  } else {
    _345 = _311;
  }
  bool _348 = (_localToneMappingParams.w > 0.0f);
  if (_348) {
    float3 output_color = TonemapReplacer(float3(_328, _329, _330));
    _699 = output_color.x;
    _700 = output_color.y;
    _701 = output_color.z;
  } else {
    _699 = _328;
    _700 = _329;
    _701 = _330;
  }
  if (_etcParams.y > 1.0f) {
    float _707 = abs(_29);
    float _708 = abs(_30 + -1.0f);
    float _712 = saturate(1.0f - (dot(float2(_707, _708), float2(_707, _708)) * saturate(_etcParams.y + -1.0f)));
    _717 = (_712 * _699);
    _718 = (_712 * _700);
    _719 = (_712 * _701);
  } else {
    _717 = _699;
    _718 = _700;
    _719 = _701;
  }
  if ((_348) && ((_etcParams.z > 0.0f))) {
    _749 = select((_717 <= 0.0031308000907301903f), (_717 * 12.920000076293945f), (((pow(_717, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _750 = select((_718 <= 0.0031308000907301903f), (_718 * 12.920000076293945f), (((pow(_718, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _751 = select((_719 <= 0.0031308000907301903f), (_719 * 12.920000076293945f), (((pow(_719, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _749 = _717;
    _750 = _718;
    _751 = _719;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _756 = float((uint)_331);
    if (!(_756 < _viewDir.w)) {
      if (!(_756 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _765 = _749;
        _766 = _750;
        _767 = _751;
      } else {
        _765 = 0.0f;
        _766 = 0.0f;
        _767 = 0.0f;
      }
    } else {
      _765 = 0.0f;
      _766 = 0.0f;
      _767 = 0.0f;
    }
  } else {
    _765 = _749;
    _766 = _750;
    _767 = _751;
  }
  SV_Target.x = _765;
  SV_Target.y = _766;
  SV_Target.z = _767;
  SV_Target.w = _345;
  return SV_Target;
}