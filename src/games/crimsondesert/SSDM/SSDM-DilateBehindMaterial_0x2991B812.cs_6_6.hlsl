Texture2D<float> __3__36__0__0__g_depth : register(t45, space36);

Texture2D<float> __3__36__0__0__g_behindReconstructMask : register(t53, space36);

Texture2D<uint> __3__36__0__0__g_behindReconstructTileMask : register(t36, space36);

RWTexture2D<float> __3__38__0__1__g_behindReconstructWeightUAV : register(u15, space38);

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

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int __loop_jump_target = -1;
  uint _12 = __3__36__0__0__g_behindReconstructTileMask.Load(int3(((uint)(SV_DispatchThreadID.x) >> 3), ((uint)(SV_DispatchThreadID.y) >> 3), 0));
  float _44;
  float _45;
  int _46;
  float _51;
  float _52;
  int _53;
  if (!(_12.x == 0)) {
    int _20 = _frameNumber.x & 1;
    int _22 = ((uint)((uint)(_frameNumber.x)) >> 1) & 1;
    float _26 = __3__36__0__0__g_depth.Load(int3((_20 | ((int)(SV_DispatchThreadID.x << 1))), (_22 | ((int)(SV_DispatchThreadID.y << 1))), 0));
    if (!(((_26.x < 1.0000000116860974e-07f)) || ((_26.x == 1.0f)))) {
      float _35 = _nearFarProj.x / max(1.0000000116860974e-07f, _26.x);
      _44 = 0.0f;
      _45 = 0.0f;
      _46 = -2;
      while(true) {
        _51 = _44;
        _52 = _45;
        _53 = -2;
        while(true) {
          int _54 = _53 * 3;
          int _55 = _46 * 3;
          float _63 = __3__36__0__0__g_behindReconstructMask.Load(int3(((int)((uint)(_54) + SV_DispatchThreadID.x)), ((int)((uint)(_55) + SV_DispatchThreadID.y)), 0));
          float _66 = __3__36__0__0__g_depth.Load(int3((((int)(((uint)(_54) + SV_DispatchThreadID.x) << 1)) | _20), (((int)(((uint)(_55) + SV_DispatchThreadID.y) << 1)) | _22), 0));
          float _72 = float((int)(_54));
          float _73 = float((int)(_55));
          float _78 = (_nearFarProj.x / max(1.0000000116860974e-07f, _66.x)) - _35;
          float _79 = sqrt((_72 * _72) + (_73 * _73)) * _35;
          float depthTolerance = _79 * 0.005f;
          float _85 = float((bool)((uint)(((-depthTolerance) < _78) && (_78 < depthTolerance))));
          float _87 = (_85 * _63.x) + _51;
          float _88 = _85 + _52;
          if (!((_53 + 1) == 3)) {
            _51 = _87;
            _52 = _88;
            _53 = (_53 + 1);
            continue;
          }
          if (!((_46 + 1) == 3)) {
            _44 = _87;
            _45 = _88;
            _46 = (_46 + 1);
            __loop_jump_target = 43;
            break;
          }
          float _41 = saturate((_87 * 1.75f) * (1.0f / max(9.999999974752427e-07f, _88)));
          [branch]
          if (_41 > 0.0f) {
            __3__38__0__1__g_behindReconstructWeightUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = _41;
          }
          break;
        }
        if (__loop_jump_target == 43) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
    }
  }
}