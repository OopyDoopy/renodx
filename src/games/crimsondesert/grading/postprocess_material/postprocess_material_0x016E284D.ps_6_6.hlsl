#include "../tonemap.hlsli"

struct PostProcessFocusStruct {
  float _focusRatio;
  float _focusSceneDepthFade;
  float _focusBackgroundSaturation;
  float _focus3DBlend;
  float _focusCharacterMaterialMask;
  float _focusColorBrightness;
  uint _focusColor;
  float _focusColorRemap;
  float _maskRatio;
  float _maskNoiseIntensity;
  float _maskBlurThickness;
  float _maskBlurPower;
  uint _maskNoiseTexture;
  float _playerFocusRadius;
  float _playerFocusCenterRadius;
  float _playerFocusPower;
  float3 _playerFocusPositionOffset;
  float _targetFocusRadius;
  float _targetFocusCenterRadius;
  float _targetFocusPower;
  float3 _targetFocusPositionOffset;
  float _connectPlayerTargetDistance;
  float _connectPlayerTargetPower;
  float _worldFocusRadius;
  float _worldFocusCenterRadius;
  float _worldFocusPower;
  float3 _worldFocusPosition;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessFocusStruct> BindlessParameters_PostProcessFocus[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24[36];
  float _39 = _time.x * 0.05000000074505806f;
  int _42 = WaveReadLaneFirst(_materialIndex);
  int _50 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))]._maskNoiseTexture);
  float4 _57 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_50 < (uint)65000), _50, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_39 + (TEXCOORD.x * 16.0f)), (_39 + (TEXCOORD.y * 16.0f))));
  int _60 = WaveReadLaneFirst(_materialIndex);
  float _72 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _74 = WaveReadLaneFirst(_materialIndex);
  float _86 = ((((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._maskNoiseIntensity) * (_57.z + -0.5f)) + 1.0f) * 50.0f) * _72.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._maskBlurThickness);
  float _324;
  float _325;
  float _326;
  float _340;
  float _586;
  float _587;
  float _588;
  float _708;
  float _709;
  float _710;
  float _731;
  float _732;
  float _733;
  float _766;
  float _767;
  float _768;
  float _782;
  float _783;
  float _784;
  if (_passIndex == 0) {
    int2 _90; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_90.x, _90.y);
    uint _105 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_90.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_90.y))))) + 0.5f) * TEXCOORD.y), 0));
    int _107 = _105.x & 255;
    float4 _116 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    if ((_107 == _renderPassTargetFocus) | (((_107 == _renderPassSelfPlayer)) || ((_107 == _renderPassTest)))) {
      _324 = 1.0f;
      _325 = _116.x;
      _326 = _116.x;
    } else {
      _324 = 0.0f;
      _325 = 0.0f;
      _326 = 0.0f;
    }
  } else {
    if (_passIndex == 1) {
      float4 _134 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _141 = (pow(_134.x, 0.012683313339948654f));
      float _142 = (pow(_134.y, 0.012683313339948654f));
      float _159 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.x));
      float _160 = _159 * 1.384615421295166f;
      float4 _162 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_160 + TEXCOORD.x), TEXCOORD.y));
      float _166 = (pow(_162.x, 0.012683313339948654f));
      float4 _176 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _160), TEXCOORD.y));
      float _180 = (pow(_176.x, 0.012683313339948654f));
      float _189 = _159 * 3.230769157409668f;
      float4 _191 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_189 + TEXCOORD.x), TEXCOORD.y));
      float _195 = (pow(_191.x, 0.012683313339948654f));
      float4 _205 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _189), TEXCOORD.y));
      float _209 = (pow(_205.x, 0.012683313339948654f));
      _324 = ((((exp2(log2(max(0.0f, (_180 + -0.8359375f)) / (18.8515625f - (_180 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_166 + -0.8359375f)) / (18.8515625f - (_166 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_141 + -0.8359375f)) / (18.8515625f - (_141 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_209 + -0.8359375f)) / (18.8515625f - (_209 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _325 = (exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
      _326 = 0.0f;
    } else {
      if (_passIndex == 2) {
        float4 _231 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _238 = (pow(_231.x, 0.012683313339948654f));
        float _239 = (pow(_231.y, 0.012683313339948654f));
        float _256 = _86 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.y));
        float _257 = _256 * 1.384615421295166f;
        float4 _259 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_257 + TEXCOORD.y)));
        float _263 = (pow(_259.x, 0.012683313339948654f));
        float4 _273 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _257)));
        float _277 = (pow(_273.x, 0.012683313339948654f));
        float _286 = _256 * 3.230769157409668f;
        float4 _288 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_286 + TEXCOORD.y)));
        float _292 = (pow(_288.x, 0.012683313339948654f));
        float4 _302 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _286)));
        float _306 = (pow(_302.x, 0.012683313339948654f));
        _324 = ((((exp2(log2(max(0.0f, (_277 + -0.8359375f)) / (18.8515625f - (_277 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_263 + -0.8359375f)) / (18.8515625f - (_263 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_238 + -0.8359375f)) / (18.8515625f - (_238 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_292 + -0.8359375f)) / (18.8515625f - (_292 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _325 = (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
        _326 = 0.0f;
      } else {
        _324 = 0.0f;
        _325 = 0.0f;
        _326 = 0.0f;
      }
    }
  }
  uint _327 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _334 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_327), 0));
    _340 = (float((uint)((uint)(_334.x & 127))) + 0.5f);
  } else {
    _340 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_324, _325, _326));
    _708 = output_color.x;
    _709 = output_color.y;
    _710 = output_color.z;
  } else {
    _708 = _324;
    _709 = _325;
    _710 = _326;
  }
  if (_etcParams.y > 1.0f) {
    float _721 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _722 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _726 = saturate(1.0f - (dot(float2(_721, _722), float2(_721, _722)) * saturate(_etcParams.y + -1.0f)));
    _731 = (_726 * _708);
    _732 = (_726 * _709);
    _733 = (_726 * _710);
  } else {
    _731 = _708;
    _732 = _709;
    _733 = _710;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _766 = select((_731 <= 0.0031308000907301903f), (_731 * 12.920000076293945f), (((pow(_731, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _767 = select((_732 <= 0.0031308000907301903f), (_732 * 12.920000076293945f), (((pow(_732, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _768 = select((_733 <= 0.0031308000907301903f), (_733 * 12.920000076293945f), (((pow(_733, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _766 = _731;
    _767 = _732;
    _768 = _733;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _773 = float((uint)_327);
    if (!(_773 < _viewDir.w)) {
      if (!(_773 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _782 = _766;
        _783 = _767;
        _784 = _768;
      } else {
        _782 = 0.0f;
        _783 = 0.0f;
        _784 = 0.0f;
      }
    } else {
      _782 = 0.0f;
      _783 = 0.0f;
      _784 = 0.0f;
    }
  } else {
    _782 = _766;
    _783 = _767;
    _784 = _768;
  }
  float _794 = exp2(log2(_782 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _795 = exp2(log2(_783 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _796 = exp2(log2(_784 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_794 * 18.6875f) + 1.0f)) * ((_794 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_795 * 18.6875f) + 1.0f)) * ((_795 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_796 * 18.6875f) + 1.0f)) * ((_796 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _340;
  return SV_Target;
}

