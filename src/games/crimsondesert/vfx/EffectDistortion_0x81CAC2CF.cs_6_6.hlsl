// No op the whole shader... Why? Because its abysmal
//
// New setup is split into two RenderParticleDistortion shaders that then get
// composited here. Still uses half/quarter res distortion but now with a box filter
// Still has issues with low res blur noise artifacts so we just no op

Texture2D<uint> __3__36__0__0__g_effectTileCoords : register(t27, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float4> __3__36__0__0__textureDistortionOffsetHalf : register(t29, space36);

Texture2D<float4> __3__36__0__0__textureDistortionOffsetQuarter : register(t30, space36);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u8, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b4, space35) {
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

cbuffer __3__1__0__0__EffectDistortionPushConstants : register(b0, space1) {
  int2 _renderTargetSize : packoffset(c000.x);
  float2 _renderTargetSizeInv : packoffset(c000.z);
  int2 _effectTileDataSize : packoffset(c001.x);
  float2 _effectTileDataSizeInv : packoffset(c001.z);
  int _isRenderEffectDistortionHalf : packoffset(c002.x);
  int _isRenderEffectDistortionQuarter : packoffset(c002.y);
  float _distortionIntensityScale : packoffset(c002.z);
};

SamplerState __3__40__0__0__g_distortionSampler : register(s8, space40);

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  return;

  // Original shader code:

  /*
  uint _19 = __3__36__0__0__g_effectTileCoords.Load(int3(((int)((int)(SV_GroupID.x) % _effectTileDataSize.x)), ((int)(SV_GroupID.x) / _effectTileDataSize.x), 0));
  float _96;
  float _97;
  float _142;
  float _143;
  if ((((uint)_renderTargetSize.x > (uint)((int)(uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x)))) && (((uint)_renderTargetSize.y > (uint)((int)(uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y))))) {
    if (!(_isRenderEffectDistortionHalf == 0)) {
      int _57 = (uint)(uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x) >> 1;
      int _58 = (uint)(uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y) >> 1;
      uint _72 = min((uint)(((int)(int(_screenSizeAndInvSize.x) >> 1)) + -1), (uint)((uint)((uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x) + 1u) >> 1));
      uint _73 = min((uint)(((int)(int(_screenSizeAndInvSize.y) >> 1)) + -1), (uint)((uint)((uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y) + 1u) >> 1));
      float4 _75 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_57, _58, 0));
      float4 _78 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3((int)(_72), _58, 0));
      float4 _81 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_57, (int)(_73), 0));
      float4 _84 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3((int)(_72), (int)(_73), 0));
      _96 = ((((_78.x + _75.x) + _81.x) + _84.x) * 0.25f);
      _97 = ((((_78.y + _75.y) + _81.y) + _84.y) * 0.25f);
    } else {
      _96 = 0.0f;
      _97 = 0.0f;
    }
    if (!(_isRenderEffectDistortionQuarter == 0)) {
      int _101 = (uint)(uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x) >> 2;
      int _102 = (uint)(uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y) >> 2;
      uint _116 = min((uint)(((int)(int(_screenSizeAndInvSize.x) >> 2)) + -1), (uint)((uint)((uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x) + 2u) >> 2));
      uint _117 = min((uint)(((int)(int(_screenSizeAndInvSize.y) >> 2)) + -1), (uint)((uint)((uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y) + 2u) >> 2));
      float4 _119 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_101, _102, 0));
      float4 _122 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3((int)(_116), _102, 0));
      float4 _125 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_101, (int)(_117), 0));
      float4 _128 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3((int)(_116), (int)(_117), 0));
      _142 = (((((_122.x + _119.x) + _125.x) + _128.x) * 0.25f) + _96);
      _143 = (((((_122.y + _119.y) + _125.y) + _128.y) * 0.25f) + _97);
    } else {
      _142 = _96;
      _143 = _97;
    }
    float _144 = _142 * 10.0f;
    float _145 = _143 * 10.0f;
    float _150 = saturate(sqrt((_145 * _145) + (_144 * _144)));
    if (!(_150 < 9.999999747378752e-05f)) {
      float _155 = _distortionIntensityScale * 0.10000000149011612f;
      float4 _162 = __3__36__0__0__g_sceneColor.Sample(__3__40__0__0__g_distortionSampler, float2(((_155 * _142) + (_renderTargetSizeInv.x * float((uint)(uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x)))), ((_155 * _143) + (_renderTargetSizeInv.y * float((uint)(uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y))))));
      __3__38__0__1__g_sceneColorUAV[int2(((int)(uint(float((uint)(_renderTargetSize.x * ((uint)((uint)(_19.x)) >> 16))) * _effectTileDataSizeInv.x) + SV_GroupThreadID.x)), ((int)(uint(float((uint)((_19.x & 65535) * _renderTargetSize.y)) * _effectTileDataSizeInv.y) + SV_GroupThreadID.y)))] = float4(_162.x, _162.y, _162.z, _150);
    }
  }
  */
}
