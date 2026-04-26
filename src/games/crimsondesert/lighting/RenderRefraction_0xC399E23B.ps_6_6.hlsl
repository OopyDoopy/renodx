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

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t90, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t93, space36);

Texture3D<float4> __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav : register(t85, space36);

Texture3D<float4> __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav : register(t86, space36);

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

cbuffer __3__35__0__0__VoxelGlobalIlluminationConstantBuffer : register(b1, space35) {
  uint4 __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[48];
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

SamplerState __0__4__0__0__g_staticVoxelSampler : register(s12, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  uint _52;
  uint _53;
  float _58;
  float _60;
  float _61;
  float _83;
  float _87;
  float _91;
  float _95;
  float _97;
  float _98;
  float _99;
  float _100;
  float _105;
  float _106;
  float _107;
  uint4 _109;
  float4 _113;
  float _119;
  float _120;
  bool _129;
  float _139;
  float _140;
  float _141;
  float _143;
  float _144;
  float _145;
  float _146;
  float _149;
  float _150;
  float _153;
  float _154;
  float _158;
  float _160;
  float _161;
  float _162;
  float _163;
  float _165;
  float _168;
  float _170;
  float _171;
  float _174;
  float _177;
  float _178;
  float _181;
  float _182;
  float _185;
  float _189;
  float _191;
  float _192;
  float _193;
  float _194;
  float4 _196;
  int _204;
  bool _205;
  float _208;
  bool _210;
  bool _211;
  float _212;
  float _220;
  float _302;
  float _303;
  float _304;
  float _305;
  float _306;
  float _307;
  float _329;
  float _330;
  float _331;
  float _405;
  float _406;
  float _472;
  float _473;
  float _474;
  float _475;
  float _476;
  int _720;
  float _756;
  float _757;
  float _758;
  float _759;
  int _760;
  int _799;
  float _835;
  float _836;
  float _837;
  float _838;
  int _839;
  int _840;
  int _841;
  int _896;
  float _933;
  float _934;
  float _935;
  float _936;
  int _937;
  int _938;
  int _984;
  float _1015;
  float _1016;
  float _1017;
  float _1018;
  int _1019;
  int _1020;
  float _1039;
  float _1111;
  float _1127;
  float _1128;
  float _1129;
  float _1149;
  float _1206;
  float _1303;
  float _1304;
  float _1305;
  int _1348;
  int _1406;
  int _1485;
  int _1543;
  int _1545;
  int _1603;
  int _1661;
  float _1709;
  float _1710;
  float _1711;
  float _1712;
  float _1721;
  float _1722;
  float _1723;
  float _1724;
  bool _1725;
  float _1734;
  float _1735;
  float _1736;
  float _1741;
  float _1742;
  float _1743;
  float _1744;
  float _1847;
  float _1858;
  float _2084;
  float _2138;
  float _2228;
  float _2229;
  float _2230;
  float _2274;
  float _2275;
  float _2276;
  float _2360;
  float _2361;
  float _2362;
  float _2444;
  float _2445;
  float _2446;
  float _2447;
  float _2448;
  float _2449;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _234;
  int _237;
  int _238;
  float _243;
  float _244;
  float _266;
  float _274;
  float _275;
  float _276;
  float _277;
  float _280;
  float _281;
  float _282;
  float _283;
  float _289;
  float _290;
  float _291;
  float _292;
  float _293;
  float _308;
  float _313;
  float _321;
  float _338;
  float _346;
  float _350;
  float _351;
  float _352;
  float _380;
  float _399;
  float _411;
  float _415;
  float _416;
  float _417;
  int _420;
  int _421;
  float _426;
  float _427;
  float _444;
  float _446;
  float _448;
  float _449;
  float _465;
  float _483;
  float _484;
  float _485;
  float4 _487;
  float _492;
  float _505;
  float _506;
  float _507;
  float _508;
  float _509;
  float _510;
  float _523;
  float _524;
  float _525;
  float _572;
  uint _587;
  uint _595;
  uint _603;
  uint _611;
  uint _619;
  uint _627;
  uint _635;
  uint _643;
  uint _651;
  uint _659;
  uint _667;
  uint _675;
  uint _683;
  uint _691;
  uint _699;
  uint _707;
  bool _709;
  float _735;
  float _736;
  float _737;
  float _738;
  bool _749;
  float _788;
  float _814;
  float _815;
  bool _826;
  bool _842;
  float _848;
  float _849;
  float _850;
  float _855;
  float _856;
  float _857;
  float _885;
  float _897;
  float _898;
  float _905;
  float _907;
  float _911;
  float _912;
  float _913;
  float _914;
  bool _925;
  float _943;
  float _944;
  float _945;
  float _973;
  float _995;
  float _996;
  bool _1007;
  float _1023;
  float _1024;
  float _1059;
  float _1063;
  float _1067;
  float _1082;
  float4 _1086;
  float _1091;
  float _1096;
  float _1098;
  float _1105;
  bool _1115;
  float _1152;
  float _1156;
  float _1158;
  float _1163;
  float _1168;
  float _1176;
  float _1183;
  float2 _1211;
  float _1233;
  float _1251;
  float _1252;
  float _1253;
  float _1269;
  float _1276;
  float _1288;
  float _1291;
  float _1297;
  float _1327;
  float _1329;
  float _1336;
  float _1340;
  float _1342;
  float _1344;
  float _1346;
  float4 _1350;
  float4 _1378;
  int _1388;
  int _1389;
  int _1390;
  int _1403;
  float _1420;
  float _1421;
  float _1422;
  float _1426;
  float _1427;
  float _1428;
  float _1430;
  float _1439;
  float4 _1442;
  float4 _1448;
  float _1464;
  float _1467;
  float _1469;
  float _1470;
  float _1471;
  int _1481;
  float4 _1487;
  float4 _1515;
  int _1525;
  int _1526;
  int _1527;
  int _1540;
  float _1551;
  float _1552;
  float _1553;
  float _1555;
  float _1564;
  float4 _1565;
  float4 _1570;
  float _1586;
  float _1589;
  float _1591;
  float _1592;
  float _1593;
  float4 _1605;
  float4 _1633;
  int _1643;
  int _1644;
  int _1645;
  int _1658;
  float _1665;
  float _1666;
  float _1667;
  float _1669;
  float _1678;
  float4 _1679;
  float4 _1684;
  float _1700;
  float _1703;
  float _1726;
  float _1730;
  float _1731;
  float _1732;
  float _1782;
  float _1783;
  float _1784;
  float _1786;
  float _1787;
  float _1788;
  float _1791;
  float _1792;
  float _1793;
  float _1821;
  float _1822;
  float _1823;
  float _1829;
  float _1859;
  float _1869;
  float _1870;
  float _1871;
  float _1872;
  float _1886;
  float _1899;
  float _1900;
  float _1901;
  float _1903;
  float _1904;
  float _1905;
  float _1906;
  float _1907;
  float _1908;
  float _1910;
  float _1912;
  float _1913;
  float _1926;
  float _1929;
  float _1930;
  float _1932;
  float _1940;
  float _1950;
  float _1951;
  float _1952;
  float _1972;
  float _1974;
  float _1976;
  float _1978;
  float _1987;
  float _1994;
  float _1995;
  float _1996;
  float _1997;
  int _2008;
  int _2017;
  uint2 _2021;
  int _2028;
  float _2038;
  float _2039;
  float _2040;
  float _2042;
  float _2043;
  float _2044;
  float _2045;
  int _2047;
  int _2048;
  int _2050;
  int _2051;
  float _2052;
  float _2053;
  float _2054;
  float _2060;
  float _2061;
  float _2062;
  float _2063;
  float _2064;
  bool _2065;
  float _2085;
  float _2086;
  float _2091;
  float _2095;
  float _2096;
  float _2097;
  float _2099;
  float _2100;
  float _2101;
  float _2102;
  float _2103;
  float _2105;
  float _2107;
  float _2112;
  float _2113;
  float _2115;
  float _2130;
  float _2156;
  float _2157;
  float _2158;
  float _2159;
  float _2164;
  float _2165;
  float _2166;
  float _2167;
  float _2169;
  float _2173;
  float _2174;
  float _2175;
  float _2177;
  float _2178;
  float _2179;
  float _2180;
  float _2190;
  float _2193;
  float _2201;
  bool _2204;
  bool _2205;
  bool _2206;
  bool _2207;
  float _2231;
  float _2232;
  float _2233;
  float _2235;
  float _2236;
  float _2237;
  float _2238;
  float _2239;
  float _2240;
  float _2244;
  float _2245;
  float _2247;
  float _2259;
  float _2266;
  float4 _2282;
  float _2307;
  float _2324;
  float _2325;
  float4 _2327;
  float4 _2332;
  float _2342;
  float _2343;
  float _2344;
  float _2345;
  float _2349;
  int _2376;
  int _2377;
  float _2417;
  float _2418;
  float _2419;
  float _2420;
  float _2433;
  float _2434;
  float _2435;
  float _2436;
  float _2439;
  float4 _2451;
  float _2455;
  float4 _2466;
  uint4 _2470;
  float _2476;
  float _2479;
  float _2483;
  float _2487;
  float _2488;
  float _2489;
  float4 _2509;
  float _2515;
  float _2516;
  float _2517;
  float _2518;
  float _2520;
  float _2528;
  float _2529;
  float _2530;
  float _2531;
  float _2533;
  float _2560;
  _52 = uint(SV_Position.x);
  _53 = uint(SV_Position.y);
  _58 = (TEXCOORD.x * 2.0f) + -1.0f;
  _60 = 1.0f - (TEXCOORD.y * 2.0f);
  _61 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depthTranslucent.Load(int3(_52, _53, 0))).x));
  _83 = mad((_invViewProjRelative[1].x), _60, ((_invViewProjRelative[0].x) * _58));
  _87 = mad((_invViewProjRelative[1].y), _60, ((_invViewProjRelative[0].y) * _58));
  _91 = mad((_invViewProjRelative[1].z), _60, ((_invViewProjRelative[0].z) * _58));
  _95 = mad((_invViewProjRelative[1].w), _60, ((_invViewProjRelative[0].w) * _58));
  _97 = mad((_invViewProjRelative[2].w), _61, _95) + (_invViewProjRelative[3].w);
  _98 = (mad((_invViewProjRelative[2].x), _61, _83) + (_invViewProjRelative[3].x)) / _97;
  _99 = (mad((_invViewProjRelative[2].y), _61, _87) + (_invViewProjRelative[3].y)) / _97;
  _100 = (mad((_invViewProjRelative[2].z), _61, _91) + (_invViewProjRelative[3].z)) / _97;
  _105 = _viewPos.x + _98;
  _106 = _viewPos.y + _99;
  _107 = _viewPos.z + _100;
  _109 = __3__36__0__0__g_baseColor.Load(int3(_52, _53, 0));
  _113 = __3__36__0__0__g_normal.Load(int3(_52, _53, 0));
  _119 = float((uint)((int)(_109.z & 255)));
  _120 = _119 * 0.003921568859368563f;
  _129 = ((uint)(uint((_113.w * 3.0f) + 0.5f)) == 1);
  _139 = (saturate(_113.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _140 = (saturate(_113.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _141 = (saturate(_113.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _143 = rsqrt(dot(float3(_139, _140, _141), float3(_139, _140, _141)));
  _144 = _143 * _139;
  _145 = _143 * _140;
  _146 = _141 * _143;
  _149 = (float((uint)((int)(((uint)((int)(_109.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _150 = (float((uint)((int)(_109.w & 255))) * 0.007843137718737125f) + -1.0f;
  _153 = (_149 + _150) * 0.5f;
  _154 = (_149 - _150) * 0.5f;
  _158 = (1.0f - abs(_153)) - abs(_154);
  _160 = rsqrt(dot(float3(_153, _154, _158), float3(_153, _154, _158)));
  _161 = _160 * _153;
  _162 = _160 * _154;
  _163 = _160 * _158;
  _165 = select((_146 >= 0.0f), 1.0f, -1.0f);
  _168 = -0.0f - (1.0f / (_165 + _146));
  _170 = (_144 * _168) * _145;
  _171 = _165 * _144;
  _174 = ((_171 * _144) * _168) + 1.0f;
  _177 = ((_145 * _145) * _168) + _165;
  _178 = -0.0f - _145;
  _181 = mad(_163, _144, mad(_162, _170, (_174 * _161)));
  _182 = _170 * _165;
  _185 = mad(_163, _145, mad(_162, _177, (_182 * _161)));
  _189 = mad(_163, _146, mad(_162, _178, (-0.0f - (_171 * _161))));
  _191 = rsqrt(dot(float3(_181, _185, _189), float3(_181, _185, _189)));
  _192 = _191 * _181;
  _193 = _191 * _185;
  _194 = _191 * _189;
  _196 = __3__36__0__0__g_character.Load(int3(_52, _53, 0));
  _204 = (((uint2)(__3__36__0__0__g_stencilTranslucent.Load(int3(_52, _53, 0)))).x) & 127;
  _205 = (_204 == 24);
  _208 = select(_205, 1.0f, select((_204 == 25), 0.6000000238418579f, 0.0f));
  _210 = (_204 == 29);
  _211 = _129 || _210;
  _212 = select(_211, 1.0f, 0.0f);
  if (_129 && _210) {
    _220 = select((((uint)(uint(_119)) & 128) != 0), 1.0f, 0.0f);
  } else {
    _220 = 0.0f;
  }
  _229 = sqrt(((_99 * _99) + (_98 * _98)) + (_100 * _100));
  _230 = max(9.999999747378752e-06f, _229);
  _231 = (-0.0f - _98) / _230;
  _232 = (-0.0f - _99) / _230;
  _233 = (-0.0f - _100) / _230;
  _234 = dot(float3(_192, _193, _194), float3(_231, _232, _233));
  _237 = int(floor(TEXCOORD.x));
  _238 = int(floor(TEXCOORD.y));
  _243 = abs(TEXCOORD.x - float((int)(_237)));
  _244 = abs(TEXCOORD.y - float((int)(_238)));
  _266 = max(1.0000000116860974e-07f, (float((uint)((int)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(_bufferSizeAndInvSize.x * select(((_237 & 1) == 0), _243, (1.0f - _243))), int(select(((_238 & 1) == 0), _244, (1.0f - _244)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215))) * 5.960465188081798e-08f));
  _274 = mad((_invViewProjRelative[2].w), _266, _95) + (_invViewProjRelative[3].w);
  _275 = (mad((_invViewProjRelative[2].x), _266, _83) + (_invViewProjRelative[3].x)) / _274;
  _276 = (mad((_invViewProjRelative[2].y), _266, _87) + (_invViewProjRelative[3].y)) / _274;
  _277 = (mad((_invViewProjRelative[2].z), _266, _91) + (_invViewProjRelative[3].z)) / _274;
  _280 = _nearFarProj.x / _61;
  _281 = _98 - _275;
  _282 = _99 - _276;
  _283 = _100 - _277;
  _289 = sqrt(((_282 * _282) + (_281 * _281)) + (_283 * _283));
  _290 = -0.0f - _231;
  _291 = -0.0f - _232;
  _292 = -0.0f - _233;
  _293 = dot(float3(_290, _291, _292), float3(_192, _193, _194));
  if (_293 < 0.0f) {
    _302 = _192;
    _303 = _193;
    _304 = _194;
    _305 = (-0.0f - _293);
    _306 = 1.0f;
    _307 = 1.3300000429153442f;
  } else {
    _302 = (-0.0f - _192);
    _303 = (-0.0f - _193);
    _304 = (-0.0f - _194);
    _305 = _293;
    _306 = 1.3300000429153442f;
    _307 = 1.0f;
  }
  _308 = _306 / _307;
  _313 = 1.0f - ((_308 * _308) * (1.0f - (_305 * _305)));
  if (!(_313 < 0.0f)) {
    _321 = (_308 * _305) - sqrt(_313);
    _329 = ((_321 * _302) + (_308 * _290));
    _330 = ((_321 * _303) + (_308 * _291));
    _331 = ((_321 * _304) + (_308 * _292));
  } else {
    _329 = 0.0f;
    _330 = 0.0f;
    _331 = 0.0f;
  }
  _338 = max(0.0010000000474974513f, sqrt(((_330 * _330) + (_329 * _329)) + (_331 * _331)));
  if (_212 < 0.5f) {
    _346 = ((_289 - _120) * _212) + _120;
    _350 = ((_329 / _338) * _346) + _98;
    _351 = ((_330 / _338) * _346) + _99;
    _352 = ((_331 / _338) * _346) + _100;
    _380 = mad((_viewProjRelative[2].w), _352, mad((_viewProjRelative[1].w), _351, ((_viewProjRelative[0].w) * _350))) + (_viewProjRelative[3].w);
    _405 = ((((mad((_viewProjRelative[2].x), _352, mad((_viewProjRelative[1].x), _351, ((_viewProjRelative[0].x) * _350))) + (_viewProjRelative[3].x)) / _380) * 0.5f) + 0.5f);
    _406 = (0.5f - (((mad((_viewProjRelative[2].y), _352, mad((_viewProjRelative[1].y), _351, ((_viewProjRelative[0].y) * _350))) + (_viewProjRelative[3].y)) / _380) * 0.5f));
  } else {
    _399 = saturate(_289 * 5.0f) * (0.33000004291534424f / (_280 + 1.0f));
    _405 = ((_399 * min(max(dot(float3(_192, _193, _194), float3(_174, _182, (-0.0f - _171))), -0.20000000298023224f), 0.20000000298023224f)) + TEXCOORD.x);
    _406 = ((_399 * min(max(dot(float3(_192, _193, _194), float3(_170, _177, _178)), -0.20000000298023224f), 0.20000000298023224f)) + TEXCOORD.y);
  }
  _411 = abs(_234) + 0.0010000000474974513f;
  _415 = _98 - ((_231 * _120) / _411);
  _416 = _99 - ((_232 * _120) / _411);
  _417 = _100 - ((_233 * _120) / _411);
  _420 = int(floor(_405));
  _421 = int(floor(_406));
  _426 = abs(_405 - float((int)(_420)));
  _427 = abs(_406 - float((int)(_421)));
  _444 = float((uint)((int)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(select(((_420 & 1) == 0), _426, (1.0f - _426)) * _bufferSizeAndInvSize.x), int(select(((_421 & 1) == 0), _427, (1.0f - _427)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215))) * 5.960465188081798e-08f;
  _446 = (_405 * 2.0f) + -1.0f;
  _448 = 1.0f - (_406 * 2.0f);
  _449 = max(1.0000000116860974e-07f, _444);
  _465 = mad((_invViewProjRelative[2].w), _449, mad((_invViewProjRelative[1].w), _448, (_446 * (_invViewProjRelative[0].w)))) + (_invViewProjRelative[3].w);
  if (!(_444 < ((__3__36__0__0__g_depthTranslucent.Load(int3(_52, _53, 0))).x))) {
    _472 = TEXCOORD.x;
    _473 = TEXCOORD.y;
    _474 = _275;
    _475 = _276;
    _476 = _277;
  } else {
    _472 = _405;
    _473 = _406;
    _474 = ((mad((_invViewProjRelative[2].x), _449, mad((_invViewProjRelative[1].x), _448, (_446 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[3].x)) / _465);
    _475 = ((mad((_invViewProjRelative[2].y), _449, mad((_invViewProjRelative[1].y), _448, (_446 * (_invViewProjRelative[0].y)))) + (_invViewProjRelative[3].y)) / _465);
    _476 = ((mad((_invViewProjRelative[2].z), _449, mad((_invViewProjRelative[1].z), _448, (_446 * (_invViewProjRelative[0].z)))) + (_invViewProjRelative[3].z)) / _465);
  }
  _483 = _417 + (_212 * (_476 - _417));
  _484 = _416 + (_212 * (_475 - _416));
  _485 = _415 + (_212 * (_474 - _415));
  _487 = __3__36__0__0__g_extinction.Load(int3(_52, _53, 0));
  _492 = _487.w * 10.0f;
  _505 = _492 / (((max(0.0010000000474974513f, _487.x) + -1.0f) * _208) + 1.0f);
  _506 = _492 / (((max(0.0010000000474974513f, _487.y) + -1.0f) * _208) + 1.0f);
  _507 = _492 / (((max(0.0010000000474974513f, _487.z) + -1.0f) * _208) + 1.0f);
  _508 = _505 * _487.x;
  _509 = _506 * _487.y;
  _510 = _507 * _487.z;
  _523 = ((_506 * 0.3395099937915802f) + (_505 * 0.6131200194358826f)) + (_507 * 0.047370001673698425f);
  _524 = ((_506 * 0.9163600206375122f) + (_505 * 0.07020000368356705f)) + (_507 * 0.013450000435113907f);
  _525 = ((_506 * 0.10958000272512436f) + (_505 * 0.02061999961733818f)) + (_507 * 0.8697999715805054f);
  _572 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _100, mad((_dynamicShadowProjRelativeTexScale[1][1].z), _99, ((_dynamicShadowProjRelativeTexScale[1][0].z) * _98))) + (_dynamicShadowProjRelativeTexScale[1][3].z);
  _587 = ((int)((((uint)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((uint)((int)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((int)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * float((uint)_53)) + float((uint)_52));
  _595 = ((int)((((uint)((_587 << 4) + (uint)(-1383041155))) ^ ((uint)(_587 + (uint)(-1640531527)))) ^ ((uint)(((int)((uint)(_587) >> 5)) + 2123724318u)))) + (int)(_frameNumber.x);
  _603 = ((int)((((uint)((_595 << 4) + (uint)(-1556008596))) ^ ((uint)(_595 + 1013904242u))) ^ (((uint)(_595) >> 5) + -939442524))) + _587;
  _611 = ((int)((((uint)((_603 << 4) + (uint)(-1383041155))) ^ ((uint)(_603 + 1013904242u))) ^ ((uint)(((int)((uint)(_603) >> 5)) + 2123724318u)))) + _595;
  _619 = ((int)((((uint)((_611 << 4) + (uint)(-1556008596))) ^ ((uint)(_611 + (uint)(-626627285)))) ^ (((uint)(_611) >> 5) + -939442524))) + _603;
  _627 = ((int)((((uint)((_619 << 4) + (uint)(-1383041155))) ^ ((uint)(_619 + (uint)(-626627285)))) ^ ((uint)(((int)((uint)(_619) >> 5)) + 2123724318u)))) + _611;
  _635 = ((int)((((uint)((_627 << 4) + (uint)(-1556008596))) ^ ((uint)(_627 + 2027808484u))) ^ (((uint)(_627) >> 5) + -939442524))) + _619;
  _643 = ((int)((((uint)((_635 << 4) + (uint)(-1383041155))) ^ ((uint)(_635 + 2027808484u))) ^ ((uint)(((int)((uint)(_635) >> 5)) + 2123724318u)))) + _627;
  _651 = ((int)((((uint)((_643 << 4) + (uint)(-1556008596))) ^ ((uint)(_643 + 387276957u))) ^ (((uint)(_643) >> 5) + -939442524))) + _635;
  _659 = ((int)((((uint)((_651 << 4) + (uint)(-1383041155))) ^ ((uint)(_651 + 387276957u))) ^ ((uint)(((int)((uint)(_651) >> 5)) + 2123724318u)))) + _643;
  _667 = ((int)((((uint)((_659 << 4) + (uint)(-1556008596))) ^ ((uint)(_659 + (uint)(-1253254570)))) ^ (((uint)(_659) >> 5) + -939442524))) + _651;
  _675 = ((int)((((uint)((_667 << 4) + (uint)(-1383041155))) ^ ((uint)(_667 + (uint)(-1253254570)))) ^ ((uint)(((int)((uint)(_667) >> 5)) + 2123724318u)))) + _659;
  _683 = ((int)((((uint)((_675 << 4) + (uint)(-1556008596))) ^ ((uint)(_675 + 1401181199u))) ^ (((uint)(_675) >> 5) + -939442524))) + _667;
  _691 = ((int)((((uint)((_683 << 4) + (uint)(-1383041155))) ^ ((uint)(_683 + 1401181199u))) ^ ((uint)(((int)((uint)(_683) >> 5)) + 2123724318u)))) + _675;
  _699 = ((int)((((uint)((_691 << 4) + (uint)(-1556008596))) ^ ((uint)(_691 + (uint)(-239350328)))) ^ (((uint)(_691) >> 5) + -939442524))) + _683;
  _707 = ((int)((((uint)((_699 << 4) + (uint)(-1383041155))) ^ ((uint)(_699 + (uint)(-239350328)))) ^ ((uint)(((int)((uint)(_699) >> 5)) + 2123724318u)))) + _691;
  _709 = ((_699 & 16777215) == 0);
  if (_709) {
    _720 = ((uint)(((int)((((uint)((_707 << 4) + (uint)(-1556008596))) ^ ((uint)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
  } else {
    _720 = _699;
  }
  _735 = (mad((_dynamicShadowProjRelativeTexScale[1][2].x), _100, mad((_dynamicShadowProjRelativeTexScale[1][1].x), _99, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _98))) + (_dynamicShadowProjRelativeTexScale[1][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 9.834766956373642e-08f) * float((uint)((int)(((uint)(_720 * 48271)) & 16777215)))) - (_dynmaicShadowSizeAndInvSize.z * 0.8250000476837158f));
  _736 = (mad((_dynamicShadowProjRelativeTexScale[1][2].y), _100, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _99, ((_dynamicShadowProjRelativeTexScale[1][0].y) * _98))) + (_dynamicShadowProjRelativeTexScale[1][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 9.834766956373642e-08f) * float((uint)((int)(((uint)(_720 * -1964877855)) & 16777215)))) - (_dynmaicShadowSizeAndInvSize.w * 0.8250000476837158f));
  _737 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
  _738 = 1.0f - _737;
  if (!(((bool)(((bool)(!(_735 >= _737))) || ((bool)(!(_735 <= _738))))) || (bool)(_736 > _738))) {
    _749 = (bool)(_572 >= -1.0f) && ((bool)((bool)(_572 <= 1.0f) && (bool)(_736 >= _737)));
    _756 = select(_749, _735, 0.0f);
    _757 = select(_749, _736, 0.0f);
    _758 = select(_749, _572, 0.0f);
    _759 = select(_749, 1.9999999494757503e-05f, 0.0f);
    _760 = ((int)(uint)(_749));
  } else {
    _756 = 0.0f;
    _757 = 0.0f;
    _758 = 0.0f;
    _759 = 0.0f;
    _760 = 0;
  }
  _788 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _100, mad((_dynamicShadowProjRelativeTexScale[0][1].z), _99, ((_dynamicShadowProjRelativeTexScale[0][0].z) * _98))) + (_dynamicShadowProjRelativeTexScale[0][3].z);
  if (_709) {
    _799 = ((uint)(((int)((((uint)((_707 << 4) + (uint)(-1556008596))) ^ ((uint)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
  } else {
    _799 = _699;
  }
  _814 = (mad((_dynamicShadowProjRelativeTexScale[0][2].x), _100, mad((_dynamicShadowProjRelativeTexScale[0][1].x), _99, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _98))) + (_dynamicShadowProjRelativeTexScale[0][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 1.9669533912747283e-07f) * float((uint)((int)(((uint)(_799 * 48271)) & 16777215)))) - (_dynmaicShadowSizeAndInvSize.z * 1.6500000953674316f));
  _815 = (mad((_dynamicShadowProjRelativeTexScale[0][2].y), _100, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _99, ((_dynamicShadowProjRelativeTexScale[0][0].y) * _98))) + (_dynamicShadowProjRelativeTexScale[0][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 1.9669533912747283e-07f) * float((uint)((int)(((uint)(_799 * -1964877855)) & 16777215)))) - (_dynmaicShadowSizeAndInvSize.w * 1.6500000953674316f));
  if (!(((bool)(((bool)(!(_814 >= _737))) || ((bool)(!(_814 <= _738))))) || (bool)(_815 > _738))) {
    _826 = (bool)(_788 >= -1.0f) && ((bool)((bool)(_788 <= 1.0f) && (bool)(_815 >= _737)));
    _835 = select(_826, _814, _756);
    _836 = select(_826, _815, _757);
    _837 = select(_826, _788, _758);
    _838 = select(_826, 4.999999873689376e-06f, _759);
    _839 = select(_826, 1, _760);
    _840 = select(_826, 1, _760);
    _841 = select(_826, 0, _760);
  } else {
    _835 = _756;
    _836 = _757;
    _837 = _758;
    _838 = _759;
    _839 = _760;
    _840 = _760;
    _841 = _760;
  }
  _842 = (_840 == 0);
  [branch]
  if (_842) {
    _848 = _98 + _viewPos.x;
    _849 = _99 + _viewPos.y;
    _850 = _100 + _viewPos.z;
    _855 = _848 - (_staticShadowPosition[1].x);
    _856 = _849 - (_staticShadowPosition[1].y);
    _857 = _850 - (_staticShadowPosition[1].z);
    _885 = mad((_shadowProjRelativeTexScale[1][2].z), _857, mad((_shadowProjRelativeTexScale[1][1].z), _856, ((_shadowProjRelativeTexScale[1][0].z) * _855))) + (_shadowProjRelativeTexScale[1][3].z);
    if (_709) {
      _896 = ((uint)(((int)((((uint)((_707 << 4) + (uint)(-1556008596))) ^ ((uint)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
    } else {
      _896 = _699;
    }
    _897 = _shadowSizeAndInvSize.z * 2.0f;
    _898 = _shadowSizeAndInvSize.w * 2.0f;
    _905 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
    _907 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
    _911 = (mad((_shadowProjRelativeTexScale[1][2].x), _857, mad((_shadowProjRelativeTexScale[1][1].x), _856, ((_shadowProjRelativeTexScale[1][0].x) * _855))) + (_shadowProjRelativeTexScale[1][3].x)) + ((float((uint)((int)(((uint)(_896 * 48271)) & 16777215))) * _905) - _897);
    _912 = (mad((_shadowProjRelativeTexScale[1][2].y), _857, mad((_shadowProjRelativeTexScale[1][1].y), _856, ((_shadowProjRelativeTexScale[1][0].y) * _855))) + (_shadowProjRelativeTexScale[1][3].y)) + ((float((uint)((int)(((uint)(_896 * -1964877855)) & 16777215))) * _907) - _898);
    _913 = 2.0f / _shadowSizeAndInvSize.y;
    _914 = 1.0f - _913;
    if (!(((bool)(((bool)(!(_911 >= _913))) || ((bool)(!(_911 <= _914))))) || (bool)(_912 > _914))) {
      _925 = (bool)(_885 >= 9.999999747378752e-05f) && ((bool)((bool)(_885 <= 1.0f) && (bool)(_912 >= _913)));
      _933 = select(_925, _911, _835);
      _934 = select(_925, _912, _836);
      _935 = select(_925, _885, _837);
      _936 = select(_925, 0.00019999999494757503f, _838);
      _937 = select(_925, 1, _839);
      _938 = select(_925, 1, _841);
    } else {
      _933 = _835;
      _934 = _836;
      _935 = _837;
      _936 = _838;
      _937 = _839;
      _938 = _841;
    }
    _943 = _848 - (_staticShadowPosition[0].x);
    _944 = _849 - (_staticShadowPosition[0].y);
    _945 = _850 - (_staticShadowPosition[0].z);
    _973 = mad((_shadowProjRelativeTexScale[0][2].z), _945, mad((_shadowProjRelativeTexScale[0][1].z), _944, ((_shadowProjRelativeTexScale[0][0].z) * _943))) + (_shadowProjRelativeTexScale[0][3].z);
    if (_709) {
      _984 = ((uint)(((int)((((uint)((_707 << 4) + (uint)(-1556008596))) ^ ((uint)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
    } else {
      _984 = _699;
    }
    _995 = (mad((_shadowProjRelativeTexScale[0][2].x), _945, mad((_shadowProjRelativeTexScale[0][1].x), _944, ((_shadowProjRelativeTexScale[0][0].x) * _943))) + (_shadowProjRelativeTexScale[0][3].x)) + ((float((uint)((int)(((uint)(_984 * 48271)) & 16777215))) * _905) - _897);
    _996 = (mad((_shadowProjRelativeTexScale[0][2].y), _945, mad((_shadowProjRelativeTexScale[0][1].y), _944, ((_shadowProjRelativeTexScale[0][0].y) * _943))) + (_shadowProjRelativeTexScale[0][3].y)) + ((float((uint)((int)(((uint)(_984 * -1964877855)) & 16777215))) * _907) - _898);
    if (!(((bool)(((bool)(!(_995 >= _913))) || ((bool)(!(_995 <= _914))))) || (bool)(_996 > _914))) {
      _1007 = (bool)(_973 >= 9.999999747378752e-05f) && ((bool)((bool)(_973 <= 1.0f) && (bool)(_996 >= _913)));
      _1015 = select(_1007, _995, _933);
      _1016 = select(_1007, _996, _934);
      _1017 = select(_1007, _973, _935);
      _1018 = select(_1007, 0.00019999999494757503f, _936);
      _1019 = select(_1007, 1, _937);
      _1020 = select(_1007, 0, _938);
    } else {
      _1015 = _933;
      _1016 = _934;
      _1017 = _935;
      _1018 = _936;
      _1019 = _937;
      _1020 = _938;
    }
  } else {
    _1015 = _835;
    _1016 = _836;
    _1017 = _837;
    _1018 = _838;
    _1019 = _839;
    _1020 = _841;
  }
  [branch]
  if (!(_1019 == 0)) {
    _1023 = _1017 - _1018;
    _1024 = float((uint)_1020);
    if (_842) {
      _1039 = saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1015, _1016, _1024), _1023))).x));
    } else {
      _1039 = saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1015, _1016, _1024), _1023))).x));
    }
  } else {
    _1039 = 1.0f;
  }
  _1059 = mad((_terrainShadowProjRelativeTexScale[2].x), _100, mad((_terrainShadowProjRelativeTexScale[1].x), _99, ((_terrainShadowProjRelativeTexScale[0].x) * _98))) + (_terrainShadowProjRelativeTexScale[3].x);
  _1063 = mad((_terrainShadowProjRelativeTexScale[2].y), _100, mad((_terrainShadowProjRelativeTexScale[1].y), _99, ((_terrainShadowProjRelativeTexScale[0].y) * _98))) + (_terrainShadowProjRelativeTexScale[3].y);
  _1067 = mad((_terrainShadowProjRelativeTexScale[2].z), _100, mad((_terrainShadowProjRelativeTexScale[1].z), _99, ((_terrainShadowProjRelativeTexScale[0].z) * _98))) + (_terrainShadowProjRelativeTexScale[3].z);
  if (saturate(_1059) == _1059) {
    if ((bool)(_1067 >= 9.999999747378752e-05f) && ((bool)((bool)(_1067 <= 1.0f) && (bool)(saturate(_1063) == _1063)))) {
      _1082 = frac((_1059 * 1024.0f) + -0.5f);
      _1086 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_1059, _1063));
      _1091 = _1067 + -0.004999999888241291f;
      _1096 = select((_1086.w > _1091), 1.0f, 0.0f);
      _1098 = select((_1086.x > _1091), 1.0f, 0.0f);
      _1105 = ((select((_1086.z > _1091), 1.0f, 0.0f) - _1096) * _1082) + _1096;
      _1111 = saturate((((((select((_1086.y > _1091), 1.0f, 0.0f) - _1098) * _1082) + _1098) - _1105) * frac((_1063 * 1024.0f) + -0.5f)) + _1105);
    } else {
      _1111 = 1.0f;
    }
  } else {
    _1111 = 1.0f;
  }
  _1115 = (_sunDirection.y > 0.0f);
  if ((_1115) || ((!(_1115)) && (_sunDirection.y > _moonDirection.y))) {
    _1127 = _sunDirection.x;
    _1128 = _sunDirection.y;
    _1129 = _sunDirection.z;
  } else {
    _1127 = _moonDirection.x;
    _1128 = _moonDirection.y;
    _1129 = _moonDirection.z;
  }
  if ((_1115) || ((!(_1115)) && (_sunDirection.y > _moonDirection.y))) {
    _1149 = _precomputedAmbient7.y;
  } else {
    _1149 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
  }
  _1152 = _earthRadius + _106;
  _1156 = (_100 * _100) + (_98 * _98);
  _1158 = sqrt(_1156 + (_1152 * _1152));
  _1163 = dot(float3((_98 / _1158), (_1152 / _1158), (_100 / _1158)), float3(_1127, _1128, _1129));
  _1168 = min(max(((_1158 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
  _1176 = max(_1168, 0.0f);
  _1183 = (-0.0f - sqrt((_1176 + (_earthRadius * 2.0f)) * _1176)) / (_1176 + _earthRadius);
  if (_1163 > _1183) {
    _1206 = ((exp2(log2(saturate((_1163 - _1183) / (1.0f - _1183))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
  } else {
    _1206 = ((exp2(log2(saturate((_1183 - _1163) / (_1183 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
  }
  _1211 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_1168 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _1206), 0.0f);
  _1233 = ((_1211.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
  _1251 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1252 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1253 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((int)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1269 = sqrt(_1156);
  _1276 = _cloudAltitude - (max(((_1269 * _1269) + -4e+05f), 0.0f) * 9.999999974752427e-07f);
  _1288 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((bool)(_1128 > 0.0f))) - ((int)(uint)((bool)(_1128 < 0.0f))))) * 0.5f))) + _1276;
  if (_106 < _1276) {
    _1291 = dot(float3(0.0f, 1.0f, 0.0f), float3(_1127, _1128, _1129));
    _1297 = select((abs(_1291) < 9.99999993922529e-09f), 1e+08f, ((_1288 - dot(float3(0.0f, 1.0f, 0.0f), float3(_105, _106, _107))) / _1291));
    _1303 = ((_1297 * _1127) + _105);
    _1304 = _1288;
    _1305 = ((_1297 * _1129) + _107);
  } else {
    _1303 = _105;
    _1304 = _106;
    _1305 = _107;
  }
  _1327 = saturate(abs(_1128) * 4.0f);
  _1329 = (_1327 * _1327) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3((((_1303 - _viewPos.x) * 4.999999873689376e-05f) + 0.5f), ((_1304 - _cloudAltitude) / _cloudThickness), (((_1305 - _viewPos.z) * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
  _1336 = ((1.0f - _1329) * saturate(((_106 - _cloudAltitude) - _cloudThickness) * 0.10000000149011612f)) + _1329;
  _1340 = _cubemapViewPosRelative.w * (_1149 * min(_1039, _1111));
  _1342 = (_1340 * (((_1252 * 0.3395099937915802f) + (_1251 * 0.6131200194358826f)) + (_1253 * 0.047370001673698425f))) * _1336;
  _1344 = (_1340 * (((_1252 * 0.9163600206375122f) + (_1251 * 0.07020000368356705f)) + (_1253 * 0.013450000435113907f))) * _1336;
  _1346 = (_1340 * (((_1252 * 0.10958000272512436f) + (_1251 * 0.02061999961733818f)) + (_1253 * 0.8697999715805054f))) * _1336;
  _1348 = 0;
  while(true) {
    _1350 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1348 + 20))]);
    _1378 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1348 + 36))]);
    _1388 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].x) + _98) * _1350.w) + _1378.x));
    _1389 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].y) + _99) * _1350.w) + _1378.y));
    _1390 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].z) + _100) * _1350.w) + _1378.z));
    if (!(((bool)(((bool)((bool)((int)_1388 >= (int)int(_1350.x + -63.0f)) && (bool)((int)_1388 < (int)int(_1350.x + 63.0f)))) && ((bool)((bool)((int)_1389 >= (int)int(_1350.y + -31.0f)) && (bool)((int)_1389 < (int)int(_1350.y + 31.0f)))))) && ((bool)((bool)((int)_1390 >= (int)int(_1350.z + -63.0f)) && (bool)((int)_1390 < (int)int(_1350.z + 63.0f)))))) {
      _1403 = _1348 + 1;
      if ((uint)_1403 < (uint)8) {
        _1348 = _1403;
        continue;
      } else {
        _1406 = -10000;
      }
    } else {
      _1406 = _1348;
    }
    if ((uint)_1406 < (uint)4) {
      _1420 = (asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[1u].x) * _98) + asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[46u].x);
      _1421 = (asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[1u].y) * _99) + asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[46u].y);
      _1422 = (asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[1u].z) * _100) + asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[46u].z);
      _1426 = 1.0f / float((uint)(1 << (_1406 & 31)));
      _1427 = _1420 * _1426;
      _1428 = _1421 * _1426;
      _1430 = frac(_1422 * _1426);
      _1439 = ((float((uint)(_1406 * 66)) + 1.0f) + ((select((_1430 < 0.0f), 1.0f, 0.0f) + _1430) * 64.0f)) * 0.0037878789007663727f;
      _1442 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1427, _1428, _1439), 0.0f);
      _1448 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1427, _1428, _1439), 0.0f);
      _1464 = (max(0.0f, ((sqrt(((_1442.y * _1442.y) + (_1442.z * _1442.z)) + (_1442.w * _1442.w)) * 1.0233277082443237f) + (_1442.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1448.y * 0.5f);
      _1467 = _1464 - (_1448.x * 0.5f);
      _1469 = max(0.0f, (_1467 + _1448.x));
      _1470 = max(0.0f, (_1464 + _1448.y));
      _1471 = max(0.0f, _1467);
      [branch]
      if ((bool)(_1448.z == 0.0f) && ((bool)(((bool)((bool)(_1469 == 0.0f) && (bool)(_1470 == 0.0f))) && (bool)(_1471 == 0.0f)))) {
        _1481 = min(3, (_1406 + 1));
        if ((uint)_1481 < (uint)8) {
          _1485 = _1481;
          while(true) {
            _1487 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((uint)(_1485 + 20u))]);
            _1515 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((uint)(_1485 + 36u))]);
            _1525 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].x) + _98) * _1487.w) + _1515.x));
            _1526 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].y) + _99) * _1487.w) + _1515.y));
            _1527 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].z) + _100) * _1487.w) + _1515.z));
            if (!(((bool)(((bool)((bool)((int)_1525 >= (int)int(_1487.x + -63.0f)) && (bool)((int)_1525 < (int)int(_1487.x + 63.0f)))) && ((bool)((bool)((int)_1526 >= (int)int(_1487.y + -31.0f)) && (bool)((int)_1526 < (int)int(_1487.y + 31.0f)))))) && ((bool)((bool)((int)_1527 >= (int)int(_1487.z + -63.0f)) && (bool)((int)_1527 < (int)int(_1487.z + 63.0f)))))) {
              _1540 = _1485 + 1;
              if ((uint)_1540 < (uint)8) {
                _1485 = _1540;
                continue;
              } else {
                _1543 = -10000;
              }
            } else {
              _1543 = _1485;
            }
            _1545 = _1543;
            break;
          }
        } else {
          _1545 = -10000;
        }
        if ((uint)_1545 < (uint)4) {
          _1551 = 1.0f / float((uint)(1 << (_1545 & 31)));
          _1552 = _1551 * _1420;
          _1553 = _1551 * _1421;
          _1555 = frac(_1551 * _1422);
          _1564 = ((float((uint)(_1545 * 66)) + 1.0f) + ((select((_1555 < 0.0f), 1.0f, 0.0f) + _1555) * 64.0f)) * 0.0037878789007663727f;
          _1565 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1552, _1553, _1564), 0.0f);
          _1570 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1552, _1553, _1564), 0.0f);
          _1586 = (max(0.0f, ((sqrt(((_1565.y * _1565.y) + (_1565.z * _1565.z)) + (_1565.w * _1565.w)) * 1.0233277082443237f) + (_1565.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1570.y * 0.5f);
          _1589 = _1586 - (_1570.x * 0.5f);
          _1591 = max(0.0f, (_1589 + _1570.x));
          _1592 = max(0.0f, (_1586 + _1570.y));
          _1593 = max(0.0f, _1589);
          if ((bool)(_1570.z == 0.0f) && ((bool)(((bool)((bool)(_1591 == 0.0f) && (bool)(_1592 == 0.0f))) && (bool)(_1593 == 0.0f)))) {
            _1603 = 3;
            while(true) {
              _1605 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1603 + 20))]);
              _1633 = asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1603 + 36))]);
              _1643 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].x) + _98) * _1605.w) + _1633.x));
              _1644 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].y) + _99) * _1605.w) + _1633.y));
              _1645 = int(floor(((asfloat(__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[19u].z) + _100) * _1605.w) + _1633.z));
              if (!(((bool)(((bool)((bool)((int)_1643 >= (int)int(_1605.x + -63.0f)) && (bool)((int)_1643 < (int)int(_1605.x + 63.0f)))) && ((bool)((bool)((int)_1644 >= (int)int(_1605.y + -31.0f)) && (bool)((int)_1644 < (int)int(_1605.y + 31.0f)))))) && ((bool)((bool)((int)_1645 >= (int)int(_1605.z + -63.0f)) && (bool)((int)_1645 < (int)int(_1605.z + 63.0f)))))) {
                _1658 = _1603 + 1;
                if ((uint)_1658 < (uint)8) {
                  _1603 = _1658;
                  continue;
                } else {
                  _1661 = -10000;
                }
              } else {
                _1661 = _1603;
              }
              _1665 = 1.0f / float((uint)(1 << (_1661 & 31)));
              _1666 = _1665 * _1420;
              _1667 = _1665 * _1421;
              _1669 = frac(_1665 * _1422);
              _1678 = ((float((uint)(_1661 * 66)) + 1.0f) + ((select((_1669 < 0.0f), 1.0f, 0.0f) + _1669) * 64.0f)) * 0.0037878789007663727f;
              _1679 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1666, _1667, _1678), 0.0f);
              _1684 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1666, _1667, _1678), 0.0f);
              _1700 = (max(0.0f, ((sqrt(((_1679.y * _1679.y) + (_1679.z * _1679.z)) + (_1679.w * _1679.w)) * 1.0233277082443237f) + (_1679.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1684.y * 0.5f);
              _1703 = _1700 - (_1684.x * 0.5f);
              _1709 = max(0.0f, (_1703 + _1684.x));
              _1710 = max(0.0f, (_1700 + _1684.y));
              _1711 = max(0.0f, _1703);
              _1712 = _1684.z;
              break;
            }
          } else {
            _1709 = _1591;
            _1710 = _1592;
            _1711 = _1593;
            _1712 = _1570.z;
          }
          _1721 = _1709;
          _1722 = _1710;
          _1723 = _1711;
          _1724 = _1712;
          _1725 = (((bool)(((bool)((bool)(_1709 == 0.0f) && (bool)(_1710 == 0.0f))) && (bool)(_1711 == 0.0f))) && (bool)(_1712 == 0.0f));
        } else {
          _1721 = _1469;
          _1722 = _1470;
          _1723 = _1471;
          _1724 = _1448.z;
          _1725 = false;
        }
      } else {
        _1721 = _1469;
        _1722 = _1470;
        _1723 = _1471;
        _1724 = _1448.z;
        _1725 = false;
      }
      _1726 = max(0.009999999776482582f, _1724);
      _1730 = (_1721 / _1726) * 3.1415927410125732f;
      _1731 = (_1722 / _1726) * 3.1415927410125732f;
      _1732 = (_1723 / _1726) * 3.1415927410125732f;
      if (!_1725) {
        _1734 = _1730;
        _1735 = _1731;
        _1736 = _1732;
        _1741 = _1734;
        _1742 = _1735;
        _1743 = _1736;
        _1744 = saturate((_280 + -64.0f) * 0.0078125f);
      } else {
        _1741 = _1730;
        _1742 = _1731;
        _1743 = _1732;
        _1744 = 1.0f;
      }
    } else {
      _1734 = 0.0f;
      _1735 = 0.0f;
      _1736 = 0.0f;
      _1741 = _1734;
      _1742 = _1735;
      _1743 = _1736;
      _1744 = saturate((_280 + -64.0f) * 0.0078125f);
    }
    _1782 = _193 * -1.0233277082443237f;
    _1783 = _194 * 1.0233277082443237f;
    _1784 = _192 * -1.0233277082443237f;
    _1786 = (_192 * 0.8580852150917053f) * _193;
    _1787 = _194 * -0.8580852150917053f;
    _1788 = _1787 * _193;
    _1791 = ((_194 * _194) * 0.7431248426437378f) + -0.2477082908153534f;
    _1792 = _1787 * _192;
    _1793 = ((_192 * _192) - (_193 * _193)) * 0.42904260754585266f;
    _1821 = _98 - _485;
    _1822 = _99 - _484;
    _1823 = _100 - _483;
    _1829 = sqrt(((_1822 * _1822) + (_1821 * _1821)) + (_1823 * _1823));
    if (_229 > 5000.0f) {
      _1847 = (((saturate(max((_229 + -5000.0f), 0.0f) * 0.0010000000474974513f) * 10.0f) * exp2(log2(frac(sin(dot(float2(_58, _60), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f)) * 0.45454543828964233f)) + _1829);
    } else {
      _1847 = _1829;
    }
    if (_211) {
      _1858 = ((saturate(_1847 * 10.0f) * ((_120 - _1847) + ((_1847 - _120) * float((bool)_129)))) + _1847);
    } else {
      _1858 = _1847;
    }
    _1859 = _1858 * 2.0f;
    _1869 = -0.0f - max(9.999999747378752e-06f, ((_1859 * _523) / _1858));
    _1870 = -0.0f - max(9.999999747378752e-06f, ((_1859 * _524) / _1858));
    _1871 = -0.0f - max(9.999999747378752e-06f, ((_1859 * _525) / _1858));
    _1872 = _1858 * 1.4426950216293335f;
    _1886 = max(9.999999747378752e-06f, _1858) * -1.4426950216293335f;
    _1899 = _1127 + _231;
    _1900 = _1128 + _232;
    _1901 = _1129 + _233;
    _1903 = rsqrt(dot(float3(_1899, _1900, _1901), float3(_1899, _1900, _1901)));
    _1904 = _1903 * _1899;
    _1905 = _1903 * _1900;
    _1906 = _1903 * _1901;
    _1907 = dot(float3(_192, _193, _194), float3(_1127, _1128, _1129));
    _1908 = dot(float3(_192, _193, _194), float3(_1904, _1905, _1906));
    _1910 = dot(float3(_290, _291, _292), float3(_1127, _1128, _1129));
    _1912 = (_1910 * _1910) + 1.0f;
    _1913 = _1910 * 0.5f;
    _1926 = max(((_1912 / exp2(log2(1.0625f - _1913) * 1.5f)) * 0.05425736680626869f), ((_1912 / exp2(log2(_1913 + 1.0625f) * 1.5f)) * 0.05425736680626869f));
    _1929 = saturate(1.0f - saturate(dot(float3(_231, _232, _233), float3(_1904, _1905, _1906))));
    _1930 = _1929 * _1929;
    _1932 = (_1930 * _1930) * _1929;
    _1940 = (((dot(float3(_231, _232, _233), float3(_1127, _1128, _1129)) * 0.5f) + 0.5f) * _1858) + _1858;
    _1950 = -0.0f - max(9.999999747378752e-06f, ((_1940 * _523) / _1858));
    _1951 = -0.0f - max(9.999999747378752e-06f, ((_1940 * _524) / _1858));
    _1952 = -0.0f - max(9.999999747378752e-06f, ((_1940 * _525) / _1858));
    _1972 = (((_1926 * _1342) * ((exp2(_1872 * _1950) + -1.0f) / _1950)) + (((((max(0.0f, ((dot(float4(_1786, _1788, _1791, _1792), float4(_precomputedAmbient1.x, _precomputedAmbient1.y, _precomputedAmbient1.z, _precomputedAmbient1.w)) + dot(float4(0.886227548122406f, _1782, _1783, _1784), float4(_precomputedAmbient0.x, _precomputedAmbient0.y, _precomputedAmbient0.z, _precomputedAmbient0.w))) + (_precomputedAmbient6.x * _1793))) - _1741) * _1744) + _1741) * 0.2572200894355774f) * ((exp2(_1872 * _1869) + -1.0f) / _1869))) * (((_509 * 0.3395099937915802f) + (_508 * 0.6131200194358826f)) + (_510 * 0.047370001673698425f));
    _1974 = (((_1926 * _1344) * ((exp2(_1872 * _1951) + -1.0f) / _1951)) + (((((max(0.0f, ((dot(float4(0.886227548122406f, _1782, _1783, _1784), float4(_precomputedAmbient2.x, _precomputedAmbient2.y, _precomputedAmbient2.z, _precomputedAmbient2.w)) + (_precomputedAmbient6.y * _1793)) + dot(float4(_1786, _1788, _1791, _1792), float4(_precomputedAmbient3.x, _precomputedAmbient3.y, _precomputedAmbient3.z, _precomputedAmbient3.w)))) - _1742) * _1744) + _1742) * 0.2572200894355774f) * ((exp2(_1872 * _1870) + -1.0f) / _1870))) * (((_509 * 0.9163600206375122f) + (_508 * 0.07020000368356705f)) + (_510 * 0.013450000435113907f));
    _1976 = (((_1926 * _1346) * ((exp2(_1872 * _1952) + -1.0f) / _1952)) + (((((max(0.0f, ((dot(float4(0.886227548122406f, _1782, _1783, _1784), float4(_precomputedAmbient4.x, _precomputedAmbient4.y, _precomputedAmbient4.z, _precomputedAmbient4.w)) + (_precomputedAmbient6.z * _1793)) + dot(float4(_1786, _1788, _1791, _1792), float4(_precomputedAmbient5.x, _precomputedAmbient5.y, _precomputedAmbient5.z, _precomputedAmbient5.w)))) - _1743) * _1744) + _1743) * 0.2572200894355774f) * ((exp2(_1872 * _1871) + -1.0f) / _1871))) * (((_509 * 0.10958000272512436f) + (_508 * 0.02061999961733818f)) + (_510 * 0.8697999715805054f));
    _1978 = (_234 * 0.9995999932289124f) + 0.00039999998989515007f;
    _1987 = 1.0f - ((_1908 * _1908) * 0.9999998211860657f);
    _1994 = saturate(_1907) * max((((0.5f / ((((_1907 * 0.9995999932289124f) + 0.00039999998989515007f) * _234) + (_1907 * _1978))) * (lerp(_1932, 1.0f, 0.03999999910593033f))) * (5.092957522379038e-08f / (_1987 * _1987))), 0.0f);
    _1995 = _1994 * _1342;
    _1996 = _1994 * _1344;
    _1997 = _1994 * _1346;
    if (_210) {
      _2008 = asint(__3__37__0__0__g_structureCounterBuffer.Load(4));
      _2017 = (uint)(uint(_tiledRadianceCacheParams.x)) & 31;
      _2021 = __3__36__0__0__g_manyLightsHitData.Load(int3(((uint)(int(_bufferSizeAndInvSize.x * TEXCOORD.x) >> _2017)), ((uint)(int(_bufferSizeAndInvSize.y * TEXCOORD.y) >> _2017)), 0));
      _2028 = select(((_2021.x | _2021.y) != 0), (((uint)((int)(_2021.x)) >> 16) & 32767), 32767);
      if ((bool)(_2028 != 32767) && (bool)((uint)_2028 < (uint)_2008)) {
        _2038 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._position.x;
        _2039 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._position.y;
        _2040 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._position.z;
        _2042 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._color.x;
        _2043 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._color.y;
        _2044 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._color.z;
        _2045 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._color.w;
        _2047 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._up.x;
        _2048 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._up.y;
        _2050 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._look.x;
        _2051 = __3__37__0__0__g_manyLightsDataBuffer[_2028]._look.y;
        _2052 = _2038 - _98;
        _2053 = _2039 - _99;
        _2054 = _2040 - _100;
        _2060 = sqrt(((_2052 * _2052) + (_2053 * _2053)) + (_2054 * _2054));
        _2061 = 1.0f / _2060;
        _2062 = _2061 * _2052;
        _2063 = _2061 * _2053;
        _2064 = _2061 * _2054;
        _2065 = (_2045 > 99999.0f);
        if (!_2065) {
          _2084 = min(min(512.0f, ((_cavityParams.w * 192.0f) + 128.0f)), ((((min(0.6000000238418579f, ((_cavityParams.w * 0.20000000298023224f) + 0.20000000298023224f)) * 0.25f) / max(9.999999974752427e-07f, (_exposure2.x * 8.0f))) * dot(float3(_2042, _2043, _2044), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f))) + 8.0f));
        } else {
          _2084 = _2045;
        }
        _2085 = abs(_2045);
        _2086 = _2060 * _2060;
        _2091 = select((_2085 > 99999.0f), 1.0f, (1.0f / max((_2085 * _2085), _2086)));
        _2095 = _2062 - _231;
        _2096 = _2063 - _232;
        _2097 = _2064 - _233;
        _2099 = rsqrt(dot(float3(_2095, _2096, _2097), float3(_2095, _2096, _2097)));
        _2100 = _2099 * _2095;
        _2101 = _2099 * _2096;
        _2102 = _2099 * _2097;
        _2103 = dot(float3(_144, _145, _146), float3(_2062, _2063, _2064));
        _2105 = saturate(dot(float3(_144, _145, _146), float3(_290, _291, _292)));
        _2107 = saturate(dot(float3(_144, _145, _146), float3(_2100, _2101, _2102)));
        if (_2103 > 0.0f) {
          _2112 = saturate(1.0f - dot(float3(_290, _291, _292), float3(_2100, _2101, _2102)));
          _2113 = _2112 * _2112;
          _2115 = (_2113 * _2113) * _2112;
          _2130 = 1.0f - ((_2107 * _2107) * 0.9900000095367432f);
          _2138 = (max((((0.0031830989755690098f / (_2130 * _2130)) * (0.5f / ((((_2105 * 0.9900000095367432f) + 0.010000000707805157f) * _2103) + (_2105 * ((_2103 * 0.9900000095367432f) + 0.010000000707805157f))))) * (lerp(_2115, 1.0f, 0.03999999910593033f))), 0.0f) * saturate(_2103));
        } else {
          _2138 = 0.0f;
        }
        if ((_2065) | ((bool)(_2060 < _2084) && (bool)(dot(float3(((_2091 * _2042) * _2138), ((_2091 * _2043) * _2138), ((_2091 * _2044) * _2138)), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) > (_exposure2.x * ((saturate(dot(float3(_viewPos.x, _viewPos.y, _viewPos.z), float3(_98, _99, _100)) * 0.015625f) * 0.09000000357627869f) + 0.009999999776482582f))))) {
          _2156 = select(_2065, 1.0f, saturate(select(_2065, 1.0f, (1.0f / max((_2045 * _2045), _2086))))) * float((bool)(bool)((float((uint)((int)(_2021.x & 65535))) * 0.015609979629516602f) >= 1000.0f));
          _2157 = _2156 * _2042;
          _2158 = _2156 * _2043;
          _2159 = _2156 * _2044;
          _2164 = f16tof32(((int)(_2047 & 65535)));
          _2165 = f16tof32(((int)((uint)(_2047) >> 16)));
          _2166 = f16tof32(((int)(_2048 & 65535)));
          _2167 = f16tof32(((int)((uint)(_2048) >> 16)));
          _2169 = rsqrt(dot(float3(_2164, _2165, _2166), float3(_2164, _2165, _2166)));
          _2173 = f16tof32(((int)(_2050 & 65535)));
          _2174 = f16tof32(((int)((uint)(_2050) >> 16)));
          _2175 = f16tof32(((int)(_2051 & 65535)));
          _2177 = rsqrt(dot(float3(_2173, _2174, _2175), float3(_2173, _2174, _2175)));
          _2178 = _2177 * _2173;
          _2179 = _2177 * _2174;
          _2180 = _2177 * _2175;
          if (!(_2167 < 0.0f)) {
            _2190 = mad(_2064, (_2169 * _2166), mad(_2063, (_2169 * _2165), ((_2164 * _2062) * _2169)));
            _2193 = mad(_2064, _2180, mad(_2063, _2179, (_2178 * _2062)));
            _2201 = atan((-0.0f - _2193) / (-0.0f - _2190));
            _2204 = (_2190 > -0.0f);
            _2205 = (_2190 == -0.0f);
            _2206 = (_2193 <= -0.0f);
            _2207 = (_2193 > -0.0f);
            _2228 = (((__3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_2062, _2063, _2064), float3(_2178, _2179, _2180))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select((_2205 && _2206), 0.5f, select((_2205 && _2207), -0.5f, (select((_2204 && _2207), (_2201 + -3.1415927410125732f), select((_2204 && _2206), (_2201 + 3.1415927410125732f), _2201)) * 0.31830987334251404f))))) * f16tof32(((int)((uint)(_2051) >> 16)))) + _2167)), 0.0f)).x) * _2157);
            _2229 = (((__3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_2062, _2063, _2064), float3(_2178, _2179, _2180))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select((_2205 && _2206), 0.5f, select((_2205 && _2207), -0.5f, (select((_2204 && _2207), (_2201 + -3.1415927410125732f), select((_2204 && _2206), (_2201 + 3.1415927410125732f), _2201)) * 0.31830987334251404f))))) * f16tof32(((int)((uint)(_2051) >> 16)))) + _2167)), 0.0f)).x) * _2158);
            _2230 = (((__3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_2062, _2063, _2064), float3(_2178, _2179, _2180))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select((_2205 && _2206), 0.5f, select((_2205 && _2207), -0.5f, (select((_2204 && _2207), (_2201 + -3.1415927410125732f), select((_2204 && _2206), (_2201 + 3.1415927410125732f), _2201)) * 0.31830987334251404f))))) * f16tof32(((int)((uint)(_2051) >> 16)))) + _2167)), 0.0f)).x) * _2159);
          } else {
            _2228 = _2157;
            _2229 = _2158;
            _2230 = _2159;
          }
          _2231 = _2062 + _231;
          _2232 = _2063 + _232;
          _2233 = _2064 + _233;
          _2235 = rsqrt(dot(float3(_2231, _2232, _2233), float3(_2231, _2232, _2233)));
          _2236 = _2235 * _2231;
          _2237 = _2235 * _2232;
          _2238 = _2235 * _2233;
          _2239 = dot(float3(_192, _193, _194), float3(_2062, _2063, _2064));
          _2240 = dot(float3(_192, _193, _194), float3(_2236, _2237, _2238));
          _2244 = saturate(1.0f - saturate(dot(float3(_231, _232, _233), float3(_2236, _2237, _2238))));
          _2245 = _2244 * _2244;
          _2247 = (_2245 * _2245) * _2244;
          _2259 = 1.0f - ((_2240 * _2240) * 0.9999998211860657f);
          _2266 = saturate(_2239) * max((((5.092957522379038e-08f / (_2259 * _2259)) * (0.5f / ((((_2239 * 0.9995999932289124f) + 0.00039999998989515007f) * _234) + (_2239 * _1978)))) * (lerp(_2247, 1.0f, 0.03999999910593033f))), 0.0f);
          _2274 = ((_2266 * _2228) + _1995);
          _2275 = ((_2266 * _2229) + _1996);
          _2276 = ((_2266 * _2230) + _1997);
        } else {
          _2274 = _1995;
          _2275 = _1996;
          _2276 = _1997;
        }
      } else {
        _2274 = _1995;
        _2275 = _1996;
        _2276 = _1997;
      }
    } else {
      _2274 = _1995;
      _2275 = _1996;
      _2276 = _1997;
    }
    _2282 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearMirror, float2(_472, _473), 0.0f);
    _2307 = max(0.0f, (log2((max(0.0f, _229) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z;
    _2324 = min((1.0f - ((float((bool)(bool)((_bufferSizeAndInvSize.x - (_volumeSize.x * 4.0f)) > 0.0f)) + 0.5f) / _volumeSize.x)), _472);
    _2325 = min((1.0f - ((float((bool)(bool)((_bufferSizeAndInvSize.y - (_volumeSize.y * 4.0f)) > 0.0f)) + 0.5f) / _volumeSize.y)), _473);
    _2327 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2324, _2325, (max(0.0f, (log2((max(0.0f, sqrt(((_484 * _484) + (_485 * _485)) + (_483 * _483))) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z)), 0.0f);
    _2332 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2324, _2325, _2307), 0.0f);
    _2342 = max(0.0f, (_2327.x - _2332.x));
    _2343 = max(0.0f, (_2327.y - _2332.y));
    _2344 = max(0.0f, (_2327.z - _2332.z));
    _2345 = (1.0f / max(0.009999999776482582f, _2332.w)) * _2327.w;
    if (_129) {
      _2349 = saturate((_2307 + -0.75f) * 4.0f);
      _2360 = ((_2349 * (_1972 - _2342)) + _2342);
      _2361 = ((_2349 * (_1974 - _2343)) + _2343);
      _2362 = ((_2349 * (_1976 - _2344)) + _2344);
    } else {
      _2360 = _1972;
      _2361 = _1974;
      _2362 = _1976;
    }
    _2376 = int((_472 * _bufferSizeAndInvSize.x) + 0.5f);
    _2377 = int((_473 * _bufferSizeAndInvSize.y) + 0.5f);
    [branch]
    if (_205) {
      if (!(((((uint)(__3__36__0__0__g_sceneNormal.Load(int3(_2376, _2377, 0)))).x) & 1073741824) == 0)) {
        _2417 = exp2((saturate(_196.w) * 20.0f) + -8.0f) + -0.00390625f;
        _2418 = _2417 * select((_196.x < 0.040449999272823334f), (_196.x * 0.07739938050508499f), exp2(log2((_196.x + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2419 = _2417 * select((_196.y < 0.040449999272823334f), (_196.y * 0.07739938050508499f), exp2(log2((_196.y + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2420 = _2417 * select((_196.z < 0.040449999272823334f), (_196.z * 0.07739938050508499f), exp2(log2((_196.z + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2433 = ((_2418 * 0.6131200194358826f) + (_2419 * 0.3395099937915802f)) + (_2420 * 0.047370001673698425f);
        _2434 = ((_2418 * 0.07020000368356705f) + (_2419 * 0.9163600206375122f)) + (_2420 * 0.013450000435113907f);
        _2435 = ((_2418 * 0.02061999961733818f) + (_2419 * 0.10958000272512436f)) + (_2420 * 0.8697999715805054f);
        _2436 = dot(float3(_2433, _2434, _2435), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        _2439 = max(_2436, 1.0f) / max(_2436, 0.10000000149011612f);
        _2444 = (_2433 * _2439);
        _2445 = (_2434 * _2439);
        _2446 = (_2435 * _2439);
        _2447 = 0.0f;
        _2448 = 0.0f;
        _2449 = 0.0f;
      } else {
        _2444 = 0.0f;
        _2445 = 0.0f;
        _2446 = 0.0f;
        _2447 = 0.0f;
        _2448 = 0.0f;
        _2449 = 0.0f;
      }
    } else {
      _2444 = 0.0f;
      _2445 = 0.0f;
      _2446 = 0.0f;
      _2447 = (_196.x * 4.0f);
      _2448 = (_196.y * 4.0f);
      _2449 = (_196.z * 4.0f);
    }
    _2451 = __3__36__0__0__g_texFroxelLight.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2324, _2325, _2307), 0.0f);
    _2455 = 1.0f - _220;
    _2466 = __3__36__0__0__g_sceneSpecular.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
    _2470 = __3__36__0__0__g_baseColor.Load(int3(_2376, _2377, 0));
    _2476 = float((uint)((int)(((uint)((int)(_2470.x)) >> 8) & 255))) * 0.003921568859368563f;
    _2479 = float((uint)((int)(_2470.x & 255))) * 0.003921568859368563f;
    _2483 = float((uint)((int)(((uint)((int)(_2470.y)) >> 8) & 255))) * 0.003921568859368563f;
    _2487 = saturate(_2476 * _2476);
    _2488 = saturate(_2479 * _2479);
    _2489 = saturate(_2483 * _2483);
    _2509 = __3__36__0__0__g_dlssRRNormalRoughnessOpaque.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_472, _473), 0.0f);
    _2515 = rsqrt(dot(float3(_2509.x, _2509.y, _2509.z), float3(_2509.x, _2509.y, _2509.z)));
    _2516 = _2515 * _2509.x;
    _2517 = _2515 * _2509.y;
    _2518 = _2515 * _2509.z;
    _2520 = rsqrt(dot(float3(_485, _484, _483), float3(_485, _484, _483)));
    _2528 = _2509.w * _2509.w;
    _2529 = abs(dot(float3(_2516, _2517, _2518), float3((-0.0f - (_485 * _2520)), (-0.0f - (_484 * _2520)), (-0.0f - (_483 * _2520)))));
    _2530 = _2529 * _2529;
    _2531 = _2530 * _2529;
    _2533 = (_2528 * _2528) * _2528;
    _2560 = mad(0.03999999910593033f, max(0.0f, ((1.0f / dot(float3(mad(-1.3677200078964233f, _2531, mad(3.5968499183654785f, _2530, 1.0f)), mad(9.229490280151367f, _2531, mad(-16.317399978637695f, _2530, 9.044010162353516f)), mad(-20.212299346923828f, _2531, mad(19.78860092163086f, _2530, 5.565889835357666f))), float3(1.0f, _2528, _2533))) * dot(float2(mad(3.3270699977874756f, _2529, 0.03654630109667778f), mad(-9.04755973815918f, _2529, 9.063199996948242f)), float2(1.0f, _2528)))), max(0.0f, ((1.0f / dot(float3(mad(59.418800354003906f, _2531, mad(2.923379898071289f, _2529, 1.0f)), mad(222.5919952392578f, _2531, mad(-27.03019905090332f, _2529, 20.322500228881836f)), mad(316.62701416015625f, _2531, mad(626.1300048828125f, _2529, 121.56300354003906f))), float3(1.0f, _2528, _2533))) * dot(float2(mad(-1.285140037536621f, _2529, 0.9904400110244751f), mad(-0.7559069991111755f, _2529, 1.296779990196228f)), float2(1.0f, _2528)))));
    __3__38__0__1__g_dlssRRDiffuseAlbedoUAV[int2(_52, _53)] = float4(saturate(((_2488 * 0.3395099937915802f) + (_2487 * 0.6131200194358826f)) + (_2489 * 0.047370001673698425f)), saturate(((_2488 * 0.9163600206375122f) + (_2487 * 0.07020000368356705f)) + (_2489 * 0.013450000435113907f)), saturate(((_2488 * 0.10958000272512436f) + (_2487 * 0.02061999961733818f)) + (_2489 * 0.8697999715805054f)), 1.0f);
    __3__38__0__1__g_dlssRRSpecularAlbedoUAV[int2(_52, _53)] = float4(_2560, _2560, _2560, 1.0f);
    __3__38__0__1__g_dlssRRNormalRoughnessUAV[int2(_52, _53)] = float4(_2516, _2517, _2518, _2509.w);
    SV_Target.x = (((((((_2360 * 0.6131200194358826f) + (min(60000.0f, _2274) * _2455)) + (_2361 * 0.3395099937915802f)) + (_2362 * 0.047370001673698425f)) + ((_2345 * exp2(_1886 * _523)) * (_2444 + _2282.x))) + select(_211, (_2447 * _2451.x), 0.0f)) + _2466.x);
    SV_Target.y = (((((((_2360 * 0.07020000368356705f) + (min(60000.0f, _2275) * _2455)) + (_2361 * 0.9163600206375122f)) + (_2362 * 0.013450000435113907f)) + ((_2345 * exp2(_1886 * _524)) * (_2445 + _2282.y))) + select(_211, (_2448 * _2451.y), 0.0f)) + _2466.y);
    SV_Target.z = (((((((_2360 * 0.02061999961733818f) + (min(60000.0f, _2276) * _2455)) + (_2361 * 0.10958000272512436f)) + (_2362 * 0.8697999715805054f)) + ((_2345 * exp2(_1886 * _525)) * (_2446 + _2282.z))) + select(_211, (_2449 * _2451.z), 0.0f)) + _2466.z);
    SV_Target.w = 1.0f;

    // RenoDX: Apply shadow on top of ice surface.
    // Vanilla only uses shadows to modulate the directional light entering the
    // in scattering integral so shadows are "underground".
    //
    // Apply a partial surface shadow to make it visible on top, but preserve
    // ambient contribution to avoid pure black shadows
    if (MATERIAL_IMPROVEMENTS == 1.f && _208 > 0.0f) {
      float _rndx_surface_shadow = min(_1039, _1111);
  
      // Shadow floor at 0.3: ambient still illuminates shadowed ice
      float _rndx_soft_shadow = max(0.3f, _rndx_surface_shadow);
      float3 _rndx_scene_through = float3(
        (_2345 * exp2(_1886 * _523)) * (_2444 + _2282.x),
        (_2345 * exp2(_1886 * _524)) * (_2445 + _2282.y),
        (_2345 * exp2(_1886 * _525)) * (_2446 + _2282.z)
      );
      SV_Target.xyz = (SV_Target.xyz - _rndx_scene_through) * _rndx_soft_shadow + _rndx_scene_through;
    }

    break;
  }
  return SV_Target;
}