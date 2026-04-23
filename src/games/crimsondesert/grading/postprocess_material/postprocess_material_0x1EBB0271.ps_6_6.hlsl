#include "../tonemap.hlsli"

struct PostProcessAxiom_CDStruct {
  float _axiomEyeProgress;
  float _axiomEyeRadius;
  uint _axiomEyeTargetColor;
  uint _axiomPlayerColor;
  uint _axiomBackgroundColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t63, space36);

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

ConstantBuffer<PostProcessAxiom_CDStruct> BindlessParameters_PostProcessAxiom_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25[36];
  float _31 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _39 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _40 = TEXCOORD.y * 2.0f;
  float _41 = 1.0f - _40;
  float _43 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _45 = max(1.0000000116860974e-07f, _43.x);
  float _81 = mad((_invViewProj[3].z), _45, mad((_invViewProj[3].y), _41, ((_invViewProj[3].x) * _39))) + (_invViewProj[3].w);
  float _85 = 6.0f / _31;
  int _92 = WaveReadLaneFirst(_materialIndex);
  int _100 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))]._noiseTex);
  float4 _107 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_100 < (uint)65000), _100, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_85 * TEXCOORD.x), ((_time.x * 0.009999999776482582f) + (_85 * TEXCOORD.y))));
  float _110 = _107.x + -0.5f;
  float _111 = _107.y + -0.5f;
  float _112 = _110 * 0.004999999888241291f;
  float _113 = _111 * 0.004999999888241291f;
  float _114 = _112 + TEXCOORD.x;
  float _115 = _113 + TEXCOORD.y;
  int2 _117; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_117.x, _117.y);
  uint _132 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_117.x))))) + 0.5f) * _114), int((float((int)(int(float((int)(_117.y))))) + 0.5f) * _115), 0));
  int _134 = _132.x & 255;
  float _142 = (float((uint)((uint)((uint)((uint)(_132.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _143 = (float((uint)((uint)(((uint)((uint)(_132.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _145 = 1.0f - abs(_142);
  float _146 = abs(_143);
  float _147 = _145 - _146;
  float _158;
  float _159;
  float _547;
  float _548;
  float _549;
  float _575;
  float _576;
  float _577;
  float _603;
  float _849;
  float _850;
  float _851;
  float _971;
  float _972;
  float _973;
  float _991;
  float _992;
  float _993;
  float _1026;
  float _1027;
  float _1028;
  float _1042;
  float _1043;
  float _1044;
  if (!(_147 >= 0.0f)) {
    _158 = (select((_142 >= 0.0f), 1.0f, -1.0f) * (1.0f - _146));
    _159 = (select((_143 >= 0.0f), 1.0f, -1.0f) * _145);
  } else {
    _158 = _142;
    _159 = _143;
  }
  float _161 = rsqrt(dot(float3(_158, _159, _147), float3(_158, _159, _147)));
  float _162 = _161 * _158;
  float _163 = _161 * _159;
  float _164 = _161 * _147;
  float _166 = rsqrt(dot(float3(_162, _163, _164), float3(_162, _163, _164)));
  float _167 = _166 * _162;
  float _168 = _166 * _163;
  float _169 = _166 * _164;
  float4 _178 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _114), int(_customRenderPassSizeInvSize.y * _115), 0));
  int _179 = WaveReadLaneFirst(_materialIndex);
  float _187 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._axiomEyeProgress);
  float _192 = ((mad((_invViewProj[0].z), _45, mad((_invViewProj[0].y), _41, ((_invViewProj[0].x) * _39))) + (_invViewProj[0].w)) / _81) - _mainPosition.x;
  float _193 = ((mad((_invViewProj[1].z), _45, mad((_invViewProj[1].y), _41, ((_invViewProj[1].x) * _39))) + (_invViewProj[1].w)) / _81) - _mainPosition.y;
  float _194 = ((mad((_invViewProj[2].z), _45, mad((_invViewProj[2].y), _41, ((_invViewProj[2].x) * _39))) + (_invViewProj[2].w)) / _81) - _mainPosition.z;
  float _207 = saturate((1.0f - saturate(sqrt(((_192 * _192) + (_193 * _193)) + (_194 * _194)) / max(0.0010000000474974513f, (_187 * 50.0f)))) * 1.25f);
  float _213 = (saturate((_187 * 4.0f) + -3.0f) * (1.0f - _207)) + _207;
  if (_207 > 0.0f) {
    int _217 = WaveReadLaneFirst(_materialIndex);
    int _225 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_217 < (uint)170000), _217, 0)) + 0u))]._axiomBackgroundColor);
    float _228 = float((uint)((uint)(((uint)((uint)(_225)) >> 16) & 255)));
    float _231 = float((uint)((uint)(((uint)((uint)(_225)) >> 8) & 255)));
    float _233 = float((uint)((uint)(_225 & 255)));
    float4 _265 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _112), (TEXCOORD.y - _113)), 0.0f);
    float _267 = _265.w * select(((_228 * 0.003921568859368563f) < 0.040449999272823334f), (_228 * 0.0003035269910469651f), exp2(log2((_228 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _268 = _265.w * select(((_231 * 0.003921568859368563f) < 0.040449999272823334f), (_231 * 0.0003035269910469651f), exp2(log2((_231 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _269 = _265.w * select(((_233 * 0.003921568859368563f) < 0.040449999272823334f), (_233 * 0.0003035269910469651f), exp2(log2((_233 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _270 = max(1.0000000116860974e-07f, _178.x);
    float _306 = mad((_invViewProj[3].z), _270, mad((_invViewProj[3].y), _41, ((_invViewProj[3].x) * _39))) + (_invViewProj[3].w);
    float _314 = ((mad((_invViewProj[0].z), _270, mad((_invViewProj[0].y), _41, ((_invViewProj[0].x) * _39))) + (_invViewProj[0].w)) / _306) - _mainPosition.x;
    float _315 = ((mad((_invViewProj[1].z), _270, mad((_invViewProj[1].y), _41, ((_invViewProj[1].x) * _39))) + (_invViewProj[1].w)) / _306) - _mainPosition.y;
    float _316 = ((mad((_invViewProj[2].z), _270, mad((_invViewProj[2].y), _41, ((_invViewProj[2].x) * _39))) + (_invViewProj[2].w)) / _306) - _mainPosition.z;
    int _323 = WaveReadLaneFirst(_materialIndex);
    float _336 = 1.0f - saturate(sqrt(((_314 * _314) + (_315 * _315)) + (_316 * _316)) / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_323 < (uint)170000), _323, 0)) + 0u))]._axiomEyeRadius) * _213)));
    bool __defer_215_350 = false;
    if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
      __defer_215_350 = true;
    } else {
      if (((_336 > 0.0f)) && ((_134 == _renderPassDetectItem))) {
        float _353 = 2.0f / _31;
        int _364 = WaveReadLaneFirst(_materialIndex);
        int _372 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))]._noiseTex);
        float4 _379 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_372 < (uint)65000), _372, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_353 * TEXCOORD.x) - (_107.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_353 * TEXCOORD.y) - (_107.y * 0.25f))));
        float _392 = saturate(1.0f - dot(float3(_167, _168, _169), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _395 = _379.z + -0.5f;
        float _397 = saturate(((_392 * _392) * _392) + _395);
        if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
          int _406 = WaveReadLaneFirst(_materialIndex);
          int _414 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_406 < (uint)170000), _406, 0)) + 0u))]._axiomPlayerColor);
          float _417 = float((uint)((uint)(((uint)((uint)(_414)) >> 16) & 255)));
          float _420 = float((uint)((uint)(((uint)((uint)(_414)) >> 8) & 255)));
          float _422 = float((uint)((uint)(_414 & 255)));
          _575 = (select(((_417 * 0.003921568859368563f) < 0.040449999272823334f), (_417 * 0.0003035269910469651f), exp2(log2((_417 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _576 = (select(((_420 * 0.003921568859368563f) < 0.040449999272823334f), (_420 * 0.0003035269910469651f), exp2(log2((_420 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _577 = (select(((_422 * 0.003921568859368563f) < 0.040449999272823334f), (_422 * 0.0003035269910469651f), exp2(log2((_422 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
        } else {
          if (_134 == _renderPassDetectItem) {
            int _458 = WaveReadLaneFirst(_materialIndex);
            int _466 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_458 < (uint)170000), _458, 0)) + 0u))]._axiomEyeTargetColor);
            float _469 = float((uint)((uint)(((uint)((uint)(_466)) >> 16) & 255)));
            float _472 = float((uint)((uint)(((uint)((uint)(_466)) >> 8) & 255)));
            float _474 = float((uint)((uint)(_466 & 255)));
            float _499 = select(((_469 * 0.003921568859368563f) < 0.040449999272823334f), (_469 * 0.0003035269910469651f), exp2(log2((_469 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _500 = select(((_472 * 0.003921568859368563f) < 0.040449999272823334f), (_472 * 0.0003035269910469651f), exp2(log2((_472 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _501 = select(((_474 * 0.003921568859368563f) < 0.040449999272823334f), (_474 * 0.0003035269910469651f), exp2(log2((_474 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _519 = saturate(1.0f - dot(float3((((_379.x + -0.5f) * 4.0f) + _167), (((_379.y + -0.5f) * 4.0f) + _168), ((_395 * 4.0f) + _169)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _521 = saturate(_519 * _519);
            float _524 = saturate((_336 * 2.0f) + -1.0f);
            float4 _531 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_110 * 0.04999999701976776f)), (TEXCOORD.y - (_111 * 0.04999999701976776f))), 0.0f);
            if (!(_531.w < 0.10000000149011612f)) {
              if (_531.w < 0.14000000059604645f) {
                _547 = (_499 + 1.0f);
                _548 = _500;
                _549 = _501;
              } else {
                if (_531.w < 0.17000000178813934f) {
                  _547 = _499;
                  _548 = (_500 + 1.0f);
                  _549 = _501;
                } else {
                  if (_531.w < 0.30000001192092896f) {
                    _547 = _499;
                    _548 = _500;
                    _549 = (_501 + 1.0f);
                  } else {
                    _547 = _499;
                    _548 = _500;
                    _549 = _501;
                  }
                }
              }
            } else {
              _547 = _499;
              _548 = _500;
              _549 = _501;
            }
            float _553 = _499 * _397;
            float _554 = _500 * _397;
            float _555 = _501 * _397;
            _575 = ((((_553 - _267) + (((_547 * _521) - _553) * _524)) * _336) + _267);
            _576 = ((((_554 - _268) + (((_548 * _521) - _554) * _524)) * _336) + _268);
            _577 = ((((_555 - _269) + (((_549 * _521) - _555) * _524)) * _336) + _269);
          } else {
            _575 = _267;
            _576 = _268;
            _577 = _269;
          }
        }
      } else {
        _575 = _267;
        _576 = _268;
        _577 = _269;
      }
    }
    if (__defer_215_350) {
      if (_336 > 0.0f) {
        float _353 = 2.0f / _31;
        int _364 = WaveReadLaneFirst(_materialIndex);
        int _372 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))]._noiseTex);
        float4 _379 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_372 < (uint)65000), _372, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_353 * TEXCOORD.x) - (_107.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_353 * TEXCOORD.y) - (_107.y * 0.25f))));
        float _392 = saturate(1.0f - dot(float3(_167, _168, _169), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _395 = _379.z + -0.5f;
        float _397 = saturate(((_392 * _392) * _392) + _395);
        if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
          int _406 = WaveReadLaneFirst(_materialIndex);
          int _414 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_406 < (uint)170000), _406, 0)) + 0u))]._axiomPlayerColor);
          float _417 = float((uint)((uint)(((uint)((uint)(_414)) >> 16) & 255)));
          float _420 = float((uint)((uint)(((uint)((uint)(_414)) >> 8) & 255)));
          float _422 = float((uint)((uint)(_414 & 255)));
          _575 = (select(((_417 * 0.003921568859368563f) < 0.040449999272823334f), (_417 * 0.0003035269910469651f), exp2(log2((_417 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _576 = (select(((_420 * 0.003921568859368563f) < 0.040449999272823334f), (_420 * 0.0003035269910469651f), exp2(log2((_420 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _577 = (select(((_422 * 0.003921568859368563f) < 0.040449999272823334f), (_422 * 0.0003035269910469651f), exp2(log2((_422 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
        } else {
          if (_134 == _renderPassDetectItem) {
            int _458 = WaveReadLaneFirst(_materialIndex);
            int _466 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_458 < (uint)170000), _458, 0)) + 0u))]._axiomEyeTargetColor);
            float _469 = float((uint)((uint)(((uint)((uint)(_466)) >> 16) & 255)));
            float _472 = float((uint)((uint)(((uint)((uint)(_466)) >> 8) & 255)));
            float _474 = float((uint)((uint)(_466 & 255)));
            float _499 = select(((_469 * 0.003921568859368563f) < 0.040449999272823334f), (_469 * 0.0003035269910469651f), exp2(log2((_469 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _500 = select(((_472 * 0.003921568859368563f) < 0.040449999272823334f), (_472 * 0.0003035269910469651f), exp2(log2((_472 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _501 = select(((_474 * 0.003921568859368563f) < 0.040449999272823334f), (_474 * 0.0003035269910469651f), exp2(log2((_474 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _519 = saturate(1.0f - dot(float3((((_379.x + -0.5f) * 4.0f) + _167), (((_379.y + -0.5f) * 4.0f) + _168), ((_395 * 4.0f) + _169)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _521 = saturate(_519 * _519);
            float _524 = saturate((_336 * 2.0f) + -1.0f);
            float4 _531 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_110 * 0.04999999701976776f)), (TEXCOORD.y - (_111 * 0.04999999701976776f))), 0.0f);
            if (!(_531.w < 0.10000000149011612f)) {
              if (_531.w < 0.14000000059604645f) {
                _547 = (_499 + 1.0f);
                _548 = _500;
                _549 = _501;
              } else {
                if (_531.w < 0.17000000178813934f) {
                  _547 = _499;
                  _548 = (_500 + 1.0f);
                  _549 = _501;
                } else {
                  if (_531.w < 0.30000001192092896f) {
                    _547 = _499;
                    _548 = _500;
                    _549 = (_501 + 1.0f);
                  } else {
                    _547 = _499;
                    _548 = _500;
                    _549 = _501;
                  }
                }
              }
            } else {
              _547 = _499;
              _548 = _500;
              _549 = _501;
            }
            float _553 = _499 * _397;
            float _554 = _500 * _397;
            float _555 = _501 * _397;
            _575 = ((((_553 - _267) + (((_547 * _521) - _553) * _524)) * _336) + _267);
            _576 = ((((_554 - _268) + (((_548 * _521) - _554) * _524)) * _336) + _268);
            _577 = ((((_555 - _269) + (((_549 * _521) - _555) * _524)) * _336) + _269);
          } else {
            _575 = _267;
            _576 = _268;
            _577 = _269;
          }
        }
      } else {
        _575 = _267;
        _576 = _268;
        _577 = _269;
      }
    }
  } else {
    _575 = _34.x;
    _576 = _34.y;
    _577 = _34.z;
  }
  float _587 = (((_575 * _207) - _34.x) * _213) + _34.x;
  float _588 = (((_576 * _207) - _34.y) * _213) + _34.y;
  float _589 = (((_577 * _207) - _34.z) * _213) + _34.z;
  uint _590 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _597 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_590), 0));
    _603 = (float((uint)((uint)(_597.x & 127))) + 0.5f);
  } else {
    _603 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_587, _588, _589));
    _971 = output_color.x;
    _972 = output_color.y;
    _973 = output_color.z;
  } else {
    _971 = _587;
    _972 = _588;
    _973 = _589;
  }
  if (_etcParams.y > 1.0f) {
    float _981 = abs(_39);
    float _982 = abs(_40 + -1.0f);
    float _986 = saturate(1.0f - (dot(float2(_981, _982), float2(_981, _982)) * saturate(_etcParams.y + -1.0f)));
    _991 = (_986 * _971);
    _992 = (_986 * _972);
    _993 = (_986 * _973);
  } else {
    _991 = _971;
    _992 = _972;
    _993 = _973;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1026 = select((_991 <= 0.0031308000907301903f), (_991 * 12.920000076293945f), (((pow(_991, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1027 = select((_992 <= 0.0031308000907301903f), (_992 * 12.920000076293945f), (((pow(_992, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1028 = select((_993 <= 0.0031308000907301903f), (_993 * 12.920000076293945f), (((pow(_993, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1026 = _991;
    _1027 = _992;
    _1028 = _993;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1033 = float((uint)_590);
    if (!(_1033 < _viewDir.w)) {
      if (!(_1033 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1042 = _1026;
        _1043 = _1027;
        _1044 = _1028;
      } else {
        _1042 = 0.0f;
        _1043 = 0.0f;
        _1044 = 0.0f;
      }
    } else {
      _1042 = 0.0f;
      _1043 = 0.0f;
      _1044 = 0.0f;
    }
  } else {
    _1042 = _1026;
    _1043 = _1027;
    _1044 = _1028;
  }
  SV_Target.x = _1042;
  SV_Target.y = _1043;
  SV_Target.z = _1044;
  SV_Target.w = _603;
  return SV_Target;
}

