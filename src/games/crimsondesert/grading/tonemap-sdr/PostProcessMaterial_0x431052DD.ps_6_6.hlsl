struct PostProcessAimHighlight_CDStruct {
  float _aimHighlightProgress;
  float _aimHighlightBackground;
  uint _noiseTex;
  uint _auraTex;
  float _radius;
  float _squareSize;
  float _maskThreshold;
  uint _aimGimmickColor;
  uint _aimHighlightColor;
  float _fishEyeMaxPower;
  float _vignetteIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t41, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

ConstantBuffer<PostProcessAimHighlight_CDStruct> BindlessParameters_PostProcessAimHighlight_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float4 _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _43 = (pow(_33.x, 0.012683313339948654f));
  float _44 = (pow(_33.y, 0.012683313339948654f));
  float _45 = (pow(_33.z, 0.012683313339948654f));
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _75 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _78 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _79 = TEXCOORD.y * 2.0f;
  float _80 = 1.0f - _79;
  float _81 = max(1.0000000116860974e-07f, _75.x);
  float _93 = mad((_invViewProj[3].z), _81, mad((_invViewProj[3].y), _80, ((_invViewProj[3].x) * _78))) + (_invViewProj[3].w);
  int _94 = WaveReadLaneFirst(_materialIndex);
  int _103 = WaveReadLaneFirst(_materialIndex);
  float _114 = saturate(1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_103 < (uint)170000), _103, 0)) + 0u))]._aimHighlightProgress)) * WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))]._radius);
  float _160;
  float _161;
  float _162;
  float _163;
  int _164;
  float _169;
  float _170;
  float _171;
  float _172;
  int _173;
  float _178;
  float _179;
  float _180;
  float _181;
  int _182;
  float _259;
  float _344;
  float _345;
  float _536;
  float _741;
  float _742;
  float _743;
  float _836;
  float _837;
  float _838;
  float _892;
  float _893;
  float _894;
  float _910;
  float _911;
  float _912;
  float _942;
  float _943;
  float _944;
  float _957;
  float _958;
  float _959;
  if (!(!(_114 >= 0.0010000000474974513f))) {
    int _144 = WaveReadLaneFirst(_materialIndex);
    float _152 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))]._squareSize);
    float _153 = _152 * ((mad((_invViewProj[0].z), _81, mad((_invViewProj[0].y), _80, ((_invViewProj[0].x) * _78))) + (_invViewProj[0].w)) / _93);
    float _154 = _152 * ((mad((_invViewProj[1].z), _81, mad((_invViewProj[1].y), _80, ((_invViewProj[1].x) * _78))) + (_invViewProj[1].w)) / _93);
    float _155 = _152 * ((mad((_invViewProj[2].z), _81, mad((_invViewProj[2].y), _80, ((_invViewProj[2].x) * _78))) + (_invViewProj[2].w)) / _93);
    float _156 = floor(_153);
    float _157 = floor(_154);
    float _158 = floor(_155);
    _160 = 10.0f;
    _161 = 0.0f;
    _162 = 0.0f;
    _163 = 0.0f;
    _164 = -1;
    while(true) {
      _169 = _160;
      _170 = _161;
      _171 = _162;
      _172 = _163;
      _173 = -1;
      while(true) {
        _178 = _169;
        _179 = _170;
        _180 = _171;
        _181 = _172;
        _182 = -1;
        while(true) {
          float _183 = float((int)(_182));
          float _184 = float((int)(_173));
          float _185 = float((int)(_164));
          float _189 = sin(_183 + _156);
          float _190 = sin(_184 + _157);
          float _191 = sin(_185 + _158);
          float _206 = _time.x * 0.20000000298023224f;
          float _213 = sin(_206 * frac(sin(dot(float3(_189, _190, _191), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _183;
          float _214 = sin(_206 * frac(sin(dot(float3(_189, _190, _191), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _184;
          float _215 = sin(_206 * frac(sin(dot(float3(_189, _190, _191), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _185;
          float _226 = max(abs((_156 - _153) + _213), max(abs((_157 - _154) + _214), abs((_158 - _155) + _215)));
          bool _227 = (_226 < _178);
          float _228 = select(_227, _226, _178);
          float _229 = select(_227, _213, _179);
          float _230 = select(_227, _214, _180);
          float _231 = select(_227, _215, _181);
          if (!((_182 + 1) == 2)) {
            _178 = _228;
            _179 = _229;
            _180 = _230;
            _181 = _231;
            _182 = (_182 + 1);
            continue;
          }
          if (!((_173 + 1) == 2)) {
            _169 = _228;
            _170 = _229;
            _171 = _230;
            _172 = _231;
            _173 = (_173 + 1);
            __loop_jump_target = 168;
            break;
          }
          if (!((_164 + 1) == 2)) {
            _160 = _228;
            _161 = _229;
            _162 = _230;
            _163 = _231;
            _164 = (_164 + 1);
            __loop_jump_target = 159;
            break;
          }
          float _245 = ((_229 + _156) / _152) - _mainPosition.x;
          float _246 = ((_230 + _157) / _152) - _mainPosition.y;
          float _247 = ((_231 + _158) / _152) - _mainPosition.z;
          _259 = saturate((_228 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _114)) * sqrt(dot(float3(_245, _246, _247), float3(_245, _246, _247))))) * 1.470588207244873f));
          break;
        }
        if (__loop_jump_target == 168) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 159) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _259 = 1.0f;
  }
  float _264 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  int _271 = WaveReadLaneFirst(_materialIndex);
  int _279 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_271 < (uint)170000), _271, 0)) + 0u))]._noiseTex);
  float4 _286 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_279 < (uint)65000), _279, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_264 * TEXCOORD.x), ((_time.x * 0.15000000596046448f) + (_264 * TEXCOORD.y))));
  int _289 = WaveReadLaneFirst(_materialIndex);
  float _298 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_289 < (uint)170000), _289, 0)) + 0u))]._aimHighlightProgress) * (_286.y + -0.30000001192092896f);
  int2 _304; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_304.x, _304.y);
  uint _319 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_304.x))))) + 0.5f) * ((_298 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)(_304.y))))) + 0.5f) * ((_298 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  float _328 = (float((uint)((uint)((uint)((uint)(_319.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _329 = (float((uint)((uint)(((uint)((uint)(_319.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _331 = 1.0f - abs(_328);
  float _332 = abs(_329);
  float _333 = _331 - _332;
  if (!(_333 >= 0.0f)) {
    _344 = (select((_328 >= 0.0f), 1.0f, -1.0f) * (1.0f - _332));
    _345 = (select((_329 >= 0.0f), 1.0f, -1.0f) * _331);
  } else {
    _344 = _328;
    _345 = _329;
  }
  float _347 = rsqrt(dot(float3(_344, _345, _333), float3(_344, _345, _333)));
  float _348 = _347 * _344;
  float _349 = _347 * _345;
  float _350 = _347 * _333;
  float _352 = rsqrt(dot(float3(_348, _349, _350), float3(_348, _349, _350)));
  float _353 = _352 * _348;
  float _354 = _352 * _349;
  float _355 = _352 * _350;
  float _358 = (_298 * 0.0005000000237487257f) + TEXCOORD.x;
  float _359 = (_298 * 0.004999999888241291f) + TEXCOORD.y;
  float4 _368 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _358), int(_customRenderPassSizeInvSize.y * _359), 0));
  uint _378 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _358)), (int)(uint(_bufferSizeAndInvSize.y * _359)), 0));
  float _392 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_378.x & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _368.x))));
  uint _399 = uint(_bufferSizeAndInvSize.x * ((_298 * 0.0002500000118743628f) + TEXCOORD.x));
  uint _400 = uint(_bufferSizeAndInvSize.y * ((_298 * 0.0024999999441206455f) + TEXCOORD.y));
  uint4 _402 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_399), (int)(_400), 0));
  float4 _405 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_399), (int)(_400), 0));
  float _423 = (saturate(_405.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _424 = (saturate(_405.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _425 = (saturate(_405.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _427 = rsqrt(dot(float3(_423, _424, _425), float3(_423, _424, _425)));
  float _428 = _427 * _423;
  float _429 = _427 * _424;
  float _430 = _425 * _427;
  float _433 = (float((uint)((uint)(((uint)((uint)(_402.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _434 = (float((uint)((uint)(_402.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _437 = (_433 + _434) * 0.5f;
  float _438 = (_433 - _434) * 0.5f;
  float _442 = (1.0f - abs(_437)) - abs(_438);
  float _444 = rsqrt(dot(float3(_437, _438, _442), float3(_437, _438, _442)));
  float _445 = _444 * _437;
  float _446 = _444 * _438;
  float _447 = _444 * _442;
  float _449 = select((_430 >= 0.0f), 1.0f, -1.0f);
  float _452 = -0.0f - (1.0f / (_449 + _430));
  float _453 = _429 * _452;
  float _454 = _453 * _428;
  float _455 = _449 * _428;
  float _464 = mad(_447, _428, mad(_446, _454, ((((_455 * _428) * _452) + 1.0f) * _445)));
  float _468 = mad(_447, _429, mad(_446, (_449 + (_453 * _429)), ((_445 * _449) * _454)));
  float _472 = mad(_447, _430, mad(_446, (-0.0f - _429), (-0.0f - (_455 * _445))));
  float _474 = rsqrt(dot(float3(_464, _468, _472), float3(_464, _468, _472)));
  int _487 = WaveReadLaneFirst(_materialIndex);
  float _509 = exp2(log2(1.0f - abs(dot(float3(((((_474 * _464) - _353) * _392) + _353), ((((_474 * _468) - _354) * _392) + _354), ((((_474 * _472) - _355) * _392) + _355)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_487 < (uint)170000), _487, 0)) + 0u))]._aimHighlightProgress) * 100.0f) + -99.0f);
  float _513 = select((!(_392 == 0.0f)), _509, ((_509 * 0.25f) + 0.009999999776482582f));
  float _520 = ((_513 - _70) * _259) + _70;
  float _521 = ((_513 - _71) * _259) + _71;
  float _522 = ((_513 - _72) * _259) + _72;
  uint _523 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _530 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_523), 0));
    _536 = (float((uint)((uint)(_530.x & 127))) + 0.5f);
  } else {
    _536 = _259;
  }
  bool _539 = (_localToneMappingParams.w > 0.0f);
  if (_539) {
    float3 output_color = TonemapReplacer(float3(_520, _521, _522));
    _892 = output_color.x;
    _893 = output_color.y;
    _894 = output_color.z;
  } else {
    _892 = _520;
    _893 = _521;
    _894 = _522;
  }
  if (_etcParams.y > 1.0f) {
    float _900 = abs(_78);
    float _901 = abs(_79 + -1.0f);
    float _905 = saturate(1.0f - (dot(float2(_900, _901), float2(_900, _901)) * saturate(_etcParams.y + -1.0f)));
    _910 = (_905 * _892);
    _911 = (_905 * _893);
    _912 = (_905 * _894);
  } else {
    _910 = _892;
    _911 = _893;
    _912 = _894;
  }
  if ((_539) && ((_etcParams.z > 0.0f))) {
    _942 = select((_910 <= 0.0031308000907301903f), (_910 * 12.920000076293945f), (((pow(_910, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _943 = select((_911 <= 0.0031308000907301903f), (_911 * 12.920000076293945f), (((pow(_911, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _944 = select((_912 <= 0.0031308000907301903f), (_912 * 12.920000076293945f), (((pow(_912, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _942 = _910;
    _943 = _911;
    _944 = _912;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _948 = float((uint)_523);
    if (!(_948 < _viewDir.w)) {
      if (!(_948 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _957 = _942;
        _958 = _943;
        _959 = _944;
      } else {
        _957 = 0.0f;
        _958 = 0.0f;
        _959 = 0.0f;
      }
    } else {
      _957 = 0.0f;
      _958 = 0.0f;
      _959 = 0.0f;
    }
  } else {
    _957 = _942;
    _958 = _943;
    _959 = _944;
  }
  float _969 = exp2(log2(_957 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _970 = exp2(log2(_958 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _971 = exp2(log2(_959 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_969 * 18.6875f) + 1.0f)) * ((_969 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_970 * 18.6875f) + 1.0f)) * ((_970 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_971 * 18.6875f) + 1.0f)) * ((_971 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _536;
  return SV_Target;
}