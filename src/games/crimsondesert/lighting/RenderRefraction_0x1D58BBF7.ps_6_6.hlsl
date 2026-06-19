#include "../shared.h"

struct ManyLightsData {
  float4 _position;
  float4 _color;
  uint2 _up;
  uint2 _look;
};


Texture2D<float> __3__36__0__0__g_lightProfile : register(t64, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t52, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t82, space36);

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t59, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t92, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t95, space36);

Texture2D<uint2> __3__36__0__0__g_manyLightsHitData : register(t32, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t10, space37);

StructuredBuffer<ManyLightsData> __3__37__0__0__g_manyLightsDataBuffer : register(t1, space37);

Texture3D<float4> __3__36__0__0__g_texFroxelLight : register(t80, space36);

Texture3D<float4> __3__36__0__0__g_texFroxel : register(t81, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t34, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t35, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_extinction : register(t37, space36);

Texture2D<float> __3__36__0__0__g_depthTranslucent : register(t39, space36);

Texture2D<uint2> __3__36__0__0__g_stencilTranslucent : register(t40, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t42, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t43, space36);

Texture2D<float4> __3__36__0__0__g_sceneSpecular : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_dlssRRNormalRoughnessOpaque : register(t48, space36);

RWTexture2D<float4> __3__38__0__1__g_dlssRRDiffuseAlbedoUAV : register(u0, space38);

RWTexture2D<float4> __3__38__0__1__g_dlssRRSpecularAlbedoUAV : register(u1, space38);

RWTexture2D<float4> __3__38__0__1__g_dlssRRNormalRoughnessUAV : register(u2, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b5, space35) {
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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b6, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b18, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b15, space35) {
  float _sunLightIntensity : packoffset(c000.x);
  float _sunLightPreset : packoffset(c000.y);
  float _sunSizeAngle : packoffset(c000.z);
  float _sunSizeAngleCosine : packoffset(c000.w);
  float _sunDirY : packoffset(c001.x);
  float _moonLightIntensity : packoffset(c001.y);
  float _moonLightPreset : packoffset(c001.z);
  float _moonSizeAngle : packoffset(c001.w);
  float _moonSizeAngleCosine : packoffset(c002.x);
  float _moonDirY : packoffset(c002.y);
  float _earthAxisTilt : packoffset(c002.z);
  float _latitude : packoffset(c002.w);
  float _earthRadius : packoffset(c003.x);
  float _atmosphereThickness : packoffset(c003.y);
  float _rayleighScaledHeight : packoffset(c003.z);
  uint _rayleighScatteringColor : packoffset(c003.w);
  float _mieScaledHeight : packoffset(c004.x);
  float _mieAerosolDensity : packoffset(c004.y);
  float _mieAerosolAbsorption : packoffset(c004.z);
  float _miePhaseConst : packoffset(c004.w);
  float _ozoneRatio : packoffset(c005.x);
  float _directionalLightLuminanceScale : packoffset(c005.y);
  float _distanceScale : packoffset(c005.z);
  float _heightFogDensity : packoffset(c005.w);
  float _heightFogBaseline : packoffset(c006.x);
  float _heightFogFalloff : packoffset(c006.y);
  float _heightFogScale : packoffset(c006.z);
  float _cloudBaseDensity : packoffset(c006.w);
  float _cloudBaseContrast : packoffset(c007.x);
  float _cloudBaseScale : packoffset(c007.y);
  float _cloudAlpha : packoffset(c007.z);
  float _cloudScrollMultiplier : packoffset(c007.w);
  float _cloudScatteringCoefficient : packoffset(c008.x);
  float _cloudPhaseConstFront : packoffset(c008.y);
  float _cloudPhaseConstBack : packoffset(c008.z);
  float _cloudAltitude : packoffset(c008.w);
  float _cloudThickness : packoffset(c009.x);
  float _cloudVisibleRange : packoffset(c009.y);
  float _cloudNear : packoffset(c009.z);
  float _cloudFadeRange : packoffset(c009.w);
  float _cloudDetailRatio : packoffset(c010.x);
  float _cloudDetailScale : packoffset(c010.y);
  float _cloudMultiRatio : packoffset(c010.z);
  float _cloudBeerPowderRatio : packoffset(c010.w);
  float _cloudCirrusAltitude : packoffset(c011.x);
  float _cloudCirrusDensity : packoffset(c011.y);
  float _cloudCirrusScale : packoffset(c011.z);
  float _cloudCirrusWeightR : packoffset(c011.w);
  float _cloudCirrusWeightG : packoffset(c012.x);
  float _cloudCirrusWeightB : packoffset(c012.y);
  float _cloudFlow : packoffset(c012.z);
  float _cloudSeed : packoffset(c012.w);
  float4 _volumeFogScatterColor : packoffset(c013.x);
  float4 _mieScatterColor : packoffset(c014.x);
};

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b16, space35) {
  float4 _precomputedAmbient0 : packoffset(c000.x);
  float4 _precomputedAmbient1 : packoffset(c001.x);
  float4 _precomputedAmbient2 : packoffset(c002.x);
  float4 _precomputedAmbient3 : packoffset(c003.x);
  float4 _precomputedAmbient4 : packoffset(c004.x);
  float4 _precomputedAmbient5 : packoffset(c005.x);
  float4 _precomputedAmbient6 : packoffset(c006.x);
  float4 _precomputedAmbient7 : packoffset(c007.x);
  float4 _precomputedAmbients[56] : packoffset(c008.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _debugColor : packoffset(c000.x);
  float4 _cubemapViewPosRelative : packoffset(c001.x);
  float4 _volumeSize : packoffset(c002.x);
  float4 _tiledRadianceCacheParams : packoffset(c003.x);
};

SamplerState __0__4__0__0__g_staticBilinearWrapUWClampV : register(s1, space4);

SamplerState __0__4__0__0__g_staticBilinearMirror : register(s2, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  uint _47;
  uint _48;
  float _50;
  float _53;
  float _55;
  float _56;
  float _78;
  float _82;
  float _86;
  float _90;
  float _92;
  float _93;
  float _94;
  float _95;
  float _100;
  float _101;
  float _102;
  uint4 _104;
  float4 _108;
  float _114;
  float _115;
  bool _124;
  float _134;
  float _135;
  float _136;
  float _138;
  float _139;
  float _140;
  float _141;
  float _144;
  float _145;
  float _148;
  float _149;
  float _153;
  float _155;
  float _156;
  float _157;
  float _158;
  float _160;
  float _163;
  float _165;
  float _166;
  float _169;
  float _172;
  float _173;
  float _176;
  float _177;
  float _180;
  float _184;
  float _186;
  float _187;
  float _188;
  float _189;
  float4 _191;
  int _199;
  bool _200;
  float _203;
  bool _205;
  bool _206;
  float _207;
  float _215;
  float _297;
  float _298;
  float _299;
  float _300;
  float _301;
  float _302;
  float _324;
  float _325;
  float _326;
  float _400;
  float _401;
  float _467;
  float _468;
  float _469;
  float _470;
  float _471;
  int _715;
  float _751;
  float _752;
  float _753;
  float _754;
  int _755;
  int _794;
  float _830;
  float _831;
  float _832;
  float _833;
  int _834;
  int _835;
  int _836;
  int _891;
  float _928;
  float _929;
  float _930;
  float _931;
  int _932;
  int _933;
  int _979;
  float _1010;
  float _1011;
  float _1012;
  float _1013;
  int _1014;
  int _1015;
  float _1034;
  float _1106;
  float _1122;
  float _1123;
  float _1124;
  float _1144;
  float _1201;
  float _1301;
  float _1302;
  float _1303;
  float _1438;
  float _1449;
  float _1675;
  float _1729;
  float _1819;
  float _1820;
  float _1821;
  float _1865;
  float _1866;
  float _1867;
  float _1951;
  float _1952;
  float _1953;
  float _2035;
  float _2036;
  float _2037;
  float _2038;
  float _2039;
  float _2040;
  float _224;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  int _232;
  int _233;
  float _238;
  float _239;
  float _261;
  float _269;
  float _270;
  float _271;
  float _272;
  float _276;
  float _277;
  float _278;
  float _284;
  float _285;
  float _286;
  float _287;
  float _288;
  float _303;
  float _308;
  float _316;
  float _333;
  float _341;
  float _345;
  float _346;
  float _347;
  float _375;
  float _394;
  float _406;
  float _410;
  float _411;
  float _412;
  int _415;
  int _416;
  float _421;
  float _422;
  float _439;
  float _441;
  float _443;
  float _444;
  float _460;
  float _478;
  float _479;
  float _480;
  float4 _482;
  float _487;
  float _500;
  float _501;
  float _502;
  float _503;
  float _504;
  float _505;
  float _518;
  float _519;
  float _520;
  float _567;
  uint _582;
  uint _590;
  uint _598;
  uint _606;
  uint _614;
  uint _622;
  uint _630;
  uint _638;
  uint _646;
  uint _654;
  uint _662;
  uint _670;
  uint _678;
  uint _686;
  uint _694;
  uint _702;
  bool _704;
  float _730;
  float _731;
  float _732;
  float _733;
  bool _744;
  float _783;
  float _809;
  float _810;
  bool _821;
  bool _837;
  float _843;
  float _844;
  float _845;
  float _850;
  float _851;
  float _852;
  float _880;
  float _892;
  float _893;
  float _900;
  float _902;
  float _906;
  float _907;
  float _908;
  float _909;
  bool _920;
  float _938;
  float _939;
  float _940;
  float _968;
  float _990;
  float _991;
  bool _1002;
  float _1018;
  float _1019;
  float _1054;
  float _1058;
  float _1062;
  float _1077;
  float4 _1081;
  float _1086;
  float _1091;
  float _1093;
  float _1100;
  bool _1110;
  float _1147;
  float _1153;
  float _1158;
  float _1163;
  float _1171;
  float _1178;
  float2 _1206;
  float _1228;
  float _1246;
  float _1247;
  float _1248;
  float _1267;
  float _1274;
  float _1286;
  float _1289;
  float _1295;
  float _1325;
  float _1327;
  float _1334;
  float _1338;
  float _1340;
  float _1342;
  float _1344;
  float _1382;
  float _1383;
  float _1384;
  float _1386;
  float _1387;
  float _1388;
  float _1391;
  float _1392;
  float _1393;
  float _1412;
  float _1413;
  float _1414;
  float _1420;
  float _1450;
  float _1460;
  float _1461;
  float _1462;
  float _1463;
  float _1477;
  float _1490;
  float _1491;
  float _1492;
  float _1494;
  float _1495;
  float _1496;
  float _1497;
  float _1498;
  float _1499;
  float _1501;
  float _1503;
  float _1504;
  float _1517;
  float _1520;
  float _1521;
  float _1523;
  float _1531;
  float _1541;
  float _1542;
  float _1543;
  float _1563;
  float _1565;
  float _1567;
  float _1569;
  float _1578;
  float _1585;
  float _1586;
  float _1587;
  float _1588;
  int _1599;
  int _1608;
  uint2 _1612;
  int _1619;
  float _1629;
  float _1630;
  float _1631;
  float _1633;
  float _1634;
  float _1635;
  float _1636;
  int _1638;
  int _1639;
  int _1641;
  int _1642;
  float _1643;
  float _1644;
  float _1645;
  float _1651;
  float _1652;
  float _1653;
  float _1654;
  float _1655;
  bool _1656;
  float _1676;
  float _1677;
  float _1682;
  float _1686;
  float _1687;
  float _1688;
  float _1690;
  float _1691;
  float _1692;
  float _1693;
  float _1694;
  float _1696;
  float _1698;
  float _1703;
  float _1704;
  float _1706;
  float _1721;
  float _1747;
  float _1748;
  float _1749;
  float _1750;
  float _1755;
  float _1756;
  float _1757;
  float _1758;
  float _1760;
  float _1764;
  float _1765;
  float _1766;
  float _1768;
  float _1769;
  float _1770;
  float _1771;
  float _1781;
  float _1784;
  float _1792;
  bool _1795;
  bool _1796;
  bool _1797;
  bool _1798;
  float _1813;
  float _1822;
  float _1823;
  float _1824;
  float _1826;
  float _1827;
  float _1828;
  float _1829;
  float _1830;
  float _1831;
  float _1835;
  float _1836;
  float _1838;
  float _1850;
  float _1857;
  float4 _1873;
  float _1898;
  float _1915;
  float _1916;
  float4 _1918;
  float4 _1923;
  float _1933;
  float _1934;
  float _1935;
  float _1936;
  float _1940;
  int _1967;
  int _1968;
  float _2008;
  float _2009;
  float _2010;
  float _2011;
  float _2024;
  float _2025;
  float _2026;
  float _2027;
  float _2030;
  float4 _2042;
  float _2046;
  float4 _2057;
  uint4 _2061;
  float _2067;
  float _2070;
  float _2074;
  float _2078;
  float _2079;
  float _2080;
  float4 _2100;
  float _2106;
  float _2107;
  float _2108;
  float _2109;
  float _2111;
  float _2119;
  float _2120;
  float _2121;
  float _2122;
  float _2124;
  float _2151;
  _47 = uint(SV_Position.x);
  _48 = uint(SV_Position.y);
  _50 = __3__36__0__0__g_depthTranslucent.Load(int3(_47, _48, 0));  // [sem: _3__36__0__0__g_depthTranslucent_load]
  _53 = (TEXCOORD.x * 2.0f) + -1.0f;
  _55 = 1.0f - (TEXCOORD.y * 2.0f);
  _56 = max(1.0000000116860974e-07f, _50.x);  // [sem: _3__36__0__0__g_depthTranslucent_load_derived]
  _78 = mad((_invViewProjRelative[1].x), _55, ((_invViewProjRelative[0].x) * _53));
  _82 = mad((_invViewProjRelative[1].y), _55, ((_invViewProjRelative[0].y) * _53));
  _86 = mad((_invViewProjRelative[1].z), _55, ((_invViewProjRelative[0].z) * _53));
  _90 = mad((_invViewProjRelative[1].w), _55, ((_invViewProjRelative[0].w) * _53));
  _92 = mad((_invViewProjRelative[2].w), _56, _90) + (_invViewProjRelative[3].w);
  _93 = (mad((_invViewProjRelative[2].x), _56, _78) + (_invViewProjRelative[3].x)) / _92;
  _94 = (mad((_invViewProjRelative[2].y), _56, _82) + (_invViewProjRelative[3].y)) / _92;
  _95 = (mad((_invViewProjRelative[2].z), _56, _86) + (_invViewProjRelative[3].z)) / _92;
  _100 = _viewPos.x + _93;
  _101 = _viewPos.y + _94;
  _102 = _viewPos.z + _95;
  _104 = __3__36__0__0__g_baseColor.Load(int3(_47, _48, 0));  // [sem: _3__36__0__0__g_baseColor_load]
  _108 = __3__36__0__0__g_normal.Load(int3(_47, _48, 0));  // [sem: _3__36__0__0__g_normal_load]
  _114 = (float)((uint)((uint)(_104.z & 255)));  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _115 = _114 * 0.003921568859368563f;
  _124 = ((int)(uint((_108.w * 3.0f) + 0.5f)) == 1);  // [sem: _3__36__0__0__g_normal_load_derived]
  _134 = (saturate(_108.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _135 = (saturate(_108.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _136 = (saturate(_108.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _138 = rsqrt(dot(float3(_134, _135, _136), float3(_134, _135, _136)));  // [sem: invLength]
  _139 = _138 * _134;
  _140 = _138 * _135;
  _141 = _136 * _138;
  _144 = (((float)((uint)((uint)(((uint)((uint)(_104.w)) >> 8) & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _145 = (((float)((uint)((uint)(_104.w & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _148 = (_144 + _145) * 0.5f;
  _149 = (_144 - _145) * 0.5f;
  _153 = (1.0f - abs(_148)) - abs(_149);
  _155 = rsqrt(dot(float3(_148, _149, _153), float3(_148, _149, _153)));  // [sem: invLength]
  _156 = _155 * _148;
  _157 = _155 * _149;
  _158 = _155 * _153;
  _160 = select((_141 >= 0.0f), 1.0f, -1.0f);
  _163 = -0.0f - (1.0f / (_160 + _141));
  _165 = (_139 * _163) * _140;
  _166 = _160 * _139;
  _169 = ((_166 * _139) * _163) + 1.0f;
  _172 = ((_140 * _140) * _163) + _160;
  _173 = -0.0f - _140;
  _176 = mad(_158, _139, mad(_157, _165, (_169 * _156)));
  _177 = _165 * _160;
  _180 = mad(_158, _140, mad(_157, _172, (_177 * _156)));
  _184 = mad(_158, _141, mad(_157, _173, (-0.0f - (_166 * _156))));
  _186 = rsqrt(dot(float3(_176, _180, _184), float3(_176, _180, _184)));  // [sem: invLength]
  _187 = _186 * _176;
  _188 = _186 * _180;
  _189 = _186 * _184;
  _191 = __3__36__0__0__g_character.Load(int3(_47, _48, 0));  // [sem: _3__36__0__0__g_character_load]
  _199 = (((uint2)(__3__36__0__0__g_stencilTranslucent.Load(int3(_47, _48, 0)))).x) & 127;
  _200 = (_199 == 24);
  _203 = select(_200, 1.0f, select((_199 == 25), 0.6000000238418579f, 0.0f));
  _205 = (_199 == 29);
  _206 = _124 || _205;
  _207 = select(_206, 1.0f, 0.0f);
  if (_124 && _205) {
    _215 = select((((int)(uint(_114)) & 128) != 0), 1.0f, 0.0f);
  } else {
    _215 = 0.0f;
  }
  _224 = sqrt(((_94 * _94) + (_93 * _93)) + (_95 * _95));
  _225 = max(9.999999747378752e-06f, _224);
  _226 = (-0.0f - _93) / _225;
  _227 = (-0.0f - _94) / _225;
  _228 = (-0.0f - _95) / _225;
  _229 = dot(float3(_187, _188, _189), float3(_226, _227, _228));
  _232 = int(floor(TEXCOORD.x));
  _233 = int(floor(TEXCOORD.y));
  _238 = abs(TEXCOORD.x - float((int)(_232)));
  _239 = abs(TEXCOORD.y - float((int)(_233)));
  _261 = max(1.0000000116860974e-07f, (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(_bufferSizeAndInvSize.x * select(((_232 & 1) == 0), _238, (1.0f - _238))), int(select(((_233 & 1) == 0), _239, (1.0f - _239)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215)))) * 5.960465188081798e-08f));
  _269 = mad((_invViewProjRelative[2].w), _261, _90) + (_invViewProjRelative[3].w);
  _270 = (mad((_invViewProjRelative[2].x), _261, _78) + (_invViewProjRelative[3].x)) / _269;
  _271 = (mad((_invViewProjRelative[2].y), _261, _82) + (_invViewProjRelative[3].y)) / _269;
  _272 = (mad((_invViewProjRelative[2].z), _261, _86) + (_invViewProjRelative[3].z)) / _269;
  _276 = _93 - _270;
  _277 = _94 - _271;
  _278 = _95 - _272;
  _284 = sqrt(((_277 * _277) + (_276 * _276)) + (_278 * _278));
  _285 = -0.0f - _226;
  _286 = -0.0f - _227;
  _287 = -0.0f - _228;
  _288 = dot(float3(_285, _286, _287), float3(_187, _188, _189));
  if (_288 < 0.0f) {
    _297 = _187;
    _298 = _188;
    _299 = _189;
    _300 = (-0.0f - _288);
    _301 = 1.0f;
    _302 = 1.3300000429153442f;
  } else {
    _297 = (-0.0f - _187);
    _298 = (-0.0f - _188);
    _299 = (-0.0f - _189);
    _300 = _288;
    _301 = 1.3300000429153442f;
    _302 = 1.0f;
  }
  _303 = _301 / _302;
  _308 = 1.0f - ((_303 * _303) * (1.0f - (_300 * _300)));
  if (!(_308 < 0.0f)) {
    _316 = (_303 * _300) - sqrt(_308);
    _324 = ((_316 * _297) + (_303 * _285));
    _325 = ((_316 * _298) + (_303 * _286));
    _326 = ((_316 * _299) + (_303 * _287));
  } else {
    _324 = 0.0f;
    _325 = 0.0f;
    _326 = 0.0f;
  }
  _333 = max(0.0010000000474974513f, sqrt(((_325 * _325) + (_324 * _324)) + (_326 * _326)));
  if (_207 < 0.5f) {
    _341 = ((_284 - _115) * _207) + _115;
    _345 = ((_324 / _333) * _341) + _93;
    _346 = ((_325 / _333) * _341) + _94;
    _347 = ((_326 / _333) * _341) + _95;
    _375 = mad((_viewProjRelative[2].w), _347, mad((_viewProjRelative[1].w), _346, ((_viewProjRelative[0].w) * _345))) + (_viewProjRelative[3].w);
    _400 = ((((mad((_viewProjRelative[2].x), _347, mad((_viewProjRelative[1].x), _346, ((_viewProjRelative[0].x) * _345))) + (_viewProjRelative[3].x)) / _375) * 0.5f) + 0.5f);
    _401 = (0.5f - (((mad((_viewProjRelative[2].y), _347, mad((_viewProjRelative[1].y), _346, ((_viewProjRelative[0].y) * _345))) + (_viewProjRelative[3].y)) / _375) * 0.5f));
  } else {
    _394 = saturate(_284 * 5.0f) * (0.33000004291534424f / ((_nearFarProj.x / _56) + 1.0f));  // [sem: expr_sat]
    _400 = ((_394 * min(max(dot(float3(_187, _188, _189), float3(_169, _177, (-0.0f - _166))), -0.20000000298023224f), 0.20000000298023224f)) + TEXCOORD.x);
    _401 = ((_394 * min(max(dot(float3(_187, _188, _189), float3(_165, _172, _173)), -0.20000000298023224f), 0.20000000298023224f)) + TEXCOORD.y);
  }
  _406 = abs(_229) + 0.0010000000474974513f;
  _410 = _93 - ((_226 * _115) / _406);
  _411 = _94 - ((_227 * _115) / _406);
  _412 = _95 - ((_228 * _115) / _406);
  _415 = int(floor(_400));
  _416 = int(floor(_401));
  _421 = abs(_400 - float((int)(_415)));
  _422 = abs(_401 - float((int)(_416)));
  _439 = ((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(select(((_415 & 1) == 0), _421, (1.0f - _421)) * _bufferSizeAndInvSize.x), int(select(((_416 & 1) == 0), _422, (1.0f - _422)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215)))) * 5.960465188081798e-08f;
  _441 = (_400 * 2.0f) + -1.0f;
  _443 = 1.0f - (_401 * 2.0f);
  _444 = max(1.0000000116860974e-07f, _439);
  _460 = mad((_invViewProjRelative[2].w), _444, mad((_invViewProjRelative[1].w), _443, (_441 * (_invViewProjRelative[0].w)))) + (_invViewProjRelative[3].w);
  if (!(!(_439 >= _50.x))) {
    _467 = TEXCOORD.x;
    _468 = TEXCOORD.y;
    _469 = _270;
    _470 = _271;
    _471 = _272;
  } else {
    _467 = _400;
    _468 = _401;
    _469 = ((mad((_invViewProjRelative[2].x), _444, mad((_invViewProjRelative[1].x), _443, (_441 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[3].x)) / _460);
    _470 = ((mad((_invViewProjRelative[2].y), _444, mad((_invViewProjRelative[1].y), _443, (_441 * (_invViewProjRelative[0].y)))) + (_invViewProjRelative[3].y)) / _460);
    _471 = ((mad((_invViewProjRelative[2].z), _444, mad((_invViewProjRelative[1].z), _443, (_441 * (_invViewProjRelative[0].z)))) + (_invViewProjRelative[3].z)) / _460);
  }
  _478 = _412 + (_207 * (_471 - _412));
  _479 = _411 + (_207 * (_470 - _411));
  _480 = _410 + (_207 * (_469 - _410));
  _482 = __3__36__0__0__g_extinction.Load(int3(_47, _48, 0));  // [sem: _3__36__0__0__g_extinction_load]
  _487 = _482.w * 10.0f;  // [sem: _3__36__0__0__g_extinction_load_derived]
  _500 = _487 / (((max(0.0010000000474974513f, _482.x) + -1.0f) * _203) + 1.0f);
  _501 = _487 / (((max(0.0010000000474974513f, _482.y) + -1.0f) * _203) + 1.0f);
  _502 = _487 / (((max(0.0010000000474974513f, _482.z) + -1.0f) * _203) + 1.0f);
  _503 = _500 * _482.x;
  _504 = _501 * _482.y;
  _505 = _502 * _482.z;
  _518 = ((_501 * 0.3395099937915802f) + (_500 * 0.6131200194358826f)) + (_502 * 0.047370001673698425f);
  _519 = ((_501 * 0.9163600206375122f) + (_500 * 0.07020000368356705f)) + (_502 * 0.013450000435113907f);
  _520 = ((_501 * 0.10958000272512436f) + (_500 * 0.02061999961733818f)) + (_502 * 0.8697999715805054f);
  _567 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _95, mad((_dynamicShadowProjRelativeTexScale[1][1].z), _94, ((_dynamicShadowProjRelativeTexScale[1][0].z) * _93))) + (_dynamicShadowProjRelativeTexScale[1][3].z);
  _582 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * ((float)((uint)_48))) + ((float)((uint)_47)));
  _590 = ((uint)((((int)((_582 << 4) + (uint)(-1383041155))) ^ ((int)(_582 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_582) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
  _598 = ((uint)((((int)((_590 << 4) + (uint)(-1556008596))) ^ ((int)(_590 + 1013904242u))) ^ (((uint)(_590) >> 5) + -939442524))) + _582;
  _606 = ((uint)((((int)((_598 << 4) + (uint)(-1383041155))) ^ ((int)(_598 + 1013904242u))) ^ ((int)(((uint)((uint)(_598) >> 5)) + 2123724318u)))) + _590;
  _614 = ((uint)((((int)((_606 << 4) + (uint)(-1556008596))) ^ ((int)(_606 + (uint)(-626627285)))) ^ (((uint)(_606) >> 5) + -939442524))) + _598;
  _622 = ((uint)((((int)((_614 << 4) + (uint)(-1383041155))) ^ ((int)(_614 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_614) >> 5)) + 2123724318u)))) + _606;
  _630 = ((uint)((((int)((_622 << 4) + (uint)(-1556008596))) ^ ((int)(_622 + 2027808484u))) ^ (((uint)(_622) >> 5) + -939442524))) + _614;
  _638 = ((uint)((((int)((_630 << 4) + (uint)(-1383041155))) ^ ((int)(_630 + 2027808484u))) ^ ((int)(((uint)((uint)(_630) >> 5)) + 2123724318u)))) + _622;
  _646 = ((uint)((((int)((_638 << 4) + (uint)(-1556008596))) ^ ((int)(_638 + 387276957u))) ^ (((uint)(_638) >> 5) + -939442524))) + _630;
  _654 = ((uint)((((int)((_646 << 4) + (uint)(-1383041155))) ^ ((int)(_646 + 387276957u))) ^ ((int)(((uint)((uint)(_646) >> 5)) + 2123724318u)))) + _638;
  _662 = ((uint)((((int)((_654 << 4) + (uint)(-1556008596))) ^ ((int)(_654 + (uint)(-1253254570)))) ^ (((uint)(_654) >> 5) + -939442524))) + _646;
  _670 = ((uint)((((int)((_662 << 4) + (uint)(-1383041155))) ^ ((int)(_662 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_662) >> 5)) + 2123724318u)))) + _654;
  _678 = ((uint)((((int)((_670 << 4) + (uint)(-1556008596))) ^ ((int)(_670 + 1401181199u))) ^ (((uint)(_670) >> 5) + -939442524))) + _662;
  _686 = ((uint)((((int)((_678 << 4) + (uint)(-1383041155))) ^ ((int)(_678 + 1401181199u))) ^ ((int)(((uint)((uint)(_678) >> 5)) + 2123724318u)))) + _670;
  _694 = ((uint)((((int)((_686 << 4) + (uint)(-1556008596))) ^ ((int)(_686 + (uint)(-239350328)))) ^ (((uint)(_686) >> 5) + -939442524))) + _678;
  _702 = ((uint)((((int)((_694 << 4) + (uint)(-1383041155))) ^ ((int)(_694 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_694) >> 5)) + 2123724318u)))) + _686;
  _704 = ((_694 & 16777215) == 0);
  if (_704) {
    _715 = ((int)(((uint)((((int)((_702 << 4) + (uint)(-1556008596))) ^ ((int)(_702 + (uint)(-1879881855)))) ^ (((uint)(_702) >> 5) + -939442524))) + _694));
  } else {
    _715 = _694;
  }
  _730 = (mad((_dynamicShadowProjRelativeTexScale[1][2].x), _95, mad((_dynamicShadowProjRelativeTexScale[1][1].x), _94, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _93))) + (_dynamicShadowProjRelativeTexScale[1][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 9.834766956373642e-08f) * ((float)((uint)((uint)(((int)(_715 * 48271)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.z * 0.8250000476837158f));
  _731 = (mad((_dynamicShadowProjRelativeTexScale[1][2].y), _95, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _94, ((_dynamicShadowProjRelativeTexScale[1][0].y) * _93))) + (_dynamicShadowProjRelativeTexScale[1][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 9.834766956373642e-08f) * ((float)((uint)((uint)(((int)(_715 * -1964877855)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.w * 0.8250000476837158f));
  _732 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
  _733 = 1.0f - _732;
  if (!(((!(_730 >= _732)) || (!(_730 <= _733))) || (!(_731 <= _733)))) {
    _744 = (_567 >= -1.0f) && ((_567 <= 1.0f) && (_731 >= _732));
    _751 = select(_744, _730, 0.0f);
    _752 = select(_744, _731, 0.0f);
    _753 = select(_744, _567, 0.0f);
    _754 = select(_744, 1.9999999494757503e-05f, 0.0f);
    _755 = ((int)(uint)(_744));
  } else {
    _751 = 0.0f;
    _752 = 0.0f;
    _753 = 0.0f;
    _754 = 0.0f;
    _755 = 0;
  }
  _783 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _95, mad((_dynamicShadowProjRelativeTexScale[0][1].z), _94, ((_dynamicShadowProjRelativeTexScale[0][0].z) * _93))) + (_dynamicShadowProjRelativeTexScale[0][3].z);
  if (_704) {
    _794 = ((int)(((uint)((((int)((_702 << 4) + (uint)(-1556008596))) ^ ((int)(_702 + (uint)(-1879881855)))) ^ (((uint)(_702) >> 5) + -939442524))) + _694));
  } else {
    _794 = _694;
  }
  _809 = (mad((_dynamicShadowProjRelativeTexScale[0][2].x), _95, mad((_dynamicShadowProjRelativeTexScale[0][1].x), _94, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _93))) + (_dynamicShadowProjRelativeTexScale[0][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 1.9669533912747283e-07f) * ((float)((uint)((uint)(((int)(_794 * 48271)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.z * 1.6500000953674316f));
  _810 = (mad((_dynamicShadowProjRelativeTexScale[0][2].y), _95, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _94, ((_dynamicShadowProjRelativeTexScale[0][0].y) * _93))) + (_dynamicShadowProjRelativeTexScale[0][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 1.9669533912747283e-07f) * ((float)((uint)((uint)(((int)(_794 * -1964877855)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.w * 1.6500000953674316f));
  if (!(((!(_809 >= _732)) || (!(_809 <= _733))) || (!(_810 <= _733)))) {
    _821 = (_783 >= -1.0f) && ((_783 <= 1.0f) && (_810 >= _732));
    _830 = select(_821, _809, _751);
    _831 = select(_821, _810, _752);
    _832 = select(_821, _783, _753);
    _833 = select(_821, 4.999999873689376e-06f, _754);
    _834 = select(_821, 1, _755);
    _835 = select(_821, 1, _755);
    _836 = select(_821, 0, _755);
  } else {
    _830 = _751;
    _831 = _752;
    _832 = _753;
    _833 = _754;
    _834 = _755;
    _835 = _755;
    _836 = _755;
  }
  _837 = (_835 == 0);
  [branch]
  if (_837) {
    _843 = _93 + _viewPos.x;
    _844 = _94 + _viewPos.y;
    _845 = _95 + _viewPos.z;
    _850 = _843 - (_staticShadowPosition[1].x);
    _851 = _844 - (_staticShadowPosition[1].y);
    _852 = _845 - (_staticShadowPosition[1].z);
    _880 = mad((_shadowProjRelativeTexScale[1][2].z), _852, mad((_shadowProjRelativeTexScale[1][1].z), _851, ((_shadowProjRelativeTexScale[1][0].z) * _850))) + (_shadowProjRelativeTexScale[1][3].z);
    if (_704) {
      _891 = ((int)(((uint)((((int)((_702 << 4) + (uint)(-1556008596))) ^ ((int)(_702 + (uint)(-1879881855)))) ^ (((uint)(_702) >> 5) + -939442524))) + _694));
    } else {
      _891 = _694;
    }
    _892 = _shadowSizeAndInvSize.z * 2.0f;
    _893 = _shadowSizeAndInvSize.w * 2.0f;
    _900 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
    _902 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
    _906 = (mad((_shadowProjRelativeTexScale[1][2].x), _852, mad((_shadowProjRelativeTexScale[1][1].x), _851, ((_shadowProjRelativeTexScale[1][0].x) * _850))) + (_shadowProjRelativeTexScale[1][3].x)) + ((((float)((uint)((uint)(((int)(_891 * 48271)) & 16777215)))) * _900) - _892);
    _907 = (mad((_shadowProjRelativeTexScale[1][2].y), _852, mad((_shadowProjRelativeTexScale[1][1].y), _851, ((_shadowProjRelativeTexScale[1][0].y) * _850))) + (_shadowProjRelativeTexScale[1][3].y)) + ((((float)((uint)((uint)(((int)(_891 * -1964877855)) & 16777215)))) * _902) - _893);
    _908 = 2.0f / _shadowSizeAndInvSize.y;
    _909 = 1.0f - _908;
    if (!(((!(_906 >= _908)) || (!(_906 <= _909))) || (!(_907 <= _909)))) {
      _920 = (_880 >= 9.999999747378752e-05f) && ((_880 <= 1.0f) && (_907 >= _908));
      _928 = select(_920, _906, _830);
      _929 = select(_920, _907, _831);
      _930 = select(_920, _880, _832);
      _931 = select(_920, 0.00019999999494757503f, _833);
      _932 = select(_920, 1, _834);
      _933 = select(_920, 1, _836);
    } else {
      _928 = _830;
      _929 = _831;
      _930 = _832;
      _931 = _833;
      _932 = _834;
      _933 = _836;
    }
    _938 = _843 - (_staticShadowPosition[0].x);
    _939 = _844 - (_staticShadowPosition[0].y);
    _940 = _845 - (_staticShadowPosition[0].z);
    _968 = mad((_shadowProjRelativeTexScale[0][2].z), _940, mad((_shadowProjRelativeTexScale[0][1].z), _939, ((_shadowProjRelativeTexScale[0][0].z) * _938))) + (_shadowProjRelativeTexScale[0][3].z);
    if (_704) {
      _979 = ((int)(((uint)((((int)((_702 << 4) + (uint)(-1556008596))) ^ ((int)(_702 + (uint)(-1879881855)))) ^ (((uint)(_702) >> 5) + -939442524))) + _694));
    } else {
      _979 = _694;
    }
    _990 = (mad((_shadowProjRelativeTexScale[0][2].x), _940, mad((_shadowProjRelativeTexScale[0][1].x), _939, ((_shadowProjRelativeTexScale[0][0].x) * _938))) + (_shadowProjRelativeTexScale[0][3].x)) + ((((float)((uint)((uint)(((int)(_979 * 48271)) & 16777215)))) * _900) - _892);
    _991 = (mad((_shadowProjRelativeTexScale[0][2].y), _940, mad((_shadowProjRelativeTexScale[0][1].y), _939, ((_shadowProjRelativeTexScale[0][0].y) * _938))) + (_shadowProjRelativeTexScale[0][3].y)) + ((((float)((uint)((uint)(((int)(_979 * -1964877855)) & 16777215)))) * _902) - _893);
    if (!(((!(_990 >= _908)) || (!(_990 <= _909))) || (!(_991 <= _909)))) {
      _1002 = (_968 >= 9.999999747378752e-05f) && ((_968 <= 1.0f) && (_991 >= _908));
      _1010 = select(_1002, _990, _928);
      _1011 = select(_1002, _991, _929);
      _1012 = select(_1002, _968, _930);
      _1013 = select(_1002, 0.00019999999494757503f, _931);
      _1014 = select(_1002, 1, _932);
      _1015 = select(_1002, 0, _933);
    } else {
      _1010 = _928;
      _1011 = _929;
      _1012 = _930;
      _1013 = _931;
      _1014 = _932;
      _1015 = _933;
    }
  } else {
    _1010 = _830;
    _1011 = _831;
    _1012 = _832;
    _1013 = _833;
    _1014 = _834;
    _1015 = _836;
  }
  [branch]
  if (!(_1014 == 0)) {
    _1018 = _1012 - _1013;
    _1019 = (float)((uint)_1015);
    if (_837) {
  // [sem: expr_sat]
      _1034 = saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1010, _1011, _1019), _1018))).x));
    } else {
  // [sem: expr_sat]
      _1034 = saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1010, _1011, _1019), _1018))).x));
    }
  } else {
    _1034 = 1.0f;  // [sem: expr_sat]
  }
  _1054 = mad((_terrainShadowProjRelativeTexScale[2].x), _95, mad((_terrainShadowProjRelativeTexScale[1].x), _94, ((_terrainShadowProjRelativeTexScale[0].x) * _93))) + (_terrainShadowProjRelativeTexScale[3].x);
  _1058 = mad((_terrainShadowProjRelativeTexScale[2].y), _95, mad((_terrainShadowProjRelativeTexScale[1].y), _94, ((_terrainShadowProjRelativeTexScale[0].y) * _93))) + (_terrainShadowProjRelativeTexScale[3].y);
  _1062 = mad((_terrainShadowProjRelativeTexScale[2].z), _95, mad((_terrainShadowProjRelativeTexScale[1].z), _94, ((_terrainShadowProjRelativeTexScale[0].z) * _93))) + (_terrainShadowProjRelativeTexScale[3].z);
  if (saturate(_1054) == _1054) {
    if ((_1062 >= 9.999999747378752e-05f) && ((_1062 <= 1.0f) && (saturate(_1058) == _1058))) {
      _1077 = frac((_1054 * 1024.0f) + -0.5f);
      _1081 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_1054, _1058));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
      _1086 = _1062 + -0.004999999888241291f;
      _1091 = select((_1081.w > _1086), 1.0f, 0.0f);
      _1093 = select((_1081.x > _1086), 1.0f, 0.0f);
      _1100 = ((select((_1081.z > _1086), 1.0f, 0.0f) - _1091) * _1077) + _1091;
  // [sem: expr_sat]
      _1106 = saturate((((((select((_1081.y > _1086), 1.0f, 0.0f) - _1093) * _1077) + _1093) - _1100) * frac((_1058 * 1024.0f) + -0.5f)) + _1100);
    } else {
      _1106 = 1.0f;  // [sem: expr_sat]
    }
  } else {
    _1106 = 1.0f;  // [sem: expr_sat]
  }
  _1110 = (_sunDirection.y > 0.0f);
  if ((_1110) || ((!(_1110)) && (_sunDirection.y > _moonDirection.y))) {
    _1122 = _sunDirection.x;
    _1123 = _sunDirection.y;
    _1124 = _sunDirection.z;
  } else {
    _1122 = _moonDirection.x;
    _1123 = _moonDirection.y;
    _1124 = _moonDirection.z;
  }
  if ((_1110) || ((!(_1110)) && (_sunDirection.y > _moonDirection.y))) {
    _1144 = _precomputedAmbient7.y;
  } else {
    _1144 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
  }
  _1147 = _earthRadius + _101;
  _1153 = sqrt(((_102 * _102) + (_100 * _100)) + (_1147 * _1147));
  _1158 = dot(float3((_100 / _1153), (_1147 / _1153), (_102 / _1153)), float3(_1122, _1123, _1124));
  _1163 = min(max(((_1153 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
  _1171 = max(_1163, 0.0f);
  _1178 = (-0.0f - sqrt((_1171 + (_earthRadius * 2.0f)) * _1171)) / (_1171 + _earthRadius);
  if (_1158 > _1178) {
    _1201 = ((exp2(log2(saturate((_1158 - _1178) / (1.0f - _1178))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
  } else {
    _1201 = ((exp2(log2(saturate((_1178 - _1158) / (_1178 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
  }
  // [sem: _3__36__0__0__g_texNetDensity_sampleLod]
  _1206 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_1163 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _1201), 0.0f);
  _1228 = ((_1206.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);  // [sem: _3__36__0__0__g_texNetDensity_sampleLod_derived]
  _1246 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _1206.x) + _1228) * -1.4426950216293335f);
  _1247 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _1206.x) + _1228) * -1.4426950216293335f);
  _1248 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (((float)((uint)((uint)(_rayleighScatteringColor & 255)))) * 1.960784317134312e-07f)) * _1206.x) + _1228) * -1.4426950216293335f);
  _1267 = sqrt((_93 * _93) + (_95 * _95));
  _1274 = _cloudAltitude - (max(((_1267 * _1267) + -4e+05f), 0.0f) * 9.999999974752427e-07f);
  _1286 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_1123 > 0.0f))) - ((int)(uint)((int)(_1123 < 0.0f))))) * 0.5f))) + _1274;
  if (_101 < _1274) {
    _1289 = dot(float3(0.0f, 1.0f, 0.0f), float3(_1122, _1123, _1124));
    _1295 = select((abs(_1289) < 9.99999993922529e-09f), 1e+08f, ((_1286 - dot(float3(0.0f, 1.0f, 0.0f), float3(_100, _101, _102))) / _1289));
    _1301 = ((_1295 * _1122) + _100);
    _1302 = _1286;
    _1303 = ((_1295 * _1124) + _102);
  } else {
    _1301 = _100;
    _1302 = _101;
    _1303 = _102;
  }
  _1325 = saturate(abs(_1123) * 4.0f);  // [sem: expr_sat]
  _1327 = (_1325 * _1325) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3((((_1301 - _viewPos.x) * 4.999999873689376e-05f) + 0.5f), ((_1302 - _cloudAltitude) / _cloudThickness), (((_1303 - _viewPos.z) * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
  _1334 = ((1.0f - _1327) * saturate(((_101 - _cloudAltitude) - _cloudThickness) * 0.10000000149011612f)) + _1327;
  _1338 = _cubemapViewPosRelative.w * (_1144 * min(_1034, _1106));
  _1340 = (_1338 * (((_1247 * 0.3395099937915802f) + (_1246 * 0.6131200194358826f)) + (_1248 * 0.047370001673698425f))) * _1334;
  _1342 = (_1338 * (((_1247 * 0.9163600206375122f) + (_1246 * 0.07020000368356705f)) + (_1248 * 0.013450000435113907f))) * _1334;
  _1344 = (_1338 * (((_1247 * 0.10958000272512436f) + (_1246 * 0.02061999961733818f)) + (_1248 * 0.8697999715805054f))) * _1334;
  _1382 = _188 * -1.0233277082443237f;
  _1383 = _189 * 1.0233277082443237f;
  _1384 = _187 * -1.0233277082443237f;
  _1386 = (_187 * 0.8580852150917053f) * _188;
  _1387 = _189 * -0.8580852150917053f;
  _1388 = _1387 * _188;
  _1391 = ((_189 * _189) * 0.7431248426437378f) + -0.2477082908153534f;
  _1392 = _1387 * _187;
  _1393 = ((_187 * _187) - (_188 * _188)) * 0.42904260754585266f;
  _1412 = _93 - _480;
  _1413 = _94 - _479;
  _1414 = _95 - _478;
  _1420 = sqrt(((_1413 * _1413) + (_1412 * _1412)) + (_1414 * _1414));
  if (_224 > 5000.0f) {
    _1438 = (((saturate(max((_224 + -5000.0f), 0.0f) * 0.0010000000474974513f) * 10.0f) * exp2(log2(frac(sin(dot(float2(_53, _55), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f)) * 0.45454543828964233f)) + _1420);
  } else {
    _1438 = _1420;
  }
  if (_206) {
    _1449 = ((saturate(_1438 * 10.0f) * ((_115 - _1438) + ((_1438 - _115) * ((float)((bool)_124))))) + _1438);
  } else {
    _1449 = _1438;
  }
  _1450 = _1449 * 2.0f;
  _1460 = -0.0f - max(9.999999747378752e-06f, ((_1450 * _518) / _1449));
  _1461 = -0.0f - max(9.999999747378752e-06f, ((_1450 * _519) / _1449));
  _1462 = -0.0f - max(9.999999747378752e-06f, ((_1450 * _520) / _1449));
  _1463 = _1449 * 1.4426950216293335f;
  _1477 = max(9.999999747378752e-06f, _1449) * -1.4426950216293335f;
  _1490 = _1122 + _226;
  _1491 = _1123 + _227;
  _1492 = _1124 + _228;
  _1494 = rsqrt(dot(float3(_1490, _1491, _1492), float3(_1490, _1491, _1492)));  // [sem: invLength]
  _1495 = _1494 * _1490;
  _1496 = _1494 * _1491;
  _1497 = _1494 * _1492;
  _1498 = dot(float3(_187, _188, _189), float3(_1122, _1123, _1124));
  _1499 = dot(float3(_187, _188, _189), float3(_1495, _1496, _1497));
  _1501 = dot(float3(_285, _286, _287), float3(_1122, _1123, _1124));
  _1503 = (_1501 * _1501) + 1.0f;
  _1504 = _1501 * 0.5f;
  _1517 = max(((_1503 / exp2(log2(1.0625f - _1504) * 1.5f)) * 0.05425736680626869f), ((_1503 / exp2(log2(_1504 + 1.0625f) * 1.5f)) * 0.05425736680626869f));
  _1520 = saturate(1.0f - saturate(dot(float3(_226, _227, _228), float3(_1495, _1496, _1497))));  // [sem: expr_sat]
  _1521 = _1520 * _1520;
  _1523 = (_1521 * _1521) * _1520;
  _1531 = (((dot(float3(_226, _227, _228), float3(_1122, _1123, _1124)) * 0.5f) + 0.5f) * _1449) + _1449;
  _1541 = -0.0f - max(9.999999747378752e-06f, ((_1531 * _518) / _1449));
  _1542 = -0.0f - max(9.999999747378752e-06f, ((_1531 * _519) / _1449));
  _1543 = -0.0f - max(9.999999747378752e-06f, ((_1531 * _520) / _1449));
  _1563 = (((_1517 * _1340) * ((exp2(_1463 * _1541) + -1.0f) / _1541)) + ((max(0.0f, ((dot(float4(_1386, _1388, _1391, _1392), float4(_precomputedAmbient1.x, _precomputedAmbient1.y, _precomputedAmbient1.z, _precomputedAmbient1.w)) + dot(float4(0.886227548122406f, _1382, _1383, _1384), float4(_precomputedAmbient0.x, _precomputedAmbient0.y, _precomputedAmbient0.z, _precomputedAmbient0.w))) + (_precomputedAmbient6.x * _1393))) * 0.2572200894355774f) * ((exp2(_1463 * _1460) + -1.0f) / _1460))) * (((_504 * 0.3395099937915802f) + (_503 * 0.6131200194358826f)) + (_505 * 0.047370001673698425f));
  _1565 = (((_1517 * _1342) * ((exp2(_1463 * _1542) + -1.0f) / _1542)) + ((max(0.0f, ((dot(float4(0.886227548122406f, _1382, _1383, _1384), float4(_precomputedAmbient2.x, _precomputedAmbient2.y, _precomputedAmbient2.z, _precomputedAmbient2.w)) + (_precomputedAmbient6.y * _1393)) + dot(float4(_1386, _1388, _1391, _1392), float4(_precomputedAmbient3.x, _precomputedAmbient3.y, _precomputedAmbient3.z, _precomputedAmbient3.w)))) * 0.2572200894355774f) * ((exp2(_1463 * _1461) + -1.0f) / _1461))) * (((_504 * 0.9163600206375122f) + (_503 * 0.07020000368356705f)) + (_505 * 0.013450000435113907f));
  _1567 = (((_1517 * _1344) * ((exp2(_1463 * _1543) + -1.0f) / _1543)) + ((max(0.0f, ((dot(float4(0.886227548122406f, _1382, _1383, _1384), float4(_precomputedAmbient4.x, _precomputedAmbient4.y, _precomputedAmbient4.z, _precomputedAmbient4.w)) + (_precomputedAmbient6.z * _1393)) + dot(float4(_1386, _1388, _1391, _1392), float4(_precomputedAmbient5.x, _precomputedAmbient5.y, _precomputedAmbient5.z, _precomputedAmbient5.w)))) * 0.2572200894355774f) * ((exp2(_1463 * _1462) + -1.0f) / _1462))) * (((_504 * 0.10958000272512436f) + (_503 * 0.02061999961733818f)) + (_505 * 0.8697999715805054f));
  _1569 = (_229 * 0.9995999932289124f) + 0.00039999998989515007f;
  _1578 = 1.0f - ((_1499 * _1499) * 0.9999998211860657f);
  // [sem: expr_sat]
  _1585 = saturate(_1498) * max((((0.5f / ((((_1498 * 0.9995999932289124f) + 0.00039999998989515007f) * _229) + (_1498 * _1569))) * (lerp(_1523, 1.0f, 0.03999999910593033f))) * (5.092957522379038e-08f / (_1578 * _1578))), 0.0f);
  _1586 = _1585 * _1340;
  _1587 = _1585 * _1342;
  _1588 = _1585 * _1344;
  if (_205) {
    _1599 = asint(__3__37__0__0__g_structureCounterBuffer.Load(4));
    _1608 = (int)(uint(_tiledRadianceCacheParams.x)) & 31;
  // [sem: _3__36__0__0__g_manyLightsHitData_load]
    _1612 = __3__36__0__0__g_manyLightsHitData.Load(int3(((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)) >> _1608), ((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)) >> _1608), 0));
    _1619 = select(((_1612.x | _1612.y) != 0), (((uint)((uint)(_1612.x)) >> 16) & 32767), 32767);
    if ((_1619 != 32767) && ((uint)_1619 < (uint)_1599)) {
      _1629 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._position.x;
      _1630 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._position.y;
      _1631 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._position.z;
      _1633 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._color.x;
      _1634 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._color.y;
      _1635 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._color.z;
      _1636 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._color.w;
      _1638 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._up.x;
      _1639 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._up.y;
      _1641 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._look.x;
      _1642 = __3__37__0__0__g_manyLightsDataBuffer[_1619]._look.y;
      _1643 = _1629 - _93;
      _1644 = _1630 - _94;
      _1645 = _1631 - _95;
      _1651 = sqrt(((_1643 * _1643) + (_1644 * _1644)) + (_1645 * _1645));
      _1652 = 1.0f / _1651;
      _1653 = _1652 * _1643;
      _1654 = _1652 * _1644;
      _1655 = _1652 * _1645;
      _1656 = (_1636 > 99999.0f);
      if (!_1656) {
        _1675 = min(min(512.0f, ((_cavityParams.w * 192.0f) + 128.0f)), ((((min(0.6000000238418579f, ((_cavityParams.w * 0.20000000298023224f) + 0.20000000298023224f)) * 0.25f) / max(9.999999974752427e-07f, (_exposure2.x * 8.0f))) * dot(float3(_1633, _1634, _1635), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f))) + 8.0f));
      } else {
        _1675 = _1636;
      }
      _1676 = abs(_1636);
      _1677 = _1651 * _1651;
      _1682 = select((_1676 > 99999.0f), 1.0f, (1.0f / max((_1676 * _1676), _1677)));
      _1686 = _1653 - _226;
      _1687 = _1654 - _227;
      _1688 = _1655 - _228;
      _1690 = rsqrt(dot(float3(_1686, _1687, _1688), float3(_1686, _1687, _1688)));  // [sem: invLength]
      _1691 = _1690 * _1686;
      _1692 = _1690 * _1687;
      _1693 = _1690 * _1688;
      _1694 = dot(float3(_139, _140, _141), float3(_1653, _1654, _1655));
      _1696 = saturate(dot(float3(_139, _140, _141), float3(_285, _286, _287)));  // [sem: expr_sat]
      _1698 = saturate(dot(float3(_139, _140, _141), float3(_1691, _1692, _1693)));  // [sem: expr_sat]
      if (!(_1694 <= 0.0f)) {
        _1703 = saturate(1.0f - dot(float3(_285, _286, _287), float3(_1691, _1692, _1693)));  // [sem: expr_sat]
        _1704 = _1703 * _1703;
        _1706 = (_1704 * _1704) * _1703;
        _1721 = 1.0f - ((_1698 * _1698) * 0.9900000095367432f);
        _1729 = (max((((0.0031830989755690098f / (_1721 * _1721)) * (0.5f / ((((_1696 * 0.9900000095367432f) + 0.010000000707805157f) * _1694) + (_1696 * ((_1694 * 0.9900000095367432f) + 0.010000000707805157f))))) * (lerp(_1706, 1.0f, 0.03999999910593033f))), 0.0f) * saturate(_1694));
      } else {
        _1729 = 0.0f;
      }
      if ((_1656) | ((_1651 < _1675) && (dot(float3(((_1682 * _1633) * _1729), ((_1682 * _1634) * _1729), ((_1682 * _1635) * _1729)), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) > (_exposure2.x * ((saturate(dot(float3(_viewPos.x, _viewPos.y, _viewPos.z), float3(_93, _94, _95)) * 0.015625f) * 0.09000000357627869f) + 0.009999999776482582f))))) {
        _1747 = select(_1656, 1.0f, saturate(select(_1656, 1.0f, (1.0f / max((_1636 * _1636), _1677))))) * ((float)((bool)(uint)((((float)((uint)((uint)(_1612.x & 65535)))) * 0.015609979629516602f) >= 1000.0f)));
        _1748 = _1747 * _1633;
        _1749 = _1747 * _1634;
        _1750 = _1747 * _1635;
        _1755 = f16tof32(((uint)(_1638 & 65535)));
        _1756 = f16tof32(((uint)((uint)(_1638) >> 16)));
        _1757 = f16tof32(((uint)(_1639 & 65535)));
        _1758 = f16tof32(((uint)((uint)(_1639) >> 16)));
        _1760 = rsqrt(dot(float3(_1755, _1756, _1757), float3(_1755, _1756, _1757)));  // [sem: invLength]
        _1764 = f16tof32(((uint)(_1641 & 65535)));
        _1765 = f16tof32(((uint)((uint)(_1641) >> 16)));
        _1766 = f16tof32(((uint)(_1642 & 65535)));
        _1768 = rsqrt(dot(float3(_1764, _1765, _1766), float3(_1764, _1765, _1766)));  // [sem: invLength]
        _1769 = _1768 * _1764;
        _1770 = _1768 * _1765;
        _1771 = _1768 * _1766;
        if (!(!(_1758 >= 0.0f))) {
          _1781 = mad(_1655, (_1760 * _1757), mad(_1654, (_1760 * _1756), ((_1755 * _1653) * _1760)));
          _1784 = mad(_1655, _1771, mad(_1654, _1770, (_1769 * _1653)));
          _1792 = atan((-0.0f - _1784) / (-0.0f - _1781));
          _1795 = (_1781 > -0.0f);
          _1796 = (_1781 == -0.0f);
          _1797 = (_1784 <= -0.0f);
          _1798 = (_1784 > -0.0f);
  // [sem: _3__36__0__0__g_lightProfile_sampleLod]
          _1813 = __3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_1653, _1654, _1655), float3(_1769, _1770, _1771))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select((_1796 && _1797), 0.5f, select((_1796 && _1798), -0.5f, (select((_1795 && _1798), (_1792 + -3.1415927410125732f), select((_1795 && _1797), (_1792 + 3.1415927410125732f), _1792)) * 0.31830987334251404f))))) * f16tof32(((uint)((uint)(_1642) >> 16)))) + _1758)), 0.0f);
          _1819 = (_1813.x * _1748);
          _1820 = (_1813.x * _1749);
          _1821 = (_1813.x * _1750);
        } else {
          _1819 = _1748;
          _1820 = _1749;
          _1821 = _1750;
        }
        _1822 = _1653 + _226;
        _1823 = _1654 + _227;
        _1824 = _1655 + _228;
        _1826 = rsqrt(dot(float3(_1822, _1823, _1824), float3(_1822, _1823, _1824)));  // [sem: invLength]
        _1827 = _1826 * _1822;
        _1828 = _1826 * _1823;
        _1829 = _1826 * _1824;
        _1830 = dot(float3(_187, _188, _189), float3(_1653, _1654, _1655));
        _1831 = dot(float3(_187, _188, _189), float3(_1827, _1828, _1829));
        _1835 = saturate(1.0f - saturate(dot(float3(_226, _227, _228), float3(_1827, _1828, _1829))));  // [sem: expr_sat]
        _1836 = _1835 * _1835;
        _1838 = (_1836 * _1836) * _1835;
        _1850 = 1.0f - ((_1831 * _1831) * 0.9999998211860657f);
  // [sem: expr_sat]
        _1857 = saturate(_1830) * max((((5.092957522379038e-08f / (_1850 * _1850)) * (0.5f / ((((_1830 * 0.9995999932289124f) + 0.00039999998989515007f) * _229) + (_1830 * _1569)))) * (lerp(_1838, 1.0f, 0.03999999910593033f))), 0.0f);
        _1865 = ((_1857 * _1819) + _1586);
        _1866 = ((_1857 * _1820) + _1587);
        _1867 = ((_1857 * _1821) + _1588);
      } else {
        _1865 = _1586;
        _1866 = _1587;
        _1867 = _1588;
      }
    } else {
      _1865 = _1586;
      _1866 = _1587;
      _1867 = _1588;
    }
  } else {
    _1865 = _1586;
    _1866 = _1587;
    _1867 = _1588;
  }
  _1873 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearMirror, float2(_467, _468), 0.0f);  // [sem: _3__36__0__0__g_sceneColor_sampleLod]
  _1898 = max(0.0f, (log2((max(0.0f, _224) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z;
  _1915 = min((1.0f - ((((float)((bool)(uint)((_bufferSizeAndInvSize.x - (_volumeSize.x * 4.0f)) > 0.0f))) + 0.5f) / _volumeSize.x)), _467);
  _1916 = min((1.0f - ((((float)((bool)(uint)((_bufferSizeAndInvSize.y - (_volumeSize.y * 4.0f)) > 0.0f))) + 0.5f) / _volumeSize.y)), _468);
  // [sem: _3__36__0__0__g_texFroxel_sampleLod]
  _1918 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1915, _1916, (max(0.0f, (log2((max(0.0f, sqrt(((_479 * _479) + (_480 * _480)) + (_478 * _478))) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z)), 0.0f);
  // [sem: _3__36__0__0__g_texFroxel_sampleLod]
  _1923 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1915, _1916, _1898), 0.0f);
  _1933 = max(0.0f, (_1918.x - _1923.x));
  _1934 = max(0.0f, (_1918.y - _1923.y));
  _1935 = max(0.0f, (_1918.z - _1923.z));
  _1936 = (1.0f / max(0.009999999776482582f, _1923.w)) * _1918.w;
  if (_124) {
    _1940 = saturate((_1898 + -0.75f) * 4.0f);  // [sem: expr_sat]
    _1951 = ((_1940 * (_1563 - _1933)) + _1933);
    _1952 = ((_1940 * (_1565 - _1934)) + _1934);
    _1953 = ((_1940 * (_1567 - _1935)) + _1935);
  } else {
    _1951 = _1563;
    _1952 = _1565;
    _1953 = _1567;
  }

  // RenoDX: >>> [Patch: RefractionNightInscatterAttenuation] [Version: 1.12.0]
  // Description: When RenoDX night sky attenuation is enabled, the visible sky is darkened separately from this refraction pass, so vanilla underwater/special-refraction in-scattering can remain too bright. This fades the computed refraction lighting terms by sun elevation before they are composed into the final color.
  if (NIGHT_SKY_ATTENUATION == 1.f) {
    float _nightFactor = saturate(-_sunDirection.y * 4.0f);
    float _nightAtten = lerp(1.0f, 0.15f, _nightFactor);
    _1951 *= _nightAtten;
    _1952 *= _nightAtten;
    _1953 *= _nightAtten;
  }
  // RenoDX: <<< [Patch: RefractionNightInscatterAttenuation]

  // RenoDX: >>> [Patch: ThinGlassFroxelInscatterRepair] [Version: 1.12.0]
  // Description: When the user enables Material Improvements, Crimson Desert 1.12 can apply the full analytic daylight atmosphere in-scattering term to thin, non-special stencil-24/25 refraction pixels, making indoor glass bottles and similar thin glass glow with an opaque sky-blue fill or edge halo. For those thin-glass pixels, replace the analytic in-scattering RGB with the local froxel delta already computed from the refraction pass, preserving scene-local volumetric contribution while removing the daylight bottle-glow artifact. This targeted refraction repair does not require RR/Ray Regeneration so the vanilla glass fix can apply in all renderer modes; with the toggle off, this block preserves the native 1.12 refraction output exactly. Special refraction paths such as water/ice/volumetric-style pixels continue using the vanilla blend.
  if (REFRACTION_FIXES == 1.f && _203 > 0.0f && !((bool)_206)) {
    _1951 = _1933;
    _1952 = _1934;
    _1953 = _1935;
  }
  // RenoDX: <<< [Patch: ThinGlassFroxelInscatterRepair]

  _1967 = int((_467 * _bufferSizeAndInvSize.x) + 0.5f);
  _1968 = int((_468 * _bufferSizeAndInvSize.y) + 0.5f);
  [branch]
  if (_200) {
    if (!(((((uint)(__3__36__0__0__g_sceneNormal.Load(int3(_1967, _1968, 0)))).x) & 1073741824) == 0)) {
      _2008 = exp2((saturate(_191.w) * 20.0f) + -8.0f) + -0.00390625f;  // [sem: _3__36__0__0__g_character_load_derived]
      _2009 = _2008 * select((_191.x < 0.040449999272823334f), (_191.x * 0.07739938050508499f), exp2(log2((_191.x + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
      _2010 = _2008 * select((_191.y < 0.040449999272823334f), (_191.y * 0.07739938050508499f), exp2(log2((_191.y + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
      _2011 = _2008 * select((_191.z < 0.040449999272823334f), (_191.z * 0.07739938050508499f), exp2(log2((_191.z + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
      _2024 = ((_2009 * 0.6131200194358826f) + (_2010 * 0.3395099937915802f)) + (_2011 * 0.047370001673698425f);
      _2025 = ((_2009 * 0.07020000368356705f) + (_2010 * 0.9163600206375122f)) + (_2011 * 0.013450000435113907f);
      _2026 = ((_2009 * 0.02061999961733818f) + (_2010 * 0.10958000272512436f)) + (_2011 * 0.8697999715805054f);
      _2027 = dot(float3(_2024, _2025, _2026), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _2030 = max(_2027, 1.0f) / max(_2027, 0.10000000149011612f);
      _2035 = (_2024 * _2030);
      _2036 = (_2025 * _2030);
      _2037 = (_2026 * _2030);
      _2038 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _2039 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _2040 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
    } else {
      _2035 = 0.0f;
      _2036 = 0.0f;
      _2037 = 0.0f;
      _2038 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _2039 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _2040 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
    }
  } else {
    _2035 = 0.0f;
    _2036 = 0.0f;
    _2037 = 0.0f;
    _2038 = (_191.x * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
    _2039 = (_191.y * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
    _2040 = (_191.z * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
  }
  // [sem: _3__36__0__0__g_texFroxelLight_sampleLod]
  _2042 = __3__36__0__0__g_texFroxelLight.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1915, _1916, _1898), 0.0f);
  _2046 = 1.0f - _215;
  // [sem: _3__36__0__0__g_sceneSpecular_sampleLod]
  _2057 = __3__36__0__0__g_sceneSpecular.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  _2061 = __3__36__0__0__g_baseColor.Load(int3(_1967, _1968, 0));  // [sem: _3__36__0__0__g_baseColor_load]
  _2067 = ((float)((uint)((uint)(((uint)((uint)(_2061.x)) >> 8) & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _2070 = ((float)((uint)((uint)(_2061.x & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _2074 = ((float)((uint)((uint)(((uint)((uint)(_2061.y)) >> 8) & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _2078 = saturate(_2067 * _2067);  // [sem: expr_sat]
  _2079 = saturate(_2070 * _2070);  // [sem: expr_sat]
  _2080 = saturate(_2074 * _2074);  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_dlssRRNormalRoughnessOpaque_sampleLod]
  _2100 = __3__36__0__0__g_dlssRRNormalRoughnessOpaque.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_467, _468), 0.0f);
  _2106 = rsqrt(dot(float3(_2100.x, _2100.y, _2100.z), float3(_2100.x, _2100.y, _2100.z)));  // [sem: invLength]
  _2107 = _2106 * _2100.x;
  _2108 = _2106 * _2100.y;
  _2109 = _2106 * _2100.z;
  _2111 = rsqrt(dot(float3(_480, _479, _478), float3(_480, _479, _478)));  // [sem: invLength]
  _2119 = _2100.w * _2100.w;
  _2120 = abs(dot(float3(_2107, _2108, _2109), float3((-0.0f - (_480 * _2111)), (-0.0f - (_479 * _2111)), (-0.0f - (_478 * _2111)))));
  _2121 = _2120 * _2120;
  _2122 = _2121 * _2120;
  _2124 = (_2119 * _2119) * _2119;
  _2151 = mad(0.03999999910593033f, max(0.0f, ((1.0f / dot(float3(mad(-1.3677200078964233f, _2122, mad(3.5968499183654785f, _2121, 1.0f)), mad(9.229490280151367f, _2122, mad(-16.317399978637695f, _2121, 9.044010162353516f)), mad(-20.212299346923828f, _2122, mad(19.78860092163086f, _2121, 5.565889835357666f))), float3(1.0f, _2119, _2124))) * dot(float2(mad(3.3270699977874756f, _2120, 0.03654630109667778f), mad(-9.04755973815918f, _2120, 9.063199996948242f)), float2(1.0f, _2119)))), max(0.0f, ((1.0f / dot(float3(mad(59.418800354003906f, _2122, mad(2.923379898071289f, _2120, 1.0f)), mad(222.5919952392578f, _2122, mad(-27.03019905090332f, _2120, 20.322500228881836f)), mad(316.62701416015625f, _2122, mad(626.1300048828125f, _2120, 121.56300354003906f))), float3(1.0f, _2119, _2124))) * dot(float2(mad(-1.285140037536621f, _2120, 0.9904400110244751f), mad(-0.7559069991111755f, _2120, 1.296779990196228f)), float2(1.0f, _2119)))));
  __3__38__0__1__g_dlssRRDiffuseAlbedoUAV[int2(_47, _48)] = float4(saturate(((_2079 * 0.3395099937915802f) + (_2078 * 0.6131200194358826f)) + (_2080 * 0.047370001673698425f)), saturate(((_2079 * 0.9163600206375122f) + (_2078 * 0.07020000368356705f)) + (_2080 * 0.013450000435113907f)), saturate(((_2079 * 0.10958000272512436f) + (_2078 * 0.02061999961733818f)) + (_2080 * 0.8697999715805054f)), 1.0f);
  __3__38__0__1__g_dlssRRSpecularAlbedoUAV[int2(_47, _48)] = float4(_2151, _2151, _2151, 1.0f);
  __3__38__0__1__g_dlssRRNormalRoughnessUAV[int2(_47, _48)] = float4(_2107, _2108, _2109, _2100.w);
  SV_Target.x = (((((((_1951 * 0.6131200194358826f) + (min(60000.0f, _1865) * _2046)) + (_1952 * 0.3395099937915802f)) + (_1953 * 0.047370001673698425f)) + ((_1936 * exp2(_1477 * _518)) * (_2035 + _1873.x))) + select(_206, (_2038 * _2042.x), 0.0f)) + _2057.x);
  SV_Target.y = (((((((_1951 * 0.07020000368356705f) + (min(60000.0f, _1866) * _2046)) + (_1952 * 0.9163600206375122f)) + (_1953 * 0.013450000435113907f)) + ((_1936 * exp2(_1477 * _519)) * (_2036 + _1873.y))) + select(_206, (_2039 * _2042.y), 0.0f)) + _2057.y);
  SV_Target.z = (((((((_1951 * 0.02061999961733818f) + (min(60000.0f, _1867) * _2046)) + (_1952 * 0.10958000272512436f)) + (_1953 * 0.8697999715805054f)) + ((_1936 * exp2(_1477 * _520)) * (_2037 + _1873.z))) + select(_206, (_2040 * _2042.z), 0.0f)) + _2057.z);
  SV_Target.w = 1.0f;

  // RenoDX: >>> [Patch: RefractionSurfaceShadowGate] [Version: 1.12.0]
  // Description: Material Improvements restores visible water/ice refraction surface shadowing, while vanilla mostly leaves this shadowing inside the in-scattering integral. The gate requires the special refraction path and optical thickness so thin stencil-only interior glass keeps native blending and avoids the historical glowing-bottle regression.
  float _rndx_refraction_shadow_weight = saturate(_203 * float((bool)_206) * saturate((_1449 - 0.04f) * 16.0f));
  if (MATERIAL_IMPROVEMENTS == 1.f && _rndx_refraction_shadow_weight > 0.0f) {
    float _rndx_surface_shadow = min(_1034, _1106);
    float _rndx_soft_shadow = lerp(1.0f, max(0.3f, _rndx_surface_shadow), _rndx_refraction_shadow_weight);
    float3 _rndx_scene_through = float3(
      (_1936 * exp2(_1477 * _518)) * (_2035 + _1873.x),
      (_1936 * exp2(_1477 * _519)) * (_2036 + _1873.y),
      (_1936 * exp2(_1477 * _520)) * (_2037 + _1873.z)
    );
    SV_Target.xyz = (SV_Target.xyz - _rndx_scene_through) * _rndx_soft_shadow + _rndx_scene_through;
  }
  // RenoDX: <<< [Patch: RefractionSurfaceShadowGate]

  return SV_Target;
}
