struct PostProcessVHSNoiseStruct {
  float _VHSNoiseProgress;
  float _timeSpeed;
  float _largeNoiseThreshold;
  float _largeNoiseDarkness;
  float _smallNoiseAmplitude;
  float _randomJitterThreshold;
  float _scanlineDarkness;
  float _vignetteRatio;
  float _vignetteWidth;
  float3 _slopeRGB;
  float _saturationRatio;
  float _chromaticAberrationRatio;
  uint _noiseTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessVHSNoiseStruct> BindlessParameters_PostProcessVHSNoise[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _27 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _31 = WaveReadLaneFirst(_materialIndex);
  float _39 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._VHSNoiseProgress);
  float _121;
  float _122;
  float _123;
  float _334;
  float _335;
  float _336;
  float _350;
  float _555;
  float _556;
  float _557;
  float _650;
  float _651;
  float _652;
  float _706;
  float _707;
  float _708;
  float _727;
  float _728;
  float _729;
  float _759;
  float _760;
  float _761;
  float _775;
  float _776;
  float _777;
  [branch]
  if (!(_39 < 0.0010000000474974513f)) {
    float4 _56 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _62 = (_56.x + _56.y) + _56.z;
    float _65 = TEXCOORD.x - ((_62 * _62) * 0.009999999776482582f);
    float4 _67 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_65, TEXCOORD.y));
    int _71 = WaveReadLaneFirst(_materialIndex);
    float _80 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._chromaticAberrationRatio));
    if (!(!(_80 >= 0.0010000000474974513f))) {
      [branch]
      if (!(_enableChromaticAberration == 0)) {
        float _87 = _65 + -0.5f;
        float _88 = TEXCOORD.y + -0.5f;
        float _96 = rsqrt(dot(float2(_87, _88), float2(_87, _88))) * (sqrt((_87 * _87) + (_88 * _88)) * 0.009999999776482582f);
        float _97 = _96 * _87;
        float _99 = _96 * _88;
        float4 _105 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_65 - _97), (TEXCOORD.y - _99)));
        float4 _107 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_65, TEXCOORD.y));
        float4 _109 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_97 + _65), (_99 + TEXCOORD.y)));
        _121 = (lerp(_67.x, _105.x, _80));
        _122 = (lerp(_67.y, _107.y, _80));
        _123 = (lerp(_67.z, _109.z, _80));
      } else {
        _121 = _67.x;
        _122 = _67.y;
        _123 = _67.z;
      }
    } else {
      _121 = _67.x;
      _122 = _67.y;
      _123 = _67.z;
    }
    int _128 = WaveReadLaneFirst(_materialIndex);
    int _136 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._noiseTexture);
    float4 _143 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_136 < (uint)65000), _136, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, (TEXCOORD.y - (_time.x * 0.02500000037252903f))));
    float _148 = _time.x * 0.019999999552965164f;
    float _155 = ((sin(_148) * (sin(_148 + 7.130000114440918f) + 0.5f)) + TEXCOORD.y) * _srcTargetSizeAndInv.y;
    int _169 = WaveReadLaneFirst(_materialIndex);
    float _178 = (_143.x * 0.5f) * WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_169 < (uint)170000), _169, 0)) + 0u))]._scanlineDarkness);
    int _179 = WaveReadLaneFirst(_materialIndex);
    float _194 = 1.0f - (((saturate(_56.x * _56.w) * (WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._largeNoiseDarkness) - _178)) + _178) * (1.0f - abs(sin((_155 * 3.1415927410125732f) * ((frac(sin(dot(float2(floor(_155 * 0.05999999865889549f), 17.0f), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 0.07199999690055847f) + 0.04800000041723251f)))));
    float _204 = (((_194 * _121) - _27.x) * _39) + _27.x;
    float _205 = (((_194 * _122) - _27.y) * _39) + _27.y;
    float _206 = (((_194 * _123) - _27.z) * _39) + _27.z;
    int _207 = WaveReadLaneFirst(_materialIndex);
    float _229 = (((_204 * WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._slopeRGB.x)) - _204) * _39) + _204;
    float _230 = (((_205 * WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._slopeRGB.y)) - _205) * _39) + _205;
    float _231 = (((_206 * WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._slopeRGB.z)) - _206) * _39) + _206;
    int _232 = WaveReadLaneFirst(_materialIndex);
    float _240 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._saturationRatio);
    float _241 = dot(float3(_229, _230, _231), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _257 = (((_241 - _229) + ((_229 - _241) * _240)) * _39) + _229;
    float _258 = (((_241 - _230) + ((_230 - _241) * _240)) * _39) + _230;
    float _259 = (((_241 - _231) + ((_231 - _241) * _240)) * _39) + _231;
    int _266 = WaveReadLaneFirst(_materialIndex);
    int _274 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_266 < (uint)170000), _266, 0)) + 0u))]._noiseTexture);
    float4 _281 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_274 < (uint)65000), _274, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((_time.x * 0.019999999552965164f) + (TEXCOORD.y * 4.0f))));
    int _282 = WaveReadLaneFirst(_materialIndex);
    float _292 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))]._vignetteRatio) * _39);
    int _293 = WaveReadLaneFirst(_materialIndex);
    [branch]
    if (!(!(_292 >= 0.0010000000474974513f))) {
      float _310 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_293 < (uint)170000), _293, 0)) + 0u))]._vignetteWidth)) * 0.5f;
      float _313 = max((abs(TEXCOORD.x + -0.5f) - _310), 0.0f);
      float _314 = max((abs(TEXCOORD.y + -0.5f) - _310), 0.0f);
      float _326 = saturate(saturate(saturate(sqrt((_314 * _314) + (_313 * _313)) * 1.25f) * 2.0f) - (_281.x * 0.10000000149011612f)) * _292;
      _334 = (_257 - (_326 * _257));
      _335 = (_258 - (_326 * _258));
      _336 = (_259 - (_326 * _259));
    } else {
      _334 = _257;
      _335 = _258;
      _336 = _259;
    }
  } else {
    _334 = _27.x;
    _335 = _27.y;
    _336 = _27.z;
  }
  uint _337 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _344 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_337), 0));
    _350 = (float((uint)((uint)(_344.x & 127))) + 0.5f);
  } else {
    _350 = 1.0f;
  }
  bool _353 = (_localToneMappingParams.w > 0.0f);
  if (_353) {
    float3 output_color = TonemapReplacer(float3(_334, _335, _336));
    _706 = output_color.x;
    _707 = output_color.y;
    _708 = output_color.z;
  } else {
    _706 = _334;
    _707 = _335;
    _708 = _336;
  }
  if (_etcParams.y > 1.0f) {
    float _717 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _718 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _722 = saturate(1.0f - (dot(float2(_717, _718), float2(_717, _718)) * saturate(_etcParams.y + -1.0f)));
    _727 = (_722 * _706);
    _728 = (_722 * _707);
    _729 = (_722 * _708);
  } else {
    _727 = _706;
    _728 = _707;
    _729 = _708;
  }
  if ((_353) && ((_etcParams.z > 0.0f))) {
    _759 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), (((pow(_727, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _760 = select((_728 <= 0.0031308000907301903f), (_728 * 12.920000076293945f), (((pow(_728, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _761 = select((_729 <= 0.0031308000907301903f), (_729 * 12.920000076293945f), (((pow(_729, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _759 = _727;
    _760 = _728;
    _761 = _729;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _766 = float((uint)_337);
    if (!(_766 < _viewDir.w)) {
      if (!(_766 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _775 = _759;
        _776 = _760;
        _777 = _761;
      } else {
        _775 = 0.0f;
        _776 = 0.0f;
        _777 = 0.0f;
      }
    } else {
      _775 = 0.0f;
      _776 = 0.0f;
      _777 = 0.0f;
    }
  } else {
    _775 = _759;
    _776 = _760;
    _777 = _761;
  }
  SV_Target.x = _775;
  SV_Target.y = _776;
  SV_Target.z = _777;
  SV_Target.w = _350;
  return SV_Target;
}