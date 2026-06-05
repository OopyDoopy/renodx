#include "../tonemap.hlsli"

struct PostProcessUber_CDStruct {
  uint _noiseTex;
  float _itemRatio;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
  float _dropItemFakeLightIntensity;
  float _dropItemBlurWidth;
  float _dropItemBlurIntensity;
  float3 _channelBrightness;
  float _contrast;
  float3 _saturation;
  float _fishEyeMaxPower;
  uint _enemyMaskColor;
  uint _objectiveMaskColor;
  float _uiMainMenuEffect;
  float _uiQuickSlotEffect;
  uint _detectColorBase;
  float _detectModeG;
  float _detectModeR;
  float _detectModeB;
  float _detectModeKnowledge;
  float _detectModeInterrupt;
  uint _detectLiftColor;
  float _statusVignetteRatio1;
  float _statusVignetteRadius1;
  float _statusVignettePower1;
  float _statusVignetteChromaticShift1;
  uint _statusVignetteColor1;
  float _statusVignetteRatio2;
  float _statusVignetteRadius2;
  float _statusVignettePower2;
  float _statusVignetteChromaticShift2;
  uint _statusVignetteColor2;
  float _statusVignetteRatio3;
  float _statusVignetteRadius3;
  float _statusVignettePower3;
  float _statusVignetteChromaticShift3;
  uint _statusVignetteColor3;
  uint _temperatureWarningTex;
  uint _electrocutionTex;
  uint _enemyAlertTex;
  uint _wantedRegionColor;
  float _chromaticAberrationRatio;
  float _chromaticAberrationShiftValue;
  float2 _chromaticAberrationShiftPosition;
  float _invertColor;
  uint _followLearningColor;
  uint _followLearningSaturationTone;
  uint _followLearningNoiseTex;
  float _isBloodEffect;
  float _testEffectRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_noiseTex : register(t8, space36);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

struct BindlessParameters_PostProcessUber_CD {
  PostProcessUber_CDStruct BindlessParameters_PostProcessUber_CD;
};

typedef BindlessParameters_PostProcessUber_CD BindlessParameters_PostProcessUber_CD_t;
ConstantBuffer<BindlessParameters_PostProcessUber_CD_t> BindlessParameters_PostProcessUber_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointWrap : register(s8, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _35;
  int _41;
  float _49;
  int _50;
  float _58;
  int _59;
  float _67;
  int _68;
  float _76;
  float _80;
  int _81;
  float _89;
  float _93;
  int _94;
  float _102;
  float _106;
  int _107;
  float _115;
  float _119;
  int _120;
  float _128;
  int _129;
  float _137;
  int _138;
  float _146;
  float _173;
  float _212;
  float _213;
  float _216;
  float _217;
  float _238;
  float _239;
  float _309;
  float _310;
  float _311;
  float _346;
  float _431;
  float _432;
  float _433;
  float _474;
  float _475;
  float _476;
  float _527;
  float _528;
  float _529;
  float _591;
  float _592;
  float _593;
  float _594;
  float _595;
  float _596;
  float _666;
  float _667;
  float _668;
  float _725;
  float _726;
  float _927;
  float _928;
  float _929;
  float _962;
  float _963;
  float _964;
  int _965;
  float _1142;
  float _1143;
  float _1144;
  float _1207;
  float _1208;
  float _1209;
  float _1249;
  float _1250;
  float _1251;
  float _1386;
  float _1387;
  float _1388;
  float _1450;
  float _1451;
  float _1452;
  float _1453;
  float _1454;
  float _1455;
  float _1654;
  float _1741;
  float _1742;
  float _1743;
  float _1865;
  float _1866;
  float _1867;
  float _1986;
  float _1987;
  float _1988;
  float _2106;
  float _2107;
  float _2108;
  float _2169;
  float _2170;
  float _2171;
  bool _2523;
  bool _2540;
  float _2587;
  float _2588;
  float _2589;
  float _2590;
  float _2723;
  float _2724;
  float _2725;
  float _2755;
  float _2756;
  float _2757;
  float _2900;
  float _2901;
  float _2902;
  float _2916;
  float _3121;
  float _3122;
  float _3123;
  float _3216;
  float _3217;
  float _3218;
  float _3338;
  float _3339;
  float _3340;
  float _3361;
  float _3362;
  float _3363;
  float _3396;
  float _3397;
  float _3398;
  float _3412;
  float _3413;
  float _3414;
  float _155;
  float _160;
  float _161;
  float _162;
  float _163;
  float _177;
  float _182;
  float _186;
  float _195;
  float _201;
  float _206;
  int _218;
  float _226;
  float4 _242;
  int _246;
  int _254;
  float4 _278;
  float _287;
  float _288;
  float _301;
  int _312;
  float _320;
  int _325;
  float _333;
  int _336;
  float _344;
  float _354;
  float4 _378;
  int _383;
  float _391;
  bool _393;
  bool _394;
  int _396;
  float _404;
  float _414;
  float _415;
  float _426;
  float _448;
  float _449;
  float _458;
  float _459;
  float _461;
  int _481;
  float _490;
  float _491;
  float _492;
  float _493;
  float _502;
  float _503;
  float _505;
  int _530;
  float _538;
  int _539;
  float _547;
  int _548;
  float _556;
  int _557;
  float _565;
  int _566;
  float _574;
  float _579;
  bool _597;
  float _601;
  float _602;
  float _603;
  float _610;
  float _612;
  float _614;
  float _616;
  float _617;
  float _618;
  float _622;
  float _627;
  float _637;
  float _638;
  float _646;
  float _653;
  float _654;
  float _655;
  uint2 _684;
  uint _699;
  int _701;
  float _709;
  float _710;
  float _712;
  float _713;
  float _714;
  float _728;
  float _729;
  float _730;
  float _731;
  float _733;
  float4 _739;
  int _752;
  float _760;
  float _761;
  float _787;
  int _804;
  float _812;
  int _822;
  int _830;
  float _833;
  float _836;
  float _838;
  float _871;
  bool _884;
  float _913;
  float _914;
  float _915;
  bool _922;
  float _936;
  int _974;
  int _982;
  float _985;
  float _988;
  float _990;
  float _1023;
  float _1031;
  float _1033;
  float _1039;
  float _1041;
  float _1042;
  float _1070;
  float _1076;
  float _1077;
  float _1081;
  float _1088;
  float _1090;
  float _1097;
  float _1101;
  float _1104;
  float _1105;
  float _1108;
  int _1123;
  float _1131;
  float4 _1156;
  float _1162;
  float _1165;
  float _1166;
  float _1167;
  float _1175;
  float _1180;
  float _1181;
  float _1196;
  float _1210;
  float _1216;
  float _1220;
  float _1221;
  float _1229;
  float _1236;
  float _1237;
  float _1238;
  float _1257;
  float _1272;
  float _1283;
  int _1286;
  int _1294;
  float _1308;
  float _1311;
  float _1312;
  float _1324;
  float _1336;
  float _1339;
  float _1340;
  bool _1348;
  float _1350;
  float _1359;
  float _1361;
  float _1365;
  float _1366;
  float _1373;
  float _1374;
  float _1375;
  int _1389;
  float _1399;
  float _1400;
  float _1401;
  int _1402;
  float _1412;
  float _1413;
  float _1414;
  int _1415;
  float _1423;
  bool _1428;
  bool _1435;
  float _1436;
  bool _1444;
  float _1445;
  float _1456;
  float _1457;
  float _1458;
  float _1462;
  float _1464;
  float _1466;
  float _1471;
  float _1488;
  float _1495;
  float _1496;
  float _1497;
  int _1498;
  float _1506;
  float _1509;
  float _1519;
  float _1520;
  float _1521;
  int _1522;
  float _1530;
  int _1533;
  float _1542;
  float _1543;
  int _1546;
  float _1555;
  float _1556;
  int _1559;
  int _1567;
  int _1576;
  float _1584;
  int _1585;
  float _1593;
  float _1599;
  float _1602;
  float _1603;
  float _1612;
  int _1613;
  float _1621;
  int _1624;
  float _1633;
  float _1634;
  int _1642;
  float _1650;
  int _1656;
  float _1664;
  float _1670;
  int _1671;
  int _1679;
  float _1682;
  float _1685;
  float _1687;
  float _1712;
  bool _1719;
  float _1720;
  float _1727;
  float _1746;
  float _1747;
  int _1752;
  float _1760;
  int _1766;
  float _1774;
  float _1779;
  float _1784;
  float _1791;
  float _1792;
  float _1793;
  int _1794;
  int _1802;
  float _1805;
  float _1808;
  float _1810;
  float _1835;
  bool _1842;
  float _1843;
  float _1850;
  float _1857;
  float _1870;
  float _1871;
  int _1876;
  float _1884;
  int _1889;
  float _1897;
  float _1902;
  float _1905;
  float _1912;
  float _1913;
  float _1914;
  int _1915;
  int _1923;
  float _1926;
  float _1929;
  float _1931;
  float _1956;
  bool _1963;
  float _1964;
  float _1971;
  float _1978;
  float _1991;
  float _1992;
  int _1997;
  float _2005;
  int _2009;
  float _2017;
  float _2022;
  float _2025;
  float _2032;
  float _2033;
  float _2034;
  int _2035;
  int _2043;
  float _2046;
  float _2049;
  float _2051;
  float _2076;
  bool _2083;
  float _2084;
  float _2091;
  float _2098;
  float _2113;
  float _2114;
  float _2115;
  float _2123;
  float _2131;
  float _2139;
  float _2142;
  float _2145;
  float _2152;
  float _2153;
  float _2154;
  float _2158;
  int _2176;
  int _2184;
  float _2187;
  float _2190;
  float _2192;
  float _2222;
  float _2223;
  float _2224;
  float _2225;
  int _2226;
  int _2234;
  float4 _2245;
  float _2252;
  float _2255;
  float _2257;
  float _2258;
  float _2294;
  uint _2303;
  uint _2304;
  uint4 _2306;
  float4 _2309;
  float _2327;
  float _2328;
  float _2329;
  float _2331;
  float _2332;
  float _2333;
  float _2334;
  float _2337;
  float _2338;
  float _2341;
  float _2342;
  float _2346;
  float _2348;
  float _2349;
  float _2350;
  float _2351;
  float _2353;
  float _2356;
  float _2357;
  float _2358;
  float _2359;
  float _2368;
  float _2372;
  float _2376;
  float _2378;
  float _2380;
  float _2381;
  float _2384;
  float _2387;
  float _2388;
  float4 _2395;
  float _2398;
  float _2407;
  float _2410;
  float _2411;
  float _2416;
  float _2418;
  float _2423;
  float _2426;
  float _2427;
  float _2432;
  float _2436;
  float _2442;
  float _2452;
  float _2455;
  float _2457;
  bool _2460;
  bool _2461;
  bool _2462;
  bool _2463;
  float _2475;
  float4 _2488;
  bool _2524;
  bool _2526;
  float _2542;
  float _2549;
  float _2550;
  float _2551;
  bool _2552;
  float _2559;
  float4 _2563;
  float _2577;
  float _2591;
  float _2598;
  float _2599;
  float _2600;
  float _2602;
  float _2608;
  float _2615;
  float _2616;
  float _2617;
  int _2618;
  int _2626;
  float _2629;
  float _2632;
  float _2634;
  float _2659;
  float _2660;
  float _2661;
  float _2665;
  float _2667;
  float _2669;
  float _2674;
  float _2687;
  float _2688;
  float _2689;
  float _2703;
  float _2708;
  float _2712;
  float _2726;
  float _2730;
  float _2737;
  float _2738;
  float _2739;
  float _2744;
  bool _2777;
  float _2783;
  float4 _2800;
  float _2803;
  float _2804;
  float _2814;
  float _2817;
  float _2818;
  int _2829;
  int _2837;
  float4 _2844;
  bool _2849;
  bool _2851;
  bool _2855;
  bool _2863;
  float _2887;
  float _2889;
  uint _2903;
  float _2925;
  float _2974;
  float _2975;
  float _2976;
  float _2978;
  float _2985;
  float _2986;
  float _2987;
  float _3006;
  float _3007;
  float _3008;
  float _3009;
  float _3010;
  float _3011;
  float _3012;
  float _3013;
  float _3014;
  float _3060;
  float _3061;
  float _3062;
  float _3063;
  float _3064;
  float _3065;
  float _3066;
  float _3083;
  float _3084;
  float _3085;
  float _3086;
  float _3092;
  float _3095;
  float _3102;
  float _3103;
  float _3104;
  float _3133;
  float _3158;
  float _3159;
  float _3160;
  float _3179;
  float _3180;
  float _3181;
  float _3187;
  float _3191;
  float _3192;
  float _3193;
  float _3194;
  float _3199;
  float _3224;
  float _3228;
  float _3229;
  float _3230;
  float _3231;
  int _3272;
  float _3327;
  float _3351;
  float _3352;
  float _3356;
  float _3403;
  float _29[36];
  _35 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _41 = WaveReadLaneFirst(_materialIndex);
  _49 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio1);
  _50 = WaveReadLaneFirst(_materialIndex);
  _58 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_50 < (uint)170000), _50, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio2);
  _59 = WaveReadLaneFirst(_materialIndex);
  _67 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio3);
  _68 = WaveReadLaneFirst(_materialIndex);
  _76 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift1);
  _80 = float((uint)(uint)(_enableChromaticAberration)) * _76;
  _81 = WaveReadLaneFirst(_materialIndex);
  _89 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift2);
  _93 = float((uint)(uint)(_enableChromaticAberration)) * _89;
  _94 = WaveReadLaneFirst(_materialIndex);
  _102 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift3);
  _106 = float((uint)(uint)(_enableChromaticAberration)) * _102;
  _107 = WaveReadLaneFirst(_materialIndex);
  _115 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationRatio);
  _119 = float((uint)(uint)(_enableChromaticAberration)) * _115;
  _120 = WaveReadLaneFirst(_materialIndex);
  _128 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftValue);
  _129 = WaveReadLaneFirst(_materialIndex);
  _137 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._isBloodEffect);
  _138 = WaveReadLaneFirst(_materialIndex);
  _146 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_138 < (uint)170000), _138, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._fishEyeMaxPower);
  [branch]
  if (((_146 > 0.0010000000474974513f) || (_146 < -0.0010000000474974513f)) | (_followLearning > 0.0010000000474974513f)) {
    _155 = 0.5f / _35;
    _160 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
    _161 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _155;
    _162 = dot(float2(_160, _161), float2(_160, _161));
    _163 = sqrt(_162);
    if (_followLearning > 0.0010000000474974513f) {
      _173 = ((pow(_followLearning, 0.25f)) * 1.5f);
    } else {
      _173 = _146;
    }
    if (_173 > 0.0f) {
      _177 = sqrt(dot(float2(0.5f, _155), float2(0.5f, _155)));
      _182 = tan(_173 * _163) * (rsqrt(_162) * _177);
      _186 = tan(_177 * _173);
      _212 = (((_182 * _160) / _186) + 0.5f);
      _213 = (((_182 * _161) / _186) + _155);
    } else {
      if (_173 < 0.0f) {
        _195 = select((_35 < 1.0f), 0.5f, _155);
        _201 = atan((_173 * _163) * -10.0f) * (rsqrt(_162) * _195);
        _206 = atan((_173 * -10.0f) * _195);
        _212 = (((_201 * _160) / _206) + 0.5f);
        _213 = (((_201 * _161) / _206) + _155);
      } else {
        _212 = 0.0f;
        _213 = 0.0f;
      }
    }
    _216 = _212;
    _217 = (_213 * _35);
  } else {
    _216 = TEXCOORD.x;
    _217 = TEXCOORD.y;
  }
  _218 = WaveReadLaneFirst(_materialIndex);
  _226 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiQuickSlotEffect);
  if (!(_226 < 0.0010000000474974513f)) {
    _238 = ((_226 * (0.029999999329447746f - (_216 * 0.06000000238418579f))) + _216);
    _239 = ((_226 * (0.029999999329447746f - (_217 * 0.06000000238418579f))) + _217);
  } else {
    _238 = _216;
    _239 = _217;
  }
  _242 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, _239));
  _246 = WaveReadLaneFirst(_materialIndex);
  _254 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_246 < (uint)170000), _246, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  [branch]
  if (!(_fleeCount < 0.0010000000474974513f)) {
    _278 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _35) * 4.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f))));
    _287 = (TEXCOORD.x + -0.5f) + ((_278.x + -0.5f) * 0.15000000596046448f);
    _288 = (TEXCOORD.y + -0.5f) + ((_278.y + -0.5f) * 0.15000000596046448f);
    _301 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_287 * _287) + (_288 * _288))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _309 = (_242.x - (_301 * _242.x));
    _310 = (_242.y - (_301 * _242.y));
    _311 = (_242.z - (_301 * _242.z));
  } else {
    _309 = _242.x;
    _310 = _242.y;
    _311 = _242.z;
  }
  _312 = WaveReadLaneFirst(_materialIndex);
  _320 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_312 < (uint)170000), _312, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
  if ((_226 >= 0.0010000000474974513f) || (_320 >= 0.0010000000474974513f)) {
    _325 = WaveReadLaneFirst(_materialIndex);
    _333 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_325 < (uint)170000), _325, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    if (_333 > _226) {
      _336 = WaveReadLaneFirst(_materialIndex);
      _344 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_336 < (uint)170000), _336, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
      _346 = _344;
    } else {
      _346 = _226;
    }
    _354 = _346 * 0.5f;
    _378 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), (TEXCOORD.y * 2.0f)));
    _383 = WaveReadLaneFirst(_materialIndex);
    _391 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_383 < (uint)170000), _383, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _393 = (_226 < 0.0010000000474974513f);
    _394 = _393 && (_391 >= 0.0010000000474974513f);
    _396 = WaveReadLaneFirst(_materialIndex);
    _404 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_396 < (uint)170000), _396, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _414 = (TEXCOORD.y - select(_394, 0.550000011920929f, 0.5f)) - ((_378.y + -0.5f) * 0.05000000074505806f);
    _415 = ((TEXCOORD.x - ((_378.x + -0.5f) * 0.05000000074505806f)) + select(_394, -0.41999998688697815f, -0.5f)) * _35;
    _426 = ((_346 * -0.8999999761581421f) * (1.0f - saturate((select((_393 && (_404 >= 0.0010000000474974513f)), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_415 * _415) + (_414 * _414))) * 1.4285714626312256f))) + 1.0f;
    _431 = (_426 * ((_354 * (((_310 * 0.75f) - (_309 * 0.6069999933242798f)) + (_311 * 0.1889999955892563f))) + _309));
    _432 = (_426 * ((_354 * (((_309 * 0.3490000069141388f) - (_310 * 0.3140000104904175f)) + (_311 * 0.1679999977350235f))) + _310));
    _433 = (_426 * ((_354 * (((_309 * 0.2720000147819519f) + (_310 * 0.5339999794960022f)) - (_311 * 0.8690000176429749f))) + _311));
  } else {
    _431 = _309;
    _432 = _310;
    _433 = _311;
  }
  if (((_49 >= 0.0010000000474974513f) && (_80 >= 0.0010000000474974513f)) | ((_58 >= 0.0010000000474974513f) && (_93 >= 0.0010000000474974513f)) | ((_67 >= 0.0010000000474974513f) && (_106 >= 0.0010000000474974513f))) {
    _448 = _238 + -0.5f;
    _449 = _239 + -0.5f;
    _458 = rsqrt(dot(float2(_448, _449), float2(_448, _449))) * ((max(max(_80, _93), _106) * 0.009999999776482582f) * sqrt((_449 * _449) + (_448 * _448)));
    _459 = _458 * _448;
    _461 = _458 * _449;
    _474 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _459), (_239 - _461))))).x);
    _475 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239)))).y);
    _476 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_459 + _238), (_461 + _239))))).z);
  } else {
    _474 = _431;
    _475 = _432;
    _476 = _433;
  }
  if ((_119 >= 0.0010000000474974513f) && (_128 >= 0.0010000000474974513f)) {
    _481 = WaveReadLaneFirst(_materialIndex);
    _490 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_481 < (uint)170000), _481, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.x);
    _491 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_481 < (uint)170000), _481, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.y);
    _492 = _238 - _490;
    _493 = _239 - _491;
    _502 = rsqrt(dot(float2(_492, _493), float2(_492, _493))) * ((_128 * 0.009999999776482582f) * sqrt((_493 * _493) + (_492 * _492)));
    _503 = _502 * _492;
    _505 = _502 * _493;
    _527 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _503), (_239 - _505))))).x) - _474) * _119) + _474);
    _528 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239)))).y) - _475) * _119) + _475);
    _529 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_503 + _238), (_505 + _239))))).z) - _476) * _119) + _476);
  } else {
    _527 = _431;
    _528 = _432;
    _529 = _433;
  }
  _530 = WaveReadLaneFirst(_materialIndex);
  _538 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_530 < (uint)170000), _530, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeG);
  _539 = WaveReadLaneFirst(_materialIndex);
  _547 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_539 < (uint)170000), _539, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeR);
  _548 = WaveReadLaneFirst(_materialIndex);
  _556 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_548 < (uint)170000), _548, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeB);
  _557 = WaveReadLaneFirst(_materialIndex);
  _565 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_557 < (uint)170000), _557, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeKnowledge);
  _566 = WaveReadLaneFirst(_materialIndex);
  _574 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_566 < (uint)170000), _566, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeInterrupt);
  _579 = saturate((((_547 + _538) + _556) + _565) + _574);
  [branch]
  if (_579 > 0.0f) {
    if (_538 < 0.0010000000474974513f) {
      if (_547 < 0.0010000000474974513f) {
        if (_556 < 0.0010000000474974513f) {
          if (!(_565 < 0.0010000000474974513f)) {
            _591 = 0.6000000238418579f;
            _592 = 0.6000000238418579f;
            _593 = 0.800000011920929f;
            _594 = 0.5f;
            _595 = 0.44999998807907104f;
            _596 = 0.949999988079071f;
          } else {
            _591 = 0.0f;
            _592 = 0.0f;
            _593 = 0.0f;
            _594 = 0.0f;
            _595 = 0.0f;
            _596 = 0.0f;
          }
        } else {
          _591 = 0.6000000238418579f;
          _592 = 0.699999988079071f;
          _593 = 0.699999988079071f;
          _594 = 0.6000000238418579f;
          _595 = 0.699999988079071f;
          _596 = 0.800000011920929f;
        }
      } else {
        _591 = 0.699999988079071f;
        _592 = 0.6000000238418579f;
        _593 = 0.6000000238418579f;
        _594 = 0.800000011920929f;
        _595 = 0.699999988079071f;
        _596 = 0.6000000238418579f;
      }
    } else {
      _591 = 0.6000000238418579f;
      _592 = 0.699999988079071f;
      _593 = 0.6000000238418579f;
      _594 = 0.6000000238418579f;
      _595 = 0.800000011920929f;
      _596 = 0.699999988079071f;
    }
    _597 = (_574 >= 0.0010000000474974513f);
    _601 = select(_597, 0.800000011920929f, _594);
    _602 = select(_597, 0.6000000238418579f, _595);
    _603 = select(_597, 0.20000000298023224f, _596);
    _610 = (1.0f - _601) * 0.3086000084877014f;
    _612 = (1.0f - _602) * 0.6093999743461609f;
    _614 = (1.0f - _603) * 0.0820000022649765f;
    _616 = select(_597, 2.0f, _591) * _527;
    _617 = select(_597, 2.0f, _592) * _528;
    _618 = select(_597, 2.0f, _593) * _529;
    _622 = _610 * _616;
    _627 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    _637 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    _638 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    _646 = (_579 * 0.75f) * saturate(sqrt((_638 * _638) + (_637 * _637)) * 2.0f);
    _653 = ((mad(_618, _614, mad(_617, _612, ((_610 + _601) * _616))) - _527) * _579) + _527;
    _654 = ((mad(_618, _614, mad(_617, (_612 + _602), _622)) - _528) * _579) + _528;
    _655 = ((mad(_618, (_614 + _603), mad(_617, _612, _622)) - _529) * _579) + _529;
    _666 = ((_646 * ((_627 * _601) - _653)) + _653);
    _667 = ((_646 * ((_627 * _602) - _654)) + _654);
    _668 = ((_646 * ((_627 * _603) - _655)) + _655);
  } else {
    _666 = _527;
    _667 = _528;
    _668 = _529;
  }
  if ((((_highLightForVisionRemoteCatch > 0.0f) || (_highLightForVision > 0.0f)) || (_characterHighlight > 0.0f)) | (_followLearning > 0.0010000000474974513f)) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_684.x, _684.y);
    _699 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_684.x)))))) + 0.5f) * _238), int((float((int)(int(float((int)((int)(_684.y)))))) + 0.5f) * _239), 0));
    _701 = _699.x & 255;
    _709 = (float((uint)((uint)((uint)((uint)(_699.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _710 = (float((uint)((uint)(((uint)((uint)(_699.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _712 = 1.0f - abs(_709);
    _713 = abs(_710);
    _714 = _712 - _713;
    if (_714 < 0.0f) {
      _725 = (select((_709 >= 0.0f), 1.0f, -1.0f) * (1.0f - _713));
      _726 = (select((_710 >= 0.0f), 1.0f, -1.0f) * _712);
    } else {
      _725 = _709;
      _726 = _710;
    }
    _728 = rsqrt(dot(float3(_725, _726, _714), float3(_725, _726, _714)));
    _729 = _728 * _725;
    _730 = _728 * _726;
    _731 = _728 * _714;
    _733 = rsqrt(dot(float3(_729, _730, _731), float3(_729, _730, _731)));
    _739 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    [branch]
    if (_701 == _renderPassTest) {
      _752 = WaveReadLaneFirst(_materialIndex);
      _760 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_752 < (uint)170000), _752, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._testEffectRatio);
      _761 = _760 * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _962 = (_761 + _666);
      _963 = _667;
      _964 = (_761 + _668);
      _965 = _701;
    } else {
      if ((_701 == _renderPassDetectObjective) || ((!(_701 == _renderPassDetectObjective)) && (_701 == _renderPassKnowledgeNPC))) {
        _787 = ((((float4)(__3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x)), frac((TEXCOORD.y * 0.015625f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y))), 0.0f))).x) * 0.5f) + 0.5f;
        _962 = ((((_787 * _739.x) - _666) * _739.w) + _666);
        _963 = ((((_787 * _739.y) - _667) * _739.w) + _667);
        _964 = ((((_787 * _739.z) - _668) * _739.w) + _668);
        _965 = _701;
      } else {
        bool __branch_chain_800;
        if (!(_701 == _renderPassDetectRemoteCatch)) {
          __branch_chain_800 = true;
        } else {
          _804 = WaveReadLaneFirst(_materialIndex);
          _812 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_804 < (uint)170000), _804, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
          if (!(_812 > 0.0010000000474974513f)) {
            __branch_chain_800 = true;
          } else {
            if (!((_highLightForVision > 0.0f) || (_highLightForVisionRemoteCatch > 0.0f))) {
              __branch_chain_800 = true;
            } else {
              __branch_chain_800 = false;
            }
          }
        }
        if (__branch_chain_800) {
          _884 = (_701 == _renderPassSelfPlayer);
          if ((_884) | ((_701 == _renderPassTest) || (_701 == _renderPassEnemy)) | (_701 == _renderPassDetectPickedRemoteCatch)) {
            if ((_characterHighlight > 0.0010000000474974513f) || (_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _913 = 1.0f - saturate(dot(float3((_733 * _729), (_733 * _730), (_733 * _731)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
              _914 = _913 * _913;
              _915 = _914 * _914;
              if (!_884) {
                if (!(_701 == _renderPassTest)) {
                  _922 = (_701 == _renderPassEnemy);
                  _927 = select(_922, 1.0f, 0.20000000298023224f);
                  _928 = select(_922, 0.30000001192092896f, 0.4000000059604645f);
                  _929 = select(_922, 0.30000001192092896f, 1.0f);
                } else {
                  _927 = 1.0f;
                  _928 = 1.0f;
                  _929 = 1.0f;
                }
              } else {
                _927 = 1.0f;
                _928 = 1.0f;
                _929 = 1.0f;
              }
              _936 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _962 = ((((_739.x - _666) + ((((_936 + (_666 * 10.0f)) * _927) - _739.x) * _915)) * _739.w) + _666);
              _963 = ((((_739.y - _667) + ((((_936 + (_667 * 10.0f)) * _928) - _739.y) * _915)) * _739.w) + _667);
              _964 = ((((_739.z - _668) + ((((_936 + (_668 * 10.0f)) * _929) - _739.z) * _915)) * _739.w) + _668);
              _965 = _701;
            } else {
              _962 = _666;
              _963 = _667;
              _964 = _668;
              _965 = _701;
            }
          } else {
            _962 = _666;
            _963 = _667;
            _964 = _668;
            _965 = _701;
          }
        } else {
          _822 = WaveReadLaneFirst(_materialIndex);
          _830 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_822 < (uint)170000), _822, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectColorBase);
          _833 = float((uint)((uint)(((uint)(_830) >> 16) & 255)));
          _836 = float((uint)((uint)(((uint)(_830) >> 8) & 255)));
          _838 = float((uint)((uint)(_830 & 255)));
          _871 = max(0.0010000000474974513f, _exposure0.x);
          _962 = ((((select(((_833 * 0.003921568859368563f) < 0.040449999272823334f), (_833 * 0.0003035269910469651f), exp2(log2((_833 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _666);
          _963 = ((((select(((_836 * 0.003921568859368563f) < 0.040449999272823334f), (_836 * 0.0003035269910469651f), exp2(log2((_836 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _667);
          _964 = ((((select(((_838 * 0.003921568859368563f) < 0.040449999272823334f), (_838 * 0.0003035269910469651f), exp2(log2((_838 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _668);
          _965 = _701;
        }
      }
    }
  } else {
    _962 = _666;
    _963 = _667;
    _964 = _668;
    _965 = 0;
  }
  if (!(_wantedRegionRatio < 0.0010000000474974513f)) {
    [branch]
    if (!(_wantedRegionOpacity < 0.0010000000474974513f)) {
      _974 = WaveReadLaneFirst(_materialIndex);
      _982 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_974 < (uint)170000), _974, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._wantedRegionColor);
      _985 = float((uint)((uint)(((uint)(_982) >> 16) & 255)));
      _988 = float((uint)((uint)(((uint)(_982) >> 8) & 255)));
      _990 = float((uint)((uint)(_982 & 255)));
      _1023 = max(0.0010000000474974513f, _exposure0.x);
      _1031 = _wantedRegionRadius * _wantedRegionRatio;
      _1033 = saturate(_1031) * 4.0f;
      _1039 = (_238 * 2.0f) + -1.0f;
      _1041 = 1.0f - (_239 * 2.0f);
      _1042 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239))).x));
      _1070 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1042, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _1041, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _1039))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _1076 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1042, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _1041, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _1039))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1070) - _wantedRegionPosition.x;
      _1077 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1042, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _1041, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _1039))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1070) - _wantedRegionPosition.z;
      _1081 = sqrt((_1076 * _1076) + (_1077 * _1077));
      _1088 = saturate(floor(_1081 / _1031));
      _1090 = (1.0f - _1088) * saturate(((_1033 - _1031) + _1081) / _1033);
      _1097 = (1.0f - saturate((_1081 - _1031) / _1033)) * _1088;
      _1101 = saturate(((_1097 * _1097) * _1097) + ((_1090 * _1090) * _1090));
      _1104 = saturate((_1101 * 5.0f) + -4.0f);
      _1105 = _1104 * _1104;
      _1108 = ((_1105 * _1105) * 9.0f) + 1.0f;
      _1123 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _238)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _239)), 0)))).x) & 127;
      _1131 = (((float((uint)((uint)((uint)(_982) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1101) * float((bool)((uint)((_1123 != 57) && ((uint)(_1123 + -53) > (uint)14))));
      _1142 = ((_1131 * ((_1108 * (select(((_985 * 0.003921568859368563f) < 0.040449999272823334f), (_985 * 0.0003035269910469651f), exp2(log2((_985 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _962)) + _962);
      _1143 = ((_1131 * ((_1108 * (select(((_988 * 0.003921568859368563f) < 0.040449999272823334f), (_988 * 0.0003035269910469651f), exp2(log2((_988 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _963)) + _963);
      _1144 = ((_1131 * ((_1108 * (select(((_990 * 0.003921568859368563f) < 0.040449999272823334f), (_990 * 0.0003035269910469651f), exp2(log2((_990 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _964)) + _964);
    } else {
      _1142 = _962;
      _1143 = _963;
      _1144 = _964;
    }
  } else {
    _1142 = _962;
    _1143 = _963;
    _1144 = _964;
  }
  if (((_temperatureWarning <= -0.009999999776482582f) || (_temperatureWarning >= 0.009999999776482582f)) || (_electrocutionWarning > 0.0010000000474974513f)) {
    _1156 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    _1162 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      _1165 = saturate(saturate(_1162));
      _1166 = TEXCOORD.x + -0.5f;
      _1167 = TEXCOORD.y + -0.6000000238418579f;
      _1175 = saturate((_1165 + -0.5f) + sqrt((_1167 * _1167) + (_1166 * _1166))) * _1165;
      _1180 = (1.0f - (_1175 * 0.30000001192092896f)) * _1143;
      _1181 = (1.0f - (_1175 * 0.699999988079071f)) * _1144;
      _1207 = ((_1156.x - _1142) * _1156.w);
      _1208 = (lerp(_1180, _1156.y, _1156.w));
      _1209 = (lerp(_1181, _1156.z, _1156.w));
    } else {
      _1196 = (_1156.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1162) * 2.0f);
      _1207 = (_1196 * (_1156.x - (_1142 * 0.30000001192092896f)));
      _1208 = ((_1196 * (_1156.y - (_1143 * 0.10000002384185791f))) + _1143);
      _1209 = ((_1196 * _1156.z) + _1144);
    }
    _1210 = _1142 + _1207;
    if (_electrocutionWarning != 0.0f) {
      _1216 = max(0.0010000000474974513f, _exposure0.x);
      _1220 = TEXCOORD.x + -0.5f;
      _1221 = TEXCOORD.y + -0.6000000238418579f;
      _1229 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1221 * _1221) + (_1220 * _1220)) + -0.30000001192092896f);
      _1236 = (_1229 * ((0.05000000074505806f / _1216) - _1210)) + _1210;
      _1237 = (_1229 * ((0.10000000149011612f / _1216) - _1208)) + _1208;
      _1238 = (_1229 * ((0.5f / _1216) - _1209)) + _1209;
      _1249 = (lerp(_1236, _1156.x, _1156.w));
      _1250 = (lerp(_1237, _1156.y, _1156.w));
      _1251 = (lerp(_1238, _1156.z, _1156.w));
    } else {
      _1249 = _1210;
      _1250 = _1208;
      _1251 = _1209;
    }
  } else {
    _1249 = _1142;
    _1250 = _1143;
    _1251 = _1144;
  }
  [branch]
  if (!(_hpPercentage > 20.0f)) {
    _1257 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if ((_hpPercentage > 0.0f) && (_1257 >= 0.0010000000474974513f)) {
      _1272 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f;
      _1283 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1272 + (TEXCOORD.x * 12.0f)), (_1272 + (TEXCOORD.y * 6.0f)))))).w) * 0.10000000149011612f;
      _1286 = WaveReadLaneFirst(_materialIndex);
      _1294 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1286 < (uint)170000), _1286, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
      _1308 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      _1311 = max((abs(TEXCOORD.x + -0.5f) - _1308), 0.0f);
      _1312 = max((abs(TEXCOORD.y + -0.5f) - _1308), 0.0f);
      _1324 = sin(frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      _1336 = 1.0f - _239;
      _1339 = saturate((_1336 * _1336) * 2.0f);
      _1340 = saturate(_1324);
      _1348 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
      _1350 = (_1340 * 0.0112674031406641f) + 0.022386489436030388f;
      _1359 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      _1361 = select(_1348, 0.006995410192757845f, 0.04317210242152214f) * _1359;
      _1365 = (min(max(_1257, 0.0f), 1.0f) * saturate((saturate(((_1324 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1312 * _1312) + (_1311 * _1311)) * 3.846153974533081f)) * 2.0f) - ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1294 < (uint)65000), _1294, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1283), (_1283 + TEXCOORD.y))))).x) * 1.440000057220459f))) * _1339;
      _1366 = _1339 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      _1373 = (((select(_1348, 0.215860515832901f, 0.04317210242152214f) * _1359) - _1249) * _1366) + _1249;
      _1374 = ((_1361 - _1250) * _1366) + _1250;
      _1375 = ((_1361 - _1251) * _1366) + _1251;
      _1386 = ((((select(_1348, ((_1340 * 0.056337013840675354f) + 0.11193244159221649f), _1350) * _1359) - _1373) * _1365) + _1373);
      _1387 = ((((select(_1348, ((_1340 * 0.0053743417374789715f) + 0.0021246890537440777f), _1350) * _1359) - _1374) * _1365) + _1374);
      _1388 = ((((select(_1348, 0.0021246890537440777f, _1350) * _1359) - _1375) * _1365) + _1375);
    } else {
      _1386 = _1249;
      _1387 = _1250;
      _1388 = _1251;
    }
  } else {
    _1386 = _1249;
    _1387 = _1250;
    _1388 = _1251;
  }
  _1389 = WaveReadLaneFirst(_materialIndex);
  _1399 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.x);
  _1400 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.y);
  _1401 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.z);
  _1402 = WaveReadLaneFirst(_materialIndex);
  _1412 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.x);
  _1413 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.y);
  _1414 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.z);
  _1415 = WaveReadLaneFirst(_materialIndex);
  _1423 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1415 < (uint)170000), _1415, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._contrast);
  _1428 = (_137 > 0.0010000000474974513f);
  if (_1428 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0)) {
    _1435 = (_1399 > (_1400 + 0.05000000074505806f)) && (_1399 > (_1401 + 0.05000000074505806f));
    _1436 = _1399 * 0.4000000059604645f;
    _1444 = (_1412 > (_1413 + 0.05000000074505806f)) && (_1412 > (_1414 + 0.05000000074505806f));
    _1445 = _1412 * 0.4000000059604645f;
    _1450 = select(_1435, _1436, _1399);
    _1451 = select(_1435, _1436, _1400);
    _1452 = select(_1435, _1436, _1401);
    _1453 = select(_1444, _1445, _1412);
    _1454 = select(_1444, _1445, _1413);
    _1455 = select(_1444, _1445, _1414);
  } else {
    _1450 = _1399;
    _1451 = _1400;
    _1452 = _1401;
    _1453 = _1412;
    _1454 = _1413;
    _1455 = _1414;
  }
  _1456 = _1450 * _1386;
  _1457 = _1451 * _1387;
  _1458 = _1452 * _1388;
  _1462 = (1.0f - _1453) * 0.3086000084877014f;
  _1464 = (1.0f - _1454) * 0.6093999743461609f;
  _1466 = (1.0f - _1455) * 0.0820000022649765f;
  _1471 = _1462 * _1456;
  _1488 = max(_1423, 0.0f);
  _1495 = max(0.0f, ((_1488 * (mad(_1458, _1466, mad(_1457, _1464, ((_1462 + _1453) * _1456))) + -0.5f)) + 0.5f));
  _1496 = max(0.0f, ((_1488 * (mad(_1458, _1466, mad(_1457, (_1464 + _1454), _1471)) + -0.5f)) + 0.5f));
  _1497 = max(0.0f, ((_1488 * (mad(_1458, (_1466 + _1455), mad(_1457, _1464, _1471)) + -0.5f)) + 0.5f));
  _1498 = WaveReadLaneFirst(_materialIndex);
  _1506 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1498 < (uint)170000), _1498, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._invertColor);
  _1509 = _exposure2.x * 4.0f;
  _1519 = ((_1509 - (_1495 * 2.0f)) * _1506) + _1495;
  _1520 = ((_1509 - (_1496 * 2.0f)) * _1506) + _1496;
  _1521 = ((_1509 - (_1497 * 2.0f)) * _1506) + _1497;
  _1522 = WaveReadLaneFirst(_materialIndex);
  _1530 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1522 < (uint)170000), _1522, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderRatio);
  [branch]
  if (!(_1530 < 0.0010000000474974513f)) {
    _1533 = WaveReadLaneFirst(_materialIndex);
    _1542 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1533 < (uint)170000), _1533, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.x);
    _1543 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1533 < (uint)170000), _1533, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.y);
    _1546 = WaveReadLaneFirst(_materialIndex);
    _1555 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1546 < (uint)170000), _1546, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.x);
    _1556 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1546 < (uint)170000), _1546, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.y);
    _1559 = WaveReadLaneFirst(_materialIndex);
    _1567 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1559 < (uint)170000), _1559, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
    _1576 = WaveReadLaneFirst(_materialIndex);
    _1584 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1576 < (uint)170000), _1576, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderSmoothness);
    _1585 = WaveReadLaneFirst(_materialIndex);
    _1593 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1585 < (uint)170000), _1585, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderWidth);
    _1599 = (1.0f - _1593) * 0.5f;
    _1602 = max((abs(TEXCOORD.x + -0.5f) - _1599), 0.0f);
    _1603 = max((abs(TEXCOORD.y + -0.5f) - _1599), 0.0f);
    _1612 = 1.0f - ((1.0f - saturate(sqrt((_1603 * _1603) + (_1602 * _1602)) / _1584)) * 2.0f);
    _1613 = WaveReadLaneFirst(_materialIndex);
    _1621 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1613 < (uint)170000), _1613, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerSpeed);
    if (_1621 > 0.0010000000474974513f) {
      _1624 = WaveReadLaneFirst(_materialIndex);
      _1633 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1624 < (uint)170000), _1624, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.x);
      _1634 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1624 < (uint)170000), _1624, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.y);
      _1642 = WaveReadLaneFirst(_materialIndex);
      _1650 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1642 < (uint)170000), _1642, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerIntensity);
      _1654 = ((min(max(sin((_1621 * 3.1415927410125732f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)), _1633), _1634) * _1612) * _1650);
    } else {
      _1654 = _1612;
    }
    _1656 = WaveReadLaneFirst(_materialIndex);
    _1664 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1656 < (uint)170000), _1656, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseRatio);
    _1670 = min(max(_1530, 0.0f), 1.0f) * saturate(saturate(_1654) - (_1664 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1567 < (uint)65000), _1567, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1555 + (_1542 * TEXCOORD.x)), (_1556 + (_1543 * TEXCOORD.y)))))).x)));
    _1671 = WaveReadLaneFirst(_materialIndex);
    _1679 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1671 < (uint)170000), _1671, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderColor);
    _1682 = float((uint)((uint)(((uint)(_1679) >> 16) & 255)));
    _1685 = float((uint)((uint)(((uint)(_1679) >> 8) & 255)));
    _1687 = float((uint)((uint)(_1679 & 255)));
    _1712 = select(((_1682 * 0.003921568859368563f) < 0.040449999272823334f), (_1682 * 0.0003035269910469651f), exp2(log2((_1682 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1719 = _1428 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _1720 = _1712 * 0.4000000059604645f;
    _1727 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1741 = ((((select(_1719, _1720, _1712) * _1727) - _1519) * _1670) + _1519);
    _1742 = ((((select(_1719, _1720, select(((_1685 * 0.003921568859368563f) < 0.040449999272823334f), (_1685 * 0.0003035269910469651f), exp2(log2((_1685 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1727) - _1520) * _1670) + _1520);
    _1743 = ((((select(_1719, _1720, select(((_1687 * 0.003921568859368563f) < 0.040449999272823334f), (_1687 * 0.0003035269910469651f), exp2(log2((_1687 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1727) - _1521) * _1670) + _1521);
  } else {
    _1741 = _1519;
    _1742 = _1520;
    _1743 = _1521;
  }
  [branch]
  if (!(_58 < 0.0010000000474974513f)) {
    _1746 = TEXCOORD.x + -0.5f;
    _1747 = TEXCOORD.y + -0.5f;
    _1752 = WaveReadLaneFirst(_materialIndex);
    _1760 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1752 < (uint)170000), _1752, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius2);
    _1766 = WaveReadLaneFirst(_materialIndex);
    _1774 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1766 < (uint)170000), _1766, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower2);
    _1779 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * _1774) * (sqrt((_1747 * _1747) + (_1746 * _1746)) / max(0.0010000000474974513f, (1.0f - _1760))));
    _1784 = saturate(_58 * 10.0f) * saturate(_1779 * 2.0f);
    _1791 = (_1784 * (_474 - _1741)) + _1741;
    _1792 = (_1784 * (_475 - _1742)) + _1742;
    _1793 = (_1784 * (_476 - _1743)) + _1743;
    _1794 = WaveReadLaneFirst(_materialIndex);
    _1802 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1794 < (uint)170000), _1794, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor2);
    _1805 = float((uint)((uint)(((uint)(_1802) >> 16) & 255)));
    _1808 = float((uint)((uint)(((uint)(_1802) >> 8) & 255)));
    _1810 = float((uint)((uint)(_1802 & 255)));
    _1835 = select(((_1805 * 0.003921568859368563f) < 0.040449999272823334f), (_1805 * 0.0003035269910469651f), exp2(log2((_1805 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1842 = _1428 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _1843 = _1835 * 0.20000000298023224f;
    _1850 = max(0.0010000000474974513f, _exposure0.x);
    _1857 = saturate(_1779) * _58;
    _1865 = ((((select(_1842, _1843, _1835) / _1850) - _1791) * _1857) + _1791);
    _1866 = ((((select(_1842, _1843, select(((_1808 * 0.003921568859368563f) < 0.040449999272823334f), (_1808 * 0.0003035269910469651f), exp2(log2((_1808 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1850) - _1792) * _1857) + _1792);
    _1867 = ((((select(_1842, _1843, select(((_1810 * 0.003921568859368563f) < 0.040449999272823334f), (_1810 * 0.0003035269910469651f), exp2(log2((_1810 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1850) - _1793) * _1857) + _1793);
  } else {
    _1865 = _1741;
    _1866 = _1742;
    _1867 = _1743;
  }
  [branch]
  if (!(_49 < 0.0010000000474974513f)) {
    _1870 = TEXCOORD.x + -0.5f;
    _1871 = TEXCOORD.y + -0.5f;
    _1876 = WaveReadLaneFirst(_materialIndex);
    _1884 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1876 < (uint)170000), _1876, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius1);
    _1889 = WaveReadLaneFirst(_materialIndex);
    _1897 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1889 < (uint)170000), _1889, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower1);
    _1902 = saturate(exp2(log2(1.0f - TEXCOORD.y) * _1897) * (sqrt((_1871 * _1871) + (_1870 * _1870)) / max(0.0010000000474974513f, (1.0f - _1884))));
    _1905 = saturate(_49 * 10.0f) * _1902;
    _1912 = (_1905 * (_474 - _1865)) + _1865;
    _1913 = (_1905 * (_475 - _1866)) + _1866;
    _1914 = (_1905 * (_476 - _1867)) + _1867;
    _1915 = WaveReadLaneFirst(_materialIndex);
    _1923 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1915 < (uint)170000), _1915, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor1);
    _1926 = float((uint)((uint)(((uint)(_1923) >> 16) & 255)));
    _1929 = float((uint)((uint)(((uint)(_1923) >> 8) & 255)));
    _1931 = float((uint)((uint)(_1923 & 255)));
    _1956 = select(((_1926 * 0.003921568859368563f) < 0.040449999272823334f), (_1926 * 0.0003035269910469651f), exp2(log2((_1926 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1963 = _1428 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _1964 = _1956 * 0.20000000298023224f;
    _1971 = max(0.0010000000474974513f, _exposure0.x);
    _1978 = saturate(_1902) * _49;
    _1986 = ((((select(_1963, _1964, _1956) / _1971) - _1912) * _1978) + _1912);
    _1987 = ((((select(_1963, _1964, select(((_1929 * 0.003921568859368563f) < 0.040449999272823334f), (_1929 * 0.0003035269910469651f), exp2(log2((_1929 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1971) - _1913) * _1978) + _1913);
    _1988 = ((((select(_1963, _1964, select(((_1931 * 0.003921568859368563f) < 0.040449999272823334f), (_1931 * 0.0003035269910469651f), exp2(log2((_1931 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1971) - _1914) * _1978) + _1914);
  } else {
    _1986 = _1865;
    _1987 = _1866;
    _1988 = _1867;
  }
  [branch]
  if (!(_67 < 0.0010000000474974513f)) {
    _1991 = TEXCOORD.x + -0.5f;
    _1992 = TEXCOORD.y + -0.5f;
    _1997 = WaveReadLaneFirst(_materialIndex);
    _2005 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1997 < (uint)170000), _1997, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius3);
    _2009 = WaveReadLaneFirst(_materialIndex);
    _2017 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2009 < (uint)170000), _2009, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower3);
    _2022 = saturate((pow(TEXCOORD.y, _2017)) * (sqrt((_1992 * _1992) + (_1991 * _1991)) / max(0.0010000000474974513f, (1.0f - _2005))));
    _2025 = saturate(_67 * 10.0f) * _2022;
    _2032 = (_2025 * (_474 - _1986)) + _1986;
    _2033 = (_2025 * (_475 - _1987)) + _1987;
    _2034 = (_2025 * (_476 - _1988)) + _1988;
    _2035 = WaveReadLaneFirst(_materialIndex);
    _2043 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2035 < (uint)170000), _2035, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor3);
    _2046 = float((uint)((uint)(((uint)(_2043) >> 16) & 255)));
    _2049 = float((uint)((uint)(((uint)(_2043) >> 8) & 255)));
    _2051 = float((uint)((uint)(_2043 & 255)));
    _2076 = select(((_2046 * 0.003921568859368563f) < 0.040449999272823334f), (_2046 * 0.0003035269910469651f), exp2(log2((_2046 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2083 = _1428 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _2084 = _2076 * 0.20000000298023224f;
    _2091 = max(0.0010000000474974513f, _exposure0.x);
    _2098 = saturate(_2022) * _67;
    _2106 = ((((select(_2083, _2084, _2076) / _2091) - _2032) * _2098) + _2032);
    _2107 = ((((select(_2083, _2084, select(((_2049 * 0.003921568859368563f) < 0.040449999272823334f), (_2049 * 0.0003035269910469651f), exp2(log2((_2049 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2091) - _2033) * _2098) + _2033);
    _2108 = ((((select(_2083, _2084, select(((_2051 * 0.003921568859368563f) < 0.040449999272823334f), (_2051 * 0.0003035269910469651f), exp2(log2((_2051 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2091) - _2034) * _2098) + _2034);
  } else {
    _2106 = _1986;
    _2107 = _1987;
    _2108 = _1988;
  }
  [branch]
  if (!(_hideStateRatio < 0.0010000000474974513f)) {
    _2113 = _hideStateRatio * 0.5f;
    _2114 = TEXCOORD.x + -0.5f;
    _2115 = TEXCOORD.y + -0.5f;
    _2123 = saturate(((_2113 + -0.5f) + sqrt((_2115 * _2115) + (_2114 * _2114))) * 2.0f);
    _2131 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2123) * 0.5f) + _2123);
    _2139 = (((_2131 * _2131) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2131 * 2.0f));
    _2142 = dot(float3(_2106, _2107, _2108), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2113);
    _2145 = (pow(_2139, 0.5f));
    _2152 = ((_2142 - _2106) * _2145) + _2106;
    _2153 = ((_2142 - _2107) * _2145) + _2107;
    _2154 = ((_2142 - _2108) * _2145) + _2108;
    _2158 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2169 = (lerp(_2152, _2158, _2139));
    _2170 = (lerp(_2153, _2158, _2139));
    _2171 = (lerp(_2154, _2158, _2139));
  } else {
    _2169 = _2106;
    _2170 = _2107;
    _2171 = _2108;
  }
  if (_followLearning > 0.0010000000474974513f) {
    _2176 = WaveReadLaneFirst(_materialIndex);
    _2184 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2176 < (uint)170000), _2176, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningColor);
    _2187 = float((uint)((uint)(((uint)(_2184) >> 16) & 255)));
    _2190 = float((uint)((uint)(((uint)(_2184) >> 8) & 255)));
    _2192 = float((uint)((uint)(_2184 & 255)));
    _2222 = max(0.0010000000474974513f, _exposure0.x);
    _2223 = select(((_2187 * 0.003921568859368563f) < 0.040449999272823334f), (_2187 * 0.0003035269910469651f), exp2(log2((_2187 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    _2224 = select(((_2190 * 0.003921568859368563f) < 0.040449999272823334f), (_2190 * 0.0003035269910469651f), exp2(log2((_2190 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    _2225 = select(((_2192 * 0.003921568859368563f) < 0.040449999272823334f), (_2192 * 0.0003035269910469651f), exp2(log2((_2192 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    _2226 = WaveReadLaneFirst(_materialIndex);
    _2234 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2226 < (uint)170000), _2226, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningNoiseTex);
    _2245 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _239)));
    _2252 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    _2255 = (_238 * 2.0f) + -1.0f;
    _2257 = 1.0f - (_239 * 2.0f);
    _2258 = max(1.0000000116860974e-07f, _2252.x);
    _2294 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _2258, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _2257, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _2255))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _2303 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _238);
    _2304 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _239);
    _2306 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_2303, _2304, 0));
    _2309 = __3__36__0__0__g_gbufferNormal.Load(int3(_2303, _2304, 0));
    _2327 = (saturate(_2309.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2328 = (saturate(_2309.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2329 = (saturate(_2309.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2331 = rsqrt(dot(float3(_2327, _2328, _2329), float3(_2327, _2328, _2329)));
    _2332 = _2331 * _2327;
    _2333 = _2331 * _2328;
    _2334 = _2329 * _2331;
    _2337 = (float((uint)((uint)(((uint)((uint)(_2306.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _2338 = (float((uint)((uint)(_2306.w & 255))) * 0.007843137718737125f) + -1.0f;
    _2341 = (_2337 + _2338) * 0.5f;
    _2342 = (_2337 - _2338) * 0.5f;
    _2346 = (1.0f - abs(_2341)) - abs(_2342);
    _2348 = rsqrt(dot(float3(_2341, _2342, _2346), float3(_2341, _2342, _2346)));
    _2349 = _2348 * _2341;
    _2350 = _2348 * _2342;
    _2351 = _2348 * _2346;
    _2353 = select((_2334 >= 0.0f), 1.0f, -1.0f);
    _2356 = -0.0f - (1.0f / (_2353 + _2334));
    _2357 = _2333 * _2356;
    _2358 = _2357 * _2332;
    _2359 = _2353 * _2332;
    _2368 = mad(_2351, _2332, mad(_2350, _2358, ((((_2359 * _2332) * _2356) + 1.0f) * _2349)));
    _2372 = mad(_2351, _2333, mad(_2350, (_2353 + (_2357 * _2333)), ((_2349 * _2353) * _2358)));
    _2376 = mad(_2351, _2334, mad(_2350, (-0.0f - _2333), (-0.0f - (_2359 * _2349))));
    _2378 = rsqrt(dot(float3(_2368, _2372, _2376), float3(_2368, _2372, _2376)));
    _2380 = _2378 * _2372;
    _2381 = _2378 * _2376;
    _2384 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.5f;
    _2387 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _2258, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _2257, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _2255))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _2294) - _2384) * 0.20000000298023224f;
    _2388 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _2258, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _2257, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _2255))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _2294) - _2384) * 0.20000000298023224f;
    _2395 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2387, _2388));
    _2398 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _2258, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _2257, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _2255))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _2294) - _2384) * 0.20000000298023224f;
    _2407 = (abs(_2380) * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2398, _2387)))).w) - _2395.w)) + _2395.w;
    _2410 = (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2398, _2388)))).w) - _2407) * abs(_2381)) + _2407;
    _2411 = _2245.z + -0.5f;
    _2416 = _238 + -0.5f;
    _2418 = _239 + -0.5f;
    _2423 = 0.375f - (_2411 * 0.25f);
    _2426 = max((abs(((_2245.x + -0.5f) * 0.10000000149011612f) + _2416) - _2423), 0.0f);
    _2427 = max((abs(((_2245.y + -0.5f) * 0.10000000149011612f) + _2418) - _2423), 0.0f);
    _2432 = saturate(sqrt((_2427 * _2427) + (_2426 * _2426)));
    _2436 = saturate(_followLearning * 2.0f);
    _2442 = saturate(((((_2252.x * 100.0f) * _2436) - _2410) * 2.0f) + -0.5f);
    _2452 = sqrt((_2418 * _2418) + (_2416 * _2416));
    _2455 = ((saturate((_2436 * 2.0f) + -1.0f) * (1.0f - _2442)) + _2442) * saturate(_2452 + 0.5f);
    _2457 = atan(_2418 / _2416);
    _2460 = (_2416 < 0.0f);
    _2461 = (_2416 == 0.0f);
    _2462 = (_2418 >= 0.0f);
    _2463 = (_2418 < 0.0f);
    _2475 = _2410 * 0.5f;
    _2488 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2411 * -0.5f) - _2475) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f)) + select((_2461 && _2462), 7.5f, select((_2461 && _2463), -7.5f, (select((_2460 && _2463), (_2457 + -3.1415927410125732f), select((_2460 && _2462), (_2457 + 3.1415927410125732f), _2457)) * 4.774648189544678f)))), (((((_2245.w + -0.5f) * -0.5f) - _2475) + (_2452 * 2.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.5f))));
    if (!(_965 == _renderPassSelfPlayer)) {
      _2523 = (_965 == _renderPassTest);
    } else {
      _2523 = true;
    }
    _2524 = ((1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239))).x))) + 0.5f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _238), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _239), 0)))).x)))))) != 0.0f);
    _2526 = _2524 || (!_2523);
    if (_965 == _renderPassTargetFocus) {
      if (_2524) {
        _2540 = (_965 != _renderPassAimHighlight);
      } else {
        _2540 = false;
      }
    } else {
      if (_2524 || (_965 != _renderPassLearning)) {
        _2540 = (_965 != _renderPassAimHighlight);
      } else {
        _2540 = false;
      }
    }
    _2542 = saturate(_followLearning * 4.0f);
    _2549 = (_2542 * (_242.x - _2169)) + _2169;
    _2550 = (_2542 * (_242.y - _2170)) + _2170;
    _2551 = (_2542 * (_242.z - _2171)) + _2171;
    _2552 = _2526 && _2540;
    if (_2552) {
      _2559 = ((_followLearning * 0.25f) * _2488.w) * saturate(_2452 - (_2542 * 0.20000000298023224f));
      _2563 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2559 + _238), (_2559 + _239)));
      _2577 = 1.0f - (_followLearning * 0.75f);
      _2587 = ((lerp(_2549, _2563.x, _2542)) * _2577);
      _2588 = ((lerp(_2550, _2563.y, _2542)) * _2577);
      _2589 = ((lerp(_2551, _2563.z, _2542)) * _2577);
      _2590 = _2455;
    } else {
      if (_2526) {
        _2587 = _2549;
        _2588 = _2550;
        _2589 = _2551;
        _2590 = select(_2540, _2455, 0.0f);
      } else {
        _2587 = _2549;
        _2588 = _2550;
        _2589 = _2551;
        _2590 = (_2455 * 0.4000000059604645f);
      }
    }
    _2591 = dot(float3(_2587, _2588, _2589), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _2598 = ((_2591 - _2587) * _2590) + _2587;
    _2599 = ((_2591 - _2588) * _2590) + _2588;
    _2600 = ((_2591 - _2589) * _2590) + _2589;
    _2602 = _2410 * (_2245.z * 0.30000001192092896f);
    _2608 = saturate(_2590 * 5.0f) * 0.8999999761581421f;
    _2615 = (((_2602 * _2223) - _2598) * _2608) + _2598;
    _2616 = (((_2602 * _2224) - _2599) * _2608) + _2599;
    _2617 = (((_2602 * _2225) - _2600) * _2608) + _2600;
    _2618 = WaveReadLaneFirst(_materialIndex);
    _2626 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2618 < (uint)170000), _2618, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningSaturationTone);
    _2629 = float((uint)((uint)(((uint)(_2626) >> 16) & 255)));
    _2632 = float((uint)((uint)(((uint)(_2626) >> 8) & 255)));
    _2634 = float((uint)((uint)(_2626 & 255)));
    _2659 = select(((_2629 * 0.003921568859368563f) < 0.040449999272823334f), (_2629 * 0.0003035269910469651f), exp2(log2((_2629 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2660 = select(((_2632 * 0.003921568859368563f) < 0.040449999272823334f), (_2632 * 0.0003035269910469651f), exp2(log2((_2632 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2661 = select(((_2634 * 0.003921568859368563f) < 0.040449999272823334f), (_2634 * 0.0003035269910469651f), exp2(log2((_2634 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2665 = (1.0f - _2659) * 0.3086000084877014f;
    _2667 = (1.0f - _2660) * 0.6093999743461609f;
    _2669 = (1.0f - _2661) * 0.0820000022649765f;
    _2674 = _2665 * _2615;
    _2687 = (_followLearning * (mad(_2617, _2669, mad(_2616, _2667, ((_2665 + _2659) * _2615))) - _2615)) + _2615;
    _2688 = (_followLearning * (mad(_2617, _2669, mad(_2616, (_2667 + _2660), _2674)) - _2616)) + _2616;
    _2689 = (_followLearning * (mad(_2617, (_2669 + _2661), mad(_2616, _2667, _2674)) - _2617)) + _2617;
    if (!_2552) {
      _2703 = saturate(1.0f - dot(float3((_2475 + (_2378 * _2368)), (_2475 + _2380), (_2475 + _2381)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _2708 = select(_2526, ((_2703 * _2703) * 6.0f), (_2703 * 0.25f)) * _2703;
      _2712 = (_followLearning * _followLearning) * saturate(_2410 * 10.0f);
      _2723 = (((_2712 * _2223) * _2708) + _2687);
      _2724 = (((_2712 * _2224) * _2708) + _2688);
      _2725 = (((_2712 * _2225) * _2708) + _2689);
    } else {
      _2723 = _2687;
      _2724 = _2688;
      _2725 = _2689;
    }
    _2726 = _followLearning * _2432;
    _2730 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2737 = ((_2730 - _2723) * _2726) + _2723;
    _2738 = ((_2730 - _2724) * _2726) + _2724;
    _2739 = ((_2730 - _2725) * _2726) + _2725;
    _2744 = saturate(((_2488.w * _2488.w) * 20.0f) * _followLearning) * _2432;
    _2755 = (lerp(_2737, _2223, _2744));
    _2756 = (lerp(_2738, _2224, _2744));
    _2757 = (lerp(_2739, _2225, _2744));
  } else {
    _2755 = _2169;
    _2756 = _2170;
    _2757 = _2171;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    _2777 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
    _2783 = max(0.0010000000474974513f, _exposure0.x);
    _2800 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    _2803 = _2800.x + -0.5f;
    _2804 = _2800.y + -0.5f;
    _2814 = 0.44999998807907104f - (_2803 * 0.004999999888241291f);
    _2817 = max((abs((TEXCOORD.x + -0.5f) + (_2803 * 0.019999999552965164f)) - _2814), 0.0f);
    _2818 = max((abs((TEXCOORD.y + -0.5f) + (_2804 * 0.019999999552965164f)) - _2814), 0.0f);
    _2829 = WaveReadLaneFirst(_materialIndex);
    _2837 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2829 < (uint)170000), _2829, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._enemyAlertTex);
    _2844 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2837 < (uint)65000), _2837, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_2804 * 0.029999999329447746f)), (TEXCOORD.y - (_2803 * 0.029999999329447746f))));
    _2849 = (TEXCOORD.y > 0.5f);
    _2851 = (TEXCOORD.x < 0.5f);
    _2855 = (TEXCOORD.y < 0.5f);
    _2863 = (TEXCOORD.x > 0.5f);
    _2887 = saturate(dot(float4((_2844.x * float((bool)_2855)), (_2844.y * float((bool)((uint)(_2863 && _2855)))), (_2844.z * float((bool)_2863)), (_2844.w * float((bool)((uint)(_2863 && _2849))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_2844.x * float((bool)_2849)), (_2844.y * float((bool)((uint)(_2851 && _2849)))), (_2844.z * float((bool)_2851)), (_2844.w * float((bool)((uint)(_2851 && _2855))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_2818 * _2818) + (_2817 * _2817)) * 20.0f);
    _2889 = (_2887 * _2887) * _2887;
    _2900 = ((_2889 * ((select(_2777, 0.09989875555038452f, 0.08437622338533401f) / _2783) - _2755)) + _2755);
    _2901 = ((_2889 * ((select(_2777, 0.027320895344018936f, 0.030713455751538277f) / _2783) - _2756)) + _2756);
    _2902 = ((_2889 * ((select(_2777, 0.04817182570695877f, 0.07036010921001434f) / _2783) - _2757)) + _2757);
  } else {
    _2900 = _2755;
    _2901 = _2756;
    _2902 = _2757;
  }
  _2903 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _2916 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _2903, 0)))).x) & 127))) + 0.5f);
  } else {
    _2916 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_2900, _2901, _2902));
    _3338 = output_color.x;
    _3339 = output_color.y;
    _3340 = output_color.z;
  } else {
    _3338 = _2900;
    _3339 = _2901;
    _3340 = _2902;
  }
  // Basic SDR final fallback: apply film grain here only when no final SDR pass follows.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f && CUSTOM_FILM_GRAIN_TYPE != 0) {
    // DLAA writes this material directly to the fake swapchain, so neighbor-sampling
    // sharpening has no matching final-color source texture at this point.
    float3 postprocess_color = renodx::effects::ApplyFilmGrain(float3(_3338, _3339, _3340), TEXCOORD, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    _3338 = postprocess_color.x;
    _3339 = postprocess_color.y;
    _3340 = postprocess_color.z;
  }
  if (_etcParams.y > 1.0f) {
    float custom_vignette_strength = saturate(_etcParams.y + -1.0f);
    // Basic SDR final fallback: reuse the user vignette slider in this direct-to-output path.
    if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
      custom_vignette_strength *= CUSTOM_VIGNETTE;
    }
    _3351 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _3352 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _3356 = saturate(1.0f - (dot(float2(_3351, _3352), float2(_3351, _3352)) * custom_vignette_strength));
    _3361 = (_3356 * _3338);
    _3362 = (_3356 * _3339);
    _3363 = (_3356 * _3340);
  } else {
    _3361 = _3338;
    _3362 = _3339;
    _3363 = _3340;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _3396 = select((_3361 <= 0.0031308000907301903f), (_3361 * 12.920000076293945f), (((pow(_3361, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3397 = select((_3362 <= 0.0031308000907301903f), (_3362 * 12.920000076293945f), (((pow(_3362, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3398 = select((_3363 <= 0.0031308000907301903f), (_3363 * 12.920000076293945f), (((pow(_3363, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3396 = _3361;
    _3397 = _3362;
    _3398 = _3363;
  }
  if (!(_etcParams.y < 1.0f)) {
    _3403 = float((uint)_2903);
    if (!(_3403 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_3403 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _3412 = _3396;
        _3413 = _3397;
        _3414 = _3398;
      } else {
        _3412 = 0.0f;
        _3413 = 0.0f;
        _3414 = 0.0f;
      }
    } else {
      _3412 = 0.0f;
      _3413 = 0.0f;
      _3414 = 0.0f;
    }
  } else {
    _3412 = _3396;
    _3413 = _3397;
    _3414 = _3398;
  }
  // RenoDX: >>> [Patch: BasicPostProcessFinalizeSDR] [Version: 1.10]
  // Description: This retained material postprocess fallback can become the direct final-output path if an older SDR material variant is still selected. When the runtime marks it as the basic postprocess final, apply color-temperature, Purkinje, and SDR black-crush finalization here; color grading remains in this shader's earlier TonemapReplacer branch to match the historical 1.09 material remaps.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
    float3 final_color = FinalizeSDR(
        float3(_3412, _3413, _3414),
        asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y),
        asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y));
    _3412 = final_color.x;
    _3413 = final_color.y;
    _3414 = final_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFinalizeSDR]
  SV_Target.x = _3412;
  SV_Target.y = _3413;
  SV_Target.z = _3414;
  SV_Target.w = _2916;
  return SV_Target;
}
