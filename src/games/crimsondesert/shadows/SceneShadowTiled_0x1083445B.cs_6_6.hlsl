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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b19, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
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

#include "micro_detail_shadows.hlsli"

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int4 _30;
  int _40;
  int _44;
  uint _56;
  uint _57;
  float _58;
  float _59;
  float _67;
  float _70;
  uint _72;
  int _74;
  float _77;
  int _78;
  uint _80;
  float _96;
  float _97;
  float _98;
  float _100;
  float _101;
  float _102;
  float _103;
  bool _105;
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
  int _1143;
  float _1246;
  float _1247;
  half _1248;
  half _1249;
  half _1250;
  float _1302;
  float _1303;
  float _1304;
  float _1402;
  float _1416;
  int _1453;
  float _1459;
  float _1472;
  float _1485;
  float _1495;
  float _1496;
  float _1497;
  float _1506;
  float _1507;
  float _1508;
  float _1654;
  float _1655;
  float _1656;
  float _1657;
  float _1658;
  int _1659;
  int _1660;
  float _1661;
  float _1662;
  bool _1725;
  int _1732;
  float _1751;
  float _1767;
  int _1774;
  float _1775;
  float _1798;
  float _1799;
  float _1800;
  float _1801;
  float _1802;
  float _1806;
  float _1815;
  float _1816;
  float _1817;
  float _1818;
  int _1819;
  float _1878;
  float _1880;
  float _1904;
  float _1977;
  float _1980;
  float _1984;
  float _1999;
  float _2000;
  float _2001;
  float _2002;
  float _108;
  float _112;
  float _113;
  float _149;
  float _150;
  float _151;
  float _152;
  float _154;
  bool _168;
  bool _170;
  float _190;
  float _194;
  float _198;
  float _209;
  float _220;
  float _221;
  float _226;
  uint _242;
  uint _250;
  uint _258;
  uint _266;
  uint _274;
  uint _282;
  uint _290;
  uint _298;
  uint _306;
  uint _314;
  uint _322;
  uint _330;
  uint _338;
  uint _346;
  uint _354;
  uint _362;
  uint _380;
  float _387;
  float _393;
  float _394;
  float _396;
  float _403;
  float _405;
  float _407;
  float _408;
  float _413;
  float4 _417;
  float _422;
  float _427;
  float _429;
  float _436;
  float _446;
  float _447;
  float _452;
  float4 _454;
  float _463;
  float _465;
  float _472;
  float _483;
  float _484;
  float _489;
  float4 _491;
  float _500;
  float _502;
  float _509;
  float _520;
  float _521;
  float _526;
  float4 _528;
  float _537;
  float _539;
  float _546;
  float _562;
  float _582;
  float _586;
  float _590;
  float _591;
  float _592;
  float _617;
  float _618;
  float _650;
  float _654;
  float _658;
  float _683;
  float _684;
  bool _698;
  float _706;
  float _707;
  float _708;
  float _713;
  float _714;
  float _715;
  float _735;
  float _739;
  float _743;
  float _744;
  float _745;
  float _766;
  float _767;
  float _768;
  float _788;
  float _792;
  float _796;
  uint _828;
  uint _836;
  uint _844;
  uint _852;
  uint _860;
  uint _868;
  uint _876;
  uint _884;
  uint _892;
  uint _900;
  uint _908;
  uint _916;
  uint _924;
  uint _932;
  uint _940;
  uint _948;
  bool _950;
  float _954;
  float _955;
  float _956;
  float _958;
  float _972;
  float _973;
  float _974;
  float _981;
  float _983;
  float _987;
  float _988;
  float _989;
  float _996;
  half4 _1003;
  float _1017;
  float _1018;
  half4 _1027;
  float _1043;
  float _1044;
  half4 _1053;
  float _1069;
  float _1070;
  half4 _1079;
  float _1085;
  float _1086;
  half _1105;
  half _1106;
  half _1107;
  float _1110;
  float _1111;
  float _1112;
  float _1113;
  float _1130;
  float _1131;
  float _1132;
  float _1144;
  float _1145;
  float _1152;
  float _1154;
  float _1158;
  float _1159;
  float _1160;
  float _1167;
  float _1183;
  float _1184;
  float _1205;
  float _1206;
  float _1227;
  float _1228;
  float _1239;
  float _1240;
  bool _1251;
  float _1253;
  float _1257;
  float _1272;
  int _1282;
  bool _1283;
  bool _1284;
  bool _1285;
  float _1286;
  int _1305;
  int _1309;
  uint _1315;
  int _1320;
  int _1325;
  float _1326;
  float _1337;
  float _1338;
  float _1343;
  float _1359;
  float _1363;
  float _1366;
  float _1369;
  float _1370;
  float _1372;
  float _1375;
  float _1376;
  float _1377;
  float _1378;
  float _1387;
  float _1391;
  float _1395;
  int _1396;
  float _1408;
  bool _1429;
  float _1433;
  float _1487;
  float _1501;
  float _1509;
  float _1510;
  float _1511;
  float _1523;
  float _1526;
  float _1532;
  float _1564;
  float _1568;
  float _1572;
  float _1573;
  float _1574;
  float _1590;
  float _1591;
  float _1592;
  float _1593;
  float _1597;
  float _1598;
  float _1601;
  float _1612;
  float _1613;
  float _1632;
  float _1633;
  float _1635;
  float _1637;
  float _1638;
  float _1645;
  float _1652;
  uint _1671;
  int _1673;
  float _1676;
  int _1677;
  bool _1678;
  float _1679;
  float _1680;
  float _1684;
  float _1687;
  bool _1690;
  int _1691;
  float _1753;
  float _1756;
  int _1803;
  bool _1823;
  float _1837;
  float _1838;
  float _1854;
  bool _1871;
  float _1905;
  int _1906;
  uint4 _1932;
  float _1938;
  float _1941;
  float _1945;
  float _1946;
  float _1947;
  float _1948;
  float _1985;
  int __loop_jump_target = -1;
  int _16[4];
  float _24[2];
  float _25[2];
  float _26[2];
  _30 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _16[0] = _30.x;
  _16[1] = _30.y;
  _16[2] = _30.z;
  _16[3] = _30.w;
  _40 = _16[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _44 = select((((int)(SV_GroupID.x) & 16) == 0), _40, ((uint)(_40) >> 16));
  _56 = ((uint)(((((int)(_44 << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x;
  _57 = ((uint)(((((uint)(_44) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y;
  _58 = (float)((uint)_56);
  _59 = (float)((uint)_57);
  _67 = ((_bufferSizeAndInvSize.z * 2.0f) * (_58 + 0.5f)) + -1.0f;
  _70 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_59 + 0.5f));
  _72 = __3__36__0__0__g_depthStencil.Load(int3(_56, _57, 0));  // [sem: _3__36__0__0__g_depthStencil_load]
  _74 = (uint)((uint)(_72.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _77 = ((float)((uint)((uint)(_72.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
  _78 = _74 & 127;
  _80 = __3__36__0__0__g_sceneNormal.Load(int3(_56, _57, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
  _96 = min(1.0f, ((((float)((uint)((uint)(_80.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _97 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_80.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _98 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_80.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  _100 = rsqrt(dot(float3(_96, _97, _98), float3(_96, _97, _98)));  // [sem: invLength]
  _101 = _100 * _96;
  _102 = _100 * _97;
  _103 = _100 * _98;
  _105 = (_77 == 1.0f);
  if ((_77 < 1.0000000116860974e-07f) || _105) {
    _108 = select(_105, 0.0f, 1.0f);
    _1999 = _108;
    _2000 = _108;
    _2001 = _108;
    _2002 = _108;  // [sem: expr_sat]
  } else {
    _112 = max(1.0000000116860974e-07f, _77);
    _113 = _nearFarProj.x / _112;
    _149 = mad((_invViewProjRelative[2].w), _112, mad((_invViewProjRelative[1].w), _70, ((_invViewProjRelative[0].w) * _67))) + (_invViewProjRelative[3].w);
    _150 = (mad((_invViewProjRelative[2].x), _112, mad((_invViewProjRelative[1].x), _70, ((_invViewProjRelative[0].x) * _67))) + (_invViewProjRelative[3].x)) / _149;
    _151 = (mad((_invViewProjRelative[2].y), _112, mad((_invViewProjRelative[1].y), _70, ((_invViewProjRelative[0].y) * _67))) + (_invViewProjRelative[3].y)) / _149;
    _152 = (mad((_invViewProjRelative[2].z), _112, mad((_invViewProjRelative[1].z), _70, ((_invViewProjRelative[0].z) * _67))) + (_invViewProjRelative[3].z)) / _149;
    _154 = rsqrt(dot(float3(_150, _151, _152), float3(_150, _151, _152)));  // [sem: invLength]
    _24[0] = 0.0f;
    _25[0] = 0.0f;
    _26[0] = 0.0f;
    _24[1] = 0.0f;
    _25[1] = 0.0f;
    _26[1] = 0.0f;
    _168 = ((uint)(_78 + -53) < (uint)15);
    _170 = (_78 == 57) || _168;
    _190 = mad((_terrainShadowProjRelativeTexScale[2].x), _152, mad((_terrainShadowProjRelativeTexScale[1].x), _151, ((_terrainShadowProjRelativeTexScale[0].x) * _150))) + (_terrainShadowProjRelativeTexScale[3].x);
    _194 = mad((_terrainShadowProjRelativeTexScale[2].y), _152, mad((_terrainShadowProjRelativeTexScale[1].y), _151, ((_terrainShadowProjRelativeTexScale[0].y) * _150))) + (_terrainShadowProjRelativeTexScale[3].y);
    _198 = mad((_terrainShadowProjRelativeTexScale[2].z), _152, mad((_terrainShadowProjRelativeTexScale[1].z), _151, ((_terrainShadowProjRelativeTexScale[0].z) * _150))) + (_terrainShadowProjRelativeTexScale[3].z);
    if (saturate(_190) == _190) {
      if ((_198 >= 9.999999747378752e-05f) && ((_198 <= 1.0f) && (saturate(_194) == _194))) {
        _209 = (float)((uint)(uint)(_frameNumber.x));
        _220 = (frac(((_209 * 92.0f) + _58) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        _221 = (frac(((_209 * 71.0f) + _59) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        _226 = frac(dot(float3((_220 * _220), (_221 * _221), (_221 * _220)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        _242 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58);
        _250 = ((uint)((((int)((_242 << 4) + (uint)(-1383041155))) ^ ((int)(_242 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_242) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _258 = ((uint)((((int)((_250 << 4) + (uint)(-1556008596))) ^ ((int)(_250 + 1013904242u))) ^ (((uint)(_250) >> 5) + -939442524))) + _242;
        _266 = ((uint)((((int)((_258 << 4) + (uint)(-1383041155))) ^ ((int)(_258 + 1013904242u))) ^ ((int)(((uint)((uint)(_258) >> 5)) + 2123724318u)))) + _250;
        _274 = ((uint)((((int)((_266 << 4) + (uint)(-1556008596))) ^ ((int)(_266 + (uint)(-626627285)))) ^ (((uint)(_266) >> 5) + -939442524))) + _258;
        _282 = ((uint)((((int)((_274 << 4) + (uint)(-1383041155))) ^ ((int)(_274 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_274) >> 5)) + 2123724318u)))) + _266;
        _290 = ((uint)((((int)((_282 << 4) + (uint)(-1556008596))) ^ ((int)(_282 + 2027808484u))) ^ (((uint)(_282) >> 5) + -939442524))) + _274;
        _298 = ((uint)((((int)((_290 << 4) + (uint)(-1383041155))) ^ ((int)(_290 + 2027808484u))) ^ ((int)(((uint)((uint)(_290) >> 5)) + 2123724318u)))) + _282;
        _306 = ((uint)((((int)((_298 << 4) + (uint)(-1556008596))) ^ ((int)(_298 + 387276957u))) ^ (((uint)(_298) >> 5) + -939442524))) + _290;
        _314 = ((uint)((((int)((_306 << 4) + (uint)(-1383041155))) ^ ((int)(_306 + 387276957u))) ^ ((int)(((uint)((uint)(_306) >> 5)) + 2123724318u)))) + _298;
        _322 = ((uint)((((int)((_314 << 4) + (uint)(-1556008596))) ^ ((int)(_314 + (uint)(-1253254570)))) ^ (((uint)(_314) >> 5) + -939442524))) + _306;
        _330 = ((uint)((((int)((_322 << 4) + (uint)(-1383041155))) ^ ((int)(_322 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_322) >> 5)) + 2123724318u)))) + _314;
        _338 = ((uint)((((int)((_330 << 4) + (uint)(-1556008596))) ^ ((int)(_330 + 1401181199u))) ^ (((uint)(_330) >> 5) + -939442524))) + _322;
        _346 = ((uint)((((int)((_338 << 4) + (uint)(-1383041155))) ^ ((int)(_338 + 1401181199u))) ^ ((int)(((uint)((uint)(_338) >> 5)) + 2123724318u)))) + _330;
        _354 = ((uint)((((int)((_346 << 4) + (uint)(-1556008596))) ^ ((int)(_346 + (uint)(-239350328)))) ^ (((uint)(_346) >> 5) + -939442524))) + _338;
        _362 = ((uint)((((int)((_354 << 4) + (uint)(-1383041155))) ^ ((int)(_354 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_354) >> 5)) + 2123724318u)))) + _346;
        if ((_354 & 16777215) == 0) {
          _375 = ((int)(((uint)((((int)((_362 << 4) + (uint)(-1556008596))) ^ ((int)(_362 + (uint)(-1879881855)))) ^ (((uint)(_362) >> 5) + -939442524))) + _354));
        } else {
          _375 = _354;
        }
        _380 = uint(((float)((uint)((uint)(((int)(_375 * 48271)) & 16777215)))) * 3.814637693722034e-06f);
        _387 = frac((((float)((uint)_380)) * 0.015625f) + (((float)((uint)((uint)((int)(uint(_226 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f));
        _393 = (_387 * 2.0f) + -1.0f;
        _394 = (((float)((uint)((uint)(reversebits(_380) ^ (int)(uint(_226 * 287478368.0f)))))) * 4.656612873077393e-10f) + -1.0f;
        _396 = rsqrt(dot(float2(_393, _394), float2(_393, _394)));  // [sem: invLength]
        _403 = ((_387 * 0.0009765625f) + -0.00048828125f) * _396;
        _405 = (_394 * _396) * 0.00048828125f;
        _407 = (_403 * (_jitterOffset[0].x)) + _190;
        _408 = (_405 * (_jitterOffset[0].y)) + _194;
        _413 = frac((_407 * 1024.0f) + -0.5f);
        _417 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_407, _408));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _422 = _198 + -0.004999999888241291f;
        _427 = select((_417.w > _422), 1.0f, 0.0f);
        _429 = select((_417.x > _422), 1.0f, 0.0f);
        _436 = ((select((_417.z > _422), 1.0f, 0.0f) - _427) * _413) + _427;
        _446 = ((_jitterOffset[1].x) * _403) + _190;
        _447 = ((_jitterOffset[1].y) * _405) + _194;
        _452 = frac((_446 * 1024.0f) + -0.5f);
        _454 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_446, _447));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _463 = select((_454.w > _422), 1.0f, 0.0f);
        _465 = select((_454.x > _422), 1.0f, 0.0f);
        _472 = ((select((_454.z > _422), 1.0f, 0.0f) - _463) * _452) + _463;
        _483 = ((_jitterOffset[2].x) * _403) + _190;
        _484 = ((_jitterOffset[2].y) * _405) + _194;
        _489 = frac((_483 * 1024.0f) + -0.5f);
        _491 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_483, _484));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _500 = select((_491.w > _422), 1.0f, 0.0f);
        _502 = select((_491.x > _422), 1.0f, 0.0f);
        _509 = ((select((_491.z > _422), 1.0f, 0.0f) - _500) * _489) + _500;
        _520 = ((_jitterOffset[3].x) * _403) + _190;
        _521 = ((_jitterOffset[3].y) * _405) + _194;
        _526 = frac((_520 * 1024.0f) + -0.5f);
        _528 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_520, _521));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
        _537 = select((_528.w > _422), 1.0f, 0.0f);
        _539 = select((_528.x > _422), 1.0f, 0.0f);
        _546 = ((select((_528.z > _422), 1.0f, 0.0f) - _537) * _526) + _537;
        _554 = ((((saturate((((((select((_454.y > _422), 1.0f, 0.0f) - _465) * _452) + _465) - _472) * frac((_447 * 1024.0f) + -0.5f)) + _472) + saturate((((((select((_417.y > _422), 1.0f, 0.0f) - _429) * _413) + _429) - _436) * frac((_408 * 1024.0f) + -0.5f)) + _436)) + saturate((((((select((_491.y > _422), 1.0f, 0.0f) - _502) * _489) + _502) - _509) * frac((_484 * 1024.0f) + -0.5f)) + _509)) + saturate((((((select((_528.y > _422), 1.0f, 0.0f) - _539) * _526) + _539) - _546) * frac((_521 * 1024.0f) + -0.5f)) + _546)) * 0.25f);
      } else {
        _554 = 1.0f;
      }
    } else {
      _554 = 1.0f;
    }
    _562 = sqrt(((_151 * _151) + (_150 * _150)) + (_152 * _152));
    _582 = mad((_dynamicShadowProjRelativeTexScale[1][2].x), _152, mad((_dynamicShadowProjRelativeTexScale[1][1].x), _151, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _150))) + (_dynamicShadowProjRelativeTexScale[1][3].x);
    _586 = mad((_dynamicShadowProjRelativeTexScale[1][2].y), _152, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _151, ((_dynamicShadowProjRelativeTexScale[1][0].y) * _150))) + (_dynamicShadowProjRelativeTexScale[1][3].y);
    _590 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _152, mad((_dynamicShadowProjRelativeTexScale[1][1].z), _151, ((_dynamicShadowProjRelativeTexScale[1][0].z) * _150))) + (_dynamicShadowProjRelativeTexScale[1][3].z);
    _591 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    _592 = 1.0f - _591;
    if (!(((!(_582 <= _592)) || (!(_582 >= _591))) || (!(_586 <= _592)))) {
      if ((_562 < 128.0f) && ((_590 >= -1.0f) && ((_590 <= 1.0f) && (_586 >= _591)))) {
        _617 = max(0.0f, ((abs((_582 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _618 = max(0.0f, ((abs((_586 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
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
    _650 = mad((_dynamicShadowProjRelativeTexScale[0][2].x), _152, mad((_dynamicShadowProjRelativeTexScale[0][1].x), _151, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _150))) + (_dynamicShadowProjRelativeTexScale[0][3].x);
    _654 = mad((_dynamicShadowProjRelativeTexScale[0][2].y), _152, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _151, ((_dynamicShadowProjRelativeTexScale[0][0].y) * _150))) + (_dynamicShadowProjRelativeTexScale[0][3].y);
    _658 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _152, mad((_dynamicShadowProjRelativeTexScale[0][1].z), _151, ((_dynamicShadowProjRelativeTexScale[0][0].z) * _150))) + (_dynamicShadowProjRelativeTexScale[0][3].z);
    if (!(((!(_650 >= _591)) || (!(_650 <= _592))) || (!(_654 <= _592)))) {
      if ((_562 < 128.0f) && ((_658 >= -1.0f) && ((_654 >= _591) && (_658 <= 1.0f)))) {
        _683 = max(0.0f, ((abs((_650 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _684 = max(0.0f, ((abs((_654 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
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
    _698 = (_695 == 0);
    [branch]
    if (_698) {
      _706 = _viewPos.x + _150;
      _707 = _viewPos.y + _151;
      _708 = _viewPos.z + _152;
      _713 = _706 - (_staticShadowPosition[1].x);
      _714 = _707 - (_staticShadowPosition[1].y);
      _715 = _708 - (_staticShadowPosition[1].z);
      _735 = mad((_shadowProjRelativeTexScale[1][2].x), _715, mad((_shadowProjRelativeTexScale[1][1].x), _714, ((_shadowProjRelativeTexScale[1][0].x) * _713))) + (_shadowProjRelativeTexScale[1][3].x);
      _739 = mad((_shadowProjRelativeTexScale[1][2].y), _715, mad((_shadowProjRelativeTexScale[1][1].y), _714, ((_shadowProjRelativeTexScale[1][0].y) * _713))) + (_shadowProjRelativeTexScale[1][3].y);
      _743 = mad((_shadowProjRelativeTexScale[1][2].z), _715, mad((_shadowProjRelativeTexScale[1][1].z), _714, ((_shadowProjRelativeTexScale[1][0].z) * _713))) + (_shadowProjRelativeTexScale[1][3].z);
      _744 = 2.0f / _shadowSizeAndInvSize.y;
      _745 = 1.0f - _744;
      if (!(((!(_735 <= _745)) || (!(_735 >= _744))) || (!(_739 <= _745)))) {
        if ((_743 >= 9.999999747378752e-05f) && ((_743 <= 1.0f) && (_739 >= _744))) {
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
      _766 = _706 - (_staticShadowPosition[0].x);
      _767 = _707 - (_staticShadowPosition[0].y);
      _768 = _708 - (_staticShadowPosition[0].z);
      _788 = mad((_shadowProjRelativeTexScale[0][2].x), _768, mad((_shadowProjRelativeTexScale[0][1].x), _767, ((_shadowProjRelativeTexScale[0][0].x) * _766))) + (_shadowProjRelativeTexScale[0][3].x);
      _792 = mad((_shadowProjRelativeTexScale[0][2].y), _768, mad((_shadowProjRelativeTexScale[0][1].y), _767, ((_shadowProjRelativeTexScale[0][0].y) * _766))) + (_shadowProjRelativeTexScale[0][3].y);
      _796 = mad((_shadowProjRelativeTexScale[0][2].z), _768, mad((_shadowProjRelativeTexScale[0][1].z), _767, ((_shadowProjRelativeTexScale[0][0].z) * _766))) + (_shadowProjRelativeTexScale[0][3].z);
      if (!(((!(_788 >= _744)) || (!(_788 <= _745))) || (!(_792 <= _745)))) {
        if ((_796 >= 9.999999747378752e-05f) && ((_792 >= _744) && (_796 <= 1.0f))) {
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
    _828 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_59 * _bufferSizeAndInvSize.x) + _58);
    _836 = ((uint)((((int)((_828 << 4) + (uint)(-1383041155))) ^ ((int)(_828 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_828) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
    _844 = ((uint)((((int)((_836 << 4) + (uint)(-1556008596))) ^ ((int)(_836 + 1013904242u))) ^ (((uint)(_836) >> 5) + -939442524))) + _828;
    _852 = ((uint)((((int)((_844 << 4) + (uint)(-1383041155))) ^ ((int)(_844 + 1013904242u))) ^ ((int)(((uint)((uint)(_844) >> 5)) + 2123724318u)))) + _836;
    _860 = ((uint)((((int)((_852 << 4) + (uint)(-1556008596))) ^ ((int)(_852 + (uint)(-626627285)))) ^ (((uint)(_852) >> 5) + -939442524))) + _844;
    _868 = ((uint)((((int)((_860 << 4) + (uint)(-1383041155))) ^ ((int)(_860 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_860) >> 5)) + 2123724318u)))) + _852;
    _876 = ((uint)((((int)((_868 << 4) + (uint)(-1556008596))) ^ ((int)(_868 + 2027808484u))) ^ (((uint)(_868) >> 5) + -939442524))) + _860;
    _884 = ((uint)((((int)((_876 << 4) + (uint)(-1383041155))) ^ ((int)(_876 + 2027808484u))) ^ ((int)(((uint)((uint)(_876) >> 5)) + 2123724318u)))) + _868;
    _892 = ((uint)((((int)((_884 << 4) + (uint)(-1556008596))) ^ ((int)(_884 + 387276957u))) ^ (((uint)(_884) >> 5) + -939442524))) + _876;
    _900 = ((uint)((((int)((_892 << 4) + (uint)(-1383041155))) ^ ((int)(_892 + 387276957u))) ^ ((int)(((uint)((uint)(_892) >> 5)) + 2123724318u)))) + _884;
    _908 = ((uint)((((int)((_900 << 4) + (uint)(-1556008596))) ^ ((int)(_900 + (uint)(-1253254570)))) ^ (((uint)(_900) >> 5) + -939442524))) + _892;
    _916 = ((uint)((((int)((_908 << 4) + (uint)(-1383041155))) ^ ((int)(_908 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_908) >> 5)) + 2123724318u)))) + _900;
    _924 = ((uint)((((int)((_916 << 4) + (uint)(-1556008596))) ^ ((int)(_916 + 1401181199u))) ^ (((uint)(_916) >> 5) + -939442524))) + _908;
    _932 = ((uint)((((int)((_924 << 4) + (uint)(-1383041155))) ^ ((int)(_924 + 1401181199u))) ^ ((int)(((uint)((uint)(_924) >> 5)) + 2123724318u)))) + _916;
    _940 = ((uint)((((int)((_932 << 4) + (uint)(-1556008596))) ^ ((int)(_932 + (uint)(-239350328)))) ^ (((uint)(_932) >> 5) + -939442524))) + _924;
    _948 = ((uint)((((int)((_940 << 4) + (uint)(-1383041155))) ^ ((int)(_940 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_940) >> 5)) + 2123724318u)))) + _932;
    _950 = ((_940 & 16777215) == 0);
    [branch]
    if (_698) {
      _1130 = _24[min((uint)(_812), 1u)];
      _1131 = _25[min((uint)(_812), 1u)];
      _1132 = _26[min((uint)(_812), 1u)];
      if (_950) {
        _1143 = ((int)(((uint)((((int)((_948 << 4) + (uint)(-1556008596))) ^ ((int)(_948 + (uint)(-1879881855)))) ^ (((uint)(_948) >> 5) + -939442524))) + _940));
      } else {
        _1143 = _940;
      }
      _1144 = _shadowSizeAndInvSize.z * 2.0f;
      _1145 = _shadowSizeAndInvSize.w * 2.0f;
      _1152 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      _1154 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      _1158 = ((((float)((uint)((uint)(((int)(_1143 * 48271)) & 16777215)))) * _1152) - _1144) + _1130;
      _1159 = ((((float)((uint)((uint)(((int)(_1143 * -1964877855)) & 16777215)))) * _1154) - _1145) + _1131;
      _1160 = (float)((uint)_812);
      _1167 = _1132 - _810;
      _1183 = ((((float)((uint)((uint)(((int)(_1143 * -856141137)) & 16777215)))) * _1152) - _1144) + _1130;
      _1184 = ((((float)((uint)((uint)(((int)(_1143 * -613502015)) & 16777215)))) * _1154) - _1145) + _1131;
      _1205 = ((((float)((uint)((uint)(((int)(_1143 * -556260145)) & 16777215)))) * _1152) - _1144) + _1130;
      _1206 = ((((float)((uint)((uint)(((int)(_1143 * 902075297)) & 16777215)))) * _1154) - _1145) + _1131;
      _1227 = ((((float)((uint)((uint)(((int)(_1143 * 1698214639)) & 16777215)))) * _1152) - _1144) + _1130;
      _1228 = ((((float)((uint)((uint)(((int)(_1143 * 773027713)) & 16777215)))) * _1154) - _1145) + _1131;
      _1239 = (((saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1183, _1184, _1160), _1167))).x)) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1158, _1159, _1160), _1167))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1205, _1206, _1160), _1167))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1227, _1228, _1160), _1167))).x))) * 0.25f;
      _1240 = (((max(0.0f, (_1132 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1183, _1184, _1160), 0.0f))).x))) + max(0.0f, (_1132 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1158, _1159, _1160), 0.0f))).x)))) + max(0.0f, (_1132 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1205, _1206, _1160), 0.0f))).x)))) + max(0.0f, (_1132 - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1227, _1228, _1160), 0.0f))).x)))) * 0.25f;
      _1246 = saturate(_1239 * _1239);  // [sem: expr_sat]
      _1247 = saturate(_1240 * _1240);  // [sem: expr_sat]
      _1248 = 1.0h;
      _1249 = 1.0h;
      _1250 = 1.0h;
    } else {
      _954 = _24[min((uint)(_812), 1u)];
      _955 = _25[min((uint)(_812), 1u)];
      _956 = _26[min((uint)(_812), 1u)];
      _958 = select((_812 == 0), 2.5f, 1.0f);
      if (_950) {
        _971 = ((int)(((uint)((((int)((_948 << 4) + (uint)(-1556008596))) ^ ((int)(_948 + (uint)(-1879881855)))) ^ (((uint)(_948) >> 5) + -939442524))) + _940));
      } else {
        _971 = _940;
      }
      _972 = select(_170, (_958 * 0.75f), _958) * 0.6600000262260437f;
      _973 = _972 * _dynmaicShadowSizeAndInvSize.z;
      _974 = _972 * _dynmaicShadowSizeAndInvSize.w;
      _981 = _973 * 1.1920928955078125e-07f;
      _983 = _974 * 1.1920928955078125e-07f;
      _987 = ((((float)((uint)((uint)(((int)(_971 * 48271)) & 16777215)))) * _981) - _973) + _954;
      _988 = ((((float)((uint)((uint)(((int)(_971 * -1964877855)) & 16777215)))) * _983) - _974) + _955;
      _989 = (float)((uint)_812);
      _996 = _956 - _810;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1003 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_987, _988, _989), 0.0f);
      _1017 = ((((float)((uint)((uint)(((int)(_971 * -856141137)) & 16777215)))) * _981) - _973) + _954;
      _1018 = ((((float)((uint)((uint)(((int)(_971 * -613502015)) & 16777215)))) * _983) - _974) + _955;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1027 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1017, _1018, _989), 0.0f);
      _1043 = ((((float)((uint)((uint)(((int)(_971 * -556260145)) & 16777215)))) * _981) - _973) + _954;
      _1044 = ((((float)((uint)((uint)(((int)(_971 * 902075297)) & 16777215)))) * _983) - _974) + _955;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1053 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1043, _1044, _989), 0.0f);
      _1069 = ((((float)((uint)((uint)(((int)(_971 * 1698214639)) & 16777215)))) * _981) - _973) + _954;
      _1070 = ((((float)((uint)((uint)(((int)(_971 * 773027713)) & 16777215)))) * _983) - _974) + _955;
  // [sem: _3__36__0__0__g_dynamicShadowColorArray_sampleLod]
      half4 _1079 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1069, _1070, _989), 0.0f);
      _1085 = (((saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1017, _1018, _989), _996))).x)) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_987, _988, _989), _996))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1043, _1044, _989), _996))).x))) + saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1069, _1070, _989), _996))).x))) * 0.25f;
      _1086 = (((max(0.0f, (_956 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1017, _1018, _989), 0.0f))).x))) + max(0.0f, (_956 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_987, _988, _989), 0.0f))).x)))) + max(0.0f, (_956 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1043, _1044, _989), 0.0f))).x)))) + max(0.0f, (_956 - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1069, _1070, _989), 0.0f))).x)))) * 0.25f;
      _1105 = half(float(((half)(((half)((half)(_1027.x) + (half)(_1003.x))) + (half)(_1053.x))) + ((half)((half)(_1079.x) * 2.0h))) * 0.20000000298023224f);
      _1106 = half(float(((half)(((half)((half)(_1027.y) + (half)(_1003.y))) + (half)(_1053.y))) + ((half)((half)(_1079.y) * 2.0h))) * 0.20000000298023224f);
      _1107 = half(float(((half)(((half)((half)(_1027.z) + (half)(_1003.z))) + (half)(_1053.z))) + ((half)((half)(_1079.z) * 2.0h))) * 0.20000000298023224f);
      if (_812 == 1) {
        _1110 = float(_1105);
        _1111 = float(_1106);
        _1112 = float(_1107);
        _1113 = -0.0f - _697;
        _1246 = _1085;  // [sem: expr_sat]
        _1247 = _1086;  // [sem: expr_sat]
        _1248 = (half)(half((_1110 + _697) + (_1110 * _1113)));
        _1249 = (half)(half((_1111 + _697) + (_1111 * _1113)));
        _1250 = (half)(half((_1112 + _697) + (_1112 * _1113)));
      } else {
        _1246 = _1085;  // [sem: expr_sat]
        _1247 = _1086;  // [sem: expr_sat]
        _1248 = _1105;
        _1249 = _1106;
        _1250 = _1107;
      }
    }
    _1251 = (_811 != 0);
    _1253 = min(_554, select(_1251, _1246, 1.0f));
    _1257 = select((_695 != 0), select(_1251, (_1247 * 400.0f), 4e+06f), 1.0f);
    _1272 = (_1253 - (_shadowAOParams.x * _1253)) + _shadowAOParams.x;
    [branch]
    if (_1272 > 0.0f) {
      _1282 = _74 & 126;
      _1283 = (_1282 == 64);
      _1284 = (_78 == 66);
      _1285 = _1283 || _1284;
      _1286 = select(_1285, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _1302 = _sunDirection.x;
        _1303 = _sunDirection.y;
        _1304 = _sunDirection.z;
      } else {
        _1302 = _moonDirection.x;
        _1303 = _moonDirection.y;
        _1304 = _moonDirection.z;
      }
      _1305 = _56 & 3;
      _1309 = _57 & 3;
      _1315 = (_frameNumber.x * 1551) + ((uint)(((((_1309 << 1) | _1309) << 1) & 10) | (((_1305 << 1) | _1305) & 5)));
      _1320 = (((int)(_1315 << 2)) & -858993460) | (((uint)(_1315) >> 2) & 858993459);
      _1325 = (((int)(_1320 << 1)) & 10) | (((uint)(_1320) >> 1) & 21);
      _1326 = (float)((uint)(uint)(_frameNumber.x));
      _1337 = (frac(((_1326 * 92.0f) + _58) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      _1338 = (frac(((_1326 * 71.0f) + _59) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      _1343 = frac(dot(float3((_1337 * _1337), (_1338 * _1338), (_1338 * _1337)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      _1359 = frac((((float)((uint)((uint)((int)(uint(_1343 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f) + (((float)((uint)_1325)) * 0.03125f)) * 6.2831854820251465f;
      _1363 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * ((float)((uint)((uint)(reversebits(_1325) ^ (int)(uint(_1343 * 287478368.0f))))))) + _shadowAOParams.z;
      _1366 = sqrt(1.0f - (_1363 * _1363));
      _1369 = cos(_1359) * _1366;
      _1370 = sin(_1359) * _1366;
      _1372 = select((_1304 >= 0.0f), 1.0f, -1.0f);
      _1375 = -0.0f - (1.0f / (_1372 + _1304));
      _1376 = _1303 * _1375;
      _1377 = _1376 * _1302;
      _1378 = _1372 * _1302;
      _1387 = mad(_1363, _1302, mad(_1370, _1377, ((((_1378 * _1302) * _1375) + 1.0f) * _1369)));
      _1391 = mad(_1363, _1303, mad(_1370, (_1372 + (_1376 * _1303)), ((_1369 * _1372) * _1377)));
      _1395 = mad(_1363, _1304, mad(_1370, (-0.0f - _1303), (-0.0f - (_1378 * _1369))));
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x1083445B uses this native contact ray direction on Lighting High RT-off lanes; stable direction keeps Contact Micro Shadows from inheriting per-frame random cone wobble when the feature is enabled.
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _1387 = _1302;
        _1391 = _1303;
        _1395 = _1304;
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      _1396 = select(_1283, 10, 6);
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x1083445B raises native contact-ray samples only while Contact Micro Shadows is enabled, preserving the vanilla sample count when Off.
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _1396 = (int)(lerp(float(_1396), 16.0f, CONTACT_SHADOW_MARCH_BLEND) + 0.5f);
      }
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_168) {
        _1402 = min(0.5f, ((_113 * 0.0024999999441206455f) + 0.25f));
      } else {
        _1402 = 1.0f;
      }
      // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
      // Description: SceneShadowTiledCS 0x1083445B extends the native non-RT contact reach gradually with the Contact Micro Shadows quality value; Off evaluates to the vanilla reach.
      _1408 = ((abs(_1303) * (select(_1285, 12.0f, 2.0f) - _1286)) + _1286) * select(_170, lerp(0.009999999776482582f, 0.05000000074505806f, CONTACT_SHADOW_REACH_BLEND), 0.10000000149011612f);
      // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      if (!_170) {
        _1416 = max((_113 * select(((uint)(_78 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _1408);
      } else {
        _1416 = _1408;
      }
      _1429 = (_terrainNormalParams.z > 0.0f);
      if (_1429) {
        _1433 = (float)((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _1459 = frac(frac(dot(float2(((_1433 * 32.665000915527344f) + _58), ((_1433 * 11.8149995803833f) + _59)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        if (_950) {
          _1453 = ((int)(((uint)((((int)((_948 << 4) + (uint)(-1556008596))) ^ ((int)(_948 + (uint)(-1879881855)))) ^ (((uint)(_948) >> 5) + -939442524))) + _940));
        } else {
          _1453 = _940;
        }
        _1459 = (((float)((uint)((uint)(((int)(_1453 * 48271)) & 16777215)))) * 5.960464477539063e-08f);
      }
      if (_1284 || ((_78 != 15) && ((uint)(_78 + -12) < (uint)7))) {
        // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
        // Description: SceneShadowTiledCS 0x1083445B moves the native contact start closer only while Contact Micro Shadows is enabled, preserving vanilla start distance when Off.
        _1472 = (_1459 * lerp(10.0f, 2.0f, CONTACT_SHADOW_START_BLEND));
        // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
      } else {
        if (_78 == 15) {
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x1083445B applies the same Contact Micro Shadows start-distance blend to the depth-faded material branch.
          _1472 = ((lerp((10.0f - (saturate(_113 * 0.0010000000474974513f) * 9.0f)), 2.0f, CONTACT_SHADOW_START_BLEND)) * _1459);
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _1472 = _1459;
        }
      }
      if (_1282 == 12) {
        _1485 = (0.10000000149011612f - (abs(_1391) * 0.05000000074505806f));
      } else {
        if ((uint)_78 > (uint)15) {
          if (((uint)_78 < (uint)20) || (_78 == 107)) {
            _1485 = (0.10000000149011612f - (abs(_1391) * 0.05000000074505806f));
          } else {
            _1485 = 0.0f;
          }
        } else {
          _1485 = 0.0f;
        }
      }
      if (!_170) {
        _1487 = _1485 * _154;
        _1495 = (_150 - (_1487 * _150));
        _1496 = (_151 - (_1487 * _151));
        _1497 = (_152 - (_1487 * _152));
      } else {
        _1495 = _150;
        _1496 = _151;
        _1497 = _152;
      }
      if (!_1429) {
        _1501 = saturate(_113 * 0.0625f) * 0.05000000074505806f;
        _1506 = (_1501 * _101);
        _1507 = (_1501 * _102);
        _1508 = (_1501 * _103);
      } else {
        _1506 = 0.0f;
        _1507 = 0.0f;
        _1508 = 0.0f;
      }
      _1509 = _1506 + _1495;
      _1510 = _1507 + _1496;
      _1511 = _1508 + _1497;
      _1523 = mad((_viewRelative[2].z), _1511, mad((_viewRelative[1].z), _1510, ((_viewRelative[0].z) * _1509))) + (_viewRelative[3].z);
      _1526 = mad((_viewRelative[2].z), _1395, mad((_viewRelative[1].z), _1391, ((_viewRelative[0].z) * _1387)));
      _1532 = select((((_1526 * _1416) + _1523) < _nearFarProj.x), ((_nearFarProj.x - _1523) / _1526), _1416);
      _1564 = mad((_viewProjRelative[2].z), _1511, mad((_viewProjRelative[1].z), _1510, ((_viewProjRelative[0].z) * _1509))) + (_viewProjRelative[3].z);
      _1568 = mad((_viewProjRelative[2].w), _1511, mad((_viewProjRelative[1].w), _1510, ((_viewProjRelative[0].w) * _1509))) + (_viewProjRelative[3].w);
      _1572 = (_1532 * _1387) + _1509;
      _1573 = (_1532 * _1391) + _1510;
      _1574 = (_1532 * _1395) + _1511;
      _1590 = mad((_viewProjRelative[2].w), _1574, mad((_viewProjRelative[1].w), _1573, ((_viewProjRelative[0].w) * _1572))) + (_viewProjRelative[3].w);
      _1591 = (mad((_viewProjRelative[2].x), _1511, mad((_viewProjRelative[1].x), _1510, ((_viewProjRelative[0].x) * _1509))) + (_viewProjRelative[3].x)) / _1568;
      _1592 = (mad((_viewProjRelative[2].y), _1511, mad((_viewProjRelative[1].y), _1510, ((_viewProjRelative[0].y) * _1509))) + (_viewProjRelative[3].y)) / _1568;
      _1593 = _1564 / _1568;
      _1597 = ((mad((_viewProjRelative[2].x), _1574, mad((_viewProjRelative[1].x), _1573, ((_viewProjRelative[0].x) * _1572))) + (_viewProjRelative[3].x)) / _1590) - _1591;
      _1598 = ((mad((_viewProjRelative[2].y), _1574, mad((_viewProjRelative[1].y), _1573, ((_viewProjRelative[0].y) * _1572))) + (_viewProjRelative[3].y)) / _1590) - _1592;
      _1601 = 1.0f / ((float)((uint)_1396));
      _1612 = max(_1601, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_1597)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_1598))) * _1601))));
      _1613 = _1612 * (((mad((_viewProjRelative[2].z), _1574, mad((_viewProjRelative[1].z), _1573, ((_viewProjRelative[0].z) * _1572))) + (_viewProjRelative[3].z)) / _1590) - _1593);
      _1632 = ((_1402 * 0.5f) * max(abs(_1613), (_1593 - ((mad((_proj[2].z), _113, 0.0f) + _1564) / (mad((_proj[2].w), _113, 0.0f) + _1568))))) * max(0.0625f, _1601);
      _1633 = _1612 * _1601;
      _1635 = (_1597 * 0.5f) * _1633;
      _1637 = (_1598 * -0.5f) * _1633;
      _1638 = _1613 * _1601;
      _1645 = max(_1472, (1.0f / max((abs(_1635) * _bufferSizeAndInvSize.x), (abs(_1637) * _bufferSizeAndInvSize.y))));
      _1652 = 0.5f / _bufferSizeAndInvSize.x;
      _1654 = (((_1591 * 0.5f) + 0.5f) + (_1645 * _1635));
      _1655 = ((0.5f - (_1592 * 0.5f)) + (_1645 * _1637));
      _1656 = ((_1645 * _1638) + _1593);
      _1657 = _1472;
  // [sem: expr_sat]
      _1658 = saturate(((_113 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_101, _102, _103), float3((-0.0f - (_150 * _154)), (-0.0f - (_151 * _154)), (-0.0f - (_152 * _154))))))) + 0.009999999776482582f);
      _1659 = 0;
      _1660 = 0;
      _1661 = 1.0f;
      _1662 = 0.0f;
      while(true) {
  // [sem: _3__36__0__0__g_depthStencil_load]
        _1671 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_1654, _1652), (1.0f - _1652)) * _bufferSizeAndInvSize.x), int(_1655 * _bufferSizeAndInvSize.y), 0));
        _1673 = (uint)((uint)(_1671.x)) >> 24;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _1676 = ((float)((uint)((uint)(_1671.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencil_load_derived]
        _1677 = _1673 & 127;
        _1678 = (_1659 == 0);
        _1679 = select(_1678, 1.0f, _1658);
        _1680 = _1656 - _1676;
        _1684 = _nearFarProj.x / max(1.0000000116860974e-07f, _1676);
        _1687 = _1684 - (_nearFarProj.x / max(1.0000000116860974e-07f, _1656));
        _1690 = (abs(_1680 + _1632) < _1632);
        _1691 = (int)(uint)(_1690);
        if (_1690) {
          if ((_1677 == 7) || ((_1677 == 54) || (((_1673 & 126) == 66) || (((uint)(_1677 + -5) < (uint)2) || ((_1677 == 107) || ((_1677 == 26) || (((uint)(_1677 + -27) < (uint)2) || ((_1677 == 106) || (((_1673 & 125) == 105) || ((_1677 == 18) || ((uint)(_1677 + -19) < (uint)2))))))))))) {
            _1725 = true;
            _1732 = ((int)(uint)((int)((_1687 < 0.0f) && (_1687 > select(_1725, -0.07999999821186066f, -1.0f)))));
          } else {
            if ((uint)(_1677 + -53) < (uint)14) {
              _1725 = (_1684 < 32.0f);
              _1732 = ((int)(uint)((int)((_1687 < 0.0f) && (_1687 > select(_1725, -0.07999999821186066f, -1.0f)))));
            } else {
              _1732 = _1691;
            }
          }
        } else {
          _1732 = _1691;
        }
        if (!(_1732 == 0)) {
          if ((uint)_1677 > (uint)11) {
            if (!((uint)_1677 < (uint)18)) {
              if (!((_1677 == 18) || ((_1677 == 107) || ((uint)(_1677 + -19) < (uint)2)))) {
                if (!(_1677 == 66)) {
                  _1751 = 0.0f;
                } else {
                  _1751 = 0.10000000149011612f;
                }
              } else {
                _1751 = 0.15000000596046448f;
              }
            } else {
              _1751 = 0.10000000149011612f;
            }
          } else {
            if (!(_1677 == 11)) {
              _1751 = 0.0f;
            } else {
              _1751 = 0.10000000149011612f;
            }
          }
          _1753 = saturate(_1684 * 0.015625f);  // [sem: expr_sat]
          _1756 = (1.0f - _1753) + (_1753 * _1751);
          if (_170) {
            _1767 = saturate((-0.0f - _1687) / (_1657 * 0.004654859658330679f));  // [sem: expr_sat]
          } else {
            _1767 = 1.0f;  // [sem: expr_sat]
          }
          _1774 = _1677;
          // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
          // Description: SceneShadowTiledCS 0x1083445B softens native contact accumulation with Contact Micro Shadows tuning so the added detail blends with the shipped non-RT contact result.
          float _rndxMicroFarAccum = (saturate(1.0f - ((_1756 * _1756) * _1751)) * (1.0f - _1662)) * _1767;
          _1775 = saturate((_rndxMicroFarAccum * lerp(1.0f, 0.7f, CONTACT_SHADOW_BASE_TUNING)) + _1662);  // [sem: expr_sat]
          // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
        } else {
          _1774 = _1660;
          _1775 = _1662;  // [sem: expr_sat]
        }
        [branch]
        if (_1775 > 0.949999988079071f) {
          if (!_1678) {
            _1806 = (saturate(_1661 / (_1661 - _1680)) - min(_1657, _1679));
          } else {
            _1806 = 0.0f;
          }
          _1815 = ((_1806 * _1635) + _1654);
          _1816 = ((_1806 * _1637) + _1655);
          _1817 = ((_1806 * _1638) + _1656);
          _1818 = _1676;
          _1819 = _1677;
        } else {
          if ((uint)_1659 < (uint)(_1396 + -1)) {
            _1798 = ((_1679 * _1635) + _1654);
            _1799 = ((_1679 * _1637) + _1655);
            _1800 = ((_1679 * _1638) + _1656);
            _1801 = (_1679 + _1657);
            _1802 = min(abs(_1638), _1680);
          } else {
            _1798 = _1654;
            _1799 = _1655;
            _1800 = _1656;
            _1801 = _1657;
            _1802 = _1661;
          }
          _1803 = _1659 + 1;
          if ((uint)_1803 < (uint)_1396) {
            _1654 = _1798;
            _1655 = _1799;
            _1656 = _1800;
            _1657 = _1801;
            _1658 = _1679;  // [sem: expr_sat]
            _1659 = _1803;
            _1660 = _1774;
            _1661 = _1802;
            _1662 = _1775;
            continue;
          } else {
            _1815 = 0.0f;
            _1816 = 0.0f;
            _1817 = -1.0f;
            _1818 = 0.0f;
            _1819 = _1774;
          }
        }
        _1823 = (_1775 > 0.0f);
        if (_1817 > 0.0f) {
          if (_1823 || (((_1815 >= 0.0f) && (_1815 <= 1.0f)) && ((_1816 >= 0.0f) && (_1816 <= 1.0f)))) {
            _1837 = (_1815 * 2.0f) + -1.0f;
            _1838 = 1.0f - (_1816 * 2.0f);
            _1854 = mad((_invViewProjRelative[2].w), _1817, mad((_invViewProjRelative[1].w), _1838, (_1837 * (_invViewProjRelative[0].w)))) + (_invViewProjRelative[3].w);
            if (!(_1819 == 2)) {
              if (_1819 == 3) {
                _1878 = 0.0f;
                _1880 = _1878;
              } else {
                if (_1819 == 21) {
                  if (!(_78 == 21)) {
                    _1878 = 0.0f;
                    _1880 = _1878;
                  } else {
                    _1880 = 20.0f;
                  }
                } else {
                  _1871 = (_1819 == 22);
                  if (!((_78 == 22) && _1871)) {
                    _1878 = select(_1871, 0.0f, 1.0f);
                    _1880 = _1878;
                  } else {
                    _1880 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_78 == 2)) {
                _1878 = 0.0f;
                _1880 = _1878;
              } else {
                _1880 = 20.0f;
              }
            }
            if (!(_168 || (!(_1775 == 1.0f)))) {
  // [sem: expr_sat]
              _1904 = saturate(((((_1416 * 0.9375f) - max(0.0f, dot(float3(_1387, _1391, _1395), float3((((mad((_invViewProjRelative[2].x), _1817, mad((_invViewProjRelative[1].x), _1838, (_1837 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[3].x)) / _1854) - _1509), (((mad((_invViewProjRelative[2].y), _1817, mad((_invViewProjRelative[1].y), _1838, (_1837 * (_invViewProjRelative[0].y)))) + (_invViewProjRelative[3].y)) / _1854) - _1510), (((mad((_invViewProjRelative[2].z), _1817, mad((_invViewProjRelative[1].z), _1838, (_1837 * (_invViewProjRelative[0].z)))) + (_invViewProjRelative[3].z)) / _1854) - _1511))))) * ((_113 * 0.015625f) + 1.5f)) / _1416) * 0.9375f);
            } else {
              _1904 = _1775;  // [sem: expr_sat]
            }
            _1905 = _1904 * saturate(exp2(min(0.0f, (((_113 * 0.018666666001081467f) + 0.13333334028720856f) + (_1880 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _1818)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1817)))))) * 1.4426950216293335f));
            _1906 = _1819 & -2;
            if (!(_1906 == 6)) {
              if ((((_78 == 33) && (_1819 == 33)) || (!(_78 == 33) && ((_78 == 55) && (_1819 == 55))))) {
                _1980 = (_1905 * 0.009999999776482582f);
              } else {
                if (!((_1819 == 54) || (_1906 == 66)) || (((_1819 == 54) || (_1906 == 66)) && (!((_1282 == 66) || (_78 == 54))))) {
                  if (!_170) {
                    if ((uint)((int)(_1819 + (uint)(-53))) < (uint)15) {
                      _1977 = saturate(_113 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _1977 = 1.0f;  // [sem: expr_sat]
                    }
                    _1980 = (_1977 * _1905);
                  } else {
                    _1980 = _1905;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _1932 = __3__36__0__0__g_baseColor.Load(int3(int(_1815 * _bufferSizeAndInvSize.x), int(_1816 * _bufferSizeAndInvSize.y), 0));
                  _1938 = ((float)((uint)((uint)(((uint)((uint)(_1932.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _1941 = ((float)((uint)((uint)(_1932.x & 255)))) * 0.003921568859368563f;
                  _1945 = ((float)((uint)((uint)(((uint)((uint)(_1932.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _1946 = _1938 * _1938;
                  _1947 = _1941 * _1941;
                  _1948 = _1945 * _1945;
                  _1980 = (saturate(1.0f - (dot(float3((((_1946 * 0.6131200194358826f) + (_1947 * 0.3395099937915802f)) + (_1948 * 0.047370001673698425f)), (((_1946 * 0.07020000368356705f) + (_1947 * 0.9163600206375122f)) + (_1948 * 0.013450000435113907f)), (((_1946 * 0.02061999961733818f) + (_1947 * 0.10958000272512436f)) + (_1948 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _1905);
                }
              }
            } else {
              _1980 = (_1905 * 0.009999999776482582f);
            }
          } else {
            _1980 = 0.0f;
          }
        } else {
          if (_1823) {
            _1837 = (_1815 * 2.0f) + -1.0f;
            _1838 = 1.0f - (_1816 * 2.0f);
            _1854 = mad((_invViewProjRelative[2].w), _1817, mad((_invViewProjRelative[1].w), _1838, (_1837 * (_invViewProjRelative[0].w)))) + (_invViewProjRelative[3].w);
            if (!(_1819 == 2)) {
              if (_1819 == 3) {
                _1878 = 0.0f;
                _1880 = _1878;
              } else {
                if (_1819 == 21) {
                  if (!(_78 == 21)) {
                    _1878 = 0.0f;
                    _1880 = _1878;
                  } else {
                    _1880 = 20.0f;
                  }
                } else {
                  _1871 = (_1819 == 22);
                  if (!((_78 == 22) && _1871)) {
                    _1878 = select(_1871, 0.0f, 1.0f);
                    _1880 = _1878;
                  } else {
                    _1880 = 20.0f;
                  }
                }
              }
            } else {
              if (!(_78 == 2)) {
                _1878 = 0.0f;
                _1880 = _1878;
              } else {
                _1880 = 20.0f;
              }
            }
            if (!(_168 || (!(_1775 == 1.0f)))) {
  // [sem: expr_sat]
              _1904 = saturate(((((_1416 * 0.9375f) - max(0.0f, dot(float3(_1387, _1391, _1395), float3((((mad((_invViewProjRelative[2].x), _1817, mad((_invViewProjRelative[1].x), _1838, (_1837 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[3].x)) / _1854) - _1509), (((mad((_invViewProjRelative[2].y), _1817, mad((_invViewProjRelative[1].y), _1838, (_1837 * (_invViewProjRelative[0].y)))) + (_invViewProjRelative[3].y)) / _1854) - _1510), (((mad((_invViewProjRelative[2].z), _1817, mad((_invViewProjRelative[1].z), _1838, (_1837 * (_invViewProjRelative[0].z)))) + (_invViewProjRelative[3].z)) / _1854) - _1511))))) * ((_113 * 0.015625f) + 1.5f)) / _1416) * 0.9375f);
            } else {
              _1904 = _1775;  // [sem: expr_sat]
            }
            _1905 = _1904 * saturate(exp2(min(0.0f, (((_113 * 0.018666666001081467f) + 0.13333334028720856f) + (_1880 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _1818)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _1817)))))) * 1.4426950216293335f));
            _1906 = _1819 & -2;
            if (!(_1906 == 6)) {
              if ((((_78 == 33) && (_1819 == 33)) || (!(_78 == 33) && ((_78 == 55) && (_1819 == 55))))) {
                _1980 = (_1905 * 0.009999999776482582f);
              } else {
                if (!((_1819 == 54) || (_1906 == 66)) || (((_1819 == 54) || (_1906 == 66)) && (!((_1282 == 66) || (_78 == 54))))) {
                  if (!_170) {
                    if ((uint)((int)(_1819 + (uint)(-53))) < (uint)15) {
                      _1977 = saturate(_113 * 0.03125f);  // [sem: expr_sat]
                    } else {
                      _1977 = 1.0f;  // [sem: expr_sat]
                    }
                    _1980 = (_1977 * _1905);
                  } else {
                    _1980 = _1905;
                  }
                } else {
  // [sem: _3__36__0__0__g_baseColor_load]
                  _1932 = __3__36__0__0__g_baseColor.Load(int3(int(_1815 * _bufferSizeAndInvSize.x), int(_1816 * _bufferSizeAndInvSize.y), 0));
                  _1938 = ((float)((uint)((uint)(((uint)((uint)(_1932.x)) >> 8) & 255)))) * 0.003921568859368563f;
                  _1941 = ((float)((uint)((uint)(_1932.x & 255)))) * 0.003921568859368563f;
                  _1945 = ((float)((uint)((uint)(((uint)((uint)(_1932.y)) >> 8) & 255)))) * 0.003921568859368563f;
                  _1946 = _1938 * _1938;
                  _1947 = _1941 * _1941;
                  _1948 = _1945 * _1945;
                  _1980 = (saturate(1.0f - (dot(float3((((_1946 * 0.6131200194358826f) + (_1947 * 0.3395099937915802f)) + (_1948 * 0.047370001673698425f)), (((_1946 * 0.07020000368356705f) + (_1947 * 0.9163600206375122f)) + (_1948 * 0.013450000435113907f)), (((_1946 * 0.02061999961733818f) + (_1947 * 0.10958000272512436f)) + (_1948 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _1905);
                }
              }
            } else {
              _1980 = (_1905 * 0.009999999776482582f);
            }
          } else {
            _1980 = 0.0f;
          }
        }
        _1984 = saturate(1.0f - _1980);  // [sem: expr_sat]
        break;
      }
    } else {
      _1984 = 1.0f;  // [sem: expr_sat]
    }
    // RenoDX: >>> [Patch: ContactMicroShadowsFamily] [Version: 1.10]
    // Description: SceneShadowTiledCS 0x1083445B fills sub-pixel occluders in the Lighting High RT-off shadow sibling, then fades the helper near screen edges to avoid bright edge artifacts.
    _1984 = ApplyContactMicroDetailShadow(
        _1984,
        float2(_58, _59),
        _113,
        _74,
        float3(_1302, _1303, _1304),
        float3(_1509, _1510, _1511),
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
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _1984 < 1.0f) {
      float2 _rndxMicroScreenUV = float2((_58 + 0.5f) * _bufferSizeAndInvSize.z,
                                         (_59 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _rndxMicroEdgeDist = min(_rndxMicroScreenUV, 1.0f - _rndxMicroScreenUV);
      float _rndxMicroEdgeFade = saturate(min(_rndxMicroEdgeDist.x, _rndxMicroEdgeDist.y) * 10.0f);
      _1984 = lerp(lerp(1.0f, _1984, 0.5f), _1984, _rndxMicroEdgeFade);
    }
    // RenoDX: <<< [Patch: ContactMicroShadowsFamily]
    _1985 = min(_1272, _1984);
    _1999 = float(half(_1985 * float(_1248)));
    _2000 = float(half(_1985 * float(_1249)));
    _2001 = float(half(_1985 * float(_1250)));
  // [sem: expr_sat]
    _2002 = saturate((1.0f - _554) + (exp2(log2(saturate(select(_170, (_1257 + 0.9800000190734863f), _1257))) * 0.45454543828964233f) * _554));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(_56, _57)] = float4((half)(half(_1999)), (half)(half(_2000)), (half)(half(_2001)), (half)(half(_2002)));
}
