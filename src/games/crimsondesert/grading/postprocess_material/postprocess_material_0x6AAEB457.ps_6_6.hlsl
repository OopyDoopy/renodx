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
  int _33 = WaveReadLaneFirst(_materialIndex);
  float _41 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))]._learningEffectRatio);
  int _46 = WaveReadLaneFirst(_materialIndex);
  int _54 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))]._noiseTexture);
  float4 _61 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_54 < (uint)65000), _54, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_41 + (TEXCOORD.x * 5.0f)), (_41 + (TEXCOORD.y * 0.10000000149011612f))));
  int2 _71; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_71.x, _71.y);
  uint _86 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_71.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_71.y))))) + 0.5f) * (((saturate(1.0f - _41) * 0.125f) * ((_61.y * 2.0f) + -0.9960784316062927f)) + TEXCOORD.y)), 0));
  int _88 = _86.x & 255;
  float _96 = (float((uint)((uint)((uint)((uint)(_86.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _97 = (float((uint)((uint)(((uint)((uint)(_86.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _99 = 1.0f - abs(_96);
  float _100 = abs(_97);
  float _101 = _99 - _100;
  float _112;
  float _113;
  float _411;
  float _412;
  float _413;
  float _414;
  float _422;
  float _423;
  float _424;
  float _425;
  float _426;
  float _427;
  float _428;
  float _451;
  float _697;
  float _698;
  float _699;
  float _819;
  float _820;
  float _821;
  float _842;
  float _843;
  float _844;
  float _877;
  float _878;
  float _879;
  float _893;
  float _894;
  float _895;
  if (!(_101 >= 0.0f)) {
    _112 = (select((_96 >= 0.0f), 1.0f, -1.0f) * (1.0f - _100));
    _113 = (select((_97 >= 0.0f), 1.0f, -1.0f) * _99);
  } else {
    _112 = _96;
    _113 = _97;
  }
  float _115 = rsqrt(dot(float3(_112, _113, _101), float3(_112, _113, _101)));
  float _116 = _115 * _112;
  float _117 = _115 * _113;
  float _118 = _115 * _101;
  float _120 = rsqrt(dot(float3(_116, _117, _118), float3(_116, _117, _118)));
  float _121 = _120 * _116;
  float _122 = _120 * _117;
  float _123 = _120 * _118;
  bool _127 = (_41 > 0.0010000000474974513f);
  if (_88 == _renderPassLearning) {
    if (_127) {
      float _139 = -0.0f - _viewDir.x;
      float _140 = -0.0f - _viewDir.y;
      float _141 = -0.0f - _viewDir.z;
      float _143 = saturate(dot(float3(_121, _122, _123), float3(_139, _140, _141)));
      float _144 = 1.0f - _143;
      uint _150 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _151 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _153 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_150), (int)(_151), 0));
      float4 _156 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_150), (int)(_151), 0));
      float _174 = (saturate(_156.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _175 = (saturate(_156.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _176 = (saturate(_156.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _178 = rsqrt(dot(float3(_174, _175, _176), float3(_174, _175, _176)));
      float _179 = _178 * _174;
      float _180 = _178 * _175;
      float _181 = _176 * _178;
      float _184 = (float((uint)((uint)(((uint)((uint)(_153.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _185 = (float((uint)((uint)(_153.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _188 = (_184 + _185) * 0.5f;
      float _189 = (_184 - _185) * 0.5f;
      float _193 = (1.0f - abs(_188)) - abs(_189);
      float _195 = rsqrt(dot(float3(_188, _189, _193), float3(_188, _189, _193)));
      float _196 = _195 * _188;
      float _197 = _195 * _189;
      float _198 = _195 * _193;
      float _200 = select((_181 >= 0.0f), 1.0f, -1.0f);
      float _203 = -0.0f - (1.0f / (_200 + _181));
      float _204 = _180 * _203;
      float _205 = _204 * _179;
      float _206 = _200 * _179;
      float _215 = mad(_198, _179, mad(_197, _205, ((((_206 * _179) * _203) + 1.0f) * _196)));
      float _219 = mad(_198, _180, mad(_197, (_200 + (_204 * _180)), ((_196 * _200) * _205)));
      float _223 = mad(_198, _181, mad(_197, (-0.0f - _180), (-0.0f - (_206 * _196))));
      float _225 = rsqrt(dot(float3(_215, _219, _223), float3(_215, _219, _223)));
      float _229 = dot(float3((_225 * _215), (_225 * _219), (_225 * _223)), float3(_139, _140, _141));
      float _230 = 1.0f - _229;
      int _231 = WaveReadLaneFirst(_materialIndex);
      int _239 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))]._learningEffectColor);
      float _242 = float((uint)((uint)(((uint)((uint)(_239)) >> 16) & 255)));
      float _245 = float((uint)((uint)(((uint)((uint)(_239)) >> 8) & 255)));
      float _247 = float((uint)((uint)(_239 & 255)));
      float _277 = max(0.0010000000474974513f, _exposure0.x);
      float _292 = saturate((abs(sin(((_123 * 2.0f) + (TEXCOORD.y * 500.0f)) + (_time.x * 10.0f))) * 3.0f) + -2.0f);
      float _316 = _143 * _229;
      float _318 = ((saturate((abs(sin(((_122 * 2.0f) + (TEXCOORD.y * 10.0f)) - (_time.x * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_121 * 0.25f) + (TEXCOORD.y * 25.0f)) + (_time.x * 1.2000000476837158f))) * 3.0f) + -1.0f) - _292)) + _292) * (_316 * _316);
      float _319 = dot(float3(_29.x, _29.y, _29.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _323 = _318 * (_319 + (select(((_242 * 0.003921568859368563f) < 0.040449999272823334f), (_242 * 0.0003035269910469651f), exp2(log2((_242 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _324 = _318 * (_319 + (select(((_245 * 0.003921568859368563f) < 0.040449999272823334f), (_245 * 0.0003035269910469651f), exp2(log2((_245 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _325 = _318 * (_319 + (select(((_247 * 0.003921568859368563f) < 0.040449999272823334f), (_247 * 0.0003035269910469651f), exp2(log2((_247 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _330 = exp2(log2(_230 * _144) * 3.0f) * 10.0f;
      float _334 = (_330 * _323) + _323;
      float _335 = (_330 * _324) + _324;
      float _336 = (_330 * _325) + _325;
      float _339 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float4 _349 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
      float _358 = saturate((_nearFarProj.x / max(1.0000000116860974e-07f, _349.x)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _339.x)));
      float _365 = (saturate(1.0f - abs((_41 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_358 < 1.0f) {
        float _369 = log2(1.0f - _358);
        float _375 = (pow(_358, 3.0f)) * exp2(_369 * 8.0f);
        float _378 = (_375 * 600.0f) / _277;
        _411 = ((_378 + _334) * _365);
        _412 = ((_378 + _335) * _365);
        _413 = ((((_375 * 1800.0f) / _277) + _336) * _365);
        _414 = saturate(exp2(_369 * 3.0f) * _41);
      } else {
        if (_88 == _renderPassAimHighlight) {
          float _397 = ((_230 - _144) * 0.4000000059604645f) + _144;
          _411 = ((((_397 * 0.800000011920929f) / _277) + _334) * _365);
          _412 = ((((_397 * 1.2000000476837158f) / _277) + _335) * _365);
          _413 = ((((_397 * 2.0f) / _277) + _336) * _365);
          _414 = _41;
        } else {
          _411 = _29.x;
          _412 = _29.y;
          _413 = _29.z;
          _414 = 0.0f;
        }
      }
      float _417 = ((_41 * 3.0f) * _414) + 1.0f;
      _422 = (_417 * _29.x);
      _423 = (_417 * _29.y);
      _424 = (_417 * _29.z);
      _425 = _411;
      _426 = _412;
      _427 = _413;
      _428 = _414;
    } else {
      _422 = _29.x;
      _423 = _29.y;
      _424 = _29.z;
      _425 = _29.x;
      _426 = _29.y;
      _427 = _29.z;
      _428 = 0.0f;
    }
  } else {
    if ((_127) && ((_88 == _renderPassAimHighlight))) {
      float _139 = -0.0f - _viewDir.x;
      float _140 = -0.0f - _viewDir.y;
      float _141 = -0.0f - _viewDir.z;
      float _143 = saturate(dot(float3(_121, _122, _123), float3(_139, _140, _141)));
      float _144 = 1.0f - _143;
      uint _150 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _151 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _153 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_150), (int)(_151), 0));
      float4 _156 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_150), (int)(_151), 0));
      float _174 = (saturate(_156.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _175 = (saturate(_156.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _176 = (saturate(_156.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _178 = rsqrt(dot(float3(_174, _175, _176), float3(_174, _175, _176)));
      float _179 = _178 * _174;
      float _180 = _178 * _175;
      float _181 = _176 * _178;
      float _184 = (float((uint)((uint)(((uint)((uint)(_153.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _185 = (float((uint)((uint)(_153.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _188 = (_184 + _185) * 0.5f;
      float _189 = (_184 - _185) * 0.5f;
      float _193 = (1.0f - abs(_188)) - abs(_189);
      float _195 = rsqrt(dot(float3(_188, _189, _193), float3(_188, _189, _193)));
      float _196 = _195 * _188;
      float _197 = _195 * _189;
      float _198 = _195 * _193;
      float _200 = select((_181 >= 0.0f), 1.0f, -1.0f);
      float _203 = -0.0f - (1.0f / (_200 + _181));
      float _204 = _180 * _203;
      float _205 = _204 * _179;
      float _206 = _200 * _179;
      float _215 = mad(_198, _179, mad(_197, _205, ((((_206 * _179) * _203) + 1.0f) * _196)));
      float _219 = mad(_198, _180, mad(_197, (_200 + (_204 * _180)), ((_196 * _200) * _205)));
      float _223 = mad(_198, _181, mad(_197, (-0.0f - _180), (-0.0f - (_206 * _196))));
      float _225 = rsqrt(dot(float3(_215, _219, _223), float3(_215, _219, _223)));
      float _229 = dot(float3((_225 * _215), (_225 * _219), (_225 * _223)), float3(_139, _140, _141));
      float _230 = 1.0f - _229;
      int _231 = WaveReadLaneFirst(_materialIndex);
      int _239 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))]._learningEffectColor);
      float _242 = float((uint)((uint)(((uint)((uint)(_239)) >> 16) & 255)));
      float _245 = float((uint)((uint)(((uint)((uint)(_239)) >> 8) & 255)));
      float _247 = float((uint)((uint)(_239 & 255)));
      float _277 = max(0.0010000000474974513f, _exposure0.x);
      float _292 = saturate((abs(sin(((_123 * 2.0f) + (TEXCOORD.y * 500.0f)) + (_time.x * 10.0f))) * 3.0f) + -2.0f);
      float _316 = _143 * _229;
      float _318 = ((saturate((abs(sin(((_122 * 2.0f) + (TEXCOORD.y * 10.0f)) - (_time.x * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_121 * 0.25f) + (TEXCOORD.y * 25.0f)) + (_time.x * 1.2000000476837158f))) * 3.0f) + -1.0f) - _292)) + _292) * (_316 * _316);
      float _319 = dot(float3(_29.x, _29.y, _29.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _323 = _318 * (_319 + (select(((_242 * 0.003921568859368563f) < 0.040449999272823334f), (_242 * 0.0003035269910469651f), exp2(log2((_242 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _324 = _318 * (_319 + (select(((_245 * 0.003921568859368563f) < 0.040449999272823334f), (_245 * 0.0003035269910469651f), exp2(log2((_245 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _325 = _318 * (_319 + (select(((_247 * 0.003921568859368563f) < 0.040449999272823334f), (_247 * 0.0003035269910469651f), exp2(log2((_247 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      float _330 = exp2(log2(_230 * _144) * 3.0f) * 10.0f;
      float _334 = (_330 * _323) + _323;
      float _335 = (_330 * _324) + _324;
      float _336 = (_330 * _325) + _325;
      float _339 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float4 _349 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
      float _358 = saturate((_nearFarProj.x / max(1.0000000116860974e-07f, _349.x)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _339.x)));
      float _365 = (saturate(1.0f - abs((_41 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_358 < 1.0f) {
        float _369 = log2(1.0f - _358);
        float _375 = (pow(_358, 3.0f)) * exp2(_369 * 8.0f);
        float _378 = (_375 * 600.0f) / _277;
        _411 = ((_378 + _334) * _365);
        _412 = ((_378 + _335) * _365);
        _413 = ((((_375 * 1800.0f) / _277) + _336) * _365);
        _414 = saturate(exp2(_369 * 3.0f) * _41);
      } else {
        if (_88 == _renderPassAimHighlight) {
          float _397 = ((_230 - _144) * 0.4000000059604645f) + _144;
          _411 = ((((_397 * 0.800000011920929f) / _277) + _334) * _365);
          _412 = ((((_397 * 1.2000000476837158f) / _277) + _335) * _365);
          _413 = ((((_397 * 2.0f) / _277) + _336) * _365);
          _414 = _41;
        } else {
          _411 = _29.x;
          _412 = _29.y;
          _413 = _29.z;
          _414 = 0.0f;
        }
      }
      float _417 = ((_41 * 3.0f) * _414) + 1.0f;
      _422 = (_417 * _29.x);
      _423 = (_417 * _29.y);
      _424 = (_417 * _29.z);
      _425 = _411;
      _426 = _412;
      _427 = _413;
      _428 = _414;
    } else {
      _422 = _29.x;
      _423 = _29.y;
      _424 = _29.z;
      _425 = _29.x;
      _426 = _29.y;
      _427 = _29.z;
      _428 = 0.0f;
    }
  }
  float _435 = (_428 * (_425 - _422)) + _422;
  float _436 = (_428 * (_426 - _423)) + _423;
  float _437 = (_428 * (_427 - _424)) + _424;
  uint _438 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _445 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_438), 0));
    _451 = (float((uint)((uint)(_445.x & 127))) + 0.5f);
  } else {
    _451 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_435, _436, _437));
    _819 = output_color.x;
    _820 = output_color.y;
    _821 = output_color.z;
  } else {
    _819 = _435;
    _820 = _436;
    _821 = _437;
  }
  if (_etcParams.y > 1.0f) {
    float _832 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _833 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _837 = saturate(1.0f - (dot(float2(_832, _833), float2(_832, _833)) * saturate(_etcParams.y + -1.0f)));
    _842 = (_837 * _819);
    _843 = (_837 * _820);
    _844 = (_837 * _821);
  } else {
    _842 = _819;
    _843 = _820;
    _844 = _821;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _877 = select((_842 <= 0.0031308000907301903f), (_842 * 12.920000076293945f), (((pow(_842, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _878 = select((_843 <= 0.0031308000907301903f), (_843 * 12.920000076293945f), (((pow(_843, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _879 = select((_844 <= 0.0031308000907301903f), (_844 * 12.920000076293945f), (((pow(_844, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _877 = _842;
    _878 = _843;
    _879 = _844;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _884 = float((uint)_438);
    if (!(_884 < _viewDir.w)) {
      if (!(_884 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _893 = _877;
        _894 = _878;
        _895 = _879;
      } else {
        _893 = 0.0f;
        _894 = 0.0f;
        _895 = 0.0f;
      }
    } else {
      _893 = 0.0f;
      _894 = 0.0f;
      _895 = 0.0f;
    }
  } else {
    _893 = _877;
    _894 = _878;
    _895 = _879;
  }
  SV_Target.x = _893;
  SV_Target.y = _894;
  SV_Target.z = _895;
  SV_Target.w = _451;
  return SV_Target;
}

