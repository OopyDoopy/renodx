#include "../tonemap.hlsli"

struct PostProcessWorldLoadingStruct {
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float _ringRatio;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _depthOuterMaskRadius;
  uint _invertDepthMask;
  float _depthIntensity;
  float _depthContrast;
  float _voronoiDotDensity;
  float _voronoiMovementSpeed;
  float _voronoiOffset;
  float3 _voronoiScrollSpeed;
  float _voronoiDotThreshold;
  float _voronoiDotRatio;
  float _rippleIntensity;
  float _rippleWidth;
  float _rippleCount;
  float _rippleContrast;
  float _rippleSpeed;
  float3 _ripplePosOffset;
  uint _noiseTex;
  float _bigRippleIntensity;
  float _bigRippleWidth;
  float _bigRipplePhaseOffset;
  float _bigRippleSpeed;
  float _bigRippleDistortionIntensity;
  float _bigRippleContrast;
  float _starburstIntensity;
  float _vignetteIntensity;
  uint _excludePlayer;
  float _ppWorldLoadingRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

cbuffer GlobalMaterialGlobalParameter_Common : register(b50, space98) {
  float3 _mainPosition : packoffset(c000.x);
  float3 _mainPositionPrev : packoffset(c001.x);
  float3 _targetFocusPosition : packoffset(c002.x);
  float _hpPercentage : packoffset(c002.w);
  uint _skinnedMeshNoiseTexture : packoffset(c003.x);
  float _highLightForVision : packoffset(c003.y);
  float _highLightForVisionRemoteCatch : packoffset(c003.z);
  float _characterHighlight : packoffset(c003.w);
  uint _specialModeType : packoffset(c004.x);
  float _visionRadius : packoffset(c004.y);
  float _interactionTime : packoffset(c004.z);
  float3 _questGuideWorldPosition : packoffset(c005.x);
  float3 _detectModeUp : packoffset(c006.x);
  float3 _detectModeLook : packoffset(c007.x);
  float3 _detectModePosition : packoffset(c008.x);
  float2 _detectModeLightProfileOffset : packoffset(c009.x);
  uint _detectModeLightProfileIndex : packoffset(c009.z);
  float _detectModeAngle : packoffset(c009.w);
  float _detectModeRadius : packoffset(c010.x);
  uint _useHatMode : packoffset(c010.y);
  uint4 _oreVeinBitMask : packoffset(c011.x);
  uint _oreVeinDissolveIndex : packoffset(c012.x);
  float _oreVeinDissolveRatio : packoffset(c012.y);
  float _hideStateRatio : packoffset(c012.z);
  float3 _hazardAlertPosition : packoffset(c013.x);
  float _wantedRegionRatio : packoffset(c013.w);
  float _wantedRegionOpacity : packoffset(c014.x);
  float _wantedRegionRadius : packoffset(c014.y);
  float3 _wantedRegionPosition : packoffset(c015.x);
  float _elementActivateDuration : packoffset(c015.w);
  float _temperatureWarning : packoffset(c016.x);
  float _electrocutionWarning : packoffset(c016.y);
  float _fleeCount : packoffset(c016.z);
  float _followLearning : packoffset(c016.w);
  float4 _enemyAlert1 : packoffset(c017.x);
  float4 _enemyAlert2 : packoffset(c018.x);
  float _pullingEffectAttractionOffRadius : packoffset(c019.x);
  float _pullingEffectPushFromCharacter : packoffset(c019.y);
  float _pullingEffectPushScale : packoffset(c019.z);
  float _pullingEffectAttractionScale : packoffset(c019.w);
  float _pullingEffectExternalScale : packoffset(c020.x);
  float _pullingEffectVectorFieldScale : packoffset(c020.y);
  float _pullingEffectHeightOffset : packoffset(c020.z);
  float _housingPreviewState : packoffset(c020.w);
  float _customEffectOpacity : packoffset(c021.x);
  uint _renderPassInteraction : packoffset(c021.y);
  uint _renderPassSelfPlayer : packoffset(c021.z);
  uint _renderPassEnemy : packoffset(c021.w);
  uint _renderPassTargetFocus : packoffset(c022.x);
  uint _renderPassLearning : packoffset(c022.y);
  uint _renderPassTest : packoffset(c022.z);
  uint _enableChromaticAberration : packoffset(c022.w);
  uint _renderPassDetectObjective : packoffset(c023.x);
  uint _renderPassDetectItem : packoffset(c023.y);
  uint _renderPassDetectGimmick : packoffset(c023.z);
  uint _renderPassDetectRemoteCatch : packoffset(c023.w);
  uint _renderPassDetectPickedRemoteCatch : packoffset(c024.x);
  uint _renderPassDetectLift : packoffset(c024.y);
  uint _renderPassKnowledgeNPC : packoffset(c024.z);
  uint _renderPassKnowledgeGain : packoffset(c024.w);
  uint _renderPassAnamorphicMural : packoffset(c025.x);
  uint _renderPassMemoryBackground : packoffset(c025.y);
  uint _renderPassMemory : packoffset(c025.z);
  uint _renderPassEnemyBoss : packoffset(c025.w);
  uint _renderPassAimHighlight : packoffset(c026.x);
  float4 _aimHighlightPosition : packoffset(c027.x);
  uint _renderPassNPCGhost : packoffset(c028.x);
  uint _renderPassHousing : packoffset(c028.y);
};

struct BindlessParameters_PostProcessWorldLoading {
  PostProcessWorldLoadingStruct BindlessParameters_PostProcessWorldLoading;
};

typedef BindlessParameters_PostProcessWorldLoading BindlessParameters_PostProcessWorldLoading_t;
ConstantBuffer<BindlessParameters_PostProcessWorldLoading_t> BindlessParameters_PostProcessWorldLoading[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _29;
  uint2 _31;
  float _64;
  float _65;
  float _66;
  float _75;
  float _84;
  float4 _94;
  float _107;
  float _108;
  float _109;
  float _111;
  float _112;
  float _113;
  float _114;
  float _116;
  float _117;
  float _118;
  float _119;
  float _155;
  float _156;
  float _157;
  float _158;
  float _194;
  float _195;
  float _196;
  float _197;
  float _199;
  float _200;
  float _201;
  float _202;
  float4 _205;
  bool _211;
  float _216;
  float _217;
  float _218;
  float _229;
  float _230;
  float _231;
  int _239;
  float _247;
  float _248;
  float _258;
  float _259;
  float _267;
  float _269;
  int _270;
  float _344;
  float _546;
  float _547;
  float _548;
  float _763;
  float _764;
  float _889;
  float _890;
  float _891;
  float _1014;
  float _1080;
  float _1081;
  float _1082;
  float _1083;
  int _1084;
  float _1089;
  float _1090;
  float _1091;
  float _1092;
  int _1093;
  float _1098;
  float _1099;
  float _1100;
  float _1101;
  int _1102;
  float _1258;
  float _1259;
  float _1260;
  float _1261;
  float _1262;
  float _1263;
  float _1369;
  float _1370;
  float _1371;
  float _1372;
  int _1373;
  float _1378;
  float _1379;
  float _1380;
  float _1381;
  int _1382;
  float _1387;
  float _1388;
  float _1389;
  float _1390;
  int _1391;
  float _1536;
  float _1537;
  float _1538;
  int _1539;
  float _1613;
  float _1614;
  float _1615;
  float _1652;
  float _1653;
  float _1654;
  float _2224;
  float _2225;
  float _2226;
  float _2273;
  float _2478;
  float _2479;
  float _2480;
  float _2573;
  float _2574;
  float _2575;
  float _2695;
  float _2696;
  float _2697;
  float _2715;
  float _2716;
  float _2717;
  float _2750;
  float _2751;
  float _2752;
  float _2766;
  float _2767;
  float _2768;
  float _277;
  float _281;
  float _285;
  float _286;
  float _290;
  float _294;
  float _295;
  float _299;
  float _303;
  float _306;
  float _307;
  float _308;
  float _309;
  float _313;
  float _321;
  float _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _336;
  float _340;
  int _341;
  float _348;
  float _349;
  float _350;
  float _351;
  float _355;
  float _359;
  float _360;
  float _364;
  float _368;
  float _369;
  float _373;
  float _377;
  float _378;
  float _380;
  float _381;
  float _382;
  float _384;
  float _389;
  float _390;
  float _391;
  float _392;
  float _393;
  float _394;
  float _396;
  float _404;
  float _406;
  float _410;
  float _414;
  float _421;
  float _422;
  float _423;
  float _424;
  float _434;
  float _438;
  float _442;
  float _446;
  float _452;
  float _453;
  float _454;
  float _455;
  float _456;
  float _457;
  float _468;
  float _472;
  float _476;
  float _478;
  float _484;
  float _485;
  float _486;
  float _487;
  float _488;
  float _489;
  float _500;
  float _502;
  float _504;
  float _506;
  float _514;
  float _515;
  float _516;
  float _518;
  float _522;
  float _525;
  float _529;
  float _541;
  float _553;
  float _554;
  float _555;
  float _556;
  int _566;
  float _574;
  int _584;
  float _592;
  int _595;
  float _603;
  float _608;
  float _609;
  float _610;
  int _618;
  int _626;
  float _629;
  int _632;
  float _640;
  int _641;
  float _649;
  int _655;
  float _663;
  float _671;
  float _672;
  float _674;
  bool _677;
  bool _678;
  bool _679;
  bool _680;
  float _690;
  float _693;
  int _698;
  int _706;
  int _721;
  int _729;
  int _745;
  int _753;
  int _765;
  float _773;
  int _778;
  float _786;
  int _788;
  float _796;
  int _799;
  float _807;
  int _815;
  float _825;
  float _826;
  float _827;
  float _828;
  float _829;
  float _830;
  int _840;
  float _848;
  int _851;
  float _859;
  int _863;
  float _871;
  int _876;
  float _884;
  float _885;
  int _892;
  float _900;
  int _908;
  float _918;
  float _919;
  float _920;
  float _921;
  float _922;
  float _923;
  int _954;
  float _962;
  int _970;
  float _978;
  int _993;
  float _1001;
  int _1003;
  float _1011;
  int _1015;
  float _1025;
  float _1026;
  float _1027;
  int _1028;
  float _1036;
  int _1037;
  float _1045;
  float _1046;
  float _1053;
  float _1067;
  float _1068;
  float _1069;
  float _1076;
  float _1077;
  float _1078;
  int _1086;
  int _1095;
  float _1103;
  float _1104;
  float _1105;
  uint _1112;
  uint _1115;
  uint _1120;
  uint _1123;
  uint _1128;
  uint _1131;
  float _1142;
  float _1143;
  float _1144;
  float _1145;
  float _1146;
  float _1147;
  float _1148;
  float _1154;
  bool _1155;
  float _1156;
  float _1157;
  float _1158;
  float _1159;
  int _1160;
  float _1166;
  float _1167;
  float _1168;
  float _1196;
  float4 _1205;
  int _1213;
  float _1221;
  int _1223;
  float _1231;
  float _1236;
  float _1240;
  int _1247;
  float _1255;
  float _1273;
  float _1276;
  float _1279;
  float _1282;
  int _1283;
  float _1291;
  float _1294;
  float _1295;
  float _1296;
  float _1297;
  float _1298;
  float _1299;
  float _1300;
  float _1301;
  float _1302;
  float _1303;
  float _1306;
  float _1309;
  float _1312;
  float _1315;
  float _1318;
  float _1321;
  float _1328;
  float _1329;
  float _1330;
  float _1337;
  float _1338;
  float _1339;
  float _1342;
  float _1345;
  float _1348;
  int _1353;
  float _1361;
  float _1362;
  float _1363;
  float _1364;
  float _1365;
  float _1366;
  float _1367;
  int _1375;
  int _1384;
  float _1392;
  float _1393;
  float _1394;
  float _1398;
  float _1399;
  float _1400;
  float _1415;
  float _1422;
  float _1423;
  float _1424;
  float _1435;
  bool _1436;
  float _1437;
  float _1438;
  float _1439;
  float _1440;
  int _1441;
  float _1451;
  float _1452;
  float _1453;
  float _1481;
  float _1486;
  float _1487;
  int _1488;
  float _1496;
  float _1501;
  float _1502;
  float _1503;
  float _1512;
  float _1514;
  float _1515;
  float _1517;
  float _1519;
  float _1520;
  float _1521;
  float _1527;
  float _1528;
  float _1543;
  float _1544;
  float _1545;
  float4 _1550;
  float4 _1554;
  int _1561;
  float _1569;
  float _1571;
  float _1578;
  float _1579;
  float _1580;
  int _1583;
  float4 _1588;
  int _1592;
  float _1600;
  float _1602;
  int _1616;
  float _1624;
  float _1631;
  float _1632;
  float _1633;
  int _1634;
  int _1642;
  bool _1647;
  int _1655;
  float _1663;
  float _1670;
  float _1698;
  float _1703;
  float _1704;
  int _1705;
  int _1713;
  float _1714;
  float _1720;
  float _1721;
  float _1722;
  float _1723;
  float _1727;
  float _1730;
  float _1732;
  bool _1735;
  bool _1736;
  bool _1737;
  bool _1738;
  float _1747;
  float _1748;
  float _1749;
  float _1750;
  float _1757;
  float _1758;
  float _1762;
  float _1764;
  float _1766;
  float _1772;
  float _1776;
  float _1789;
  float _1790;
  float _1792;
  float _1799;
  float _1801;
  float _1812;
  float _1831;
  bool _1834;
  bool _1835;
  bool _1836;
  bool _1837;
  float _1846;
  float _1857;
  float _1906;
  float _1909;
  float _1911;
  bool _1914;
  bool _1915;
  bool _1916;
  bool _1917;
  float _1926;
  float _1927;
  float _1929;
  float _1934;
  float _1941;
  float _1947;
  float _1958;
  float _1977;
  bool _1980;
  bool _1981;
  bool _1982;
  bool _1983;
  float _1992;
  float _2002;
  float _2048;
  float _2049;
  float _2053;
  float _2056;
  float _2058;
  bool _2061;
  bool _2062;
  bool _2063;
  bool _2064;
  float _2073;
  float _2074;
  float _2080;
  float _2087;
  float _2093;
  float _2104;
  float _2123;
  bool _2126;
  bool _2127;
  bool _2128;
  bool _2129;
  float _2138;
  float _2148;
  int _2205;
  float _2213;
  float _2227;
  float _2228;
  float _2235;
  int _2240;
  float _2248;
  float _2250;
  float _2257;
  float _2258;
  float _2259;
  uint _2260;
  float _2282;
  float _2331;
  float _2332;
  float _2333;
  float _2335;
  float _2342;
  float _2343;
  float _2344;
  float _2363;
  float _2364;
  float _2365;
  float _2366;
  float _2367;
  float _2368;
  float _2369;
  float _2370;
  float _2371;
  float _2417;
  float _2418;
  float _2419;
  float _2420;
  float _2421;
  float _2422;
  float _2423;
  float _2440;
  float _2441;
  float _2442;
  float _2443;
  float _2449;
  float _2452;
  float _2459;
  float _2460;
  float _2461;
  float _2490;
  float _2515;
  float _2516;
  float _2517;
  float _2536;
  float _2537;
  float _2538;
  float _2544;
  float _2548;
  float _2549;
  float _2550;
  float _2551;
  float _2556;
  float _2581;
  float _2585;
  float _2586;
  float _2587;
  float _2588;
  int _2629;
  float _2684;
  float _2705;
  float _2706;
  float _2710;
  float _2757;
  int __loop_jump_target = -1;
  float _23[36];
  _29 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_31.x, _31.y);
  _64 = float((uint)((uint)(((int)(asint(__3__35__0__0__SceneConstantBuffer_raw[2u].x) * 1551)) & 15)));
  _65 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(TEXCOORD.x))));
  _66 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(TEXCOORD.y))));
  _75 = -0.0f - frac(frac(dot(float2(((_64 * 32.665000915527344f) + _65), ((_64 * 11.8149995803833f) + _66)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  _84 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _94 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0));
  _107 = (saturate(_94.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _108 = (saturate(_94.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _109 = (saturate(_94.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _111 = rsqrt(dot(float3(_107, _108, _109), float3(_107, _108, _109)));
  _112 = _111 * _107;
  _113 = _111 * _108;
  _114 = _109 * _111;
  _116 = (TEXCOORD.x * 2.0f) + -1.0f;
  _117 = TEXCOORD.y * 2.0f;
  _118 = 1.0f - _117;
  _119 = max(1.0000000116860974e-07f, _84.x);
  _155 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _156 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _155;
  _157 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _155;
  _158 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _155;
  _194 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _195 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _194;
  _196 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _194;
  _197 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _118, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _116))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _194;
  _199 = rsqrt(dot(float3(_195, _196, _197), float3(_195, _196, _197)));
  _200 = _199 * _195;
  _201 = _199 * _196;
  _202 = _199 * _197;
  _205 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _211 = (_84.x < 1.0000000116860974e-07f) || (_84.x == 1.0f);
  _216 = _156 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
  _217 = _157 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
  _218 = _158 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
  _229 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].x);
  _230 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].y);
  _231 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].z);
  _239 = WaveReadLaneFirst(_materialIndex);
  _247 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_239 < (uint)170000), _239, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._cubeSpaceGradientRatio);
  _248 = _75 * 0.009999999776482582f;
  _258 = frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) * 0.009999999776482582f) - (_229 * _248)) + 2000.0f;
  _259 = frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) * 0.009999999776482582f) - (_230 * _248)) + 2000.0f;
  _267 = (frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) * 0.009999999776482582f) - (_231 * _248)) + 2000.0f) + (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) - (_75 * 0.004999999888241291f));
  _269 = 0.0f;
  _270 = 0;
  while(true) {
    _277 = ((_269 * _200) + _258) * 4.0f;
    _281 = frac(abs(_277));
    _285 = (select((_277 >= (-0.0f - _277)), _281, (-0.0f - _281)) * 0.25f) + -0.125f;
    _286 = ((_269 * _201) + _259) * 4.0f;
    _290 = frac(abs(_286));
    _294 = (select((_286 >= (-0.0f - _286)), _290, (-0.0f - _290)) * 0.25f) + -0.125f;
    _295 = ((_269 * _202) + _267) * 4.0f;
    _299 = frac(abs(_295));
    _303 = (select((_295 >= (-0.0f - _295)), _299, (-0.0f - _299)) * 0.25f) + -0.125f;
    _306 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.5f;
    _307 = cos(_306);
    _308 = sin(_306);
    _309 = -0.0f - _308;
    _313 = mad(_303, _307, (_308 * _294));
    _321 = abs(mad(_313, _309, (_307 * _285))) + -0.0005000000237487257f;
    _322 = abs(mad(_303, _309, (_307 * _294))) + -0.0005000000237487257f;
    _323 = abs(mad(_313, _307, (_308 * _285))) + -0.0005000000237487257f;
    _324 = max(_321, 0.0f);
    _325 = max(_322, 0.0f);
    _326 = max(_323, 0.0f);
    _336 = min(max(_321, max(_322, _323)), 0.0f) + sqrt(((_325 * _325) + (_324 * _324)) + (_326 * _326));
    if (!(_336 < (_269 * 0.0010000000474974513f))) {
      _340 = _336 + _269;
      _341 = _270 + 1;
      if ((int)_341 < (int)80) {
        _269 = _340;
        _270 = _341;
        continue;
      } else {
        _344 = _340;
      }
    } else {
      _344 = _269;
    }
    _348 = (_344 * _200) + _258;
    _349 = (_344 * _201) + _259;
    _350 = (_344 * _202) + _267;
    _351 = _348 * 4.0f;
    _355 = frac(abs(_351));
    _359 = (select((_351 >= (-0.0f - _351)), _355, (-0.0f - _355)) * 0.25f) + -0.125f;
    _360 = _349 * 4.0f;
    _364 = frac(abs(_360));
    _368 = (select((_360 >= (-0.0f - _360)), _364, (-0.0f - _364)) * 0.25f) + -0.125f;
    _369 = _350 * 4.0f;
    _373 = frac(abs(_369));
    _377 = (select((_369 >= (-0.0f - _369)), _373, (-0.0f - _373)) * 0.25f) + -0.125f;
    _378 = _368 * _307;
    _380 = _368 * _308;
    _381 = mad(_377, _307, _380);
    _382 = _359 * _307;
    _384 = _359 * _308;
    _389 = abs(mad(_381, _309, _382)) + -0.0005000000237487257f;
    _390 = abs(mad(_377, _309, _378)) + -0.0005000000237487257f;
    _391 = abs(mad(_381, _307, _384)) + -0.0005000000237487257f;
    _392 = max(_389, 0.0f);
    _393 = max(_390, 0.0f);
    _394 = max(_391, 0.0f);
    _396 = _393 * _393;
    _404 = min(max(_389, max(_390, _391)), 0.0f) + sqrt((_396 + (_392 * _392)) + (_394 * _394));
    _406 = (_348 + 0.0010000000474974513f) * 4.0f;
    _410 = frac(abs(_406));
    _414 = (select((_406 >= (-0.0f - _406)), _410, (-0.0f - _410)) * 0.25f) + -0.125f;
    _421 = abs(mad(_381, _309, (_414 * _307))) + -0.0005000000237487257f;
    _422 = abs(mad(_381, _307, (_414 * _308))) + -0.0005000000237487257f;
    _423 = max(_421, 0.0f);
    _424 = max(_422, 0.0f);
    _434 = (_349 + 0.0010000000474974513f) * 4.0f;
    _438 = frac(abs(_434));
    _442 = (select((_434 >= (-0.0f - _434)), _438, (-0.0f - _438)) * 0.25f) + -0.125f;
    _446 = mad(_377, _307, (_442 * _308));
    _452 = abs(mad(_446, _309, _382)) + -0.0005000000237487257f;
    _453 = abs(mad(_377, _309, (_442 * _307))) + -0.0005000000237487257f;
    _454 = abs(mad(_446, _307, _384)) + -0.0005000000237487257f;
    _455 = max(_452, 0.0f);
    _456 = max(_453, 0.0f);
    _457 = max(_454, 0.0f);
    _468 = (_350 + 0.0010000000474974513f) * 4.0f;
    _472 = frac(abs(_468));
    _476 = (select((_468 >= (-0.0f - _468)), _472, (-0.0f - _472)) * 0.25f) + -0.125f;
    _478 = mad(_476, _307, _380);
    _484 = abs(mad(_478, _309, _382)) + -0.0005000000237487257f;
    _485 = abs(mad(_476, _309, _378)) + -0.0005000000237487257f;
    _486 = abs(mad(_478, _307, _384)) + -0.0005000000237487257f;
    _487 = max(_484, 0.0f);
    _488 = max(_485, 0.0f);
    _489 = max(_486, 0.0f);
    _500 = min(max(_421, max(_390, _422)), 0.0f) + (sqrt(((_423 * _423) + _396) + (_424 * _424)) - _404);
    _502 = min(max(_452, max(_453, _454)), 0.0f) + (sqrt(((_456 * _456) + (_455 * _455)) + (_457 * _457)) - _404);
    _504 = min(max(_484, max(_485, _486)), 0.0f) + (sqrt(((_488 * _488) + (_487 * _487)) + (_489 * _489)) - _404);
    _506 = rsqrt(dot(float3(_500, _502, _504), float3(_500, _502, _504)));
    _514 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x);
    _515 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y);
    _516 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z);
    _518 = rsqrt(dot(float3(_514, _515, _516), float3(_514, _515, _516)));
    _522 = dot(float3((_506 * _500), (_506 * _502), (_506 * _504)), float3((_518 * _514), (_518 * _515), (_518 * _516)));
    _525 = saturate((_344 * 0.25f) + -0.25f);
    _529 = (_525 * _525) * (3.0f - (_525 * 2.0f));
    if (_211) {
      _541 = exp2(log2(abs(_201)) * 0.5f) * _247;
      _546 = (_541 * 0.029999999329447746f);
      _547 = (_541 * 0.05000000074505806f);
      _548 = (_541 * 0.07999999821186066f);
    } else {
      _546 = 0.0f;
      _547 = 0.0f;
      _548 = 0.0f;
    }
    _553 = exp2(log2((exp2(log2((1.0f - _522) + (_529 * _522)) * 4.0f) * 0.20000000298023224f) + 0.10000000149011612f) * 1.5f);
    _554 = _553 * 0.699999988079071f;
    _555 = _553 * 0.4000000059604645f;
    _556 = _553 * 0.10000000149011612f;
    _566 = WaveReadLaneFirst(_materialIndex);
    _574 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_566 < (uint)170000), _566, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._cubeSpaceEffectRatio);
    _584 = WaveReadLaneFirst(_materialIndex);
    _592 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiDotRatio);
    if (_592 > 0.0f) {
      _595 = WaveReadLaneFirst(_materialIndex);
      _603 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_595 < (uint)170000), _595, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._depthOuterMaskRadius);
      _608 = _156 - _mainPosition.x;
      _609 = _157 - _mainPosition.y;
      _610 = _158 - _mainPosition.z;
      _618 = WaveReadLaneFirst(_materialIndex);
      _626 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_618 < (uint)170000), _618, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._invertDepthMask);
      _629 = saturate(_84.x);
      _632 = WaveReadLaneFirst(_materialIndex);
      _640 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_632 < (uint)170000), _632, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._depthContrast);
      _641 = WaveReadLaneFirst(_materialIndex);
      _649 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_641 < (uint)170000), _641, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._depthIntensity);
      _655 = WaveReadLaneFirst(_materialIndex);
      _663 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_655 < (uint)170000), _655, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleDistortionIntensity);
      if (_663 > 0.0f) {
        _671 = (_156 - _mainPosition.x) * 0.019999999552965164f;
        _672 = (_158 - _mainPosition.z) * 0.019999999552965164f;
        _674 = atan(_672 / _671);
        _677 = (_671 < 0.0f);
        _678 = (_671 == 0.0f);
        _679 = (_672 >= 0.0f);
        _680 = (_672 < 0.0f);
        _690 = sqrt((_671 * _671) + (_672 * _672));
        _693 = select((_678 && _679), 1.5f, select((_678 && _680), -1.5f, (select((_677 && _680), (_674 + -3.1415927410125732f), select((_677 && _679), (_674 + 3.1415927410125732f), _674)) * 0.9549295902252197f)));
        _698 = WaveReadLaneFirst(_materialIndex);
        _706 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_698 < (uint)170000), _698, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._noiseTex);
        _721 = WaveReadLaneFirst(_materialIndex);
        _729 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_721 < (uint)170000), _721, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._noiseTex);
        _745 = WaveReadLaneFirst(_materialIndex);
        _753 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_745 < (uint)170000), _745, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._noiseTex);
        _763 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_753 < (uint)65000), _753, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_693 * 0.1666666716337204f), ((_690 * 0.1666666716337204f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f)))))).x);
        _764 = ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_729 < (uint)65000), _729, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_693 * 0.5f), ((_690 * 0.5f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)))))).x) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_706 < (uint)65000), _706, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_693, (_690 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f)))))).x));
      } else {
        _763 = 0.0f;
        _764 = 0.0f;
      }
      _765 = WaveReadLaneFirst(_materialIndex);
      _773 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_765 < (uint)170000), _765, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleIntensity);
      if (_773 > 0.0f) {
        _778 = WaveReadLaneFirst(_materialIndex);
        _786 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_778 < (uint)170000), _778, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleSpeed);
        _788 = WaveReadLaneFirst(_materialIndex);
        _796 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_788 < (uint)170000), _788, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRipplePhaseOffset);
        _799 = WaveReadLaneFirst(_materialIndex);
        _807 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_799 < (uint)170000), _799, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleWidth);
        _815 = WaveReadLaneFirst(_materialIndex);
        _825 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_815 < (uint)170000), _815, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.x);
        _826 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_815 < (uint)170000), _815, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.y);
        _827 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_815 < (uint)170000), _815, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.z);
        _828 = _825 + (_156 - _mainPosition.x);
        _829 = _826 + (_157 - _mainPosition.y);
        _830 = _827 + (_158 - _mainPosition.z);
        _840 = WaveReadLaneFirst(_materialIndex);
        _848 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_840 < (uint)170000), _840, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._rippleCount);
        _851 = WaveReadLaneFirst(_materialIndex);
        _859 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_851 < (uint)170000), _851, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleDistortionIntensity);
        _863 = WaveReadLaneFirst(_materialIndex);
        _871 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_863 < (uint)170000), _863, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleContrast);
        _876 = WaveReadLaneFirst(_materialIndex);
        _884 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_876 < (uint)170000), _876, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._bigRippleIntensity);
        _885 = _884 * saturate(exp2(log2(frac(((((1.0f / max(9.999999747378752e-06f, _807)) * exp2(log2(sqrt(sqrt(dot(float3(_828, _829, _830), float3(_828, _829, _830))))) * 1.2000000476837158f)) * _848) - frac(_796 + (_786 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)))) - (_859 * _763))) * _871));
        _889 = _885;
        _890 = (_885 * 0.033104754984378815f);
        _891 = (_885 * 0.043233636766672134f);
      } else {
        _889 = 0.0f;
        _890 = 0.0f;
        _891 = 0.0f;
      }
      _892 = WaveReadLaneFirst(_materialIndex);
      _900 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_892 < (uint)170000), _892, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._rippleWidth);
      _908 = WaveReadLaneFirst(_materialIndex);
      _918 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_908 < (uint)170000), _908, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.x);
      _919 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_908 < (uint)170000), _908, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.y);
      _920 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_908 < (uint)170000), _908, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ripplePosOffset.z);
      _921 = _918 + (_156 - _mainPosition.x);
      _922 = _919 + (_157 - _mainPosition.y);
      _923 = _920 + (_158 - _mainPosition.z);
      _954 = WaveReadLaneFirst(_materialIndex);
      _962 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_954 < (uint)170000), _954, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._rippleCount);
      _970 = WaveReadLaneFirst(_materialIndex);
      _978 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_970 < (uint)170000), _970, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._rippleSpeed);
      if ((sqrt(((_216 * _216) + (_217 * _217)) + (_218 * _218)) + -1500.0f) < 1.0f) {
        _993 = WaveReadLaneFirst(_materialIndex);
        _1001 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_993 < (uint)170000), _993, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiDotDensity);
        _1014 = _1001;
      } else {
        _1003 = WaveReadLaneFirst(_materialIndex);
        _1011 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1003 < (uint)170000), _1003, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiDotDensity);
        _1014 = (_1011 * 0.25f);
      }
      _1015 = WaveReadLaneFirst(_materialIndex);
      _1025 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1015 < (uint)170000), _1015, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiScrollSpeed.x);
      _1026 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1015 < (uint)170000), _1015, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiScrollSpeed.y);
      _1027 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1015 < (uint)170000), _1015, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiScrollSpeed.z);
      _1028 = WaveReadLaneFirst(_materialIndex);
      _1036 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1028 < (uint)170000), _1028, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiOffset);
      _1037 = WaveReadLaneFirst(_materialIndex);
      _1045 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1037 < (uint)170000), _1037, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiMovementSpeed);
      _1046 = _75 * 1.5f;
      _1053 = _889 * 3.0f;
      _1067 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _1025) + (_1014 * ((_156 - (_229 * _1046)) - _1053));
      _1068 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _1026) + (_1014 * ((_157 - (_230 * _1046)) - _1053));
      _1069 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _1027) + (_1014 * ((_158 - (_231 * _1046)) - _1053));
      _1076 = floor(_1067);
      _1077 = floor(_1068);
      _1078 = floor(_1069);
      _1080 = 100000000376832.0f;
      _1081 = 0.0f;
      _1082 = 0.0f;
      _1083 = 0.0f;
      _1084 = -1;
      while(true) {
        _1089 = _1080;
        _1090 = _1081;
        _1091 = _1082;
        _1092 = _1083;
        _1093 = -1;
        while(true) {
          _1098 = _1089;
          _1099 = _1090;
          _1100 = _1091;
          _1101 = _1092;
          _1102 = -1;
          while(true) {
            _1103 = float((int)(_1084));
            _1104 = float((int)(_1093));
            _1105 = float((int)(_1102));
            _1112 = asint((_1104 + _1077)) * 1025;
            _1115 = (((uint)(_1112) >> 6) ^ _1112) * 9;
            _1120 = asint((_1105 + _1078)) * 1025;
            _1123 = (((uint)(_1120) >> 6) ^ _1120) * 9;
            _1128 = ((((int)((((uint)(_1115) >> 11) ^ _1115) * 32769)) ^ asint((_1103 + _1076))) ^ ((int)((((uint)(_1123) >> 11) ^ _1123) * 32769))) * 1025;
            _1131 = (((uint)(_1128) >> 6) ^ _1128) * 9;
            _1142 = sin(((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + 1000.0f) * _1045) + _1036) * 2.0f) * (asfloat(((((int)((((uint)(_1131) >> 11) ^ _1131) * 32769)) & 8388607) | 1065353216)) + -1.0f));
            _1143 = _1142 + _1103;
            _1144 = _1142 + _1104;
            _1145 = _1142 + _1105;
            _1146 = (frac(_1067) + -0.5f) - _1143;
            _1147 = (frac(_1068) + -0.5f) - _1144;
            _1148 = (frac(_1069) + -0.5f) - _1145;
            _1154 = sqrt(((_1147 * _1147) + (_1146 * _1146)) + (_1148 * _1148));
            _1155 = (_1154 < _1098);
            _1156 = select(_1155, _1154, _1098);
            _1157 = select(_1155, _1143, _1099);
            _1158 = select(_1155, _1144, _1100);
            _1159 = select(_1155, _1145, _1101);
            _1160 = _1102 + 1;
            if (!(_1160 == 2)) {
              _1098 = _1156;
              _1099 = _1157;
              _1100 = _1158;
              _1101 = _1159;
              _1102 = _1160;
              continue;
            }
            while(true) {
              _1095 = _1093 + 1;
              if (!(_1095 == 2)) {
                _1089 = _1156;
                _1090 = _1157;
                _1091 = _1158;
                _1092 = _1159;
                _1093 = _1095;
                __loop_jump_target = 1088;
                break;
              }
              while(true) {
                _1086 = _1084 + 1;
                if (!(_1086 == 2)) {
                  _1080 = _1156;
                  _1081 = _1157;
                  _1082 = _1158;
                  _1083 = _1159;
                  _1084 = _1086;
                  __loop_jump_target = 1079;
                  break;
                }
                _1166 = (_1157 + _1076) / _1014;
                _1167 = (_1158 + _1077) / _1014;
                _1168 = (_1159 + _1078) / _1014;
                _1196 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _1168, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _1167, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _1166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
                _1205 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _1168, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _1167, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _1166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _1196) * 0.5f) + 0.5f), (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _1168, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _1167, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _1166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _1196) * 0.5f))));
                _1213 = WaveReadLaneFirst(_materialIndex);
                _1221 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1213 < (uint)170000), _1213, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiDotThreshold);
                _1223 = WaveReadLaneFirst(_materialIndex);
                _1231 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1223 < (uint)170000), _1223, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._rippleIntensity);
                _1236 = ((_1221 * select(_211, 0.0f, _1156)) - (_1231 * (((_889 * 0.5f) + 1.0f) - ((frac((((exp2(log2(sqrt(sqrt(dot(float3(_921, _922, _923), float3(_921, _922, _923))))) * 1.2000000476837158f) * 40.0f) * (1.0f / max(9.999999747378752e-06f, _900))) * _962) - (_978 * (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + (_764 * 1.5f)))) + (_764 * 0.30000001192092896f)) * max(0.0f, (1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _603)) * sqrt(dot(float3(_608, _609, _610), float3(_608, _609, _610))))) * 2.0f))))))) + min(max(saturate(exp2(log2(_649 * select((float((uint)_626) == 1.0f), (1.0f - _629), _629)) * _640)), 0.0f), 1.0f);
                _1240 = saturate(_1236 / max((0.10000000149011612f / _1236), 0.0f));
                _1247 = WaveReadLaneFirst(_materialIndex);
                _1255 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1247 < (uint)170000), _1247, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._voronoiDotRatio);
                _1258 = (_1255 * (1.0f - floor((_1240 * _1240) * (3.0f - (_1240 * 2.0f)))));
                _1259 = select(_211, 0.0f, _1205.x);
                _1260 = select(_211, 0.0f, _1205.y);
                _1261 = select(_211, 0.0f, _1205.z);
                _1262 = _890;
                _1263 = _891;
                break;
              }
              if (__loop_jump_target != -1) {
                break;
              }
              break;
            }
            if (__loop_jump_target != -1) {
              break;
            }
            break;
          }
          if (__loop_jump_target == 1088) {
            __loop_jump_target = -1;
            continue;
          }
          if (__loop_jump_target != -1) {
            break;
          }
          break;
        }
        if (__loop_jump_target == 1079) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
    } else {
      _1258 = 0.0f;
      _1259 = 0.0f;
      _1260 = 0.0f;
      _1261 = 0.0f;
      _1262 = 0.0f;
      _1263 = 0.0f;
    }
    _1273 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _1276 = (((_1259 * _1258) + (saturate(_574 * (lerp(_554, _546, _529))) * _29)) + (_1262 * 0.009999999776482582f)) + _1273;
    _1279 = (((_1260 * _1258) + (saturate(_574 * (lerp(_555, _547, _529))) * _29)) + (_1262 * 0.009999999776482582f)) + _1273;
    _1282 = (((_1261 * _1258) + (saturate(_574 * (lerp(_556, _548, _529))) * _29)) + (_1263 * 0.009999999776482582f)) + _1273;
    _1283 = WaveReadLaneFirst(_materialIndex);
    _1291 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1283 < (uint)170000), _1283, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
    if (_1291 > 0.0010000000474974513f) {
      _1294 = ddx_coarse(_200);
      _1295 = ddx_coarse(_201);
      _1296 = ddx_coarse(_202);
      _1297 = ddy_coarse(_200);
      _1298 = ddy_coarse(_201);
      _1299 = ddy_coarse(_202);
      _1300 = ddx_coarse(TEXCOORD.x);
      _1301 = ddx_coarse(TEXCOORD.y);
      _1302 = ddy_coarse(TEXCOORD.x);
      _1303 = ddy_coarse(TEXCOORD.y);
      _1306 = (_1298 * _114) - (_1299 * _113);
      _1309 = (_1299 * _112) - (_1297 * _114);
      _1312 = (_1297 * _113) - (_1298 * _112);
      _1315 = (_1296 * _113) - (_1295 * _114);
      _1318 = (_1294 * _114) - (_1296 * _112);
      _1321 = (_1295 * _112) - (_1294 * _113);
      _1328 = (_1302 * _1315) + (_1306 * _1300);
      _1329 = (_1302 * _1318) + (_1309 * _1300);
      _1330 = (_1302 * _1321) + (_1312 * _1300);
      _1337 = (_1303 * _1315) + (_1306 * _1301);
      _1338 = (_1303 * _1318) + (_1309 * _1301);
      _1339 = (_1303 * _1321) + (_1301 * _1312);
      _1342 = max(dot(float3(_1328, _1329, _1330), float3(_1328, _1329, _1330)), dot(float3(_1337, _1338, _1339), float3(_1337, _1338, _1339)));
      _1345 = rsqrt(select((_1342 != 0.0f), _1342, 0.10000000149011612f));
      _1348 = _1345 * _200;
      _1353 = WaveReadLaneFirst(_materialIndex);
      _1361 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1353 < (uint)170000), _1353, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._squareSize);
      _1362 = _1361 * _156;
      _1363 = _1361 * _157;
      _1364 = _1361 * _158;
      _1365 = floor(_1362);
      _1366 = floor(_1363);
      _1367 = floor(_1364);
      _1369 = 10.0f;
      _1370 = 0.0f;
      _1371 = 0.0f;
      _1372 = 0.0f;
      _1373 = -1;
      while(true) {
        _1378 = _1369;
        _1379 = _1370;
        _1380 = _1371;
        _1381 = _1372;
        _1382 = -1;
        while(true) {
          _1387 = _1378;
          _1388 = _1379;
          _1389 = _1380;
          _1390 = _1381;
          _1391 = -1;
          while(true) {
            _1392 = float((int)(_1391));
            _1393 = float((int)(_1382));
            _1394 = float((int)(_1373));
            _1398 = sin(_1392 + _1365);
            _1399 = sin(_1393 + _1366);
            _1400 = sin(_1394 + _1367);
            _1415 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
            _1422 = sin(_1415 * frac(sin(dot(float3(_1398, _1399, _1400), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _1392;
            _1423 = sin(_1415 * frac(sin(dot(float3(_1398, _1399, _1400), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _1393;
            _1424 = sin(_1415 * frac(sin(dot(float3(_1398, _1399, _1400), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _1394;
            _1435 = max(abs((_1365 - _1362) + _1422), max(abs((_1366 - _1363) + _1423), abs((_1367 - _1364) + _1424)));
            _1436 = (_1435 < _1387);
            _1437 = select(_1436, _1435, _1387);
            _1438 = select(_1436, _1422, _1388);
            _1439 = select(_1436, _1423, _1389);
            _1440 = select(_1436, _1424, _1390);
            _1441 = _1391 + 1;
            if (!(_1441 == 2)) {
              _1387 = _1437;
              _1388 = _1438;
              _1389 = _1439;
              _1390 = _1440;
              _1391 = _1441;
              continue;
            }
            while(true) {
              _1384 = _1382 + 1;
              if (!(_1384 == 2)) {
                _1378 = _1437;
                _1379 = _1438;
                _1380 = _1439;
                _1381 = _1440;
                _1382 = _1384;
                __loop_jump_target = 1377;
                break;
              }
              while(true) {
                _1375 = _1373 + 1;
                if (!(_1375 == 2)) {
                  _1369 = _1437;
                  _1370 = _1438;
                  _1371 = _1439;
                  _1372 = _1440;
                  _1373 = _1375;
                  __loop_jump_target = 1368;
                  break;
                }
                _1451 = (_1438 + _1365) / _1361;
                _1452 = (_1439 + _1366) / _1361;
                _1453 = (_1440 + _1367) / _1361;
                _1481 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _1453, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _1452, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _1451))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
                _1486 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _1453, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _1452, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _1451))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _1481) * 0.5f) + 0.5f;
                _1487 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _1453, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _1452, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _1451))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _1481) * 0.5f);
                _1488 = WaveReadLaneFirst(_materialIndex);
                _1496 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1488 < (uint)170000), _1488, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
                _1501 = _1451 - _mainPosition.x;
                _1502 = _1452 - _mainPosition.y;
                _1503 = _1453 - _mainPosition.z;
                _1512 = saturate(1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _1496)) * sqrt(dot(float3(_1501, _1502, _1503), float3(_1501, _1502, _1503))))) * 1.0152283906936646f));
                _1514 = 1.0f - saturate(_1512);
                _1515 = _1512 * 0.5f;
                _1517 = (TEXCOORD.x - _1486) / _1514;
                _1519 = (TEXCOORD.y - _1487) / _1514;
                _1520 = sin(_1515);
                _1521 = cos(_1515);
                _1527 = mad((-0.0f - _1520), _1519, (_1521 * _1517)) + _1486;
                _1528 = mad(_1521, _1519, (_1520 * _1517)) + _1487;
                _1536 = _1276;
                _1537 = _1279;
                _1538 = _1282;
                _1539 = 1;
                while(true) {
                  _1543 = (float((int)(6 - _1539)) * 0.1666666716337204f) * ((saturate(_84.x * 1.5f) * 0.5f) * saturate(frac(frac(dot(float2((_65 + 32.665000915527344f), (_66 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + 0.5f));
                  _1544 = _1543 * mad((_1345 * _1330), _202, mad((_1345 * _1329), _201, (_1348 * _1328)));
                  _1545 = _1543 * mad((_1345 * _1339), _202, mad((_1345 * _1338), _201, (_1348 * _1337)));
                  _1550 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1544 + TEXCOORD.x), (_1545 + TEXCOORD.y)));
                  _1554 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1544 + _1527), (_1545 + _1528)));
                  _1561 = WaveReadLaneFirst(_materialIndex);
                  _1569 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1561 < (uint)170000), _1561, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._maskThreshold);
                  _1571 = float((bool)(uint)(_1550.w < _1569));
                  _1578 = (_1571 * ((_1554.x * 0.4000000059604645f) - _1536)) + _1536;
                  _1579 = (_1571 * ((_1554.y * 0.4000000059604645f) - _1537)) + _1537;
                  _1580 = (_1571 * ((_1554.z * 0.4000000059604645f) - _1538)) + _1538;
                  if (!(_1550.w > 0.8999999761581421f)) {
                    _1583 = _1539 + 1;
                    if ((int)_1583 < (int)6) {
                      _1536 = _1578;
                      _1537 = _1579;
                      _1538 = _1580;
                      _1539 = _1583;
                      continue;
                    }
                  }
                  _1588 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_1527, _1528));
                  _1592 = WaveReadLaneFirst(_materialIndex);
                  _1600 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1592 < (uint)170000), _1592, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._maskThreshold);
                  _1602 = float((bool)(uint)(_1550.w < _1600));
                  _1613 = ((_1602 * (_1588.x - _1578)) + _1578);
                  _1614 = ((_1602 * (_1588.y - _1579)) + _1579);
                  _1615 = ((_1602 * (_1588.z - _1580)) + _1580);
                  break;
                }
                break;
              }
              if (__loop_jump_target != -1) {
                break;
              }
              break;
            }
            if (__loop_jump_target != -1) {
              break;
            }
            break;
          }
          if (__loop_jump_target == 1377) {
            __loop_jump_target = -1;
            continue;
          }
          if (__loop_jump_target != -1) {
            break;
          }
          break;
        }
        if (__loop_jump_target == 1368) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
    } else {
      _1613 = _1276;
      _1614 = _1279;
      _1615 = _1282;
    }
    _1616 = WaveReadLaneFirst(_materialIndex);
    _1624 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1616 < (uint)170000), _1616, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ppWorldLoadingRatio);
    _1631 = (_1624 * (_1613 - _205.x)) + _205.x;
    _1632 = (_1624 * (_1614 - _205.y)) + _205.y;
    _1633 = (_1624 * (_1615 - _205.z)) + _205.z;
    _1634 = WaveReadLaneFirst(_materialIndex);
    _1642 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1634 < (uint)170000), _1634, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._excludePlayer);
    if (_1642 == 1) {
      _1647 = (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_31.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_31.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255) == _renderPassSelfPlayer);
      _1652 = select(_1647, _205.x, _1631);
      _1653 = select(_1647, _205.y, _1632);
      _1654 = select(_1647, _205.z, _1633);
    } else {
      _1652 = _1631;
      _1653 = _1632;
      _1654 = _1633;
    }
    _1655 = WaveReadLaneFirst(_materialIndex);
    _1663 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1655 < (uint)170000), _1655, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._starburstIntensity);
    if (_1663 > 0.0f) {
      _1670 = _mainPosition.y + 1.5f;
      _1698 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _mainPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _1670, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _mainPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
      _1703 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _mainPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _1670, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _mainPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _1698) * 0.5f) + 0.5f;
      _1704 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _mainPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _1670, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _mainPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _1698) * 0.5f);
      _1705 = WaveReadLaneFirst(_materialIndex);
      _1713 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_1705 < (uint)170000), _1705, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._noiseTex);
      _1714 = TEXCOORD.x - _1703;
      _1720 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x)) * (TEXCOORD.y - _1704);
      _1721 = _1714 * 1.100000023841858f;
      _1722 = _1720 * 1.100000023841858f;
      _1723 = dot(float2(_1703, _1704), float2(0.25f, 0.25f));
      _1727 = sqrt((_1722 * _1722) + (_1721 * _1721));
      _1730 = (pow(_1727, 3.0f));
      _1732 = atan(_1722 / _1721);
      _1735 = (_1721 < 0.0f);
      _1736 = (_1721 == 0.0f);
      _1737 = (_1722 >= 0.0f);
      _1738 = (_1722 < 0.0f);
      _1747 = select((_1736 && _1737), 15.707963943481445f, select((_1736 && _1738), -15.707963943481445f, (select((_1735 && _1738), (_1732 + -3.1415927410125732f), select((_1735 && _1737), (_1732 + 3.1415927410125732f), _1732)) * 10.0f)));
      _1748 = _1730 * 5.0f;
      _1749 = _1723 * 0.00795774720609188f;
      _1750 = _1723 * 4.774648189544678f;
      _1757 = frac(abs(_1749));
      _1758 = frac(abs(_1750));
      _1762 = select((_1750 >= (-0.0f - _1750)), _1758, (-0.0f - _1758));
      _1764 = sin(select((_1749 >= (-0.0f - _1749)), _1757, (-0.0f - _1757)) * 6.2831854820251465f);
      _1766 = 12.345600128173828f - _1764;
      _1772 = ((_1748 + 2.345599889755249f) - _1764) * 0.015625f;
      _1776 = frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f);
      _1789 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1766 + _1747) * 0.015625f) - _1776), (_1772 - _1776))))).x) * 1.5f) * 1.2000000476837158f);
      _1790 = _1764 + 3.456700086593628f;
      _1792 = _1764 + 45.67890167236328f;
      _1799 = frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f);
      _1801 = ((_1792 + _1748) * 0.015625f) - _1799;
      _1812 = (_1730 * 0.078125f) - _1799;
      _1831 = atan((-0.0f - _1722) / (-0.0f - _1721));
      _1834 = (_1721 > -0.0f);
      _1835 = (_1721 == -0.0f);
      _1836 = (_1722 <= -0.0f);
      _1837 = (_1722 > -0.0f);
      _1846 = select((_1835 && _1836), 15.707963943481445f, select((_1835 && _1837), -15.707963943481445f, (select((_1834 && _1837), (_1831 + -3.1415927410125732f), select((_1834 && _1836), (_1831 + 3.1415927410125732f), _1831)) * 10.0f)));
      _1857 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1846 + _1766) * 0.015625f) - _1799), (_1772 - _1799))))).x) * 1.5f) * 1.2000000476837158f);
      _1906 = sqrt((_1720 * _1720) + (_1714 * _1714));
      _1909 = (pow(_1906, 3.0f));
      _1911 = atan(_1720 / _1714);
      _1914 = (_1714 < 0.0f);
      _1915 = (_1714 == 0.0f);
      _1916 = (_1720 >= 0.0f);
      _1917 = (_1720 < 0.0f);
      _1926 = select((_1915 && _1916), 15.707963943481445f, select((_1915 && _1917), -15.707963943481445f, (select((_1914 && _1917), (_1911 + -3.1415927410125732f), select((_1914 && _1916), (_1911 + 3.1415927410125732f), _1911)) * 10.0f)));
      _1927 = _1909 * 5.0f;
      _1929 = 2.345599889755249f - _1764;
      _1934 = ((_1929 + _1927) * 0.015625f) - _1799;
      _1941 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1926 + _1766) * 0.015625f) - _1799), _1934)))).x) * 1.5f) * 1.2000000476837158f);
      _1947 = ((_1792 + _1927) * 0.015625f) - _1799;
      _1958 = (_1909 * 0.078125f) - _1799;
      _1977 = atan((-0.0f - _1720) / (-0.0f - _1714));
      _1980 = (_1714 > -0.0f);
      _1981 = (_1714 == -0.0f);
      _1982 = (_1720 <= -0.0f);
      _1983 = (_1720 > -0.0f);
      _1992 = select((_1981 && _1982), 15.707963943481445f, select((_1981 && _1983), -15.707963943481445f, (select((_1980 && _1983), (_1977 + -3.1415927410125732f), select((_1980 && _1982), (_1977 + 3.1415927410125732f), _1977)) * 10.0f)));
      _2002 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1992 + _1766) * 0.015625f) - _1799), _1934)))).x) * 1.5f) * 1.2000000476837158f);
      _2048 = _1714 * 0.8999999761581421f;
      _2049 = _1720 * 0.8999999761581421f;
      _2053 = sqrt((_2049 * _2049) + (_2048 * _2048));
      _2056 = (pow(_2053, 3.0f));
      _2058 = atan(_2049 / _2048);
      _2061 = (_2048 < 0.0f);
      _2062 = (_2048 == 0.0f);
      _2063 = (_2049 >= 0.0f);
      _2064 = (_2049 < 0.0f);
      _2073 = select((_2062 && _2063), 15.707963943481445f, select((_2062 && _2064), -15.707963943481445f, (select((_2061 && _2064), (_2058 + -3.1415927410125732f), select((_2061 && _2063), (_2058 + 3.1415927410125732f), _2058)) * 10.0f)));
      _2074 = _2056 * 5.0f;
      _2080 = ((_1929 + _2074) * 0.015625f) - _1799;
      _2087 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_2073 + _1766) * 0.015625f) - _1799), _2080)))).x) * 1.5f) * 1.2000000476837158f);
      _2093 = ((_1792 + _2074) * 0.015625f) - _1799;
      _2104 = (_2056 * 0.078125f) - _1799;
      _2123 = atan((-0.0f - _2049) / (-0.0f - _2048));
      _2126 = (_2048 > -0.0f);
      _2127 = (_2048 == -0.0f);
      _2128 = (_2049 <= -0.0f);
      _2129 = (_2049 > -0.0f);
      _2138 = select((_2127 && _2128), 15.707963943481445f, select((_2127 && _2129), -15.707963943481445f, (select((_2126 && _2129), (_2123 + -3.1415927410125732f), select((_2126 && _2128), (_2123 + 3.1415927410125732f), _2123)) * 10.0f)));
      _2148 = saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_2138 + _1766) * 0.015625f) - _1799), _2080)))).x) * 1.5f) * 1.2000000476837158f);
      _2205 = WaveReadLaneFirst(_materialIndex);
      _2213 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_2205 < (uint)170000), _2205, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._starburstIntensity);
      _2224 = (saturate(_2213 * exp2(log2(exp2(log2(saturate(1.100000023841858f - (_1727 * 24.0f))) * 10.199999809265137f) + (exp2(log2(saturate(1.0f - (_1727 * 2.0f))) * 12.199999809265137f) * exp2(log2(max(((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1747 * 0.015625f) - _1799), _1812)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1790 + _1747) * 0.015625f) - _1799), _1801)))).x) * 1.5f) * 1.2000000476837158f) - _1789)) + _1789), ((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1846 * 0.015625f) - _1799), _1812)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1846 + _1790) * 0.015625f) - _1799), _1801)))).x) * 1.5f) * 1.2000000476837158f) - _1857)) + _1857))) * 3.0f))) * 1.399999976158142f)) * _29);
      _2225 = (saturate(_2213 * exp2(log2((exp2(log2(saturate(1.100000023841858f - (_1906 * 24.0f))) * 10.199999809265137f) + (exp2(log2(saturate(1.0f - (_1906 * 2.0f))) * 12.199999809265137f) * exp2(log2(max(((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1926 * 0.015625f) - _1799), _1958)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1926 + _1790) * 0.015625f) - _1799), _1947)))).x) * 1.5f) * 1.2000000476837158f) - _1941)) + _1941), ((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1992 * 0.015625f) - _1799), _1958)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1992 + _1790) * 0.015625f) - _1799), _1947)))).x) * 1.5f) * 1.2000000476837158f) - _2002)) + _2002))) * 3.0f))) * 0.6038274168968201f) * 1.399999976158142f)) * _29);
      _2226 = (saturate(_2213 * exp2(log2((exp2(log2(saturate(1.100000023841858f - (_2053 * 24.0f))) * 10.199999809265137f) + (exp2(log2(saturate(1.0f - (_2053 * 2.0f))) * 12.199999809265137f) * exp2(log2(max(((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_2073 * 0.015625f) - _1799), _2104)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_2073 + _1790) * 0.015625f) - _1799), _2093)))).x) * 1.5f) * 1.2000000476837158f) - _2087)) + _2087), ((((sin((saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_2138 * 0.015625f) - _1799), _2104)))).x) * 1.5f) * 1.2000000476837158f) + _1762) * 6.2831854820251465f) * 0.5f) + 0.5f) * (saturate(exp2(log2(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1713 < (uint)65000), _1713, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_2138 + _1790) * 0.015625f) - _1799), _2093)))).x) * 1.5f) * 1.2000000476837158f) - _2148)) + _2148))) * 3.0f))) * 0.4479884207248688f) * 1.399999976158142f)) * _29);
    } else {
      _2224 = 0.0f;
      _2225 = 0.0f;
      _2226 = 0.0f;
    }
    _2227 = TEXCOORD.x + -0.5f;
    _2228 = TEXCOORD.y + -0.5f;
    _2235 = saturate((sqrt((_2228 * _2228) + (_2227 * _2227)) + -0.009999999776482582f) * 1.0101009607315063f);
    _2240 = WaveReadLaneFirst(_materialIndex);
    _2248 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_2240 < (uint)170000), _2240, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._vignetteIntensity);
    _2250 = 1.0f - (((_2235 * _2235) * (3.0f - (_2235 * 2.0f))) * _2248);
    _2257 = max(0.0f, (_2250 * (_2224 + _1652)));
    _2258 = max(0.0f, (_2250 * (_2225 + _1653)));
    _2259 = max(0.0f, (_2250 * (_2226 + _1654)));
    _2260 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _2273 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _2260, 0)))).x) & 127))) + 0.5f);
    } else {
      _2273 = 1.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_2257, _2258, _2259));
      _2695 = output_color.x;
      _2696 = output_color.y;
      _2697 = output_color.z;
    } else {
      _2695 = _2257;
      _2696 = _2258;
      _2697 = _2259;
    }
    if (_etcParams.y > 1.0f) {
      _2705 = abs(_116);
      _2706 = abs(_117 + -1.0f);
      _2710 = saturate(1.0f - (dot(float2(_2705, _2706), float2(_2705, _2706)) * saturate(_etcParams.y + -1.0f)));
      _2715 = (_2710 * _2695);
      _2716 = (_2710 * _2696);
      _2717 = (_2710 * _2697);
    } else {
      _2715 = _2695;
      _2716 = _2696;
      _2717 = _2697;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _2750 = select((_2715 <= 0.0031308000907301903f), (_2715 * 12.920000076293945f), (((pow(_2715, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2751 = select((_2716 <= 0.0031308000907301903f), (_2716 * 12.920000076293945f), (((pow(_2716, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2752 = select((_2717 <= 0.0031308000907301903f), (_2717 * 12.920000076293945f), (((pow(_2717, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2750 = _2715;
      _2751 = _2716;
      _2752 = _2717;
    }
    if (!(_etcParams.y < 1.0f)) {
      _2757 = float((uint)_2260);
      if (!(_2757 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_2757 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _2766 = _2750;
          _2767 = _2751;
          _2768 = _2752;
        } else {
          _2766 = 0.0f;
          _2767 = 0.0f;
          _2768 = 0.0f;
        }
      } else {
        _2766 = 0.0f;
        _2767 = 0.0f;
        _2768 = 0.0f;
      }
    } else {
      _2766 = _2750;
      _2767 = _2751;
      _2768 = _2752;
    }
    SV_Target.x = _2766;
    SV_Target.y = _2767;
    SV_Target.z = _2768;
    SV_Target.w = _2273;
    break;
  }
  return SV_Target;
}