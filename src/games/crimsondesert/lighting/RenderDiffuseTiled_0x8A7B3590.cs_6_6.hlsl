#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"
#include "diffuse_brdf.hlsli"
#include "foliage_common.hlsli"
#include "purkinje_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t83, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t162, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t167, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t75, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t196, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t147, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t51, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t85, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t74, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t42, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t87, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t43, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t178, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t88, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t47, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t89, space36);

Texture2D<uint2> __3__36__0__0__g_stencilPrev : register(t153, space36);

Texture2D<half4> __3__36__0__0__g_sceneDiffuse : register(t154, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t23, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t24, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t8, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t25, space36);

Texture2D<float> __3__36__0__0__g_caustic : register(t26, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t6, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t27, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t19, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseHalfPrevUAV : register(u40, space38);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u10, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneSpecularUAV : register(u11, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u12, space38);

RWTexture2D<half4> __3__38__0__1__g_specularResultUAV : register(u13, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV : register(u18, space38);

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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b34, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WeatherConstantBuffer : register(b49, space35) {
  float _rain : packoffset(c000.x);
  float _windSpeed : packoffset(c000.y);
  float _puddleRate : packoffset(c000.z);
  float _humidity : packoffset(c000.w);
  float _puddleScale : packoffset(c001.x);
  float2 _windDir : packoffset(c001.y);
  float _snowAmount : packoffset(c001.w);
  float _snowDetail : packoffset(c002.x);
  float _iceRate : packoffset(c002.y);
  float _snowRate : packoffset(c002.z);
  uint _weatherCheckFlag : packoffset(c002.w);
  float2 _climateTextureOnePixelMeter : packoffset(c003.x);
  float2 _cloudScroll : packoffset(c003.z);
  int2 _climateTextureSize : packoffset(c004.x);
  float _heightScaleMin : packoffset(c004.z);
  float _heightScaleMax : packoffset(c004.w);
  float _temperatureSnowStart : packoffset(c005.x);
  float _temperatureSnowEnd : packoffset(c005.y);
  float _temperatureDeformableSnowStart : packoffset(c005.z);
  float _tempeartureDeformableSnowEnd : packoffset(c005.w);
  float _rainDropletAmount : packoffset(c006.x);
  float _rainDropletRate : packoffset(c006.y);
  float _puddleCloudAltitude : packoffset(c006.z);
  float _puddleCloudThickenss : packoffset(c006.w);
};

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b30, space35) {
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b31, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b33, space35) {
  uint4 __3__35__0__0__TileConstantBuffer_raw[4096];
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b0, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
};

cbuffer __3__1__0__0__WeatherShadingConstants : register(b1, space1) {
  int4 _paramWeather : packoffset(c000.x);
  float4 _paramShading : packoffset(c001.x);
  int2 _readBackBufferSize : packoffset(c002.x);
  float _readBackFieldSize : packoffset(c002.z);
  int _enableSandAO : packoffset(c002.w);
  float4 _blurSourceSize : packoffset(c003.x);
  float4 _blurTargetSize : packoffset(c004.x);
  float2 _paramGlobalSand : packoffset(c005.x);
  float2 _climateTextureRender : packoffset(c005.z);
};

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _renderParams : packoffset(c000.x);
  float4 _renderParams2 : packoffset(c001.x);
  float4 _cubemapViewPosRelative : packoffset(c002.x);
  float4 _lightingParams : packoffset(c003.x);
  float4 _tiledRadianceCacheParams : packoffset(c004.x);
  float _rtaoIntensity : packoffset(c005.x);
};

SamplerState __3__40__0__0__g_sampler : register(s1, space40);

SamplerState __3__40__0__0__g_samplerPoint : register(s4, space40);

