#include "../tonemap.hlsli"

struct PostProcessScopeStruct {
  float _progress;
  float _lensRadius;
  float _lensDistance;
  float _lensYOffset;
  float _edgeSmoothness;
  float _distortionIntensity;
  float _chromaticRatio;
  float _opacity;
  uint _lensDirtTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessScopeStruct> BindlessParameters_PostProcessScope[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _21[36];
  float _27 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _28 = WaveReadLaneFirst(_materialIndex);
  float _37 = max(WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))]._lensRadius), 9.999999747378752e-05f);
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _47 = max(WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._edgeSmoothness), 9.999999747378752e-05f);
  int _48 = WaveReadLaneFirst(_materialIndex);
  float _56 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))]._lensDistance);
  int _60 = WaveReadLaneFirst(_materialIndex);
  int _69 = WaveReadLaneFirst(_materialIndex);
  int _78 = WaveReadLaneFirst(_materialIndex);
  float _86 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_78 < (uint)170000), _78, 0)) + 0u))]._opacity);
  float _89 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _90 = (TEXCOORD.y * 2.0f) + -1.0f;
  float _91 = _27 * _89;
  int _93 = WaveReadLaneFirst(_materialIndex);
  float _102 = _56 * -0.5f;
  float _103 = _56 * 0.5f;
  float _104 = _47 * _37;
  float _105 = _104 - _37;
  float _106 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._lensYOffset) + _90;
  float _107 = _106 * _106;
  float _154;
  float _155;
  float _420;
  float _664;
  float _665;
  float _666;
  float _786;
  float _787;
  float _788;
  float _805;
  float _806;
  float _807;
  float _840;
  float _841;
  float _842;
  float _856;
  float _857;
  float _858;
  if (_56 > 0.10000000149011612f) {
    float _109 = _91 - _102;
    float _110 = _91 - _103;
    float _113 = sqrt(_107 + (_109 * _109));
    float _117 = sqrt(_107 + (_110 * _110));
    float _121 = _37 * 0.6000000238418579f;
    float _126 = saturate((((_117 - _113) * 0.5f) / _121) + 0.5f);
    float _136 = saturate((((_117 + _105) + (_126 * (_113 - _117))) - ((_126 * _121) * (1.0f - _126))) / _104);
    _154 = ((_136 * _136) * (3.0f - (_136 * 2.0f)));
    _155 = select(((_113 / _37) < (_117 / _37)), _102, _103);
  } else {
    float _148 = saturate((sqrt((_91 * _91) + (_90 * _90)) + _105) / _104);
    _154 = ((_148 * _148) * (3.0f - (_148 * 2.0f)));
    _155 = 0.0f;
  }
  float _156 = 1.0f - _154;
  float _157 = _91 - _155;
  float _160 = sqrt((_157 * _157) + _107);
  float _161 = _160 / _37;
  bool _162 = (_160 > 9.999999747378752e-06f);
  float _166 = select(_162, (_106 / _160), 1.0f);
  float _172 = saturate(abs(TEXCOORD.x + -0.5f) / (saturate(_56) * 0.07999999821186066f));
  float _176 = (_172 * _172) * (3.0f - (_172 * 2.0f));
  float _177 = 1.0f - _47;
  float _180 = saturate((_161 - _177) / _47);
  float _184 = (_180 * _180) * (3.0f - (_180 * 2.0f));
  float _185 = select(_162, (_157 / _160), 0.0f) / _27;
  float _187 = (_176 * WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._distortionIntensity)) * _184;
  float _190 = (_187 * _185) + TEXCOORD.x;
  float _191 = (_187 * _166) + TEXCOORD.y;
  float _192 = _185 * _176;
  float _196 = sqrt((_192 * _192) + (_166 * _166));
  bool _197 = (_196 > 9.999999747378752e-06f);
  float _204 = ((float((uint)(uint)(_enableChromaticAberration)) * 0.014999999664723873f) * WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._chromaticRatio)) * _184;
  float _205 = select(_197, (_192 / _196), 0.0f) * _204;
  float _206 = select(_197, (_166 / _196), 1.0f) * _204;
  float4 _213 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_190 - _205), (_191 - _206)));
  float4 _215 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_190, _191));
  float4 _217 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_205 + _190), (_206 + _191)));
  float _223 = saturate((_sunDirection.y + 0.10000000149011612f) * 5.0f);
  float _229 = rsqrt(dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)));
  float _238 = rsqrt(dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)));
  float _239 = _238 * _moonDirection.x;
  float _240 = _238 * _moonDirection.y;
  float _241 = _238 * _moonDirection.z;
  float _243 = (3.0f - (_223 * 2.0f)) * (_223 * _223);
  float _250 = (((_229 * _sunDirection.x) - _239) * _243) + _239;
  float _251 = (((_229 * _sunDirection.y) - _240) * _243) + _240;
  float _252 = (((_229 * _sunDirection.z) - _241) * _243) + _241;
  float _254 = rsqrt(dot(float3(_250, _251, _252), float3(_250, _251, _252)));
  float _260 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _296 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _260, ((_invViewProjRelative[3].x) * _89));
  float _297 = ((mad((_invViewProjRelative[0].y), _260, ((_invViewProjRelative[0].x) * _89)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _296;
  float _298 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _260, ((_invViewProjRelative[1].x) * _89))) / _296;
  float _299 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _260, ((_invViewProjRelative[2].x) * _89))) / _296;
  float _301 = rsqrt(dot(float3(_297, _298, _299), float3(_297, _298, _299)));
  float _308 = saturate((dot(float3((_301 * _297), (_301 * _298), (_301 * _299)), float3((_250 * _254), (_251 * _254), (_252 * _254))) + -0.5f) * 2.0f);
  float _317 = max(0.5f, _177);
  float _321 = saturate(((_161 + -0.4000000059604645f) - _317) * 4.999999523162842f);
  float _329 = saturate((0.5f - _154) * -2.0f);
  float _338 = (_317 + 0.4000000059604645f) * 2.0f;
  float _342 = saturate((_161 - _338) / (((_317 + 0.6000000238418579f) * 0.009999999776482582f) - _338));
  float _346 = (_342 * _342) * (3.0f - (_342 * 2.0f));
  float _348 = (_346 * _346) * max((((_321 * _321) * _176) * (3.0f - (_321 * 2.0f))), ((_329 * _329) * (3.0f - (_329 * 2.0f))));
  float _354 = (((_243 * 1.3999998569488525f) + 5.599999904632568f) * saturate(exp2(log2((_308 * _308) * (3.0f - (_308 * 2.0f))) * 3.0f))) * saturate(1.399999976158142f - _154);
  float _355 = _348 * _354;
  int _361 = WaveReadLaneFirst(_materialIndex);
  int _369 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_361 < (uint)170000), _361, 0)) + 0u))]._lensDirtTexture);
  float4 _376 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_369 < (uint)65000), _369, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 1.2000000476837158f) * _27), (TEXCOORD.y * 1.2000000476837158f)));
  float _380 = dot(float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f), float3(_376.x, _376.y, _376.z));
  float _394 = (1.0f / max(0.0010000000474974513f, _exposure0.x)) * (_348 * (_354 + 3.0f));
  float _404 = ((_394 * (lerp(_380, _376.x, _355))) + (_213.x * _156)) * _86;
  float _405 = ((_394 * (lerp(_380, _376.y, _355))) + (_215.y * _156)) * _86;
  float _406 = ((_394 * (lerp(_380, _376.z, _355))) + (_217.z * _156)) * _86;
  uint _407 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _414 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_407), 0));
    _420 = (float((uint)((uint)(_414.x & 127))) + 0.5f);
  } else {
    _420 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_404, _405, _406));
    _786 = output_color.x;
    _787 = output_color.y;
    _788 = output_color.z;
  } else {
    _786 = _404;
    _787 = _405;
    _788 = _406;
  }
  if (_etcParams.y > 1.0f) {
    float _795 = abs(_89);
    float _796 = abs(_90);
    float _800 = saturate(1.0f - (dot(float2(_795, _796), float2(_795, _796)) * saturate(_etcParams.y + -1.0f)));
    _805 = (_800 * _786);
    _806 = (_800 * _787);
    _807 = (_800 * _788);
  } else {
    _805 = _786;
    _806 = _787;
    _807 = _788;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _840 = select((_805 <= 0.0031308000907301903f), (_805 * 12.920000076293945f), (((pow(_805, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _841 = select((_806 <= 0.0031308000907301903f), (_806 * 12.920000076293945f), (((pow(_806, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _842 = select((_807 <= 0.0031308000907301903f), (_807 * 12.920000076293945f), (((pow(_807, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _840 = _805;
    _841 = _806;
    _842 = _807;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _847 = float((uint)_407);
    if (!(_847 < _viewDir.w)) {
      if (!(_847 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _856 = _840;
        _857 = _841;
        _858 = _842;
      } else {
        _856 = 0.0f;
        _857 = 0.0f;
        _858 = 0.0f;
      }
    } else {
      _856 = 0.0f;
      _857 = 0.0f;
      _858 = 0.0f;
    }
  } else {
    _856 = _840;
    _857 = _841;
    _858 = _842;
  }
  SV_Target.x = _856;
  SV_Target.y = _857;
  SV_Target.z = _858;
  SV_Target.w = _420;
  return SV_Target;
}

