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
  int _44 = WaveReadLaneFirst(_materialIndex);
  float _52 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._distortionDensity);
  int _53 = WaveReadLaneFirst(_materialIndex);
  float _67 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_53 < (uint)170000), _53, 0)) + 0u))]._distortionScale) * 0.009999999776482582f;
  float _68 = cos(_time.x + (_52 * TEXCOORD.x)) * _67;
  int _72 = WaveReadLaneFirst(_materialIndex);
  int _89 = WaveReadLaneFirst(_materialIndex);
  float _97 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_89 < (uint)170000), _89, 0)) + 0u))]._panningWidth);
  int _98 = WaveReadLaneFirst(_materialIndex);
  float _106 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._blendBias);
  int _107 = WaveReadLaneFirst(_materialIndex);
  float _118 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._panningSpeed);
  float _121 = _97 * -0.009999999776482582f;
  float4 _126 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_118 * 0.8975979089736938f) * _121) + TEXCOORD.y)));
  float4 _137 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_97 * 0.009999999776482582f) * sin(_118 * 2.094395160675049f)) + TEXCOORD.y)));
  int _143 = WaveReadLaneFirst(_materialIndex);
  float _156 = min(max((sin(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))]._changeSpeed) * _time.x) * 2.0f), 0.0f), 1.0f);
  float _157 = _156 * _106;
  float _164 = (_157 * (_137.x - _126.x)) + _126.x;
  float _165 = (_157 * (_137.y - _126.y)) + _126.y;
  float _166 = (_157 * (_137.z - _126.z)) + _126.z;
  float4 _173 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_118 * 1.2566370964050293f) * _121) + ((_68 * _37) + TEXCOORD.x)), (((_67 * _37) * sin((WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._distortionSpeed) * _time.x) + (((TEXCOORD.y + TEXCOORD.x) + _68) * _52))) + TEXCOORD.y)));
  float _180 = min(max((1.0f - _156), 0.0f), 1.0f) * _106;
  int _190 = WaveReadLaneFirst(_materialIndex);
  float _200 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))]._colorTint.x);
  float _201 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))]._colorTint.y);
  float _202 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))]._colorTint.z);
  int _240 = WaveReadLaneFirst(_materialIndex);
  int _250 = WaveReadLaneFirst(_materialIndex);
  int _259 = WaveReadLaneFirst(_materialIndex);
  float _274 = saturate((sqrt((_28 * _28) + (_27 * _27)) - WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_240 < (uint)170000), _240, 0)) + 0u))]._centerMaskRadius)) / max(0.0010000000474974513f, (saturate(WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_259 < (uint)170000), _259, 0)) + 0u))]._centerMaskRadius) * 2.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_250 < (uint)170000), _250, 0)) + 0u))]._centerMaskHardness)))) * _37;
  float _284 = (_274 * ((select((_200 < 0.040449999272823334f), (_200 * 0.07739938050508499f), exp2(log2((_200 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_180 * (_173.x - _164)) + _164)) - _40.x)) + _40.x;
  float _285 = (_274 * ((select((_201 < 0.040449999272823334f), (_201 * 0.07739938050508499f), exp2(log2((_201 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_180 * (_173.y - _165)) + _165)) - _40.y)) + _40.y;
  float _286 = (_274 * ((select((_202 < 0.040449999272823334f), (_202 * 0.07739938050508499f), exp2(log2((_202 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_180 * (_173.z - _166)) + _166)) - _40.z)) + _40.z;
  uint _287 = uint(SV_Position.y);
  float _301;
  float _506;
  float _507;
  float _508;
  float _601;
  float _602;
  float _603;
  float _657;
  float _658;
  float _659;
  float _678;
  float _679;
  float _680;
  float _710;
  float _711;
  float _712;
  float _726;
  float _727;
  float _728;
  if (_etcParams.y == 1.0f) {
    uint2 _295 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_287), 0));
    _301 = (float((uint)((uint)(_295.x & 127))) + 0.5f);
  } else {
    _301 = _postProcessParams.x;
  }
  bool _304 = (_localToneMappingParams.w > 0.0f);
  if (_304) {
    float3 output_color = TonemapReplacer(float3(_284, _285, _286));
    _657 = output_color.x;
    _658 = output_color.y;
    _659 = output_color.z;
  } else {
    _657 = _284;
    _658 = _285;
    _659 = _286;
  }
  if (_etcParams.y > 1.0f) {
    float _668 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _669 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _673 = saturate(1.0f - (dot(float2(_668, _669), float2(_668, _669)) * saturate(_etcParams.y + -1.0f)));
    _678 = (_673 * _657);
    _679 = (_673 * _658);
    _680 = (_673 * _659);
  } else {
    _678 = _657;
    _679 = _658;
    _680 = _659;
  }
  if ((_304) && ((_etcParams.z > 0.0f))) {
    _710 = select((_678 <= 0.0031308000907301903f), (_678 * 12.920000076293945f), (((pow(_678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _711 = select((_679 <= 0.0031308000907301903f), (_679 * 12.920000076293945f), (((pow(_679, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _712 = select((_680 <= 0.0031308000907301903f), (_680 * 12.920000076293945f), (((pow(_680, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _710 = _678;
    _711 = _679;
    _712 = _680;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _717 = float((uint)_287);
    if (!(_717 < _viewDir.w)) {
      if (!(_717 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _726 = _710;
        _727 = _711;
        _728 = _712;
      } else {
        _726 = 0.0f;
        _727 = 0.0f;
        _728 = 0.0f;
      }
    } else {
      _726 = 0.0f;
      _727 = 0.0f;
      _728 = 0.0f;
    }
  } else {
    _726 = _710;
    _727 = _711;
    _728 = _712;
  }
  SV_Target.x = _726;
  SV_Target.y = _727;
  SV_Target.z = _728;
  SV_Target.w = _301;
  return SV_Target;
}