SamplerState __0__4__0__0__g_staticBilinearWrapUWClampV : register(s1, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _61;
  int _62;
  int4 _70;
  int _80;
  uint _86;
  uint _88;
  float _91;
  float _92;
  float _96;
  float _97;
  float _99;
  uint2 _102;
  int _104;
  float _107;
  float _108;
  float _301;
  float _302;
  float _303;
  bool _319;
  bool _340;
  half _348;
  float _401;
  float _412;
  float _413;
  float _421;
  float _422;
  half _423;
  half _424;
  half _425;
  half _426;
  half _427;
  bool _461;
  float _470;
  float _511;
  float _512;
  float _599;
  float _677;
  float _850;
  float _851;
  float _852;
  float _853;
  float _1018;
  int _1019;
  float _1076;
  float _1192;
  float _1193;
  float _1194;
  float _1195;
  float _1222;
  half _1247;
  bool _1259;
  half _1266;
  float _1534;
  float _1551;
  float _1555;
  float _1583;
  float _1626;
  float _1627;
  float _1628;
  float _1629;
  float _1633;
  float _1634;
  float _1635;
  float _1636;
  float _1639;
  float _1640;
  float _1641;
  float _1642;
  half _1643;
  float _1789;
  int _1790;
  int _1791;
  float _1792;
  float _1793;
  float _1794;
  float _1795;
  float _1924;
  float _1925;
  float _1926;
  float _1986;
  float _1996;
  float _1997;
  float _1998;
  bool _2072;
  bool _2073;
  float _2109;
  float _2110;
  float _2111;
  float _2112;
  float _2178;
  float _2181;
  float _2182;
  float _2183;
  float _2184;
  float _2219;
  float _2220;
  float _2221;
  float _2236;
  float _2265;
  float _2266;
  float _2267;
  float _2268;
  float _2269;
  half _2276;
  half _2277;
  half _2278;
  half _2279;
  half _2280;
  float _2281;
  half _2317;
  half _2318;
  half _2319;
  float _2334;
  float _2335;
  float _2336;
  float _2356;
  float _2416;
  float _2513;
  float _2514;
  float _2515;
  bool _2578;
  bool _2587;
  bool _2590;
  bool _2591;
  int _2605;
  float _2648;
  float _2649;
  float _2650;
  bool _2729;
  float _2737;
  float _2748;
  float _2783;
  float _2790;
  float _2791;
  float _2792;
  float _2841;
  float _2842;
  float _2843;
  float _2852;
  float _2896;
  half _2948;
  half _2949;
  half _2950;
  float _2960;
  bool _3113;
  float _3149;
  float _3150;
  float _3151;
  float _3165;
  float _3166;
  float _3167;
  float _3186;
  float _3187;
  float _3188;
  uint4 _116;
  float4 _122;
  half _131;
  half _135;
  half _140;
  half _149;
  uint _165;
  bool _166;
  bool _167;
  float _177;
  float _178;
  float _179;
  float _181;
  half _186;
  half _187;
  half _190;
  half _191;
  float _196;
  float _197;
  float _201;
  float _203;
  float _210;
  float _211;
  float _212;
  float _214;
  float _217;
  float _218;
  float _219;
  float _220;
  float _227;
  float _228;
  float _229;
  half _241;
  half _242;
  half _243;
  half _245;
  half _246;
  half _247;
  half _248;
  half _252;
  half _253;
  half _254;
  half _270;
  half _271;
  half _272;
  bool _274;
  bool _275;
  float _282;
  float _283;
  float _284;
  float4 _305;
  bool _309;
  float _326;
  float _327;
  float _328;
  float _350;
  float _352;
  float _388;
  float _389;
  float _390;
  float _391;
  float _393;
  bool _395;
  uint _403;
  half _414;
  bool _416;
  float _428;
  float _429;
  float _430;
  float _431;
  float _432;
  float _433;
  float _434;
  float _435;
  float _436;
  float _438;
  bool _440;
  uint _464;
  float _498;
  float2 _505;
  float _514;
  float _517;
  float _518;
  float _526;
  float _531;
  float _532;
  int _535;
  int _536;
  float _537;
  float _538;
  float _541;
  float _542;
  int4 _545;
  int _568;
  float _607;
  float _608;
  float _609;
  float _610;
  float _614;
  float _631;
  float _632;
  float _635;
  bool _650;
  float _652;
  float _654;
  bool _658;
  bool _686;
  float _687;
  float _692;
  float _693;
  float _694;
  float _695;
  float _696;
  float _697;
  float _698;
  float _699;
  float _701;
  float _714;
  float _715;
  float _716;
  float _717;
  int _718;
  bool _722;
  int _723;
  int _724;
  int _725;
  int _726;
  bool _765;
  bool _766;
  bool _767;
  bool _768;
  bool _781;
  bool _790;
  bool _812;
  int4 _855;
  float _874;
  float _875;
  float _876;
  float _878;
  float _883;
  float _898;
  float _899;
  float _900;
  float _902;
  float _907;
  float _922;
  float _923;
  float _924;
  float _926;
  float _931;
  float _946;
  float _947;
  float _948;
  float _950;
  float _955;
  bool _956;
  bool _958;
  float _960;
  float _977;
  float _978;
  float _979;
  float _980;
  float _985;
  float _987;
  float _989;
  float _991;
  float _993;
  float _994;
  float _995;
  float _996;
  uint _1006;
  int _1008;
  int _1010;
  float _1029;
  uint _1030;
  uint _1037;
  float _1053;
  float _1062;
  float _1067;
  float _1080;
  float _1085;
  float4 _1096;
  float _1100;
  float _1102;
  float _1103;
  float _1104;
  float _1105;
  float _1106;
  float _1107;
  float _1149;
  float _1166;
  float _1167;
  float _1168;
  float _1172;
  float _1187;
  float _1204;
  float _1205;
  float _1206;
  float _1213;
  float _1214;
  float _1215;
  float _1223;
  float _1229;
  float _1239;
  float _1240;
  float _1241;
  float _1268;
  float _1272;
  float _1273;
  float _1274;
  float _1276;
  float _1277;
  float _1278;
  float _1279;
  float _1282;
  float _1284;
  float _1286;
  float _1287;
  float _1288;
  float _1289;
  float _1294;
  float _1299;
  float _1301;
  float _1303;
  float _1327;
  float _1331;
  float _1335;
  float _1339;
  float _1377;
  float _1378;
  float _1379;
  float _1383;
  float _1419;
  float _1430;
  float _1431;
  float _1432;
  float _1433;
  float _1437;
  float _1438;
  float _1439;
  float _1455;
  float _1456;
  float _1457;
  float _1458;
  float _1459;
  float _1460;
  float _1461;
  bool _1464;
  float _1466;
  float _1470;
  float _1471;
  float _1475;
  float _1480;
  float _1490;
  float _1494;
  float _1499;
  float _1525;
  float _1536;
  float _1542;
  bool _1543;
  float _1560;
  float _1573;
  half _1586;
  float _1604;
  float _1613;
  float _1614;
  float _1615;
  float _1616;
  float _1617;
  float _1618;
  float _1619;
  float _1620;
  float _1644;
  float _1645;
  float _1646;
  float _1659;
  float _1660;
  float _1661;
  float _1662;
  float _1687;
  float _1688;
  float _1689;
  float _1690;
  float _1703;
  float _1706;
  float _1707;
  float _1717;
  float _1718;
  int _1721;
  int _1722;
  float _1723;
  float _1724;
  int4 _1734;
  int _1741;
  float _1773;
  float _1774;
  float _1775;
  float _1776;
  bool _1796;
  uint _1797;
  float _1812;
  uint _1818;
  float _1832;
  float _1855;
  float _1878;
  float _1902;
  float _1904;
  float _1906;
  float _1908;
  float _1909;
  float _1912;
  float _1919;
  float _1927;
  float _1928;
  float _1929;
  float _1942;
  float _1952;
  float _1953;
  float _1954;
  float _1962;
  float _1967;
  bool _1968;
  int _1970;
  bool _1989;
  float _1990;
  float2 _2003;
  float _2014;
  float _2044;
  float4 _2053;
  bool _2083;
  float4 _2103;
  float _2119;
  float _2122;
  float _2135;
  float _2136;
  float _2137;
  float _2142;
  float _2147;
  float _2158;
  float _2176;
  float _2188;
  bool _2189;
  float _2192;
  float _2237;
  float _2238;
  float _2239;
  float _2244;
  float _2247;
  float _2254;
  float _2255;
  uint _2289;
  float _2305;
  float _2306;
  float _2307;
  float _2309;
  bool _2322;
  float _2362;
  float _2366;
  float _2368;
  float _2373;
  float _2378;
  float _2386;
  float _2393;
  float2 _2420;
  float _2442;
  float _2460;
  float _2461;
  float _2462;
  float _2478;
  float _2486;
  float _2498;
  float _2501;
  float _2507;
  float _2524;
  float _2535;
  float _2537;
  float _2544;
  float _2545;
  float _2546;
  float _2547;
  float _2563;
  float _2564;
  float _2565;
  float _2568;
  float _2569;
  float _2570;
  bool _2581;
  float _2592;
  float _2593;
  float _2594;
  uint16_t _2598;
  float _2610;
  float _2611;
  float _2612;
  float _2613;
  float4 _2620;
  float _2624;
  float _2629;
  float _2630;
  float _2631;
  float _2633;
  float _2634;
  float _2635;
  float _2636;
  float _2651;
  float _2652;
  float _2653;
  float _2654;
  float _2655;
  float _2656;
  float _2658;
  float _2659;
  float _2660;
  float _2661;
  float _2662;
  float _2663;
  float _2665;
  float _2667;
  float _2670;
  float _2672;
  float _2673;
  float _2674;
  float _2675;
  float _2676;
  float _2677;
  float _2678;
  float _2681;
  float _2682;
  float _2683;
  float _2688;
  float _2689;
  float _2717;
  int _2718;
  bool _2738;
  float _2739;
  float _2740;
  float _2741;
  float _2754;
  float _2764;
  float _2765;
  float _2766;
  float _2767;
  bool _2768;
  bool _2771;
  float _2784;
  float _2795;
  float _2796;
  float _2798;
  float _2801;
  float _2802;
  float _2810;
  float _2811;
  float _2823;
  float _2827;
  float _2859;
  float _2860;
  float _2861;
  uint _2864;
  bool _2879;
  float _2914;
  float _2918;
  float _2919;
  float _2920;
  float _2923;
  half _2930;
  half _2931;
  half _2932;
  float _2951;
  float _2952;
  float _2953;
  float _2961;
  float _2967;
  float _2974;
  float _2975;
  float _2976;
  float _2977;
  float _2978;
  float _2979;
  float _2983;
  float _2984;
  float _2985;
  float _2987;
  float _2994;
  float _2995;
  float _2996;
  float _3013;
  float _3014;
  float _3015;
  float _3016;
  float _3027;
  half _3037;
  half _3038;
  half _3039;
  float _3042;
  float _3044;
  float _3054;
  float _3055;
  float _3056;
  float _3060;
  float _3061;
  float _3062;
  float _3084;
  float _3085;
  float _3086;
  float _3091;
  float _3152;
  float _3153;
  float _3154;
  float4 _3157;
  float _3176;
  float _3177;
  float _3181;
  int _48[4];
  _61 = (uint)(SV_GroupID.x) & 15;
  _62 = (uint)(_61) >> 2;
  _70 = asint(__3__35__0__0__TileConstantBuffer_raw[((int)((uint)(SV_GroupID.x) >> 6))]);
  _48[0] = (int)(_70.x);
  _48[1] = (int)(_70.y);
  _48[2] = (int)(_70.z);
  _48[3] = (int)(_70.w);
  _80 = _48[(((uint)(SV_GroupID.x) >> 4) & 3)];
  _86 = (((int)(((uint)(_80 << 5)) & 2097120)) + SV_GroupThreadID.x) + ((int)((_61 - (_62 << 2)) << 3));
  _88 = (((int)(_62 << 3)) + SV_GroupThreadID.y) + ((int)(((uint)(_80) >> 16) << 5));
  _91 = float((uint)_86) + 0.5f;
  _92 = float((uint)_88) + 0.5f;
  _96 = _bufferSizeAndInvSize.z * _91;
  _97 = _92 * _bufferSizeAndInvSize.w;
  _99 = __3__36__0__0__g_depth.Load(int3(_86, _88, 0));
  _102 = __3__36__0__0__g_stencil.Load(int3(_86, _88, 0));
  _104 = _102.x & 127;
  _107 = max(1.0000000116860974e-07f, _99.x);
  _108 = _nearFarProj.x / _107;
  if (!(((bool)((bool)(_99.x < 1.0000000116860974e-07f) || (bool)(_99.x == 1.0f))) || (bool)(_104 == 10))) {
    _116 = __3__36__0__0__g_baseColor.Load(int3(_86, _88, 0));
    _122 = __3__36__0__0__g_normal.Load(int3(_86, _88, 0));
    _131 = half(float((uint)((int)(((uint)((int)(_116.x)) >> 8) & 255))) * 0.003921568859368563f);
    _135 = half(float((uint)((int)(_116.x & 255))) * 0.003921568859368563f);
    _140 = half(float((uint)((int)(((uint)((int)(_116.y)) >> 8) & 255))) * 0.003921568859368563f);
    _149 = half(float((uint)((int)(((uint)((int)(_116.z)) >> 8) & 255))) * 0.003921568859368563f);
    _165 = uint((_122.w * 3.0f) + 0.5f);
    _166 = (_165 == 1);
    _167 = (_165 == 3);
    _177 = (saturate(_122.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _178 = (saturate(_122.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _179 = (saturate(_122.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _181 = rsqrt(dot(float3(_177, _178, _179), float3(_177, _178, _179)));
    _186 = half(_181 * _178);
    _187 = half(_179 * _181);
    _190 = ((half)((half)(half(float((uint)((int)(((uint)((int)(_116.w)) >> 8) & 255))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _191 = ((half)((half)(half(float((uint)((int)(_116.w & 255))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _196 = float(_190 + _191) * 0.5f;
    _197 = float(_190 - _191) * 0.5f;
    _201 = (1.0f - abs(_196)) - abs(_197);
    _203 = rsqrt(dot(float3(_196, _197, _201), float3(_196, _197, _201)));
    _210 = float(half(_181 * _177));
    _211 = float(_186);
    _212 = float(_187);
    _214 = select((_187 >= 0.0h), 1.0f, -1.0f);
    _217 = -0.0f - (1.0f / (_214 + _212));
    _218 = _211 * _217;
    _219 = _218 * _210;
    _220 = _214 * _210;
    _227 = float(half(_203 * _196));
    _228 = float(half(_203 * _197));
    _229 = float(half(_203 * _201));
    _241 = half(mad(_229, _210, mad(_228, _219, (_227 * (((_220 * _210) * _217) + 1.0f)))));
    _242 = half(mad(_229, _211, mad(_228, ((_218 * _211) + _214), ((_227 * _214) * _219))));
    _243 = half(mad(_229, _212, mad(_228, (-0.0f - _211), (-0.0f - (_220 * _227)))));
    _245 = rsqrt((half)(dot(half3(_241, _242, _243), half3(_241, _242, _243))));
    _246 = _245 * _241;
    _247 = _245 * _242;
    _248 = _245 * _243;
    _252 = saturate((half)(_131 * _131));
    _253 = saturate((half)(_135 * _135));
    _254 = saturate((half)(_140 * _140));
    _270 = saturate((half)(((half)(((half)(_253 * 0.3395996h)) + ((half)(_252 * 0.61328125h)))) + ((half)(_254 * 0.04736328h))));
    _271 = saturate((half)(((half)(((half)(_253 * 0.9165039h)) + ((half)(_252 * 0.07019043h)))) + ((half)(_254 * 0.013450623h))));
    _272 = saturate((half)(((half)(((half)(_253 * 0.109558105h)) + ((half)(_252 * 0.020614624h)))) + ((half)(_254 * 0.8696289h))));
    _274 = (_104 == 29);
    _275 = (bool)(_104 == 24) || _274;
    half4 _278 = __3__36__0__0__g_diffuseResult.Load(int3(_86, _88, 0));
    _282 = float(_278.x);
    _283 = float(_278.y);
    _284 = float(_278.z);
    [branch]
    if (_renderParams2.y > 0.0f) {
      half4 _290 = __3__36__0__0__g_sceneDiffuse.Load(int3(_86, _88, 0));
      _301 = (float(_290.x) + _282);
      _302 = (float(_290.y) + _283);
      _303 = (float(_290.z) + _284);
    } else {
      _301 = _282;
      _302 = _283;
      _303 = _284;
    }
    _305 = __3__36__0__0__g_specularResult.Load(int3(_86, _88, 0));
    _309 = ((uint)_104 > (uint)11);
    if (_309) {
      if (!((bool)((uint)_104 < (uint)21) || (bool)(_104 == 107))) {
        _319 = (_104 == 7);
      } else {
        _319 = true;
      }
    } else {
      if (!(_104 == 6)) {
        _319 = (_104 == 7);
      } else {
        _319 = true;
      }
    }
    _326 = -0.0f - min(0.0f, (-0.0f - _301));
    _327 = -0.0f - min(0.0f, (-0.0f - _302));
    _328 = -0.0f - min(0.0f, (-0.0f - _303));
    half2 _330 = __3__36__0__0__g_sceneAO.Load(int3(_86, _88, 0));
    if (_309) {
      if ((uint)_104 < (uint)20) {
        _348 = 0.0h;
      } else {
        _340 = ((uint)_104 < (uint)19);
        if ((bool)(_104 == 65) || ((bool)(((bool)((bool)(_104 == 107) || (bool)(_104 == 96))) || _340))) {
          _348 = 0.0h;
        } else {
          _348 = (half)(select(_275, 0.0f, (half)(half(float((uint)((int)(_116.y & 255))) * 0.003921568859368563f))));
        }
      }
    } else {
      if ((uint)_104 > (uint)10) {
        _348 = 0.0h;
      } else {
        _340 = false;
        if ((bool)(_104 == 65) || ((bool)(((bool)((bool)(_104 == 107) || (bool)(_104 == 96))) || _340))) {
          _348 = 0.0h;
        } else {
          _348 = (half)(select(_275, 0.0f, (half)(half(float((uint)((int)(_116.y & 255))) * 0.003921568859368563f))));
        }
      }
    }
    _350 = (_96 * 2.0f) + -1.0f;
    _352 = 1.0f - (_97 * 2.0f);
    _388 = mad((_invViewProjRelative[2].w), _107, mad((_invViewProjRelative[1].w), _352, ((_invViewProjRelative[0].w) * _350))) + (_invViewProjRelative[3].w);
    _389 = (mad((_invViewProjRelative[2].x), _107, mad((_invViewProjRelative[1].x), _352, ((_invViewProjRelative[0].x) * _350))) + (_invViewProjRelative[3].x)) / _388;
    _390 = (mad((_invViewProjRelative[2].y), _107, mad((_invViewProjRelative[1].y), _352, ((_invViewProjRelative[0].y) * _350))) + (_invViewProjRelative[3].y)) / _388;
    _391 = (mad((_invViewProjRelative[2].z), _107, mad((_invViewProjRelative[1].z), _352, ((_invViewProjRelative[0].z) * _350))) + (_invViewProjRelative[3].z)) / _388;
    _393 = rsqrt(dot(float3(_389, _390, _391), float3(_389, _390, _391)));
    _395 = ((uint)(_102.x & 24) > (uint)23);
    if (_395) {
      if (_274) {
        _401 = float(saturate(_149));
      } else {
        _401 = 0.0f;
      }
      _403 = uint((half)((half)(half(float((uint)((int)(_116.z & 255))) * 0.003921568859368563f)) * 255.0h));
      if (_166) {
        _412 = select(((_403 & 128) != 0), 1.0f, 0.0f);
        _413 = (float((uint)((int)(_403 & 127))) * 0.007874015718698502f);
      } else {
        _412 = 0.0f;
        _413 = 0.0f;
      }
      _414 = half(_413);
      _416 = (_414 > 0.99902344h);
      _421 = _412;
      _422 = _401;
      _423 = _414;
      _424 = (half)(select(_275, 0.010002136f, _149));
      _425 = (half)(select(_416, 1.0f, _270));
      _426 = (half)(select(_416, 1.0f, _271));
      _427 = (half)(select(_416, 1.0f, _272));
    } else {
      _421 = 0.0f;
      _422 = 0.0f;
      _423 = _348;
      _424 = _149;
      _425 = _270;
      _426 = _271;
      _427 = _272;
    }
    // RenoDX: Dynamic foliage colour correction
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_104 - 12) < 7u)) {
      float3 _fcBaseColor = float3(float(_425), float(_426), float(_427));
      half4 _fcShadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_86, _88, 0));
      float _fcShadowVis = saturate(float(_fcShadow.x) * 0.2126f + float(_fcShadow.y) * 0.7152f + float(_fcShadow.z) * 0.0722f);
      float3 _fcCorrected = FoliageColorCorrect(_fcBaseColor, _sunDirection.xyz, _fcShadowVis, float3(1.0f, 1.0f, 1.0f));
      _425 = half(_fcCorrected.x);
      _426 = half(_fcCorrected.y);
      _427 = half(_fcCorrected.z);
    }
    // RenoDX: Foliage selective colour
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_104 - 12) < 7u)) {
      float3 _fscColor = FoliageSelectiveColor(float3(float(_425), float(_426), float(_427)));
      _425 = half(_fscColor.x);
      _426 = half(_fscColor.y);
      _427 = half(_fscColor.z);
    }
    _428 = float(_246);
    _429 = float(_247);
    _430 = float(_248);
    _431 = _393 * _389;
    _432 = -0.0f - _431;
    _433 = _393 * _390;
    _434 = -0.0f - _433;
    _435 = _393 * _391;
    _436 = -0.0f - _435;
    _438 = saturate(dot(float3(_432, _434, _436), float3(_428, _429, _430)));
    _440 = ((_102.x & 128) == 0);
    if (_440) {
      if ((uint)_104 > (uint)52) {
        if (!((bool)((_102.x & 125) == 105) || (bool)((uint)_104 < (uint)68))) {
          _461 = (_104 == 98);
        } else {
          _461 = true;
        }
      } else {
        if ((uint)_104 > (uint)10) {
          if ((uint)_104 < (uint)20) {
            if ((_102.x & 126) == 14) {
              _461 = (_104 == 98);
            } else {
              _461 = true;
            }
          } else {
            if (!((_102.x & 125) == 105)) {
              _461 = (_104 == 98);
            } else {
              _461 = true;
            }
          }
        } else {
          _461 = (_104 == 98);
        }
      }
    } else {
      _461 = true;
    }
    [branch]
    if (_395) {
      _464 = __3__36__0__0__g_depthOpaque.Load(int3(_86, _88, 0));
      _470 = (float((uint)((int)(_464.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _470 = _99.x;
    }
    _498 = mad((_projToPrevProj[2].w), _470, mad((_projToPrevProj[1].w), _352, ((_projToPrevProj[0].w) * _350))) + (_projToPrevProj[3].w);
    if (_461) {
      _505 = __3__36__0__0__g_velocity.Load(int3(_86, _88, 0));
      _511 = (_505.x * 2.0f);
      _512 = (_505.y * 2.0f);
    } else {
      _511 = (((mad((_projToPrevProj[2].x), _470, mad((_projToPrevProj[1].x), _352, ((_projToPrevProj[0].x) * _350))) + (_projToPrevProj[3].x)) / _498) - _350);
      _512 = (((mad((_projToPrevProj[2].y), _470, mad((_projToPrevProj[1].y), _352, ((_projToPrevProj[0].y) * _350))) + (_projToPrevProj[3].y)) / _498) - _352);
    }
    _514 = _nearFarProj.x / max(1.0000000116860974e-07f, _470);
    _517 = (_511 * 0.5f) + _96;
    _518 = _97 - (_512 * 0.5f);
    _526 = select((((bool)((bool)(_517 < 0.0f) || (bool)(_517 > 1.0f))) || ((bool)((bool)(_518 < 0.0f) || (bool)(_518 > 1.0f)))), 1.0f, 0.0f);
    _531 = (_517 * _bufferSizeAndInvSize.x) + -0.5f;
    _532 = (_518 * _bufferSizeAndInvSize.y) + -0.5f;
    _535 = int(floor(_531));
    _536 = int(floor(_532));
    _537 = float((int)(_535));
    _538 = float((int)(_536));
    _541 = (_537 + 0.5f) * _bufferSizeAndInvSize.z;
    _542 = (_538 + 0.5f) * _bufferSizeAndInvSize.w;
    _545 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_541, _542));
    _568 = mad(((uint)((int)(_545.w)) >> 24), 16777216, mad(((uint)((int)(_545.z)) >> 24), 65536, mad(((uint)((int)(_545.y)) >> 24), 256, ((uint)((int)(_545.x)) >> 24))));
    if (_440) {
      if ((uint)_104 > (uint)52) {
        if (!((bool)(_104 == 98) || ((bool)((bool)((_102.x & 125) == 105) || (bool)((uint)_104 < (uint)68))))) {
          _599 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _599 = 0.0f;
        }
      } else {
        if ((uint)_104 > (uint)10) {
          if ((uint)_104 < (uint)20) {
            if ((_102.x & 126) == 14) {
              _599 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _599 = 0.0f;
            }
          } else {
            if (!((_102.x & 125) == 105)) {
              _599 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _599 = 0.0f;
            }
          }
        } else {
          _599 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _599 = 0.0f;
    }
    _607 = _screenPercentage.x * 2.0f;
    _608 = _607 * abs(_96 + -0.5f);
    _609 = _screenPercentage.y * 2.0f;
    _610 = _609 * abs(_97 + -0.5f);
    _614 = sqrt(dot(float2(_608, _610), float2(_608, _610)) + 1.0f) * _514;
    _631 = _607 * abs(_517 + -0.5f);
    _632 = _609 * abs(_518 + -0.5f);
    _635 = sqrt(dot(float2(_631, _632), float2(_631, _632)) + 1.0f);
    _650 = (bool)((uint)(_104 + -97) < (uint)2) || _319;
    _652 = _514 * _514;
    _654 = (_652 * select(_650, 0.5f, 0.20000000298023224f)) + 1.0f;
    _658 = ((uint)(_104 + -53) < (uint)15);
    if (_658) {
      _677 = (1000.0f - (saturate(float((bool)(bool)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _677 = 50.0f;
    }
    _686 = (bool)(_104 == 57) || _658;
    _687 = select(_686, 0.0f, ((max(0.0f, (_514 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    _692 = max(0.0f, (abs(_614 - (_635 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_545.x & 16777215))) * 5.960465188081798e-08f))) - _599))) - _687));
    _693 = max(0.0f, (abs(_614 - (_635 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_545.y & 16777215))) * 5.960465188081798e-08f))) - _599))) - _687));
    _694 = max(0.0f, (abs(_614 - (_635 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_545.z & 16777215))) * 5.960465188081798e-08f))) - _599))) - _687));
    _695 = max(0.0f, (abs(_614 - (_635 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_545.w & 16777215))) * 5.960465188081798e-08f))) - _599))) - _687));
    _696 = _692 * _692;
    _697 = _693 * _693;
    _698 = _694 * _694;
    _699 = _695 * _695;
    _701 = (-1.4426950216293335f / ((_652 * 0.10000000149011612f) + 1.0f)) * select(_650, 0.20000000298023224f, _677);
    _714 = select((_696 > _654), 0.0f, exp2(_696 * _701));
    _715 = select((_697 > _654), 0.0f, exp2(_697 * _701));
    _716 = select((_698 > _654), 0.0f, exp2(_698 * _701));
    _717 = select((_699 > _654), 0.0f, exp2(_699 * _701));
    _718 = _102.x & 126;
    if (!_395) {
      _722 = (bool)(_718 == 66) || (bool)(_104 == 54);
      _723 = _568 & 127;
      _724 = _568 & 32512;
      _725 = _568 & 8323072;
      _726 = _568 & 2130706432;
      _765 = (bool)(_723 == 57) || (bool)((uint)(_723 + -53) < (uint)15);
      _766 = (bool)(_724 == 14592) || (bool)((uint)((((uint)(_568) >> 8) & 127) + -53) < (uint)15);
      _767 = (bool)(_725 == 3735552) || (bool)((uint)((((uint)(_568) >> 16) & 127) + -53) < (uint)15);
      _768 = (bool)(_726 == 956301312) || (bool)((uint)((((uint)(_568) >> 24) & 127) + -53) < (uint)15);
      _781 = _686 || ((bool)(!_440));
      _790 = (_104 == 6);
      _812 = ((uint)(_104 + -105) < (uint)3);
      _850 = (float((bool)((bool)(((bool)(_722 || ((bool)((bool)(_723 != 54) && (bool)((_568 & 126) != 66))))) && ((bool)(!(((bool)(((bool)(_790 ^ (_723 == 6))) || ((bool)(((bool)(_686 ^ _765)) || ((bool)(_812 ^ ((bool)(_723 == 107) || (bool)((uint)(_723 + -105) < (uint)2)))))))) || ((bool)(((bool)((_568 & 128) != 0) || _765) ^ _781)))))))) * _714);
      _851 = (float((bool)((bool)(((bool)(_722 || ((bool)((bool)(_724 != 13824) && (bool)((_568 & 32256) != 16896))))) && ((bool)(!(((bool)(((bool)(_790 ^ (_724 == 1536))) || ((bool)(((bool)(_812 ^ ((bool)((_568 & 32000) == 26880) || (bool)(_724 == 27136)))) || ((bool)(_686 ^ _766)))))) || ((bool)(((bool)((_568 & 32768) != 0) || _766) ^ _781)))))))) * _715);
      _852 = (float((bool)((bool)(((bool)(_722 || ((bool)((bool)(_725 != 3538944) && (bool)((_568 & 8257536) != 4325376))))) && ((bool)(!(((bool)(((bool)(_790 ^ (_725 == 393216))) || ((bool)(((bool)(_812 ^ ((bool)((_568 & 8192000) == 6881280) || (bool)(_725 == 6946816)))) || ((bool)(_686 ^ _767)))))) || ((bool)(((bool)((_568 & 8388608) != 0) || _767) ^ _781)))))))) * _716);
      _853 = (float((bool)((bool)(((bool)(_722 || ((bool)((bool)(_726 != 905969664) && (bool)((_568 & 2113929216) != 1107296256))))) && ((bool)(!(((bool)(((bool)(_790 ^ (_726 == 100663296))) || ((bool)(((bool)(_812 ^ ((bool)((_568 & 2097152000) == 1761607680) || (bool)(_726 == 1778384896)))) || ((bool)(_686 ^ _768)))))) || ((bool)(((bool)((int)_568 < (int)0) || _768) ^ _781)))))))) * _717);
    } else {
      _850 = _714;
      _851 = _715;
      _852 = _716;
      _853 = _717;
    }
    _855 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_541, _542));
    _874 = min(1.0f, ((float((uint)((int)(_855.w & 1023))) * 0.001956947147846222f) + -1.0f));
    _875 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _876 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _878 = rsqrt(dot(float3(_874, _875, _876), float3(_874, _875, _876)));
    _883 = saturate(dot(float3(_428, _429, _430), float3((_878 * _874), (_878 * _875), (_878 * _876))));
    _898 = min(1.0f, ((float((uint)((int)(_855.z & 1023))) * 0.001956947147846222f) + -1.0f));
    _899 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _900 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _902 = rsqrt(dot(float3(_898, _899, _900), float3(_898, _899, _900)));
    _907 = saturate(dot(float3(_428, _429, _430), float3((_902 * _898), (_902 * _899), (_902 * _900))));
    _922 = min(1.0f, ((float((uint)((int)(_855.x & 1023))) * 0.001956947147846222f) + -1.0f));
    _923 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _924 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _926 = rsqrt(dot(float3(_922, _923, _924), float3(_922, _923, _924)));
    _931 = saturate(dot(float3(_428, _429, _430), float3((_926 * _922), (_926 * _923), (_926 * _924))));
    _946 = min(1.0f, ((float((uint)((int)(_855.y & 1023))) * 0.001956947147846222f) + -1.0f));
    _947 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _948 = min(1.0f, ((float((uint)((int)(((uint)((int)(_855.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _950 = rsqrt(dot(float3(_946, _947, _948), float3(_946, _947, _948)));
    _955 = saturate(dot(float3(_428, _429, _430), float3((_950 * _946), (_950 * _947), (_950 * _948))));
    _956 = (_718 == 66);
    _958 = (_104 == 54);
    _960 = select((_958 || ((bool)(_650 || _956))), 0.009999999776482582f, 1.0f);
    _977 = _531 - _537;
    _978 = _532 - _538;
    _979 = 1.0f - _977;
    _980 = 1.0f - _978;
    _985 = (_979 * _978) * _850;
    _987 = (_978 * _977) * _851;
    _989 = (_980 * _977) * _852;
    _991 = (_980 * _979) * _853;
    _993 = saturate(select(_395, 1.0f, (pow(_931, _960))) * _985);
    _994 = saturate(select(_395, 1.0f, (pow(_955, _960))) * _987);
    _995 = saturate(select(_395, 1.0f, (pow(_907, _960))) * _989);
    _996 = saturate(select(_395, 1.0f, (pow(_883, _960))) * _991);
    [branch]
    if (!(WaveReadLaneFirst((int)(asint(__3__37__0__0__g_structureCounterBuffer.Load(8))).x) == 0)) {
      _1006 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((uint)(_86 >> 5)), ((uint)(_88 >> 5)), 0));
      _1008 = _1006.x & 4;
      _1010 = (uint)(_1008) >> 2;
      if (!(_1008 == 0)) {
        _1018 = max((saturate(dot(float3(_326, _327, _328), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _526);
        _1019 = _1010;
      } else {
        _1018 = _526;
        _1019 = _1010;
      }
    } else {
      _1018 = _526;
      _1019 = 0;
    }
    _1029 = saturate(max(_1018, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    _1030 = _536 + 1u;
    half4 _1032 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_535, _1030, 0));
    _1037 = _535 + 1u;
    half4 _1038 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1037, _1030, 0));
    half4 _1043 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1037, _536, 0));
    half4 _1048 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_535, _536, 0));
    _1053 = dot(float4(_993, _994, _995, _996), float4(1.0f, 1.0f, 1.0f, 1.0f));
    _1062 = saturate(dot(float4(_993, _994, _995, _996), float4(float(_1032.w), float(_1038.w), float(_1043.w), float(_1048.w))) * (1.0f / max(1.0f, _1053)));
    _1067 = sqrt((_512 * _512) + (_511 * _511)) * 50.0f;
    if (_658) {
      _1076 = saturate(1.0f - _1067);
    } else {
      _1076 = (1.0f - (saturate(_1067) * 0.5f));
    }
    _1080 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    _1085 = (_1062 * _1062) * 4.0f;
    _1096 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_96, _97), 0.0f);
    _1100 = saturate(_1096.w);
    _1102 = 1.0f / max(9.999999974752427e-07f, _1053);
    _1103 = _1102 * _993;
    _1104 = _1102 * _994;
    _1105 = _1102 * _995;
    _1106 = _1102 * _996;
    _1107 = saturate(saturate(max(_1029, (1.0f / ((saturate(_1085) * min(31.0f, ((_1076 * 15.0f) * _1080))) + 1.0f))) + _renderParams.z));
    _1149 = 1.0f / _exposure4.x;
    _1166 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1106 * float(_1048.x)) + ((_1105 * float(_1043.x)) + ((_1103 * float(_1032.x)) + (_1104 * float(_1038.x))))))) * _exposure4.y)))));
    _1167 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1106 * float(_1048.y)) + ((_1105 * float(_1043.y)) + ((_1103 * float(_1032.y)) + (_1104 * float(_1038.y))))))) * _exposure4.y)))));
    _1168 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1106 * float(_1048.z)) + ((_1105 * float(_1043.z)) + ((_1103 * float(_1032.z)) + (_1104 * float(_1038.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      _1172 = dot(float3(_1166, _1167, _1168), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _1187 = ((min(_1172, _1096.y) / max(9.999999974752427e-07f, _1172)) * _1100) + saturate(1.0f - _1100);
      _1192 = saturate((saturate(((_1096.x - _1172) * 5.0f) / max(9.999999974752427e-07f, _1096.x)) * 0.5f) + _1107);
      _1193 = (_1187 * _1166);
      _1194 = (_1187 * _1167);
      _1195 = (_1187 * _1168);
    } else {
      _1192 = _1107;
      _1193 = _1166;
      _1194 = _1167;
      _1195 = _1168;
    }
    _1204 = ((_326 - _1193) * _1192) + _1193;
    _1205 = ((_327 - _1194) * _1192) + _1194;
    _1206 = ((_328 - _1195) * _1192) + _1195;
    __3__38__0__1__g_diffuseResultUAV[int2(_86, _88)] = float4((half)(half(_1204)), (half)(half(_1205)), (half)(half(_1206)), (half)(half(saturate(_1062 + 0.0625f))));
    _1213 = float(_425);
    _1214 = float(_426);
    _1215 = float(_427);
    if (_104 == 53) {
      _1222 = saturate(((_1214 + _1213) + _1215) * 1.2000000476837158f);
    } else {
      _1222 = 1.0f;
    }
    _1223 = float(_423);
    _1229 = (0.699999988079071f / min(max(max(max(_1213, _1214), _1215), 0.009999999776482582f), 0.699999988079071f)) * _1222;
    _1239 = (((_1229 * _1213) + -0.03999999910593033f) * _1223) + 0.03999999910593033f;
    _1240 = (((_1229 * _1214) + -0.03999999910593033f) * _1223) + 0.03999999910593033f;
    _1241 = (((_1229 * _1215) + -0.03999999910593033f) * _1223) + 0.03999999910593033f;
    if (!_395) {
      _1247 = (half)(saturate((half)(1.0h - (half)(_330.x))));
    } else {
      _1247 = 1.0h;
    }
    // RenoDX: Foliage AO — DISABLED (vanilla already applies AO for stencils 12-18).
    // _395 is false for stencils 12-18, so vanilla path already sets _1247 = saturate(1.0h - _330.x).
    if (!((bool)(_104 == 98) || (bool)(_718 == 96))) {
      if ((uint)(_104 + -105) < (uint)2) {
        _1259 = _166;
        _1266 = (half)(select(((bool)(_104 == 65) || ((bool)((bool)(_104 == 107) || _1259))), 0.0f, _423));
      } else {
        if (!((uint)(_104 + -11) < (uint)9)) {
          _1259 = false;
          _1266 = (half)(select(((bool)(_104 == 65) || ((bool)((bool)(_104 == 107) || _1259))), 0.0f, _423));
        } else {
          _1266 = 0.0h;
        }
      }
    } else {
      _1266 = 0.0h;
    }
    _1268 = dot(float3(_431, _433, _435), float3(_428, _429, _430)) * 2.0f;
    _1272 = _431 - (_1268 * _428);
    _1273 = _433 - (_1268 * _429);
    _1274 = _435 - (_1268 * _430);
    _1276 = rsqrt(dot(float3(_1272, _1273, _1274), float3(_1272, _1273, _1274)));
    _1277 = _1272 * _1276;
    _1278 = _1273 * _1276;
    _1279 = _1274 * _1276;
    _1282 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97), 0.0f);
    _1284 = float(_424);
    _1286 = select((_1284 < 0.800000011920929f), _1282.x, 0.0f);
    _1287 = _1286 * _1277;
    _1288 = _1286 * _1278;
    _1289 = _1286 * _1279;
    _1294 = dot(float3(_1287, _1288, _1289), float3((-0.0f - _428), (-0.0f - _429), (-0.0f - _430))) * 2.0f;
    _1299 = ((_1294 * _428) + _389) + _1287;
    _1301 = ((_1294 * _429) + _390) + _1288;
    _1303 = ((_1294 * _430) + _391) + _1289;
    _1327 = mad((_viewProjRelative[2].x), _1303, mad((_viewProjRelative[1].x), _1301, (_1299 * (_viewProjRelative[0].x)))) + (_viewProjRelative[3].x);
    _1331 = mad((_viewProjRelative[2].y), _1303, mad((_viewProjRelative[1].y), _1301, (_1299 * (_viewProjRelative[0].y)))) + (_viewProjRelative[3].y);
    _1335 = mad((_viewProjRelative[2].z), _1303, mad((_viewProjRelative[1].z), _1301, (_1299 * (_viewProjRelative[0].z)))) + (_viewProjRelative[3].z);
    _1339 = mad((_viewProjRelative[2].w), _1303, mad((_viewProjRelative[1].w), _1301, (_1299 * (_viewProjRelative[0].w)))) + (_viewProjRelative[3].w);
    _1377 = mad((_projToPrevProj[3].w), _1339, mad((_projToPrevProj[2].w), _1335, mad((_projToPrevProj[1].w), _1331, ((_projToPrevProj[0].w) * _1327))));
    _1378 = mad((_projToPrevProj[3].x), _1339, mad((_projToPrevProj[2].x), _1335, mad((_projToPrevProj[1].x), _1331, ((_projToPrevProj[0].x) * _1327)))) / _1377;
    _1379 = mad((_projToPrevProj[3].y), _1339, mad((_projToPrevProj[2].y), _1335, mad((_projToPrevProj[1].y), _1331, ((_projToPrevProj[0].y) * _1327)))) / _1377;
    _1383 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[3].z), _1339, mad((_projToPrevProj[2].z), _1335, mad((_projToPrevProj[1].z), _1331, ((_projToPrevProj[0].z) * _1327)))) / _1377));
    _1419 = mad((_invViewProjRelativePrev[2].w), _1383, mad((_invViewProjRelativePrev[1].w), _1379, ((_invViewProjRelativePrev[0].w) * _1378))) + (_invViewProjRelativePrev[3].w);
    _1430 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[2].x), _1383, mad((_invViewProjRelativePrev[1].x), _1379, ((_invViewProjRelativePrev[0].x) * _1378))) + (_invViewProjRelativePrev[3].x)) / _1419) - _1299);
    _1431 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[2].y), _1383, mad((_invViewProjRelativePrev[1].y), _1379, ((_invViewProjRelativePrev[0].y) * _1378))) + (_invViewProjRelativePrev[3].y)) / _1419) - _1301);
    _1432 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _1383, mad((_invViewProjRelativePrev[1].z), _1379, ((_invViewProjRelativePrev[0].z) * _1378))) + (_invViewProjRelativePrev[3].z)) / _1419) - _1303);
    _1433 = dot(float3(_1430, _1431, _1432), float3(_1277, _1278, _1279));
    _1437 = _1430 - (_1433 * _1277);
    _1438 = _1431 - (_1433 * _1278);
    _1439 = _1432 - (_1433 * _1279);
    _1455 = (saturate(_1286 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_1437 * _1437) + (_1438 * _1438)) + (_1439 * _1439)) / max(0.0010000000474974513f, _1286))) + -1.0f)) + 1.0f;
    _1456 = _1455 * _1455;
    _1457 = _1456 * _1456;
    _1458 = _1457 * _931;
    _1459 = _1457 * _955;
    _1460 = _1457 * _907;
    _1461 = _1457 * _883;
    _1464 = (_renderParams.z > 0.0f);
    _1466 = float(1.0h - _424);
    _1470 = (_1378 - (_1327 / _1339)) - _511;
    _1471 = (_1379 - (_1331 / _1339)) - _512;
    _1475 = sqrt((_1471 * _1471) + (_1470 * _1470));
    _1480 = saturate((((_1466 * _1466) * (1.0f - (_438 * 0.8999999761581421f))) * _1475) * select(_1464, 2000.0f, 500.0f));
    _1490 = select((((bool)(_274 || _395)) || ((bool)((bool)(_718 == 24) || (bool)(_renderParams.y > 0.0f)))), 1.0f, float(_330.y));
    // RenoDX: Foliage specular AO — DISABLED (vanilla already applies _330.y for stencils 12-18).
    _1494 = float(_1266);
    _1499 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    _1525 = saturate(saturate(1.0f - (((_1494 * _108) / max(0.0010000000474974513f, _438)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_1499 * 0.07500000298023224f)) + max(0.019999999552965164f, _1284)) + (saturate(_108 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_108 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_1494) * 0.75f)));
    if (_104 == 64) {
      _1534 = ((saturate(_108 * 0.25f) * (_1525 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _1534 = _1525;
    }
    _1536 = (_1499 * 16.0f) + 16.0f;
    _1542 = select((_1499 > 1.0f), 0.0f, saturate((1.0f / _1536) * (_108 - _1536)));
    _1543 = (_104 == 105);
    if (_1543) {
      _1551 = 1.0f;
      _1555 = select((_104 == 65), 0.0f, _1551);
    } else {
      if (!_395) {
        _1551 = select((_104 == 107), 1.0f, ((_1542 + _1534) - (_1542 * _1534)));
        _1555 = select((_104 == 65), 0.0f, _1551);
      } else {
        _1555 = 0.0f;
      }
    }
    _1560 = select(_686, 31.0f, 63.0f);
    if (!_274) {
      _1573 = (saturate((2000.0f - (saturate(float(_1266 * 0.5h) + (_108 * 0.0625f)) * 1500.0f)) * _1475) * (7.0f - _1560)) + _1560;
      if ((uint)(_104 + -12) < (uint)9) {
        _1583 = ((saturate(_108 * 0.004999999888241291f) * (_1573 + -2.0f)) + 2.0f);
      } else {
        _1583 = _1573;
      }
    } else {
      _1583 = _1560;
    }
    _1586 = max(0.040008545h, _424);
    _1604 = saturate(max(max(_1029, select(_1464, (_1480 + 0.125f), 0.0f)), (1.0f / (((saturate((_1080 * _1080) * _1085) * min(64.0f, (_1583 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _1555) + (_108 * 0.0078125f)) + float(((half)(_1586 * _1586)) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    if ((uint)_104 > (uint)52) {
      if ((uint)_104 < (uint)68) {
        if (_956) {
          _1633 = _1458;
          _1634 = _1459;
          _1635 = _1460;
          _1636 = _1461;
          _1639 = _1633;
          _1640 = _1634;
          _1641 = _1635;
          _1642 = _1636;
          _1643 = (half)(max(0.89990234h, _424));
        } else {
          if (!_958) {
            _1613 = _1458 * _1458;
            _1614 = _1459 * _1459;
            _1615 = _1460 * _1460;
            _1616 = _1461 * _1461;
            _1617 = _1613 * _1613;
            _1618 = _1614 * _1614;
            _1619 = _1615 * _1615;
            _1620 = _1616 * _1616;
            _1626 = (_1617 * _1617);
            _1627 = (_1618 * _1618);
            _1628 = (_1619 * _1619);
            _1629 = (_1620 * _1620);
          } else {
            _1626 = _1458;
            _1627 = _1459;
            _1628 = _1460;
            _1629 = _1461;
          }
          if (_958 || _956) {
            _1633 = _1626;
            _1634 = _1627;
            _1635 = _1628;
            _1636 = _1629;
            _1639 = _1633;
            _1640 = _1634;
            _1641 = _1635;
            _1642 = _1636;
            _1643 = (half)(max(0.89990234h, _424));
          } else {
            _1639 = _1626;
            _1640 = _1627;
            _1641 = _1628;
            _1642 = _1629;
            _1643 = (half)(max(0.099975586h, _424));
          }
        }
      } else {
        _1639 = _1458;
        _1640 = _1459;
        _1641 = _1460;
        _1642 = _1461;
        _1643 = (half)(max(0.099975586h, _424));
      }
    } else {
      _1626 = _1458;
      _1627 = _1459;
      _1628 = _1460;
      _1629 = _1461;
      if (_958 || _956) {
        _1633 = _1626;
        _1634 = _1627;
        _1635 = _1628;
        _1636 = _1629;
        _1639 = _1633;
        _1640 = _1634;
        _1641 = _1635;
        _1642 = _1636;
        _1643 = (half)(max(0.89990234h, _424));
      } else {
        _1639 = _1626;
        _1640 = _1627;
        _1641 = _1628;
        _1642 = _1629;
        _1643 = (half)(max(0.099975586h, _424));
      }
    }
    _1644 = float(_1643);
    _1645 = _1644 * _1644;
    _1646 = _1645 * _1645;
    _1659 = (((_1646 * _1639) - _1639) * _1639) + 1.0f;
    _1660 = (((_1646 * _1640) - _1640) * _1640) + 1.0f;
    _1661 = (((_1646 * _1641) - _1641) * _1641) + 1.0f;
    _1662 = (((_1646 * _1642) - _1642) * _1642) + 1.0f;
    _1687 = saturate(select(_274, 1.0f, saturate((_1646 / (_1659 * _1659)) * _1639)) * _985);
    _1688 = saturate(select(_274, 1.0f, saturate((_1646 / (_1660 * _1660)) * _1640)) * _987);
    _1689 = saturate(select(_274, 1.0f, saturate((_1646 / (_1661 * _1661)) * _1641)) * _989);
    _1690 = saturate(select(_274, 1.0f, saturate((_1646 / (_1662 * _1662)) * _1642)) * _991);
    [branch]
    if (_395) {
      _1703 = mad((_projToPrevProj[2].w), _99.x, mad((_projToPrevProj[1].w), _352, ((_projToPrevProj[0].w) * _350))) + (_projToPrevProj[3].w);
      _1706 = ((mad((_projToPrevProj[2].x), _99.x, mad((_projToPrevProj[1].x), _352, ((_projToPrevProj[0].x) * _350))) + (_projToPrevProj[3].x)) / _1703) - _350;
      _1707 = ((mad((_projToPrevProj[2].y), _99.x, mad((_projToPrevProj[1].y), _352, ((_projToPrevProj[0].y) * _350))) + (_projToPrevProj[3].y)) / _1703) - _352;
      _1717 = (((_1706 * 0.5f) + _96) * _bufferSizeAndInvSize.x) + -0.5f;
      _1718 = ((_97 - (_1707 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      _1721 = int(floor(_1717));
      _1722 = int(floor(_1718));
      _1723 = float((int)(_1721));
      _1724 = float((int)(_1722));
      [branch]
      if (_274) {
        _1734 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_1723 + 0.5f) * _bufferSizeAndInvSize.z), ((_1724 + 0.5f) * _bufferSizeAndInvSize.w)));
        _1741 = mad(_1734.w, 16777216, mad(_1734.z, 65536, mad(_1734.y, 256, _1734.x)));
        _1789 = saturate(min(max(((_422 / (((_108 * _108) * 0.004999999888241291f) + 1.0f)) + (_1480 * 0.5f)), 0.03125f), 0.5f) + _1604);
        _1790 = _1721;
        _1791 = _1722;
        _1792 = saturate(float((bool)(bool)((uint)(_1741 & 24) > (uint)23)) * _1687);
        _1793 = saturate(float((bool)(bool)((uint)(_1741 & 6144) > (uint)5888)) * _1688);
        _1794 = saturate(float((bool)(bool)((uint)(_1741 & 1572864) > (uint)1507328)) * _1689);
        _1795 = saturate(float((bool)(bool)((uint)(_1741 & 402653184) > (uint)385875968)) * _1690);
      } else {
        _1773 = _1717 - _1723;
        _1774 = _1718 - _1724;
        _1775 = 1.0f - _1773;
        _1776 = 1.0f - _1774;
        _1789 = saturate((sqrt((_1707 * _1707) + (_1706 * _1706)) * 100.0f) + 0.125f);
        _1790 = _1721;
        _1791 = _1722;
        _1792 = (_1775 * _1774);
        _1793 = (_1774 * _1773);
        _1794 = (_1776 * _1773);
        _1795 = (_1776 * _1775);
      }
    } else {
      _1789 = _1604;
      _1790 = _535;
      _1791 = _536;
      _1792 = _1687;
      _1793 = _1688;
      _1794 = _1689;
      _1795 = _1690;
    }
    _1796 = (_1494 > 0.20000000298023224f);
    _1797 = _1791 + 1u;
    half4 _1799 = __3__36__0__0__g_specularResultPrev.Load(int3(_1790, _1797, 0));
    _1812 = float((bool)((bool)(!(_1796 ^ ((half)(_1799.w) < 0.0h))))) * _1792;
    _1818 = _1790 + 1u;
    half4 _1819 = __3__36__0__0__g_specularResultPrev.Load(int3(_1818, _1797, 0));
    _1832 = float((bool)((bool)(!(_1796 ^ ((half)(_1819.w) < 0.0h))))) * _1793;
    half4 _1842 = __3__36__0__0__g_specularResultPrev.Load(int3(_1818, _1791, 0));
    _1855 = float((bool)((bool)(!(_1796 ^ ((half)(_1842.w) < 0.0h))))) * _1794;
    half4 _1865 = __3__36__0__0__g_specularResultPrev.Load(int3(_1790, _1791, 0));
    _1878 = float((bool)((bool)(!(_1796 ^ ((half)(_1865.w) < 0.0h))))) * _1795;
    _1902 = 1.0f / max(((saturate(_108 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_1812, _1832, _1855, _1878), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    _1904 = -0.0f - (min(0.0f, (-0.0f - ((((_1812 * float(_1799.x)) + (_1832 * float(_1819.x))) + (_1855 * float(_1842.x))) + (_1878 * float(_1865.x))))) * _1902);
    _1906 = -0.0f - (min(0.0f, (-0.0f - ((((_1812 * float(_1799.y)) + (_1832 * float(_1819.y))) + (_1855 * float(_1842.y))) + (_1878 * float(_1865.y))))) * _1902);
    _1908 = -0.0f - (min(0.0f, (-0.0f - ((((_1812 * float(_1799.z)) + (_1832 * float(_1819.z))) + (_1855 * float(_1842.z))) + (_1878 * float(_1865.z))))) * _1902);
    _1909 = _1902 * min(0.0f, (-0.0f - ((((_1812 * abs(float(_1799.w))) + (_1832 * abs(float(_1819.w)))) + (_1855 * abs(float(_1842.w)))) + (_1878 * abs(float(_1865.w))))));
    if (_renderParams.y == 0.0f) {
      _1912 = dot(float3(_1904, _1906, _1908), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _1919 = ((min(_1912, _1096.z) / max(9.999999717180685e-10f, _1912)) * _1100) + saturate(1.0f - _1100);
      _1924 = (_1919 * _1904);
      _1925 = (_1919 * _1906);
      _1926 = (_1919 * _1908);
    } else {
      _1924 = _1904;
      _1925 = _1906;
      _1926 = _1908;
    }
    _1927 = _1924 * _exposure4.y;
    _1928 = _1925 * _exposure4.y;
    _1929 = _1926 * _exposure4.y;
    _1942 = ((max(0.0010000000474974513f, float(_1247)) + _1909) * _1789) - _1909;
    _1952 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1490 * _305.x) - _1927) * _1789) + _1927))));
    _1953 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1490 * _305.y) - _1928) * _1789) + _1928))));
    _1954 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1490 * _305.z) - _1929) * _1789) + _1929))));
    __3__38__0__1__g_specularResultUAV[int2(_86, _88)] = float4((half)(half(_1952)), (half)(half(_1953)), (half)(half(_1954)), (half)(half(select(_1796, (-0.0f - _1942), _1942))));
    _1962 = select(_395, 0.0f, _1942);
    _1967 = float(half(lerp(_1962, 1.0f, _1284)));
    _1968 = (_718 == 64);
    _1970 = ((int)(uint)(_167)) ^ 1;
    if ((((int)(uint)(_1968)) & _1970) == 0) {
      _1986 = saturate(exp2((_1967 * _1967) * (_108 * -0.005770780146121979f)));
    } else {
      _1986 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    _1989 = (_cavityParams.x == 0.0f);
    _1990 = select(_1989, 1.0f, _1986);
    if (_1968) {
      _1996 = (_1990 * _1239);
      _1997 = (_1990 * _1240);
      _1998 = (_1990 * _1241);
    } else {
      _1996 = _1239;
      _1997 = _1240;
      _1998 = _1241;
    }
    _2003 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _438), (1.0f - _1967)), 0.0f);
    _2014 = select((_1968 || _395), 1.0f, _1990) * _1149;
    if (!_658) {
      if ((bool)(_104 != 7) && ((bool)(!((bool)(_104 == 6) || ((bool)(((bool)((bool)((uint)(_104 + -27) < (uint)2) || ((bool)((bool)(_104 == 26) || ((bool)(_395 || _1543)))))) || (bool)(_718 == 106))))))) {
        _2044 = exp2(log2(_1962) * (saturate(_108 * 0.03125f) + 1.0f));
        _2053 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97), 0.0f);
        bool __branch_chain_2038;
        if ((bool)(_104 == 15) || ((bool)((bool)((_102.x & 124) == 16) || (bool)(_718 == 12)))) {
          _2072 = false;
          _2073 = true;
          __branch_chain_2038 = true;
        } else {
          if (!((uint)_104 > (uint)10)) {
            _2072 = true;
            _2073 = _1543;
            __branch_chain_2038 = true;
          } else {
            if ((uint)_104 < (uint)20) {
              _2072 = false;
              _2073 = _1543;
              __branch_chain_2038 = true;
            } else {
              if (!(_104 == 97)) {
                _2072 = (_104 != 107);
                _2073 = _1543;
                __branch_chain_2038 = true;
              } else {
                _2265 = _1223;
                _2266 = _1284;
                _2267 = _1213;
                _2268 = _1214;
                _2269 = _1215;
                __branch_chain_2038 = false;
              }
            }
          }
        }
        if (__branch_chain_2038) {
          if (_2053.w < 1.0f) {
            if ((_weatherCheckFlag & 5) == 5) {
              _2083 = (_104 == 36);
              if (!_2083) {
                _2103 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _389) / _climateTextureOnePixelMeter.x) + float((int)((uint)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _391) / _climateTextureOnePixelMeter.y) + float((int)((uint)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                _2109 = _2103.x;
                _2110 = _2103.y;
                _2111 = _2103.z;
                _2112 = _2103.w;
              } else {
                _2109 = 0.11999999731779099f;
                _2110 = 0.11999999731779099f;
                _2111 = 0.10000000149011612f;
                _2112 = 0.5f;
              }
              _2119 = 1.0f - saturate(((_viewPos.y + _390) - _paramGlobalSand.x) / _paramGlobalSand.y);
              if (_2119 > 0.0f) {
                _2122 = saturate(_2044);
                _2135 = ((_2110 * 0.3395099937915802f) + (_2109 * 0.6131200194358826f)) + (_2111 * 0.047370001673698425f);
                _2136 = ((_2110 * 0.9163600206375122f) + (_2109 * 0.07020000368356705f)) + (_2111 * 0.013450000435113907f);
                _2137 = ((_2110 * 0.10958000272512436f) + (_2109 * 0.02061999961733818f)) + (_2111 * 0.8697999715805054f);
                _2142 = select(_2073, 1.0f, float((bool)(bool)(saturate(dot(float3(_428, _429, _430), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                if (_enableSandAO == 1) {
                  _2147 = 1.0f - _2053.x;
                  if (_2083) {
                    _2178 = ((((_2147 * 10.0f) * _2112) * _2119) * _2122);
                    _2181 = _2135;
                    _2182 = _2136;
                    _2183 = _2137;
                    _2184 = saturate(_2178);
                  } else {
                    _2158 = saturate(_2112 + -0.5f);
                    _2181 = _2135;
                    _2182 = _2136;
                    _2183 = _2137;
                    _2184 = ((((_2158 * 2.0f) * max((_2142 * _2053.x), min((_2122 * ((_2053.x * 7.0f) + 3.0f)), (_2158 * 40.0f)))) + (((_2147 * 10.0f) * _2122) * saturate((0.5f - _2112) * 2.0f))) * _2119);
                  }
                } else {
                  _2176 = ((_2119 * _2112) * _2053.x) * _2142;
                  if (_2083) {
                    _2178 = _2176;
                    _2181 = _2135;
                    _2182 = _2136;
                    _2183 = _2137;
                    _2184 = saturate(_2178);
                  } else {
                    _2181 = _2135;
                    _2182 = _2136;
                    _2183 = _2137;
                    _2184 = _2176;
                  }
                }
              } else {
                _2181 = 0.0f;
                _2182 = 0.0f;
                _2183 = 0.0f;
                _2184 = 0.0f;
              }
              _2188 = ((1.0f - _2053.w) * (1.0f - _2053.y)) * _2184;
              _2189 = (_2188 > 9.999999747378752e-05f);
              if (_2189) {
                if (_2073) {
                  _2192 = saturate(_2188);
                  _2219 = (((sqrt(_2181 * _1213) - _1213) * _2192) + _1213);
                  _2220 = (((sqrt(_2182 * _1214) - _1214) * _2192) + _1214);
                  _2221 = (((sqrt(_2183 * _1215) - _1215) * _2192) + _1215);
                } else {
                  _2219 = ((_2188 * (_2181 - _1213)) + _1213);
                  _2220 = ((_2188 * (_2182 - _1214)) + _1214);
                  _2221 = ((_2188 * (_2183 - _1215)) + _1215);
                }
              } else {
                _2219 = _1213;
                _2220 = _1214;
                _2221 = _1215;
              }
              if (_2083 && _2189) {
                if (_2073) {
                  _2236 = (((sqrt(_1284 * 0.25f) - _1284) * saturate(_2188)) + _1284);
                } else {
                  _2236 = ((_2188 * (0.25f - _1284)) + _1284);
                }
              } else {
                _2236 = _1284;
              }
              _2237 = saturate(_2219);
              _2238 = saturate(_2220);
              _2239 = saturate(_2221);
              _2244 = (_2236 * (1.0f - _2044)) + _2044;
              _2247 = ((_2236 - _2244) * _2053.y) + _2244;
              _2254 = (((_2044 * _2044) * _2053.z) * float((bool)_2072)) * saturate(dot(float3(_428, _429, _430), float3(0.0f, 1.0f, 0.0f)));
              _2255 = _2254 * -0.5f;
              _2265 = (_1223 - (_2044 * _1223));
              _2266 = (_2247 - (_2254 * _2247));
              _2267 = ((_2255 * _2237) + _2237);
              _2268 = ((_2255 * _2238) + _2238);
              _2269 = ((_2255 * _2239) + _2239);
            } else {
              _2265 = _1223;
              _2266 = _1284;
              _2267 = _1213;
              _2268 = _1214;
              _2269 = _1215;
            }
          } else {
            _2265 = _1223;
            _2266 = _1284;
            _2267 = _1213;
            _2268 = _1214;
            _2269 = _1215;
          }
        }
        _2276 = (half)(half(_2265));
        _2277 = (half)(half(_2266));
        _2278 = (half)(half(_2267));
        _2279 = (half)(half(_2268));
        _2280 = (half)(half(_2269));
        _2281 = _2044;
      } else {
        _2276 = _423;
        _2277 = _424;
        _2278 = _425;
        _2279 = _426;
        _2280 = _427;
        _2281 = _1962;
      }
    } else {
      _2276 = _423;
      _2277 = _424;
      _2278 = _425;
      _2279 = _426;
      _2280 = _427;
      _2281 = _1962;
    }
    half4 _2283 = __3__36__0__0__g_sceneShadowColor.Load(int3(_86, _88, 0));
    [branch]
    if (_395) {
      _2289 = __3__36__0__0__g_sceneNormal.Load(int3(_86, _88, 0));
      _2305 = min(1.0f, ((float((uint)((int)(_2289.x & 1023))) * 0.001956947147846222f) + -1.0f));
      _2306 = min(1.0f, ((float((uint)((int)(((uint)((int)(_2289.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      _2307 = min(1.0f, ((float((uint)((int)(((uint)((int)(_2289.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      _2309 = rsqrt(dot(float3(_2305, _2306, _2307), float3(_2305, _2306, _2307)));
      _2317 = (half)(half(_2309 * _2305));
      _2318 = (half)(half(_2309 * _2306));
      _2319 = (half)(half(_2309 * _2307));
    } else {
      _2317 = _246;
      _2318 = _247;
      _2319 = _248;
    }
    _2322 = (_sunDirection.y > 0.0f);
    if ((_2322) || ((!(_2322)) && (_sunDirection.y > _moonDirection.y))) {
      _2334 = _sunDirection.x;
      _2335 = _sunDirection.y;
      _2336 = _sunDirection.z;
    } else {
      _2334 = _moonDirection.x;
      _2335 = _moonDirection.y;
      _2336 = _moonDirection.z;
    }
    if ((_2322) || ((!(_2322)) && (_sunDirection.y > _moonDirection.y))) {
      _2356 = _precomputedAmbient7.y;
    } else {
      _2356 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    _2362 = (_earthRadius + _390) + _viewPos.y;
    _2366 = (_391 * _391) + (_389 * _389);
    _2368 = sqrt((_2362 * _2362) + _2366);
    _2373 = dot(float3((_389 / _2368), (_2362 / _2368), (_391 / _2368)), float3(_2334, _2335, _2336));
    _2378 = min(max(((_2368 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    _2386 = max(_2378, 0.0f);
    _2393 = (-0.0f - sqrt((_2386 + (_earthRadius * 2.0f)) * _2386)) / (_2386 + _earthRadius);
    if (_2373 > _2393) {
      _2416 = ((exp2(log2(saturate((_2373 - _2393) / (1.0f - _2393))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _2416 = ((exp2(log2(saturate((_2393 - _2373) / (_2393 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    _2420 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_2378 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _2416), 0.0f);
    _2442 = ((_2420.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    _2460 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _2420.x) + _2442) * -1.4426950216293335f);
    _2461 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _2420.x) + _2442) * -1.4426950216293335f);
    _2462 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((int)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _2420.x) + _2442) * -1.4426950216293335f);
    _2478 = sqrt(_2366);
    _2486 = (_cloudAltitude - (max(((_2478 * _2478) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    _2498 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((bool)(_2335 > 0.0f))) - ((int)(uint)((bool)(_2335 < 0.0f))))) * 0.5f))) + _2486;
    if (_390 < _2486) {
      _2501 = dot(float3(0.0f, 1.0f, 0.0f), float3(_2334, _2335, _2336));
      _2507 = select((abs(_2501) < 9.99999993922529e-09f), 1e+08f, ((_2498 - dot(float3(0.0f, 1.0f, 0.0f), float3(_389, _390, _391))) / _2501));
      _2513 = ((_2507 * _2334) + _389);
      _2514 = _2498;
      _2515 = ((_2507 * _2336) + _391);
    } else {
      _2513 = _389;
      _2514 = _390;
      _2515 = _391;
    }
    _2524 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_2513 * 4.999999873689376e-05f) + 0.5f), ((_2514 - _2486) / _cloudThickness), ((_2515 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    _2535 = saturate(abs(_2335) * 4.0f);
    _2537 = (_2535 * _2535) * exp2(((_distanceScale * -1.4426950216293335f) * _2524.x) * (_cloudScatteringCoefficient / _distanceScale));
    _2544 = ((1.0f - _2537) * saturate(((_390 - _cloudThickness) - _2486) * 0.10000000149011612f)) + _2537;
    _2545 = _2544 * (((_2461 * 0.3395099937915802f) + (_2460 * 0.6131200194358826f)) + (_2462 * 0.047370001673698425f));
    _2546 = _2544 * (((_2461 * 0.9163600206375122f) + (_2460 * 0.07020000368356705f)) + (_2462 * 0.013450000435113907f));
    _2547 = _2544 * (((_2461 * 0.10958000272512436f) + (_2460 * 0.02061999961733818f)) + (_2462 * 0.8697999715805054f));
    _2563 = (((_2545 * 0.6131200194358826f) + (_2546 * 0.3395099937915802f)) + (_2547 * 0.047370001673698425f)) * _2356;
    _2564 = (((_2545 * 0.07020000368356705f) + (_2546 * 0.9163600206375122f)) + (_2547 * 0.013450000435113907f)) * _2356;
    _2565 = (((_2545 * 0.02061999961733818f) + (_2546 * 0.10958000272512436f)) + (_2547 * 0.8697999715805054f)) * _2356;
    // RenoDX: DAWN_DUSK_GI SH ambient directional boost
    if (DAWN_DUSK_IMPROVEMENTS == 1.f) {
      float _ddFactor = DawnDuskFactor(_sunDirection.y);
      float3 _ddAmbient = DawnDuskAmbientBoost(
        float3(_2563, _2564, _2565),
        float3(float(_2317), float(_2318), float(_2319)),
        _sunDirection.xyz,
        _ddFactor,
        _precomputedAmbient0.xyz);
      _2563 = _ddAmbient.x;
      _2564 = _ddAmbient.y;
      _2565 = _ddAmbient.z;
    }
    // RenoDX: purkinje colour shift for direct moonlight
    {
      bool _purk_isMoon = !_2322 && (_sunDirection.y <= _moonDirection.y);
      float3 _purk_light = ApplyPurkinjeShift(
        float3(_2563, _2564, _2565), _sunDirection.y, _purk_isMoon);
      _2563 = _purk_light.x;
      _2564 = _purk_light.y;
      _2565 = _purk_light.z;
    }
    _2568 = float(_2283.x);
    _2569 = float(_2283.y);
    _2570 = float(_2283.z);
    if (!(_309) | !((bool)((uint)_104 < (uint)20) || (bool)(_104 == 107))) {
      _2578 = (_104 == 20);
    } else {
      _2578 = true;
    }
    if (_104 == 19) {
      _2587 = true;
      _2590 = _2587;
      _2591 = (_104 == 106);
    } else {
      _2581 = (_104 == 107);
      if (!(((bool)(_1543 || (bool)(_104 == 28))) || (bool)(_718 == 26))) {
        _2587 = _2581;
        _2590 = _2587;
        _2591 = (_104 == 106);
      } else {
        _2590 = _2581;
        _2591 = true;
      }
    }
    _2592 = float(_2317);
    _2593 = float(_2318);
    _2594 = float(_2319);
    if (_104 == 97) {
      _2598 = __3__36__0__0__g_sceneDecalMask.Load(int3(_86, _88, 0));
      _2605 = (((uint)((int)((int)(min16uint)((int16_t)((int16_t)(_2598.x) & 2)))) >> 1) + 97);
    } else {
      _2605 = _104;
    }
    _2610 = float(saturate(_186));
    _2611 = _2610 * _2610;
    _2612 = _2611 * _2611;
    _2613 = _2612 * _2612;
    _2620 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _91), (_bufferSizeAndInvSize.w * _92)), 0.0f);
    _2624 = ((_2613 * _2613) * select((_274 || ((bool)(_2590 || _2591))), 0.0f, 1.0f)) * _2620.y;
    _2629 = _2592 - (_2624 * _2592);
    _2630 = (_2624 * (1.0f - _2593)) + _2593;
    _2631 = _2594 - (_2624 * _2594);
    _2633 = rsqrt(dot(float3(_2629, _2630, _2631), float3(_2629, _2630, _2631)));
    _2634 = _2629 * _2633;
    _2635 = _2630 * _2633;
    _2636 = _2631 * _2633;
    if ((_2322) || ((!(_2322)) && (_sunDirection.y > _moonDirection.y))) {
      _2648 = _sunDirection.x;
      _2649 = _sunDirection.y;
      _2650 = _sunDirection.z;
    } else {
      _2648 = _moonDirection.x;
      _2649 = _moonDirection.y;
      _2650 = _moonDirection.z;
    }
    _2651 = _2563 * _lightingParams.x;
    _2652 = _2564 * _lightingParams.x;
    _2653 = _2565 * _lightingParams.x;
    _2654 = _2648 - _431;
    _2655 = _2649 - _433;
    _2656 = _2650 - _435;
    _2658 = rsqrt(dot(float3(_2654, _2655, _2656), float3(_2654, _2655, _2656)));
    _2659 = _2658 * _2654;
    _2660 = _2658 * _2655;
    _2661 = _2658 * _2656;
    _2662 = dot(float3(_2592, _2593, _2594), float3(_2648, _2649, _2650));
    _2663 = dot(float3(_2634, _2635, _2636), float3(_2648, _2649, _2650));
    _2665 = saturate(dot(float3(_2592, _2593, _2594), float3(_432, _434, _436)));
    _2667 = saturate(dot(float3(_2634, _2635, _2636), float3(_2659, _2660, _2661)));
    _2670 = saturate(dot(float3(_2648, _2649, _2650), float3(_2659, _2660, _2661)));
    _2672 = float(max(0.010002136h, _2277));
    _2673 = saturate(_2662);
    // RenoDX: Geometric Specular AA
    float _rndx_spec_rough = _2672;
    if (SPECULAR_AA > 0.0f) {
      _rndx_spec_rough = NDFFilterRoughnessCS(float3(_2634, _2635, _2636), _2672, SPECULAR_AA);
    }
    _2674 = _rndx_spec_rough * _rndx_spec_rough;
    _2675 = _2674 * _2674;
    _2676 = 1.0f - _2675;
    _2677 = 1.0f - _2670;
    _2678 = _2677 * _2677;
    _2681 = ((_2678 * _2678) * _2677) + _2670;
    _2682 = 1.0f - _2673;
    _2683 = _2682 * _2682;
    _2688 = 1.0f - _2665;
    _2689 = _2688 * _2688;
    if (DIFFUSE_BRDF_MODE >= 1.0f) {
      // RenoDX: EON Diffuse
      float _eon_LdotV = dot(float3(_2648, _2649, _2650), float3(_432, _434, _436));
      _2717 = _2673 * EON_DiffuseScalar(_2673, _2665, _eon_LdotV, _2672);
    } else {
      // Vanilla Burley Diffuse
      _2717 = saturate((_2673 * 0.31830987334251404f) * ((((((1.0f - ((_2683 * _2683) * (_2682 * 0.75f))) * (1.0f - ((_2689 * _2689) * (_2688 * 0.75f)))) - _2681) * saturate((_2676 * 2.200000047683716f) + -0.5f)) + _2681) + ((exp2(-0.0f - (max(((_2676 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_2667))) * _2670) * ((((_2676 * 34.5f) + -59.0f) * _2676) + 24.5f))));
    }
    _2718 = _2605 & 126;
    bool __branch_chain_2647;
    if ((bool)(_2605 == 98) || (bool)(_2718 == 96)) {
      _2729 = true;
      __branch_chain_2647 = true;
    } else {
      if ((uint)(_2605 + -105) < (uint)2) {
        _2729 = _166;
        __branch_chain_2647 = true;
      } else {
        if (!((uint)(_2605 + -11) < (uint)9)) {
          _2729 = false;
          __branch_chain_2647 = true;
        } else {
          __branch_chain_2647 = false;
        }
      }
    }
    if (__branch_chain_2647) {
      if ((bool)(_2605 == 65) || ((bool)((bool)(_2605 == 107) || _2729))) {
        _2737 = 0.0f;
      } else {
        _2737 = float(_2276);
      }
    } else {
      _2737 = 0.0f;
    }
    _2738 = (_2605 == 53);
    _2739 = float(_2278);
    _2740 = float(_2279);
    _2741 = float(_2280);
    if (_2738) {
      _2748 = saturate(((_2740 + _2739) + _2741) * 1.2000000476837158f);
    } else {
      _2748 = 1.0f;
    }
    _2754 = (0.699999988079071f / min(max(max(max(_2739, _2740), _2741), 0.009999999776482582f), 0.699999988079071f)) * _2748;
    _2764 = (((_2754 * _2739) + -0.03999999910593033f) * _2737) + 0.03999999910593033f;
    _2765 = (((_2754 * _2740) + -0.03999999910593033f) * _2737) + 0.03999999910593033f;
    _2766 = (((_2754 * _2741) + -0.03999999910593033f) * _2737) + 0.03999999910593033f;
    _2767 = float(_2277);
    _2768 = (_2718 == 64);
    _2771 = ((((int)(uint)(_2768)) & _1970) == 0);
    if (_2771) {
      _2783 = saturate(exp2((_2767 * _2767) * (_108 * -0.005770780146121979f)));
    } else {
      _2783 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    _2784 = select(_1989, 1.0f, _2783);
    if (_2768) {
      _2790 = (_2784 * _2764);
      _2791 = (_2784 * _2765);
      _2792 = (_2784 * _2766);
    } else {
      _2790 = _2764;
      _2791 = _2765;
      _2792 = _2766;
    }
    _2795 = saturate(1.0f - saturate(dot(float3(_432, _434, _436), float3(_2659, _2660, _2661))));
    _2796 = _2795 * _2795;
    _2798 = (_2796 * _2796) * _2795;
    _2801 = _2798 * saturate(_2791 * 50.0f);
    _2802 = 1.0f - _2798;
    if (!_274) {
      _2810 = saturate(_2663);
      _2811 = 1.0f - _2674;
      _2823 = (((_2675 * _2667) - _2667) * _2667) + 1.0f;
      _2827 = (_2675 / ((_2823 * _2823) * 3.1415927410125732f)) * (0.5f / ((((_2811 * _2665) + _2674) * _2663) + (((_2811 * _2663) + _2674) * _2665)));
      _2841 = ((_2810 * _2568) * max((_2827 * ((_2802 * _2790) + _2801)), 0.0f));
      _2842 = ((_2810 * _2569) * max((_2827 * ((_2802 * _2791) + _2801)), 0.0f));
      _2843 = ((_2810 * _2570) * max((_2827 * ((_2802 * _2792) + _2801)), 0.0f));
    } else {
      _2841 = 0.0f;
      _2842 = 0.0f;
      _2843 = 0.0f;
    }
    // RenoDX: Diffraction on Rough Surfaces
    if (DIFFRACTION > 0.0f && _2737 > 0.0f) {
      float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
        _2667, _2665, _rndx_spec_rough,
        float2(_96, _97), _108,
        float3(_2659, _2660, _2661),
        float3(_2634, _2635, _2636),
        float3(_2739, _2740, _2741)
      );
      float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _2737);
      _2841 *= _rndx_dMod.x;
      _2842 *= _rndx_dMod.y;
      _2843 *= _rndx_dMod.z;
    }
    // RenoDX: Callisto Smooth Terminator
    if (SMOOTH_TERMINATOR > 0.0f) {
      float _rndx_c2 = CallistoSmoothTerminator(_2673, _2670, _2667, SMOOTH_TERMINATOR, 0.5f);
      _2717 *= _rndx_c2;
      _2841 *= _rndx_c2;
      _2842 *= _rndx_c2;
      _2843 *= _rndx_c2;
    }
    // RenoDX: Foliage Transmission
    bool isFoliage = ((uint)(_104 - 12) < 7u);
    float foliageTransR = 0.0f;
    float foliageTransG = 0.0f;
    float foliageTransB = 0.0f;
    if (FOLIAGE_TRANSMISSION > 0.0f && isFoliage) {
      FoliageTransmissionResult _ftResult = FoliageTransmission(
          float3(_432, _434, _436),                    // V (view dir toward camera)
          float3(_2648, _2649, _2650),                 // L (light dir)
          float3(_2592, _2593, _2594),                 // N (surface normal)
          _2662,                                       // NdotL (raw)
          float3(_2739, _2740, _2741),                 // baseColor
          float3(_2568, _2569, _2570),                 // shadowColor
          float3(_2651, _2652, _2653),                 // lightLum
          FOLIAGE_TRANSMISSION_THICKNESS);              // thickness

      foliageTransR = _ftResult.transmission.x;
      foliageTransG = _ftResult.transmission.y;
      foliageTransB = _ftResult.transmission.z;

      if (_ftResult.diffuseScale > 0.0f) {
        _2717 *= _ftResult.diffuseScale;
      } else {
        // At terminator: use wrapped lambert directly
        float wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
        _2717 = max(0.0f, (_2662 + wrap) / (1.0f + wrap)) * 0.31830987334251404f * 0.75f;
      }
    }
    if (_2578 || (bool)(_2718 == 6)) {
      _2852 = ((max(0.0f, (0.30000001192092896f - _2662)) * 0.23190687596797943f) + _2717);
    } else {
      _2852 = _2717;
    }
    _2859 = ((_2568 * _2852) * _2651) + (_1204 * _1149) + foliageTransR;
    _2860 = ((_2569 * _2852) * _2652) + (_1205 * _1149) + foliageTransG;
    _2861 = ((_2570 * _2852) * _2653) + (_1206 * _1149) + foliageTransB;
    _2864 = _frameNumber.x * 13;
    [branch]
    if (((((uint)(_2864 + _86)) | ((uint)(_2864 + _88))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((uint)(_86 >> 5)), ((uint)(_88 >> 5)))] = float4((half)(half(_2859)), (half)(half(_2860)), (half)(half(_2861)), 1.0f);
    }
    _2879 = ((uint)(_2605 & 24) > (uint)23);
    if (_2771) {
      _2896 = saturate(exp2((_2767 * _2767) * (_108 * -0.005770780146121979f)));
    } else {
      _2896 = select((_cavityParams.z > 0.0f), select(_167, 0.0f, _421), 1.0f);
    }
    _2914 = select(_2768, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _2896) * select((_166 && _2879), (1.0f - _421), 1.0f)));
    _2918 = min(60000.0f, (_2914 * (((((_2003.x * _1996) + _2003.y) * _1952) * _2014) - min(0.0f, (-0.0f - (_2651 * _2841))))));
    _2919 = min(60000.0f, (_2914 * (((((_2003.x * _1997) + _2003.y) * _1953) * _2014) - min(0.0f, (-0.0f - (_2652 * _2842))))));
    _2920 = min(60000.0f, (_2914 * (((((_2003.x * _1998) + _2003.y) * _1954) * _2014) - min(0.0f, (-0.0f - (_2653 * _2843))))));
    _2923 = 1.0f - _renderParams.x;
    _2930 = half((_renderParams.x * _2739) + _2923);
    _2931 = half((_renderParams.x * _2740) + _2923);
    _2932 = half((_renderParams.x * _2741) + _2923);
    if (_2768 && (bool)(_renderParams2.x == 0.0f)) {
      _2948 = (half)(exp2((half)((half)(log2(_2930)) * 0.5h)));
      _2949 = (half)(exp2((half)((half)(log2(_2931)) * 0.5h)));
      _2950 = (half)(exp2((half)((half)(log2(_2932)) * 0.5h)));
    } else {
      _2948 = _2930;
      _2949 = _2931;
      _2950 = _2932;
    }
    _2951 = float(_2948);
    _2952 = float(_2949);
    _2953 = float(_2950);
    if (_2738) {
      _2960 = saturate(((_2952 + _2951) + _2953) * 1.2000000476837158f);
    } else {
      _2960 = 1.0f;
    }
    _2961 = float(_2276);
    _2967 = (0.699999988079071f / min(max(max(max(_2951, _2952), _2953), 0.009999999776482582f), 0.699999988079071f)) * _2960;
    _2974 = ((_2967 * _2951) + -0.03999999910593033f) * _2961;
    _2975 = ((_2967 * _2952) + -0.03999999910593033f) * _2961;
    _2976 = ((_2967 * _2953) + -0.03999999910593033f) * _2961;
    _2977 = _2974 + 0.03999999910593033f;
    _2978 = _2975 + 0.03999999910593033f;
    _2979 = _2976 + 0.03999999910593033f;
    _2983 = (_2977 * _2003.x) + _2003.y;
    _2984 = (_2978 * _2003.x) + _2003.y;
    _2985 = (_2979 * _2003.x) + _2003.y;
    _2987 = (1.0f - _2003.y) - _2003.x;
    _2994 = ((0.9599999785423279f - _2974) * 0.0476190485060215f) + _2977;
    _2995 = ((0.9599999785423279f - _2975) * 0.0476190485060215f) + _2978;
    _2996 = ((0.9599999785423279f - _2976) * 0.0476190485060215f) + _2979;
    _3013 = saturate(1.0f - _2281);
    _3014 = (((_2983 * _2994) / (1.0f - (_2994 * _2987))) * _2987) * _3013;
    _3015 = (((_2984 * _2995) / (1.0f - (_2995 * _2987))) * _2987) * _3013;
    _3016 = (((_2985 * _2996) / (1.0f - (_2996 * _2987))) * _2987) * _3013;
    _3027 = float(1.0h - _2276);
    _3037 = half(((_2951 * _3027) * saturate((1.0f - _3014) - _2983)) + _3014);
    _3038 = half(((_2952 * _3027) * saturate((1.0f - _3015) - _2984)) + _3015);
    _3039 = half(((_2953 * _3027) * saturate((1.0f - _3016) - _2985)) + _3016);
    _3042 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97), 0.0f);
    _3044 = _3042.x * 0.31830987334251404f;
    _3054 = ((_3044 * _2563) + _2859) * float(_3037);
    _3055 = ((_3044 * _2564) + _2860) * float(_3038);
    _3056 = ((_3044 * _2565) + _2861) * float(_3039);
    _3060 = _3054 + (_2918 * _2961);
    _3061 = _3055 + (_2919 * _2961);
    _3062 = _3056 + (_2920 * _2961);
    _3084 = (((QuadReadLaneAt(_3060, 1) + QuadReadLaneAt(_3060, 0)) + QuadReadLaneAt(_3060, 2)) + QuadReadLaneAt(_3060, 3)) * 0.25f;
    _3085 = (((QuadReadLaneAt(_3061, 1) + QuadReadLaneAt(_3061, 0)) + QuadReadLaneAt(_3061, 2)) + QuadReadLaneAt(_3061, 3)) * 0.25f;
    _3086 = (((QuadReadLaneAt(_3062, 1) + QuadReadLaneAt(_3062, 0)) + QuadReadLaneAt(_3062, 2)) + QuadReadLaneAt(_3062, 3)) * 0.25f;
    [branch]
    if (((_88 | _86) & 1) == 0) {
      _3091 = dot(float3(_3084, _3085, _3086), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((uint)(_86 >> 1)), ((uint)(_88 >> 1)))] = float4(min(60000.0f, _3084), min(60000.0f, _3085), min(60000.0f, _3086), min(60000.0f, select((_1019 != 0), (-0.0f - _3091), _3091)));
    }
    if (_2879) {
      _3113 = ((bool)(_2276 == 0.0h) && ((bool)(!(((bool)((bool)(_3037 != 0.0h) && (bool)(_3038 != 0.0h))) && (bool)(_3039 != 0.0h)))));
    } else {
      _3113 = false;
    }
    if ((_2879 || ((bool)((bool)(_2605 == 96) || ((bool)((bool)(_2605 == 54) || (bool)((_2605 & 124) == 64)))))) || ((!(_2879 || ((bool)((bool)(_2605 == 96) || ((bool)((bool)(_2605 == 54) || (bool)((_2605 & 124) == 64))))))) && ((bool)(_108 <= 10.0f) && (bool)((uint)(_2605 + -97) < (uint)2)))) {
      __3__38__0__1__g_sceneSpecularUAV[int2(_86, _88)] = float4(((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _2918)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _2919)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _2920)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _1962)))))));
      _3149 = _3054;
      _3150 = _3055;
      _3151 = _3056;
    } else {
      _3149 = (_3054 + _2918);
      _3150 = (_3055 + _2919);
      _3151 = (_3056 + _2920);
    }
    _3152 = min(60000.0f, _3149);
    _3153 = min(60000.0f, _3150);
    _3154 = min(60000.0f, _3151);
    [branch]
    if (_3113) {
      _3157 = __3__38__0__1__g_sceneColorUAV.Load(int2(_86, _88));
      _3165 = (_3157.x + _3152);
      _3166 = (_3157.y + _3153);
      _3167 = (_3157.z + _3154);
    } else {
      _3165 = _3152;
      _3166 = _3153;
      _3167 = _3154;
    }
    if (!(_renderParams.y == 0.0f)) {
      _3176 = dot(float3(_3165, _3166, _3167), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _3177 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _3176);
      _3181 = max(9.999999717180685e-10f, _3176);
      _3186 = ((_3177 * _3165) / _3181);
      _3187 = ((_3177 * _3166) / _3181);
      _3188 = ((_3177 * _3167) / _3181);
    } else {
      _3186 = _3165;
      _3187 = _3166;
      _3188 = _3167;
    }
    // RenoDX: Foliage AO on direct light — applied at final output.
    // Take shadow colour to determine direct light ratio
    if (FOLIAGE_AO_STRENGTH > 0.0f && (uint)(_104 - 12) < 7u) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_86, _88, 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, float(_330.x), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _3186 *= _rndx_ao;
      _3187 *= _rndx_ao;
      _3188 *= _rndx_ao;
    }
    __3__38__0__1__g_sceneColorUAV[int2(_86, _88)] = float4(_3186, _3187, _3188, 1.0f);
  }
}