#include "../shared.h"

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

RWTexture2D<float2> __3__38__0__1__g_sceneAOResultUAV : register(u38, space38);

RWTexture2D<float4> __3__38__0__1__g_bentConeResultUAV : register(u39, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b18, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int __loop_jump_target = -1;
  int _8[4];
  int _14 = (int)(SV_GroupID.x) & 3;
  int _15 = (uint)((uint)(_14)) >> 1;
  _8[0] = ((g_tileIndex[(SV_GroupID.x) >> 5]).x);
  _8[1] = ((g_tileIndex[(SV_GroupID.x) >> 5]).y);
  _8[2] = ((g_tileIndex[(SV_GroupID.x) >> 5]).z);
  _8[3] = ((g_tileIndex[(SV_GroupID.x) >> 5]).w);
  int _33 = _8[(((uint)(SV_GroupID.x) >> 3) & 3)];
  int _37 = select((((int)(SV_GroupID.x) & 4) == 0), _33, ((uint)((uint)(_33)) >> 16));
  float _46 = float((uint)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160))));
  float _47 = float((uint)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160))));
  uint _54 = __3__36__0__0__g_depthStencil.Load(int3(((int)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160)))), 0));
  int _56 = (uint)((uint)(_54.x)) >> 24;
  float _59 = float((uint)((uint)(_54.x & 16777215))) * 5.960465188081798e-08f;
  int _60 = _56 & 127;
  uint _62 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160)))), 0));
  float _78 = min(1.0f, ((float((uint)((uint)(_62.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _79 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_62.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _80 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_62.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _82 = rsqrt(dot(float3(_78, _79, _80), float3(_78, _79, _80)));
  float _83 = _82 * _78;
  float _84 = _82 * _79;
  float _85 = _82 * _80;
  float _88 = ((_bufferSizeAndInvSize.z * 2.0f) * (_46 + 0.5f)) + -1.0f;
  float _91 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_47 + 0.5f));
  bool _93 = (_59 == 1.0f);
  float _206;
  float _215;
  float _239;
  float _240;
  float _241;
  int _385;
  float _396;
  float _411;
  float _412;
  float _413;
  float _414;
  float _415;
  float _416;
  int _417;
  float _418;
  float _419;
  float _420;
  int _421;
  int _422;
  float _592;
  float _593;
  float _594;
  float _595;
  float _596;
  int _597;
  int _598;
  float _599;
  int _641;
  int _659;
  float _660;
  float _680;
  bool _702;
  int _705;
  float _706;
  int _721;
  float _737;
  float _782;
  float _783;
  float _784;
  float _799;
  float _800;
  float _801;
  float _810;
  float _823;
  float _824;
  if (((_59 < 1.0000000116860974e-07f)) || (_93)) {
    float _96 = select(_93, 0.0f, 1.0f);
    _823 = _96;
    _824 = _96;
  } else {
    float _101 = max(1.0000000116860974e-07f, _59);
    float _102 = _nearFarProj.x / _101;
    float _138 = mad((_invViewProjRelative[3].z), _101, mad((_invViewProjRelative[3].y), _91, ((_invViewProjRelative[3].x) * _88))) + (_invViewProjRelative[3].w);
    float _139 = (mad((_invViewProjRelative[0].z), _101, mad((_invViewProjRelative[0].y), _91, ((_invViewProjRelative[0].x) * _88))) + (_invViewProjRelative[0].w)) / _138;
    float _140 = (mad((_invViewProjRelative[1].z), _101, mad((_invViewProjRelative[1].y), _91, ((_invViewProjRelative[1].x) * _88))) + (_invViewProjRelative[1].w)) / _138;
    float _141 = (mad((_invViewProjRelative[2].z), _101, mad((_invViewProjRelative[2].y), _91, ((_invViewProjRelative[2].x) * _88))) + (_invViewProjRelative[2].w)) / _138;
    float _143 = rsqrt(dot(float3(_139, _140, _141), float3(_139, _140, _141)));
    bool _150 = ((uint)(_60 + -53) < (uint)15);
    bool _152 = ((_60 == 57)) || (_150);
    float _155 = float((uint)(uint)(_frameNumber.x));
    float _166 = (frac(((_155 * 92.0f) + _46) * 0.0078125f) * 128.0f) + -64.34062194824219f;
    float _167 = (frac(((_155 * 71.0f) + _47) * 0.0078125f) * 128.0f) + -72.46562194824219f;
    float _172 = frac(dot(float3((_166 * _166), (_167 * _167), (_167 * _166)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
    bool _178 = (_152) && ((_102 < 4.0f));
    bool _179 = (_60 == 65);
    bool _188 = (_shadowAOParams.z == 0.0f);
    int _189 = select(_188, 4, select(_179, 32, select(_178, 8, 4)));
    int _190 = select(_188, 5, select(_152, 8, 6));
    float _195 = ((_bufferSizeAndInvSize.z * 16.0f) * _102) * _screenPercentage.x;
    if (_152) {
      _206 = max(0.05000000074505806f, (_195 * 4.0f));
    } else {
      _206 = (max(((_102 * 0.03125f) + 0.10000000149011612f), (_195 * 16.0f)) * 2.0f);
    }
    int _207 = _56 & 126;
    if ((((_56 & 124) == 64)) || ((_60 == 54))) {
      _215 = max(0.019999999552965164f, _206);
    } else {
      _215 = _206;
    }
    if (((((_60 == 107)) || ((((_60 == 18)) || ((((_207 == 16)) || ((((_207 == 12)) || (((uint)(_60 + -19) < (uint)2)))))))))) && ((!_152))) {
      float _232 = saturate(_102 * 0.019999999552965164f) + _84;
      float _234 = rsqrt(dot(float3(_83, _232, _85), float3(_83, _232, _85)));
      _239 = (_234 * _83);
      _240 = (_234 * _232);
      _241 = (_234 * _85);
    } else {
      _239 = _83;
      _240 = _84;
      _241 = _85;
    }
    int _272 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) + 1013904242u));
    int _280 = ((int)(((((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    uint _284 = ((uint)(_280 ^ (((uint)(((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)));
    int _296 = ((int)(((((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _304 = ((int)(((((uint)(_296 ^ (((uint)(((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _284) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_296 ^ (((uint)(((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _284) + 2027808484u));
    uint _308 = ((uint)(_304 ^ ((int)(((uint)((uint)(((uint)(_296 ^ (((uint)(((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _284) >> 5)) + 2123724318u)))) + (((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
    uint _316 = ((uint)((((int)((_308 << 4) + (uint)(-1556008596))) ^ ((int)(_308 + 387276957u))) ^ (((uint)(_308) >> 5) + -939442524))) + (((uint)(_296 ^ (((uint)(((uint)((((int)((_284 << 4) + (uint)(-1383041155))) ^ ((int)(_284 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_284) >> 5)) + 2123724318u)))) + (((uint)(_272 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_47 * _bufferSizeAndInvSize.x) + _46)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _284);
    int _347 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)) >> 5) + -939442524);
    int _360 = ((int)(((((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308))) + (uint)(-239350328)));
    uint _364 = ((uint)(_360 ^ (((uint)(((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308))) >> 5) + -939442524))) + ((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316));
    if (((int)(_364) & 16777215) == 0) {
      int _379 = ((int)(((((uint)((((int)((_364 << 4) + (uint)(-1383041155))) ^ ((int)(_364 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_364) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_364 << 4) + (uint)(-1383041155))) ^ ((int)(_364 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_364) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)))) + (uint)(-1879881855)));
      _385 = ((int)(((uint)(_379 ^ (((uint)(((uint)((((int)((_364 << 4) + (uint)(-1383041155))) ^ ((int)(_364 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_364) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_347) + (((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308) >> 5) + -939442524))) + _316) >> 5)) + 2123724318u)))) + (((uint)((((int)((_316 << 4) + (uint)(-1383041155))) ^ ((int)(_316 + 387276957u))) ^ ((int)(((uint)((uint)(_316) >> 5)) + 2123724318u)))) + _308)))) >> 5) + -939442524))) + _364));
    } else {
      _385 = (int)(_364);
    }
    uint _386 = _385 * 48271;
    if (!_150) {
      float _392 = float((uint)(uint)(_190));
      _396 = (_392 / (_392 + -1.5f));
    } else {
      _396 = 1.0f;
    }
    float _397 = _396 * select(_179, 0.019999999552965164f, _215);
    _411 = 0.0f;
    _412 = 0.0f;
    _413 = 0.0f;
    _414 = 0.0f;
    _415 = 0.0f;
    _416 = 0.0f;
    _417 = (int)(_386);
    _418 = 0.0f;
    _419 = 0.0f;
    _420 = 0.0f;
    _421 = 0;
    _422 = 0;
    while(true) {
      int _425 = ((int)((_422 * (int)(max((uint)(1), (uint)(select(_179, 0, select(_178, 3, 7)))))) + uint(float((uint)((uint)((int)(_386) & 16777215))) * 1.5258193343470339e-05f))) & 31;
      float _437 = frac((float((uint)(uint)(_425)) * 0.03125f) + (float((uint)((uint)((int)(uint(_172 * 51540816.0f)) & 65535))) * 1.52587890625e-05f)) * 6.2831854820251465f;
      float _438 = sqrt(float((uint)((uint)(reversebits(_425) ^ (int)(uint(_172 * 287478368.0f))))) * 2.3283064365386963e-10f);
      float _441 = sqrt(1.0f - (_438 * _438));
      float _444 = cos(_437) * _441;
      float _445 = sin(_437) * _441;
      float _447 = select((_241 >= 0.0f), 1.0f, -1.0f);
      float _450 = -0.0f - (1.0f / (_447 + _241));
      float _451 = _240 * _450;
      float _452 = _451 * _239;
      float _453 = _447 * _239;
      float _462 = mad(_438, _239, mad(_445, _452, ((((_453 * _239) * _450) + 1.0f) * _444)));
      float _466 = mad(_438, _240, mad(_445, (_447 + (_451 * _240)), ((_444 * _447) * _452)));
      float _470 = mad(_438, _241, mad(_445, (-0.0f - _240), (-0.0f - (_453 * _444))));
      uint _471 = _417 * 48271;
      float _507 = mad((_viewProjRelative[2].z), _141, mad((_viewProjRelative[2].y), _140, ((_viewProjRelative[2].x) * _139))) + (_viewProjRelative[2].w);
      float _511 = mad((_viewProjRelative[3].z), _141, mad((_viewProjRelative[3].y), _140, ((_viewProjRelative[3].x) * _139))) + (_viewProjRelative[3].w);
      float _515 = (_462 * _397) + _139;
      float _516 = (_466 * _397) + _140;
      float _517 = (_470 * _397) + _141;
      float _533 = mad((_viewProjRelative[3].z), _517, mad((_viewProjRelative[3].y), _516, ((_viewProjRelative[3].x) * _515))) + (_viewProjRelative[3].w);
      float _534 = (mad((_viewProjRelative[0].z), _141, mad((_viewProjRelative[0].y), _140, ((_viewProjRelative[0].x) * _139))) + (_viewProjRelative[0].w)) / _511;
      float _535 = (mad((_viewProjRelative[1].z), _141, mad((_viewProjRelative[1].y), _140, ((_viewProjRelative[1].x) * _139))) + (_viewProjRelative[1].w)) / _511;
      float _536 = _507 / _511;
      float _540 = ((mad((_viewProjRelative[0].z), _517, mad((_viewProjRelative[0].y), _516, ((_viewProjRelative[0].x) * _515))) + (_viewProjRelative[0].w)) / _533) - _534;
      float _541 = ((mad((_viewProjRelative[1].z), _517, mad((_viewProjRelative[1].y), _516, ((_viewProjRelative[1].x) * _515))) + (_viewProjRelative[1].w)) / _533) - _535;
      float _544 = 1.0f / float((uint)(uint)(_190));
      float _553 = max(_544, (1.0f / min(1.0f, (max((abs(_540) * _bufferSizeAndInvSize.x), (abs(_541) * _bufferSizeAndInvSize.y)) * _544))));
      float _554 = _553 * (((mad((_viewProjRelative[2].z), _517, mad((_viewProjRelative[2].y), _516, ((_viewProjRelative[2].x) * _515))) + (_viewProjRelative[2].w)) / _533) - _536);
      float _571 = _553 * _544;
      float _573 = (_540 * 0.5f) * _571;
      float _575 = (_541 * -0.5f) * _571;
      float _576 = _554 * _544;
      float _583 = max(((float((uint)((uint)((int)(_471) & 16777215))) * 1.4901161193847656e-08f) + 0.009999999776482582f), (1.0f / max((abs(_573) * _bufferSizeAndInvSize.x), (abs(_575) * _bufferSizeAndInvSize.y))));
      _592 = (((_534 * 0.5f) + 0.5f) + (_583 * _573));
      _593 = ((0.5f - (_535 * 0.5f)) + (_583 * _575));
      _594 = ((_583 * _576) + _536);
      _595 = 0.0f;
      _596 = 0.25f;
      _597 = 0;
      _598 = 0;
      _599 = 0.0f;
      while(true) {
        uint _605 = __3__36__0__0__g_depthStencil.Load(int3(int(_592 * _bufferSizeAndInvSize.x), int(_593 * _bufferSizeAndInvSize.y), 0));
        float _610 = float((uint)((uint)(_605.x & 16777215))) * 5.960465188081798e-08f;
        int _611 = ((uint)((uint)(_605.x)) >> 24) & 127;
        float _613 = select((_597 == 2), 1.2000000476837158f, _596);
        float _615 = _594 - _610;
        float _619 = _nearFarProj.x / max(1.0000000116860974e-07f, _610);
        float _620 = (_544 * _397) * _613;
        float _623 = _619 - (_nearFarProj.x / max(1.0000000116860974e-07f, _594));
        float _625 = (max(abs(_554), (_536 - ((mad((_proj[2].z), _102, 0.0f) + _507) / (mad((_proj[3].z), _102, 0.0f) + _511)))) * 0.3400000035762787f) * max(0.0625f, _544);
        bool __defer_591_640 = false;
        bool __branch_chain_591;
        if (!(abs(_615 + _625) < _625)) {
          _641 = 0;
          __branch_chain_591 = true;
        } else {
          bool _638 = (_623 > select((_611 == 5), -0.07999999821186066f, (-0.0f - max(0.029999999329447746f, min((_619 * 0.5f), ((_619 * _619) * 0.009999999776482582f))))));
          int _639 = (int)(uint)((int)(_638));
          if (!_638) {
            _641 = _639;
            __branch_chain_591 = true;
          } else {
            _659 = _639;
            _660 = _595;
            __branch_chain_591 = false;
          }
        }
        if (__branch_chain_591) {
          __defer_591_640 = true;
        }
        if (__defer_591_640) {
          if (((_595 == 0.0f)) && ((_615 < 0.0f))) {
            _659 = _641;
            _660 = (-0.0f - _623);
          } else {
            if (_595 > 0.0f) {
              float _651 = _620 * 1.5f;
              if (((_595 < _651)) || ((_615 > 0.0f))) {
                _659 = ((int)(uint)((int)((_595 - _651) < 0.0f)));
                _660 = 0.0f;
              } else {
                _659 = _641;
                _660 = _595;
              }
            } else {
              _659 = _641;
              _660 = _595;
            }
          }
        }
        if (!(_659 == 0)) {
          if (((_611 == 19)) || ((_611 == 107))) {
            _680 = max(0.10000000149011612f, (1.0f - (_619 * 0.009999999776482582f)));
          } else {
            _680 = 1.0f;
          }
          if (_598 == 0) {
            _702 = (((_611 == 57)) || (((uint)(_611 + -53) < (uint)15)));
          } else {
            _702 = true;
          }
          _705 = ((int)(uint)((int)(_702)));
          float _aoDistFade = 1.0f - saturate(max((_619 + -100.0f), 0.0f) * 0.05000000074505806f);
          // RenoDX: >>> [Patch: FoliageAORange] [Version: 1.10-family]
          // Description: SceneAOTiled_CS 0x3F87E52D native HBAO distance fade drops foliage occlusion too early, causing distant grass and leaf cards to look detached from surrounding terrain. When foliage AO is enabled, extend only foliage stencil AO reach so the generated scene AO remains visible farther into the mid distance without changing non-foliage materials.
          if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_60 - 12) < 7u)) {
            _aoDistFade = 1.0f - saturate(max((_619 + -200.0f), 0.0f) * 0.005f);
          }
          // RenoDX: <<< [Patch: FoliageAORange]
          _706 = saturate((saturate(1.0f - exp2(log2(select((_terrainNormalParams.z > 0.0f), 0.20000000298023224f, 0.6000000238418579f)) * max(_680, (((_620 * 20.0f) * _aoDistFade) / ((_619 * 0.20000000298023224f) + 1.0f))))) * (1.0f - _599)) + _599);
        } else {
          _705 = _598;
          _706 = _599;
        }
        [branch]
        if (!(_706 > 0.75f)) {
          if ((uint)(_597 + 1) < (uint)_190) {
            _592 = ((_613 * _573) + _592);
            _593 = ((_613 * _575) + _593);
            _594 = ((_613 * _576) + _594);
            _595 = _660;
            _596 = (_613 * 1.100000023841858f);
            _597 = (_597 + 1);
            _598 = ((int)(uint)((int)(_705 != 0)));
            _599 = _706;
            continue;
          } else {
            _721 = 0;
          }
        } else {
          _721 = _611;
        }
        float _722 = _462 + _414;
        float _723 = _466 + _415;
        float _724 = _470 + _416;
        float _727 = saturate(saturate(_706 * 1.100000023841858f));
        float _731 = select(((uint)(_721 + -97) < (uint)2), (_727 * 0.33000001311302185f), _727);
        if (_60 == 15) {
          _737 = saturate(_731 * 2.0f);
        } else {
          _737 = _731;
        }
        float _738 = 1.0f - _737;
        bool _741 = ((uint)(_721 + -53) < (uint)15);
        float _743 = select(((((uint)(_60 + -53) > (uint)14)) && (_741)), 0.30000001192092896f, _738);
        float _747 = (_743 * _462) + _411;
        float _748 = (_743 * _466) + _412;
        float _749 = (_743 * _470) + _413;
        float _750 = _418 + 1.0f;
        float _751 = _462 - (_143 * _139);
        float _752 = _466 - (_143 * _140);
        float _753 = _470 - (_143 * _141);
        float _755 = rsqrt(dot(float3(_751, _752, _753), float3(_751, _752, _753)));
        float _760 = saturate(dot(float3(_239, _240, _241), float3((_755 * _751), (_755 * _752), (_755 * _753))));
        float _763 = 1.0f - ((_760 * _760) * 0.35999995470046997f);
        float _765 = 0.20371833443641663f / (_763 * _763);
        float _767 = (_765 * _738) + _419;
        float _768 = _765 + _420;
        bool _771 = (((_705 | _421) != 0)) || (_741);
        bool __defer_736_809 = false;
        float _401 = 0.0f;
        float _790 = 0.0f;
        if ((uint)(_422 + 1) < (uint)_189) {
          _411 = _747;
          _412 = _748;
          _413 = _749;
          _414 = _722;
          _415 = _723;
          _416 = _724;
          _417 = (int)(_471);
          _418 = _750;
          _419 = _767;
          _420 = _768;
          _421 = ((int)(uint)((int)(_771)));
          _422 = (_422 + 1);
          __loop_jump_target = 410;
          break;
        }
        if (__defer_736_809) {
          __3__38__0__1__g_bentConeResultUAV[int2(((int)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160)))))] = float4(((_799 * 0.5f) + 0.5f), ((_800 * 0.5f) + 0.5f), ((_801 * 0.5f) + 0.5f), saturate(1.0f - _790));
          _823 = ((_810 + _shadowAOParams.w) - (_810 * _shadowAOParams.w));
          _824 = _401;
          break;
        }
        _401 = saturate(_767 / max(9.999999974752427e-07f, _768));
        float _408 = sqrt(((_723 * _723) + (_722 * _722)) + (_724 * _724)) * _750;
        if (!(_408 == 0.0f)) {
          float _777 = float((uint)(uint)(_189)) / _408;
          _782 = (_777 * _747);
          _783 = (_777 * _748);
          _784 = (_777 * _749);
        } else {
          _782 = _747;
          _783 = _748;
          _784 = _749;
        }
        _790 = sqrt(((_783 * _783) + (_782 * _782)) + (_784 * _784));
        if (!(_790 == 0.0f)) {
          _799 = (_782 / _790);
          _800 = (_783 / _790);
          _801 = (_784 / _790);
        } else {
          _799 = _239;
          _800 = _240;
          _801 = _241;
        }
        if (!_152) {
          _810 = (1.0f - (saturate(select(_771, 0.0f, 1.0f)) * saturate(1.0f - _401)));
        } else {
          _810 = 1.0f;
        }
        __3__38__0__1__g_bentConeResultUAV[int2(((int)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160)))))] = float4(((_799 * 0.5f) + 0.5f), ((_800 * 0.5f) + 0.5f), ((_801 * 0.5f) + 0.5f), saturate(1.0f - _790));
        _823 = ((_810 + _shadowAOParams.w) - (_810 * _shadowAOParams.w));
        // RenoDX: >>> [Patch: FoliageAOBentConeVisibility] [Version: 1.10-family]
        // Description: SceneAOTiled_CS 0x3F87E52D native global AO strength blend can wash out foliage bent-cone visibility after the AO solve. When foliage AO is enabled, blend foliage stencil pixels back toward the unsoftened bent-cone visibility so downstream diffuse lighting receives stronger leaf and grass occlusion while non-foliage AO remains native.
        if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_60 - 12) < 7u)) {
          _823 = lerp(_823, _810, FOLIAGE_AO_STRENGTH);
        }
        // RenoDX: <<< [Patch: FoliageAOBentConeVisibility]
        _824 = _401;
        break;
      }
      if (__loop_jump_target == 410) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  }
  __3__38__0__1__g_sceneAOResultUAV[int2(((int)((((uint)((_14 - (_15 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_37) << 5)) & 8160)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_37)) >> 3) & 8160)))))] = float2(_823, _824);
}
