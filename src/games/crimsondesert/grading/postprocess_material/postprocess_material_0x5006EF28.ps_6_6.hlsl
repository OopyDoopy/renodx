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
  float _44 = (pow(_34.x, 0.012683313339948654f));
  float _45 = (pow(_34.y, 0.012683313339948654f));
  float _46 = (pow(_34.z, 0.012683313339948654f));
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _73 = exp2(log2(max(0.0f, (_46 + -0.8359375f)) / (18.8515625f - (_46 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _75 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _76 = TEXCOORD.y * 2.0f;
  float _77 = 1.0f - _76;
  float _79 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _81 = max(1.0000000116860974e-07f, _79.x);
  float _117 = mad((_invViewProj[3].z), _81, mad((_invViewProj[3].y), _77, ((_invViewProj[3].x) * _75))) + (_invViewProj[3].w);
  float _121 = 6.0f / _31;
  int _128 = WaveReadLaneFirst(_materialIndex);
  int _136 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._noiseTex);
  float4 _143 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_136 < (uint)65000), _136, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_121 * TEXCOORD.x), ((_time.x * 0.009999999776482582f) + (_121 * TEXCOORD.y))));
  float _146 = _143.x + -0.5f;
  float _147 = _143.y + -0.5f;
  float _148 = _146 * 0.004999999888241291f;
  float _149 = _147 * 0.004999999888241291f;
  float _150 = _148 + TEXCOORD.x;
  float _151 = _149 + TEXCOORD.y;
  int2 _153; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_153.x, _153.y);
  uint _168 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_153.x))))) + 0.5f) * _150), int((float((int)(int(float((int)(_153.y))))) + 0.5f) * _151), 0));
  int _170 = _168.x & 255;
  float _178 = (float((uint)((uint)((uint)((uint)(_168.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _179 = (float((uint)((uint)(((uint)((uint)(_168.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _181 = 1.0f - abs(_178);
  float _182 = abs(_179);
  float _183 = _181 - _182;
  float _194;
  float _195;
  float _583;
  float _584;
  float _585;
  float _611;
  float _612;
  float _613;
  float _639;
  float _885;
  float _886;
  float _887;
  float _1007;
  float _1008;
  float _1009;
  float _1027;
  float _1028;
  float _1029;
  float _1062;
  float _1063;
  float _1064;
  float _1078;
  float _1079;
  float _1080;
  if (!(_183 >= 0.0f)) {
    _194 = (select((_178 >= 0.0f), 1.0f, -1.0f) * (1.0f - _182));
    _195 = (select((_179 >= 0.0f), 1.0f, -1.0f) * _181);
  } else {
    _194 = _178;
    _195 = _179;
  }
  float _197 = rsqrt(dot(float3(_194, _195, _183), float3(_194, _195, _183)));
  float _198 = _197 * _194;
  float _199 = _197 * _195;
  float _200 = _197 * _183;
  float _202 = rsqrt(dot(float3(_198, _199, _200), float3(_198, _199, _200)));
  float _203 = _202 * _198;
  float _204 = _202 * _199;
  float _205 = _202 * _200;
  float4 _214 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _150), int(_customRenderPassSizeInvSize.y * _151), 0));
  int _215 = WaveReadLaneFirst(_materialIndex);
  float _223 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_215 < (uint)170000), _215, 0)) + 0u))]._axiomEyeProgress);
  float _228 = ((mad((_invViewProj[0].z), _81, mad((_invViewProj[0].y), _77, ((_invViewProj[0].x) * _75))) + (_invViewProj[0].w)) / _117) - _mainPosition.x;
  float _229 = ((mad((_invViewProj[1].z), _81, mad((_invViewProj[1].y), _77, ((_invViewProj[1].x) * _75))) + (_invViewProj[1].w)) / _117) - _mainPosition.y;
  float _230 = ((mad((_invViewProj[2].z), _81, mad((_invViewProj[2].y), _77, ((_invViewProj[2].x) * _75))) + (_invViewProj[2].w)) / _117) - _mainPosition.z;
  float _243 = saturate((1.0f - saturate(sqrt(((_228 * _228) + (_229 * _229)) + (_230 * _230)) / max(0.0010000000474974513f, (_223 * 50.0f)))) * 1.25f);
  float _249 = (saturate((_223 * 4.0f) + -3.0f) * (1.0f - _243)) + _243;
  if (_243 > 0.0f) {
    int _253 = WaveReadLaneFirst(_materialIndex);
    int _261 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_253 < (uint)170000), _253, 0)) + 0u))]._axiomBackgroundColor);
    float _264 = float((uint)((uint)(((uint)((uint)(_261)) >> 16) & 255)));
    float _267 = float((uint)((uint)(((uint)((uint)(_261)) >> 8) & 255)));
    float _269 = float((uint)((uint)(_261 & 255)));
    float4 _301 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _148), (TEXCOORD.y - _149)), 0.0f);
    float _303 = _301.w * select(((_264 * 0.003921568859368563f) < 0.040449999272823334f), (_264 * 0.0003035269910469651f), exp2(log2((_264 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _304 = _301.w * select(((_267 * 0.003921568859368563f) < 0.040449999272823334f), (_267 * 0.0003035269910469651f), exp2(log2((_267 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _305 = _301.w * select(((_269 * 0.003921568859368563f) < 0.040449999272823334f), (_269 * 0.0003035269910469651f), exp2(log2((_269 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _306 = max(1.0000000116860974e-07f, _214.x);
    float _342 = mad((_invViewProj[3].z), _306, mad((_invViewProj[3].y), _77, ((_invViewProj[3].x) * _75))) + (_invViewProj[3].w);
    float _350 = ((mad((_invViewProj[0].z), _306, mad((_invViewProj[0].y), _77, ((_invViewProj[0].x) * _75))) + (_invViewProj[0].w)) / _342) - _mainPosition.x;
    float _351 = ((mad((_invViewProj[1].z), _306, mad((_invViewProj[1].y), _77, ((_invViewProj[1].x) * _75))) + (_invViewProj[1].w)) / _342) - _mainPosition.y;
    float _352 = ((mad((_invViewProj[2].z), _306, mad((_invViewProj[2].y), _77, ((_invViewProj[2].x) * _75))) + (_invViewProj[2].w)) / _342) - _mainPosition.z;
    int _359 = WaveReadLaneFirst(_materialIndex);
    float _372 = 1.0f - saturate(sqrt(((_350 * _350) + (_351 * _351)) + (_352 * _352)) / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_359 < (uint)170000), _359, 0)) + 0u))]._axiomEyeRadius) * _249)));
    bool __defer_251_386 = false;
    if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
      __defer_251_386 = true;
    } else {
      if (((_372 > 0.0f)) && ((_170 == _renderPassDetectItem))) {
        float _389 = 2.0f / _31;
        int _400 = WaveReadLaneFirst(_materialIndex);
        int _408 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_400 < (uint)170000), _400, 0)) + 0u))]._noiseTex);
        float4 _415 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_408 < (uint)65000), _408, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_389 * TEXCOORD.x) - (_143.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_389 * TEXCOORD.y) - (_143.y * 0.25f))));
        float _428 = saturate(1.0f - dot(float3(_203, _204, _205), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _431 = _415.z + -0.5f;
        float _433 = saturate(((_428 * _428) * _428) + _431);
        if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
          int _442 = WaveReadLaneFirst(_materialIndex);
          int _450 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_442 < (uint)170000), _442, 0)) + 0u))]._axiomPlayerColor);
          float _453 = float((uint)((uint)(((uint)((uint)(_450)) >> 16) & 255)));
          float _456 = float((uint)((uint)(((uint)((uint)(_450)) >> 8) & 255)));
          float _458 = float((uint)((uint)(_450 & 255)));
          _611 = (select(((_453 * 0.003921568859368563f) < 0.040449999272823334f), (_453 * 0.0003035269910469651f), exp2(log2((_453 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _612 = (select(((_456 * 0.003921568859368563f) < 0.040449999272823334f), (_456 * 0.0003035269910469651f), exp2(log2((_456 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _613 = (select(((_458 * 0.003921568859368563f) < 0.040449999272823334f), (_458 * 0.0003035269910469651f), exp2(log2((_458 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
        } else {
          if (_170 == _renderPassDetectItem) {
            int _494 = WaveReadLaneFirst(_materialIndex);
            int _502 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))]._axiomEyeTargetColor);
            float _505 = float((uint)((uint)(((uint)((uint)(_502)) >> 16) & 255)));
            float _508 = float((uint)((uint)(((uint)((uint)(_502)) >> 8) & 255)));
            float _510 = float((uint)((uint)(_502 & 255)));
            float _535 = select(((_505 * 0.003921568859368563f) < 0.040449999272823334f), (_505 * 0.0003035269910469651f), exp2(log2((_505 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _536 = select(((_508 * 0.003921568859368563f) < 0.040449999272823334f), (_508 * 0.0003035269910469651f), exp2(log2((_508 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _537 = select(((_510 * 0.003921568859368563f) < 0.040449999272823334f), (_510 * 0.0003035269910469651f), exp2(log2((_510 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _555 = saturate(1.0f - dot(float3((((_415.x + -0.5f) * 4.0f) + _203), (((_415.y + -0.5f) * 4.0f) + _204), ((_431 * 4.0f) + _205)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _557 = saturate(_555 * _555);
            float _560 = saturate((_372 * 2.0f) + -1.0f);
            float4 _567 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_146 * 0.04999999701976776f)), (TEXCOORD.y - (_147 * 0.04999999701976776f))), 0.0f);
            if (!(_567.w < 0.10000000149011612f)) {
              if (_567.w < 0.14000000059604645f) {
                _583 = (_535 + 1.0f);
                _584 = _536;
                _585 = _537;
              } else {
                if (_567.w < 0.17000000178813934f) {
                  _583 = _535;
                  _584 = (_536 + 1.0f);
                  _585 = _537;
                } else {
                  if (_567.w < 0.30000001192092896f) {
                    _583 = _535;
                    _584 = _536;
                    _585 = (_537 + 1.0f);
                  } else {
                    _583 = _535;
                    _584 = _536;
                    _585 = _537;
                  }
                }
              }
            } else {
              _583 = _535;
              _584 = _536;
              _585 = _537;
            }
            float _589 = _535 * _433;
            float _590 = _536 * _433;
            float _591 = _537 * _433;
            _611 = ((((_589 - _303) + (((_583 * _557) - _589) * _560)) * _372) + _303);
            _612 = ((((_590 - _304) + (((_584 * _557) - _590) * _560)) * _372) + _304);
            _613 = ((((_591 - _305) + (((_585 * _557) - _591) * _560)) * _372) + _305);
          } else {
            _611 = _303;
            _612 = _304;
            _613 = _305;
          }
        }
      } else {
        _611 = _303;
        _612 = _304;
        _613 = _305;
      }
    }
    if (__defer_251_386) {
      if (_372 > 0.0f) {
        float _389 = 2.0f / _31;
        int _400 = WaveReadLaneFirst(_materialIndex);
        int _408 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_400 < (uint)170000), _400, 0)) + 0u))]._noiseTex);
        float4 _415 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_408 < (uint)65000), _408, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_389 * TEXCOORD.x) - (_143.x * 0.25f)) + (_time.x * 0.10000000149011612f)), ((_389 * TEXCOORD.y) - (_143.y * 0.25f))));
        float _428 = saturate(1.0f - dot(float3(_203, _204, _205), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
        float _431 = _415.z + -0.5f;
        float _433 = saturate(((_428 * _428) * _428) + _431);
        if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
          int _442 = WaveReadLaneFirst(_materialIndex);
          int _450 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_442 < (uint)170000), _442, 0)) + 0u))]._axiomPlayerColor);
          float _453 = float((uint)((uint)(((uint)((uint)(_450)) >> 16) & 255)));
          float _456 = float((uint)((uint)(((uint)((uint)(_450)) >> 8) & 255)));
          float _458 = float((uint)((uint)(_450 & 255)));
          _611 = (select(((_453 * 0.003921568859368563f) < 0.040449999272823334f), (_453 * 0.0003035269910469651f), exp2(log2((_453 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _612 = (select(((_456 * 0.003921568859368563f) < 0.040449999272823334f), (_456 * 0.0003035269910469651f), exp2(log2((_456 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _613 = (select(((_458 * 0.003921568859368563f) < 0.040449999272823334f), (_458 * 0.0003035269910469651f), exp2(log2((_458 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
        } else {
          if (_170 == _renderPassDetectItem) {
            int _494 = WaveReadLaneFirst(_materialIndex);
            int _502 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))]._axiomEyeTargetColor);
            float _505 = float((uint)((uint)(((uint)((uint)(_502)) >> 16) & 255)));
            float _508 = float((uint)((uint)(((uint)((uint)(_502)) >> 8) & 255)));
            float _510 = float((uint)((uint)(_502 & 255)));
            float _535 = select(((_505 * 0.003921568859368563f) < 0.040449999272823334f), (_505 * 0.0003035269910469651f), exp2(log2((_505 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _536 = select(((_508 * 0.003921568859368563f) < 0.040449999272823334f), (_508 * 0.0003035269910469651f), exp2(log2((_508 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _537 = select(((_510 * 0.003921568859368563f) < 0.040449999272823334f), (_510 * 0.0003035269910469651f), exp2(log2((_510 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            float _555 = saturate(1.0f - dot(float3((((_415.x + -0.5f) * 4.0f) + _203), (((_415.y + -0.5f) * 4.0f) + _204), ((_431 * 4.0f) + _205)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
            float _557 = saturate(_555 * _555);
            float _560 = saturate((_372 * 2.0f) + -1.0f);
            float4 _567 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_146 * 0.04999999701976776f)), (TEXCOORD.y - (_147 * 0.04999999701976776f))), 0.0f);
            if (!(_567.w < 0.10000000149011612f)) {
              if (_567.w < 0.14000000059604645f) {
                _583 = (_535 + 1.0f);
                _584 = _536;
                _585 = _537;
              } else {
                if (_567.w < 0.17000000178813934f) {
                  _583 = _535;
                  _584 = (_536 + 1.0f);
                  _585 = _537;
                } else {
                  if (_567.w < 0.30000001192092896f) {
                    _583 = _535;
                    _584 = _536;
                    _585 = (_537 + 1.0f);
                  } else {
                    _583 = _535;
                    _584 = _536;
                    _585 = _537;
                  }
                }
              }
            } else {
              _583 = _535;
              _584 = _536;
              _585 = _537;
            }
            float _589 = _535 * _433;
            float _590 = _536 * _433;
            float _591 = _537 * _433;
            _611 = ((((_589 - _303) + (((_583 * _557) - _589) * _560)) * _372) + _303);
            _612 = ((((_590 - _304) + (((_584 * _557) - _590) * _560)) * _372) + _304);
            _613 = ((((_591 - _305) + (((_585 * _557) - _591) * _560)) * _372) + _305);
          } else {
            _611 = _303;
            _612 = _304;
            _613 = _305;
          }
        }
      } else {
        _611 = _303;
        _612 = _304;
        _613 = _305;
      }
    }
  } else {
    _611 = _71;
    _612 = _72;
    _613 = _73;
  }
  float _623 = (((_611 * _243) - _71) * _249) + _71;
  float _624 = (((_612 * _243) - _72) * _249) + _72;
  float _625 = (((_613 * _243) - _73) * _249) + _73;
  uint _626 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _633 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_626), 0));
    _639 = (float((uint)((uint)(_633.x & 127))) + 0.5f);
  } else {
    _639 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_623, _624, _625));
    _1007 = output_color.x;
    _1008 = output_color.y;
    _1009 = output_color.z;
  } else {
    _1007 = _623;
    _1008 = _624;
    _1009 = _625;
  }
  if (_etcParams.y > 1.0f) {
    float _1017 = abs(_75);
    float _1018 = abs(_76 + -1.0f);
    float _1022 = saturate(1.0f - (dot(float2(_1017, _1018), float2(_1017, _1018)) * saturate(_etcParams.y + -1.0f)));
    _1027 = (_1022 * _1007);
    _1028 = (_1022 * _1008);
    _1029 = (_1022 * _1009);
  } else {
    _1027 = _1007;
    _1028 = _1008;
    _1029 = _1009;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1062 = select((_1027 <= 0.0031308000907301903f), (_1027 * 12.920000076293945f), (((pow(_1027, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1063 = select((_1028 <= 0.0031308000907301903f), (_1028 * 12.920000076293945f), (((pow(_1028, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1064 = select((_1029 <= 0.0031308000907301903f), (_1029 * 12.920000076293945f), (((pow(_1029, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1062 = _1027;
    _1063 = _1028;
    _1064 = _1029;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1069 = float((uint)_626);
    if (!(_1069 < _viewDir.w)) {
      if (!(_1069 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1078 = _1062;
        _1079 = _1063;
        _1080 = _1064;
      } else {
        _1078 = 0.0f;
        _1079 = 0.0f;
        _1080 = 0.0f;
      }
    } else {
      _1078 = 0.0f;
      _1079 = 0.0f;
      _1080 = 0.0f;
    }
  } else {
    _1078 = _1062;
    _1079 = _1063;
    _1080 = _1064;
  }
  float _1090 = exp2(log2(_1078 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1091 = exp2(log2(_1079 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1092 = exp2(log2(_1080 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1090 * 18.6875f) + 1.0f)) * ((_1090 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1091 * 18.6875f) + 1.0f)) * ((_1091 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1092 * 18.6875f) + 1.0f)) * ((_1092 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _639;
  return SV_Target;
}

