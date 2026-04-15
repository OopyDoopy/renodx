#include "../shared.h"

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t40, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t79, space36);

RWTexture2D<float2> __3__38__0__1__g_sceneAOResultUAV : register(u37, space38);

RWTexture2D<float4> __3__38__0__1__g_bentConeResultUAV : register(u38, space38);

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

cbuffer __3__35__0__0__TileConstantBuffer : register(b33, space35) {
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
  _8[0] = ((g_tileIndex[(SV_GroupID.x) >> 4]).x);
  _8[1] = ((g_tileIndex[(SV_GroupID.x) >> 4]).y);
  _8[2] = ((g_tileIndex[(SV_GroupID.x) >> 4]).z);
  _8[3] = ((g_tileIndex[(SV_GroupID.x) >> 4]).w);
  int _33 = _8[(((uint)(SV_GroupID.x) >> 2) & 3)];
  float _42 = float((uint)((((uint)(((int)((uint)(_33) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_14 - (_15 << 1)) << 4))));
  float _43 = float((uint)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_33)) >> 16) << 5))));
  uint _50 = __3__36__0__0__g_depthStencil.Load(int3(((int)((((uint)(((int)((uint)(_33) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_14 - (_15 << 1)) << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_33)) >> 16) << 5)))), 0));
  int _52 = (uint)((uint)(_50.x)) >> 24;
  float _55 = float((uint)((uint)(_50.x & 16777215))) * 5.960465188081798e-08f;
  int _56 = _52 & 127;
  uint _58 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)(((int)((uint)(_33) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_14 - (_15 << 1)) << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_33)) >> 16) << 5)))), 0));
  float _74 = min(1.0f, ((float((uint)((uint)(_58.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _75 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_58.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _76 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_58.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _78 = rsqrt(dot(float3(_74, _75, _76), float3(_74, _75, _76)));
  float _79 = _78 * _74;
  float _80 = _78 * _75;
  float _81 = _78 * _76;
  float _84 = ((_bufferSizeAndInvSize.z * 2.0f) * (_42 + 0.5f)) + -1.0f;
  float _87 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_43 + 0.5f));
  bool _89 = (_55 == 1.0f);
  float _202;
  float _211;
  float _235;
  float _236;
  float _237;
  int _381;
  float _392;
  float _407;
  float _408;
  float _409;
  float _410;
  float _411;
  float _412;
  int _413;
  float _414;
  float _415;
  float _416;
  int _417;
  int _418;
  float _588;
  float _589;
  float _590;
  float _591;
  float _592;
  int _593;
  int _594;
  float _595;
  int _637;
  int _655;
  float _656;
  float _676;
  bool _698;
  int _701;
  float _702;
  int _717;
  float _733;
  float _778;
  float _779;
  float _780;
  float _795;
  float _796;
  float _797;
  float _806;
  float _819;
  float _820;
  if (((_55 < 1.0000000116860974e-07f)) || (_89)) {
    float _92 = select(_89, 0.0f, 1.0f);
    _819 = _92;
    _820 = _92;
  } else {
    float _97 = max(1.0000000116860974e-07f, _55);
    float _98 = _nearFarProj.x / _97;
    float _134 = mad((_invViewProjRelative[3].z), _97, mad((_invViewProjRelative[3].y), _87, ((_invViewProjRelative[3].x) * _84))) + (_invViewProjRelative[3].w);
    float _135 = (mad((_invViewProjRelative[0].z), _97, mad((_invViewProjRelative[0].y), _87, ((_invViewProjRelative[0].x) * _84))) + (_invViewProjRelative[0].w)) / _134;
    float _136 = (mad((_invViewProjRelative[1].z), _97, mad((_invViewProjRelative[1].y), _87, ((_invViewProjRelative[1].x) * _84))) + (_invViewProjRelative[1].w)) / _134;
    float _137 = (mad((_invViewProjRelative[2].z), _97, mad((_invViewProjRelative[2].y), _87, ((_invViewProjRelative[2].x) * _84))) + (_invViewProjRelative[2].w)) / _134;
    float _139 = rsqrt(dot(float3(_135, _136, _137), float3(_135, _136, _137)));
    bool _146 = ((uint)(_56 + -53) < (uint)15);
    bool _148 = ((_56 == 57)) || (_146);
    float _151 = float((uint)(uint)(_frameNumber.x));
    float _162 = (frac(((_151 * 92.0f) + _42) * 0.0078125f) * 128.0f) + -64.34062194824219f;
    float _163 = (frac(((_151 * 71.0f) + _43) * 0.0078125f) * 128.0f) + -72.46562194824219f;
    float _168 = frac(dot(float3((_162 * _162), (_163 * _163), (_163 * _162)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
    bool _174 = (_148) && ((_98 < 4.0f));
    bool _175 = (_56 == 65);
    bool _184 = (_shadowAOParams.z == 0.0f);
    int _185 = select(_184, 4, select(_175, 32, select(_174, 8, 4)));
    int _186 = select(_184, 5, select(_148, 8, 6));
    float _191 = ((_bufferSizeAndInvSize.z * 16.0f) * _98) * _screenPercentage.x;
    if (_148) {
      _202 = max(0.05000000074505806f, (_191 * 4.0f));
    } else {
      _202 = (max(((_98 * 0.03125f) + 0.10000000149011612f), (_191 * 16.0f)) * 2.0f);
    }
    int _203 = _52 & 126;
    if ((((_52 & 124) == 64)) || ((_56 == 54))) {
      _211 = max(0.019999999552965164f, _202);
    } else {
      _211 = _202;
    }
    if (((((_56 == 107)) || ((((_56 == 18)) || ((((_203 == 16)) || ((((_203 == 12)) || (((uint)(_56 + -19) < (uint)2)))))))))) && ((!_148))) {
      float _228 = saturate(_98 * 0.019999999552965164f) + _80;
      float _230 = rsqrt(dot(float3(_79, _228, _81), float3(_79, _228, _81)));
      _235 = (_230 * _79);
      _236 = (_230 * _228);
      _237 = (_230 * _81);
    } else {
      _235 = _79;
      _236 = _80;
      _237 = _81;
    }
    int _268 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) + 1013904242u));
    int _276 = ((int)(((((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    uint _280 = ((uint)(_276 ^ (((uint)(((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)));
    int _292 = ((int)(((((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _300 = ((int)(((((uint)(_292 ^ (((uint)(((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _280) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_292 ^ (((uint)(((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _280) + 2027808484u));
    uint _304 = ((uint)(_300 ^ ((int)(((uint)((uint)(((uint)(_292 ^ (((uint)(((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _280) >> 5)) + 2123724318u)))) + (((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
    uint _312 = ((uint)((((int)((_304 << 4) + (uint)(-1556008596))) ^ ((int)(_304 + 387276957u))) ^ (((uint)(_304) >> 5) + -939442524))) + (((uint)(_292 ^ (((uint)(((uint)((((int)((_280 << 4) + (uint)(-1383041155))) ^ ((int)(_280 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_280) >> 5)) + 2123724318u)))) + (((uint)(_268 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_43 * _bufferSizeAndInvSize.x) + _42)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _280);
    int _343 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)) >> 5) + -939442524);
    int _356 = ((int)(((((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304))) + (uint)(-239350328)));
    uint _360 = ((uint)(_356 ^ (((uint)(((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304))) >> 5) + -939442524))) + ((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312));
    if (((int)(_360) & 16777215) == 0) {
      int _375 = ((int)(((((uint)((((int)((_360 << 4) + (uint)(-1383041155))) ^ ((int)(_360 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_360) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_360 << 4) + (uint)(-1383041155))) ^ ((int)(_360 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_360) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)))) + (uint)(-1879881855)));
      _381 = ((int)(((uint)(_375 ^ (((uint)(((uint)((((int)((_360 << 4) + (uint)(-1383041155))) ^ ((int)(_360 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_360) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_343) + (((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304) >> 5) + -939442524))) + _312) >> 5)) + 2123724318u)))) + (((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 387276957u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304)))) >> 5) + -939442524))) + _360));
    } else {
      _381 = (int)(_360);
    }
    uint _382 = _381 * 48271;
    if (!_146) {
      float _388 = float((uint)(uint)(_186));
      _392 = (_388 / (_388 + -1.5f));
    } else {
      _392 = 1.0f;
    }
    float _393 = _392 * select(_175, 0.019999999552965164f, _211);
    _407 = 0.0f;
    _408 = 0.0f;
    _409 = 0.0f;
    _410 = 0.0f;
    _411 = 0.0f;
    _412 = 0.0f;
    _413 = (int)(_382);
    _414 = 0.0f;
    _415 = 0.0f;
    _416 = 0.0f;
    _417 = 0;
    _418 = 0;
    while(true) {
      int _421 = ((int)((_418 * (int)(max((uint)(1), (uint)(select(_175, 0, select(_174, 3, 7)))))) + uint(float((uint)((uint)((int)(_382) & 16777215))) * 1.5258193343470339e-05f))) & 31;
      float _433 = frac((float((uint)(uint)(_421)) * 0.03125f) + (float((uint)((uint)((int)(uint(_168 * 51540816.0f)) & 65535))) * 1.52587890625e-05f)) * 6.2831854820251465f;
      float _434 = sqrt(float((uint)((uint)(reversebits(_421) ^ (int)(uint(_168 * 287478368.0f))))) * 2.3283064365386963e-10f);
      float _437 = sqrt(1.0f - (_434 * _434));
      float _440 = cos(_433) * _437;
      float _441 = sin(_433) * _437;
      float _443 = select((_237 >= 0.0f), 1.0f, -1.0f);
      float _446 = -0.0f - (1.0f / (_443 + _237));
      float _447 = _236 * _446;
      float _448 = _447 * _235;
      float _449 = _443 * _235;
      float _458 = mad(_434, _235, mad(_441, _448, ((((_449 * _235) * _446) + 1.0f) * _440)));
      float _462 = mad(_434, _236, mad(_441, (_443 + (_447 * _236)), ((_440 * _443) * _448)));
      float _466 = mad(_434, _237, mad(_441, (-0.0f - _236), (-0.0f - (_449 * _440))));
      uint _467 = _413 * 48271;
      float _503 = mad((_viewProjRelative[2].z), _137, mad((_viewProjRelative[2].y), _136, ((_viewProjRelative[2].x) * _135))) + (_viewProjRelative[2].w);
      float _507 = mad((_viewProjRelative[3].z), _137, mad((_viewProjRelative[3].y), _136, ((_viewProjRelative[3].x) * _135))) + (_viewProjRelative[3].w);
      float _511 = (_458 * _393) + _135;
      float _512 = (_462 * _393) + _136;
      float _513 = (_466 * _393) + _137;
      float _529 = mad((_viewProjRelative[3].z), _513, mad((_viewProjRelative[3].y), _512, ((_viewProjRelative[3].x) * _511))) + (_viewProjRelative[3].w);
      float _530 = (mad((_viewProjRelative[0].z), _137, mad((_viewProjRelative[0].y), _136, ((_viewProjRelative[0].x) * _135))) + (_viewProjRelative[0].w)) / _507;
      float _531 = (mad((_viewProjRelative[1].z), _137, mad((_viewProjRelative[1].y), _136, ((_viewProjRelative[1].x) * _135))) + (_viewProjRelative[1].w)) / _507;
      float _532 = _503 / _507;
      float _536 = ((mad((_viewProjRelative[0].z), _513, mad((_viewProjRelative[0].y), _512, ((_viewProjRelative[0].x) * _511))) + (_viewProjRelative[0].w)) / _529) - _530;
      float _537 = ((mad((_viewProjRelative[1].z), _513, mad((_viewProjRelative[1].y), _512, ((_viewProjRelative[1].x) * _511))) + (_viewProjRelative[1].w)) / _529) - _531;
      float _540 = 1.0f / float((uint)(uint)(_186));
      float _549 = max(_540, (1.0f / min(1.0f, (max((abs(_536) * _bufferSizeAndInvSize.x), (abs(_537) * _bufferSizeAndInvSize.y)) * _540))));
      float _550 = _549 * (((mad((_viewProjRelative[2].z), _513, mad((_viewProjRelative[2].y), _512, ((_viewProjRelative[2].x) * _511))) + (_viewProjRelative[2].w)) / _529) - _532);
      float _567 = _549 * _540;
      float _569 = (_536 * 0.5f) * _567;
      float _571 = (_537 * -0.5f) * _567;
      float _572 = _550 * _540;
      float _579 = max(((float((uint)((uint)((int)(_467) & 16777215))) * 1.4901161193847656e-08f) + 0.009999999776482582f), (1.0f / max((abs(_569) * _bufferSizeAndInvSize.x), (abs(_571) * _bufferSizeAndInvSize.y))));
      _588 = (((_530 * 0.5f) + 0.5f) + (_579 * _569));
      _589 = ((0.5f - (_531 * 0.5f)) + (_579 * _571));
      _590 = ((_579 * _572) + _532);
      _591 = 0.0f;
      _592 = 0.25f;
      _593 = 0;
      _594 = 0;
      _595 = 0.0f;
      while(true) {
        uint _601 = __3__36__0__0__g_depthStencil.Load(int3(int(_588 * _bufferSizeAndInvSize.x), int(_589 * _bufferSizeAndInvSize.y), 0));
        float _606 = float((uint)((uint)(_601.x & 16777215))) * 5.960465188081798e-08f;
        int _607 = ((uint)((uint)(_601.x)) >> 24) & 127;
        float _609 = select((_593 == 2), 1.2000000476837158f, _592);
        float _611 = _590 - _606;
        float _615 = _nearFarProj.x / max(1.0000000116860974e-07f, _606);
        float _616 = (_540 * _393) * _609;
        float _619 = _615 - (_nearFarProj.x / max(1.0000000116860974e-07f, _590));
        float _621 = (max(abs(_550), (_532 - ((mad((_proj[2].z), _98, 0.0f) + _503) / (mad((_proj[3].z), _98, 0.0f) + _507)))) * 0.3400000035762787f) * max(0.0625f, _540);
        bool __defer_587_636 = false;
        bool __branch_chain_587;
        if (!(abs(_611 + _621) < _621)) {
          _637 = 0;
          __branch_chain_587 = true;
        } else {
          bool _634 = (_619 > select((_607 == 5), -0.07999999821186066f, (-0.0f - max(0.029999999329447746f, min((_615 * 0.5f), ((_615 * _615) * 0.009999999776482582f))))));
          int _635 = (int)(uint)((int)(_634));
          if (!_634) {
            _637 = _635;
            __branch_chain_587 = true;
          } else {
            _655 = _635;
            _656 = _591;
            __branch_chain_587 = false;
          }
        }
        if (__branch_chain_587) {
          __defer_587_636 = true;
        }
        if (__defer_587_636) {
          if (((_591 == 0.0f)) && ((_611 < 0.0f))) {
            _655 = _637;
            _656 = (-0.0f - _619);
          } else {
            if (_591 > 0.0f) {
              float _647 = _616 * 1.5f;
              if (((_591 < _647)) || ((_611 > 0.0f))) {
                _655 = ((int)(uint)((int)((_591 - _647) < 0.0f)));
                _656 = 0.0f;
              } else {
                _655 = _637;
                _656 = _591;
              }
            } else {
              _655 = _637;
              _656 = _591;
            }
          }
        }
        if (!(_655 == 0)) {
          if (((_607 == 19)) || ((_607 == 107))) {
            _676 = max(0.10000000149011612f, (1.0f - (_615 * 0.009999999776482582f)));
          } else {
            _676 = 1.0f;
          }
          if (_594 == 0) {
            _698 = (((_607 == 57)) || (((uint)(_607 + -53) < (uint)15)));
          } else {
            _698 = true;
          }
          _701 = ((int)(uint)((int)(_698)));
          // RenoDX: Extend AO distance falloff for foliage stencils (12-18).
          // Vanilla: fades from depth 100 to 120 (0.05 slope). Too aggressive for foliage.
          // Foliage: fades from depth 200 to 400 (0.005 slope). Keeps AO visible at distance.
          float _aoDistFade;
          if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_56 - 12) < 7u)) {
            _aoDistFade = 1.0f - saturate(max((_615 + -200.0f), 0.0f) * 0.005f);
          } else {
            _aoDistFade = 1.0f - saturate(max((_615 + -100.0f), 0.0f) * 0.05000000074505806f);
          }
          _702 = saturate((saturate(1.0f - exp2(log2(select((_terrainNormalParams.z > 0.0f), 0.20000000298023224f, 0.6000000238418579f)) * max(_676, (((_616 * 20.0f) * _aoDistFade) / ((_615 * 0.20000000298023224f) + 1.0f))))) * (1.0f - _595)) + _595);
        } else {
          _701 = _594;
          _702 = _595;
        }
        [branch]
        if (!(_702 > 0.75f)) {
          if ((uint)(_593 + 1) < (uint)_186) {
            _588 = ((_609 * _569) + _588);
            _589 = ((_609 * _571) + _589);
            _590 = ((_609 * _572) + _590);
            _591 = _656;
            _592 = (_609 * 1.100000023841858f);
            _593 = (_593 + 1);
            _594 = ((int)(uint)((int)(_701 != 0)));
            _595 = _702;
            continue;
          } else {
            _717 = 0;
          }
        } else {
          _717 = _607;
        }
        float _718 = _458 + _410;
        float _719 = _462 + _411;
        float _720 = _466 + _412;
        float _723 = saturate(saturate(_702 * 1.100000023841858f));
        float _727 = select(((uint)(_717 + -97) < (uint)2), (_723 * 0.33000001311302185f), _723);
        if (_56 == 15) {
          _733 = saturate(_727 * 2.0f);
        } else {
          _733 = _727;
        }
        float _734 = 1.0f - _733;
        bool _737 = ((uint)(_717 + -53) < (uint)15);
        float _739 = select(((((uint)(_56 + -53) > (uint)14)) && (_737)), 0.30000001192092896f, _734);
        float _743 = (_739 * _458) + _407;
        float _744 = (_739 * _462) + _408;
        float _745 = (_739 * _466) + _409;
        float _746 = _414 + 1.0f;
        float _747 = _458 - (_139 * _135);
        float _748 = _462 - (_139 * _136);
        float _749 = _466 - (_139 * _137);
        float _751 = rsqrt(dot(float3(_747, _748, _749), float3(_747, _748, _749)));
        float _756 = saturate(dot(float3(_235, _236, _237), float3((_751 * _747), (_751 * _748), (_751 * _749))));
        float _759 = 1.0f - ((_756 * _756) * 0.35999995470046997f);
        float _761 = 0.20371833443641663f / (_759 * _759);
        float _763 = (_761 * _734) + _415;
        float _764 = _761 + _416;
        bool _767 = (((_701 | _417) != 0)) || (_737);
        if ((uint)(_418 + 1) < (uint)_185) {
          _407 = _743;
          _408 = _744;
          _409 = _745;
          _410 = _718;
          _411 = _719;
          _412 = _720;
          _413 = (int)(_467);
          _414 = _746;
          _415 = _763;
          _416 = _764;
          _417 = ((int)(uint)((int)(_767)));
          _418 = (_418 + 1);
          __loop_jump_target = 406;
          break;
        }
        float _397 = saturate(_763 / max(9.999999974752427e-07f, _764));
        float _404 = sqrt(((_719 * _719) + (_718 * _718)) + (_720 * _720)) * _746;
        if (!(_404 == 0.0f)) {
          float _773 = float((uint)(uint)(_185)) / _404;
          _778 = (_773 * _743);
          _779 = (_773 * _744);
          _780 = (_773 * _745);
        } else {
          _778 = _743;
          _779 = _744;
          _780 = _745;
        }
        float _786 = sqrt(((_779 * _779) + (_778 * _778)) + (_780 * _780));
        if (!(_786 == 0.0f)) {
          _795 = (_778 / _786);
          _796 = (_779 / _786);
          _797 = (_780 / _786);
        } else {
          _795 = _235;
          _796 = _236;
          _797 = _237;
        }
        if (!_148) {
          _806 = (1.0f - (saturate(select(_767, 0.0f, 1.0f)) * saturate(1.0f - _397)));
        } else {
          _806 = 1.0f;
        }
        __3__38__0__1__g_bentConeResultUAV[int2(((int)((((uint)(((int)((uint)(_33) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_14 - (_15 << 1)) << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_33)) >> 16) << 5)))))] = float4(((_795 * 0.5f) + 0.5f), ((_796 * 0.5f) + 0.5f), ((_797 * 0.5f) + 0.5f), saturate(1.0f - _786));
        _819 = ((_806 + _shadowAOParams.w) - (_806 * _shadowAOParams.w));
        
        // RenoDX: Reduce AO screen blend washout for foliage stencils (12-18).
        if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_56 - 12) < 7u)) {
          _819 = lerp(_819, _806, FOLIAGE_AO_STRENGTH);
        }
        _820 = _397;
        break;
      }
      if (__loop_jump_target == 406) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  }
  __3__38__0__1__g_sceneAOResultUAV[int2(((int)((((uint)(((int)((uint)(_33) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_14 - (_15 << 1)) << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_33)) >> 16) << 5)))))] = float2(_819, _820);
}