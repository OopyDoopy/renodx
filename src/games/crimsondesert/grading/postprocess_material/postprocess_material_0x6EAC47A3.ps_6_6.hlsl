#include "../tonemap.hlsli"

struct PostProcessLearningHolo_CDStruct {
  float _learningEffectRatio;
  uint _learningEffectColor;
  uint _noiseTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

ConstantBuffer<PostProcessLearningHolo_CDStruct> BindlessParameters_PostProcessLearningHolo_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24[36];
  float4 _29 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _39 = (pow(_29.x, 0.012683313339948654f));
  float _40 = (pow(_29.y, 0.012683313339948654f));
  float _41 = (pow(_29.z, 0.012683313339948654f));
  float _66 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _69 = WaveReadLaneFirst(_materialIndex);
  float _77 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._learningEffectRatio);
  int _82 = WaveReadLaneFirst(_materialIndex);
  int _90 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))]._noiseTexture);
  float4 _97 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_90 < (uint)65000), _90, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_77 + (TEXCOORD.x * 5.0f)), (_77 + (TEXCOORD.y * 0.10000000149011612f))));
  int2 _107; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_107.x, _107.y);
  uint _122 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_107.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_107.y))))) + 0.5f) * (((saturate(1.0f - _77) * 0.125f) * ((_97.y * 2.0f) + -0.9960784316062927f)) + TEXCOORD.y)), 0));
  int _124 = _122.x & 255;
  float _132 = (float((uint)((uint)((uint)((uint)(_122.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _133 = (float((uint)((uint)(((uint)((uint)(_122.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _135 = 1.0f - abs(_132);
  float _136 = abs(_133);
  float _137 = _135 - _136;
  float _148;
  float _149;
  float _447;
  float _448;
  float _449;
  float _450;
  float _458;
  float _459;
  float _460;
  float _461;
  float _462;
  float _463;
  float _464;
  float _487;
  float _733;
  float _734;
  float _735;
  float _855;
  float _856;
  float _857;
  float _878;
  float _879;
  float _880;
  float _913;
  float _914;
  float _915;
  float _929;
  float _930;
  float _931;
  if (!(_137 >= 0.0f)) {
    _148 = (select((_132 >= 0.0f), 1.0f, -1.0f) * (1.0f - _136));
    _149 = (select((_133 >= 0.0f), 1.0f, -1.0f) * _135);
  } else {
    _148 = _132;
    _149 = _133;
  }
  float _151 = rsqrt(dot(float3(_148, _149, _137), float3(_148, _149, _137)));
  float _152 = _151 * _148;
  float _153 = _151 * _149;
  float _154 = _151 * _137;
  float _156 = rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
  float _157 = _156 * _152;
  float _158 = _156 * _153;
  float _159 = _156 * _154;
  bool _163 = (_77 > 0.0010000000474974513f);
  if (_124 == _renderPassLearning) {
    if (_163) {
      float _175 = -0.0f - _viewDir.x;
      float _176 = -0.0f - _viewDir.y;
      float _177 = -0.0f - _viewDir.z;
      float _179 = saturate(dot(float3(_157, _158, _159), float3(_175, _176, _177)));
      float _180 = 1.0f - _179;
      uint _186 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _187 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _189 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_186), (int)(_187), 0));
      float4 _192 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_186), (int)(_187), 0));
      float _210 = (saturate(_192.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _211 = (saturate(_192.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _212 = (saturate(_192.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
      float _215 = _214 * _210;
      float _216 = _214 * _211;
      float _217 = _212 * _214;
      float _220 = (float((uint)((uint)(((uint)((uint)(_189.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _221 = (float((uint)((uint)(_189.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _224 = (_220 + _221) * 0.5f;
      float _225 = (_220 - _221) * 0.5f;
      float _229 = (1.0f - abs(_224)) - abs(_225);
      float _231 = rsqrt(dot(float3(_224, _225, _229), float3(_224, _225, _229)));
      float _232 = _231 * _224;
      float _233 = _231 * _225;
      float _234 = _231 * _229;
      float _236 = select((_217 >= 0.0f), 1.0f, -1.0f);
      float _239 = -0.0f - (1.0f / (_236 + _217));
      float _240 = _216 * _239;
      float _241 = _240 * _215;
      float _242 = _236 * _215;
      float _251 = mad(_234, _215, mad(_233, _241, ((((_242 * _215) * _239) + 1.0f) * _232)));
      float _255 = mad(_234, _216, mad(_233, (_236 + (_240 * _216)), ((_232 * _236) * _241)));
      float _259 = mad(_234, _217, mad(_233, (-0.0f - _216), (-0.0f - (_242 * _232))));
      float _261 = rsqrt(dot(float3(_251, _255, _259), float3(_251, _255, _259)));
      float _265 = dot(float3((_261 * _251), (_261 * _255), (_261 * _259)), float3(_175, _176, _177));
      float _266 = 1.0f - _265;
      int _267 = WaveReadLaneFirst(_materialIndex);
      int _275 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_267 < (uint)170000), _267, 0)) + 0u))]._learningEffectColor);
      float _278 = float((uint)((uint)(((uint)((uint)(_275)) >> 16) & 255)));
      float _281 = float((uint)((uint)(((uint)((uint)(_275)) >> 8) & 255)));
      float _283 = float((uint)((uint)(_275 & 255)));
      float _313 = max(0.0010000000474974513f, _exposure0.x);
      float _328 = saturate((abs(sin(((_159 * 2.0f) + (TEXCOORD.y * 500.0f)) + (_time.x * 10.0f))) * 3.0f) + -2.0f);
      float _352 = _179 * _265;
      float _354 = ((saturate((abs(sin(((_158 * 2.0f) + (TEXCOORD.y * 10.0f)) - (_time.x * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_157 * 0.25f) + (TEXCOORD.y * 25.0f)) + (_time.x * 1.2000000476837158f))) * 3.0f) + -1.0f) - _328)) + _328) * (_352 * _352);
      float _355 = dot(float3(_66, _67, _68), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _359 = _354 * (_355 + (select(((_278 * 0.003921568859368563f) < 0.040449999272823334f), (_278 * 0.0003035269910469651f), exp2(log2((_278 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _360 = _354 * (_355 + (select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _361 = _354 * (_355 + (select(((_283 * 0.003921568859368563f) < 0.040449999272823334f), (_283 * 0.0003035269910469651f), exp2(log2((_283 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _366 = exp2(log2(_266 * _180) * 3.0f) * 10.0f;
      float _370 = (_366 * _359) + _359;
      float _371 = (_366 * _360) + _360;
      float _372 = (_366 * _361) + _361;
      float _375 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float4 _385 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
      float _394 = saturate((_nearFarProj.x / max(1.0000000116860974e-07f, _385.x)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _375.x)));
      float _401 = (saturate(1.0f - abs((_77 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_394 < 1.0f) {
        float _405 = log2(1.0f - _394);
        float _411 = (pow(_394, 3.0f)) * exp2(_405 * 8.0f);
        float _414 = (_411 * 600.0f) / _313;
        _447 = ((_414 + _370) * _401);
        _448 = ((_414 + _371) * _401);
        _449 = ((((_411 * 1800.0f) / _313) + _372) * _401);
        _450 = saturate(exp2(_405 * 3.0f) * _77);
      } else {
        if (_124 == _renderPassAimHighlight) {
          float _433 = ((_266 - _180) * 0.4000000059604645f) + _180;
          _447 = ((((_433 * 0.800000011920929f) / _313) + _370) * _401);
          _448 = ((((_433 * 1.2000000476837158f) / _313) + _371) * _401);
          _449 = ((((_433 * 2.0f) / _313) + _372) * _401);
          _450 = _77;
        } else {
          _447 = _66;
          _448 = _67;
          _449 = _68;
          _450 = 0.0f;
        }
      }
      float _453 = ((_77 * 3.0f) * _450) + 1.0f;
      _458 = (_453 * _66);
      _459 = (_453 * _67);
      _460 = (_453 * _68);
      _461 = _447;
      _462 = _448;
      _463 = _449;
      _464 = _450;
    } else {
      _458 = _66;
      _459 = _67;
      _460 = _68;
      _461 = _66;
      _462 = _67;
      _463 = _68;
      _464 = 0.0f;
    }
  } else {
    if ((_163) && ((_124 == _renderPassAimHighlight))) {
      float _175 = -0.0f - _viewDir.x;
      float _176 = -0.0f - _viewDir.y;
      float _177 = -0.0f - _viewDir.z;
      float _179 = saturate(dot(float3(_157, _158, _159), float3(_175, _176, _177)));
      float _180 = 1.0f - _179;
      uint _186 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _187 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _189 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_186), (int)(_187), 0));
      float4 _192 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_186), (int)(_187), 0));
      float _210 = (saturate(_192.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _211 = (saturate(_192.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _212 = (saturate(_192.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
      float _215 = _214 * _210;
      float _216 = _214 * _211;
      float _217 = _212 * _214;
      float _220 = (float((uint)((uint)(((uint)((uint)(_189.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _221 = (float((uint)((uint)(_189.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _224 = (_220 + _221) * 0.5f;
      float _225 = (_220 - _221) * 0.5f;
      float _229 = (1.0f - abs(_224)) - abs(_225);
      float _231 = rsqrt(dot(float3(_224, _225, _229), float3(_224, _225, _229)));
      float _232 = _231 * _224;
      float _233 = _231 * _225;
      float _234 = _231 * _229;
      float _236 = select((_217 >= 0.0f), 1.0f, -1.0f);
      float _239 = -0.0f - (1.0f / (_236 + _217));
      float _240 = _216 * _239;
      float _241 = _240 * _215;
      float _242 = _236 * _215;
      float _251 = mad(_234, _215, mad(_233, _241, ((((_242 * _215) * _239) + 1.0f) * _232)));
      float _255 = mad(_234, _216, mad(_233, (_236 + (_240 * _216)), ((_232 * _236) * _241)));
      float _259 = mad(_234, _217, mad(_233, (-0.0f - _216), (-0.0f - (_242 * _232))));
      float _261 = rsqrt(dot(float3(_251, _255, _259), float3(_251, _255, _259)));
      float _265 = dot(float3((_261 * _251), (_261 * _255), (_261 * _259)), float3(_175, _176, _177));
      float _266 = 1.0f - _265;
      int _267 = WaveReadLaneFirst(_materialIndex);
      int _275 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_267 < (uint)170000), _267, 0)) + 0u))]._learningEffectColor);
      float _278 = float((uint)((uint)(((uint)((uint)(_275)) >> 16) & 255)));
      float _281 = float((uint)((uint)(((uint)((uint)(_275)) >> 8) & 255)));
      float _283 = float((uint)((uint)(_275 & 255)));
      float _313 = max(0.0010000000474974513f, _exposure0.x);
      float _328 = saturate((abs(sin(((_159 * 2.0f) + (TEXCOORD.y * 500.0f)) + (_time.x * 10.0f))) * 3.0f) + -2.0f);
      float _352 = _179 * _265;
      float _354 = ((saturate((abs(sin(((_158 * 2.0f) + (TEXCOORD.y * 10.0f)) - (_time.x * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_157 * 0.25f) + (TEXCOORD.y * 25.0f)) + (_time.x * 1.2000000476837158f))) * 3.0f) + -1.0f) - _328)) + _328) * (_352 * _352);
      float _355 = dot(float3(_66, _67, _68), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _359 = _354 * (_355 + (select(((_278 * 0.003921568859368563f) < 0.040449999272823334f), (_278 * 0.0003035269910469651f), exp2(log2((_278 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _360 = _354 * (_355 + (select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _361 = _354 * (_355 + (select(((_283 * 0.003921568859368563f) < 0.040449999272823334f), (_283 * 0.0003035269910469651f), exp2(log2((_283 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      float _366 = exp2(log2(_266 * _180) * 3.0f) * 10.0f;
      float _370 = (_366 * _359) + _359;
      float _371 = (_366 * _360) + _360;
      float _372 = (_366 * _361) + _361;
      float _375 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float4 _385 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
      float _394 = saturate((_nearFarProj.x / max(1.0000000116860974e-07f, _385.x)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _375.x)));
      float _401 = (saturate(1.0f - abs((_77 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_394 < 1.0f) {
        float _405 = log2(1.0f - _394);
        float _411 = (pow(_394, 3.0f)) * exp2(_405 * 8.0f);
        float _414 = (_411 * 600.0f) / _313;
        _447 = ((_414 + _370) * _401);
        _448 = ((_414 + _371) * _401);
        _449 = ((((_411 * 1800.0f) / _313) + _372) * _401);
        _450 = saturate(exp2(_405 * 3.0f) * _77);
      } else {
        if (_124 == _renderPassAimHighlight) {
          float _433 = ((_266 - _180) * 0.4000000059604645f) + _180;
          _447 = ((((_433 * 0.800000011920929f) / _313) + _370) * _401);
          _448 = ((((_433 * 1.2000000476837158f) / _313) + _371) * _401);
          _449 = ((((_433 * 2.0f) / _313) + _372) * _401);
          _450 = _77;
        } else {
          _447 = _66;
          _448 = _67;
          _449 = _68;
          _450 = 0.0f;
        }
      }
      float _453 = ((_77 * 3.0f) * _450) + 1.0f;
      _458 = (_453 * _66);
      _459 = (_453 * _67);
      _460 = (_453 * _68);
      _461 = _447;
      _462 = _448;
      _463 = _449;
      _464 = _450;
    } else {
      _458 = _66;
      _459 = _67;
      _460 = _68;
      _461 = _66;
      _462 = _67;
      _463 = _68;
      _464 = 0.0f;
    }
  }
  float _471 = (_464 * (_461 - _458)) + _458;
  float _472 = (_464 * (_462 - _459)) + _459;
  float _473 = (_464 * (_463 - _460)) + _460;
  uint _474 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _481 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_474), 0));
    _487 = (float((uint)((uint)(_481.x & 127))) + 0.5f);
  } else {
    _487 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_471, _472, _473));
    _855 = output_color.x;
    _856 = output_color.y;
    _857 = output_color.z;
  } else {
    _855 = _471;
    _856 = _472;
    _857 = _473;
  }
  if (_etcParams.y > 1.0f) {
    float _868 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _869 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _873 = saturate(1.0f - (dot(float2(_868, _869), float2(_868, _869)) * saturate(_etcParams.y + -1.0f)));
    _878 = (_873 * _855);
    _879 = (_873 * _856);
    _880 = (_873 * _857);
  } else {
    _878 = _855;
    _879 = _856;
    _880 = _857;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _913 = select((_878 <= 0.0031308000907301903f), (_878 * 12.920000076293945f), (((pow(_878, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _914 = select((_879 <= 0.0031308000907301903f), (_879 * 12.920000076293945f), (((pow(_879, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _915 = select((_880 <= 0.0031308000907301903f), (_880 * 12.920000076293945f), (((pow(_880, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _913 = _878;
    _914 = _879;
    _915 = _880;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _920 = float((uint)_474);
    if (!(_920 < _viewDir.w)) {
      if (!(_920 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _929 = _913;
        _930 = _914;
        _931 = _915;
      } else {
        _929 = 0.0f;
        _930 = 0.0f;
        _931 = 0.0f;
      }
    } else {
      _929 = 0.0f;
      _930 = 0.0f;
      _931 = 0.0f;
    }
  } else {
    _929 = _913;
    _930 = _914;
    _931 = _915;
  }
  float _941 = exp2(log2(_929 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _942 = exp2(log2(_930 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _943 = exp2(log2(_931 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_941 * 18.6875f) + 1.0f)) * ((_941 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_942 * 18.6875f) + 1.0f)) * ((_942 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_943 * 18.6875f) + 1.0f)) * ((_943 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _487;
  return SV_Target;
}

