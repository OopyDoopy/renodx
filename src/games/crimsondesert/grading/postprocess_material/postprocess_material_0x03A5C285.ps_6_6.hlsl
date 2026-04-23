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
  float _57 = (pow(_47.x, 0.012683313339948654f));
  float _58 = (pow(_47.y, 0.012683313339948654f));
  float _59 = (pow(_47.z, 0.012683313339948654f));
  float _81 = exp2(log2(max(0.0f, (_57 + -0.8359375f)) / (18.8515625f - (_57 * 18.6875f))) * 6.277394771575928f);
  float _82 = exp2(log2(max(0.0f, (_58 + -0.8359375f)) / (18.8515625f - (_58 * 18.6875f))) * 6.277394771575928f);
  float _83 = exp2(log2(max(0.0f, (_59 + -0.8359375f)) / (18.8515625f - (_59 * 18.6875f))) * 6.277394771575928f);
  float _84 = _81 * 10000.0f;
  float _85 = _82 * 10000.0f;
  float _86 = _83 * 10000.0f;
  float _138;
  float _139;
  float _557;
  float _558;
  float _559;
  float _573;
  float _819;
  float _820;
  float _821;
  float _941;
  float _942;
  float _943;
  float _964;
  float _965;
  float _966;
  float _999;
  float _1000;
  float _1001;
  float _1015;
  float _1016;
  float _1017;
  if (_44 == _renderPassInteraction) {
    int _96 = WaveReadLaneFirst(_materialIndex);
    int _104 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._lineTex);
    float4 _111 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_104 < (uint)65000), _104, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f)));
    float _115 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float4 _129 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    _138 = _111.x;
    _139 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _115.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _129.x))));
  } else {
    _138 = 0.0f;
    _139 = 0.0f;
  }
  if (_44 == _renderPassInteraction) {
    int _155 = int(_customRenderPassSizeInvSize.y * TEXCOORD.y);
    float4 _157 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _155, 0));
    float _159 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    float _160 = TEXCOORD.x - _159;
    float4 _163 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_160 * _customRenderPassSizeInvSize.x), _155, 0));
    float _166 = (_160 * 2.0f) + -1.0f;
    float _168 = 1.0f - (TEXCOORD.y * 2.0f);
    float _169 = max(1.0000000116860974e-07f, _163.x);
    float _205 = mad((_invViewProj[3].z), _169, mad((_invViewProj[3].y), _168, ((_invViewProj[3].x) * _166))) + (_invViewProj[3].w);
    float _209 = _159 + TEXCOORD.x;
    float4 _212 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_209 * _customRenderPassSizeInvSize.x), _155, 0));
    float _215 = (_209 * 2.0f) + -1.0f;
    float _216 = max(1.0000000116860974e-07f, _212.x);
    float _232 = mad((_invViewProj[3].z), _216, mad((_invViewProj[3].y), _168, ((_invViewProj[3].x) * _215))) + (_invViewProj[3].w);
    float _236 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    float _237 = TEXCOORD.y - _236;
    int _240 = int(_customRenderPassSizeInvSize.x * TEXCOORD.x);
    float4 _242 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_240, int(_237 * _customRenderPassSizeInvSize.y), 0));
    float _245 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _247 = 1.0f - (_237 * 2.0f);
    float _248 = max(1.0000000116860974e-07f, _242.x);
    float _249 = (_invViewProj[0].x) * _245;
    float _253 = (_invViewProj[1].x) * _245;
    float _257 = (_invViewProj[2].x) * _245;
    float _261 = (_invViewProj[3].x) * _245;
    float _264 = mad((_invViewProj[3].z), _248, mad((_invViewProj[3].y), _247, _261)) + (_invViewProj[3].w);
    float _268 = _236 + TEXCOORD.y;
    float4 _271 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_240, int(_268 * _customRenderPassSizeInvSize.y), 0));
    float _274 = 1.0f - (_268 * 2.0f);
    float _275 = max(1.0000000116860974e-07f, _271.x);
    float _287 = mad((_invViewProj[3].z), _275, mad((_invViewProj[3].y), _274, _261)) + (_invViewProj[3].w);
    float _291 = ((mad((_invViewProj[0].z), _275, mad((_invViewProj[0].y), _274, _249)) + (_invViewProj[0].w)) / _287) - ((mad((_invViewProj[0].z), _248, mad((_invViewProj[0].y), _247, _249)) + (_invViewProj[0].w)) / _264);
    float _292 = ((mad((_invViewProj[1].z), _275, mad((_invViewProj[1].y), _274, _253)) + (_invViewProj[1].w)) / _287) - ((mad((_invViewProj[1].z), _248, mad((_invViewProj[1].y), _247, _253)) + (_invViewProj[1].w)) / _264);
    float _293 = ((mad((_invViewProj[2].z), _275, mad((_invViewProj[2].y), _274, _257)) + (_invViewProj[2].w)) / _287) - ((mad((_invViewProj[2].z), _248, mad((_invViewProj[2].y), _247, _257)) + (_invViewProj[2].w)) / _264);
    float _294 = ((mad((_invViewProj[0].z), _216, mad((_invViewProj[0].y), _168, ((_invViewProj[0].x) * _215))) + (_invViewProj[0].w)) / _232) - ((mad((_invViewProj[0].z), _169, mad((_invViewProj[0].y), _168, ((_invViewProj[0].x) * _166))) + (_invViewProj[0].w)) / _205);
    float _295 = ((mad((_invViewProj[1].z), _216, mad((_invViewProj[1].y), _168, ((_invViewProj[1].x) * _215))) + (_invViewProj[1].w)) / _232) - ((mad((_invViewProj[1].z), _169, mad((_invViewProj[1].y), _168, ((_invViewProj[1].x) * _166))) + (_invViewProj[1].w)) / _205);
    float _296 = ((mad((_invViewProj[2].z), _216, mad((_invViewProj[2].y), _168, ((_invViewProj[2].x) * _215))) + (_invViewProj[2].w)) / _232) - ((mad((_invViewProj[2].z), _169, mad((_invViewProj[2].y), _168, ((_invViewProj[2].x) * _166))) + (_invViewProj[2].w)) / _205);
    float _299 = (_293 * _295) - (_292 * _296);
    float _302 = (_291 * _296) - (_293 * _294);
    float _305 = (_292 * _294) - (_291 * _295);
    float _307 = rsqrt(dot(float3(_299, _302, _305), float3(_299, _302, _305)));
    float _308 = _299 * _307;
    float _309 = _302 * _307;
    float _310 = _305 * _307;
    float _319 = saturate(dot(float3(_308, _309, _310), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _335 = frac(_time.x * 0.4000000059604645f);
    float _339 = abs((1.9989999532699585f - _319) - (_335 * 2.5f));
    float _342 = saturate(1.0f - (_339 * 5.0f));
    float _350 = saturate((saturate(((2.0f - _319) * _138) + exp2(log2(1.0f - _319) * 4.0f)) * _157.x) * (_342 - (_342 * _335)));
    float _351 = _350 * _139;
    float _357 = _157.x * 50.0f;
    float _359 = saturate(_357 * _357);
    float _365 = saturate(1.0f - (_339 * 1.25f)) * _359;
    float _366 = _365 * 20.0f;
    float _374 = (_exposure2.x * 5000.0f) * (lerp(_351, _350, 2.0f));
    float _375 = (_359 - (_359 * _139)) * _exposure2.x;
    float _376 = _375 * 2.0f;
    float _384 = (_375 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_308, _309, _310), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f));
    float _385 = _366 + 10000.0f;
    _557 = ((((_374 - (_365 * _84)) + _384) + (_385 * _81)) + ((1.0f - (_366 * _81)) * _376));
    _558 = ((((_374 - (_365 * _85)) + _384) + (_385 * _82)) + ((1.0f - (_366 * _82)) * _376));
    _559 = ((((_374 - (_365 * _86)) + _384) + (_385 * _83)) + ((1.0f - (_366 * _83)) * _376));
  } else {
    if (_44 == _renderPassDetectObjective) {
      uint _411 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _412 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _414 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_411), (int)(_412), 0));
      float4 _417 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_411), (int)(_412), 0));
      float _435 = (saturate(_417.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _436 = (saturate(_417.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _437 = (saturate(_417.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _439 = rsqrt(dot(float3(_435, _436, _437), float3(_435, _436, _437)));
      float _440 = _439 * _435;
      float _441 = _439 * _436;
      float _442 = _437 * _439;
      float _445 = (float((uint)((uint)(((uint)((uint)(_414.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _446 = (float((uint)((uint)(_414.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _449 = (_445 + _446) * 0.5f;
      float _450 = (_445 - _446) * 0.5f;
      float _454 = (1.0f - abs(_449)) - abs(_450);
      float _456 = rsqrt(dot(float3(_449, _450, _454), float3(_449, _450, _454)));
      float _457 = _456 * _449;
      float _458 = _456 * _450;
      float _459 = _456 * _454;
      float _461 = select((_442 >= 0.0f), 1.0f, -1.0f);
      float _464 = -0.0f - (1.0f / (_461 + _442));
      float _465 = _441 * _464;
      float _466 = _465 * _440;
      float _467 = _461 * _440;
      float _476 = mad(_459, _440, mad(_458, _466, ((((_467 * _440) * _464) + 1.0f) * _457)));
      float _480 = mad(_459, _441, mad(_458, (_461 + (_465 * _441)), ((_457 * _461) * _466)));
      float _484 = mad(_459, _442, mad(_458, (-0.0f - _441), (-0.0f - (_467 * _457))));
      float _486 = rsqrt(dot(float3(_476, _480, _484), float3(_476, _480, _484)));
      float _487 = _486 * _476;
      float _488 = _486 * _480;
      float _489 = _486 * _484;
      float _498 = saturate(dot(float3(_487, _488, _489), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _515 = _time.x - _interactionTime;
      float _522 = abs((1.9989999532699585f - _498) - ((pow(_515, 0.5f)) * 2.25f));
      float _525 = saturate(1.0f - (_522 * 40.0f));
      float _541 = (saturate(exp2(log2(1.0f - abs(dot(float3(_487, _488, _489), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 0.800000011920929f)) * _139) * saturate(1.0f - (_522 * 3.3333332538604736f));
      float _542 = _exposure2.x * 25.0f;
      float _549 = _542 * saturate((saturate(((2.0f - _498) * _138) + exp2(log2(1.0f - _498) * 4.0f)) * _139) * (_525 - ((_515 * 0.8999999761581421f) * _525)));
      _557 = ((_549 + _84) + ((_542 - _84) * _541));
      _558 = ((_549 + _85) + ((_542 - _85) * _541));
      _559 = ((_549 + _86) + ((_542 - _86) * _541));
    } else {
      _557 = _84;
      _558 = _85;
      _559 = _86;
    }
  }
  uint _560 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _567 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_560), 0));
    _573 = (float((uint)((uint)(_567.x & 127))) + 0.5f);
  } else {
    _573 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_557, _558, _559));
    _941 = output_color.x;
    _942 = output_color.y;
    _943 = output_color.z;
  } else {
    _941 = _557;
    _942 = _558;
    _943 = _559;
  }
  if (_etcParams.y > 1.0f) {
    float _954 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _955 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _959 = saturate(1.0f - (dot(float2(_954, _955), float2(_954, _955)) * saturate(_etcParams.y + -1.0f)));
    _964 = (_959 * _941);
    _965 = (_959 * _942);
    _966 = (_959 * _943);
  } else {
    _964 = _941;
    _965 = _942;
    _966 = _943;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _999 = select((_964 <= 0.0031308000907301903f), (_964 * 12.920000076293945f), (((pow(_964, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1000 = select((_965 <= 0.0031308000907301903f), (_965 * 12.920000076293945f), (((pow(_965, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1001 = select((_966 <= 0.0031308000907301903f), (_966 * 12.920000076293945f), (((pow(_966, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _999 = _964;
    _1000 = _965;
    _1001 = _966;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1006 = float((uint)_560);
    if (!(_1006 < _viewDir.w)) {
      if (!(_1006 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1015 = _999;
        _1016 = _1000;
        _1017 = _1001;
      } else {
        _1015 = 0.0f;
        _1016 = 0.0f;
        _1017 = 0.0f;
      }
    } else {
      _1015 = 0.0f;
      _1016 = 0.0f;
      _1017 = 0.0f;
    }
  } else {
    _1015 = _999;
    _1016 = _1000;
    _1017 = _1001;
  }
  float _1027 = exp2(log2(_1015 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1028 = exp2(log2(_1016 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1029 = exp2(log2(_1017 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1027 * 18.6875f) + 1.0f)) * ((_1027 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1028 * 18.6875f) + 1.0f)) * ((_1028 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1029 * 18.6875f) + 1.0f)) * ((_1029 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _573;
  return SV_Target;
}

