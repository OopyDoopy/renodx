struct PostProcessAxiom_CDStruct {
  float _axiomEyeProgress;
  float _axiomEyeRadius;
  uint _axiomEyeTargetColor;
  uint _axiomPlayerColor;
  uint _axiomBackgroundColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t76, space36);

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

ConstantBuffer<PostProcessAxiom_CDStruct> BindlessParameters_PostProcessAxiom_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _32 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _35 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _45 = (pow(_35.x, 0.012683313339948654f));
  float _46 = (pow(_35.y, 0.012683313339948654f));
  float _47 = (pow(_35.z, 0.012683313339948654f));
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _73 = exp2(log2(max(0.0f, (_46 + -0.8359375f)) / (18.8515625f - (_46 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _74 = exp2(log2(max(0.0f, (_47 + -0.8359375f)) / (18.8515625f - (_47 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _76 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _77 = TEXCOORD.y * 2.0f;
  float _78 = 1.0f - _77;
  float _80 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _82 = max(1.0000000116860974e-07f, _80.x);
  float _118 = mad((_invViewProj[3].z), _82, mad((_invViewProj[3].y), _78, ((_invViewProj[3].x) * _76))) + (_invViewProj[3].w);
  float _122 = 6.0f / _32;
  int _129 = WaveReadLaneFirst(_materialIndex);
  int _137 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._noiseTex);
  float4 _144 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_137 < (uint)65000), _137, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_122 * TEXCOORD.x), ((_time.x * 0.009999999776482582f) + (_122 * TEXCOORD.y))));
  float _147 = _144.x + -0.5f;
  float _148 = _144.y + -0.5f;
  float _149 = _147 * 0.004999999888241291f;
  float _150 = _148 * 0.004999999888241291f;
  float _151 = _149 + TEXCOORD.x;
  float _152 = _150 + TEXCOORD.y;
  int2 _154; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_154.x, _154.y);
  uint _169 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_154.x))))) + 0.5f) * _151), int((float((int)(int(float((int)(_154.y))))) + 0.5f) * _152), 0));
  int _171 = _169.x & 255;
  float _179 = (float((uint)((uint)((uint)((uint)(_169.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _180 = (float((uint)((uint)(((uint)((uint)(_169.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _182 = 1.0f - abs(_179);
  float _183 = abs(_180);
  float _184 = _182 - _183;
  float _195;
  float _196;
  float _584;
  float _585;
  float _586;
  float _612;
  float _613;
  float _614;
  float _640;
  float _845;
  float _846;
  float _847;
  float _940;
  float _941;
  float _942;
  float _996;
  float _997;
  float _998;
  float _1014;
  float _1015;
  float _1016;
  float _1046;
  float _1047;
  float _1048;
  float _1062;
  float _1063;
  float _1064;
  if (!(_184 >= 0.0f)) {
    _195 = (select((_179 >= 0.0f), 1.0f, -1.0f) * (1.0f - _183));
    _196 = (select((_180 >= 0.0f), 1.0f, -1.0f) * _182);
  } else {
    _195 = _179;
    _196 = _180;
  }
  float _198 = rsqrt(dot(float3(_195, _196, _184), float3(_195, _196, _184)));
  float _199 = _198 * _195;
  float _200 = _198 * _196;
  float _201 = _198 * _184;
  float _203 = rsqrt(dot(float3(_199, _200, _201), float3(_199, _200, _201)));
  float _204 = _203 * _199;
  float _205 = _203 * _200;
  float _206 = _203 * _201;
  float4 _215 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _151), int(_customRenderPassSizeInvSize.y * _152), 0));
  int _216 = WaveReadLaneFirst(_materialIndex);
  float _224 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_216 < (uint)170000), _216, 0)) + 0u))]._axiomEyeProgress);
  float _229 = ((mad((_invViewProj[0].z), _82, mad((_invViewProj[0].y), _78, ((_invViewProj[0].x) * _76))) + (_invViewProj[0].w)) / _118) - _mainPosition.x;
  float _230 = ((mad((_invViewProj[1].z), _82, mad((_invViewProj[1].y), _78, ((_invViewProj[1].x) * _76))) + (_invViewProj[1].w)) / _118) - _mainPosition.y;
  float _231 = ((mad((_invViewProj[2].z), _82, mad((_invViewProj[2].y), _78, ((_invViewProj[2].x) * _76))) + (_invViewProj[2].w)) / _118) - _mainPosition.z;
  float _244 = saturate((1.0f - saturate(sqrt(((_229 * _229) + (_230 * _230)) + (_231 * _231)) / max(0.0010000000474974513f, (_224 * 50.0f)))) * 1.25f);
  float _250 = (saturate((_224 * 4.0f) + -3.0f) * (1.0f - _244)) + _244;
  if (_244 > 0.0f) {
    int _254 = WaveReadLaneFirst(_materialIndex);
    int _262 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_254 < (uint)170000), _254, 0)) + 0u))]._axiomBackgroundColor);
    float _265 = float((uint)((uint)(((uint)((uint)(_262)) >> 16) & 255)));
    float _268 = float((uint)((uint)(((uint)((uint)(_262)) >> 8) & 255)));
    float _270 = float((uint)((uint)(_262 & 255)));
    float4 _302 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _149), (TEXCOORD.y - _150)), 0.0f);
    float _304 = _302.w * select(((_265 * 0.003921568859368563f) < 0.040449999272823334f), (_265 * 0.0003035269910469651f), exp2(log2((_265 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _305 = _302.w * select(((_268 * 0.003921568859368563f) < 0.040449999272823334f), (_268 * 0.0003035269910469651f), exp2(log2((_268 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _306 = _302.w * select(((_270 * 0.003921568859368563f) < 0.040449999272823334f), (_270 * 0.0003035269910469651f), exp2(log2((_270 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _307 = max(1.0000000116860974e-07f, _215.x);
    float _343 = mad((_invViewProj[3].z), _307, mad((_invViewProj[3].y), _78, ((_invViewProj[3].x) * _76))) + (_invViewProj[3].w);
    float _351 = ((mad((_invViewProj[0].z), _307, mad((_invViewProj[0].y), _78, ((_invViewProj[0].x) * _76))) + (_invViewProj[0].w)) / _343) - _mainPosition.x;
    float _352 = ((mad((_invViewProj[1].z), _307, mad((_invViewProj[1].y), _78, ((_invViewProj[1].x) * _76))) + (_invViewProj[1].w)) / _343) - _mainPosition.y;
    float _353 = ((mad((_invViewProj[2].z), _307, mad((_invViewProj[2].y), _78, ((_invViewProj[2].x) * _76))) + (_invViewProj[2].w)) / _343) - _mainPosition.z;
    int _360 = WaveReadLaneFirst(_materialIndex);
    float _373 = 1.0f - saturate(sqrt(((_351 * _351) + (_352 * _352)) + (_353 * _353)) / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_360 < (uint)170000), _360, 0)) + 0u))]._axiomEyeRadius) * _250)));
    bool __defer_252_387 = false;
    if ((_171 == _renderPassSelfPlayer) || ((!(_171 == _renderPassSelfPlayer)) && (_171 == _renderPassTest))) {
      __defer_252_387 = true;
    } else {
      if (((_373 > 0.0f)) && ((_171 == _renderPassDetectItem))) {
        float _390 = 2.0f / _32;
        int _401 = WaveReadLaneFirst(_materialIndex);
        int _409 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_401 < (uint)170000), _401, 0)) + 0u))]._noiseTex);
        float4 _416 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_409 < (uint)65000), _409, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_390 * TEXCOORD.x) - (_144.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_390 * TEXCOORD.y) - (_144.y * 0.25f))));
        float _429 = saturate(1.0f - dot(float3(_204, _205, _206), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _432 = _416.z + -0.5f;
        float _434 = saturate(((_429 * _429) * _429) + _432);
        if ((_171 == _renderPassSelfPlayer) || ((!(_171 == _renderPassSelfPlayer)) && (_171 == _renderPassTest))) {
          int _443 = WaveReadLaneFirst(_materialIndex);
          int _451 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_443 < (uint)170000), _443, 0)) + 0u))]._axiomPlayerColor);
          float _454 = float((uint)((uint)(((uint)((uint)(_451)) >> 16) & 255)));
          float _457 = float((uint)((uint)(((uint)((uint)(_451)) >> 8) & 255)));
          float _459 = float((uint)((uint)(_451 & 255)));
          _612 = (select(((_454 * 0.003921568859368563f) < 0.040449999272823334f), (_454 * 0.0003035269910469651f), exp2(log2((_454 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
          _613 = (select(((_457 * 0.003921568859368563f) < 0.040449999272823334f), (_457 * 0.0003035269910469651f), exp2(log2((_457 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
          _614 = (select(((_459 * 0.003921568859368563f) < 0.040449999272823334f), (_459 * 0.0003035269910469651f), exp2(log2((_459 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
        } else {
          if (_171 == _renderPassDetectItem) {
            int _495 = WaveReadLaneFirst(_materialIndex);
            int _503 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_495 < (uint)170000), _495, 0)) + 0u))]._axiomEyeTargetColor);
            float _506 = float((uint)((uint)(((uint)((uint)(_503)) >> 16) & 255)));
            float _509 = float((uint)((uint)(((uint)((uint)(_503)) >> 8) & 255)));
            float _511 = float((uint)((uint)(_503 & 255)));
            float _536 = select(((_506 * 0.003921568859368563f) < 0.040449999272823334f), (_506 * 0.0003035269910469651f), exp2(log2((_506 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _537 = select(((_509 * 0.003921568859368563f) < 0.040449999272823334f), (_509 * 0.0003035269910469651f), exp2(log2((_509 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _538 = select(((_511 * 0.003921568859368563f) < 0.040449999272823334f), (_511 * 0.0003035269910469651f), exp2(log2((_511 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _556 = saturate(1.0f - dot(float3((((_416.x + -0.5f) * 4.0f) + _204), (((_416.y + -0.5f) * 4.0f) + _205), ((_432 * 4.0f) + _206)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _558 = saturate(_556 * _556);
            float _561 = saturate((_373 * 2.0f) + -1.0f);
            float4 _568 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_147 * 0.04999999701976776f)), (TEXCOORD.y - (_148 * 0.04999999701976776f))), 0.0f);
            if (!(_568.w < 0.10000000149011612f)) {
              if (_568.w < 0.14000000059604645f) {
                _584 = (_536 + 1.0f);
                _585 = _537;
                _586 = _538;
              } else {
                if (_568.w < 0.17000000178813934f) {
                  _584 = _536;
                  _585 = (_537 + 1.0f);
                  _586 = _538;
                } else {
                  if (_568.w < 0.30000001192092896f) {
                    _584 = _536;
                    _585 = _537;
                    _586 = (_538 + 1.0f);
                  } else {
                    _584 = _536;
                    _585 = _537;
                    _586 = _538;
                  }
                }
              }
            } else {
              _584 = _536;
              _585 = _537;
              _586 = _538;
            }
            float _590 = _536 * _434;
            float _591 = _537 * _434;
            float _592 = _538 * _434;
            _612 = ((((_590 - _304) + (((_584 * _558) - _590) * _561)) * _373) + _304);
            _613 = ((((_591 - _305) + (((_585 * _558) - _591) * _561)) * _373) + _305);
            _614 = ((((_592 - _306) + (((_586 * _558) - _592) * _561)) * _373) + _306);
          } else {
            _612 = _304;
            _613 = _305;
            _614 = _306;
          }
        }
      } else {
        _612 = _304;
        _613 = _305;
        _614 = _306;
      }
    }
    if (__defer_252_387) {
      if (_373 > 0.0f) {
        float _390 = 2.0f / _32;
        int _401 = WaveReadLaneFirst(_materialIndex);
        int _409 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_401 < (uint)170000), _401, 0)) + 0u))]._noiseTex);
        float4 _416 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_409 < (uint)65000), _409, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_390 * TEXCOORD.x) - (_144.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_390 * TEXCOORD.y) - (_144.y * 0.25f))));
        float _429 = saturate(1.0f - dot(float3(_204, _205, _206), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _432 = _416.z + -0.5f;
        float _434 = saturate(((_429 * _429) * _429) + _432);
        if ((_171 == _renderPassSelfPlayer) || ((!(_171 == _renderPassSelfPlayer)) && (_171 == _renderPassTest))) {
          int _443 = WaveReadLaneFirst(_materialIndex);
          int _451 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_443 < (uint)170000), _443, 0)) + 0u))]._axiomPlayerColor);
          float _454 = float((uint)((uint)(((uint)((uint)(_451)) >> 16) & 255)));
          float _457 = float((uint)((uint)(((uint)((uint)(_451)) >> 8) & 255)));
          float _459 = float((uint)((uint)(_451 & 255)));
          _612 = (select(((_454 * 0.003921568859368563f) < 0.040449999272823334f), (_454 * 0.0003035269910469651f), exp2(log2((_454 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
          _613 = (select(((_457 * 0.003921568859368563f) < 0.040449999272823334f), (_457 * 0.0003035269910469651f), exp2(log2((_457 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
          _614 = (select(((_459 * 0.003921568859368563f) < 0.040449999272823334f), (_459 * 0.0003035269910469651f), exp2(log2((_459 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _434);
        } else {
          if (_171 == _renderPassDetectItem) {
            int _495 = WaveReadLaneFirst(_materialIndex);
            int _503 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_495 < (uint)170000), _495, 0)) + 0u))]._axiomEyeTargetColor);
            float _506 = float((uint)((uint)(((uint)((uint)(_503)) >> 16) & 255)));
            float _509 = float((uint)((uint)(((uint)((uint)(_503)) >> 8) & 255)));
            float _511 = float((uint)((uint)(_503 & 255)));
            float _536 = select(((_506 * 0.003921568859368563f) < 0.040449999272823334f), (_506 * 0.0003035269910469651f), exp2(log2((_506 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _537 = select(((_509 * 0.003921568859368563f) < 0.040449999272823334f), (_509 * 0.0003035269910469651f), exp2(log2((_509 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _538 = select(((_511 * 0.003921568859368563f) < 0.040449999272823334f), (_511 * 0.0003035269910469651f), exp2(log2((_511 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _556 = saturate(1.0f - dot(float3((((_416.x + -0.5f) * 4.0f) + _204), (((_416.y + -0.5f) * 4.0f) + _205), ((_432 * 4.0f) + _206)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _558 = saturate(_556 * _556);
            float _561 = saturate((_373 * 2.0f) + -1.0f);
            float4 _568 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_147 * 0.04999999701976776f)), (TEXCOORD.y - (_148 * 0.04999999701976776f))), 0.0f);
            if (!(_568.w < 0.10000000149011612f)) {
              if (_568.w < 0.14000000059604645f) {
                _584 = (_536 + 1.0f);
                _585 = _537;
                _586 = _538;
              } else {
                if (_568.w < 0.17000000178813934f) {
                  _584 = _536;
                  _585 = (_537 + 1.0f);
                  _586 = _538;
                } else {
                  if (_568.w < 0.30000001192092896f) {
                    _584 = _536;
                    _585 = _537;
                    _586 = (_538 + 1.0f);
                  } else {
                    _584 = _536;
                    _585 = _537;
                    _586 = _538;
                  }
                }
              }
            } else {
              _584 = _536;
              _585 = _537;
              _586 = _538;
            }
            float _590 = _536 * _434;
            float _591 = _537 * _434;
            float _592 = _538 * _434;
            _612 = ((((_590 - _304) + (((_584 * _558) - _590) * _561)) * _373) + _304);
            _613 = ((((_591 - _305) + (((_585 * _558) - _591) * _561)) * _373) + _305);
            _614 = ((((_592 - _306) + (((_586 * _558) - _592) * _561)) * _373) + _306);
          } else {
            _612 = _304;
            _613 = _305;
            _614 = _306;
          }
        }
      } else {
        _612 = _304;
        _613 = _305;
        _614 = _306;
      }
    }
  } else {
    _612 = _72;
    _613 = _73;
    _614 = _74;
  }
  float _624 = (((_612 * _244) - _72) * _250) + _72;
  float _625 = (((_613 * _244) - _73) * _250) + _73;
  float _626 = (((_614 * _244) - _74) * _250) + _74;
  uint _627 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _634 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_627), 0));
    _640 = (float((uint)((uint)(_634.x & 127))) + 0.5f);
  } else {
    _640 = 1.0f;
  }
  bool _643 = (_localToneMappingParams.w > 0.0f);
  if (_643) {
    float3 output_color = TonemapReplacer(float3(_624, _625, _626));
    _996 = output_color.x;
    _997 = output_color.y;
    _998 = output_color.z;
  } else {
    _996 = _624;
    _997 = _625;
    _998 = _626;
  }
  if (_etcParams.y > 1.0f) {
    float _1004 = abs(_76);
    float _1005 = abs(_77 + -1.0f);
    float _1009 = saturate(1.0f - (dot(float2(_1004, _1005), float2(_1004, _1005)) * saturate(_etcParams.y + -1.0f)));
    _1014 = (_1009 * _996);
    _1015 = (_1009 * _997);
    _1016 = (_1009 * _998);
  } else {
    _1014 = _996;
    _1015 = _997;
    _1016 = _998;
  }
  if ((_643) && ((_etcParams.z > 0.0f))) {
    _1046 = select((_1014 <= 0.0031308000907301903f), (_1014 * 12.920000076293945f), (((pow(_1014, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1047 = select((_1015 <= 0.0031308000907301903f), (_1015 * 12.920000076293945f), (((pow(_1015, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1048 = select((_1016 <= 0.0031308000907301903f), (_1016 * 12.920000076293945f), (((pow(_1016, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1046 = _1014;
    _1047 = _1015;
    _1048 = _1016;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1053 = float((uint)_627);
    if (!(_1053 < _viewDir.w)) {
      if (!(_1053 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1062 = _1046;
        _1063 = _1047;
        _1064 = _1048;
      } else {
        _1062 = 0.0f;
        _1063 = 0.0f;
        _1064 = 0.0f;
      }
    } else {
      _1062 = 0.0f;
      _1063 = 0.0f;
      _1064 = 0.0f;
    }
  } else {
    _1062 = _1046;
    _1063 = _1047;
    _1064 = _1048;
  }
  float _1074 = exp2(log2(_1062 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1075 = exp2(log2(_1063 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1076 = exp2(log2(_1064 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1074 * 18.6875f) + 1.0f)) * ((_1074 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1075 * 18.6875f) + 1.0f)) * ((_1075 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1076 * 18.6875f) + 1.0f)) * ((_1076 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _640;
  return SV_Target;
}