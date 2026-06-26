struct PostProcessRematchLoading_CDStruct {
  float _loadingRatio;
  float _loadingRadius;
  uint _loadingEdgeColor;
  uint _loadingInnerColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

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

ConstantBuffer<PostProcessRematchLoading_CDStruct> BindlessParameters_PostProcessRematchLoading_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _30 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _40 = (pow(_30.x, 0.012683313339948654f));
  float _41 = (pow(_30.y, 0.012683313339948654f));
  float _42 = (pow(_30.z, 0.012683313339948654f));
  float _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _72 = TEXCOORD.y * 2.0f;
  float _73 = 1.0f - _72;
  float _75 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _77 = max(1.0000000116860974e-07f, _75.x);
  float _113 = mad((_invViewProj[3].z), _77, mad((_invViewProj[3].y), _73, ((_invViewProj[3].x) * _71))) + (_invViewProj[3].w);
  int _117 = WaveReadLaneFirst(_materialIndex);
  float _125 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_117 < (uint)170000), _117, 0)) + 0u))]._loadingRatio);
  int _126 = WaveReadLaneFirst(_materialIndex);
  float _138 = 0.20000000298023224f / _destTargetSizAndInv.z;
  float _139 = 0.20000000298023224f / _destTargetSizAndInv.w;
  float _141 = _139 * TEXCOORD.y;
  float _142 = floor(_141);
  float _143 = _142 * 0.5f;
  float _147 = frac(abs(_143));
  float _150 = select((_143 >= (-0.0f - _143)), _147, (-0.0f - _147)) + (_138 * TEXCOORD.x);
  float _158 = frac(_150) + -0.5f;
  float _159 = frac(_141) + -0.5f;
  float _166 = saturate((sqrt((_159 * _159) + (_158 * _158)) + -0.30000001192092896f) * 49.99997329711914f);
  float _171 = 1.0f - ((_166 * _166) * (3.0f - (_166 * 2.0f)));
  uint _181 = uint(_bufferSizeAndInvSize.x * ((floor(_150) + 0.5f) / _138));
  uint _182 = uint(_bufferSizeAndInvSize.y * ((_142 + 0.5f) / _139));
  uint4 _184 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_181), (int)(_182), 0));
  float4 _187 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_181), (int)(_182), 0));
  float _205 = (saturate(_187.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _206 = (saturate(_187.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _207 = (saturate(_187.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _209 = rsqrt(dot(float3(_205, _206, _207), float3(_205, _206, _207)));
  float _210 = _209 * _205;
  float _211 = _209 * _206;
  float _212 = _207 * _209;
  float _215 = (float((uint)((uint)(((uint)((uint)(_184.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _216 = (float((uint)((uint)(_184.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _219 = (_215 + _216) * 0.5f;
  float _220 = (_215 - _216) * 0.5f;
  float _224 = (1.0f - abs(_219)) - abs(_220);
  float _226 = rsqrt(dot(float3(_219, _220, _224), float3(_219, _220, _224)));
  float _227 = _226 * _219;
  float _228 = _226 * _220;
  float _229 = _226 * _224;
  float _231 = select((_212 >= 0.0f), 1.0f, -1.0f);
  float _234 = -0.0f - (1.0f / (_231 + _212));
  float _235 = _211 * _234;
  float _236 = _235 * _210;
  float _237 = _231 * _210;
  float _246 = mad(_229, _210, mad(_228, _236, ((((_237 * _210) * _234) + 1.0f) * _227)));
  float _250 = mad(_229, _211, mad(_228, (_231 + (_235 * _211)), ((_227 * _231) * _236)));
  float _254 = mad(_229, _212, mad(_228, (-0.0f - _211), (-0.0f - (_237 * _227))));
  float _256 = rsqrt(dot(float3(_246, _250, _254), float3(_246, _250, _254)));
  float _271 = saturate(exp2(log2(select((((_75.x < 1.0000000116860974e-07f)) || ((_75.x == 1.0f))), 1.0f, (1.0f - abs(dot(float3((_256 * _246), (_256 * _250), (_256 * _254)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))))) * 4.0f) * 2.0f);
  float _277 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _313 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _277, ((_invViewProjRelative[3].x) * _71));
  float _314 = ((mad((_invViewProjRelative[0].y), _277, ((_invViewProjRelative[0].x) * _71)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _313;
  float _315 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _277, ((_invViewProjRelative[1].x) * _71))) / _313;
  float _316 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _277, ((_invViewProjRelative[2].x) * _71))) / _313;
  float _318 = rsqrt(dot(float3(_314, _315, _316), float3(_314, _315, _316)));
  float _319 = _318 * _314;
  float _321 = _318 * _316;
  float _323 = atan(_321 / _319);
  bool _326 = (_319 < 0.0f);
  bool _327 = (_319 == 0.0f);
  bool _328 = (_321 >= 0.0f);
  bool _329 = (_321 < 0.0f);
  int _343 = WaveReadLaneFirst(_materialIndex);
  int _351 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_343 < (uint)170000), _343, 0)) + 0u))]._noiseTex);
  float4 _358 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_351 < (uint)65000), _351, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_327) && (_328)), 7.5f, select(((_327) && (_329)), 2.5f, ((select(((_326) && (_329)), (_323 + -3.1415927410125732f), select(((_326) && (_328)), (_323 + 3.1415927410125732f), _323)) * 1.5915493965148926f) + 5.0f))), ((acos(_318 * _315) * 0.9549295902252197f) - (_time.x * 0.05000000074505806f))));
  float _364 = (_358.x * 2.0f) + -0.9960784316062927f;
  float _365 = (_358.y * 2.0f) + -0.9960784316062927f;
  float _377 = ((mad((_invViewProj[0].z), _77, mad((_invViewProj[0].y), _73, ((_invViewProj[0].x) * _71))) + (_invViewProj[0].w)) / _113) - _mainPosition.x;
  float _378 = ((mad((_invViewProj[1].z), _77, mad((_invViewProj[1].y), _73, ((_invViewProj[1].x) * _71))) + (_invViewProj[1].w)) / _113) - _mainPosition.y;
  float _379 = ((mad((_invViewProj[2].z), _77, mad((_invViewProj[2].y), _73, ((_invViewProj[2].x) * _71))) + (_invViewProj[2].w)) / _113) - _mainPosition.z;
  float _388 = min(max(sqrt(((_377 * _377) + (_378 * _378)) + (_379 * _379)), 1.0f), 10.0f) * saturate(_125 * 5.0f);
  float _392 = (_388 * _364) + _377;
  float _393 = (_388 * _365) + _378;
  float _394 = (_388 * (sqrt(saturate(1.0f - dot(float2(_364, _365), float2(_364, _365)))) + -0.5f)) + _379;
  float _400 = sqrt(((_392 * _392) + (_393 * _393)) + (_394 * _394));
  float _407 = saturate((1.0f - saturate(_400 / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_126 < (uint)170000), _126, 0)) + 0u))]._loadingRadius) * _125)))) * 2.0f);
  float _413 = (saturate((_125 * 10.0f) + -9.0f) * (1.0f - _407)) + _407;
  float _419 = frac((_400 * 0.029999999329447746f) - (_time.x * 0.800000011920929f));
  float _422 = saturate((1.0f - _419) * 5.0f);
  int _431 = WaveReadLaneFirst(_materialIndex);
  int _439 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._loadingInnerColor);
  float _442 = float((uint)((uint)(((uint)((uint)(_439)) >> 16) & 255)));
  float _445 = float((uint)((uint)(((uint)((uint)(_439)) >> 8) & 255)));
  float _447 = float((uint)((uint)(_439 & 255)));
  float _472 = select(((_442 * 0.003921568859368563f) < 0.040449999272823334f), (_442 * 0.0003035269910469651f), exp2(log2((_442 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _473 = select(((_445 * 0.003921568859368563f) < 0.040449999272823334f), (_445 * 0.0003035269910469651f), exp2(log2((_445 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _474 = select(((_447 * 0.003921568859368563f) < 0.040449999272823334f), (_447 * 0.0003035269910469651f), exp2(log2((_447 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _477 = (pow(_422, 4.0f));
  float _481 = (1.0f - _472) * _358.x;
  float _482 = (1.0f - _473) * _358.y;
  float _483 = (1.0f - _474) * _358.z;
  float _495 = max(0.0010000000474974513f, _exposure0.x);
  float _594;
  float _595;
  float _596;
  float _635;
  float _840;
  float _841;
  float _842;
  float _935;
  float _936;
  float _937;
  float _991;
  float _992;
  float _993;
  float _1009;
  float _1010;
  float _1011;
  float _1041;
  float _1042;
  float _1043;
  float _1057;
  float _1058;
  float _1059;
  if (((_413 > 0.0f)) && ((_413 < 1.0f))) {
    int _510 = WaveReadLaneFirst(_materialIndex);
    int _518 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_510 < (uint)170000), _510, 0)) + 0u))]._loadingEdgeColor);
    float _521 = float((uint)((uint)(((uint)((uint)(_518)) >> 16) & 255)));
    float _524 = float((uint)((uint)(((uint)((uint)(_518)) >> 8) & 255)));
    float _526 = float((uint)((uint)(_518 & 255)));
    float _551 = select(((_521 * 0.003921568859368563f) < 0.040449999272823334f), (_521 * 0.0003035269910469651f), exp2(log2((_521 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _552 = select(((_524 * 0.003921568859368563f) < 0.040449999272823334f), (_524 * 0.0003035269910469651f), exp2(log2((_524 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _553 = select(((_526 * 0.003921568859368563f) < 0.040449999272823334f), (_526 * 0.0003035269910469651f), exp2(log2((_526 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _560 = _551 * 10.0f;
    float _561 = _552 * 10.0f;
    float _562 = _553 * 10.0f;
    float _573 = (_358.x * _358.y) * _358.z;
    float _579 = max(0.0010000000474974513f, _exposure0.x);
    float _589 = saturate((1.0f - abs((_413 * 2.0f) + -1.0f)) * 4.0f) * _171;
    _594 = (_589 * (((((((1.0f - _551) * _358.x) - _560) * _271) + _560) * _573) / _579));
    _595 = (_589 * (((((((1.0f - _552) * _358.y) - _561) * _271) + _561) * _573) / _579));
    _596 = (_589 * (((((((1.0f - _553) * _358.z) - _562) * _271) + _562) * _573) / _579));
  } else {
    _594 = _67;
    _595 = _68;
    _596 = _69;
  }
  float _599 = ((1.0f - _413) * _125) + _413;
  float _600 = (((((((_125 * _125) * _125) * _171) * _271) * _413) * exp2(log2((_419 * 1.25f) * _422) * 9.0f)) * (1.0f - saturate(_400 * 0.0010000000474974513f))) + 0.0010000000474974513f;
  float _619 = (((_594 - _67) + (((((lerp(_481, _472, _477)) / _495) * _600) - _594) * _599)) * _413) + _67;
  float _620 = (((_595 - _68) + (((((lerp(_482, _473, _477)) / _495) * _600) - _595) * _599)) * _413) + _68;
  float _621 = (((_596 - _69) + (((((lerp(_483, _474, _477)) / _495) * _600) - _596) * _599)) * _413) + _69;
  uint _622 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _629 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_622), 0));
    _635 = (float((uint)((uint)(_629.x & 127))) + 0.5f);
  } else {
    _635 = 1.0f;
  }
  bool _638 = (_localToneMappingParams.w > 0.0f);
  if (_638) {
    float3 output_color = TonemapReplacer(float3(_619, _620, _621));
    _991 = output_color.x;
    _992 = output_color.y;
    _993 = output_color.z;
  } else {
    _991 = _619;
    _992 = _620;
    _993 = _621;
  }
  if (_etcParams.y > 1.0f) {
    float _999 = abs(_71);
    float _1000 = abs(_72 + -1.0f);
    float _1004 = saturate(1.0f - (dot(float2(_999, _1000), float2(_999, _1000)) * saturate(_etcParams.y + -1.0f)));
    _1009 = (_1004 * _991);
    _1010 = (_1004 * _992);
    _1011 = (_1004 * _993);
  } else {
    _1009 = _991;
    _1010 = _992;
    _1011 = _993;
  }
  if ((_638) && ((_etcParams.z > 0.0f))) {
    _1041 = select((_1009 <= 0.0031308000907301903f), (_1009 * 12.920000076293945f), (((pow(_1009, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1042 = select((_1010 <= 0.0031308000907301903f), (_1010 * 12.920000076293945f), (((pow(_1010, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1043 = select((_1011 <= 0.0031308000907301903f), (_1011 * 12.920000076293945f), (((pow(_1011, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1041 = _1009;
    _1042 = _1010;
    _1043 = _1011;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1048 = float((uint)_622);
    if (!(_1048 < _viewDir.w)) {
      if (!(_1048 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1057 = _1041;
        _1058 = _1042;
        _1059 = _1043;
      } else {
        _1057 = 0.0f;
        _1058 = 0.0f;
        _1059 = 0.0f;
      }
    } else {
      _1057 = 0.0f;
      _1058 = 0.0f;
      _1059 = 0.0f;
    }
  } else {
    _1057 = _1041;
    _1058 = _1042;
    _1059 = _1043;
  }
  float _1069 = exp2(log2(_1057 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1070 = exp2(log2(_1058 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1071 = exp2(log2(_1059 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1069 * 18.6875f) + 1.0f)) * ((_1069 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1070 * 18.6875f) + 1.0f)) * ((_1070 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1071 * 18.6875f) + 1.0f)) * ((_1071 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _635;
  return SV_Target;
}