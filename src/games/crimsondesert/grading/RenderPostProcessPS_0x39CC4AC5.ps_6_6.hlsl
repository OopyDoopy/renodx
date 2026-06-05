#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
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
  row_major float4x4 _viewProj;
  row_major float4x4 _viewProjNoJitter;
  row_major float4x4 _viewProjRelative;
  row_major float4x4 _viewProjRelativeNoJitter;
  row_major float4x4 _invViewProj;
  row_major float4x4 _invViewProjRelative;
  row_major float4x4 _invViewProjRelativeNoJitter;
  row_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  row_major float4x4 _view;
  row_major float4x4 _viewRelative;
  row_major float4x4 _viewRelativePrev;
  row_major float4x4 _proj;
  row_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  row_major float4x4 _viewProjNoJitterPrev;
  row_major float4x4 _viewProjRelativePrev;
  row_major float4x4 _viewProjRelativeNoJitterPrev;
  row_major float4x4 _invViewProjPrev;
  row_major float4x4 _invViewProjRelativePrev;
  row_major float4x4 _projToPrevProj;
  row_major float4x4 _projToPrevProjNoTranslation;
  row_major float4x4 _viewProjectionTexScale;
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
  min16float4 _debugBaseColor16;
  min16float4 _debugNormal16;
  min16float4 _debugMaterial16;
  min16float4 _debugMultiplier16;
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
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _14;
  float _37;
  float _38;
  float _82;
  float _83;
  float _84;
  float _167;
  float _168;
  float _169;
  float _229;
  float _230;
  float _231;
  float _277;
  float _278;
  float _279;
  float _347;
  float _48;
  float _49;
  float _53;
  float _58;
  float _62;
  float _67;
  float _71;
  float _77;
  uint _90;
  uint _91;
  float _93;
  float _101;
  float4 _108;
  float4 _113;
  float4 _118;
  float4 _123;
  float _134;
  float _141;
  float _144;
  float _200;
  float _204;
  float _205;
  float _206;
  float _207;
  float _212;
  float _238;
  float _242;
  float _243;
  float _244;
  float _245;
  int _249;
  float _288;
  float _299;
  float _300;
  float _301;
  float _329;
  float _332;
  float _333;
  float _350;
  float _351;
  float _355;
  bool _364;
  _14 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));  // [sem: _3__36__0__0__g_sceneColor_sample]
  if (_postProcessParams.w > 0.0f) {
    _37 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f))).x);
    _38 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f))).z);
  } else {
    _37 = _14.x;
    _38 = _14.z;
  }
  // RenoDX: >>> [Patch: FinalChromaticAberration] [Version: 1.10]
  // Description: The final postprocess pass offsets the red and blue channels for vanilla chromatic aberration. This patch scales that separation against the original sample so the existing chromatic-aberration control retains the 1.09 behavior on the 1.10 final shader.
  _37 = lerp(_14.x, _37, CUSTOM_CHROMATIC_ABERRATION);
  _38 = lerp(_14.z, _38, CUSTOM_CHROMATIC_ABERRATION);
  // RenoDX: <<< [Patch: FinalChromaticAberration]
  // RenoDX: >>> [Patch: CustomFilmGrainGate] [Version: 1.10]
  // Description: Vanilla film grain is driven by `_slopeParams.w` in this final pass. This patch disables the native grain branch when RenoDX custom film grain is selected so the existing film-grain control does not stack two grain sources.
  bool _rndx_vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  // RenoDX: <<< [Patch: CustomFilmGrainGate]
  if (_rndx_vanilla_film_grain) {
    _48 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * _time.x;
    _49 = _48 * 0.7692307829856873f;
    _53 = frac(abs(_49));
    _58 = _48 * 0.08130080997943878f;
    _62 = frac(abs(_58));
    _67 = ((select((_58 >= (-0.0f - _58)), _62, (-0.0f - _62)) * 1230.0f) + 10.0f) * ((select((_49 >= (-0.0f - _49)), _53, (-0.0f - _53)) * 13.0f) + 1.0f);
    _71 = frac(abs(_67));
    _77 = ((0.007500052452087402f - (select((_67 >= (-0.0f - _67)), _71, (-0.0f - _71)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _82 = (_77 * _37);
    _83 = (_77 * _14.y);
    _84 = (_77 * _38);
  } else {
    _82 = _37;
    _83 = _14.y;
    _84 = _38;
  }
  // RenoDX: >>> [Patch: FinalCustomPostProcessingSDR] [Version: 1.10]
  // Description: The shipped 1.09 SDR final pass ran RenoDX custom film grain and RCAS sharpening on linearized SDR color before the native final sharpen, vignette, and output encoding chain. This patch preserves that ordering on the 1.10 successor so SDR film grain and sharpening keep their prior color-space behavior.
  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 _rndx_color_bt709 = renodx::color::srgb::Decode(float3(_82, _83, _84));
    _rndx_color_bt709 = CustomPostProcessing(_rndx_color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    _rndx_color_bt709 = renodx::color::srgb::Encode(_rndx_color_bt709);
    _82 = _rndx_color_bt709.x;
    _83 = _rndx_color_bt709.y;
    _84 = _rndx_color_bt709.z;
  }
  // RenoDX: <<< [Patch: FinalCustomPostProcessingSDR]
  _90 = uint(_screenSizeAndInvSize.x * TEXCOORD.x);
  _91 = uint(_screenSizeAndInvSize.y * TEXCOORD.y);
  _93 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));  // [sem: _3__36__0__0__g_depth_sample]
  if (!((_93.x < 1.0000000116860974e-07f) || (_93.x == 1.0f))) {
    _101 = select((_postProcessParams.z >= 1.0f), 1.0f, 0.25f);
    _108 = __3__36__0__0__g_sceneColor.Load(int3(_90, ((int)(_91 + (uint)(-1))), 0));  // [sem: _3__36__0__0__g_sceneColor_load]
    _113 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_90 + (uint)(-1))), _91, 0));  // [sem: _3__36__0__0__g_sceneColor_load]
    _118 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_90 + 1u)), _91, 0));  // [sem: _3__36__0__0__g_sceneColor_load]
    _123 = __3__36__0__0__g_sceneColor.Load(int3(_90, ((int)(_91 + 1u)), 0));  // [sem: _3__36__0__0__g_sceneColor_load]
    _134 = max(max(_83, _108.y), max(max(_113.y, _118.y), _123.y));
    _141 = sqrt(saturate(min(min(min(_83, _108.y), min(min(_113.y, _118.y), _123.y)), (1.0f - _134)) * (1.0f / _134))) * (-1.0f / (((1.0f - _101) * 8.0f) + (_101 * 5.0f)));
    _144 = 1.0f / ((_141 * 4.0f) + 1.0f);
    _167 = saturate(((_141 * (((_113.x + _108.x) + _118.x) + _123.x)) + _82) * _144);  // [sem: expr_sat]
    _168 = saturate(((_141 * (((_113.y + _108.y) + _118.y) + _123.y)) + _83) * _144);  // [sem: expr_sat]
    _169 = saturate(((_141 * (((_113.z + _108.z) + _118.z) + _123.z)) + _84) * _144);  // [sem: expr_sat]
  } else {
    _167 = _82;  // [sem: expr_sat]
    _168 = _83;  // [sem: expr_sat]
    _169 = _84;  // [sem: expr_sat]
  }
  // RenoDX: >>> [Patch: FinalSharpeningStrength] [Version: 1.10]
  // Description: The native final pass computes a sharpened sample from scene-color neighbors. This patch blends that result back toward the unsharpened postprocessed color with the existing RenoDX sharpening strength slider, matching the shipped 1.09 SDR final-pass behavior where 0 disables native final sharpening and 100 keeps the vanilla amount.
  _167 = lerp(_82, _167, CUSTOM_SHARPENING);
  _168 = lerp(_83, _168, CUSTOM_SHARPENING);
  _169 = lerp(_84, _169, CUSTOM_SHARPENING);
  // RenoDX: <<< [Patch: FinalSharpeningStrength]
  _200 = 1.0f - abs(_etcParams.w);
  _204 = saturate(_etcParams.w);  // [sem: expr_sat]
  _205 = (_200 * saturate(select((_167 < 0.040449999272823334f), (_167 * 0.07739938050508499f), exp2(log2((_167 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _204;
  _206 = (_200 * saturate(select((_168 < 0.040449999272823334f), (_168 * 0.07739938050508499f), exp2(log2((_168 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _204;
  _207 = (_200 * saturate(select((_169 < 0.040449999272823334f), (_169 * 0.07739938050508499f), exp2(log2((_169 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _204;
  if (_colorGradingParams.w > 0.0f) {
    _212 = saturate(_colorGradingParams.w);  // [sem: expr_sat]
    _229 = (((max(0.0f, (1.0f - _205)) - _205) * _212) + _205);
    _230 = (((max(0.0f, (1.0f - _206)) - _206) * _212) + _206);
    _231 = (((max(0.0f, (1.0f - _207)) - _207) * _212) + _207);
  } else {
    _229 = _205;
    _230 = _206;
    _231 = _207;
  }
  _238 = _userImageAdjust.y + 1.0f;
  _242 = _userImageAdjust.x + 0.5f;
  _243 = (_238 * (_229 + -0.5f)) + _242;
  _244 = (_238 * (_230 + -0.5f)) + _242;
  _245 = (_238 * (_231 + -0.5f)) + _242;
  _249 = min((int)(max((int)(_colorBlindParam), (int)(0))), (int)(3));
  [branch]
  if (_249 == 1) {
    _277 = mad(0.20000000298023224f, _244, (_243 * 0.800000011920929f));
    _278 = mad(0.7416700124740601f, _244, (_243 * 0.25832998752593994f));
    _279 = mad(0.8583300113677979f, _245, mad(0.14167000353336334f, _244, 0.0f));
  } else {
    if (_249 == 2) {
      _277 = mad(0.1833299994468689f, _244, (_243 * 0.8166700005531311f));
      _278 = mad(0.666670024394989f, _244, (_243 * 0.3333300054073334f));
      _279 = mad(0.875f, _245, mad(0.125f, _244, 0.0f));
    } else {
      if (_249 == 3) {
        _277 = mad(0.033330000936985016f, _244, (_243 * 0.9666699767112732f));
        _278 = mad(0.26666998863220215f, _245, mad(0.7333300113677979f, _244, 0.0f));
        _279 = mad(0.8166700005531311f, _245, mad(0.1833299994468689f, _244, 0.0f));
      } else {
        _277 = _243;
        _278 = _244;
        _279 = _245;
      }
    }
  }
  _288 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  _299 = (TEXCOORD.x * 2.0f) + -1.0f;
  _300 = TEXCOORD.y * 2.0f;
  _301 = 1.0f - _300;
  _329 = mad((_projToPrevProj[2].w), 1.0000000116860974e-07f, mad((_projToPrevProj[1].w), _301, ((_projToPrevProj[0].w) * _299))) + (_projToPrevProj[3].w);
  _332 = ((mad((_projToPrevProj[2].x), 1.0000000116860974e-07f, mad((_projToPrevProj[1].x), _301, ((_projToPrevProj[0].x) * _299))) + (_projToPrevProj[3].x)) / _329) - _299;
  _333 = ((mad((_projToPrevProj[2].y), 1.0000000116860974e-07f, mad((_projToPrevProj[1].y), _301, ((_projToPrevProj[0].y) * _299))) + (_projToPrevProj[3].y)) / _329) - _301;
  if (_localToneMappingParams.w > 0.0f) {
    _347 = saturate(1.0f - (sqrt((_333 * _333) + (_332 * _332)) * 2.0f));  // [sem: expr_sat]
  } else {
    _347 = 1.0f;  // [sem: expr_sat]
  }
  _350 = abs(_299);
  _351 = abs(_300 + -1.0f);
  // RenoDX: >>> [Patch: FinalVignetteStrength] [Version: 1.10]
  // Description: The final postprocess pass applies edge darkening from `_postProcessParams.x`. This patch multiplies that vanilla strength by the existing RenoDX vignette control so the 1.09 vignette toggle remains effective on the 1.10 final shader.
  _355 = saturate(1.0f - ((_347 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_350, _351), float2(_350, _351))));  // [sem: expr_sat]
  // RenoDX: <<< [Patch: FinalVignetteStrength]
  _364 = (!(SV_Position.y < _viewDir.w)) && (!(SV_Position.y >= (_screenSizeAndInvSize.y - _viewDir.w)));
  SV_Target.x = select(_364, (_355 * exp2(log2(saturate(_277)) * _288)), 0.0f);
  SV_Target.y = select(_364, (_355 * exp2(log2(saturate(_278)) * _288)), 0.0f);
  SV_Target.z = select(_364, (_355 * exp2(log2(saturate(_279)) * _288)), 0.0f);
  SV_Target.w = _14.w;
  // RenoDX: >>> [Patch: FinalizePostProcessSDR] [Version: 1.10]
  // Description: This final SDR output path is where color-temperature, Purkinje, and SDR black-crush adjustments were applied across the shipped 1.09 tonemap/final pair. The observed 1.10 final shader keeps the same finalization role, while SDR color grading is restored at the material tonemap branch so tuned settings remain in the historical pre-output space.
  SV_Target.xyz = FinalizeSDR(SV_Target.xyz, _sunDirection.y, _moonDirection.y);
  // RenoDX: <<< [Patch: FinalizePostProcessSDR]
  return SV_Target;
}
