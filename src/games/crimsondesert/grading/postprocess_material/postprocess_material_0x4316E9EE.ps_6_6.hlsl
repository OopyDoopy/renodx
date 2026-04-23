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
  int _43 = WaveReadLaneFirst(_materialIndex);
  float _51 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._distortionDensity);
  int _52 = WaveReadLaneFirst(_materialIndex);
  float _66 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_52 < (uint)170000), _52, 0)) + 0u))]._distortionScale) * 0.009999999776482582f;
  float _67 = cos(_time.x + (_51 * TEXCOORD.x)) * _66;
  int _71 = WaveReadLaneFirst(_materialIndex);
  int _88 = WaveReadLaneFirst(_materialIndex);
  float _96 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._panningWidth);
  int _97 = WaveReadLaneFirst(_materialIndex);
  float _105 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._blendBias);
  int _106 = WaveReadLaneFirst(_materialIndex);
  float _117 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_106 < (uint)170000), _106, 0)) + 0u))]._panningSpeed);
  float _120 = _96 * -0.009999999776482582f;
  float4 _125 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_117 * 0.8975979089736938f) * _120) + TEXCOORD.y)));
  float4 _136 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_96 * 0.009999999776482582f) * sin(_117 * 2.094395160675049f)) + TEXCOORD.y)));
  int _142 = WaveReadLaneFirst(_materialIndex);
  float _155 = min(max((sin(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))]._changeSpeed) * _time.x) * 2.0f), 0.0f), 1.0f);
  float _156 = _155 * _105;
  float _163 = (_156 * (_136.x - _125.x)) + _125.x;
  float _164 = (_156 * (_136.y - _125.y)) + _125.y;
  float _165 = (_156 * (_136.z - _125.z)) + _125.z;
  float4 _172 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_117 * 1.2566370964050293f) * _120) + ((_67 * _36) + TEXCOORD.x)), (((_66 * _36) * sin((WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._distortionSpeed) * _time.x) + (((TEXCOORD.y + TEXCOORD.x) + _67) * _51))) + TEXCOORD.y)));
  float _179 = min(max((1.0f - _155), 0.0f), 1.0f) * _105;
  int _189 = WaveReadLaneFirst(_materialIndex);
  float _199 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._colorTint.x);
  float _200 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._colorTint.y);
  float _201 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._colorTint.z);
  int _239 = WaveReadLaneFirst(_materialIndex);
  int _249 = WaveReadLaneFirst(_materialIndex);
  int _258 = WaveReadLaneFirst(_materialIndex);
  float _273 = saturate((sqrt((_27 * _27) + (_26 * _26)) - WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_239 < (uint)170000), _239, 0)) + 0u))]._centerMaskRadius)) / max(0.0010000000474974513f, (saturate(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))]._centerMaskRadius) * 2.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))]._centerMaskHardness)))) * _36;
  float _283 = (_273 * ((select((_199 < 0.040449999272823334f), (_199 * 0.07739938050508499f), exp2(log2((_199 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.x - _163)) + _163)) - _39.x)) + _39.x;
  float _284 = (_273 * ((select((_200 < 0.040449999272823334f), (_200 * 0.07739938050508499f), exp2(log2((_200 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.y - _164)) + _164)) - _39.y)) + _39.y;
  float _285 = (_273 * ((select((_201 < 0.040449999272823334f), (_201 * 0.07739938050508499f), exp2(log2((_201 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.z - _165)) + _165)) - _39.z)) + _39.z;
  uint _286 = uint(SV_Position.y);
  float _300;
  float _546;
  float _547;
  float _548;
  float _668;
  float _669;
  float _670;
  float _691;
  float _692;
  float _693;
  float _726;
  float _727;
  float _728;
  float _742;
  float _743;
  float _744;
  if (_etcParams.y == 1.0f) {
    uint2 _294 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_286), 0));
    _300 = (float((uint)((uint)(_294.x & 127))) + 0.5f);
  } else {
    _300 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_283, _284, _285));
    _668 = output_color.x;
    _669 = output_color.y;
    _670 = output_color.z;
  } else {
    _668 = _283;
    _669 = _284;
    _670 = _285;
  }
  if (_etcParams.y > 1.0f) {
    float _681 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _682 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _686 = saturate(1.0f - (dot(float2(_681, _682), float2(_681, _682)) * saturate(_etcParams.y + -1.0f)));
    _691 = (_686 * _668);
    _692 = (_686 * _669);
    _693 = (_686 * _670);
  } else {
    _691 = _668;
    _692 = _669;
    _693 = _670;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _726 = select((_691 <= 0.0031308000907301903f), (_691 * 12.920000076293945f), (((pow(_691, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _727 = select((_692 <= 0.0031308000907301903f), (_692 * 12.920000076293945f), (((pow(_692, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _728 = select((_693 <= 0.0031308000907301903f), (_693 * 12.920000076293945f), (((pow(_693, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _726 = _691;
    _727 = _692;
    _728 = _693;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _733 = float((uint)_286);
    if (!(_733 < _viewDir.w)) {
      if (!(_733 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _742 = _726;
        _743 = _727;
        _744 = _728;
      } else {
        _742 = 0.0f;
        _743 = 0.0f;
        _744 = 0.0f;
      }
    } else {
      _742 = 0.0f;
      _743 = 0.0f;
      _744 = 0.0f;
    }
  } else {
    _742 = _726;
    _743 = _727;
    _744 = _728;
  }
  SV_Target.x = _742;
  SV_Target.y = _743;
  SV_Target.z = _744;
  SV_Target.w = _300;
  return SV_Target;
}

