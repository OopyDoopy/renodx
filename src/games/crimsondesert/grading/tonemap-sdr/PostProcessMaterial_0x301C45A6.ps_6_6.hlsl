struct PostProcessHousingStruct {
  float _ratio;
  float3 _pivotPosition;
  float4 _rectMinMax;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessHousingStruct> BindlessParameters_PostProcessHousing[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _26 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _36 = (pow(_26.x, 0.012683313339948654f));
  float _37 = (pow(_26.y, 0.012683313339948654f));
  float _38 = (pow(_26.z, 0.012683313339948654f));
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _65 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _68 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _71 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _72 = TEXCOORD.y * 2.0f;
  float _73 = 1.0f - _72;
  float _74 = max(1.0000000116860974e-07f, _68.x);
  float _102 = mad((_invViewProj[3].z), _74, mad((_invViewProj[3].y), _73, ((_invViewProj[3].x) * _71))) + (_invViewProj[3].w);
  float _103 = (mad((_invViewProj[0].z), _74, mad((_invViewProj[0].y), _73, ((_invViewProj[0].x) * _71))) + (_invViewProj[0].w)) / _102;
  float _104 = (mad((_invViewProj[2].z), _74, mad((_invViewProj[2].y), _73, ((_invViewProj[2].x) * _71))) + (_invViewProj[2].w)) / _102;
  float _105 = abs(_103);
  float _107 = frac(abs(_105));
  float _108 = abs(_104);
  float _110 = frac(abs(_108));
  int _111 = WaveReadLaneFirst(_materialIndex);
  float _121 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_111 < (uint)170000), _111, 0)) + 0u))]._pivotPosition.x);
  float _123 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_111 < (uint)170000), _111, 0)) + 0u))]._pivotPosition.z);
  int _124 = WaveReadLaneFirst(_materialIndex);
  float _170;
  float _171;
  float _172;
  float _186;
  float _391;
  float _392;
  float _393;
  float _486;
  float _487;
  float _488;
  float _542;
  float _543;
  float _544;
  float _560;
  float _561;
  float _562;
  float _592;
  float _593;
  float _594;
  float _608;
  float _609;
  float _610;
  if (((((_103 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))]._rectMinMax.x) + _121))) && ((_104 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))]._rectMinMax.y) + _123))))) && ((_103 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))]._rectMinMax.z) + _121)))) {
    bool _165 = ((_104 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))]._rectMinMax.w) + _123))) && ((((abs(1.0f - select((_108 >= (-0.0f - _108)), _110, (-0.0f - _110))) < 0.03125f)) || ((abs(1.0f - select((_105 >= (-0.0f - _105)), _107, (-0.0f - _107))) < 0.03125f))));
    _170 = select(_165, 256.0f, _63);
    _171 = select(_165, 256.0f, _64);
    _172 = select(_165, 256.0f, _65);
  } else {
    _170 = _63;
    _171 = _64;
    _172 = _65;
  }
  uint _173 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _180 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_173), 0));
    _186 = (float((uint)((uint)(_180.x & 127))) + 0.5f);
  } else {
    _186 = _postProcessParams.x;
  }
  bool _189 = (_localToneMappingParams.w > 0.0f);
  if (_189) {
    float3 output_color = TonemapReplacer(float3(_170, _171, _172));
    _542 = output_color.x;
    _543 = output_color.y;
    _544 = output_color.z;
  } else {
    _542 = _170;
    _543 = _171;
    _544 = _172;
  }
  if (_etcParams.y > 1.0f) {
    float _550 = abs(_71);
    float _551 = abs(_72 + -1.0f);
    float _555 = saturate(1.0f - (dot(float2(_550, _551), float2(_550, _551)) * saturate(_etcParams.y + -1.0f)));
    _560 = (_555 * _542);
    _561 = (_555 * _543);
    _562 = (_555 * _544);
  } else {
    _560 = _542;
    _561 = _543;
    _562 = _544;
  }
  if ((_189) && ((_etcParams.z > 0.0f))) {
    _592 = select((_560 <= 0.0031308000907301903f), (_560 * 12.920000076293945f), (((pow(_560, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _593 = select((_561 <= 0.0031308000907301903f), (_561 * 12.920000076293945f), (((pow(_561, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _594 = select((_562 <= 0.0031308000907301903f), (_562 * 12.920000076293945f), (((pow(_562, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _592 = _560;
    _593 = _561;
    _594 = _562;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _599 = float((uint)_173);
    if (!(_599 < _viewDir.w)) {
      if (!(_599 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _608 = _592;
        _609 = _593;
        _610 = _594;
      } else {
        _608 = 0.0f;
        _609 = 0.0f;
        _610 = 0.0f;
      }
    } else {
      _608 = 0.0f;
      _609 = 0.0f;
      _610 = 0.0f;
    }
  } else {
    _608 = _592;
    _609 = _593;
    _610 = _594;
  }
  float _620 = exp2(log2(_608 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _621 = exp2(log2(_609 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _622 = exp2(log2(_610 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_620 * 18.6875f) + 1.0f)) * ((_620 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_621 * 18.6875f) + 1.0f)) * ((_621 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_622 * 18.6875f) + 1.0f)) * ((_622 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _186;
  return SV_Target;
}