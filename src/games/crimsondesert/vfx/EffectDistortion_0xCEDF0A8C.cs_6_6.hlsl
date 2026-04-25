// No op the whole shader... Why? Because its abysmal
//
// New setup is split into two RenderParticleDistortion shaders that then get
// composited here. Still uses half/quarter res distortion but now with a box filter
// Still has issues with low res blur noise artifacts so we just no op

Texture2D<uint> __3__36__0__0__g_effectTileCoords : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t30, space36);

Texture2D<float4> __3__36__0__0__textureDistortionOffsetHalf : register(t31, space36);

Texture2D<float4> __3__36__0__0__textureDistortionOffsetQuarter : register(t32, space36);

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
  row_major float4x4 _viewProj;
  row_major float4x4 _viewProjNoJitter;
  row_major float4x4 _viewProjRelative;
  row_major float4x4 _viewProjRelativeNoJitter;
  row_major float4x4 _invViewProj;
  row_major float4x4 _invViewProjRelative;
  row_major float4x4 _invViewProjRelativeNoJitter;
  row_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  row_major float4x4 _view;
  row_major float4x4 _viewRelative;
  row_major float4x4 _viewRelativePrev;
  row_major float4x4 _proj;
  row_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  row_major float4x4 _viewProjNoJitterPrev;
  row_major float4x4 _viewProjRelativePrev;
  row_major float4x4 _viewProjRelativeNoJitterPrev;
  row_major float4x4 _invViewProjPrev;
  row_major float4x4 _invViewProjRelativePrev;
  row_major float4x4 _projToPrevProj;
  row_major float4x4 _projToPrevProjNoTranslation;
  row_major float4x4 _viewProjectionTexScale;
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
  min16float4 _debugBaseColor16;
  min16float4 _debugNormal16;
  min16float4 _debugMaterial16;
  min16float4 _debugMultiplier16;
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

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

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
  uint _16;
  int _17;
  uint _19;
  int _21;
  int _22;
  uint _26;
  uint _27;
  float _28;
  float _29;
  float _33;
  float _34;
  uint _35;
  uint _36;
  uint _37;
  uint _38;
  bool _41;
  bool _43;
  bool _44;
  float _96;
  float _97;
  float _142;
  float _143;
  float _46;
  float _47;
  float _51;
  float _52;
  bool _55;
  int _57;
  int _58;
  int _62;
  int _63;
  uint _64;
  uint _65;
  int _66;
  int _67;
  uint _68;
  uint _69;
  int _70;
  int _71;
  int _72;
  int _73;
  float4 _75;
  float4 _78;
  float4 _81;
  float4 _84;
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  bool _99;
  int _101;
  int _102;
  int _106;
  int _107;
  uint _108;
  uint _109;
  int _110;
  int _111;
  uint _112;
  uint _113;
  int _114;
  int _115;
  int _116;
  int _117;
  float4 _119;
  float4 _122;
  float4 _125;
  float4 _128;
  float _131;
  float _132;
  float _133;
  float _134;
  float _135;
  float _136;
  float _137;
  float _138;
  float _139;
  float _140;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  bool _151;
  float _155;
  float _156;
  float _157;
  float _158;
  float _159;
  float4 _162;
  _16 = (uint)(SV_GroupID.x) % _effectTileDataSize.x;
  _17 = (uint)(SV_GroupID.x) / _effectTileDataSize.x;
  _19 = __3__36__0__0__g_effectTileCoords.Load(int3(_16, _17, 0));
  _21 = (uint)((int)(_19.x)) >> 16;
  _22 = _19.x & 65535;
  _26 = _renderTargetSize.x * _21;
  _27 = _22 * _renderTargetSize.y;
  _28 = float((uint)_26);
  _29 = float((uint)_27);
  _33 = _28 * _effectTileDataSizeInv.x;
  _34 = _29 * _effectTileDataSizeInv.y;
  _35 = uint(_33);
  _36 = uint(_34);
  _37 = _35 + SV_GroupThreadID.x;
  _38 = _36 + SV_GroupThreadID.y;
  _41 = ((uint)_renderTargetSize.x > (uint)_37);
  _43 = ((uint)_renderTargetSize.y > (uint)_38);
  _44 = _41 && _43;
  if (_44) {
    _46 = float((uint)_37);
    _47 = float((uint)_38);
    _51 = _renderTargetSizeInv.x * _46;
    _52 = _renderTargetSizeInv.y * _47;
    _55 = (_isRenderEffectDistortionHalf == 0);
    do {
      _96 = 0.0f;
      _97 = 0.0f;
      if (!(_55)) {
        _57 = (uint)(_37) >> 1;
        _58 = (uint)(_38) >> 1;
        _62 = int(_screenSizeAndInvSize.x);
        _63 = int(_screenSizeAndInvSize.y);
        _64 = _62 >> 1;
        _65 = _63 >> 1;
        _66 = _64 + -1;
        _67 = _65 + -1;
        _68 = _37 + 1u;
        _69 = _38 + 1u;
        _70 = (uint)(_68) >> 1;
        _71 = (uint)(_69) >> 1;
        _72 = (int)min((uint)(_66), (uint)(_70));
        _73 = (int)min((uint)(_67), (uint)(_71));
        _75 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_57, _58, 0));
        _78 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_72, _58, 0));
        _81 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_57, _73, 0));
        _84 = __3__36__0__0__textureDistortionOffsetHalf.Load(int3(_72, _73, 0));
        _87 = _78.x + _75.x;
        _88 = _78.y + _75.y;
        _89 = _87 + _81.x;
        _90 = _88 + _81.y;
        _91 = _89 + _84.x;
        _92 = _90 + _84.y;
        _93 = _91 * 0.25f;
        _94 = _92 * 0.25f;
        _96 = _93;
        _97 = _94;
      }
      _99 = (_isRenderEffectDistortionQuarter == 0);
      do {
        _142 = _96;
        _143 = _97;
        if (!(_99)) {
          _101 = (uint)(_37) >> 2;
          _102 = (uint)(_38) >> 2;
          _106 = int(_screenSizeAndInvSize.x);
          _107 = int(_screenSizeAndInvSize.y);
          _108 = _106 >> 2;
          _109 = _107 >> 2;
          _110 = _108 + -1;
          _111 = _109 + -1;
          _112 = _37 + 2u;
          _113 = _38 + 2u;
          _114 = (uint)(_112) >> 2;
          _115 = (uint)(_113) >> 2;
          _116 = (int)min((uint)(_110), (uint)(_114));
          _117 = (int)min((uint)(_111), (uint)(_115));
          _119 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_101, _102, 0));
          _122 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_116, _102, 0));
          _125 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_101, _117, 0));
          _128 = __3__36__0__0__textureDistortionOffsetQuarter.Load(int3(_116, _117, 0));
          _131 = _122.x + _119.x;
          _132 = _122.y + _119.y;
          _133 = _131 + _125.x;
          _134 = _132 + _125.y;
          _135 = _133 + _128.x;
          _136 = _134 + _128.y;
          _137 = _135 * 0.25f;
          _138 = _136 * 0.25f;
          _139 = _137 + _96;
          _140 = _138 + _97;
          _142 = _139;
          _143 = _140;
        }
        _144 = _142 * 10.0f;
        _145 = _143 * 10.0f;
        _146 = _144 * _144;
        _147 = _145 * _145;
        _148 = _147 + _146;
        _149 = sqrt(_148);
        _150 = saturate(_149);
        _151 = (_150 < 9.999999747378752e-05f);
        if (!(_151)) {
          _155 = _distortionIntensityScale * 0.10000000149011612f;
          _156 = _155 * _142;
          _157 = _155 * _143;
          _158 = _156 + _51;
          _159 = _157 + _52;
          _162 = __3__36__0__0__g_sceneColor.Sample(__3__40__0__0__g_distortionSampler, float2(_158, _159));
          __3__38__0__1__g_sceneColorUAV[int2(_37, _38)] = float4(_162.x, _162.y, _162.z, _150);
        }
      } while (false);
    } while (false);
  }
  */
}
