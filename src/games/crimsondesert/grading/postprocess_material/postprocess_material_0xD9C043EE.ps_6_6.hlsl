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
  float _34 = (pow(_24.x, 0.012683313339948654f));
  float _35 = (pow(_24.y, 0.012683313339948654f));
  float _36 = (pow(_24.z, 0.012683313339948654f));
  float _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int2 _65; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_65.x, _65.y);
  uint _80 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_65.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_65.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _179;
  float _180;
  float _181;
  float _195;
  float _441;
  float _442;
  float _443;
  float _563;
  float _564;
  float _565;
  float _586;
  float _587;
  float _588;
  float _621;
  float _622;
  float _623;
  float _637;
  float _638;
  float _639;
  if (!((_80.x & 255) == 30)) {
    uint _93 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    float4 _99 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _106 = (pow(_99.x, 0.012683313339948654f));
    float _107 = (pow(_99.y, 0.012683313339948654f));
    if (!(!((float((uint)((uint)(_93.x & 16777215))) * 5.960465188081798e-08f) <= (exp2(log2(max(0.0f, (_107 + -0.8359375f)) / (18.8515625f - (_107 * 18.6875f))) * 6.277394771575928f) * 10000.0f)))) {
      int _127 = WaveReadLaneFirst(_materialIndex);
      int _135 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_127 < (uint)170000), _127, 0)) + 0u))]._outlineColor);
      float _138 = float((uint)((uint)(((uint)((uint)(_135)) >> 16) & 255)));
      float _141 = float((uint)((uint)(((uint)((uint)(_135)) >> 8) & 255)));
      float _143 = float((uint)((uint)(_135 & 255)));
      float _171 = exp2(log2(max(0.0f, (_106 + -0.8359375f)) / (18.8515625f - (_106 * 18.6875f))) * 6.277394771575928f) * 1e+06f;
      _179 = ((select(((_138 * 0.003921568859368563f) < 0.040449999272823334f), (_138 * 0.0003035269910469651f), exp2(log2((_138 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _61);
      _180 = ((select(((_141 * 0.003921568859368563f) < 0.040449999272823334f), (_141 * 0.0003035269910469651f), exp2(log2((_141 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _62);
      _181 = ((select(((_143 * 0.003921568859368563f) < 0.040449999272823334f), (_143 * 0.0003035269910469651f), exp2(log2((_143 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _63);
    } else {
      _179 = _61;
      _180 = _62;
      _181 = _63;
    }
  } else {
    _179 = _61;
    _180 = _62;
    _181 = _63;
  }
  uint _182 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _189 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_182), 0));
    _195 = (float((uint)((uint)(_189.x & 127))) + 0.5f);
  } else {
    _195 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_179, _180, _181));
    _563 = output_color.x;
    _564 = output_color.y;
    _565 = output_color.z;
  } else {
    _563 = _179;
    _564 = _180;
    _565 = _181;
  }
  if (_etcParams.y > 1.0f) {
    float _576 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _577 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _581 = saturate(1.0f - (dot(float2(_576, _577), float2(_576, _577)) * saturate(_etcParams.y + -1.0f)));
    _586 = (_581 * _563);
    _587 = (_581 * _564);
    _588 = (_581 * _565);
  } else {
    _586 = _563;
    _587 = _564;
    _588 = _565;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _621 = select((_586 <= 0.0031308000907301903f), (_586 * 12.920000076293945f), (((pow(_586, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _622 = select((_587 <= 0.0031308000907301903f), (_587 * 12.920000076293945f), (((pow(_587, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _623 = select((_588 <= 0.0031308000907301903f), (_588 * 12.920000076293945f), (((pow(_588, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _621 = _586;
    _622 = _587;
    _623 = _588;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _628 = float((uint)_182);
    if (!(_628 < _viewDir.w)) {
      if (!(_628 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _637 = _621;
        _638 = _622;
        _639 = _623;
      } else {
        _637 = 0.0f;
        _638 = 0.0f;
        _639 = 0.0f;
      }
    } else {
      _637 = 0.0f;
      _638 = 0.0f;
      _639 = 0.0f;
    }
  } else {
    _637 = _621;
    _638 = _622;
    _639 = _623;
  }
  float _649 = exp2(log2(_637 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _650 = exp2(log2(_638 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _651 = exp2(log2(_639 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_649 * 18.6875f) + 1.0f)) * ((_649 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_650 * 18.6875f) + 1.0f)) * ((_650 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_651 * 18.6875f) + 1.0f)) * ((_651 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _195;
  return SV_Target;
}

