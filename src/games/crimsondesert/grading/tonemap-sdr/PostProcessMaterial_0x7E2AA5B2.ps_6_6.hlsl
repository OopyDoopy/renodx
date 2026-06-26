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
  int2 _30; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_30.x, _30.y);
  uint _45 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_30.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_30.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _121;
  float _122;
  float _123;
  float _137;
  float _342;
  float _343;
  float _344;
  float _437;
  float _438;
  float _439;
  float _493;
  float _494;
  float _495;
  float _514;
  float _515;
  float _516;
  float _546;
  float _547;
  float _548;
  float _562;
  float _563;
  float _564;
  if (!((_45.x & 255) == 30)) {
    uint _58 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    float4 _64 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    if (!(!((float((uint)((uint)(_58.x & 16777215))) * 5.960465188081798e-08f) <= _64.y))) {
      int _69 = WaveReadLaneFirst(_materialIndex);
      int _77 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._outlineColor);
      float _80 = float((uint)((uint)(((uint)((uint)(_77)) >> 16) & 255)));
      float _83 = float((uint)((uint)(((uint)((uint)(_77)) >> 8) & 255)));
      float _85 = float((uint)((uint)(_77 & 255)));
      float _113 = _64.x * 100.0f;
      _121 = ((select(((_80 * 0.003921568859368563f) < 0.040449999272823334f), (_80 * 0.0003035269910469651f), exp2(log2((_80 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _113) + _25.x);
      _122 = ((select(((_83 * 0.003921568859368563f) < 0.040449999272823334f), (_83 * 0.0003035269910469651f), exp2(log2((_83 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _113) + _25.y);
      _123 = ((select(((_85 * 0.003921568859368563f) < 0.040449999272823334f), (_85 * 0.0003035269910469651f), exp2(log2((_85 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _113) + _25.z);
    } else {
      _121 = _25.x;
      _122 = _25.y;
      _123 = _25.z;
    }
  } else {
    _121 = _25.x;
    _122 = _25.y;
    _123 = _25.z;
  }
  uint _124 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _131 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_124), 0));
    _137 = (float((uint)((uint)(_131.x & 127))) + 0.5f);
  } else {
    _137 = 1.0f;
  }
  bool _140 = (_localToneMappingParams.w > 0.0f);
  if (_140) {
    float3 output_color = TonemapReplacer(float3(_121, _122, _123));
    _493 = output_color.x;
    _494 = output_color.y;
    _495 = output_color.z;
  } else {
    _493 = _121;
    _494 = _122;
    _495 = _123;
  }
  if (_etcParams.y > 1.0f) {
    float _504 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _505 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _509 = saturate(1.0f - (dot(float2(_504, _505), float2(_504, _505)) * saturate(_etcParams.y + -1.0f)));
    _514 = (_509 * _493);
    _515 = (_509 * _494);
    _516 = (_509 * _495);
  } else {
    _514 = _493;
    _515 = _494;
    _516 = _495;
  }
  if ((_140) && ((_etcParams.z > 0.0f))) {
    _546 = select((_514 <= 0.0031308000907301903f), (_514 * 12.920000076293945f), (((pow(_514, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _547 = select((_515 <= 0.0031308000907301903f), (_515 * 12.920000076293945f), (((pow(_515, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _548 = select((_516 <= 0.0031308000907301903f), (_516 * 12.920000076293945f), (((pow(_516, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _546 = _514;
    _547 = _515;
    _548 = _516;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _553 = float((uint)_124);
    if (!(_553 < _viewDir.w)) {
      if (!(_553 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _562 = _546;
        _563 = _547;
        _564 = _548;
      } else {
        _562 = 0.0f;
        _563 = 0.0f;
        _564 = 0.0f;
      }
    } else {
      _562 = 0.0f;
      _563 = 0.0f;
      _564 = 0.0f;
    }
  } else {
    _562 = _546;
    _563 = _547;
    _564 = _548;
  }
  SV_Target.x = _562;
  SV_Target.y = _563;
  SV_Target.z = _564;
  SV_Target.w = _137;
  return SV_Target;
}