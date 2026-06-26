#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

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

cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _15 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  float _38;
  float _39;
  float _83;
  float _84;
  float _85;
  float _145;
  float _146;
  float _147;
  float _250;
  float _272;
  float _273;
  float _274;
  if (_postProcessParams.w > 0.0f) {
    float4 _32 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f);
    float4 _35 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f);
    _38 = _32.x;
    _39 = _35.z;
  } else {
    _38 = _15.x;
    _39 = _15.z;
  }
  // RenoDX: >>> [Patch: FinalChromaticAberration] [Version: 1.10]
  _38 = lerp(_15.x, _38, CUSTOM_CHROMATIC_ABERRATION);
  _39 = lerp(_15.z, _39, CUSTOM_CHROMATIC_ABERRATION);
  // RenoDX: <<< [Patch: FinalChromaticAberration]

  // RenoDX: >>> [Patch: CustomFilmGrainGate] [Version: 1.10]
  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  // RenoDX: <<< [Patch: CustomFilmGrainGate]
  if (vanilla_film_grain) {
    float _49 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * _time.x;
    float _50 = _49 * 0.7692307829856873f;
    float _54 = frac(abs(_50));
    float _59 = _49 * 0.08130080997943878f;
    float _63 = frac(abs(_59));
    float _68 = ((select((_59 >= (-0.0f - _59)), _63, (-0.0f - _63)) * 1230.0f) + 10.0f) * ((select((_50 >= (-0.0f - _50)), _54, (-0.0f - _54)) * 13.0f) + 1.0f);
    float _72 = frac(abs(_68));
    float _78 = ((0.007500052452087402f - (select((_68 >= (-0.0f - _68)), _72, (-0.0f - _72)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _83 = (_78 * _38);
    _84 = (_78 * _15.y);
    _85 = (_78 * _39);
  } else {
    _83 = _38;
    _84 = _15.y;
    _85 = _39;
  }
  // RenoDX: >>> [Patch: FinalCustomPostProcessingSDR] [Version: 1.10]
  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_bt709 = renodx::color::srgb::Decode(float3(_83, _84, _85));
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    color_bt709 = renodx::color::srgb::Encode(color_bt709);
    _83 = color_bt709.x;
    _84 = color_bt709.y;
    _85 = color_bt709.z;
  }
  // RenoDX: <<< [Patch: FinalCustomPostProcessingSDR]

  float _116 = 1.0f - abs(_etcParams.w);
  float _120 = saturate(_etcParams.w);
  float _121 = (_116 * saturate(select((_83 < 0.040449999272823334f), (_83 * 0.07739938050508499f), exp2(log2((_83 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _120;
  float _122 = (_116 * saturate(select((_84 < 0.040449999272823334f), (_84 * 0.07739938050508499f), exp2(log2((_84 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _120;
  float _123 = (_116 * saturate(select((_85 < 0.040449999272823334f), (_85 * 0.07739938050508499f), exp2(log2((_85 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _120;
  if (_colorGradingParams.w > 0.0f) {
    float _128 = saturate(_colorGradingParams.w);
    _145 = (((max(0.0f, (1.0f - _121)) - _121) * _128) + _121);
    _146 = (((max(0.0f, (1.0f - _122)) - _122) * _128) + _122);
    _147 = (((max(0.0f, (1.0f - _123)) - _123) * _128) + _123);
  } else {
    _145 = _121;
    _146 = _122;
    _147 = _123;
  }
  float _154 = _userImageAdjust.y + 1.0f;
  float _158 = _userImageAdjust.x + 0.5f;
  float _159 = (_154 * (_145 + -0.5f)) + _158;
  float _160 = (_154 * (_146 + -0.5f)) + _158;
  float _161 = (_154 * (_147 + -0.5f)) + _158;
  float _191 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  float _202 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _203 = TEXCOORD.y * 2.0f;
  float _204 = 1.0f - _203;
  float _232 = mad((_projToPrevProj[3].z), 1.0000000116860974e-07f, mad((_projToPrevProj[3].y), _204, ((_projToPrevProj[3].x) * _202))) + (_projToPrevProj[3].w);
  float _235 = ((mad((_projToPrevProj[0].z), 1.0000000116860974e-07f, mad((_projToPrevProj[0].y), _204, ((_projToPrevProj[0].x) * _202))) + (_projToPrevProj[0].w)) / _232) - _202;
  float _236 = ((mad((_projToPrevProj[1].z), 1.0000000116860974e-07f, mad((_projToPrevProj[1].y), _204, ((_projToPrevProj[1].x) * _202))) + (_projToPrevProj[1].w)) / _232) - _204;
  if (_localToneMappingParams.w > 0.0f) {
    _250 = saturate(1.0f - (sqrt((_236 * _236) + (_235 * _235)) * 2.0f));
  } else {
    _250 = 1.0f;
  }
  float _253 = abs(_202);
  float _254 = abs(_203 + -1.0f);
  float _258 = saturate(1.0f - ((_250 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_253, _254), float2(_253, _254))));
  if (!(SV_Position.y < _viewDir.w)) {
    if (!(SV_Position.y >= (_screenSizeAndInvSize.y - _viewDir.w))) {
      _272 = (_258 * exp2(log2(saturate(mad(_colorBlind0.z, _161, mad(_colorBlind0.y, _160, (_159 * _colorBlind0.x))))) * _191));
      _273 = (_258 * exp2(log2(saturate(mad(_colorBlind1.z, _161, mad(_colorBlind1.y, _160, (_159 * _colorBlind1.x))))) * _191));
      _274 = (_258 * exp2(log2(saturate(mad(_colorBlind2.z, _161, mad(_colorBlind2.y, _160, (_159 * _colorBlind2.x))))) * _191));
    } else {
      _272 = 0.0f;
      _273 = 0.0f;
      _274 = 0.0f;
    }
  } else {
    _272 = 0.0f;
    _273 = 0.0f;
    _274 = 0.0f;
  }
  SV_Target.x = _272;
  SV_Target.y = _273;
  SV_Target.z = _274;
  SV_Target.w = _15.w;

  // RenoDX: >>> [Patch: FinalizePostProcessSDR] [Version: 1.10]
  SV_Target.xyz = FinalizeSDR(SV_Target.xyz, _sunDirection.y, _moonDirection.y);
  // RenoDX: <<< [Patch: FinalizePostProcessSDR]
  return SV_Target;
}