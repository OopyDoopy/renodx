#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t35, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

RWTexture2D<half4> __3__38__0__1__g_shadowColorResultUAV : register(u40, space38);

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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b19, space35) {
  float4 _shadowDepthRanges : packoffset(c000.x);
  float4 _massiveShadowSizeAndInvSize : packoffset(c001.x);
  uint4 _shadowParam : packoffset(c002.x);
  int4 _updateIndex : packoffset(c003.x);
  float4 _jitterOffset[8] : packoffset(c004.x);
  float4 _shadowRelativePosition : packoffset(c012.x);
  float4 _dynmaicShadowSizeAndInvSize : packoffset(c013.x);
  column_major float4x4 _dynamicShadowProjTexScale[2] : packoffset(c014.x);
  column_major float4x4 _dynamicShadowProjRelativeTexScale[2] : packoffset(c022.x);
  float4 _dynamicShadowFrustumPlanes0[6] : packoffset(c030.x);
  float4 _dynamicShadowFrustumPlanes1[6] : packoffset(c036.x);
  column_major float4x4 _dynamicShadowViewProj[2] : packoffset(c042.x);
  column_major float4x4 _dynamicShadowViewProjPrev[2] : packoffset(c050.x);
  column_major float4x4 _invDynamicShadowViewProj[2] : packoffset(c058.x);
  float4 _dynamicShadowPosition[2] : packoffset(c066.x);
  float4 _shadowSizeAndInvSize : packoffset(c068.x);
  column_major float4x4 _shadowProjTexScale[2] : packoffset(c069.x);
  column_major float4x4 _shadowProjRelativeTexScale[2] : packoffset(c077.x);
  float4 _staticShadowPosition[2] : packoffset(c085.x);
  column_major float4x4 _shadowViewProj[2] : packoffset(c087.x);
  column_major float4x4 _shadowViewProjRelative[2] : packoffset(c095.x);
  column_major float4x4 _invShadowViewProj[2] : packoffset(c103.x);
  float4 _currShadowFrustumPlanes[6] : packoffset(c111.x);
  column_major float4x4 _currShadowViewProjRelative : packoffset(c117.x);
  column_major float4x4 _currInvShadowViewProjRelative : packoffset(c121.x);
  float4 _currStaticShadowPosition : packoffset(c125.x);
  float4 _currTerrainShadowFrustumPlanes[6] : packoffset(c126.x);
  column_major float4x4 _terrainShadowProjTexScale : packoffset(c132.x);
  column_major float4x4 _terrainShadowProjRelativeTexScale : packoffset(c136.x);
  column_major float4x4 _terrainShadowViewProj : packoffset(c140.x);
  column_major float4x4 _nearFieldShadowViewProj : packoffset(c144.x);
  float4 _nearFieldShadowFlag : packoffset(c148.x);
  float4 _nearFieldShadowFrustumPlanes[6] : packoffset(c149.x);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

#include "micro_detail_shadows.hlsli"

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _16[4];
  float _24[2];
  float _25[2];
  float _26[2];
  _16[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _16[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _16[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _16[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _40 = _16[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _44 = select((((int)(SV_GroupID.x) & 16) == 0), _40, ((uint)((uint)(_40)) >> 16));
  float _58 = float((uint)(((uint)(((((int)((uint)(_44) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x));
  float _59 = float((uint)(((uint)(((((uint)((uint)(_44)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y));
  float _67 = ((_bufferSizeAndInvSize.z * 2.0f) * (_58 + 0.5f)) + -1.0f;
  float _70 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_59 + 0.5f));
  uint _72 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)(((((int)((uint)(_44) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_44)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  int _74 = (uint)((uint)(_72.x)) >> 24;
  float _77 = float((uint)((uint)(_72.x & 16777215))) * 5.960465188081798e-08f;
  int _78 = _74 & 127;
  uint _80 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)(((((int)((uint)(_44) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_44)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  float _96 = min(1.0f, ((float((uint)((uint)(_80.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _97 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_80.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _98 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_80.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _100 = rsqrt(dot(float3(_96, _97, _98), float3(_96, _97, _98)));
  float _101 = _100 * _96;
  float _102 = _100 * _97;
  float _103 = _100 * _98;
  bool _105 = (_77 == 1.0f);
  int _375;
  float _554;
  float _628;
  int _629;
  float _630;
  float _694;
  int _695;
  int _696;
  float _697;
  float _759;
  int _760;
  int _761;
  float _810;
  int _811;
  int _812;
  int _971;
  int _1491;
  float _1594;
  float _1595;
  half _1596;
  half _1597;
  half _1598;
  float _1650;
  float _1651;
  float _1652;
  float _1750;
  float _1764;
  int _1801;
  float _1807;
  float _1820;
  float _1833;
  float _1843;
  float _1844;
  float _1845;
  float _1854;
  float _1855;
  float _1856;
  int _2003;
  float _2004;
  float _2005;
  float _2006;
  float _2007;
  float _2008;
  int _2009;
  float _2010;
  float _2011;
  bool _2074;
  int _2081;
  float _2100;
  float _2116;
  int _2123;
  float _2124;
  float _2147;
  float _2148;
  float _2149;
  float _2150;
  float _2151;
  float _2155;
  int _2287;
  float _2288;
  float _2289;
  float _2290;
  float _2291;
  float _2292;
  int _2293;
  float _2294;
  float _2295;
  bool _2358;
  int _2365;
  float _2384;
  float _2400;
  int _2407;
  float _2408;
  float _2431;
  float _2432;
  float _2433;
  float _2434;
  float _2435;
  float _2439;
  int _2449;
  float _2450;
  float _2451;
  float _2452;
  float _2453;
  float _2454;
  float _2515;
  float _2517;
  float _2541;
  float _2614;
  float _2617;
  float _2621;
  float _2636;
  float _2637;
  float _2638;
  float _2639;
  if (((_77 < 1.0000000116860974e-07f)) || (_105)) {
    float _108 = select(_105, 0.0f, 1.0f);
    _2636 = _108;
    _2637 = _108;
    _2638 = _108;
    _2639 = _108;
  } else {
    float _112 = max(1.0000000116860974e-07f, _77);
    float _113 = _nearFarProj.x / _112;
    float _149 = mad((_invViewProjRelative[3].z), _112, mad((_invViewProjRelative[3].y), _70, ((_invViewProjRelative[3].x) * _67))) + (_invViewProjRelative[3].w);
    float _150 = (mad((_invViewProjRelative[0].z), _112, mad((_invViewProjRelative[0].y), _70, ((_invViewProjRelative[0].x) * _67))) + (_invViewProjRelative[0].w)) / _149;
    float _151 = (mad((_invViewProjRelative[1].z), _112, mad((_invViewProjRelative[1].y), _70, ((_invViewProjRelative[1].x) * _67))) + (_invViewProjRelative[1].w)) / _149;
    float _152 = (mad((_invViewProjRelative[2].z), _112, mad((_invViewProjRelative[2].y), _70, ((_invViewProjRelative[2].x) * _67))) + (_invViewProjRelative[2].w)) / _149;
    float _154 = rsqrt(dot(float3(_150, _151, _152), float3(_150, _151, _152)));
    _24[0] = 0.0f;
    _25[0] = 0.0f;
    _26[0] = 0.0f;
    _24[1] = 0.0f;
    _25[1] = 0.0f;
    _26[1] = 0.0f;
    bool _168 = ((uint)(_78 + -53) < (uint)15);
    bool _170 = ((_78 == 57)) || (_168);
    float _190 = mad((_terrainShadowProjRelativeTexScale[0].z), _152, mad((_terrainShadowProjRelativeTexScale[0].y), _151, ((_terrainShadowProjRelativeTexScale[0].x) * _150))) + (_terrainShadowProjRelativeTexScale[0].w);
    float _194 = mad((_terrainShadowProjRelativeTexScale[1].z), _152, mad((_terrainShadowProjRelativeTexScale[1].y), _151, ((_terrainShadowProjRelativeTexScale[1].x) * _150))) + (_terrainShadowProjRelativeTexScale[1].w);
    float _198 = mad((_terrainShadowProjRelativeTexScale[2].z), _152, mad((_terrainShadowProjRelativeTexScale[2].y), _151, ((_terrainShadowProjRelativeTexScale[2].x) * _150))) + (_terrainShadowProjRelativeTexScale[2].w);
    if (saturate(_190) == _190) {
      if (((_198 >= 9.999999747378752e-05f)) && ((((_198 <= 1.0f)) && ((saturate(_194) == _194))))) {
        float _209 = float((uint)(uint)(_frameNumber.x));
        float _220 = (frac(((_209 * 92.0f) + _58) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        float _221 = (frac(((_209 * 71.0f) + _59) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        float _226 = frac(dot(float3((_220 * _220), (_221 * _221), (_221 * _220)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        int _262 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) + 1013904242u));
        int _270 = ((int)(((((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        uint _274 = ((uint)(_270 ^ (((uint)(((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)));
        int _286 = ((int)(((((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _294 = ((int)(((((uint)(_286 ^ (((uint)(((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _274) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_286 ^ (((uint)(((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _274) + 2027808484u));
        uint _298 = ((uint)(_294 ^ ((int)(((uint)((uint)(((uint)(_286 ^ (((uint)(((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _274) >> 5)) + 2123724318u)))) + (((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
        uint _306 = ((uint)((((int)((_298 << 4) + (uint)(-1556008596))) ^ ((int)(_298 + 387276957u))) ^ (((uint)(_298) >> 5) + -939442524))) + (((uint)(_286 ^ (((uint)(((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + (((uint)(_262 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _274);
        int _337 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)) >> 5) + -939442524);
        int _350 = ((int)(((((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298))) + (uint)(-239350328)));
        uint _354 = ((uint)(_350 ^ (((uint)(((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298))) >> 5) + -939442524))) + ((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306));
        if (((int)(_354) & 16777215) == 0) {
          int _369 = ((int)(((((uint)((((int)((_354 << 4) + (uint)(-1383041155))) ^ ((int)(_354 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_354) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_354 << 4) + (uint)(-1383041155))) ^ ((int)(_354 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_354) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)))) + (uint)(-1879881855)));
          _375 = ((int)(((uint)(_369 ^ (((uint)(((uint)((((int)((_354 << 4) + (uint)(-1383041155))) ^ ((int)(_354 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_354) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_337) + (((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298) >> 5) + -939442524))) + _306) >> 5)) + 2123724318u)))) + (((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298)))) >> 5) + -939442524))) + _354));
        } else {
          _375 = (int)(_354);
        }
        uint _380 = uint(float((uint)((uint)(((int)(_375 * 48271)) & 16777215))) * 3.814637693722034e-06f);
        float _387 = frac((float((uint)_380) * 0.015625f) + (float((uint)((uint)((int)(uint(_226 * 51540816.0f)) & 65535))) * 1.52587890625e-05f));
        float _393 = (_387 * 2.0f) + -1.0f;
        float _394 = (float((uint)((uint)(reversebits(_380) ^ (int)(uint(_226 * 287478368.0f))))) * 4.656612873077393e-10f) + -1.0f;
        float _396 = rsqrt(dot(float2(_393, _394), float2(_393, _394)));
        float _403 = ((_387 * 0.0009765625f) + -0.00048828125f) * _396;
        float _405 = (_394 * _396) * 0.00048828125f;
        float _407 = (_403 * (_jitterOffset[0].x)) + _190;
        float _408 = (_405 * (_jitterOffset[0].y)) + _194;
        float _413 = frac((_407 * 1024.0f) + -0.5f);
        float4 _417 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_407, _408));
        float _422 = _198 + -0.004999999888241291f;
        float _427 = select((_417.w > _422), 1.0f, 0.0f);
        float _429 = select((_417.x > _422), 1.0f, 0.0f);
        float _436 = ((select((_417.z > _422), 1.0f, 0.0f) - _427) * _413) + _427;
        float _446 = ((_jitterOffset[1].x) * _403) + _190;
        float _447 = ((_jitterOffset[1].y) * _405) + _194;
        float _452 = frac((_446 * 1024.0f) + -0.5f);
        float4 _454 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_446, _447));
        float _463 = select((_454.w > _422), 1.0f, 0.0f);
        float _465 = select((_454.x > _422), 1.0f, 0.0f);
        float _472 = ((select((_454.z > _422), 1.0f, 0.0f) - _463) * _452) + _463;
        float _483 = ((_jitterOffset[2].x) * _403) + _190;
        float _484 = ((_jitterOffset[2].y) * _405) + _194;
        float _489 = frac((_483 * 1024.0f) + -0.5f);
        float4 _491 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_483, _484));
        float _500 = select((_491.w > _422), 1.0f, 0.0f);
        float _502 = select((_491.x > _422), 1.0f, 0.0f);
        float _509 = ((select((_491.z > _422), 1.0f, 0.0f) - _500) * _489) + _500;
        float _520 = ((_jitterOffset[3].x) * _403) + _190;
        float _521 = ((_jitterOffset[3].y) * _405) + _194;
        float _526 = frac((_520 * 1024.0f) + -0.5f);
        float4 _528 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_520, _521));
        float _537 = select((_528.w > _422), 1.0f, 0.0f);
        float _539 = select((_528.x > _422), 1.0f, 0.0f);
        float _546 = ((select((_528.z > _422), 1.0f, 0.0f) - _537) * _526) + _537;
        _554 = ((((saturate((((((select((_454.y > _422), 1.0f, 0.0f) - _465) * _452) + _465) - _472) * frac((_447 * 1024.0f) + -0.5f)) + _472) + saturate((((((select((_417.y > _422), 1.0f, 0.0f) - _429) * _413) + _429) - _436) * frac((_408 * 1024.0f) + -0.5f)) + _436)) + saturate((((((select((_491.y > _422), 1.0f, 0.0f) - _502) * _489) + _502) - _509) * frac((_484 * 1024.0f) + -0.5f)) + _509)) + saturate((((((select((_528.y > _422), 1.0f, 0.0f) - _539) * _526) + _539) - _546) * frac((_521 * 1024.0f) + -0.5f)) + _546)) * 0.25f);
      } else {
        _554 = 1.0f;
      }
    } else {
      _554 = 1.0f;
    }
    float _562 = sqrt(((_151 * _151) + (_150 * _150)) + (_152 * _152));
    float _582 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _152, mad((_dynamicShadowProjRelativeTexScale[1][0].y), _151, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _150))) + (_dynamicShadowProjRelativeTexScale[1][0].w);
    float _586 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _152, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _151, ((_dynamicShadowProjRelativeTexScale[1][1].x) * _150))) + (_dynamicShadowProjRelativeTexScale[1][1].w);
    float _590 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _152, mad((_dynamicShadowProjRelativeTexScale[1][2].y), _151, ((_dynamicShadowProjRelativeTexScale[1][2].x) * _150))) + (_dynamicShadowProjRelativeTexScale[1][2].w);
    float _591 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    float _592 = 1.0f - _591;
    if (!(((((!(_582 <= _592))) || ((!(_582 >= _591))))) || ((!(_586 <= _592))))) {
      if (((_562 < 128.0f)) && ((((_590 >= -1.0f)) && ((((_590 <= 1.0f)) && ((_586 >= _591))))))) {
        float _617 = max(0.0f, ((abs((_582 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _618 = max(0.0f, ((abs((_586 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _24[1] = _582;
        _25[1] = _586;
        _26[1] = _590;
        _628 = select((_terrainNormalParams.y > 0.0f), 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _629 = 1;
        _630 = sqrt((_618 * _618) + (_617 * _617));
      } else {
        _628 = 0.0f;
        _629 = 0;
        _630 = 0.0f;
      }
    } else {
      _628 = 0.0f;
      _629 = 0;
      _630 = 0.0f;
    }
    float _650 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _152, mad((_dynamicShadowProjRelativeTexScale[0][0].y), _151, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _150))) + (_dynamicShadowProjRelativeTexScale[0][0].w);
    float _654 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _152, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _151, ((_dynamicShadowProjRelativeTexScale[0][1].x) * _150))) + (_dynamicShadowProjRelativeTexScale[0][1].w);
    float _658 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _152, mad((_dynamicShadowProjRelativeTexScale[0][2].y), _151, ((_dynamicShadowProjRelativeTexScale[0][2].x) * _150))) + (_dynamicShadowProjRelativeTexScale[0][2].w);
    if (!(((((!(_650 >= _591))) || ((!(_650 <= _592))))) || ((!(_654 <= _592))))) {
      if (((_562 < 128.0f)) && ((((_658 >= -1.0f)) && ((((_654 >= _591)) && ((_658 <= 1.0f))))))) {
        float _683 = max(0.0f, ((abs((_650 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _684 = max(0.0f, ((abs((_654 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _24[0] = _650;
        _25[0] = _654;
        _26[0] = _658;
        _694 = select((_terrainNormalParams.y > 0.0f), 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _695 = 1;
        _696 = 0;
        _697 = sqrt((_684 * _684) + (_683 * _683));
      } else {
        _694 = _628;
        _695 = _629;
        _696 = _629;
        _697 = _630;
      }
    } else {
      _694 = _628;
      _695 = _629;
      _696 = _629;
      _697 = _630;
    }
    bool _698 = (_695 == 0);
    [branch]
    if (_698) {
      float _706 = _viewPos.x + _150;
      float _707 = _viewPos.y + _151;
      float _708 = _viewPos.z + _152;
      float _713 = _706 - (_staticShadowPosition[1].x);
      float _714 = _707 - (_staticShadowPosition[1].y);
      float _715 = _708 - (_staticShadowPosition[1].z);
      float _735 = mad((_shadowProjRelativeTexScale[1][0].z), _715, mad((_shadowProjRelativeTexScale[1][0].y), _714, ((_shadowProjRelativeTexScale[1][0].x) * _713))) + (_shadowProjRelativeTexScale[1][0].w);
      float _739 = mad((_shadowProjRelativeTexScale[1][1].z), _715, mad((_shadowProjRelativeTexScale[1][1].y), _714, ((_shadowProjRelativeTexScale[1][1].x) * _713))) + (_shadowProjRelativeTexScale[1][1].w);
      float _743 = mad((_shadowProjRelativeTexScale[1][2].z), _715, mad((_shadowProjRelativeTexScale[1][2].y), _714, ((_shadowProjRelativeTexScale[1][2].x) * _713))) + (_shadowProjRelativeTexScale[1][2].w);
      float _744 = 2.0f / _shadowSizeAndInvSize.y;
      float _745 = 1.0f - _744;
      if (!(((((!(_735 <= _745))) || ((!(_735 >= _744))))) || ((!(_739 <= _745))))) {
        if (((_743 >= 9.999999747378752e-05f)) && ((((_743 <= 1.0f)) && ((_739 >= _744))))) {
          _24[1] = _735;
          _25[1] = _739;
          _26[1] = _743;
          _759 = 0.00019999999494757503f;
          _760 = 1;
          _761 = 1;
        } else {
          _759 = _694;
          _760 = 0;
          _761 = _696;
        }
      } else {
        _759 = _694;
        _760 = 0;
        _761 = _696;
      }
      float _766 = _706 - (_staticShadowPosition[0].x);
      float _767 = _707 - (_staticShadowPosition[0].y);
      float _768 = _708 - (_staticShadowPosition[0].z);
      float _788 = mad((_shadowProjRelativeTexScale[0][0].z), _768, mad((_shadowProjRelativeTexScale[0][0].y), _767, ((_shadowProjRelativeTexScale[0][0].x) * _766))) + (_shadowProjRelativeTexScale[0][0].w);
      float _792 = mad((_shadowProjRelativeTexScale[0][1].z), _768, mad((_shadowProjRelativeTexScale[0][1].y), _767, ((_shadowProjRelativeTexScale[0][1].x) * _766))) + (_shadowProjRelativeTexScale[0][1].w);
      float _796 = mad((_shadowProjRelativeTexScale[0][2].z), _768, mad((_shadowProjRelativeTexScale[0][2].y), _767, ((_shadowProjRelativeTexScale[0][2].x) * _766))) + (_shadowProjRelativeTexScale[0][2].w);
      if (!(((((!(_788 >= _744))) || ((!(_788 <= _745))))) || ((!(_792 <= _745))))) {
        if (((_796 >= 9.999999747378752e-05f)) && ((((_792 >= _744)) && ((_796 <= 1.0f))))) {
          _24[0] = _788;
          _25[0] = _792;
          _26[0] = _796;
          _810 = 0.00019999999494757503f;
          _811 = 1;
          _812 = 0;
        } else {
          _810 = _759;
          _811 = _760;
          _812 = _761;
        }
      } else {
        _810 = _759;
        _811 = _760;
        _812 = _761;
      }
    } else {
      _810 = _694;
      _811 = 1;
      _812 = _696;
    }
    int _848 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) + 1013904242u));
    int _856 = ((int)(((((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    uint _860 = ((uint)(_856 ^ (((uint)(((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)));
    int _872 = ((int)(((((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _880 = ((int)(((((uint)(_872 ^ (((uint)(((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _860) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_872 ^ (((uint)(((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _860) + 2027808484u));
    uint _884 = ((uint)(_880 ^ ((int)(((uint)((uint)(((uint)(_872 ^ (((uint)(((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _860) >> 5)) + 2123724318u)))) + (((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
    uint _892 = ((uint)((((int)((_884 << 4) + (uint)(-1556008596))) ^ ((int)(_884 + 387276957u))) ^ (((uint)(_884) >> 5) + -939442524))) + (((uint)(_872 ^ (((uint)(((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + (((uint)(_848 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _860);
    int _923 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)) >> 5) + -939442524);
    int _936 = ((int)(((((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884))) + (uint)(-239350328)));
    uint _940 = ((uint)(_936 ^ (((uint)(((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884))) >> 5) + -939442524))) + ((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892));
    bool _950 = (((int)(_940) & 16777215) == 0);
    [branch]
    if (_698) {
      float _1478 = _24[_812];
      float _1479 = _25[_812];
      float _1480 = _26[_812];
      if (_950) {
        int _1485 = ((int)(((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) + (uint)(-1879881855)));
        _1491 = ((int)(((uint)(_1485 ^ (((uint)(((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) >> 5) + -939442524))) + _940));
      } else {
        _1491 = (int)(_940);
      }
      float _1492 = _shadowSizeAndInvSize.z * 2.0f;
      float _1493 = _shadowSizeAndInvSize.w * 2.0f;
      float _1500 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _1502 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _1506 = ((float((uint)((uint)(((int)(_1491 * 48271)) & 16777215))) * _1500) - _1492) + _1478;
      float _1507 = ((float((uint)((uint)(((int)(_1491 * -1964877855)) & 16777215))) * _1502) - _1493) + _1479;
      float _1508 = float((uint)(uint)(_812));
      float4 _1511 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1506, _1507, _1508), 0.0f);
      float _1515 = _1480 - _810;
      float4 _1517 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1506, _1507, _1508), _1515);
      float _1531 = ((float((uint)((uint)(((int)(_1491 * -856141137)) & 16777215))) * _1500) - _1492) + _1478;
      float _1532 = ((float((uint)((uint)(((int)(_1491 * -613502015)) & 16777215))) * _1502) - _1493) + _1479;
      float4 _1533 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1531, _1532, _1508), 0.0f);
      float4 _1537 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1531, _1532, _1508), _1515);
      float _1553 = ((float((uint)((uint)(((int)(_1491 * -556260145)) & 16777215))) * _1500) - _1492) + _1478;
      float _1554 = ((float((uint)((uint)(((int)(_1491 * 902075297)) & 16777215))) * _1502) - _1493) + _1479;
      float4 _1555 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1553, _1554, _1508), 0.0f);
      float4 _1559 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1553, _1554, _1508), _1515);
      float _1575 = ((float((uint)((uint)(((int)(_1491 * 1698214639)) & 16777215))) * _1500) - _1492) + _1478;
      float _1576 = ((float((uint)((uint)(((int)(_1491 * 773027713)) & 16777215))) * _1502) - _1493) + _1479;
      float4 _1577 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1575, _1576, _1508), 0.0f);
      float4 _1581 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1575, _1576, _1508), _1515);
      float _1587 = (((saturate(1.0f - _1537.x) + saturate(1.0f - _1517.x)) + saturate(1.0f - _1559.x)) + saturate(1.0f - _1581.x)) * 0.25f;
      float _1588 = (((max(0.0f, (_1480 - _1533.x)) + max(0.0f, (_1480 - _1511.x))) + max(0.0f, (_1480 - _1555.x))) + max(0.0f, (_1480 - _1577.x))) * 0.25f;
      _1594 = saturate(_1587 * _1587);
      _1595 = saturate(_1588 * _1588);
      _1596 = 1.0h;
      _1597 = 1.0h;
      _1598 = 1.0h;
    } else {
      float _954 = _24[_812];
      float _955 = _25[_812];
      float _956 = _26[_812];
      float _958 = select((_812 == 0), 2.5f, 1.0f);
      if (_950) {
        int _965 = ((int)(((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) + (uint)(-1879881855)));
        _971 = ((int)(((uint)(_965 ^ (((uint)(((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) >> 5) + -939442524))) + _940));
      } else {
        _971 = (int)(_940);
      }
      float _972 = select(_170, (_958 * 0.75f), _958) * 0.6600000262260437f;
      float _973 = _972 * _dynmaicShadowSizeAndInvSize.z;
      float _974 = _972 * _dynmaicShadowSizeAndInvSize.w;
      float _981 = _973 * 1.1920928955078125e-07f;
      float _983 = _974 * 1.1920928955078125e-07f;
      float _987 = ((float((uint)((uint)(((int)(_971 * 48271)) & 16777215))) * _981) - _973) + _954;
      float _988 = ((float((uint)((uint)(((int)(_971 * -1964877855)) & 16777215))) * _983) - _974) + _955;
      float _989 = float((uint)(uint)(_812));
      float4 _992 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_987, _988, _989), 0.0f);
      float _996 = _956 - _810;
      float4 _998 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_987, _988, _989), _996);
      half4 _1003 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_987, _988, _989), 0.0f);
      float _1017 = ((float((uint)((uint)(((int)(_971 * -856141137)) & 16777215))) * _981) - _973) + _954;
      float _1018 = ((float((uint)((uint)(((int)(_971 * -613502015)) & 16777215))) * _983) - _974) + _955;
      float4 _1019 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1017, _1018, _989), 0.0f);
      float4 _1023 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1017, _1018, _989), _996);
      half4 _1027 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1017, _1018, _989), 0.0f);
      float _1043 = ((float((uint)((uint)(((int)(_971 * -556260145)) & 16777215))) * _981) - _973) + _954;
      float _1044 = ((float((uint)((uint)(((int)(_971 * 902075297)) & 16777215))) * _983) - _974) + _955;
      float4 _1045 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1043, _1044, _989), 0.0f);
      float4 _1049 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1043, _1044, _989), _996);
      half4 _1053 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1043, _1044, _989), 0.0f);
      float _1069 = ((float((uint)((uint)(((int)(_971 * 1698214639)) & 16777215))) * _981) - _973) + _954;
      float _1070 = ((float((uint)((uint)(((int)(_971 * 773027713)) & 16777215))) * _983) - _974) + _955;
      float4 _1071 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1069, _1070, _989), 0.0f);
      float4 _1075 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1069, _1070, _989), _996);
      half4 _1079 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1069, _1070, _989), 0.0f);
      float _1095 = ((float((uint)((uint)(((int)(_971 * 144866575)) & 16777215))) * _981) - _973) + _954;
      float _1096 = ((float((uint)((uint)(((int)(_971 * 647683937)) & 16777215))) * _983) - _974) + _955;
      float4 _1097 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1095, _1096, _989), 0.0f);
      float4 _1101 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1095, _1096, _989), _996);
      half4 _1105 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1095, _1096, _989), 0.0f);
      float _1121 = ((float((uint)((uint)(((int)(_971 * 1284375343)) & 16777215))) * _981) - _973) + _954;
      float _1122 = ((float((uint)((uint)(((int)(_971 * 229264193)) & 16777215))) * _983) - _974) + _955;
      float4 _1123 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1121, _1122, _989), 0.0f);
      float4 _1127 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1121, _1122, _989), _996);
      half4 _1131 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1121, _1122, _989), 0.0f);
      float _1147 = ((float((uint)((uint)(((int)(_971 * -1318861489)) & 16777215))) * _981) - _973) + _954;
      float _1148 = ((float((uint)((uint)(((int)(_971 * 1537293089)) & 16777215))) * _983) - _974) + _955;
      float4 _1149 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1147, _1148, _989), 0.0f);
      float4 _1153 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1147, _1148, _989), _996);
      half4 _1157 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1147, _1148, _989), 0.0f);
      float _1173 = ((float((uint)((uint)(((int)(_971 * -1770241169)) & 16777215))) * _981) - _973) + _954;
      float _1174 = ((float((uint)((uint)(((int)(_971 * 1357852417)) & 16777215))) * _983) - _974) + _955;
      float4 _1175 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1173, _1174, _989), 0.0f);
      float4 _1179 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1173, _1174, _989), _996);
      half4 _1183 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1173, _1174, _989), 0.0f);
      float _1199 = ((float((uint)((uint)(((int)(_971 * -601883249)) & 16777215))) * _981) - _973) + _954;
      float _1200 = ((float((uint)((uint)(((int)(_971 * 1947444961)) & 16777215))) * _983) - _974) + _955;
      float4 _1201 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1199, _1200, _989), 0.0f);
      float4 _1205 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1199, _1200, _989), _996);
      half4 _1209 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1199, _1200, _989), 0.0f);
      float _1225 = ((float((uint)((uint)(((int)(_971 * 1166504879)) & 16777215))) * _981) - _973) + _954;
      float _1226 = ((float((uint)((uint)(((int)(_971 * 1335763649)) & 16777215))) * _983) - _974) + _955;
      float4 _1227 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1225, _1226, _989), 0.0f);
      float4 _1231 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1225, _1226, _989), _996);
      half4 _1235 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1225, _1226, _989), 0.0f);
      float _1251 = ((float((uint)((uint)(((int)(_971 * -1696913969)) & 16777215))) * _981) - _973) + _954;
      float _1252 = ((float((uint)((uint)(((int)(_971 * 1882071713)) & 16777215))) * _983) - _974) + _955;
      float4 _1253 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1251, _1252, _989), 0.0f);
      float4 _1257 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1251, _1252, _989), _996);
      half4 _1261 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1251, _1252, _989), 0.0f);
      float _1277 = ((float((uint)((uint)(((int)(_971 * -1959554065)) & 16777215))) * _981) - _973) + _954;
      float _1278 = ((float((uint)((uint)(((int)(_971 * -1569511807)) & 16777215))) * _983) - _974) + _955;
      float4 _1279 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1277, _1278, _989), 0.0f);
      float4 _1283 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1277, _1278, _989), _996);
      half4 _1287 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1277, _1278, _989), 0.0f);
      float _1303 = ((float((uint)((uint)(((int)(_971 * 1318665743)) & 16777215))) * _981) - _973) + _954;
      float _1304 = ((float((uint)((uint)(((int)(_971 * 1898753633)) & 16777215))) * _983) - _974) + _955;
      float4 _1305 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1303, _1304, _989), 0.0f);
      float4 _1309 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1303, _1304, _989), _996);
      half4 _1313 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1303, _1304, _989), 0.0f);
      float _1329 = ((float((uint)((uint)(((int)(_971 * 134521903)) & 16777215))) * _981) - _973) + _954;
      float _1330 = ((float((uint)((uint)(((int)(_971 * -483771839)) & 16777215))) * _983) - _974) + _955;
      float4 _1331 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1329, _1330, _989), 0.0f);
      float4 _1335 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1329, _1330, _989), _996);
      half4 _1339 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1329, _1330, _989), 0.0f);
      float _1355 = ((float((uint)((uint)(((int)(_971 * -413252017)) & 16777215))) * _981) - _973) + _954;
      float _1356 = ((float((uint)((uint)(((int)(_971 * 2034977313)) & 16777215))) * _983) - _974) + _955;
      float4 _1357 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1355, _1356, _989), 0.0f);
      float4 _1361 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1355, _1356, _989), _996);
      half4 _1365 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1355, _1356, _989), 0.0f);
      float _1381 = ((float((uint)((uint)(((int)(_971 * 192849007)) & 16777215))) * _981) - _973) + _954;
      float _1382 = ((float((uint)((uint)(((int)(_971 * 1820286465)) & 16777215))) * _983) - _974) + _955;
      float4 _1383 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1381, _1382, _989), 0.0f);
      float4 _1387 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1381, _1382, _989), _996);
      half4 _1391 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1381, _1382, _989), 0.0f);
      float _1397 = (((((((((((((((saturate(1.0f - _1023.x) + saturate(1.0f - _998.x)) + saturate(1.0f - _1049.x)) + saturate(1.0f - _1075.x)) + saturate(1.0f - _1101.x)) + saturate(1.0f - _1127.x)) + saturate(1.0f - _1153.x)) + saturate(1.0f - _1179.x)) + saturate(1.0f - _1205.x)) + saturate(1.0f - _1231.x)) + saturate(1.0f - _1257.x)) + saturate(1.0f - _1283.x)) + saturate(1.0f - _1309.x)) + saturate(1.0f - _1335.x)) + saturate(1.0f - _1361.x)) + saturate(1.0f - _1387.x)) * 0.0625f;
      float _1398 = (((((((((((((((max(0.0f, (_956 - _1019.x)) + max(0.0f, (_956 - _992.x))) + max(0.0f, (_956 - _1045.x))) + max(0.0f, (_956 - _1071.x))) + max(0.0f, (_956 - _1097.x))) + max(0.0f, (_956 - _1123.x))) + max(0.0f, (_956 - _1149.x))) + max(0.0f, (_956 - _1175.x))) + max(0.0f, (_956 - _1201.x))) + max(0.0f, (_956 - _1227.x))) + max(0.0f, (_956 - _1253.x))) + max(0.0f, (_956 - _1279.x))) + max(0.0f, (_956 - _1305.x))) + max(0.0f, (_956 - _1331.x))) + max(0.0f, (_956 - _1357.x))) + max(0.0f, (_956 - _1383.x))) * 0.0625f;
      half _1453 = half(float(((((((((((((((_1027.x + _1003.x) + _1053.x) + _1079.x) + _1105.x) + _1131.x) + _1157.x) + _1183.x) + _1209.x) + _1235.x) + _1261.x) + _1287.x) + _1313.x) + _1339.x) + _1365.x) + (_1391.x * 2.0h)) * 0.05882352963089943f);
      half _1454 = half(float(((((((((((((((_1027.y + _1003.y) + _1053.y) + _1079.y) + _1105.y) + _1131.y) + _1157.y) + _1183.y) + _1209.y) + _1235.y) + _1261.y) + _1287.y) + _1313.y) + _1339.y) + _1365.y) + (_1391.y * 2.0h)) * 0.05882352963089943f);
      half _1455 = half(float(((((((((((((((_1027.z + _1003.z) + _1053.z) + _1079.z) + _1105.z) + _1131.z) + _1157.z) + _1183.z) + _1209.z) + _1235.z) + _1261.z) + _1287.z) + _1313.z) + _1339.z) + _1365.z) + (_1391.z * 2.0h)) * 0.05882352963089943f);
      if (_812 == 1) {
        float _1458 = float(_1453);
        float _1459 = float(_1454);
        float _1460 = float(_1455);
        float _1461 = -0.0f - _697;
        _1594 = _1397;
        _1595 = _1398;
        _1596 = half((_1458 + _697) + (_1458 * _1461));
        _1597 = half((_1459 + _697) + (_1459 * _1461));
        _1598 = half((_1460 + _697) + (_1460 * _1461));
      } else {
        _1594 = _1397;
        _1595 = _1398;
        _1596 = _1453;
        _1597 = _1454;
        _1598 = _1455;
      }
    }
    bool _1599 = (_811 != 0);
    float _1601 = min(_554, select(_1599, _1594, 1.0f));
    float _1605 = select((_695 != 0), select(_1599, (_1595 * 400.0f), 4e+06f), 1.0f);
    float _1620 = (_1601 - (_shadowAOParams.x * _1601)) + _shadowAOParams.x;
    [branch]
    if (_1620 > 0.0f) {
      int _1630 = _74 & 126;
      bool _1631 = (_1630 == 64);
      bool _1632 = (_78 == 66);
      bool _1633 = (_1631) || (_1632);
      float _1634 = select(_1633, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _1650 = _sunDirection.x;
        _1651 = _sunDirection.y;
        _1652 = _sunDirection.z;
      } else {
        _1650 = _moonDirection.x;
        _1651 = _moonDirection.y;
        _1652 = _moonDirection.z;
      }
      int _1653 = ((int)(((uint)(((((int)((uint)(_44) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)) & 3;
      int _1657 = ((int)(((uint)(((((uint)((uint)(_44)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)) & 3;
      float _1674 = float((uint)(uint)(_frameNumber.x));
      float _1685 = (frac(((_1674 * 92.0f) + _58) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      float _1686 = (frac(((_1674 * 71.0f) + _59) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      float _1691 = frac(dot(float3((_1685 * _1685), (_1686 * _1686), (_1686 * _1685)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      float _1707 = frac((float((uint)((uint)((int)(uint(_1691 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)((uint)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) >> 2) & 858993459))) >> 1) & 21)))) * 0.03125f)) * 6.2831854820251465f;
      float _1711 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * float((uint)((uint)(reversebits((float)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_1657 << 1) | _1657) << 1) & 10) | (((_1653 << 1) | _1653) & 5)))) >> 2) & 858993459))) >> 1) & 21))) ^ (int)(uint(_1691 * 287478368.0f)))))) + _shadowAOParams.z;
      float _1714 = sqrt(1.0f - (_1711 * _1711));
      float _1717 = cos(_1707) * _1714;
      float _1718 = sin(_1707) * _1714;
      float _1720 = select((_1652 >= 0.0f), 1.0f, -1.0f);
      float _1723 = -0.0f - (1.0f / (_1720 + _1652));
      float _1724 = _1651 * _1723;
      float _1725 = _1724 * _1650;
      float _1726 = _1720 * _1650;
      float _1735 = mad(_1711, _1650, mad(_1718, _1725, ((((_1726 * _1650) * _1723) + 1.0f) * _1717)));
      float _1739 = mad(_1711, _1651, mad(_1718, (_1720 + (_1724 * _1651)), ((_1717 * _1720) * _1725)));
      float _1743 = mad(_1711, _1652, mad(_1718, (-0.0f - _1651), (-0.0f - (_1726 * _1717))));
      // Contact Micro Shadows: use the real light direction when quality is enabled.
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _1735 = _1650;
        _1739 = _1651;
        _1743 = _1652;
      }
      int _1744 = select(_1631, 10, 8);
      // Contact Micro Shadows: quality gate controls extra march samples.
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _1744 = (int)(lerp(float(_1744), 16.0f, CONTACT_SHADOW_MARCH_BLEND) + 0.5f);
      }
      if (!_168) {
        _1750 = min(0.5f, ((_113 * 0.0024999999441206455f) + 0.25f));
      } else {
        _1750 = 1.0f;
      }
      float _1756 = ((abs(_1651) * (select(_1633, 12.0f, 2.0f) - _1634)) + _1634) * select(_170, lerp(0.009999999776482582f, 0.05000000074505806f, CONTACT_SHADOW_REACH_BLEND), 0.10000000149011612f);
      if (!_170) {
        _1764 = max((_113 * select(((uint)(_78 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _1756);
      } else {
        _1764 = _1756;
      }
      float _1770 = saturate(((_113 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_101, _102, _103), float3((-0.0f - (_150 * _154)), (-0.0f - (_151 * _154)), (-0.0f - (_152 * _154))))))) + 0.009999999776482582f);
      bool _1777 = (_terrainNormalParams.z > 0.0f);
      if (_1777) {
        float _1781 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _1807 = frac(frac(dot(float2(((_1781 * 32.665000915527344f) + _58), ((_1781 * 11.8149995803833f) + _59)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        if (_950) {
          int _1795 = ((int)(((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) + (uint)(-1879881855)));
          _1801 = ((int)(((uint)(_1795 ^ (((uint)(((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_923) + (((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884) >> 5) + -939442524))) + _892) >> 5)) + 2123724318u)))) + (((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884)))) >> 5) + -939442524))) + _940));
        } else {
          _1801 = (int)(_940);
        }
        _1807 = (float((uint)((uint)(((int)(_1801 * 48271)) & 16777215))) * 5.960464477539063e-08f);
      }
      if ((_1632) || ((((_78 != 15)) && (((uint)(_78 + -12) < (uint)7))))) {
        _1820 = (_1807 * lerp(10.0f, 2.0f, CONTACT_SHADOW_START_BLEND));
      } else {
        if (_78 == 15) {
          _1820 = (_1807 * lerp((10.0f - (saturate(_113 * 0.0010000000474974513f) * 9.0f)), 2.0f, CONTACT_SHADOW_START_BLEND));
        } else {
          _1820 = _1807;
        }
      }
      if (_1630 == 12) {
        _1833 = (0.10000000149011612f - (abs(_1739) * 0.05000000074505806f));
      } else {
        if ((uint)_78 > (uint)15) {
          if ((((uint)_78 < (uint)20)) || ((_78 == 107))) {
            _1833 = (0.10000000149011612f - (abs(_1739) * 0.05000000074505806f));
          } else {
            _1833 = 0.0f;
          }
        } else {
          _1833 = 0.0f;
        }
      }
      if (!_170) {
        float _1835 = _1833 * _154;
        _1843 = (_150 - (_1835 * _150));
        _1844 = (_151 - (_1835 * _151));
        _1845 = (_152 - (_1835 * _152));
      } else {
        _1843 = _150;
        _1844 = _151;
        _1845 = _152;
      }
      if (!_1777) {
        float _1849 = saturate(_113 * 0.0625f) * 0.05000000074505806f;
        _1854 = (_1849 * _101);
        _1855 = (_1849 * _102);
        _1856 = (_1849 * _103);
      } else {
        _1854 = 0.0f;
        _1855 = 0.0f;
        _1856 = 0.0f;
      }
      float _1857 = _1854 + _1843;
      float _1858 = _1855 + _1844;
      float _1859 = _1856 + _1845;
      float _1872 = mad((_viewRelative[2].z), _1859, mad((_viewRelative[2].y), _1858, ((_viewRelative[2].x) * _1857))) + (_viewRelative[2].w);
      float _1875 = mad((_viewRelative[2].z), _1743, mad((_viewRelative[2].y), _1739, ((_viewRelative[2].x) * _1735)));
      bool _1878 = (((_1875 * _1764) + _1872) < _nearFarProj.x);
      if (_113 < 8.0f) {
        float _1882 = select(_1878, ((_nearFarProj.x - _1872) / _1875), _1764);
        float _1914 = mad((_viewProjRelative[2].z), _1859, mad((_viewProjRelative[2].y), _1858, ((_viewProjRelative[2].x) * _1857))) + (_viewProjRelative[2].w);
        float _1918 = mad((_viewProjRelative[3].z), _1859, mad((_viewProjRelative[3].y), _1858, ((_viewProjRelative[3].x) * _1857))) + (_viewProjRelative[3].w);
        float _1922 = (_1882 * _1735) + _1857;
        float _1923 = (_1882 * _1739) + _1858;
        float _1924 = (_1882 * _1743) + _1859;
        float _1940 = mad((_viewProjRelative[3].z), _1924, mad((_viewProjRelative[3].y), _1923, ((_viewProjRelative[3].x) * _1922))) + (_viewProjRelative[3].w);
        float _1941 = (mad((_viewProjRelative[0].z), _1859, mad((_viewProjRelative[0].y), _1858, ((_viewProjRelative[0].x) * _1857))) + (_viewProjRelative[0].w)) / _1918;
        float _1942 = (mad((_viewProjRelative[1].z), _1859, mad((_viewProjRelative[1].y), _1858, ((_viewProjRelative[1].x) * _1857))) + (_viewProjRelative[1].w)) / _1918;
        float _1943 = _1914 / _1918;
        float _1947 = ((mad((_viewProjRelative[0].z), _1924, mad((_viewProjRelative[0].y), _1923, ((_viewProjRelative[0].x) * _1922))) + (_viewProjRelative[0].w)) / _1940) - _1941;
        float _1948 = ((mad((_viewProjRelative[1].z), _1924, mad((_viewProjRelative[1].y), _1923, ((_viewProjRelative[1].x) * _1922))) + (_viewProjRelative[1].w)) / _1940) - _1942;
        float _1951 = 1.0f / float((uint)(uint)(_1744));
        float _1962 = max(_1951, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_1947)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_1948))) * _1951))));
        float _1963 = _1962 * (((mad((_viewProjRelative[2].z), _1924, mad((_viewProjRelative[2].y), _1923, ((_viewProjRelative[2].x) * _1922))) + (_viewProjRelative[2].w)) / _1940) - _1943);
        float _1981 = (max(abs(_1963), (_1943 - ((mad((_proj[2].z), _113, 0.0f) + _1914) / (mad((_proj[3].z), _113, 0.0f) + _1918)))) * _1750) * max(0.0625f, _1951);
        float _1982 = _1962 * _1951;
        float _1984 = (_1947 * 0.5f) * _1982;
        float _1986 = (_1948 * -0.5f) * _1982;
        float _1987 = _1963 * _1951;
        float _1994 = max(_1820, (1.0f / max((abs(_1984) * _bufferSizeAndInvSize.x), (abs(_1986) * _bufferSizeAndInvSize.y))));
        float _2001 = 0.5f / _bufferSizeAndInvSize.x;
        _2003 = 0;
        _2004 = (((_1941 * 0.5f) + 0.5f) + (_1994 * _1984));
        _2005 = ((0.5f - (_1942 * 0.5f)) + (_1994 * _1986));
        _2006 = ((_1994 * _1987) + _1943);
        _2007 = _1820;
        _2008 = _1770;
        _2009 = 0;
        _2010 = 1.0f;
        _2011 = 0.0f;
        while(true) {
          uint _2020 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_2004, _2001), (1.0f - _2001)) * _bufferSizeAndInvSize.x), int(_2005 * _bufferSizeAndInvSize.y), 0));
          int _2022 = (uint)((uint)(_2020.x)) >> 24;
          float _2025 = float((uint)((uint)(_2020.x & 16777215))) * 5.960465188081798e-08f;
          int _2026 = _2022 & 127;
          bool _2027 = (_2009 == 0);
          float _2028 = select(_2027, 1.0f, _2008);
          float _2032 = _nearFarProj.x / max(1.0000000116860974e-07f, _2025);
          float _2033 = _2006 - _2025;
          float _2036 = _2032 - (_nearFarProj.x / max(1.0000000116860974e-07f, _2006));
          bool _2039 = (abs(_2033 + _1981) < _1981);
          int _2040 = (int)(uint)((int)(_2039));
          if (_2039) {
            if (((_2026 == 7)) || ((((_2026 == 54)) || (((((_2022 & 126) == 66)) || (((((uint)(_2026 + -5) < (uint)2)) || ((((_2026 == 107)) || ((((_2026 == 26)) || (((((uint)(_2026 + -27) < (uint)2)) || ((((_2026 == 106)) || (((((_2022 & 125) == 105)) || ((((_2026 == 18)) || (((uint)(_2026 + -19) < (uint)2))))))))))))))))))))) {
              _2074 = true;
              _2081 = ((int)(uint)((int)(((_2036 < 0.0f)) && ((_2036 > select(_2074, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_2026 + -53) < (uint)14) {
                _2074 = (_2032 < 32.0f);
                _2081 = ((int)(uint)((int)(((_2036 < 0.0f)) && ((_2036 > select(_2074, -0.07999999821186066f, -1.0f))))));
              } else {
                _2081 = _2040;
              }
            }
          } else {
            _2081 = _2040;
          }
          if (!(_2081 == 0)) {
            if ((uint)_2026 > (uint)11) {
              if (!((uint)_2026 < (uint)18)) {
                if (!(((_2026 == 18)) || ((((_2026 == 107)) || (((uint)(_2026 + -19) < (uint)2)))))) {
                  if (!(_2026 == 66)) {
                    _2100 = 0.0f;
                  } else {
                    _2100 = 0.10000000149011612f;
                  }
                } else {
                  _2100 = 0.15000000596046448f;
                }
              } else {
                _2100 = 0.10000000149011612f;
              }
            } else {
              if (!(_2026 == 11)) {
                _2100 = 0.0f;
              } else {
                _2100 = 0.10000000149011612f;
              }
            }
            float _2102 = saturate(_2032 * 0.015625f);
            float _2105 = (1.0f - _2102) + (_2102 * _2100);
            if (_170) {
              _2116 = saturate((-0.0f - _2036) / (_2007 * 0.004654859658330679f));
            } else {
              _2116 = 1.0f;
            }
            _2123 = _2026;
            float _rndx_microNearAccum = saturate(1.0f - ((_2105 * _2105) * _2100));
            _2124 = saturate(((_rndx_microNearAccum * lerp(1.0f, 0.7f, CONTACT_SHADOW_BASE_TUNING) * (1.0f - _2011)) * _2116) + _2011);
          } else {
            _2123 = _2003;
            _2124 = _2011;
          }
          [branch]
          if (_2124 > 0.949999988079071f) {
            if (!_2027) {
              _2155 = (saturate(_2010 / (_2010 - _2033)) - min(_2007, _2028));
            } else {
              _2155 = 0.0f;
            }
            _2449 = _2026;
            _2450 = _2124;
            _2451 = ((_2155 * _1984) + _2004);
            _2452 = ((_2155 * _1986) + _2005);
            _2453 = ((_2155 * _1987) + _2006);
            _2454 = _2025;
          } else {
            if ((uint)_2009 < (uint)(_1744 + -1)) {
              _2147 = ((_2028 * _1984) + _2004);
              _2148 = ((_2028 * _1986) + _2005);
              _2149 = ((_2028 * _1987) + _2006);
              _2150 = (_2028 + _2007);
              _2151 = min(abs(_1987), _2033);
            } else {
              _2147 = _2004;
              _2148 = _2005;
              _2149 = _2006;
              _2150 = _2007;
              _2151 = _2010;
            }
            if ((uint)(_2009 + 1) < (uint)_1744) {
              _2003 = _2123;
              _2004 = _2147;
              _2005 = _2148;
              _2006 = _2149;
              _2007 = _2150;
              _2008 = _2028;
              _2009 = (_2009 + 1);
              _2010 = _2151;
              _2011 = _2124;
              continue;
            } else {
              _2449 = _2123;
              _2450 = _2124;
              _2451 = _2004;
              _2452 = _2005;
              _2453 = _2006;
              _2454 = _2025;
            }
          }
          break;
        }
      } else {
        float _2165 = select(_1878, ((_nearFarProj.x - _1872) / _1875), _1764);
        float _2197 = mad((_viewProjRelative[2].z), _1859, mad((_viewProjRelative[2].y), _1858, ((_viewProjRelative[2].x) * _1857))) + (_viewProjRelative[2].w);
        float _2201 = mad((_viewProjRelative[3].z), _1859, mad((_viewProjRelative[3].y), _1858, ((_viewProjRelative[3].x) * _1857))) + (_viewProjRelative[3].w);
        float _2205 = (_2165 * _1735) + _1857;
        float _2206 = (_2165 * _1739) + _1858;
        float _2207 = (_2165 * _1743) + _1859;
        float _2223 = mad((_viewProjRelative[3].z), _2207, mad((_viewProjRelative[3].y), _2206, ((_viewProjRelative[3].x) * _2205))) + (_viewProjRelative[3].w);
        float _2224 = (mad((_viewProjRelative[0].z), _1859, mad((_viewProjRelative[0].y), _1858, ((_viewProjRelative[0].x) * _1857))) + (_viewProjRelative[0].w)) / _2201;
        float _2225 = (mad((_viewProjRelative[1].z), _1859, mad((_viewProjRelative[1].y), _1858, ((_viewProjRelative[1].x) * _1857))) + (_viewProjRelative[1].w)) / _2201;
        float _2226 = _2197 / _2201;
        float _2230 = ((mad((_viewProjRelative[0].z), _2207, mad((_viewProjRelative[0].y), _2206, ((_viewProjRelative[0].x) * _2205))) + (_viewProjRelative[0].w)) / _2223) - _2224;
        float _2231 = ((mad((_viewProjRelative[1].z), _2207, mad((_viewProjRelative[1].y), _2206, ((_viewProjRelative[1].x) * _2205))) + (_viewProjRelative[1].w)) / _2223) - _2225;
        float _2234 = 1.0f / float((uint)(uint)(_1744));
        float _2245 = max(_2234, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_2230)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_2231))) * _2234))));
        float _2246 = _2245 * (((mad((_viewProjRelative[2].z), _2207, mad((_viewProjRelative[2].y), _2206, ((_viewProjRelative[2].x) * _2205))) + (_viewProjRelative[2].w)) / _2223) - _2226);
        float _2265 = ((_1750 * 0.5f) * max(abs(_2246), (_2226 - ((mad((_proj[2].z), _113, 0.0f) + _2197) / (mad((_proj[3].z), _113, 0.0f) + _2201))))) * max(0.0625f, _2234);
        float _2266 = _2245 * _2234;
        float _2268 = (_2230 * 0.5f) * _2266;
        float _2270 = (_2231 * -0.5f) * _2266;
        float _2271 = _2246 * _2234;
        float _2278 = max(_1820, (1.0f / max((abs(_2268) * _bufferSizeAndInvSize.x), (abs(_2270) * _bufferSizeAndInvSize.y))));
        float _2285 = 0.5f / _bufferSizeAndInvSize.x;
        _2287 = 0;
        _2288 = _1770;
        _2289 = _1820;
        _2290 = (((_2224 * 0.5f) + 0.5f) + (_2278 * _2268));
        _2291 = ((0.5f - (_2225 * 0.5f)) + (_2278 * _2270));
        _2292 = ((_2278 * _2271) + _2226);
        _2293 = 0;
        _2294 = 1.0f;
        _2295 = 0.0f;
        while(true) {
          uint _2304 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_2290, _2285), (1.0f - _2285)) * _bufferSizeAndInvSize.x), int(_2291 * _bufferSizeAndInvSize.y), 0));
          int _2306 = (uint)((uint)(_2304.x)) >> 24;
          float _2309 = float((uint)((uint)(_2304.x & 16777215))) * 5.960465188081798e-08f;
          int _2310 = _2306 & 127;
          bool _2311 = (_2287 == 0);
          float _2312 = select(_2311, 1.0f, _2288);
          float _2313 = _2292 - _2309;
          float _2317 = _nearFarProj.x / max(1.0000000116860974e-07f, _2309);
          float _2320 = _2317 - (_nearFarProj.x / max(1.0000000116860974e-07f, _2292));
          bool _2323 = (abs(_2313 + _2265) < _2265);
          int _2324 = (int)(uint)((int)(_2323));
          if (_2323) {
            if (((_2310 == 7)) || ((((_2310 == 54)) || (((((_2306 & 126) == 66)) || (((((uint)(_2310 + -5) < (uint)2)) || ((((_2310 == 107)) || ((((_2310 == 26)) || (((((uint)(_2310 + -27) < (uint)2)) || ((((_2310 == 106)) || (((((_2306 & 125) == 105)) || ((((_2310 == 18)) || (((uint)(_2310 + -19) < (uint)2))))))))))))))))))))) {
              _2358 = true;
              _2365 = ((int)(uint)((int)(((_2320 < 0.0f)) && ((_2320 > select(_2358, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_2310 + -53) < (uint)14) {
                _2358 = (_2317 < 32.0f);
                _2365 = ((int)(uint)((int)(((_2320 < 0.0f)) && ((_2320 > select(_2358, -0.07999999821186066f, -1.0f))))));
              } else {
                _2365 = _2324;
              }
            }
          } else {
            _2365 = _2324;
          }
          if (!(_2365 == 0)) {
            if ((uint)_2310 > (uint)11) {
              if (!((uint)_2310 < (uint)18)) {
                if (!(((_2310 == 18)) || ((((_2310 == 107)) || (((uint)(_2310 + -19) < (uint)2)))))) {
                  if (!(_2310 == 66)) {
                    _2384 = 0.0f;
                  } else {
                    _2384 = 0.10000000149011612f;
                  }
                } else {
                  _2384 = 0.15000000596046448f;
                }
              } else {
                _2384 = 0.10000000149011612f;
              }
            } else {
              if (!(_2310 == 11)) {
                _2384 = 0.0f;
              } else {
                _2384 = 0.10000000149011612f;
              }
            }
            float _2386 = saturate(_2317 * 0.015625f);
            float _2389 = (1.0f - _2386) + (_2386 * _2384);
            if (_170) {
              _2400 = saturate((-0.0f - _2320) / (_2289 * 0.004654859658330679f));
            } else {
              _2400 = 1.0f;
            }
            _2407 = _2310;
            float _rndx_microFarAccum = saturate(1.0f - ((_2389 * _2389) * _2384));
            _2408 = saturate(((_rndx_microFarAccum * lerp(1.0f, 0.7f, CONTACT_SHADOW_BASE_TUNING) * (1.0f - _2295)) * _2400) + _2295);
          } else {
            _2407 = _2293;
            _2408 = _2295;
          }
          [branch]
          if (_2408 > 0.949999988079071f) {
            if (!_2311) {
              _2439 = (saturate(_2294 / (_2294 - _2313)) - min(_2289, _2312));
            } else {
              _2439 = 0.0f;
            }
            _2449 = _2310;
            _2450 = _2408;
            _2451 = ((_2439 * _2268) + _2290);
            _2452 = ((_2439 * _2270) + _2291);
            _2453 = ((_2439 * _2271) + _2292);
            _2454 = _2309;
          } else {
            if ((uint)_2287 < (uint)(_1744 + -1)) {
              _2431 = (_2289 + _2312);
              _2432 = (_2290 + (_2312 * _2268));
              _2433 = (_2291 + (_2312 * _2270));
              _2434 = (_2292 + (_2312 * _2271));
              _2435 = min(abs(_2271), _2313);
            } else {
              _2431 = _2289;
              _2432 = _2290;
              _2433 = _2291;
              _2434 = _2292;
              _2435 = _2294;
            }
            if ((uint)(_2287 + 1) < (uint)_1744) {
              _2287 = (_2287 + 1);
              _2288 = _2312;
              _2289 = _2431;
              _2290 = _2432;
              _2291 = _2433;
              _2292 = _2434;
              _2293 = _2407;
              _2294 = _2435;
              _2295 = _2408;
              continue;
            } else {
              _2449 = _2407;
              _2450 = _2408;
              _2451 = 0.0f;
              _2452 = 0.0f;
              _2453 = -1.0f;
              _2454 = 0.0f;
            }
          }
          break;
        }
      }
      bool _2458 = (_2450 > 0.0f);
      if (_2453 > 0.0f) {
        if ((_2458) || ((((((_2451 >= 0.0f)) && ((_2451 <= 1.0f)))) && ((((_2452 >= 0.0f)) && ((_2452 <= 1.0f))))))) {
          float _2472 = (_2451 * 2.0f) + -1.0f;
          float _2473 = 1.0f - (_2452 * 2.0f);
          float _2489 = mad((_invViewProjRelative[3].z), _2453, mad((_invViewProjRelative[3].y), _2473, (_2472 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_2449 == 2)) {
            if (_2449 == 3) {
              _2515 = 0.0f;
              _2517 = _2515;
            } else {
              if (_2449 == 21) {
                if (!(_78 == 21)) {
                  _2515 = 0.0f;
                  _2517 = _2515;
                } else {
                  _2517 = 20.0f;
                }
              } else {
                bool _2508 = (_2449 == 22);
                if (!(((_78 == 22)) && (_2508))) {
                  _2515 = select(_2508, 0.0f, 1.0f);
                  _2517 = _2515;
                } else {
                  _2517 = 20.0f;
                }
              }
            }
          } else {
            if (!(_78 == 2)) {
              _2515 = 0.0f;
              _2517 = _2515;
            } else {
              _2517 = 20.0f;
            }
          }
          if (!((_168) || ((!(_2450 == 1.0f))))) {
            _2541 = saturate(((((_1764 * 0.9375f) - max(0.0f, dot(float3(_1735, _1739, _1743), float3((((mad((_invViewProjRelative[0].z), _2453, mad((_invViewProjRelative[0].y), _2473, (_2472 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _2489) - _1857), (((mad((_invViewProjRelative[1].z), _2453, mad((_invViewProjRelative[1].y), _2473, (_2472 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _2489) - _1858), (((mad((_invViewProjRelative[2].z), _2453, mad((_invViewProjRelative[2].y), _2473, (_2472 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _2489) - _1859))))) * ((_113 * 0.015625f) + 1.5f)) / _1764) * 0.9375f);
          } else {
            _2541 = _2450;
          }
          float _2542 = _2541 * saturate(exp2(min(0.0f, (((_113 * 0.01899999938905239f) + 0.10000000149011612f) + (_2517 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2454)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2453)))))) * 1.4426950216293335f));
          int _2543 = _2449 & -2;
          if (!(_2543 == 6)) {
            bool __defer_2545_2555 = false;
            if ((((_78 == 33) && (_2449 == 33)) || (!(_78 == 33) && (((_78 == 55)) && ((_2449 == 55)))))) {
              _2617 = (_2542 * 0.009999999776482582f);
            } else {
              __defer_2545_2555 = true;
            }
            if (__defer_2545_2555) {
              if (!(((_2449 == 54)) || ((_2543 == 66))) || ((((_2449 == 54)) || ((_2543 == 66))) && (!(((_1630 == 66)) || ((_78 == 54)))))) {
                if (!_170) {
                  if ((uint)((int)((uint)(_2449) + (uint)(-53))) < (uint)15) {
                    _2614 = saturate(_113 * 0.03125f);
                  } else {
                    _2614 = 1.0f;
                  }
                  _2617 = (_2614 * _2542);
                } else {
                  _2617 = _2542;
                }
              } else {
                uint4 _2569 = __3__36__0__0__g_baseColor.Load(int3(int(_2451 * _bufferSizeAndInvSize.x), int(_2452 * _bufferSizeAndInvSize.y), 0));
                float _2575 = float((uint)((uint)(((uint)((uint)(_2569.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _2578 = float((uint)((uint)(_2569.x & 255))) * 0.003921568859368563f;
                float _2582 = float((uint)((uint)(((uint)((uint)(_2569.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _2583 = _2575 * _2575;
                float _2584 = _2578 * _2578;
                float _2585 = _2582 * _2582;
                _2617 = (saturate(1.0f - (dot(float3((((_2583 * 0.6131200194358826f) + (_2584 * 0.3395099937915802f)) + (_2585 * 0.047370001673698425f)), (((_2583 * 0.07020000368356705f) + (_2584 * 0.9163600206375122f)) + (_2585 * 0.013450000435113907f)), (((_2583 * 0.02061999961733818f) + (_2584 * 0.10958000272512436f)) + (_2585 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _2542);
              }
            }
          } else {
            _2617 = (_2542 * 0.009999999776482582f);
          }
        } else {
          _2617 = 0.0f;
        }
      } else {
        if (_2458) {
          float _2472 = (_2451 * 2.0f) + -1.0f;
          float _2473 = 1.0f - (_2452 * 2.0f);
          float _2489 = mad((_invViewProjRelative[3].z), _2453, mad((_invViewProjRelative[3].y), _2473, (_2472 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_2449 == 2)) {
            if (_2449 == 3) {
              _2515 = 0.0f;
              _2517 = _2515;
            } else {
              if (_2449 == 21) {
                if (!(_78 == 21)) {
                  _2515 = 0.0f;
                  _2517 = _2515;
                } else {
                  _2517 = 20.0f;
                }
              } else {
                bool _2508 = (_2449 == 22);
                if (!(((_78 == 22)) && (_2508))) {
                  _2515 = select(_2508, 0.0f, 1.0f);
                  _2517 = _2515;
                } else {
                  _2517 = 20.0f;
                }
              }
            }
          } else {
            if (!(_78 == 2)) {
              _2515 = 0.0f;
              _2517 = _2515;
            } else {
              _2517 = 20.0f;
            }
          }
          if (!((_168) || ((!(_2450 == 1.0f))))) {
            _2541 = saturate(((((_1764 * 0.9375f) - max(0.0f, dot(float3(_1735, _1739, _1743), float3((((mad((_invViewProjRelative[0].z), _2453, mad((_invViewProjRelative[0].y), _2473, (_2472 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _2489) - _1857), (((mad((_invViewProjRelative[1].z), _2453, mad((_invViewProjRelative[1].y), _2473, (_2472 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _2489) - _1858), (((mad((_invViewProjRelative[2].z), _2453, mad((_invViewProjRelative[2].y), _2473, (_2472 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _2489) - _1859))))) * ((_113 * 0.015625f) + 1.5f)) / _1764) * 0.9375f);
          } else {
            _2541 = _2450;
          }
          float _2542 = _2541 * saturate(exp2(min(0.0f, (((_113 * 0.01899999938905239f) + 0.10000000149011612f) + (_2517 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2454)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2453)))))) * 1.4426950216293335f));
          int _2543 = _2449 & -2;
          if (!(_2543 == 6)) {
            bool __defer_2545_2555 = false;
            if ((((_78 == 33) && (_2449 == 33)) || (!(_78 == 33) && (((_78 == 55)) && ((_2449 == 55)))))) {
              _2617 = (_2542 * 0.009999999776482582f);
            } else {
              __defer_2545_2555 = true;
            }
            if (__defer_2545_2555) {
              if (!(((_2449 == 54)) || ((_2543 == 66))) || ((((_2449 == 54)) || ((_2543 == 66))) && (!(((_1630 == 66)) || ((_78 == 54)))))) {
                if (!_170) {
                  if ((uint)((int)((uint)(_2449) + (uint)(-53))) < (uint)15) {
                    _2614 = saturate(_113 * 0.03125f);
                  } else {
                    _2614 = 1.0f;
                  }
                  _2617 = (_2614 * _2542);
                } else {
                  _2617 = _2542;
                }
              } else {
                uint4 _2569 = __3__36__0__0__g_baseColor.Load(int3(int(_2451 * _bufferSizeAndInvSize.x), int(_2452 * _bufferSizeAndInvSize.y), 0));
                float _2575 = float((uint)((uint)(((uint)((uint)(_2569.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _2578 = float((uint)((uint)(_2569.x & 255))) * 0.003921568859368563f;
                float _2582 = float((uint)((uint)(((uint)((uint)(_2569.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _2583 = _2575 * _2575;
                float _2584 = _2578 * _2578;
                float _2585 = _2582 * _2582;
                _2617 = (saturate(1.0f - (dot(float3((((_2583 * 0.6131200194358826f) + (_2584 * 0.3395099937915802f)) + (_2585 * 0.047370001673698425f)), (((_2583 * 0.07020000368356705f) + (_2584 * 0.9163600206375122f)) + (_2585 * 0.013450000435113907f)), (((_2583 * 0.02061999961733818f) + (_2584 * 0.10958000272512436f)) + (_2585 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _2542);
              }
            }
          } else {
            _2617 = (_2542 * 0.009999999776482582f);
          }
        } else {
          _2617 = 0.0f;
        }
      }
      _2621 = saturate(1.0f - _2617);
    } else {
      _2621 = 1.0f;
    }

    // Contact Micro Shadows: screen-space helper fills missing fine occluders.
    _2621 = ApplyContactMicroDetailShadow(
        _2621,
        float2(_58, _59),
        _113,
        _78,
        float3(_1650, _1651, _1652),
        float3(_1854 + _1843, _1855 + _1844, _1856 + _1845),
        CONTACT_MICRO_DETAIL_STRENGTH,
        (CONTACT_SHADOW_IS_FULL ? -0.022f : -0.025f),
        (CONTACT_SHADOW_IS_FULL ? 3.10f : 3.0f),
        CONTACT_MICRO_RANGE_NEAR,
        CONTACT_MICRO_RANGE_FAR,
        CONTACT_MICRO_THICKNESS_MULTIPLIER,
        CONTACT_MICRO_OCCLUSION_SCALE,
        CONTACT_MICRO_SELF_REJECT_PIXELS,
        2.0f,
        1.0f,
        1.0f);

    // Contact Micro Shadows: fade helper near screen edges to avoid edge brightening.
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _2621 < 1.0f) {
      float2 _screenUV = float2((_58 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_59 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _2621 = lerp(lerp(1.0f, _2621, 0.5f), _2621, _edgeFade);
    }

    float _2622 = min(_1620, _2621);
    _2636 = float(half(_2622 * float(_1596)));
    _2637 = float(half(_2622 * float(_1597)));
    _2638 = float(half(_2622 * float(_1598)));
    _2639 = saturate((1.0f - _554) + (exp2(log2(saturate(select(_170, (_1605 + 0.9800000190734863f), _1605))) * 0.45454543828964233f) * _554));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)(((((int)((uint)(_44) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_44)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)))] = half4(half(_2636), half(_2637), half(_2638), half(_2639));
}
