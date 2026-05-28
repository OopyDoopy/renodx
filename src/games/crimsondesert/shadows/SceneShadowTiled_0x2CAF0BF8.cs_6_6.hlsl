#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t35, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<uint2> __3__36__0__0__g_dynamicShadowStencilArray : register(t231, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<float> __3__36__0__0__g_raytracedShadow : register(t118, space36);

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
  float _69 = ((_bufferSizeAndInvSize.z * 2.0f) * (_60 + 0.5f)) + -1.0f;
  float _72 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_61 + 0.5f));
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
  int _2926;
  float _3029;
  float _3030;
  half _3031;
  half _3032;
  half _3033;
  float _3085;
  float _3086;
  float _3087;
  float _3185;
  float _3199;
  int _3236;
  float _3242;
  float _3255;
  float _3268;
  float _3278;
  float _3279;
  float _3280;
  float _3289;
  float _3290;
  float _3291;
  int _3438;
  float _3439;
  float _3440;
  float _3441;
  float _3442;
  float _3443;
  int _3444;
  float _3445;
  float _3446;
  bool _3509;
  int _3516;
  float _3535;
  float _3551;
  int _3558;
  float _3559;
  float _3582;
  float _3583;
  float _3584;
  float _3585;
  float _3586;
  float _3590;
  int _3722;
  float _3723;
  float _3724;
  float _3725;
  float _3726;
  float _3727;
  int _3728;
  float _3729;
  float _3730;
  bool _3793;
  int _3800;
  float _3819;
  float _3835;
  int _3842;
  float _3843;
  float _3866;
  float _3867;
  float _3868;
  float _3869;
  float _3870;
  float _3874;
  int _3884;
  float _3885;
  float _3886;
  float _3887;
  float _3888;
  float _3889;
  float _3950;
  float _3952;
  float _3976;
  float _4049;
  float _4052;
  float _4056;
  float _4071;
  float _4072;
  float _4073;
  float _4074;
  if (((_79 < 1.0000000116860974e-07f)) || (_107)) {
    float _110 = select(_107, 0.0f, 1.0f);
    _4071 = _110;
    _4072 = _110;
    _4073 = _110;
    _4074 = _110;
  } else {
    float _114 = max(1.0000000116860974e-07f, _79);
    float _115 = _nearFarProj.x / _114;
    float _151 = mad((_invViewProjRelative[3].z), _114, mad((_invViewProjRelative[3].y), _72, ((_invViewProjRelative[3].x) * _69))) + (_invViewProjRelative[3].w);
    float _152 = (mad((_invViewProjRelative[0].z), _114, mad((_invViewProjRelative[0].y), _72, ((_invViewProjRelative[0].x) * _69))) + (_invViewProjRelative[0].w)) / _151;
    float _153 = (mad((_invViewProjRelative[1].z), _114, mad((_invViewProjRelative[1].y), _72, ((_invViewProjRelative[1].x) * _69))) + (_invViewProjRelative[1].w)) / _151;
    float _154 = (mad((_invViewProjRelative[2].z), _114, mad((_invViewProjRelative[2].y), _72, ((_invViewProjRelative[2].x) * _69))) + (_invViewProjRelative[2].w)) / _151;
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
      float _2913 = _26[_814];
      float _2914 = _27[_814];
      float _2915 = _28[_814];
      if (_952) {
        int _2920 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _2926 = ((int)(((uint)(_2920 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _2926 = (int)(_942);
      }
      float _2927 = _shadowSizeAndInvSize.z * 2.0f;
      float _2928 = _shadowSizeAndInvSize.w * 2.0f;
      float _2935 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _2937 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _2941 = ((float((uint)((uint)(((int)(_2926 * 48271)) & 16777215))) * _2935) - _2927) + _2913;
      float _2942 = ((float((uint)((uint)(((int)(_2926 * -1964877855)) & 16777215))) * _2937) - _2928) + _2914;
      float _2943 = float((uint)(uint)(_814));
      float4 _2946 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2941, _2942, _2943), 0.0f);
      float _2950 = _2915 - _812;
      float4 _2952 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2941, _2942, _2943), _2950);
      float _2966 = ((float((uint)((uint)(((int)(_2926 * -856141137)) & 16777215))) * _2935) - _2927) + _2913;
      float _2967 = ((float((uint)((uint)(((int)(_2926 * -613502015)) & 16777215))) * _2937) - _2928) + _2914;
      float4 _2968 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2966, _2967, _2943), 0.0f);
      float4 _2972 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2966, _2967, _2943), _2950);
      float _2988 = ((float((uint)((uint)(((int)(_2926 * -556260145)) & 16777215))) * _2935) - _2927) + _2913;
      float _2989 = ((float((uint)((uint)(((int)(_2926 * 902075297)) & 16777215))) * _2937) - _2928) + _2914;
      float4 _2990 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2988, _2989, _2943), 0.0f);
      float4 _2994 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2988, _2989, _2943), _2950);
      float _3010 = ((float((uint)((uint)(((int)(_2926 * 1698214639)) & 16777215))) * _2935) - _2927) + _2913;
      float _3011 = ((float((uint)((uint)(((int)(_2926 * 773027713)) & 16777215))) * _2937) - _2928) + _2914;
      float4 _3012 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_3010, _3011, _2943), 0.0f);
      float4 _3016 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_3010, _3011, _2943), _2950);
      float _3022 = (((saturate(1.0f - _2972.x) + saturate(1.0f - _2952.x)) + saturate(1.0f - _2994.x)) + saturate(1.0f - _3016.x)) * 0.25f;
      float _3023 = (((max(0.0f, (_2915 - _2968.x)) + max(0.0f, (_2915 - _2946.x))) + max(0.0f, (_2915 - _2990.x))) + max(0.0f, (_2915 - _3012.x))) * 0.25f;
      _3029 = saturate(_3022 * _3022);
      _3030 = saturate(_3023 * _3023);
      _3031 = 1.0h;
      _3032 = 1.0h;
      _3033 = 1.0h;
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
      float _2905 = __3__36__0__0__g_raytracedShadow.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
      _3029 = min(_556, min((_2865 * _2861), _2905.x));
      _3030 = (_2865 * _2862);
      _3031 = _2901;
      _3032 = _2902;
      _3033 = _2903;
    }
    bool _3034 = (_813 != 0);
    float _3036 = min(_556, select(_3034, _3029, 1.0f));
    float _3040 = select((_697 != 0), select(_3034, (_3030 * 400.0f), 4e+06f), 1.0f);
    float _3055 = (_3036 - (_shadowAOParams.x * _3036)) + _shadowAOParams.x;
    [branch]
    if (_3055 > 0.0f) {
      int _3065 = _76 & 126;
      bool _3066 = (_3065 == 64);
      bool _3067 = (_80 == 66);
      bool _3068 = (_3066) || (_3067);
      float _3069 = select(_3068, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _3085 = _sunDirection.x;
        _3086 = _sunDirection.y;
        _3087 = _sunDirection.z;
      } else {
        _3085 = _moonDirection.x;
        _3086 = _moonDirection.y;
        _3087 = _moonDirection.z;
      }
      int _3088 = ((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)) & 3;
      int _3092 = ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)) & 3;
      float _3109 = float((uint)(uint)(_frameNumber.x));
      float _3120 = (frac(((_3109 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      float _3121 = (frac(((_3109 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      float _3126 = frac(dot(float3((_3120 * _3120), (_3121 * _3121), (_3121 * _3120)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      float _3142 = frac((float((uint)((uint)((int)(uint(_3126 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)((uint)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) >> 2) & 858993459))) >> 1) & 21)))) * 0.03125f)) * 6.2831854820251465f;
      float _3146 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * float((uint)((uint)(reversebits((float)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_3092 << 1) | _3092) << 1) & 10) | (((_3088 << 1) | _3088) & 5)))) >> 2) & 858993459))) >> 1) & 21))) ^ (int)(uint(_3126 * 287478368.0f)))))) + _shadowAOParams.z;
      float _3149 = sqrt(1.0f - (_3146 * _3146));
      float _3152 = cos(_3142) * _3149;
      float _3153 = sin(_3142) * _3149;
      float _3155 = select((_3087 >= 0.0f), 1.0f, -1.0f);
      float _3158 = -0.0f - (1.0f / (_3155 + _3087));
      float _3159 = _3086 * _3158;
      float _3160 = _3159 * _3085;
      float _3161 = _3155 * _3085;
      float _3170 = mad(_3146, _3085, mad(_3153, _3160, ((((_3161 * _3085) * _3158) + 1.0f) * _3152)));
      float _3174 = mad(_3146, _3086, mad(_3153, (_3155 + (_3159 * _3086)), ((_3152 * _3155) * _3160)));
      float _3178 = mad(_3146, _3087, mad(_3153, (-0.0f - _3086), (-0.0f - (_3161 * _3152))));
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _3170 = _3085;
        _3174 = _3086;
        _3178 = _3087;
      }
      int _3179 = select(_3066, 10, 8);
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _3179 = (int)(lerp(float(_3179), CONTACT_SHADOW_RT_MARCH_SAMPLES, CONTACT_SHADOW_RT_TUNING) + 0.5f);
      }
      if (!_170) {
        _3185 = min(0.5f, ((_115 * 0.0024999999441206455f) + 0.25f));
      } else {
        _3185 = 1.0f;
      }
      float _3191 = ((abs(_3086) * (select(_3068, 12.0f, 2.0f) - _3069)) + _3069) * select(_172, lerp(0.009999999776482582f, CONTACT_SHADOW_RT_REACH_TARGET, CONTACT_SHADOW_RT_TUNING), 0.10000000149011612f);
      if (!_172) {
        _3199 = max((_115 * select(((uint)(_80 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _3191);
      } else {
        _3199 = _3191;
      }
      float _3205 = saturate(((_115 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_103, _104, _105), float3((-0.0f - (_152 * _156)), (-0.0f - (_153 * _156)), (-0.0f - (_154 * _156))))))) + 0.009999999776482582f);
      bool _3212 = (_terrainNormalParams.z > 0.0f);
      if (_3212) {
        float _3216 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _3242 = frac(frac(dot(float2(((_3216 * 32.665000915527344f) + _60), ((_3216 * 11.8149995803833f) + _61)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        if (_952) {
          int _3230 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
          _3236 = ((int)(((uint)(_3230 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
        } else {
          _3236 = (int)(_942);
        }
        _3242 = (float((uint)((uint)(((int)(_3236 * 48271)) & 16777215))) * 5.960464477539063e-08f);
      }
      if ((_3067) || ((((_80 != 15)) && (((uint)(_80 + -12) < (uint)7))))) {
        _3255 = (_3242 * lerp(10.0f, CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING));
      } else {
        if (_80 == 15) {
          _3255 = ((lerp((10.0f - (saturate(_115 * 0.0010000000474974513f) * 9.0f)), CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING)) * _3242);
        } else {
          _3255 = _3242;
        }
      }
      if (_3065 == 12) {
        _3268 = (0.10000000149011612f - (abs(_3174) * 0.05000000074505806f));
      } else {
        if ((uint)_80 > (uint)15) {
          if ((((uint)_80 < (uint)20)) || ((_80 == 107))) {
            _3268 = (0.10000000149011612f - (abs(_3174) * 0.05000000074505806f));
          } else {
            _3268 = 0.0f;
          }
        } else {
          _3268 = 0.0f;
        }
      }
      if (!_172) {
        float _3270 = _3268 * _156;
        _3278 = (_152 - (_3270 * _152));
        _3279 = (_153 - (_3270 * _153));
        _3280 = (_154 - (_3270 * _154));
      } else {
        _3278 = _152;
        _3279 = _153;
        _3280 = _154;
      }
      if (!_3212) {
        float _3284 = saturate(_115 * 0.0625f) * 0.05000000074505806f;
        _3289 = (_3284 * _103);
        _3290 = (_3284 * _104);
        _3291 = (_3284 * _105);
      } else {
        _3289 = 0.0f;
        _3290 = 0.0f;
        _3291 = 0.0f;
      }
      float _3292 = _3289 + _3278;
      float _3293 = _3290 + _3279;
      float _3294 = _3291 + _3280;
      float _3307 = mad((_viewRelative[2].z), _3294, mad((_viewRelative[2].y), _3293, ((_viewRelative[2].x) * _3292))) + (_viewRelative[2].w);
      float _3310 = mad((_viewRelative[2].z), _3178, mad((_viewRelative[2].y), _3174, ((_viewRelative[2].x) * _3170)));
      bool _3313 = (((_3310 * _3199) + _3307) < _nearFarProj.x);
      if (_115 < 8.0f) {
        float _3317 = select(_3313, ((_nearFarProj.x - _3307) / _3310), _3199);
        float _3349 = mad((_viewProjRelative[2].z), _3294, mad((_viewProjRelative[2].y), _3293, ((_viewProjRelative[2].x) * _3292))) + (_viewProjRelative[2].w);
        float _3353 = mad((_viewProjRelative[3].z), _3294, mad((_viewProjRelative[3].y), _3293, ((_viewProjRelative[3].x) * _3292))) + (_viewProjRelative[3].w);
        float _3357 = (_3317 * _3170) + _3292;
        float _3358 = (_3317 * _3174) + _3293;
        float _3359 = (_3317 * _3178) + _3294;
        float _3375 = mad((_viewProjRelative[3].z), _3359, mad((_viewProjRelative[3].y), _3358, ((_viewProjRelative[3].x) * _3357))) + (_viewProjRelative[3].w);
        float _3376 = (mad((_viewProjRelative[0].z), _3294, mad((_viewProjRelative[0].y), _3293, ((_viewProjRelative[0].x) * _3292))) + (_viewProjRelative[0].w)) / _3353;
        float _3377 = (mad((_viewProjRelative[1].z), _3294, mad((_viewProjRelative[1].y), _3293, ((_viewProjRelative[1].x) * _3292))) + (_viewProjRelative[1].w)) / _3353;
        float _3378 = _3349 / _3353;
        float _3382 = ((mad((_viewProjRelative[0].z), _3359, mad((_viewProjRelative[0].y), _3358, ((_viewProjRelative[0].x) * _3357))) + (_viewProjRelative[0].w)) / _3375) - _3376;
        float _3383 = ((mad((_viewProjRelative[1].z), _3359, mad((_viewProjRelative[1].y), _3358, ((_viewProjRelative[1].x) * _3357))) + (_viewProjRelative[1].w)) / _3375) - _3377;
        float _3386 = 1.0f / float((uint)(uint)(_3179));
        float _3397 = max(_3386, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_3382)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_3383))) * _3386))));
        float _3398 = _3397 * (((mad((_viewProjRelative[2].z), _3359, mad((_viewProjRelative[2].y), _3358, ((_viewProjRelative[2].x) * _3357))) + (_viewProjRelative[2].w)) / _3375) - _3378);
        float _3416 = (max(abs(_3398), (_3378 - ((mad((_proj[2].z), _115, 0.0f) + _3349) / (mad((_proj[3].z), _115, 0.0f) + _3353)))) * _3185) * max(0.0625f, _3386);
        float _3417 = _3397 * _3386;
        float _3419 = (_3382 * 0.5f) * _3417;
        float _3421 = (_3383 * -0.5f) * _3417;
        float _3422 = _3398 * _3386;
        float _3429 = max(_3255, (1.0f / max((abs(_3419) * _bufferSizeAndInvSize.x), (abs(_3421) * _bufferSizeAndInvSize.y))));
        float _3436 = 0.5f / _bufferSizeAndInvSize.x;
        _3438 = 0;
        _3439 = (((_3376 * 0.5f) + 0.5f) + (_3429 * _3419));
        _3440 = ((0.5f - (_3377 * 0.5f)) + (_3429 * _3421));
        _3441 = ((_3429 * _3422) + _3378);
        _3442 = _3255;
        _3443 = _3205;
        _3444 = 0;
        _3445 = 1.0f;
        _3446 = 0.0f;
        while(true) {
          uint _3455 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_3439, _3436), (1.0f - _3436)) * _bufferSizeAndInvSize.x), int(_3440 * _bufferSizeAndInvSize.y), 0));
          int _3457 = (uint)((uint)(_3455.x)) >> 24;
          float _3460 = float((uint)((uint)(_3455.x & 16777215))) * 5.960465188081798e-08f;
          int _3461 = _3457 & 127;
          bool _3462 = (_3444 == 0);
          float _3463 = select(_3462, 1.0f, _3443);
          float _3467 = _nearFarProj.x / max(1.0000000116860974e-07f, _3460);
          float _3468 = _3441 - _3460;
          float _3471 = _3467 - (_nearFarProj.x / max(1.0000000116860974e-07f, _3441));
          bool _3474 = (abs(_3468 + _3416) < _3416);
          int _3475 = (int)(uint)((int)(_3474));
          if (_3474) {
            if (((_3461 == 7)) || ((((_3461 == 54)) || (((((_3457 & 126) == 66)) || (((((uint)(_3461 + -5) < (uint)2)) || ((((_3461 == 107)) || ((((_3461 == 26)) || (((((uint)(_3461 + -27) < (uint)2)) || ((((_3461 == 106)) || (((((_3457 & 125) == 105)) || ((((_3461 == 18)) || (((uint)(_3461 + -19) < (uint)2))))))))))))))))))))) {
              _3509 = true;
              _3516 = ((int)(uint)((int)(((_3471 < 0.0f)) && ((_3471 > select(_3509, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_3461 + -53) < (uint)14) {
                _3509 = (_3467 < 32.0f);
                _3516 = ((int)(uint)((int)(((_3471 < 0.0f)) && ((_3471 > select(_3509, -0.07999999821186066f, -1.0f))))));
              } else {
                _3516 = _3475;
              }
            }
          } else {
            _3516 = _3475;
          }
          if (!(_3516 == 0)) {
            if ((uint)_3461 > (uint)11) {
              if (!((uint)_3461 < (uint)18)) {
                if (!(((_3461 == 18)) || ((((_3461 == 107)) || (((uint)(_3461 + -19) < (uint)2)))))) {
                  if (!(_3461 == 66)) {
                    _3535 = 0.0f;
                  } else {
                    _3535 = 0.10000000149011612f;
                  }
                } else {
                  _3535 = 0.15000000596046448f;
                }
              } else {
                _3535 = 0.10000000149011612f;
              }
            } else {
              if (!(_3461 == 11)) {
                _3535 = 0.0f;
              } else {
                _3535 = 0.10000000149011612f;
              }
            }
            float _3537 = saturate(_3467 * 0.015625f);
            float _3540 = (1.0f - _3537) + (_3537 * _3535);
            if (_172) {
              _3551 = saturate((-0.0f - _3471) / (_3442 * 0.004654859658330679f));
            } else {
              _3551 = 1.0f;
            }
            _3558 = _3461;
            float _microNearAccum = (saturate(1.0f - ((_3540 * _3540) * _3535)) * (1.0f - _3446)) * _3551;
            _3559 = saturate((_microNearAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _3446);
          } else {
            _3558 = _3438;
            _3559 = _3446;
          }
          [branch]
          if (_3559 > 0.949999988079071f) {
            if (!_3462) {
              _3590 = (saturate(_3445 / (_3445 - _3468)) - min(_3442, _3463));
            } else {
              _3590 = 0.0f;
            }
            _3884 = _3461;
            _3885 = _3559;
            _3886 = ((_3590 * _3419) + _3439);
            _3887 = ((_3590 * _3421) + _3440);
            _3888 = ((_3590 * _3422) + _3441);
            _3889 = _3460;
          } else {
            if ((uint)_3444 < (uint)(_3179 + -1)) {
              _3582 = ((_3463 * _3419) + _3439);
              _3583 = ((_3463 * _3421) + _3440);
              _3584 = ((_3463 * _3422) + _3441);
              _3585 = (_3463 + _3442);
              _3586 = min(abs(_3422), _3468);
            } else {
              _3582 = _3439;
              _3583 = _3440;
              _3584 = _3441;
              _3585 = _3442;
              _3586 = _3445;
            }
            if ((uint)(_3444 + 1) < (uint)_3179) {
              _3438 = _3558;
              _3439 = _3582;
              _3440 = _3583;
              _3441 = _3584;
              _3442 = _3585;
              _3443 = _3463;
              _3444 = (_3444 + 1);
              _3445 = _3586;
              _3446 = _3559;
              continue;
            } else {
              _3884 = _3558;
              _3885 = _3559;
              _3886 = _3439;
              _3887 = _3440;
              _3888 = _3441;
              _3889 = _3460;
            }
          }
          break;
        }
      } else {
        float _3600 = select(_3313, ((_nearFarProj.x - _3307) / _3310), _3199);
        float _3632 = mad((_viewProjRelative[2].z), _3294, mad((_viewProjRelative[2].y), _3293, ((_viewProjRelative[2].x) * _3292))) + (_viewProjRelative[2].w);
        float _3636 = mad((_viewProjRelative[3].z), _3294, mad((_viewProjRelative[3].y), _3293, ((_viewProjRelative[3].x) * _3292))) + (_viewProjRelative[3].w);
        float _3640 = (_3600 * _3170) + _3292;
        float _3641 = (_3600 * _3174) + _3293;
        float _3642 = (_3600 * _3178) + _3294;
        float _3658 = mad((_viewProjRelative[3].z), _3642, mad((_viewProjRelative[3].y), _3641, ((_viewProjRelative[3].x) * _3640))) + (_viewProjRelative[3].w);
        float _3659 = (mad((_viewProjRelative[0].z), _3294, mad((_viewProjRelative[0].y), _3293, ((_viewProjRelative[0].x) * _3292))) + (_viewProjRelative[0].w)) / _3636;
        float _3660 = (mad((_viewProjRelative[1].z), _3294, mad((_viewProjRelative[1].y), _3293, ((_viewProjRelative[1].x) * _3292))) + (_viewProjRelative[1].w)) / _3636;
        float _3661 = _3632 / _3636;
        float _3665 = ((mad((_viewProjRelative[0].z), _3642, mad((_viewProjRelative[0].y), _3641, ((_viewProjRelative[0].x) * _3640))) + (_viewProjRelative[0].w)) / _3658) - _3659;
        float _3666 = ((mad((_viewProjRelative[1].z), _3642, mad((_viewProjRelative[1].y), _3641, ((_viewProjRelative[1].x) * _3640))) + (_viewProjRelative[1].w)) / _3658) - _3660;
        float _3669 = 1.0f / float((uint)(uint)(_3179));
        float _3680 = max(_3669, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_3665)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_3666))) * _3669))));
        float _3681 = _3680 * (((mad((_viewProjRelative[2].z), _3642, mad((_viewProjRelative[2].y), _3641, ((_viewProjRelative[2].x) * _3640))) + (_viewProjRelative[2].w)) / _3658) - _3661);
        float _3700 = ((_3185 * 0.5f) * max(abs(_3681), (_3661 - ((mad((_proj[2].z), _115, 0.0f) + _3632) / (mad((_proj[3].z), _115, 0.0f) + _3636))))) * max(0.0625f, _3669);
        float _3701 = _3680 * _3669;
        float _3703 = (_3665 * 0.5f) * _3701;
        float _3705 = (_3666 * -0.5f) * _3701;
        float _3706 = _3681 * _3669;
        float _3713 = max(_3255, (1.0f / max((abs(_3703) * _bufferSizeAndInvSize.x), (abs(_3705) * _bufferSizeAndInvSize.y))));
        float _3720 = 0.5f / _bufferSizeAndInvSize.x;
        _3722 = 0;
        _3723 = _3205;
        _3724 = _3255;
        _3725 = (((_3659 * 0.5f) + 0.5f) + (_3713 * _3703));
        _3726 = ((0.5f - (_3660 * 0.5f)) + (_3713 * _3705));
        _3727 = ((_3713 * _3706) + _3661);
        _3728 = 0;
        _3729 = 1.0f;
        _3730 = 0.0f;
        while(true) {
          uint _3739 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_3725, _3720), (1.0f - _3720)) * _bufferSizeAndInvSize.x), int(_3726 * _bufferSizeAndInvSize.y), 0));
          int _3741 = (uint)((uint)(_3739.x)) >> 24;
          float _3744 = float((uint)((uint)(_3739.x & 16777215))) * 5.960465188081798e-08f;
          int _3745 = _3741 & 127;
          bool _3746 = (_3722 == 0);
          float _3747 = select(_3746, 1.0f, _3723);
          float _3748 = _3727 - _3744;
          float _3752 = _nearFarProj.x / max(1.0000000116860974e-07f, _3744);
          float _3755 = _3752 - (_nearFarProj.x / max(1.0000000116860974e-07f, _3727));
          bool _3758 = (abs(_3748 + _3700) < _3700);
          int _3759 = (int)(uint)((int)(_3758));
          if (_3758) {
            if (((_3745 == 7)) || ((((_3745 == 54)) || (((((_3741 & 126) == 66)) || (((((uint)(_3745 + -5) < (uint)2)) || ((((_3745 == 107)) || ((((_3745 == 26)) || (((((uint)(_3745 + -27) < (uint)2)) || ((((_3745 == 106)) || (((((_3741 & 125) == 105)) || ((((_3745 == 18)) || (((uint)(_3745 + -19) < (uint)2))))))))))))))))))))) {
              _3793 = true;
              _3800 = ((int)(uint)((int)(((_3755 < 0.0f)) && ((_3755 > select(_3793, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_3745 + -53) < (uint)14) {
                _3793 = (_3752 < 32.0f);
                _3800 = ((int)(uint)((int)(((_3755 < 0.0f)) && ((_3755 > select(_3793, -0.07999999821186066f, -1.0f))))));
              } else {
                _3800 = _3759;
              }
            }
          } else {
            _3800 = _3759;
          }
          if (!(_3800 == 0)) {
            if ((uint)_3745 > (uint)11) {
              if (!((uint)_3745 < (uint)18)) {
                if (!(((_3745 == 18)) || ((((_3745 == 107)) || (((uint)(_3745 + -19) < (uint)2)))))) {
                  if (!(_3745 == 66)) {
                    _3819 = 0.0f;
                  } else {
                    _3819 = 0.10000000149011612f;
                  }
                } else {
                  _3819 = 0.15000000596046448f;
                }
              } else {
                _3819 = 0.10000000149011612f;
              }
            } else {
              if (!(_3745 == 11)) {
                _3819 = 0.0f;
              } else {
                _3819 = 0.10000000149011612f;
              }
            }
            float _3821 = saturate(_3752 * 0.015625f);
            float _3824 = (1.0f - _3821) + (_3821 * _3819);
            if (_172) {
              _3835 = saturate((-0.0f - _3755) / (_3724 * 0.004654859658330679f));
            } else {
              _3835 = 1.0f;
            }
            _3842 = _3745;
            float _microFarAccum = (saturate(1.0f - ((_3824 * _3824) * _3819)) * (1.0f - _3730)) * _3835;
            _3843 = saturate((_microFarAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _3730);
          } else {
            _3842 = _3728;
            _3843 = _3730;
          }
          [branch]
          if (_3843 > 0.949999988079071f) {
            if (!_3746) {
              _3874 = (saturate(_3729 / (_3729 - _3748)) - min(_3724, _3747));
            } else {
              _3874 = 0.0f;
            }
            _3884 = _3745;
            _3885 = _3843;
            _3886 = ((_3874 * _3703) + _3725);
            _3887 = ((_3874 * _3705) + _3726);
            _3888 = ((_3874 * _3706) + _3727);
            _3889 = _3744;
          } else {
            if ((uint)_3722 < (uint)(_3179 + -1)) {
              _3866 = (_3724 + _3747);
              _3867 = (_3725 + (_3747 * _3703));
              _3868 = (_3726 + (_3747 * _3705));
              _3869 = (_3727 + (_3747 * _3706));
              _3870 = min(abs(_3706), _3748);
            } else {
              _3866 = _3724;
              _3867 = _3725;
              _3868 = _3726;
              _3869 = _3727;
              _3870 = _3729;
            }
            if ((uint)(_3722 + 1) < (uint)_3179) {
              _3722 = (_3722 + 1);
              _3723 = _3747;
              _3724 = _3866;
              _3725 = _3867;
              _3726 = _3868;
              _3727 = _3869;
              _3728 = _3842;
              _3729 = _3870;
              _3730 = _3843;
              continue;
            } else {
              _3884 = _3842;
              _3885 = _3843;
              _3886 = 0.0f;
              _3887 = 0.0f;
              _3888 = -1.0f;
              _3889 = 0.0f;
            }
          }
          break;
        }
      }
      bool _3893 = (_3885 > 0.0f);
      if (_3888 > 0.0f) {
        if ((_3893) || ((((((_3886 >= 0.0f)) && ((_3886 <= 1.0f)))) && ((((_3887 >= 0.0f)) && ((_3887 <= 1.0f))))))) {
          float _3907 = (_3886 * 2.0f) + -1.0f;
          float _3908 = 1.0f - (_3887 * 2.0f);
          float _3924 = mad((_invViewProjRelative[3].z), _3888, mad((_invViewProjRelative[3].y), _3908, (_3907 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_3884 == 2)) {
            if (_3884 == 3) {
              _3950 = 0.0f;
              _3952 = _3950;
            } else {
              if (_3884 == 21) {
                if (!(_80 == 21)) {
                  _3950 = 0.0f;
                  _3952 = _3950;
                } else {
                  _3952 = 20.0f;
                }
              } else {
                bool _3943 = (_3884 == 22);
                if (!(((_80 == 22)) && (_3943))) {
                  _3950 = select(_3943, 0.0f, 1.0f);
                  _3952 = _3950;
                } else {
                  _3952 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _3950 = 0.0f;
              _3952 = _3950;
            } else {
              _3952 = 20.0f;
            }
          }
          if (!((_170) || ((!(_3885 == 1.0f))))) {
            _3976 = saturate(((((_3199 * 0.9375f) - max(0.0f, dot(float3(_3170, _3174, _3178), float3((((mad((_invViewProjRelative[0].z), _3888, mad((_invViewProjRelative[0].y), _3908, (_3907 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _3924) - _3292), (((mad((_invViewProjRelative[1].z), _3888, mad((_invViewProjRelative[1].y), _3908, (_3907 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _3924) - _3293), (((mad((_invViewProjRelative[2].z), _3888, mad((_invViewProjRelative[2].y), _3908, (_3907 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _3924) - _3294))))) * ((_115 * 0.015625f) + 1.5f)) / _3199) * 0.9375f);
          } else {
            _3976 = _3885;
          }
          float _3977 = _3976 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_3952 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _3889)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _3888)))))) * 1.4426950216293335f));
          int _3978 = _3884 & -2;
          if (!(_3978 == 6)) {
            bool __defer_3980_3990 = false;
            if ((((_80 == 33) && (_3884 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_3884 == 55)))))) {
              _4052 = (_3977 * 0.009999999776482582f);
            } else {
              __defer_3980_3990 = true;
            }
            if (__defer_3980_3990) {
              if (!(((_3884 == 54)) || ((_3978 == 66))) || ((((_3884 == 54)) || ((_3978 == 66))) && (!(((_3065 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_3884) + (uint)(-53))) < (uint)15) {
                    _4049 = saturate(_115 * 0.03125f);
                  } else {
                    _4049 = 1.0f;
                  }
                  _4052 = (_4049 * _3977);
                } else {
                  _4052 = _3977;
                }
              } else {
                uint4 _4004 = __3__36__0__0__g_baseColor.Load(int3(int(_3886 * _bufferSizeAndInvSize.x), int(_3887 * _bufferSizeAndInvSize.y), 0));
                float _4010 = float((uint)((uint)(((uint)((uint)(_4004.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _4013 = float((uint)((uint)(_4004.x & 255))) * 0.003921568859368563f;
                float _4017 = float((uint)((uint)(((uint)((uint)(_4004.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _4018 = _4010 * _4010;
                float _4019 = _4013 * _4013;
                float _4020 = _4017 * _4017;
                _4052 = (saturate(1.0f - (dot(float3((((_4018 * 0.6131200194358826f) + (_4019 * 0.3395099937915802f)) + (_4020 * 0.047370001673698425f)), (((_4018 * 0.07020000368356705f) + (_4019 * 0.9163600206375122f)) + (_4020 * 0.013450000435113907f)), (((_4018 * 0.02061999961733818f) + (_4019 * 0.10958000272512436f)) + (_4020 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _3977);
              }
            }
          } else {
            _4052 = (_3977 * 0.009999999776482582f);
          }
        } else {
          _4052 = 0.0f;
        }
      } else {
        if (_3893) {
          float _3907 = (_3886 * 2.0f) + -1.0f;
          float _3908 = 1.0f - (_3887 * 2.0f);
          float _3924 = mad((_invViewProjRelative[3].z), _3888, mad((_invViewProjRelative[3].y), _3908, (_3907 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_3884 == 2)) {
            if (_3884 == 3) {
              _3950 = 0.0f;
              _3952 = _3950;
            } else {
              if (_3884 == 21) {
                if (!(_80 == 21)) {
                  _3950 = 0.0f;
                  _3952 = _3950;
                } else {
                  _3952 = 20.0f;
                }
              } else {
                bool _3943 = (_3884 == 22);
                if (!(((_80 == 22)) && (_3943))) {
                  _3950 = select(_3943, 0.0f, 1.0f);
                  _3952 = _3950;
                } else {
                  _3952 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _3950 = 0.0f;
              _3952 = _3950;
            } else {
              _3952 = 20.0f;
            }
          }
          if (!((_170) || ((!(_3885 == 1.0f))))) {
            _3976 = saturate(((((_3199 * 0.9375f) - max(0.0f, dot(float3(_3170, _3174, _3178), float3((((mad((_invViewProjRelative[0].z), _3888, mad((_invViewProjRelative[0].y), _3908, (_3907 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _3924) - _3292), (((mad((_invViewProjRelative[1].z), _3888, mad((_invViewProjRelative[1].y), _3908, (_3907 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _3924) - _3293), (((mad((_invViewProjRelative[2].z), _3888, mad((_invViewProjRelative[2].y), _3908, (_3907 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _3924) - _3294))))) * ((_115 * 0.015625f) + 1.5f)) / _3199) * 0.9375f);
          } else {
            _3976 = _3885;
          }
          float _3977 = _3976 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_3952 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _3889)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _3888)))))) * 1.4426950216293335f));
          int _3978 = _3884 & -2;
          if (!(_3978 == 6)) {
            bool __defer_3980_3990 = false;
            if ((((_80 == 33) && (_3884 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_3884 == 55)))))) {
              _4052 = (_3977 * 0.009999999776482582f);
            } else {
              __defer_3980_3990 = true;
            }
            if (__defer_3980_3990) {
              if (!(((_3884 == 54)) || ((_3978 == 66))) || ((((_3884 == 54)) || ((_3978 == 66))) && (!(((_3065 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_3884) + (uint)(-53))) < (uint)15) {
                    _4049 = saturate(_115 * 0.03125f);
                  } else {
                    _4049 = 1.0f;
                  }
                  _4052 = (_4049 * _3977);
                } else {
                  _4052 = _3977;
                }
              } else {
                uint4 _4004 = __3__36__0__0__g_baseColor.Load(int3(int(_3886 * _bufferSizeAndInvSize.x), int(_3887 * _bufferSizeAndInvSize.y), 0));
                float _4010 = float((uint)((uint)(((uint)((uint)(_4004.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _4013 = float((uint)((uint)(_4004.x & 255))) * 0.003921568859368563f;
                float _4017 = float((uint)((uint)(((uint)((uint)(_4004.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _4018 = _4010 * _4010;
                float _4019 = _4013 * _4013;
                float _4020 = _4017 * _4017;
                _4052 = (saturate(1.0f - (dot(float3((((_4018 * 0.6131200194358826f) + (_4019 * 0.3395099937915802f)) + (_4020 * 0.047370001673698425f)), (((_4018 * 0.07020000368356705f) + (_4019 * 0.9163600206375122f)) + (_4020 * 0.013450000435113907f)), (((_4018 * 0.02061999961733818f) + (_4019 * 0.10958000272512436f)) + (_4020 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _3977);
              }
            }
          } else {
            _4052 = (_3977 * 0.009999999776482582f);
          }
        } else {
          _4052 = 0.0f;
        }
      }
      _4056 = saturate(1.0f - _4052);
    } else {
      _4056 = 1.0f;
    }
    #define MICRO_PIXEL_X_FLOAT   _60
    #define MICRO_PIXEL_Y_FLOAT   _61
    #define MICRO_LINEAR_DEPTH    _115
    #define MICRO_CONTACT_SHADOW  _4056
    #define MICRO_STENCIL         _80
    #define MICRO_LIGHT_DIR_X     _3085
    #define MICRO_LIGHT_DIR_Y     _3086
    #define MICRO_LIGHT_DIR_Z     _3087
    #define MICRO_WORLD_POS_X     _3278
    #define MICRO_WORLD_POS_Y     _3279
    #define MICRO_WORLD_POS_Z     _3280
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
    if (CONTACT_SHADOW_RT_TUNING > 0.f && _4056 < 1.0f) {
      _4056 = saturate(1.0f - ((1.0f - _4056) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
    }
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _4056 < 1.0f) {
      float2 _screenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_61 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _4056 = lerp(lerp(1.0f, _4056, 0.5f), _4056, _edgeFade);
    }
    float _4057 = min(_3055, _4056);
    _4071 = float(half(_4057 * float(_3031)));
    _4072 = float(half(_4057 * float(_3032)));
    _4073 = float(half(_4057 * float(_3033)));
    _4074 = saturate((1.0f - _556) + (exp2(log2(saturate(select(_172, (_3040 + 0.9800000190734863f), _3040))) * 0.45454543828964233f) * _556));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)))] = half4(half(_4071), half(_4072), half(_4073), half(_4074));
}
