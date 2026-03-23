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
  int _9 = (uint)(SV_DispatchThreadID.x) >> 3;
  int _10 = (uint)(SV_DispatchThreadID.y) >> 3;
  uint _12 = __3__36__0__0__g_behindReconstructTileMask.Load(int3(_9, _10, 0));
  bool _14 = (_12.x == 0);
  float _44;
  float _45;
  int _46;
  float _51;
  float _52;
  int _53;
  if (!_14) {
    int4 _16 = int4(_frameNumber);
    uint _18 = SV_DispatchThreadID.x << 1;
    uint _19 = SV_DispatchThreadID.y << 1;
    int _20 = _16.x & 1;
    int _21 = (uint)((uint)(_16.x)) >> 1;
    int _22 = _21 & 1;
    int _23 = _20 | _18;
    int _24 = _22 | _19;
    float _26 = __3__36__0__0__g_depth.Load(int3(_23, _24, 0));
    bool _28 = (_26.x < 1.0000000116860974e-07f);
    bool _29 = (_26.x == 1.0f);
    bool _30 = (_28) | (_29);
    if (!_30) {
      float _34 = max(1.0000000116860974e-07f, _26.x);
      float _35 = _nearFarProj.x / _34;
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
          uint _56 = _54 + SV_DispatchThreadID.x;
          uint _57 = _55 + SV_DispatchThreadID.y;
          uint _58 = _56 << 1;
          uint _59 = _57 << 1;
          int _60 = _58 | _20;
          int _61 = _59 | _22;
          float _63 = __3__36__0__0__g_behindReconstructMask.Load(int3(_56, _57, 0));
          float _66 = __3__36__0__0__g_depth.Load(int3(_60, _61, 0));
          float _70 = max(1.0000000116860974e-07f, _66.x);
          float _71 = _nearFarProj.x / _70;
          float _72 = float((int)(_54));
          float _73 = float((int)(_55));
          float _74 = _72 * _72;
          float _75 = _73 * _73;
          float _76 = _74 + _75;
          float _77 = sqrt(_76);
          float _78 = _71 - _35;
          float _79 = _77 * _35;
          float _80 = _79 * -0.009999999776482582f;
          bool _81 = (_80 < _78);
          float _82 = _79 * 0.00019999999494757503f;
          bool _83 = (_78 < _82);
          bool _84 = (_81) & (_83);
          float _85 = float((bool)_84);
          float _86 = _85 * _63.x;
          float _87 = _86 + _51;
          float _88 = _85 + _52;
          int _89 = _53 + 1;
          bool _90 = (_89 == 3);
          if (!_90) {
            _51 = _87;
            _52 = _88;
            _53 = _89;
            continue;
          }
          int _48 = _46 + 1;
          bool _49 = (_48 == 3);
          if (!_49) {
            _44 = _87;
            _45 = _88;
            _46 = _48;
            __loop_jump_target = 43;
            break;
          }
          float _37 = max(9.999999974752427e-07f, _88);
          float _38 = 1.0f / _37;
          float _39 = _87 * 1.75f;
          float _40 = _39 * _38;
          float _41 = saturate(_40);
          bool _42 = (_41 > 0.0f);
          [branch]
          if (_42) {
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
