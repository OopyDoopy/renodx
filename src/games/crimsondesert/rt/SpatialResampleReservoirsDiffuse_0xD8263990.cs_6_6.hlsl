Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t50, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t49, space36);

Texture2D<uint4> __3__36__0__0__g_diffuseGIReservoirHitGeometry : register(t107, space36);

Texture2D<uint2> __3__36__0__0__g_diffuseGIReservoirRadiance : register(t25, space36);

RWTexture2D<float4> __3__38__0__1__g_raytracingHitResultUAV : register(u43, space38);

RWTexture2D<float> __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV : register(u44, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u12, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b20, space35) {
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

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _renderParams : packoffset(c000.x);
  float4 _renderParams2 : packoffset(c001.x);
  float4 _cubemapViewPosRelative : packoffset(c002.x);
  float4 _lightingParams : packoffset(c003.x);
  float4 _tiledRadianceCacheParams : packoffset(c004.x);
  float _rtaoIntensity : packoffset(c005.x);
};

// [RenoDX] RT quality injection
cbuffer RenoDXRTInjection : register(b13, space50) {
  float _rndx_rt_quality : packoffset(c5.z);
};

// [RenoDX] R2 quasi-random noise with Cranley-Patterson rotation
uint _rndx_pcg(uint v) {
  uint state = v * 747796405u + 2891336453u;
  uint word  = ((state >> ((state >> 28u) + 4u)) ^ state) * 277803737u;
  return (word >> 22u) ^ word;
}
float2 _rndx_sample_noise(uint2 pixelCoord, float frameIndex, uint streamIndex = 0u) {
  // streamIndex decorrelates different sampling uses across pipeline stages
  uint h = _rndx_pcg(pixelCoord.x + pixelCoord.y * 8192u + streamIndex * 65537u);
  float off1 = float(h) * (1.0f / 4294967296.0f);
  float off2 = float(_rndx_pcg(h)) * (1.0f / 4294967296.0f);
  float n = frameIndex;
  return frac(float2(off1 + n * 0.7548776662466927f,
                     off2 + n * 0.5698402909980532f));
}

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int __loop_jump_target = -1;
  float _14 = float((uint)SV_DispatchThreadID.x);
  float _15 = float((uint)SV_DispatchThreadID.y);
  uint _34 = ((uint)((((int)((((uint)(int4(_frameNumber).x)) << 4) + -1556008596u)) ^ ((int)(((uint)(int4(_frameNumber).x)) + -1640531527u))) ^ (((uint)((uint)(int4(_frameNumber).x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * _15) + _14);
  uint _42 = ((uint)((((int)((_34 << 4) + -1383041155u)) ^ ((int)(_34 + -1640531527u))) ^ ((int)(((uint)((uint)(_34) >> 5)) + 2123724318u)))) + ((uint)(int4(_frameNumber).x));
  uint _50 = ((uint)((((int)((_42 << 4) + -1556008596u)) ^ ((int)(_42 + 1013904242u))) ^ (((uint)(_42) >> 5) + -939442524))) + _34;
  uint _58 = ((uint)((((int)((_50 << 4) + -1383041155u)) ^ ((int)(_50 + 1013904242u))) ^ ((int)(((uint)((uint)(_50) >> 5)) + 2123724318u)))) + _42;
  uint _66 = ((uint)((((int)((_58 << 4) + -1556008596u)) ^ ((int)(_58 + -626627285u))) ^ (((uint)(_58) >> 5) + -939442524))) + _50;
  uint _74 = ((uint)((((int)((_66 << 4) + -1383041155u)) ^ ((int)(_66 + -626627285u))) ^ ((int)(((uint)((uint)(_66) >> 5)) + 2123724318u)))) + _58;
  uint _82 = ((uint)((((int)((_74 << 4) + -1556008596u)) ^ ((int)(_74 + 2027808484u))) ^ (((uint)(_74) >> 5) + -939442524))) + _66;
  uint _90 = ((uint)((((int)((_82 << 4) + -1383041155u)) ^ ((int)(_82 + 2027808484u))) ^ ((int)(((uint)((uint)(_82) >> 5)) + 2123724318u)))) + _74;
  uint _98 = ((uint)((((int)((_90 << 4) + -1556008596u)) ^ ((int)(_90 + 387276957u))) ^ (((uint)(_90) >> 5) + -939442524))) + _82;
  uint _106 = ((uint)((((int)((_98 << 4) + -1383041155u)) ^ ((int)(_98 + 387276957u))) ^ ((int)(((uint)((uint)(_98) >> 5)) + 2123724318u)))) + _90;
  uint _114 = ((uint)((((int)((_106 << 4) + -1556008596u)) ^ ((int)(_106 + -1253254570u))) ^ (((uint)(_106) >> 5) + -939442524))) + _98;
  uint _122 = ((uint)((((int)((_114 << 4) + -1383041155u)) ^ ((int)(_114 + -1253254570u))) ^ ((int)(((uint)((uint)(_114) >> 5)) + 2123724318u)))) + _106;
  uint _130 = ((uint)((((int)((_122 << 4) + -1556008596u)) ^ ((int)(_122 + 1401181199u))) ^ (((uint)(_122) >> 5) + -939442524))) + _114;
  uint _138 = ((uint)((((int)((_130 << 4) + -1383041155u)) ^ ((int)(_130 + 1401181199u))) ^ ((int)(((uint)((uint)(_130) >> 5)) + 2123724318u)))) + _122;
  uint _146 = ((uint)((((int)((_138 << 4) + -1556008596u)) ^ ((int)(_138 + -239350328u))) ^ (((uint)(_138) >> 5) + -939442524))) + _130;
  uint _154 = ((uint)((((int)((_146 << 4) + -1383041155u)) ^ ((int)(_146 + -239350328u))) ^ ((int)(((uint)((uint)(_146) >> 5)) + 2123724318u)))) + _138;
  int _167;
  int _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  int _357;
  float _358;
  float _359;
  float _360;
  float _361;
  int _362;
  float _363;
  float _364;
  int _365;
  int _603;
  float _604;
  float _605;
  float _606;
  float _607;
  int _608;
  float _609;
  float _610;
  if ((_146 & 16777215) == 0) {
    _167 = ((int)(((uint)((((int)((_154 << 4) + -1556008596u)) ^ ((int)(_154 + -1879881855u))) ^ (((uint)(_154) >> 5) + -939442524))) + _146));
  } else {
    _167 = _146;
  }
  uint _169 = __3__36__0__0__g_depthOpaque.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  uint _175 = __3__36__0__0__g_sceneNormal.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  float _191 = min(1.0f, ((float((uint)((uint)(_175.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _192 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_175.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _193 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_175.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _195 = rsqrt(dot(float3(_191, _192, _193), float3(_191, _192, _193)));
  float _196 = _195 * _191;
  float _197 = _195 * _192;
  float _198 = _195 * _193;
  float _202 = (((_14 + 0.5f) * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f;
  float _205 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_15 + 0.5f));
  float _206 = max(1.0000000116860974e-07f, (float((uint)((uint)(_169.x & 16777215))) * 5.960465188081798e-08f));
  float _242 = mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).w), _206, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).w), _205, ((float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).w) * _202))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).w);
  float _243 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).x), _206, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).x), _205, ((float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).x) * _202))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).x)) / _242;
  float _244 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).y), _206, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).y), _205, ((float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).y) * _202))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).y)) / _242;
  float _245 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).z), _206, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).z), _205, ((float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).z) * _202))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).z)) / _242;
  uint4 _257 = __3__36__0__0__g_diffuseGIReservoirHitGeometry.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  uint2 _262 = __3__36__0__0__g_diffuseGIReservoirRadiance.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  float _276 = min(1.0f, ((float((uint)((uint)((int)(uint((_196 * 511.0f) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _277 = min(1.0f, ((float((uint)((uint)((int)(uint((_197 * 511.0f) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _278 = min(1.0f, ((float((uint)((uint)((int)(uint((_198 * 511.0f) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _280 = rsqrt(dot(float3(_276, _277, _278), float3(_276, _277, _278)));
  float _284 = asfloat(_257.x);
  float _285 = asfloat(_257.y);
  float _286 = asfloat(_257.z);
  float _288 = f16tof32(((uint)((uint)((uint)(_262.x)) >> 16)));
  int _289 = _262.x & 1023;
  float _291 = _284 - _243;
  float _292 = _285 - _244;
  float _293 = _286 - _245;
  float _295 = rsqrt(dot(float3(_291, _292, _293), float3(_291, _292, _293)));
  float _302 = (_288 * 0.31830987334251404f) * max(0.10000000149011612f, dot(float3((_280 * _276), (_280 * _277), (_280 * _278)), float3((_295 * _291), (_295 * _292), (_295 * _293))));
  float _305 = (float((uint)_289) * asfloat(_262.y)) * _302;
  float _313 = select((_renderParams.x > 0.0f), 32.0f, 8.0f);
  int _316 = max(4, (16 / max(1, _289)));
  if (!(_316 == 0)) {
    _357 = _289;
    _358 = _288;
    _359 = _284;
    _360 = _285;
    _361 = _286;
    _362 = ((int)(_167 * 48271));
    _363 = _302;
    _364 = _305;
    _365 = 0;
    while(true) {
      uint _371 = _362 * -1964877855;
      // [RenoDX] R2+CP blue noise for spatial neighbor selection
      int _390, _391;
      if (_rndx_rt_quality > 0.5f) {
        float2 _rndx_nbr = _rndx_sample_noise(SV_DispatchThreadID.xy, _frameNumber.x, 3u + _365);
        _390 = int(min(max(float(int((_rndx_nbr.x * 2.0f - 1.0f) * _313) + (int)(SV_DispatchThreadID.x)), 0.0f), (_bufferSizeAndInvSize.x - 1.0f)));
        _391 = int(min(max(float(int((_rndx_nbr.y * 2.0f - 1.0f) * _313) + (int)(SV_DispatchThreadID.y)), 0.0f), (_bufferSizeAndInvSize.y - 1.0f)));
      } else {
        _390 = int(min(max(float((int)(int(((float((uint)((uint)(((int)(_362 * 48271)) & 16777215))) * 1.1920928955078125e-07f) + -1.0f) * _313) + (int)(SV_DispatchThreadID.x))), 0.0f), (_bufferSizeAndInvSize.x + -1.0f)));
        _391 = int(min(max(float((int)(int(((float((uint)((uint)(_371 & 16777215))) * 1.1920928955078125e-07f) + -1.0f) * _313) + (int)(SV_DispatchThreadID.y))), 0.0f), (_bufferSizeAndInvSize.y + -1.0f)));
      }
      uint _393 = __3__36__0__0__g_depthOpaque.Load(int3(_390, _391, 0));
      uint _399 = __3__36__0__0__g_sceneNormal.Load(int3(_390, _391, 0));
      float _415 = min(1.0f, ((float((uint)((uint)(_399.x & 1023))) * 0.001956947147846222f) + -1.0f));
      float _416 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_399.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _417 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_399.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _429 = (((float((int)(_390)) + 0.5f) * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f;
      float _432 = 1.0f - (((float((int)(_391)) + 0.5f) * 2.0f) * _bufferSizeAndInvSize.w);
      float _433 = max(1.0000000116860974e-07f, (float((uint)((uint)(_393.x & 16777215))) * 5.960465188081798e-08f));
      float _469 = mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).w), _433, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).w), _432, (_429 * (float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).w)))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).w);
      float _470 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).x), _433, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).x), _432, (_429 * (float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).x)))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).x)) / _469;
      float _471 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).y), _433, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).y), _432, (_429 * (float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).y)))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).y)) / _469;
      float _472 = (mad((float4(_invViewProjRelative[0].z, _invViewProjRelative[1].z, _invViewProjRelative[2].z, _invViewProjRelative[3].z).z), _433, mad((float4(_invViewProjRelative[0].y, _invViewProjRelative[1].y, _invViewProjRelative[2].y, _invViewProjRelative[3].y).z), _432, (_429 * (float4(_invViewProjRelative[0].x, _invViewProjRelative[1].x, _invViewProjRelative[2].x, _invViewProjRelative[3].x).z)))) + (float4(_invViewProjRelative[0].w, _invViewProjRelative[1].w, _invViewProjRelative[2].w, _invViewProjRelative[3].w).z)) / _469;
      float _473 = rsqrt(dot(float3(_415, _416, _417), float3(_415, _416, _417))) * 511.0f;
      uint4 _485 = __3__36__0__0__g_diffuseGIReservoirHitGeometry.Load(int3(_390, _391, 0));
      uint2 _491 = __3__36__0__0__g_diffuseGIReservoirRadiance.Load(int3(_390, _391, 0));
      float _505 = min(1.0f, ((float((uint)((uint)((int)(uint((_473 * _415) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _506 = min(1.0f, ((float((uint)((uint)((int)(uint((_473 * _416) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _507 = min(1.0f, ((float((uint)((uint)((int)(uint((_473 * _417) + 511.5f)) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _509 = rsqrt(dot(float3(_505, _506, _507), float3(_505, _506, _507)));
      float _510 = asfloat(_485.x);
      float _511 = asfloat(_485.y);
      float _512 = asfloat(_485.z);
      float _527 = min(1.0f, ((float((uint)((uint)(_485.w & 1023))) * 0.001956947147846222f) + -1.0f));
      float _528 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_485.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _529 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_485.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _531 = rsqrt(dot(float3(_527, _528, _529), float3(_527, _528, _529)));
      float _532 = _531 * _527;
      float _533 = _531 * _528;
      float _534 = _531 * _529;
      float _536 = f16tof32(((uint)((uint)((uint)(_491.x)) >> 16)));
      int _537 = _491.x & 1023;
      if (!(abs(dot(float3(_196, _197, _198), float3((_470 - _243), (_471 - _244), (_472 - _245)))) > max(0.5f, (_nearFarProj.x / _206)))) {
        if (!(dot(float3(_196, _197, _198), float3((_509 * _505), (_509 * _506), (_509 * _507))) < 0.0f)) {
          float _552 = _510 - _470;
          float _553 = _511 - _471;
          float _554 = _512 - _472;
          float _555 = _510 - _243;
          float _556 = _511 - _244;
          float _557 = _512 - _245;
          float _558 = dot(float3(_555, _556, _557), float3(_555, _556, _557));
          float _559 = dot(float3(_552, _553, _554), float3(_552, _553, _554));
          float _560 = rsqrt(_559);
          float _564 = rsqrt(_558);
          float _566 = _558 * dot(float3((_560 * _552), (_560 * _553), (_560 * _554)), float3(_532, _533, _534));
          if (!(_566 >= -0.0f)) {
            float _570 = _564 * _555;
            float _571 = _564 * _556;
            float _572 = _564 * _557;
            float _578 = min(max(((-0.0f - (_559 * dot(float3(_570, _571, _572), float3(_532, _533, _534)))) / (-0.0f - _566)), 0.0f), 1.0f);
            if (!(_578 <= 0.0f)) {
              float _584 = (_536 * 0.31830987334251404f) * max(0.10000000149011612f, dot(float3(_196, _197, _198), float3(_570, _571, _572)));
              float _588 = ((float((uint)_537) * asfloat(_491.y)) * _578) * _584;
              uint _589 = _362 * -856141137;
              float _593 = _588 + _364;
              bool _596 = (((float((uint)((uint)(_589 & 16777215))) * 5.960464477539063e-08f) * _593) <= _588);
              _603 = ((int)(_537 + _357));
              _604 = select(_596, _536, _358);
              _605 = select(_596, _510, _359);
              _606 = select(_596, _511, _360);
              _607 = select(_596, _512, _361);
              _608 = _589;
              _609 = select(_596, _584, _363);
              _610 = _593;
            } else {
              _603 = _357;
              _604 = _358;
              _605 = _359;
              _606 = _360;
              _607 = _361;
              _608 = _371;
              _609 = _363;
              _610 = _364;
            }
          } else {
            _603 = _357;
            _604 = _358;
            _605 = _359;
            _606 = _360;
            _607 = _361;
            _608 = _371;
            _609 = _363;
            _610 = _364;
          }
        } else {
          _603 = _357;
          _604 = _358;
          _605 = _359;
          _606 = _360;
          _607 = _361;
          _608 = _371;
          _609 = _363;
          _610 = _364;
        }
      } else {
        _603 = _357;
        _604 = _358;
        _605 = _359;
        _606 = _360;
        _607 = _361;
        _608 = _371;
        _609 = _363;
        _610 = _364;
      }
      uint _611 = _365 + 1u;
      if (!(_611 == _316)) {
        _357 = _603;
        _358 = _604;
        _359 = _605;
        _360 = _606;
        _361 = _607;
        _362 = _608;
        _363 = _609;
        _364 = _610;
        _365 = _611;
        continue;
      }
      _322 = _603;
      _323 = _604;
      _324 = _605;
      _325 = _606;
      _326 = _607;
      _327 = _609;
      _328 = _610;
      break;
    }
  } else {
    _322 = _289;
    _323 = _288;
    _324 = _284;
    _325 = _285;
    _326 = _286;
    _327 = _302;
    _328 = _305;
  }
  float _330 = _327 * float((uint)_322);
  float _334 = saturate(select((_330 == 0.0f), 0.0f, (_328 / _330)));
  float _338 = _324 - _243;
  float _339 = _325 - _244;
  float _340 = _326 - _245;
  float _346 = sqrt(((_339 * _339) + (_338 * _338)) + (_340 * _340));
  float _347 = max(9.999999974752427e-07f, _346);
  half _352 = -0.0h - half(min(0.0f, (-0.0f - (_323 * _334))));
  __3__38__0__1__g_diffuseResultUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = half4(_352, _352, _352, 0.0h);
  __3__38__0__1__g_raytracingHitResultUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4((_338 / _347), (_339 / _347), (_340 / _347), _346);
  __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = _334;
}
