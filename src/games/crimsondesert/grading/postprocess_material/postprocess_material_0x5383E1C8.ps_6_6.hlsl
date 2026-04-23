#include "../tonemap.hlsli"

struct PostProcessInteraction_CDStruct {
  uint _lineTex;
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

ConstantBuffer<PostProcessInteraction_CDStruct> BindlessParameters_PostProcessInteraction_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25[36];
  int2 _27; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_27.x, _27.y);
  uint _42 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_27.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_27.y))))) + 0.5f) * TEXCOORD.y), 0));
  int _44 = _42.x & 255;
  float4 _47 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _102;
  float _103;
  float _520;
  float _521;
  float _522;
  float _536;
  float _782;
  float _783;
  float _784;
  float _904;
  float _905;
  float _906;
  float _927;
  float _928;
  float _929;
  float _962;
  float _963;
  float _964;
  float _978;
  float _979;
  float _980;
  if (_44 == _renderPassInteraction) {
    int _60 = WaveReadLaneFirst(_materialIndex);
    int _68 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._lineTex);
    float4 _75 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_68 < (uint)65000), _68, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f)));
    float _79 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float4 _93 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    _102 = _75.x;
    _103 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _79.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _93.x))));
  } else {
    _102 = 0.0f;
    _103 = 0.0f;
  }
  if (_44 == _renderPassInteraction) {
    int _119 = int(_customRenderPassSizeInvSize.y * TEXCOORD.y);
    float4 _121 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _119, 0));
    float _123 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    float _124 = TEXCOORD.x - _123;
    float4 _127 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_124 * _customRenderPassSizeInvSize.x), _119, 0));
    float _130 = (_124 * 2.0f) + -1.0f;
    float _132 = 1.0f - (TEXCOORD.y * 2.0f);
    float _133 = max(1.0000000116860974e-07f, _127.x);
    float _169 = mad((_invViewProj[3].z), _133, mad((_invViewProj[3].y), _132, ((_invViewProj[3].x) * _130))) + (_invViewProj[3].w);
    float _173 = _123 + TEXCOORD.x;
    float4 _176 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_173 * _customRenderPassSizeInvSize.x), _119, 0));
    float _179 = (_173 * 2.0f) + -1.0f;
    float _180 = max(1.0000000116860974e-07f, _176.x);
    float _196 = mad((_invViewProj[3].z), _180, mad((_invViewProj[3].y), _132, ((_invViewProj[3].x) * _179))) + (_invViewProj[3].w);
    float _200 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    float _201 = TEXCOORD.y - _200;
    int _204 = int(_customRenderPassSizeInvSize.x * TEXCOORD.x);
    float4 _206 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_204, int(_201 * _customRenderPassSizeInvSize.y), 0));
    float _209 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _211 = 1.0f - (_201 * 2.0f);
    float _212 = max(1.0000000116860974e-07f, _206.x);
    float _213 = (_invViewProj[0].x) * _209;
    float _217 = (_invViewProj[1].x) * _209;
    float _221 = (_invViewProj[2].x) * _209;
    float _225 = (_invViewProj[3].x) * _209;
    float _228 = mad((_invViewProj[3].z), _212, mad((_invViewProj[3].y), _211, _225)) + (_invViewProj[3].w);
    float _232 = _200 + TEXCOORD.y;
    float4 _235 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_204, int(_232 * _customRenderPassSizeInvSize.y), 0));
    float _238 = 1.0f - (_232 * 2.0f);
    float _239 = max(1.0000000116860974e-07f, _235.x);
    float _251 = mad((_invViewProj[3].z), _239, mad((_invViewProj[3].y), _238, _225)) + (_invViewProj[3].w);
    float _255 = ((mad((_invViewProj[0].z), _239, mad((_invViewProj[0].y), _238, _213)) + (_invViewProj[0].w)) / _251) - ((mad((_invViewProj[0].z), _212, mad((_invViewProj[0].y), _211, _213)) + (_invViewProj[0].w)) / _228);
    float _256 = ((mad((_invViewProj[1].z), _239, mad((_invViewProj[1].y), _238, _217)) + (_invViewProj[1].w)) / _251) - ((mad((_invViewProj[1].z), _212, mad((_invViewProj[1].y), _211, _217)) + (_invViewProj[1].w)) / _228);
    float _257 = ((mad((_invViewProj[2].z), _239, mad((_invViewProj[2].y), _238, _221)) + (_invViewProj[2].w)) / _251) - ((mad((_invViewProj[2].z), _212, mad((_invViewProj[2].y), _211, _221)) + (_invViewProj[2].w)) / _228);
    float _258 = ((mad((_invViewProj[0].z), _180, mad((_invViewProj[0].y), _132, ((_invViewProj[0].x) * _179))) + (_invViewProj[0].w)) / _196) - ((mad((_invViewProj[0].z), _133, mad((_invViewProj[0].y), _132, ((_invViewProj[0].x) * _130))) + (_invViewProj[0].w)) / _169);
    float _259 = ((mad((_invViewProj[1].z), _180, mad((_invViewProj[1].y), _132, ((_invViewProj[1].x) * _179))) + (_invViewProj[1].w)) / _196) - ((mad((_invViewProj[1].z), _133, mad((_invViewProj[1].y), _132, ((_invViewProj[1].x) * _130))) + (_invViewProj[1].w)) / _169);
    float _260 = ((mad((_invViewProj[2].z), _180, mad((_invViewProj[2].y), _132, ((_invViewProj[2].x) * _179))) + (_invViewProj[2].w)) / _196) - ((mad((_invViewProj[2].z), _133, mad((_invViewProj[2].y), _132, ((_invViewProj[2].x) * _130))) + (_invViewProj[2].w)) / _169);
    float _263 = (_257 * _259) - (_256 * _260);
    float _266 = (_255 * _260) - (_257 * _258);
    float _269 = (_256 * _258) - (_255 * _259);
    float _271 = rsqrt(dot(float3(_263, _266, _269), float3(_263, _266, _269)));
    float _272 = _263 * _271;
    float _273 = _266 * _271;
    float _274 = _269 * _271;
    float _283 = saturate(dot(float3(_272, _273, _274), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _299 = frac(_time.x * 0.4000000059604645f);
    float _303 = abs((1.9989999532699585f - _283) - (_299 * 2.5f));
    float _306 = saturate(1.0f - (_303 * 5.0f));
    float _314 = saturate((saturate(((2.0f - _283) * _102) + exp2(log2(1.0f - _283) * 4.0f)) * _121.x) * (_306 - (_306 * _299)));
    float _315 = _314 * _103;
    float _321 = _121.x * 50.0f;
    float _323 = saturate(_321 * _321);
    float _329 = saturate(1.0f - (_303 * 1.25f)) * _323;
    float _330 = _329 * 0.0020000000949949026f;
    float _331 = _330 * _47.x;
    float _332 = _330 * _47.y;
    float _333 = _330 * _47.z;
    float _338 = (_exposure2.x * 5000.0f) * (lerp(_315, _314, 2.0f));
    float _339 = (_323 - (_323 * _103)) * _exposure2.x;
    float _340 = _339 * 2.0f;
    float _348 = (_339 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_272, _273, _274), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f));
    _520 = (((((_338 + _47.x) - (_329 * _47.x)) + _331) + _348) + ((1.0f - _331) * _340));
    _521 = (((((_338 + _47.y) - (_329 * _47.y)) + _332) + _348) + ((1.0f - _332) * _340));
    _522 = (((((_47.z - (_329 * _47.z)) + _338) + _333) + _348) + ((1.0f - _333) * _340));
  } else {
    if (_44 == _renderPassDetectObjective) {
      uint _374 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _375 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _377 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_374), (int)(_375), 0));
      float4 _380 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_374), (int)(_375), 0));
      float _398 = (saturate(_380.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _399 = (saturate(_380.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _400 = (saturate(_380.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _402 = rsqrt(dot(float3(_398, _399, _400), float3(_398, _399, _400)));
      float _403 = _402 * _398;
      float _404 = _402 * _399;
      float _405 = _400 * _402;
      float _408 = (float((uint)((uint)(((uint)((uint)(_377.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _409 = (float((uint)((uint)(_377.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _412 = (_408 + _409) * 0.5f;
      float _413 = (_408 - _409) * 0.5f;
      float _417 = (1.0f - abs(_412)) - abs(_413);
      float _419 = rsqrt(dot(float3(_412, _413, _417), float3(_412, _413, _417)));
      float _420 = _419 * _412;
      float _421 = _419 * _413;
      float _422 = _419 * _417;
      float _424 = select((_405 >= 0.0f), 1.0f, -1.0f);
      float _427 = -0.0f - (1.0f / (_424 + _405));
      float _428 = _404 * _427;
      float _429 = _428 * _403;
      float _430 = _424 * _403;
      float _439 = mad(_422, _403, mad(_421, _429, ((((_430 * _403) * _427) + 1.0f) * _420)));
      float _443 = mad(_422, _404, mad(_421, (_424 + (_428 * _404)), ((_420 * _424) * _429)));
      float _447 = mad(_422, _405, mad(_421, (-0.0f - _404), (-0.0f - (_430 * _420))));
      float _449 = rsqrt(dot(float3(_439, _443, _447), float3(_439, _443, _447)));
      float _450 = _449 * _439;
      float _451 = _449 * _443;
      float _452 = _449 * _447;
      float _461 = saturate(dot(float3(_450, _451, _452), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _478 = _time.x - _interactionTime;
      float _485 = abs((1.9989999532699585f - _461) - ((pow(_478, 0.5f)) * 2.25f));
      float _488 = saturate(1.0f - (_485 * 40.0f));
      float _504 = (saturate(exp2(log2(1.0f - abs(dot(float3(_450, _451, _452), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 0.800000011920929f)) * _103) * saturate(1.0f - (_485 * 3.3333332538604736f));
      float _505 = _exposure2.x * 25.0f;
      float _512 = _505 * saturate((saturate(((2.0f - _461) * _102) + exp2(log2(1.0f - _461) * 4.0f)) * _103) * (_488 - ((_478 * 0.8999999761581421f) * _488)));
      _520 = ((_512 + _47.x) + ((_505 - _47.x) * _504));
      _521 = ((_512 + _47.y) + ((_505 - _47.y) * _504));
      _522 = ((_512 + _47.z) + ((_505 - _47.z) * _504));
    } else {
      _520 = _47.x;
      _521 = _47.y;
      _522 = _47.z;
    }
  }
  uint _523 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _530 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_523), 0));
    _536 = (float((uint)((uint)(_530.x & 127))) + 0.5f);
  } else {
    _536 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_520, _521, _522));
    _904 = output_color.x;
    _905 = output_color.y;
    _906 = output_color.z;
  } else {
    _904 = _520;
    _905 = _521;
    _906 = _522;
  }
  if (_etcParams.y > 1.0f) {
    float _917 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _918 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _922 = saturate(1.0f - (dot(float2(_917, _918), float2(_917, _918)) * saturate(_etcParams.y + -1.0f)));
    _927 = (_922 * _904);
    _928 = (_922 * _905);
    _929 = (_922 * _906);
  } else {
    _927 = _904;
    _928 = _905;
    _929 = _906;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _962 = select((_927 <= 0.0031308000907301903f), (_927 * 12.920000076293945f), (((pow(_927, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _963 = select((_928 <= 0.0031308000907301903f), (_928 * 12.920000076293945f), (((pow(_928, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _964 = select((_929 <= 0.0031308000907301903f), (_929 * 12.920000076293945f), (((pow(_929, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _962 = _927;
    _963 = _928;
    _964 = _929;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _969 = float((uint)_523);
    if (!(_969 < _viewDir.w)) {
      if (!(_969 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _978 = _962;
        _979 = _963;
        _980 = _964;
      } else {
        _978 = 0.0f;
        _979 = 0.0f;
        _980 = 0.0f;
      }
    } else {
      _978 = 0.0f;
      _979 = 0.0f;
      _980 = 0.0f;
    }
  } else {
    _978 = _962;
    _979 = _963;
    _980 = _964;
  }
  SV_Target.x = _978;
  SV_Target.y = _979;
  SV_Target.z = _980;
  SV_Target.w = _536;
  return SV_Target;
}

