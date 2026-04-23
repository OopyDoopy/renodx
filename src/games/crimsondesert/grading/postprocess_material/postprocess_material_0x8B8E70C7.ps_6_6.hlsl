#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessOutlineExampleStruct> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float4 _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int2 _29; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
  uint _44 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_29.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_29.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _120;
  float _121;
  float _122;
  float _136;
  float _382;
  float _383;
  float _384;
  float _504;
  float _505;
  float _506;
  float _527;
  float _528;
  float _529;
  float _562;
  float _563;
  float _564;
  float _578;
  float _579;
  float _580;
  if (!((_44.x & 255) == 30)) {
    uint _57 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    float4 _63 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    if (!(!((float((uint)((uint)(_57.x & 16777215))) * 5.960465188081798e-08f) <= _63.y))) {
      int _68 = WaveReadLaneFirst(_materialIndex);
      int _76 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._outlineColor);
      float _79 = float((uint)((uint)(((uint)((uint)(_76)) >> 16) & 255)));
      float _82 = float((uint)((uint)(((uint)((uint)(_76)) >> 8) & 255)));
      float _84 = float((uint)((uint)(_76 & 255)));
      float _112 = _63.x * 100.0f;
      _120 = ((select(((_79 * 0.003921568859368563f) < 0.040449999272823334f), (_79 * 0.0003035269910469651f), exp2(log2((_79 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.x);
      _121 = ((select(((_82 * 0.003921568859368563f) < 0.040449999272823334f), (_82 * 0.0003035269910469651f), exp2(log2((_82 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.y);
      _122 = ((select(((_84 * 0.003921568859368563f) < 0.040449999272823334f), (_84 * 0.0003035269910469651f), exp2(log2((_84 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.z);
    } else {
      _120 = _24.x;
      _121 = _24.y;
      _122 = _24.z;
    }
  } else {
    _120 = _24.x;
    _121 = _24.y;
    _122 = _24.z;
  }
  uint _123 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _130 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_123), 0));
    _136 = (float((uint)((uint)(_130.x & 127))) + 0.5f);
  } else {
    _136 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_120, _121, _122));
    _504 = output_color.x;
    _505 = output_color.y;
    _506 = output_color.z;
  } else {
    _504 = _120;
    _505 = _121;
    _506 = _122;
  }
  if (_etcParams.y > 1.0f) {
    float _517 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _518 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _522 = saturate(1.0f - (dot(float2(_517, _518), float2(_517, _518)) * saturate(_etcParams.y + -1.0f)));
    _527 = (_522 * _504);
    _528 = (_522 * _505);
    _529 = (_522 * _506);
  } else {
    _527 = _504;
    _528 = _505;
    _529 = _506;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _562 = select((_527 <= 0.0031308000907301903f), (_527 * 12.920000076293945f), (((pow(_527, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _563 = select((_528 <= 0.0031308000907301903f), (_528 * 12.920000076293945f), (((pow(_528, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _564 = select((_529 <= 0.0031308000907301903f), (_529 * 12.920000076293945f), (((pow(_529, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _562 = _527;
    _563 = _528;
    _564 = _529;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _569 = float((uint)_123);
    if (!(_569 < _viewDir.w)) {
      if (!(_569 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _578 = _562;
        _579 = _563;
        _580 = _564;
      } else {
        _578 = 0.0f;
        _579 = 0.0f;
        _580 = 0.0f;
      }
    } else {
      _578 = 0.0f;
      _579 = 0.0f;
      _580 = 0.0f;
    }
  } else {
    _578 = _562;
    _579 = _563;
    _580 = _564;
  }
  SV_Target.x = _578;
  SV_Target.y = _579;
  SV_Target.z = _580;
  SV_Target.w = _136;
  return SV_Target;
}

