struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t41, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

ConstantBuffer<PostProcessOutlineExampleStruct> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (pow(_25.x, 0.012683313339948654f));
  float _36 = (pow(_25.y, 0.012683313339948654f));
  float _37 = (pow(_25.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int2 _66; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_66.x, _66.y);
  uint _81 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_66.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_66.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _180;
  float _181;
  float _182;
  float _196;
  float _401;
  float _402;
  float _403;
  float _496;
  float _497;
  float _498;
  float _552;
  float _553;
  float _554;
  float _573;
  float _574;
  float _575;
  float _605;
  float _606;
  float _607;
  float _621;
  float _622;
  float _623;
  if (!((_81.x & 255) == 30)) {
    uint _94 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    float4 _100 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _107 = (pow(_100.x, 0.012683313339948654f));
    float _108 = (pow(_100.y, 0.012683313339948654f));
    if (!(!((float((uint)((uint)(_94.x & 16777215))) * 5.960465188081798e-08f) <= (exp2(log2(max(0.0f, (_108 + -0.8359375f)) / (18.8515625f - (_108 * 18.6875f))) * 6.277394771575928f) * 10000.0f)))) {
      int _128 = WaveReadLaneFirst(_materialIndex);
      int _136 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._outlineColor);
      float _139 = float((uint)((uint)(((uint)((uint)(_136)) >> 16) & 255)));
      float _142 = float((uint)((uint)(((uint)((uint)(_136)) >> 8) & 255)));
      float _144 = float((uint)((uint)(_136 & 255)));
      float _172 = exp2(log2(max(0.0f, (_107 + -0.8359375f)) / (18.8515625f - (_107 * 18.6875f))) * 6.277394771575928f) * 1e+06f;
      _180 = ((select(((_139 * 0.003921568859368563f) < 0.040449999272823334f), (_139 * 0.0003035269910469651f), exp2(log2((_139 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _172) + _62);
      _181 = ((select(((_142 * 0.003921568859368563f) < 0.040449999272823334f), (_142 * 0.0003035269910469651f), exp2(log2((_142 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _172) + _63);
      _182 = ((select(((_144 * 0.003921568859368563f) < 0.040449999272823334f), (_144 * 0.0003035269910469651f), exp2(log2((_144 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _172) + _64);
    } else {
      _180 = _62;
      _181 = _63;
      _182 = _64;
    }
  } else {
    _180 = _62;
    _181 = _63;
    _182 = _64;
  }
  uint _183 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _190 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_183), 0));
    _196 = (float((uint)((uint)(_190.x & 127))) + 0.5f);
  } else {
    _196 = 1.0f;
  }
  bool _199 = (_localToneMappingParams.w > 0.0f);
  if (_199) {
    float3 output_color = TonemapReplacer(float3(_180, _181, _182));
    _552 = output_color.x;
    _553 = output_color.y;
    _554 = output_color.z;
  } else {
    _552 = _180;
    _553 = _181;
    _554 = _182;
  }
  if (_etcParams.y > 1.0f) {
    float _563 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _564 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _568 = saturate(1.0f - (dot(float2(_563, _564), float2(_563, _564)) * saturate(_etcParams.y + -1.0f)));
    _573 = (_568 * _552);
    _574 = (_568 * _553);
    _575 = (_568 * _554);
  } else {
    _573 = _552;
    _574 = _553;
    _575 = _554;
  }
  if ((_199) && ((_etcParams.z > 0.0f))) {
    _605 = select((_573 <= 0.0031308000907301903f), (_573 * 12.920000076293945f), (((pow(_573, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _606 = select((_574 <= 0.0031308000907301903f), (_574 * 12.920000076293945f), (((pow(_574, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _607 = select((_575 <= 0.0031308000907301903f), (_575 * 12.920000076293945f), (((pow(_575, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _605 = _573;
    _606 = _574;
    _607 = _575;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _612 = float((uint)_183);
    if (!(_612 < _viewDir.w)) {
      if (!(_612 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _621 = _605;
        _622 = _606;
        _623 = _607;
      } else {
        _621 = 0.0f;
        _622 = 0.0f;
        _623 = 0.0f;
      }
    } else {
      _621 = 0.0f;
      _622 = 0.0f;
      _623 = 0.0f;
    }
  } else {
    _621 = _605;
    _622 = _606;
    _623 = _607;
  }
  float _633 = exp2(log2(_621 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _634 = exp2(log2(_622 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _635 = exp2(log2(_623 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_633 * 18.6875f) + 1.0f)) * ((_633 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_634 * 18.6875f) + 1.0f)) * ((_634 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_635 * 18.6875f) + 1.0f)) * ((_635 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _196;
  return SV_Target;
}