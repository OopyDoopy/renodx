Texture2D<uint4> __3__36__0__0__g_baseColor : register(t24, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t25, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t45, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t31, space36);

Texture2D<uint2> __3__36__0__0__g_materialId : register(t32, space36);

Texture2D<float> __3__36__0__0__g_ssdmPuddleRate : register(t51, space36);

RWTexture2D<float> __3__38__0__1__g_behindReconstructMaskUAV : register(u13, space38);

RWTexture2D<uint> __3__38__0__1__g_behindReconstructTileMaskUAV : register(u14, space38);

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

struct OutputSignature {
  uint4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
  uint2 SV_Target_2 : SV_Target2;
  float SV_DepthGreaterEqual : SV_DepthGreaterEqual;
};

OutputSignature main(
  noperspective centroid float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) {
  uint4 SV_Target;
  float4 SV_Target_1;
  uint2 SV_Target_2;
  float SV_DepthGreaterEqual;
  uint _16 = uint(SV_Position.x);
  uint _17 = uint(SV_Position.y);
  float _19 = __3__36__0__0__g_depth.Load(int3((int)(_16), (int)(_17), 0));
  float _250;
  float _276;
  float _297;
  float _326;
  if (((_19.x < 1.0000000116860974e-07f)) || ((_19.x == 1.0f))) {
    if (true) discard;
  }
  uint2 _27 = __3__36__0__0__g_stencil.Load(int3((int)(_16), (int)(_17), 0));
  if (_27.x == 101) {
    if (true) discard;
  }
  float _34 = max(1.0000000116860974e-07f, _19.x);
  float _35 = _nearFarProj.x / _34;
  uint2 _37 = __3__36__0__0__g_materialId.Load(int3((int)(_16), (int)(_17), 0));
  int _39 = _37.x & 127;
  bool _41 = ((uint)(_39 + -11) < (uint)9);
  bool _42 = (_39 == 107);
  uint4 _52 = __3__36__0__0__g_baseColor.Load(int3((int)(_16), (int)(_17), 0));
  float4 _58 = __3__36__0__0__g_normal.Load(int3((int)(_16), (int)(_17), 0));
  if (WaveActiveAnyTrue(((_35 < _terrainNormalParams.x)) && ((!((_42) || (_41)))))) {
    float _79 = (saturate(_58.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _80 = (saturate(_58.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _81 = (saturate(_58.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _83 = rsqrt(dot(float3(_79, _80, _81), float3(_79, _80, _81)));
    float _84 = _83 * _79;
    float _85 = _83 * _80;
    float _86 = _81 * _83;
    float _92 = _bufferSizeAndInvSize.z * float((uint)_16);
    float _93 = _bufferSizeAndInvSize.w * float((uint)_17);
    float _95 = (_92 * 2.0f) + -1.0f;
    float _97 = 1.0f - (_93 * 2.0f);
    float _133 = mad((_invViewProjRelative[3].z), _34, mad((_invViewProjRelative[3].y), _97, (_95 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
    float _134 = (mad((_invViewProjRelative[0].z), _34, mad((_invViewProjRelative[0].y), _97, (_95 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _133;
    float _135 = (mad((_invViewProjRelative[1].z), _34, mad((_invViewProjRelative[1].y), _97, (_95 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _133;
    float _136 = (mad((_invViewProjRelative[2].z), _34, mad((_invViewProjRelative[2].y), _97, (_95 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _133;
    float _138 = rsqrt(dot(float3(_134, _135, _136), float3(_134, _135, _136)));
    float _140 = -0.0f - (_134 * _138);
    float _142 = -0.0f - (_135 * _138);
    float _144 = -0.0f - (_136 * _138);
    float _147 = _deformBlurParam.y * 0.20000000298023224f;
    if (!((((uint)(_39 + -1) > (uint)1)) && ((_deformBlurParam.x > 0.0f)))) {
      float _181 = mad((_viewProjRelative[3].z), _136, mad((_viewProjRelative[3].y), _135, ((_viewProjRelative[3].x) * _134))) + (_viewProjRelative[3].w);
      float _185 = (_147 * _84) + _134;
      float _186 = (_147 * _85) + _135;
      float _187 = (_147 * _86) + _136;
      float _199 = mad((_viewProjRelative[3].z), _187, mad((_viewProjRelative[3].y), _186, ((_viewProjRelative[3].x) * _185))) + (_viewProjRelative[3].w);
      float _200 = (mad((_viewProjRelative[0].z), _136, mad((_viewProjRelative[0].y), _135, ((_viewProjRelative[0].x) * _134))) + (_viewProjRelative[0].w)) / _181;
      float _201 = (mad((_viewProjRelative[1].z), _136, mad((_viewProjRelative[1].y), _135, ((_viewProjRelative[1].x) * _134))) + (_viewProjRelative[1].w)) / _181;
      float _204 = ((mad((_viewProjRelative[0].z), _187, mad((_viewProjRelative[0].y), _186, ((_viewProjRelative[0].x) * _185))) + (_viewProjRelative[0].w)) / _199) - _200;
      float _205 = ((mad((_viewProjRelative[1].z), _187, mad((_viewProjRelative[1].y), _186, ((_viewProjRelative[1].x) * _185))) + (_viewProjRelative[1].w)) / _199) - _201;
      float _206 = _200 - _204;
      float _207 = _201 - _205;
      float edgeFadeX = smoothstep(0.0f, 0.1f, min(saturate(_206 + 1.0f), saturate(1.0f - _206)));
      float edgeFadeY = smoothstep(0.0f, 0.1f, min(saturate(_207 + 1.0f), saturate(1.0f - _207)));
      float _242 = saturate(edgeFadeX * edgeFadeY);
      if (!((int)(uint((_58.w * 3.0f) + 0.5f)) == 2)) {
        float _246 = __3__36__0__0__g_ssdmPuddleRate.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_92, _93), 0.0f);
        _250 = (_246.x * _242);
      } else {
        _250 = _242;
      }
    } else {
      _250 = 1.0f;
    }
    float _264 = saturate((_terrainNormalParams.x - _35) * 0.125f) * (((_250 * _147) * saturate(float((uint)((uint)(_52.z & 255))) * 0.005098039284348488f)) / max(0.5f, saturate(dot(float3(_140, _142, _144), float3(_84, _85, _86)))));
    if ((((uint)(_39 + -97) < (uint)2)) || (((((_37.x & 126) == 2)) || ((_39 == 20))))) {
      _276 = min(0.30000001192092896f, (_264 * 1.5f));
    } else {
      _276 = _264;
    }
    float _277 = select(((_42) || (_41)), 0.0f, _276);
    if (_277 > 0.0f) {
      _297 = max(_19.x, (_nearFarProj.x / (dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(((_277 * _140) + _134), ((_277 * _142) + _135), ((_277 * _144) + _136))) * 0.9999989867210388f)));
    } else {
      _297 = _19.x;
    }
    int _298 = (uint)(_16) >> 1;
    int _299 = (uint)(_17) >> 1;
    if (((_39 != 3)) && ((((_39 != 20)) && ((((_39 != 2)) && ((((_35 < 16.0f)) && ((_277 > (_35 * 0.019999999552965164f)))))))))) {
      __3__38__0__1__g_behindReconstructMaskUAV[int2(_298, _299)] = saturate((16.0f - _35) * 0.25f);
      uint _317 = (_298 + -3) >> 3;
      uint _318 = (_299 + -3) >> 3;
      __3__38__0__1__g_behindReconstructTileMaskUAV[int2((int)(_317), (int)(_318))] = 1;
      __3__38__0__1__g_behindReconstructTileMaskUAV[int2(((int)(_317) + 1), (int)(_318))] = 1;
      __3__38__0__1__g_behindReconstructTileMaskUAV[int2((int)(_317), ((int)(_318) + 1))] = 1;
      __3__38__0__1__g_behindReconstructTileMaskUAV[int2(((int)(_317) + 1), ((int)(_318) + 1))] = 1;
      _326 = _297;
    } else {
      _326 = _297;
    }
  } else {
    _326 = _19.x;
  }
  SV_Target.x = (uint)(_52.x);
  SV_Target.y = (uint)(_52.y);
  SV_Target.z = (uint)(_52.z);
  SV_Target.w = (uint)(_52.w);
  SV_Target_1.x = _58.x;
  SV_Target_1.y = _58.y;
  SV_Target_1.z = _58.z;
  SV_Target_1.w = _58.w;
  SV_Target_2.x = (uint)(_37.x);
  SV_Target_2.y = 101u;
  SV_DepthGreaterEqual = _326;
  OutputSignature output_signature = { SV_Target, SV_Target_1, SV_Target_2, SV_DepthGreaterEqual };
  return output_signature;
}