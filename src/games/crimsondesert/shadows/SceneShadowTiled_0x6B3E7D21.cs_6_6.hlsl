#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t40, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t236, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t238, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t239, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t19, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t52, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t53, space36);

Texture2D<float> __3__36__0__0__g_nearFieldShadowDepth : register(t101, space36);

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
  float4 _shadowDepthRanges : packoffset(c000.x);
  float4 _massiveShadowSizeAndInvSize : packoffset(c001.x);
  uint4 _shadowParam : packoffset(c002.x);
  int4 _updateIndex : packoffset(c003.x);
  float4 _jitterOffset[8] : packoffset(c004.x);
  float4 _shadowRelativePosition : packoffset(c012.x);
  float4 _dynmaicShadowSizeAndInvSize : packoffset(c013.x);
  row_major float4x4 _dynamicShadowProjTexScale[2] : packoffset(c014.x);
  row_major float4x4 _dynamicShadowProjRelativeTexScale[2] : packoffset(c022.x);
  float4 _dynamicShadowFrustumPlanes0[6] : packoffset(c030.x);
  float4 _dynamicShadowFrustumPlanes1[6] : packoffset(c036.x);
  row_major float4x4 _dynamicShadowViewProj[2] : packoffset(c042.x);
  row_major float4x4 _dynamicShadowViewProjPrev[2] : packoffset(c050.x);
  row_major float4x4 _invDynamicShadowViewProj[2] : packoffset(c058.x);
  float4 _dynamicShadowPosition[2] : packoffset(c066.x);
  float4 _shadowSizeAndInvSize : packoffset(c068.x);
  row_major float4x4 _shadowProjTexScale[2] : packoffset(c069.x);
  row_major float4x4 _shadowProjRelativeTexScale[2] : packoffset(c077.x);
  float4 _staticShadowPosition[2] : packoffset(c085.x);
  row_major float4x4 _shadowViewProj[2] : packoffset(c087.x);
  row_major float4x4 _shadowViewProjRelative[2] : packoffset(c095.x);
  row_major float4x4 _invShadowViewProj[2] : packoffset(c103.x);
  float4 _currShadowFrustumPlanes[6] : packoffset(c111.x);
  row_major float4x4 _currShadowViewProjRelative : packoffset(c117.x);
  row_major float4x4 _currInvShadowViewProjRelative : packoffset(c121.x);
  float4 _currStaticShadowPosition : packoffset(c125.x);
  float4 _currTerrainShadowFrustumPlanes[6] : packoffset(c126.x);
  row_major float4x4 _terrainShadowProjTexScale : packoffset(c132.x);
  row_major float4x4 _terrainShadowProjRelativeTexScale : packoffset(c136.x);
  row_major float4x4 _terrainShadowViewProj : packoffset(c140.x);
  row_major float4x4 _nearFieldShadowViewProj : packoffset(c144.x);
  float4 _nearFieldShadowFlag : packoffset(c148.x);
  float4 _nearFieldShadowFrustumPlanes[6] : packoffset(c149.x);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  struct {
    uint4 g_tileIndex[4096];
  } __3__35__0__0__TileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__TileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__35__0__0__NearFieldShadowConstantBuffer : register(b34, space35) {
  float4 _nearFieldShadowBoundsMin : packoffset(c000.x);
  float4 _nearFieldShadowBoundsMax : packoffset(c001.x);
  row_major float4x4 _nearFieldShadowViewProjCompacted : packoffset(c002.x);
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

static const float _global_0[32] = { -7.0f, -8.0f, 0.0f, -7.0f, -4.0f, -6.0f, 3.0f, -5.0f, 7.0f, -4.0f, -1.0f, -3.0f, -5.0f, -2.0f, 4.0f, -1.0f, -8.0f, 0.0f, 1.0f, 1.0f, -3.0f, 2.0f, 5.0f, 3.0f, -6.0f, 4.0f, 2.0f, 5.0f, -2.0f, 6.0f, 6.0f, 7.0f };

#include "micro_detail_shadows.hlsli"

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int4 _33;
  int _43;
  int _47;
  uint _59;
  uint _60;
  float _61;
  float _62;
  float _70;
  float _73;
  uint _75;
  int _77;
  float _80;
  int _81;
  uint _83;
  float _99;
  float _100;
  float _101;
  float _103;
  float _104;
  float _105;
  float _106;
  bool _108;
  int _378;
  float _557;
  float _631;
  int _632;
  float _633;
  float _697;
  int _698;
  int _699;
  float _700;
  float _762;
  int _763;
  int _764;
  float _813;
  int _814;
  int _815;
  int _974;
  int _1146;
  float _1249;
  float _1250;
  half _1251;
  half _1252;
  half _1253;
  float _1330;
  float _1331;
  float _1332;
  int _1377;
  int _1413;
  float _1427;
  float _1440;
  int _1441;
  float _1532;
  float _1533;
  float _1534;
  float _1536;
  int _1537;
  float _1577;
  float _1578;
  float _1621;
  float _1622;
  float _1623;
  float _1723;
  float _1737;
  int _1909;
  float _1915;
  float _1928;
  float _1941;
  float _1951;
  float _1952;
  float _1953;
  float _1962;
  float _1963;
  float _1964;
  float _2112;
  float _2113;
  float _2114;
  float _2115;
  float _2116;
  int _2117;
  int _2118;
  float _2119;
  float _2120;
  bool _2183;
  int _2190;
  float _2209;
  int _2224;
  float _2225;
  float _2248;
  float _2249;
  float _2250;
  float _2251;
  float _2252;
  float _2256;
  float _2265;
  float _2266;
  float _2267;
  float _2268;
  int _2269;
  float _2348;
  float _2350;
  float _2374;
  float _2450;
  float _2453;
  float _2457;
  float _2472;
  float _2473;
  float _2474;
  float _2475;
  float _111;
  float _115;
  float _116;
  float _152;
  float _153;
  float _154;
  float _155;
  float _157;
  bool _171;
  bool _173;
  float _193;
  float _197;
  float _201;
  float _212;
  float _223;
  float _224;
  float _229;
  uint _245;
  uint _253;
  uint _261;
  uint _269;
  uint _277;
  uint _285;
  uint _293;
  uint _301;
  uint _309;
  uint _317;
  uint _325;
  uint _333;
  uint _341;
  uint _349;
  uint _357;
  uint _365;
  uint _383;
  float _390;
  float _396;
  float _397;
  float _399;
  float _406;
  float _408;
  float _410;
  float _411;
  float _416;
  float4 _420;
  float _425;
  float _430;
  float _432;
  float _439;
  float _449;
  float _450;
  float _455;
  float4 _457;
  float _466;
  float _468;
  float _475;
  float _486;
  float _487;
  float _492;
  float4 _494;
  float _503;
  float _505;
  float _512;
  float _523;
  float _524;
  float _529;
  float4 _531;
  float _540;
  float _542;
  float _549;
  float _565;
  float _585;
  float _589;
  float _593;
  float _594;
  float _595;
  float _620;
  float _621;
  float _653;
  float _657;
  float _661;
  float _686;
  float _687;
  bool _701;
  float _709;
  float _710;
  float _711;
  float _716;
  float _717;
  float _718;
  float _738;
  float _742;
  float _746;
  float _747;
  float _748;
  float _769;
  float _770;
  float _771;
  float _791;
  float _795;
  float _799;
  uint _831;
  uint _839;
  uint _847;
  uint _855;
  uint _863;
  uint _871;
  uint _879;
  uint _887;
  uint _895;
  uint _903;
  uint _911;
  uint _919;
  uint _927;
  uint _935;
  uint _943;
  uint _951;
  bool _953;
  float _957;
  float _958;
  float _959;
  float _961;
  float _975;
  float _976;
  float _977;
  float _984;
  float _986;
  float _990;
  float _991;
  float _992;
  float _999;
  half4 _1006;
  float _1020;
  float _1021;
  half4 _1030;
  float _1046;
  float _1047;
  half4 _1056;
  float _1072;
  float _1073;
  half4 _1082;
  float _1088;
  float _1089;
  half _1108;
  half _1109;
  half _1110;
  float _1113;
  float _1114;
  float _1115;
  float _1116;
  float _1133;
  float _1134;
  float _1135;
  float _1147;
  float _1148;
  float _1155;
  float _1157;
  float _1161;
  float _1162;
  float _1163;
  float _1170;
  float _1186;
  float _1187;
  float _1208;
  float _1209;
  float _1230;
  float _1231;
  float _1242;
  float _1243;
  bool _1254;
  float _1256;
  float _1260;
  float _1261;
  bool _1270;
  float _1345;
  float _1356;
  float _1357;
  float _1362;
  uint _1382;
  float _1395;
  float _1396;
  float _1398;
  float _1399;
  float _1400;
  float _1401;
  uint _1418;
  float _1433;
  float _1434;
  float _1435;
  int _1444;
  float _1453;
  float _1454;
  float _1470;
  int _1471;
  int _1540;
  float _1549;
  float _1550;
  float _1567;
  int _1568;
  float _1591;
  int _1601;
  bool _1602;
  bool _1603;
  bool _1604;
  float _1605;
  int _1624;
  int _1628;
  uint _1634;
  int _1639;
  int _1644;
  float _1647;
  float _1658;
  float _1659;
  float _1664;
  float _1680;
  float _1684;
  float _1687;
  float _1690;
  float _1691;
  float _1693;
  float _1696;
  float _1697;
  float _1698;
  float _1699;
  float _1708;
  float _1712;
  float _1716;
  int _1717;
  float _1729;
  bool _1750;
  float _1754;
  uint _1776;
  uint _1784;
  uint _1792;
  uint _1800;
  uint _1808;
  uint _1816;
  uint _1824;
  uint _1832;
  uint _1840;
  uint _1848;
  uint _1856;
  uint _1864;
  uint _1872;
  uint _1880;
  uint _1888;
  uint _1896;
  float _1943;
  float _1957;
  float _1965;
  float _1966;
  float _1967;
  float _1979;
  float _1982;
  float _1990;
  float _2022;
  float _2026;
  float _2030;
  float _2031;
  float _2032;
  float _2048;
  float _2049;
  float _2050;
  float _2051;
  float _2055;
  float _2056;
  float _2059;
  float _2070;
  float _2071;
  float _2090;
  float _2091;
  float _2093;
  float _2095;
  float _2096;
  float _2103;
  float _2110;
  uint _2129;
  int _2131;
  float _2134;
  int _2135;
  bool _2136;
  float _2137;
  float _2138;
  float _2142;
  float _2145;
  bool _2148;
  int _2149;
  float _2211;
  float _2214;
  int _2253;
  bool _2273;
  float _2287;
  float _2288;
  float _2324;
  bool _2341;
  float _2375;
  int _2376;
  uint4 _2405;
  float _2411;
  float _2414;
  float _2418;
  float _2419;
  float _2420;
  float _2421;
  float _2458;
  int __loop_jump_target = -1;
  int _18[4];
  float _27[2];
  float _28[2];
  float _29[2];
  _33 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _18[0] = _33.x;
  _18[1] = _33.y;
  _18[2] = _33.z;
  _18[3] = _33.w;
  _43 = _18[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _47 = select((((int)(SV_GroupID.x) & 16) == 0), _43, ((uint)(_43) >> 16));
  _59 = ((uint)(((((int)(_47 << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x;
  _60 = ((uint)(((((uint)(_47) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y;
  _61 = (float)((uint)_59);
  _62 = (float)((uint)_60);
  _70 = ((_bufferSizeAndInvSize.z * 2.0f) * (_61 + 0.5f)) + -1.0f;
  _73 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_62 + 0.5f));
  _75 = __3__36__0__0__g_depthStencil.Load(int3(_59, _60, 0));  // [sem: _3__36__0__0__g_depthStencil_load]
  _77 = (uint)((uint)(_75.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _80 = ((float)((uint)((uint)(_75.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _81 = _77 & 127;
  _83 = __3__36__0__0__g_sceneNormal.Load(int3(_59, _60, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
  _99 = min(1.0f, ((((float)((uint)((uint)(_83.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _100 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_83.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _101 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_83.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _103 = rsqrt(dot(float3(_99, _100, _101), float3(_99, _100, _101)));  // [sem: invLength]
  _104 = _103 * _99;
  _105 = _103 * _100;
  _106 = _103 * _101;
  _108 = (_80 == 1.0f);
  if ((_80 < 1.0000000116860974e-07f) || _108) {
    _111 = select(_108, 0.0f, 1.0f);
    _2472 = _111;
    _2473 = _111;
    _2474 = _111;
    _2475 = _111;  // [sem: expr_sat]
  } else {
    _115 = max(1.0000000116860974e-07f, _80);
    _116 = _nearFarProj.x / _115;
    _152 = mad((_invViewProjRelative[2].w), _115, mad((_invViewProjRelative[1].w), _73, ((_invViewProjRelative[0].w) * _70))) + (_invViewProjRelative[3].w);
    _153 = (mad((_invViewProjRelative[2].x), _115, mad((_invViewProjRelative[1].x), _73, ((_invViewProjRelative[0].x) * _70))) + (_invViewProjRelative[3].x)) / _152;
    _154 = (mad((_invViewProjRelative[2].y), _115, mad((_invViewProjRelative[1].y), _73, ((_invViewProjRelative[0].y) * _70))) + (_invViewProjRelative[3].y)) / _152;
    _155 = (mad((_invViewProjRelative[2].z), _115, mad((_invViewProjRelative[1].z), _73, ((_invViewProjRelative[0].z) * _70))) + (_invViewProjRelative[3].z)) / _152;
    _157 = rsqrt(dot(float3(_153, _154, _155), float3(_153, _154, _155)));  // [sem: invLength]
    _27[0] = 0.0f;
    _28[0] = 0.0f;
    _29[0] = 0.0f;
    _27[1] = 0.0f;
    _28[1] = 0.0f;
    _29[1] = 0.0f;
    _171 = ((uint)(_81 + -53) < (uint)15);
    _173 = (_81 == 57) || _171;
    _193 = mad((_terrainShadowProjRelativeTexScale[2].x), _155, mad((_terrainShadowProjRelativeTexScale[1].x), _154, ((_terrainShadowProjRelativeTexScale[0].x) * _153))) + (_terrainShadowProjRelativeTexScale[3].x);
    _197 = mad((_terrainShadowProjRelativeTexScale[2].y), _155, mad((_terrainShadowProjRelativeTexScale[1].y), _154, ((_terrainShadowProjRelativeTexScale[0].y) * _153))) + (_terrainShadowProjRelativeTexScale[3].y);
    _201 = mad((_terrainShadowProjRelativeTexScale[2].z), _155, mad((_terrainShadowProjRelativeTexScale[1].z), _154, ((_terrainShadowProjRelativeTexScale[0].z) * _153))) + (_terrainShadowProjRelativeTexScale[3].z);
    if (saturate(_193) == _193) {
      if ((_201 >= 9.999999747378752e-05f) && ((_201 <= 1.0f) && (saturate(_197) == _197))) {
        _212 = (float)((uint)(uint)(_frameNumber.x));
        _223 = (frac(((_212 * 92.0f) + _61) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        _224 = (frac(((_212 * 71.0f) + _62) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        _229 = frac(dot(float3((_223 * _223), (_224 * _224), (_224 * _223)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        _245 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_62 * _bufferSizeAndInvSize.x) + _61);
        _253 = ((uint)((((int)((_245 << 4) + (uint)(-1383041155))) ^ ((int)(_245 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_245) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _261 = ((uint)((((int)((_253 << 4) + (uint)(-1556008596))) ^ ((int)(_253 + 1013904242u))) ^ (((uint)(_253) >> 5) + -939442524))) + _245;
        _269 = ((uint)((((int)((_261 << 4) + (uint)(-1383041155))) ^ ((int)(_261 + 1013904242u))) ^ ((int)(((uint)((uint)(_261) >> 5)) + 2123724318u)))) + _253;
        _277 = ((uint)((((int)((_269 << 4) + (uint)(-1556008596))) ^ ((int)(_269 + (uint)(-626627285)))) ^ (((uint)(_269) >> 5) + -939442524))) + _261;
        _285 = ((uint)((((int)((_277 << 4) + (uint)(-1383041155))) ^ ((int)(_277 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_277) >> 5)) + 2123724318u)))) + _269;
        _293 = ((uint)((((int)((_285 << 4) + (uint)(-1556008596))) ^ ((int)(_285 + 2027808484u))) ^ (((uint)(_285) >> 5) + -939442524))) + _277;
        _301 = ((uint)((((int)((_293 << 4) + (uint)(-1383041155))) ^ ((int)(_293 + 2027808484u))) ^ ((int)(((uint)((uint)(_293) >> 5)) + 2123724318u)))) + _285;
        _309 = ((uint)((((int)((_301 << 4) + (uint)(-1556008596))) ^ ((int)(_301 + 387276957u))) ^ (((uint)(_301) >> 5) + -939442524))) + _293;
        _317 = ((uint)((((int)((_309 << 4) + (uint)(-1383041155))) ^ ((int)(_309 + 387276957u))) ^ ((int)(((uint)((uint)(_309) >> 5)) + 2123724318u)))) + _301;
        _325 = ((uint)((((int)((_317 << 4) + (uint)(-1556008596))) ^ ((int)(_317 + (uint)(-1253254570)))) ^ (((uint)(_317) >> 5) + -939442524))) + _309;
        _333 = ((uint)((((int)((_325 << 4) + (uint)(-1383041155))) ^ ((int)(_325 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_325) >> 5)) + 2123724318u)))) + _317;
        _341 = ((uint)((((int)((_333 << 4) + (uint)(-1556008596))) ^ ((int)(_333 + 1401181199u))) ^ (((uint)(_333) >> 5) + -939442524))) + _325;
        _349 = ((uint)((((int)((_341 << 4) + (uint)(-1383041155))) ^ ((int)(_341 + 1401181199u))) ^ ((int)(((uint)((uint)(_341) >> 5)) + 2123724318u)))) + _333;
        _357 = ((uint)((((int)((_349 << 4) + (uint)(-1556008596))) ^ ((int)(_349 + (uint)(-239350328)))) ^ (((uint)(_349) >> 5) + -939442524))) + _341;
        _365 = ((uint)((((int)((_357 << 4) + (uint)(-1383041155))) ^ ((int)(_357 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_357) >> 5)) + 2123724318u)))) + _349;
        if ((_357 & 16777215) == 0) {
          _378 = ((int)(((uint)((((int)((_365 << 4) + (uint)(-1556008596))) ^ ((int)(_365 + (uint)(-1879881855)))) ^ (((uint)(_365) >> 5) + -939442524))) + _357));
        } else {
          _378 = _357;
        }
        _383 = uint(((float)((uint)((uint)(((int)(_378 * 48271)) & 16777215)))) * 3.814637693722034e-06f);
        _390 = frac((((float)((uint)_383)) * 0.015625f) + (((float)((uint)((uint)((int)(uint(_229 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f));
        _396 = (_390 * 2.0f) + -1.0f;
        _397 = (((float)((uint)((uint)(reversebits(_383) ^ (int)(uint(_229 * 287478368.0f)))))) * 4.656612873077393e-10f) + -1.0f;
        _399 = rsqrt(dot(float2(_396, _397), float2(_396, _397)));  // [sem: invLength]
        _406 = ((_390 * 0.0009765625f) + -0.00048828125f) * _399;
        _408 = (_397 * _399) * 0.00048828125f;
        _410 = (_406 * (_jitterOffset[0].x)) + _193;
        _411 = (_408 * (_jitterOffset[0].y)) + _197;
        _416 = frac((_410 * 1024.0f) + -0.5f);
        _420 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_410, _411));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _425 = _201 + -0.004999999888241291f;
        _430 = select((_420.w > _425), 1.0f, 0.0f);
        _432 = select((_420.x > _425), 1.0f, 0.0f);
        _439 = ((select((_420.z > _425), 1.0f, 0.0f) - _430) * _416) + _430;
        _449 = ((_jitterOffset[1].x) * _406) + _193;
        _450 = ((_jitterOffset[1].y) * _408) + _197;
        _455 = frac((_449 * 1024.0f) + -0.5f);
        _457 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_449, _450));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _466 = select((_457.w > _425), 1.0f, 0.0f);
        _468 = select((_457.x > _425), 1.0f, 0.0f);
        _475 = ((select((_457.z > _425), 1.0f, 0.0f) - _466) * _455) + _466;
        _486 = ((_jitterOffset[2].x) * _406) + _193;
        _487 = ((_jitterOffset[2].y) * _408) + _197;
        _492 = frac((_486 * 1024.0f) + -0.5f);
        _494 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_486, _487));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _503 = select((_494.w > _425), 1.0f, 0.0f);
        _505 = select((_494.x > _425), 1.0f, 0.0f);
        _512 = ((select((_494.z > _425), 1.0f, 0.0f) - _503) * _492) + _503;
        _523 = ((_jitterOffset[3].x) * _406) + _193;
        _524 = ((_jitterOffset[3].y) * _408) + _197;
        _529 = frac((_523 * 1024.0f) + -0.5f);
        _531 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_523, _524));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _540 = select((_531.w > _425), 1.0f, 0.0f);
        _542 = select((_531.x > _425), 1.0f, 0.0f);
        _549 = ((select((_531.z > _425), 1.0f, 0.0f) - _540) * _529) + _540;
        _557 = ((((saturate((((((select((_457.y > _425), 1.0f, 0.0f) - _468) * _455) + _468) - _475) * frac((_450 * 1024.0f) + -0.5f)) + _475) + saturate((((((select((_420.y > _425), 1.0f, 0.0f) - _432) * _416) + _432) - _439) * frac((_411 * 1024.0f) + -0.5f)) + _439)) + saturate((((((select((_494.y > _425), 1.0f, 0.0f) - _505) * _492) + _505) - _512) * frac((_487 * 1024.0f) + -0.5f)) + _512)) + saturate((((((select((_531.y > _425), 1.0f, 0.0f) - _542) * _529) + _542) - _549) * frac((_524 * 1024.0f) + -0.5f)) + _549)) * 0.25f);
      } else {
        _557 = 1.0f;
      }
    } else {
      _557 = 1.0f;
    }
    _565 = sqrt(((_154 * _154) + (_153 * _153)) + (_155 * _155));
    _585 = mad((_dynamicShadowProjRelativeTexScale[1][2].x), _155, mad((_dynamicShadowProjRelativeTexScale[1][1].x), _154, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _153))) + (_dynamicShadowProjRelativeTexScale[1][3].x);
    _589 = mad((_dynamicShadowProjRelativeTexScale[1][2].y), _155, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _154, ((_dynamicShadowProjRelativeTexScale[1][0].y) * _153))) + (_dynamicShadowProjRelativeTexScale[1][3].y);
    _593 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _155, mad((_dynamicShadowProjRelativeTexScale[1][1].z), _154, ((_dynamicShadowProjRelativeTexScale[1][0].z) * _153))) + (_dynamicShadowProjRelativeTexScale[1][3].z);
    _594 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    _595 = 1.0f - _594;
    if (!(((!(_585 <= _595)) || (!(_585 >= _594))) || (!(_589 <= _595)))) {
      if ((_565 < 128.0f) && ((_593 >= -1.0f) && ((_593 <= 1.0f) && (_589 >= _594)))) {
        _620 = max(0.0f, ((abs((_585 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _621 = max(0.0f, ((abs((_589 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _27[1] = _585;
        _28[1] = _589;
        _29[1] = _593;
        _631 = select((_terrainNormalParams.y > 0.0f), 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _632 = 1;
        _633 = sqrt((_621 * _621) + (_620 * _620));
      } else {
        _631 = 0.0f;
        _632 = 0;
        _633 = 0.0f;
      }
    } else {
      _631 = 0.0f;
      _632 = 0;
      _633 = 0.0f;
    }
    _653 = mad((_dynamicShadowProjRelativeTexScale[0][2].x), _155, mad((_dynamicShadowProjRelativeTexScale[0][1].x), _154, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _153))) + (_dynamicShadowProjRelativeTexScale[0][3].x);
    _657 = mad((_dynamicShadowProjRelativeTexScale[0][2].y), _155, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _154, ((_dynamicShadowProjRelativeTexScale[0][0].y) * _153))) + (_dynamicShadowProjRelativeTexScale[0][3].y);
    _661 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _155, mad((_dynamicShadowProjRelativeTexScale[0][1].z), _154, ((_dynamicShadowProjRelativeTexScale[0][0].z) * _153))) + (_dynamicShadowProjRelativeTexScale[0][3].z);
    if (!(((!(_653 >= _594)) || (!(_653 <= _595))) || (!(_657 <= _595)))) {
      if ((_565 < 128.0f) && ((_661 >= -1.0f) && ((_657 >= _594) && (_661 <= 1.0f)))) {
        _686 = max(0.0f, ((abs((_653 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _687 = max(0.0f, ((abs((_657 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _27[0] = _653;
        _28[0] = _657;
        _29[0] = _661;
        _697 = select((_terrainNormalParams.y > 0.0f), 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _698 = 1;
        _699 = 0;
        _700 = sqrt((_687 * _687) + (_686 * _686));
      } else {
        _697 = _631;
        _698 = _632;
        _699 = _632;
        _700 = _633;
      }
    } else {
      _697 = _631;
      _698 = _632;
      _699 = _632;
      _700 = _633;
    }
    _701 = (_698 == 0);
    [branch]
    if (_701) {
      _709 = _viewPos.x + _153;
      _710 = _viewPos.y + _154;
      _711 = _viewPos.z + _155;
      _716 = _709 - (_staticShadowPosition[1].x);
      _717 = _710 - (_staticShadowPosition[1].y);
      _718 = _711 - (_staticShadowPosition[1].z);
      _738 = mad((_shadowProjRelativeTexScale[1][2].x), _718, mad((_shadowProjRelativeTexScale[1][1].x), _717, ((_shadowProjRelativeTexScale[1][0].x) * _716))) + (_shadowProjRelativeTexScale[1][3].x);
      _742 = mad((_shadowProjRelativeTexScale[1][2].y), _718, mad((_shadowProjRelativeTexScale[1][1].y), _717, ((_shadowProjRelativeTexScale[1][0].y) * _716))) + (_shadowProjRelativeTexScale[1][3].y);
      _746 = mad((_shadowProjRelativeTexScale[1][2].z), _718, mad((_shadowProjRelativeTexScale[1][1].z), _717, ((_shadowProjRelativeTexScale[1][0].z) * _716))) + (_shadowProjRelativeTexScale[1][3].z);
      _747 = 2.0f / _shadowSizeAndInvSize.y;
      _748 = 1.0f - _747;
      if (!(((!(_738 <= _748)) || (!(_738 >= _747))) || (!(_742 <= _748)))) {
        if ((_746 >= 9.999999747378752e-05f) && ((_746 <= 1.0f) && (_742 >= _747))) {
          _27[1] = _738;
          _28[1] = _742;
          _29[1] = _746;
          _762 = 0.00019999999494757503f;
          _763 = 1;
          _764 = 1;
        } else {
          _762 = _697;
          _763 = 0;
          _764 = _699;
        }
      } else {
        _762 = _697;
        _763 = 0;
        _764 = _699;
      }
      _769 = _709 - (_staticShadowPosition[0].x);
      _770 = _710 - (_staticShadowPosition[0].y);
      _771 = _711 - (_staticShadowPosition[0].z);
      _791 = mad((_shadowProjRelativeTexScale[0][2].x), _771, mad((_shadowProjRelativeTexScale[0][1].x), _770, ((_shadowProjRelativeTexScale[0][0].x) * _769))) + (_shadowProjRelativeTexScale[0][3].x);
      _795 = mad((_shadowProjRelativeTexScale[0][2].y), _771, mad((_shadowProjRelativeTexScale[0][1].y), _770, ((_shadowProjRelativeTexScale[0][0].y) * _769))) + (_shadowProjRelativeTexScale[0][3].y);
      _799 = mad((_shadowProjRelativeTexScale[0][2].z), _771, mad((_shadowProjRelativeTexScale[0][1].z), _770, ((_shadowProjRelativeTexScale[0][0].z) * _769))) + (_shadowProjRelativeTexScale[0][3].z);
      if (!(((!(_791 >= _747)) || (!(_791 <= _748))) || (!(_795 <= _748)))) {
        if ((_799 >= 9.999999747378752e-05f) && ((_795 >= _747) && (_799 <= 1.0f))) {
          _27[0] = _791;
          _28[0] = _795;
          _29[0] = _799;
          _813 = 0.00019999999494757503f;
          _814 = 1;
          _815 = 0;
        } else {
          _813 = _762;
          _814 = _763;
          _815 = _764;
        }
      } else {
        _813 = _762;
        _814 = _763;
        _815 = _764;
      }
    } else {
      _813 = _697;
      _814 = 1;
      _815 = _699;
    }
    _831 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_62 * _bufferSizeAndInvSize.x) + _61);
    _839 = ((uint)((((int)((_831 << 4) + (uint)(-1383041155))) ^ ((int)(_831 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_831) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
    _847 = ((uint)((((int)((_839 << 4) + (uint)(-1556008596))) ^ ((int)(_839 + 1013904242u))) ^ (((uint)(_839) >> 5) + -939442524))) + _831;
    _855 = ((uint)((((int)((_847 << 4) + (uint)(-1383041155))) ^ ((int)(_847 + 1013904242u))) ^ ((int)(((uint)((uint)(_847) >> 5)) + 2123724318u)))) + _839;
    _863 = ((uint)((((int)((_855 << 4) + (uint)(-1556008596))) ^ ((int)(_855 + (uint)(-626627285)))) ^ (((uint)(_855) >> 5) + -939442524))) + _847;
    _871 = ((uint)((((int)((_863 << 4) + (uint)(-1383041155))) ^ ((int)(_863 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_863) >> 5)) + 2123724318u)))) + _855;
    _879 = ((uint)((((int)((_871 << 4) + (uint)(-1556008596))) ^ ((int)(_871 + 2027808484u))) ^ (((uint)(_871) >> 5) + -939442524))) + _863;
    _887 = ((uint)((((int)((_879 << 4) + (uint)(-1383041155))) ^ ((int)(_879 + 2027808484u))) ^ ((int)(((uint)((uint)(_879) >> 5)) + 2123724318u)))) + _871;
    _895 = ((uint)((((int)((_887 << 4) + (uint)(-1556008596))) ^ ((int)(_887 + 387276957u))) ^ (((uint)(_887) >> 5) + -939442524))) + _879;
    _903 = ((uint)((((int)((_895 << 4) + (uint)(-1383041155))) ^ ((int)(_895 + 387276957u))) ^ ((int)(((uint)((uint)(_895) >> 5)) + 2123724318u)))) + _887;
    _911 = ((uint)((((int)((_903 << 4) + (uint)(-1556008596))) ^ ((int)(_903 + (uint)(-1253254570)))) ^ (((uint)(_903) >> 5) + -939442524))) + _895;
    _919 = ((uint)((((int)((_911 << 4) + (uint)(-1383041155))) ^ ((int)(_911 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_911) >> 5)) + 2123724318u)))) + _903;
    _927 = ((uint)((((int)((_919 << 4) + (uint)(-1556008596))) ^ ((int)(_919 + 1401181199u))) ^ (((uint)(_919) >> 5) + -939442524))) + _911;
    _935 = ((uint)((((int)((_927 << 4) + (uint)(-1383041155))) ^ ((int)(_927 + 1401181199u))) ^ ((int)(((uint)((uint)(_927) >> 5)) + 2123724318u)))) + _919;
    _943 = ((uint)((((int)((_935 << 4) + (uint)(-1556008596))) ^ ((int)(_935 + (uint)(-239350328)))) ^ (((uint)(_935) >> 5) + -939442524))) + _927;
    _951 = ((uint)((((int)((_943 << 4) + (uint)(-1383041155))) ^ ((int)(_943 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_943) >> 5)) + 2123724318u)))) + _935;
    _953 = ((_943 & 16777215) == 0);
    [branch]
    if (_701) {
      _1133 = _27[min((uint)(_815), 1u)];
      _1134 = _28[min((uint)(_815), 1u)];
      _1135 = _29[min((uint)(_815), 1u)];
      if (_953) {
        _1146 = ((int)(((uint)((((int)((_951 << 4) + (uint)(-1556008596))) ^ ((int)(_951 + (uint)(-1879881855)))) ^ (((uint)(_951) >> 5) + -939442524))) + _943));
      } else {
        _1146 = _943;
      }
      _1147 = _shadowSizeAndInvSize.z * 2.0f;
      _1148 = _shadowSizeAndInvSize.w * 2.0f;
      _1155 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      _1157 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      _1161 = ((((float)((uint)((uint)(((int)(_1146 * 48271)) & 16777215)))) * _1155) - _1147) + _1133;
      _1162 = ((((float)((uint)((uint)(((int)(_1146 * -1964877855)) & 16777215)))) * _1157) - _1148) + _1134;
      _1163 = (float)((uint)_815);
      _1170 = _1135 - _813;
      _1186 = ((((float)((uint)((uint)(((int)(_1146 * -856141137)) & 16777215)))) * _1155) - _1147) + _1133;
      _1187 = ((((float)((uint)((uint)(((int)(_1146 * -613502015)) & 16777215)))) * _1157) - _1148) + _1134;
      _1208 = ((((float)((uint)((uint)(((int)(_1146 * -556260145)) & 16777215)))) * _1155) - _1147) + _1133;
      _1209 = ((((float)((uint)((uint)(((int)(_1146 * 902075297)) & 16777215)))) * _1157) - _1148) + _1134;
      _1230 = ((((float)((uint)((uint)(((int)(_1146 * 1698214639)) & 16777215)))) * _1155) - _1147) + _1133;
      _1231 = ((((float)((uint)((uint)(((int)(_1146 * 773027713)) & 16777215)))) * _1157) - _1148) + _1134;
      _1242 = (((saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1186, _1187, _1163), _1170))).x)) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1161, _1162, _1163), _1170))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1208, _1209, _1163), _1170))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1230, _1231, _1163), _1170))).x))) * 0.25f;
      _1243 = (((max(0.0f, (_1135 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1186, _1187, _1163), 0.0f))).x))) + max(0.0f, (_1135 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1161, _1162, _1163), 0.0f))).x)))) + max(0.0f, (_1135 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1208, _1209, _1163), 0.0f))).x)))) + max(0.0f, (_1135 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1230, _1231, _1163), 0.0f))).x)))) * 0.25f;
      _1249 = saturate(_1242 * _1242);  // [sem: expr_sat]
      _1250 = saturate(_1243 * _1243);  // [sem: expr_sat]
      _1251 = 1.0h;
      _1252 = 1.0h;
      _1253 = 1.0h;
    } else {
      _957 = _27[min((uint)(_815), 1u)];
      _958 = _28[min((uint)(_815), 1u)];
      _959 = _29[min((uint)(_815), 1u)];
      _961 = select((_815 == 0), 2.5f, 1.0f);
      if (_953) {
        _974 = ((int)(((uint)((((int)((_951 << 4) + (uint)(-1556008596))) ^ ((int)(_951 + (uint)(-1879881855)))) ^ (((uint)(_951) >> 5) + -939442524))) + _943));
      } else {
        _974 = _943;
      }
      _975 = select(_173, (_961 * 0.75f), _961) * 0.6600000262260437f;
      _976 = _975 * _dynmaicShadowSizeAndInvSize.z;
      _977 = _975 * _dynmaicShadowSizeAndInvSize.w;
      _984 = _976 * 1.1920928955078125e-07f;
      _986 = _977 * 1.1920928955078125e-07f;
      _990 = ((((float)((uint)((uint)(((int)(_974 * 48271)) & 16777215)))) * _984) - _976) + _957;
      _991 = ((((float)((uint)((uint)(((int)(_974 * -1964877855)) & 16777215)))) * _986) - _977) + _958;
      _992 = (float)((uint)_815);
      _999 = _959 - _813;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1006 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_990, _991, _992), 0.0f);
      _1020 = ((((float)((uint)((uint)(((int)(_974 * -856141137)) & 16777215)))) * _984) - _976) + _957;
      _1021 = ((((float)((uint)((uint)(((int)(_974 * -613502015)) & 16777215)))) * _986) - _977) + _958;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1030 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1020, _1021, _992), 0.0f);
      _1046 = ((((float)((uint)((uint)(((int)(_974 * -556260145)) & 16777215)))) * _984) - _976) + _957;
      _1047 = ((((float)((uint)((uint)(((int)(_974 * 902075297)) & 16777215)))) * _986) - _977) + _958;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1056 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1046, _1047, _992), 0.0f);
      _1072 = ((((float)((uint)((uint)(((int)(_974 * 1698214639)) & 16777215)))) * _984) - _976) + _957;
      _1073 = ((((float)((uint)((uint)(((int)(_974 * 773027713)) & 16777215)))) * _986) - _977) + _958;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1082 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1072, _1073, _992), 0.0f);
      _1088 = (((saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1020, _1021, _992), _999))).x)) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_990, _991, _992), _999))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1046, _1047, _992), _999))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1072, _1073, _992), _999))).x))) * 0.25f;
      _1089 = (((max(0.0f, (_959 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1020, _1021, _992), 0.0f))).x))) + max(0.0f, (_959 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_990, _991, _992), 0.0f))).x)))) + max(0.0f, (_959 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1046, _1047, _992), 0.0f))).x)))) + max(0.0f, (_959 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1072, _1073, _992), 0.0f))).x)))) * 0.25f;
      _1108 = half(float(((half)(((half)((half)(_1030.x) + (half)(_1006.x))) + (half)(_1056.x))) + ((half)((half)(_1082.x) * 2.0h))) * 0.20000000298023224f);
      _1109 = half(float(((half)(((half)((half)(_1030.y) + (half)(_1006.y))) + (half)(_1056.y))) + ((half)((half)(_1082.y) * 2.0h))) * 0.20000000298023224f);
      _1110 = half(float(((half)(((half)((half)(_1030.z) + (half)(_1006.z))) + (half)(_1056.z))) + ((half)((half)(_1082.z) * 2.0h))) * 0.20000000298023224f);
      if (_815 == 1) {
        _1113 = float(_1108);
        _1114 = float(_1109);
        _1115 = float(_1110);
        _1116 = -0.0f - _700;
        _1249 = _1088;  // [sem: expr_sat]
        _1250 = _1089;  // [sem: expr_sat]
        _1251 = (half)(half((_1113 + _700) + (_1113 * _1116)));
        _1252 = (half)(half((_1114 + _700) + (_1114 * _1116)));
        _1253 = (half)(half((_1115 + _700) + (_1115 * _1116)));
      } else {
        _1249 = _1088;  // [sem: expr_sat]
        _1250 = _1089;  // [sem: expr_sat]
        _1251 = _1108;
        _1252 = _1109;
        _1253 = _1110;
      }
    }
    _1254 = (_814 != 0);
    _1256 = min(_557, select(_1254, _1249, 1.0f));
    _1260 = select((_698 != 0), select(_1254, (_1250 * 400.0f), 4e+06f), 1.0f);
    _1261 = _1260 + 0.9800000190734863f;
    if (_173) {
      [branch]
      if (_nearFieldShadowFlag.x > 0.0f) {
        _1270 = (_shadowAOParams.w > 0.0f);
        if (_1270) {
          _1330 = (mad((_nearFieldShadowViewProjCompacted[2].x), _155, mad((_nearFieldShadowViewProjCompacted[1].x), _154, ((_nearFieldShadowViewProjCompacted[0].x) * _153))) + (_nearFieldShadowViewProjCompacted[3].x));
          _1331 = (mad((_nearFieldShadowViewProjCompacted[2].y), _155, mad((_nearFieldShadowViewProjCompacted[1].y), _154, ((_nearFieldShadowViewProjCompacted[0].y) * _153))) + (_nearFieldShadowViewProjCompacted[3].y));
          _1332 = (mad((_nearFieldShadowViewProjCompacted[2].z), _155, mad((_nearFieldShadowViewProjCompacted[1].z), _154, ((_nearFieldShadowViewProjCompacted[0].z) * _153))) + (_nearFieldShadowViewProjCompacted[3].z));
        } else {
          _1330 = (mad((_nearFieldShadowViewProj[2].x), _155, mad((_nearFieldShadowViewProj[1].x), _154, ((_nearFieldShadowViewProj[0].x) * _153))) + (_nearFieldShadowViewProj[3].x));
          _1331 = (mad((_nearFieldShadowViewProj[2].y), _155, mad((_nearFieldShadowViewProj[1].y), _154, ((_nearFieldShadowViewProj[0].y) * _153))) + (_nearFieldShadowViewProj[3].y));
          _1332 = (mad((_nearFieldShadowViewProj[2].z), _155, mad((_nearFieldShadowViewProj[1].z), _154, ((_nearFieldShadowViewProj[0].z) * _153))) + (_nearFieldShadowViewProj[3].z));
        }
        if (!((((_1330 < -1.0f) || (_1330 > 1.0f)) || ((_1331 < -1.0f) || (_1331 > 1.0f))) || ((_1332 < 0.0f) || (_1332 > 1.0f)))) {
          _1345 = (float)((uint)(uint)(_frameNumber.x));
          _1356 = (frac(((_1345 * 92.0f) + _61) * 0.0078125f) * 128.0f) + -64.34062194824219f;
          _1357 = (frac(((_1345 * 71.0f) + _62) * 0.0078125f) * 128.0f) + -72.46562194824219f;
          _1362 = frac(dot(float3((_1356 * _1356), (_1357 * _1357), (_1357 * _1356)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
          if (_953) {
            _1377 = ((int)(((uint)((((int)((_951 << 4) + (uint)(-1556008596))) ^ ((int)(_951 + (uint)(-1879881855)))) ^ (((uint)(_951) >> 5) + -939442524))) + _943));
          } else {
            _1377 = _943;
          }
          _1382 = uint(((float)((uint)((uint)(((int)(_1377 * 48271)) & 16777215)))) * 3.814637693722034e-06f);
          _1395 = (frac((((float)((uint)_1382)) * 0.015625f) + (((float)((uint)((uint)((int)(uint(_1362 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f)) * 2.0f) + -1.0f;
          _1396 = (((float)((uint)((uint)(reversebits(_1382) ^ (int)(uint(_1362 * 287478368.0f)))))) * 4.656612873077393e-10f) + -1.0f;
          _1398 = rsqrt(dot(float2(_1395, _1396), float2(_1395, _1396)));  // [sem: invLength]
          _1399 = _1398 * _1395;
          _1400 = _1396 * _1398;
          _1401 = -0.0f - _1400;
          if (_953) {
            _1413 = ((int)(((uint)((((int)((_951 << 4) + (uint)(-1556008596))) ^ ((int)(_951 + (uint)(-1879881855)))) ^ (((uint)(_951) >> 5) + -939442524))) + _943));
          } else {
            _1413 = _943;
          }
          _1418 = uint(((float)((uint)((uint)(((int)(_1413 * 48271)) & 16777215)))) * 9.530782563160756e-07f);
          if (_1270) {
            _1427 = max(3.0517578125e-05f, (min(0.0003000000142492354f, (_nearFieldShadowBoundsMax.w * 0.00048828125f)) / _nearFieldShadowBoundsMax.w));
          } else {
            _1427 = 0.00048828125f;
          }
          _1440 = 0.0f;
          _1441 = 0;
          while(true) {
            _1444 = ((int)((_1441 << 2) + _1418)) & 15;
            _1453 = (_global_0[min((uint)(((int)(0u + (_1444 * 2)))), 31u)]) * _1427;
            _1454 = (_global_0[min((uint)(((int)(1u + (_1444 * 2)))), 31u)]) * _1427;
            _1470 = (1.0f - ((__3__36__0__0__g_nearFieldShadowDepth.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float2((((_1330 * 0.5f) + 0.5f) + mad(_1400, _1454, (_1453 * _1399))), ((0.5f - (_1331 * 0.5f)) + mad(_1399, _1454, (_1453 * _1401)))), (_1332 + -3.9999998989515007e-05f))).x)) + _1440;
            _1471 = _1441 + 1;
            if (!(_1471 == 4)) {
              _1440 = _1470;
              _1441 = _1471;
              continue;
            }
            while(true) {
              _1433 = _153 - (_104 * 0.012000000104308128f);
              _1434 = _154 - (_105 * 0.012000000104308128f);
              _1435 = _155 - (_106 * 0.012000000104308128f);
              if (_shadowAOParams.w > 0.0f) {
                _1532 = (mad((_nearFieldShadowViewProjCompacted[2].x), _1435, mad((_nearFieldShadowViewProjCompacted[1].x), _1434, ((_nearFieldShadowViewProjCompacted[0].x) * _1433))) + (_nearFieldShadowViewProjCompacted[3].x));
                _1533 = (mad((_nearFieldShadowViewProjCompacted[2].y), _1435, mad((_nearFieldShadowViewProjCompacted[1].y), _1434, ((_nearFieldShadowViewProjCompacted[0].y) * _1433))) + (_nearFieldShadowViewProjCompacted[3].y));
                _1534 = (mad((_nearFieldShadowViewProjCompacted[2].z), _1435, mad((_nearFieldShadowViewProjCompacted[1].z), _1434, ((_nearFieldShadowViewProjCompacted[0].z) * _1433))) + (_nearFieldShadowViewProjCompacted[3].z));
              } else {
                _1532 = (mad((_nearFieldShadowViewProj[2].x), _1435, mad((_nearFieldShadowViewProj[1].x), _1434, ((_nearFieldShadowViewProj[0].x) * _1433))) + (_nearFieldShadowViewProj[3].x));
                _1533 = (mad((_nearFieldShadowViewProj[2].y), _1435, mad((_nearFieldShadowViewProj[1].y), _1434, ((_nearFieldShadowViewProj[0].y) * _1433))) + (_nearFieldShadowViewProj[3].y));
                _1534 = (mad((_nearFieldShadowViewProj[2].z), _1435, mad((_nearFieldShadowViewProj[1].z), _1434, ((_nearFieldShadowViewProj[0].z) * _1433))) + (_nearFieldShadowViewProj[3].z));
              }
              _1536 = 0.0f;
              _1537 = 0;
              while(true) {
                _1540 = ((int)((_1537 << 2) + _1418)) & 15;
                _1549 = (_global_0[min((uint)(((int)(0u + (_1540 * 2)))), 31u)]) * _1427;
                _1550 = (_global_0[min((uint)(((int)(1u + (_1540 * 2)))), 31u)]) * _1427;
                _1567 = max(0.0f, (_1534 - ((__3__36__0__0__g_nearFieldShadowDepth.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((((_1532 * 0.5f) + 0.5f) + mad(_1400, _1550, (_1549 * _1399))), ((0.5f - (_1533 * 0.5f)) + mad(_1399, _1550, (_1549 * _1401)))), 0.0f)).x))) + _1536;
                _1568 = _1537 + 1;
                if (!(_1568 == 4)) {
                  _1536 = _1567;
                  _1537 = _1568;
                  continue;
                }
                _1577 = min(_1256, (_1470 * 0.25f));
                _1578 = max((select(_173, _1261, _1260) + -0.9800000190734863f), max(0.0020000000949949026f, (_1567 * 25.0f)));
                break;
              }
              break;
            }
            break;
          }
        } else {
          _1577 = _1256;
          _1578 = _1261;
        }
      } else {
        _1577 = _1256;
        _1578 = _1261;
      }
    } else {
      _1577 = _1256;
      _1578 = _1260;
    }
    _1591 = (_1577 - (_shadowAOParams.x * _1577)) + _shadowAOParams.x;
    [branch]
    if (_1591 > 0.0f) {
      _1601 = _77 & 126;
      _1602 = (_1601 == 64);
      _1603 = (_81 == 66);
      _1604 = _1602 || _1603;
      _1605 = select(_1604, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _1621 = _sunDirection.x;
        _1622 = _sunDirection.y;
        _1623 = _sunDirection.z;
      } else {
        _1621 = _moonDirection.x;
        _1622 = _moonDirection.y;
        _1623 = _moonDirection.z;
      }
      _1624 = _59 & 3;
      _1628 = _60 & 3;
      _1634 = (_frameNumber.x * 1551) + ((uint)(((((_1628 << 1) | _1628) << 1) & 10) | (((_1624 << 1) | _1624) & 5)));
      _1639 = (((int)(_1634 << 2)) & -858993460) | (((uint)(_1634) >> 2) & 858993459);
      _1644 = (((int)(_1639 << 1)) & 10) | (((uint)(_1639) >> 1) & 21);
      _1647 = (float)((uint)(uint)(_frameNumber.x));
      _1658 = (frac(((_1647 * 92.0f) + _61) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      _1659 = (frac(((_1647 * 71.0f) + _62) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      _1664 = frac(dot(float3((_1658 * _1658), (_1659 * _1659), (_1659 * _1658)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      _1680 = frac((((float)((uint)((uint)((int)(uint(_1664 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f) + (((float)((uint)_1644)) * 0.03125f)) * 6.2831854820251465f;
      _1684 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * ((float)((uint)((uint)(reversebits(_1644) ^ (int)(uint(_1664 * 287478368.0f))))))) + _shadowAOParams.z;
      _1687 = sqrt(1.0f - (_1684 * _1684));
      _1690 = cos(_1680) * _1687;
      _1691 = sin(_1680) * _1687;
      _1693 = select((_1623 >= 0.0f), 1.0f, -1.0f);
      _1696 = -0.0f - (1.0f / (_1693 + _1623));
      _1697 = _1622 * _1696;
      _1698 = _1697 * _1621;
      _1699 = _1693 * _1621;
      _1708 = mad(_1684, _1621, mad(_1691, _1698, ((((_1699 * _1621) * _1696) + 1.0f) * _1690)));
      _1712 = mad(_1684, _1622, mad(_1691, (_1693 + (_1697 * _1622)), ((_1690 * _1693) * _1698)));
      _1716 = mad(_1684, _1623, mad(_1691, (-0.0f - _1622), (-0.0f - (_1699 * _1690))));
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x6B3E7D21 uses this native contact ray direction on the near-field shadow sibling; stable direction keeps Contact Micro Shadows from inheriting per-frame random cone wobble when the feature is enabled.
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _1708 = _1621;
        _1712 = _1622;
        _1716 = _1623;
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      _1717 = select(_1602, 10, 6);
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x6B3E7D21 raises native contact-ray samples only while Contact Micro Shadows is enabled, preserving the vanilla sample count when Off.
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _1717 = (int)(lerp(float(_1717), 16.0f, CONTACT_SHADOW_MARCH_BLEND) + 0.5f);
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_171) {
        _1723 = min(0.5f, ((_116 * 0.0024999999441206455f) + 0.25f));
      } else {
        _1723 = 1.0f;
      }
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x6B3E7D21 extends the native non-RT contact reach gradually with the Contact Micro Shadows quality value; Off evaluates to the vanilla reach.
      _1729 = ((abs(_1622) * (select(_1604, 12.0f, 2.0f) - _1605)) + _1605) * select(_173, lerp(0.009999999776482582f, 0.05000000074505806f, CONTACT_SHADOW_REACH_BLEND), 0.10000000149011612f);
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_173) {
        _1737 = max((_116 * select(((uint)(_81 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _1729);
      } else {
        _1737 = _1729;
      }
      _1750 = (_terrainNormalParams.z > 0.0f);
      if (_1750) {
        _1754 = (float)((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _1915 = frac(frac(dot(float2(((_1754 * 32.665000915527344f) + _61), ((_1754 * 11.8149995803833f) + _62)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        _1776 = uint((_bufferSizeAndInvSize.x * _62) + _61) + ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)));
        _1784 = ((uint)((((int)((_1776 << 4) + (uint)(-1383041155))) ^ ((int)(_1776 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_1776) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _1792 = ((uint)((((int)((_1784 << 4) + (uint)(-1556008596))) ^ ((int)(_1784 + 1013904242u))) ^ (((uint)(_1784) >> 5) + -939442524))) + _1776;
        _1800 = ((uint)((((int)((_1792 << 4) + (uint)(-1383041155))) ^ ((int)(_1792 + 1013904242u))) ^ ((int)(((uint)((uint)(_1792) >> 5)) + 2123724318u)))) + _1784;
        _1808 = ((uint)((((int)((_1800 << 4) + (uint)(-1556008596))) ^ ((int)(_1800 + (uint)(-626627285)))) ^ (((uint)(_1800) >> 5) + -939442524))) + _1792;
        _1816 = ((uint)((((int)((_1808 << 4) + (uint)(-1383041155))) ^ ((int)(_1808 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_1808) >> 5)) + 2123724318u)))) + _1800;
        _1824 = ((uint)((((int)((_1816 << 4) + (uint)(-1556008596))) ^ ((int)(_1816 + 2027808484u))) ^ (((uint)(_1816) >> 5) + -939442524))) + _1808;
        _1832 = ((uint)((((int)((_1824 << 4) + (uint)(-1383041155))) ^ ((int)(_1824 + 2027808484u))) ^ ((int)(((uint)((uint)(_1824) >> 5)) + 2123724318u)))) + _1816;
        _1840 = ((uint)((((int)((_1832 << 4) + (uint)(-1556008596))) ^ ((int)(_1832 + 387276957u))) ^ (((uint)(_1832) >> 5) + -939442524))) + _1824;
        _1848 = ((uint)((((int)((_1840 << 4) + (uint)(-1383041155))) ^ ((int)(_1840 + 387276957u))) ^ ((int)(((uint)((uint)(_1840) >> 5)) + 2123724318u)))) + _1832;
        _1856 = ((uint)((((int)((_1848 << 4) + (uint)(-1556008596))) ^ ((int)(_1848 + (uint)(-1253254570)))) ^ (((uint)(_1848) >> 5) + -939442524))) + _1840;
        _1864 = ((uint)((((int)((_1856 << 4) + (uint)(-1383041155))) ^ ((int)(_1856 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_1856) >> 5)) + 2123724318u)))) + _1848;
        _1872 = ((uint)((((int)((_1864 << 4) + (uint)(-1556008596))) ^ ((int)(_1864 + 1401181199u))) ^ (((uint)(_1864) >> 5) + -939442524))) + _1856;
        _1880 = ((uint)((((int)((_1872 << 4) + (uint)(-1383041155))) ^ ((int)(_1872 + 1401181199u))) ^ ((int)(((uint)((uint)(_1872) >> 5)) + 2123724318u)))) + _1864;
        _1888 = ((uint)((((int)((_1880 << 4) + (uint)(-1556008596))) ^ ((int)(_1880 + (uint)(-239350328)))) ^ (((uint)(_1880) >> 5) + -939442524))) + _1872;
        _1896 = ((uint)((((int)((_1888 << 4) + (uint)(-1383041155))) ^ ((int)(_1888 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_1888) >> 5)) + 2123724318u)))) + _1880;
        if ((_1888 & 16777215) == 0) {
          _1909 = ((int)(((uint)((((int)((_1896 << 4) + (uint)(-1556008596))) ^ ((int)(_1896 + (uint)(-1879881855)))) ^ (((uint)(_1896) >> 5) + -939442524))) + _1888));
        } else {
          _1909 = _1888;
        }
        _1915 = (((float)((uint)((uint)(((int)(_1909 * 48271)) & 16777215)))) * 5.960464477539063e-08f);
      }
      if (_1603 || ((_81 != 15) && ((uint)(_81 + -12) < (uint)7))) {
        // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
        // Description: SceneShadowTiledCS 0x6B3E7D21 moves the native contact start closer only while Contact Micro Shadows is enabled, preserving vanilla start distance when Off.
        _1928 = (_1915 * lerp(10.0f, 2.0f, CONTACT_SHADOW_START_BLEND));
        // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      } else {
        if (_81 == 15) {
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x6B3E7D21 applies the same Contact Micro Shadows start-distance blend to the depth-faded material branch.
          _1928 = ((lerp((10.0f - (saturate(_116 * 0.0010000000474974513f) * 9.0f)), 2.0f, CONTACT_SHADOW_START_BLEND)) * _1915);
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _1928 = _1915;
        }
      }
      if (_1601 == 12) {
        _1941 = (0.10000000149011612f - (abs(_1712) * 0.05000000074505806f));
      } else {
        if ((uint)_81 > (uint)15) {
          if (((uint)_81 < (uint)20) || (_81 == 107)) {
            _1941 = (0.10000000149011612f - (abs(_1712) * 0.05000000074505806f));
          } else {
            _1941 = 0.0f;
          }
        } else {
          _1941 = 0.0f;
        }
      }
      if (!_173) {
        _1943 = _1941 * _157;
        _1951 = (_153 - (_1943 * _153));
        _1952 = (_154 - (_1943 * _154));
        _1953 = (_155 - (_1943 * _155));
      } else {
        _1951 = _153;
        _1952 = _154;
        _1953 = _155;
      }
      if (!_1750) {
        _1957 = saturate(_116 * 0.0625f) * 0.05000000074505806f;
        _1962 = (_1957 * _104);
        _1963 = (_1957 * _105);
        _1964 = (_1957 * _106);
      } else {
        _1962 = 0.0f;
        _1963 = 0.0f;
        _1964 = 0.0f;
      }
      _1965 = _1962 + _1951;
      _1966 = _1963 + _1952;
      _1967 = _1964 + _1953;
      _1979 = mad((_viewRelative[2].z), _1967, mad((_viewRelative[1].z), _1966, ((_viewRelative[0].z) * _1965))) + (_viewRelative[3].z);
      _1982 = mad((_viewRelative[2].z), _1716, mad((_viewRelative[1].z), _1712, ((_viewRelative[0].z) * _1708)));
      _1990 = select((((_1982 * _1737) + _1979) < _nearFarProj.x), ((_nearFarProj.x - _1979) / _1982), _1737);
      _2022 = mad((_viewProjRelative[2].z), _1967, mad((_viewProjRelative[1].z), _1966, ((_viewProjRelative[0].z) * _1965))) + (_viewProjRelative[3].z);
      _2026 = mad((_viewProjRelative[2].w), _1967, mad((_viewProjRelative[1].w), _1966, ((_viewProjRelative[0].w) * _1965))) + (_viewProjRelative[3].w);
      _2030 = (_1990 * _1708) + _1965;
      _2031 = (_1990 * _1712) + _1966;
      _2032 = (_1990 * _1716) + _1967;
      _2048 = mad((_viewProjRelative[2].w), _2032, mad((_viewProjRelative[1].w), _2031, ((_viewProjRelative[0].w) * _2030))) + (_viewProjRelative[3].w);
      _2049 = (mad((_viewProjRelative[2].x), _1967, mad((_viewProjRelative[1].x), _1966, ((_viewProjRelative[0].x) * _1965))) + (_viewProjRelative[3].x)) / _2026;
      _2050 = (mad((_viewProjRelative[2].y), _1967, mad((_viewProjRelative[1].y), _1966, ((_viewProjRelative[0].y) * _1965))) + (_viewProjRelative[3].y)) / _2026;
      _2051 = _2022 / _2026;
      _2055 = ((mad((_viewProjRelative[2].x), _2032, mad((_viewProjRelative[1].x), _2031, ((_viewProjRelative[0].x) * _2030))) + (_viewProjRelative[3].x)) / _2048) - _2049;
      _2056 = ((mad((_viewProjRelative[2].y), _2032, mad((_viewProjRelative[1].y), _2031, ((_viewProjRelative[0].y) * _2030))) + (_viewProjRelative[3].y)) / _2048) - _2050;
      _2059 = 1.0f / ((float)((uint)_1717));
      _2070 = max(_2059, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_2055)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_2056))) * _2059))));
      _2071 = _2070 * (((mad((_viewProjRelative[2].z), _2032, mad((_viewProjRelative[1].z), _2031, ((_viewProjRelative[0].z) * _2030))) + (_viewProjRelative[3].z)) / _2048) - _2051);
      _2090 = ((_1723 * 0.5f) * max(abs(_2071), (_2051 - ((mad((_proj[2].z), _116, 0.0f) + _2022) / (mad((_proj[2].w), _116, 0.0f) + _2026))))) * max(0.0625f, _2059);
      _2091 = _2070 * _2059;
      _2093 = (_2055 * 0.5f) * _2091;
      _2095 = (_2056 * -0.5f) * _2091;
      _2096 = _2071 * _2059;
      _2103 = max(_1928, (1.0f / max((abs(_2093) * _bufferSizeAndInvSize.x), (abs(_2095) * _bufferSizeAndInvSize.y))));
      _2110 = 0.5f / _bufferSizeAndInvSize.x;
      _2112 = (((_2049 * 0.5f) + 0.5f) + (_2103 * _2093));
      _2113 = ((0.5f - (_2050 * 0.5f)) + (_2103 * _2095));
      _2114 = ((_2103 * _2096) + _2051);
      _2115 = _1928;
  // [sem: expr_sat]
      _2116 = saturate(((_116 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_104, _105, _106), float3((-0.0f - (_153 * _157)), (-0.0f - (_154 * _157)), (-0.0f - (_155 * _157))))))) + 0.009999999776482582f);
      _2117 = 0;
      _2118 = 0;
      _2119 = 1.0f;
      _2120 = 0.0f;
      while(true) {
  // [sem: _3__36__0__0__g_depthStencil_load]
        _2129 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_2112, _2110), (1.0f - _2110)) * _bufferSizeAndInvSize.x), int(_2113 * _bufferSizeAndInvSize.y), 0));
        _2131 = (uint)((uint)(_2129.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _2134 = ((float)((uint)((uint)(_2129.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _2135 = _2131 & 127;
        _2136 = (_2117 == 0);
        _2137 = select(_2136, 1.0f, _2116);
        _2138 = _2114 - _2134;
        _2142 = _nearFarProj.x / max(1.0000000116860974e-07f, _2134);
        _2145 = _2142 - (_nearFarProj.x / max(1.0000000116860974e-07f, _2114));
        _2148 = (abs(_2138 + _2090) < _2090);
        _2149 = (int)(uint)(_2148);
        if (_2148) {
          if ((_2135 == 7) || ((_2135 == 54) || (((_2131 & 126) == 66) || (((uint)(_2135 + -5) < (uint)2) || ((_2135 == 107) || ((_2135 == 26) || (((uint)(_2135 + -27) < (uint)2) || ((_2135 == 106) || (((_2131 & 125) == 105) || ((_2135 == 18) || ((uint)(_2135 + -19) < (uint)2))))))))))) {
            _2183 = true;
            _2190 = ((int)(uint)((int)((_2145 < 0.0f) && (_2145 > select(_2183, -0.07999999821186066f, -1.0f)))));
          } else {
            if ((uint)(_2135 + -53) < (uint)14) {
              _2183 = (_2142 < 32.0f);
              _2190 = ((int)(uint)((int)((_2145 < 0.0f) && (_2145 > select(_2183, -0.07999999821186066f, -1.0f)))));
            } else {
              _2190 = _2149;
            }
          }
        } else {
          _2190 = _2149;
        }
        if (!(_2190 == 0)) {
          if ((uint)_2135 > (uint)11) {
            if (!((uint)_2135 < (uint)18)) {
              if (!((_2135 == 18) || ((_2135 == 107) || ((uint)(_2135 + -19) < (uint)2)))) {
                if (!(_2135 == 66)) {
                  _2209 = 0.0f;
                } else {
                  _2209 = 0.10000000149011612f;
                }
              } else {
                _2209 = 0.15000000596046448f;
              }
            } else {
              _2209 = 0.10000000149011612f;
            }
          } else {
            if (!(_2135 == 11)) {
              _2209 = 0.0f;
            } else {
              _2209 = 0.10000000149011612f;
            }
          }
          _2211 = saturate(_2142 * 0.015625f);  // [sem: expr_sat]
          _2214 = (1.0f - _2211) + (_2211 * _2209);
          _2224 = _2135;
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x6B3E7D21 softens native contact accumulation with Contact Micro Shadows tuning so the added detail blends with the shipped non-RT contact result.
          float _rndxMicroFarAccum = saturate(1.0f - ((_2214 * _2214) * _2209)) * (1.0f - _2120);
          _2225 = saturate((_rndxMicroFarAccum * lerp(1.0f, 0.7f, CONTACT_SHADOW_BASE_TUNING)) + _2120);  // [sem: expr_sat]
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _2224 = _2118;
          _2225 = _2120;  // [sem: expr_sat]
        }
        [branch]
        if (_2225 > 0.949999988079071f) {
          if (!_2136) {
            _2256 = (saturate(_2119 / (_2119 - _2138)) - min(_2115, _2137));
          } else {
            _2256 = 0.0f;
          }
          _2265 = ((_2256 * _2093) + _2112);
          _2266 = ((_2256 * _2095) + _2113);
          _2267 = ((_2256 * _2096) + _2114);
          _2268 = _2134;
          _2269 = _2135;
        } else {
          if ((uint)_2117 < (uint)(_1717 + -1)) {
            _2248 = ((_2137 * _2093) + _2112);
            _2249 = ((_2137 * _2095) + _2113);
            _2250 = ((_2137 * _2096) + _2114);
            _2251 = (_2137 + _2115);
            _2252 = min(abs(_2096), _2138);
          } else {
            _2248 = _2112;
            _2249 = _2113;
            _2250 = _2114;
            _2251 = _2115;
            _2252 = _2119;
          }
          _2253 = _2117 + 1;
          if ((uint)_2253 < (uint)_1717) {
            _2112 = _2248;
            _2113 = _2249;
            _2114 = _2250;
            _2115 = _2251;
            _2116 = _2137;  // [sem: expr_sat]
            _2117 = _2253;
            _2118 = _2224;
            _2119 = _2252;
            _2120 = _2225;
            continue;
          } else {
            _2265 = 0.0f;
            _2266 = 0.0f;
            _2267 = -1.0f;
            _2268 = 0.0f;
            _2269 = _2224;
          }
        }
        _2273 = (_2225 > 0.0f);
        if (_2267 > 0.0f) {
          if (_2273 || (((_2265 >= 0.0f) && (_2265 <= 1.0f)) && ((_2266 >= 0.0f) && (_2266 <= 1.0f)))) {
            _2287 = (_2265 * 2.0f) + -1.0f;
            _2288 = 1.0f - (_2266 * 2.0f);
            _2324 = mad((_invViewProjRelative[2].w), _2267, mad((_invViewProjRelative[1].w), _2288, ((_invViewProjRelative[0].w) * _2287))) + (_invViewProjRelative[3].w);
            if (!(_2269 == 2)) {
              if (_2269 == 3) {
                _2348 = 0.0f;
                _2350 = _2348;
              } else {
                if (_2269 == 21) {
                  if (!(_81 == 21)) {
                    _2348 = 0.0f;
                    _2350 = _2348;
                  } else {
                    _2350 = 20.0f;
                  }
                } else {
                  _2341 = (_2269 == 22);
                  if (!((_81 == 22) && _2341)) {
                    _2348 = select(_2341, 0.0f, 1.0f);
                    _2350 = _2348;
                  } else {
                    _2350 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_81 == 2)) {
                _2348 = 0.0f;
                _2350 = _2348;
              } else {
                _2350 = 20.0f;
              }
            }
            if (!(_171 || (!(_2225 == 1.0f)))) {
  // [sem: expr_sat]
              _2374 = saturate(((((_1737 * 0.9375f) - max(0.0f, dot(float3(_1708, _1712, _1716), float3((((mad((_invViewProjRelative[2].x), _2267, mad((_invViewProjRelative[1].x), _2288, ((_invViewProjRelative[0].x) * _2287))) + (_invViewProjRelative[3].x)) / _2324) - _1965), (((mad((_invViewProjRelative[2].y), _2267, mad((_invViewProjRelative[1].y), _2288, ((_invViewProjRelative[0].y) * _2287))) + (_invViewProjRelative[3].y)) / _2324) - _1966), (((mad((_invViewProjRelative[2].z), _2267, mad((_invViewProjRelative[1].z), _2288, ((_invViewProjRelative[0].z) * _2287))) + (_invViewProjRelative[3].z)) / _2324) - _1967))))) * ((_116 * 0.015625f) + 1.5f)) / _1737) * 0.9375f);
            } else {
              _2374 = _2225;  // [sem: expr_sat]
            }
            _2375 = _2374 * saturate(exp2(min(0.0f, (((_116 * 0.018666666001081467f) + 0.13333334028720856f) + (_2350 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2268)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2267)))))) * 1.4426950216293335f));
            _2376 = _2269 & -2;
            if (!(_2376 == 6)) {
              if ((((_81 == 33) && (_2269 == 33)) || (!(_81 == 33) && ((_81 == 55) && (_2269 == 55))))) {
                _2453 = (_2375 * 0.009999999776482582f);
              } else {
                if (!((_2269 == 54) || (_2376 == 66)) || (((_2269 == 54) || (_2376 == 66)) && (!((_1601 == 66) || (_81 == 54))))) {
                  if (!_173) {
                    if ((uint)((int)(_2269 + (uint)(-53))) < (uint)15) {
                      _2450 = saturate(_116 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _2450 = 1.0f;  // [sem: expr_sat]
                    }
                    _2453 = (_2450 * _2375);
                  } else {
                    _2453 = _2375;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _2405 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _2265), int(_bufferSizeAndInvSize.y * _2266), 0));
                  _2411 = ((float)((uint)((uint)(((uint)((uint)(_2405.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _2414 = ((float)((uint)((uint)(_2405.x & 255)))) * 0.003921568859368563f;
                  _2418 = ((float)((uint)((uint)(((uint)((uint)(_2405.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _2419 = _2411 * _2411;
                  _2420 = _2414 * _2414;
                  _2421 = _2418 * _2418;
                  _2453 = (saturate(1.0f - (dot(float3((((_2419 * 0.6131200194358826f) + (_2420 * 0.3395099937915802f)) + (_2421 * 0.047370001673698425f)), (((_2419 * 0.07020000368356705f) + (_2420 * 0.9163600206375122f)) + (_2421 * 0.013450000435113907f)), (((_2419 * 0.02061999961733818f) + (_2420 * 0.10958000272512436f)) + (_2421 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _2375);
                }
              }
            } else {
              _2453 = (_2375 * 0.009999999776482582f);
            }
          } else {
            _2453 = 0.0f;
          }
        } else {
          if (_2273) {
            _2287 = (_2265 * 2.0f) + -1.0f;
            _2288 = 1.0f - (_2266 * 2.0f);
            _2324 = mad((_invViewProjRelative[2].w), _2267, mad((_invViewProjRelative[1].w), _2288, ((_invViewProjRelative[0].w) * _2287))) + (_invViewProjRelative[3].w);
            if (!(_2269 == 2)) {
              if (_2269 == 3) {
                _2348 = 0.0f;
                _2350 = _2348;
              } else {
                if (_2269 == 21) {
                  if (!(_81 == 21)) {
                    _2348 = 0.0f;
                    _2350 = _2348;
                  } else {
                    _2350 = 20.0f;
                  }
                } else {
                  _2341 = (_2269 == 22);
                  if (!((_81 == 22) && _2341)) {
                    _2348 = select(_2341, 0.0f, 1.0f);
                    _2350 = _2348;
                  } else {
                    _2350 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_81 == 2)) {
                _2348 = 0.0f;
                _2350 = _2348;
              } else {
                _2350 = 20.0f;
              }
            }
            if (!(_171 || (!(_2225 == 1.0f)))) {
  // [sem: expr_sat]
              _2374 = saturate(((((_1737 * 0.9375f) - max(0.0f, dot(float3(_1708, _1712, _1716), float3((((mad((_invViewProjRelative[2].x), _2267, mad((_invViewProjRelative[1].x), _2288, ((_invViewProjRelative[0].x) * _2287))) + (_invViewProjRelative[3].x)) / _2324) - _1965), (((mad((_invViewProjRelative[2].y), _2267, mad((_invViewProjRelative[1].y), _2288, ((_invViewProjRelative[0].y) * _2287))) + (_invViewProjRelative[3].y)) / _2324) - _1966), (((mad((_invViewProjRelative[2].z), _2267, mad((_invViewProjRelative[1].z), _2288, ((_invViewProjRelative[0].z) * _2287))) + (_invViewProjRelative[3].z)) / _2324) - _1967))))) * ((_116 * 0.015625f) + 1.5f)) / _1737) * 0.9375f);
            } else {
              _2374 = _2225;  // [sem: expr_sat]
            }
            _2375 = _2374 * saturate(exp2(min(0.0f, (((_116 * 0.018666666001081467f) + 0.13333334028720856f) + (_2350 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _2268)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2267)))))) * 1.4426950216293335f));
            _2376 = _2269 & -2;
            if (!(_2376 == 6)) {
              if ((((_81 == 33) && (_2269 == 33)) || (!(_81 == 33) && ((_81 == 55) && (_2269 == 55))))) {
                _2453 = (_2375 * 0.009999999776482582f);
              } else {
                if (!((_2269 == 54) || (_2376 == 66)) || (((_2269 == 54) || (_2376 == 66)) && (!((_1601 == 66) || (_81 == 54))))) {
                  if (!_173) {
                    if ((uint)((int)(_2269 + (uint)(-53))) < (uint)15) {
                      _2450 = saturate(_116 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _2450 = 1.0f;  // [sem: expr_sat]
                    }
                    _2453 = (_2450 * _2375);
                  } else {
                    _2453 = _2375;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _2405 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _2265), int(_bufferSizeAndInvSize.y * _2266), 0));
                  _2411 = ((float)((uint)((uint)(((uint)((uint)(_2405.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _2414 = ((float)((uint)((uint)(_2405.x & 255)))) * 0.003921568859368563f;
                  _2418 = ((float)((uint)((uint)(((uint)((uint)(_2405.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _2419 = _2411 * _2411;
                  _2420 = _2414 * _2414;
                  _2421 = _2418 * _2418;
                  _2453 = (saturate(1.0f - (dot(float3((((_2419 * 0.6131200194358826f) + (_2420 * 0.3395099937915802f)) + (_2421 * 0.047370001673698425f)), (((_2419 * 0.07020000368356705f) + (_2420 * 0.9163600206375122f)) + (_2421 * 0.013450000435113907f)), (((_2419 * 0.02061999961733818f) + (_2420 * 0.10958000272512436f)) + (_2421 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _2375);
                }
              }
            } else {
              _2453 = (_2375 * 0.009999999776482582f);
            }
          } else {
            _2453 = 0.0f;
          }
        }
        _2457 = saturate(1.0f - _2453);  // [sem: expr_sat]
        break;
      }
    } else {
      _2457 = 1.0f;  // [sem: expr_sat]
    }
    // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
    // Description: SceneShadowTiledCS 0x6B3E7D21 fills sub-pixel occluders in the near-field shadow sibling, then fades the helper near screen edges to avoid bright edge artifacts.
    _2457 = ApplyContactMicroDetailShadow(
        _2457,
        float2(_61, _62),
        _116,
        _77,
        float3(_1621, _1622, _1623),
        float3(_1965, _1966, _1967),
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
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _2457 < 1.0f) {
      float2 _rndxMicroScreenUV = float2((_61 + 0.5f) * _bufferSizeAndInvSize.z,
                                         (_62 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _rndxMicroEdgeDist = min(_rndxMicroScreenUV, 1.0f - _rndxMicroScreenUV);
      float _rndxMicroEdgeFade = saturate(min(_rndxMicroEdgeDist.x, _rndxMicroEdgeDist.y) * 10.0f);
      _2457 = lerp(lerp(1.0f, _2457, 0.5f), _2457, _rndxMicroEdgeFade);
    }
    // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
    _2458 = min(_1591, _2457);
    _2472 = float(half(_2458 * float(_1251)));
    _2473 = float(half(_2458 * float(_1252)));
    _2474 = float(half(_2458 * float(_1253)));
    _2475 = saturate((1.0f - _557) + (exp2(log2(saturate(_1578)) * 0.45454543828964233f) * _557));  // [sem: expr_sat]
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(_59, _60)] = float4((half)(half(_2472)), (half)(half(_2473)), (half)(half(_2474)), (half)(half(_2475)));
}
