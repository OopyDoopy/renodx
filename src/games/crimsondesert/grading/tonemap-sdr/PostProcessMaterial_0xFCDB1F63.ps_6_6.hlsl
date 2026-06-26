struct PostProcessDrugStruct {
  float _panningSpeed;
  float _changeSpeed;
  float _panningWidth;
  float _distortionScale;
  float _distortionSpeed;
  float _distortionDensity;
  float _blendBias;
  float3 _colorTint;
  float _drugPPIntensity;
  float _centerMaskRadius;
  float _centerMaskHardness;
};


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

ConstantBuffer<PostProcessDrugStruct> BindlessParameters_PostProcessDrug[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _27 = TEXCOORD.x + -0.5f;
  float _28 = TEXCOORD.y + -0.5f;
  float _37 = saturate(min(((0.5f - abs(_27)) * _srcTargetSizeAndInv.x), ((0.5f - abs(_28)) * _srcTargetSizeAndInv.y)) * 0.05000000074505806f);
  float4 _40 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _50 = (pow(_40.x, 0.012683313339948654f));
  float _51 = (pow(_40.y, 0.012683313339948654f));
  float _52 = (pow(_40.z, 0.012683313339948654f));
  float _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _79 = exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _80 = WaveReadLaneFirst(_materialIndex);
  float _88 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))]._distortionDensity);
  int _89 = WaveReadLaneFirst(_materialIndex);
  float _103 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_89 < (uint)170000), _89, 0)) + 0u))]._distortionScale) * 0.009999999776482582f;
  float _104 = cos(_time.x + (_88 * TEXCOORD.x)) * _103;
  int _108 = WaveReadLaneFirst(_materialIndex);
  int _125 = WaveReadLaneFirst(_materialIndex);
  float _133 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_125 < (uint)170000), _125, 0)) + 0u))]._panningWidth);
  int _134 = WaveReadLaneFirst(_materialIndex);
  float _142 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_134 < (uint)170000), _134, 0)) + 0u))]._blendBias);
  int _143 = WaveReadLaneFirst(_materialIndex);
  float _154 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))]._panningSpeed);
  float _157 = _133 * -0.009999999776482582f;
  float4 _162 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_154 * 0.8975979089736938f) * _157) + TEXCOORD.y)));
  float4 _173 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_133 * 0.009999999776482582f) * sin(_154 * 2.094395160675049f)) + TEXCOORD.y)));
  int _179 = WaveReadLaneFirst(_materialIndex);
  float _192 = min(max((sin(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._changeSpeed) * _time.x) * 2.0f), 0.0f), 1.0f);
  float _193 = _192 * _142;
  float _200 = (_193 * (_173.x - _162.x)) + _162.x;
  float _201 = (_193 * (_173.y - _162.y)) + _162.y;
  float _202 = (_193 * (_173.z - _162.z)) + _162.z;
  float4 _209 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_154 * 1.2566370964050293f) * _157) + ((_104 * _37) + TEXCOORD.x)), (((_103 * _37) * sin((WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._distortionSpeed) * _time.x) + (((TEXCOORD.y + TEXCOORD.x) + _104) * _88))) + TEXCOORD.y)));
  float _219 = (pow(_209.x, 0.012683313339948654f));
  float _220 = (pow(_209.y, 0.012683313339948654f));
  float _221 = (pow(_209.z, 0.012683313339948654f));
  float _252 = min(max((1.0f - _192), 0.0f), 1.0f) * _142;
  int _262 = WaveReadLaneFirst(_materialIndex);
  float _272 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_262 < (uint)170000), _262, 0)) + 0u))]._colorTint.x);
  float _273 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_262 < (uint)170000), _262, 0)) + 0u))]._colorTint.y);
  float _274 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_262 < (uint)170000), _262, 0)) + 0u))]._colorTint.z);
  int _312 = WaveReadLaneFirst(_materialIndex);
  int _322 = WaveReadLaneFirst(_materialIndex);
  int _331 = WaveReadLaneFirst(_materialIndex);
  float _346 = saturate((sqrt((_28 * _28) + (_27 * _27)) - WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_312 < (uint)170000), _312, 0)) + 0u))]._centerMaskRadius)) / max(0.0010000000474974513f, (saturate(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_331 < (uint)170000), _331, 0)) + 0u))]._centerMaskRadius) * 2.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_322 < (uint)170000), _322, 0)) + 0u))]._centerMaskHardness)))) * _37;
  float _356 = (_346 * ((select((_272 < 0.040449999272823334f), (_272 * 0.07739938050508499f), exp2(log2((_272 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_252 * ((exp2(log2(max(0.0f, (_219 + -0.8359375f)) / (18.8515625f - (_219 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _200)) + _200)) - _77)) + _77;
  float _357 = (_346 * ((select((_273 < 0.040449999272823334f), (_273 * 0.07739938050508499f), exp2(log2((_273 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_252 * ((exp2(log2(max(0.0f, (_220 + -0.8359375f)) / (18.8515625f - (_220 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _201)) + _201)) - _78)) + _78;
  float _358 = (_346 * ((select((_274 < 0.040449999272823334f), (_274 * 0.07739938050508499f), exp2(log2((_274 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_252 * ((exp2(log2(max(0.0f, (_221 + -0.8359375f)) / (18.8515625f - (_221 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _202)) + _202)) - _79)) + _79;
  uint _359 = uint(SV_Position.y);
  float _373;
  float _578;
  float _579;
  float _580;
  float _673;
  float _674;
  float _675;
  float _729;
  float _730;
  float _731;
  float _750;
  float _751;
  float _752;
  float _782;
  float _783;
  float _784;
  float _798;
  float _799;
  float _800;
  if (_etcParams.y == 1.0f) {
    uint2 _367 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_359), 0));
    _373 = (float((uint)((uint)(_367.x & 127))) + 0.5f);
  } else {
    _373 = _postProcessParams.x;
  }
  bool _376 = (_localToneMappingParams.w > 0.0f);
  if (_376) {
    float3 output_color = TonemapReplacer(float3(_356, _357, _358));
    _729 = output_color.x;
    _730 = output_color.y;
    _731 = output_color.z;
  } else {
    _729 = _356;
    _730 = _357;
    _731 = _358;
  }
  if (_etcParams.y > 1.0f) {
    float _740 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _741 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _745 = saturate(1.0f - (dot(float2(_740, _741), float2(_740, _741)) * saturate(_etcParams.y + -1.0f)));
    _750 = (_745 * _729);
    _751 = (_745 * _730);
    _752 = (_745 * _731);
  } else {
    _750 = _729;
    _751 = _730;
    _752 = _731;
  }
  if ((_376) && ((_etcParams.z > 0.0f))) {
    _782 = select((_750 <= 0.0031308000907301903f), (_750 * 12.920000076293945f), (((pow(_750, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _783 = select((_751 <= 0.0031308000907301903f), (_751 * 12.920000076293945f), (((pow(_751, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _784 = select((_752 <= 0.0031308000907301903f), (_752 * 12.920000076293945f), (((pow(_752, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _782 = _750;
    _783 = _751;
    _784 = _752;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _789 = float((uint)_359);
    if (!(_789 < _viewDir.w)) {
      if (!(_789 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _798 = _782;
        _799 = _783;
        _800 = _784;
      } else {
        _798 = 0.0f;
        _799 = 0.0f;
        _800 = 0.0f;
      }
    } else {
      _798 = 0.0f;
      _799 = 0.0f;
      _800 = 0.0f;
    }
  } else {
    _798 = _782;
    _799 = _783;
    _800 = _784;
  }
  float _810 = exp2(log2(_798 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _811 = exp2(log2(_799 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _812 = exp2(log2(_800 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_810 * 18.6875f) + 1.0f)) * ((_810 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_811 * 18.6875f) + 1.0f)) * ((_811 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_812 * 18.6875f) + 1.0f)) * ((_812 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _373;
  return SV_Target;
}