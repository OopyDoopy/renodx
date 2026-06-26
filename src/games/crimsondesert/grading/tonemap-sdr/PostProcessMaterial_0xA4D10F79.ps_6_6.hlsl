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
  float _40 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _41 = TEXCOORD.y * 2.0f;
  float _42 = 1.0f - _41;
  float _44 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _46 = max(1.0000000116860974e-07f, _44.x);
  float _82 = mad((_invViewProj[3].z), _46, mad((_invViewProj[3].y), _42, ((_invViewProj[3].x) * _40))) + (_invViewProj[3].w);
  float _86 = 6.0f / _32;
  int _93 = WaveReadLaneFirst(_materialIndex);
  int _101 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._noiseTex);
  float4 _108 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_101 < (uint)65000), _101, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_86 * TEXCOORD.x), ((_time.x * 0.009999999776482582f) + (_86 * TEXCOORD.y))));
  float _111 = _108.x + -0.5f;
  float _112 = _108.y + -0.5f;
  float _113 = _111 * 0.004999999888241291f;
  float _114 = _112 * 0.004999999888241291f;
  float _115 = _113 + TEXCOORD.x;
  float _116 = _114 + TEXCOORD.y;
  int2 _118; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_118.x, _118.y);
  uint _133 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_118.x))))) + 0.5f) * _115), int((float((int)(int(float((int)(_118.y))))) + 0.5f) * _116), 0));
  int _135 = _133.x & 255;
  float _143 = (float((uint)((uint)((uint)((uint)(_133.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _144 = (float((uint)((uint)(((uint)((uint)(_133.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _146 = 1.0f - abs(_143);
  float _147 = abs(_144);
  float _148 = _146 - _147;
  float _159;
  float _160;
  float _548;
  float _549;
  float _550;
  float _576;
  float _577;
  float _578;
  float _604;
  float _809;
  float _810;
  float _811;
  float _904;
  float _905;
  float _906;
  float _960;
  float _961;
  float _962;
  float _978;
  float _979;
  float _980;
  float _1010;
  float _1011;
  float _1012;
  float _1026;
  float _1027;
  float _1028;
  if (!(_148 >= 0.0f)) {
    _159 = (select((_143 >= 0.0f), 1.0f, -1.0f) * (1.0f - _147));
    _160 = (select((_144 >= 0.0f), 1.0f, -1.0f) * _146);
  } else {
    _159 = _143;
    _160 = _144;
  }
  float _162 = rsqrt(dot(float3(_159, _160, _148), float3(_159, _160, _148)));
  float _163 = _162 * _159;
  float _164 = _162 * _160;
  float _165 = _162 * _148;
  float _167 = rsqrt(dot(float3(_163, _164, _165), float3(_163, _164, _165)));
  float _168 = _167 * _163;
  float _169 = _167 * _164;
  float _170 = _167 * _165;
  float4 _179 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _115), int(_customRenderPassSizeInvSize.y * _116), 0));
  int _180 = WaveReadLaneFirst(_materialIndex);
  float _188 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))]._axiomEyeProgress);
  float _193 = ((mad((_invViewProj[0].z), _46, mad((_invViewProj[0].y), _42, ((_invViewProj[0].x) * _40))) + (_invViewProj[0].w)) / _82) - _mainPosition.x;
  float _194 = ((mad((_invViewProj[1].z), _46, mad((_invViewProj[1].y), _42, ((_invViewProj[1].x) * _40))) + (_invViewProj[1].w)) / _82) - _mainPosition.y;
  float _195 = ((mad((_invViewProj[2].z), _46, mad((_invViewProj[2].y), _42, ((_invViewProj[2].x) * _40))) + (_invViewProj[2].w)) / _82) - _mainPosition.z;
  float _208 = saturate((1.0f - saturate(sqrt(((_193 * _193) + (_194 * _194)) + (_195 * _195)) / max(0.0010000000474974513f, (_188 * 50.0f)))) * 1.25f);
  float _214 = (saturate((_188 * 4.0f) + -3.0f) * (1.0f - _208)) + _208;
  if (_208 > 0.0f) {
    int _218 = WaveReadLaneFirst(_materialIndex);
    int _226 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))]._axiomBackgroundColor);
    float _229 = float((uint)((uint)(((uint)((uint)(_226)) >> 16) & 255)));
    float _232 = float((uint)((uint)(((uint)((uint)(_226)) >> 8) & 255)));
    float _234 = float((uint)((uint)(_226 & 255)));
    float4 _266 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _113), (TEXCOORD.y - _114)), 0.0f);
    float _268 = _266.w * select(((_229 * 0.003921568859368563f) < 0.040449999272823334f), (_229 * 0.0003035269910469651f), exp2(log2((_229 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _269 = _266.w * select(((_232 * 0.003921568859368563f) < 0.040449999272823334f), (_232 * 0.0003035269910469651f), exp2(log2((_232 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _270 = _266.w * select(((_234 * 0.003921568859368563f) < 0.040449999272823334f), (_234 * 0.0003035269910469651f), exp2(log2((_234 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _271 = max(1.0000000116860974e-07f, _179.x);
    float _307 = mad((_invViewProj[3].z), _271, mad((_invViewProj[3].y), _42, ((_invViewProj[3].x) * _40))) + (_invViewProj[3].w);
    float _315 = ((mad((_invViewProj[0].z), _271, mad((_invViewProj[0].y), _42, ((_invViewProj[0].x) * _40))) + (_invViewProj[0].w)) / _307) - _mainPosition.x;
    float _316 = ((mad((_invViewProj[1].z), _271, mad((_invViewProj[1].y), _42, ((_invViewProj[1].x) * _40))) + (_invViewProj[1].w)) / _307) - _mainPosition.y;
    float _317 = ((mad((_invViewProj[2].z), _271, mad((_invViewProj[2].y), _42, ((_invViewProj[2].x) * _40))) + (_invViewProj[2].w)) / _307) - _mainPosition.z;
    int _324 = WaveReadLaneFirst(_materialIndex);
    float _337 = 1.0f - saturate(sqrt(((_315 * _315) + (_316 * _316)) + (_317 * _317)) / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_324 < (uint)170000), _324, 0)) + 0u))]._axiomEyeRadius) * _214)));
    bool __defer_216_351 = false;
    if ((_135 == _renderPassSelfPlayer) || ((!(_135 == _renderPassSelfPlayer)) && (_135 == _renderPassTest))) {
      __defer_216_351 = true;
    } else {
      if (((_337 > 0.0f)) && ((_135 == _renderPassDetectItem))) {
        float _354 = 2.0f / _32;
        int _365 = WaveReadLaneFirst(_materialIndex);
        int _373 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_365 < (uint)170000), _365, 0)) + 0u))]._noiseTex);
        float4 _380 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_373 < (uint)65000), _373, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_354 * TEXCOORD.x) - (_108.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_354 * TEXCOORD.y) - (_108.y * 0.25f))));
        float _393 = saturate(1.0f - dot(float3(_168, _169, _170), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _396 = _380.z + -0.5f;
        float _398 = saturate(((_393 * _393) * _393) + _396);
        if ((_135 == _renderPassSelfPlayer) || ((!(_135 == _renderPassSelfPlayer)) && (_135 == _renderPassTest))) {
          int _407 = WaveReadLaneFirst(_materialIndex);
          int _415 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_407 < (uint)170000), _407, 0)) + 0u))]._axiomPlayerColor);
          float _418 = float((uint)((uint)(((uint)((uint)(_415)) >> 16) & 255)));
          float _421 = float((uint)((uint)(((uint)((uint)(_415)) >> 8) & 255)));
          float _423 = float((uint)((uint)(_415 & 255)));
          _576 = (select(((_418 * 0.003921568859368563f) < 0.040449999272823334f), (_418 * 0.0003035269910469651f), exp2(log2((_418 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
          _577 = (select(((_421 * 0.003921568859368563f) < 0.040449999272823334f), (_421 * 0.0003035269910469651f), exp2(log2((_421 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
          _578 = (select(((_423 * 0.003921568859368563f) < 0.040449999272823334f), (_423 * 0.0003035269910469651f), exp2(log2((_423 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
        } else {
          if (_135 == _renderPassDetectItem) {
            int _459 = WaveReadLaneFirst(_materialIndex);
            int _467 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_459 < (uint)170000), _459, 0)) + 0u))]._axiomEyeTargetColor);
            float _470 = float((uint)((uint)(((uint)((uint)(_467)) >> 16) & 255)));
            float _473 = float((uint)((uint)(((uint)((uint)(_467)) >> 8) & 255)));
            float _475 = float((uint)((uint)(_467 & 255)));
            float _500 = select(((_470 * 0.003921568859368563f) < 0.040449999272823334f), (_470 * 0.0003035269910469651f), exp2(log2((_470 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _501 = select(((_473 * 0.003921568859368563f) < 0.040449999272823334f), (_473 * 0.0003035269910469651f), exp2(log2((_473 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _502 = select(((_475 * 0.003921568859368563f) < 0.040449999272823334f), (_475 * 0.0003035269910469651f), exp2(log2((_475 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _520 = saturate(1.0f - dot(float3((((_380.x + -0.5f) * 4.0f) + _168), (((_380.y + -0.5f) * 4.0f) + _169), ((_396 * 4.0f) + _170)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _522 = saturate(_520 * _520);
            float _525 = saturate((_337 * 2.0f) + -1.0f);
            float4 _532 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_111 * 0.04999999701976776f)), (TEXCOORD.y - (_112 * 0.04999999701976776f))), 0.0f);
            if (!(_532.w < 0.10000000149011612f)) {
              if (_532.w < 0.14000000059604645f) {
                _548 = (_500 + 1.0f);
                _549 = _501;
                _550 = _502;
              } else {
                if (_532.w < 0.17000000178813934f) {
                  _548 = _500;
                  _549 = (_501 + 1.0f);
                  _550 = _502;
                } else {
                  if (_532.w < 0.30000001192092896f) {
                    _548 = _500;
                    _549 = _501;
                    _550 = (_502 + 1.0f);
                  } else {
                    _548 = _500;
                    _549 = _501;
                    _550 = _502;
                  }
                }
              }
            } else {
              _548 = _500;
              _549 = _501;
              _550 = _502;
            }
            float _554 = _500 * _398;
            float _555 = _501 * _398;
            float _556 = _502 * _398;
            _576 = ((((_554 - _268) + (((_548 * _522) - _554) * _525)) * _337) + _268);
            _577 = ((((_555 - _269) + (((_549 * _522) - _555) * _525)) * _337) + _269);
            _578 = ((((_556 - _270) + (((_550 * _522) - _556) * _525)) * _337) + _270);
          } else {
            _576 = _268;
            _577 = _269;
            _578 = _270;
          }
        }
      } else {
        _576 = _268;
        _577 = _269;
        _578 = _270;
      }
    }
    if (__defer_216_351) {
      if (_337 > 0.0f) {
        float _354 = 2.0f / _32;
        int _365 = WaveReadLaneFirst(_materialIndex);
        int _373 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_365 < (uint)170000), _365, 0)) + 0u))]._noiseTex);
        float4 _380 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_373 < (uint)65000), _373, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_354 * TEXCOORD.x) - (_108.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_354 * TEXCOORD.y) - (_108.y * 0.25f))));
        float _393 = saturate(1.0f - dot(float3(_168, _169, _170), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _396 = _380.z + -0.5f;
        float _398 = saturate(((_393 * _393) * _393) + _396);
        if ((_135 == _renderPassSelfPlayer) || ((!(_135 == _renderPassSelfPlayer)) && (_135 == _renderPassTest))) {
          int _407 = WaveReadLaneFirst(_materialIndex);
          int _415 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_407 < (uint)170000), _407, 0)) + 0u))]._axiomPlayerColor);
          float _418 = float((uint)((uint)(((uint)((uint)(_415)) >> 16) & 255)));
          float _421 = float((uint)((uint)(((uint)((uint)(_415)) >> 8) & 255)));
          float _423 = float((uint)((uint)(_415 & 255)));
          _576 = (select(((_418 * 0.003921568859368563f) < 0.040449999272823334f), (_418 * 0.0003035269910469651f), exp2(log2((_418 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
          _577 = (select(((_421 * 0.003921568859368563f) < 0.040449999272823334f), (_421 * 0.0003035269910469651f), exp2(log2((_421 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
          _578 = (select(((_423 * 0.003921568859368563f) < 0.040449999272823334f), (_423 * 0.0003035269910469651f), exp2(log2((_423 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _398);
        } else {
          if (_135 == _renderPassDetectItem) {
            int _459 = WaveReadLaneFirst(_materialIndex);
            int _467 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_459 < (uint)170000), _459, 0)) + 0u))]._axiomEyeTargetColor);
            float _470 = float((uint)((uint)(((uint)((uint)(_467)) >> 16) & 255)));
            float _473 = float((uint)((uint)(((uint)((uint)(_467)) >> 8) & 255)));
            float _475 = float((uint)((uint)(_467 & 255)));
            float _500 = select(((_470 * 0.003921568859368563f) < 0.040449999272823334f), (_470 * 0.0003035269910469651f), exp2(log2((_470 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _501 = select(((_473 * 0.003921568859368563f) < 0.040449999272823334f), (_473 * 0.0003035269910469651f), exp2(log2((_473 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _502 = select(((_475 * 0.003921568859368563f) < 0.040449999272823334f), (_475 * 0.0003035269910469651f), exp2(log2((_475 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _520 = saturate(1.0f - dot(float3((((_380.x + -0.5f) * 4.0f) + _168), (((_380.y + -0.5f) * 4.0f) + _169), ((_396 * 4.0f) + _170)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _522 = saturate(_520 * _520);
            float _525 = saturate((_337 * 2.0f) + -1.0f);
            float4 _532 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_111 * 0.04999999701976776f)), (TEXCOORD.y - (_112 * 0.04999999701976776f))), 0.0f);
            if (!(_532.w < 0.10000000149011612f)) {
              if (_532.w < 0.14000000059604645f) {
                _548 = (_500 + 1.0f);
                _549 = _501;
                _550 = _502;
              } else {
                if (_532.w < 0.17000000178813934f) {
                  _548 = _500;
                  _549 = (_501 + 1.0f);
                  _550 = _502;
                } else {
                  if (_532.w < 0.30000001192092896f) {
                    _548 = _500;
                    _549 = _501;
                    _550 = (_502 + 1.0f);
                  } else {
                    _548 = _500;
                    _549 = _501;
                    _550 = _502;
                  }
                }
              }
            } else {
              _548 = _500;
              _549 = _501;
              _550 = _502;
            }
            float _554 = _500 * _398;
            float _555 = _501 * _398;
            float _556 = _502 * _398;
            _576 = ((((_554 - _268) + (((_548 * _522) - _554) * _525)) * _337) + _268);
            _577 = ((((_555 - _269) + (((_549 * _522) - _555) * _525)) * _337) + _269);
            _578 = ((((_556 - _270) + (((_550 * _522) - _556) * _525)) * _337) + _270);
          } else {
            _576 = _268;
            _577 = _269;
            _578 = _270;
          }
        }
      } else {
        _576 = _268;
        _577 = _269;
        _578 = _270;
      }
    }
  } else {
    _576 = _35.x;
    _577 = _35.y;
    _578 = _35.z;
  }
  float _588 = (((_576 * _208) - _35.x) * _214) + _35.x;
  float _589 = (((_577 * _208) - _35.y) * _214) + _35.y;
  float _590 = (((_578 * _208) - _35.z) * _214) + _35.z;
  uint _591 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _598 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_591), 0));
    _604 = (float((uint)((uint)(_598.x & 127))) + 0.5f);
  } else {
    _604 = 1.0f;
  }
  bool _607 = (_localToneMappingParams.w > 0.0f);
  if (_607) {
    float3 output_color = TonemapReplacer(float3(_588, _589, _590));
    _960 = output_color.x;
    _961 = output_color.y;
    _962 = output_color.z;
  } else {
    _960 = _588;
    _961 = _589;
    _962 = _590;
  }
  if (_etcParams.y > 1.0f) {
    float _968 = abs(_40);
    float _969 = abs(_41 + -1.0f);
    float _973 = saturate(1.0f - (dot(float2(_968, _969), float2(_968, _969)) * saturate(_etcParams.y + -1.0f)));
    _978 = (_973 * _960);
    _979 = (_973 * _961);
    _980 = (_973 * _962);
  } else {
    _978 = _960;
    _979 = _961;
    _980 = _962;
  }
  if ((_607) && ((_etcParams.z > 0.0f))) {
    _1010 = select((_978 <= 0.0031308000907301903f), (_978 * 12.920000076293945f), (((pow(_978, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1011 = select((_979 <= 0.0031308000907301903f), (_979 * 12.920000076293945f), (((pow(_979, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1012 = select((_980 <= 0.0031308000907301903f), (_980 * 12.920000076293945f), (((pow(_980, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1010 = _978;
    _1011 = _979;
    _1012 = _980;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1017 = float((uint)_591);
    if (!(_1017 < _viewDir.w)) {
      if (!(_1017 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1026 = _1010;
        _1027 = _1011;
        _1028 = _1012;
      } else {
        _1026 = 0.0f;
        _1027 = 0.0f;
        _1028 = 0.0f;
      }
    } else {
      _1026 = 0.0f;
      _1027 = 0.0f;
      _1028 = 0.0f;
    }
  } else {
    _1026 = _1010;
    _1027 = _1011;
    _1028 = _1012;
  }
  SV_Target.x = _1026;
  SV_Target.y = _1027;
  SV_Target.z = _1028;
  SV_Target.w = _604;
  return SV_Target;
}