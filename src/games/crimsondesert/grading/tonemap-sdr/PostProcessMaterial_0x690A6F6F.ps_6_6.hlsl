struct PostProcessWorldLoadingStruct {
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float _ringRatio;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _depthOuterMaskRadius;
  uint _invertDepthMask;
  float _depthIntensity;
  float _depthContrast;
  float _voronoiDotDensity;
  float _voronoiMovementSpeed;
  float _voronoiOffset;
  float3 _voronoiScrollSpeed;
  float _voronoiDotThreshold;
  float _voronoiDotRatio;
  float _rippleIntensity;
  float _rippleWidth;
  float _rippleCount;
  float _rippleContrast;
  float _rippleSpeed;
  float3 _ripplePosOffset;
  uint _noiseTex;
  float _bigRippleIntensity;
  float _bigRippleWidth;
  float _bigRipplePhaseOffset;
  float _bigRippleSpeed;
  float _bigRippleDistortionIntensity;
  float _bigRippleContrast;
  float _starburstIntensity;
  float _vignetteIntensity;
  uint _excludePlayer;
  float _ppWorldLoadingRatio;
};


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

ConstantBuffer<PostProcessWorldLoadingStruct> BindlessParameters_PostProcessWorldLoading[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _32 = (pow(_25.y, 0.012683313339948654f));
  float _33 = (pow(_25.z, 0.012683313339948654f));
  float _53 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _56 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _57 = TEXCOORD.y * 2.0f;
  float _58 = 1.0f - _57;
  float _59 = max(1.0000000116860974e-07f, _53.x);
  float _95 = mad((_invViewProj[3].z), _59, mad((_invViewProj[3].y), _58, ((_invViewProj[3].x) * _56))) + (_invViewProj[3].w);
  float _96 = (mad((_invViewProj[0].z), _59, mad((_invViewProj[0].y), _58, ((_invViewProj[0].x) * _56))) + (_invViewProj[0].w)) / _95;
  float _97 = (mad((_invViewProj[1].z), _59, mad((_invViewProj[1].y), _58, ((_invViewProj[1].x) * _56))) + (_invViewProj[1].w)) / _95;
  float _98 = (mad((_invViewProj[2].z), _59, mad((_invViewProj[2].y), _58, ((_invViewProj[2].x) * _56))) + (_invViewProj[2].w)) / _95;
  int _99 = WaveReadLaneFirst(_materialIndex);
  float _107 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))]._squareSize);
  float _108 = _107 * _96;
  float _109 = _107 * _97;
  float _110 = _107 * _98;
  float _111 = floor(_108);
  float _112 = floor(_109);
  float _113 = floor(_110);
  float _115;
  float _116;
  float _117;
  float _118;
  int _119;
  float _124;
  float _125;
  float _126;
  float _127;
  int _128;
  float _133;
  float _134;
  float _135;
  float _136;
  int _137;
  float _302;
  float _507;
  float _508;
  float _509;
  float _602;
  float _603;
  float _604;
  float _658;
  float _659;
  float _660;
  float _676;
  float _677;
  float _678;
  float _708;
  float _709;
  float _710;
  float _724;
  float _725;
  float _726;
  _115 = 10.0f;
  _116 = 0.0f;
  _117 = 0.0f;
  _118 = 0.0f;
  _119 = -1;
  while(true) {
    _124 = _115;
    _125 = _116;
    _126 = _117;
    _127 = _118;
    _128 = -1;
    while(true) {
      _133 = _124;
      _134 = _125;
      _135 = _126;
      _136 = _127;
      _137 = -1;
      while(true) {
        float _138 = float((int)(_137));
        float _139 = float((int)(_128));
        float _140 = float((int)(_119));
        float _144 = sin(_138 + _111);
        float _145 = sin(_139 + _112);
        float _146 = sin(_140 + _113);
        float _161 = _time.x * 0.20000000298023224f;
        float _168 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _138;
        float _169 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _139;
        float _170 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _140;
        float _181 = max(abs((_111 - _108) + _168), max(abs((_112 - _109) + _169), abs((_113 - _110) + _170)));
        bool _182 = (_181 < _133);
        float _183 = select(_182, _181, _133);
        float _184 = select(_182, _168, _134);
        float _185 = select(_182, _169, _135);
        float _186 = select(_182, _170, _136);
        bool __defer_132_723 = false;
        if (!((_137 + 1) == 2)) {
          _133 = _183;
          _134 = _184;
          _135 = _185;
          _136 = _186;
          _137 = (_137 + 1);
          continue;
        }
        if (__defer_132_723) {
          float _736 = exp2(log2(_724 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _737 = exp2(log2(_725 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _738 = exp2(log2(_726 * 9.999999747378752e-05f) * 0.1593017578125f);
          SV_Target.x = exp2(log2((1.0f / ((_736 * 18.6875f) + 1.0f)) * ((_736 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.y = exp2(log2((1.0f / ((_737 * 18.6875f) + 1.0f)) * ((_737 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.z = exp2(log2((1.0f / ((_738 * 18.6875f) + 1.0f)) * ((_738 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.w = _302;
        }
        bool __defer_129_723 = false;
        if (!((_128 + 1) == 2)) {
          _124 = _183;
          _125 = _184;
          _126 = _185;
          _127 = _186;
          _128 = (_128 + 1);
          __loop_jump_target = 123;
          break;
        }
        if (__defer_129_723) {
          float _736 = exp2(log2(_724 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _737 = exp2(log2(_725 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _738 = exp2(log2(_726 * 9.999999747378752e-05f) * 0.1593017578125f);
          SV_Target.x = exp2(log2((1.0f / ((_736 * 18.6875f) + 1.0f)) * ((_736 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.y = exp2(log2((1.0f / ((_737 * 18.6875f) + 1.0f)) * ((_737 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.z = exp2(log2((1.0f / ((_738 * 18.6875f) + 1.0f)) * ((_738 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.w = _302;
        }
        bool __defer_120_723 = false;
        if (!((_119 + 1) == 2)) {
          _115 = _183;
          _116 = _184;
          _117 = _185;
          _118 = _186;
          _119 = (_119 + 1);
          __loop_jump_target = 114;
          break;
        }
        if (__defer_120_723) {
          float _736 = exp2(log2(_724 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _737 = exp2(log2(_725 * 9.999999747378752e-05f) * 0.1593017578125f);
          float _738 = exp2(log2(_726 * 9.999999747378752e-05f) * 0.1593017578125f);
          SV_Target.x = exp2(log2((1.0f / ((_736 * 18.6875f) + 1.0f)) * ((_736 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.y = exp2(log2((1.0f / ((_737 * 18.6875f) + 1.0f)) * ((_737 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.z = exp2(log2((1.0f / ((_738 * 18.6875f) + 1.0f)) * ((_738 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          SV_Target.w = _302;
        }
        float _198 = (pow(_25.x, 0.012683313339948654f));
        int _215 = WaveReadLaneFirst(_materialIndex);
        float _228 = ((_184 + _111) / _107) - _mainPosition.x;
        float _229 = ((_185 + _112) / _107) - _mainPosition.y;
        float _230 = ((_186 + _113) / _107) - _mainPosition.z;
        int _241 = WaveReadLaneFirst(_materialIndex);
        float _255 = _96 - _mainPosition.x;
        float _256 = _97 - _mainPosition.y;
        float _257 = _98 - _mainPosition.z;
        int _272 = WaveReadLaneFirst(_materialIndex);
        float _282 = ((1.0f - saturate(exp2(log2(abs(((1.0f - ((1.0f / max(9.999999747378752e-06f, (WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_241 < (uint)170000), _241, 0)) + 0u))]._radius) * 0.8333333134651184f))) * sqrt(dot(float3(_255, _256, _257), float3(_255, _256, _257))))) * 2.500000238418579f) + -0.5f) * 0.6666666865348816f)))) * (1.0f / max(0.0010000000474974513f, _exposure0.x))) * WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_272 < (uint)170000), _272, 0)) + 0u))]._ringRatio);
        float _286 = (_282 * 0.800000011920929f) + (exp2(log2(max(0.0f, (_198 + -0.8359375f)) / (18.8515625f - (_198 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
        float _287 = (_282 * 0.4000000059604645f) + (exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
        float _288 = (_282 * 0.20000000298023224f) + (exp2(log2(max(0.0f, (_33 + -0.8359375f)) / (18.8515625f - (_33 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
        uint _289 = uint(SV_Position.y);
        if (_etcParams.y == 1.0f) {
          uint2 _296 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_289), 0));
          _302 = (float((uint)((uint)(_296.x & 127))) + 0.5f);
        } else {
          _302 = saturate((_183 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_215 < (uint)170000), _215, 0)) + 0u))]._radius))) * sqrt(dot(float3(_228, _229, _230), float3(_228, _229, _230))))) * 1.470588207244873f));
        }
        bool _305 = (_localToneMappingParams.w > 0.0f);
        if (_305) {
          float3 output_color = TonemapReplacer(float3(_286, _287, _288));
          _658 = output_color.x;
          _659 = output_color.y;
          _660 = output_color.z;
        } else {
          _658 = _286;
          _659 = _287;
          _660 = _288;
        }
        if (_etcParams.y > 1.0f) {
          float _666 = abs(_56);
          float _667 = abs(_57 + -1.0f);
          float _671 = saturate(1.0f - (dot(float2(_666, _667), float2(_666, _667)) * saturate(_etcParams.y + -1.0f)));
          _676 = (_671 * _658);
          _677 = (_671 * _659);
          _678 = (_671 * _660);
        } else {
          _676 = _658;
          _677 = _659;
          _678 = _660;
        }
        if ((_305) && ((_etcParams.z > 0.0f))) {
          _708 = select((_676 <= 0.0031308000907301903f), (_676 * 12.920000076293945f), (((pow(_676, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _709 = select((_677 <= 0.0031308000907301903f), (_677 * 12.920000076293945f), (((pow(_677, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _710 = select((_678 <= 0.0031308000907301903f), (_678 * 12.920000076293945f), (((pow(_678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        } else {
          _708 = _676;
          _709 = _677;
          _710 = _678;
        }
        if (!(!(_etcParams.y >= 1.0f))) {
          float _715 = float((uint)_289);
          if (!(_715 < _viewDir.w)) {
            if (!(_715 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
              _724 = _708;
              _725 = _709;
              _726 = _710;
            } else {
              _724 = 0.0f;
              _725 = 0.0f;
              _726 = 0.0f;
            }
          } else {
            _724 = 0.0f;
            _725 = 0.0f;
            _726 = 0.0f;
          }
        } else {
          _724 = _708;
          _725 = _709;
          _726 = _710;
        }
        float _736 = exp2(log2(_724 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _737 = exp2(log2(_725 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _738 = exp2(log2(_726 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_736 * 18.6875f) + 1.0f)) * ((_736 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_737 * 18.6875f) + 1.0f)) * ((_737 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_738 * 18.6875f) + 1.0f)) * ((_738 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _302;
        break;
      }
      if (__loop_jump_target == 123) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
    if (__loop_jump_target == 114) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}