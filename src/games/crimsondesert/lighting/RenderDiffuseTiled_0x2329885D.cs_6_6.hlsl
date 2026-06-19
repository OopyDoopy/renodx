#include "../shared.h"
#include "foliage_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t135, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t136, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t137, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t33, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t200, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t149, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t152, space36);

Texture2D<uint2> __3__36__0__0__g_stencilPrev : register(t139, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t109, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t110, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t60, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t61, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t19, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t20, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t21, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t53, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t63, space36);

Texture2D<uint2> __3__36__0__0__g_normalDepthHalf : register(t54, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t51, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t67, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t68, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t55, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t13, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t69, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t15, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t26, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t57, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseHalfPrevUAV : register(u42, space38);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u14, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneSpecularUAV : register(u15, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u16, space38);

RWTexture2D<half4> __3__38__0__1__g_specularResultUAV : register(u6, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV : register(u21, space38);

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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b17, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WeatherConstantBuffer : register(b37, space35) {
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b42, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  struct {
    uint4 g_tileIndex[4096];
  } __3__35__0__0__TileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__TileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b22, space35) {
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
  int _60;
  int _61;
  int4 _69;
  int _79;
  int _83;
  uint _89;
  uint _91;
  float _94;
  float _95;
  float _99;
  float _100;
  float _102;
  uint2 _105;
  int _107;
  float _110;
  float _111;
  int _429;
  int _476;
  int _477;
  float _478;
  float _479;
  bool _574;
  float _790;
  float _791;
  bool _985;
  half _993;
  float _1046;
  float _1057;
  float _1058;
  float _1066;
  float _1067;
  half _1068;
  half _1069;
  half _1070;
  half _1071;
  half _1072;
  bool _1102;
  float _1111;
  float _1152;
  float _1153;
  float _1238;
  float _1316;
  float _1483;
  float _1484;
  float _1485;
  float _1486;
  float _1649;
  int _1650;
  float _1707;
  float _1718;
  float _1828;
  float _1829;
  float _1830;
  float _1831;
  float _1836;
  float _1861;
  float _1888;
  bool _1899;
  half _1906;
  float _2174;
  float _2191;
  float _2195;
  float _2223;
  float _2266;
  float _2267;
  float _2268;
  float _2269;
  float _2272;
  float _2273;
  float _2274;
  float _2275;
  float _2278;
  float _2279;
  float _2280;
  float _2281;
  half _2282;
  float _2432;
  int _2433;
  int _2434;
  float _2435;
  float _2436;
  float _2437;
  float _2438;
  float _2567;
  float _2568;
  float _2569;
  float _2629;
  float _2639;
  float _2640;
  float _2641;
  bool _2715;
  bool _2716;
  float _2752;
  float _2753;
  float _2754;
  float _2755;
  float _2821;
  float _2824;
  float _2825;
  float _2826;
  float _2827;
  float _2862;
  float _2863;
  float _2864;
  float _2879;
  float _2908;
  float _2909;
  float _2910;
  float _2911;
  float _2912;
  half _2919;
  half _2920;
  half _2921;
  half _2922;
  half _2923;
  float _2924;
  half _2963;
  half _2964;
  half _2965;
  float _2980;
  float _2981;
  float _2982;
  float _3002;
  float _3062;
  float _3159;
  float _3160;
  float _3161;
  bool _3218;
  bool _3227;
  bool _3230;
  bool _3231;
  int _3245;
  float _3288;
  float _3289;
  float _3290;
  bool _3370;
  float _3378;
  float _3389;
  float _3424;
  float _3431;
  float _3432;
  float _3433;
  float _3482;
  float _3483;
  float _3484;
  float _3493;
  float _3537;
  half _3589;
  half _3590;
  half _3591;
  float _3601;
  bool _3743;
  float _3779;
  float _3780;
  float _3781;
  float _3795;
  float _3796;
  float _3797;
  float _3816;
  float _3817;
  float _3818;
  uint4 _119;
  float4 _125;
  half _134;
  half _138;
  half _143;
  half _152;
  uint _168;
  bool _169;
  bool _170;
  float _180;
  float _181;
  float _182;
  float _184;
  half _189;
  half _190;
  half _193;
  half _194;
  float _199;
  float _200;
  float _204;
  float _206;
  float _213;
  float _214;
  float _215;
  float _217;
  float _220;
  float _221;
  float _222;
  float _223;
  float _230;
  float _231;
  float _232;
  half _244;
  half _245;
  half _246;
  half _248;
  half _249;
  half _250;
  half _251;
  half _255;
  half _256;
  half _257;
  half _273;
  half _274;
  half _275;
  bool _276;
  bool _277;
  bool _278;
  uint _296;
  uint _304;
  uint _312;
  uint _320;
  uint _328;
  uint _336;
  uint _344;
  uint _352;
  uint _360;
  uint _368;
  uint _376;
  uint _384;
  uint _392;
  uint _400;
  uint _408;
  uint _416;
  int _458;
  int _459;
  int4 _482;
  int _487;
  int _491;
  int _495;
  int _499;
  float _524;
  float _529;
  float _530;
  float _531;
  float _532;
  int _533;
  int _534;
  int _535;
  int _536;
  bool _564;
  float _576;
  float _581;
  int _594;
  bool _595;
  bool _596;
  bool _597;
  int4 _626;
  float _645;
  float _646;
  float _647;
  float _649;
  float _653;
  float _654;
  float _655;
  float _671;
  float _672;
  float _673;
  float _675;
  float _694;
  float _695;
  float _696;
  float _698;
  float _717;
  float _718;
  float _719;
  float _721;
  float _726;
  float _739;
  float _740;
  float _741;
  float _742;
  float _747;
  float _750;
  float _753;
  float _756;
  float _759;
  float _792;
  float _793;
  float _794;
  float _795;
  float _796;
  float _797;
  float _798;
  float _799;
  bool _808;
  float _817;
  float _818;
  float _819;
  float _820;
  float _821;
  float _822;
  float _827;
  float _828;
  float _829;
  float _830;
  float _834;
  float _843;
  float _844;
  float _845;
  float _846;
  half4 _848;
  uint _858;
  half4 _859;
  uint _872;
  half4 _873;
  half4 _886;
  float4 _900;
  float4 _907;
  float4 _917;
  float4 _927;
  float _943;
  float _944;
  float _945;
  half2 _947;
  half2 _954;
  half2 _962;
  half2 _970;
  float _995;
  float _997;
  float _1033;
  float _1034;
  float _1035;
  float _1036;
  float _1038;
  bool _1040;
  uint _1048;
  half _1059;
  bool _1061;
  float _1073;
  float _1074;
  float _1075;
  float _1076;
  float _1077;
  float _1078;
  float _1080;
  bool _1082;
  float _1139;
  float2 _1146;
  float _1155;
  float _1158;
  float _1159;
  float _1167;
  float _1172;
  float _1173;
  int _1176;
  int _1177;
  float _1178;
  float _1179;
  float _1182;
  float _1183;
  int4 _1185;
  int _1208;
  float _1246;
  float _1247;
  float _1248;
  float _1249;
  float _1253;
  float _1270;
  float _1271;
  float _1274;
  bool _1289;
  float _1291;
  float _1293;
  bool _1297;
  bool _1323;
  float _1324;
  float _1329;
  float _1330;
  float _1331;
  float _1332;
  float _1333;
  float _1334;
  float _1335;
  float _1336;
  float _1338;
  float _1351;
  float _1352;
  float _1353;
  float _1354;
  int _1356;
  int _1357;
  int _1358;
  int _1359;
  bool _1398;
  bool _1399;
  bool _1400;
  bool _1401;
  bool _1414;
  bool _1423;
  bool _1445;
  int4 _1488;
  float _1507;
  float _1508;
  float _1509;
  float _1511;
  float _1516;
  float _1531;
  float _1532;
  float _1533;
  float _1535;
  float _1540;
  float _1555;
  float _1556;
  float _1557;
  float _1559;
  float _1564;
  float _1579;
  float _1580;
  float _1581;
  float _1583;
  float _1588;
  float _1591;
  float _1608;
  float _1609;
  float _1610;
  float _1611;
  float _1616;
  float _1618;
  float _1620;
  float _1622;
  float _1624;
  float _1625;
  float _1626;
  float _1627;
  int _1630;
  int _1631;
  int _1639;
  int _1641;
  float _1660;
  uint _1661;
  half4 _1663;
  uint _1668;
  half4 _1669;
  half4 _1674;
  half4 _1679;
  float _1684;
  float _1693;
  float _1698;
  float _1711;
  float _1714;
  float _1719;
  float _1721;
  float4 _1732;
  float _1736;
  float _1738;
  float _1739;
  float _1740;
  float _1741;
  float _1742;
  float _1743;
  float _1785;
  float _1802;
  float _1803;
  float _1804;
  float _1808;
  float _1823;
  float _1843;
  float _1844;
  float _1845;
  float _1852;
  float _1853;
  float _1854;
  float _1862;
  float _1868;
  float _1878;
  float _1879;
  float _1880;
  float _1908;
  float _1912;
  float _1913;
  float _1914;
  float _1916;
  float _1917;
  float _1918;
  float _1919;
  float _1924;
  float _1926;
  float _1927;
  float _1928;
  float _1929;
  float _1934;
  float _1939;
  float _1941;
  float _1943;
  float _1967;
  float _1971;
  float _1975;
  float _1979;
  float _2017;
  float _2018;
  float _2019;
  float _2023;
  float _2059;
  float _2070;
  float _2071;
  float _2072;
  float _2073;
  float _2077;
  float _2078;
  float _2079;
  float _2095;
  float _2096;
  float _2097;
  float _2098;
  float _2099;
  float _2100;
  float _2101;
  bool _2104;
  float _2106;
  float _2110;
  float _2111;
  float _2115;
  float _2120;
  float _2130;
  float _2134;
  float _2139;
  float _2165;
  float _2176;
  float _2182;
  bool _2183;
  float _2200;
  float _2213;
  half _2226;
  float _2244;
  float _2253;
  float _2254;
  float _2255;
  float _2256;
  float _2257;
  float _2258;
  float _2259;
  float _2260;
  float _2283;
  float _2284;
  float _2285;
  float _2298;
  float _2299;
  float _2300;
  float _2301;
  float _2326;
  float _2327;
  float _2328;
  float _2329;
  float _2342;
  float _2345;
  float _2346;
  float _2356;
  float _2357;
  int _2360;
  int _2361;
  float _2362;
  float _2363;
  int4 _2373;
  int _2380;
  float _2397;
  float _2398;
  float _2399;
  float _2400;
  float _2415;
  float _2416;
  float _2417;
  float _2418;
  bool _2439;
  uint _2440;
  half4 _2442;
  float _2455;
  uint _2461;
  half4 _2462;
  float _2475;
  half4 _2485;
  float _2498;
  half4 _2508;
  float _2521;
  float _2545;
  float _2547;
  float _2549;
  float _2551;
  float _2552;
  float _2555;
  float _2562;
  float _2570;
  float _2571;
  float _2572;
  float _2585;
  float _2595;
  float _2596;
  float _2597;
  float _2605;
  float _2610;
  bool _2611;
  int _2613;
  bool _2632;
  float _2633;
  float2 _2646;
  float _2657;
  float _2687;
  float4 _2696;
  bool _2726;
  float4 _2746;
  float _2762;
  float _2765;
  float _2778;
  float _2779;
  float _2780;
  float _2785;
  float _2790;
  float _2801;
  float _2819;
  float _2831;
  bool _2832;
  float _2835;
  float _2880;
  float _2881;
  float _2882;
  float _2887;
  float _2890;
  float _2897;
  float _2898;
  half4 _2926;
  float _2930;
  float _2931;
  float _2932;
  uint _2935;
  float _2951;
  float _2952;
  float _2953;
  float _2955;
  bool _2968;
  float _3008;
  float _3012;
  float _3014;
  float _3019;
  float _3024;
  float _3032;
  float _3039;
  float2 _3066;
  float _3088;
  float _3106;
  float _3107;
  float _3108;
  float _3124;
  float _3132;
  float _3144;
  float _3147;
  float _3153;
  float _3181;
  float _3183;
  float _3190;
  float _3191;
  float _3192;
  float _3193;
  bool _3221;
  float _3232;
  float _3233;
  float _3234;
  float _3250;
  float _3251;
  float _3252;
  float _3253;
  float _3264;
  float _3269;
  float _3270;
  float _3271;
  float _3273;
  float _3274;
  float _3275;
  float _3276;
  float _3291;
  float _3292;
  float _3293;
  float _3294;
  float _3295;
  float _3296;
  float _3297;
  float _3299;
  float _3300;
  float _3301;
  float _3302;
  float _3303;
  float _3304;
  float _3306;
  float _3308;
  float _3311;
  float _3313;
  float _3314;
  float _3315;
  float _3316;
  float _3317;
  float _3318;
  float _3319;
  float _3322;
  float _3323;
  float _3324;
  float _3329;
  float _3330;
  float _3358;
  int _3359;
  bool _3379;
  float _3380;
  float _3381;
  float _3382;
  float _3395;
  float _3405;
  float _3406;
  float _3407;
  float _3408;
  bool _3409;
  bool _3412;
  float _3425;
  float _3436;
  float _3437;
  float _3439;
  float _3442;
  float _3443;
  float _3451;
  float _3452;
  float _3464;
  float _3468;
  float _3500;
  float _3501;
  float _3502;
  uint _3505;
  bool _3520;
  float _3555;
  float _3559;
  float _3560;
  float _3561;
  float _3564;
  half _3571;
  half _3572;
  half _3573;
  float _3592;
  float _3593;
  float _3594;
  float _3602;
  float _3608;
  float _3615;
  float _3616;
  float _3617;
  float _3618;
  float _3619;
  float _3620;
  float _3624;
  float _3625;
  float _3626;
  float _3628;
  float _3635;
  float _3636;
  float _3637;
  float _3654;
  float _3655;
  float _3656;
  float _3657;
  float _3668;
  half _3678;
  half _3679;
  half _3680;
  float _3684;
  float _3685;
  float _3686;
  float _3690;
  float _3691;
  float _3692;
  float _3714;
  float _3715;
  float _3716;
  float _3721;
  float _3782;
  float _3783;
  float _3784;
  float _3788;
  float _3789;
  float _3790;
  float _3806;
  float _3807;
  float _3811;
  int _47[4];
  _60 = (int)(SV_GroupID.x) & 15;
  _61 = (uint)(_60) >> 2;
  _69 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _47[0] = _69.x;
  _47[1] = _69.y;
  _47[2] = _69.z;
  _47[3] = _69.w;
  _79 = _47[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _83 = select((((int)(SV_GroupID.x) & 16) == 0), _79, ((uint)(_79) >> 16));
  _89 = (((uint)((_60 - (_61 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)(_83 << 5)) & 8160));
  _91 = (((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)(_83) >> 3) & 8160));
  _94 = ((float)((uint)_89)) + 0.5f;
  _95 = ((float)((uint)_91)) + 0.5f;
  _99 = _bufferSizeAndInvSize.z * _94;
  _100 = _95 * _bufferSizeAndInvSize.w;
  _102 = __3__36__0__0__g_depth.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_depth_load]
  _105 = __3__36__0__0__g_stencil.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_stencil_load]
  _107 = _105.x & 127;  // [sem: _3__36__0__0__g_stencil_load_derived]
  _110 = max(1.0000000116860974e-07f, _102.x);  // [sem: _3__36__0__0__g_depth_load_derived]
  _111 = _nearFarProj.x / _110;
  // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
  // Description: Crimson Desert 1.11 changed RenderDiffuseTiled to evaluate partially valid 2x2 quads while preserving the original per-pixel invalid predicate for full-resolution scene-color writes. This block computes the per-pixel invalid flag and quad-lane validity flags used by the 1.11 half-resolution history fallback.
  bool _rndx_invalidPixel = (((_102.x < 1.0000000116860974e-07f) || (_102.x == 1.0f)) || (_107 == 10));
  float _rndx_invalidPixelF = (float)((bool)_rndx_invalidPixel);
  bool _rndx_quadInvalid0 = !(QuadReadLaneAt(_rndx_invalidPixelF, 0) == 0.0f);
  bool _rndx_quadInvalid1 = !(QuadReadLaneAt(_rndx_invalidPixelF, 1) == 0.0f);
  bool _rndx_quadInvalid2 = !(QuadReadLaneAt(_rndx_invalidPixelF, 2) == 0.0f);
  bool _rndx_quadInvalid3 = !(QuadReadLaneAt(_rndx_invalidPixelF, 3) == 0.0f);
  // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  if (!(((_rndx_quadInvalid0 && _rndx_quadInvalid1) && _rndx_quadInvalid2) && _rndx_quadInvalid3)) {
    _119 = __3__36__0__0__g_baseColor.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_baseColor_load]
    _125 = __3__36__0__0__g_normal.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_normal_load]
    _134 = half(((float)((uint)((uint)(((uint)((uint)(_119.x)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _138 = half(((float)((uint)((uint)(_119.x & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _143 = half(((float)((uint)((uint)(((uint)((uint)(_119.y)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _152 = half(((float)((uint)((uint)(((uint)((uint)(_119.z)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _168 = uint((_125.w * 3.0f) + 0.5f);  // [sem: _3__36__0__0__g_normal_load_derived]
    _169 = (_168 == 1);
    _170 = (_168 == 3);
    _180 = (saturate(_125.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _181 = (saturate(_125.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _182 = (saturate(_125.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _184 = rsqrt(dot(float3(_180, _181, _182), float3(_180, _181, _182)));  // [sem: invLength]
    _189 = half(_184 * _181);
    _190 = half(_182 * _184);
  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _193 = ((half)((half)(half(((float)((uint)((uint)(((uint)((uint)(_119.w)) >> 8) & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _194 = ((half)((half)(half(((float)((uint)((uint)(_119.w & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _199 = float(_193 + _194) * 0.5f;
    _200 = float(_193 - _194) * 0.5f;
    _204 = (1.0f - abs(_199)) - abs(_200);
    _206 = rsqrt(dot(float3(_199, _200, _204), float3(_199, _200, _204)));  // [sem: invLength]
    _213 = float(half(_184 * _180));
    _214 = float(_189);
    _215 = float(_190);
    _217 = select((_190 >= 0.0h), 1.0f, -1.0f);
    _220 = -0.0f - (1.0f / (_217 + _215));
    _221 = _214 * _220;
    _222 = _221 * _213;
    _223 = _217 * _213;
    _230 = float(half(_206 * _199));
    _231 = float(half(_206 * _200));
    _232 = float(half(_206 * _204));
    _244 = half(mad(_232, _213, mad(_231, _222, (_230 * (((_223 * _213) * _220) + 1.0f)))));
    _245 = half(mad(_232, _214, mad(_231, ((_221 * _214) + _217), ((_230 * _217) * _222))));
    _246 = half(mad(_232, _215, mad(_231, (-0.0f - _214), (-0.0f - (_223 * _230)))));
    _248 = rsqrt((half)(dot(half3(_244, _245, _246), half3(_244, _245, _246))));  // [sem: invLength]
    _249 = _248 * _244;
    _250 = _248 * _245;
    _251 = _248 * _246;
    _255 = saturate((half)(_134 * _134));  // [sem: expr_sat]
    _256 = saturate((half)(_138 * _138));  // [sem: expr_sat]
    _257 = saturate((half)(_143 * _143));  // [sem: expr_sat]
  // [sem: expr_sat]
    _273 = saturate((half)(((half)(((half)(_256 * 0.3395996h)) + ((half)(_255 * 0.61328125h)))) + ((half)(_257 * 0.04736328h))));
  // [sem: expr_sat]
    _274 = saturate((half)(((half)(((half)(_256 * 0.9165039h)) + ((half)(_255 * 0.07019043h)))) + ((half)(_257 * 0.013450623h))));
  // [sem: expr_sat]
    _275 = saturate((half)(((half)(((half)(_256 * 0.109558105h)) + ((half)(_255 * 0.020614624h)))) + ((half)(_257 * 0.8696289h))));
    _276 = (_107 == 24);
    _277 = (_107 == 29);
    _278 = _276 || _277;
    if (_277) {
      _296 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * float((int)(_91))) + float((int)(_89)));
      _304 = ((uint)((((int)((_296 << 4) + (uint)(-1383041155))) ^ ((int)(_296 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_296) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
      _312 = ((uint)((((int)((_304 << 4) + (uint)(-1556008596))) ^ ((int)(_304 + 1013904242u))) ^ (((uint)(_304) >> 5) + -939442524))) + _296;
      _320 = ((uint)((((int)((_312 << 4) + (uint)(-1383041155))) ^ ((int)(_312 + 1013904242u))) ^ ((int)(((uint)((uint)(_312) >> 5)) + 2123724318u)))) + _304;
      _328 = ((uint)((((int)((_320 << 4) + (uint)(-1556008596))) ^ ((int)(_320 + (uint)(-626627285)))) ^ (((uint)(_320) >> 5) + -939442524))) + _312;
      _336 = ((uint)((((int)((_328 << 4) + (uint)(-1383041155))) ^ ((int)(_328 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_328) >> 5)) + 2123724318u)))) + _320;
      _344 = ((uint)((((int)((_336 << 4) + (uint)(-1556008596))) ^ ((int)(_336 + 2027808484u))) ^ (((uint)(_336) >> 5) + -939442524))) + _328;
      _352 = ((uint)((((int)((_344 << 4) + (uint)(-1383041155))) ^ ((int)(_344 + 2027808484u))) ^ ((int)(((uint)((uint)(_344) >> 5)) + 2123724318u)))) + _336;
      _360 = ((uint)((((int)((_352 << 4) + (uint)(-1556008596))) ^ ((int)(_352 + 387276957u))) ^ (((uint)(_352) >> 5) + -939442524))) + _344;
      _368 = ((uint)((((int)((_360 << 4) + (uint)(-1383041155))) ^ ((int)(_360 + 387276957u))) ^ ((int)(((uint)((uint)(_360) >> 5)) + 2123724318u)))) + _352;
      _376 = ((uint)((((int)((_368 << 4) + (uint)(-1556008596))) ^ ((int)(_368 + (uint)(-1253254570)))) ^ (((uint)(_368) >> 5) + -939442524))) + _360;
      _384 = ((uint)((((int)((_376 << 4) + (uint)(-1383041155))) ^ ((int)(_376 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_376) >> 5)) + 2123724318u)))) + _368;
      _392 = ((uint)((((int)((_384 << 4) + (uint)(-1556008596))) ^ ((int)(_384 + 1401181199u))) ^ (((uint)(_384) >> 5) + -939442524))) + _376;
      _400 = ((uint)((((int)((_392 << 4) + (uint)(-1383041155))) ^ ((int)(_392 + 1401181199u))) ^ ((int)(((uint)((uint)(_392) >> 5)) + 2123724318u)))) + _384;
      _408 = ((uint)((((int)((_400 << 4) + (uint)(-1556008596))) ^ ((int)(_400 + (uint)(-239350328)))) ^ (((uint)(_400) >> 5) + -939442524))) + _392;
      _416 = ((uint)((((int)((_408 << 4) + (uint)(-1383041155))) ^ ((int)(_408 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_408) >> 5)) + 2123724318u)))) + _400;
      if ((_408 & 16777215) == 0) {
        _429 = ((int)(((uint)((((int)((_416 << 4) + (uint)(-1556008596))) ^ ((int)(_416 + (uint)(-1879881855)))) ^ (((uint)(_416) >> 5) + -939442524))) + _408));
      } else {
        _429 = _408;
      }
      _458 = int(min(max(((((saturate(1.0f - (_111 * 0.015625f)) * 4.0f) * ((((float)((uint)((uint)(((int)(_429 * 48271)) & 16777215)))) * 1.1920928955078125e-07f) + -1.0f)) + float((int)((int)((uint)(max((int)(1), (int)(_89))) + (uint)(-1))))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.x * 0.5f) + -2.0f)));
      _459 = int(min(max((float((int)((int)((uint)(max((int)(1), (int)(_91))) + (uint)(-1)))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.y * 0.5f) + -2.0f)));
      _476 = _458;
      _477 = _459;
      _478 = ((_bufferSizeAndInvSize.z * 2.0f) * (float((int)(_458)) + 0.5f));
      _479 = ((_bufferSizeAndInvSize.w * 2.0f) * (float((int)(_459)) + 0.5f));
    } else {
      _476 = ((int)((int)((uint)(max((int)(1), (int)(_89))) + (uint)(-1))) >> 1);
      _477 = ((int)((int)((uint)(max((int)(1), (int)(_91))) + (uint)(-1))) >> 1);
      _478 = _99;
      _479 = _100;
    }
    _482 = __3__36__0__0__g_normalDepthHalf.GatherGreen(__3__40__0__0__g_samplerPoint, float2(_478, _479));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _487 = (uint)((uint)(_482.w)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _491 = (uint)((uint)(_482.z)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _495 = (uint)((uint)(_482.x)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _499 = (uint)((uint)(_482.y)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _524 = (max(0.0f, (_111 + -1.0f)) * 0.05000000074505806f) * _temporalReprojectionParams.y;
    _529 = max(0.0f, (abs(_111 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_482.w & 16777215)))) * 5.960465188081798e-08f)))) - _524));
    _530 = max(0.0f, (abs(_111 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_482.z & 16777215)))) * 5.960465188081798e-08f)))) - _524));
    _531 = max(0.0f, (abs(_111 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_482.x & 16777215)))) * 5.960465188081798e-08f)))) - _524));
    _532 = max(0.0f, (abs(_111 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_482.y & 16777215)))) * 5.960465188081798e-08f)))) - _524));
    _533 = _487 & 127;
    _534 = _491 & 127;
    _535 = _495 & 127;
    _536 = _499 & 127;
    _564 = ((uint)_107 > (uint)11);
    if (_564) {
      if (!(((uint)_107 < (uint)21) || (_107 == 107))) {
        _574 = (_107 == 7);
      } else {
        _574 = true;
      }
    } else {
      if (!(_107 == 6)) {
        _574 = (_107 == 7);
      } else {
        _574 = true;
      }
    }
    _576 = _111 * _111;
    _581 = select(_574, -7.213475227355957f, -72.13475036621094f) * (1.0f / ((select(_574, 0.05000000074505806f, 0.009999999776482582f) * _576) + 1.0f));
    _594 = _105.x & 126;  // [sem: _3__36__0__0__g_stencil_load_derived]
    _595 = (_594 == 66);
    _596 = (_107 == 54);
    _597 = _595 || _596;
    _626 = __3__36__0__0__g_normalDepthHalf.GatherRed(__3__40__0__0__g_samplerPoint, float2(_478, _479));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _645 = min(1.0f, ((((float)((uint)((uint)(_626.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _646 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _647 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _649 = rsqrt(dot(float3(_645, _646, _647), float3(_645, _646, _647)));  // [sem: invLength]
    _653 = float(_249);
    _654 = float(_250);
    _655 = float(_251);
    _671 = min(1.0f, ((((float)((uint)((uint)(_626.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _672 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _673 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _675 = rsqrt(dot(float3(_671, _672, _673), float3(_671, _672, _673)));  // [sem: invLength]
    _694 = min(1.0f, ((((float)((uint)((uint)(_626.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _695 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _696 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _698 = rsqrt(dot(float3(_694, _695, _696), float3(_694, _695, _696)));  // [sem: invLength]
    _717 = min(1.0f, ((((float)((uint)((uint)(_626.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _718 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _719 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_626.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _721 = rsqrt(dot(float3(_717, _718, _719), float3(_717, _718, _719)));  // [sem: invLength]
    _726 = select(_277, 8192.0f, 256.0f);
    _739 = exp2(log2(saturate(dot(float3(_653, _654, _655), float3((_649 * _645), (_649 * _646), (_649 * _647))))) * _726);
    _740 = exp2(log2(saturate(dot(float3(_653, _654, _655), float3((_675 * _671), (_675 * _672), (_675 * _673))))) * _726);
    _741 = exp2(log2(saturate(dot(float3(_653, _654, _655), float3((_698 * _694), (_698 * _695), (_698 * _696))))) * _726);
    _742 = exp2(log2(saturate(dot(float3(_653, _654, _655), float3((_721 * _717), (_721 * _718), (_721 * _719))))) * _726);
    _747 = 1.0f / max(9.999999974752427e-07f, (((_740 + _739) + _741) + _742));
    _750 = ((exp2((_529 * _529) * _581) * ((float)((bool)((uint)(!(_597 ^ (((_487 & 126) == 66) || (_533 == 54)))))))) * _739) * _747;
    _753 = ((exp2((_530 * _530) * _581) * ((float)((bool)((uint)(!(_597 ^ (((_491 & 126) == 66) || (_534 == 54)))))))) * _740) * _747;
    _756 = ((exp2((_531 * _531) * _581) * ((float)((bool)((uint)(!(_597 ^ (((_495 & 126) == 66) || (_535 == 54)))))))) * _741) * _747;
    _759 = ((exp2((_532 * _532) * _581) * ((float)((bool)((uint)(!(_597 ^ (((_499 & 126) == 66) || (_536 == 54)))))))) * _742) * _747;
    if (_277) {
      _790 = abs(((float((int)(_89)) * 0.5f) + -0.25f) - float((int)(_476)));
      _791 = abs(((float((int)(_91)) * 0.5f) + -0.25f) - float((int)(_477)));
    } else {
      _790 = (((float)((uint)((_89 - (_476 << 1)) - ((uint)(_frameNumber.x & 1))))) * 0.5f);
      _791 = (((float)((uint)((_91 - (_477 << 1)) - ((uint)(((uint)((uint)(_frameNumber.x)) >> 1) & 1))))) * 0.5f);
    }
    _792 = saturate(_790);  // [sem: _790_sat]
    _793 = saturate(_791);  // [sem: _791_sat]
    _794 = 1.0f - _792;
    _795 = 1.0f - _793;
    _796 = _795 * _794;
    _797 = _795 * _792;
    _798 = _794 * _793;
    _799 = _793 * _792;
    _808 = (_107 != 29) && ((_759 == 0.0f) && ((_756 == 0.0f) && ((_750 == 0.0f) && (_753 == 0.0f))));
    _817 = saturate(_796 * select(_808, 1.0f, _750));  // [sem: expr_sat]
    _818 = saturate(_797 * select(_808, 1.0f, _753));  // [sem: expr_sat]
    _819 = saturate(_798 * select(_808, 1.0f, _756));  // [sem: expr_sat]
    _820 = saturate(_799 * select(_808, 1.0f, _759));  // [sem: expr_sat]
    _821 = dot(float4(_817, _818, _819, _820), float4(1.0f, 1.0f, 1.0f, 1.0f));
    _822 = max(0.0f, _821);
    _827 = saturate(_817 / _822);  // [sem: expr_sat]
    _828 = saturate(_818 / _822);  // [sem: expr_sat]
    _829 = saturate(_819 / _822);  // [sem: expr_sat]
    _830 = saturate(_820 / _822);  // [sem: expr_sat]
    _834 = (float)((bool)((uint)(((((_536 == 6) || ((_536 == 107) || ((uint)(_536 + -12) < (uint)9))) || (((_535 == 6) || ((_535 == 107) || ((uint)(_535 + -12) < (uint)9))) || (((_533 == 6) || ((_533 == 107) || ((uint)(_533 + -12) < (uint)9))) || ((_534 == 6) || ((_534 == 107) || ((uint)(_534 + -12) < (uint)9)))))) || _574) && (_821 < 9.999999747378752e-05f))));
    _843 = ((_796 - _827) * _834) + _827;
    _844 = ((_797 - _828) * _834) + _828;
    _845 = ((_798 - _829) * _834) + _829;
    _846 = ((_799 - _830) * _834) + _830;
    half4 _848 = __3__36__0__0__g_diffuseResult.Load(int3(_476, _477, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _858 = _476 + 1u;
    half4 _859 = __3__36__0__0__g_diffuseResult.Load(int3(_858, _477, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _872 = _477 + 1u;
    half4 _873 = __3__36__0__0__g_diffuseResult.Load(int3(_476, _872, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    half4 _886 = __3__36__0__0__g_diffuseResult.Load(int3(_858, _872, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _900 = __3__36__0__0__g_specularResult.Load(int3(_476, _477, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _907 = __3__36__0__0__g_specularResult.Load(int3(_858, _477, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _917 = __3__36__0__0__g_specularResult.Load(int3(_476, _872, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _927 = __3__36__0__0__g_specularResult.Load(int3(_858, _872, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _943 = -0.0f - min(0.0f, (-0.0f - ((((float(_848.x) * _843) + (float(_859.x) * _844)) + (float(_873.x) * _845)) + (float(_886.x) * _846))));
    _944 = -0.0f - min(0.0f, (-0.0f - ((((float(_848.y) * _843) + (float(_859.y) * _844)) + (float(_873.y) * _845)) + (float(_886.y) * _846))));
    _945 = -0.0f - min(0.0f, (-0.0f - ((((float(_848.z) * _843) + (float(_859.z) * _844)) + (float(_873.z) * _845)) + (float(_886.z) * _846))));
    half2 _947 = __3__36__0__0__g_sceneAO.Load(int3(_476, _477, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _954 = __3__36__0__0__g_sceneAO.Load(int3(_858, _477, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _962 = __3__36__0__0__g_sceneAO.Load(int3(_476, _872, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _970 = __3__36__0__0__g_sceneAO.Load(int3(_858, _872, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    if (_564) {
      if ((uint)_107 < (uint)20) {
        _993 = 0.0h;
      } else {
        _985 = ((uint)_107 < (uint)19);
        if ((_107 == 65) || (((_107 == 107) || (_107 == 96)) || _985)) {
          _993 = 0.0h;
        } else {
          _993 = (half)(select(_278, 0.0f, (half)(half(((float)((uint)((uint)(_119.y & 255)))) * 0.003921568859368563f))));
        }
      }
    } else {
      if ((uint)_107 > (uint)10) {
        _993 = 0.0h;
      } else {
        _985 = false;
        if ((_107 == 65) || (((_107 == 107) || (_107 == 96)) || _985)) {
          _993 = 0.0h;
        } else {
          _993 = (half)(select(_278, 0.0f, (half)(half(((float)((uint)((uint)(_119.y & 255)))) * 0.003921568859368563f))));
        }
      }
    }
    _995 = (_99 * 2.0f) + -1.0f;
    _997 = 1.0f - (_100 * 2.0f);
    _1033 = mad((_invViewProjRelative[2].w), _110, mad((_invViewProjRelative[1].w), _997, ((_invViewProjRelative[0].w) * _995))) + (_invViewProjRelative[3].w);
    _1034 = (mad((_invViewProjRelative[2].x), _110, mad((_invViewProjRelative[1].x), _997, ((_invViewProjRelative[0].x) * _995))) + (_invViewProjRelative[3].x)) / _1033;
    _1035 = (mad((_invViewProjRelative[2].y), _110, mad((_invViewProjRelative[1].y), _997, ((_invViewProjRelative[0].y) * _995))) + (_invViewProjRelative[3].y)) / _1033;
    _1036 = (mad((_invViewProjRelative[2].z), _110, mad((_invViewProjRelative[1].z), _997, ((_invViewProjRelative[0].z) * _995))) + (_invViewProjRelative[3].z)) / _1033;
    _1038 = rsqrt(dot(float3(_1034, _1035, _1036), float3(_1034, _1035, _1036)));  // [sem: invLength]
    _1040 = ((uint)(_105.x & 24) > (uint)23);  // [sem: _3__36__0__0__g_stencil_load_derived]
    if (_1040) {
      if (_277) {
        _1046 = float(saturate(_152));
      } else {
        _1046 = 0.0f;
      }
      _1048 = uint((half)((half)(half(((float)((uint)((uint)(_119.z & 255)))) * 0.003921568859368563f)) * 255.0h));  // [sem: _3__36__0__0__g_baseColor_load_derived]
      if (_169) {
        _1057 = select(((_1048 & 128) != 0), 1.0f, 0.0f);
        _1058 = (((float)((uint)((uint)(_1048 & 127)))) * 0.007874015718698502f);
      } else {
        _1057 = 0.0f;
        _1058 = 0.0f;
      }
      _1059 = half(_1058);
      _1061 = (_1059 > 0.99902344h);
      _1066 = _1057;
      _1067 = _1046;
      _1068 = _1059;
      _1069 = (half)(select(_278, 0.010002136f, _152));
      _1070 = (half)(select(_1061, 1.0f, _273));
      _1071 = (half)(select(_1061, 1.0f, _274));
      _1072 = (half)(select(_1061, 1.0f, _275));
    } else {
      _1066 = 0.0f;
      _1067 = 0.0f;
      _1068 = _993;
      _1069 = _152;
      _1070 = _273;
      _1071 = _274;
      _1072 = _275;
    }
    // RenoDX: >>> [Patch: FoliageColorCorrect] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x2329885D applies AO+ foliage color shaping to foliage stencil materials at the material base-color stage. This lower-lighting sibling also rebuilds a temporally blended diffuse-cache color later; correcting that cache directly caused blocky AO+ artifacts, so this block mirrors the stable base-color patch point and leaves g_diffuseResultUAV history untouched.
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_107 - 12) < 7u)) {
      float3 _rndx_fcBaseColor = float3(float(_1070), float(_1071), float(_1072));
      half4 _rndx_fcShadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_89, _91, 0));
      float _rndx_fcShadowVis = saturate(dot(float3(_rndx_fcShadow.xyz), float3(0.2126f, 0.7152f, 0.0722f)));
      float3 _rndx_fcCorrected = FoliageColorCorrect(_rndx_fcBaseColor, _sunDirection.xyz, _rndx_fcShadowVis, float3(1.0f, 1.0f, 1.0f));
      float3 _rndx_fscColor = FoliageSelectiveColor(_rndx_fcCorrected);
      _1070 = half(_rndx_fscColor.x);
      _1071 = half(_rndx_fscColor.y);
      _1072 = half(_rndx_fscColor.z);
    }
    // RenoDX: <<< [Patch: FoliageColorCorrect]
    _1073 = _1038 * _1034;
    _1074 = -0.0f - _1073;
    _1075 = _1038 * _1035;
    _1076 = -0.0f - _1075;
    _1077 = _1038 * _1036;
    _1078 = -0.0f - _1077;
    _1080 = saturate(dot(float3(_1074, _1076, _1078), float3(_653, _654, _655)));  // [sem: expr_sat]
    _1082 = ((_105.x & 128) == 0);  // [sem: _3__36__0__0__g_stencil_load_derived]
    if (_1082) {
      if ((uint)_107 > (uint)52) {
        if (!(((_105.x & 125) == 105) || ((uint)_107 < (uint)68))) {
          _1102 = (_107 == 98);
        } else {
          _1102 = true;
        }
      } else {
        if ((uint)_107 > (uint)10) {
          if ((uint)_107 < (uint)20) {
            if (_594 == 14) {
              _1102 = (_107 == 98);
            } else {
              _1102 = true;
            }
          } else {
            if (!((_105.x & 125) == 105)) {
              _1102 = (_107 == 98);
            } else {
              _1102 = true;
            }
          }
        } else {
          _1102 = (_107 == 98);
        }
      }
    } else {
      _1102 = true;
    }
    [branch]
    if (_1040) {
      _1111 = (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(_89, _91, 0)))).x) & 16777215)))) * 5.960465188081798e-08f);
    } else {
      _1111 = _102.x;
    }
    _1139 = mad((_projToPrevProj[2].w), _1111, mad((_projToPrevProj[1].w), _997, ((_projToPrevProj[0].w) * _995))) + (_projToPrevProj[3].w);
    if (_1102) {
      _1146 = __3__36__0__0__g_velocity.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_velocity_load]
      _1152 = (_1146.x * 2.0f);
      _1153 = (_1146.y * 2.0f);
    } else {
      _1152 = (((mad((_projToPrevProj[2].x), _1111, mad((_projToPrevProj[1].x), _997, ((_projToPrevProj[0].x) * _995))) + (_projToPrevProj[3].x)) / _1139) - _995);
      _1153 = (((mad((_projToPrevProj[2].y), _1111, mad((_projToPrevProj[1].y), _997, ((_projToPrevProj[0].y) * _995))) + (_projToPrevProj[3].y)) / _1139) - _997);
    }
    _1155 = _nearFarProj.x / max(1.0000000116860974e-07f, _1111);
    _1158 = (_1152 * 0.5f) + _99;
    _1159 = _100 - (_1153 * 0.5f);
    _1167 = select((((_1158 < 0.0f) || (_1158 > 1.0f)) || ((_1159 < 0.0f) || (_1159 > 1.0f))), 1.0f, 0.0f);
    _1172 = (_1158 * _bufferSizeAndInvSize.x) + -0.5f;
    _1173 = (_1159 * _bufferSizeAndInvSize.y) + -0.5f;
    _1176 = int(floor(_1172));
    _1177 = int(floor(_1173));
    _1178 = float((int)(_1176));
    _1179 = float((int)(_1177));
    _1182 = (_1178 + 0.5f) * _bufferSizeAndInvSize.z;
    _1183 = (_1179 + 0.5f) * _bufferSizeAndInvSize.w;
    _1185 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1182, _1183));  // [sem: _3__36__0__0__g_depthOpaquePrev_gather]
    _1208 = mad(((uint)((uint)(_1185.w)) >> 24), 16777216, mad(((uint)((uint)(_1185.z)) >> 24), 65536, mad(((uint)((uint)(_1185.y)) >> 24), 256, ((uint)((uint)(_1185.x)) >> 24))));
    if (_1082) {
      if ((uint)_107 > (uint)52) {
        if (!((_107 == 98) || (((_105.x & 125) == 105) || ((uint)_107 < (uint)68)))) {
          _1238 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1238 = 0.0f;
        }
      } else {
        if ((uint)_107 > (uint)10) {
          if ((uint)_107 < (uint)20) {
            if (_594 == 14) {
              _1238 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1238 = 0.0f;
            }
          } else {
            if (!((_105.x & 125) == 105)) {
              _1238 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1238 = 0.0f;
            }
          }
        } else {
          _1238 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1238 = 0.0f;
    }
    _1246 = _screenPercentage.x * 2.0f;
    _1247 = _1246 * abs(_99 + -0.5f);
    _1248 = _screenPercentage.y * 2.0f;
    _1249 = _1248 * abs(_100 + -0.5f);
    _1253 = sqrt(dot(float2(_1247, _1249), float2(_1247, _1249)) + 1.0f) * _1155;
    _1270 = _1246 * abs(_1158 + -0.5f);
    _1271 = _1248 * abs(_1159 + -0.5f);
    _1274 = sqrt(dot(float2(_1270, _1271), float2(_1270, _1271)) + 1.0f);
    _1289 = ((uint)(_107 + -97) < (uint)2) || _574;
    _1291 = _1155 * _1155;
    _1293 = (_1291 * select(_1289, 0.5f, 0.20000000298023224f)) + 1.0f;
    _1297 = ((uint)(_107 + -53) < (uint)15);
    if (_1297) {
      _1316 = (1000.0f - (saturate((float)((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _1316 = 50.0f;
    }
    _1323 = (_107 == 57) || _1297;
    _1324 = select(_1323, 0.0f, ((_temporalReprojectionParams.y * 0.10000000149011612f) * max(0.0f, (_1155 + -1.0f))));
    _1329 = max(0.0f, (abs(_1253 - (_1274 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1185.x & 16777215)))) * 5.960465188081798e-08f))) - _1238))) - _1324));
    _1330 = max(0.0f, (abs(_1253 - (_1274 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1185.y & 16777215)))) * 5.960465188081798e-08f))) - _1238))) - _1324));
    _1331 = max(0.0f, (abs(_1253 - (_1274 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1185.z & 16777215)))) * 5.960465188081798e-08f))) - _1238))) - _1324));
    _1332 = max(0.0f, (abs(_1253 - (_1274 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1185.w & 16777215)))) * 5.960465188081798e-08f))) - _1238))) - _1324));
    _1333 = _1329 * _1329;
    _1334 = _1330 * _1330;
    _1335 = _1331 * _1331;
    _1336 = _1332 * _1332;
    _1338 = (-1.4426950216293335f / ((_1291 * 0.10000000149011612f) + 1.0f)) * select(_1289, 0.20000000298023224f, _1316);
    _1351 = select((_1333 > _1293), 0.0f, exp2(_1338 * _1333));
    _1352 = select((_1334 > _1293), 0.0f, exp2(_1334 * _1338));
    _1353 = select((_1335 > _1293), 0.0f, exp2(_1335 * _1338));
    _1354 = select((_1336 > _1293), 0.0f, exp2(_1336 * _1338));
    if (!_1040) {
      _1356 = _1208 & 127;
      _1357 = _1208 & 32512;
      _1358 = _1208 & 8323072;
      _1359 = _1208 & 2130706432;
      _1398 = (_1356 == 57) || ((uint)(_1356 + -53) < (uint)15);
      _1399 = (_1357 == 14592) || ((uint)((((uint)(_1208) >> 8) & 127) + -53) < (uint)15);
      _1400 = (_1358 == 3735552) || ((uint)((((uint)(_1208) >> 16) & 127) + -53) < (uint)15);
      _1401 = (_1359 == 956301312) || ((uint)((((uint)(_1208) >> 24) & 127) + -53) < (uint)15);
      _1414 = _1323 || (!_1082);
      _1423 = (_107 == 6);
      _1445 = ((uint)(_107 + -105) < (uint)3);
      _1483 = (((float)((bool)((uint)((_597 || ((_1356 != 54) && ((_1208 & 126) != 66))) && (!(((_1423 ^ (_1356 == 6)) || ((_1323 ^ _1398) || (_1445 ^ ((_1356 == 107) || ((uint)(_1356 + -105) < (uint)2))))) || ((((_1208 & 128) != 0) || _1398) ^ _1414))))))) * _1351);
      _1484 = (((float)((bool)((uint)((_597 || ((_1357 != 13824) && ((_1208 & 32256) != 16896))) && (!(((_1423 ^ (_1357 == 1536)) || ((_1445 ^ (((_1208 & 32000) == 26880) || (_1357 == 27136))) || (_1323 ^ _1399))) || ((((_1208 & 32768) != 0) || _1399) ^ _1414))))))) * _1352);
      _1485 = (((float)((bool)((uint)((_597 || ((_1358 != 3538944) && ((_1208 & 8257536) != 4325376))) && (!(((_1423 ^ (_1358 == 393216)) || ((_1445 ^ (((_1208 & 8192000) == 6881280) || (_1358 == 6946816))) || (_1323 ^ _1400))) || ((((_1208 & 8388608) != 0) || _1400) ^ _1414))))))) * _1353);
      _1486 = (((float)((bool)((uint)((_597 || ((_1359 != 905969664) && ((_1208 & 2113929216) != 1107296256))) && (!(((_1423 ^ (_1359 == 100663296)) || ((_1445 ^ (((_1208 & 2097152000) == 1761607680) || (_1359 == 1778384896))) || (_1323 ^ _1401))) || ((((int)_1208 < (int)0) || _1401) ^ _1414))))))) * _1354);
    } else {
      _1483 = _1351;
      _1484 = _1352;
      _1485 = _1353;
      _1486 = _1354;
    }
    _1488 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1182, _1183));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather]
    _1507 = min(1.0f, ((((float)((uint)((uint)(_1488.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1508 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1509 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _1511 = rsqrt(dot(float3(_1507, _1508, _1509), float3(_1507, _1508, _1509)));  // [sem: invLength]
    _1516 = saturate(dot(float3(_653, _654, _655), float3((_1511 * _1507), (_1511 * _1508), (_1511 * _1509))));  // [sem: expr_sat]
    _1531 = min(1.0f, ((((float)((uint)((uint)(_1488.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1532 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1533 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _1535 = rsqrt(dot(float3(_1531, _1532, _1533), float3(_1531, _1532, _1533)));  // [sem: invLength]
    _1540 = saturate(dot(float3(_653, _654, _655), float3((_1535 * _1531), (_1535 * _1532), (_1535 * _1533))));  // [sem: expr_sat]
    _1555 = min(1.0f, ((((float)((uint)((uint)(_1488.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1556 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1557 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _1559 = rsqrt(dot(float3(_1555, _1556, _1557), float3(_1555, _1556, _1557)));  // [sem: invLength]
    _1564 = saturate(dot(float3(_653, _654, _655), float3((_1559 * _1555), (_1559 * _1556), (_1559 * _1557))));  // [sem: expr_sat]
    _1579 = min(1.0f, ((((float)((uint)((uint)(_1488.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1580 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _1581 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_1488.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _1583 = rsqrt(dot(float3(_1579, _1580, _1581), float3(_1579, _1580, _1581)));  // [sem: invLength]
    _1588 = saturate(dot(float3(_653, _654, _655), float3((_1583 * _1579), (_1583 * _1580), (_1583 * _1581))));  // [sem: expr_sat]
    _1591 = select((_596 || (_595 || _1289)), 0.009999999776482582f, 1.0f);
    _1608 = _1172 - _1178;
    _1609 = _1173 - _1179;
    _1610 = 1.0f - _1608;
    _1611 = 1.0f - _1609;
    _1616 = (_1610 * _1609) * _1483;
    _1618 = (_1609 * _1608) * _1484;
    _1620 = (_1611 * _1608) * _1485;
    _1622 = (_1611 * _1610) * _1486;
    _1624 = saturate(select(_1040, 1.0f, (pow(_1564, _1591))) * _1616);  // [sem: expr_sat]
    _1625 = saturate(select(_1040, 1.0f, (pow(_1588, _1591))) * _1618);  // [sem: expr_sat]
    _1626 = saturate(select(_1040, 1.0f, (pow(_1540, _1591))) * _1620);  // [sem: expr_sat]
    _1627 = saturate(select(_1040, 1.0f, (pow(_1516, _1591))) * _1622);  // [sem: expr_sat]
    _1630 = asint(__3__37__0__0__g_structureCounterBuffer.Load(8));
    _1631 = WaveReadLaneFirst(_1630);
    [branch]
    if (!(_1631 == 0)) {
      _1639 = (((uint)(__3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(_89) >> 5), ((int)(_91) >> 5), 0)))).x) & 4;
      _1641 = (uint)(_1639) >> 2;
      if (!(_1639 == 0)) {
        _1649 = max((saturate(dot(float3(_943, _944, _945), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1167);
        _1650 = _1641;
      } else {
        _1649 = _1167;
        _1650 = _1641;
      }
    } else {
      _1649 = _1167;
      _1650 = 0;
    }
  // [sem: expr_sat]
    _1660 = saturate(max(_1649, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    _1661 = _1177 + 1u;
    half4 _1663 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1176, _1661, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _1668 = _1176 + 1u;
    half4 _1669 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1668, _1661, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _1674 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1668, _1177, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _1679 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1176, _1177, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _1684 = dot(float4(_1624, _1625, _1626, _1627), float4(1.0f, 1.0f, 1.0f, 1.0f));
  // [sem: expr_sat]
    _1693 = saturate(dot(float4(_1624, _1625, _1626, _1627), float4(float(_1663.w), float(_1669.w), float(_1674.w), float(_1679.w))) * (1.0f / max(1.0f, _1684)));
    _1698 = sqrt((_1153 * _1153) + (_1152 * _1152)) * 50.0f;
    if (_1297) {
      _1707 = saturate(1.0f - _1698);  // [sem: expr_sat]
    } else {
      _1707 = (1.0f - (saturate(_1698) * 0.5f));  // [sem: expr_sat]
    }
    _1711 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    _1714 = min(31.0f, ((_1707 * 15.0f) * _1711));
    if (_277) {
      _1718 = min(2.0f, _1714);
    } else {
      _1718 = _1714;
    }
    _1719 = select(_276, 1.0f, _1693);
    _1721 = (_1719 * _1719) * 4.0f;
    _1732 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_99, _100), 0.0f);  // [sem: _3__36__0__0__g_manyLightsMoments_sampleLod]
    _1736 = saturate(_1732.w);  // [sem: expr_sat]
    _1738 = 1.0f / max(9.999999974752427e-07f, _1684);
    _1739 = _1738 * _1624;
    _1740 = _1738 * _1625;
    _1741 = _1738 * _1626;
    _1742 = _1738 * _1627;
    _1743 = saturate(saturate(max(_1660, (1.0f / ((saturate(_1721) * _1718) + 1.0f))) + _renderParams.z));  // [sem: expr_sat]
    _1785 = 1.0f / _exposure4.x;
    _1802 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1742 * float(_1679.x)) + ((_1741 * float(_1674.x)) + ((_1739 * float(_1663.x)) + (_1740 * float(_1669.x))))))) * _exposure4.y)))));
    _1803 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1742 * float(_1679.y)) + ((_1741 * float(_1674.y)) + ((_1739 * float(_1663.y)) + (_1740 * float(_1669.y))))))) * _exposure4.y)))));
    _1804 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1742 * float(_1679.z)) + ((_1741 * float(_1674.z)) + ((_1739 * float(_1663.z)) + (_1740 * float(_1669.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      _1808 = dot(float3(_1802, _1803, _1804), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _1823 = ((min(_1808, _1732.y) / max(9.999999974752427e-07f, _1808)) * _1736) + saturate(1.0f - _1736);
      _1828 = saturate((saturate(((_1732.x - _1808) * 5.0f) / max(9.999999974752427e-07f, _1732.x)) * 0.5f) + _1743);  // [sem: expr_sat]
      _1829 = (_1823 * _1802);
      _1830 = (_1823 * _1803);
      _1831 = (_1823 * _1804);
    } else {
      _1828 = _1743;  // [sem: expr_sat]
      _1829 = _1802;
      _1830 = _1803;
      _1831 = _1804;
    }
    if (!_276) {
      _1836 = saturate(_1693 + 0.0625f);  // [sem: expr_sat]
    } else {
      _1836 = 0.0f;  // [sem: expr_sat]
    }
    _1843 = ((_943 - _1829) * _1828) + _1829;
    _1844 = ((_944 - _1830) * _1828) + _1830;
    _1845 = ((_945 - _1831) * _1828) + _1831;
    __3__38__0__1__g_diffuseResultUAV[int2(_89, _91)] = float4((half)(half(_1843)), (half)(half(_1844)), (half)(half(_1845)), (half)(half(_1836)));
    _1852 = float(_1070);
    _1853 = float(_1071);
    _1854 = float(_1072);
    if (_107 == 53) {
      _1861 = saturate(((_1853 + _1852) + _1854) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _1861 = 1.0f;  // [sem: expr_sat]
    }
    _1862 = float(_1068);
    _1868 = (0.699999988079071f / min(max(max(max(_1852, _1853), _1854), 0.009999999776482582f), 0.699999988079071f)) * _1861;
    _1878 = (((_1868 * _1852) + -0.03999999910593033f) * _1862) + 0.03999999910593033f;
    _1879 = (((_1868 * _1853) + -0.03999999910593033f) * _1862) + 0.03999999910593033f;
    _1880 = (((_1868 * _1854) + -0.03999999910593033f) * _1862) + 0.03999999910593033f;
    if (!_1040) {
  // [sem: expr_sat]
      _1888 = saturate((((1.0f - (float(_947.x) * _843)) - (float(_954.x) * _844)) - (float(_962.x) * _845)) - (float(_970.x) * _846));
    } else {
      _1888 = 1.0f;  // [sem: expr_sat]
    }
    if (!((_594 == 96) || (_107 == 98))) {
      if ((uint)(_107 + -105) < (uint)2) {
        _1899 = _169;
        _1906 = (half)(select(((_107 == 65) || ((_107 == 107) || _1899)), 0.0f, _1068));
      } else {
        if (!((uint)(_107 + -11) < (uint)9)) {
          _1899 = false;
          _1906 = (half)(select(((_107 == 65) || ((_107 == 107) || _1899)), 0.0f, _1068));
        } else {
          _1906 = 0.0h;
        }
      }
    } else {
      _1906 = 0.0h;
    }
    _1908 = dot(float3(_1073, _1075, _1077), float3(_653, _654, _655)) * 2.0f;
    _1912 = _1073 - (_1908 * _653);
    _1913 = _1075 - (_1908 * _654);
    _1914 = _1077 - (_1908 * _655);
    _1916 = rsqrt(dot(float3(_1912, _1913, _1914), float3(_1912, _1913, _1914)));  // [sem: invLength]
    _1917 = _1912 * _1916;
    _1918 = _1913 * _1916;
    _1919 = _1914 * _1916;
    _1924 = float(_1069);
    _1926 = select((_1924 < 0.800000011920929f), ((__3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_99, _100), 0.0f)).x), 0.0f);
    _1927 = _1926 * _1917;
    _1928 = _1926 * _1918;
    _1929 = _1926 * _1919;
    _1934 = dot(float3(_1927, _1928, _1929), float3((-0.0f - _653), (-0.0f - _654), (-0.0f - _655))) * 2.0f;
    _1939 = ((_1934 * _653) + _1034) + _1927;
    _1941 = ((_1934 * _654) + _1035) + _1928;
    _1943 = ((_1934 * _655) + _1036) + _1929;
    _1967 = mad((_viewProjRelative[2].x), _1943, mad((_viewProjRelative[1].x), _1941, (_1939 * (_viewProjRelative[0].x)))) + (_viewProjRelative[3].x);
    _1971 = mad((_viewProjRelative[2].y), _1943, mad((_viewProjRelative[1].y), _1941, (_1939 * (_viewProjRelative[0].y)))) + (_viewProjRelative[3].y);
    _1975 = mad((_viewProjRelative[2].z), _1943, mad((_viewProjRelative[1].z), _1941, (_1939 * (_viewProjRelative[0].z)))) + (_viewProjRelative[3].z);
    _1979 = mad((_viewProjRelative[2].w), _1943, mad((_viewProjRelative[1].w), _1941, (_1939 * (_viewProjRelative[0].w)))) + (_viewProjRelative[3].w);
    _2017 = mad((_projToPrevProj[3].w), _1979, mad((_projToPrevProj[2].w), _1975, mad((_projToPrevProj[1].w), _1971, ((_projToPrevProj[0].w) * _1967))));
    _2018 = mad((_projToPrevProj[3].x), _1979, mad((_projToPrevProj[2].x), _1975, mad((_projToPrevProj[1].x), _1971, ((_projToPrevProj[0].x) * _1967)))) / _2017;
    _2019 = mad((_projToPrevProj[3].y), _1979, mad((_projToPrevProj[2].y), _1975, mad((_projToPrevProj[1].y), _1971, ((_projToPrevProj[0].y) * _1967)))) / _2017;
    _2023 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[3].z), _1979, mad((_projToPrevProj[2].z), _1975, mad((_projToPrevProj[1].z), _1971, ((_projToPrevProj[0].z) * _1967)))) / _2017));
    _2059 = mad((_invViewProjRelativePrev[2].w), _2023, mad((_invViewProjRelativePrev[1].w), _2019, ((_invViewProjRelativePrev[0].w) * _2018))) + (_invViewProjRelativePrev[3].w);
    _2070 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[2].x), _2023, mad((_invViewProjRelativePrev[1].x), _2019, ((_invViewProjRelativePrev[0].x) * _2018))) + (_invViewProjRelativePrev[3].x)) / _2059) - _1939);
    _2071 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[2].y), _2023, mad((_invViewProjRelativePrev[1].y), _2019, ((_invViewProjRelativePrev[0].y) * _2018))) + (_invViewProjRelativePrev[3].y)) / _2059) - _1941);
    _2072 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _2023, mad((_invViewProjRelativePrev[1].z), _2019, ((_invViewProjRelativePrev[0].z) * _2018))) + (_invViewProjRelativePrev[3].z)) / _2059) - _1943);
    _2073 = dot(float3(_2070, _2071, _2072), float3(_1917, _1918, _1919));
    _2077 = _2070 - (_2073 * _1917);
    _2078 = _2071 - (_2073 * _1918);
    _2079 = _2072 - (_2073 * _1919);
    _2095 = (saturate(_1926 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2077 * _2077) + (_2078 * _2078)) + (_2079 * _2079)) / max(0.0010000000474974513f, _1926))) + -1.0f)) + 1.0f;
    _2096 = _2095 * _2095;
    _2097 = _2096 * _2096;
    _2098 = _2097 * _1564;
    _2099 = _2097 * _1588;
    _2100 = _2097 * _1540;
    _2101 = _2097 * _1516;
    _2104 = (_renderParams.z > 0.0f);
    _2106 = float(1.0h - _1069);
    _2110 = (_2018 - (_1967 / _1979)) - _1152;
    _2111 = (_2019 - (_1971 / _1979)) - _1153;
    _2115 = sqrt((_2111 * _2111) + (_2110 * _2110));
  // [sem: expr_sat]
    _2120 = saturate((((_2106 * _2106) * (1.0f - (_1080 * 0.8999999761581421f))) * _2115) * select(_2104, 2000.0f, 500.0f));
    _2130 = select(((_277 || _1040) || ((_594 == 24) || (_renderParams.y > 0.0f))), 1.0f, ((((float(_954.y) * _844) + (float(_947.y) * _843)) + (float(_962.y) * _845)) + (float(_970.y) * _846)));
    _2134 = float(_1906);
    _2139 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
  // [sem: expr_sat]
    _2165 = saturate(saturate(1.0f - (((_2134 * _111) / max(0.0010000000474974513f, _1080)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2139 * 0.07500000298023224f)) + max(0.019999999552965164f, _1924)) + (saturate(_111 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_111 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2134) * 0.75f)));
    if (_107 == 64) {
      _2174 = ((saturate(_111 * 0.25f) * (_2165 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2174 = _2165;
    }
    _2176 = (_2139 * 16.0f) + 16.0f;
    _2182 = select((_2139 > 1.0f), 0.0f, saturate((1.0f / _2176) * (_111 - _2176)));
    _2183 = (_107 == 105);
    if (_2183) {
      _2191 = 1.0f;
      _2195 = select((_107 == 65), 0.0f, _2191);
    } else {
      if (!_1040) {
        _2191 = select((_107 == 107), 1.0f, ((_2182 + _2174) - (_2182 * _2174)));
        _2195 = select((_107 == 65), 0.0f, _2191);
      } else {
        _2195 = 0.0f;
      }
    }
    _2200 = select(_1323, 31.0f, 63.0f);
    if (!_277) {
      _2213 = (saturate((2000.0f - (saturate(float(_1906 * 0.5h) + (_111 * 0.0625f)) * 1500.0f)) * _2115) * (7.0f - _2200)) + _2200;
      if ((uint)(_107 + -12) < (uint)9) {
        _2223 = ((saturate(_111 * 0.004999999888241291f) * (_2213 + -2.0f)) + 2.0f);
      } else {
        _2223 = _2213;
      }
    } else {
      _2223 = _2200;
    }
    _2226 = max(0.040008545h, _1069);
  // [sem: expr_sat]
    _2244 = saturate(max(max(_1660, select(_2104, (_2120 + 0.125f), 0.0f)), (1.0f / (((saturate((_1711 * _1711) * _1721) * min(64.0f, (_2223 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2195) + (_111 * 0.0078125f)) + float(((half)(_2226 * _2226)) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    if ((uint)_107 > (uint)52) {
      if ((uint)_107 < (uint)68) {
        if (_595) {
          _2272 = _2098;
          _2273 = _2099;
          _2274 = _2100;
          _2275 = _2101;
          _2278 = _2272;
          _2279 = _2273;
          _2280 = _2274;
          _2281 = _2275;
          _2282 = (half)(max(0.89990234h, _1069));
        } else {
          if (!_596) {
            _2253 = _2098 * _2098;
            _2254 = _2099 * _2099;
            _2255 = _2100 * _2100;
            _2256 = _2101 * _2101;
            _2257 = _2253 * _2253;
            _2258 = _2254 * _2254;
            _2259 = _2255 * _2255;
            _2260 = _2256 * _2256;
            _2266 = (_2257 * _2257);
            _2267 = (_2258 * _2258);
            _2268 = (_2259 * _2259);
            _2269 = (_2260 * _2260);
          } else {
            _2266 = _2098;
            _2267 = _2099;
            _2268 = _2100;
            _2269 = _2101;
          }
          if (_597) {
            _2272 = _2266;
            _2273 = _2267;
            _2274 = _2268;
            _2275 = _2269;
            _2278 = _2272;
            _2279 = _2273;
            _2280 = _2274;
            _2281 = _2275;
            _2282 = (half)(max(0.89990234h, _1069));
          } else {
            _2278 = _2266;
            _2279 = _2267;
            _2280 = _2268;
            _2281 = _2269;
            _2282 = (half)(max(0.099975586h, _1069));
          }
        }
      } else {
        _2278 = _2098;
        _2279 = _2099;
        _2280 = _2100;
        _2281 = _2101;
        _2282 = (half)(max(0.099975586h, _1069));
      }
    } else {
      _2266 = _2098;
      _2267 = _2099;
      _2268 = _2100;
      _2269 = _2101;
      if (_597) {
        _2272 = _2266;
        _2273 = _2267;
        _2274 = _2268;
        _2275 = _2269;
        _2278 = _2272;
        _2279 = _2273;
        _2280 = _2274;
        _2281 = _2275;
        _2282 = (half)(max(0.89990234h, _1069));
      } else {
        _2278 = _2266;
        _2279 = _2267;
        _2280 = _2268;
        _2281 = _2269;
        _2282 = (half)(max(0.099975586h, _1069));
      }
    }
    _2283 = float(_2282);
    _2284 = _2283 * _2283;
    _2285 = _2284 * _2284;
    _2298 = (((_2285 * _2278) - _2278) * _2278) + 1.0f;
    _2299 = (((_2285 * _2279) - _2279) * _2279) + 1.0f;
    _2300 = (((_2285 * _2280) - _2280) * _2280) + 1.0f;
    _2301 = (((_2285 * _2281) - _2281) * _2281) + 1.0f;
    _2326 = saturate(select(_277, 1.0f, saturate((_2285 / (_2298 * _2298)) * _2278)) * _1616);  // [sem: expr_sat]
    _2327 = saturate(select(_277, 1.0f, saturate((_2285 / (_2299 * _2299)) * _2279)) * _1618);  // [sem: expr_sat]
    _2328 = saturate(select(_277, 1.0f, saturate((_2285 / (_2300 * _2300)) * _2280)) * _1620);  // [sem: expr_sat]
    _2329 = saturate(select(_277, 1.0f, saturate((_2285 / (_2301 * _2301)) * _2281)) * _1622);  // [sem: expr_sat]
    [branch]
    if (_1040) {
      _2342 = mad((_projToPrevProj[2].w), _102.x, mad((_projToPrevProj[1].w), _997, ((_projToPrevProj[0].w) * _995))) + (_projToPrevProj[3].w);
      _2345 = ((mad((_projToPrevProj[2].x), _102.x, mad((_projToPrevProj[1].x), _997, ((_projToPrevProj[0].x) * _995))) + (_projToPrevProj[3].x)) / _2342) - _995;
      _2346 = ((mad((_projToPrevProj[2].y), _102.x, mad((_projToPrevProj[1].y), _997, ((_projToPrevProj[0].y) * _995))) + (_projToPrevProj[3].y)) / _2342) - _997;
      _2356 = (((_2345 * 0.5f) + _99) * _bufferSizeAndInvSize.x) + -0.5f;
      _2357 = ((_100 - (_2346 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      _2360 = int(floor(_2356));
      _2361 = int(floor(_2357));
      _2362 = float((int)(_2360));
      _2363 = float((int)(_2361));
      [branch]
      if (_277) {
  // [sem: _3__36__0__0__g_stencilPrev_gather]
        _2373 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_2362 + 0.5f) * _bufferSizeAndInvSize.z), ((_2363 + 0.5f) * _bufferSizeAndInvSize.w)));
        _2380 = mad(_2373.w, 16777216, mad(_2373.z, 65536, mad(_2373.y, 256, _2373.x)));
        _2397 = saturate(((float)((bool)(uint)((uint)(_2380 & 24) > (uint)23))) * _2326);  // [sem: expr_sat]
        _2398 = saturate(((float)((bool)(uint)((uint)(_2380 & 6144) > (uint)5888))) * _2327);  // [sem: expr_sat]
        _2399 = saturate(((float)((bool)(uint)((uint)(_2380 & 1572864) > (uint)1507328))) * _2328);  // [sem: expr_sat]
        _2400 = saturate(((float)((bool)(uint)((uint)(_2380 & 402653184) > (uint)385875968))) * _2329);  // [sem: expr_sat]
        _2432 = max(saturate(min(max(((_1067 / ((_576 * 0.004999999888241291f) + 1.0f)) + (_2120 * 0.5f)), 0.03125f), 0.5f) + _2244), saturate(1.0f - dot(float4(_2397, _2398, _2399, _2400), float4(1.0f, 1.0f, 1.0f, 1.0f))));
        _2433 = _2360;
        _2434 = _2361;
        _2435 = _2397;
        _2436 = _2398;
        _2437 = _2399;
        _2438 = _2400;
      } else {
        _2415 = _2356 - _2362;
        _2416 = _2357 - _2363;
        _2417 = 1.0f - _2415;
        _2418 = 1.0f - _2416;
        _2432 = (saturate((sqrt((_2346 * _2346) + (_2345 * _2345)) * 50.0f) + 0.125f) * 0.875f);
        _2433 = _2360;
        _2434 = _2361;
        _2435 = (_2417 * _2416);
        _2436 = (_2416 * _2415);
        _2437 = (_2418 * _2415);
        _2438 = (_2418 * _2417);
      }
    } else {
      _2432 = _2244;
      _2433 = _1176;
      _2434 = _1177;
      _2435 = _2326;
      _2436 = _2327;
      _2437 = _2328;
      _2438 = _2329;
    }
    _2439 = (_2134 > 0.20000000298023224f);
    _2440 = _2434 + 1u;
    half4 _2442 = __3__36__0__0__g_specularResultPrev.Load(int3(_2433, _2440, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _2455 = ((float)((bool)((uint)(!(_2439 ^ ((half)(_2442.w) < 0.0h)))))) * _2435;
    _2461 = _2433 + 1u;
    half4 _2462 = __3__36__0__0__g_specularResultPrev.Load(int3(_2461, _2440, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _2475 = ((float)((bool)((uint)(!(_2439 ^ ((half)(_2462.w) < 0.0h)))))) * _2436;
    half4 _2485 = __3__36__0__0__g_specularResultPrev.Load(int3(_2461, _2434, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _2498 = ((float)((bool)((uint)(!(_2439 ^ ((half)(_2485.w) < 0.0h)))))) * _2437;
    half4 _2508 = __3__36__0__0__g_specularResultPrev.Load(int3(_2433, _2434, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _2521 = ((float)((bool)((uint)(!(_2439 ^ ((half)(_2508.w) < 0.0h)))))) * _2438;
    _2545 = 1.0f / max(((saturate(_111 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_2455, _2475, _2498, _2521), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    _2547 = -0.0f - (min(0.0f, (-0.0f - ((((_2455 * float(_2442.x)) + (_2475 * float(_2462.x))) + (_2498 * float(_2485.x))) + (_2521 * float(_2508.x))))) * _2545);
    _2549 = -0.0f - (min(0.0f, (-0.0f - ((((_2455 * float(_2442.y)) + (_2475 * float(_2462.y))) + (_2498 * float(_2485.y))) + (_2521 * float(_2508.y))))) * _2545);
    _2551 = -0.0f - (min(0.0f, (-0.0f - ((((_2455 * float(_2442.z)) + (_2475 * float(_2462.z))) + (_2498 * float(_2485.z))) + (_2521 * float(_2508.z))))) * _2545);
    _2552 = _2545 * min(0.0f, (-0.0f - ((((_2455 * abs(float(_2442.w))) + (_2475 * abs(float(_2462.w)))) + (_2498 * abs(float(_2485.w)))) + (_2521 * abs(float(_2508.w))))));
    if (_renderParams.y == 0.0f) {
      _2555 = dot(float3(_2547, _2549, _2551), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _2562 = ((min(_2555, _1732.z) / max(9.999999717180685e-10f, _2555)) * _1736) + saturate(1.0f - _1736);
      _2567 = (_2562 * _2547);
      _2568 = (_2562 * _2549);
      _2569 = (_2562 * _2551);
    } else {
      _2567 = _2547;
      _2568 = _2549;
      _2569 = _2551;
    }
    _2570 = _2567 * _exposure4.y;
    _2571 = _2568 * _exposure4.y;
    _2572 = _2569 * _exposure4.y;
    _2585 = ((max(0.0010000000474974513f, _1888) + _2552) * _2432) - _2552;
    _2595 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2130 * ((((_907.x * _844) + (_900.x * _843)) + (_917.x * _845)) + (_927.x * _846))) - _2570) * _2432) + _2570))));
    _2596 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2130 * ((((_907.y * _844) + (_900.y * _843)) + (_917.y * _845)) + (_927.y * _846))) - _2571) * _2432) + _2571))));
    _2597 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2130 * ((((_907.z * _844) + (_900.z * _843)) + (_917.z * _845)) + (_927.z * _846))) - _2572) * _2432) + _2572))));
    __3__38__0__1__g_specularResultUAV[int2(_89, _91)] = float4((half)(half(_2595)), (half)(half(_2596)), (half)(half(_2597)), (half)(half(select(_2439, (-0.0f - _2585), _2585))));
    _2605 = select(_1040, 0.0f, _2585);
    _2610 = float(half(lerp(_2605, 1.0f, _1924)));
    _2611 = (_594 == 64);
    _2613 = ((int)(uint)(_170)) ^ 1;
    if ((_2613 & ((int)(uint)(_2611))) == 0) {
      _2629 = saturate(exp2((_2610 * _2610) * (_111 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _2629 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);  // [sem: expr_sat]
    }
    _2632 = (_cavityParams.x == 0.0f);
    _2633 = select(_2632, 1.0f, _2629);
    if (_2611) {
      _2639 = (_2633 * _1878);
      _2640 = (_2633 * _1879);
      _2641 = (_2633 * _1880);
    } else {
      _2639 = _1878;
      _2640 = _1879;
      _2641 = _1880;
    }
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
    _2646 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1080), (1.0f - _2610)), 0.0f);
    _2657 = select((_2611 || _1040), 1.0f, _2633) * _1785;
    if (!_1297) {
      if ((_107 != 7) && (!((_107 == 6) || ((_594 == 106) || (((uint)(_107 + -27) < (uint)2) || ((_107 == 26) || (_1040 || _2183))))))) {
        _2687 = exp2(log2(_2605) * (saturate(_111 * 0.03125f) + 1.0f));
        _2696 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_99, _100), 0.0f);  // [sem: _3__36__0__0__g_puddleMask_sampleLod]
        bool __branch_chain_2681;
        if ((_107 == 15) || ((_594 == 12) || ((_105.x & 124) == 16))) {
          _2715 = false;
          _2716 = true;
          __branch_chain_2681 = true;
        } else {
          if (!((uint)_107 > (uint)10)) {
            _2715 = true;
            _2716 = _2183;
            __branch_chain_2681 = true;
          } else {
            if ((uint)_107 < (uint)20) {
              _2715 = false;
              _2716 = _2183;
              __branch_chain_2681 = true;
            } else {
              if (!(_107 == 97)) {
                _2715 = (_107 != 107);
                _2716 = _2183;
                __branch_chain_2681 = true;
              } else {
                _2908 = _1862;
                _2909 = _1924;
                _2910 = _1852;
                _2911 = _1853;
                _2912 = _1854;
                __branch_chain_2681 = false;
              }
            }
          }
        }
        if (__branch_chain_2681) {
          if (_2696.w < 1.0f) {
            if ((_weatherCheckFlag & 5) == 5) {
              _2726 = (_107 == 36);
              if (!_2726) {
  // [sem: _3__36__0__0__g_climateSandTex_sampleLod]
                _2746 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _1034) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x) >> 1))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _1036) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y) >> 1))) / float((int)(_climateTextureSize.y))))), 0.0f);
                _2752 = _2746.x;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2753 = _2746.y;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2754 = _2746.z;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2755 = _2746.w;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
              } else {
                _2752 = 0.11999999731779099f;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2753 = 0.11999999731779099f;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2754 = 0.10000000149011612f;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
                _2755 = 0.5f;  // [sem: _3__36__0__0__g_climateSandTex_sampleLod_derived]
              }
              _2762 = 1.0f - saturate(((_viewPos.y + _1035) - _paramGlobalSand.x) / _paramGlobalSand.y);
              if (!(_2762 <= 0.0f)) {
                _2765 = saturate(_2687);  // [sem: _2687_sat]
                _2778 = ((_2753 * 0.3395099937915802f) + (_2752 * 0.6131200194358826f)) + (_2754 * 0.047370001673698425f);
                _2779 = ((_2753 * 0.9163600206375122f) + (_2752 * 0.07020000368356705f)) + (_2754 * 0.013450000435113907f);
                _2780 = ((_2753 * 0.10958000272512436f) + (_2752 * 0.02061999961733818f)) + (_2754 * 0.8697999715805054f);
                _2785 = select(_2716, 1.0f, ((float)((bool)(uint)(saturate(dot(float3(_653, _654, _655), float3(0.0f, 1.0f, 0.0f))) > 0.5f))));
                if (_enableSandAO == 1) {
                  _2790 = 1.0f - _2696.x;  // [sem: _3__36__0__0__g_puddleMask_sampleLod_derived]
                  if (_2726) {
                    _2821 = ((((_2790 * 10.0f) * _2755) * _2762) * _2765);
                    _2824 = _2778;
                    _2825 = _2779;
                    _2826 = _2780;
                    _2827 = saturate(_2821);  // [sem: _2821_sat]
                  } else {
                    _2801 = saturate(_2755 + -0.5f);  // [sem: expr_sat]
                    _2824 = _2778;
                    _2825 = _2779;
                    _2826 = _2780;
  // [sem: _2821_sat]
                    _2827 = ((((_2801 * 2.0f) * max((_2785 * _2696.x), min((_2765 * ((_2696.x * 7.0f) + 3.0f)), (_2801 * 40.0f)))) + (((_2790 * 10.0f) * _2765) * saturate((0.5f - _2755) * 2.0f))) * _2762);
                  }
                } else {
                  _2819 = ((_2762 * _2755) * _2696.x) * _2785;
                  if (_2726) {
                    _2821 = _2819;
                    _2824 = _2778;
                    _2825 = _2779;
                    _2826 = _2780;
                    _2827 = saturate(_2821);  // [sem: _2821_sat]
                  } else {
                    _2824 = _2778;
                    _2825 = _2779;
                    _2826 = _2780;
                    _2827 = _2819;  // [sem: _2821_sat]
                  }
                }
              } else {
                _2824 = 0.0f;
                _2825 = 0.0f;
                _2826 = 0.0f;
                _2827 = 0.0f;  // [sem: _2821_sat]
              }
              _2831 = ((1.0f - _2696.w) * (1.0f - _2696.y)) * _2827;
              _2832 = (_2831 > 9.999999747378752e-05f);
              if (_2832) {
                if (_2716) {
                  _2835 = saturate(_2831);  // [sem: _2831_sat]
                  _2862 = (((sqrt(_2824 * _1852) - _1852) * _2835) + _1852);
                  _2863 = (((sqrt(_2825 * _1853) - _1853) * _2835) + _1853);
                  _2864 = (((sqrt(_2826 * _1854) - _1854) * _2835) + _1854);
                } else {
                  _2862 = ((_2831 * (_2824 - _1852)) + _1852);
                  _2863 = ((_2831 * (_2825 - _1853)) + _1853);
                  _2864 = ((_2831 * (_2826 - _1854)) + _1854);
                }
              } else {
                _2862 = _1852;
                _2863 = _1853;
                _2864 = _1854;
              }
              if (_2726 && _2832) {
                if (_2716) {
                  _2879 = (((sqrt(_1924 * 0.25f) - _1924) * saturate(_2831)) + _1924);
                } else {
                  _2879 = ((_2831 * (0.25f - _1924)) + _1924);
                }
              } else {
                _2879 = _1924;
              }
              _2880 = saturate(_2862);  // [sem: _2862_sat]
              _2881 = saturate(_2863);  // [sem: _2863_sat]
              _2882 = saturate(_2864);  // [sem: _2864_sat]
              _2887 = (_2879 * (1.0f - _2687)) + _2687;
              _2890 = ((_2879 - _2887) * _2696.y) + _2887;
              _2897 = (((_2687 * _2687) * _2696.z) * ((float)((bool)_2715))) * saturate(dot(float3(_653, _654, _655), float3(0.0f, 1.0f, 0.0f)));
              _2898 = _2897 * -0.5f;
              _2908 = (_1862 - (_2687 * _1862));
              _2909 = (_2890 - (_2897 * _2890));
              _2910 = ((_2898 * _2880) + _2880);
              _2911 = ((_2898 * _2881) + _2881);
              _2912 = ((_2898 * _2882) + _2882);
            } else {
              _2908 = _1862;
              _2909 = _1924;
              _2910 = _1852;
              _2911 = _1853;
              _2912 = _1854;
            }
          } else {
            _2908 = _1862;
            _2909 = _1924;
            _2910 = _1852;
            _2911 = _1853;
            _2912 = _1854;
          }
        }
        _2919 = (half)(half(_2908));
        _2920 = (half)(half(_2909));
        _2921 = (half)(half(_2910));
        _2922 = (half)(half(_2911));
        _2923 = (half)(half(_2912));
        _2924 = _2687;
      } else {
        _2919 = _1068;
        _2920 = _1069;
        _2921 = _1070;
        _2922 = _1071;
        _2923 = _1072;
        _2924 = _2605;
      }
    } else {
      _2919 = _1068;
      _2920 = _1069;
      _2921 = _1070;
      _2922 = _1071;
      _2923 = _1072;
      _2924 = _2605;
    }
    half4 _2926 = __3__36__0__0__g_sceneShadowColor.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_sceneShadowColor_load]
    _2930 = float(_2926.x);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _2931 = float(_2926.y);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _2932 = float(_2926.z);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    [branch]
    if (_1040) {
      _2935 = __3__36__0__0__g_sceneNormal.Load(int3(_89, _91, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
      _2951 = min(1.0f, ((((float)((uint)((uint)(_2935.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _2952 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2935.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _2953 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2935.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
      _2955 = rsqrt(dot(float3(_2951, _2952, _2953), float3(_2951, _2952, _2953)));  // [sem: invLength]
      _2963 = (half)(half(_2955 * _2951));
      _2964 = (half)(half(_2955 * _2952));
      _2965 = (half)(half(_2955 * _2953));
    } else {
      _2963 = _249;
      _2964 = _250;
      _2965 = _251;
    }
    _2968 = (_sunDirection.y > 0.0f);
    if ((_2968) || ((!(_2968)) && (_sunDirection.y > _moonDirection.y))) {
      _2980 = _sunDirection.x;
      _2981 = _sunDirection.y;
      _2982 = _sunDirection.z;
    } else {
      _2980 = _moonDirection.x;
      _2981 = _moonDirection.y;
      _2982 = _moonDirection.z;
    }
    if ((_2968) || ((!(_2968)) && (_sunDirection.y > _moonDirection.y))) {
      _3002 = _precomputedAmbient7.y;
    } else {
      _3002 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    _3008 = (_earthRadius + _1035) + _viewPos.y;
    _3012 = (_1036 * _1036) + (_1034 * _1034);
    _3014 = sqrt((_3008 * _3008) + _3012);
    _3019 = dot(float3((_1034 / _3014), (_3008 / _3014), (_1036 / _3014)), float3(_2980, _2981, _2982));
    _3024 = min(max(((_3014 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    _3032 = max(_3024, 0.0f);
    _3039 = (-0.0f - sqrt((_3032 + (_earthRadius * 2.0f)) * _3032)) / (_3032 + _earthRadius);
    if (_3019 > _3039) {
      _3062 = ((exp2(log2(saturate((_3019 - _3039) / (1.0f - _3039))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _3062 = ((exp2(log2(saturate((_3039 - _3019) / (_3039 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
  // [sem: _3__36__0__0__g_texNetDensity_sampleLod]
    _3066 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3024 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _3062), 0.0f);
    _3088 = ((_3066.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);  // [sem: _3__36__0__0__g_texNetDensity_sampleLod_derived]
    _3106 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _3066.x) + _3088) * -1.4426950216293335f);
    _3107 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _3066.x) + _3088) * -1.4426950216293335f);
    _3108 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (((float)((uint)((uint)(_rayleighScatteringColor & 255)))) * 1.960784317134312e-07f)) * _3066.x) + _3088) * -1.4426950216293335f);
    _3124 = sqrt(_3012);
    _3132 = (_cloudAltitude - (max(((_3124 * _3124) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    _3144 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_2981 > 0.0f))) - ((int)(uint)((int)(_2981 < 0.0f))))) * 0.5f))) + _3132;
    if (_1035 < _3132) {
      _3147 = dot(float3(0.0f, 1.0f, 0.0f), float3(_2980, _2981, _2982));
      _3153 = select((abs(_3147) < 9.99999993922529e-09f), 1e+08f, ((_3144 - dot(float3(0.0f, 1.0f, 0.0f), float3(_1034, _1035, _1036))) / _3147));
      _3159 = ((_3153 * _2980) + _1034);
      _3160 = _3144;
      _3161 = ((_3153 * _2982) + _1036);
    } else {
      _3159 = _1034;
      _3160 = _1035;
      _3161 = _1036;
    }
    _3181 = saturate(abs(_2981) * 4.0f);  // [sem: expr_sat]
    _3183 = (_3181 * _3181) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_3159 * 4.999999873689376e-05f) + 0.5f), ((_3160 - _3132) / _cloudThickness), ((_3161 * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
    _3190 = ((1.0f - _3183) * saturate(((_1035 - _cloudThickness) - _3132) * 0.10000000149011612f)) + _3183;
    _3191 = _3190 * (((_3107 * 0.3395099937915802f) + (_3106 * 0.6131200194358826f)) + (_3108 * 0.047370001673698425f));
    _3192 = _3190 * (((_3107 * 0.9163600206375122f) + (_3106 * 0.07020000368356705f)) + (_3108 * 0.013450000435113907f));
    _3193 = _3190 * (((_3107 * 0.10958000272512436f) + (_3106 * 0.02061999961733818f)) + (_3108 * 0.8697999715805054f));
    if (!(_564) | !(((uint)_107 < (uint)20) || (_107 == 107))) {
      _3218 = (_107 == 20);
    } else {
      _3218 = true;
    }
    if (_107 == 19) {
      _3227 = true;
      _3230 = _3227;
      _3231 = (_107 == 106);
    } else {
      _3221 = (_107 == 107);
      if (!((_594 == 26) || (_2183 || (_107 == 28)))) {
        _3227 = _3221;
        _3230 = _3227;
        _3231 = (_107 == 106);
      } else {
        _3230 = _3221;
        _3231 = true;
      }
    }
    _3232 = float(_2963);
    _3233 = float(_2964);
    _3234 = float(_2965);
    if (_107 == 97) {
      _3245 = (((uint)((uint)((int)(min16uint)((int)(((int)(((uint16_t)(__3__36__0__0__g_sceneDecalMask.Load(int3(_89, _91, 0)))).x)) & 2)))) >> 1) + 97);
    } else {
      _3245 = _107;
    }
    _3250 = float(saturate(_189));
    _3251 = _3250 * _3250;
    _3252 = _3251 * _3251;
    _3253 = _3252 * _3252;
    _3264 = ((_3253 * _3253) * select((_277 || (_3230 || _3231)), 0.0f, 1.0f)) * (((float4)(__3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _94), (_bufferSizeAndInvSize.w * _95)), 0.0f))).y);
    _3269 = _3232 - (_3264 * _3232);
    _3270 = (_3264 * (1.0f - _3233)) + _3233;
    _3271 = _3234 - (_3264 * _3234);
    _3273 = rsqrt(dot(float3(_3269, _3270, _3271), float3(_3269, _3270, _3271)));  // [sem: invLength]
    _3274 = _3269 * _3273;
    _3275 = _3270 * _3273;
    _3276 = _3271 * _3273;
    if ((_2968) || ((!(_2968)) && (_sunDirection.y > _moonDirection.y))) {
      _3288 = _sunDirection.x;
      _3289 = _sunDirection.y;
      _3290 = _sunDirection.z;
    } else {
      _3288 = _moonDirection.x;
      _3289 = _moonDirection.y;
      _3290 = _moonDirection.z;
    }
    _3291 = _lightingParams.x * _3002;
    _3292 = (((_3191 * 0.6131200194358826f) + (_3192 * 0.3395099937915802f)) + (_3193 * 0.047370001673698425f)) * _3291;
    _3293 = (((_3191 * 0.07020000368356705f) + (_3192 * 0.9163600206375122f)) + (_3193 * 0.013450000435113907f)) * _3291;
    _3294 = (((_3191 * 0.02061999961733818f) + (_3192 * 0.10958000272512436f)) + (_3193 * 0.8697999715805054f)) * _3291;
    _3295 = _3288 - _1073;
    _3296 = _3289 - _1075;
    _3297 = _3290 - _1077;
    _3299 = rsqrt(dot(float3(_3295, _3296, _3297), float3(_3295, _3296, _3297)));  // [sem: invLength]
    _3300 = _3299 * _3295;
    _3301 = _3299 * _3296;
    _3302 = _3299 * _3297;
    _3303 = dot(float3(_3232, _3233, _3234), float3(_3288, _3289, _3290));
    _3304 = dot(float3(_3274, _3275, _3276), float3(_3288, _3289, _3290));
    _3306 = saturate(dot(float3(_3232, _3233, _3234), float3(_1074, _1076, _1078)));  // [sem: expr_sat]
    _3308 = saturate(dot(float3(_3274, _3275, _3276), float3(_3300, _3301, _3302)));  // [sem: expr_sat]
    _3311 = saturate(dot(float3(_3288, _3289, _3290), float3(_3300, _3301, _3302)));  // [sem: expr_sat]
    _3313 = float(max(0.010002136h, _2920));
    _3314 = saturate(_3303);  // [sem: _3303_sat]
    _3315 = _3313 * _3313;
    _3316 = _3315 * _3315;
    _3317 = 1.0f - _3316;
    _3318 = 1.0f - _3311;
    _3319 = _3318 * _3318;
    _3322 = ((_3319 * _3319) * _3318) + _3311;
    _3323 = 1.0f - _3314;
    _3324 = _3323 * _3323;
    _3329 = 1.0f - _3306;
    _3330 = _3329 * _3329;
  // [sem: expr_sat]
    _3358 = saturate((_3314 * 0.31830987334251404f) * ((((((1.0f - ((_3324 * _3324) * (_3323 * 0.75f))) * (1.0f - ((_3330 * _3330) * (_3329 * 0.75f)))) - _3322) * saturate((_3317 * 2.200000047683716f) + -0.5f)) + _3322) + ((exp2(-0.0f - (max(((_3317 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_3308))) * _3311) * ((((_3317 * 34.5f) + -59.0f) * _3317) + 24.5f))));
    _3359 = _3245 & 126;
    bool __branch_chain_3287;
    if ((_3245 == 98) || (_3359 == 96)) {
      _3370 = true;
      __branch_chain_3287 = true;
    } else {
      if ((uint)(_3245 + -105) < (uint)2) {
        _3370 = _169;
        __branch_chain_3287 = true;
      } else {
        if (!((uint)(_3245 + -11) < (uint)9)) {
          _3370 = false;
          __branch_chain_3287 = true;
        } else {
          __branch_chain_3287 = false;
        }
      }
    }
    if (__branch_chain_3287) {
      if ((_3245 == 65) || ((_3245 == 107) || _3370)) {
        _3378 = 0.0f;
      } else {
        _3378 = float(_2919);
      }
    } else {
      _3378 = 0.0f;
    }
    _3379 = (_3245 == 53);
    _3380 = float(_2921);
    _3381 = float(_2922);
    _3382 = float(_2923);
    if (_3379) {
      _3389 = saturate(((_3381 + _3380) + _3382) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _3389 = 1.0f;  // [sem: expr_sat]
    }
    _3395 = (0.699999988079071f / min(max(max(max(_3380, _3381), _3382), 0.009999999776482582f), 0.699999988079071f)) * _3389;
    _3405 = (((_3395 * _3380) + -0.03999999910593033f) * _3378) + 0.03999999910593033f;
    _3406 = (((_3395 * _3381) + -0.03999999910593033f) * _3378) + 0.03999999910593033f;
    _3407 = (((_3395 * _3382) + -0.03999999910593033f) * _3378) + 0.03999999910593033f;
    _3408 = float(_2920);
    _3409 = (_3359 == 64);
    _3412 = ((((int)(uint)(_3409)) & _2613) == 0);
    if (_3412) {
      _3424 = saturate(exp2((_3408 * _3408) * (_111 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _3424 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);  // [sem: expr_sat]
    }
    _3425 = select(_2632, 1.0f, _3424);
    if (_3409) {
      _3431 = (_3425 * _3405);
      _3432 = (_3425 * _3406);
      _3433 = (_3425 * _3407);
    } else {
      _3431 = _3405;
      _3432 = _3406;
      _3433 = _3407;
    }
    _3436 = saturate(1.0f - saturate(dot(float3(_1074, _1076, _1078), float3(_3300, _3301, _3302))));  // [sem: expr_sat]
    _3437 = _3436 * _3436;
    _3439 = (_3437 * _3437) * _3436;
    _3442 = _3439 * saturate(_3432 * 50.0f);
    _3443 = 1.0f - _3439;
    if (!_277) {
      _3451 = saturate(_3304);  // [sem: _3304_sat]
      _3452 = 1.0f - _3315;
      _3464 = (((_3316 * _3308) - _3308) * _3308) + 1.0f;
      _3468 = (_3316 / ((_3464 * _3464) * 3.1415927410125732f)) * (0.5f / ((((_3452 * _3306) + _3315) * _3304) + (((_3452 * _3304) + _3315) * _3306)));
      _3482 = ((_3451 * _2930) * max((_3468 * ((_3443 * _3431) + _3442)), 0.0f));
      _3483 = ((_3451 * _2931) * max((_3468 * ((_3443 * _3432) + _3442)), 0.0f));
      _3484 = ((_3451 * _2932) * max((_3468 * ((_3443 * _3433) + _3442)), 0.0f));
    } else {
      _3482 = 0.0f;
      _3483 = 0.0f;
      _3484 = 0.0f;
    }
    // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x2329885D adds AO+ foliage transmission to the non-material-table vanilla direct-light path while leaving the sibling's broader direct-light material behavior native.
    float _rndx_foliageTransR = 0.0f;
    float _rndx_foliageTransG = 0.0f;
    float _rndx_foliageTransB = 0.0f;
    if (FOLIAGE_TRANSMISSION > 0.0f && ((uint)(_107 - 12) < 7u)) {
      FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
          float3(_1074, _1076, _1078),
          float3(_3288, _3289, _3290),
          float3(_3232, _3233, _3234),
          _3303,
          float3(_3380, _3381, _3382),
          float3(_2930, _2931, _2932),
          float3(_3292, _3293, _3294),
          FOLIAGE_TRANSMISSION_THICKNESS);
      _rndx_foliageTransR = _rndx_ftResult.transmission.x;
      _rndx_foliageTransG = _rndx_ftResult.transmission.y;
      _rndx_foliageTransB = _rndx_ftResult.transmission.z;
      if (_rndx_ftResult.diffuseScale > 0.0f) {
        _3358 *= _rndx_ftResult.diffuseScale;
      } else {
        float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
        _3358 = max(0.0f, (_3303 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
      }
    }
    // RenoDX: <<< [Patch: FoliageTransmission]
    if (_3218 || (_3359 == 6)) {
      _3493 = ((max(0.0f, (0.30000001192092896f - _3303)) * 0.23190687596797943f) + _3358);
    } else {
      _3493 = _3358;
    }
    // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x2329885D adds the AO+ foliage transmission contribution into resolved direct diffuse lighting before vanilla AWB sampling and final scene color composition.
    _3500 = ((_2930 * _3493) * _3292) + (_1843 * _1785) + _rndx_foliageTransR;
    _3501 = ((_2931 * _3493) * _3293) + (_1844 * _1785) + _rndx_foliageTransG;
    _3502 = ((_2932 * _3493) * _3294) + (_1845 * _1785) + _rndx_foliageTransB;
    // RenoDX: <<< [Patch: FoliageTransmission]
    _3505 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_3505 + _89)) | ((int)(_3505 + _91))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(_89) >> 5), ((int)(_91) >> 5))] = float4((half)(half(_3500)), (half)(half(_3501)), (half)(half(_3502)), 1.0f);
    }
    _3520 = ((uint)(_3245 & 24) > (uint)23);
    if (_3412) {
      _3537 = saturate(exp2((_3408 * _3408) * (_111 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _3537 = select((_cavityParams.z > 0.0f), select(_170, 0.0f, _1066), 1.0f);  // [sem: expr_sat]
    }
    _3555 = select(_3409, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _3537) * select((_169 && _3520), (1.0f - _1066), 1.0f)));
    _3559 = min(60000.0f, (_3555 * (((((_2646.x * _2639) + _2646.y) * _2595) * _2657) - min(0.0f, (-0.0f - (_3292 * _3482))))));
    _3560 = min(60000.0f, (_3555 * (((((_2646.x * _2640) + _2646.y) * _2596) * _2657) - min(0.0f, (-0.0f - (_3293 * _3483))))));
    _3561 = min(60000.0f, (_3555 * (((((_2646.x * _2641) + _2646.y) * _2597) * _2657) - min(0.0f, (-0.0f - (_3294 * _3484))))));
    _3564 = 1.0f - _renderParams.x;
    _3571 = half((_renderParams.x * _3380) + _3564);
    _3572 = half((_renderParams.x * _3381) + _3564);
    _3573 = half((_renderParams.x * _3382) + _3564);
    if (_3409 && (_renderParams2.x == 0.0f)) {
      _3589 = (half)(exp2((half)((half)(log2(_3571)) * 0.5h)));
      _3590 = (half)(exp2((half)((half)(log2(_3572)) * 0.5h)));
      _3591 = (half)(exp2((half)((half)(log2(_3573)) * 0.5h)));
    } else {
      _3589 = _3571;
      _3590 = _3572;
      _3591 = _3573;
    }
    _3592 = float(_3589);
    _3593 = float(_3590);
    _3594 = float(_3591);
    if (_3379) {
      _3601 = saturate(((_3593 + _3592) + _3594) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _3601 = 1.0f;  // [sem: expr_sat]
    }
    _3602 = float(_2919);
    _3608 = (0.699999988079071f / min(max(max(max(_3592, _3593), _3594), 0.009999999776482582f), 0.699999988079071f)) * _3601;
    _3615 = ((_3608 * _3592) + -0.03999999910593033f) * _3602;
    _3616 = ((_3608 * _3593) + -0.03999999910593033f) * _3602;
    _3617 = ((_3608 * _3594) + -0.03999999910593033f) * _3602;
    _3618 = _3615 + 0.03999999910593033f;
    _3619 = _3616 + 0.03999999910593033f;
    _3620 = _3617 + 0.03999999910593033f;
    _3624 = (_3618 * _2646.x) + _2646.y;
    _3625 = (_3619 * _2646.x) + _2646.y;
    _3626 = (_3620 * _2646.x) + _2646.y;
    _3628 = (1.0f - _2646.y) - _2646.x;
    _3635 = ((0.9599999785423279f - _3615) * 0.0476190485060215f) + _3618;
    _3636 = ((0.9599999785423279f - _3616) * 0.0476190485060215f) + _3619;
    _3637 = ((0.9599999785423279f - _3617) * 0.0476190485060215f) + _3620;
    _3654 = saturate(1.0f - _2924);  // [sem: expr_sat]
    _3655 = (((_3624 * _3635) / (1.0f - (_3635 * _3628))) * _3628) * _3654;
    _3656 = (((_3625 * _3636) / (1.0f - (_3636 * _3628))) * _3628) * _3654;
    _3657 = (((_3626 * _3637) / (1.0f - (_3637 * _3628))) * _3628) * _3654;
    _3668 = float(1.0h - _2919);
    _3678 = half(((_3592 * _3668) * saturate((1.0f - _3655) - _3624)) + _3655);
    _3679 = half(((_3593 * _3668) * saturate((1.0f - _3656) - _3625)) + _3656);
    _3680 = half(((_3594 * _3668) * saturate((1.0f - _3657) - _3626)) + _3657);
    _3684 = float(_3678) * _3500;
    _3685 = float(_3679) * _3501;
    _3686 = float(_3680) * _3502;
    _3690 = _3684 + (_3559 * _3602);
    _3691 = _3685 + (_3560 * _3602);
    _3692 = _3686 + (_3561 * _3602);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Crimson Desert 1.11 avoids averaging half-resolution history across a 2x2 quad that contains any invalid lane. This preserves the current lane value for mixed valid/invalid quads instead of blending in invalid neighbors.
    if (!(((_rndx_quadInvalid0 || _rndx_quadInvalid1) || _rndx_quadInvalid2) || _rndx_quadInvalid3)) {
      _3714 = ((((QuadReadLaneAt(_3690, 1) + QuadReadLaneAt(_3690, 0)) + QuadReadLaneAt(_3690, 2)) + QuadReadLaneAt(_3690, 3)) * 0.25f);
      _3715 = ((((QuadReadLaneAt(_3691, 1) + QuadReadLaneAt(_3691, 0)) + QuadReadLaneAt(_3691, 2)) + QuadReadLaneAt(_3691, 3)) * 0.25f);
      _3716 = ((((QuadReadLaneAt(_3692, 1) + QuadReadLaneAt(_3692, 0)) + QuadReadLaneAt(_3692, 2)) + QuadReadLaneAt(_3692, 3)) * 0.25f);
    } else {
      _3714 = _3690;
      _3715 = _3691;
      _3716 = _3692;
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
    [branch]
    if (((_91 | _89) & 1) == 0) {
      _3721 = dot(float3(_3714, _3715, _3716), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(_89) >> 1), ((int)(_91) >> 1))] = float4(min(60000.0f, _3714), min(60000.0f, _3715), min(60000.0f, _3716), min(60000.0f, select((_1650 != 0), (-0.0f - _3721), _3721)));
    }
    if (_3520) {
      _3743 = ((_2919 == 0.0h) && (!(((!(_3678 == 0.0h)) && (!(_3679 == 0.0h))) && (!(_3680 == 0.0h)))));
    } else {
      _3743 = false;
    }
    if ((_3520 || ((_3245 == 96) || ((_3245 == 54) || ((_3245 & 124) == 64)))) || ((!(_3520 || ((_3245 == 96) || ((_3245 == 54) || ((_3245 & 124) == 64))))) && ((_111 <= 10.0f) && ((uint)(_3245 + -97) < (uint)2)))) {
      __3__38__0__1__g_sceneSpecularUAV[int2(_89, _91)] = float4(((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _3559)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _3560)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _3561)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _2605)))))));
      _3779 = _3684;
      _3780 = _3685;
      _3781 = _3686;
    } else {
      _3779 = (_3684 + _3559);
      _3780 = (_3685 + _3560);
      _3781 = (_3686 + _3561);
    }
    _3782 = min(60000.0f, _3779);
    _3783 = min(60000.0f, _3780);
    _3784 = min(60000.0f, _3781);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Because the 1.11 RenderDiffuseTiled body can run for invalid lanes in partially valid quads, this guard preserves vanilla 1.11 behavior by preventing invalid pixels from reading, accumulating, or storing full-resolution scene color.
    if (!_rndx_invalidPixel) {
    [branch]
    if (_3743) {
      _3788 = __3__38__0__1__g_sceneColorUAV[int2(_89, _91)].x;
      _3789 = __3__38__0__1__g_sceneColorUAV[int2(_89, _91)].y;
      _3790 = __3__38__0__1__g_sceneColorUAV[int2(_89, _91)].z;
      _3795 = (_3788 + _3782);
      _3796 = (_3789 + _3783);
      _3797 = (_3790 + _3784);
    } else {
      _3795 = _3782;
      _3796 = _3783;
      _3797 = _3784;
    }
    if (!(_renderParams.y == 0.0f)) {
      _3806 = dot(float3(_3795, _3796, _3797), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _3807 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _3806);
      _3811 = max(9.999999717180685e-10f, _3806);
      _3816 = ((_3807 * _3795) / _3811);
      _3817 = ((_3807 * _3796) / _3811);
      _3818 = ((_3807 * _3797) / _3811);
    } else {
      _3816 = _3795;
      _3817 = _3796;
      _3818 = _3797;
    }
    // RenoDX: >>> [Patch: FoliageFinalAO] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x2329885D applies RenoDX foliage AO darkening to the final direct-lit scene color for foliage stencil materials, using vanilla blended scene AO and shadow visibility so direct light remains naturally occluded.
    if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_107 - 12) < 7u)) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_89, _91, 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_sceneAO = saturate(1.0f - _1888);
      float _rndx_ao = lerp(1.0f, _rndx_sceneAO, _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _3816 *= _rndx_ao;
      _3817 *= _rndx_ao;
      _3818 *= _rndx_ao;
    }
    // RenoDX: <<< [Patch: FoliageFinalAO]
    __3__38__0__1__g_sceneColorUAV[int2(_89, _91)] = float4(_3816, _3817, _3818, 1.0f);
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  }
}
