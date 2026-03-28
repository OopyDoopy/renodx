Texture2D<uint4> __3__36__0__0__g_baseColor : register(t24, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t25, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t45, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t31, space36);

Texture2D<float> __3__36__0__0__g_ssdmPuddleRate : register(t51, space36);

Texture2D<float> __3__36__0__0__g_behindReconstructWeight : register(t54, space36);

RWTexture2D<uint4> __3__38__0__1__g_baseColorUAV : register(u2, space38);

RWTexture2D<float4> __3__38__0__1__g_normalUAV : register(u3, space38);

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
  uint _isAllowBlood;
};

cbuffer __3__1__0__0__DeformedPushConstants : register(b0, space1) {
  float4 _locationsAndScale : packoffset(c000.x);
  float4 _locationsAndScaleNew : packoffset(c001.x);
  float4 _deformedTextureSize : packoffset(c002.x);
  float4 _textureSizeAndInvSize : packoffset(c003.x);
  float4 _deformBlurParam : packoffset(c004.x);
  int4 _interactionParams : packoffset(c005.x);
  float2 _invTextureResolution : packoffset(c006.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _21 = _bufferSizeAndInvSize.z * float((uint)SV_DispatchThreadID.x);
  float _22 = _bufferSizeAndInvSize.w * float((uint)SV_DispatchThreadID.y);
  float _25 = __3__36__0__0__g_behindReconstructWeight.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_21, _22), 0.0f);
  float _377;
  float _384;
  float _513;
  float _514;
  float _515;
  if (!(_25.x < 0.0058823530562222f) || ((_25.x < 0.0058823530562222f) && (!(_deformBlurParam.x == 0.0f)))) {
    uint4 _34 = __3__38__0__1__g_baseColorUAV.Load(int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y)));
    float4 _40 = __3__38__0__1__g_normalUAV.Load(int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y)));
    float _47 = float((uint)((uint)(((uint)((uint)(_34.x)) >> 8) & 255)));
    float _49 = float((uint)((uint)(_34.x & 255)));
    float _52 = float((uint)((uint)(((uint)((uint)(_34.y)) >> 8) & 255)));
    float _54 = float((uint)((uint)(_34.y & 255)));
    float _57 = float((uint)((uint)(((uint)((uint)(_34.z)) >> 8) & 255)));
    float _59 = float((uint)((uint)(_34.z & 255)));
    uint _67 = uint((_40.w * 3.0f) + 0.5f);
    bool _69 = ((int)(_67) == 3);
    bool _70 = ((int)(_67) == 2);
    float _80 = (saturate(_40.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _81 = (saturate(_40.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _82 = (saturate(_40.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _84 = rsqrt(dot(float3(_80, _81, _82), float3(_80, _81, _82)));
    float _85 = _84 * _80;
    float _86 = _84 * _81;
    float _87 = _82 * _84;
    float _90 = (float((uint)((uint)(((uint)((uint)(_34.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _91 = (float((uint)((uint)(_34.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _94 = (_90 + _91) * 0.5f;
    float _95 = (_90 - _91) * 0.5f;
    float _99 = (1.0f - abs(_94)) - abs(_95);
    float _101 = rsqrt(dot(float3(_94, _95, _99), float3(_94, _95, _99)));
    float _102 = _101 * _94;
    float _103 = _101 * _95;
    float _104 = _101 * _99;
    float _106 = select((_87 >= 0.0f), 1.0f, -1.0f);
    float _109 = -0.0f - (1.0f / (_106 + _87));
    float _110 = _86 * _109;
    float _111 = _110 * _85;
    float _112 = _106 * _85;
    float _121 = mad(_104, _85, mad(_103, _111, ((((_112 * _85) * _109) + 1.0f) * _102)));
    float _125 = mad(_104, _86, mad(_103, (_106 + (_110 * _86)), ((_102 * _106) * _111)));
    float _129 = mad(_104, _87, mad(_103, (-0.0f - _86), (-0.0f - (_112 * _102))));
    uint4 _131 = __3__36__0__0__g_baseColor.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
    float4 _137 = __3__36__0__0__g_normal.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
    float _170 = (saturate(_137.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _171 = (saturate(_137.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _172 = (saturate(_137.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _174 = rsqrt(dot(float3(_170, _171, _172), float3(_170, _171, _172)));
    float _175 = _174 * _170;
    float _176 = _174 * _171;
    float _177 = _172 * _174;
    float _180 = (float((uint)((uint)(((uint)((uint)(_131.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _181 = (float((uint)((uint)(_131.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _184 = (_180 + _181) * 0.5f;
    float _185 = (_180 - _181) * 0.5f;
    float _189 = (1.0f - abs(_184)) - abs(_185);
    float _191 = rsqrt(dot(float3(_184, _185, _189), float3(_184, _185, _189)));
    float _192 = _191 * _184;
    float _193 = _191 * _185;
    float _194 = _191 * _189;
    float _196 = select((_177 >= 0.0f), 1.0f, -1.0f);
    float _199 = -0.0f - (1.0f / (_196 + _177));
    float _200 = _176 * _199;
    float _201 = _200 * _175;
    float _202 = _196 * _175;
    float _221 = (_21 * 2.0f) + -1.0f;
    float _223 = 1.0f - (_22 * 2.0f);
    float _225 = __3__36__0__0__g_depth.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
    float _227 = max(1.0000000116860974e-07f, _225.x);
    float _263 = mad((_invViewProjRelative[3].z), _227, mad((_invViewProjRelative[3].y), _223, ((_invViewProjRelative[3].x) * _221))) + (_invViewProjRelative[3].w);
    float _264 = (mad((_invViewProjRelative[0].z), _227, mad((_invViewProjRelative[0].y), _223, ((_invViewProjRelative[0].x) * _221))) + (_invViewProjRelative[0].w)) / _263;
    float _265 = (mad((_invViewProjRelative[1].z), _227, mad((_invViewProjRelative[1].y), _223, ((_invViewProjRelative[1].x) * _221))) + (_invViewProjRelative[1].w)) / _263;
    float _266 = (mad((_invViewProjRelative[2].z), _227, mad((_invViewProjRelative[2].y), _223, ((_invViewProjRelative[2].x) * _221))) + (_invViewProjRelative[2].w)) / _263;
    bool __defer_32_383 = false;
    if (_deformBlurParam.x > 0.0f) {
      uint2 _272 = __3__36__0__0__g_stencil.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
      if (!((uint)((_272.x & 127) + -1) > (uint)1)) {
        float _281 = _deformBlurParam.y * ((_59 * 0.00039215688593685627f) + 0.10000000149011612f);
        float _309 = mad((_viewProjRelative[3].z), _266, mad((_viewProjRelative[3].y), _265, ((_viewProjRelative[3].x) * _264))) + (_viewProjRelative[3].w);
        float _313 = (_281 * _85) + _264;
        float _314 = (_281 * _86) + _265;
        float _315 = (_281 * _87) + _266;
        float _327 = mad((_viewProjRelative[3].z), _315, mad((_viewProjRelative[3].y), _314, ((_viewProjRelative[3].x) * _313))) + (_viewProjRelative[3].w);
        float _328 = (mad((_viewProjRelative[0].z), _266, mad((_viewProjRelative[0].y), _265, ((_viewProjRelative[0].x) * _264))) + (_viewProjRelative[0].w)) / _309;
        float _329 = (mad((_viewProjRelative[1].z), _266, mad((_viewProjRelative[1].y), _265, ((_viewProjRelative[1].x) * _264))) + (_viewProjRelative[1].w)) / _309;
        float _332 = ((mad((_viewProjRelative[0].z), _315, mad((_viewProjRelative[0].y), _314, ((_viewProjRelative[0].x) * _313))) + (_viewProjRelative[0].w)) / _327) - _328;
        float _333 = ((mad((_viewProjRelative[1].z), _315, mad((_viewProjRelative[1].y), _314, ((_viewProjRelative[1].x) * _313))) + (_viewProjRelative[1].w)) / _327) - _329;
        float _334 = _328 - _332;
        float _335 = _329 - _333;
        float edgeFadeX = smoothstep(0.0f, 0.1f, min(saturate(_334 + 1.0f), saturate(1.0f - _334)));
        float edgeFadeY = smoothstep(0.0f, 0.1f, min(saturate(_335 + 1.0f), saturate(1.0f - _335)));
        float _370 = saturate(edgeFadeX * edgeFadeY);
        if (!_70) {
          float _373 = __3__36__0__0__g_ssdmPuddleRate.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_21, _22), 0.0f);
          _377 = (_373.x * _370);
        } else {
          _377 = _370;
        }
      } else {
        _377 = 1.0f;
      }
      float _381 = max(_25.x, saturate(1.0f - (_377 * _377)));
      if (!(_381 == 0.0f)) {
        _384 = _381;
        __defer_32_383 = true;
      }
    } else {
      _384 = _25.x;
      __defer_32_383 = true;
    }
    if (__defer_32_383) {
      float _400 = (_384 * (mad(_194, _175, mad(_193, _201, ((((_202 * _175) * _199) + 1.0f) * _192))) - _121)) + _121;
      float _401 = (_384 * (mad(_194, _176, mad(_193, (_196 + (_200 * _176)), ((_192 * _196) * _201))) - _125)) + _125;
      float _402 = (_384 * (mad(_194, _177, mad(_193, (-0.0f - _176), (-0.0f - (_202 * _192)))) - _129)) + _129;
      float _440 = rsqrt(dot(float3(_85, _86, _87), float3(_85, _86, _87))) * 0.5f;
      float _459 = float((uint)uint(round(saturate((_440 * _85) + 0.5f) * 1022.0f)));
      float _460 = float((uint)uint(round(saturate((_440 * _86) + 0.5f) * 1022.0f)));
      float _461 = float((uint)uint(round(saturate((_440 * _87) + 0.5f) * 1022.0f)));
      float _474 = (saturate(_459 * 0.000978473573923111f) * 2.0f) + -1.0f;
      float _475 = (saturate(_460 * 0.000978473573923111f) * 2.0f) + -1.0f;
      float _476 = (saturate(_461 * 0.000978473573923111f) * 2.0f) + -1.0f;
      float _478 = rsqrt(dot(float3(_474, _475, _476), float3(_474, _475, _476)));
      float _479 = _478 * _474;
      float _480 = _478 * _475;
      float _481 = _476 * _478;
      float _485 = saturate(dot(float3(_400, _401, _402), float3(_479, _480, _481)));
      float _487 = select((_481 >= 0.0f), 1.0f, -1.0f);
      float _490 = -0.0f - (1.0f / (_487 + _481));
      float _491 = _480 * _490;
      float _492 = _491 * _479;
      if (!(_485 > 0.9999989867210388f)) {
        float _505 = dot(float3(_400, _401, _402), float3(((((_479 * _479) * _490) * _487) + 1.0f), (_492 * _487), (-0.0f - (_487 * _479))));
        float _506 = dot(float3(_400, _401, _402), float3(_492, (_487 + (_491 * _480)), (-0.0f - _480)));
        float _508 = rsqrt(dot(float3(_505, _506, _485), float3(_505, _506, _485)));
        _513 = (_508 * _505);
        _514 = (_508 * _506);
        _515 = (_508 * _485);
      } else {
        _513 = 0.0f;
        _514 = 0.0f;
        _515 = 1.0f;
      }
      float _523 = 0.5f / ((abs(_514) + abs(_513)) + saturate(_515));
      __3__38__0__1__g_baseColorUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = int4((int)(min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round((_384 * (float((uint)((uint)(_131.x & 255))) - _49)) + _49)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round((_384 * (float((uint)((uint)(((uint)((uint)(_131.x)) >> 8) & 255))) - _47)) + _47))))) << 8))))), (int)(min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate(((_384 * (float((uint)((uint)(_131.y & 255))) - _54)) + _54) * 0.003921568859368563f) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round((_384 * (float((uint)((uint)(((uint)((uint)(_131.y)) >> 8) & 255))) - _52)) + _52))))) << 8))))), (int)(min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(select(((_69) && ((!_70))), 0.0f, ((_384 * (float((uint)((uint)(_131.z & 255))) - _59)) + _59)))))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate(((_384 * (float((uint)((uint)(((uint)((uint)(_131.z)) >> 8) & 255))) - _57)) + _57) * 0.003921568859368563f) * 255.0f))))) << 8))))), (int)(min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_523 * (_513 - _514)) + 0.5f) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_523 * (_514 + _513)) + 0.5f) * 255.0f))))) << 8))))));
      __3__38__0__1__g_normalUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4((_459 * 0.0009775171056389809f), (_460 * 0.0009775171056389809f), (_461 * 0.0009775171056389809f), select(_69, 1.0f, select(_70, 0.6666666865348816f, (float((bool)(uint)((int)(_67) == 1)) * 0.3333333432674408f))));
    }
  } else {
  }
}