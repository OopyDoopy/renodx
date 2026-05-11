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

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

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
  float _345;
  float _346;
  float _347;
  float _382;
  float _467;
  float _468;
  float _469;
  float _546;
  float _547;
  float _548;
  float _635;
  float _636;
  float _637;
  float _699;
  float _700;
  float _701;
  float _702;
  float _703;
  float _704;
  float _774;
  float _775;
  float _776;
  float _833;
  float _834;
  float _1071;
  float _1072;
  float _1073;
  float _1106;
  float _1107;
  float _1108;
  int _1109;
  float _1286;
  float _1287;
  float _1288;
  float _1387;
  float _1388;
  float _1389;
  float _1429;
  float _1430;
  float _1431;
  float _1566;
  float _1567;
  float _1568;
  float _1630;
  float _1631;
  float _1632;
  float _1633;
  float _1634;
  float _1635;
  float _1834;
  float _1921;
  float _1922;
  float _1923;
  float _2045;
  float _2046;
  float _2047;
  float _2166;
  float _2167;
  float _2168;
  float _2286;
  float _2287;
  float _2288;
  float _2349;
  float _2350;
  float _2351;
  bool _2703;
  bool _2720;
  float _2803;
  float _2804;
  float _2805;
  float _2806;
  float _2939;
  float _2940;
  float _2941;
  float _2971;
  float _2972;
  float _2973;
  float _3116;
  float _3117;
  float _3118;
  float _3132;
  float _3337;
  float _3338;
  float _3339;
  float _3432;
  float _3433;
  float _3434;
  float _3554;
  float _3555;
  float _3556;
  float _3577;
  float _3578;
  float _3579;
  float _3612;
  float _3613;
  float _3614;
  float _3628;
  float _3629;
  float _3630;
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
  float _252;
  float _253;
  float _254;
  float _279;
  float _280;
  float _281;
  int _282;
  int _290;
  float4 _314;
  float _323;
  float _324;
  float _337;
  int _348;
  float _356;
  int _361;
  float _369;
  int _372;
  float _380;
  float _390;
  float4 _414;
  int _419;
  float _427;
  bool _429;
  bool _430;
  int _432;
  float _440;
  float _450;
  float _451;
  float _462;
  float _484;
  float _485;
  float _494;
  float _495;
  float _497;
  float _507;
  float _521;
  float _535;
  int _553;
  float _562;
  float _563;
  float _564;
  float _565;
  float _574;
  float _575;
  float _577;
  float _587;
  float _601;
  float _615;
  int _638;
  float _646;
  int _647;
  float _655;
  int _656;
  float _664;
  int _665;
  float _673;
  int _674;
  float _682;
  float _687;
  bool _705;
  float _709;
  float _710;
  float _711;
  float _718;
  float _720;
  float _722;
  float _724;
  float _725;
  float _726;
  float _730;
  float _735;
  float _745;
  float _746;
  float _754;
  float _761;
  float _762;
  float _763;
  uint2 _792;
  uint _807;
  int _809;
  float _817;
  float _818;
  float _820;
  float _821;
  float _822;
  float _836;
  float _837;
  float _838;
  float _839;
  float _841;
  float4 _847;
  float _858;
  float _859;
  float _860;
  float _885;
  float _886;
  float _887;
  int _896;
  float _904;
  float _905;
  float _931;
  int _948;
  float _956;
  int _966;
  int _974;
  float _977;
  float _980;
  float _982;
  float _1015;
  bool _1028;
  float _1057;
  float _1058;
  float _1059;
  bool _1066;
  float _1080;
  int _1118;
  int _1126;
  float _1129;
  float _1132;
  float _1134;
  float _1167;
  float _1175;
  float _1177;
  float _1183;
  float _1185;
  float _1186;
  float _1214;
  float _1220;
  float _1221;
  float _1225;
  float _1232;
  float _1234;
  float _1241;
  float _1245;
  float _1248;
  float _1249;
  float _1252;
  int _1267;
  float _1275;
  float4 _1300;
  float _1311;
  float _1312;
  float _1313;
  float _1338;
  float _1339;
  float _1340;
  float _1342;
  float _1345;
  float _1346;
  float _1347;
  float _1355;
  float _1360;
  float _1361;
  float _1376;
  float _1390;
  float _1396;
  float _1400;
  float _1401;
  float _1409;
  float _1416;
  float _1417;
  float _1418;
  float _1437;
  float _1452;
  float _1463;
  int _1466;
  int _1474;
  float _1488;
  float _1491;
  float _1492;
  float _1504;
  float _1516;
  float _1519;
  float _1520;
  bool _1528;
  float _1530;
  float _1539;
  float _1541;
  float _1545;
  float _1546;
  float _1553;
  float _1554;
  float _1555;
  int _1569;
  float _1579;
  float _1580;
  float _1581;
  int _1582;
  float _1592;
  float _1593;
  float _1594;
  int _1595;
  float _1603;
  bool _1608;
  bool _1615;
  float _1616;
  bool _1624;
  float _1625;
  float _1636;
  float _1637;
  float _1638;
  float _1642;
  float _1644;
  float _1646;
  float _1651;
  float _1668;
  float _1675;
  float _1676;
  float _1677;
  int _1678;
  float _1686;
  float _1689;
  float _1699;
  float _1700;
  float _1701;
  int _1702;
  float _1710;
  int _1713;
  float _1722;
  float _1723;
  int _1726;
  float _1735;
  float _1736;
  int _1739;
  int _1747;
  int _1756;
  float _1764;
  int _1765;
  float _1773;
  float _1779;
  float _1782;
  float _1783;
  float _1792;
  int _1793;
  float _1801;
  int _1804;
  float _1813;
  float _1814;
  int _1822;
  float _1830;
  int _1836;
  float _1844;
  float _1850;
  int _1851;
  int _1859;
  float _1862;
  float _1865;
  float _1867;
  float _1892;
  bool _1899;
  float _1900;
  float _1907;
  float _1926;
  float _1927;
  int _1932;
  float _1940;
  int _1946;
  float _1954;
  float _1959;
  float _1964;
  float _1971;
  float _1972;
  float _1973;
  int _1974;
  int _1982;
  float _1985;
  float _1988;
  float _1990;
  float _2015;
  bool _2022;
  float _2023;
  float _2030;
  float _2037;
  float _2050;
  float _2051;
  int _2056;
  float _2064;
  int _2069;
  float _2077;
  float _2082;
  float _2085;
  float _2092;
  float _2093;
  float _2094;
  int _2095;
  int _2103;
  float _2106;
  float _2109;
  float _2111;
  float _2136;
  bool _2143;
  float _2144;
  float _2151;
  float _2158;
  float _2171;
  float _2172;
  int _2177;
  float _2185;
  int _2189;
  float _2197;
  float _2202;
  float _2205;
  float _2212;
  float _2213;
  float _2214;
  int _2215;
  int _2223;
  float _2226;
  float _2229;
  float _2231;
  float _2256;
  bool _2263;
  float _2264;
  float _2271;
  float _2278;
  float _2293;
  float _2294;
  float _2295;
  float _2303;
  float _2311;
  float _2319;
  float _2322;
  float _2325;
  float _2332;
  float _2333;
  float _2334;
  float _2338;
  int _2356;
  int _2364;
  float _2367;
  float _2370;
  float _2372;
  float _2402;
  float _2403;
  float _2404;
  float _2405;
  int _2406;
  int _2414;
  float4 _2425;
  float _2432;
  float _2435;
  float _2437;
  float _2438;
  float _2474;
  uint _2483;
  uint _2484;
  uint4 _2486;
  float4 _2489;
  float _2507;
  float _2508;
  float _2509;
  float _2511;
  float _2512;
  float _2513;
  float _2514;
  float _2517;
  float _2518;
  float _2521;
  float _2522;
  float _2526;
  float _2528;
  float _2529;
  float _2530;
  float _2531;
  float _2533;
  float _2536;
  float _2537;
  float _2538;
  float _2539;
  float _2548;
  float _2552;
  float _2556;
  float _2558;
  float _2560;
  float _2561;
  float _2564;
  float _2567;
  float _2568;
  float4 _2575;
  float _2578;
  float _2587;
  float _2590;
  float _2591;
  float _2596;
  float _2598;
  float _2603;
  float _2606;
  float _2607;
  float _2612;
  float _2616;
  float _2622;
  float _2632;
  float _2635;
  float _2637;
  bool _2640;
  bool _2641;
  bool _2642;
  bool _2643;
  float _2655;
  float4 _2668;
  bool _2704;
  bool _2706;
  float _2722;
  float _2729;
  float _2730;
  float _2731;
  bool _2732;
  float _2739;
  float4 _2743;
  float _2753;
  float _2754;
  float _2755;
  float _2793;
  float _2807;
  float _2814;
  float _2815;
  float _2816;
  float _2818;
  float _2824;
  float _2831;
  float _2832;
  float _2833;
  int _2834;
  int _2842;
  float _2845;
  float _2848;
  float _2850;
  float _2875;
  float _2876;
  float _2877;
  float _2881;
  float _2883;
  float _2885;
  float _2890;
  float _2903;
  float _2904;
  float _2905;
  float _2919;
  float _2924;
  float _2928;
  float _2942;
  float _2946;
  float _2953;
  float _2954;
  float _2955;
  float _2960;
  bool _2993;
  float _2999;
  float4 _3016;
  float _3019;
  float _3020;
  float _3030;
  float _3033;
  float _3034;
  int _3045;
  int _3053;
  float4 _3060;
  bool _3065;
  bool _3067;
  bool _3071;
  bool _3079;
  float _3103;
  float _3105;
  uint _3119;
  float _3141;
  float _3190;
  float _3191;
  float _3192;
  float _3194;
  float _3201;
  float _3202;
  float _3203;
  float _3222;
  float _3223;
  float _3224;
  float _3225;
  float _3226;
  float _3227;
  float _3228;
  float _3229;
  float _3230;
  float _3276;
  float _3277;
  float _3278;
  float _3279;
  float _3280;
  float _3281;
  float _3282;
  float _3299;
  float _3300;
  float _3301;
  float _3302;
  float _3308;
  float _3311;
  float _3318;
  float _3319;
  float _3320;
  float _3349;
  float _3374;
  float _3375;
  float _3376;
  float _3395;
  float _3396;
  float _3397;
  float _3403;
  float _3407;
  float _3408;
  float _3409;
  float _3410;
  float _3415;
  float _3440;
  float _3444;
  float _3445;
  float _3446;
  float _3447;
  int _3488;
  float _3543;
  float _3567;
  float _3568;
  float _3572;
  float _3619;
  float _3640;
  float _3641;
  float _3642;
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
  _252 = (pow(_242.x, 0.012683313339948654f));
  _253 = (pow(_242.y, 0.012683313339948654f));
  _254 = (pow(_242.z, 0.012683313339948654f));
  _279 = exp2(log2(max(0.0f, (_252 + -0.8359375f)) / (18.8515625f - (_252 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _280 = exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _281 = exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _282 = WaveReadLaneFirst(_materialIndex);
  _290 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  [branch]
  if (!(_fleeCount < 0.0010000000474974513f)) {
    _314 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _35) * 4.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f))));
    _323 = (TEXCOORD.x + -0.5f) + ((_314.x + -0.5f) * 0.15000000596046448f);
    _324 = (TEXCOORD.y + -0.5f) + ((_314.y + -0.5f) * 0.15000000596046448f);
    _337 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_323 * _323) + (_324 * _324))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _345 = (_279 - (_337 * _279));
    _346 = (_280 - (_337 * _280));
    _347 = (_281 - (_337 * _281));
  } else {
    _345 = _279;
    _346 = _280;
    _347 = _281;
  }
  _348 = WaveReadLaneFirst(_materialIndex);
  _356 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_348 < (uint)170000), _348, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
  if ((_226 >= 0.0010000000474974513f) || (_356 >= 0.0010000000474974513f)) {
    _361 = WaveReadLaneFirst(_materialIndex);
    _369 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_361 < (uint)170000), _361, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    if (_369 > _226) {
      _372 = WaveReadLaneFirst(_materialIndex);
      _380 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_372 < (uint)170000), _372, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
      _382 = _380;
    } else {
      _382 = _226;
    }
    _390 = _382 * 0.5f;
    _414 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), (TEXCOORD.y * 2.0f)));
    _419 = WaveReadLaneFirst(_materialIndex);
    _427 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_419 < (uint)170000), _419, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _429 = (_226 < 0.0010000000474974513f);
    _430 = _429 && (_427 >= 0.0010000000474974513f);
    _432 = WaveReadLaneFirst(_materialIndex);
    _440 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_432 < (uint)170000), _432, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _450 = (TEXCOORD.y - select(_430, 0.550000011920929f, 0.5f)) - ((_414.y + -0.5f) * 0.05000000074505806f);
    _451 = ((TEXCOORD.x - ((_414.x + -0.5f) * 0.05000000074505806f)) + select(_430, -0.41999998688697815f, -0.5f)) * _35;
    _462 = ((_382 * -0.8999999761581421f) * (1.0f - saturate((select((_429 && (_440 >= 0.0010000000474974513f)), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_451 * _451) + (_450 * _450))) * 1.4285714626312256f))) + 1.0f;
    _467 = (_462 * ((_390 * (((_346 * 0.75f) - (_345 * 0.6069999933242798f)) + (_347 * 0.1889999955892563f))) + _345));
    _468 = (_462 * ((_390 * (((_345 * 0.3490000069141388f) - (_346 * 0.3140000104904175f)) + (_347 * 0.1679999977350235f))) + _346));
    _469 = (_462 * ((_390 * (((_345 * 0.2720000147819519f) + (_346 * 0.5339999794960022f)) - (_347 * 0.8690000176429749f))) + _347));
  } else {
    _467 = _345;
    _468 = _346;
    _469 = _347;
  }
  if (((_49 >= 0.0010000000474974513f) && (_80 >= 0.0010000000474974513f)) | ((_58 >= 0.0010000000474974513f) && (_93 >= 0.0010000000474974513f)) | ((_67 >= 0.0010000000474974513f) && (_106 >= 0.0010000000474974513f))) {
    _484 = _238 + -0.5f;
    _485 = _239 + -0.5f;
    _494 = rsqrt(dot(float2(_484, _485), float2(_484, _485))) * ((max(max(_80, _93), _106) * 0.009999999776482582f) * sqrt((_485 * _485) + (_484 * _484)));
    _495 = _494 * _484;
    _497 = _494 * _485;
    _507 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _495), (_239 - _497))))).x) * 0.012683313339948654f);
    _521 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239)))).y) * 0.012683313339948654f);
    _535 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_495 + _238), (_497 + _239))))).z) * 0.012683313339948654f);
    _546 = (exp2(log2(max(0.0f, (_507 + -0.8359375f)) / (18.8515625f - (_507 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _547 = (exp2(log2(max(0.0f, (_521 + -0.8359375f)) / (18.8515625f - (_521 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _548 = (exp2(log2(max(0.0f, (_535 + -0.8359375f)) / (18.8515625f - (_535 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _546 = _467;
    _547 = _468;
    _548 = _469;
  }
  if ((_119 >= 0.0010000000474974513f) && (_128 >= 0.0010000000474974513f)) {
    _553 = WaveReadLaneFirst(_materialIndex);
    _562 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_553 < (uint)170000), _553, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.x);
    _563 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_553 < (uint)170000), _553, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.y);
    _564 = _238 - _562;
    _565 = _239 - _563;
    _574 = rsqrt(dot(float2(_564, _565), float2(_564, _565))) * ((_128 * 0.009999999776482582f) * sqrt((_565 * _565) + (_564 * _564)));
    _575 = _574 * _564;
    _577 = _574 * _565;
    _587 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _575), (_239 - _577))))).x) * 0.012683313339948654f);
    _601 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239)))).y) * 0.012683313339948654f);
    _615 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_575 + _238), (_577 + _239))))).z) * 0.012683313339948654f);
    _635 = ((((exp2(log2(max(0.0f, (_587 + -0.8359375f)) / (18.8515625f - (_587 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _546) * _119) + _546);
    _636 = ((((exp2(log2(max(0.0f, (_601 + -0.8359375f)) / (18.8515625f - (_601 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _547) * _119) + _547);
    _637 = ((((exp2(log2(max(0.0f, (_615 + -0.8359375f)) / (18.8515625f - (_615 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _548) * _119) + _548);
  } else {
    _635 = _467;
    _636 = _468;
    _637 = _469;
  }
  _638 = WaveReadLaneFirst(_materialIndex);
  _646 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_638 < (uint)170000), _638, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeG);
  _647 = WaveReadLaneFirst(_materialIndex);
  _655 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_647 < (uint)170000), _647, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeR);
  _656 = WaveReadLaneFirst(_materialIndex);
  _664 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_656 < (uint)170000), _656, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeB);
  _665 = WaveReadLaneFirst(_materialIndex);
  _673 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_665 < (uint)170000), _665, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeKnowledge);
  _674 = WaveReadLaneFirst(_materialIndex);
  _682 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_674 < (uint)170000), _674, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeInterrupt);
  _687 = saturate((((_655 + _646) + _664) + _673) + _682);
  [branch]
  if (_687 > 0.0f) {
    if (_646 < 0.0010000000474974513f) {
      if (_655 < 0.0010000000474974513f) {
        if (_664 < 0.0010000000474974513f) {
          if (!(_673 < 0.0010000000474974513f)) {
            _699 = 0.6000000238418579f;
            _700 = 0.6000000238418579f;
            _701 = 0.800000011920929f;
            _702 = 0.5f;
            _703 = 0.44999998807907104f;
            _704 = 0.949999988079071f;
          } else {
            _699 = 0.0f;
            _700 = 0.0f;
            _701 = 0.0f;
            _702 = 0.0f;
            _703 = 0.0f;
            _704 = 0.0f;
          }
        } else {
          _699 = 0.6000000238418579f;
          _700 = 0.699999988079071f;
          _701 = 0.699999988079071f;
          _702 = 0.6000000238418579f;
          _703 = 0.699999988079071f;
          _704 = 0.800000011920929f;
        }
      } else {
        _699 = 0.699999988079071f;
        _700 = 0.6000000238418579f;
        _701 = 0.6000000238418579f;
        _702 = 0.800000011920929f;
        _703 = 0.699999988079071f;
        _704 = 0.6000000238418579f;
      }
    } else {
      _699 = 0.6000000238418579f;
      _700 = 0.699999988079071f;
      _701 = 0.6000000238418579f;
      _702 = 0.6000000238418579f;
      _703 = 0.800000011920929f;
      _704 = 0.699999988079071f;
    }
    _705 = (_682 >= 0.0010000000474974513f);
    _709 = select(_705, 0.800000011920929f, _702);
    _710 = select(_705, 0.6000000238418579f, _703);
    _711 = select(_705, 0.20000000298023224f, _704);
    _718 = (1.0f - _709) * 0.3086000084877014f;
    _720 = (1.0f - _710) * 0.6093999743461609f;
    _722 = (1.0f - _711) * 0.0820000022649765f;
    _724 = select(_705, 2.0f, _699) * _635;
    _725 = select(_705, 2.0f, _700) * _636;
    _726 = select(_705, 2.0f, _701) * _637;
    _730 = _718 * _724;
    _735 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    _745 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    _746 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    _754 = (_687 * 0.75f) * saturate(sqrt((_746 * _746) + (_745 * _745)) * 2.0f);
    _761 = ((mad(_726, _722, mad(_725, _720, ((_718 + _709) * _724))) - _635) * _687) + _635;
    _762 = ((mad(_726, _722, mad(_725, (_720 + _710), _730)) - _636) * _687) + _636;
    _763 = ((mad(_726, (_722 + _711), mad(_725, _720, _730)) - _637) * _687) + _637;
    _774 = ((_754 * ((_735 * _709) - _761)) + _761);
    _775 = ((_754 * ((_735 * _710) - _762)) + _762);
    _776 = ((_754 * ((_735 * _711) - _763)) + _763);
  } else {
    _774 = _635;
    _775 = _636;
    _776 = _637;
  }
  if ((((_highLightForVisionRemoteCatch > 0.0f) || (_highLightForVision > 0.0f)) || (_characterHighlight > 0.0f)) | (_followLearning > 0.0010000000474974513f)) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_792.x, _792.y);
    _807 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_792.x)))))) + 0.5f) * _238), int((float((int)(int(float((int)((int)(_792.y)))))) + 0.5f) * _239), 0));
    _809 = _807.x & 255;
    _817 = (float((uint)((uint)((uint)((uint)(_807.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _818 = (float((uint)((uint)(((uint)((uint)(_807.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _820 = 1.0f - abs(_817);
    _821 = abs(_818);
    _822 = _820 - _821;
    if (_822 < 0.0f) {
      _833 = (select((_817 >= 0.0f), 1.0f, -1.0f) * (1.0f - _821));
      _834 = (select((_818 >= 0.0f), 1.0f, -1.0f) * _820);
    } else {
      _833 = _817;
      _834 = _818;
    }
    _836 = rsqrt(dot(float3(_833, _834, _822), float3(_833, _834, _822)));
    _837 = _836 * _833;
    _838 = _836 * _834;
    _839 = _836 * _822;
    _841 = rsqrt(dot(float3(_837, _838, _839), float3(_837, _838, _839)));
    _847 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    _858 = (pow(_847.x, 0.012683313339948654f));
    _859 = (pow(_847.y, 0.012683313339948654f));
    _860 = (pow(_847.z, 0.012683313339948654f));
    _885 = exp2(log2(max(0.0f, (_858 + -0.8359375f)) / (18.8515625f - (_858 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _886 = exp2(log2(max(0.0f, (_859 + -0.8359375f)) / (18.8515625f - (_859 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _887 = exp2(log2(max(0.0f, (_860 + -0.8359375f)) / (18.8515625f - (_860 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    [branch]
    if (_809 == _renderPassTest) {
      _896 = WaveReadLaneFirst(_materialIndex);
      _904 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_896 < (uint)170000), _896, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._testEffectRatio);
      _905 = _904 * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _1106 = (_905 + _774);
      _1107 = _775;
      _1108 = (_905 + _776);
      _1109 = _809;
    } else {
      if ((_809 == _renderPassDetectObjective) || ((!(_809 == _renderPassDetectObjective)) && (_809 == _renderPassKnowledgeNPC))) {
        _931 = ((((float4)(__3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x)), frac((TEXCOORD.y * 0.015625f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y))), 0.0f))).x) * 0.5f) + 0.5f;
        _1106 = ((((_931 * _885) - _774) * _847.w) + _774);
        _1107 = ((((_931 * _886) - _775) * _847.w) + _775);
        _1108 = ((((_931 * _887) - _776) * _847.w) + _776);
        _1109 = _809;
      } else {
        bool __branch_chain_944;
        if (!(_809 == _renderPassDetectRemoteCatch)) {
          __branch_chain_944 = true;
        } else {
          _948 = WaveReadLaneFirst(_materialIndex);
          _956 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_948 < (uint)170000), _948, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
          if (!(_956 > 0.0010000000474974513f)) {
            __branch_chain_944 = true;
          } else {
            if (!((_highLightForVision > 0.0f) || (_highLightForVisionRemoteCatch > 0.0f))) {
              __branch_chain_944 = true;
            } else {
              __branch_chain_944 = false;
            }
          }
        }
        if (__branch_chain_944) {
          _1028 = (_809 == _renderPassSelfPlayer);
          if ((_1028) | ((_809 == _renderPassTest) || (_809 == _renderPassEnemy)) | (_809 == _renderPassDetectPickedRemoteCatch)) {
            if ((_characterHighlight > 0.0010000000474974513f) || (_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _1057 = 1.0f - saturate(dot(float3((_841 * _837), (_841 * _838), (_841 * _839)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
              _1058 = _1057 * _1057;
              _1059 = _1058 * _1058;
              if (!_1028) {
                if (!(_809 == _renderPassTest)) {
                  _1066 = (_809 == _renderPassEnemy);
                  _1071 = select(_1066, 1.0f, 0.20000000298023224f);
                  _1072 = select(_1066, 0.30000001192092896f, 0.4000000059604645f);
                  _1073 = select(_1066, 0.30000001192092896f, 1.0f);
                } else {
                  _1071 = 1.0f;
                  _1072 = 1.0f;
                  _1073 = 1.0f;
                }
              } else {
                _1071 = 1.0f;
                _1072 = 1.0f;
                _1073 = 1.0f;
              }
              _1080 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _1106 = ((((_885 - _774) + ((((_1080 + (_774 * 10.0f)) * _1071) - _885) * _1059)) * _847.w) + _774);
              _1107 = ((((_886 - _775) + ((((_1080 + (_775 * 10.0f)) * _1072) - _886) * _1059)) * _847.w) + _775);
              _1108 = ((((_887 - _776) + ((((_1080 + (_776 * 10.0f)) * _1073) - _887) * _1059)) * _847.w) + _776);
              _1109 = _809;
            } else {
              _1106 = _774;
              _1107 = _775;
              _1108 = _776;
              _1109 = _809;
            }
          } else {
            _1106 = _774;
            _1107 = _775;
            _1108 = _776;
            _1109 = _809;
          }
        } else {
          _966 = WaveReadLaneFirst(_materialIndex);
          _974 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_966 < (uint)170000), _966, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectColorBase);
          _977 = float((uint)((uint)(((uint)(_974) >> 16) & 255)));
          _980 = float((uint)((uint)(((uint)(_974) >> 8) & 255)));
          _982 = float((uint)((uint)(_974 & 255)));
          _1015 = max(0.0010000000474974513f, _exposure0.x);
          _1106 = ((((select(((_977 * 0.003921568859368563f) < 0.040449999272823334f), (_977 * 0.0003035269910469651f), exp2(log2((_977 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _774);
          _1107 = ((((select(((_980 * 0.003921568859368563f) < 0.040449999272823334f), (_980 * 0.0003035269910469651f), exp2(log2((_980 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _775);
          _1108 = ((((select(((_982 * 0.003921568859368563f) < 0.040449999272823334f), (_982 * 0.0003035269910469651f), exp2(log2((_982 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _776);
          _1109 = _809;
        }
      }
    }
  } else {
    _1106 = _774;
    _1107 = _775;
    _1108 = _776;
    _1109 = 0;
  }
  if (!(_wantedRegionRatio < 0.0010000000474974513f)) {
    [branch]
    if (!(_wantedRegionOpacity < 0.0010000000474974513f)) {
      _1118 = WaveReadLaneFirst(_materialIndex);
      _1126 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1118 < (uint)170000), _1118, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._wantedRegionColor);
      _1129 = float((uint)((uint)(((uint)(_1126) >> 16) & 255)));
      _1132 = float((uint)((uint)(((uint)(_1126) >> 8) & 255)));
      _1134 = float((uint)((uint)(_1126 & 255)));
      _1167 = max(0.0010000000474974513f, _exposure0.x);
      _1175 = _wantedRegionRadius * _wantedRegionRatio;
      _1177 = saturate(_1175) * 4.0f;
      _1183 = (_238 * 2.0f) + -1.0f;
      _1185 = 1.0f - (_239 * 2.0f);
      _1186 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239))).x));
      _1214 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1186, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _1185, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _1183))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _1220 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1186, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _1185, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _1183))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1214) - _wantedRegionPosition.x;
      _1221 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1186, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _1185, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _1183))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1214) - _wantedRegionPosition.z;
      _1225 = sqrt((_1220 * _1220) + (_1221 * _1221));
      _1232 = saturate(floor(_1225 / _1175));
      _1234 = (1.0f - _1232) * saturate(((_1177 - _1175) + _1225) / _1177);
      _1241 = (1.0f - saturate((_1225 - _1175) / _1177)) * _1232;
      _1245 = saturate(((_1241 * _1241) * _1241) + ((_1234 * _1234) * _1234));
      _1248 = saturate((_1245 * 5.0f) + -4.0f);
      _1249 = _1248 * _1248;
      _1252 = ((_1249 * _1249) * 9.0f) + 1.0f;
      _1267 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _238)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _239)), 0)))).x) & 127;
      _1275 = (((float((uint)((uint)((uint)(_1126) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1245) * float((bool)((uint)((_1267 != 57) && ((uint)(_1267 + -53) > (uint)14))));
      _1286 = ((_1275 * ((_1252 * (select(((_1129 * 0.003921568859368563f) < 0.040449999272823334f), (_1129 * 0.0003035269910469651f), exp2(log2((_1129 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1106)) + _1106);
      _1287 = ((_1275 * ((_1252 * (select(((_1132 * 0.003921568859368563f) < 0.040449999272823334f), (_1132 * 0.0003035269910469651f), exp2(log2((_1132 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1107)) + _1107);
      _1288 = ((_1275 * ((_1252 * (select(((_1134 * 0.003921568859368563f) < 0.040449999272823334f), (_1134 * 0.0003035269910469651f), exp2(log2((_1134 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1108)) + _1108);
    } else {
      _1286 = _1106;
      _1287 = _1107;
      _1288 = _1108;
    }
  } else {
    _1286 = _1106;
    _1287 = _1107;
    _1288 = _1108;
  }
  if (((_temperatureWarning <= -0.009999999776482582f) || (_temperatureWarning >= 0.009999999776482582f)) || (_electrocutionWarning > 0.0010000000474974513f)) {
    _1300 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    _1311 = (pow(_1300.x, 0.012683313339948654f));
    _1312 = (pow(_1300.y, 0.012683313339948654f));
    _1313 = (pow(_1300.z, 0.012683313339948654f));
    _1338 = exp2(log2(max(0.0f, (_1311 + -0.8359375f)) / (18.8515625f - (_1311 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1339 = exp2(log2(max(0.0f, (_1312 + -0.8359375f)) / (18.8515625f - (_1312 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1340 = exp2(log2(max(0.0f, (_1313 + -0.8359375f)) / (18.8515625f - (_1313 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1342 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      _1345 = saturate(saturate(_1342));
      _1346 = TEXCOORD.x + -0.5f;
      _1347 = TEXCOORD.y + -0.6000000238418579f;
      _1355 = saturate((_1345 + -0.5f) + sqrt((_1347 * _1347) + (_1346 * _1346))) * _1345;
      _1360 = (1.0f - (_1355 * 0.30000001192092896f)) * _1287;
      _1361 = (1.0f - (_1355 * 0.699999988079071f)) * _1288;
      _1387 = ((_1338 - _1286) * _1300.w);
      _1388 = (lerp(_1360, _1339, _1300.w));
      _1389 = (lerp(_1361, _1340, _1300.w));
    } else {
      _1376 = (_1300.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1342) * 2.0f);
      _1387 = (_1376 * (_1338 - (_1286 * 0.30000001192092896f)));
      _1388 = ((_1376 * (_1339 - (_1287 * 0.10000002384185791f))) + _1287);
      _1389 = ((_1376 * _1340) + _1288);
    }
    _1390 = _1286 + _1387;
    if (_electrocutionWarning != 0.0f) {
      _1396 = max(0.0010000000474974513f, _exposure0.x);
      _1400 = TEXCOORD.x + -0.5f;
      _1401 = TEXCOORD.y + -0.6000000238418579f;
      _1409 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1401 * _1401) + (_1400 * _1400)) + -0.30000001192092896f);
      _1416 = (_1409 * ((0.05000000074505806f / _1396) - _1390)) + _1390;
      _1417 = (_1409 * ((0.10000000149011612f / _1396) - _1388)) + _1388;
      _1418 = (_1409 * ((0.5f / _1396) - _1389)) + _1389;
      _1429 = (lerp(_1416, _1338, _1300.w));
      _1430 = (lerp(_1417, _1339, _1300.w));
      _1431 = (lerp(_1418, _1340, _1300.w));
    } else {
      _1429 = _1390;
      _1430 = _1388;
      _1431 = _1389;
    }
  } else {
    _1429 = _1286;
    _1430 = _1287;
    _1431 = _1288;
  }
  [branch]
  if (!(_hpPercentage > 20.0f)) {
    _1437 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if ((_hpPercentage > 0.0f) && (_1437 >= 0.0010000000474974513f)) {
      _1452 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f;
      _1463 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1452 + (TEXCOORD.x * 12.0f)), (_1452 + (TEXCOORD.y * 6.0f)))))).w) * 0.10000000149011612f;
      _1466 = WaveReadLaneFirst(_materialIndex);
      _1474 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1466 < (uint)170000), _1466, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
      _1488 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      _1491 = max((abs(TEXCOORD.x + -0.5f) - _1488), 0.0f);
      _1492 = max((abs(TEXCOORD.y + -0.5f) - _1488), 0.0f);
      _1504 = sin(frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      _1516 = 1.0f - _239;
      _1519 = saturate((_1516 * _1516) * 2.0f);
      _1520 = saturate(_1504);
      _1528 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
      _1530 = (_1520 * 0.0112674031406641f) + 0.022386489436030388f;
      _1539 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      _1541 = select(_1528, 0.006995410192757845f, 0.04317210242152214f) * _1539;
      _1545 = (min(max(_1437, 0.0f), 1.0f) * saturate((saturate(((_1504 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1492 * _1492) + (_1491 * _1491)) * 3.846153974533081f)) * 2.0f) - ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1474 < (uint)65000), _1474, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1463), (_1463 + TEXCOORD.y))))).x) * 1.440000057220459f))) * _1519;
      _1546 = _1519 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      _1553 = (((select(_1528, 0.215860515832901f, 0.04317210242152214f) * _1539) - _1429) * _1546) + _1429;
      _1554 = ((_1541 - _1430) * _1546) + _1430;
      _1555 = ((_1541 - _1431) * _1546) + _1431;
      _1566 = ((((select(_1528, ((_1520 * 0.056337013840675354f) + 0.11193244159221649f), _1530) * _1539) - _1553) * _1545) + _1553);
      _1567 = ((((select(_1528, ((_1520 * 0.0053743417374789715f) + 0.0021246890537440777f), _1530) * _1539) - _1554) * _1545) + _1554);
      _1568 = ((((select(_1528, 0.0021246890537440777f, _1530) * _1539) - _1555) * _1545) + _1555);
    } else {
      _1566 = _1429;
      _1567 = _1430;
      _1568 = _1431;
    }
  } else {
    _1566 = _1429;
    _1567 = _1430;
    _1568 = _1431;
  }
  _1569 = WaveReadLaneFirst(_materialIndex);
  _1579 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.x);
  _1580 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.y);
  _1581 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.z);
  _1582 = WaveReadLaneFirst(_materialIndex);
  _1592 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.x);
  _1593 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.y);
  _1594 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.z);
  _1595 = WaveReadLaneFirst(_materialIndex);
  _1603 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1595 < (uint)170000), _1595, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._contrast);
  _1608 = (_137 > 0.0010000000474974513f);
  if (_1608 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0)) {
    _1615 = (_1579 > (_1580 + 0.05000000074505806f)) && (_1579 > (_1581 + 0.05000000074505806f));
    _1616 = _1579 * 0.4000000059604645f;
    _1624 = (_1592 > (_1593 + 0.05000000074505806f)) && (_1592 > (_1594 + 0.05000000074505806f));
    _1625 = _1592 * 0.4000000059604645f;
    _1630 = select(_1615, _1616, _1579);
    _1631 = select(_1615, _1616, _1580);
    _1632 = select(_1615, _1616, _1581);
    _1633 = select(_1624, _1625, _1592);
    _1634 = select(_1624, _1625, _1593);
    _1635 = select(_1624, _1625, _1594);
  } else {
    _1630 = _1579;
    _1631 = _1580;
    _1632 = _1581;
    _1633 = _1592;
    _1634 = _1593;
    _1635 = _1594;
  }
  _1636 = _1630 * _1566;
  _1637 = _1631 * _1567;
  _1638 = _1632 * _1568;
  _1642 = (1.0f - _1633) * 0.3086000084877014f;
  _1644 = (1.0f - _1634) * 0.6093999743461609f;
  _1646 = (1.0f - _1635) * 0.0820000022649765f;
  _1651 = _1642 * _1636;
  _1668 = max(_1603, 0.0f);
  _1675 = max(0.0f, ((_1668 * (mad(_1638, _1646, mad(_1637, _1644, ((_1642 + _1633) * _1636))) + -0.5f)) + 0.5f));
  _1676 = max(0.0f, ((_1668 * (mad(_1638, _1646, mad(_1637, (_1644 + _1634), _1651)) + -0.5f)) + 0.5f));
  _1677 = max(0.0f, ((_1668 * (mad(_1638, (_1646 + _1635), mad(_1637, _1644, _1651)) + -0.5f)) + 0.5f));
  _1678 = WaveReadLaneFirst(_materialIndex);
  _1686 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1678 < (uint)170000), _1678, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._invertColor);
  _1689 = _exposure2.x * 4.0f;
  _1699 = ((_1689 - (_1675 * 2.0f)) * _1686) + _1675;
  _1700 = ((_1689 - (_1676 * 2.0f)) * _1686) + _1676;
  _1701 = ((_1689 - (_1677 * 2.0f)) * _1686) + _1677;
  _1702 = WaveReadLaneFirst(_materialIndex);
  _1710 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1702 < (uint)170000), _1702, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderRatio);
  [branch]
  if (!(_1710 < 0.0010000000474974513f)) {
    _1713 = WaveReadLaneFirst(_materialIndex);
    _1722 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1713 < (uint)170000), _1713, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.x);
    _1723 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1713 < (uint)170000), _1713, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.y);
    _1726 = WaveReadLaneFirst(_materialIndex);
    _1735 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1726 < (uint)170000), _1726, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.x);
    _1736 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1726 < (uint)170000), _1726, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.y);
    _1739 = WaveReadLaneFirst(_materialIndex);
    _1747 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1739 < (uint)170000), _1739, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
    _1756 = WaveReadLaneFirst(_materialIndex);
    _1764 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1756 < (uint)170000), _1756, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderSmoothness);
    _1765 = WaveReadLaneFirst(_materialIndex);
    _1773 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1765 < (uint)170000), _1765, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderWidth);
    _1779 = (1.0f - _1773) * 0.5f;
    _1782 = max((abs(TEXCOORD.x + -0.5f) - _1779), 0.0f);
    _1783 = max((abs(TEXCOORD.y + -0.5f) - _1779), 0.0f);
    _1792 = 1.0f - ((1.0f - saturate(sqrt((_1783 * _1783) + (_1782 * _1782)) / _1764)) * 2.0f);
    _1793 = WaveReadLaneFirst(_materialIndex);
    _1801 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1793 < (uint)170000), _1793, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerSpeed);
    if (_1801 > 0.0010000000474974513f) {
      _1804 = WaveReadLaneFirst(_materialIndex);
      _1813 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1804 < (uint)170000), _1804, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.x);
      _1814 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1804 < (uint)170000), _1804, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.y);
      _1822 = WaveReadLaneFirst(_materialIndex);
      _1830 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1822 < (uint)170000), _1822, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerIntensity);
      _1834 = ((min(max(sin((_1801 * 3.1415927410125732f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)), _1813), _1814) * _1792) * _1830);
    } else {
      _1834 = _1792;
    }
    _1836 = WaveReadLaneFirst(_materialIndex);
    _1844 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1836 < (uint)170000), _1836, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseRatio);
    _1850 = min(max(_1710, 0.0f), 1.0f) * saturate(saturate(_1834) - (_1844 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1747 < (uint)65000), _1747, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1735 + (_1722 * TEXCOORD.x)), (_1736 + (_1723 * TEXCOORD.y)))))).x)));
    _1851 = WaveReadLaneFirst(_materialIndex);
    _1859 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1851 < (uint)170000), _1851, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderColor);
    _1862 = float((uint)((uint)(((uint)(_1859) >> 16) & 255)));
    _1865 = float((uint)((uint)(((uint)(_1859) >> 8) & 255)));
    _1867 = float((uint)((uint)(_1859 & 255)));
    _1892 = select(((_1862 * 0.003921568859368563f) < 0.040449999272823334f), (_1862 * 0.0003035269910469651f), exp2(log2((_1862 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1899 = _1608 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _1900 = _1892 * 0.4000000059604645f;
    _1907 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1921 = ((((select(_1899, _1900, _1892) * _1907) - _1699) * _1850) + _1699);
    _1922 = ((((select(_1899, _1900, select(((_1865 * 0.003921568859368563f) < 0.040449999272823334f), (_1865 * 0.0003035269910469651f), exp2(log2((_1865 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1907) - _1700) * _1850) + _1700);
    _1923 = ((((select(_1899, _1900, select(((_1867 * 0.003921568859368563f) < 0.040449999272823334f), (_1867 * 0.0003035269910469651f), exp2(log2((_1867 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1907) - _1701) * _1850) + _1701);
  } else {
    _1921 = _1699;
    _1922 = _1700;
    _1923 = _1701;
  }
  [branch]
  if (!(_58 < 0.0010000000474974513f)) {
    _1926 = TEXCOORD.x + -0.5f;
    _1927 = TEXCOORD.y + -0.5f;
    _1932 = WaveReadLaneFirst(_materialIndex);
    _1940 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1932 < (uint)170000), _1932, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius2);
    _1946 = WaveReadLaneFirst(_materialIndex);
    _1954 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1946 < (uint)170000), _1946, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower2);
    _1959 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * _1954) * (sqrt((_1927 * _1927) + (_1926 * _1926)) / max(0.0010000000474974513f, (1.0f - _1940))));
    _1964 = saturate(_58 * 10.0f) * saturate(_1959 * 2.0f);
    _1971 = (_1964 * (_546 - _1921)) + _1921;
    _1972 = (_1964 * (_547 - _1922)) + _1922;
    _1973 = (_1964 * (_548 - _1923)) + _1923;
    _1974 = WaveReadLaneFirst(_materialIndex);
    _1982 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1974 < (uint)170000), _1974, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor2);
    _1985 = float((uint)((uint)(((uint)(_1982) >> 16) & 255)));
    _1988 = float((uint)((uint)(((uint)(_1982) >> 8) & 255)));
    _1990 = float((uint)((uint)(_1982 & 255)));
    _2015 = select(((_1985 * 0.003921568859368563f) < 0.040449999272823334f), (_1985 * 0.0003035269910469651f), exp2(log2((_1985 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2022 = _1608 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _2023 = _2015 * 0.20000000298023224f;
    _2030 = max(0.0010000000474974513f, _exposure0.x);
    _2037 = saturate(_1959) * _58;
    _2045 = ((((select(_2022, _2023, _2015) / _2030) - _1971) * _2037) + _1971);
    _2046 = ((((select(_2022, _2023, select(((_1988 * 0.003921568859368563f) < 0.040449999272823334f), (_1988 * 0.0003035269910469651f), exp2(log2((_1988 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2030) - _1972) * _2037) + _1972);
    _2047 = ((((select(_2022, _2023, select(((_1990 * 0.003921568859368563f) < 0.040449999272823334f), (_1990 * 0.0003035269910469651f), exp2(log2((_1990 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2030) - _1973) * _2037) + _1973);
  } else {
    _2045 = _1921;
    _2046 = _1922;
    _2047 = _1923;
  }
  [branch]
  if (!(_49 < 0.0010000000474974513f)) {
    _2050 = TEXCOORD.x + -0.5f;
    _2051 = TEXCOORD.y + -0.5f;
    _2056 = WaveReadLaneFirst(_materialIndex);
    _2064 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2056 < (uint)170000), _2056, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius1);
    _2069 = WaveReadLaneFirst(_materialIndex);
    _2077 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2069 < (uint)170000), _2069, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower1);
    _2082 = saturate(exp2(log2(1.0f - TEXCOORD.y) * _2077) * (sqrt((_2051 * _2051) + (_2050 * _2050)) / max(0.0010000000474974513f, (1.0f - _2064))));
    _2085 = saturate(_49 * 10.0f) * _2082;
    _2092 = (_2085 * (_546 - _2045)) + _2045;
    _2093 = (_2085 * (_547 - _2046)) + _2046;
    _2094 = (_2085 * (_548 - _2047)) + _2047;
    _2095 = WaveReadLaneFirst(_materialIndex);
    _2103 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2095 < (uint)170000), _2095, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor1);
    _2106 = float((uint)((uint)(((uint)(_2103) >> 16) & 255)));
    _2109 = float((uint)((uint)(((uint)(_2103) >> 8) & 255)));
    _2111 = float((uint)((uint)(_2103 & 255)));
    _2136 = select(((_2106 * 0.003921568859368563f) < 0.040449999272823334f), (_2106 * 0.0003035269910469651f), exp2(log2((_2106 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2143 = _1608 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _2144 = _2136 * 0.20000000298023224f;
    _2151 = max(0.0010000000474974513f, _exposure0.x);
    _2158 = saturate(_2082) * _49;
    _2166 = ((((select(_2143, _2144, _2136) / _2151) - _2092) * _2158) + _2092);
    _2167 = ((((select(_2143, _2144, select(((_2109 * 0.003921568859368563f) < 0.040449999272823334f), (_2109 * 0.0003035269910469651f), exp2(log2((_2109 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2151) - _2093) * _2158) + _2093);
    _2168 = ((((select(_2143, _2144, select(((_2111 * 0.003921568859368563f) < 0.040449999272823334f), (_2111 * 0.0003035269910469651f), exp2(log2((_2111 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2151) - _2094) * _2158) + _2094);
  } else {
    _2166 = _2045;
    _2167 = _2046;
    _2168 = _2047;
  }
  [branch]
  if (!(_67 < 0.0010000000474974513f)) {
    _2171 = TEXCOORD.x + -0.5f;
    _2172 = TEXCOORD.y + -0.5f;
    _2177 = WaveReadLaneFirst(_materialIndex);
    _2185 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2177 < (uint)170000), _2177, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius3);
    _2189 = WaveReadLaneFirst(_materialIndex);
    _2197 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2189 < (uint)170000), _2189, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower3);
    _2202 = saturate((pow(TEXCOORD.y, _2197)) * (sqrt((_2172 * _2172) + (_2171 * _2171)) / max(0.0010000000474974513f, (1.0f - _2185))));
    _2205 = saturate(_67 * 10.0f) * _2202;
    _2212 = (_2205 * (_546 - _2166)) + _2166;
    _2213 = (_2205 * (_547 - _2167)) + _2167;
    _2214 = (_2205 * (_548 - _2168)) + _2168;
    _2215 = WaveReadLaneFirst(_materialIndex);
    _2223 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2215 < (uint)170000), _2215, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor3);
    _2226 = float((uint)((uint)(((uint)(_2223) >> 16) & 255)));
    _2229 = float((uint)((uint)(((uint)(_2223) >> 8) & 255)));
    _2231 = float((uint)((uint)(_2223 & 255)));
    _2256 = select(((_2226 * 0.003921568859368563f) < 0.040449999272823334f), (_2226 * 0.0003035269910469651f), exp2(log2((_2226 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2263 = _1608 && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
    _2264 = _2256 * 0.20000000298023224f;
    _2271 = max(0.0010000000474974513f, _exposure0.x);
    _2278 = saturate(_2202) * _67;
    _2286 = ((((select(_2263, _2264, _2256) / _2271) - _2212) * _2278) + _2212);
    _2287 = ((((select(_2263, _2264, select(((_2229 * 0.003921568859368563f) < 0.040449999272823334f), (_2229 * 0.0003035269910469651f), exp2(log2((_2229 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2271) - _2213) * _2278) + _2213);
    _2288 = ((((select(_2263, _2264, select(((_2231 * 0.003921568859368563f) < 0.040449999272823334f), (_2231 * 0.0003035269910469651f), exp2(log2((_2231 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2271) - _2214) * _2278) + _2214);
  } else {
    _2286 = _2166;
    _2287 = _2167;
    _2288 = _2168;
  }
  [branch]
  if (!(_hideStateRatio < 0.0010000000474974513f)) {
    _2293 = _hideStateRatio * 0.5f;
    _2294 = TEXCOORD.x + -0.5f;
    _2295 = TEXCOORD.y + -0.5f;
    _2303 = saturate(((_2293 + -0.5f) + sqrt((_2295 * _2295) + (_2294 * _2294))) * 2.0f);
    _2311 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2303) * 0.5f) + _2303);
    _2319 = (((_2311 * _2311) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2311 * 2.0f));
    _2322 = dot(float3(_2286, _2287, _2288), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2293);
    _2325 = (pow(_2319, 0.5f));
    _2332 = ((_2322 - _2286) * _2325) + _2286;
    _2333 = ((_2322 - _2287) * _2325) + _2287;
    _2334 = ((_2322 - _2288) * _2325) + _2288;
    _2338 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2349 = (lerp(_2332, _2338, _2319));
    _2350 = (lerp(_2333, _2338, _2319));
    _2351 = (lerp(_2334, _2338, _2319));
  } else {
    _2349 = _2286;
    _2350 = _2287;
    _2351 = _2288;
  }
  if (_followLearning > 0.0010000000474974513f) {
    _2356 = WaveReadLaneFirst(_materialIndex);
    _2364 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2356 < (uint)170000), _2356, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningColor);
    _2367 = float((uint)((uint)(((uint)(_2364) >> 16) & 255)));
    _2370 = float((uint)((uint)(((uint)(_2364) >> 8) & 255)));
    _2372 = float((uint)((uint)(_2364 & 255)));
    _2402 = max(0.0010000000474974513f, _exposure0.x);
    _2403 = select(((_2367 * 0.003921568859368563f) < 0.040449999272823334f), (_2367 * 0.0003035269910469651f), exp2(log2((_2367 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    _2404 = select(((_2370 * 0.003921568859368563f) < 0.040449999272823334f), (_2370 * 0.0003035269910469651f), exp2(log2((_2370 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    _2405 = select(((_2372 * 0.003921568859368563f) < 0.040449999272823334f), (_2372 * 0.0003035269910469651f), exp2(log2((_2372 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    _2406 = WaveReadLaneFirst(_materialIndex);
    _2414 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2406 < (uint)170000), _2406, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningNoiseTex);
    _2425 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _239)));
    _2432 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    _2435 = (_238 * 2.0f) + -1.0f;
    _2437 = 1.0f - (_239 * 2.0f);
    _2438 = max(1.0000000116860974e-07f, _2432.x);
    _2474 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _2438, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _2437, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _2435))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _2483 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _238);
    _2484 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _239);
    _2486 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_2483, _2484, 0));
    _2489 = __3__36__0__0__g_gbufferNormal.Load(int3(_2483, _2484, 0));
    _2507 = (saturate(_2489.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2508 = (saturate(_2489.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2509 = (saturate(_2489.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _2511 = rsqrt(dot(float3(_2507, _2508, _2509), float3(_2507, _2508, _2509)));
    _2512 = _2511 * _2507;
    _2513 = _2511 * _2508;
    _2514 = _2509 * _2511;
    _2517 = (float((uint)((uint)(((uint)((uint)(_2486.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _2518 = (float((uint)((uint)(_2486.w & 255))) * 0.007843137718737125f) + -1.0f;
    _2521 = (_2517 + _2518) * 0.5f;
    _2522 = (_2517 - _2518) * 0.5f;
    _2526 = (1.0f - abs(_2521)) - abs(_2522);
    _2528 = rsqrt(dot(float3(_2521, _2522, _2526), float3(_2521, _2522, _2526)));
    _2529 = _2528 * _2521;
    _2530 = _2528 * _2522;
    _2531 = _2528 * _2526;
    _2533 = select((_2514 >= 0.0f), 1.0f, -1.0f);
    _2536 = -0.0f - (1.0f / (_2533 + _2514));
    _2537 = _2513 * _2536;
    _2538 = _2537 * _2512;
    _2539 = _2533 * _2512;
    _2548 = mad(_2531, _2512, mad(_2530, _2538, ((((_2539 * _2512) * _2536) + 1.0f) * _2529)));
    _2552 = mad(_2531, _2513, mad(_2530, (_2533 + (_2537 * _2513)), ((_2529 * _2533) * _2538)));
    _2556 = mad(_2531, _2514, mad(_2530, (-0.0f - _2513), (-0.0f - (_2539 * _2529))));
    _2558 = rsqrt(dot(float3(_2548, _2552, _2556), float3(_2548, _2552, _2556)));
    _2560 = _2558 * _2552;
    _2561 = _2558 * _2556;
    _2564 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.5f;
    _2567 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _2438, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _2437, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _2435))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _2474) - _2564) * 0.20000000298023224f;
    _2568 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _2438, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _2437, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _2435))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _2474) - _2564) * 0.20000000298023224f;
    _2575 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2567, _2568));
    _2578 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _2438, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _2437, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _2435))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _2474) - _2564) * 0.20000000298023224f;
    _2587 = (abs(_2560) * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2578, _2567)))).w) - _2575.w)) + _2575.w;
    _2590 = (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2578, _2568)))).w) - _2587) * abs(_2561)) + _2587;
    _2591 = _2425.z + -0.5f;
    _2596 = _238 + -0.5f;
    _2598 = _239 + -0.5f;
    _2603 = 0.375f - (_2591 * 0.25f);
    _2606 = max((abs(((_2425.x + -0.5f) * 0.10000000149011612f) + _2596) - _2603), 0.0f);
    _2607 = max((abs(((_2425.y + -0.5f) * 0.10000000149011612f) + _2598) - _2603), 0.0f);
    _2612 = saturate(sqrt((_2607 * _2607) + (_2606 * _2606)));
    _2616 = saturate(_followLearning * 2.0f);
    _2622 = saturate(((((_2432.x * 100.0f) * _2616) - _2590) * 2.0f) + -0.5f);
    _2632 = sqrt((_2598 * _2598) + (_2596 * _2596));
    _2635 = ((saturate((_2616 * 2.0f) + -1.0f) * (1.0f - _2622)) + _2622) * saturate(_2632 + 0.5f);
    _2637 = atan(_2598 / _2596);
    _2640 = (_2596 < 0.0f);
    _2641 = (_2596 == 0.0f);
    _2642 = (_2598 >= 0.0f);
    _2643 = (_2598 < 0.0f);
    _2655 = _2590 * 0.5f;
    _2668 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2591 * -0.5f) - _2655) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f)) + select((_2641 && _2642), 7.5f, select((_2641 && _2643), -7.5f, (select((_2640 && _2643), (_2637 + -3.1415927410125732f), select((_2640 && _2642), (_2637 + 3.1415927410125732f), _2637)) * 4.774648189544678f)))), (((((_2425.w + -0.5f) * -0.5f) - _2655) + (_2632 * 2.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.5f))));
    if (!(_1109 == _renderPassSelfPlayer)) {
      _2703 = (_1109 == _renderPassTest);
    } else {
      _2703 = true;
    }
    _2704 = ((1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239))).x))) + 0.5f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _238), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _239), 0)))).x)))))) != 0.0f);
    _2706 = _2704 || (!_2703);
    if (_1109 == _renderPassTargetFocus) {
      if (_2704) {
        _2720 = (_1109 != _renderPassAimHighlight);
      } else {
        _2720 = false;
      }
    } else {
      if (_2704 || (_1109 != _renderPassLearning)) {
        _2720 = (_1109 != _renderPassAimHighlight);
      } else {
        _2720 = false;
      }
    }
    _2722 = saturate(_followLearning * 4.0f);
    _2729 = (_2722 * (_279 - _2349)) + _2349;
    _2730 = (_2722 * (_280 - _2350)) + _2350;
    _2731 = (_2722 * (_281 - _2351)) + _2351;
    _2732 = _2706 && _2720;
    if (_2732) {
      _2739 = ((_followLearning * 0.25f) * _2668.w) * saturate(_2632 - (_2722 * 0.20000000298023224f));
      _2743 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2739 + _238), (_2739 + _239)));
      _2753 = (pow(_2743.x, 0.012683313339948654f));
      _2754 = (pow(_2743.y, 0.012683313339948654f));
      _2755 = (pow(_2743.z, 0.012683313339948654f));
      _2793 = 1.0f - (_followLearning * 0.75f);
      _2803 = (((((exp2(log2(max(0.0f, (_2753 + -0.8359375f)) / (18.8515625f - (_2753 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2729) * _2722) + _2729) * _2793);
      _2804 = (((((exp2(log2(max(0.0f, (_2754 + -0.8359375f)) / (18.8515625f - (_2754 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2730) * _2722) + _2730) * _2793);
      _2805 = (((((exp2(log2(max(0.0f, (_2755 + -0.8359375f)) / (18.8515625f - (_2755 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2731) * _2722) + _2731) * _2793);
      _2806 = _2635;
    } else {
      if (_2706) {
        _2803 = _2729;
        _2804 = _2730;
        _2805 = _2731;
        _2806 = select(_2720, _2635, 0.0f);
      } else {
        _2803 = _2729;
        _2804 = _2730;
        _2805 = _2731;
        _2806 = (_2635 * 0.4000000059604645f);
      }
    }
    _2807 = dot(float3(_2803, _2804, _2805), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _2814 = ((_2807 - _2803) * _2806) + _2803;
    _2815 = ((_2807 - _2804) * _2806) + _2804;
    _2816 = ((_2807 - _2805) * _2806) + _2805;
    _2818 = _2590 * (_2425.z * 0.30000001192092896f);
    _2824 = saturate(_2806 * 5.0f) * 0.8999999761581421f;
    _2831 = (((_2818 * _2403) - _2814) * _2824) + _2814;
    _2832 = (((_2818 * _2404) - _2815) * _2824) + _2815;
    _2833 = (((_2818 * _2405) - _2816) * _2824) + _2816;
    _2834 = WaveReadLaneFirst(_materialIndex);
    _2842 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2834 < (uint)170000), _2834, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningSaturationTone);
    _2845 = float((uint)((uint)(((uint)(_2842) >> 16) & 255)));
    _2848 = float((uint)((uint)(((uint)(_2842) >> 8) & 255)));
    _2850 = float((uint)((uint)(_2842 & 255)));
    _2875 = select(((_2845 * 0.003921568859368563f) < 0.040449999272823334f), (_2845 * 0.0003035269910469651f), exp2(log2((_2845 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2876 = select(((_2848 * 0.003921568859368563f) < 0.040449999272823334f), (_2848 * 0.0003035269910469651f), exp2(log2((_2848 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2877 = select(((_2850 * 0.003921568859368563f) < 0.040449999272823334f), (_2850 * 0.0003035269910469651f), exp2(log2((_2850 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2881 = (1.0f - _2875) * 0.3086000084877014f;
    _2883 = (1.0f - _2876) * 0.6093999743461609f;
    _2885 = (1.0f - _2877) * 0.0820000022649765f;
    _2890 = _2881 * _2831;
    _2903 = (_followLearning * (mad(_2833, _2885, mad(_2832, _2883, ((_2881 + _2875) * _2831))) - _2831)) + _2831;
    _2904 = (_followLearning * (mad(_2833, _2885, mad(_2832, (_2883 + _2876), _2890)) - _2832)) + _2832;
    _2905 = (_followLearning * (mad(_2833, (_2885 + _2877), mad(_2832, _2883, _2890)) - _2833)) + _2833;
    if (!_2732) {
      _2919 = saturate(1.0f - dot(float3((_2655 + (_2558 * _2548)), (_2655 + _2560), (_2655 + _2561)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _2924 = select(_2706, ((_2919 * _2919) * 6.0f), (_2919 * 0.25f)) * _2919;
      _2928 = (_followLearning * _followLearning) * saturate(_2590 * 10.0f);
      _2939 = (((_2928 * _2403) * _2924) + _2903);
      _2940 = (((_2928 * _2404) * _2924) + _2904);
      _2941 = (((_2928 * _2405) * _2924) + _2905);
    } else {
      _2939 = _2903;
      _2940 = _2904;
      _2941 = _2905;
    }
    _2942 = _followLearning * _2612;
    _2946 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2953 = ((_2946 - _2939) * _2942) + _2939;
    _2954 = ((_2946 - _2940) * _2942) + _2940;
    _2955 = ((_2946 - _2941) * _2942) + _2941;
    _2960 = saturate(((_2668.w * _2668.w) * 20.0f) * _followLearning) * _2612;
    _2971 = (lerp(_2953, _2403, _2960));
    _2972 = (lerp(_2954, _2404, _2960));
    _2973 = (lerp(_2955, _2405, _2960));
  } else {
    _2971 = _2349;
    _2972 = _2350;
    _2973 = _2351;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    _2993 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
    _2999 = max(0.0010000000474974513f, _exposure0.x);
    _3016 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    _3019 = _3016.x + -0.5f;
    _3020 = _3016.y + -0.5f;
    _3030 = 0.44999998807907104f - (_3019 * 0.004999999888241291f);
    _3033 = max((abs((TEXCOORD.x + -0.5f) + (_3019 * 0.019999999552965164f)) - _3030), 0.0f);
    _3034 = max((abs((TEXCOORD.y + -0.5f) + (_3020 * 0.019999999552965164f)) - _3030), 0.0f);
    _3045 = WaveReadLaneFirst(_materialIndex);
    _3053 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_3045 < (uint)170000), _3045, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._enemyAlertTex);
    _3060 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_3053 < (uint)65000), _3053, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_3020 * 0.029999999329447746f)), (TEXCOORD.y - (_3019 * 0.029999999329447746f))));
    _3065 = (TEXCOORD.y > 0.5f);
    _3067 = (TEXCOORD.x < 0.5f);
    _3071 = (TEXCOORD.y < 0.5f);
    _3079 = (TEXCOORD.x > 0.5f);
    _3103 = saturate(dot(float4((_3060.x * float((bool)_3071)), (_3060.y * float((bool)((uint)(_3079 && _3071)))), (_3060.z * float((bool)_3079)), (_3060.w * float((bool)((uint)(_3079 && _3065))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_3060.x * float((bool)_3065)), (_3060.y * float((bool)((uint)(_3067 && _3065)))), (_3060.z * float((bool)_3067)), (_3060.w * float((bool)((uint)(_3067 && _3071))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_3034 * _3034) + (_3033 * _3033)) * 20.0f);
    _3105 = (_3103 * _3103) * _3103;
    _3116 = ((_3105 * ((select(_2993, 0.09989875555038452f, 0.08437622338533401f) / _2999) - _2971)) + _2971);
    _3117 = ((_3105 * ((select(_2993, 0.027320895344018936f, 0.030713455751538277f) / _2999) - _2972)) + _2972);
    _3118 = ((_3105 * ((select(_2993, 0.04817182570695877f, 0.07036010921001434f) / _2999) - _2973)) + _2973);
  } else {
    _3116 = _2971;
    _3117 = _2972;
    _3118 = _2973;
  }
  _3119 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _3132 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _3119, 0)))).x) & 127))) + 0.5f);
  } else {
    _3132 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_3116, _3117, _3118));
    _3554 = output_color.x;
    _3555 = output_color.y;
    _3556 = output_color.z;
  } else {
    _3554 = _3116;
    _3555 = _3117;
    _3556 = _3118;
  }
  if (_etcParams.y > 1.0f) {
    _3567 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _3568 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _3572 = saturate(1.0f - (dot(float2(_3567, _3568), float2(_3567, _3568)) * saturate(_etcParams.y + -1.0f)));
    _3577 = (_3572 * _3554);
    _3578 = (_3572 * _3555);
    _3579 = (_3572 * _3556);
  } else {
    _3577 = _3554;
    _3578 = _3555;
    _3579 = _3556;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _3612 = select((_3577 <= 0.0031308000907301903f), (_3577 * 12.920000076293945f), (((pow(_3577, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3613 = select((_3578 <= 0.0031308000907301903f), (_3578 * 12.920000076293945f), (((pow(_3578, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3614 = select((_3579 <= 0.0031308000907301903f), (_3579 * 12.920000076293945f), (((pow(_3579, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3612 = _3577;
    _3613 = _3578;
    _3614 = _3579;
  }
  if (!(_etcParams.y < 1.0f)) {
    _3619 = float((uint)_3119);
    if (!(_3619 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_3619 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _3628 = _3612;
        _3629 = _3613;
        _3630 = _3614;
      } else {
        _3628 = 0.0f;
        _3629 = 0.0f;
        _3630 = 0.0f;
      }
    } else {
      _3628 = 0.0f;
      _3629 = 0.0f;
      _3630 = 0.0f;
    }
  } else {
    _3628 = _3612;
    _3629 = _3613;
    _3630 = _3614;
  }
  _3640 = exp2(log2(_3628 * 9.999999747378752e-05f) * 0.1593017578125f);
  _3641 = exp2(log2(_3629 * 9.999999747378752e-05f) * 0.1593017578125f);
  _3642 = exp2(log2(_3630 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_3640 * 18.6875f) + 1.0f)) * ((_3640 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_3641 * 18.6875f) + 1.0f)) * ((_3641 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_3642 * 18.6875f) + 1.0f)) * ((_3642 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _3132;
  return SV_Target;
}