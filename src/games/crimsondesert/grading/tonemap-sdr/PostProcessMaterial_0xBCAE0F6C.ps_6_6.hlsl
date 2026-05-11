#include "../tonemap.hlsli"

struct PostProcessMemoryRead_CDStruct {
  float _memoryReadProgress;
  float _memoryReadBackgroundOpacity;
  float _memoryOpacity;
  float _enemyBossOpacity;
  uint _noiseTex;
  uint _auraTex;
  uint _glitchTex;
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float3 _cubeSpaceSkyColor;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _cubeSpaceSpeedRatio;
  float _tempCubeSpaceRatio;
  float _fishEyeMaxPower;
  float _vignetteIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t67, space36);

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

struct BindlessParameters_PostProcessMemoryRead_CD {
  PostProcessMemoryRead_CDStruct BindlessParameters_PostProcessMemoryRead_CD;
};

typedef BindlessParameters_PostProcessMemoryRead_CD BindlessParameters_PostProcessMemoryRead_CD_t;
ConstantBuffer<BindlessParameters_PostProcessMemoryRead_CD_t> BindlessParameters_PostProcessMemoryRead_CD[] : register(b0, space100);

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
  float _34;
  int _40;
  float _48;
  float _139;
  float _140;
  float _143;
  float _144;
  float _380;
  int _381;
  float _441;
  float _616;
  float _617;
  float _618;
  bool _650;
  float _651;
  float _652;
  float _653;
  float _819;
  float _820;
  float _821;
  float _822;
  int _823;
  float _828;
  float _829;
  float _830;
  float _831;
  int _832;
  float _837;
  float _838;
  float _839;
  float _840;
  int _841;
  float _1343;
  float _1344;
  float _1345;
  float _1346;
  float _1410;
  float _1411;
  float _1412;
  float _1473;
  float _1536;
  float _1537;
  float _1538;
  float _1539;
  float _1540;
  float _1541;
  float _1542;
  bool _1603;
  float _1620;
  float _1621;
  float _1622;
  float _1632;
  float _1828;
  float _1829;
  float _1830;
  float _1962;
  float _1963;
  float _1964;
  float _1965;
  float _1966;
  float _2101;
  float _2352;
  float _2353;
  float _2354;
  float _2402;
  float _2403;
  float _2404;
  float _2461;
  float _2666;
  float _2667;
  float _2668;
  float _2761;
  float _2762;
  float _2763;
  float _2883;
  float _2884;
  float _2885;
  float _2906;
  float _2907;
  float _2908;
  float _2941;
  float _2942;
  float _2943;
  float _2957;
  float _2958;
  float _2959;
  int _51;
  float _59;
  int _62;
  float _70;
  float _73;
  float _78;
  float _79;
  float _80;
  float _81;
  int _82;
  float _90;
  int _91;
  float _99;
  float _100;
  float _104;
  float _109;
  float _113;
  float _122;
  float _128;
  float _133;
  float _158;
  float4 _168;
  float _181;
  float _182;
  float _183;
  float _185;
  float _186;
  float _187;
  float _188;
  float _190;
  float _192;
  float _193;
  float _229;
  float _230;
  float _231;
  float _232;
  float _268;
  float _269;
  float _270;
  float _271;
  float _273;
  float _274;
  float _275;
  float _276;
  float4 _279;
  float _289;
  float _290;
  float _291;
  float _316;
  float _317;
  float _318;
  int _320;
  float _328;
  int _354;
  float _362;
  float _372;
  float _376;
  float _377;
  float _378;
  float _388;
  float _392;
  float _397;
  float _401;
  float _406;
  float _410;
  float _418;
  float _419;
  float _420;
  float _421;
  float _422;
  float _423;
  float _433;
  float _437;
  int _438;
  float _445;
  float _446;
  float _447;
  float _448;
  float _452;
  float _457;
  float _461;
  float _466;
  float _470;
  float _478;
  float _479;
  float _480;
  float _481;
  float _482;
  float _483;
  float _484;
  float _485;
  float _486;
  float _487;
  float _490;
  float _493;
  float _495;
  float _499;
  float _505;
  float _506;
  float _514;
  float _518;
  float _524;
  float _525;
  float _534;
  float _538;
  float _544;
  float _545;
  float _553;
  float _555;
  float _557;
  float _559;
  float _567;
  float _568;
  float _569;
  float _571;
  float _575;
  float _578;
  float _582;
  float _585;
  float _586;
  float _589;
  float _590;
  float _591;
  float _592;
  float _593;
  int _600;
  float _608;
  float _626;
  int _627;
  float _637;
  float _638;
  float _639;
  float _656;
  float _657;
  float _658;
  float _659;
  float _660;
  float _661;
  float _662;
  int _667;
  int _675;
  float4 _682;
  int _688;
  float _696;
  float _697;
  uint2 _703;
  int _720;
  int _721;
  float _729;
  int _730;
  float _738;
  float _741;
  float _744;
  float _745;
  float _746;
  float _747;
  float _748;
  float _749;
  float _750;
  float _751;
  float _752;
  float _753;
  float _756;
  float _759;
  float _762;
  float _765;
  float _768;
  float _771;
  float _778;
  float _779;
  float _780;
  float _787;
  float _788;
  float _789;
  float _792;
  float _795;
  float _798;
  int _803;
  float _811;
  float _812;
  float _813;
  float _814;
  float _815;
  float _816;
  float _817;
  int _825;
  int _834;
  float _842;
  float _843;
  float _844;
  float _848;
  float _849;
  float _850;
  float _865;
  float _872;
  float _873;
  float _874;
  float _885;
  bool _886;
  float _887;
  float _888;
  float _889;
  float _890;
  int _891;
  float _901;
  float _902;
  float _903;
  float _931;
  float _936;
  float _937;
  float _942;
  float _943;
  float _944;
  float _953;
  float _955;
  float _956;
  float _958;
  float _960;
  float _961;
  float _962;
  float _968;
  float _969;
  float _981;
  float _982;
  float _983;
  float _984;
  float _985;
  float4 _990;
  float4 _994;
  float _1004;
  float _1005;
  float _1006;
  int _1034;
  float _1042;
  float _1044;
  float _1051;
  float _1052;
  float _1053;
  float _1056;
  float _1057;
  float4 _1062;
  float4 _1066;
  float _1076;
  float _1077;
  float _1078;
  int _1106;
  float _1114;
  float _1116;
  float _1123;
  float _1124;
  float _1125;
  float _1128;
  float _1129;
  float4 _1134;
  float4 _1138;
  float _1148;
  float _1149;
  float _1150;
  int _1178;
  float _1186;
  float _1188;
  float _1195;
  float _1196;
  float _1197;
  float _1200;
  float _1201;
  float4 _1206;
  float4 _1210;
  float _1220;
  float _1221;
  float _1222;
  int _1250;
  float _1258;
  float _1260;
  float _1267;
  float _1268;
  float _1269;
  float _1272;
  float _1273;
  float4 _1278;
  float4 _1282;
  float _1292;
  float _1293;
  float _1294;
  int _1322;
  float _1330;
  float _1332;
  float4 _1349;
  float _1359;
  float _1360;
  float _1361;
  int _1389;
  float _1397;
  float _1399;
  int _1413;
  float _1421;
  int _1422;
  float _1430;
  int _1450;
  float _1458;
  int _1463;
  float _1471;
  int _1474;
  float _1482;
  float _1486;
  int _1511;
  int _1519;
  float4 _1526;
  float _1529;
  float _1531;
  float _1534;
  float _1547;
  float _1548;
  float _1549;
  float _1550;
  float _1559;
  float _1560;
  float _1562;
  float4 _1570;
  float _1579;
  float _1580;
  float _1581;
  float _1582;
  float _1589;
  float _1609;
  float _1612;
  float _1636;
  float _1637;
  float _1638;
  float _1653;
  float _1689;
  float _1690;
  float _1692;
  int _1701;
  int _1709;
  float4 _1716;
  float _1719;
  float _1720;
  float _1735;
  int _1738;
  int _1746;
  float4 _1753;
  float _1764;
  float _1768;
  float _1771;
  float _1774;
  float _1783;
  float _1792;
  float _1794;
  float _1796;
  float _1814;
  int _1831;
  float _1839;
  float _1846;
  float _1847;
  float _1848;
  float _1856;
  float _1857;
  int _1868;
  int _1890;
  int _1898;
  float4 _1905;
  float _1910;
  float _1911;
  float _1926;
  float _1927;
  float _1928;
  float _1934;
  float _1937;
  float _1943;
  float _1958;
  uint _1985;
  uint _1986;
  uint4 _1988;
  float4 _1991;
  float _2009;
  float _2010;
  float _2011;
  float _2013;
  float _2014;
  float _2015;
  float _2016;
  float _2019;
  float _2020;
  float _2023;
  float _2024;
  float _2028;
  float _2030;
  float _2031;
  float _2032;
  float _2033;
  float _2035;
  float _2038;
  float _2039;
  float _2040;
  float _2041;
  float _2050;
  float _2054;
  float _2058;
  float _2060;
  float _2072;
  float _2073;
  float _2076;
  float _2081;
  float _2115;
  float _2127;
  float _2128;
  float _2129;
  float _2143;
  float _2144;
  float _2145;
  float _2156;
  float4 _2163;
  float _2168;
  float _2169;
  float _2171;
  float _2176;
  float _2180;
  float _2181;
  float _2182;
  float _2190;
  float _2199;
  float _2208;
  float _2211;
  float _2218;
  float _2225;
  float _2229;
  float _2233;
  bool _2239;
  int _2243;
  float _2257;
  float _2258;
  float _2259;
  float _2287;
  float _2288;
  float _2292;
  float _2302;
  float _2303;
  float _2304;
  float _2316;
  float _2322;
  float _2324;
  float _2331;
  float _2332;
  float _2340;
  float _2345;
  float4 _2361;
  float _2366;
  float _2377;
  float _2378;
  float _2379;
  int _2389;
  float _2397;
  float _2405;
  float _2406;
  float _2413;
  int _2418;
  float _2426;
  int _2428;
  float _2436;
  float _2438;
  float _2445;
  float _2446;
  float _2447;
  uint _2448;
  float _2470;
  float _2519;
  float _2520;
  float _2521;
  float _2523;
  float _2530;
  float _2531;
  float _2532;
  float _2551;
  float _2552;
  float _2553;
  float _2554;
  float _2555;
  float _2556;
  float _2557;
  float _2558;
  float _2559;
  float _2605;
  float _2606;
  float _2607;
  float _2608;
  float _2609;
  float _2610;
  float _2611;
  float _2628;
  float _2629;
  float _2630;
  float _2631;
  float _2637;
  float _2640;
  float _2647;
  float _2648;
  float _2649;
  float _2678;
  float _2703;
  float _2704;
  float _2705;
  float _2724;
  float _2725;
  float _2726;
  float _2732;
  float _2736;
  float _2737;
  float _2738;
  float _2739;
  float _2744;
  float _2769;
  float _2773;
  float _2774;
  float _2775;
  float _2776;
  int _2817;
  float _2872;
  float _2896;
  float _2897;
  float _2901;
  float _2948;
  float _2969;
  float _2970;
  float _2971;
  int __loop_jump_target = -1;
  float _28[36];
  _34 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _40 = WaveReadLaneFirst(_materialIndex);
  _48 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._fishEyeMaxPower);
  bool __branch_chain_0;
  if (_48 > 0.0010000000474974513f) {
    __branch_chain_0 = true;
  } else {
    _51 = WaveReadLaneFirst(_materialIndex);
    _59 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_51 < (uint)170000), _51, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._fishEyeMaxPower);
    if (_59 < -0.0010000000474974513f) {
      __branch_chain_0 = true;
    } else {
      _143 = TEXCOORD.x;
      _144 = TEXCOORD.y;
      __branch_chain_0 = false;
    }
  }
  if (__branch_chain_0) {
    _62 = WaveReadLaneFirst(_materialIndex);
    _70 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
    [branch]
    if (!(_70 < 0.0010000000474974513f)) {
      _73 = 0.5f / _34;
      _78 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
      _79 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _73;
      _80 = dot(float2(_78, _79), float2(_78, _79));
      _81 = sqrt(_80);
      _82 = WaveReadLaneFirst(_materialIndex);
      _90 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._fishEyeMaxPower);
      _91 = WaveReadLaneFirst(_materialIndex);
      _99 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
      _100 = _99 * _90;
      if (_100 > 0.0f) {
        _104 = sqrt(dot(float2(0.5f, _73), float2(0.5f, _73)));
        _109 = tan(_100 * _81) * (rsqrt(_80) * _104);
        _113 = tan(_104 * _100);
        _139 = (((_109 * _78) / _113) + 0.5f);
        _140 = (((_109 * _79) / _113) + _73);
      } else {
        if (_100 < 0.0f) {
          _122 = select((_34 < 1.0f), 0.5f, _73);
          _128 = atan((_100 * _81) * -10.0f) * (rsqrt(_80) * _122);
          _133 = atan((_100 * -10.0f) * _122);
          _139 = (((_128 * _78) / _133) + 0.5f);
          _140 = (((_128 * _79) / _133) + _73);
        } else {
          _139 = 0.0f;
          _140 = 0.0f;
        }
      }
      _143 = _139;
      _144 = (_140 * _34);
    } else {
      _143 = TEXCOORD.x;
      _144 = TEXCOORD.y;
    }
  }
  _158 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_143, _144));
  _168 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0));
  _181 = (saturate(_168.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _182 = (saturate(_168.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _183 = (saturate(_168.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _185 = rsqrt(dot(float3(_181, _182, _183), float3(_181, _182, _183)));
  _186 = _185 * _181;
  _187 = _185 * _182;
  _188 = _183 * _185;
  _190 = (_143 * 2.0f) + -1.0f;
  _192 = 1.0f - (_144 * 2.0f);
  _193 = max(1.0000000116860974e-07f, _158.x);
  _229 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _230 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _229;
  _231 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _229;
  _232 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _229;
  _268 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _269 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _268;
  _270 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _268;
  _271 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _193, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _268;
  _273 = rsqrt(dot(float3(_269, _270, _271), float3(_269, _270, _271)));
  _274 = _273 * _269;
  _275 = _273 * _270;
  _276 = _273 * _271;
  _279 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_143, _144));
  _289 = (pow(_279.x, 0.012683313339948654f));
  _290 = (pow(_279.y, 0.012683313339948654f));
  _291 = (pow(_279.z, 0.012683313339948654f));
  _316 = exp2(log2(max(0.0f, (_289 + -0.8359375f)) / (18.8515625f - (_289 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _317 = exp2(log2(max(0.0f, (_290 + -0.8359375f)) / (18.8515625f - (_290 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _318 = exp2(log2(max(0.0f, (_291 + -0.8359375f)) / (18.8515625f - (_291 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _320 = WaveReadLaneFirst(_materialIndex);
  _328 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_320 < (uint)170000), _320, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceEffectRatio);
  if (!(_328 < 0.0010000000474974513f)) {
    _354 = WaveReadLaneFirst(_materialIndex);
    _362 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_354 < (uint)170000), _354, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSpeedRatio);
    _372 = rsqrt(dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))) * frac((_362 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + -0.004999999888241291f);
    _376 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].x) * 0.009999999776482582f) + 2000.0f) + (_372 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x));
    _377 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].y) * 0.009999999776482582f) + 2000.0f) + (_372 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y));
    _378 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].z) * 0.009999999776482582f) + 2000.0f) + (_372 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z));
    _380 = 1.0f;
    _381 = 0;
    while(true) {
      _388 = ((_380 * _274) + _376) * 4.0f;
      _392 = frac(abs(_388));
      _397 = ((_380 * _275) + _377) * 4.0f;
      _401 = frac(abs(_397));
      _406 = ((_380 * _276) + _378) * 4.0f;
      _410 = frac(abs(_406));
      _418 = abs((select((_388 >= (-0.0f - _388)), _392, (-0.0f - _392)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _419 = abs((select((_397 >= (-0.0f - _397)), _401, (-0.0f - _401)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _420 = abs((select((_406 >= (-0.0f - _406)), _410, (-0.0f - _410)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _421 = max(_418, 0.0f);
      _422 = max(_419, 0.0f);
      _423 = max(_420, 0.0f);
      _433 = min(max(_418, max(_419, _420)), 0.0f) + sqrt(((_422 * _422) + (_421 * _421)) + (_423 * _423));
      if (!(_433 < (_380 * 0.0010000000474974513f))) {
        _437 = _433 + _380;
        _438 = _381 + 1;
        if ((int)_438 < (int)50) {
          _380 = _437;
          _381 = _438;
          continue;
        } else {
          _441 = _437;
        }
      } else {
        _441 = _380;
      }
      _445 = (_441 * _274) + _376;
      _446 = (_441 * _275) + _377;
      _447 = (_441 * _276) + _378;
      _448 = _445 * 4.0f;
      _452 = frac(abs(_448));
      _457 = _446 * 4.0f;
      _461 = frac(abs(_457));
      _466 = _447 * 4.0f;
      _470 = frac(abs(_466));
      _478 = abs((select((_448 >= (-0.0f - _448)), _452, (-0.0f - _452)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _479 = abs((select((_457 >= (-0.0f - _457)), _461, (-0.0f - _461)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _480 = abs((select((_466 >= (-0.0f - _466)), _470, (-0.0f - _470)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _481 = max(_478, 0.0f);
      _482 = max(_479, 0.0f);
      _483 = max(_480, 0.0f);
      _484 = _481 * _481;
      _485 = _482 * _482;
      _486 = _485 + _484;
      _487 = _483 * _483;
      _490 = max(_479, _480);
      _493 = min(max(_478, _490), 0.0f) + sqrt(_486 + _487);
      _495 = (_445 + 0.0010000000474974513f) * 4.0f;
      _499 = frac(abs(_495));
      _505 = abs((select((_495 >= (-0.0f - _495)), _499, (-0.0f - _499)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _506 = max(_505, 0.0f);
      _514 = (_446 + 0.0010000000474974513f) * 4.0f;
      _518 = frac(abs(_514));
      _524 = abs((select((_514 >= (-0.0f - _514)), _518, (-0.0f - _518)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _525 = max(_524, 0.0f);
      _534 = (_447 + 0.0010000000474974513f) * 4.0f;
      _538 = frac(abs(_534));
      _544 = abs((select((_534 >= (-0.0f - _534)), _538, (-0.0f - _538)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _545 = max(_544, 0.0f);
      _553 = min(max(_505, _490), 0.0f) + (sqrt((_487 + _485) + (_506 * _506)) - _493);
      _555 = min(max(_478, max(_524, _480)), 0.0f) + (sqrt((_487 + _484) + (_525 * _525)) - _493);
      _557 = min(max(_478, max(_479, _544)), 0.0f) + (sqrt((_545 * _545) + _486) - _493);
      _559 = rsqrt(dot(float3(_553, _555, _557), float3(_553, _555, _557)));
      _567 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x);
      _568 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y);
      _569 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z);
      _571 = rsqrt(dot(float3(_567, _568, _569), float3(_567, _568, _569)));
      _575 = dot(float3((_559 * _553), (_559 * _555), (_559 * _557)), float3((_571 * _567), (_571 * _568), (_571 * _569)));
      _578 = saturate((_441 * 0.222222238779068f) + -0.111111119389534f);
      _582 = (_578 * _578) * (3.0f - (_578 * 2.0f));
      _585 = 1.0f - (_575 - (_582 * _575));
      _586 = _585 * _585;
      _589 = ((_586 * _586) * 0.20000000298023224f) + 0.10000000149011612f;
      _590 = _589 * _589;
      _591 = _590 * 0.699999988079071f;
      _592 = _590 * 0.4000000059604645f;
      _593 = _590 * 0.10000000149011612f;
      _600 = WaveReadLaneFirst(_materialIndex);
      _608 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_600 < (uint)170000), _600, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceEffectRatio);
      _616 = saturate((_591 - (_591 * _582)) * _608);
      _617 = saturate((_592 - (_592 * _582)) * _608);
      _618 = saturate((_593 - (_593 * _582)) * _608);
      break;
    }
  } else {
    _616 = 0.0f;
    _617 = 0.0f;
    _618 = 0.0f;
  }
  if ((_158.x < 1.0000000116860974e-07f) || (_158.x == 1.0f)) {
    _626 = exp2(log2(abs(_275)) * 0.5f);
    _627 = WaveReadLaneFirst(_materialIndex);
    _637 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.x);
    _638 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.y);
    _639 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.z);
    _650 = false;
    _651 = (lerp(_616, _637, _626));
    _652 = (lerp(_617, _638, _626));
    _653 = (lerp(_618, _639, _626));
  } else {
    _650 = true;
    _651 = _616;
    _652 = _617;
    _653 = _618;
  }
  _656 = max(0.0010000000474974513f, _exposure0.x);
  _657 = _651 / _656;
  _658 = _652 / _656;
  _659 = _653 / _656;
  _660 = 4.0f / _34;
  _661 = _660 * _143;
  _662 = _660 * _144;
  _667 = WaveReadLaneFirst(_materialIndex);
  _675 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_667 < (uint)170000), _667, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
  _682 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_675 < (uint)65000), _675, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_661, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _662)));
  _688 = WaveReadLaneFirst(_materialIndex);
  _696 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_688 < (uint)170000), _688, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _697 = _696 * (_682.y + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_703.x, _703.y);
  _720 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_703.x)))))) + 0.5f) * ((_697 * 0.0010000000474974513f) + _143)), int((float((int)(int(float((int)((int)(_703.y)))))) + 0.5f) * ((_697 * 0.019999999552965164f) + _144)), 0)))).x) & 255;
  _721 = WaveReadLaneFirst(_materialIndex);
  _729 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_721 < (uint)170000), _721, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._radius);
  _730 = WaveReadLaneFirst(_materialIndex);
  _738 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_730 < (uint)170000), _730, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _741 = saturate(1.0f - _738) * _729;
  [branch]
  if (!(_741 < 0.0010000000474974513f)) {
    _744 = ddx_coarse(_274);
    _745 = ddx_coarse(_275);
    _746 = ddx_coarse(_276);
    _747 = ddy_coarse(_274);
    _748 = ddy_coarse(_275);
    _749 = ddy_coarse(_276);
    _750 = ddx_coarse(_143);
    _751 = ddx_coarse(_144);
    _752 = ddy_coarse(_143);
    _753 = ddy_coarse(_144);
    _756 = (_748 * _188) - (_749 * _187);
    _759 = (_749 * _186) - (_747 * _188);
    _762 = (_747 * _187) - (_748 * _186);
    _765 = (_746 * _187) - (_745 * _188);
    _768 = (_744 * _188) - (_746 * _186);
    _771 = (_745 * _186) - (_744 * _187);
    _778 = (_752 * _765) + (_756 * _750);
    _779 = (_752 * _768) + (_759 * _750);
    _780 = (_752 * _771) + (_762 * _750);
    _787 = (_753 * _765) + (_756 * _751);
    _788 = (_753 * _768) + (_759 * _751);
    _789 = (_753 * _771) + (_751 * _762);
    _792 = max(dot(float3(_778, _779, _780), float3(_778, _779, _780)), dot(float3(_787, _788, _789), float3(_787, _788, _789)));
    _795 = rsqrt(select((_792 != 0.0f), _792, 0.10000000149011612f));
    _798 = _795 * _274;
    _803 = WaveReadLaneFirst(_materialIndex);
    _811 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_803 < (uint)170000), _803, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._squareSize);
    _812 = _811 * _230;
    _813 = _811 * _231;
    _814 = _811 * _232;
    _815 = floor(_812);
    _816 = floor(_813);
    _817 = floor(_814);
    _819 = 10.0f;
    _820 = 0.0f;
    _821 = 0.0f;
    _822 = 0.0f;
    _823 = -1;
    while(true) {
      _828 = _819;
      _829 = _820;
      _830 = _821;
      _831 = _822;
      _832 = -1;
      while(true) {
        _837 = _828;
        _838 = _829;
        _839 = _830;
        _840 = _831;
        _841 = -1;
        while(true) {
          _842 = float((int)(_841));
          _843 = float((int)(_832));
          _844 = float((int)(_823));
          _848 = sin(_842 + _815);
          _849 = sin(_843 + _816);
          _850 = sin(_844 + _817);
          _865 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _872 = sin(_865 * frac(sin(dot(float3(_848, _849, _850), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _842;
          _873 = sin(_865 * frac(sin(dot(float3(_848, _849, _850), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _843;
          _874 = sin(_865 * frac(sin(dot(float3(_848, _849, _850), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _844;
          _885 = max(abs((_815 - _812) + _872), max(abs((_816 - _813) + _873), abs((_817 - _814) + _874)));
          _886 = (_885 < _837);
          _887 = select(_886, _885, _837);
          _888 = select(_886, _872, _838);
          _889 = select(_886, _873, _839);
          _890 = select(_886, _874, _840);
          _891 = _841 + 1;
          if (!(_891 == 2)) {
            _837 = _887;
            _838 = _888;
            _839 = _889;
            _840 = _890;
            _841 = _891;
            continue;
          }
          while(true) {
            _834 = _832 + 1;
            if (!(_834 == 2)) {
              _828 = _887;
              _829 = _888;
              _830 = _889;
              _831 = _890;
              _832 = _834;
              __loop_jump_target = 827;
              break;
            }
            while(true) {
              _825 = _823 + 1;
              if (!(_825 == 2)) {
                _819 = _887;
                _820 = _888;
                _821 = _889;
                _822 = _890;
                _823 = _825;
                __loop_jump_target = 818;
                break;
              }
              _901 = (_888 + _815) / _811;
              _902 = (_889 + _816) / _811;
              _903 = (_890 + _817) / _811;
              _931 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _903, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _902, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _901))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
              _936 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _903, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _902, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _901))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _931) * 0.5f) + 0.5f;
              _937 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _903, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _902, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _901))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _931) * 0.5f);
              _942 = _901 - _mainPosition.x;
              _943 = _902 - _mainPosition.y;
              _944 = _903 - _mainPosition.z;
              _953 = saturate(1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _741)) * sqrt(dot(float3(_942, _943, _944), float3(_942, _943, _944))))) * 1.0152283906936646f));
              _955 = 1.0f - saturate(_953);
              _956 = _953 * 0.5f;
              _958 = (_143 - _936) / _955;
              _960 = (_144 - _937) / _955;
              _961 = sin(_956);
              _962 = cos(_956);
              _968 = mad((-0.0f - _961), _960, (_962 * _958)) + _936;
              _969 = mad(_962, _960, (_961 * _958)) + _937;
              _981 = (saturate(_158.x * 1.5f) * 0.5f) * saturate(frac(sin(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_143)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_144))))), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + 0.5f);
              _982 = _981 * mad((_795 * _780), _276, mad((_795 * _779), _275, (_798 * _778)));
              _983 = _982 * 0.8333333730697632f;
              _984 = _981 * mad((_795 * _789), _276, mad((_795 * _788), _275, (_798 * _787)));
              _985 = _984 * 0.8333333730697632f;
              _990 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_983 + _143), (_985 + _144)));
              _994 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_968 + _983), (_969 + _985)));
              _1004 = (pow(_994.x, 0.012683313339948654f));
              _1005 = (pow(_994.y, 0.012683313339948654f));
              _1006 = (pow(_994.z, 0.012683313339948654f));
              _1034 = WaveReadLaneFirst(_materialIndex);
              _1042 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1034 < (uint)170000), _1034, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
              _1044 = float((bool)(uint)(_990.w < _1042));
              _1051 = (_1044 * ((exp2(log2(max(0.0f, (_1004 + -0.8359375f)) / (18.8515625f - (_1004 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _657)) + _657;
              _1052 = (_1044 * ((exp2(log2(max(0.0f, (_1005 + -0.8359375f)) / (18.8515625f - (_1005 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _658)) + _658;
              _1053 = (_1044 * ((exp2(log2(max(0.0f, (_1006 + -0.8359375f)) / (18.8515625f - (_1006 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _659)) + _659;
              if (!(_990.w > 0.8999999761581421f)) {
                _1056 = _982 * 0.6666666865348816f;
                _1057 = _984 * 0.6666666865348816f;
                _1062 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1056 + _143), (_1057 + _144)));
                _1066 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_968 + _1056), (_969 + _1057)));
                _1076 = (pow(_1066.x, 0.012683313339948654f));
                _1077 = (pow(_1066.y, 0.012683313339948654f));
                _1078 = (pow(_1066.z, 0.012683313339948654f));
                _1106 = WaveReadLaneFirst(_materialIndex);
                _1114 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1106 < (uint)170000), _1106, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                _1116 = float((bool)(uint)(_1062.w < _1114));
                _1123 = (_1116 * ((exp2(log2(max(0.0f, (_1076 + -0.8359375f)) / (18.8515625f - (_1076 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1051)) + _1051;
                _1124 = (_1116 * ((exp2(log2(max(0.0f, (_1077 + -0.8359375f)) / (18.8515625f - (_1077 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1052)) + _1052;
                _1125 = (_1116 * ((exp2(log2(max(0.0f, (_1078 + -0.8359375f)) / (18.8515625f - (_1078 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1053)) + _1053;
                if (!(_1062.w > 0.8999999761581421f)) {
                  _1128 = _982 * 0.5f;
                  _1129 = _984 * 0.5f;
                  _1134 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1128 + _143), (_1129 + _144)));
                  _1138 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_968 + _1128), (_969 + _1129)));
                  _1148 = (pow(_1138.x, 0.012683313339948654f));
                  _1149 = (pow(_1138.y, 0.012683313339948654f));
                  _1150 = (pow(_1138.z, 0.012683313339948654f));
                  _1178 = WaveReadLaneFirst(_materialIndex);
                  _1186 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1178 < (uint)170000), _1178, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                  _1188 = float((bool)(uint)(_1134.w < _1186));
                  _1195 = (_1188 * ((exp2(log2(max(0.0f, (_1148 + -0.8359375f)) / (18.8515625f - (_1148 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1123)) + _1123;
                  _1196 = (_1188 * ((exp2(log2(max(0.0f, (_1149 + -0.8359375f)) / (18.8515625f - (_1149 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1124)) + _1124;
                  _1197 = (_1188 * ((exp2(log2(max(0.0f, (_1150 + -0.8359375f)) / (18.8515625f - (_1150 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1125)) + _1125;
                  if (!(_1134.w > 0.8999999761581421f)) {
                    _1200 = _982 * 0.3333333432674408f;
                    _1201 = _984 * 0.3333333432674408f;
                    _1206 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1200 + _143), (_1201 + _144)));
                    _1210 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_968 + _1200), (_969 + _1201)));
                    _1220 = (pow(_1210.x, 0.012683313339948654f));
                    _1221 = (pow(_1210.y, 0.012683313339948654f));
                    _1222 = (pow(_1210.z, 0.012683313339948654f));
                    _1250 = WaveReadLaneFirst(_materialIndex);
                    _1258 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1250 < (uint)170000), _1250, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                    _1260 = float((bool)(uint)(_1206.w < _1258));
                    _1267 = (_1260 * ((exp2(log2(max(0.0f, (_1220 + -0.8359375f)) / (18.8515625f - (_1220 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1195)) + _1195;
                    _1268 = (_1260 * ((exp2(log2(max(0.0f, (_1221 + -0.8359375f)) / (18.8515625f - (_1221 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1196)) + _1196;
                    _1269 = (_1260 * ((exp2(log2(max(0.0f, (_1222 + -0.8359375f)) / (18.8515625f - (_1222 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1197)) + _1197;
                    if (!(_1206.w > 0.8999999761581421f)) {
                      _1272 = _982 * 0.1666666716337204f;
                      _1273 = _984 * 0.1666666716337204f;
                      _1278 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1272 + _143), (_1273 + _144)));
                      _1282 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_968 + _1272), (_969 + _1273)));
                      _1292 = (pow(_1282.x, 0.012683313339948654f));
                      _1293 = (pow(_1282.y, 0.012683313339948654f));
                      _1294 = (pow(_1282.z, 0.012683313339948654f));
                      _1322 = WaveReadLaneFirst(_materialIndex);
                      _1330 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1322 < (uint)170000), _1322, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                      _1332 = float((bool)(uint)(_1278.w < _1330));
                      _1343 = ((_1332 * ((exp2(log2(max(0.0f, (_1294 + -0.8359375f)) / (18.8515625f - (_1294 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1269)) + _1269);
                      _1344 = ((_1332 * ((exp2(log2(max(0.0f, (_1293 + -0.8359375f)) / (18.8515625f - (_1293 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1268)) + _1268);
                      _1345 = ((_1332 * ((exp2(log2(max(0.0f, (_1292 + -0.8359375f)) / (18.8515625f - (_1292 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _1267)) + _1267);
                      _1346 = _1278.w;
                    } else {
                      _1343 = _1269;
                      _1344 = _1268;
                      _1345 = _1267;
                      _1346 = _1206.w;
                    }
                  } else {
                    _1343 = _1197;
                    _1344 = _1196;
                    _1345 = _1195;
                    _1346 = _1134.w;
                  }
                } else {
                  _1343 = _1125;
                  _1344 = _1124;
                  _1345 = _1123;
                  _1346 = _1062.w;
                }
              } else {
                _1343 = _1053;
                _1344 = _1052;
                _1345 = _1051;
                _1346 = _990.w;
              }
              _1349 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_968, _969));
              _1359 = (pow(_1349.x, 0.012683313339948654f));
              _1360 = (pow(_1349.y, 0.012683313339948654f));
              _1361 = (pow(_1349.z, 0.012683313339948654f));
              _1389 = WaveReadLaneFirst(_materialIndex);
              _1397 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
              _1399 = float((bool)(uint)(_1346 < _1397));
              _1410 = ((_1399 * ((exp2(log2(max(0.0f, (_1359 + -0.8359375f)) / (18.8515625f - (_1359 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1345)) + _1345);
              _1411 = ((_1399 * ((exp2(log2(max(0.0f, (_1360 + -0.8359375f)) / (18.8515625f - (_1360 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1344)) + _1344);
              _1412 = ((_1399 * ((exp2(log2(max(0.0f, (_1361 + -0.8359375f)) / (18.8515625f - (_1361 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1343)) + _1343);
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
        if (__loop_jump_target == 827) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 818) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _1410 = _657;
    _1411 = _658;
    _1412 = _659;
  }
  _1413 = WaveReadLaneFirst(_materialIndex);
  _1421 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1413 < (uint)170000), _1413, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _1422 = WaveReadLaneFirst(_materialIndex);
  _1430 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1422 < (uint)170000), _1422, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._tempCubeSpaceRatio);
  [branch]
  if ((_720 == _renderPassMemoryBackground) || ((!(_720 == _renderPassMemoryBackground)) && (_720 == _renderPassDetectRemoteCatch)) || (((!(_720 == _renderPassMemoryBackground)) && (!(_720 == _renderPassDetectRemoteCatch))) && (_720 == _renderPassDetectPickedRemoteCatch))) {
    _1450 = WaveReadLaneFirst(_materialIndex);
    _1458 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1450 < (uint)170000), _1450, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryOpacity);
    _1473 = _1458;
  } else {
    if (_720 == _renderPassEnemyBoss) {
      _1463 = WaveReadLaneFirst(_materialIndex);
      _1471 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1463 < (uint)170000), _1463, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
      _1473 = _1471;
    } else {
      _1473 = 1.0f;
    }
  }
  _1474 = WaveReadLaneFirst(_materialIndex);
  _1482 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1474 < (uint)170000), _1474, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _1486 = saturate((_1482 * 100.0f) + -99.0f) * _1473;
  if (!(_1486 < 0.0010000000474974513f)) {
    [branch]
    if ((_720 == _renderPassSelfPlayer) | (_720 == _renderPassTest) | (_720 == _renderPassDetectRemoteCatch) | (_720 == _renderPassDetectPickedRemoteCatch)) {
      _1511 = WaveReadLaneFirst(_materialIndex);
      _1519 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1511 < (uint)170000), _1511, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
      _1526 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1519 < (uint)65000), _1519, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_661 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.2199999988079071f)), (_662 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.18000000715255737f))));
      _1529 = _1526.x + -0.30000001192092896f;
      _1531 = ((_1526.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
      _1534 = _1529 * 0.006000000052154064f;
      _1536 = _1534;
      _1537 = _1534;
      _1538 = 0.0f;
      _1539 = 0.0f;
      _1540 = 0.0f;
      _1541 = 0.0f;
      _1542 = -1.0f;
      while(true) {
        _1547 = _143 - ((_1536 * sin(_1531)) * _1542);
        _1548 = _144 - ((_1537 * cos(_1531)) * _1542);
        _1549 = _1547 + -0.5f;
        _1550 = _1548 + -0.5f;
        _1559 = rsqrt(dot(float2(_1549, _1550), float2(_1549, _1550))) * ((_1529 * 0.05999999865889549f) * sqrt((_1549 * _1549) + (_1550 * _1550)));
        _1560 = _1559 * _1549;
        _1562 = _1559 * _1550;
        _1570 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1547, _1548));
        _1579 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1547 - _1560), (_1548 - _1562))))).x) * 0.20000000298023224f) + _1538;
        _1580 = (_1570.y * 0.20000000298023224f) + _1539;
        _1581 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1560 + _1547), (_1562 + _1548))))).z) * 0.20000000298023224f) + _1540;
        _1582 = (_1570.w * 0.20000000298023224f) + _1541;
        _1589 = _1542 + 0.20000000298023224f;
        if (!(_1589 > 1.0f)) {
          _1536 = (_1536 * 1.0099999904632568f);
          _1537 = (_1537 * 1.0099999904632568f);
          _1538 = (_1579 * 0.8999999761581421f);
          _1539 = (_1580 * 0.8999999761581421f);
          _1540 = (_1581 * 0.8999999761581421f);
          _1541 = (_1582 * 0.8999999761581421f);
          _1542 = _1589;
          continue;
        }
        if (!(_720 == _renderPassSelfPlayer)) {
          _1603 = (_720 == _renderPassTest);
        } else {
          _1603 = true;
        }
        _1609 = saturate(_1582 * 1.0800000429153442f);
        _1612 = max(0.0010000000474974513f, _exposure0.x);
        _1620 = ((((_1579 * 0.5400000214576721f) * select(_1603, 0.550000011920929f, 0.5f)) / _1612) * _1609);
        _1621 = ((((_1580 * 0.5400000214576721f) * select(_1603, 0.699999988079071f, 0.800000011920929f)) / _1612) * _1609);
        _1622 = (((_1581 * 0.5400000214576721f) / _1612) * _1609);
        break;
      }
    } else {
      _1620 = 0.0f;
      _1621 = 0.0f;
      _1622 = 0.0f;
    }
  } else {
    _1620 = 0.0f;
    _1621 = 0.0f;
    _1622 = 0.0f;
  }
  if ((_720 == _renderPassSelfPlayer) | (_720 == _renderPassTest)) {
    _1632 = _1486;
  } else {
    _1632 = saturate(saturate(_1430 * 2.0f) * _1421);
  }
  _1636 = _318 + (_1632 * (_1412 - _318));
  _1637 = _317 + (_1632 * (_1411 - _317));
  _1638 = _316 + (_1632 * (_1410 - _316));
  if (_720 == _renderPassMemoryBackground) {
    _1653 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x));
    _1689 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1653, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _1690 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1653, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1689;
    _1692 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1653, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1689;
    _1701 = WaveReadLaneFirst(_materialIndex);
    _1709 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1701 < (uint)170000), _1701, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
    _1716 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1709 < (uint)65000), _1709, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f) + (_1690 * 0.699999988079071f)), ((_1692 * 0.699999988079071f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.03999999910593033f))));
    _1719 = _1716.w + -0.5f;
    _1720 = _1716.z + -0.5f;
    _1735 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f;
    _1738 = WaveReadLaneFirst(_materialIndex);
    _1746 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1738 < (uint)170000), _1738, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._auraTex);
    _1753 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1746 < (uint)65000), _1746, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_1690 * 1.100000023841858f) - ((_682.y + -0.5f) * 0.10000000149011612f)) + (_1719 * 0.30000001192092896f)) - _1735), ((((_1692 * 1.100000023841858f) - ((_682.w + -0.5f) * 0.10000000149011612f)) + (_1720 * 0.30000001192092896f)) - _1735)));
    _1764 = _1719 * 2.0f;
    _1768 = (((0.5f - _682.w) + _1690) + _1764) - _mainPosition.x;
    _1771 = (((0.5f - _682.x) + ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _1653, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _1689)) + (_1720 * 2.0f)) - _mainPosition.y;
    _1774 = (((0.5f - _682.z) + _1692) + _1764) - _mainPosition.z;
    _1783 = 1.0f - saturate(sqrt(((_1768 * _1768) + (_1771 * _1771)) + (_1774 * _1774)) * 0.125f);
    _1792 = ((sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 5.0f) + (_1783 * 60.0f)) + 1.0f) * 0.25f) + 0.5f;
    _1794 = _1783 * (_1792 * _1792);
    _1796 = (_1794 * _1794) * _682.x;
    _1814 = max(0.0010000000474974513f, _exposure0.x);
    _1828 = (((((((_1783 * 0.010000000707805157f) + ((_1753.x * _1753.x) * _1796)) * _1753.x) / _1814) - _1638) * _1486) + _1638);
    _1829 = (((((((_1783 * 0.03500000014901161f) + ((_1753.y * _1753.y) * _1796)) * _1753.y) / _1814) - _1637) * _1486) + _1637);
    _1830 = (((((((_1783 * 0.05000000074505806f) + ((_1753.z * _1753.z) * _1796)) * _1753.z) / _1814) - _1636) * _1486) + _1636);
  } else {
    _1828 = _1638;
    _1829 = _1637;
    _1830 = _1636;
  }
  _1831 = WaveReadLaneFirst(_materialIndex);
  _1839 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1831 < (uint)170000), _1831, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadBackgroundOpacity);
  if (!(_1839 < 0.0010000000474974513f)) {
    _1846 = _230 - _mainPosition.x;
    _1847 = _231 - _mainPosition.y;
    _1848 = _232 - _mainPosition.z;
    _1856 = saturate(sqrt(((_1846 * _1846) + (_1847 * _1847)) + (_1848 * _1848)) * 0.03333333507180214f);
    _1857 = 1.0f - _1856;
    _1868 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 127;
    if (_650 && (_1857 > 0.0f)) {
      _1890 = WaveReadLaneFirst(_materialIndex);
      _1898 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1890 < (uint)170000), _1890, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._glitchTex);
      _1905 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1898 < (uint)65000), _1898, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_230 * 0.10000000149011612f), (_232 * 0.10000000149011612f)));
      _1910 = (_1905.x * 2.0f) + -0.9960784316062927f;
      _1911 = (_1905.y * 2.0f) + -0.9960784316062927f;
      _1926 = ((_1910 + _230) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x)) * 0.05999999865889549f;
      _1927 = ((_1911 + _231) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y)) * 0.05999999865889549f;
      _1928 = ((sqrt(saturate(1.0f - dot(float2(_1910, _1911), float2(_1910, _1911)))) + _232) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z)) * 0.05999999865889549f;
      _1934 = sqrt(((_1926 * _1926) + (_1927 * _1927)) + (_1928 * _1928));
      _1937 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f;
      _1943 = exp2(log2(frac(_1934 - _1937)) * 15.0f) * _1857;
      _1958 = exp2(log2(saturate(1.0f - abs((frac((_1934 + 0.5f) - _1937) * 2.0f) + -1.0f))) * 30.0f) * (_1857 * 0.014999999664723873f);
      _1962 = (_1958 * _1910);
      _1963 = (_1958 * _1911);
      _1964 = (_1943 * 0.20000000298023224f);
      _1965 = (_1943 * 0.5f);
      _1966 = _1943;
    } else {
      _1962 = 0.0f;
      _1963 = 0.0f;
      _1964 = 0.0f;
      _1965 = 0.0f;
      _1966 = 0.0f;
    }
    if (((uint)(_1868 + -53) < (uint)15) || ((!((uint)(_1868 + -53) < (uint)15)) && ((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _193) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x)))) > 0.20000000298023224f) && (_720 == _renderPassMemory)))) {
      _1985 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_697 * 0.0005000000237487257f) + _143));
      _1986 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_697 * 0.009999999776482582f) + _144));
      _1988 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_1985, _1986, 0));
      _1991 = __3__36__0__0__g_gbufferNormal.Load(int3(_1985, _1986, 0));
      _2009 = (saturate(_1991.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _2010 = (saturate(_1991.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _2011 = (saturate(_1991.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _2013 = rsqrt(dot(float3(_2009, _2010, _2011), float3(_2009, _2010, _2011)));
      _2014 = _2013 * _2009;
      _2015 = _2013 * _2010;
      _2016 = _2011 * _2013;
      _2019 = (float((uint)((uint)(((uint)((uint)(_1988.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _2020 = (float((uint)((uint)(_1988.w & 255))) * 0.007843137718737125f) + -1.0f;
      _2023 = (_2019 + _2020) * 0.5f;
      _2024 = (_2019 - _2020) * 0.5f;
      _2028 = (1.0f - abs(_2023)) - abs(_2024);
      _2030 = rsqrt(dot(float3(_2023, _2024, _2028), float3(_2023, _2024, _2028)));
      _2031 = _2030 * _2023;
      _2032 = _2030 * _2024;
      _2033 = _2030 * _2028;
      _2035 = select((_2016 >= 0.0f), 1.0f, -1.0f);
      _2038 = -0.0f - (1.0f / (_2035 + _2016));
      _2039 = _2015 * _2038;
      _2040 = _2039 * _2014;
      _2041 = _2035 * _2014;
      _2050 = mad(_2033, _2014, mad(_2032, _2040, ((((_2041 * _2014) * _2038) + 1.0f) * _2031)));
      _2054 = mad(_2033, _2015, mad(_2032, (_2035 + (_2039 * _2015)), ((_2031 * _2035) * _2040)));
      _2058 = mad(_2033, _2016, mad(_2032, (-0.0f - _2015), (-0.0f - (_2041 * _2031))));
      _2060 = rsqrt(dot(float3(_2050, _2054, _2058), float3(_2050, _2054, _2058)));
      _2072 = saturate(dot(float3((_2060 * _2050), (_2060 * _2054), (_2060 * _2058)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _2073 = 1.0f - _2072;
      _2076 = max(0.0010000000474974513f, _exposure0.x);
      _2081 = (_2073 * _2073) * _1857;
      if ((_720 == _renderPassSelfPlayer) || ((!(_720 == _renderPassSelfPlayer)) && (_720 == _renderPassTest))) {
        _2101 = ((_2073 * 0.05000000074505806f) + 0.10000000149011612f);
      } else {
        _2101 = select((_720 == _renderPassMemory), 1.100000023841858f, 0.10000000149011612f);
      }
      _2115 = (pow(_1856, 1.5f)) * ((pow(_2072, 5.0f)) * 0.800000011920929f);
      _2352 = ((((_2081 * (0.4000000059604645f / _2076)) * _2101) + _1828) + (_2115 * _1964));
      _2353 = ((((_2081 * (0.699999988079071f / _2076)) * _2101) + _1829) + (_2115 * _1965));
      _2354 = ((((_2081 * (1.0f / _2076)) * _2101) + _1830) + (_2115 * _1966));
    } else {
      _2127 = _230 - _mainPosition.x;
      _2128 = _231 - _mainPosition.y;
      _2129 = _232 - _mainPosition.z;
      _2143 = _230 - _aimHighlightPosition.x;
      _2144 = _231 - _aimHighlightPosition.y;
      _2145 = _232 - _aimHighlightPosition.z;
      _2156 = 1.0f - saturate(sqrt(((_2143 * _2143) + (_2144 * _2144)) + (_2145 * _2145)) / (_aimHighlightPosition.w * 5.0f));
      _2163 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_1962 + _143), (_1963 + _144)), 0.0f);
      _2168 = _2163.w * saturate(((_2156 * _2156) * _2156) + ((1.0f - saturate(sqrt(((_2127 * _2127) + (_2128 * _2128)) + (_2129 * _2129)) * 0.5f)) * 0.10000000149011612f));
      _2169 = _2168 * 5.0f;
      _2171 = (_2163.w * _2163.w) * _1857;
      _2176 = ((_2171 * _2171) * 49.959999084472656f) + 0.03999999910593033f;
      _2180 = _2168 * 1.75f;
      _2181 = _2168 * 3.25f;
      _2182 = _2168 * 120.0f;
      _2190 = ((1.0f - saturate(_2182 + -3.0f)) * saturate(_2182 + -2.0f)) * (0.3499999940395355f - _2180);
      _2199 = ((0.6499999761581421f - _2181) * saturate(_2182 + -2.5f)) * (1.0f - saturate(_2182 + -4.0f));
      _2208 = (saturate(_2182 + -3.5f) * (1.0f - _2169)) * (1.0f - saturate(_2182 + -5.0f));
      _2211 = saturate(_2182 + -8.0f);
      _2218 = 1.0f - _2171;
      _2225 = ((_2176 * _1964) + _1828) + (((((_2190 + _2180) - (_2190 * _2211)) * _2218) + (_2171 * 0.3499999940395355f)) * _1839);
      _2229 = ((_2176 * _1965) + _1829) + (((((_2199 + _2181) - (_2199 * _2211)) * _2218) + (_2171 * 0.6499999761581421f)) * _1839);
      _2233 = ((_2176 * _1966) + _1830) + (((((_2208 + _2169) - (_2208 * _2211)) * _2218) + _2171) * _1839);
      if (_1868 == 7) {
        _2239 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
        _2352 = select(_2239, 0.014999999664723873f, 0.007000000216066837f);
        _2353 = 0.0f;
        _2354 = select(_2239, 0.0f, 0.014999999664723873f);
      } else {
        _2243 = _1868 + -105;
        if ((_1868 == 107) || ((_1868 == 26) || (((uint)(_1868 + -27) < (uint)2) || ((uint)_2243 < (uint)2)))) {
          _2257 = _mainPosition.x - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
          _2258 = _mainPosition.y - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
          _2259 = _mainPosition.z - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
          _2287 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _2259, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _2258, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _2257))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
          _2288 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _2259, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _2258, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _2257))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _2287;
          _2292 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _2259, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _2258, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _2257))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _2287) * 0.5f);
          _2302 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * 5.0f) + _2257;
          _2303 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * 5.0f) + _2258;
          _2304 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * 5.0f) + _2259;
          _2316 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _2304, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _2303, (_2302 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
          _2322 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _2304, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _2303, (_2302 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _2316) * 0.5f)) - _2292;
          _2324 = (_34 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _2304, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _2303, (_2302 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _2316) - _2288);
          _2331 = _144 - _2292;
          _2332 = ((_143 + -0.5f) - (_2288 * 0.5f)) * _34;
          _2340 = 1.0f - saturate(sqrt((_2331 * _2331) + (_2332 * _2332)) / max(0.0010000000474974513f, sqrt((_2322 * _2322) + (_2324 * _2324))));
          _2345 = (_2340 * _2340) * (select(((uint)_2243 < (uint)3), 0.10000000149011612f, 0.014999999664723873f) * _1839);
          _2352 = ((_2345 * 0.3499999940395355f) + _2225);
          _2353 = ((_2345 * 0.6499999761581421f) + _2229);
          _2354 = (_2345 + _2233);
        } else {
          _2352 = _2225;
          _2353 = _2229;
          _2354 = _2233;
        }
      }
    }
  } else {
    _2352 = _1828;
    _2353 = _1829;
    _2354 = _1830;
  }
  if (_720 == _renderPassEnemyBoss) {
    _2361 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_143, _144));
    _2366 = saturate(_2361.z * 2.0f);
    _2377 = saturate((_2361.x * 3.0f) * ((1.0f / max(0.0010000000474974513f, _exposure0.x)) - _2361.z));
    _2378 = _2377 * 0.6000000238418579f;
    _2379 = _2377 * 0.6499999761581421f;
    _2389 = WaveReadLaneFirst(_materialIndex);
    _2397 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2389 < (uint)170000), _2389, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
    _2402 = (_2397 * ((((_2361.y * 0.22499999403953552f) - _2378) * _2366) + _2378));
    _2403 = (_2397 * ((((_2361.y * 0.32499998807907104f) - _2379) * _2366) + _2379));
    _2404 = (_2397 * ((((_2361.y * 0.5f) - _2377) * _2366) + _2377));
  } else {
    _2402 = _2352;
    _2403 = _2353;
    _2404 = _2354;
  }
  _2405 = _143 + -0.5f;
  _2406 = _144 + -0.5f;
  _2413 = saturate((sqrt((_2406 * _2406) + (_2405 * _2405)) + -0.009999999776482582f) * 1.0101009607315063f);
  _2418 = WaveReadLaneFirst(_materialIndex);
  _2426 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2418 < (uint)170000), _2418, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._vignetteIntensity);
  _2428 = WaveReadLaneFirst(_materialIndex);
  _2436 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2428 < (uint)170000), _2428, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _2438 = 1.0f - ((((_2413 * _2413) * (3.0f - (_2413 * 2.0f))) * _2426) * _2436);
  _2445 = max(0.0f, (_2438 * (_2402 + _1620)));
  _2446 = max(0.0f, (_2438 * (_2403 + _1621)));
  _2447 = max(0.0f, (_2438 * (_2404 + _1622)));
  _2448 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _2461 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _2448, 0)))).x) & 127))) + 0.5f);
  } else {
    _2461 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_2445, _2446, _2447));
    _2883 = output_color.x;
    _2884 = output_color.y;
    _2885 = output_color.z;
  } else {
    _2883 = _2445;
    _2884 = _2446;
    _2885 = _2447;
  }
  if (_etcParams.y > 1.0f) {
    _2896 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _2897 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _2901 = saturate(1.0f - (dot(float2(_2896, _2897), float2(_2896, _2897)) * saturate(_etcParams.y + -1.0f)));
    _2906 = (_2901 * _2883);
    _2907 = (_2901 * _2884);
    _2908 = (_2901 * _2885);
  } else {
    _2906 = _2883;
    _2907 = _2884;
    _2908 = _2885;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2941 = select((_2906 <= 0.0031308000907301903f), (_2906 * 12.920000076293945f), (((pow(_2906, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2942 = select((_2907 <= 0.0031308000907301903f), (_2907 * 12.920000076293945f), (((pow(_2907, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2943 = select((_2908 <= 0.0031308000907301903f), (_2908 * 12.920000076293945f), (((pow(_2908, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2941 = _2906;
    _2942 = _2907;
    _2943 = _2908;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2948 = float((uint)_2448);
    if (!(_2948 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2948 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2957 = _2941;
        _2958 = _2942;
        _2959 = _2943;
      } else {
        _2957 = 0.0f;
        _2958 = 0.0f;
        _2959 = 0.0f;
      }
    } else {
      _2957 = 0.0f;
      _2958 = 0.0f;
      _2959 = 0.0f;
    }
  } else {
    _2957 = _2941;
    _2958 = _2942;
    _2959 = _2943;
  }
  _2969 = exp2(log2(_2957 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2970 = exp2(log2(_2958 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2971 = exp2(log2(_2959 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_2969 * 18.6875f) + 1.0f)) * ((_2969 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_2970 * 18.6875f) + 1.0f)) * ((_2970 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_2971 * 18.6875f) + 1.0f)) * ((_2971 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _2461;
  return SV_Target;
}