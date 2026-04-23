#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _12[36];
  float4 _15 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  float _38;
  float _39;
  float _83;
  float _84;
  float _85;
  float _168;
  float _169;
  float _170;
  float _230;
  float _231;
  float _232;
  float _402;
  float _424;
  float _425;
  float _426;
  if (_postProcessParams.w > 0.0f) {
    float4 _32 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f);
    float4 _35 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f);
    _38 = _32.x;
    _39 = _35.z;
  } else {
    _38 = _15.x;
    _39 = _15.z;
  }

  _38 = lerp(_15.x, _38, CUSTOM_CHROMATIC_ABERRATION);
  _39 = lerp(_15.z, _39, CUSTOM_CHROMATIC_ABERRATION);

  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
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

  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_bt709 = float3(_83, _84, _85);
    color_bt709 = renodx::color::srgb::Decode(color_bt709);
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    color_bt709 = renodx::color::srgb::Encode(color_bt709);
    _83 = color_bt709.x;
    _84 = color_bt709.y;
    _85 = color_bt709.z;
  }

  uint _91 = uint(_screenSizeAndInvSize.x * TEXCOORD.x);
  uint _92 = uint(_screenSizeAndInvSize.y * TEXCOORD.y);
  float _94 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (!(((_94.x < 1.0000000116860974e-07f)) || ((_94.x == 1.0f))) && CUSTOM_SHARPENING_TYPE == 0) {
    float _102 = select((_postProcessParams.z >= 1.0f), 1.0f, 0.25f);
    float4 _109 = __3__36__0__0__g_sceneColor.Load(int3((int)(_91), ((int)(_92 + (uint)(-1))), 0));
    float4 _114 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_91 + (uint)(-1))), (int)(_92), 0));
    float4 _119 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_91 + 1u)), (int)(_92), 0));
    float4 _124 = __3__36__0__0__g_sceneColor.Load(int3((int)(_91), ((int)(_92 + 1u)), 0));
    float _135 = max(max(_84, _109.y), max(max(_114.y, _119.y), _124.y));
    float _142 = sqrt(saturate(min(min(min(_84, _109.y), min(min(_114.y, _119.y), _124.y)), (1.0f - _135)) * (1.0f / _135))) * (-1.0f / (((1.0f - _102) * 8.0f) + (_102 * 5.0f)));
    float _145 = 1.0f / ((_142 * 4.0f) + 1.0f);
    _168 = saturate(((_142 * (((_114.x + _109.x) + _119.x) + _124.x)) + _83) * _145);
    _169 = saturate(((_142 * (((_114.y + _109.y) + _119.y) + _124.y)) + _84) * _145);
    _170 = saturate(((_142 * (((_114.z + _109.z) + _119.z) + _124.z)) + _85) * _145);
    _168 = lerp(_83, _168, CUSTOM_SHARPENING);
    _169 = lerp(_84, _169, CUSTOM_SHARPENING);
    _170 = lerp(_85, _170, CUSTOM_SHARPENING);
  } else {
    _168 = _83;
    _169 = _84;
    _170 = _85;
  }
  float _201 = 1.0f - abs(_etcParams.w);
  float _205 = saturate(_etcParams.w);
  float _206 = (_201 * saturate(select((_168 < 0.040449999272823334f), (_168 * 0.07739938050508499f), exp2(log2((_168 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  float _207 = (_201 * saturate(select((_169 < 0.040449999272823334f), (_169 * 0.07739938050508499f), exp2(log2((_169 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  float _208 = (_201 * saturate(select((_170 < 0.040449999272823334f), (_170 * 0.07739938050508499f), exp2(log2((_170 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _205;
  if (_colorGradingParams.w > 0.0f) {
    float _213 = saturate(_colorGradingParams.w);
    _230 = (((max(0.0f, (1.0f - _206)) - _206) * _213) + _206);
    _231 = (((max(0.0f, (1.0f - _207)) - _207) * _213) + _207);
    _232 = (((max(0.0f, (1.0f - _208)) - _208) * _213) + _208);
  } else {
    _230 = _206;
    _231 = _207;
    _232 = _208;
  }
  float _239 = _userImageAdjust.y + 1.0f;
  float _243 = _userImageAdjust.x + 0.5f;
  float _244 = (_239 * (_230 + -0.5f)) + _243;
  float _245 = (_239 * (_231 + -0.5f)) + _243;
  float _246 = (_239 * (_232 + -0.5f)) + _243;
  _12[0] = 1.0f;
  _12[1] = 0.0f;
  _12[2] = 0.0f;
  _12[3] = 0.0f;
  _12[4] = 1.0f;
  _12[5] = 0.0f;
  _12[6] = 0.0f;
  _12[7] = 0.0f;
  _12[8] = 1.0f;
  _12[9] = 0.800000011920929f;
  _12[10] = 0.25832998752593994f;
  _12[11] = 0.0f;
  _12[12] = 0.20000000298023224f;
  _12[13] = 0.7416700124740601f;
  _12[14] = 0.14167000353336334f;
  _12[15] = 0.0f;
  _12[16] = 0.0f;
  _12[17] = 0.8583300113677979f;
  _12[18] = 0.8166700005531311f;
  _12[19] = 0.3333300054073334f;
  _12[20] = 0.0f;
  _12[21] = 0.1833299994468689f;
  _12[22] = 0.666670024394989f;
  _12[23] = 0.125f;
  _12[24] = 0.0f;
  _12[25] = 0.0f;
  _12[26] = 0.875f;
  _12[27] = 0.9666699767112732f;
  _12[28] = 0.0f;
  _12[29] = 0.0f;
  _12[30] = 0.033330000936985016f;
  _12[31] = 0.7333300113677979f;
  _12[32] = 0.1833299994468689f;
  _12[33] = 0.0f;
  _12[34] = 0.26666998863220215f;
  _12[35] = 0.8166700005531311f;
  int _287 = min(max(_colorBlindParam, 0), 3);
  float _342 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  float _353 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _354 = TEXCOORD.y * 2.0f;
  float _355 = 1.0f - _354;
  float _383 = mad((_projToPrevProj[3].z), 1.0000000116860974e-07f, mad((_projToPrevProj[3].y), _355, ((_projToPrevProj[3].x) * _353))) + (_projToPrevProj[3].w);
  float _386 = ((mad((_projToPrevProj[0].z), 1.0000000116860974e-07f, mad((_projToPrevProj[0].y), _355, ((_projToPrevProj[0].x) * _353))) + (_projToPrevProj[0].w)) / _383) - _353;
  float _387 = ((mad((_projToPrevProj[1].z), 1.0000000116860974e-07f, mad((_projToPrevProj[1].y), _355, ((_projToPrevProj[1].x) * _353))) + (_projToPrevProj[1].w)) / _383) - _355;
  if (_localToneMappingParams.w > 0.0f) {
    _402 = saturate(1.0f - (sqrt((_387 * _387) + (_386 * _386)) * 2.0f));
  } else {
    _402 = 1.0f;
  }
  float _405 = abs(_353);
  float _406 = abs(_354 + -1.0f);
  float _410 = saturate(1.0f - ((_402 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_405, _406), float2(_405, _406))));
  if (!(SV_Position.y < _viewDir.w)) {
    if (!(SV_Position.y >= (_screenSizeAndInvSize.y - _viewDir.w))) {
      _424 = (_410 * exp2(log2(saturate(mad((_12[((int)(6u + (_287 * 9)))]), _246, mad((_12[((int)(3u + (_287 * 9)))]), _245, ((_12[((int)(0u + (_287 * 9)))]) * _244))))) * _342));
      _425 = (_410 * exp2(log2(saturate(mad((_12[((int)(7u + (_287 * 9)))]), _246, mad((_12[((int)(4u + (_287 * 9)))]), _245, ((_12[((int)(1u + (_287 * 9)))]) * _244))))) * _342));
      _426 = (_410 * exp2(log2(saturate(mad((_12[((int)(8u + (_287 * 9)))]), _246, mad((_12[((int)(5u + (_287 * 9)))]), _245, ((_12[((int)(2u + (_287 * 9)))]) * _244))))) * _342));
    } else {
      _424 = 0.0f;
      _425 = 0.0f;
      _426 = 0.0f;
    }
  } else {
    _424 = 0.0f;
    _425 = 0.0f;
    _426 = 0.0f;
  }
  SV_Target.x = _424;
  SV_Target.y = _425;
  SV_Target.z = _426;
  SV_Target.w = _15.w;

  SV_Target.xyz = FinalizeSDR(SV_Target.xyz);

  return SV_Target;
}