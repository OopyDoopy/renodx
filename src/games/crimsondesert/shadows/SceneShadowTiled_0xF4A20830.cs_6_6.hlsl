#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t35, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<uint2> __3__36__0__0__g_dynamicShadowStencilArray : register(t231, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<float2> __3__36__0__0__g_raytracedShadow : register(t117, space36);

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

static const int RAYTRACED_SHADOW_JITTER[16] = { 1, -3, -1, 3, 5, 1, -3, -5, -5, 5, -7, -1, 3, 7, 7, -7 };

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _18[4];
  float _26[2];
  float _27[2];
  float _28[2];
  _18[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _18[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _18[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _18[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _42 = _18[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _46 = select((((int)(SV_GroupID.x) & 16) == 0), _42, ((uint)((uint)(_42)) >> 16));
  float _60 = float((uint)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x));
  float _61 = float((uint)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y));
  float _67 = (_60 + 0.5f) * _bufferSizeAndInvSize.z;
  float _68 = (_61 + 0.5f) * _bufferSizeAndInvSize.w;
  float _70 = (_67 * 2.0f) + -1.0f;
  float _72 = 1.0f - (_68 * 2.0f);
  uint _74 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  int _76 = (uint)((uint)(_74.x)) >> 24;
  float _79 = float((uint)((uint)(_74.x & 16777215))) * 5.960465188081798e-08f;
  int _80 = _76 & 127;
  uint _82 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  float _98 = min(1.0f, ((float((uint)((uint)(_82.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _99 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_82.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _100 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_82.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _102 = rsqrt(dot(float3(_98, _99, _100), float3(_98, _99, _100)));
  float _103 = _102 * _98;
  float _104 = _102 * _99;
  float _105 = _102 * _100;
  bool _107 = (_79 == 1.0f);
  int _377;
  float _556;
  float _630;
  int _631;
  float _632;
  float _696;
  int _697;
  int _698;
  float _699;
  float _761;
  int _762;
  int _763;
  float _812;
  int _813;
  int _814;
  int _974;
  float _1082;
  float _1083;
  bool _1084;
  half _1085;
  half _1086;
  half _1087;
  float _1192;
  float _1193;
  bool _1194;
  half _1195;
  half _1196;
  half _1197;
  half _1206;
  half _1207;
  half _1208;
  float _1209;
  float _1210;
  float _1211;
  float _1310;
  float _1311;
  bool _1312;
  half _1313;
  half _1314;
  half _1315;
  half _1324;
  half _1325;
  half _1326;
  float _1327;
  float _1328;
  float _1329;
  float _1428;
  float _1429;
  bool _1430;
  half _1431;
  half _1432;
  half _1433;
  half _1442;
  half _1443;
  half _1444;
  float _1445;
  float _1446;
  float _1447;
  float _1546;
  float _1547;
  bool _1548;
  half _1549;
  half _1550;
  half _1551;
  half _1560;
  half _1561;
  half _1562;
  float _1563;
  float _1564;
  float _1565;
  float _1664;
  float _1665;
  bool _1666;
  half _1667;
  half _1668;
  half _1669;
  half _1678;
  half _1679;
  half _1680;
  float _1681;
  float _1682;
  float _1683;
  float _1782;
  float _1783;
  bool _1784;
  half _1785;
  half _1786;
  half _1787;
  half _1796;
  half _1797;
  half _1798;
  float _1799;
  float _1800;
  float _1801;
  float _1900;
  float _1901;
  bool _1902;
  half _1903;
  half _1904;
  half _1905;
  half _1914;
  half _1915;
  half _1916;
  float _1917;
  float _1918;
  float _1919;
  float _2018;
  float _2019;
  bool _2020;
  half _2021;
  half _2022;
  half _2023;
  half _2032;
  half _2033;
  half _2034;
  float _2035;
  float _2036;
  float _2037;
  float _2136;
  float _2137;
  bool _2138;
  half _2139;
  half _2140;
  half _2141;
  half _2150;
  half _2151;
  half _2152;
  float _2153;
  float _2154;
  float _2155;
  float _2254;
  float _2255;
  bool _2256;
  half _2257;
  half _2258;
  half _2259;
  half _2268;
  half _2269;
  half _2270;
  float _2271;
  float _2272;
  float _2273;
  float _2372;
  float _2373;
  bool _2374;
  half _2375;
  half _2376;
  half _2377;
  half _2386;
  half _2387;
  half _2388;
  float _2389;
  float _2390;
  float _2391;
  float _2490;
  float _2491;
  bool _2492;
  half _2493;
  half _2494;
  half _2495;
  half _2504;
  half _2505;
  half _2506;
  float _2507;
  float _2508;
  float _2509;
  float _2608;
  float _2609;
  bool _2610;
  half _2611;
  half _2612;
  half _2613;
  half _2622;
  half _2623;
  half _2624;
  float _2625;
  float _2626;
  float _2627;
  float _2726;
  float _2727;
  bool _2728;
  half _2729;
  half _2730;
  half _2731;
  half _2740;
  half _2741;
  half _2742;
  float _2743;
  float _2744;
  float _2745;
  float _2844;
  float _2845;
  bool _2846;
  half _2847;
  half _2848;
  half _2849;
  half _2858;
  half _2859;
  half _2860;
  float _2861;
  float _2862;
  float _2863;
  half _2901;
  half _2902;
  half _2903;
  float _2923;
  float _2924;
  int _2925;
  float _3026;
  int _3049;
  float _3152;
  float _3153;
  half _3154;
  half _3155;
  half _3156;
  float _3208;
  float _3209;
  float _3210;
  float _3310;
  float _3324;
  int _3496;
  float _3502;
  float _3515;
  float _3528;
  float _3538;
  float _3539;
  float _3540;
  float _3549;
  float _3550;
  float _3551;
  int _3700;
  float _3701;
  float _3702;
  float _3703;
  float _3704;
  float _3705;
  int _3706;
  float _3707;
  float _3708;
  bool _3771;
  int _3778;
  float _3797;
  int _3812;
  float _3813;
  float _3836;
  float _3837;
  float _3838;
  float _3839;
  float _3840;
  float _3844;
  int _3976;
  float _3977;
  float _3978;
  float _3979;
  float _3980;
  float _3981;
  int _3982;
  float _3983;
  float _3984;
  bool _4047;
  int _4054;
  float _4073;
  int _4088;
  float _4089;
  float _4112;
  float _4113;
  float _4114;
  float _4115;
  float _4116;
  float _4120;
  int _4130;
  float _4131;
  float _4132;
  float _4133;
  float _4134;
  float _4135;
  float _4216;
  float _4218;
  float _4242;
  float _4318;
  float _4321;
  float _4325;
  float _4340;
  float _4341;
  float _4342;
  float _4343;
  if (((_79 < 1.0000000116860974e-07f)) || (_107)) {
    float _110 = select(_107, 0.0f, 1.0f);
    _4340 = _110;
    _4341 = _110;
    _4342 = _110;
    _4343 = _110;
  } else {
    float _114 = max(1.0000000116860974e-07f, _79);
    float _115 = _nearFarProj.x / _114;
    float _151 = mad((_invViewProjRelative[3].z), _114, mad((_invViewProjRelative[3].y), _72, ((_invViewProjRelative[3].x) * _70))) + (_invViewProjRelative[3].w);
    float _152 = (mad((_invViewProjRelative[0].z), _114, mad((_invViewProjRelative[0].y), _72, ((_invViewProjRelative[0].x) * _70))) + (_invViewProjRelative[0].w)) / _151;
    float _153 = (mad((_invViewProjRelative[1].z), _114, mad((_invViewProjRelative[1].y), _72, ((_invViewProjRelative[1].x) * _70))) + (_invViewProjRelative[1].w)) / _151;
    float _154 = (mad((_invViewProjRelative[2].z), _114, mad((_invViewProjRelative[2].y), _72, ((_invViewProjRelative[2].x) * _70))) + (_invViewProjRelative[2].w)) / _151;
    float _156 = rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
    _26[0] = 0.0f;
    _27[0] = 0.0f;
    _28[0] = 0.0f;
    _26[1] = 0.0f;
    _27[1] = 0.0f;
    _28[1] = 0.0f;
    bool _170 = ((uint)(_80 + -53) < (uint)15);
    bool _172 = ((_80 == 57)) || (_170);
    float _192 = mad((_terrainShadowProjRelativeTexScale[0].z), _154, mad((_terrainShadowProjRelativeTexScale[0].y), _153, ((_terrainShadowProjRelativeTexScale[0].x) * _152))) + (_terrainShadowProjRelativeTexScale[0].w);
    float _196 = mad((_terrainShadowProjRelativeTexScale[1].z), _154, mad((_terrainShadowProjRelativeTexScale[1].y), _153, ((_terrainShadowProjRelativeTexScale[1].x) * _152))) + (_terrainShadowProjRelativeTexScale[1].w);
    float _200 = mad((_terrainShadowProjRelativeTexScale[2].z), _154, mad((_terrainShadowProjRelativeTexScale[2].y), _153, ((_terrainShadowProjRelativeTexScale[2].x) * _152))) + (_terrainShadowProjRelativeTexScale[2].w);
    if (saturate(_192) == _192) {
      if (((_200 >= 9.999999747378752e-05f)) && ((((_200 <= 1.0f)) && ((saturate(_196) == _196))))) {
        float _211 = float((uint)(uint)(_frameNumber.x));
        float _222 = (frac(((_211 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        float _223 = (frac(((_211 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        float _228 = frac(dot(float3((_222 * _222), (_223 * _223), (_223 * _222)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        int _264 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) + 1013904242u));
        int _272 = ((int)(((((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        uint _276 = ((uint)(_272 ^ (((uint)(((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)));
        int _288 = ((int)(((((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _296 = ((int)(((((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) + 2027808484u));
        uint _300 = ((uint)(_296 ^ ((int)(((uint)((uint)(((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) >> 5)) + 2123724318u)))) + (((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
        uint _308 = ((uint)((((int)((_300 << 4) + (uint)(-1556008596))) ^ ((int)(_300 + 387276957u))) ^ (((uint)(_300) >> 5) + -939442524))) + (((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276);
        int _339 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) >> 5) + -939442524);
        int _352 = ((int)(((((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) + (uint)(-239350328)));
        uint _356 = ((uint)(_352 ^ (((uint)(((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) >> 5) + -939442524))) + ((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308));
        if (((int)(_356) & 16777215) == 0) {
          int _371 = ((int)(((((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) + (uint)(-1879881855)));
          _377 = ((int)(((uint)(_371 ^ (((uint)(((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) >> 5) + -939442524))) + _356));
        } else {
          _377 = (int)(_356);
        }
        uint _382 = uint(float((uint)((uint)(((int)(_377 * 48271)) & 16777215))) * 3.814637693722034e-06f);
        float _389 = frac((float((uint)_382) * 0.015625f) + (float((uint)((uint)((int)(uint(_228 * 51540816.0f)) & 65535))) * 1.52587890625e-05f));
        float _395 = (_389 * 2.0f) + -1.0f;
        float _396 = (float((uint)((uint)(reversebits(_382) ^ (int)(uint(_228 * 287478368.0f))))) * 4.656612873077393e-10f) + -1.0f;
        float _398 = rsqrt(dot(float2(_395, _396), float2(_395, _396)));
        float _405 = ((_389 * 0.0009765625f) + -0.00048828125f) * _398;
        float _407 = (_396 * _398) * 0.00048828125f;
        float _409 = (_405 * (_jitterOffset[0].x)) + _192;
        float _410 = (_407 * (_jitterOffset[0].y)) + _196;
        float _415 = frac((_409 * 1024.0f) + -0.5f);
        float4 _419 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_409, _410));
        float _424 = _200 + -0.004999999888241291f;
        float _429 = select((_419.w > _424), 1.0f, 0.0f);
        float _431 = select((_419.x > _424), 1.0f, 0.0f);
        float _438 = ((select((_419.z > _424), 1.0f, 0.0f) - _429) * _415) + _429;
        float _448 = ((_jitterOffset[1].x) * _405) + _192;
        float _449 = ((_jitterOffset[1].y) * _407) + _196;
        float _454 = frac((_448 * 1024.0f) + -0.5f);
        float4 _456 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_448, _449));
        float _465 = select((_456.w > _424), 1.0f, 0.0f);
        float _467 = select((_456.x > _424), 1.0f, 0.0f);
        float _474 = ((select((_456.z > _424), 1.0f, 0.0f) - _465) * _454) + _465;
        float _485 = ((_jitterOffset[2].x) * _405) + _192;
        float _486 = ((_jitterOffset[2].y) * _407) + _196;
        float _491 = frac((_485 * 1024.0f) + -0.5f);
        float4 _493 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_485, _486));
        float _502 = select((_493.w > _424), 1.0f, 0.0f);
        float _504 = select((_493.x > _424), 1.0f, 0.0f);
        float _511 = ((select((_493.z > _424), 1.0f, 0.0f) - _502) * _491) + _502;
        float _522 = ((_jitterOffset[3].x) * _405) + _192;
        float _523 = ((_jitterOffset[3].y) * _407) + _196;
        float _528 = frac((_522 * 1024.0f) + -0.5f);
        float4 _530 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_522, _523));
        float _539 = select((_530.w > _424), 1.0f, 0.0f);
        float _541 = select((_530.x > _424), 1.0f, 0.0f);
        float _548 = ((select((_530.z > _424), 1.0f, 0.0f) - _539) * _528) + _539;
        _556 = ((((saturate((((((select((_456.y > _424), 1.0f, 0.0f) - _467) * _454) + _467) - _474) * frac((_449 * 1024.0f) + -0.5f)) + _474) + saturate((((((select((_419.y > _424), 1.0f, 0.0f) - _431) * _415) + _431) - _438) * frac((_410 * 1024.0f) + -0.5f)) + _438)) + saturate((((((select((_493.y > _424), 1.0f, 0.0f) - _504) * _491) + _504) - _511) * frac((_486 * 1024.0f) + -0.5f)) + _511)) + saturate((((((select((_530.y > _424), 1.0f, 0.0f) - _541) * _528) + _541) - _548) * frac((_523 * 1024.0f) + -0.5f)) + _548)) * 0.25f);
      } else {
        _556 = 1.0f;
      }
    } else {
      _556 = 1.0f;
    }
    float _564 = sqrt(((_153 * _153) + (_152 * _152)) + (_154 * _154));
    float _584 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][0].y), _153, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][0].w);
    float _588 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _153, ((_dynamicShadowProjRelativeTexScale[1][1].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][1].w);
    float _592 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][2].y), _153, ((_dynamicShadowProjRelativeTexScale[1][2].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][2].w);
    float _593 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    float _594 = 1.0f - _593;
    if (!(((((!(_584 <= _594))) || ((!(_584 >= _593))))) || ((!(_588 <= _594))))) {
      if (((_564 < 128.0f)) && ((((_592 >= -1.0f)) && ((((_592 <= 1.0f)) && ((_588 >= _593))))))) {
        float _619 = max(0.0f, ((abs((_584 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _620 = max(0.0f, ((abs((_588 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _26[1] = _584;
        _27[1] = _588;
        _28[1] = _592;
        _630 = select((_terrainNormalParams.y > 0.0f), 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _631 = 1;
        _632 = sqrt((_620 * _620) + (_619 * _619));
      } else {
        _630 = 0.0f;
        _631 = 0;
        _632 = 0.0f;
      }
    } else {
      _630 = 0.0f;
      _631 = 0;
      _632 = 0.0f;
    }
    float _652 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][0].y), _153, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][0].w);
    float _656 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _153, ((_dynamicShadowProjRelativeTexScale[0][1].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][1].w);
    float _660 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][2].y), _153, ((_dynamicShadowProjRelativeTexScale[0][2].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][2].w);
    if (!(((((!(_652 >= _593))) || ((!(_652 <= _594))))) || ((!(_656 <= _594))))) {
      if (((_564 < 128.0f)) && ((((_660 >= -1.0f)) && ((((_656 >= _593)) && ((_660 <= 1.0f))))))) {
        float _685 = max(0.0f, ((abs((_652 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _686 = max(0.0f, ((abs((_656 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _26[0] = _652;
        _27[0] = _656;
        _28[0] = _660;
        _696 = select((_terrainNormalParams.y > 0.0f), 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _697 = 1;
        _698 = 0;
        _699 = sqrt((_686 * _686) + (_685 * _685));
      } else {
        _696 = _630;
        _697 = _631;
        _698 = _631;
        _699 = _632;
      }
    } else {
      _696 = _630;
      _697 = _631;
      _698 = _631;
      _699 = _632;
    }
    bool _700 = (_697 == 0);
    [branch]
    if (_700) {
      float _708 = _viewPos.x + _152;
      float _709 = _viewPos.y + _153;
      float _710 = _viewPos.z + _154;
      float _715 = _708 - (_staticShadowPosition[1].x);
      float _716 = _709 - (_staticShadowPosition[1].y);
      float _717 = _710 - (_staticShadowPosition[1].z);
      float _737 = mad((_shadowProjRelativeTexScale[1][0].z), _717, mad((_shadowProjRelativeTexScale[1][0].y), _716, ((_shadowProjRelativeTexScale[1][0].x) * _715))) + (_shadowProjRelativeTexScale[1][0].w);
      float _741 = mad((_shadowProjRelativeTexScale[1][1].z), _717, mad((_shadowProjRelativeTexScale[1][1].y), _716, ((_shadowProjRelativeTexScale[1][1].x) * _715))) + (_shadowProjRelativeTexScale[1][1].w);
      float _745 = mad((_shadowProjRelativeTexScale[1][2].z), _717, mad((_shadowProjRelativeTexScale[1][2].y), _716, ((_shadowProjRelativeTexScale[1][2].x) * _715))) + (_shadowProjRelativeTexScale[1][2].w);
      float _746 = 2.0f / _shadowSizeAndInvSize.y;
      float _747 = 1.0f - _746;
      if (!(((((!(_737 <= _747))) || ((!(_737 >= _746))))) || ((!(_741 <= _747))))) {
        if (((_745 >= 9.999999747378752e-05f)) && ((((_745 <= 1.0f)) && ((_741 >= _746))))) {
          _26[1] = _737;
          _27[1] = _741;
          _28[1] = _745;
          _761 = 0.00019999999494757503f;
          _762 = 1;
          _763 = 1;
        } else {
          _761 = _696;
          _762 = 0;
          _763 = _698;
        }
      } else {
        _761 = _696;
        _762 = 0;
        _763 = _698;
      }
      float _768 = _708 - (_staticShadowPosition[0].x);
      float _769 = _709 - (_staticShadowPosition[0].y);
      float _770 = _710 - (_staticShadowPosition[0].z);
      float _790 = mad((_shadowProjRelativeTexScale[0][0].z), _770, mad((_shadowProjRelativeTexScale[0][0].y), _769, ((_shadowProjRelativeTexScale[0][0].x) * _768))) + (_shadowProjRelativeTexScale[0][0].w);
      float _794 = mad((_shadowProjRelativeTexScale[0][1].z), _770, mad((_shadowProjRelativeTexScale[0][1].y), _769, ((_shadowProjRelativeTexScale[0][1].x) * _768))) + (_shadowProjRelativeTexScale[0][1].w);
      float _798 = mad((_shadowProjRelativeTexScale[0][2].z), _770, mad((_shadowProjRelativeTexScale[0][2].y), _769, ((_shadowProjRelativeTexScale[0][2].x) * _768))) + (_shadowProjRelativeTexScale[0][2].w);
      if (!(((((!(_790 >= _746))) || ((!(_790 <= _747))))) || ((!(_794 <= _747))))) {
        if (((_798 >= 9.999999747378752e-05f)) && ((((_794 >= _746)) && ((_798 <= 1.0f))))) {
          _26[0] = _790;
          _27[0] = _794;
          _28[0] = _798;
          _812 = 0.00019999999494757503f;
          _813 = 1;
          _814 = 0;
        } else {
          _812 = _761;
          _813 = _762;
          _814 = _763;
        }
      } else {
        _812 = _761;
        _813 = _762;
        _814 = _763;
      }
    } else {
      _812 = _696;
      _813 = 1;
      _814 = _698;
    }
    int _850 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) + 1013904242u));
    int _858 = ((int)(((((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    uint _862 = ((uint)(_858 ^ (((uint)(((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)));
    int _874 = ((int)(((((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _882 = ((int)(((((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) + 2027808484u));
    uint _886 = ((uint)(_882 ^ ((int)(((uint)((uint)(((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) >> 5)) + 2123724318u)))) + (((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
    uint _894 = ((uint)((((int)((_886 << 4) + (uint)(-1556008596))) ^ ((int)(_886 + 387276957u))) ^ (((uint)(_886) >> 5) + -939442524))) + (((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862);
    int _925 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) >> 5) + -939442524);
    int _938 = ((int)(((((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) + (uint)(-239350328)));
    uint _942 = ((uint)(_938 ^ (((uint)(((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) >> 5) + -939442524))) + ((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894));
    bool _952 = (((int)(_942) & 16777215) == 0);
    [branch]
    if (_700) {
      float _3036 = _26[_814];
      float _3037 = _27[_814];
      float _3038 = _28[_814];
      if (_952) {
        int _3043 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _3049 = ((int)(((uint)(_3043 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _3049 = (int)(_942);
      }
      float _3050 = _shadowSizeAndInvSize.z * 2.0f;
      float _3051 = _shadowSizeAndInvSize.w * 2.0f;
      float _3058 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _3060 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _3064 = ((float((uint)((uint)(((int)(_3049 * 48271)) & 16777215))) * _3058) - _3050) + _3036;
      float _3065 = ((float((uint)((uint)(((int)(_3049 * -1964877855)) & 16777215))) * _3060) - _3051) + _3037;
      float _3066 = float((uint)(uint)(_814));
      float4 _3069 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_3064, _3065, _3066), 0.0f);
      float _3073 = _3038 - _812;
      float4 _3075 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_3064, _3065, _3066), _3073);
      float _3089 = ((float((uint)((uint)(((int)(_3049 * -856141137)) & 16777215))) * _3058) - _3050) + _3036;
      float _3090 = ((float((uint)((uint)(((int)(_3049 * -613502015)) & 16777215))) * _3060) - _3051) + _3037;
      float4 _3091 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_3089, _3090, _3066), 0.0f);
      float4 _3095 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_3089, _3090, _3066), _3073);
      float _3111 = ((float((uint)((uint)(((int)(_3049 * -556260145)) & 16777215))) * _3058) - _3050) + _3036;
      float _3112 = ((float((uint)((uint)(((int)(_3049 * 902075297)) & 16777215))) * _3060) - _3051) + _3037;
      float4 _3113 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_3111, _3112, _3066), 0.0f);
      float4 _3117 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_3111, _3112, _3066), _3073);
      float _3133 = ((float((uint)((uint)(((int)(_3049 * 1698214639)) & 16777215))) * _3058) - _3050) + _3036;
      float _3134 = ((float((uint)((uint)(((int)(_3049 * 773027713)) & 16777215))) * _3060) - _3051) + _3037;
      float4 _3135 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_3133, _3134, _3066), 0.0f);
      float4 _3139 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_3133, _3134, _3066), _3073);
      float _3145 = (((saturate(1.0f - _3095.x) + saturate(1.0f - _3075.x)) + saturate(1.0f - _3117.x)) + saturate(1.0f - _3139.x)) * 0.25f;
      float _3146 = (((max(0.0f, (_3038 - _3091.x)) + max(0.0f, (_3038 - _3069.x))) + max(0.0f, (_3038 - _3113.x))) + max(0.0f, (_3038 - _3135.x))) * 0.25f;
      _3152 = saturate(_3145 * _3145);
      _3153 = saturate(_3146 * _3146);
      _3154 = 1.0h;
      _3155 = 1.0h;
      _3156 = 1.0h;
    } else {
      float _959 = _28[_814];
      float _961 = select((_814 == 0), 2.5f, 1.0f);
      if (_952) {
        int _968 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _974 = ((int)(((uint)(_968 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _974 = (int)(_942);
      }
      float _975 = select(_172, (_961 * 0.75f), _961) * 0.6600000262260437f;
      float _976 = _975 * _dynmaicShadowSizeAndInvSize.z;
      float _977 = _975 * _dynmaicShadowSizeAndInvSize.w;
      float _984 = _976 * 1.1920928955078125e-07f;
      float _986 = _977 * 1.1920928955078125e-07f;
      float _988 = (_26[_814]) - _976;
      float _990 = (_27[_814]) - _977;
      float _994 = (((float((uint)((uint)(((int)(_974 * 48271)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _995 = (((float((uint)((uint)(((int)(_974 * -1964877855)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _996 = frac(_994);
      float _997 = frac(_995);
      int _1000 = int(floor(_994));
      int _1001 = int(floor(_995));
      uint _1002 = uint(_dynmaicShadowSizeAndInvSize.x);
      uint _1003 = uint(_dynmaicShadowSizeAndInvSize.y);
      if (!((((uint)_1000 > (uint)(int)(_1002))) || (((uint)_1001 > (uint)(int)(_1003))))) {
        float4 _1011 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1000, _1001, _814, 0));
        float4 _1013 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1000) + 1u)), _1001, _814, 0));
        float4 _1015 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1000, ((int)((uint)(_1001) + 1u)), _814, 0));
        float4 _1017 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1000) + 1u)), ((int)((uint)(_1001) + 1u)), _814, 0));
        half4 _1020 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1000, _1001, _814, 0));
        float _1028 = max(0.0f, (_959 - _1011.x));
        float _1030 = max(0.0f, (_959 - _1015.x));
        float _1044 = saturate(exp2((_1011.x - _959) * 432808.5f));
        float _1046 = saturate(exp2((_1015.x - _959) * 432808.5f));
        float _1056 = ((saturate(exp2((_1013.x - _959) * 432808.5f)) - _1044) * _996) + _1044;
        float _1057 = ((max(0.0f, (_959 - _1013.x)) - _1028) * _996) + _1028;
        uint2 _1067 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1000, _1001, _814, 0));
        uint2 _1069 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1000) + 1u)), _1001, _814, 0));
        uint2 _1071 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1000, ((int)((uint)(_1001) + 1u)), _814, 0));
        uint2 _1073 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1000) + 1u)), ((int)((uint)(_1001) + 1u)), _814, 0));
        _1082 = select((((((_1069.x | _1067.x) | _1071.x) | _1073.x) & 1) != 0), ((((_1046 - _1056) + ((saturate(exp2((_1017.x - _959) * 432808.5f)) - _1046) * _996)) * _997) + _1056), 1.0f);
        _1083 = ((((_1030 - _1057) + ((max(0.0f, (_959 - _1017.x)) - _1030) * _996)) * _997) + _1057);
        _1084 = false;
        _1085 = _1020.x;
        _1086 = _1020.y;
        _1087 = _1020.z;
      } else {
        _1082 = 1.0f;
        _1083 = 0.0f;
        _1084 = true;
        _1085 = 1.0h;
        _1086 = 1.0h;
        _1087 = 1.0h;
      }
      half _1088 = select(_1084, 0.0h, _1085);
      half _1089 = select(_1084, 0.0h, _1086);
      half _1090 = select(_1084, 0.0h, _1087);
      float _1091 = select(_1084, 0.0f, _1082);
      float _1092 = select(_1084, 0.0f, _1083);
      float _1093 = select(_1084, 0.0f, 1.0f);
      float _1106 = (((float((uint)((uint)(((int)(_974 * -856141137)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1107 = (((float((uint)((uint)(((int)(_974 * -613502015)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1108 = frac(_1106);
      float _1109 = frac(_1107);
      int _1112 = int(floor(_1106));
      int _1113 = int(floor(_1107));
      if (!((((uint)_1112 > (uint)(int)(_1002))) || (((uint)_1113 > (uint)(int)(_1003))))) {
        float4 _1121 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1112, _1113, _814, 0));
        float4 _1123 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1112) + 1u)), _1113, _814, 0));
        float4 _1125 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1112, ((int)((uint)(_1113) + 1u)), _814, 0));
        float4 _1127 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1112) + 1u)), ((int)((uint)(_1113) + 1u)), _814, 0));
        half4 _1130 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1112, _1113, _814, 0));
        float _1138 = max(0.0f, (_959 - _1121.x));
        float _1140 = max(0.0f, (_959 - _1125.x));
        float _1154 = saturate(exp2((_1121.x - _959) * 432808.5f));
        float _1156 = saturate(exp2((_1125.x - _959) * 432808.5f));
        float _1166 = ((saturate(exp2((_1123.x - _959) * 432808.5f)) - _1154) * _1108) + _1154;
        float _1167 = ((max(0.0f, (_959 - _1123.x)) - _1138) * _1108) + _1138;
        uint2 _1177 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1112, _1113, _814, 0));
        uint2 _1179 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1112) + 1u)), _1113, _814, 0));
        uint2 _1181 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1112, ((int)((uint)(_1113) + 1u)), _814, 0));
        uint2 _1183 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1112) + 1u)), ((int)((uint)(_1113) + 1u)), _814, 0));
        _1192 = select((((((_1179.x | _1177.x) | _1181.x) | _1183.x) & 1) != 0), ((((_1156 - _1166) + ((saturate(exp2((_1127.x - _959) * 432808.5f)) - _1156) * _1108)) * _1109) + _1166), 1.0f);
        _1193 = ((((_1140 - _1167) + ((max(0.0f, (_959 - _1127.x)) - _1140) * _1108)) * _1109) + _1167);
        _1194 = false;
        _1195 = _1130.x;
        _1196 = _1130.y;
        _1197 = _1130.z;
      } else {
        _1192 = 1.0f;
        _1193 = 0.0f;
        _1194 = true;
        _1195 = 1.0h;
        _1196 = 1.0h;
        _1197 = 1.0h;
      }
      if (!_1194) {
        _1206 = (_1195 + _1088);
        _1207 = (_1196 + _1089);
        _1208 = (_1197 + _1090);
        _1209 = (_1192 + _1091);
        _1210 = (_1193 + _1092);
        _1211 = (_1093 + 1.0f);
      } else {
        _1206 = _1088;
        _1207 = _1089;
        _1208 = _1090;
        _1209 = _1091;
        _1210 = _1092;
        _1211 = _1093;
      }
      float _1224 = (((float((uint)((uint)(((int)(_974 * -556260145)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1225 = (((float((uint)((uint)(((int)(_974 * 902075297)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1226 = frac(_1224);
      float _1227 = frac(_1225);
      int _1230 = int(floor(_1224));
      int _1231 = int(floor(_1225));
      if (!((((uint)_1230 > (uint)(int)(_1002))) || (((uint)_1231 > (uint)(int)(_1003))))) {
        float4 _1239 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1230, _1231, _814, 0));
        float4 _1241 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1230) + 1u)), _1231, _814, 0));
        float4 _1243 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1230, ((int)((uint)(_1231) + 1u)), _814, 0));
        float4 _1245 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1230) + 1u)), ((int)((uint)(_1231) + 1u)), _814, 0));
        half4 _1248 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1230, _1231, _814, 0));
        float _1256 = max(0.0f, (_959 - _1239.x));
        float _1258 = max(0.0f, (_959 - _1243.x));
        float _1272 = saturate(exp2((_1239.x - _959) * 432808.5f));
        float _1274 = saturate(exp2((_1243.x - _959) * 432808.5f));
        float _1284 = ((saturate(exp2((_1241.x - _959) * 432808.5f)) - _1272) * _1226) + _1272;
        float _1285 = ((max(0.0f, (_959 - _1241.x)) - _1256) * _1226) + _1256;
        uint2 _1295 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1230, _1231, _814, 0));
        uint2 _1297 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1230) + 1u)), _1231, _814, 0));
        uint2 _1299 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1230, ((int)((uint)(_1231) + 1u)), _814, 0));
        uint2 _1301 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1230) + 1u)), ((int)((uint)(_1231) + 1u)), _814, 0));
        _1310 = select((((((_1297.x | _1295.x) | _1299.x) | _1301.x) & 1) != 0), ((((_1274 - _1284) + ((saturate(exp2((_1245.x - _959) * 432808.5f)) - _1274) * _1226)) * _1227) + _1284), 1.0f);
        _1311 = ((((_1258 - _1285) + ((max(0.0f, (_959 - _1245.x)) - _1258) * _1226)) * _1227) + _1285);
        _1312 = false;
        _1313 = _1248.x;
        _1314 = _1248.y;
        _1315 = _1248.z;
      } else {
        _1310 = 1.0f;
        _1311 = 0.0f;
        _1312 = true;
        _1313 = 1.0h;
        _1314 = 1.0h;
        _1315 = 1.0h;
      }
      if (!_1312) {
        _1324 = (_1313 + _1206);
        _1325 = (_1314 + _1207);
        _1326 = (_1315 + _1208);
        _1327 = (_1310 + _1209);
        _1328 = (_1311 + _1210);
        _1329 = (_1211 + 1.0f);
      } else {
        _1324 = _1206;
        _1325 = _1207;
        _1326 = _1208;
        _1327 = _1209;
        _1328 = _1210;
        _1329 = _1211;
      }
      float _1342 = (((float((uint)((uint)(((int)(_974 * 1698214639)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1343 = (((float((uint)((uint)(((int)(_974 * 773027713)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1344 = frac(_1342);
      float _1345 = frac(_1343);
      int _1348 = int(floor(_1342));
      int _1349 = int(floor(_1343));
      if (!((((uint)_1348 > (uint)(int)(_1002))) || (((uint)_1349 > (uint)(int)(_1003))))) {
        float4 _1357 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1348, _1349, _814, 0));
        float4 _1359 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1348) + 1u)), _1349, _814, 0));
        float4 _1361 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1348, ((int)((uint)(_1349) + 1u)), _814, 0));
        float4 _1363 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1348) + 1u)), ((int)((uint)(_1349) + 1u)), _814, 0));
        half4 _1366 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1348, _1349, _814, 0));
        float _1374 = max(0.0f, (_959 - _1357.x));
        float _1376 = max(0.0f, (_959 - _1361.x));
        float _1390 = saturate(exp2((_1357.x - _959) * 432808.5f));
        float _1392 = saturate(exp2((_1361.x - _959) * 432808.5f));
        float _1402 = ((saturate(exp2((_1359.x - _959) * 432808.5f)) - _1390) * _1344) + _1390;
        float _1403 = ((max(0.0f, (_959 - _1359.x)) - _1374) * _1344) + _1374;
        uint2 _1413 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1348, _1349, _814, 0));
        uint2 _1415 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1348) + 1u)), _1349, _814, 0));
        uint2 _1417 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1348, ((int)((uint)(_1349) + 1u)), _814, 0));
        uint2 _1419 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1348) + 1u)), ((int)((uint)(_1349) + 1u)), _814, 0));
        _1428 = select((((((_1415.x | _1413.x) | _1417.x) | _1419.x) & 1) != 0), ((((_1392 - _1402) + ((saturate(exp2((_1363.x - _959) * 432808.5f)) - _1392) * _1344)) * _1345) + _1402), 1.0f);
        _1429 = ((((_1376 - _1403) + ((max(0.0f, (_959 - _1363.x)) - _1376) * _1344)) * _1345) + _1403);
        _1430 = false;
        _1431 = _1366.x;
        _1432 = _1366.y;
        _1433 = _1366.z;
      } else {
        _1428 = 1.0f;
        _1429 = 0.0f;
        _1430 = true;
        _1431 = 1.0h;
        _1432 = 1.0h;
        _1433 = 1.0h;
      }
      if (!_1430) {
        _1442 = (_1431 + _1324);
        _1443 = (_1432 + _1325);
        _1444 = (_1433 + _1326);
        _1445 = (_1428 + _1327);
        _1446 = (_1429 + _1328);
        _1447 = (_1329 + 1.0f);
      } else {
        _1442 = _1324;
        _1443 = _1325;
        _1444 = _1326;
        _1445 = _1327;
        _1446 = _1328;
        _1447 = _1329;
      }
      float _1460 = (((float((uint)((uint)(((int)(_974 * 144866575)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1461 = (((float((uint)((uint)(((int)(_974 * 647683937)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1462 = frac(_1460);
      float _1463 = frac(_1461);
      int _1466 = int(floor(_1460));
      int _1467 = int(floor(_1461));
      if (!((((uint)_1466 > (uint)(int)(_1002))) || (((uint)_1467 > (uint)(int)(_1003))))) {
        float4 _1475 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1466, _1467, _814, 0));
        float4 _1477 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1466) + 1u)), _1467, _814, 0));
        float4 _1479 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1466, ((int)((uint)(_1467) + 1u)), _814, 0));
        float4 _1481 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1466) + 1u)), ((int)((uint)(_1467) + 1u)), _814, 0));
        half4 _1484 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1466, _1467, _814, 0));
        float _1492 = max(0.0f, (_959 - _1475.x));
        float _1494 = max(0.0f, (_959 - _1479.x));
        float _1508 = saturate(exp2((_1475.x - _959) * 432808.5f));
        float _1510 = saturate(exp2((_1479.x - _959) * 432808.5f));
        float _1520 = ((saturate(exp2((_1477.x - _959) * 432808.5f)) - _1508) * _1462) + _1508;
        float _1521 = ((max(0.0f, (_959 - _1477.x)) - _1492) * _1462) + _1492;
        uint2 _1531 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1466, _1467, _814, 0));
        uint2 _1533 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1466) + 1u)), _1467, _814, 0));
        uint2 _1535 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1466, ((int)((uint)(_1467) + 1u)), _814, 0));
        uint2 _1537 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1466) + 1u)), ((int)((uint)(_1467) + 1u)), _814, 0));
        _1546 = select((((((_1533.x | _1531.x) | _1535.x) | _1537.x) & 1) != 0), ((((_1510 - _1520) + ((saturate(exp2((_1481.x - _959) * 432808.5f)) - _1510) * _1462)) * _1463) + _1520), 1.0f);
        _1547 = ((((_1494 - _1521) + ((max(0.0f, (_959 - _1481.x)) - _1494) * _1462)) * _1463) + _1521);
        _1548 = false;
        _1549 = _1484.x;
        _1550 = _1484.y;
        _1551 = _1484.z;
      } else {
        _1546 = 1.0f;
        _1547 = 0.0f;
        _1548 = true;
        _1549 = 1.0h;
        _1550 = 1.0h;
        _1551 = 1.0h;
      }
      if (!_1548) {
        _1560 = (_1549 + _1442);
        _1561 = (_1550 + _1443);
        _1562 = (_1551 + _1444);
        _1563 = (_1546 + _1445);
        _1564 = (_1547 + _1446);
        _1565 = (_1447 + 1.0f);
      } else {
        _1560 = _1442;
        _1561 = _1443;
        _1562 = _1444;
        _1563 = _1445;
        _1564 = _1446;
        _1565 = _1447;
      }
      float _1578 = (((float((uint)((uint)(((int)(_974 * 1284375343)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1579 = (((float((uint)((uint)(((int)(_974 * 229264193)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1580 = frac(_1578);
      float _1581 = frac(_1579);
      int _1584 = int(floor(_1578));
      int _1585 = int(floor(_1579));
      if (!((((uint)_1584 > (uint)(int)(_1002))) || (((uint)_1585 > (uint)(int)(_1003))))) {
        float4 _1593 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1584, _1585, _814, 0));
        float4 _1595 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1584) + 1u)), _1585, _814, 0));
        float4 _1597 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1584, ((int)((uint)(_1585) + 1u)), _814, 0));
        float4 _1599 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1584) + 1u)), ((int)((uint)(_1585) + 1u)), _814, 0));
        half4 _1602 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1584, _1585, _814, 0));
        float _1610 = max(0.0f, (_959 - _1593.x));
        float _1612 = max(0.0f, (_959 - _1597.x));
        float _1626 = saturate(exp2((_1593.x - _959) * 432808.5f));
        float _1628 = saturate(exp2((_1597.x - _959) * 432808.5f));
        float _1638 = ((saturate(exp2((_1595.x - _959) * 432808.5f)) - _1626) * _1580) + _1626;
        float _1639 = ((max(0.0f, (_959 - _1595.x)) - _1610) * _1580) + _1610;
        uint2 _1649 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1584, _1585, _814, 0));
        uint2 _1651 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1584) + 1u)), _1585, _814, 0));
        uint2 _1653 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1584, ((int)((uint)(_1585) + 1u)), _814, 0));
        uint2 _1655 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1584) + 1u)), ((int)((uint)(_1585) + 1u)), _814, 0));
        _1664 = select((((((_1651.x | _1649.x) | _1653.x) | _1655.x) & 1) != 0), ((((_1628 - _1638) + ((saturate(exp2((_1599.x - _959) * 432808.5f)) - _1628) * _1580)) * _1581) + _1638), 1.0f);
        _1665 = ((((_1612 - _1639) + ((max(0.0f, (_959 - _1599.x)) - _1612) * _1580)) * _1581) + _1639);
        _1666 = false;
        _1667 = _1602.x;
        _1668 = _1602.y;
        _1669 = _1602.z;
      } else {
        _1664 = 1.0f;
        _1665 = 0.0f;
        _1666 = true;
        _1667 = 1.0h;
        _1668 = 1.0h;
        _1669 = 1.0h;
      }
      if (!_1666) {
        _1678 = (_1667 + _1560);
        _1679 = (_1668 + _1561);
        _1680 = (_1669 + _1562);
        _1681 = (_1664 + _1563);
        _1682 = (_1665 + _1564);
        _1683 = (_1565 + 1.0f);
      } else {
        _1678 = _1560;
        _1679 = _1561;
        _1680 = _1562;
        _1681 = _1563;
        _1682 = _1564;
        _1683 = _1565;
      }
      float _1696 = (((float((uint)((uint)(((int)(_974 * -1318861489)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1697 = (((float((uint)((uint)(((int)(_974 * 1537293089)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1698 = frac(_1696);
      float _1699 = frac(_1697);
      int _1702 = int(floor(_1696));
      int _1703 = int(floor(_1697));
      if (!((((uint)_1702 > (uint)(int)(_1002))) || (((uint)_1703 > (uint)(int)(_1003))))) {
        float4 _1711 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1702, _1703, _814, 0));
        float4 _1713 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1702) + 1u)), _1703, _814, 0));
        float4 _1715 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1702, ((int)((uint)(_1703) + 1u)), _814, 0));
        float4 _1717 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1702) + 1u)), ((int)((uint)(_1703) + 1u)), _814, 0));
        half4 _1720 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1702, _1703, _814, 0));
        float _1728 = max(0.0f, (_959 - _1711.x));
        float _1730 = max(0.0f, (_959 - _1715.x));
        float _1744 = saturate(exp2((_1711.x - _959) * 432808.5f));
        float _1746 = saturate(exp2((_1715.x - _959) * 432808.5f));
        float _1756 = ((saturate(exp2((_1713.x - _959) * 432808.5f)) - _1744) * _1698) + _1744;
        float _1757 = ((max(0.0f, (_959 - _1713.x)) - _1728) * _1698) + _1728;
        uint2 _1767 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1702, _1703, _814, 0));
        uint2 _1769 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1702) + 1u)), _1703, _814, 0));
        uint2 _1771 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1702, ((int)((uint)(_1703) + 1u)), _814, 0));
        uint2 _1773 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1702) + 1u)), ((int)((uint)(_1703) + 1u)), _814, 0));
        _1782 = select((((((_1769.x | _1767.x) | _1771.x) | _1773.x) & 1) != 0), ((((_1746 - _1756) + ((saturate(exp2((_1717.x - _959) * 432808.5f)) - _1746) * _1698)) * _1699) + _1756), 1.0f);
        _1783 = ((((_1730 - _1757) + ((max(0.0f, (_959 - _1717.x)) - _1730) * _1698)) * _1699) + _1757);
        _1784 = false;
        _1785 = _1720.x;
        _1786 = _1720.y;
        _1787 = _1720.z;
      } else {
        _1782 = 1.0f;
        _1783 = 0.0f;
        _1784 = true;
        _1785 = 1.0h;
        _1786 = 1.0h;
        _1787 = 1.0h;
      }
      if (!_1784) {
        _1796 = (_1785 + _1678);
        _1797 = (_1786 + _1679);
        _1798 = (_1787 + _1680);
        _1799 = (_1782 + _1681);
        _1800 = (_1783 + _1682);
        _1801 = (_1683 + 1.0f);
      } else {
        _1796 = _1678;
        _1797 = _1679;
        _1798 = _1680;
        _1799 = _1681;
        _1800 = _1682;
        _1801 = _1683;
      }
      float _1814 = (((float((uint)((uint)(((int)(_974 * -1770241169)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1815 = (((float((uint)((uint)(((int)(_974 * 1357852417)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1816 = frac(_1814);
      float _1817 = frac(_1815);
      int _1820 = int(floor(_1814));
      int _1821 = int(floor(_1815));
      if (!((((uint)_1820 > (uint)(int)(_1002))) || (((uint)_1821 > (uint)(int)(_1003))))) {
        float4 _1829 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1820, _1821, _814, 0));
        float4 _1831 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1820) + 1u)), _1821, _814, 0));
        float4 _1833 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1820, ((int)((uint)(_1821) + 1u)), _814, 0));
        float4 _1835 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1820) + 1u)), ((int)((uint)(_1821) + 1u)), _814, 0));
        half4 _1838 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1820, _1821, _814, 0));
        float _1846 = max(0.0f, (_959 - _1829.x));
        float _1848 = max(0.0f, (_959 - _1833.x));
        float _1862 = saturate(exp2((_1829.x - _959) * 432808.5f));
        float _1864 = saturate(exp2((_1833.x - _959) * 432808.5f));
        float _1874 = ((saturate(exp2((_1831.x - _959) * 432808.5f)) - _1862) * _1816) + _1862;
        float _1875 = ((max(0.0f, (_959 - _1831.x)) - _1846) * _1816) + _1846;
        uint2 _1885 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1820, _1821, _814, 0));
        uint2 _1887 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1820) + 1u)), _1821, _814, 0));
        uint2 _1889 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1820, ((int)((uint)(_1821) + 1u)), _814, 0));
        uint2 _1891 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1820) + 1u)), ((int)((uint)(_1821) + 1u)), _814, 0));
        _1900 = select((((((_1887.x | _1885.x) | _1889.x) | _1891.x) & 1) != 0), ((((_1864 - _1874) + ((saturate(exp2((_1835.x - _959) * 432808.5f)) - _1864) * _1816)) * _1817) + _1874), 1.0f);
        _1901 = ((((_1848 - _1875) + ((max(0.0f, (_959 - _1835.x)) - _1848) * _1816)) * _1817) + _1875);
        _1902 = false;
        _1903 = _1838.x;
        _1904 = _1838.y;
        _1905 = _1838.z;
      } else {
        _1900 = 1.0f;
        _1901 = 0.0f;
        _1902 = true;
        _1903 = 1.0h;
        _1904 = 1.0h;
        _1905 = 1.0h;
      }
      if (!_1902) {
        _1914 = (_1903 + _1796);
        _1915 = (_1904 + _1797);
        _1916 = (_1905 + _1798);
        _1917 = (_1900 + _1799);
        _1918 = (_1901 + _1800);
        _1919 = (_1801 + 1.0f);
      } else {
        _1914 = _1796;
        _1915 = _1797;
        _1916 = _1798;
        _1917 = _1799;
        _1918 = _1800;
        _1919 = _1801;
      }
      float _1932 = (((float((uint)((uint)(((int)(_974 * -601883249)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1933 = (((float((uint)((uint)(((int)(_974 * 1947444961)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1934 = frac(_1932);
      float _1935 = frac(_1933);
      int _1938 = int(floor(_1932));
      int _1939 = int(floor(_1933));
      if (!((((uint)_1938 > (uint)(int)(_1002))) || (((uint)_1939 > (uint)(int)(_1003))))) {
        float4 _1947 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1938, _1939, _814, 0));
        float4 _1949 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1938) + 1u)), _1939, _814, 0));
        float4 _1951 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1938, ((int)((uint)(_1939) + 1u)), _814, 0));
        float4 _1953 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1938) + 1u)), ((int)((uint)(_1939) + 1u)), _814, 0));
        half4 _1956 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1938, _1939, _814, 0));
        float _1964 = max(0.0f, (_959 - _1947.x));
        float _1966 = max(0.0f, (_959 - _1951.x));
        float _1980 = saturate(exp2((_1947.x - _959) * 432808.5f));
        float _1982 = saturate(exp2((_1951.x - _959) * 432808.5f));
        float _1992 = ((saturate(exp2((_1949.x - _959) * 432808.5f)) - _1980) * _1934) + _1980;
        float _1993 = ((max(0.0f, (_959 - _1949.x)) - _1964) * _1934) + _1964;
        uint2 _2003 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1938, _1939, _814, 0));
        uint2 _2005 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1938) + 1u)), _1939, _814, 0));
        uint2 _2007 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1938, ((int)((uint)(_1939) + 1u)), _814, 0));
        uint2 _2009 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1938) + 1u)), ((int)((uint)(_1939) + 1u)), _814, 0));
        _2018 = select((((((_2005.x | _2003.x) | _2007.x) | _2009.x) & 1) != 0), ((((_1982 - _1992) + ((saturate(exp2((_1953.x - _959) * 432808.5f)) - _1982) * _1934)) * _1935) + _1992), 1.0f);
        _2019 = ((((_1966 - _1993) + ((max(0.0f, (_959 - _1953.x)) - _1966) * _1934)) * _1935) + _1993);
        _2020 = false;
        _2021 = _1956.x;
        _2022 = _1956.y;
        _2023 = _1956.z;
      } else {
        _2018 = 1.0f;
        _2019 = 0.0f;
        _2020 = true;
        _2021 = 1.0h;
        _2022 = 1.0h;
        _2023 = 1.0h;
      }
      if (!_2020) {
        _2032 = (_2021 + _1914);
        _2033 = (_2022 + _1915);
        _2034 = (_2023 + _1916);
        _2035 = (_2018 + _1917);
        _2036 = (_2019 + _1918);
        _2037 = (_1919 + 1.0f);
      } else {
        _2032 = _1914;
        _2033 = _1915;
        _2034 = _1916;
        _2035 = _1917;
        _2036 = _1918;
        _2037 = _1919;
      }
      float _2050 = (((float((uint)((uint)(((int)(_974 * 1166504879)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2051 = (((float((uint)((uint)(((int)(_974 * 1335763649)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2052 = frac(_2050);
      float _2053 = frac(_2051);
      int _2056 = int(floor(_2050));
      int _2057 = int(floor(_2051));
      if (!((((uint)_2056 > (uint)(int)(_1002))) || (((uint)_2057 > (uint)(int)(_1003))))) {
        float4 _2065 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2056, _2057, _814, 0));
        float4 _2067 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2056) + 1u)), _2057, _814, 0));
        float4 _2069 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2056, ((int)((uint)(_2057) + 1u)), _814, 0));
        float4 _2071 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2056) + 1u)), ((int)((uint)(_2057) + 1u)), _814, 0));
        half4 _2074 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2056, _2057, _814, 0));
        float _2082 = max(0.0f, (_959 - _2065.x));
        float _2084 = max(0.0f, (_959 - _2069.x));
        float _2098 = saturate(exp2((_2065.x - _959) * 432808.5f));
        float _2100 = saturate(exp2((_2069.x - _959) * 432808.5f));
        float _2110 = ((saturate(exp2((_2067.x - _959) * 432808.5f)) - _2098) * _2052) + _2098;
        float _2111 = ((max(0.0f, (_959 - _2067.x)) - _2082) * _2052) + _2082;
        uint2 _2121 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2056, _2057, _814, 0));
        uint2 _2123 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2056) + 1u)), _2057, _814, 0));
        uint2 _2125 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2056, ((int)((uint)(_2057) + 1u)), _814, 0));
        uint2 _2127 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2056) + 1u)), ((int)((uint)(_2057) + 1u)), _814, 0));
        _2136 = select((((((_2123.x | _2121.x) | _2125.x) | _2127.x) & 1) != 0), ((((_2100 - _2110) + ((saturate(exp2((_2071.x - _959) * 432808.5f)) - _2100) * _2052)) * _2053) + _2110), 1.0f);
        _2137 = ((((_2084 - _2111) + ((max(0.0f, (_959 - _2071.x)) - _2084) * _2052)) * _2053) + _2111);
        _2138 = false;
        _2139 = _2074.x;
        _2140 = _2074.y;
        _2141 = _2074.z;
      } else {
        _2136 = 1.0f;
        _2137 = 0.0f;
        _2138 = true;
        _2139 = 1.0h;
        _2140 = 1.0h;
        _2141 = 1.0h;
      }
      if (!_2138) {
        _2150 = (_2139 + _2032);
        _2151 = (_2140 + _2033);
        _2152 = (_2141 + _2034);
        _2153 = (_2136 + _2035);
        _2154 = (_2137 + _2036);
        _2155 = (_2037 + 1.0f);
      } else {
        _2150 = _2032;
        _2151 = _2033;
        _2152 = _2034;
        _2153 = _2035;
        _2154 = _2036;
        _2155 = _2037;
      }
      float _2168 = (((float((uint)((uint)(((int)(_974 * -1696913969)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2169 = (((float((uint)((uint)(((int)(_974 * 1882071713)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2170 = frac(_2168);
      float _2171 = frac(_2169);
      int _2174 = int(floor(_2168));
      int _2175 = int(floor(_2169));
      if (!((((uint)_2174 > (uint)(int)(_1002))) || (((uint)_2175 > (uint)(int)(_1003))))) {
        float4 _2183 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2174, _2175, _814, 0));
        float4 _2185 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2174) + 1u)), _2175, _814, 0));
        float4 _2187 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2174, ((int)((uint)(_2175) + 1u)), _814, 0));
        float4 _2189 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2174) + 1u)), ((int)((uint)(_2175) + 1u)), _814, 0));
        half4 _2192 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2174, _2175, _814, 0));
        float _2200 = max(0.0f, (_959 - _2183.x));
        float _2202 = max(0.0f, (_959 - _2187.x));
        float _2216 = saturate(exp2((_2183.x - _959) * 432808.5f));
        float _2218 = saturate(exp2((_2187.x - _959) * 432808.5f));
        float _2228 = ((saturate(exp2((_2185.x - _959) * 432808.5f)) - _2216) * _2170) + _2216;
        float _2229 = ((max(0.0f, (_959 - _2185.x)) - _2200) * _2170) + _2200;
        uint2 _2239 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2174, _2175, _814, 0));
        uint2 _2241 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2174) + 1u)), _2175, _814, 0));
        uint2 _2243 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2174, ((int)((uint)(_2175) + 1u)), _814, 0));
        uint2 _2245 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2174) + 1u)), ((int)((uint)(_2175) + 1u)), _814, 0));
        _2254 = select((((((_2241.x | _2239.x) | _2243.x) | _2245.x) & 1) != 0), ((((_2218 - _2228) + ((saturate(exp2((_2189.x - _959) * 432808.5f)) - _2218) * _2170)) * _2171) + _2228), 1.0f);
        _2255 = ((((_2202 - _2229) + ((max(0.0f, (_959 - _2189.x)) - _2202) * _2170)) * _2171) + _2229);
        _2256 = false;
        _2257 = _2192.x;
        _2258 = _2192.y;
        _2259 = _2192.z;
      } else {
        _2254 = 1.0f;
        _2255 = 0.0f;
        _2256 = true;
        _2257 = 1.0h;
        _2258 = 1.0h;
        _2259 = 1.0h;
      }
      if (!_2256) {
        _2268 = (_2257 + _2150);
        _2269 = (_2258 + _2151);
        _2270 = (_2259 + _2152);
        _2271 = (_2254 + _2153);
        _2272 = (_2255 + _2154);
        _2273 = (_2155 + 1.0f);
      } else {
        _2268 = _2150;
        _2269 = _2151;
        _2270 = _2152;
        _2271 = _2153;
        _2272 = _2154;
        _2273 = _2155;
      }
      float _2286 = (((float((uint)((uint)(((int)(_974 * -1959554065)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2287 = (((float((uint)((uint)(((int)(_974 * -1569511807)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2288 = frac(_2286);
      float _2289 = frac(_2287);
      int _2292 = int(floor(_2286));
      int _2293 = int(floor(_2287));
      if (!((((uint)_2292 > (uint)(int)(_1002))) || (((uint)_2293 > (uint)(int)(_1003))))) {
        float4 _2301 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2292, _2293, _814, 0));
        float4 _2303 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2292) + 1u)), _2293, _814, 0));
        float4 _2305 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2292, ((int)((uint)(_2293) + 1u)), _814, 0));
        float4 _2307 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2292) + 1u)), ((int)((uint)(_2293) + 1u)), _814, 0));
        half4 _2310 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2292, _2293, _814, 0));
        float _2318 = max(0.0f, (_959 - _2301.x));
        float _2320 = max(0.0f, (_959 - _2305.x));
        float _2334 = saturate(exp2((_2301.x - _959) * 432808.5f));
        float _2336 = saturate(exp2((_2305.x - _959) * 432808.5f));
        float _2346 = ((saturate(exp2((_2303.x - _959) * 432808.5f)) - _2334) * _2288) + _2334;
        float _2347 = ((max(0.0f, (_959 - _2303.x)) - _2318) * _2288) + _2318;
        uint2 _2357 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2292, _2293, _814, 0));
        uint2 _2359 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2292) + 1u)), _2293, _814, 0));
        uint2 _2361 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2292, ((int)((uint)(_2293) + 1u)), _814, 0));
        uint2 _2363 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2292) + 1u)), ((int)((uint)(_2293) + 1u)), _814, 0));
        _2372 = select((((((_2359.x | _2357.x) | _2361.x) | _2363.x) & 1) != 0), ((((_2336 - _2346) + ((saturate(exp2((_2307.x - _959) * 432808.5f)) - _2336) * _2288)) * _2289) + _2346), 1.0f);
        _2373 = ((((_2320 - _2347) + ((max(0.0f, (_959 - _2307.x)) - _2320) * _2288)) * _2289) + _2347);
        _2374 = false;
        _2375 = _2310.x;
        _2376 = _2310.y;
        _2377 = _2310.z;
      } else {
        _2372 = 1.0f;
        _2373 = 0.0f;
        _2374 = true;
        _2375 = 1.0h;
        _2376 = 1.0h;
        _2377 = 1.0h;
      }
      if (!_2374) {
        _2386 = (_2375 + _2268);
        _2387 = (_2376 + _2269);
        _2388 = (_2377 + _2270);
        _2389 = (_2372 + _2271);
        _2390 = (_2373 + _2272);
        _2391 = (_2273 + 1.0f);
      } else {
        _2386 = _2268;
        _2387 = _2269;
        _2388 = _2270;
        _2389 = _2271;
        _2390 = _2272;
        _2391 = _2273;
      }
      float _2404 = (((float((uint)((uint)(((int)(_974 * 1318665743)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2405 = (((float((uint)((uint)(((int)(_974 * 1898753633)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2406 = frac(_2404);
      float _2407 = frac(_2405);
      int _2410 = int(floor(_2404));
      int _2411 = int(floor(_2405));
      if (!((((uint)_2410 > (uint)(int)(_1002))) || (((uint)_2411 > (uint)(int)(_1003))))) {
        float4 _2419 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2410, _2411, _814, 0));
        float4 _2421 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2410) + 1u)), _2411, _814, 0));
        float4 _2423 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2410, ((int)((uint)(_2411) + 1u)), _814, 0));
        float4 _2425 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2410) + 1u)), ((int)((uint)(_2411) + 1u)), _814, 0));
        half4 _2428 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2410, _2411, _814, 0));
        float _2436 = max(0.0f, (_959 - _2419.x));
        float _2438 = max(0.0f, (_959 - _2423.x));
        float _2452 = saturate(exp2((_2419.x - _959) * 432808.5f));
        float _2454 = saturate(exp2((_2423.x - _959) * 432808.5f));
        float _2464 = ((saturate(exp2((_2421.x - _959) * 432808.5f)) - _2452) * _2406) + _2452;
        float _2465 = ((max(0.0f, (_959 - _2421.x)) - _2436) * _2406) + _2436;
        uint2 _2475 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2410, _2411, _814, 0));
        uint2 _2477 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2410) + 1u)), _2411, _814, 0));
        uint2 _2479 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2410, ((int)((uint)(_2411) + 1u)), _814, 0));
        uint2 _2481 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2410) + 1u)), ((int)((uint)(_2411) + 1u)), _814, 0));
        _2490 = select((((((_2477.x | _2475.x) | _2479.x) | _2481.x) & 1) != 0), ((((_2454 - _2464) + ((saturate(exp2((_2425.x - _959) * 432808.5f)) - _2454) * _2406)) * _2407) + _2464), 1.0f);
        _2491 = ((((_2438 - _2465) + ((max(0.0f, (_959 - _2425.x)) - _2438) * _2406)) * _2407) + _2465);
        _2492 = false;
        _2493 = _2428.x;
        _2494 = _2428.y;
        _2495 = _2428.z;
      } else {
        _2490 = 1.0f;
        _2491 = 0.0f;
        _2492 = true;
        _2493 = 1.0h;
        _2494 = 1.0h;
        _2495 = 1.0h;
      }
      if (!_2492) {
        _2504 = (_2493 + _2386);
        _2505 = (_2494 + _2387);
        _2506 = (_2495 + _2388);
        _2507 = (_2490 + _2389);
        _2508 = (_2491 + _2390);
        _2509 = (_2391 + 1.0f);
      } else {
        _2504 = _2386;
        _2505 = _2387;
        _2506 = _2388;
        _2507 = _2389;
        _2508 = _2390;
        _2509 = _2391;
      }
      float _2522 = (((float((uint)((uint)(((int)(_974 * 134521903)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2523 = (((float((uint)((uint)(((int)(_974 * -483771839)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2524 = frac(_2522);
      float _2525 = frac(_2523);
      int _2528 = int(floor(_2522));
      int _2529 = int(floor(_2523));
      if (!((((uint)_2528 > (uint)(int)(_1002))) || (((uint)_2529 > (uint)(int)(_1003))))) {
        float4 _2537 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2528, _2529, _814, 0));
        float4 _2539 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2528) + 1u)), _2529, _814, 0));
        float4 _2541 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2528, ((int)((uint)(_2529) + 1u)), _814, 0));
        float4 _2543 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2528) + 1u)), ((int)((uint)(_2529) + 1u)), _814, 0));
        half4 _2546 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2528, _2529, _814, 0));
        float _2554 = max(0.0f, (_959 - _2537.x));
        float _2556 = max(0.0f, (_959 - _2541.x));
        float _2570 = saturate(exp2((_2537.x - _959) * 432808.5f));
        float _2572 = saturate(exp2((_2541.x - _959) * 432808.5f));
        float _2582 = ((saturate(exp2((_2539.x - _959) * 432808.5f)) - _2570) * _2524) + _2570;
        float _2583 = ((max(0.0f, (_959 - _2539.x)) - _2554) * _2524) + _2554;
        uint2 _2593 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2528, _2529, _814, 0));
        uint2 _2595 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2528) + 1u)), _2529, _814, 0));
        uint2 _2597 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2528, ((int)((uint)(_2529) + 1u)), _814, 0));
        uint2 _2599 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2528) + 1u)), ((int)((uint)(_2529) + 1u)), _814, 0));
        _2608 = select((((((_2595.x | _2593.x) | _2597.x) | _2599.x) & 1) != 0), ((((_2572 - _2582) + ((saturate(exp2((_2543.x - _959) * 432808.5f)) - _2572) * _2524)) * _2525) + _2582), 1.0f);
        _2609 = ((((_2556 - _2583) + ((max(0.0f, (_959 - _2543.x)) - _2556) * _2524)) * _2525) + _2583);
        _2610 = false;
        _2611 = _2546.x;
        _2612 = _2546.y;
        _2613 = _2546.z;
      } else {
        _2608 = 1.0f;
        _2609 = 0.0f;
        _2610 = true;
        _2611 = 1.0h;
        _2612 = 1.0h;
        _2613 = 1.0h;
      }
      if (!_2610) {
        _2622 = (_2611 + _2504);
        _2623 = (_2612 + _2505);
        _2624 = (_2613 + _2506);
        _2625 = (_2608 + _2507);
        _2626 = (_2609 + _2508);
        _2627 = (_2509 + 1.0f);
      } else {
        _2622 = _2504;
        _2623 = _2505;
        _2624 = _2506;
        _2625 = _2507;
        _2626 = _2508;
        _2627 = _2509;
      }
      float _2640 = (((float((uint)((uint)(((int)(_974 * -413252017)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2641 = (((float((uint)((uint)(((int)(_974 * 2034977313)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2642 = frac(_2640);
      float _2643 = frac(_2641);
      int _2646 = int(floor(_2640));
      int _2647 = int(floor(_2641));
      if (!((((uint)_2646 > (uint)(int)(_1002))) || (((uint)_2647 > (uint)(int)(_1003))))) {
        float4 _2655 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2646, _2647, _814, 0));
        float4 _2657 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2646) + 1u)), _2647, _814, 0));
        float4 _2659 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2646, ((int)((uint)(_2647) + 1u)), _814, 0));
        float4 _2661 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2646) + 1u)), ((int)((uint)(_2647) + 1u)), _814, 0));
        half4 _2664 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2646, _2647, _814, 0));
        float _2672 = max(0.0f, (_959 - _2655.x));
        float _2674 = max(0.0f, (_959 - _2659.x));
        float _2688 = saturate(exp2((_2655.x - _959) * 432808.5f));
        float _2690 = saturate(exp2((_2659.x - _959) * 432808.5f));
        float _2700 = ((saturate(exp2((_2657.x - _959) * 432808.5f)) - _2688) * _2642) + _2688;
        float _2701 = ((max(0.0f, (_959 - _2657.x)) - _2672) * _2642) + _2672;
        uint2 _2711 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2646, _2647, _814, 0));
        uint2 _2713 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2646) + 1u)), _2647, _814, 0));
        uint2 _2715 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2646, ((int)((uint)(_2647) + 1u)), _814, 0));
        uint2 _2717 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2646) + 1u)), ((int)((uint)(_2647) + 1u)), _814, 0));
        _2726 = select((((((_2713.x | _2711.x) | _2715.x) | _2717.x) & 1) != 0), ((((_2690 - _2700) + ((saturate(exp2((_2661.x - _959) * 432808.5f)) - _2690) * _2642)) * _2643) + _2700), 1.0f);
        _2727 = ((((_2674 - _2701) + ((max(0.0f, (_959 - _2661.x)) - _2674) * _2642)) * _2643) + _2701);
        _2728 = false;
        _2729 = _2664.x;
        _2730 = _2664.y;
        _2731 = _2664.z;
      } else {
        _2726 = 1.0f;
        _2727 = 0.0f;
        _2728 = true;
        _2729 = 1.0h;
        _2730 = 1.0h;
        _2731 = 1.0h;
      }
      if (!_2728) {
        _2740 = (_2729 + _2622);
        _2741 = (_2730 + _2623);
        _2742 = (_2731 + _2624);
        _2743 = (_2726 + _2625);
        _2744 = (_2727 + _2626);
        _2745 = (_2627 + 1.0f);
      } else {
        _2740 = _2622;
        _2741 = _2623;
        _2742 = _2624;
        _2743 = _2625;
        _2744 = _2626;
        _2745 = _2627;
      }
      float _2758 = (((float((uint)((uint)(((int)(_974 * 192849007)) & 16777215))) * _984) + _988) * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2759 = (((float((uint)((uint)(((int)(_974 * 1820286465)) & 16777215))) * _986) + _990) * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2760 = frac(_2758);
      float _2761 = frac(_2759);
      int _2764 = int(floor(_2758));
      int _2765 = int(floor(_2759));
      if (!((((uint)_2764 > (uint)(int)(_1002))) || (((uint)_2765 > (uint)(int)(_1003))))) {
        float4 _2773 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2764, _2765, _814, 0));
        float4 _2775 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2764) + 1u)), _2765, _814, 0));
        float4 _2777 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2764, ((int)((uint)(_2765) + 1u)), _814, 0));
        float4 _2779 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2764) + 1u)), ((int)((uint)(_2765) + 1u)), _814, 0));
        half4 _2782 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2764, _2765, _814, 0));
        float _2790 = max(0.0f, (_959 - _2773.x));
        float _2792 = max(0.0f, (_959 - _2777.x));
        float _2806 = saturate(exp2((_2773.x - _959) * 432808.5f));
        float _2808 = saturate(exp2((_2777.x - _959) * 432808.5f));
        float _2818 = ((saturate(exp2((_2775.x - _959) * 432808.5f)) - _2806) * _2760) + _2806;
        float _2819 = ((max(0.0f, (_959 - _2775.x)) - _2790) * _2760) + _2790;
        uint2 _2829 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2764, _2765, _814, 0));
        uint2 _2831 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2764) + 1u)), _2765, _814, 0));
        uint2 _2833 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2764, ((int)((uint)(_2765) + 1u)), _814, 0));
        uint2 _2835 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2764) + 1u)), ((int)((uint)(_2765) + 1u)), _814, 0));
        _2844 = select((((((_2831.x | _2829.x) | _2833.x) | _2835.x) & 1) != 0), ((((_2808 - _2818) + ((saturate(exp2((_2779.x - _959) * 432808.5f)) - _2808) * _2760)) * _2761) + _2818), 1.0f);
        _2845 = ((((_2792 - _2819) + ((max(0.0f, (_959 - _2779.x)) - _2792) * _2760)) * _2761) + _2819);
        _2846 = false;
        _2847 = _2782.x;
        _2848 = _2782.y;
        _2849 = _2782.z;
      } else {
        _2844 = 1.0f;
        _2845 = 0.0f;
        _2846 = true;
        _2847 = 1.0h;
        _2848 = 1.0h;
        _2849 = 1.0h;
      }
      if (!_2846) {
        _2858 = (_2847 + _2740);
        _2859 = (_2848 + _2741);
        _2860 = (_2849 + _2742);
        _2861 = (_2844 + _2743);
        _2862 = (_2845 + _2744);
        _2863 = (_2745 + 1.0f);
      } else {
        _2858 = _2740;
        _2859 = _2741;
        _2860 = _2742;
        _2861 = _2743;
        _2862 = _2744;
        _2863 = _2745;
      }
      float _2865 = 1.0f / max(_2863, 1.0f);
      float _2875 = max((_2863 + 1.0f), 1.0f);
      half _2879 = half(float(_2858 + _2847) / _2875);
      half _2880 = half(float(_2859 + _2848) / _2875);
      half _2881 = half(float(_2860 + _2849) / _2875);
      if (_814 == 1) {
        float _2884 = float(_2879);
        float _2885 = float(_2880);
        float _2886 = float(_2881);
        float _2887 = -0.0f - _699;
        _2901 = half((_2884 + _699) + (_2884 * _2887));
        _2902 = half((_2885 + _699) + (_2885 * _2887));
        _2903 = half((_2886 + _699) + (_2886 * _2887));
      } else {
        _2901 = _2879;
        _2902 = _2880;
        _2903 = _2881;
      }
      float2 _2906 = __3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_67, _68), 0.0f);
      float _2911 = _115 * 0.05000000074505806f;
      float _2913 = 1.0f / _bufferSizeAndInvSize.x;
      float _2914 = 1.0f / _bufferSizeAndInvSize.y;
      _2923 = _2906.x;
      _2924 = 1.0f;
      _2925 = 0;
      while(true) {
        float _2934 = float((int)(RAYTRACED_SHADOW_JITTER[((int)(0u + (_2925 * 2)))]));
        float _2935 = float((int)(RAYTRACED_SHADOW_JITTER[((int)(1u + (_2925 * 2)))]));
        float _2936 = _2934 + _60;
        float _2937 = _2935 + _61;
        uint _2941 = __3__36__0__0__g_depthStencil.Load(int3(int(_2936), int(_2937), 0));
        float _2950 = ((_2913 * 2.0f) * _2936) + -1.0f;
        float _2951 = 1.0f - ((_2914 * 2.0f) * _2937);
        float _2954 = max(1.0000000116860974e-07f, (float((uint)((uint)(_2941.x & 16777215))) * 5.960465188081798e-08f));
        float _2991 = mad((_invViewProjRelative[3].z), _2954, mad((_invViewProjRelative[3].y), _2951, ((_invViewProjRelative[3].x) * _2950))) + (_invViewProjRelative[3].w);
        float _2995 = ((mad((_invViewProjRelative[0].z), _2954, mad((_invViewProjRelative[0].y), _2951, ((_invViewProjRelative[0].x) * _2950))) + (_invViewProjRelative[0].w)) / _2991) - _152;
        float _2996 = ((mad((_invViewProjRelative[1].z), _2954, mad((_invViewProjRelative[1].y), _2951, ((_invViewProjRelative[1].x) * _2950))) + (_invViewProjRelative[1].w)) / _2991) - _153;
        float _2997 = ((mad((_invViewProjRelative[2].z), _2954, mad((_invViewProjRelative[2].y), _2951, ((_invViewProjRelative[2].x) * _2950))) + (_invViewProjRelative[2].w)) / _2991) - _154;
        float _3003 = sqrt(((_2996 * _2996) + (_2995 * _2995)) + (_2997 * _2997));
        float _3005 = abs((_nearFarProj.x / _2954) - _115);
        float _3006 = _3005 * _3005;
        float2 _3013 = __3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(((_2934 * _2913) + _67), ((_2935 * _2914) + _68)), 0.0f);
        if (!(_3006 > (_2911 * _2911))) {
          _3026 = (exp2((-1.4426950216293335f / ((_115 * 0.019999999552965164f) + 0.25f)) * ((_3006 * 20.0f) + ((_3003 * _3003) * 0.019999999552965164f))) * max(0.019999999552965164f, _2906.y));
        } else {
          _3026 = 0.0f;
        }
        float _3028 = (_3026 * _3013.x) + _2923;
        float _3029 = _3026 + _2924;
        if (!((_2925 + 1) == 8)) {
          _2923 = _3028;
          _2924 = _3029;
          _2925 = (_2925 + 1);
          continue;
        }
        _3152 = min(_556, min((_2865 * _2861), ((1.0f / max(9.999999974752427e-07f, _3029)) * _3028)));
        _3153 = (_2865 * _2862);
        _3154 = _2901;
        _3155 = _2902;
        _3156 = _2903;
        break;
      }
    }
    bool _3157 = (_813 != 0);
    float _3159 = min(_556, select(_3157, _3152, 1.0f));
    float _3163 = select((_697 != 0), select(_3157, (_3153 * 400.0f), 4e+06f), 1.0f);
    float _3178 = (_3159 - (_shadowAOParams.x * _3159)) + _shadowAOParams.x;
    [branch]
    if (_3178 > 0.0f) {
      int _3188 = _76 & 126;
      bool _3189 = (_3188 == 64);
      bool _3190 = (_80 == 66);
      bool _3191 = (_3189) || (_3190);
      float _3192 = select(_3191, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _3208 = _sunDirection.x;
        _3209 = _sunDirection.y;
        _3210 = _sunDirection.z;
      } else {
        _3208 = _moonDirection.x;
        _3209 = _moonDirection.y;
        _3210 = _moonDirection.z;
      }
      int _3211 = ((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)) & 3;
      int _3215 = ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)) & 3;
      float _3234 = float((uint)(uint)(_frameNumber.x));
      float _3245 = (frac(((_3234 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      float _3246 = (frac(((_3234 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      float _3251 = frac(dot(float3((_3245 * _3245), (_3246 * _3246), (_3246 * _3245)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      float _3267 = frac((float((uint)((uint)((int)(uint(_3251 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)((uint)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) >> 2) & 858993459))) >> 1) & 21)))) * 0.03125f)) * 6.2831854820251465f;
      float _3271 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * float((uint)((uint)(reversebits((float)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3215 << 1) | _3215) << 1) & 10) | (((_3211 << 1) | _3211) & 5)))) >> 2) & 858993459))) >> 1) & 21))) ^ (int)(uint(_3251 * 287478368.0f)))))) + _shadowAOParams.z;
      float _3274 = sqrt(1.0f - (_3271 * _3271));
      float _3277 = cos(_3267) * _3274;
      float _3278 = sin(_3267) * _3274;
      float _3280 = select((_3210 >= 0.0f), 1.0f, -1.0f);
      float _3283 = -0.0f - (1.0f / (_3280 + _3210));
      float _3284 = _3209 * _3283;
      float _3285 = _3284 * _3208;
      float _3286 = _3280 * _3208;
      float _3295 = mad(_3271, _3208, mad(_3278, _3285, ((((_3286 * _3208) * _3283) + 1.0f) * _3277)));
      float _3299 = mad(_3271, _3209, mad(_3278, (_3280 + (_3284 * _3209)), ((_3277 * _3280) * _3285)));
      float _3303 = mad(_3271, _3210, mad(_3278, (-0.0f - _3209), (-0.0f - (_3286 * _3277))));
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _3295 = _3208;
        _3299 = _3209;
        _3303 = _3210;
      }
      int _3304 = select(_3189, 10, 8);
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _3304 = (int)(lerp(float(_3304), CONTACT_SHADOW_RT_MARCH_SAMPLES, CONTACT_SHADOW_RT_TUNING) + 0.5f);
      }
      if (!_170) {
        _3310 = min(0.5f, ((_115 * 0.0024999999441206455f) + 0.25f));
      } else {
        _3310 = 1.0f;
      }
      float _3316 = ((abs(_3209) * (select(_3191, 12.0f, 2.0f) - _3192)) + _3192) * select(_172, lerp(0.009999999776482582f, CONTACT_SHADOW_RT_REACH_TARGET, CONTACT_SHADOW_RT_TUNING), 0.10000000149011612f);
      if (!_172) {
        _3324 = max((_115 * select(((uint)(_80 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _3316);
      } else {
        _3324 = _3316;
      }
      float _3330 = saturate(((_115 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_103, _104, _105), float3((-0.0f - (_152 * _156)), (-0.0f - (_153 * _156)), (-0.0f - (_154 * _156))))))) + 0.009999999776482582f);
      bool _3337 = (_terrainNormalParams.z > 0.0f);
      if (_3337) {
        float _3341 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _3502 = frac(frac(dot(float2(((_3341 * 32.665000915527344f) + _60), ((_3341 * 11.8149995803833f) + _61)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        int _3383 = ((int)(((((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) + 1013904242u));
        int _3391 = ((int)(((((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        uint _3395 = ((uint)(_3391 ^ (((uint)(((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))));
        int _3407 = ((int)(((((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _3415 = ((int)(((((uint)(_3407 ^ (((uint)(((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _3395) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_3407 ^ (((uint)(((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _3395) + 2027808484u));
        uint _3419 = ((uint)(_3415 ^ ((int)(((uint)((uint)(((uint)(_3407 ^ (((uint)(((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _3395) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
        uint _3427 = ((uint)((((int)((_3419 << 4) + (uint)(-1556008596))) ^ ((int)(_3419 + 387276957u))) ^ (((uint)(_3419) >> 5) + -939442524))) + (((uint)(_3407 ^ (((uint)(((uint)((((int)((_3395 << 4) + (uint)(-1383041155))) ^ ((int)(_3395 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_3395) >> 5)) + 2123724318u)))) + (((uint)(_3383 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _3395);
        int _3458 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)) >> 5) + -939442524);
        int _3471 = ((int)(((((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419))) + (uint)(-239350328)));
        uint _3475 = ((uint)(_3471 ^ (((uint)(((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419))) >> 5) + -939442524))) + ((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427));
        if (((int)(_3475) & 16777215) == 0) {
          int _3490 = ((int)(((((uint)((((int)((_3475 << 4) + (uint)(-1383041155))) ^ ((int)(_3475 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3475) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3475 << 4) + (uint)(-1383041155))) ^ ((int)(_3475 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3475) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)))) + (uint)(-1879881855)));
          uint _3494 = ((uint)(_3490 ^ (((uint)(((uint)((((int)((_3475 << 4) + (uint)(-1383041155))) ^ ((int)(_3475 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3475) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_3458) + (((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419) >> 5) + -939442524))) + _3427) >> 5)) + 2123724318u)))) + (((uint)((((int)((_3427 << 4) + (uint)(-1383041155))) ^ ((int)(_3427 + 387276957u))) ^ ((int)(((uint)((uint)(_3427) >> 5)) + 2123724318u)))) + _3419)))) >> 5) + -939442524))) + _3475;
          _3496 = (int)(_3494);
        } else {
          _3496 = (int)(_3475);
        }
        _3502 = (float((uint)((uint)(((int)(_3496 * 48271)) & 16777215))) * 5.960464477539063e-08f);
      }
      if ((_3190) || ((((_80 != 15)) && (((uint)(_80 + -12) < (uint)7))))) {
        _3515 = (_3502 * lerp(10.0f, CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING));
      } else {
        if (_80 == 15) {
          _3515 = ((lerp((10.0f - (saturate(_115 * 0.0010000000474974513f) * 9.0f)), CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING)) * _3502);
        } else {
          _3515 = _3502;
        }
      }
      if (_3188 == 12) {
        _3528 = (0.10000000149011612f - (abs(_3299) * 0.05000000074505806f));
      } else {
        if ((uint)_80 > (uint)15) {
          if ((((uint)_80 < (uint)20)) || ((_80 == 107))) {
            _3528 = (0.10000000149011612f - (abs(_3299) * 0.05000000074505806f));
          } else {
            _3528 = 0.0f;
          }
        } else {
          _3528 = 0.0f;
        }
      }
      if (!_172) {
        float _3530 = _3528 * _156;
        _3538 = (_152 - (_3530 * _152));
        _3539 = (_153 - (_3530 * _153));
        _3540 = (_154 - (_3530 * _154));
      } else {
        _3538 = _152;
        _3539 = _153;
        _3540 = _154;
      }
      if (!_3337) {
        float _3544 = saturate(_115 * 0.0625f) * 0.05000000074505806f;
        _3549 = (_3544 * _103);
        _3550 = (_3544 * _104);
        _3551 = (_3544 * _105);
      } else {
        _3549 = 0.0f;
        _3550 = 0.0f;
        _3551 = 0.0f;
      }
      float _3552 = _3549 + _3538;
      float _3553 = _3550 + _3539;
      float _3554 = _3551 + _3540;
      float _3567 = mad((_viewRelative[2].z), _3554, mad((_viewRelative[2].y), _3553, ((_viewRelative[2].x) * _3552))) + (_viewRelative[2].w);
      float _3570 = mad((_viewRelative[2].z), _3303, mad((_viewRelative[2].y), _3299, ((_viewRelative[2].x) * _3295)));
      bool _3575 = (((_3570 * _3324) + _3567) < _nearFarProj.x);
      if (_115 < 8.0f) {
        float _3579 = select(_3575, ((_nearFarProj.x - _3567) / _3570), _3324);
        float _3611 = mad((_viewProjRelative[2].z), _3554, mad((_viewProjRelative[2].y), _3553, ((_viewProjRelative[2].x) * _3552))) + (_viewProjRelative[2].w);
        float _3615 = mad((_viewProjRelative[3].z), _3554, mad((_viewProjRelative[3].y), _3553, ((_viewProjRelative[3].x) * _3552))) + (_viewProjRelative[3].w);
        float _3619 = (_3579 * _3295) + _3552;
        float _3620 = (_3579 * _3299) + _3553;
        float _3621 = (_3579 * _3303) + _3554;
        float _3637 = mad((_viewProjRelative[3].z), _3621, mad((_viewProjRelative[3].y), _3620, ((_viewProjRelative[3].x) * _3619))) + (_viewProjRelative[3].w);
        float _3638 = (mad((_viewProjRelative[0].z), _3554, mad((_viewProjRelative[0].y), _3553, ((_viewProjRelative[0].x) * _3552))) + (_viewProjRelative[0].w)) / _3615;
        float _3639 = (mad((_viewProjRelative[1].z), _3554, mad((_viewProjRelative[1].y), _3553, ((_viewProjRelative[1].x) * _3552))) + (_viewProjRelative[1].w)) / _3615;
        float _3640 = _3611 / _3615;
        float _3644 = ((mad((_viewProjRelative[0].z), _3621, mad((_viewProjRelative[0].y), _3620, ((_viewProjRelative[0].x) * _3619))) + (_viewProjRelative[0].w)) / _3637) - _3638;
        float _3645 = ((mad((_viewProjRelative[1].z), _3621, mad((_viewProjRelative[1].y), _3620, ((_viewProjRelative[1].x) * _3619))) + (_viewProjRelative[1].w)) / _3637) - _3639;
        float _3648 = 1.0f / float((uint)(uint)(_3304));
        float _3659 = max(_3648, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_3644)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_3645))) * _3648))));
        float _3660 = _3659 * (((mad((_viewProjRelative[2].z), _3621, mad((_viewProjRelative[2].y), _3620, ((_viewProjRelative[2].x) * _3619))) + (_viewProjRelative[2].w)) / _3637) - _3640);
        float _3678 = (max(abs(_3660), (_3640 - ((mad((_proj[2].z), _115, 0.0f) + _3611) / (mad((_proj[3].z), _115, 0.0f) + _3615)))) * _3310) * max(0.0625f, _3648);
        float _3679 = _3659 * _3648;
        float _3681 = (_3644 * 0.5f) * _3679;
        float _3683 = (_3645 * -0.5f) * _3679;
        float _3684 = _3660 * _3648;
        float _3691 = max(_3515, (1.0f / max((abs(_3681) * _bufferSizeAndInvSize.x), (abs(_3683) * _bufferSizeAndInvSize.y))));
        float _3698 = 0.5f / _bufferSizeAndInvSize.x;
        _3700 = 0;
        _3701 = (((_3638 * 0.5f) + 0.5f) + (_3691 * _3681));
        _3702 = ((0.5f - (_3639 * 0.5f)) + (_3691 * _3683));
        _3703 = ((_3691 * _3684) + _3640);
        _3704 = _3515;
        _3705 = _3330;
        _3706 = 0;
        _3707 = 1.0f;
        _3708 = 0.0f;
        while(true) {
          uint _3717 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_3701, _3698), (1.0f - _3698)) * _bufferSizeAndInvSize.x), int(_3702 * _bufferSizeAndInvSize.y), 0));
          int _3719 = (uint)((uint)(_3717.x)) >> 24;
          float _3722 = float((uint)((uint)(_3717.x & 16777215))) * 5.960465188081798e-08f;
          int _3723 = _3719 & 127;
          bool _3724 = (_3706 == 0);
          float _3725 = select(_3724, 1.0f, _3705);
          float _3729 = _nearFarProj.x / max(1.0000000116860974e-07f, _3722);
          float _3730 = _3703 - _3722;
          float _3733 = _3729 - (_nearFarProj.x / max(1.0000000116860974e-07f, _3703));
          bool _3736 = (abs(_3730 + _3678) < _3678);
          int _3737 = (int)(uint)((int)(_3736));
          if (_3736) {
            if (((_3723 == 7)) || ((((_3723 == 54)) || (((((_3719 & 126) == 66)) || (((((uint)(_3723 + -5) < (uint)2)) || ((((_3723 == 107)) || ((((_3723 == 26)) || (((((uint)(_3723 + -27) < (uint)2)) || ((((_3723 == 106)) || (((((_3719 & 125) == 105)) || ((((_3723 == 18)) || (((uint)(_3723 + -19) < (uint)2))))))))))))))))))))) {
              _3771 = true;
              _3778 = ((int)(uint)((int)(((_3733 < 0.0f)) && ((_3733 > select(_3771, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_3723 + -53) < (uint)14) {
                _3771 = (_3729 < 32.0f);
                _3778 = ((int)(uint)((int)(((_3733 < 0.0f)) && ((_3733 > select(_3771, -0.07999999821186066f, -1.0f))))));
              } else {
                _3778 = _3737;
              }
            }
          } else {
            _3778 = _3737;
          }
          if (!(_3778 == 0)) {
            if ((uint)_3723 > (uint)11) {
              if (!((uint)_3723 < (uint)18)) {
                if (!(((_3723 == 18)) || ((((_3723 == 107)) || (((uint)(_3723 + -19) < (uint)2)))))) {
                  if (!(_3723 == 66)) {
                    _3797 = 0.0f;
                  } else {
                    _3797 = 0.10000000149011612f;
                  }
                } else {
                  _3797 = 0.15000000596046448f;
                }
              } else {
                _3797 = 0.10000000149011612f;
              }
            } else {
              if (!(_3723 == 11)) {
                _3797 = 0.0f;
              } else {
                _3797 = 0.10000000149011612f;
              }
            }
            float _3799 = saturate(_3729 * 0.015625f);
            float _3802 = (1.0f - _3799) + (_3799 * _3797);
            _3812 = _3723;
            float _microNearAccum = saturate(1.0f - ((_3802 * _3802) * _3797)) * (1.0f - _3708);
            _3813 = saturate((_microNearAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _3708);
          } else {
            _3812 = _3700;
            _3813 = _3708;
          }
          [branch]
          if (_3813 > 0.949999988079071f) {
            if (!_3724) {
              _3844 = (saturate(_3707 / (_3707 - _3730)) - min(_3704, _3725));
            } else {
              _3844 = 0.0f;
            }
            _4130 = _3723;
            _4131 = _3813;
            _4132 = ((_3844 * _3681) + _3701);
            _4133 = ((_3844 * _3683) + _3702);
            _4134 = ((_3844 * _3684) + _3703);
            _4135 = _3722;
          } else {
            if ((uint)_3706 < (uint)(_3304 + -1)) {
              _3836 = ((_3725 * _3681) + _3701);
              _3837 = ((_3725 * _3683) + _3702);
              _3838 = ((_3725 * _3684) + _3703);
              _3839 = (_3725 + _3704);
              _3840 = min(abs(_3684), _3730);
            } else {
              _3836 = _3701;
              _3837 = _3702;
              _3838 = _3703;
              _3839 = _3704;
              _3840 = _3707;
            }
            if ((uint)(_3706 + 1) < (uint)_3304) {
              _3700 = _3812;
              _3701 = _3836;
              _3702 = _3837;
              _3703 = _3838;
              _3704 = _3839;
              _3705 = _3725;
              _3706 = (_3706 + 1);
              _3707 = _3840;
              _3708 = _3813;
              continue;
            } else {
              _4130 = _3812;
              _4131 = _3813;
              _4132 = _3701;
              _4133 = _3702;
              _4134 = _3703;
              _4135 = _3722;
            }
          }
          break;
        }
      } else {
        float _3854 = select(_3575, ((_nearFarProj.x - _3567) / _3570), _3324);
        float _3886 = mad((_viewProjRelative[2].z), _3554, mad((_viewProjRelative[2].y), _3553, ((_viewProjRelative[2].x) * _3552))) + (_viewProjRelative[2].w);
        float _3890 = mad((_viewProjRelative[3].z), _3554, mad((_viewProjRelative[3].y), _3553, ((_viewProjRelative[3].x) * _3552))) + (_viewProjRelative[3].w);
        float _3894 = (_3854 * _3295) + _3552;
        float _3895 = (_3854 * _3299) + _3553;
        float _3896 = (_3854 * _3303) + _3554;
        float _3912 = mad((_viewProjRelative[3].z), _3896, mad((_viewProjRelative[3].y), _3895, ((_viewProjRelative[3].x) * _3894))) + (_viewProjRelative[3].w);
        float _3913 = (mad((_viewProjRelative[0].z), _3554, mad((_viewProjRelative[0].y), _3553, ((_viewProjRelative[0].x) * _3552))) + (_viewProjRelative[0].w)) / _3890;
        float _3914 = (mad((_viewProjRelative[1].z), _3554, mad((_viewProjRelative[1].y), _3553, ((_viewProjRelative[1].x) * _3552))) + (_viewProjRelative[1].w)) / _3890;
        float _3915 = _3886 / _3890;
        float _3919 = ((mad((_viewProjRelative[0].z), _3896, mad((_viewProjRelative[0].y), _3895, ((_viewProjRelative[0].x) * _3894))) + (_viewProjRelative[0].w)) / _3912) - _3913;
        float _3920 = ((mad((_viewProjRelative[1].z), _3896, mad((_viewProjRelative[1].y), _3895, ((_viewProjRelative[1].x) * _3894))) + (_viewProjRelative[1].w)) / _3912) - _3914;
        float _3923 = 1.0f / float((uint)(uint)(_3304));
        float _3934 = max(_3923, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_3919)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_3920))) * _3923))));
        float _3935 = _3934 * (((mad((_viewProjRelative[2].z), _3896, mad((_viewProjRelative[2].y), _3895, ((_viewProjRelative[2].x) * _3894))) + (_viewProjRelative[2].w)) / _3912) - _3915);
        float _3954 = ((_3310 * 0.5f) * max(abs(_3935), (_3915 - ((mad((_proj[2].z), _115, 0.0f) + _3886) / (mad((_proj[3].z), _115, 0.0f) + _3890))))) * max(0.0625f, _3923);
        float _3955 = _3934 * _3923;
        float _3957 = (_3919 * 0.5f) * _3955;
        float _3959 = (_3920 * -0.5f) * _3955;
        float _3960 = _3935 * _3923;
        float _3967 = max(_3515, (1.0f / max((abs(_3957) * _bufferSizeAndInvSize.x), (abs(_3959) * _bufferSizeAndInvSize.y))));
        float _3974 = 0.5f / _bufferSizeAndInvSize.x;
        _3976 = 0;
        _3977 = _3330;
        _3978 = _3515;
        _3979 = (((_3913 * 0.5f) + 0.5f) + (_3967 * _3957));
        _3980 = ((0.5f - (_3914 * 0.5f)) + (_3967 * _3959));
        _3981 = ((_3967 * _3960) + _3915);
        _3982 = 0;
        _3983 = 1.0f;
        _3984 = 0.0f;
        while(true) {
          uint _3993 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_3979, _3974), (1.0f - _3974)) * _bufferSizeAndInvSize.x), int(_3980 * _bufferSizeAndInvSize.y), 0));
          int _3995 = (uint)((uint)(_3993.x)) >> 24;
          float _3998 = float((uint)((uint)(_3993.x & 16777215))) * 5.960465188081798e-08f;
          int _3999 = _3995 & 127;
          bool _4000 = (_3976 == 0);
          float _4001 = select(_4000, 1.0f, _3977);
          float _4002 = _3981 - _3998;
          float _4006 = _nearFarProj.x / max(1.0000000116860974e-07f, _3998);
          float _4009 = _4006 - (_nearFarProj.x / max(1.0000000116860974e-07f, _3981));
          bool _4012 = (abs(_4002 + _3954) < _3954);
          int _4013 = (int)(uint)((int)(_4012));
          if (_4012) {
            if (((_3999 == 7)) || ((((_3999 == 54)) || (((((_3995 & 126) == 66)) || (((((uint)(_3999 + -5) < (uint)2)) || ((((_3999 == 107)) || ((((_3999 == 26)) || (((((uint)(_3999 + -27) < (uint)2)) || ((((_3999 == 106)) || (((((_3995 & 125) == 105)) || ((((_3999 == 18)) || (((uint)(_3999 + -19) < (uint)2))))))))))))))))))))) {
              _4047 = true;
              _4054 = ((int)(uint)((int)(((_4009 < 0.0f)) && ((_4009 > select(_4047, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_3999 + -53) < (uint)14) {
                _4047 = (_4006 < 32.0f);
                _4054 = ((int)(uint)((int)(((_4009 < 0.0f)) && ((_4009 > select(_4047, -0.07999999821186066f, -1.0f))))));
              } else {
                _4054 = _4013;
              }
            }
          } else {
            _4054 = _4013;
          }
          if (!(_4054 == 0)) {
            if ((uint)_3999 > (uint)11) {
              if (!((uint)_3999 < (uint)18)) {
                if (!(((_3999 == 18)) || ((((_3999 == 107)) || (((uint)(_3999 + -19) < (uint)2)))))) {
                  if (!(_3999 == 66)) {
                    _4073 = 0.0f;
                  } else {
                    _4073 = 0.10000000149011612f;
                  }
                } else {
                  _4073 = 0.15000000596046448f;
                }
              } else {
                _4073 = 0.10000000149011612f;
              }
            } else {
              if (!(_3999 == 11)) {
                _4073 = 0.0f;
              } else {
                _4073 = 0.10000000149011612f;
              }
            }
            float _4075 = saturate(_4006 * 0.015625f);
            float _4078 = (1.0f - _4075) + (_4075 * _4073);
            _4088 = _3999;
            float _microFarAccum = saturate(1.0f - ((_4078 * _4078) * _4073)) * (1.0f - _3984);
            _4089 = saturate((_microFarAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _3984);
          } else {
            _4088 = _3982;
            _4089 = _3984;
          }
          [branch]
          if (_4089 > 0.949999988079071f) {
            if (!_4000) {
              _4120 = (saturate(_3983 / (_3983 - _4002)) - min(_3978, _4001));
            } else {
              _4120 = 0.0f;
            }
            _4130 = _3999;
            _4131 = _4089;
            _4132 = ((_4120 * _3957) + _3979);
            _4133 = ((_4120 * _3959) + _3980);
            _4134 = ((_4120 * _3960) + _3981);
            _4135 = _3998;
          } else {
            if ((uint)_3976 < (uint)(_3304 + -1)) {
              _4112 = (_3978 + _4001);
              _4113 = (_3979 + (_4001 * _3957));
              _4114 = (_3980 + (_4001 * _3959));
              _4115 = (_3981 + (_4001 * _3960));
              _4116 = min(abs(_3960), _4002);
            } else {
              _4112 = _3978;
              _4113 = _3979;
              _4114 = _3980;
              _4115 = _3981;
              _4116 = _3983;
            }
            if ((uint)(_3976 + 1) < (uint)_3304) {
              _3976 = (_3976 + 1);
              _3977 = _4001;
              _3978 = _4112;
              _3979 = _4113;
              _3980 = _4114;
              _3981 = _4115;
              _3982 = _4088;
              _3983 = _4116;
              _3984 = _4089;
              continue;
            } else {
              _4130 = _4088;
              _4131 = _4089;
              _4132 = 0.0f;
              _4133 = 0.0f;
              _4134 = -1.0f;
              _4135 = 0.0f;
            }
          }
          break;
        }
      }
      bool _4139 = (_4131 > 0.0f);
      if (_4134 > 0.0f) {
        if ((_4139) || ((((((_4132 >= 0.0f)) && ((_4132 <= 1.0f)))) && ((((_4133 >= 0.0f)) && ((_4133 <= 1.0f))))))) {
          float _4153 = (_4132 * 2.0f) + -1.0f;
          float _4154 = 1.0f - (_4133 * 2.0f);
          float _4190 = mad((_invViewProjRelative[3].z), _4134, mad((_invViewProjRelative[3].y), _4154, ((_invViewProjRelative[3].x) * _4153))) + (_invViewProjRelative[3].w);
          if (!(_4130 == 2)) {
            if (_4130 == 3) {
              _4216 = 0.0f;
              _4218 = _4216;
            } else {
              if (_4130 == 21) {
                if (!(_80 == 21)) {
                  _4216 = 0.0f;
                  _4218 = _4216;
                } else {
                  _4218 = 20.0f;
                }
              } else {
                bool _4209 = (_4130 == 22);
                if (!(((_80 == 22)) && (_4209))) {
                  _4216 = select(_4209, 0.0f, 1.0f);
                  _4218 = _4216;
                } else {
                  _4218 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _4216 = 0.0f;
              _4218 = _4216;
            } else {
              _4218 = 20.0f;
            }
          }
          if (!((_170) || ((!(_4131 == 1.0f))))) {
            _4242 = saturate(((((_3324 * 0.9375f) - max(0.0f, dot(float3(_3295, _3299, _3303), float3((((mad((_invViewProjRelative[0].z), _4134, mad((_invViewProjRelative[0].y), _4154, ((_invViewProjRelative[0].x) * _4153))) + (_invViewProjRelative[0].w)) / _4190) - _3552), (((mad((_invViewProjRelative[1].z), _4134, mad((_invViewProjRelative[1].y), _4154, ((_invViewProjRelative[1].x) * _4153))) + (_invViewProjRelative[1].w)) / _4190) - _3553), (((mad((_invViewProjRelative[2].z), _4134, mad((_invViewProjRelative[2].y), _4154, ((_invViewProjRelative[2].x) * _4153))) + (_invViewProjRelative[2].w)) / _4190) - _3554))))) * ((_115 * 0.015625f) + 1.5f)) / _3324) * 0.9375f);
          } else {
            _4242 = _4131;
          }
          float _4243 = _4242 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_4218 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _4135)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _4134)))))) * 1.4426950216293335f));
          int _4244 = _4130 & -2;
          if (!(_4244 == 6)) {
            bool __defer_4246_4256 = false;
            if ((((_80 == 33) && (_4130 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_4130 == 55)))))) {
              _4321 = (_4243 * 0.009999999776482582f);
            } else {
              __defer_4246_4256 = true;
            }
            if (__defer_4246_4256) {
              if (!(((_4130 == 54)) || ((_4244 == 66))) || ((((_4130 == 54)) || ((_4244 == 66))) && (!(((_3188 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_4130) + (uint)(-53))) < (uint)15) {
                    _4318 = saturate(_115 * 0.03125f);
                  } else {
                    _4318 = 1.0f;
                  }
                  _4321 = (_4318 * _4243);
                } else {
                  _4321 = _4243;
                }
              } else {
                uint4 _4273 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _4132), int(_bufferSizeAndInvSize.y * _4133), 0));
                float _4279 = float((uint)((uint)(((uint)((uint)(_4273.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _4282 = float((uint)((uint)(_4273.x & 255))) * 0.003921568859368563f;
                float _4286 = float((uint)((uint)(((uint)((uint)(_4273.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _4287 = _4279 * _4279;
                float _4288 = _4282 * _4282;
                float _4289 = _4286 * _4286;
                _4321 = (saturate(1.0f - (dot(float3((((_4287 * 0.6131200194358826f) + (_4288 * 0.3395099937915802f)) + (_4289 * 0.047370001673698425f)), (((_4287 * 0.07020000368356705f) + (_4288 * 0.9163600206375122f)) + (_4289 * 0.013450000435113907f)), (((_4287 * 0.02061999961733818f) + (_4288 * 0.10958000272512436f)) + (_4289 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _4243);
              }
            }
          } else {
            _4321 = (_4243 * 0.009999999776482582f);
          }
        } else {
          _4321 = 0.0f;
        }
      } else {
        if (_4139) {
          float _4153 = (_4132 * 2.0f) + -1.0f;
          float _4154 = 1.0f - (_4133 * 2.0f);
          float _4190 = mad((_invViewProjRelative[3].z), _4134, mad((_invViewProjRelative[3].y), _4154, ((_invViewProjRelative[3].x) * _4153))) + (_invViewProjRelative[3].w);
          if (!(_4130 == 2)) {
            if (_4130 == 3) {
              _4216 = 0.0f;
              _4218 = _4216;
            } else {
              if (_4130 == 21) {
                if (!(_80 == 21)) {
                  _4216 = 0.0f;
                  _4218 = _4216;
                } else {
                  _4218 = 20.0f;
                }
              } else {
                bool _4209 = (_4130 == 22);
                if (!(((_80 == 22)) && (_4209))) {
                  _4216 = select(_4209, 0.0f, 1.0f);
                  _4218 = _4216;
                } else {
                  _4218 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _4216 = 0.0f;
              _4218 = _4216;
            } else {
              _4218 = 20.0f;
            }
          }
          if (!((_170) || ((!(_4131 == 1.0f))))) {
            _4242 = saturate(((((_3324 * 0.9375f) - max(0.0f, dot(float3(_3295, _3299, _3303), float3((((mad((_invViewProjRelative[0].z), _4134, mad((_invViewProjRelative[0].y), _4154, ((_invViewProjRelative[0].x) * _4153))) + (_invViewProjRelative[0].w)) / _4190) - _3552), (((mad((_invViewProjRelative[1].z), _4134, mad((_invViewProjRelative[1].y), _4154, ((_invViewProjRelative[1].x) * _4153))) + (_invViewProjRelative[1].w)) / _4190) - _3553), (((mad((_invViewProjRelative[2].z), _4134, mad((_invViewProjRelative[2].y), _4154, ((_invViewProjRelative[2].x) * _4153))) + (_invViewProjRelative[2].w)) / _4190) - _3554))))) * ((_115 * 0.015625f) + 1.5f)) / _3324) * 0.9375f);
          } else {
            _4242 = _4131;
          }
          float _4243 = _4242 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_4218 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _4135)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _4134)))))) * 1.4426950216293335f));
          int _4244 = _4130 & -2;
          if (!(_4244 == 6)) {
            bool __defer_4246_4256 = false;
            if ((((_80 == 33) && (_4130 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_4130 == 55)))))) {
              _4321 = (_4243 * 0.009999999776482582f);
            } else {
              __defer_4246_4256 = true;
            }
            if (__defer_4246_4256) {
              if (!(((_4130 == 54)) || ((_4244 == 66))) || ((((_4130 == 54)) || ((_4244 == 66))) && (!(((_3188 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_4130) + (uint)(-53))) < (uint)15) {
                    _4318 = saturate(_115 * 0.03125f);
                  } else {
                    _4318 = 1.0f;
                  }
                  _4321 = (_4318 * _4243);
                } else {
                  _4321 = _4243;
                }
              } else {
                uint4 _4273 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _4132), int(_bufferSizeAndInvSize.y * _4133), 0));
                float _4279 = float((uint)((uint)(((uint)((uint)(_4273.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _4282 = float((uint)((uint)(_4273.x & 255))) * 0.003921568859368563f;
                float _4286 = float((uint)((uint)(((uint)((uint)(_4273.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _4287 = _4279 * _4279;
                float _4288 = _4282 * _4282;
                float _4289 = _4286 * _4286;
                _4321 = (saturate(1.0f - (dot(float3((((_4287 * 0.6131200194358826f) + (_4288 * 0.3395099937915802f)) + (_4289 * 0.047370001673698425f)), (((_4287 * 0.07020000368356705f) + (_4288 * 0.9163600206375122f)) + (_4289 * 0.013450000435113907f)), (((_4287 * 0.02061999961733818f) + (_4288 * 0.10958000272512436f)) + (_4289 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _4243);
              }
            }
          } else {
            _4321 = (_4243 * 0.009999999776482582f);
          }
        } else {
          _4321 = 0.0f;
        }
      }
      _4325 = saturate(1.0f - _4321);
    } else {
      _4325 = 1.0f;
    }
    #define MICRO_PIXEL_X_FLOAT   _60
    #define MICRO_PIXEL_Y_FLOAT   _61
    #define MICRO_LINEAR_DEPTH    _115
    #define MICRO_CONTACT_SHADOW  _4325
    #define MICRO_STENCIL         _80
    #define MICRO_LIGHT_DIR_X     _3208
    #define MICRO_LIGHT_DIR_Y     _3209
    #define MICRO_LIGHT_DIR_Z     _3210
    #define MICRO_WORLD_POS_X     _3538
    #define MICRO_WORLD_POS_Y     _3539
    #define MICRO_WORLD_POS_Z     _3540
    #define CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE CONTACT_MICRO_DETAIL_STRENGTH_RT
    #define CONTACT_MICRO_DISTANCE_FADE_ACTIVE CONTACT_MICRO_DISTANCE_FADE_RT
    #define CONTACT_MICRO_RANGE_NEAR_ACTIVE CONTACT_MICRO_RANGE_NEAR_RT
    #define CONTACT_MICRO_RANGE_FAR_ACTIVE CONTACT_MICRO_RANGE_FAR_RT
    #define CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE CONTACT_MICRO_THICKNESS_MULTIPLIER_RT
    #define CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE CONTACT_MICRO_OCCLUSION_SCALE_RT
    #include "micro_detail_shadows.hlsli"
    #undef CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE
    #undef CONTACT_MICRO_DISTANCE_FADE_ACTIVE
    #undef CONTACT_MICRO_RANGE_NEAR_ACTIVE
    #undef CONTACT_MICRO_RANGE_FAR_ACTIVE
    #undef CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE
    #undef CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE
    #undef MICRO_PIXEL_X_FLOAT
    #undef MICRO_PIXEL_Y_FLOAT
    #undef MICRO_LINEAR_DEPTH
    #undef MICRO_CONTACT_SHADOW
    #undef MICRO_STENCIL
    #undef MICRO_LIGHT_DIR_X
    #undef MICRO_LIGHT_DIR_Y
    #undef MICRO_LIGHT_DIR_Z
    #undef MICRO_WORLD_POS_X
    #undef MICRO_WORLD_POS_Y
    #undef MICRO_WORLD_POS_Z
    if (CONTACT_SHADOW_RT_TUNING > 0.f && _4325 < 1.0f) {
      _4325 = saturate(1.0f - ((1.0f - _4325) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
    }
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _4325 < 1.0f) {
      float2 _screenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_61 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _4325 = lerp(lerp(1.0f, _4325, 0.5f), _4325, _edgeFade);
    }
    float _4326 = min(_3178, _4325);
    _4340 = float(half(_4326 * float(_3154)));
    _4341 = float(half(_4326 * float(_3155)));
    _4342 = float(half(_4326 * float(_3156)));
    _4343 = saturate((1.0f - _556) + (exp2(log2(saturate(select(_172, (_3163 + 0.9800000190734863f), _3163))) * 0.45454543828964233f) * _556));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)))] = half4(half(_4340), half(_4341), half(_4342), half(_4343));
}
