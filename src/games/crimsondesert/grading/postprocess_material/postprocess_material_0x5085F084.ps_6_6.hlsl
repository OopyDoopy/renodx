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
  float _38 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _41 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _42 = TEXCOORD.y * 2.0f;
  float _43 = 1.0f - _42;
  float _44 = max(1.0000000116860974e-07f, _38.x);
  float _56 = mad((_invViewProj[3].z), _44, mad((_invViewProj[3].y), _43, ((_invViewProj[3].x) * _41))) + (_invViewProj[3].w);
  int _57 = WaveReadLaneFirst(_materialIndex);
  int _66 = WaveReadLaneFirst(_materialIndex);
  float _77 = saturate(1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))]._aimHighlightProgress)) * WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._radius);
  float _123;
  float _124;
  float _125;
  float _126;
  int _127;
  float _132;
  float _133;
  float _134;
  float _135;
  int _136;
  float _141;
  float _142;
  float _143;
  float _144;
  int _145;
  float _222;
  float _307;
  float _308;
  float _499;
  float _745;
  float _746;
  float _747;
  float _867;
  float _868;
  float _869;
  float _887;
  float _888;
  float _889;
  float _922;
  float _923;
  float _924;
  float _938;
  float _939;
  float _940;
  if (!(!(_77 >= 0.0010000000474974513f))) {
    int _107 = WaveReadLaneFirst(_materialIndex);
    float _115 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._squareSize);
    float _116 = _115 * ((mad((_invViewProj[0].z), _44, mad((_invViewProj[0].y), _43, ((_invViewProj[0].x) * _41))) + (_invViewProj[0].w)) / _56);
    float _117 = _115 * ((mad((_invViewProj[1].z), _44, mad((_invViewProj[1].y), _43, ((_invViewProj[1].x) * _41))) + (_invViewProj[1].w)) / _56);
    float _118 = _115 * ((mad((_invViewProj[2].z), _44, mad((_invViewProj[2].y), _43, ((_invViewProj[2].x) * _41))) + (_invViewProj[2].w)) / _56);
    float _119 = floor(_116);
    float _120 = floor(_117);
    float _121 = floor(_118);
    _123 = 10.0f;
    _124 = 0.0f;
    _125 = 0.0f;
    _126 = 0.0f;
    _127 = -1;
    while(true) {
      _132 = _123;
      _133 = _124;
      _134 = _125;
      _135 = _126;
      _136 = -1;
      while(true) {
        _141 = _132;
        _142 = _133;
        _143 = _134;
        _144 = _135;
        _145 = -1;
        while(true) {
          float _146 = float((int)(_145));
          float _147 = float((int)(_136));
          float _148 = float((int)(_127));
          float _152 = sin(_146 + _119);
          float _153 = sin(_147 + _120);
          float _154 = sin(_148 + _121);
          float _169 = _time.x * 0.20000000298023224f;
          float _176 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _146;
          float _177 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _147;
          float _178 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _148;
          float _189 = max(abs((_119 - _116) + _176), max(abs((_120 - _117) + _177), abs((_121 - _118) + _178)));
          bool _190 = (_189 < _141);
          float _191 = select(_190, _189, _141);
          float _192 = select(_190, _176, _142);
          float _193 = select(_190, _177, _143);
          float _194 = select(_190, _178, _144);
          if (!((_145 + 1) == 2)) {
            _141 = _191;
            _142 = _192;
            _143 = _193;
            _144 = _194;
            _145 = (_145 + 1);
            continue;
          }
          if (!((_136 + 1) == 2)) {
            _132 = _191;
            _133 = _192;
            _134 = _193;
            _135 = _194;
            _136 = (_136 + 1);
            __loop_jump_target = 131;
            break;
          }
          if (!((_127 + 1) == 2)) {
            _123 = _191;
            _124 = _192;
            _125 = _193;
            _126 = _194;
            _127 = (_127 + 1);
            __loop_jump_target = 122;
            break;
          }
          float _208 = ((_192 + _119) / _115) - _mainPosition.x;
          float _209 = ((_193 + _120) / _115) - _mainPosition.y;
          float _210 = ((_194 + _121) / _115) - _mainPosition.z;
          _222 = saturate((_191 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _77)) * sqrt(dot(float3(_208, _209, _210), float3(_208, _209, _210))))) * 1.470588207244873f));
          break;
        }
        if (__loop_jump_target == 131) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 122) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _222 = 1.0f;
  }
  float _227 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  int _234 = WaveReadLaneFirst(_materialIndex);
  int _242 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))]._noiseTex);
  float4 _249 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_227 * TEXCOORD.x), ((_time.x * 0.15000000596046448f) + (_227 * TEXCOORD.y))));
  int _252 = WaveReadLaneFirst(_materialIndex);
  float _261 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_252 < (uint)170000), _252, 0)) + 0u))]._aimHighlightProgress) * (_249.y + -0.30000001192092896f);
  int2 _267; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_267.x, _267.y);
  uint _282 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_267.x))))) + 0.5f) * ((_261 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)(_267.y))))) + 0.5f) * ((_261 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  float _291 = (float((uint)((uint)((uint)((uint)(_282.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _292 = (float((uint)((uint)(((uint)((uint)(_282.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _294 = 1.0f - abs(_291);
  float _295 = abs(_292);
  float _296 = _294 - _295;
  if (!(_296 >= 0.0f)) {
    _307 = (select((_291 >= 0.0f), 1.0f, -1.0f) * (1.0f - _295));
    _308 = (select((_292 >= 0.0f), 1.0f, -1.0f) * _294);
  } else {
    _307 = _291;
    _308 = _292;
  }
  float _310 = rsqrt(dot(float3(_307, _308, _296), float3(_307, _308, _296)));
  float _311 = _310 * _307;
  float _312 = _310 * _308;
  float _313 = _310 * _296;
  float _315 = rsqrt(dot(float3(_311, _312, _313), float3(_311, _312, _313)));
  float _316 = _315 * _311;
  float _317 = _315 * _312;
  float _318 = _315 * _313;
  float _321 = (_261 * 0.0005000000237487257f) + TEXCOORD.x;
  float _322 = (_261 * 0.004999999888241291f) + TEXCOORD.y;
  float4 _331 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _321), int(_customRenderPassSizeInvSize.y * _322), 0));
  uint _341 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _321)), (int)(uint(_bufferSizeAndInvSize.y * _322)), 0));
  float _355 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_341.x & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _331.x))));
  uint _362 = uint(_bufferSizeAndInvSize.x * ((_261 * 0.0002500000118743628f) + TEXCOORD.x));
  uint _363 = uint(_bufferSizeAndInvSize.y * ((_261 * 0.0024999999441206455f) + TEXCOORD.y));
  uint4 _365 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_362), (int)(_363), 0));
  float4 _368 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_362), (int)(_363), 0));
  float _386 = (saturate(_368.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _387 = (saturate(_368.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _388 = (saturate(_368.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _390 = rsqrt(dot(float3(_386, _387, _388), float3(_386, _387, _388)));
  float _391 = _390 * _386;
  float _392 = _390 * _387;
  float _393 = _388 * _390;
  float _396 = (float((uint)((uint)(((uint)((uint)(_365.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _397 = (float((uint)((uint)(_365.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _400 = (_396 + _397) * 0.5f;
  float _401 = (_396 - _397) * 0.5f;
  float _405 = (1.0f - abs(_400)) - abs(_401);
  float _407 = rsqrt(dot(float3(_400, _401, _405), float3(_400, _401, _405)));
  float _408 = _407 * _400;
  float _409 = _407 * _401;
  float _410 = _407 * _405;
  float _412 = select((_393 >= 0.0f), 1.0f, -1.0f);
  float _415 = -0.0f - (1.0f / (_412 + _393));
  float _416 = _392 * _415;
  float _417 = _416 * _391;
  float _418 = _412 * _391;
  float _427 = mad(_410, _391, mad(_409, _417, ((((_418 * _391) * _415) + 1.0f) * _408)));
  float _431 = mad(_410, _392, mad(_409, (_412 + (_416 * _392)), ((_408 * _412) * _417)));
  float _435 = mad(_410, _393, mad(_409, (-0.0f - _392), (-0.0f - (_418 * _408))));
  float _437 = rsqrt(dot(float3(_427, _431, _435), float3(_427, _431, _435)));
  int _450 = WaveReadLaneFirst(_materialIndex);
  float _472 = exp2(log2(1.0f - abs(dot(float3(((((_437 * _427) - _316) * _355) + _316), ((((_437 * _431) - _317) * _355) + _317), ((((_437 * _435) - _318) * _355) + _318)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_450 < (uint)170000), _450, 0)) + 0u))]._aimHighlightProgress) * 100.0f) + -99.0f);
  float _476 = select((!(_355 == 0.0f)), _472, ((_472 * 0.25f) + 0.009999999776482582f));
  float _483 = ((_476 - _32.x) * _222) + _32.x;
  float _484 = ((_476 - _32.y) * _222) + _32.y;
  float _485 = ((_476 - _32.z) * _222) + _32.z;
  uint _486 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _493 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_486), 0));
    _499 = (float((uint)((uint)(_493.x & 127))) + 0.5f);
  } else {
    _499 = _222;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_483, _484, _485));
    _867 = output_color.x;
    _868 = output_color.y;
    _869 = output_color.z;
  } else {
    _867 = _483;
    _868 = _484;
    _869 = _485;
  }
  if (_etcParams.y > 1.0f) {
    float _877 = abs(_41);
    float _878 = abs(_42 + -1.0f);
    float _882 = saturate(1.0f - (dot(float2(_877, _878), float2(_877, _878)) * saturate(_etcParams.y + -1.0f)));
    _887 = (_882 * _867);
    _888 = (_882 * _868);
    _889 = (_882 * _869);
  } else {
    _887 = _867;
    _888 = _868;
    _889 = _869;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _922 = select((_887 <= 0.0031308000907301903f), (_887 * 12.920000076293945f), (((pow(_887, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _923 = select((_888 <= 0.0031308000907301903f), (_888 * 12.920000076293945f), (((pow(_888, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _924 = select((_889 <= 0.0031308000907301903f), (_889 * 12.920000076293945f), (((pow(_889, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _922 = _887;
    _923 = _888;
    _924 = _889;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _929 = float((uint)_486);
    if (!(_929 < _viewDir.w)) {
      if (!(_929 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _938 = _922;
        _939 = _923;
        _940 = _924;
      } else {
        _938 = 0.0f;
        _939 = 0.0f;
        _940 = 0.0f;
      }
    } else {
      _938 = 0.0f;
      _939 = 0.0f;
      _940 = 0.0f;
    }
  } else {
    _938 = _922;
    _939 = _923;
    _940 = _924;
  }
  SV_Target.x = _938;
  SV_Target.y = _939;
  SV_Target.z = _940;
  SV_Target.w = _499;
  return SV_Target;
}

