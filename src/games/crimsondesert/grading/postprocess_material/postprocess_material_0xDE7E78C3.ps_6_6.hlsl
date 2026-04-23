#include "../tonemap.hlsli"

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

ConstantBuffer<PostProcessDrugStruct> BindlessParameters_PostProcessDrug[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float _26 = TEXCOORD.x + -0.5f;
  float _27 = TEXCOORD.y + -0.5f;
  float _36 = saturate(min(((0.5f - abs(_26)) * _srcTargetSizeAndInv.x), ((0.5f - abs(_27)) * _srcTargetSizeAndInv.y)) * 0.05000000074505806f);
  float4 _39 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _49 = (pow(_39.x, 0.012683313339948654f));
  float _50 = (pow(_39.y, 0.012683313339948654f));
  float _51 = (pow(_39.z, 0.012683313339948654f));
  float _76 = exp2(log2(max(0.0f, (_49 + -0.8359375f)) / (18.8515625f - (_49 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _79 = WaveReadLaneFirst(_materialIndex);
  float _87 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))]._distortionDensity);
  int _88 = WaveReadLaneFirst(_materialIndex);
  float _102 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._distortionScale) * 0.009999999776482582f;
  float _103 = cos(_time.x + (_87 * TEXCOORD.x)) * _102;
  int _107 = WaveReadLaneFirst(_materialIndex);
  int _124 = WaveReadLaneFirst(_materialIndex);
  float _132 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))]._panningWidth);
  int _133 = WaveReadLaneFirst(_materialIndex);
  float _141 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._blendBias);
  int _142 = WaveReadLaneFirst(_materialIndex);
  float _153 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))]._panningSpeed);
  float _156 = _132 * -0.009999999776482582f;
  float4 _161 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_153 * 0.8975979089736938f) * _156) + TEXCOORD.y)));
  float4 _172 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_132 * 0.009999999776482582f) * sin(_153 * 2.094395160675049f)) + TEXCOORD.y)));
  int _178 = WaveReadLaneFirst(_materialIndex);
  float _191 = min(max((sin(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))]._changeSpeed) * _time.x) * 2.0f), 0.0f), 1.0f);
  float _192 = _191 * _141;
  float _199 = (_192 * (_172.x - _161.x)) + _161.x;
  float _200 = (_192 * (_172.y - _161.y)) + _161.y;
  float _201 = (_192 * (_172.z - _161.z)) + _161.z;
  float4 _208 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_153 * 1.2566370964050293f) * _156) + ((_103 * _36) + TEXCOORD.x)), (((_102 * _36) * sin((WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._distortionSpeed) * _time.x) + (((TEXCOORD.y + TEXCOORD.x) + _103) * _87))) + TEXCOORD.y)));
  float _218 = (pow(_208.x, 0.012683313339948654f));
  float _219 = (pow(_208.y, 0.012683313339948654f));
  float _220 = (pow(_208.z, 0.012683313339948654f));
  float _251 = min(max((1.0f - _191), 0.0f), 1.0f) * _141;
  int _261 = WaveReadLaneFirst(_materialIndex);
  float _271 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))]._colorTint.x);
  float _272 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))]._colorTint.y);
  float _273 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))]._colorTint.z);
  int _311 = WaveReadLaneFirst(_materialIndex);
  int _321 = WaveReadLaneFirst(_materialIndex);
  int _330 = WaveReadLaneFirst(_materialIndex);
  float _345 = saturate((sqrt((_27 * _27) + (_26 * _26)) - WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))]._centerMaskRadius)) / max(0.0010000000474974513f, (saturate(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_330 < (uint)170000), _330, 0)) + 0u))]._centerMaskRadius) * 2.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))]._centerMaskHardness)))) * _36;
  float _355 = (_345 * ((select((_271 < 0.040449999272823334f), (_271 * 0.07739938050508499f), exp2(log2((_271 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_218 + -0.8359375f)) / (18.8515625f - (_218 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _199)) + _199)) - _76)) + _76;
  float _356 = (_345 * ((select((_272 < 0.040449999272823334f), (_272 * 0.07739938050508499f), exp2(log2((_272 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_219 + -0.8359375f)) / (18.8515625f - (_219 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _200)) + _200)) - _77)) + _77;
  float _357 = (_345 * ((select((_273 < 0.040449999272823334f), (_273 * 0.07739938050508499f), exp2(log2((_273 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_220 + -0.8359375f)) / (18.8515625f - (_220 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _201)) + _201)) - _78)) + _78;
  uint _358 = uint(SV_Position.y);
  float _372;
  float _618;
  float _619;
  float _620;
  float _740;
  float _741;
  float _742;
  float _763;
  float _764;
  float _765;
  float _798;
  float _799;
  float _800;
  float _814;
  float _815;
  float _816;
  if (_etcParams.y == 1.0f) {
    uint2 _366 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_358), 0));
    _372 = (float((uint)((uint)(_366.x & 127))) + 0.5f);
  } else {
    _372 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_355, _356, _357));
    _740 = output_color.x;
    _741 = output_color.y;
    _742 = output_color.z;
  } else {
    _740 = _355;
    _741 = _356;
    _742 = _357;
  }
  if (_etcParams.y > 1.0f) {
    float _753 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _754 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _758 = saturate(1.0f - (dot(float2(_753, _754), float2(_753, _754)) * saturate(_etcParams.y + -1.0f)));
    _763 = (_758 * _740);
    _764 = (_758 * _741);
    _765 = (_758 * _742);
  } else {
    _763 = _740;
    _764 = _741;
    _765 = _742;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _798 = select((_763 <= 0.0031308000907301903f), (_763 * 12.920000076293945f), (((pow(_763, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _799 = select((_764 <= 0.0031308000907301903f), (_764 * 12.920000076293945f), (((pow(_764, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _800 = select((_765 <= 0.0031308000907301903f), (_765 * 12.920000076293945f), (((pow(_765, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _798 = _763;
    _799 = _764;
    _800 = _765;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _805 = float((uint)_358);
    if (!(_805 < _viewDir.w)) {
      if (!(_805 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _814 = _798;
        _815 = _799;
        _816 = _800;
      } else {
        _814 = 0.0f;
        _815 = 0.0f;
        _816 = 0.0f;
      }
    } else {
      _814 = 0.0f;
      _815 = 0.0f;
      _816 = 0.0f;
    }
  } else {
    _814 = _798;
    _815 = _799;
    _816 = _800;
  }
  float _826 = exp2(log2(_814 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _827 = exp2(log2(_815 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _828 = exp2(log2(_816 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_826 * 18.6875f) + 1.0f)) * ((_826 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_827 * 18.6875f) + 1.0f)) * ((_827 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_828 * 18.6875f) + 1.0f)) * ((_828 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _372;
  return SV_Target;
}

