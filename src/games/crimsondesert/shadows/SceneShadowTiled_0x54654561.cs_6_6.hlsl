#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t40, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t236, space36);

Texture2DArray<uint2> __3__36__0__0__g_dynamicShadowStencilArray : register(t237, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t238, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t239, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t19, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t52, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t53, space36);

Texture2D<float2> __3__36__0__0__g_raytracedShadow : register(t127, space36);

RWTexture2D<half4> __3__38__0__1__g_shadowColorResultUAV : register(u40, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b13, space35) {
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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b26, space35) {
  struct {
    float4 _shadowDepthRanges;
    float4 _massiveShadowSizeAndInvSize;
    uint4 _shadowParam;
    int4 _updateIndex;
    float4 _jitterOffset[8];
    float4 _shadowRelativePosition;
    float4 _dynmaicShadowSizeAndInvSize;
    row_major float4x4 _dynamicShadowProjTexScale[2];
    row_major float4x4 _dynamicShadowProjRelativeTexScale[2];
    float4 _dynamicShadowFrustumPlanes0[6];
    float4 _dynamicShadowFrustumPlanes1[6];
    row_major float4x4 _dynamicShadowViewProj[2];
    row_major float4x4 _dynamicShadowViewProjPrev[2];
    row_major float4x4 _invDynamicShadowViewProj[2];
    float4 _dynamicShadowPosition[2];
    float4 _shadowSizeAndInvSize;
    row_major float4x4 _shadowProjTexScale[2];
    row_major float4x4 _shadowProjRelativeTexScale[2];
    float4 _staticShadowPosition[2];
    row_major float4x4 _shadowViewProj[2];
    row_major float4x4 _shadowViewProjRelative[2];
    row_major float4x4 _invShadowViewProj[2];
    float4 _currShadowFrustumPlanes[6];
    row_major float4x4 _currShadowViewProjRelative;
    row_major float4x4 _currInvShadowViewProjRelative;
    float4 _currStaticShadowPosition;
    float4 _currTerrainShadowFrustumPlanes[6];
    row_major float4x4 _terrainShadowProjTexScale;
    row_major float4x4 _terrainShadowProjRelativeTexScale;
    row_major float4x4 _terrainShadowViewProj;
    row_major float4x4 _nearFieldShadowViewProj;
    float4 _nearFieldShadowFlag;
    float4 _nearFieldShadowFrustumPlanes[6];
  } __3__35__0__0__ShadowConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__ShadowConstantBuffer_raw[155] : packoffset(c0);
  uint4 __3__35__0__0__ShadowConstantBuffer_raw_uint[155] : packoffset(c0);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  struct {
    uint4 g_tileIndex[4096];
  } __3__35__0__0__TileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__TileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

static const int _global_0[16] = { 1, -3, -1, 3, 5, 1, -3, -5, -5, 5, -7, -1, 3, 7, 7, -7 };

#include "micro_detail_shadows.hlsli"

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int4 _32;
  int _42;
  int _46;
  uint _58;
  uint _59;
  float _60;
  float _61;
  float _67;
  float _68;
  float _70;
  float _72;
  uint _74;
  int _76;
  float _79;
  int _80;
  uint _82;
  float _98;
  float _99;
  float _100;
  float _102;
  float _103;
  float _104;
  float _105;
  bool _107;
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
  float _1214;
  float _1215;
  bool _1216;
  half _1217;
  half _1218;
  half _1219;
  float _1454;
  float _1455;
  bool _1456;
  half _1457;
  half _1458;
  half _1459;
  half _1468;
  half _1469;
  half _1470;
  float _1471;
  float _1472;
  float _1473;
  float _1702;
  float _1703;
  bool _1704;
  half _1705;
  half _1706;
  half _1707;
  half _1716;
  half _1717;
  half _1718;
  float _1719;
  float _1720;
  float _1721;
  float _1950;
  float _1951;
  bool _1952;
  half _1953;
  half _1954;
  half _1955;
  half _1964;
  half _1965;
  half _1966;
  float _1967;
  float _1968;
  float _1969;
  half _2007;
  half _2008;
  half _2009;
  float _2029;
  float _2030;
  int _2031;
  float _2132;
  int _2155;
  float _2258;
  float _2259;
  half _2260;
  half _2261;
  half _2262;
  float _2314;
  float _2315;
  float _2316;
  float _2416;
  float _2430;
  int _2602;
  float _2608;
  float _2621;
  float _2634;
  float _2644;
  float _2645;
  float _2646;
  float _2655;
  float _2656;
  float _2657;
  float _2805;
  float _2806;
  float _2807;
  float _2808;
  float _2809;
  int _2810;
  int _2811;
  float _2812;
  float _2813;
  bool _2876;
  int _2883;
  float _2902;
  int _2917;
  float _2918;
  float _2941;
  float _2942;
  float _2943;
  float _2944;
  float _2945;
  float _2949;
  float _2958;
  float _2959;
  float _2960;
  float _2961;
  int _2962;
  float _3041;
  float _3043;
  float _3067;
  float _3143;
  float _3146;
  float _3150;
  float _3165;
  float _3166;
  float _3167;
  float _3168;
  float _110;
  float _114;
  float _115;
  float _151;
  float _152;
  float _153;
  float _154;
  float _156;
  bool _170;
  bool _172;
  float _192;
  float _196;
  float _200;
  float _211;
  float _222;
  float _223;
  float _228;
  uint _244;
  uint _252;
  uint _260;
  uint _268;
  uint _276;
  uint _284;
  uint _292;
  uint _300;
  uint _308;
  uint _316;
  uint _324;
  uint _332;
  uint _340;
  uint _348;
  uint _356;
  uint _364;
  uint _382;
  float _389;
  float _395;
  float _396;
  float _398;
  float _405;
  float _407;
  float _409;
  float _410;
  float _415;
  float4 _419;
  float _424;
  float _429;
  float _431;
  float _438;
  float _448;
  float _449;
  float _454;
  float4 _456;
  float _465;
  float _467;
  float _474;
  float _485;
  float _486;
  float _491;
  float4 _493;
  float _502;
  float _504;
  float _511;
  float _522;
  float _523;
  float _528;
  float4 _530;
  float _539;
  float _541;
  float _548;
  float _564;
  float _584;
  float _588;
  float _592;
  float _593;
  float _594;
  float _619;
  float _620;
  float _652;
  float _656;
  float _660;
  float _685;
  float _686;
  bool _700;
  float _708;
  float _709;
  float _710;
  float _715;
  float _716;
  float _717;
  float _737;
  float _741;
  float _745;
  float _746;
  float _747;
  float _768;
  float _769;
  float _770;
  float _790;
  float _794;
  float _798;
  uint _830;
  uint _838;
  uint _846;
  uint _854;
  uint _862;
  uint _870;
  uint _878;
  uint _886;
  uint _894;
  uint _902;
  uint _910;
  uint _918;
  uint _926;
  uint _934;
  uint _942;
  uint _950;
  bool _952;
  float _957;
  float _958;
  float _959;
  float _961;
  float _975;
  float _976;
  float _977;
  float _984;
  float _986;
  float _993;
  float _994;
  float _995;
  float _998;
  float _999;
  float _1000;
  float _1001;
  int _1004;
  int _1005;
  uint _1006;
  uint _1007;
  uint _1008;
  uint _1009;
  float4 _1015;
  float4 _1017;
  float4 _1019;
  float4 _1021;
  half4 _1024;
  float _1032;
  float _1034;
  float _1048;
  float _1050;
  float _1060;
  float _1061;
  int _1090;
  float4 _1092;
  float4 _1097;
  float4 _1102;
  float4 _1107;
  float _1112;
  float _1114;
  float _1116;
  float _1118;
  float _1120;
  float _1122;
  float _1123;
  float _1141;
  float _1143;
  float _1145;
  float _1163;
  float _1165;
  float _1167;
  float _1185;
  float _1187;
  float _1189;
  half _1220;
  half _1221;
  half _1222;
  float _1223;
  float _1224;
  float _1225;
  float _1236;
  float _1237;
  float _1240;
  float _1241;
  float _1242;
  float _1243;
  int _1246;
  int _1247;
  uint _1248;
  uint _1249;
  float4 _1255;
  float4 _1257;
  float4 _1259;
  float4 _1261;
  half4 _1264;
  float _1272;
  float _1274;
  float _1288;
  float _1290;
  float _1300;
  float _1301;
  int _1330;
  float4 _1332;
  float4 _1337;
  float4 _1342;
  float4 _1347;
  float _1352;
  float _1354;
  float _1356;
  float _1358;
  float _1360;
  float _1362;
  float _1363;
  float _1381;
  float _1383;
  float _1385;
  float _1403;
  float _1405;
  float _1407;
  float _1425;
  float _1427;
  float _1429;
  float _1484;
  float _1485;
  float _1488;
  float _1489;
  float _1490;
  float _1491;
  int _1494;
  int _1495;
  uint _1496;
  uint _1497;
  float4 _1503;
  float4 _1505;
  float4 _1507;
  float4 _1509;
  half4 _1512;
  float _1520;
  float _1522;
  float _1536;
  float _1538;
  float _1548;
  float _1549;
  int _1578;
  float4 _1580;
  float4 _1585;
  float4 _1590;
  float4 _1595;
  float _1600;
  float _1602;
  float _1604;
  float _1606;
  float _1608;
  float _1610;
  float _1611;
  float _1629;
  float _1631;
  float _1633;
  float _1651;
  float _1653;
  float _1655;
  float _1673;
  float _1675;
  float _1677;
  float _1732;
  float _1733;
  float _1736;
  float _1737;
  float _1738;
  float _1739;
  int _1742;
  int _1743;
  uint _1744;
  uint _1745;
  float4 _1751;
  float4 _1753;
  float4 _1755;
  float4 _1757;
  half4 _1760;
  float _1768;
  float _1770;
  float _1784;
  float _1786;
  float _1796;
  float _1797;
  int _1826;
  float4 _1828;
  float4 _1833;
  float4 _1838;
  float4 _1843;
  float _1848;
  float _1850;
  float _1852;
  float _1854;
  float _1856;
  float _1858;
  float _1859;
  float _1877;
  float _1879;
  float _1881;
  float _1899;
  float _1901;
  float _1903;
  float _1921;
  float _1923;
  float _1925;
  float _1971;
  float _1981;
  half _1985;
  half _1986;
  half _1987;
  float _1990;
  float _1991;
  float _1992;
  float _1993;
  float2 _2012;
  float _2017;
  float _2019;
  float _2020;
  float _2040;
  float _2041;
  float _2042;
  float _2043;
  float _2056;
  float _2057;
  float _2060;
  float _2097;
  float _2101;
  float _2102;
  float _2103;
  float _2109;
  float _2111;
  float _2112;
  float _2134;
  float _2135;
  int _2136;
  float _2142;
  float _2143;
  float _2144;
  float _2156;
  float _2157;
  float _2164;
  float _2166;
  float _2170;
  float _2171;
  float _2172;
  float _2179;
  float _2195;
  float _2196;
  float _2217;
  float _2218;
  float _2239;
  float _2240;
  float _2251;
  float _2252;
  bool _2263;
  float _2265;
  float _2269;
  float _2284;
  int _2294;
  bool _2295;
  bool _2296;
  bool _2297;
  float _2298;
  int _2317;
  int _2321;
  uint _2327;
  int _2332;
  int _2337;
  float _2340;
  float _2351;
  float _2352;
  float _2357;
  float _2373;
  float _2377;
  float _2380;
  float _2383;
  float _2384;
  float _2386;
  float _2389;
  float _2390;
  float _2391;
  float _2392;
  float _2401;
  float _2405;
  float _2409;
  int _2410;
  float _2422;
  bool _2443;
  float _2447;
  uint _2469;
  uint _2477;
  uint _2485;
  uint _2493;
  uint _2501;
  uint _2509;
  uint _2517;
  uint _2525;
  uint _2533;
  uint _2541;
  uint _2549;
  uint _2557;
  uint _2565;
  uint _2573;
  uint _2581;
  uint _2589;
  float _2636;
  float _2650;
  float _2658;
  float _2659;
  float _2660;
  float _2672;
  float _2675;
  float _2683;
  float _2715;
  float _2719;
  float _2723;
  float _2724;
  float _2725;
  float _2741;
  float _2742;
  float _2743;
  float _2744;
  float _2748;
  float _2749;
  float _2752;
  float _2763;
  float _2764;
  float _2783;
  float _2784;
  float _2786;
  float _2788;
  float _2789;
  float _2796;
  float _2803;
  uint _2822;
  int _2824;
  float _2827;
  int _2828;
  bool _2829;
  float _2830;
  float _2831;
  float _2835;
  float _2838;
  bool _2841;
  int _2842;
  float _2904;
  float _2907;
  int _2946;
  bool _2966;
  float _2980;
  float _2981;
  float _3017;
  bool _3034;
  float _3068;
  int _3069;
  uint4 _3098;
  float _3104;
  float _3107;
  float _3111;
  float _3112;
  float _3113;
  float _3114;
  float _3151;
  int __loop_jump_target = -1;
  int _18[4];
  float _26[2];
  float _27[2];
  float _28[2];
  _32 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _18[0] = _32.x;
  _18[1] = _32.y;
  _18[2] = _32.z;
  _18[3] = _32.w;
  _42 = _18[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _46 = select((((int)(SV_GroupID.x) & 16) == 0), _42, ((uint)(_42) >> 16));
  _58 = ((uint)(((((int)(_46 << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x;
  _59 = ((uint)(((((uint)(_46) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y;
  _60 = (float)((uint)_58);
  _61 = (float)((uint)_59);
  _67 = (_60 + 0.5f) * _bufferSizeAndInvSize.z;
  _68 = (_61 + 0.5f) * _bufferSizeAndInvSize.w;
  _70 = (_67 * 2.0f) + -1.0f;
  _72 = 1.0f - (_68 * 2.0f);
  _74 = __3__36__0__0__g_depthStencil.Load(int3(_58, _59, 0));  // [sem: _3__36__0__0__g_depthStencil_load]
  _76 = (uint)((uint)(_74.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _79 = ((float)((uint)((uint)(_74.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _80 = _76 & 127;
  _82 = __3__36__0__0__g_sceneNormal.Load(int3(_58, _59, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
  _98 = min(1.0f, ((((float)((uint)((uint)(_82.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _99 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_82.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _100 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_82.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _102 = rsqrt(dot(float3(_98, _99, _100), float3(_98, _99, _100)));  // [sem: invLength]
  _103 = _102 * _98;
  _104 = _102 * _99;
  _105 = _102 * _100;
  _107 = (_79 == 1.0f);
  if ((_79 < 1.0000000116860974e-07f) || _107) {
    _110 = select(_107, 0.0f, 1.0f);
    _3165 = _110;
    _3166 = _110;
    _3167 = _110;
    _3168 = _110;  // [sem: expr_sat]
  } else {
    _114 = max(1.0000000116860974e-07f, _79);
    _115 = _nearFarProj.x / _114;
    _151 = mad((_invViewProjRelative[2].w), _114, mad((_invViewProjRelative[1].w), _72, ((_invViewProjRelative[0].w) * _70))) + (_invViewProjRelative[3].w);
    _152 = (mad((_invViewProjRelative[2].x), _114, mad((_invViewProjRelative[1].x), _72, ((_invViewProjRelative[0].x) * _70))) + (_invViewProjRelative[3].x)) / _151;
    _153 = (mad((_invViewProjRelative[2].y), _114, mad((_invViewProjRelative[1].y), _72, ((_invViewProjRelative[0].y) * _70))) + (_invViewProjRelative[3].y)) / _151;
    _154 = (mad((_invViewProjRelative[2].z), _114, mad((_invViewProjRelative[1].z), _72, ((_invViewProjRelative[0].z) * _70))) + (_invViewProjRelative[3].z)) / _151;
    _156 = rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));  // [sem: invLength]
    _26[0] = 0.0f;
    _27[0] = 0.0f;
    _28[0] = 0.0f;
    _26[1] = 0.0f;
    _27[1] = 0.0f;
    _28[1] = 0.0f;
    _170 = ((uint)(_80 + -53) < (uint)15);
    _172 = (_80 == 57) || _170;
    _192 = mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[2].x), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[1].x), _153, ((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[0].x) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[3].x);
    _196 = mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[2].y), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[1].y), _153, ((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[0].y) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[3].y);
    _200 = mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[2].z), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[1].z), _153, ((__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[0].z) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._terrainShadowProjRelativeTexScale[3].z);
    if (saturate(_192) == _192) {
      if ((_200 >= 9.999999747378752e-05f) && ((_200 <= 1.0f) && (saturate(_196) == _196))) {
        _211 = (float)((uint)(uint)(_frameNumber.x));
        _222 = (frac(((_211 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        _223 = (frac(((_211 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        _228 = frac(dot(float3((_222 * _222), (_223 * _223), (_223 * _222)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        _244 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60);
        _252 = ((uint)((((int)((_244 << 4) + (uint)(-1383041155))) ^ ((int)(_244 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_244) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _260 = ((uint)((((int)((_252 << 4) + (uint)(-1556008596))) ^ ((int)(_252 + 1013904242u))) ^ (((uint)(_252) >> 5) + -939442524))) + _244;
        _268 = ((uint)((((int)((_260 << 4) + (uint)(-1383041155))) ^ ((int)(_260 + 1013904242u))) ^ ((int)(((uint)((uint)(_260) >> 5)) + 2123724318u)))) + _252;
        _276 = ((uint)((((int)((_268 << 4) + (uint)(-1556008596))) ^ ((int)(_268 + (uint)(-626627285)))) ^ (((uint)(_268) >> 5) + -939442524))) + _260;
        _284 = ((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + _268;
        _292 = ((uint)((((int)((_284 << 4) + (uint)(-1556008596))) ^ ((int)(_284 + 2027808484u))) ^ (((uint)(_284) >> 5) + -939442524))) + _276;
        _300 = ((uint)((((int)((_292 << 4) + (uint)(-1383041155))) ^ ((int)(_292 + 2027808484u))) ^ ((int)(((uint)((uint)(_292) >> 5)) + 2123724318u)))) + _284;
        _308 = ((uint)((((int)((_300 << 4) + (uint)(-1556008596))) ^ ((int)(_300 + 387276957u))) ^ (((uint)(_300) >> 5) + -939442524))) + _292;
        _316 = ((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300;
        _324 = ((uint)((((int)((_316 << 4) + (uint)(-1556008596))) ^ ((int)(_316 + (uint)(-1253254570)))) ^ (((uint)(_316) >> 5) + -939442524))) + _308;
        _332 = ((uint)((((int)((_324 << 4) + (uint)(-1383041155))) ^ ((int)(_324 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_324) >> 5)) + 2123724318u)))) + _316;
        _340 = ((uint)((((int)((_332 << 4) + (uint)(-1556008596))) ^ ((int)(_332 + 1401181199u))) ^ (((uint)(_332) >> 5) + -939442524))) + _324;
        _348 = ((uint)((((int)((_340 << 4) + (uint)(-1383041155))) ^ ((int)(_340 + 1401181199u))) ^ ((int)(((uint)((uint)(_340) >> 5)) + 2123724318u)))) + _332;
        _356 = ((uint)((((int)((_348 << 4) + (uint)(-1556008596))) ^ ((int)(_348 + (uint)(-239350328)))) ^ (((uint)(_348) >> 5) + -939442524))) + _340;
        _364 = ((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + _348;
        if ((_356 & 16777215) == 0) {
          _377 = ((int)(((uint)((((int)((_364 << 4) + (uint)(-1556008596))) ^ ((int)(_364 + (uint)(-1879881855)))) ^ (((uint)(_364) >> 5) + -939442524))) + _356));
        } else {
          _377 = _356;
        }
        _382 = uint(((float)((uint)((uint)(((int)(_377 * 48271)) & 16777215)))) * 3.814637693722034e-06f);
        _389 = frac((((float)((uint)_382)) * 0.015625f) + (((float)((uint)((uint)((int)(uint(_228 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f));
        _395 = (_389 * 2.0f) + -1.0f;
        _396 = (((float)((uint)((uint)(reversebits(_382) ^ (int)(uint(_228 * 287478368.0f)))))) * 4.656612873077393e-10f) + -1.0f;
        _398 = rsqrt(dot(float2(_395, _396), float2(_395, _396)));  // [sem: invLength]
        _405 = ((_389 * 0.0009765625f) + -0.00048828125f) * _398;
        _407 = (_396 * _398) * 0.00048828125f;
        _409 = (_405 * (__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[0].x)) + _192;
        _410 = (_407 * (__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[0].y)) + _196;
        _415 = frac((_409 * 1024.0f) + -0.5f);
        _419 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_409, _410));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _424 = _200 + -0.004999999888241291f;
        _429 = select((_419.w > _424), 1.0f, 0.0f);
        _431 = select((_419.x > _424), 1.0f, 0.0f);
        _438 = ((select((_419.z > _424), 1.0f, 0.0f) - _429) * _415) + _429;
        _448 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[1].x) * _405) + _192;
        _449 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[1].y) * _407) + _196;
        _454 = frac((_448 * 1024.0f) + -0.5f);
        _456 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_448, _449));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _465 = select((_456.w > _424), 1.0f, 0.0f);
        _467 = select((_456.x > _424), 1.0f, 0.0f);
        _474 = ((select((_456.z > _424), 1.0f, 0.0f) - _465) * _454) + _465;
        _485 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[2].x) * _405) + _192;
        _486 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[2].y) * _407) + _196;
        _491 = frac((_485 * 1024.0f) + -0.5f);
        _493 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_485, _486));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _502 = select((_493.w > _424), 1.0f, 0.0f);
        _504 = select((_493.x > _424), 1.0f, 0.0f);
        _511 = ((select((_493.z > _424), 1.0f, 0.0f) - _502) * _491) + _502;
        _522 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[3].x) * _405) + _192;
        _523 = ((__3__35__0__0__ShadowConstantBuffer_view._jitterOffset[3].y) * _407) + _196;
        _528 = frac((_522 * 1024.0f) + -0.5f);
        _530 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_522, _523));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _539 = select((_530.w > _424), 1.0f, 0.0f);
        _541 = select((_530.x > _424), 1.0f, 0.0f);
        _548 = ((select((_530.z > _424), 1.0f, 0.0f) - _539) * _528) + _539;
        _556 = ((((saturate((((((select((_456.y > _424), 1.0f, 0.0f) - _467) * _454) + _467) - _474) * frac((_449 * 1024.0f) + -0.5f)) + _474) + saturate((((((select((_419.y > _424), 1.0f, 0.0f) - _431) * _415) + _431) - _438) * frac((_410 * 1024.0f) + -0.5f)) + _438)) + saturate((((((select((_493.y > _424), 1.0f, 0.0f) - _504) * _491) + _504) - _511) * frac((_486 * 1024.0f) + -0.5f)) + _511)) + saturate((((((select((_530.y > _424), 1.0f, 0.0f) - _541) * _528) + _541) - _548) * frac((_523 * 1024.0f) + -0.5f)) + _548)) * 0.25f);
      } else {
        _556 = 1.0f;
      }
    } else {
      _556 = 1.0f;
    }
    _564 = sqrt(((_153 * _153) + (_152 * _152)) + (_154 * _154));
    _584 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][2].x), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][1].x), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][0].x) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][3].x);
    _588 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][2].y), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][1].y), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][0].y) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][3].y);
    _592 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][2].z), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][1].z), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][0].z) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[1][3].z);
    _593 = 4.0f / __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y;
    _594 = 1.0f - _593;
    if (!(((!(_584 <= _594)) || (!(_584 >= _593))) || (!(_588 <= _594)))) {
      if ((_564 < 128.0f) && ((_592 >= -1.0f) && ((_592 <= 1.0f) && (_588 >= _593)))) {
        _619 = max(0.0f, ((abs((_584 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _620 = max(0.0f, ((abs((_588 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
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
    _652 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][2].x), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][1].x), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][0].x) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][3].x);
    _656 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][2].y), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][1].y), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][0].y) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][3].y);
    _660 = mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][2].z), _154, mad((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][1].z), _153, ((__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][0].z) * _152))) + (__3__35__0__0__ShadowConstantBuffer_view._dynamicShadowProjRelativeTexScale[0][3].z);
    if (!(((!(_652 >= _593)) || (!(_652 <= _594))) || (!(_656 <= _594)))) {
      if ((_564 < 128.0f) && ((_660 >= -1.0f) && ((_656 >= _593) && (_660 <= 1.0f)))) {
        _685 = max(0.0f, ((abs((_652 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _686 = max(0.0f, ((abs((_656 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
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
    _700 = (_697 == 0);
    [branch]
    if (_700) {
      _708 = _viewPos.x + _152;
      _709 = _viewPos.y + _153;
      _710 = _viewPos.z + _154;
      _715 = _708 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[1].x);
      _716 = _709 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[1].y);
      _717 = _710 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[1].z);
      _737 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][2].x), _717, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][1].x), _716, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][0].x) * _715))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][3].x);
      _741 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][2].y), _717, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][1].y), _716, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][0].y) * _715))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][3].y);
      _745 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][2].z), _717, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][1].z), _716, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][0].z) * _715))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[1][3].z);
      _746 = 2.0f / __3__35__0__0__ShadowConstantBuffer_view._shadowSizeAndInvSize.y;
      _747 = 1.0f - _746;
      if (!(((!(_737 <= _747)) || (!(_737 >= _746))) || (!(_741 <= _747)))) {
        if ((_745 >= 9.999999747378752e-05f) && ((_745 <= 1.0f) && (_741 >= _746))) {
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
      _768 = _708 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[0].x);
      _769 = _709 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[0].y);
      _770 = _710 - (__3__35__0__0__ShadowConstantBuffer_view._staticShadowPosition[0].z);
      _790 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][2].x), _770, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][1].x), _769, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][0].x) * _768))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][3].x);
      _794 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][2].y), _770, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][1].y), _769, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][0].y) * _768))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][3].y);
      _798 = mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][2].z), _770, mad((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][1].z), _769, ((__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][0].z) * _768))) + (__3__35__0__0__ShadowConstantBuffer_view._shadowProjRelativeTexScale[0][3].z);
      if (!(((!(_790 >= _746)) || (!(_790 <= _747))) || (!(_794 <= _747)))) {
        if ((_798 >= 9.999999747378752e-05f) && ((_794 >= _746) && (_798 <= 1.0f))) {
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
    _830 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60);
    _838 = ((uint)((((int)((_830 << 4) + (uint)(-1383041155))) ^ ((int)(_830 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_830) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
    _846 = ((uint)((((int)((_838 << 4) + (uint)(-1556008596))) ^ ((int)(_838 + 1013904242u))) ^ (((uint)(_838) >> 5) + -939442524))) + _830;
    _854 = ((uint)((((int)((_846 << 4) + (uint)(-1383041155))) ^ ((int)(_846 + 1013904242u))) ^ ((int)(((uint)((uint)(_846) >> 5)) + 2123724318u)))) + _838;
    _862 = ((uint)((((int)((_854 << 4) + (uint)(-1556008596))) ^ ((int)(_854 + (uint)(-626627285)))) ^ (((uint)(_854) >> 5) + -939442524))) + _846;
    _870 = ((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + _854;
    _878 = ((uint)((((int)((_870 << 4) + (uint)(-1556008596))) ^ ((int)(_870 + 2027808484u))) ^ (((uint)(_870) >> 5) + -939442524))) + _862;
    _886 = ((uint)((((int)((_878 << 4) + (uint)(-1383041155))) ^ ((int)(_878 + 2027808484u))) ^ ((int)(((uint)((uint)(_878) >> 5)) + 2123724318u)))) + _870;
    _894 = ((uint)((((int)((_886 << 4) + (uint)(-1556008596))) ^ ((int)(_886 + 387276957u))) ^ (((uint)(_886) >> 5) + -939442524))) + _878;
    _902 = ((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886;
    _910 = ((uint)((((int)((_902 << 4) + (uint)(-1556008596))) ^ ((int)(_902 + (uint)(-1253254570)))) ^ (((uint)(_902) >> 5) + -939442524))) + _894;
    _918 = ((uint)((((int)((_910 << 4) + (uint)(-1383041155))) ^ ((int)(_910 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_910) >> 5)) + 2123724318u)))) + _902;
    _926 = ((uint)((((int)((_918 << 4) + (uint)(-1556008596))) ^ ((int)(_918 + 1401181199u))) ^ (((uint)(_918) >> 5) + -939442524))) + _910;
    _934 = ((uint)((((int)((_926 << 4) + (uint)(-1383041155))) ^ ((int)(_926 + 1401181199u))) ^ ((int)(((uint)((uint)(_926) >> 5)) + 2123724318u)))) + _918;
    _942 = ((uint)((((int)((_934 << 4) + (uint)(-1556008596))) ^ ((int)(_934 + (uint)(-239350328)))) ^ (((uint)(_934) >> 5) + -939442524))) + _926;
    _950 = ((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + _934;
    _952 = ((_942 & 16777215) == 0);
    [branch]
    if (_700) {
      _2142 = _26[min((uint)(_814), 1u)];
      _2143 = _27[min((uint)(_814), 1u)];
      _2144 = _28[min((uint)(_814), 1u)];
      if (_952) {
        _2155 = ((int)(((uint)((((int)((_950 << 4) + (uint)(-1556008596))) ^ ((int)(_950 + (uint)(-1879881855)))) ^ (((uint)(_950) >> 5) + -939442524))) + _942));
      } else {
        _2155 = _942;
      }
      _2156 = __3__35__0__0__ShadowConstantBuffer_view._shadowSizeAndInvSize.z * 2.0f;
      _2157 = __3__35__0__0__ShadowConstantBuffer_view._shadowSizeAndInvSize.w * 2.0f;
      _2164 = __3__35__0__0__ShadowConstantBuffer_view._shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      _2166 = __3__35__0__0__ShadowConstantBuffer_view._shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      _2170 = ((((float)((uint)((uint)(((int)(_2155 * 48271)) & 16777215)))) * _2164) - _2156) + _2142;
      _2171 = ((((float)((uint)((uint)(((int)(_2155 * -1964877855)) & 16777215)))) * _2166) - _2157) + _2143;
      _2172 = (float)((uint)_814);
      _2179 = _2144 - _812;
      _2195 = ((((float)((uint)((uint)(((int)(_2155 * -856141137)) & 16777215)))) * _2164) - _2156) + _2142;
      _2196 = ((((float)((uint)((uint)(((int)(_2155 * -613502015)) & 16777215)))) * _2166) - _2157) + _2143;
      _2217 = ((((float)((uint)((uint)(((int)(_2155 * -556260145)) & 16777215)))) * _2164) - _2156) + _2142;
      _2218 = ((((float)((uint)((uint)(((int)(_2155 * 902075297)) & 16777215)))) * _2166) - _2157) + _2143;
      _2239 = ((((float)((uint)((uint)(((int)(_2155 * 1698214639)) & 16777215)))) * _2164) - _2156) + _2142;
      _2240 = ((((float)((uint)((uint)(((int)(_2155 * 773027713)) & 16777215)))) * _2166) - _2157) + _2143;
      _2251 = (((saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2195, _2196, _2172), _2179))).x)) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2170, _2171, _2172), _2179))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2217, _2218, _2172), _2179))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_2239, _2240, _2172), _2179))).x))) * 0.25f;
      _2252 = (((max(0.0f, (_2144 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2195, _2196, _2172), 0.0f))).x))) + max(0.0f, (_2144 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2170, _2171, _2172), 0.0f))).x)))) + max(0.0f, (_2144 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2217, _2218, _2172), 0.0f))).x)))) + max(0.0f, (_2144 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2239, _2240, _2172), 0.0f))).x)))) * 0.25f;
      _2258 = saturate(_2251 * _2251);  // [sem: expr_sat]
      _2259 = saturate(_2252 * _2252);  // [sem: expr_sat]
      _2260 = 1.0h;
      _2261 = 1.0h;
      _2262 = 1.0h;
    } else {
      _957 = _26[min((uint)(_814), 1u)];
      _958 = _27[min((uint)(_814), 1u)];
      _959 = _28[min((uint)(_814), 1u)];
      _961 = select((_814 == 0), 2.5f, 1.0f);
      if (_952) {
        _974 = ((int)(((uint)((((int)((_950 << 4) + (uint)(-1556008596))) ^ ((int)(_950 + (uint)(-1879881855)))) ^ (((uint)(_950) >> 5) + -939442524))) + _942));
      } else {
        _974 = _942;
      }
      _975 = select(_172, (_961 * 0.75f), _961) * 0.6600000262260437f;
      _976 = _975 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.z;
      _977 = _975 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.w;
      _984 = _976 * 1.1920928955078125e-07f;
      _986 = _977 * 1.1920928955078125e-07f;
      _993 = min(100.0f, _shadowAOParams.y) * 0.8500000238418579f;
      _994 = ((((float)((uint)((uint)(((int)(_974 * 48271)) & 16777215)))) * _984) - _976) + _957;
      _995 = ((((float)((uint)((uint)(((int)(_974 * -1964877855)) & 16777215)))) * _986) - _977) + _958;
      _998 = (_994 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.x) + -0.5f;
      _999 = (_995 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y) + -0.5f;
      _1000 = frac(_998);
      _1001 = frac(_999);
      _1004 = int(floor(_998));
      _1005 = int(floor(_999));
      _1006 = uint(__3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.x);
      _1007 = uint(__3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y);
      _1008 = _1004 + 1u;
      _1009 = _1005 + 1u;
      if (!(((uint)_1004 > (uint)_1006) || ((uint)_1005 > (uint)_1007))) {
        _1015 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1004, _1005, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1017 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1008, _1005, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1019 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1004, _1009, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1021 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1008, _1009, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        half4 _1024 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1004, _1005, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load]
        _1032 = max(0.0f, (_959 - _1015.x));
        _1034 = max(0.0f, (_959 - _1019.x));
        _1048 = saturate(exp2((_1015.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1050 = saturate(exp2((_1019.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1060 = ((saturate(exp2((_1017.x - _959) * 432808.5f)) - _1048) * _1000) + _1048;
        _1061 = ((max(0.0f, (_959 - _1017.x)) - _1032) * _1000) + _1032;
        _1090 = _814 << 2;
        _1092 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1090 + 58))];
        _1097 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1090 + 59))];
        _1102 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1090 + 60))];
        _1107 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1090 + 61))];
        _1112 = mad(_1097.x, _995, (_1092.x * _994));
        _1114 = mad(_1102.x, _1015.x, _1112) + _1107.x;
        _1116 = mad(_1097.y, _995, (_1092.y * _994));
        _1118 = mad(_1102.y, _1015.x, _1116) + _1107.y;
        _1120 = mad(_1097.z, _995, (_1092.z * _994));
        _1122 = mad(_1102.z, _1015.x, _1120) + _1107.z;
        _1123 = -4.0f - _993;
        _1141 = mad(_1102.x, _1017.x, _1112) + _1107.x;
        _1143 = mad(_1102.y, _1017.x, _1116) + _1107.y;
        _1145 = mad(_1102.z, _1017.x, _1120) + _1107.z;
        _1163 = mad(_1102.x, _1019.x, _1112) + _1107.x;
        _1165 = mad(_1102.y, _1019.x, _1116) + _1107.y;
        _1167 = mad(_1102.z, _1019.x, _1120) + _1107.z;
        _1185 = mad(_1102.x, _1021.x, _1112) + _1107.x;
        _1187 = mad(_1102.y, _1021.x, _1116) + _1107.y;
        _1189 = mad(_1102.z, _1021.x, _1120) + _1107.z;
        _1214 = ((max(max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1004, _1005, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1114 + _1123), (_1123 - _1114)) * 0.25f), (max((_1118 + _1123), (_1123 - _1118)) * 0.25f)), (max((_1122 + _1123), (_1123 - _1122)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1008, _1005, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1141 + _1123), (_1123 - _1141)) * 0.25f), (max((_1143 + _1123), (_1123 - _1143)) * 0.25f)), (max((_1145 + _1123), (_1123 - _1145)) * 0.25f))))), max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1004, _1009, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1163 + _1123), (_1123 - _1163)) * 0.25f), (max((_1165 + _1123), (_1123 - _1165)) * 0.25f)), (max((_1167 + _1123), (_1123 - _1167)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1008, _1009, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1185 + _1123), (_1123 - _1185)) * 0.25f), (max((_1187 + _1123), (_1123 - _1187)) * 0.25f)), (max((_1189 + _1123), (_1123 - _1189)) * 0.25f)))))) * ((_1060 + -1.0f) + (((_1050 - _1060) + ((saturate(exp2((_1021.x - _959) * 432808.5f)) - _1050) * _1000)) * _1001))) + 1.0f);
        _1215 = ((((_1034 - _1061) + ((max(0.0f, (_959 - _1021.x)) - _1034) * _1000)) * _1001) + _1061);
        _1216 = false;
        _1217 = (half)(_1024.x);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1218 = (half)(_1024.y);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1219 = (half)(_1024.z);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      } else {
        _1214 = 1.0f;
        _1215 = 0.0f;
        _1216 = true;
        _1217 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1218 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1219 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      }
      _1220 = select(_1216, 0.0f, _1217);
      _1221 = select(_1216, 0.0f, _1218);
      _1222 = select(_1216, 0.0f, _1219);
      _1223 = select(_1216, 0.0f, _1214);
      _1224 = select(_1216, 0.0f, _1215);
      _1225 = select(_1216, 0.0f, 1.0f);
      _1236 = ((((float)((uint)((uint)(((int)(_974 * -856141137)) & 16777215)))) * _984) - _976) + _957;
      _1237 = ((((float)((uint)((uint)(((int)(_974 * -613502015)) & 16777215)))) * _986) - _977) + _958;
      _1240 = (_1236 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.x) + -0.5f;
      _1241 = (_1237 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y) + -0.5f;
      _1242 = frac(_1240);
      _1243 = frac(_1241);
      _1246 = int(floor(_1240));
      _1247 = int(floor(_1241));
      _1248 = _1246 + 1u;
      _1249 = _1247 + 1u;
      if (!(((uint)_1246 > (uint)_1006) || ((uint)_1247 > (uint)_1007))) {
        _1255 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1246, _1247, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1257 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1248, _1247, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1259 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1246, _1249, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1261 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1248, _1249, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        half4 _1264 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1246, _1247, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load]
        _1272 = max(0.0f, (_959 - _1255.x));
        _1274 = max(0.0f, (_959 - _1259.x));
        _1288 = saturate(exp2((_1255.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1290 = saturate(exp2((_1259.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1300 = ((saturate(exp2((_1257.x - _959) * 432808.5f)) - _1288) * _1242) + _1288;
        _1301 = ((max(0.0f, (_959 - _1257.x)) - _1272) * _1242) + _1272;
        _1330 = _814 << 2;
        _1332 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1330 + 58))];
        _1337 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1330 + 59))];
        _1342 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1330 + 60))];
        _1347 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1330 + 61))];
        _1352 = mad(_1337.x, _1237, (_1332.x * _1236));
        _1354 = mad(_1342.x, _1255.x, _1352) + _1347.x;
        _1356 = mad(_1337.y, _1237, (_1332.y * _1236));
        _1358 = mad(_1342.y, _1255.x, _1356) + _1347.y;
        _1360 = mad(_1337.z, _1237, (_1332.z * _1236));
        _1362 = mad(_1342.z, _1255.x, _1360) + _1347.z;
        _1363 = -4.0f - _993;
        _1381 = mad(_1342.x, _1257.x, _1352) + _1347.x;
        _1383 = mad(_1342.y, _1257.x, _1356) + _1347.y;
        _1385 = mad(_1342.z, _1257.x, _1360) + _1347.z;
        _1403 = mad(_1342.x, _1259.x, _1352) + _1347.x;
        _1405 = mad(_1342.y, _1259.x, _1356) + _1347.y;
        _1407 = mad(_1342.z, _1259.x, _1360) + _1347.z;
        _1425 = mad(_1342.x, _1261.x, _1352) + _1347.x;
        _1427 = mad(_1342.y, _1261.x, _1356) + _1347.y;
        _1429 = mad(_1342.z, _1261.x, _1360) + _1347.z;
        _1454 = ((max(max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1246, _1247, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1354 + _1363), (_1363 - _1354)) * 0.25f), (max((_1358 + _1363), (_1363 - _1358)) * 0.25f)), (max((_1362 + _1363), (_1363 - _1362)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1248, _1247, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1381 + _1363), (_1363 - _1381)) * 0.25f), (max((_1383 + _1363), (_1363 - _1383)) * 0.25f)), (max((_1385 + _1363), (_1363 - _1385)) * 0.25f))))), max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1246, _1249, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1403 + _1363), (_1363 - _1403)) * 0.25f), (max((_1405 + _1363), (_1363 - _1405)) * 0.25f)), (max((_1407 + _1363), (_1363 - _1407)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1248, _1249, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1425 + _1363), (_1363 - _1425)) * 0.25f), (max((_1427 + _1363), (_1363 - _1427)) * 0.25f)), (max((_1429 + _1363), (_1363 - _1429)) * 0.25f)))))) * ((_1300 + -1.0f) + (((_1290 - _1300) + ((saturate(exp2((_1261.x - _959) * 432808.5f)) - _1290) * _1242)) * _1243))) + 1.0f);
        _1455 = ((((_1274 - _1301) + ((max(0.0f, (_959 - _1261.x)) - _1274) * _1242)) * _1243) + _1301);
        _1456 = false;
        _1457 = (half)(_1264.x);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1458 = (half)(_1264.y);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1459 = (half)(_1264.z);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      } else {
        _1454 = 1.0f;
        _1455 = 0.0f;
        _1456 = true;
        _1457 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1458 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1459 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      }
      if (!_1456) {
        _1468 = ((half)(_1457 + _1220));
        _1469 = ((half)(_1458 + _1221));
        _1470 = ((half)(_1459 + _1222));
        _1471 = (_1454 + _1223);
        _1472 = (_1455 + _1224);
        _1473 = (_1225 + 1.0f);
      } else {
        _1468 = _1220;
        _1469 = _1221;
        _1470 = _1222;
        _1471 = _1223;
        _1472 = _1224;
        _1473 = _1225;
      }
      _1484 = ((((float)((uint)((uint)(((int)(_974 * -556260145)) & 16777215)))) * _984) - _976) + _957;
      _1485 = ((((float)((uint)((uint)(((int)(_974 * 902075297)) & 16777215)))) * _986) - _977) + _958;
      _1488 = (_1484 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.x) + -0.5f;
      _1489 = (_1485 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y) + -0.5f;
      _1490 = frac(_1488);
      _1491 = frac(_1489);
      _1494 = int(floor(_1488));
      _1495 = int(floor(_1489));
      _1496 = _1494 + 1u;
      _1497 = _1495 + 1u;
      if (!(((uint)_1494 > (uint)_1006) || ((uint)_1495 > (uint)_1007))) {
        _1503 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1494, _1495, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1505 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1496, _1495, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1507 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1494, _1497, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1509 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1496, _1497, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        half4 _1512 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1494, _1495, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load]
        _1520 = max(0.0f, (_959 - _1503.x));
        _1522 = max(0.0f, (_959 - _1507.x));
        _1536 = saturate(exp2((_1503.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1538 = saturate(exp2((_1507.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1548 = ((saturate(exp2((_1505.x - _959) * 432808.5f)) - _1536) * _1490) + _1536;
        _1549 = ((max(0.0f, (_959 - _1505.x)) - _1520) * _1490) + _1520;
        _1578 = _814 << 2;
        _1580 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1578 + 58))];
        _1585 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1578 + 59))];
        _1590 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1578 + 60))];
        _1595 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1578 + 61))];
        _1600 = mad(_1585.x, _1485, (_1580.x * _1484));
        _1602 = mad(_1590.x, _1503.x, _1600) + _1595.x;
        _1604 = mad(_1585.y, _1485, (_1580.y * _1484));
        _1606 = mad(_1590.y, _1503.x, _1604) + _1595.y;
        _1608 = mad(_1585.z, _1485, (_1580.z * _1484));
        _1610 = mad(_1590.z, _1503.x, _1608) + _1595.z;
        _1611 = -4.0f - _993;
        _1629 = mad(_1590.x, _1505.x, _1600) + _1595.x;
        _1631 = mad(_1590.y, _1505.x, _1604) + _1595.y;
        _1633 = mad(_1590.z, _1505.x, _1608) + _1595.z;
        _1651 = mad(_1590.x, _1507.x, _1600) + _1595.x;
        _1653 = mad(_1590.y, _1507.x, _1604) + _1595.y;
        _1655 = mad(_1590.z, _1507.x, _1608) + _1595.z;
        _1673 = mad(_1590.x, _1509.x, _1600) + _1595.x;
        _1675 = mad(_1590.y, _1509.x, _1604) + _1595.y;
        _1677 = mad(_1590.z, _1509.x, _1608) + _1595.z;
        _1702 = ((max(max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1494, _1495, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1602 + _1611), (_1611 - _1602)) * 0.25f), (max((_1606 + _1611), (_1611 - _1606)) * 0.25f)), (max((_1610 + _1611), (_1611 - _1610)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1496, _1495, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1629 + _1611), (_1611 - _1629)) * 0.25f), (max((_1631 + _1611), (_1611 - _1631)) * 0.25f)), (max((_1633 + _1611), (_1611 - _1633)) * 0.25f))))), max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1494, _1497, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1651 + _1611), (_1611 - _1651)) * 0.25f), (max((_1653 + _1611), (_1611 - _1653)) * 0.25f)), (max((_1655 + _1611), (_1611 - _1655)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1496, _1497, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1673 + _1611), (_1611 - _1673)) * 0.25f), (max((_1675 + _1611), (_1611 - _1675)) * 0.25f)), (max((_1677 + _1611), (_1611 - _1677)) * 0.25f)))))) * ((_1548 + -1.0f) + (((_1538 - _1548) + ((saturate(exp2((_1509.x - _959) * 432808.5f)) - _1538) * _1490)) * _1491))) + 1.0f);
        _1703 = ((((_1522 - _1549) + ((max(0.0f, (_959 - _1509.x)) - _1522) * _1490)) * _1491) + _1549);
        _1704 = false;
        _1705 = (half)(_1512.x);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1706 = (half)(_1512.y);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1707 = (half)(_1512.z);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      } else {
        _1702 = 1.0f;
        _1703 = 0.0f;
        _1704 = true;
        _1705 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1706 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1707 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      }
      if (!_1704) {
        _1716 = ((half)(_1705 + _1468));
        _1717 = ((half)(_1706 + _1469));
        _1718 = ((half)(_1707 + _1470));
        _1719 = (_1702 + _1471);
        _1720 = (_1703 + _1472);
        _1721 = (_1473 + 1.0f);
      } else {
        _1716 = _1468;
        _1717 = _1469;
        _1718 = _1470;
        _1719 = _1471;
        _1720 = _1472;
        _1721 = _1473;
      }
      _1732 = ((((float)((uint)((uint)(((int)(_974 * 1698214639)) & 16777215)))) * _984) - _976) + _957;
      _1733 = ((((float)((uint)((uint)(((int)(_974 * 773027713)) & 16777215)))) * _986) - _977) + _958;
      _1736 = (_1732 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.x) + -0.5f;
      _1737 = (_1733 * __3__35__0__0__ShadowConstantBuffer_view._dynmaicShadowSizeAndInvSize.y) + -0.5f;
      _1738 = frac(_1736);
      _1739 = frac(_1737);
      _1742 = int(floor(_1736));
      _1743 = int(floor(_1737));
      _1744 = _1742 + 1u;
      _1745 = _1743 + 1u;
      if (!(((uint)_1742 > (uint)_1006) || ((uint)_1743 > (uint)_1007))) {
        _1751 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1742, _1743, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1753 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1744, _1743, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1755 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1742, _1745, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        _1757 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1744, _1745, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowDepthArray_load]
        half4 _1760 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1742, _1743, _814, 0));  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load]
        _1768 = max(0.0f, (_959 - _1751.x));
        _1770 = max(0.0f, (_959 - _1755.x));
        _1784 = saturate(exp2((_1751.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1786 = saturate(exp2((_1755.x - _959) * 432808.5f));  // [sem: expr_sat]
        _1796 = ((saturate(exp2((_1753.x - _959) * 432808.5f)) - _1784) * _1738) + _1784;
        _1797 = ((max(0.0f, (_959 - _1753.x)) - _1768) * _1738) + _1768;
        _1826 = _814 << 2;
        _1828 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1826 + 58))];
        _1833 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1826 + 59))];
        _1838 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1826 + 60))];
        _1843 = __3__35__0__0__ShadowConstantBuffer_raw[((int)(_1826 + 61))];
        _1848 = mad(_1833.x, _1733, (_1828.x * _1732));
        _1850 = mad(_1838.x, _1751.x, _1848) + _1843.x;
        _1852 = mad(_1833.y, _1733, (_1828.y * _1732));
        _1854 = mad(_1838.y, _1751.x, _1852) + _1843.y;
        _1856 = mad(_1833.z, _1733, (_1828.z * _1732));
        _1858 = mad(_1838.z, _1751.x, _1856) + _1843.z;
        _1859 = -4.0f - _993;
        _1877 = mad(_1838.x, _1753.x, _1848) + _1843.x;
        _1879 = mad(_1838.y, _1753.x, _1852) + _1843.y;
        _1881 = mad(_1838.z, _1753.x, _1856) + _1843.z;
        _1899 = mad(_1838.x, _1755.x, _1848) + _1843.x;
        _1901 = mad(_1838.y, _1755.x, _1852) + _1843.y;
        _1903 = mad(_1838.z, _1755.x, _1856) + _1843.z;
        _1921 = mad(_1838.x, _1757.x, _1848) + _1843.x;
        _1923 = mad(_1838.y, _1757.x, _1852) + _1843.y;
        _1925 = mad(_1838.z, _1757.x, _1856) + _1843.z;
        _1950 = ((max(max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1742, _1743, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1850 + _1859), (_1859 - _1850)) * 0.25f), (max((_1854 + _1859), (_1859 - _1854)) * 0.25f)), (max((_1858 + _1859), (_1859 - _1858)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1744, _1743, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1877 + _1859), (_1859 - _1877)) * 0.25f), (max((_1879 + _1859), (_1859 - _1879)) * 0.25f)), (max((_1881 + _1859), (_1859 - _1881)) * 0.25f))))), max(max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1742, _1745, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1899 + _1859), (_1859 - _1899)) * 0.25f), (max((_1901 + _1859), (_1859 - _1901)) * 0.25f)), (max((_1903 + _1859), (_1859 - _1903)) * 0.25f)))), max(((float)((bool)(uint)(((((uint2)(__3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1744, _1745, _814, 0)))).x) & 1) != 0))), saturate(max(max((max((_1921 + _1859), (_1859 - _1921)) * 0.25f), (max((_1923 + _1859), (_1859 - _1923)) * 0.25f)), (max((_1925 + _1859), (_1859 - _1925)) * 0.25f)))))) * ((_1796 + -1.0f) + (((_1786 - _1796) + ((saturate(exp2((_1757.x - _959) * 432808.5f)) - _1786) * _1738)) * _1739))) + 1.0f);
        _1951 = ((((_1770 - _1797) + ((max(0.0f, (_959 - _1757.x)) - _1770) * _1738)) * _1739) + _1797);
        _1952 = false;
        _1953 = (half)(_1760.x);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1954 = (half)(_1760.y);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1955 = (half)(_1760.z);  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      } else {
        _1950 = 1.0f;
        _1951 = 0.0f;
        _1952 = true;
        _1953 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1954 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
        _1955 = 1.0h;  // [sem: _3__36__0__0__g_dynamicShadowColorArray_load_derived]
      }
      if (!_1952) {
        _1964 = ((half)(_1953 + _1716));
        _1965 = ((half)(_1954 + _1717));
        _1966 = ((half)(_1955 + _1718));
        _1967 = (_1950 + _1719);
        _1968 = (_1951 + _1720);
        _1969 = (_1721 + 1.0f);
      } else {
        _1964 = _1716;
        _1965 = _1717;
        _1966 = _1718;
        _1967 = _1719;
        _1968 = _1720;
        _1969 = _1721;
      }
      _1971 = 1.0f / max(_1969, 1.0f);
      _1981 = max((_1969 + 1.0f), 1.0f);
      _1985 = half(float(_1964 + _1953) / _1981);
      _1986 = half(float(_1965 + _1954) / _1981);
      _1987 = half(float(_1966 + _1955) / _1981);
      if (_814 == 1) {
        _1990 = float(_1985);
        _1991 = float(_1986);
        _1992 = float(_1987);
        _1993 = -0.0f - _699;
        _2007 = (half)(half((_1990 + _699) + (_1990 * _1993)));
        _2008 = (half)(half((_1991 + _699) + (_1991 * _1993)));
        _2009 = (half)(half((_1992 + _699) + (_1992 * _1993)));
      } else {
        _2007 = _1985;
        _2008 = _1986;
        _2009 = _1987;
      }
      _2012 = __3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_67, _68), 0.0f);  // [sem: _3__36__0__0__g_raytracedShadow_sampleLod]
      _2017 = _115 * 0.05000000074505806f;
      _2019 = 1.0f / _bufferSizeAndInvSize.x;
      _2020 = 1.0f / _bufferSizeAndInvSize.y;
      _2029 = _2012.x;
      _2030 = 1.0f;
      _2031 = 0;
      while(true) {
        _2040 = float((int)(_global_0[min((uint)(((int)(0u + (_2031 * 2)))), 15u)]));
        _2041 = float((int)(_global_0[min((uint)(((int)(1u + (_2031 * 2)))), 15u)]));
        _2042 = _2040 + _60;
        _2043 = _2041 + _61;
        _2056 = ((_2019 * 2.0f) * _2042) + -1.0f;
        _2057 = 1.0f - ((_2020 * 2.0f) * _2043);
        _2060 = max(1.0000000116860974e-07f, (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthStencil.Load(int3(int(_2042), int(_2043), 0)))).x) & 16777215)))) * 5.960465188081798e-08f));
        _2097 = mad((_invViewProjRelative[2].w), _2060, mad((_invViewProjRelative[1].w), _2057, ((_invViewProjRelative[0].w) * _2056))) + (_invViewProjRelative[3].w);
        _2101 = ((mad((_invViewProjRelative[2].x), _2060, mad((_invViewProjRelative[1].x), _2057, ((_invViewProjRelative[0].x) * _2056))) + (_invViewProjRelative[3].x)) / _2097) - _152;
        _2102 = ((mad((_invViewProjRelative[2].y), _2060, mad((_invViewProjRelative[1].y), _2057, ((_invViewProjRelative[0].y) * _2056))) + (_invViewProjRelative[3].y)) / _2097) - _153;
        _2103 = ((mad((_invViewProjRelative[2].z), _2060, mad((_invViewProjRelative[1].z), _2057, ((_invViewProjRelative[0].z) * _2056))) + (_invViewProjRelative[3].z)) / _2097) - _154;
        _2109 = sqrt(((_2102 * _2102) + (_2101 * _2101)) + (_2103 * _2103));
        _2111 = abs((_nearFarProj.x / _2060) - _115);
        _2112 = _2111 * _2111;
        if (!(_2112 > (_2017 * _2017))) {
          _2132 = (exp2((-1.4426950216293335f / ((_115 * 0.019999999552965164f) + 0.25f)) * ((_2112 * 20.0f) + ((_2109 * _2109) * 0.019999999552965164f))) * max(0.019999999552965164f, _2012.y));
        } else {
          _2132 = 0.0f;
        }
        _2134 = (_2132 * (((float2)(__3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(((_2040 * _2019) + _67), ((_2041 * _2020) + _68)), 0.0f))).x)) + _2029;
        _2135 = _2132 + _2030;
        _2136 = _2031 + 1;
        if (!(_2136 == 8)) {
          _2029 = _2134;
          _2030 = _2135;
          _2031 = _2136;
          continue;
        }
        while(true) {
          _2258 = min(_556, min((_1971 * _1967), ((1.0f / max(9.999999974752427e-07f, _2135)) * _2134)));  // [sem: expr_sat]
          _2259 = (_1971 * _1968);  // [sem: expr_sat]
          _2260 = _2007;
          _2261 = _2008;
          _2262 = _2009;
          break;
        }
        break;
      }
    }
    _2263 = (_813 != 0);
    _2265 = min(_556, select(_2263, _2258, 1.0f));
    _2269 = select((_697 != 0), select(_2263, (_2259 * 400.0f), 4e+06f), 1.0f);
    _2284 = (_2265 - (_shadowAOParams.x * _2265)) + _shadowAOParams.x;
    [branch]
    if (_2284 > 0.0f) {
      _2294 = _76 & 126;
      _2295 = (_2294 == 64);
      _2296 = (_80 == 66);
      _2297 = _2295 || _2296;
      _2298 = select(_2297, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _2314 = _sunDirection.x;
        _2315 = _sunDirection.y;
        _2316 = _sunDirection.z;
      } else {
        _2314 = _moonDirection.x;
        _2315 = _moonDirection.y;
        _2316 = _moonDirection.z;
      }
      _2317 = _58 & 3;
      _2321 = _59 & 3;
      _2327 = (_frameNumber.x * 1551) + ((uint)(((((_2321 << 1) | _2321) << 1) & 10) | (((_2317 << 1) | _2317) & 5)));
      _2332 = (((int)(_2327 << 2)) & -858993460) | (((uint)(_2327) >> 2) & 858993459);
      _2337 = (((int)(_2332 << 1)) & 10) | (((uint)(_2332) >> 1) & 21);
      _2340 = (float)((uint)(uint)(_frameNumber.x));
      _2351 = (frac(((_2340 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      _2352 = (frac(((_2340 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      _2357 = frac(dot(float3((_2351 * _2351), (_2352 * _2352), (_2352 * _2351)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      _2373 = frac((((float)((uint)((uint)((int)(uint(_2357 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f) + (((float)((uint)_2337)) * 0.03125f)) * 6.2831854820251465f;
      _2377 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * ((float)((uint)((uint)(reversebits(_2337) ^ (int)(uint(_2357 * 287478368.0f))))))) + _shadowAOParams.z;
      _2380 = sqrt(1.0f - (_2377 * _2377));
      _2383 = cos(_2373) * _2380;
      _2384 = sin(_2373) * _2380;
      _2386 = select((_2316 >= 0.0f), 1.0f, -1.0f);
      _2389 = -0.0f - (1.0f / (_2386 + _2316));
      _2390 = _2315 * _2389;
      _2391 = _2390 * _2314;
      _2392 = _2386 * _2314;
      _2401 = mad(_2377, _2314, mad(_2384, _2391, ((((_2392 * _2314) * _2389) + 1.0f) * _2383)));
      _2405 = mad(_2377, _2315, mad(_2384, (_2386 + (_2390 * _2315)), ((_2383 * _2386) * _2391)));
      _2409 = mad(_2377, _2316, mad(_2384, (-0.0f - _2315), (-0.0f - (_2392 * _2383))));
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x54654561 uses this native contact ray direction on Lighting High/Ultra Sun/Moon RT lanes; stable direction keeps Contact Micro Shadows from inheriting per-frame random cone wobble when the feature is enabled.
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _2401 = _2314;
        _2405 = _2315;
        _2409 = _2316;
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      _2410 = select(_2295, 10, 6);
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x54654561 raises native RT contact-ray samples only while Contact Micro Shadows is enabled, preserving the vanilla sample count when Off.
      if (CONTACT_SHADOW_RT_TUNING > 0.f) {
        _2410 = (int)(lerp(float(_2410), CONTACT_SHADOW_RT_MARCH_SAMPLES, CONTACT_SHADOW_RT_TUNING) + 0.5f);
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_170) {
        _2416 = min(0.5f, ((_115 * 0.0024999999441206455f) + 0.25f));
      } else {
        _2416 = 1.0f;
      }
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x54654561 extends RT contact reach gradually with Contact Micro Shadows quality; Off evaluates to the vanilla reach.
      _2422 = ((abs(_2315) * (select(_2297, 12.0f, 2.0f) - _2298)) + _2298) * select(_172, lerp(0.009999999776482582f, CONTACT_SHADOW_RT_REACH_TARGET, CONTACT_SHADOW_RT_TUNING), 0.10000000149011612f);
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_172) {
        _2430 = max((_115 * select(((uint)(_80 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _2422);
      } else {
        _2430 = _2422;
      }
      _2443 = (_terrainNormalParams.z > 0.0f);
      if (_2443) {
        _2447 = (float)((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _2608 = frac(frac(dot(float2(((_2447 * 32.665000915527344f) + _60), ((_2447 * 11.8149995803833f) + _61)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        _2469 = uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)));
        _2477 = ((uint)((((int)((_2469 << 4) + (uint)(-1383041155))) ^ ((int)(_2469 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_2469) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _2485 = ((uint)((((int)((_2477 << 4) + (uint)(-1556008596))) ^ ((int)(_2477 + 1013904242u))) ^ (((uint)(_2477) >> 5) + -939442524))) + _2469;
        _2493 = ((uint)((((int)((_2485 << 4) + (uint)(-1383041155))) ^ ((int)(_2485 + 1013904242u))) ^ ((int)(((uint)((uint)(_2485) >> 5)) + 2123724318u)))) + _2477;
        _2501 = ((uint)((((int)((_2493 << 4) + (uint)(-1556008596))) ^ ((int)(_2493 + (uint)(-626627285)))) ^ (((uint)(_2493) >> 5) + -939442524))) + _2485;
        _2509 = ((uint)((((int)((_2501 << 4) + (uint)(-1383041155))) ^ ((int)(_2501 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_2501) >> 5)) + 2123724318u)))) + _2493;
        _2517 = ((uint)((((int)((_2509 << 4) + (uint)(-1556008596))) ^ ((int)(_2509 + 2027808484u))) ^ (((uint)(_2509) >> 5) + -939442524))) + _2501;
        _2525 = ((uint)((((int)((_2517 << 4) + (uint)(-1383041155))) ^ ((int)(_2517 + 2027808484u))) ^ ((int)(((uint)((uint)(_2517) >> 5)) + 2123724318u)))) + _2509;
        _2533 = ((uint)((((int)((_2525 << 4) + (uint)(-1556008596))) ^ ((int)(_2525 + 387276957u))) ^ (((uint)(_2525) >> 5) + -939442524))) + _2517;
        _2541 = ((uint)((((int)((_2533 << 4) + (uint)(-1383041155))) ^ ((int)(_2533 + 387276957u))) ^ ((int)(((uint)((uint)(_2533) >> 5)) + 2123724318u)))) + _2525;
        _2549 = ((uint)((((int)((_2541 << 4) + (uint)(-1556008596))) ^ ((int)(_2541 + (uint)(-1253254570)))) ^ (((uint)(_2541) >> 5) + -939442524))) + _2533;
        _2557 = ((uint)((((int)((_2549 << 4) + (uint)(-1383041155))) ^ ((int)(_2549 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_2549) >> 5)) + 2123724318u)))) + _2541;
        _2565 = ((uint)((((int)((_2557 << 4) + (uint)(-1556008596))) ^ ((int)(_2557 + 1401181199u))) ^ (((uint)(_2557) >> 5) + -939442524))) + _2549;
        _2573 = ((uint)((((int)((_2565 << 4) + (uint)(-1383041155))) ^ ((int)(_2565 + 1401181199u))) ^ ((int)(((uint)((uint)(_2565) >> 5)) + 2123724318u)))) + _2557;
        _2581 = ((uint)((((int)((_2573 << 4) + (uint)(-1556008596))) ^ ((int)(_2573 + (uint)(-239350328)))) ^ (((uint)(_2573) >> 5) + -939442524))) + _2565;
        _2589 = ((uint)((((int)((_2581 << 4) + (uint)(-1383041155))) ^ ((int)(_2581 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_2581) >> 5)) + 2123724318u)))) + _2573;
        if ((_2581 & 16777215) == 0) {
          _2602 = ((int)(((uint)((((int)((_2589 << 4) + (uint)(-1556008596))) ^ ((int)(_2589 + (uint)(-1879881855)))) ^ (((uint)(_2589) >> 5) + -939442524))) + _2581));
        } else {
          _2602 = _2581;
        }
        _2608 = (((float)((uint)((uint)(((int)(_2602 * 48271)) & 16777215)))) * 5.960464477539063e-08f);
      }
      if (_2296 || ((_80 != 15) && ((uint)(_80 + -12) < (uint)7))) {
        // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
        // Description: SceneShadowTiledCS 0x54654561 moves the native RT contact start closer only while Contact Micro Shadows is enabled, preserving vanilla start distance when Off.
        _2621 = (_2608 * lerp(10.0f, CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING));
        // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      } else {
        if (_80 == 15) {
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x54654561 applies the same Contact Micro Shadows RT start-distance blend to the depth-faded material branch.
          _2621 = ((lerp((10.0f - (saturate(_115 * 0.0010000000474974513f) * 9.0f)), CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING)) * _2608);
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _2621 = _2608;
        }
      }
      if (_2294 == 12) {
        _2634 = (0.10000000149011612f - (abs(_2405) * 0.05000000074505806f));
      } else {
        if ((uint)_80 > (uint)15) {
          if (((uint)_80 < (uint)20) || (_80 == 107)) {
            _2634 = (0.10000000149011612f - (abs(_2405) * 0.05000000074505806f));
          } else {
            _2634 = 0.0f;
          }
        } else {
          _2634 = 0.0f;
        }
      }
      if (!_172) {
        _2636 = _2634 * _156;
        _2644 = (_152 - (_2636 * _152));
        _2645 = (_153 - (_2636 * _153));
        _2646 = (_154 - (_2636 * _154));
      } else {
        _2644 = _152;
        _2645 = _153;
        _2646 = _154;
      }
      if (!_2443) {
        _2650 = saturate(_115 * 0.0625f) * 0.05000000074505806f;
        _2655 = (_2650 * _103);
        _2656 = (_2650 * _104);
        _2657 = (_2650 * _105);
      } else {
        _2655 = 0.0f;
        _2656 = 0.0f;
        _2657 = 0.0f;
      }
      _2658 = _2655 + _2644;
      _2659 = _2656 + _2645;
      _2660 = _2657 + _2646;
      _2672 = mad((_viewRelative[2].z), _2660, mad((_viewRelative[1].z), _2659, ((_viewRelative[0].z) * _2658))) + (_viewRelative[3].z);
      _2675 = mad((_viewRelative[2].z), _2409, mad((_viewRelative[1].z), _2405, ((_viewRelative[0].z) * _2401)));
      _2683 = select((((_2675 * _2430) + _2672) < _nearFarProj.x), ((_nearFarProj.x - _2672) / _2675), _2430);
      _2715 = mad((_viewProjRelative[2].z), _2660, mad((_viewProjRelative[1].z), _2659, ((_viewProjRelative[0].z) * _2658))) + (_viewProjRelative[3].z);
      _2719 = mad((_viewProjRelative[2].w), _2660, mad((_viewProjRelative[1].w), _2659, ((_viewProjRelative[0].w) * _2658))) + (_viewProjRelative[3].w);
      _2723 = (_2683 * _2401) + _2658;
      _2724 = (_2683 * _2405) + _2659;
      _2725 = (_2683 * _2409) + _2660;
      _2741 = mad((_viewProjRelative[2].w), _2725, mad((_viewProjRelative[1].w), _2724, ((_viewProjRelative[0].w) * _2723))) + (_viewProjRelative[3].w);
      _2742 = (mad((_viewProjRelative[2].x), _2660, mad((_viewProjRelative[1].x), _2659, ((_viewProjRelative[0].x) * _2658))) + (_viewProjRelative[3].x)) / _2719;
      _2743 = (mad((_viewProjRelative[2].y), _2660, mad((_viewProjRelative[1].y), _2659, ((_viewProjRelative[0].y) * _2658))) + (_viewProjRelative[3].y)) / _2719;
      _2744 = _2715 / _2719;
      _2748 = ((mad((_viewProjRelative[2].x), _2725, mad((_viewProjRelative[1].x), _2724, ((_viewProjRelative[0].x) * _2723))) + (_viewProjRelative[3].x)) / _2741) - _2742;
      _2749 = ((mad((_viewProjRelative[2].y), _2725, mad((_viewProjRelative[1].y), _2724, ((_viewProjRelative[0].y) * _2723))) + (_viewProjRelative[3].y)) / _2741) - _2743;
      _2752 = 1.0f / ((float)((uint)_2410));
      _2763 = max(_2752, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_2748)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_2749))) * _2752))));
      _2764 = _2763 * (((mad((_viewProjRelative[2].z), _2725, mad((_viewProjRelative[1].z), _2724, ((_viewProjRelative[0].z) * _2723))) + (_viewProjRelative[3].z)) / _2741) - _2744);
      _2783 = ((_2416 * 0.5f) * max(abs(_2764), (_2744 - ((mad((_proj[2].z), _115, 0.0f) + _2715) / (mad((_proj[2].w), _115, 0.0f) + _2719))))) * max(0.0625f, _2752);
      _2784 = _2763 * _2752;
      _2786 = (_2748 * 0.5f) * _2784;
      _2788 = (_2749 * -0.5f) * _2784;
      _2789 = _2764 * _2752;
      _2796 = max(_2621, (1.0f / max((abs(_2786) * _bufferSizeAndInvSize.x), (abs(_2788) * _bufferSizeAndInvSize.y))));
      _2803 = 0.5f / _bufferSizeAndInvSize.x;
      _2805 = (((_2742 * 0.5f) + 0.5f) + (_2796 * _2786));
      _2806 = ((0.5f - (_2743 * 0.5f)) + (_2796 * _2788));
      _2807 = ((_2796 * _2789) + _2744);
      _2808 = _2621;
  // [sem: expr_sat]
      _2809 = saturate(((_115 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_103, _104, _105), float3((-0.0f - (_152 * _156)), (-0.0f - (_153 * _156)), (-0.0f - (_154 * _156))))))) + 0.009999999776482582f);
      _2810 = 0;
      _2811 = 0;
      _2812 = 1.0f;
      _2813 = 0.0f;
      while(true) {
  // [sem: _3__36__0__0__g_depthStencil_load]
        _2822 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_2805, _2803), (1.0f - _2803)) * _bufferSizeAndInvSize.x), int(_2806 * _bufferSizeAndInvSize.y), 0));
        _2824 = (uint)((uint)(_2822.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _2827 = ((float)((uint)((uint)(_2822.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _2828 = _2824 & 127;
        _2829 = (_2810 == 0);
        _2830 = select(_2829, 1.0f, _2809);
        _2831 = _2807 - _2827;
        _2835 = _nearFarProj.x / max(1.0000000116860974e-07f, _2827);
        _2838 = _2835 - (_nearFarProj.x / max(1.0000000116860974e-07f, _2807));
        _2841 = (abs(_2831 + _2783) < _2783);
        _2842 = (int)(uint)(_2841);
        if (_2841) {
          if ((_2828 == 7) || ((_2828 == 54) || (((_2824 & 126) == 66) || (((uint)(_2828 + -5) < (uint)2) || ((_2828 == 107) || ((_2828 == 26) || (((uint)(_2828 + -27) < (uint)2) || ((_2828 == 106) || (((_2824 & 125) == 105) || ((_2828 == 18) || ((uint)(_2828 + -19) < (uint)2))))))))))) {
            _2876 = true;
            _2883 = ((int)(uint)((int)((_2838 < 0.0f) && (_2838 > select(_2876, -0.07999999821186066f, -1.0f)))));
          } else {
            if ((uint)(_2828 + -53) < (uint)14) {
              _2876 = (_2835 < 32.0f);
              _2883 = ((int)(uint)((int)((_2838 < 0.0f) && (_2838 > select(_2876, -0.07999999821186066f, -1.0f)))));
            } else {
              _2883 = _2842;
            }
          }
        } else {
          _2883 = _2842;
        }
        if (!(_2883 == 0)) {
          if ((uint)_2828 > (uint)11) {
            if (!((uint)_2828 < (uint)18)) {
              if (!((_2828 == 18) || ((_2828 == 107) || ((uint)(_2828 + -19) < (uint)2)))) {
                if (!(_2828 == 66)) {
                  _2902 = 0.0f;
                } else {
                  _2902 = 0.10000000149011612f;
                }
              } else {
                _2902 = 0.15000000596046448f;
              }
            } else {
              _2902 = 0.10000000149011612f;
            }
          } else {
            if (!(_2828 == 11)) {
              _2902 = 0.0f;
            } else {
              _2902 = 0.10000000149011612f;
            }
          }
          _2904 = saturate(_2835 * 0.015625f);  // [sem: expr_sat]
          _2907 = (1.0f - _2904) + (_2904 * _2902);
          _2917 = _2828;
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x54654561 boosts native RT contact accumulation with Contact Micro Shadows quality so the helper and native RT contact terms share the same strength curve.
          float _rndxMicroFarAccum = saturate(1.0f - ((_2907 * _2907) * _2902)) * (1.0f - _2813);
          _2918 = saturate((_rndxMicroFarAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _2813);  // [sem: expr_sat]
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _2917 = _2811;
          _2918 = _2813;  // [sem: expr_sat]
        }
        [branch]
        if (_2918 > 0.949999988079071f) {
          if (!_2829) {
            _2949 = (saturate(_2812 / (_2812 - _2831)) - min(_2808, _2830));
          } else {
            _2949 = 0.0f;
          }
          _2958 = ((_2949 * _2786) + _2805);
          _2959 = ((_2949 * _2788) + _2806);
          _2960 = ((_2949 * _2789) + _2807);
          _2961 = _2827;
          _2962 = _2828;
        } else {
          if ((uint)_2810 < (uint)(_2410 + -1)) {
            _2941 = ((_2830 * _2786) + _2805);
            _2942 = ((_2830 * _2788) + _2806);
            _2943 = ((_2830 * _2789) + _2807);
            _2944 = (_2830 + _2808);
            _2945 = min(abs(_2789), _2831);
          } else {
            _2941 = _2805;
            _2942 = _2806;
            _2943 = _2807;
            _2944 = _2808;
            _2945 = _2812;
          }
          _2946 = _2810 + 1;
          if ((uint)_2946 < (uint)_2410) {
            _2805 = _2941;
            _2806 = _2942;
            _2807 = _2943;
            _2808 = _2944;
            _2809 = _2830;  // [sem: expr_sat]
            _2810 = _2946;
            _2811 = _2917;
            _2812 = _2945;
            _2813 = _2918;
            continue;
          } else {
            _2958 = 0.0f;
            _2959 = 0.0f;
            _2960 = -1.0f;
            _2961 = 0.0f;
            _2962 = _2917;
          }
        }
        _2966 = (_2918 > 0.0f);
        if (_2960 > 0.0f) {
          if (_2966 || (((_2958 >= 0.0f) && (_2958 <= 1.0f)) && ((_2959 >= 0.0f) && (_2959 <= 1.0f)))) {
            _2980 = (_2958 * 2.0f) + -1.0f;
            _2981 = 1.0f - (_2959 * 2.0f);
            _3017 = mad((_invViewProjRelative[2].w), _2960, mad((_invViewProjRelative[1].w), _2981, ((_invViewProjRelative[0].w) * _2980))) + (_invViewProjRelative[3].w);
            if (!(_2962 == 2)) {
              if (_2962 == 3) {
                _3041 = 0.0f;
                _3043 = _3041;
              } else {
                if (_2962 == 21) {
                  if (!(_80 == 21)) {
                    _3041 = 0.0f;
                    _3043 = _3041;
                  } else {
                    _3043 = 20.0f;
                  }
                } else {
                  _3034 = (_2962 == 22);
                  if (!((_80 == 22) && _3034)) {
                    _3041 = select(_3034, 0.0f, 1.0f);
                    _3043 = _3041;
                  } else {
                    _3043 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_80 == 2)) {
                _3041 = 0.0f;
                _3043 = _3041;
              } else {
                _3043 = 20.0f;
              }
            }
            if (!(_170 || (!(_2918 == 1.0f)))) {
  // [sem: expr_sat]
              _3067 = saturate(((((_2430 * 0.9375f) - max(0.0f, dot(float3(_2401, _2405, _2409), float3((((mad((_invViewProjRelative[2].x), _2960, mad((_invViewProjRelative[1].x), _2981, ((_invViewProjRelative[0].x) * _2980))) + (_invViewProjRelative[3].x)) / _3017) - _2658), (((mad((_invViewProjRelative[2].y), _2960, mad((_invViewProjRelative[1].y), _2981, ((_invViewProjRelative[0].y) * _2980))) + (_invViewProjRelative[3].y)) / _3017) - _2659), (((mad((_invViewProjRelative[2].z), _2960, mad((_invViewProjRelative[1].z), _2981, ((_invViewProjRelative[0].z) * _2980))) + (_invViewProjRelative[3].z)) / _3017) - _2660))))) * ((_115 * 0.015625f) + 1.5f)) / _2430) * 0.9375f);
            } else {
              _3067 = _2918;  // [sem: expr_sat]
            }
            _3068 = _3067 * saturate(exp2(min(0.0f, (((_115 * 0.018666666001081467f) + 0.13333334028720856f) + (_3043 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2961)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2960)))))) * 1.4426950216293335f));
            _3069 = _2962 & -2;
            if (!(_3069 == 6)) {
              if ((((_80 == 33) && (_2962 == 33)) || (!(_80 == 33) && ((_80 == 55) && (_2962 == 55))))) {
                _3146 = (_3068 * 0.009999999776482582f);
              } else {
                if (!((_2962 == 54) || (_3069 == 66)) || (((_2962 == 54) || (_3069 == 66)) && (!((_2294 == 66) || (_80 == 54))))) {
                  if (!_172) {
                    if ((uint)((int)(_2962 + (uint)(-53))) < (uint)15) {
                      _3143 = saturate(_115 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _3143 = 1.0f;  // [sem: expr_sat]
                    }
                    _3146 = (_3143 * _3068);
                  } else {
                    _3146 = _3068;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _3098 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _2958), int(_bufferSizeAndInvSize.y * _2959), 0));
                  _3104 = ((float)((uint)((uint)(((uint)((uint)(_3098.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _3107 = ((float)((uint)((uint)(_3098.x & 255)))) * 0.003921568859368563f;
                  _3111 = ((float)((uint)((uint)(((uint)((uint)(_3098.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _3112 = _3104 * _3104;
                  _3113 = _3107 * _3107;
                  _3114 = _3111 * _3111;
                  _3146 = (saturate(1.0f - (dot(float3((((_3112 * 0.6131200194358826f) + (_3113 * 0.3395099937915802f)) + (_3114 * 0.047370001673698425f)), (((_3112 * 0.07020000368356705f) + (_3113 * 0.9163600206375122f)) + (_3114 * 0.013450000435113907f)), (((_3112 * 0.02061999961733818f) + (_3113 * 0.10958000272512436f)) + (_3114 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _3068);
                }
              }
            } else {
              _3146 = (_3068 * 0.009999999776482582f);
            }
          } else {
            _3146 = 0.0f;
          }
        } else {
          if (_2966) {
            _2980 = (_2958 * 2.0f) + -1.0f;
            _2981 = 1.0f - (_2959 * 2.0f);
            _3017 = mad((_invViewProjRelative[2].w), _2960, mad((_invViewProjRelative[1].w), _2981, ((_invViewProjRelative[0].w) * _2980))) + (_invViewProjRelative[3].w);
            if (!(_2962 == 2)) {
              if (_2962 == 3) {
                _3041 = 0.0f;
                _3043 = _3041;
              } else {
                if (_2962 == 21) {
                  if (!(_80 == 21)) {
                    _3041 = 0.0f;
                    _3043 = _3041;
                  } else {
                    _3043 = 20.0f;
                  }
                } else {
                  _3034 = (_2962 == 22);
                  if (!((_80 == 22) && _3034)) {
                    _3041 = select(_3034, 0.0f, 1.0f);
                    _3043 = _3041;
                  } else {
                    _3043 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_80 == 2)) {
                _3041 = 0.0f;
                _3043 = _3041;
              } else {
                _3043 = 20.0f;
              }
            }
            if (!(_170 || (!(_2918 == 1.0f)))) {
  // [sem: expr_sat]
              _3067 = saturate(((((_2430 * 0.9375f) - max(0.0f, dot(float3(_2401, _2405, _2409), float3((((mad((_invViewProjRelative[2].x), _2960, mad((_invViewProjRelative[1].x), _2981, ((_invViewProjRelative[0].x) * _2980))) + (_invViewProjRelative[3].x)) / _3017) - _2658), (((mad((_invViewProjRelative[2].y), _2960, mad((_invViewProjRelative[1].y), _2981, ((_invViewProjRelative[0].y) * _2980))) + (_invViewProjRelative[3].y)) / _3017) - _2659), (((mad((_invViewProjRelative[2].z), _2960, mad((_invViewProjRelative[1].z), _2981, ((_invViewProjRelative[0].z) * _2980))) + (_invViewProjRelative[3].z)) / _3017) - _2660))))) * ((_115 * 0.015625f) + 1.5f)) / _2430) * 0.9375f);
            } else {
              _3067 = _2918;  // [sem: expr_sat]
            }
            _3068 = _3067 * saturate(exp2(min(0.0f, (((_115 * 0.018666666001081467f) + 0.13333334028720856f) + (_3043 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2961)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2960)))))) * 1.4426950216293335f));
            _3069 = _2962 & -2;
            if (!(_3069 == 6)) {
              if ((((_80 == 33) && (_2962 == 33)) || (!(_80 == 33) && ((_80 == 55) && (_2962 == 55))))) {
                _3146 = (_3068 * 0.009999999776482582f);
              } else {
                if (!((_2962 == 54) || (_3069 == 66)) || (((_2962 == 54) || (_3069 == 66)) && (!((_2294 == 66) || (_80 == 54))))) {
                  if (!_172) {
                    if ((uint)((int)(_2962 + (uint)(-53))) < (uint)15) {
                      _3143 = saturate(_115 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _3143 = 1.0f;  // [sem: expr_sat]
                    }
                    _3146 = (_3143 * _3068);
                  } else {
                    _3146 = _3068;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _3098 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _2958), int(_bufferSizeAndInvSize.y * _2959), 0));
                  _3104 = ((float)((uint)((uint)(((uint)((uint)(_3098.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _3107 = ((float)((uint)((uint)(_3098.x & 255)))) * 0.003921568859368563f;
                  _3111 = ((float)((uint)((uint)(((uint)((uint)(_3098.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _3112 = _3104 * _3104;
                  _3113 = _3107 * _3107;
                  _3114 = _3111 * _3111;
                  _3146 = (saturate(1.0f - (dot(float3((((_3112 * 0.6131200194358826f) + (_3113 * 0.3395099937915802f)) + (_3114 * 0.047370001673698425f)), (((_3112 * 0.07020000368356705f) + (_3113 * 0.9163600206375122f)) + (_3114 * 0.013450000435113907f)), (((_3112 * 0.02061999961733818f) + (_3113 * 0.10958000272512436f)) + (_3114 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _3068);
                }
              }
            } else {
              _3146 = (_3068 * 0.009999999776482582f);
            }
          } else {
            _3146 = 0.0f;
          }
        }
        _3150 = saturate(1.0f - _3146);  // [sem: expr_sat]
        break;
      }
    } else {
      _3150 = 1.0f;  // [sem: expr_sat]
    }
    // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
    // Description: SceneShadowTiledCS 0x54654561 fills sub-pixel occluders in the Lighting High/Ultra Sun/Moon RT shadow sibling, then applies the existing RT final-strength blend and edge fade.
    float _rndxMicroBaseContact = _3150;
    _3150 = ApplyContactMicroDetailShadow(
        _3150,
        float2(_60, _61),
        _115,
        _76,
        float3(_2314, _2315, _2316),
        float3(_2658, _2659, _2660),
        CONTACT_MICRO_DETAIL_STRENGTH_RT,
        (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_FADE_SLOPE_RT_FULL : -0.025f),
        (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_FADE_OFFSET_RT_FULL : 3.0f),
        CONTACT_MICRO_RANGE_NEAR_RT,
        CONTACT_MICRO_RANGE_FAR_RT,
        CONTACT_MICRO_THICKNESS_MULTIPLIER_RT,
        CONTACT_MICRO_OCCLUSION_SCALE_RT,
        CONTACT_MICRO_SELF_REJECT_PIXELS_RT,
        CONTACT_MICRO_SELF_FADE_PIXELS_RT,
        CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_RT,
        CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_RT);
    if (CONTACT_SHADOW_RT_TUNING > 0.f) {
      float _rndxMicroWithHelper = _3150;
      float _rndxMicroBaseBoosted = _rndxMicroBaseContact;
      float _rndxMicroHelperBoosted = _rndxMicroWithHelper;
      if (_rndxMicroBaseBoosted < 1.0f) {
        _rndxMicroBaseBoosted = saturate(1.0f - ((1.0f - _rndxMicroBaseBoosted) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
      }
      if (_rndxMicroHelperBoosted < 1.0f) {
        _rndxMicroHelperBoosted = saturate(1.0f - ((1.0f - _rndxMicroHelperBoosted) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
      }
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _rndxMicroHelperBoosted < _rndxMicroBaseBoosted) {
        float2 _rndxMicroScreenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                           (_61 + 0.5f) * _bufferSizeAndInvSize.w);
        float2 _rndxMicroEdgeDist = min(_rndxMicroScreenUV, 1.0f - _rndxMicroScreenUV);
        float _rndxMicroEdgeFade = saturate(min(_rndxMicroEdgeDist.x, _rndxMicroEdgeDist.y) * 10.0f);
        _3150 = lerp(_rndxMicroBaseBoosted, _rndxMicroHelperBoosted, _rndxMicroEdgeFade);
      } else {
        _3150 = _rndxMicroHelperBoosted;
      }
    }
    // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
    _3151 = min(_2284, _3150);
    _3165 = float(half(_3151 * float(_2260)));
    _3166 = float(half(_3151 * float(_2261)));
    _3167 = float(half(_3151 * float(_2262)));
  // [sem: expr_sat]
    _3168 = saturate((1.0f - _556) + (exp2(log2(saturate(select(_172, (_2269 + 0.9800000190734863f), _2269))) * 0.45454543828964233f) * _556));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(_58, _59)] = float4((half)(half(_3165)), (half)(half(_3166)), (half)(half(_3167)), (half)(half(_3168)));
}
