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
  float _39 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _42 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _43 = TEXCOORD.y * 2.0f;
  float _44 = 1.0f - _43;
  float _45 = max(1.0000000116860974e-07f, _39.x);
  float _57 = mad((_invViewProj[3].z), _45, mad((_invViewProj[3].y), _44, ((_invViewProj[3].x) * _42))) + (_invViewProj[3].w);
  int _58 = WaveReadLaneFirst(_materialIndex);
  int _67 = WaveReadLaneFirst(_materialIndex);
  float _78 = saturate(1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._aimHighlightProgress)) * WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))]._radius);
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
  float _142;
  float _143;
  float _144;
  float _145;
  int _146;
  float _223;
  float _308;
  float _309;
  float _500;
  float _705;
  float _706;
  float _707;
  float _800;
  float _801;
  float _802;
  float _856;
  float _857;
  float _858;
  float _874;
  float _875;
  float _876;
  float _906;
  float _907;
  float _908;
  float _921;
  float _922;
  float _923;
  if (!(!(_78 >= 0.0010000000474974513f))) {
    int _108 = WaveReadLaneFirst(_materialIndex);
    float _116 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._squareSize);
    float _117 = _116 * ((mad((_invViewProj[0].z), _45, mad((_invViewProj[0].y), _44, ((_invViewProj[0].x) * _42))) + (_invViewProj[0].w)) / _57);
    float _118 = _116 * ((mad((_invViewProj[1].z), _45, mad((_invViewProj[1].y), _44, ((_invViewProj[1].x) * _42))) + (_invViewProj[1].w)) / _57);
    float _119 = _116 * ((mad((_invViewProj[2].z), _45, mad((_invViewProj[2].y), _44, ((_invViewProj[2].x) * _42))) + (_invViewProj[2].w)) / _57);
    float _120 = floor(_117);
    float _121 = floor(_118);
    float _122 = floor(_119);
    _124 = 10.0f;
    _125 = 0.0f;
    _126 = 0.0f;
    _127 = 0.0f;
    _128 = -1;
    while(true) {
      _133 = _124;
      _134 = _125;
      _135 = _126;
      _136 = _127;
      _137 = -1;
      while(true) {
        _142 = _133;
        _143 = _134;
        _144 = _135;
        _145 = _136;
        _146 = -1;
        while(true) {
          float _147 = float((int)(_146));
          float _148 = float((int)(_137));
          float _149 = float((int)(_128));
          float _153 = sin(_147 + _120);
          float _154 = sin(_148 + _121);
          float _155 = sin(_149 + _122);
          float _170 = _time.x * 0.20000000298023224f;
          float _177 = sin(_170 * frac(sin(dot(float3(_153, _154, _155), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _147;
          float _178 = sin(_170 * frac(sin(dot(float3(_153, _154, _155), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _148;
          float _179 = sin(_170 * frac(sin(dot(float3(_153, _154, _155), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _149;
          float _190 = max(abs((_120 - _117) + _177), max(abs((_121 - _118) + _178), abs((_122 - _119) + _179)));
          bool _191 = (_190 < _142);
          float _192 = select(_191, _190, _142);
          float _193 = select(_191, _177, _143);
          float _194 = select(_191, _178, _144);
          float _195 = select(_191, _179, _145);
          if (!((_146 + 1) == 2)) {
            _142 = _192;
            _143 = _193;
            _144 = _194;
            _145 = _195;
            _146 = (_146 + 1);
            continue;
          }
          if (!((_137 + 1) == 2)) {
            _133 = _192;
            _134 = _193;
            _135 = _194;
            _136 = _195;
            _137 = (_137 + 1);
            __loop_jump_target = 132;
            break;
          }
          if (!((_128 + 1) == 2)) {
            _124 = _192;
            _125 = _193;
            _126 = _194;
            _127 = _195;
            _128 = (_128 + 1);
            __loop_jump_target = 123;
            break;
          }
          float _209 = ((_193 + _120) / _116) - _mainPosition.x;
          float _210 = ((_194 + _121) / _116) - _mainPosition.y;
          float _211 = ((_195 + _122) / _116) - _mainPosition.z;
          _223 = saturate((_192 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _78)) * sqrt(dot(float3(_209, _210, _211), float3(_209, _210, _211))))) * 1.470588207244873f));
          break;
        }
        if (__loop_jump_target == 132) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
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
  } else {
    _223 = 1.0f;
  }
  float _228 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  int _235 = WaveReadLaneFirst(_materialIndex);
  int _243 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_235 < (uint)170000), _235, 0)) + 0u))]._noiseTex);
  float4 _250 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_243 < (uint)65000), _243, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_228 * TEXCOORD.x), ((_time.x * 0.15000000596046448f) + (_228 * TEXCOORD.y))));
  int _253 = WaveReadLaneFirst(_materialIndex);
  float _262 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_253 < (uint)170000), _253, 0)) + 0u))]._aimHighlightProgress) * (_250.y + -0.30000001192092896f);
  int2 _268; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_268.x, _268.y);
  uint _283 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_268.x))))) + 0.5f) * ((_262 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)(_268.y))))) + 0.5f) * ((_262 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  float _292 = (float((uint)((uint)((uint)((uint)(_283.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _293 = (float((uint)((uint)(((uint)((uint)(_283.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _295 = 1.0f - abs(_292);
  float _296 = abs(_293);
  float _297 = _295 - _296;
  if (!(_297 >= 0.0f)) {
    _308 = (select((_292 >= 0.0f), 1.0f, -1.0f) * (1.0f - _296));
    _309 = (select((_293 >= 0.0f), 1.0f, -1.0f) * _295);
  } else {
    _308 = _292;
    _309 = _293;
  }
  float _311 = rsqrt(dot(float3(_308, _309, _297), float3(_308, _309, _297)));
  float _312 = _311 * _308;
  float _313 = _311 * _309;
  float _314 = _311 * _297;
  float _316 = rsqrt(dot(float3(_312, _313, _314), float3(_312, _313, _314)));
  float _317 = _316 * _312;
  float _318 = _316 * _313;
  float _319 = _316 * _314;
  float _322 = (_262 * 0.0005000000237487257f) + TEXCOORD.x;
  float _323 = (_262 * 0.004999999888241291f) + TEXCOORD.y;
  float4 _332 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _322), int(_customRenderPassSizeInvSize.y * _323), 0));
  uint _342 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _322)), (int)(uint(_bufferSizeAndInvSize.y * _323)), 0));
  float _356 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_342.x & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _332.x))));
  uint _363 = uint(_bufferSizeAndInvSize.x * ((_262 * 0.0002500000118743628f) + TEXCOORD.x));
  uint _364 = uint(_bufferSizeAndInvSize.y * ((_262 * 0.0024999999441206455f) + TEXCOORD.y));
  uint4 _366 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_363), (int)(_364), 0));
  float4 _369 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_363), (int)(_364), 0));
  float _387 = (saturate(_369.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _388 = (saturate(_369.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _389 = (saturate(_369.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _391 = rsqrt(dot(float3(_387, _388, _389), float3(_387, _388, _389)));
  float _392 = _391 * _387;
  float _393 = _391 * _388;
  float _394 = _389 * _391;
  float _397 = (float((uint)((uint)(((uint)((uint)(_366.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _398 = (float((uint)((uint)(_366.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _401 = (_397 + _398) * 0.5f;
  float _402 = (_397 - _398) * 0.5f;
  float _406 = (1.0f - abs(_401)) - abs(_402);
  float _408 = rsqrt(dot(float3(_401, _402, _406), float3(_401, _402, _406)));
  float _409 = _408 * _401;
  float _410 = _408 * _402;
  float _411 = _408 * _406;
  float _413 = select((_394 >= 0.0f), 1.0f, -1.0f);
  float _416 = -0.0f - (1.0f / (_413 + _394));
  float _417 = _393 * _416;
  float _418 = _417 * _392;
  float _419 = _413 * _392;
  float _428 = mad(_411, _392, mad(_410, _418, ((((_419 * _392) * _416) + 1.0f) * _409)));
  float _432 = mad(_411, _393, mad(_410, (_413 + (_417 * _393)), ((_409 * _413) * _418)));
  float _436 = mad(_411, _394, mad(_410, (-0.0f - _393), (-0.0f - (_419 * _409))));
  float _438 = rsqrt(dot(float3(_428, _432, _436), float3(_428, _432, _436)));
  int _451 = WaveReadLaneFirst(_materialIndex);
  float _473 = exp2(log2(1.0f - abs(dot(float3(((((_438 * _428) - _317) * _356) + _317), ((((_438 * _432) - _318) * _356) + _318), ((((_438 * _436) - _319) * _356) + _319)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_451 < (uint)170000), _451, 0)) + 0u))]._aimHighlightProgress) * 100.0f) + -99.0f);
  float _477 = select((!(_356 == 0.0f)), _473, ((_473 * 0.25f) + 0.009999999776482582f));
  float _484 = ((_477 - _33.x) * _223) + _33.x;
  float _485 = ((_477 - _33.y) * _223) + _33.y;
  float _486 = ((_477 - _33.z) * _223) + _33.z;
  uint _487 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _494 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_487), 0));
    _500 = (float((uint)((uint)(_494.x & 127))) + 0.5f);
  } else {
    _500 = _223;
  }
  bool _503 = (_localToneMappingParams.w > 0.0f);
  if (_503) {
    float3 output_color = TonemapReplacer(float3(_484, _485, _486));
    _856 = output_color.x;
    _857 = output_color.y;
    _858 = output_color.z;
  } else {
    _856 = _484;
    _857 = _485;
    _858 = _486;
  }
  if (_etcParams.y > 1.0f) {
    float _864 = abs(_42);
    float _865 = abs(_43 + -1.0f);
    float _869 = saturate(1.0f - (dot(float2(_864, _865), float2(_864, _865)) * saturate(_etcParams.y + -1.0f)));
    _874 = (_869 * _856);
    _875 = (_869 * _857);
    _876 = (_869 * _858);
  } else {
    _874 = _856;
    _875 = _857;
    _876 = _858;
  }
  if ((_503) && ((_etcParams.z > 0.0f))) {
    _906 = select((_874 <= 0.0031308000907301903f), (_874 * 12.920000076293945f), (((pow(_874, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _907 = select((_875 <= 0.0031308000907301903f), (_875 * 12.920000076293945f), (((pow(_875, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _908 = select((_876 <= 0.0031308000907301903f), (_876 * 12.920000076293945f), (((pow(_876, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _906 = _874;
    _907 = _875;
    _908 = _876;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _912 = float((uint)_487);
    if (!(_912 < _viewDir.w)) {
      if (!(_912 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _921 = _906;
        _922 = _907;
        _923 = _908;
      } else {
        _921 = 0.0f;
        _922 = 0.0f;
        _923 = 0.0f;
      }
    } else {
      _921 = 0.0f;
      _922 = 0.0f;
      _923 = 0.0f;
    }
  } else {
    _921 = _906;
    _922 = _907;
    _923 = _908;
  }
  SV_Target.x = _921;
  SV_Target.y = _922;
  SV_Target.z = _923;
  SV_Target.w = _500;
  return SV_Target;
}