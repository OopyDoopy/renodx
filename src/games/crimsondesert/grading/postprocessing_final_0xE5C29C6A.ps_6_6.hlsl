#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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
  float4 _16 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  float _39;
  float _40;
  float _84;
  float _85;
  float _86;
  float _169;
  float _170;
  float _171;
  float _231;
  float _232;
  float _233;
  float _336;
  if (_postProcessParams.w > 0.0f) {
    float4 _33 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f);
    float4 _36 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f);
    _39 = _33.x;
    _40 = _36.z;
  } else {
    _39 = _16.x;
    _40 = _16.z;
  }
  // RenoDX: >>> [Patch: FinalChromaticAberration] [Version: 1.10]
  _39 = lerp(_16.x, _39, CUSTOM_CHROMATIC_ABERRATION);
  _40 = lerp(_16.z, _40, CUSTOM_CHROMATIC_ABERRATION);
  // RenoDX: <<< [Patch: FinalChromaticAberration]

  // RenoDX: >>> [Patch: CustomFilmGrainGate] [Version: 1.10]
  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  // RenoDX: <<< [Patch: CustomFilmGrainGate]
  if (vanilla_film_grain) {
    float _50 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * _time.x;
    float _51 = _50 * 0.7692307829856873f;
    float _55 = frac(abs(_51));
    float _60 = _50 * 0.08130080997943878f;
    float _64 = frac(abs(_60));
    float _69 = ((select((_60 >= (-0.0f - _60)), _64, (-0.0f - _64)) * 1230.0f) + 10.0f) * ((select((_51 >= (-0.0f - _51)), _55, (-0.0f - _55)) * 13.0f) + 1.0f);
    float _73 = frac(abs(_69));
    float _79 = ((0.007500052452087402f - (select((_69 >= (-0.0f - _69)), _73, (-0.0f - _73)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _84 = (_79 * _39);
    _85 = (_79 * _16.y);
    _86 = (_79 * _40);
  } else {
    _84 = _39;
    _85 = _16.y;
    _86 = _40;
  }
  // RenoDX: >>> [Patch: FinalCustomPostProcessingSDR] [Version: 1.10]
  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_bt709 = renodx::color::srgb::Decode(float3(_84, _85, _86));
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    color_bt709 = renodx::color::srgb::Encode(color_bt709);
    _84 = color_bt709.x;
    _85 = color_bt709.y;
    _86 = color_bt709.z;
  }
  // RenoDX: <<< [Patch: FinalCustomPostProcessingSDR]

  uint _92 = uint(_screenSizeAndInvSize.x * TEXCOORD.x);
  uint _93 = uint(_screenSizeAndInvSize.y * TEXCOORD.y);
  float _95 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (!(((_95.x < 1.0000000116860974e-07f)) || ((_95.x == 1.0f)))) {
    float _103 = select((_postProcessParams.z >= 1.0f), 1.0f, 0.25f);
    float4 _110 = __3__36__0__0__g_sceneColor.Load(int3((int)(_92), ((int)(_93 + (uint)(-1))), 0));
    float4 _115 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_92 + (uint)(-1))), (int)(_93), 0));
    float4 _120 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_92 + 1u)), (int)(_93), 0));
    float4 _125 = __3__36__0__0__g_sceneColor.Load(int3((int)(_92), ((int)(_93 + 1u)), 0));
    float _136 = max(max(_85, _110.y), max(max(_115.y, _120.y), _125.y));
    float _143 = sqrt(saturate(min(min(min(_85, _110.y), min(min(_115.y, _120.y), _125.y)), (1.0f - _136)) * (1.0f / _136))) * (-1.0f / (((1.0f - _103) * 8.0f) + (_103 * 5.0f)));
    float _146 = 1.0f / ((_143 * 4.0f) + 1.0f);
    _169 = saturate(((_143 * (((_115.x + _110.x) + _120.x) + _125.x)) + _84) * _146);
    _170 = saturate(((_143 * (((_115.y + _110.y) + _120.y) + _125.y)) + _85) * _146);
    _171 = saturate(((_143 * (((_115.z + _110.z) + _120.z) + _125.z)) + _86) * _146);
  } else {
    _169 = _84;
    _170 = _85;
    _171 = _86;
  }
  // RenoDX: >>> [Patch: FinalSharpeningStrength] [Version: 1.10]
  _169 = lerp(_84, _169, CUSTOM_SHARPENING);
  _170 = lerp(_85, _170, CUSTOM_SHARPENING);
  _171 = lerp(_86, _171, CUSTOM_SHARPENING);
  // RenoDX: <<< [Patch: FinalSharpeningStrength]

  float _202 = 1.0f - abs(_etcParams.w);
  float _206 = saturate(_etcParams.w);
  float _207 = (_202 * saturate(select((_169 < 0.040449999272823334f), (_169 * 0.07739938050508499f), exp2(log2((_169 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _206;
  float _208 = (_202 * saturate(select((_170 < 0.040449999272823334f), (_170 * 0.07739938050508499f), exp2(log2((_170 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _206;
  float _209 = (_202 * saturate(select((_171 < 0.040449999272823334f), (_171 * 0.07739938050508499f), exp2(log2((_171 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _206;
  if (_colorGradingParams.w > 0.0f) {
    float _214 = saturate(_colorGradingParams.w);
    _231 = (((max(0.0f, (1.0f - _207)) - _207) * _214) + _207);
    _232 = (((max(0.0f, (1.0f - _208)) - _208) * _214) + _208);
    _233 = (((max(0.0f, (1.0f - _209)) - _209) * _214) + _209);
  } else {
    _231 = _207;
    _232 = _208;
    _233 = _209;
  }
  float _240 = _userImageAdjust.y + 1.0f;
  float _244 = _userImageAdjust.x + 0.5f;
  float _245 = (_240 * (_231 + -0.5f)) + _244;
  float _246 = (_240 * (_232 + -0.5f)) + _244;
  float _247 = (_240 * (_233 + -0.5f)) + _244;
  float _277 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  float _288 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _289 = TEXCOORD.y * 2.0f;
  float _290 = 1.0f - _289;
  float _318 = mad((_projToPrevProj[3].z), 1.0000000116860974e-07f, mad((_projToPrevProj[3].y), _290, ((_projToPrevProj[3].x) * _288))) + (_projToPrevProj[3].w);
  float _321 = ((mad((_projToPrevProj[0].z), 1.0000000116860974e-07f, mad((_projToPrevProj[0].y), _290, ((_projToPrevProj[0].x) * _288))) + (_projToPrevProj[0].w)) / _318) - _288;
  float _322 = ((mad((_projToPrevProj[1].z), 1.0000000116860974e-07f, mad((_projToPrevProj[1].y), _290, ((_projToPrevProj[1].x) * _288))) + (_projToPrevProj[1].w)) / _318) - _290;
  if (_localToneMappingParams.w > 0.0f) {
    _336 = saturate(1.0f - (sqrt((_322 * _322) + (_321 * _321)) * 2.0f));
  } else {
    _336 = 1.0f;
  }
  float _339 = abs(_288);
  float _340 = abs(_289 + -1.0f);
  float _344 = saturate(1.0f - ((_336 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_339, _340), float2(_339, _340))));
  bool _353 = ((!(SV_Position.y < _viewDir.w))) && ((!(SV_Position.y >= (_screenSizeAndInvSize.y - _viewDir.w))));
  SV_Target.x = select(_353, (_344 * exp2(log2(saturate(mad(_colorBlind0.z, _247, mad(_colorBlind0.y, _246, (_245 * _colorBlind0.x))))) * _277)), 0.0f);
  SV_Target.y = select(_353, (_344 * exp2(log2(saturate(mad(_colorBlind1.z, _247, mad(_colorBlind1.y, _246, (_245 * _colorBlind1.x))))) * _277)), 0.0f);
  SV_Target.z = select(_353, (_344 * exp2(log2(saturate(mad(_colorBlind2.z, _247, mad(_colorBlind2.y, _246, (_245 * _colorBlind2.x))))) * _277)), 0.0f);
  SV_Target.w = _16.w;

  // RenoDX: >>> [Patch: FinalizePostProcessSDR] [Version: 1.10]
  SV_Target.xyz = FinalizeSDR(SV_Target.xyz, _sunDirection.y, _moonDirection.y);
  // RenoDX: <<< [Patch: FinalizePostProcessSDR]
  return SV_Target;
}