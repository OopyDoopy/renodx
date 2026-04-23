#include "../tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

ConstantBuffer<PostProcessAimHighlight_CDStruct> BindlessParameters_PostProcessAimHighlight_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float _27[36];
  float4 _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _42 = (pow(_32.x, 0.012683313339948654f));
  float _43 = (pow(_32.y, 0.012683313339948654f));
  float _44 = (pow(_32.z, 0.012683313339948654f));
  float _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _74 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _77 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _78 = TEXCOORD.y * 2.0f;
  float _79 = 1.0f - _78;
  float _80 = max(1.0000000116860974e-07f, _74.x);
  float _92 = mad((_invViewProj[3].z), _80, mad((_invViewProj[3].y), _79, ((_invViewProj[3].x) * _77))) + (_invViewProj[3].w);
  int _93 = WaveReadLaneFirst(_materialIndex);
  int _102 = WaveReadLaneFirst(_materialIndex);
  float _113 = saturate(1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_102 < (uint)170000), _102, 0)) + 0u))]._aimHighlightProgress)) * WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._radius);
  float _159;
  float _160;
  float _161;
  float _162;
  int _163;
  float _168;
  float _169;
  float _170;
  float _171;
  int _172;
  float _177;
  float _178;
  float _179;
  float _180;
  int _181;
  float _258;
  float _343;
  float _344;
  float _535;
  float _781;
  float _782;
  float _783;
  float _903;
  float _904;
  float _905;
  float _923;
  float _924;
  float _925;
  float _958;
  float _959;
  float _960;
  float _974;
  float _975;
  float _976;
  if (!(!(_113 >= 0.0010000000474974513f))) {
    int _143 = WaveReadLaneFirst(_materialIndex);
    float _151 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))]._squareSize);
    float _152 = _151 * ((mad((_invViewProj[0].z), _80, mad((_invViewProj[0].y), _79, ((_invViewProj[0].x) * _77))) + (_invViewProj[0].w)) / _92);
    float _153 = _151 * ((mad((_invViewProj[1].z), _80, mad((_invViewProj[1].y), _79, ((_invViewProj[1].x) * _77))) + (_invViewProj[1].w)) / _92);
    float _154 = _151 * ((mad((_invViewProj[2].z), _80, mad((_invViewProj[2].y), _79, ((_invViewProj[2].x) * _77))) + (_invViewProj[2].w)) / _92);
    float _155 = floor(_152);
    float _156 = floor(_153);
    float _157 = floor(_154);
    _159 = 10.0f;
    _160 = 0.0f;
    _161 = 0.0f;
    _162 = 0.0f;
    _163 = -1;
    while(true) {
      _168 = _159;
      _169 = _160;
      _170 = _161;
      _171 = _162;
      _172 = -1;
      while(true) {
        _177 = _168;
        _178 = _169;
        _179 = _170;
        _180 = _171;
        _181 = -1;
        while(true) {
          float _182 = float((int)(_181));
          float _183 = float((int)(_172));
          float _184 = float((int)(_163));
          float _188 = sin(_182 + _155);
          float _189 = sin(_183 + _156);
          float _190 = sin(_184 + _157);
          float _205 = _time.x * 0.20000000298023224f;
          float _212 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _182;
          float _213 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _183;
          float _214 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _184;
          float _225 = max(abs((_155 - _152) + _212), max(abs((_156 - _153) + _213), abs((_157 - _154) + _214)));
          bool _226 = (_225 < _177);
          float _227 = select(_226, _225, _177);
          float _228 = select(_226, _212, _178);
          float _229 = select(_226, _213, _179);
          float _230 = select(_226, _214, _180);
          if (!((_181 + 1) == 2)) {
            _177 = _227;
            _178 = _228;
            _179 = _229;
            _180 = _230;
            _181 = (_181 + 1);
            continue;
          }
          if (!((_172 + 1) == 2)) {
            _168 = _227;
            _169 = _228;
            _170 = _229;
            _171 = _230;
            _172 = (_172 + 1);
            __loop_jump_target = 167;
            break;
          }
          if (!((_163 + 1) == 2)) {
            _159 = _227;
            _160 = _228;
            _161 = _229;
            _162 = _230;
            _163 = (_163 + 1);
            __loop_jump_target = 158;
            break;
          }
          float _244 = ((_228 + _155) / _151) - _mainPosition.x;
          float _245 = ((_229 + _156) / _151) - _mainPosition.y;
          float _246 = ((_230 + _157) / _151) - _mainPosition.z;
          _258 = saturate((_227 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _113)) * sqrt(dot(float3(_244, _245, _246), float3(_244, _245, _246))))) * 1.470588207244873f));
          break;
        }
        if (__loop_jump_target == 167) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 158) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _258 = 1.0f;
  }
  float _263 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  int _270 = WaveReadLaneFirst(_materialIndex);
  int _278 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))]._noiseTex);
  float4 _285 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_278 < (uint)65000), _278, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_263 * TEXCOORD.x), ((_time.x * 0.15000000596046448f) + (_263 * TEXCOORD.y))));
  int _288 = WaveReadLaneFirst(_materialIndex);
  float _297 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_288 < (uint)170000), _288, 0)) + 0u))]._aimHighlightProgress) * (_285.y + -0.30000001192092896f);
  int2 _303; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_303.x, _303.y);
  uint _318 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_303.x))))) + 0.5f) * ((_297 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)(_303.y))))) + 0.5f) * ((_297 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  float _327 = (float((uint)((uint)((uint)((uint)(_318.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _328 = (float((uint)((uint)(((uint)((uint)(_318.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _330 = 1.0f - abs(_327);
  float _331 = abs(_328);
  float _332 = _330 - _331;
  if (!(_332 >= 0.0f)) {
    _343 = (select((_327 >= 0.0f), 1.0f, -1.0f) * (1.0f - _331));
    _344 = (select((_328 >= 0.0f), 1.0f, -1.0f) * _330);
  } else {
    _343 = _327;
    _344 = _328;
  }
  float _346 = rsqrt(dot(float3(_343, _344, _332), float3(_343, _344, _332)));
  float _347 = _346 * _343;
  float _348 = _346 * _344;
  float _349 = _346 * _332;
  float _351 = rsqrt(dot(float3(_347, _348, _349), float3(_347, _348, _349)));
  float _352 = _351 * _347;
  float _353 = _351 * _348;
  float _354 = _351 * _349;
  float _357 = (_297 * 0.0005000000237487257f) + TEXCOORD.x;
  float _358 = (_297 * 0.004999999888241291f) + TEXCOORD.y;
  float4 _367 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _357), int(_customRenderPassSizeInvSize.y * _358), 0));
  uint _377 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _357)), (int)(uint(_bufferSizeAndInvSize.y * _358)), 0));
  float _391 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_377.x & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _367.x))));
  uint _398 = uint(_bufferSizeAndInvSize.x * ((_297 * 0.0002500000118743628f) + TEXCOORD.x));
  uint _399 = uint(_bufferSizeAndInvSize.y * ((_297 * 0.0024999999441206455f) + TEXCOORD.y));
  uint4 _401 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_398), (int)(_399), 0));
  float4 _404 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_398), (int)(_399), 0));
  float _422 = (saturate(_404.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _423 = (saturate(_404.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _424 = (saturate(_404.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _426 = rsqrt(dot(float3(_422, _423, _424), float3(_422, _423, _424)));
  float _427 = _426 * _422;
  float _428 = _426 * _423;
  float _429 = _424 * _426;
  float _432 = (float((uint)((uint)(((uint)((uint)(_401.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _433 = (float((uint)((uint)(_401.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _436 = (_432 + _433) * 0.5f;
  float _437 = (_432 - _433) * 0.5f;
  float _441 = (1.0f - abs(_436)) - abs(_437);
  float _443 = rsqrt(dot(float3(_436, _437, _441), float3(_436, _437, _441)));
  float _444 = _443 * _436;
  float _445 = _443 * _437;
  float _446 = _443 * _441;
  float _448 = select((_429 >= 0.0f), 1.0f, -1.0f);
  float _451 = -0.0f - (1.0f / (_448 + _429));
  float _452 = _428 * _451;
  float _453 = _452 * _427;
  float _454 = _448 * _427;
  float _463 = mad(_446, _427, mad(_445, _453, ((((_454 * _427) * _451) + 1.0f) * _444)));
  float _467 = mad(_446, _428, mad(_445, (_448 + (_452 * _428)), ((_444 * _448) * _453)));
  float _471 = mad(_446, _429, mad(_445, (-0.0f - _428), (-0.0f - (_454 * _444))));
  float _473 = rsqrt(dot(float3(_463, _467, _471), float3(_463, _467, _471)));
  int _486 = WaveReadLaneFirst(_materialIndex);
  float _508 = exp2(log2(1.0f - abs(dot(float3(((((_473 * _463) - _352) * _391) + _352), ((((_473 * _467) - _353) * _391) + _353), ((((_473 * _471) - _354) * _391) + _354)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_486 < (uint)170000), _486, 0)) + 0u))]._aimHighlightProgress) * 100.0f) + -99.0f);
  float _512 = select((!(_391 == 0.0f)), _508, ((_508 * 0.25f) + 0.009999999776482582f));
  float _519 = ((_512 - _69) * _258) + _69;
  float _520 = ((_512 - _70) * _258) + _70;
  float _521 = ((_512 - _71) * _258) + _71;
  uint _522 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _529 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_522), 0));
    _535 = (float((uint)((uint)(_529.x & 127))) + 0.5f);
  } else {
    _535 = _258;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_519, _520, _521));
    _903 = output_color.x;
    _904 = output_color.y;
    _905 = output_color.z;
  } else {
    _903 = _519;
    _904 = _520;
    _905 = _521;
  }
  if (_etcParams.y > 1.0f) {
    float _913 = abs(_77);
    float _914 = abs(_78 + -1.0f);
    float _918 = saturate(1.0f - (dot(float2(_913, _914), float2(_913, _914)) * saturate(_etcParams.y + -1.0f)));
    _923 = (_918 * _903);
    _924 = (_918 * _904);
    _925 = (_918 * _905);
  } else {
    _923 = _903;
    _924 = _904;
    _925 = _905;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _958 = select((_923 <= 0.0031308000907301903f), (_923 * 12.920000076293945f), (((pow(_923, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _959 = select((_924 <= 0.0031308000907301903f), (_924 * 12.920000076293945f), (((pow(_924, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _960 = select((_925 <= 0.0031308000907301903f), (_925 * 12.920000076293945f), (((pow(_925, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _958 = _923;
    _959 = _924;
    _960 = _925;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _965 = float((uint)_522);
    if (!(_965 < _viewDir.w)) {
      if (!(_965 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _974 = _958;
        _975 = _959;
        _976 = _960;
      } else {
        _974 = 0.0f;
        _975 = 0.0f;
        _976 = 0.0f;
      }
    } else {
      _974 = 0.0f;
      _975 = 0.0f;
      _976 = 0.0f;
    }
  } else {
    _974 = _958;
    _975 = _959;
    _976 = _960;
  }
  float _986 = exp2(log2(_974 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _987 = exp2(log2(_975 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _988 = exp2(log2(_976 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_986 * 18.6875f) + 1.0f)) * ((_986 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_987 * 18.6875f) + 1.0f)) * ((_987 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_988 * 18.6875f) + 1.0f)) * ((_988 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _535;
  return SV_Target;
}

