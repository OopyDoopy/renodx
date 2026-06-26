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
  struct {
    float4 _voxelParams;
    float4 _invClipmapExtent;
    float4 _wrappedViewPosForInject;
    float4 _clipmapOffsetsForInject[8];
    float4 _clipmapRelativeIndexOffsetsForInject[8];
    float4 _wrappedViewPos;
    float4 _clipmapOffsets[8];
    float4 _clipmapOffsetsPrev[8];
    float4 _clipmapRelativeIndexOffsets[8];
    float4 _clipmapUVParams[2];
    float4 _clipmapUVRelativeOffset;
    uint4 _surfelTimestamps;
  } __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[48] : packoffset(c0);
  uint4 __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw_uint[48] : packoffset(c0);
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
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  uint _52;
  uint _53;
  float _55;
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
  float _1306;
  float _1307;
  float _1308;
  int _1351;
  int _1409;
  int _1488;
  int _1546;
  int _1548;
  int _1606;
  int _1664;
  float _1712;
  float _1713;
  float _1714;
  float _1715;
  float _1727;
  float _1728;
  float _1729;
  float _1730;
  float _1833;
  float _1844;
  float _2070;
  float _2124;
  float _2214;
  float _2215;
  float _2216;
  float _2260;
  float _2261;
  float _2262;
  float _2346;
  float _2347;
  float _2348;
  float _2430;
  float _2431;
  float _2432;
  float _2433;
  float _2434;
  float _2435;
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
  float _1272;
  float _1279;
  float _1291;
  float _1294;
  float _1300;
  float _1330;
  float _1332;
  float _1339;
  float _1343;
  float _1345;
  float _1347;
  float _1349;
  float4 _1353;
  float4 _1381;
  int _1391;
  int _1392;
  int _1393;
  int _1406;
  float _1423;
  float _1424;
  float _1425;
  float _1429;
  float _1430;
  float _1431;
  float _1433;
  float _1442;
  float4 _1445;
  float4 _1451;
  float _1467;
  float _1470;
  float _1472;
  float _1473;
  float _1474;
  int _1484;
  float4 _1490;
  float4 _1518;
  int _1528;
  int _1529;
  int _1530;
  int _1543;
  float _1554;
  float _1555;
  float _1556;
  float _1558;
  float _1567;
  float4 _1568;
  float4 _1573;
  float _1589;
  float _1592;
  float _1594;
  float _1595;
  float _1596;
  float4 _1608;
  float4 _1636;
  int _1646;
  int _1647;
  int _1648;
  int _1661;
  float _1668;
  float _1669;
  float _1670;
  float _1672;
  float _1681;
  float4 _1682;
  float4 _1687;
  float _1703;
  float _1706;
  float _1716;
  float _1768;
  float _1769;
  float _1770;
  float _1772;
  float _1773;
  float _1774;
  float _1777;
  float _1778;
  float _1779;
  float _1807;
  float _1808;
  float _1809;
  float _1815;
  float _1845;
  float _1855;
  float _1856;
  float _1857;
  float _1858;
  float _1872;
  float _1885;
  float _1886;
  float _1887;
  float _1889;
  float _1890;
  float _1891;
  float _1892;
  float _1893;
  float _1894;
  float _1896;
  float _1898;
  float _1899;
  float _1912;
  float _1915;
  float _1916;
  float _1918;
  float _1926;
  float _1936;
  float _1937;
  float _1938;
  float _1958;
  float _1960;
  float _1962;
  float _1964;
  float _1973;
  float _1980;
  float _1981;
  float _1982;
  float _1983;
  int _1994;
  int _2003;
  uint2 _2007;
  int _2014;
  float _2024;
  float _2025;
  float _2026;
  float _2028;
  float _2029;
  float _2030;
  float _2031;
  int _2033;
  int _2034;
  int _2036;
  int _2037;
  float _2038;
  float _2039;
  float _2040;
  float _2046;
  float _2047;
  float _2048;
  float _2049;
  float _2050;
  bool _2051;
  float _2071;
  float _2072;
  float _2077;
  float _2081;
  float _2082;
  float _2083;
  float _2085;
  float _2086;
  float _2087;
  float _2088;
  float _2089;
  float _2091;
  float _2093;
  float _2098;
  float _2099;
  float _2101;
  float _2116;
  float _2142;
  float _2143;
  float _2144;
  float _2145;
  float _2150;
  float _2151;
  float _2152;
  float _2153;
  float _2155;
  float _2159;
  float _2160;
  float _2161;
  float _2163;
  float _2164;
  float _2165;
  float _2166;
  float _2176;
  float _2179;
  float _2187;
  bool _2190;
  bool _2191;
  bool _2192;
  bool _2193;
  float _2208;
  float _2217;
  float _2218;
  float _2219;
  float _2221;
  float _2222;
  float _2223;
  float _2224;
  float _2225;
  float _2226;
  float _2230;
  float _2231;
  float _2233;
  float _2245;
  float _2252;
  float4 _2268;
  float _2293;
  float _2310;
  float _2311;
  float4 _2313;
  float4 _2318;
  float _2328;
  float _2329;
  float _2330;
  float _2331;
  float _2335;
  int _2362;
  int _2363;
  float _2403;
  float _2404;
  float _2405;
  float _2406;
  float _2419;
  float _2420;
  float _2421;
  float _2422;
  float _2425;
  float4 _2437;
  float _2441;
  float4 _2452;
  uint4 _2456;
  float _2462;
  float _2465;
  float _2469;
  float _2473;
  float _2474;
  float _2475;
  float4 _2495;
  float _2501;
  float _2502;
  float _2503;
  float _2504;
  float _2506;
  float _2514;
  float _2515;
  float _2516;
  float _2517;
  float _2519;
  float _2546;
  int __loop_jump_target = -1;
  _52 = uint(SV_Position.x);
  _53 = uint(SV_Position.y);
  _55 = __3__36__0__0__g_depthTranslucent.Load(int3(_52, _53, 0));  // [sem: _3__36__0__0__g_depthTranslucent_load]
  _58 = (TEXCOORD.x * 2.0f) + -1.0f;
  _60 = 1.0f - (TEXCOORD.y * 2.0f);
  _61 = max(1.0000000116860974e-07f, _55.x);  // [sem: _3__36__0__0__g_depthTranslucent_load_derived]
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
  _109 = __3__36__0__0__g_baseColor.Load(int3(_52, _53, 0));  // [sem: _3__36__0__0__g_baseColor_load]
  _113 = __3__36__0__0__g_normal.Load(int3(_52, _53, 0));  // [sem: _3__36__0__0__g_normal_load]
  _119 = (float)((uint)((uint)(_109.z & 255)));  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _120 = _119 * 0.003921568859368563f;
  _129 = ((int)(uint((_113.w * 3.0f) + 0.5f)) == 1);  // [sem: _3__36__0__0__g_normal_load_derived]
  _139 = (saturate(_113.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _140 = (saturate(_113.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _141 = (saturate(_113.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
  _143 = rsqrt(dot(float3(_139, _140, _141), float3(_139, _140, _141)));  // [sem: invLength]
  _144 = _143 * _139;
  _145 = _143 * _140;
  _146 = _141 * _143;
  _149 = (((float)((uint)((uint)(((uint)((uint)(_109.w)) >> 8) & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _150 = (((float)((uint)((uint)(_109.w & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
  _153 = (_149 + _150) * 0.5f;
  _154 = (_149 - _150) * 0.5f;
  _158 = (1.0f - abs(_153)) - abs(_154);
  _160 = rsqrt(dot(float3(_153, _154, _158), float3(_153, _154, _158)));  // [sem: invLength]
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
  _191 = rsqrt(dot(float3(_181, _185, _189), float3(_181, _185, _189)));  // [sem: invLength]
  _192 = _191 * _181;
  _193 = _191 * _185;
  _194 = _191 * _189;
  _196 = __3__36__0__0__g_character.Load(int3(_52, _53, 0));  // [sem: _3__36__0__0__g_character_load]
  _204 = (((uint2)(__3__36__0__0__g_stencilTranslucent.Load(int3(_52, _53, 0)))).x) & 127;
  _205 = (_204 == 24);
  _208 = select(_205, 1.0f, select((_204 == 25), 0.6000000238418579f, 0.0f));
  _210 = (_204 == 29);
  _211 = _129 || _210;
  _212 = select(_211, 1.0f, 0.0f);
  if (_129 && _210) {
    _220 = select((((int)(uint(_119)) & 128) != 0), 1.0f, 0.0f);
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
  _266 = max(1.0000000116860974e-07f, (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(_bufferSizeAndInvSize.x * select(((_237 & 1) == 0), _243, (1.0f - _243))), int(select(((_238 & 1) == 0), _244, (1.0f - _244)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215)))) * 5.960465188081798e-08f));
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
    _399 = saturate(_289 * 5.0f) * (0.33000004291534424f / (_280 + 1.0f));  // [sem: expr_sat]
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
  _444 = ((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(int(select(((_420 & 1) == 0), _426, (1.0f - _426)) * _bufferSizeAndInvSize.x), int(select(((_421 & 1) == 0), _427, (1.0f - _427)) * _bufferSizeAndInvSize.y), 0)))).x) & 16777215)))) * 5.960465188081798e-08f;
  _446 = (_405 * 2.0f) + -1.0f;
  _448 = 1.0f - (_406 * 2.0f);
  _449 = max(1.0000000116860974e-07f, _444);
  _465 = mad((_invViewProjRelative[2].w), _449, mad((_invViewProjRelative[1].w), _448, (_446 * (_invViewProjRelative[0].w)))) + (_invViewProjRelative[3].w);
  if (!(!(_444 >= _55.x))) {
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
  _487 = __3__36__0__0__g_extinction.Load(int3(_52, _53, 0));  // [sem: _3__36__0__0__g_extinction_load]
  _492 = _487.w * 10.0f;  // [sem: _3__36__0__0__g_extinction_load_derived]
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
  _587 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * ((float)((uint)_53))) + ((float)((uint)_52)));
  _595 = ((uint)((((int)((_587 << 4) + (uint)(-1383041155))) ^ ((int)(_587 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_587) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
  _603 = ((uint)((((int)((_595 << 4) + (uint)(-1556008596))) ^ ((int)(_595 + 1013904242u))) ^ (((uint)(_595) >> 5) + -939442524))) + _587;
  _611 = ((uint)((((int)((_603 << 4) + (uint)(-1383041155))) ^ ((int)(_603 + 1013904242u))) ^ ((int)(((uint)((uint)(_603) >> 5)) + 2123724318u)))) + _595;
  _619 = ((uint)((((int)((_611 << 4) + (uint)(-1556008596))) ^ ((int)(_611 + (uint)(-626627285)))) ^ (((uint)(_611) >> 5) + -939442524))) + _603;
  _627 = ((uint)((((int)((_619 << 4) + (uint)(-1383041155))) ^ ((int)(_619 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_619) >> 5)) + 2123724318u)))) + _611;
  _635 = ((uint)((((int)((_627 << 4) + (uint)(-1556008596))) ^ ((int)(_627 + 2027808484u))) ^ (((uint)(_627) >> 5) + -939442524))) + _619;
  _643 = ((uint)((((int)((_635 << 4) + (uint)(-1383041155))) ^ ((int)(_635 + 2027808484u))) ^ ((int)(((uint)((uint)(_635) >> 5)) + 2123724318u)))) + _627;
  _651 = ((uint)((((int)((_643 << 4) + (uint)(-1556008596))) ^ ((int)(_643 + 387276957u))) ^ (((uint)(_643) >> 5) + -939442524))) + _635;
  _659 = ((uint)((((int)((_651 << 4) + (uint)(-1383041155))) ^ ((int)(_651 + 387276957u))) ^ ((int)(((uint)((uint)(_651) >> 5)) + 2123724318u)))) + _643;
  _667 = ((uint)((((int)((_659 << 4) + (uint)(-1556008596))) ^ ((int)(_659 + (uint)(-1253254570)))) ^ (((uint)(_659) >> 5) + -939442524))) + _651;
  _675 = ((uint)((((int)((_667 << 4) + (uint)(-1383041155))) ^ ((int)(_667 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_667) >> 5)) + 2123724318u)))) + _659;
  _683 = ((uint)((((int)((_675 << 4) + (uint)(-1556008596))) ^ ((int)(_675 + 1401181199u))) ^ (((uint)(_675) >> 5) + -939442524))) + _667;
  _691 = ((uint)((((int)((_683 << 4) + (uint)(-1383041155))) ^ ((int)(_683 + 1401181199u))) ^ ((int)(((uint)((uint)(_683) >> 5)) + 2123724318u)))) + _675;
  _699 = ((uint)((((int)((_691 << 4) + (uint)(-1556008596))) ^ ((int)(_691 + (uint)(-239350328)))) ^ (((uint)(_691) >> 5) + -939442524))) + _683;
  _707 = ((uint)((((int)((_699 << 4) + (uint)(-1383041155))) ^ ((int)(_699 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_699) >> 5)) + 2123724318u)))) + _691;
  _709 = ((_699 & 16777215) == 0);
  if (_709) {
    _720 = ((int)(((uint)((((int)((_707 << 4) + (uint)(-1556008596))) ^ ((int)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
  } else {
    _720 = _699;
  }
  _735 = (mad((_dynamicShadowProjRelativeTexScale[1][2].x), _100, mad((_dynamicShadowProjRelativeTexScale[1][1].x), _99, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _98))) + (_dynamicShadowProjRelativeTexScale[1][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 9.834766956373642e-08f) * ((float)((uint)((uint)(((int)(_720 * 48271)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.z * 0.8250000476837158f));
  _736 = (mad((_dynamicShadowProjRelativeTexScale[1][2].y), _100, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _99, ((_dynamicShadowProjRelativeTexScale[1][0].y) * _98))) + (_dynamicShadowProjRelativeTexScale[1][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 9.834766956373642e-08f) * ((float)((uint)((uint)(((int)(_720 * -1964877855)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.w * 0.8250000476837158f));
  _737 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
  _738 = 1.0f - _737;
  if (!(((!(_735 >= _737)) || (!(_735 <= _738))) || (!(_736 <= _738)))) {
    _749 = (_572 >= -1.0f) && ((_572 <= 1.0f) && (_736 >= _737));
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
    _799 = ((int)(((uint)((((int)((_707 << 4) + (uint)(-1556008596))) ^ ((int)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
  } else {
    _799 = _699;
  }
  _814 = (mad((_dynamicShadowProjRelativeTexScale[0][2].x), _100, mad((_dynamicShadowProjRelativeTexScale[0][1].x), _99, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _98))) + (_dynamicShadowProjRelativeTexScale[0][3].x)) + (((_dynmaicShadowSizeAndInvSize.z * 1.9669533912747283e-07f) * ((float)((uint)((uint)(((int)(_799 * 48271)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.z * 1.6500000953674316f));
  _815 = (mad((_dynamicShadowProjRelativeTexScale[0][2].y), _100, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _99, ((_dynamicShadowProjRelativeTexScale[0][0].y) * _98))) + (_dynamicShadowProjRelativeTexScale[0][3].y)) + (((_dynmaicShadowSizeAndInvSize.w * 1.9669533912747283e-07f) * ((float)((uint)((uint)(((int)(_799 * -1964877855)) & 16777215))))) - (_dynmaicShadowSizeAndInvSize.w * 1.6500000953674316f));
  if (!(((!(_814 >= _737)) || (!(_814 <= _738))) || (!(_815 <= _738)))) {
    _826 = (_788 >= -1.0f) && ((_788 <= 1.0f) && (_815 >= _737));
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
      _896 = ((int)(((uint)((((int)((_707 << 4) + (uint)(-1556008596))) ^ ((int)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
    } else {
      _896 = _699;
    }
    _897 = _shadowSizeAndInvSize.z * 2.0f;
    _898 = _shadowSizeAndInvSize.w * 2.0f;
    _905 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
    _907 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
    _911 = (mad((_shadowProjRelativeTexScale[1][2].x), _857, mad((_shadowProjRelativeTexScale[1][1].x), _856, ((_shadowProjRelativeTexScale[1][0].x) * _855))) + (_shadowProjRelativeTexScale[1][3].x)) + ((((float)((uint)((uint)(((int)(_896 * 48271)) & 16777215)))) * _905) - _897);
    _912 = (mad((_shadowProjRelativeTexScale[1][2].y), _857, mad((_shadowProjRelativeTexScale[1][1].y), _856, ((_shadowProjRelativeTexScale[1][0].y) * _855))) + (_shadowProjRelativeTexScale[1][3].y)) + ((((float)((uint)((uint)(((int)(_896 * -1964877855)) & 16777215)))) * _907) - _898);
    _913 = 2.0f / _shadowSizeAndInvSize.y;
    _914 = 1.0f - _913;
    if (!(((!(_911 >= _913)) || (!(_911 <= _914))) || (!(_912 <= _914)))) {
      _925 = (_885 >= 9.999999747378752e-05f) && ((_885 <= 1.0f) && (_912 >= _913));
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
      _984 = ((int)(((uint)((((int)((_707 << 4) + (uint)(-1556008596))) ^ ((int)(_707 + (uint)(-1879881855)))) ^ (((uint)(_707) >> 5) + -939442524))) + _699));
    } else {
      _984 = _699;
    }
    _995 = (mad((_shadowProjRelativeTexScale[0][2].x), _945, mad((_shadowProjRelativeTexScale[0][1].x), _944, ((_shadowProjRelativeTexScale[0][0].x) * _943))) + (_shadowProjRelativeTexScale[0][3].x)) + ((((float)((uint)((uint)(((int)(_984 * 48271)) & 16777215)))) * _905) - _897);
    _996 = (mad((_shadowProjRelativeTexScale[0][2].y), _945, mad((_shadowProjRelativeTexScale[0][1].y), _944, ((_shadowProjRelativeTexScale[0][0].y) * _943))) + (_shadowProjRelativeTexScale[0][3].y)) + ((((float)((uint)((uint)(((int)(_984 * -1964877855)) & 16777215)))) * _907) - _898);
    if (!(((!(_995 >= _913)) || (!(_995 <= _914))) || (!(_996 <= _914)))) {
      _1007 = (_973 >= 9.999999747378752e-05f) && ((_973 <= 1.0f) && (_996 >= _913));
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
    _1024 = (float)((uint)_1020);
    if (_842) {
  // [sem: expr_sat]
      _1039 = saturate(1.0f - (((float4)(__3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1015, _1016, _1024), _1023))).x));
    } else {
  // [sem: expr_sat]
      _1039 = saturate(1.0f - (((float4)(__3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1015, _1016, _1024), _1023))).x));
    }
  } else {
    _1039 = 1.0f;  // [sem: expr_sat]
  }
  _1059 = mad((_terrainShadowProjRelativeTexScale[2].x), _100, mad((_terrainShadowProjRelativeTexScale[1].x), _99, ((_terrainShadowProjRelativeTexScale[0].x) * _98))) + (_terrainShadowProjRelativeTexScale[3].x);
  _1063 = mad((_terrainShadowProjRelativeTexScale[2].y), _100, mad((_terrainShadowProjRelativeTexScale[1].y), _99, ((_terrainShadowProjRelativeTexScale[0].y) * _98))) + (_terrainShadowProjRelativeTexScale[3].y);
  _1067 = mad((_terrainShadowProjRelativeTexScale[2].z), _100, mad((_terrainShadowProjRelativeTexScale[1].z), _99, ((_terrainShadowProjRelativeTexScale[0].z) * _98))) + (_terrainShadowProjRelativeTexScale[3].z);
  if (saturate(_1059) == _1059) {
    if ((_1067 >= 9.999999747378752e-05f) && ((_1067 <= 1.0f) && (saturate(_1063) == _1063))) {
      _1082 = frac((_1059 * 1024.0f) + -0.5f);
      _1086 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_1059, _1063));  // [sem: _3__36__0__0__g_terrainShadowDepth_gather]
      _1091 = _1067 + -0.004999999888241291f;
      _1096 = select((_1086.w > _1091), 1.0f, 0.0f);
      _1098 = select((_1086.x > _1091), 1.0f, 0.0f);
      _1105 = ((select((_1086.z > _1091), 1.0f, 0.0f) - _1096) * _1082) + _1096;
  // [sem: expr_sat]
      _1111 = saturate((((((select((_1086.y > _1091), 1.0f, 0.0f) - _1098) * _1082) + _1098) - _1105) * frac((_1063 * 1024.0f) + -0.5f)) + _1105);
    } else {
      _1111 = 1.0f;  // [sem: expr_sat]
    }
  } else {
    _1111 = 1.0f;  // [sem: expr_sat]
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
  _1158 = sqrt(((_107 * _107) + (_105 * _105)) + (_1152 * _1152));
  _1163 = dot(float3((_105 / _1158), (_1152 / _1158), (_107 / _1158)), float3(_1127, _1128, _1129));
  _1168 = min(max(((_1158 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
  _1176 = max(_1168, 0.0f);
  _1183 = (-0.0f - sqrt((_1176 + (_earthRadius * 2.0f)) * _1176)) / (_1176 + _earthRadius);
  if (_1163 > _1183) {
    _1206 = ((exp2(log2(saturate((_1163 - _1183) / (1.0f - _1183))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
  } else {
    _1206 = ((exp2(log2(saturate((_1183 - _1163) / (_1183 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
  }
  // [sem: _3__36__0__0__g_texNetDensity_sampleLod]
  _1211 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_1168 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _1206), 0.0f);
  _1233 = ((_1211.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);  // [sem: _3__36__0__0__g_texNetDensity_sampleLod_derived]
  _1251 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1252 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1253 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (((float)((uint)((uint)(_rayleighScatteringColor & 255)))) * 1.960784317134312e-07f)) * _1211.x) + _1233) * -1.4426950216293335f);
  _1272 = sqrt((_98 * _98) + (_100 * _100));
  _1279 = _cloudAltitude - (max(((_1272 * _1272) + -4e+05f), 0.0f) * 9.999999974752427e-07f);
  _1291 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_1128 > 0.0f))) - ((int)(uint)((int)(_1128 < 0.0f))))) * 0.5f))) + _1279;
  if (_106 < _1279) {
    _1294 = dot(float3(0.0f, 1.0f, 0.0f), float3(_1127, _1128, _1129));
    _1300 = select((abs(_1294) < 9.99999993922529e-09f), 1e+08f, ((_1291 - dot(float3(0.0f, 1.0f, 0.0f), float3(_105, _106, _107))) / _1294));
    _1306 = ((_1300 * _1127) + _105);
    _1307 = _1291;
    _1308 = ((_1300 * _1129) + _107);
  } else {
    _1306 = _105;
    _1307 = _106;
    _1308 = _107;
  }
  _1330 = saturate(abs(_1128) * 4.0f);  // [sem: expr_sat]
  _1332 = (_1330 * _1330) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3((((_1306 - _viewPos.x) * 4.999999873689376e-05f) + 0.5f), ((_1307 - _cloudAltitude) / _cloudThickness), (((_1308 - _viewPos.z) * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
  _1339 = ((1.0f - _1332) * saturate(((_106 - _cloudAltitude) - _cloudThickness) * 0.10000000149011612f)) + _1332;
  _1343 = _cubemapViewPosRelative.w * (_1149 * min(_1039, _1111));
  _1345 = (_1343 * (((_1252 * 0.3395099937915802f) + (_1251 * 0.6131200194358826f)) + (_1253 * 0.047370001673698425f))) * _1339;
  _1347 = (_1343 * (((_1252 * 0.9163600206375122f) + (_1251 * 0.07020000368356705f)) + (_1253 * 0.013450000435113907f))) * _1339;
  _1349 = (_1343 * (((_1252 * 0.10958000272512436f) + (_1251 * 0.02061999961733818f)) + (_1253 * 0.8697999715805054f))) * _1339;
  _1351 = 0;
  while(true) {
    _1353 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1351 + 20))];
    _1381 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1351 + 36))];
    _1391 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.x + _98) * _1353.w) + _1381.x));
    _1392 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.y + _99) * _1353.w) + _1381.y));
    _1393 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.z + _100) * _1353.w) + _1381.z));
    if (!(((((int)_1391 >= (int)int(_1353.x + -63.0f)) && ((int)_1391 < (int)int(_1353.x + 63.0f))) && (((int)_1392 >= (int)int(_1353.y + -31.0f)) && ((int)_1392 < (int)int(_1353.y + 31.0f)))) && (((int)_1393 >= (int)int(_1353.z + -63.0f)) && ((int)_1393 < (int)int(_1353.z + 63.0f))))) {
      _1406 = _1351 + 1;
      if ((uint)_1406 < (uint)8) {
        _1351 = _1406;
        continue;
      } else {
        _1409 = -10000;
      }
    } else {
      _1409 = _1351;
    }
    if ((uint)_1409 < (uint)3) {
      _1423 = (__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._invClipmapExtent.x * _98) + __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._clipmapUVRelativeOffset.x;
      _1424 = (__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._invClipmapExtent.y * _99) + __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._clipmapUVRelativeOffset.y;
      _1425 = (__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._invClipmapExtent.z * _100) + __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._clipmapUVRelativeOffset.z;
      _1429 = 1.0f / ((float)((uint)(1 << (_1409 & 31))));
      _1430 = _1423 * _1429;
      _1431 = _1424 * _1429;
      _1433 = frac(_1425 * _1429);
      _1442 = ((((float)((uint)(_1409 * 66))) + 1.0f) + ((select((_1433 < 0.0f), 1.0f, 0.0f) + _1433) * 64.0f)) * 0.0037878789007663727f;
  // [sem: _3__36__0__1__g_indirectCacheVoxels_sampleLod]
      _1445 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1430, _1431, _1442), 0.0f);
  // [sem: _3__36__0__1__g_indirectCacheChromaVoxels_sampleLod]
      _1451 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1430, _1431, _1442), 0.0f);
      _1467 = (max(0.0f, ((sqrt(((_1445.y * _1445.y) + (_1445.z * _1445.z)) + (_1445.w * _1445.w)) * 1.0233277082443237f) + (_1445.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1451.y * 0.5f);
      _1470 = _1467 - (_1451.x * 0.5f);
      _1472 = max(0.0f, (_1470 + _1451.x));
      _1473 = max(0.0f, (_1467 + _1451.y));
      _1474 = max(0.0f, _1470);
      [branch]
      if ((_1451.z == 0.0f) && (((_1472 == 0.0f) && (_1473 == 0.0f)) && (_1474 == 0.0f))) {
        _1484 = min((int)(3), (int)((_1409 + 1)));
        if ((uint)_1484 < (uint)8) {
          _1488 = _1484;
          while(true) {
            _1490 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((uint)(_1488 + 20u))];
            _1518 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((uint)(_1488 + 36u))];
            _1528 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.x + _98) * _1490.w) + _1518.x));
            _1529 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.y + _99) * _1490.w) + _1518.y));
            _1530 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.z + _100) * _1490.w) + _1518.z));
            if (!(((((int)_1528 >= (int)int(_1490.x + -63.0f)) && ((int)_1528 < (int)int(_1490.x + 63.0f))) && (((int)_1529 >= (int)int(_1490.y + -31.0f)) && ((int)_1529 < (int)int(_1490.y + 31.0f)))) && (((int)_1530 >= (int)int(_1490.z + -63.0f)) && ((int)_1530 < (int)int(_1490.z + 63.0f))))) {
              _1543 = _1488 + 1;
              if ((uint)_1543 < (uint)8) {
                _1488 = _1543;
                continue;
              } else {
                _1546 = -10000;
              }
            } else {
              _1546 = _1488;
            }
            _1548 = _1546;
            break;
          }
        } else {
          _1548 = -10000;
        }
        if ((uint)_1548 < (uint)4) {
          _1554 = 1.0f / ((float)((uint)(1 << (_1548 & 31))));
          _1555 = _1554 * _1423;
          _1556 = _1554 * _1424;
          _1558 = frac(_1554 * _1425);
          _1567 = ((((float)((uint)(_1548 * 66))) + 1.0f) + ((select((_1558 < 0.0f), 1.0f, 0.0f) + _1558) * 64.0f)) * 0.0037878789007663727f;
  // [sem: _3__36__0__1__g_indirectCacheVoxels_sampleLod]
          _1568 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1555, _1556, _1567), 0.0f);
  // [sem: _3__36__0__1__g_indirectCacheChromaVoxels_sampleLod]
          _1573 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1555, _1556, _1567), 0.0f);
          _1589 = (max(0.0f, ((sqrt(((_1568.y * _1568.y) + (_1568.z * _1568.z)) + (_1568.w * _1568.w)) * 1.0233277082443237f) + (_1568.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1573.y * 0.5f);
          _1592 = _1589 - (_1573.x * 0.5f);
          _1594 = max(0.0f, (_1592 + _1573.x));
          _1595 = max(0.0f, (_1589 + _1573.y));
          _1596 = max(0.0f, _1592);
          if ((_1573.z == 0.0f) && (((_1594 == 0.0f) && (_1595 == 0.0f)) && (_1596 == 0.0f))) {
            _1606 = 3;
            while(true) {
              _1608 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1606 + 20))];
              _1636 = __3__35__0__0__VoxelGlobalIlluminationConstantBuffer_raw[((int)(_1606 + 36))];
              _1646 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.x + _98) * _1608.w) + _1636.x));
              _1647 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.y + _99) * _1608.w) + _1636.y));
              _1648 = int(floor(((__3__35__0__0__VoxelGlobalIlluminationConstantBuffer_view._wrappedViewPos.z + _100) * _1608.w) + _1636.z));
              if (!(((((int)_1646 >= (int)int(_1608.x + -63.0f)) && ((int)_1646 < (int)int(_1608.x + 63.0f))) && (((int)_1647 >= (int)int(_1608.y + -31.0f)) && ((int)_1647 < (int)int(_1608.y + 31.0f)))) && (((int)_1648 >= (int)int(_1608.z + -63.0f)) && ((int)_1648 < (int)int(_1608.z + 63.0f))))) {
                _1661 = _1606 + 1;
                if ((uint)_1661 < (uint)8) {
                  _1606 = _1661;
                  continue;
                } else {
                  _1664 = -10000;
                }
              } else {
                _1664 = _1606;
              }
              _1668 = 1.0f / ((float)((uint)(1 << (_1664 & 31))));
              _1669 = _1668 * _1423;
              _1670 = _1668 * _1424;
              _1672 = frac(_1668 * _1425);
              _1681 = ((((float)((uint)(_1664 * 66))) + 1.0f) + ((select((_1672 < 0.0f), 1.0f, 0.0f) + _1672) * 64.0f)) * 0.0037878789007663727f;
  // [sem: _3__36__0__1__g_indirectCacheVoxels_sampleLod]
              _1682 = __3__36__0__1__g_indirectCacheVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1669, _1670, _1681), 0.0f);
  // [sem: _3__36__0__1__g_indirectCacheChromaVoxels_sampleLod]
              _1687 = __3__36__0__1__g_indirectCacheChromaVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_1669, _1670, _1681), 0.0f);
              _1703 = (max(0.0f, ((sqrt(((_1682.y * _1682.y) + (_1682.z * _1682.z)) + (_1682.w * _1682.w)) * 1.0233277082443237f) + (_1682.x * 0.886227548122406f))) * 1.3333308696746826f) - (_1687.y * 0.5f);
              _1706 = _1703 - (_1687.x * 0.5f);
              _1712 = max(0.0f, (_1706 + _1687.x));
              _1713 = max(0.0f, (_1703 + _1687.y));
              _1714 = max(0.0f, _1706);
              _1715 = _1687.z;
              break;
            }
          } else {
            _1712 = _1594;
            _1713 = _1595;
            _1714 = _1596;
            _1715 = _1573.z;
          }
        } else {
          _1712 = _1472;
          _1713 = _1473;
          _1714 = _1474;
          _1715 = _1451.z;
        }
      } else {
        _1712 = _1472;
        _1713 = _1473;
        _1714 = _1474;
        _1715 = _1451.z;
      }
      _1716 = max(0.009999999776482582f, _1715);
      _1727 = ((_1712 / _1716) * 3.1415927410125732f);
      _1728 = ((_1713 / _1716) * 3.1415927410125732f);
      _1729 = ((_1714 / _1716) * 3.1415927410125732f);
      _1730 = saturate((_280 + -64.0f) * 0.0078125f);  // [sem: expr_sat]
    } else {
      _1727 = 0.0f;
      _1728 = 0.0f;
      _1729 = 0.0f;
      _1730 = 1.0f;  // [sem: expr_sat]
    }
    _1768 = _193 * -1.0233277082443237f;
    _1769 = _194 * 1.0233277082443237f;
    _1770 = _192 * -1.0233277082443237f;
    _1772 = (_192 * 0.8580852150917053f) * _193;
    _1773 = _194 * -0.8580852150917053f;
    _1774 = _1773 * _193;
    _1777 = ((_194 * _194) * 0.7431248426437378f) + -0.2477082908153534f;
    _1778 = _1773 * _192;
    _1779 = ((_192 * _192) - (_193 * _193)) * 0.42904260754585266f;
    _1807 = _98 - _485;
    _1808 = _99 - _484;
    _1809 = _100 - _483;
    _1815 = sqrt(((_1808 * _1808) + (_1807 * _1807)) + (_1809 * _1809));
    if (_229 > 5000.0f) {
      _1833 = (((saturate(max((_229 + -5000.0f), 0.0f) * 0.0010000000474974513f) * 10.0f) * exp2(log2(frac(sin(dot(float2(_58, _60), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f)) * 0.45454543828964233f)) + _1815);
    } else {
      _1833 = _1815;
    }
    if (_211) {
      _1844 = ((saturate(_1833 * 10.0f) * ((_120 - _1833) + ((_1833 - _120) * ((float)((bool)_129))))) + _1833);
    } else {
      _1844 = _1833;
    }
    _1845 = _1844 * 2.0f;
    _1855 = -0.0f - max(9.999999747378752e-06f, ((_1845 * _523) / _1844));
    _1856 = -0.0f - max(9.999999747378752e-06f, ((_1845 * _524) / _1844));
    _1857 = -0.0f - max(9.999999747378752e-06f, ((_1845 * _525) / _1844));
    _1858 = _1844 * 1.4426950216293335f;
    _1872 = max(9.999999747378752e-06f, _1844) * -1.4426950216293335f;
    _1885 = _1127 + _231;
    _1886 = _1128 + _232;
    _1887 = _1129 + _233;
    _1889 = rsqrt(dot(float3(_1885, _1886, _1887), float3(_1885, _1886, _1887)));  // [sem: invLength]
    _1890 = _1889 * _1885;
    _1891 = _1889 * _1886;
    _1892 = _1889 * _1887;
    _1893 = dot(float3(_192, _193, _194), float3(_1127, _1128, _1129));
    _1894 = dot(float3(_192, _193, _194), float3(_1890, _1891, _1892));
    _1896 = dot(float3(_290, _291, _292), float3(_1127, _1128, _1129));
    _1898 = (_1896 * _1896) + 1.0f;
    _1899 = _1896 * 0.5f;
    _1912 = max(((_1898 / exp2(log2(1.0625f - _1899) * 1.5f)) * 0.05425736680626869f), ((_1898 / exp2(log2(_1899 + 1.0625f) * 1.5f)) * 0.05425736680626869f));
    _1915 = saturate(1.0f - saturate(dot(float3(_231, _232, _233), float3(_1890, _1891, _1892))));  // [sem: expr_sat]
    _1916 = _1915 * _1915;
    _1918 = (_1916 * _1916) * _1915;
    _1926 = (((dot(float3(_231, _232, _233), float3(_1127, _1128, _1129)) * 0.5f) + 0.5f) * _1844) + _1844;
    _1936 = -0.0f - max(9.999999747378752e-06f, ((_1926 * _523) / _1844));
    _1937 = -0.0f - max(9.999999747378752e-06f, ((_1926 * _524) / _1844));
    _1938 = -0.0f - max(9.999999747378752e-06f, ((_1926 * _525) / _1844));
    _1958 = (((_1912 * _1345) * ((exp2(_1858 * _1936) + -1.0f) / _1936)) + (((((max(0.0f, ((dot(float4(_1772, _1774, _1777, _1778), float4(_precomputedAmbient1.x, _precomputedAmbient1.y, _precomputedAmbient1.z, _precomputedAmbient1.w)) + dot(float4(0.886227548122406f, _1768, _1769, _1770), float4(_precomputedAmbient0.x, _precomputedAmbient0.y, _precomputedAmbient0.z, _precomputedAmbient0.w))) + (_precomputedAmbient6.x * _1779))) - _1727) * _1730) + _1727) * 0.2572200894355774f) * ((exp2(_1858 * _1855) + -1.0f) / _1855))) * (((_509 * 0.3395099937915802f) + (_508 * 0.6131200194358826f)) + (_510 * 0.047370001673698425f));
    _1960 = (((_1912 * _1347) * ((exp2(_1858 * _1937) + -1.0f) / _1937)) + (((((max(0.0f, ((dot(float4(0.886227548122406f, _1768, _1769, _1770), float4(_precomputedAmbient2.x, _precomputedAmbient2.y, _precomputedAmbient2.z, _precomputedAmbient2.w)) + (_precomputedAmbient6.y * _1779)) + dot(float4(_1772, _1774, _1777, _1778), float4(_precomputedAmbient3.x, _precomputedAmbient3.y, _precomputedAmbient3.z, _precomputedAmbient3.w)))) - _1728) * _1730) + _1728) * 0.2572200894355774f) * ((exp2(_1858 * _1856) + -1.0f) / _1856))) * (((_509 * 0.9163600206375122f) + (_508 * 0.07020000368356705f)) + (_510 * 0.013450000435113907f));
    _1962 = (((_1912 * _1349) * ((exp2(_1858 * _1938) + -1.0f) / _1938)) + (((((max(0.0f, ((dot(float4(0.886227548122406f, _1768, _1769, _1770), float4(_precomputedAmbient4.x, _precomputedAmbient4.y, _precomputedAmbient4.z, _precomputedAmbient4.w)) + (_precomputedAmbient6.z * _1779)) + dot(float4(_1772, _1774, _1777, _1778), float4(_precomputedAmbient5.x, _precomputedAmbient5.y, _precomputedAmbient5.z, _precomputedAmbient5.w)))) - _1729) * _1730) + _1729) * 0.2572200894355774f) * ((exp2(_1858 * _1857) + -1.0f) / _1857))) * (((_509 * 0.10958000272512436f) + (_508 * 0.02061999961733818f)) + (_510 * 0.8697999715805054f));
    _1964 = (_234 * 0.9995999932289124f) + 0.00039999998989515007f;
    _1973 = 1.0f - ((_1894 * _1894) * 0.9999998211860657f);
  // [sem: expr_sat]
    _1980 = saturate(_1893) * max((((0.5f / ((((_1893 * 0.9995999932289124f) + 0.00039999998989515007f) * _234) + (_1893 * _1964))) * (lerp(_1918, 1.0f, 0.03999999910593033f))) * (5.092957522379038e-08f / (_1973 * _1973))), 0.0f);
    _1981 = _1980 * _1345;
    _1982 = _1980 * _1347;
    _1983 = _1980 * _1349;
    if (_210) {
      _1994 = asint(__3__37__0__0__g_structureCounterBuffer.Load(4));
      _2003 = (int)(uint(_tiledRadianceCacheParams.x)) & 31;
  // [sem: _3__36__0__0__g_manyLightsHitData_load]
      _2007 = __3__36__0__0__g_manyLightsHitData.Load(int3(((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)) >> _2003), ((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)) >> _2003), 0));
      _2014 = select(((_2007.x | _2007.y) != 0), (((uint)((uint)(_2007.x)) >> 16) & 32767), 32767);
      if ((_2014 != 32767) && ((uint)_2014 < (uint)_1994)) {
        _2024 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._position.x;
        _2025 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._position.y;
        _2026 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._position.z;
        _2028 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._color.x;
        _2029 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._color.y;
        _2030 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._color.z;
        _2031 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._color.w;
        _2033 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._up.x;
        _2034 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._up.y;
        _2036 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._look.x;
        _2037 = __3__37__0__0__g_manyLightsDataBuffer[_2014]._look.y;
        _2038 = _2024 - _98;
        _2039 = _2025 - _99;
        _2040 = _2026 - _100;
        _2046 = sqrt(((_2038 * _2038) + (_2039 * _2039)) + (_2040 * _2040));
        _2047 = 1.0f / _2046;
        _2048 = _2047 * _2038;
        _2049 = _2047 * _2039;
        _2050 = _2047 * _2040;
        _2051 = (_2031 > 99999.0f);
        if (!_2051) {
          _2070 = min(min(512.0f, ((_cavityParams.w * 192.0f) + 128.0f)), ((((min(0.6000000238418579f, ((_cavityParams.w * 0.20000000298023224f) + 0.20000000298023224f)) * 0.25f) / max(9.999999974752427e-07f, (_exposure2.x * 8.0f))) * dot(float3(_2028, _2029, _2030), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f))) + 8.0f));
        } else {
          _2070 = _2031;
        }
        _2071 = abs(_2031);
        _2072 = _2046 * _2046;
        _2077 = select((_2071 > 99999.0f), 1.0f, (1.0f / max((_2071 * _2071), _2072)));
        _2081 = _2048 - _231;
        _2082 = _2049 - _232;
        _2083 = _2050 - _233;
        _2085 = rsqrt(dot(float3(_2081, _2082, _2083), float3(_2081, _2082, _2083)));  // [sem: invLength]
        _2086 = _2085 * _2081;
        _2087 = _2085 * _2082;
        _2088 = _2085 * _2083;
        _2089 = dot(float3(_144, _145, _146), float3(_2048, _2049, _2050));
        _2091 = saturate(dot(float3(_144, _145, _146), float3(_290, _291, _292)));  // [sem: expr_sat]
        _2093 = saturate(dot(float3(_144, _145, _146), float3(_2086, _2087, _2088)));  // [sem: expr_sat]
        if (!(_2089 <= 0.0f)) {
          _2098 = saturate(1.0f - dot(float3(_290, _291, _292), float3(_2086, _2087, _2088)));  // [sem: expr_sat]
          _2099 = _2098 * _2098;
          _2101 = (_2099 * _2099) * _2098;
          _2116 = 1.0f - ((_2093 * _2093) * 0.9900000095367432f);
          _2124 = (max((((0.0031830989755690098f / (_2116 * _2116)) * (0.5f / ((((_2091 * 0.9900000095367432f) + 0.010000000707805157f) * _2089) + (_2091 * ((_2089 * 0.9900000095367432f) + 0.010000000707805157f))))) * (lerp(_2101, 1.0f, 0.03999999910593033f))), 0.0f) * saturate(_2089));
        } else {
          _2124 = 0.0f;
        }
        if ((_2051) | ((_2046 < _2070) && (dot(float3(((_2077 * _2028) * _2124), ((_2077 * _2029) * _2124), ((_2077 * _2030) * _2124)), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) > (_exposure2.x * ((saturate(dot(float3(_viewPos.x, _viewPos.y, _viewPos.z), float3(_98, _99, _100)) * 0.015625f) * 0.09000000357627869f) + 0.009999999776482582f))))) {
          _2142 = select(_2051, 1.0f, saturate(select(_2051, 1.0f, (1.0f / max((_2031 * _2031), _2072))))) * ((float)((bool)(uint)((((float)((uint)((uint)(_2007.x & 65535)))) * 0.015609979629516602f) >= 1000.0f)));
          _2143 = _2142 * _2028;
          _2144 = _2142 * _2029;
          _2145 = _2142 * _2030;
          _2150 = f16tof32(((uint)(_2033 & 65535)));
          _2151 = f16tof32(((uint)((uint)(_2033) >> 16)));
          _2152 = f16tof32(((uint)(_2034 & 65535)));
          _2153 = f16tof32(((uint)((uint)(_2034) >> 16)));
          _2155 = rsqrt(dot(float3(_2150, _2151, _2152), float3(_2150, _2151, _2152)));  // [sem: invLength]
          _2159 = f16tof32(((uint)(_2036 & 65535)));
          _2160 = f16tof32(((uint)((uint)(_2036) >> 16)));
          _2161 = f16tof32(((uint)(_2037 & 65535)));
          _2163 = rsqrt(dot(float3(_2159, _2160, _2161), float3(_2159, _2160, _2161)));  // [sem: invLength]
          _2164 = _2163 * _2159;
          _2165 = _2163 * _2160;
          _2166 = _2163 * _2161;
          if (!(!(_2153 >= 0.0f))) {
            _2176 = mad(_2050, (_2155 * _2152), mad(_2049, (_2155 * _2151), ((_2150 * _2048) * _2155)));
            _2179 = mad(_2050, _2166, mad(_2049, _2165, (_2164 * _2048)));
            _2187 = atan((-0.0f - _2179) / (-0.0f - _2176));
            _2190 = (_2176 > -0.0f);
            _2191 = (_2176 == -0.0f);
            _2192 = (_2179 <= -0.0f);
            _2193 = (_2179 > -0.0f);
  // [sem: _3__36__0__0__g_lightProfile_sampleLod]
            _2208 = __3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_2048, _2049, _2050), float3(_2164, _2165, _2166))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select((_2191 && _2192), 0.5f, select((_2191 && _2193), -0.5f, (select((_2190 && _2193), (_2187 + -3.1415927410125732f), select((_2190 && _2192), (_2187 + 3.1415927410125732f), _2187)) * 0.31830987334251404f))))) * f16tof32(((uint)((uint)(_2037) >> 16)))) + _2153)), 0.0f);
            _2214 = (_2208.x * _2143);
            _2215 = (_2208.x * _2144);
            _2216 = (_2208.x * _2145);
          } else {
            _2214 = _2143;
            _2215 = _2144;
            _2216 = _2145;
          }
          _2217 = _2048 + _231;
          _2218 = _2049 + _232;
          _2219 = _2050 + _233;
          _2221 = rsqrt(dot(float3(_2217, _2218, _2219), float3(_2217, _2218, _2219)));  // [sem: invLength]
          _2222 = _2221 * _2217;
          _2223 = _2221 * _2218;
          _2224 = _2221 * _2219;
          _2225 = dot(float3(_192, _193, _194), float3(_2048, _2049, _2050));
          _2226 = dot(float3(_192, _193, _194), float3(_2222, _2223, _2224));
          _2230 = saturate(1.0f - saturate(dot(float3(_231, _232, _233), float3(_2222, _2223, _2224))));  // [sem: expr_sat]
          _2231 = _2230 * _2230;
          _2233 = (_2231 * _2231) * _2230;
          _2245 = 1.0f - ((_2226 * _2226) * 0.9999998211860657f);
  // [sem: expr_sat]
          _2252 = saturate(_2225) * max((((5.092957522379038e-08f / (_2245 * _2245)) * (0.5f / ((((_2225 * 0.9995999932289124f) + 0.00039999998989515007f) * _234) + (_2225 * _1964)))) * (lerp(_2233, 1.0f, 0.03999999910593033f))), 0.0f);
          _2260 = ((_2252 * _2214) + _1981);
          _2261 = ((_2252 * _2215) + _1982);
          _2262 = ((_2252 * _2216) + _1983);
        } else {
          _2260 = _1981;
          _2261 = _1982;
          _2262 = _1983;
        }
      } else {
        _2260 = _1981;
        _2261 = _1982;
        _2262 = _1983;
      }
    } else {
      _2260 = _1981;
      _2261 = _1982;
      _2262 = _1983;
    }
    _2268 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearMirror, float2(_472, _473), 0.0f);  // [sem: _3__36__0__0__g_sceneColor_sampleLod]
    _2293 = max(0.0f, (log2((max(0.0f, _229) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z;
    _2310 = min((1.0f - ((((float)((bool)(uint)((_bufferSizeAndInvSize.x - (_volumeSize.x * 4.0f)) > 0.0f))) + 0.5f) / _volumeSize.x)), _472);
    _2311 = min((1.0f - ((((float)((bool)(uint)((_bufferSizeAndInvSize.y - (_volumeSize.y * 4.0f)) > 0.0f))) + 0.5f) / _volumeSize.y)), _473);
  // [sem: _3__36__0__0__g_texFroxel_sampleLod]
    _2313 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2310, _2311, (max(0.0f, (log2((max(0.0f, sqrt(((_484 * _484) + (_485 * _485)) + (_483 * _483))) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z)), 0.0f);
  // [sem: _3__36__0__0__g_texFroxel_sampleLod]
    _2318 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2310, _2311, _2293), 0.0f);
    _2328 = max(0.0f, (_2313.x - _2318.x));
    _2329 = max(0.0f, (_2313.y - _2318.y));
    _2330 = max(0.0f, (_2313.z - _2318.z));
    _2331 = (1.0f / max(0.009999999776482582f, _2318.w)) * _2313.w;
    if (_129) {
      _2335 = saturate((_2293 + -0.75f) * 4.0f);  // [sem: expr_sat]
      _2346 = ((_2335 * (_1958 - _2328)) + _2328);
      _2347 = ((_2335 * (_1960 - _2329)) + _2329);
      _2348 = ((_2335 * (_1962 - _2330)) + _2330);
    } else {
      _2346 = _1958;
      _2347 = _1960;
      _2348 = _1962;
    }
    // RenoDX: >>> [Patch: RefractionNightInscatterAttenuation] [Version: 1.12.02]
    // Description: When RenoDX night sky attenuation is enabled, the visible sky is darkened separately from this refraction pass, so vanilla underwater/special-refraction in-scattering can remain too bright. This fades the computed refraction lighting terms by sun elevation before they are composed into the final color.
    if (NIGHT_SKY_ATTENUATION == 1.f) {
      float _nightFactor = saturate(-_sunDirection.y * 4.0f);
      float _nightAtten = lerp(1.0f, 0.15f, _nightFactor);
      _2346 *= _nightAtten;
      _2347 *= _nightAtten;
      _2348 *= _nightAtten;
    }
    // RenoDX: <<< [Patch: RefractionNightInscatterAttenuation]

    _2362 = int((_472 * _bufferSizeAndInvSize.x) + 0.5f);
    _2363 = int((_473 * _bufferSizeAndInvSize.y) + 0.5f);
    [branch]
    if (_205) {
      if (!(((((uint)(__3__36__0__0__g_sceneNormal.Load(int3(_2362, _2363, 0)))).x) & 1073741824) == 0)) {
        _2403 = exp2((saturate(_196.w) * 20.0f) + -8.0f) + -0.00390625f;  // [sem: _3__36__0__0__g_character_load_derived]
        _2404 = _2403 * select((_196.x < 0.040449999272823334f), (_196.x * 0.07739938050508499f), exp2(log2((_196.x + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2405 = _2403 * select((_196.y < 0.040449999272823334f), (_196.y * 0.07739938050508499f), exp2(log2((_196.y + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2406 = _2403 * select((_196.z < 0.040449999272823334f), (_196.z * 0.07739938050508499f), exp2(log2((_196.z + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
        _2419 = ((_2404 * 0.6131200194358826f) + (_2405 * 0.3395099937915802f)) + (_2406 * 0.047370001673698425f);
        _2420 = ((_2404 * 0.07020000368356705f) + (_2405 * 0.9163600206375122f)) + (_2406 * 0.013450000435113907f);
        _2421 = ((_2404 * 0.02061999961733818f) + (_2405 * 0.10958000272512436f)) + (_2406 * 0.8697999715805054f);
        _2422 = dot(float3(_2419, _2420, _2421), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        _2425 = max(_2422, 1.0f) / max(_2422, 0.10000000149011612f);
        _2430 = (_2419 * _2425);
        _2431 = (_2420 * _2425);
        _2432 = (_2421 * _2425);
        _2433 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
        _2434 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
        _2435 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      } else {
        _2430 = 0.0f;
        _2431 = 0.0f;
        _2432 = 0.0f;
        _2433 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
        _2434 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
        _2435 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      }
    } else {
      _2430 = 0.0f;
      _2431 = 0.0f;
      _2432 = 0.0f;
      _2433 = (_196.x * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
      _2434 = (_196.y * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
      _2435 = (_196.z * 4.0f);  // [sem: _3__36__0__0__g_character_load_derived]
    }
  // [sem: _3__36__0__0__g_texFroxelLight_sampleLod]
    _2437 = __3__36__0__0__g_texFroxelLight.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2310, _2311, _2293), 0.0f);
    _2441 = 1.0f - _220;
  // [sem: _3__36__0__0__g_sceneSpecular_sampleLod]
    _2452 = __3__36__0__0__g_sceneSpecular.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
    _2456 = __3__36__0__0__g_baseColor.Load(int3(_2362, _2363, 0));  // [sem: _3__36__0__0__g_baseColor_load]
    _2462 = ((float)((uint)((uint)(((uint)((uint)(_2456.x)) >> 8) & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _2465 = ((float)((uint)((uint)(_2456.x & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _2469 = ((float)((uint)((uint)(((uint)((uint)(_2456.y)) >> 8) & 255)))) * 0.003921568859368563f;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _2473 = saturate(_2462 * _2462);  // [sem: expr_sat]
    _2474 = saturate(_2465 * _2465);  // [sem: expr_sat]
    _2475 = saturate(_2469 * _2469);  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_dlssRRNormalRoughnessOpaque_sampleLod]
    _2495 = __3__36__0__0__g_dlssRRNormalRoughnessOpaque.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_472, _473), 0.0f);
    _2501 = rsqrt(dot(float3(_2495.x, _2495.y, _2495.z), float3(_2495.x, _2495.y, _2495.z)));  // [sem: invLength]
    _2502 = _2501 * _2495.x;
    _2503 = _2501 * _2495.y;
    _2504 = _2501 * _2495.z;
    _2506 = rsqrt(dot(float3(_485, _484, _483), float3(_485, _484, _483)));  // [sem: invLength]
    _2514 = _2495.w * _2495.w;
    _2515 = abs(dot(float3(_2502, _2503, _2504), float3((-0.0f - (_485 * _2506)), (-0.0f - (_484 * _2506)), (-0.0f - (_483 * _2506)))));
    _2516 = _2515 * _2515;
    _2517 = _2516 * _2515;
    _2519 = (_2514 * _2514) * _2514;
    _2546 = mad(0.03999999910593033f, max(0.0f, ((1.0f / dot(float3(mad(-1.3677200078964233f, _2517, mad(3.5968499183654785f, _2516, 1.0f)), mad(9.229490280151367f, _2517, mad(-16.317399978637695f, _2516, 9.044010162353516f)), mad(-20.212299346923828f, _2517, mad(19.78860092163086f, _2516, 5.565889835357666f))), float3(1.0f, _2514, _2519))) * dot(float2(mad(3.3270699977874756f, _2515, 0.03654630109667778f), mad(-9.04755973815918f, _2515, 9.063199996948242f)), float2(1.0f, _2514)))), max(0.0f, ((1.0f / dot(float3(mad(59.418800354003906f, _2517, mad(2.923379898071289f, _2515, 1.0f)), mad(222.5919952392578f, _2517, mad(-27.03019905090332f, _2515, 20.322500228881836f)), mad(316.62701416015625f, _2517, mad(626.1300048828125f, _2515, 121.56300354003906f))), float3(1.0f, _2514, _2519))) * dot(float2(mad(-1.285140037536621f, _2515, 0.9904400110244751f), mad(-0.7559069991111755f, _2515, 1.296779990196228f)), float2(1.0f, _2514)))));
    __3__38__0__1__g_dlssRRDiffuseAlbedoUAV[int2(_52, _53)] = float4(saturate(((_2474 * 0.3395099937915802f) + (_2473 * 0.6131200194358826f)) + (_2475 * 0.047370001673698425f)), saturate(((_2474 * 0.9163600206375122f) + (_2473 * 0.07020000368356705f)) + (_2475 * 0.013450000435113907f)), saturate(((_2474 * 0.10958000272512436f) + (_2473 * 0.02061999961733818f)) + (_2475 * 0.8697999715805054f)), 1.0f);
    __3__38__0__1__g_dlssRRSpecularAlbedoUAV[int2(_52, _53)] = float4(_2546, _2546, _2546, 1.0f);
    __3__38__0__1__g_dlssRRNormalRoughnessUAV[int2(_52, _53)] = float4(_2502, _2503, _2504, _2495.w);
    SV_Target.x = (((((((_2346 * 0.6131200194358826f) + (min(60000.0f, _2260) * _2441)) + (_2347 * 0.3395099937915802f)) + (_2348 * 0.047370001673698425f)) + ((_2331 * exp2(_1872 * _523)) * (_2430 + _2268.x))) + select(_211, (_2433 * _2437.x), 0.0f)) + _2452.x);
    SV_Target.y = (((((((_2346 * 0.07020000368356705f) + (min(60000.0f, _2261) * _2441)) + (_2347 * 0.9163600206375122f)) + (_2348 * 0.013450000435113907f)) + ((_2331 * exp2(_1872 * _524)) * (_2431 + _2268.y))) + select(_211, (_2434 * _2437.y), 0.0f)) + _2452.y);
    SV_Target.z = (((((((_2346 * 0.02061999961733818f) + (min(60000.0f, _2262) * _2441)) + (_2347 * 0.10958000272512436f)) + (_2348 * 0.8697999715805054f)) + ((_2331 * exp2(_1872 * _525)) * (_2432 + _2268.z))) + select(_211, (_2435 * _2437.z), 0.0f)) + _2452.z);
    SV_Target.w = 1.0f;
    // RenoDX: >>> [Patch: RefractionSurfaceShadowGate] [Version: 1.12.02]
    // Description: Material Improvements restores visible water/ice refraction surface shadowing, while vanilla mostly leaves this shadowing inside the in-scattering integral. The gate requires the special refraction path and optical thickness so thin stencil-only interior glass keeps native 1.12.02 blending.
    float _rndx_refraction_shadow_weight = saturate(_208 * float((bool)_211) * saturate((_1844 - 0.04f) * 16.0f));
    if (MATERIAL_IMPROVEMENTS == 1.f && _rndx_refraction_shadow_weight > 0.0f) {
      float _rndx_surface_shadow = min(_1039, _1111);
      float _rndx_soft_shadow = lerp(1.0f, max(0.3f, _rndx_surface_shadow), _rndx_refraction_shadow_weight);
      float3 _rndx_scene_through = float3(
        (_2331 * exp2(_1872 * _523)) * (_2430 + _2268.x),
        (_2331 * exp2(_1872 * _524)) * (_2431 + _2268.y),
        (_2331 * exp2(_1872 * _525)) * (_2432 + _2268.z)
      );
      SV_Target.xyz = (SV_Target.xyz - _rndx_scene_through) * _rndx_soft_shadow + _rndx_scene_through;
    }
    // RenoDX: <<< [Patch: RefractionSurfaceShadowGate]
    break;
  }
  return SV_Target;
}
