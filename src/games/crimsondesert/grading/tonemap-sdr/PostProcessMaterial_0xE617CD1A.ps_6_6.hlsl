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
  float _344;
  int _345;
  float _405;
  float _580;
  float _581;
  float _582;
  bool _614;
  float _615;
  float _616;
  float _617;
  float _783;
  float _784;
  float _785;
  float _786;
  int _787;
  float _792;
  float _793;
  float _794;
  float _795;
  int _796;
  float _801;
  float _802;
  float _803;
  float _804;
  int _805;
  float _1142;
  float _1143;
  float _1144;
  float _1145;
  float _1173;
  float _1174;
  float _1175;
  float _1236;
  float _1299;
  float _1300;
  float _1301;
  float _1302;
  float _1303;
  float _1304;
  float _1305;
  bool _1366;
  float _1383;
  float _1384;
  float _1385;
  float _1395;
  float _1591;
  float _1592;
  float _1593;
  float _1725;
  float _1726;
  float _1727;
  float _1728;
  float _1729;
  float _1864;
  float _2115;
  float _2116;
  float _2117;
  float _2165;
  float _2166;
  float _2167;
  float _2224;
  float _2429;
  float _2430;
  float _2431;
  float _2524;
  float _2525;
  float _2526;
  float _2646;
  float _2647;
  float _2648;
  float _2669;
  float _2670;
  float _2671;
  float _2704;
  float _2705;
  float _2706;
  float _2720;
  float _2721;
  float _2722;
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
  int _284;
  float _292;
  int _318;
  float _326;
  float _336;
  float _340;
  float _341;
  float _342;
  float _352;
  float _356;
  float _361;
  float _365;
  float _370;
  float _374;
  float _382;
  float _383;
  float _384;
  float _385;
  float _386;
  float _387;
  float _397;
  float _401;
  int _402;
  float _409;
  float _410;
  float _411;
  float _412;
  float _416;
  float _421;
  float _425;
  float _430;
  float _434;
  float _442;
  float _443;
  float _444;
  float _445;
  float _446;
  float _447;
  float _448;
  float _449;
  float _450;
  float _451;
  float _454;
  float _457;
  float _459;
  float _463;
  float _469;
  float _470;
  float _478;
  float _482;
  float _488;
  float _489;
  float _498;
  float _502;
  float _508;
  float _509;
  float _517;
  float _519;
  float _521;
  float _523;
  float _531;
  float _532;
  float _533;
  float _535;
  float _539;
  float _542;
  float _546;
  float _549;
  float _550;
  float _553;
  float _554;
  float _555;
  float _556;
  float _557;
  int _564;
  float _572;
  float _590;
  int _591;
  float _601;
  float _602;
  float _603;
  float _620;
  float _621;
  float _622;
  float _623;
  float _624;
  float _625;
  float _626;
  int _631;
  int _639;
  float4 _646;
  int _652;
  float _660;
  float _661;
  uint2 _667;
  int _684;
  int _685;
  float _693;
  int _694;
  float _702;
  float _705;
  float _708;
  float _709;
  float _710;
  float _711;
  float _712;
  float _713;
  float _714;
  float _715;
  float _716;
  float _717;
  float _720;
  float _723;
  float _726;
  float _729;
  float _732;
  float _735;
  float _742;
  float _743;
  float _744;
  float _751;
  float _752;
  float _753;
  float _756;
  float _759;
  float _762;
  int _767;
  float _775;
  float _776;
  float _777;
  float _778;
  float _779;
  float _780;
  float _781;
  int _789;
  int _798;
  float _806;
  float _807;
  float _808;
  float _812;
  float _813;
  float _814;
  float _829;
  float _836;
  float _837;
  float _838;
  float _849;
  bool _850;
  float _851;
  float _852;
  float _853;
  float _854;
  int _855;
  float _865;
  float _866;
  float _867;
  float _895;
  float _900;
  float _901;
  float _906;
  float _907;
  float _908;
  float _917;
  float _919;
  float _920;
  float _922;
  float _924;
  float _925;
  float _926;
  float _932;
  float _933;
  float _945;
  float _946;
  float _947;
  float _948;
  float _949;
  float4 _954;
  float4 _958;
  int _965;
  float _973;
  float _975;
  float _982;
  float _983;
  float _984;
  float _987;
  float _988;
  float4 _993;
  float4 _997;
  int _1004;
  float _1012;
  float _1014;
  float _1021;
  float _1022;
  float _1023;
  float _1026;
  float _1027;
  float4 _1032;
  float4 _1036;
  int _1043;
  float _1051;
  float _1053;
  float _1060;
  float _1061;
  float _1062;
  float _1065;
  float _1066;
  float4 _1071;
  float4 _1075;
  int _1082;
  float _1090;
  float _1092;
  float _1099;
  float _1100;
  float _1101;
  float _1104;
  float _1105;
  float4 _1110;
  float4 _1114;
  int _1121;
  float _1129;
  float _1131;
  float4 _1148;
  int _1152;
  float _1160;
  float _1162;
  int _1176;
  float _1184;
  int _1185;
  float _1193;
  int _1213;
  float _1221;
  int _1226;
  float _1234;
  int _1237;
  float _1245;
  float _1249;
  int _1274;
  int _1282;
  float4 _1289;
  float _1292;
  float _1294;
  float _1297;
  float _1310;
  float _1311;
  float _1312;
  float _1313;
  float _1322;
  float _1323;
  float _1325;
  float4 _1333;
  float _1342;
  float _1343;
  float _1344;
  float _1345;
  float _1352;
  float _1372;
  float _1375;
  float _1399;
  float _1400;
  float _1401;
  float _1416;
  float _1452;
  float _1453;
  float _1455;
  int _1464;
  int _1472;
  float4 _1479;
  float _1482;
  float _1483;
  float _1498;
  int _1501;
  int _1509;
  float4 _1516;
  float _1527;
  float _1531;
  float _1534;
  float _1537;
  float _1546;
  float _1555;
  float _1557;
  float _1559;
  float _1577;
  int _1594;
  float _1602;
  float _1609;
  float _1610;
  float _1611;
  float _1619;
  float _1620;
  int _1631;
  int _1653;
  int _1661;
  float4 _1668;
  float _1673;
  float _1674;
  float _1689;
  float _1690;
  float _1691;
  float _1697;
  float _1700;
  float _1706;
  float _1721;
  uint _1748;
  uint _1749;
  uint4 _1751;
  float4 _1754;
  float _1772;
  float _1773;
  float _1774;
  float _1776;
  float _1777;
  float _1778;
  float _1779;
  float _1782;
  float _1783;
  float _1786;
  float _1787;
  float _1791;
  float _1793;
  float _1794;
  float _1795;
  float _1796;
  float _1798;
  float _1801;
  float _1802;
  float _1803;
  float _1804;
  float _1813;
  float _1817;
  float _1821;
  float _1823;
  float _1835;
  float _1836;
  float _1839;
  float _1844;
  float _1878;
  float _1890;
  float _1891;
  float _1892;
  float _1906;
  float _1907;
  float _1908;
  float _1919;
  float4 _1926;
  float _1931;
  float _1932;
  float _1934;
  float _1939;
  float _1943;
  float _1944;
  float _1945;
  float _1953;
  float _1962;
  float _1971;
  float _1974;
  float _1981;
  float _1988;
  float _1992;
  float _1996;
  bool _2002;
  int _2006;
  float _2020;
  float _2021;
  float _2022;
  float _2050;
  float _2051;
  float _2055;
  float _2065;
  float _2066;
  float _2067;
  float _2079;
  float _2085;
  float _2087;
  float _2094;
  float _2095;
  float _2103;
  float _2108;
  float4 _2124;
  float _2129;
  float _2140;
  float _2141;
  float _2142;
  int _2152;
  float _2160;
  float _2168;
  float _2169;
  float _2176;
  int _2181;
  float _2189;
  int _2191;
  float _2199;
  float _2201;
  float _2208;
  float _2209;
  float _2210;
  uint _2211;
  float _2233;
  float _2282;
  float _2283;
  float _2284;
  float _2286;
  float _2293;
  float _2294;
  float _2295;
  float _2314;
  float _2315;
  float _2316;
  float _2317;
  float _2318;
  float _2319;
  float _2320;
  float _2321;
  float _2322;
  float _2368;
  float _2369;
  float _2370;
  float _2371;
  float _2372;
  float _2373;
  float _2374;
  float _2391;
  float _2392;
  float _2393;
  float _2394;
  float _2400;
  float _2403;
  float _2410;
  float _2411;
  float _2412;
  float _2441;
  float _2466;
  float _2467;
  float _2468;
  float _2487;
  float _2488;
  float _2489;
  float _2495;
  float _2499;
  float _2500;
  float _2501;
  float _2502;
  float _2507;
  float _2532;
  float _2536;
  float _2537;
  float _2538;
  float _2539;
  int _2580;
  float _2635;
  float _2659;
  float _2660;
  float _2664;
  float _2711;
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
  _284 = WaveReadLaneFirst(_materialIndex);
  _292 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_284 < (uint)170000), _284, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceEffectRatio);
  if (!(_292 < 0.0010000000474974513f)) {
    _318 = WaveReadLaneFirst(_materialIndex);
    _326 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_318 < (uint)170000), _318, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSpeedRatio);
    _336 = rsqrt(dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))) * frac((_326 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + -0.004999999888241291f);
    _340 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].x) * 0.009999999776482582f) + 2000.0f) + (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x));
    _341 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].y) * 0.009999999776482582f) + 2000.0f) + (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y));
    _342 = (frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[82u].z) * 0.009999999776482582f) + 2000.0f) + (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z));
    _344 = 1.0f;
    _345 = 0;
    while(true) {
      _352 = ((_344 * _274) + _340) * 4.0f;
      _356 = frac(abs(_352));
      _361 = ((_344 * _275) + _341) * 4.0f;
      _365 = frac(abs(_361));
      _370 = ((_344 * _276) + _342) * 4.0f;
      _374 = frac(abs(_370));
      _382 = abs((select((_352 >= (-0.0f - _352)), _356, (-0.0f - _356)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _383 = abs((select((_361 >= (-0.0f - _361)), _365, (-0.0f - _365)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _384 = abs((select((_370 >= (-0.0f - _370)), _374, (-0.0f - _374)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _385 = max(_382, 0.0f);
      _386 = max(_383, 0.0f);
      _387 = max(_384, 0.0f);
      _397 = min(max(_382, max(_383, _384)), 0.0f) + sqrt(((_386 * _386) + (_385 * _385)) + (_387 * _387));
      if (!(_397 < (_344 * 0.0010000000474974513f))) {
        _401 = _397 + _344;
        _402 = _345 + 1;
        if ((int)_402 < (int)50) {
          _344 = _401;
          _345 = _402;
          continue;
        } else {
          _405 = _401;
        }
      } else {
        _405 = _344;
      }
      _409 = (_405 * _274) + _340;
      _410 = (_405 * _275) + _341;
      _411 = (_405 * _276) + _342;
      _412 = _409 * 4.0f;
      _416 = frac(abs(_412));
      _421 = _410 * 4.0f;
      _425 = frac(abs(_421));
      _430 = _411 * 4.0f;
      _434 = frac(abs(_430));
      _442 = abs((select((_412 >= (-0.0f - _412)), _416, (-0.0f - _416)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _443 = abs((select((_421 >= (-0.0f - _421)), _425, (-0.0f - _425)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _444 = abs((select((_430 >= (-0.0f - _430)), _434, (-0.0f - _434)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _445 = max(_442, 0.0f);
      _446 = max(_443, 0.0f);
      _447 = max(_444, 0.0f);
      _448 = _445 * _445;
      _449 = _446 * _446;
      _450 = _449 + _448;
      _451 = _447 * _447;
      _454 = max(_443, _444);
      _457 = min(max(_442, _454), 0.0f) + sqrt(_450 + _451);
      _459 = (_409 + 0.0010000000474974513f) * 4.0f;
      _463 = frac(abs(_459));
      _469 = abs((select((_459 >= (-0.0f - _459)), _463, (-0.0f - _463)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _470 = max(_469, 0.0f);
      _478 = (_410 + 0.0010000000474974513f) * 4.0f;
      _482 = frac(abs(_478));
      _488 = abs((select((_478 >= (-0.0f - _478)), _482, (-0.0f - _482)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _489 = max(_488, 0.0f);
      _498 = (_411 + 0.0010000000474974513f) * 4.0f;
      _502 = frac(abs(_498));
      _508 = abs((select((_498 >= (-0.0f - _498)), _502, (-0.0f - _502)) * 0.25f) + -0.125f) + -0.0005000000237487257f;
      _509 = max(_508, 0.0f);
      _517 = min(max(_469, _454), 0.0f) + (sqrt((_451 + _449) + (_470 * _470)) - _457);
      _519 = min(max(_442, max(_488, _444)), 0.0f) + (sqrt((_451 + _448) + (_489 * _489)) - _457);
      _521 = min(max(_442, max(_443, _508)), 0.0f) + (sqrt((_509 * _509) + _450) - _457);
      _523 = rsqrt(dot(float3(_517, _519, _521), float3(_517, _519, _521)));
      _531 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x);
      _532 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y);
      _533 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z);
      _535 = rsqrt(dot(float3(_531, _532, _533), float3(_531, _532, _533)));
      _539 = dot(float3((_523 * _517), (_523 * _519), (_523 * _521)), float3((_535 * _531), (_535 * _532), (_535 * _533)));
      _542 = saturate((_405 * 0.222222238779068f) + -0.111111119389534f);
      _546 = (_542 * _542) * (3.0f - (_542 * 2.0f));
      _549 = 1.0f - (_539 - (_546 * _539));
      _550 = _549 * _549;
      _553 = ((_550 * _550) * 0.20000000298023224f) + 0.10000000149011612f;
      _554 = _553 * _553;
      _555 = _554 * 0.699999988079071f;
      _556 = _554 * 0.4000000059604645f;
      _557 = _554 * 0.10000000149011612f;
      _564 = WaveReadLaneFirst(_materialIndex);
      _572 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_564 < (uint)170000), _564, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceEffectRatio);
      _580 = saturate((_555 - (_555 * _546)) * _572);
      _581 = saturate((_556 - (_556 * _546)) * _572);
      _582 = saturate((_557 - (_557 * _546)) * _572);
      break;
    }
  } else {
    _580 = 0.0f;
    _581 = 0.0f;
    _582 = 0.0f;
  }
  if ((_158.x < 1.0000000116860974e-07f) || (_158.x == 1.0f)) {
    _590 = exp2(log2(abs(_275)) * 0.5f);
    _591 = WaveReadLaneFirst(_materialIndex);
    _601 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_591 < (uint)170000), _591, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.x);
    _602 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_591 < (uint)170000), _591, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.y);
    _603 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_591 < (uint)170000), _591, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._cubeSpaceSkyColor.z);
    _614 = false;
    _615 = (lerp(_580, _601, _590));
    _616 = (lerp(_581, _602, _590));
    _617 = (lerp(_582, _603, _590));
  } else {
    _614 = true;
    _615 = _580;
    _616 = _581;
    _617 = _582;
  }
  _620 = max(0.0010000000474974513f, _exposure0.x);
  _621 = _615 / _620;
  _622 = _616 / _620;
  _623 = _617 / _620;
  _624 = 4.0f / _34;
  _625 = _624 * _143;
  _626 = _624 * _144;
  _631 = WaveReadLaneFirst(_materialIndex);
  _639 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_631 < (uint)170000), _631, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
  _646 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_639 < (uint)65000), _639, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_625, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _626)));
  _652 = WaveReadLaneFirst(_materialIndex);
  _660 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_652 < (uint)170000), _652, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _661 = _660 * (_646.y + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_667.x, _667.y);
  _684 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_667.x)))))) + 0.5f) * ((_661 * 0.0010000000474974513f) + _143)), int((float((int)(int(float((int)((int)(_667.y)))))) + 0.5f) * ((_661 * 0.019999999552965164f) + _144)), 0)))).x) & 255;
  _685 = WaveReadLaneFirst(_materialIndex);
  _693 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_685 < (uint)170000), _685, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._radius);
  _694 = WaveReadLaneFirst(_materialIndex);
  _702 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_694 < (uint)170000), _694, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _705 = saturate(1.0f - _702) * _693;
  [branch]
  if (!(_705 < 0.0010000000474974513f)) {
    _708 = ddx_coarse(_274);
    _709 = ddx_coarse(_275);
    _710 = ddx_coarse(_276);
    _711 = ddy_coarse(_274);
    _712 = ddy_coarse(_275);
    _713 = ddy_coarse(_276);
    _714 = ddx_coarse(_143);
    _715 = ddx_coarse(_144);
    _716 = ddy_coarse(_143);
    _717 = ddy_coarse(_144);
    _720 = (_712 * _188) - (_713 * _187);
    _723 = (_713 * _186) - (_711 * _188);
    _726 = (_711 * _187) - (_712 * _186);
    _729 = (_710 * _187) - (_709 * _188);
    _732 = (_708 * _188) - (_710 * _186);
    _735 = (_709 * _186) - (_708 * _187);
    _742 = (_716 * _729) + (_720 * _714);
    _743 = (_716 * _732) + (_723 * _714);
    _744 = (_716 * _735) + (_726 * _714);
    _751 = (_717 * _729) + (_720 * _715);
    _752 = (_717 * _732) + (_723 * _715);
    _753 = (_717 * _735) + (_715 * _726);
    _756 = max(dot(float3(_742, _743, _744), float3(_742, _743, _744)), dot(float3(_751, _752, _753), float3(_751, _752, _753)));
    _759 = rsqrt(select((_756 != 0.0f), _756, 0.10000000149011612f));
    _762 = _759 * _274;
    _767 = WaveReadLaneFirst(_materialIndex);
    _775 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_767 < (uint)170000), _767, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._squareSize);
    _776 = _775 * _230;
    _777 = _775 * _231;
    _778 = _775 * _232;
    _779 = floor(_776);
    _780 = floor(_777);
    _781 = floor(_778);
    _783 = 10.0f;
    _784 = 0.0f;
    _785 = 0.0f;
    _786 = 0.0f;
    _787 = -1;
    while(true) {
      _792 = _783;
      _793 = _784;
      _794 = _785;
      _795 = _786;
      _796 = -1;
      while(true) {
        _801 = _792;
        _802 = _793;
        _803 = _794;
        _804 = _795;
        _805 = -1;
        while(true) {
          _806 = float((int)(_805));
          _807 = float((int)(_796));
          _808 = float((int)(_787));
          _812 = sin(_806 + _779);
          _813 = sin(_807 + _780);
          _814 = sin(_808 + _781);
          _829 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _836 = sin(_829 * frac(sin(dot(float3(_812, _813, _814), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _806;
          _837 = sin(_829 * frac(sin(dot(float3(_812, _813, _814), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _807;
          _838 = sin(_829 * frac(sin(dot(float3(_812, _813, _814), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _808;
          _849 = max(abs((_779 - _776) + _836), max(abs((_780 - _777) + _837), abs((_781 - _778) + _838)));
          _850 = (_849 < _801);
          _851 = select(_850, _849, _801);
          _852 = select(_850, _836, _802);
          _853 = select(_850, _837, _803);
          _854 = select(_850, _838, _804);
          _855 = _805 + 1;
          if (!(_855 == 2)) {
            _801 = _851;
            _802 = _852;
            _803 = _853;
            _804 = _854;
            _805 = _855;
            continue;
          }
          while(true) {
            _798 = _796 + 1;
            if (!(_798 == 2)) {
              _792 = _851;
              _793 = _852;
              _794 = _853;
              _795 = _854;
              _796 = _798;
              __loop_jump_target = 791;
              break;
            }
            while(true) {
              _789 = _787 + 1;
              if (!(_789 == 2)) {
                _783 = _851;
                _784 = _852;
                _785 = _853;
                _786 = _854;
                _787 = _789;
                __loop_jump_target = 782;
                break;
              }
              _865 = (_852 + _779) / _775;
              _866 = (_853 + _780) / _775;
              _867 = (_854 + _781) / _775;
              _895 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _867, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _866, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _865))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
              _900 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _867, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _866, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _865))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _895) * 0.5f) + 0.5f;
              _901 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _867, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _866, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _865))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _895) * 0.5f);
              _906 = _865 - _mainPosition.x;
              _907 = _866 - _mainPosition.y;
              _908 = _867 - _mainPosition.z;
              _917 = saturate(1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _705)) * sqrt(dot(float3(_906, _907, _908), float3(_906, _907, _908))))) * 1.0152283906936646f));
              _919 = 1.0f - saturate(_917);
              _920 = _917 * 0.5f;
              _922 = (_143 - _900) / _919;
              _924 = (_144 - _901) / _919;
              _925 = sin(_920);
              _926 = cos(_920);
              _932 = mad((-0.0f - _925), _924, (_926 * _922)) + _900;
              _933 = mad(_926, _924, (_925 * _922)) + _901;
              _945 = (saturate(_158.x * 1.5f) * 0.5f) * saturate(frac(sin(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_143)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_144))))), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + 0.5f);
              _946 = _945 * mad((_759 * _744), _276, mad((_759 * _743), _275, (_762 * _742)));
              _947 = _946 * 0.8333333730697632f;
              _948 = _945 * mad((_759 * _753), _276, mad((_759 * _752), _275, (_762 * _751)));
              _949 = _948 * 0.8333333730697632f;
              _954 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_947 + _143), (_949 + _144)));
              _958 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_932 + _947), (_933 + _949)));
              _965 = WaveReadLaneFirst(_materialIndex);
              _973 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_965 < (uint)170000), _965, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
              _975 = float((bool)(uint)(_954.w < _973));
              _982 = (_975 * ((_958.x * 0.4000000059604645f) - _621)) + _621;
              _983 = (_975 * ((_958.y * 0.4000000059604645f) - _622)) + _622;
              _984 = (_975 * ((_958.z * 0.4000000059604645f) - _623)) + _623;
              if (!(_954.w > 0.8999999761581421f)) {
                _987 = _946 * 0.6666666865348816f;
                _988 = _948 * 0.6666666865348816f;
                _993 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_987 + _143), (_988 + _144)));
                _997 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_932 + _987), (_933 + _988)));
                _1004 = WaveReadLaneFirst(_materialIndex);
                _1012 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1004 < (uint)170000), _1004, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                _1014 = float((bool)(uint)(_993.w < _1012));
                _1021 = (_1014 * ((_997.x * 0.4000000059604645f) - _982)) + _982;
                _1022 = (_1014 * ((_997.y * 0.4000000059604645f) - _983)) + _983;
                _1023 = (_1014 * ((_997.z * 0.4000000059604645f) - _984)) + _984;
                if (!(_993.w > 0.8999999761581421f)) {
                  _1026 = _946 * 0.5f;
                  _1027 = _948 * 0.5f;
                  _1032 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1026 + _143), (_1027 + _144)));
                  _1036 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_932 + _1026), (_933 + _1027)));
                  _1043 = WaveReadLaneFirst(_materialIndex);
                  _1051 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1043 < (uint)170000), _1043, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                  _1053 = float((bool)(uint)(_1032.w < _1051));
                  _1060 = (_1053 * ((_1036.x * 0.4000000059604645f) - _1021)) + _1021;
                  _1061 = (_1053 * ((_1036.y * 0.4000000059604645f) - _1022)) + _1022;
                  _1062 = (_1053 * ((_1036.z * 0.4000000059604645f) - _1023)) + _1023;
                  if (!(_1032.w > 0.8999999761581421f)) {
                    _1065 = _946 * 0.3333333432674408f;
                    _1066 = _948 * 0.3333333432674408f;
                    _1071 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1065 + _143), (_1066 + _144)));
                    _1075 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_932 + _1065), (_933 + _1066)));
                    _1082 = WaveReadLaneFirst(_materialIndex);
                    _1090 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1082 < (uint)170000), _1082, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                    _1092 = float((bool)(uint)(_1071.w < _1090));
                    _1099 = (_1092 * ((_1075.x * 0.4000000059604645f) - _1060)) + _1060;
                    _1100 = (_1092 * ((_1075.y * 0.4000000059604645f) - _1061)) + _1061;
                    _1101 = (_1092 * ((_1075.z * 0.4000000059604645f) - _1062)) + _1062;
                    if (!(_1071.w > 0.8999999761581421f)) {
                      _1104 = _946 * 0.1666666716337204f;
                      _1105 = _948 * 0.1666666716337204f;
                      _1110 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1104 + _143), (_1105 + _144)));
                      _1114 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_932 + _1104), (_933 + _1105)));
                      _1121 = WaveReadLaneFirst(_materialIndex);
                      _1129 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1121 < (uint)170000), _1121, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
                      _1131 = float((bool)(uint)(_1110.w < _1129));
                      _1142 = ((_1131 * ((_1114.z * 0.4000000059604645f) - _1101)) + _1101);
                      _1143 = ((_1131 * ((_1114.y * 0.4000000059604645f) - _1100)) + _1100);
                      _1144 = ((_1131 * ((_1114.x * 0.4000000059604645f) - _1099)) + _1099);
                      _1145 = _1110.w;
                    } else {
                      _1142 = _1101;
                      _1143 = _1100;
                      _1144 = _1099;
                      _1145 = _1071.w;
                    }
                  } else {
                    _1142 = _1062;
                    _1143 = _1061;
                    _1144 = _1060;
                    _1145 = _1032.w;
                  }
                } else {
                  _1142 = _1023;
                  _1143 = _1022;
                  _1144 = _1021;
                  _1145 = _993.w;
                }
              } else {
                _1142 = _984;
                _1143 = _983;
                _1144 = _982;
                _1145 = _954.w;
              }
              _1148 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_932, _933));
              _1152 = WaveReadLaneFirst(_materialIndex);
              _1160 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1152 < (uint)170000), _1152, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._maskThreshold);
              _1162 = float((bool)(uint)(_1145 < _1160));
              _1173 = ((_1162 * (_1148.x - _1144)) + _1144);
              _1174 = ((_1162 * (_1148.y - _1143)) + _1143);
              _1175 = ((_1162 * (_1148.z - _1142)) + _1142);
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
        if (__loop_jump_target == 791) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 782) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _1173 = _621;
    _1174 = _622;
    _1175 = _623;
  }
  _1176 = WaveReadLaneFirst(_materialIndex);
  _1184 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1176 < (uint)170000), _1176, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _1185 = WaveReadLaneFirst(_materialIndex);
  _1193 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1185 < (uint)170000), _1185, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._tempCubeSpaceRatio);
  [branch]
  if ((_684 == _renderPassMemoryBackground) || ((!(_684 == _renderPassMemoryBackground)) && (_684 == _renderPassDetectRemoteCatch)) || (((!(_684 == _renderPassMemoryBackground)) && (!(_684 == _renderPassDetectRemoteCatch))) && (_684 == _renderPassDetectPickedRemoteCatch))) {
    _1213 = WaveReadLaneFirst(_materialIndex);
    _1221 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1213 < (uint)170000), _1213, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryOpacity);
    _1236 = _1221;
  } else {
    if (_684 == _renderPassEnemyBoss) {
      _1226 = WaveReadLaneFirst(_materialIndex);
      _1234 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1226 < (uint)170000), _1226, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
      _1236 = _1234;
    } else {
      _1236 = 1.0f;
    }
  }
  _1237 = WaveReadLaneFirst(_materialIndex);
  _1245 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1237 < (uint)170000), _1237, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _1249 = saturate((_1245 * 100.0f) + -99.0f) * _1236;
  if (!(_1249 < 0.0010000000474974513f)) {
    [branch]
    if ((_684 == _renderPassSelfPlayer) | (_684 == _renderPassTest) | (_684 == _renderPassDetectRemoteCatch) | (_684 == _renderPassDetectPickedRemoteCatch)) {
      _1274 = WaveReadLaneFirst(_materialIndex);
      _1282 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1274 < (uint)170000), _1274, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
      _1289 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1282 < (uint)65000), _1282, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_625 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.2199999988079071f)), (_626 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.18000000715255737f))));
      _1292 = _1289.x + -0.30000001192092896f;
      _1294 = ((_1289.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
      _1297 = _1292 * 0.006000000052154064f;
      _1299 = _1297;
      _1300 = _1297;
      _1301 = 0.0f;
      _1302 = 0.0f;
      _1303 = 0.0f;
      _1304 = 0.0f;
      _1305 = -1.0f;
      while(true) {
        _1310 = _143 - ((_1299 * sin(_1294)) * _1305);
        _1311 = _144 - ((_1300 * cos(_1294)) * _1305);
        _1312 = _1310 + -0.5f;
        _1313 = _1311 + -0.5f;
        _1322 = rsqrt(dot(float2(_1312, _1313), float2(_1312, _1313))) * ((_1292 * 0.05999999865889549f) * sqrt((_1312 * _1312) + (_1313 * _1313)));
        _1323 = _1322 * _1312;
        _1325 = _1322 * _1313;
        _1333 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1310, _1311));
        _1342 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1310 - _1323), (_1311 - _1325))))).x) * 0.20000000298023224f) + _1301;
        _1343 = (_1333.y * 0.20000000298023224f) + _1302;
        _1344 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1323 + _1310), (_1325 + _1311))))).z) * 0.20000000298023224f) + _1303;
        _1345 = (_1333.w * 0.20000000298023224f) + _1304;
        _1352 = _1305 + 0.20000000298023224f;
        if (!(_1352 > 1.0f)) {
          _1299 = (_1299 * 1.0099999904632568f);
          _1300 = (_1300 * 1.0099999904632568f);
          _1301 = (_1342 * 0.8999999761581421f);
          _1302 = (_1343 * 0.8999999761581421f);
          _1303 = (_1344 * 0.8999999761581421f);
          _1304 = (_1345 * 0.8999999761581421f);
          _1305 = _1352;
          continue;
        }
        if (!(_684 == _renderPassSelfPlayer)) {
          _1366 = (_684 == _renderPassTest);
        } else {
          _1366 = true;
        }
        _1372 = saturate(_1345 * 1.0800000429153442f);
        _1375 = max(0.0010000000474974513f, _exposure0.x);
        _1383 = ((((_1342 * 0.5400000214576721f) * select(_1366, 0.550000011920929f, 0.5f)) / _1375) * _1372);
        _1384 = ((((_1343 * 0.5400000214576721f) * select(_1366, 0.699999988079071f, 0.800000011920929f)) / _1375) * _1372);
        _1385 = (((_1344 * 0.5400000214576721f) / _1375) * _1372);
        break;
      }
    } else {
      _1383 = 0.0f;
      _1384 = 0.0f;
      _1385 = 0.0f;
    }
  } else {
    _1383 = 0.0f;
    _1384 = 0.0f;
    _1385 = 0.0f;
  }
  if ((_684 == _renderPassSelfPlayer) | (_684 == _renderPassTest)) {
    _1395 = _1249;
  } else {
    _1395 = saturate(saturate(_1193 * 2.0f) * _1184);
  }
  _1399 = _279.z + (_1395 * (_1175 - _279.z));
  _1400 = _279.y + (_1395 * (_1174 - _279.y));
  _1401 = _279.x + (_1395 * (_1173 - _279.x));
  if (_684 == _renderPassMemoryBackground) {
    _1416 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x));
    _1452 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1416, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _1453 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1416, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1452;
    _1455 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1416, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1452;
    _1464 = WaveReadLaneFirst(_materialIndex);
    _1472 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1464 < (uint)170000), _1464, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
    _1479 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1472 < (uint)65000), _1472, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f) + (_1453 * 0.699999988079071f)), ((_1455 * 0.699999988079071f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.03999999910593033f))));
    _1482 = _1479.w + -0.5f;
    _1483 = _1479.z + -0.5f;
    _1498 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f;
    _1501 = WaveReadLaneFirst(_materialIndex);
    _1509 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1501 < (uint)170000), _1501, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._auraTex);
    _1516 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1509 < (uint)65000), _1509, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_1453 * 1.100000023841858f) - ((_646.y + -0.5f) * 0.10000000149011612f)) + (_1482 * 0.30000001192092896f)) - _1498), ((((_1455 * 1.100000023841858f) - ((_646.w + -0.5f) * 0.10000000149011612f)) + (_1483 * 0.30000001192092896f)) - _1498)));
    _1527 = _1482 * 2.0f;
    _1531 = (((0.5f - _646.w) + _1453) + _1527) - _mainPosition.x;
    _1534 = (((0.5f - _646.x) + ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _1416, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _192, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _190))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _1452)) + (_1483 * 2.0f)) - _mainPosition.y;
    _1537 = (((0.5f - _646.z) + _1455) + _1527) - _mainPosition.z;
    _1546 = 1.0f - saturate(sqrt(((_1531 * _1531) + (_1534 * _1534)) + (_1537 * _1537)) * 0.125f);
    _1555 = ((sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 5.0f) + (_1546 * 60.0f)) + 1.0f) * 0.25f) + 0.5f;
    _1557 = _1546 * (_1555 * _1555);
    _1559 = (_1557 * _1557) * _646.x;
    _1577 = max(0.0010000000474974513f, _exposure0.x);
    _1591 = (((((((_1546 * 0.010000000707805157f) + ((_1516.x * _1516.x) * _1559)) * _1516.x) / _1577) - _1401) * _1249) + _1401);
    _1592 = (((((((_1546 * 0.03500000014901161f) + ((_1516.y * _1516.y) * _1559)) * _1516.y) / _1577) - _1400) * _1249) + _1400);
    _1593 = (((((((_1546 * 0.05000000074505806f) + ((_1516.z * _1516.z) * _1559)) * _1516.z) / _1577) - _1399) * _1249) + _1399);
  } else {
    _1591 = _1401;
    _1592 = _1400;
    _1593 = _1399;
  }
  _1594 = WaveReadLaneFirst(_materialIndex);
  _1602 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1594 < (uint)170000), _1594, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadBackgroundOpacity);
  if (!(_1602 < 0.0010000000474974513f)) {
    _1609 = _230 - _mainPosition.x;
    _1610 = _231 - _mainPosition.y;
    _1611 = _232 - _mainPosition.z;
    _1619 = saturate(sqrt(((_1609 * _1609) + (_1610 * _1610)) + (_1611 * _1611)) * 0.03333333507180214f);
    _1620 = 1.0f - _1619;
    _1631 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 127;
    if (_614 && (_1620 > 0.0f)) {
      _1653 = WaveReadLaneFirst(_materialIndex);
      _1661 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_1653 < (uint)170000), _1653, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._glitchTex);
      _1668 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1661 < (uint)65000), _1661, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_230 * 0.10000000149011612f), (_232 * 0.10000000149011612f)));
      _1673 = (_1668.x * 2.0f) + -0.9960784316062927f;
      _1674 = (_1668.y * 2.0f) + -0.9960784316062927f;
      _1689 = ((_1673 + _230) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x)) * 0.05999999865889549f;
      _1690 = ((_1674 + _231) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y)) * 0.05999999865889549f;
      _1691 = ((sqrt(saturate(1.0f - dot(float2(_1673, _1674), float2(_1673, _1674)))) + _232) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z)) * 0.05999999865889549f;
      _1697 = sqrt(((_1689 * _1689) + (_1690 * _1690)) + (_1691 * _1691));
      _1700 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f;
      _1706 = exp2(log2(frac(_1697 - _1700)) * 15.0f) * _1620;
      _1721 = exp2(log2(saturate(1.0f - abs((frac((_1697 + 0.5f) - _1700) * 2.0f) + -1.0f))) * 30.0f) * (_1620 * 0.014999999664723873f);
      _1725 = (_1721 * _1673);
      _1726 = (_1721 * _1674);
      _1727 = (_1706 * 0.20000000298023224f);
      _1728 = (_1706 * 0.5f);
      _1729 = _1706;
    } else {
      _1725 = 0.0f;
      _1726 = 0.0f;
      _1727 = 0.0f;
      _1728 = 0.0f;
      _1729 = 0.0f;
    }
    if (((uint)(_1631 + -53) < (uint)15) || ((!((uint)(_1631 + -53) < (uint)15)) && ((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _193) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x)))) > 0.20000000298023224f) && (_684 == _renderPassMemory)))) {
      _1748 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_661 * 0.0005000000237487257f) + _143));
      _1749 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_661 * 0.009999999776482582f) + _144));
      _1751 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_1748, _1749, 0));
      _1754 = __3__36__0__0__g_gbufferNormal.Load(int3(_1748, _1749, 0));
      _1772 = (saturate(_1754.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _1773 = (saturate(_1754.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _1774 = (saturate(_1754.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _1776 = rsqrt(dot(float3(_1772, _1773, _1774), float3(_1772, _1773, _1774)));
      _1777 = _1776 * _1772;
      _1778 = _1776 * _1773;
      _1779 = _1774 * _1776;
      _1782 = (float((uint)((uint)(((uint)((uint)(_1751.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _1783 = (float((uint)((uint)(_1751.w & 255))) * 0.007843137718737125f) + -1.0f;
      _1786 = (_1782 + _1783) * 0.5f;
      _1787 = (_1782 - _1783) * 0.5f;
      _1791 = (1.0f - abs(_1786)) - abs(_1787);
      _1793 = rsqrt(dot(float3(_1786, _1787, _1791), float3(_1786, _1787, _1791)));
      _1794 = _1793 * _1786;
      _1795 = _1793 * _1787;
      _1796 = _1793 * _1791;
      _1798 = select((_1779 >= 0.0f), 1.0f, -1.0f);
      _1801 = -0.0f - (1.0f / (_1798 + _1779));
      _1802 = _1778 * _1801;
      _1803 = _1802 * _1777;
      _1804 = _1798 * _1777;
      _1813 = mad(_1796, _1777, mad(_1795, _1803, ((((_1804 * _1777) * _1801) + 1.0f) * _1794)));
      _1817 = mad(_1796, _1778, mad(_1795, (_1798 + (_1802 * _1778)), ((_1794 * _1798) * _1803)));
      _1821 = mad(_1796, _1779, mad(_1795, (-0.0f - _1778), (-0.0f - (_1804 * _1794))));
      _1823 = rsqrt(dot(float3(_1813, _1817, _1821), float3(_1813, _1817, _1821)));
      _1835 = saturate(dot(float3((_1823 * _1813), (_1823 * _1817), (_1823 * _1821)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _1836 = 1.0f - _1835;
      _1839 = max(0.0010000000474974513f, _exposure0.x);
      _1844 = (_1836 * _1836) * _1620;
      if ((_684 == _renderPassSelfPlayer) || ((!(_684 == _renderPassSelfPlayer)) && (_684 == _renderPassTest))) {
        _1864 = ((_1836 * 0.05000000074505806f) + 0.10000000149011612f);
      } else {
        _1864 = select((_684 == _renderPassMemory), 1.100000023841858f, 0.10000000149011612f);
      }
      _1878 = (pow(_1619, 1.5f)) * ((pow(_1835, 5.0f)) * 0.800000011920929f);
      _2115 = ((((_1844 * (0.4000000059604645f / _1839)) * _1864) + _1591) + (_1878 * _1727));
      _2116 = ((((_1844 * (0.699999988079071f / _1839)) * _1864) + _1592) + (_1878 * _1728));
      _2117 = ((((_1844 * (1.0f / _1839)) * _1864) + _1593) + (_1878 * _1729));
    } else {
      _1890 = _230 - _mainPosition.x;
      _1891 = _231 - _mainPosition.y;
      _1892 = _232 - _mainPosition.z;
      _1906 = _230 - _aimHighlightPosition.x;
      _1907 = _231 - _aimHighlightPosition.y;
      _1908 = _232 - _aimHighlightPosition.z;
      _1919 = 1.0f - saturate(sqrt(((_1906 * _1906) + (_1907 * _1907)) + (_1908 * _1908)) / (_aimHighlightPosition.w * 5.0f));
      _1926 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_1725 + _143), (_1726 + _144)), 0.0f);
      _1931 = _1926.w * saturate(((_1919 * _1919) * _1919) + ((1.0f - saturate(sqrt(((_1890 * _1890) + (_1891 * _1891)) + (_1892 * _1892)) * 0.5f)) * 0.10000000149011612f));
      _1932 = _1931 * 5.0f;
      _1934 = (_1926.w * _1926.w) * _1620;
      _1939 = ((_1934 * _1934) * 49.959999084472656f) + 0.03999999910593033f;
      _1943 = _1931 * 1.75f;
      _1944 = _1931 * 3.25f;
      _1945 = _1931 * 120.0f;
      _1953 = ((1.0f - saturate(_1945 + -3.0f)) * saturate(_1945 + -2.0f)) * (0.3499999940395355f - _1943);
      _1962 = ((0.6499999761581421f - _1944) * saturate(_1945 + -2.5f)) * (1.0f - saturate(_1945 + -4.0f));
      _1971 = (saturate(_1945 + -3.5f) * (1.0f - _1932)) * (1.0f - saturate(_1945 + -5.0f));
      _1974 = saturate(_1945 + -8.0f);
      _1981 = 1.0f - _1934;
      _1988 = ((_1939 * _1727) + _1591) + (((((_1953 + _1943) - (_1953 * _1974)) * _1981) + (_1934 * 0.3499999940395355f)) * _1602);
      _1992 = ((_1939 * _1728) + _1592) + (((((_1962 + _1944) - (_1962 * _1974)) * _1981) + (_1934 * 0.6499999761581421f)) * _1602);
      _1996 = ((_1939 * _1729) + _1593) + (((((_1971 + _1932) - (_1971 * _1974)) * _1981) + _1934) * _1602);
      if (_1631 == 7) {
        _2002 = ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) != 0);
        _2115 = select(_2002, 0.014999999664723873f, 0.007000000216066837f);
        _2116 = 0.0f;
        _2117 = select(_2002, 0.0f, 0.014999999664723873f);
      } else {
        _2006 = _1631 + -105;
        if ((_1631 == 107) || ((_1631 == 26) || (((uint)(_1631 + -27) < (uint)2) || ((uint)_2006 < (uint)2)))) {
          _2020 = _mainPosition.x - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
          _2021 = _mainPosition.y - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
          _2022 = _mainPosition.z - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
          _2050 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _2022, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _2021, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _2020))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
          _2051 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _2022, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _2021, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _2020))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _2050;
          _2055 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _2022, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _2021, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _2020))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _2050) * 0.5f);
          _2065 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * 5.0f) + _2020;
          _2066 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * 5.0f) + _2021;
          _2067 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * 5.0f) + _2022;
          _2079 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _2067, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _2066, (_2065 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
          _2085 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _2067, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _2066, (_2065 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _2079) * 0.5f)) - _2055;
          _2087 = (_34 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _2067, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _2066, (_2065 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _2079) - _2051);
          _2094 = _144 - _2055;
          _2095 = ((_143 + -0.5f) - (_2051 * 0.5f)) * _34;
          _2103 = 1.0f - saturate(sqrt((_2094 * _2094) + (_2095 * _2095)) / max(0.0010000000474974513f, sqrt((_2085 * _2085) + (_2087 * _2087))));
          _2108 = (_2103 * _2103) * (select(((uint)_2006 < (uint)3), 0.10000000149011612f, 0.014999999664723873f) * _1602);
          _2115 = ((_2108 * 0.3499999940395355f) + _1988);
          _2116 = ((_2108 * 0.6499999761581421f) + _1992);
          _2117 = (_2108 + _1996);
        } else {
          _2115 = _1988;
          _2116 = _1992;
          _2117 = _1996;
        }
      }
    }
  } else {
    _2115 = _1591;
    _2116 = _1592;
    _2117 = _1593;
  }
  if (_684 == _renderPassEnemyBoss) {
    _2124 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_143, _144));
    _2129 = saturate(_2124.z * 2.0f);
    _2140 = saturate((_2124.x * 3.0f) * ((1.0f / max(0.0010000000474974513f, _exposure0.x)) - _2124.z));
    _2141 = _2140 * 0.6000000238418579f;
    _2142 = _2140 * 0.6499999761581421f;
    _2152 = WaveReadLaneFirst(_materialIndex);
    _2160 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2152 < (uint)170000), _2152, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
    _2165 = (_2160 * ((((_2124.y * 0.22499999403953552f) - _2141) * _2129) + _2141));
    _2166 = (_2160 * ((((_2124.y * 0.32499998807907104f) - _2142) * _2129) + _2142));
    _2167 = (_2160 * ((((_2124.y * 0.5f) - _2140) * _2129) + _2140));
  } else {
    _2165 = _2115;
    _2166 = _2116;
    _2167 = _2117;
  }
  _2168 = _143 + -0.5f;
  _2169 = _144 + -0.5f;
  _2176 = saturate((sqrt((_2169 * _2169) + (_2168 * _2168)) + -0.009999999776482582f) * 1.0101009607315063f);
  _2181 = WaveReadLaneFirst(_materialIndex);
  _2189 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2181 < (uint)170000), _2181, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._vignetteIntensity);
  _2191 = WaveReadLaneFirst(_materialIndex);
  _2199 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_2191 < (uint)170000), _2191, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _2201 = 1.0f - ((((_2176 * _2176) * (3.0f - (_2176 * 2.0f))) * _2189) * _2199);
  _2208 = max(0.0f, (_2201 * (_2165 + _1383)));
  _2209 = max(0.0f, (_2201 * (_2166 + _1384)));
  _2210 = max(0.0f, (_2201 * (_2167 + _1385)));
  _2211 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _2224 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _2211, 0)))).x) & 127))) + 0.5f);
  } else {
    _2224 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_2208, _2209, _2210));
    _2646 = output_color.x;
    _2647 = output_color.y;
    _2648 = output_color.z;
  } else {
    _2646 = _2208;
    _2647 = _2209;
    _2648 = _2210;
  }
  if (_etcParams.y > 1.0f) {
    _2659 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _2660 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _2664 = saturate(1.0f - (dot(float2(_2659, _2660), float2(_2659, _2660)) * saturate(_etcParams.y + -1.0f)));
    _2669 = (_2664 * _2646);
    _2670 = (_2664 * _2647);
    _2671 = (_2664 * _2648);
  } else {
    _2669 = _2646;
    _2670 = _2647;
    _2671 = _2648;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2704 = select((_2669 <= 0.0031308000907301903f), (_2669 * 12.920000076293945f), (((pow(_2669, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2705 = select((_2670 <= 0.0031308000907301903f), (_2670 * 12.920000076293945f), (((pow(_2670, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2706 = select((_2671 <= 0.0031308000907301903f), (_2671 * 12.920000076293945f), (((pow(_2671, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2704 = _2669;
    _2705 = _2670;
    _2706 = _2671;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2711 = float((uint)_2211);
    if (!(_2711 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2711 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2720 = _2704;
        _2721 = _2705;
        _2722 = _2706;
      } else {
        _2720 = 0.0f;
        _2721 = 0.0f;
        _2722 = 0.0f;
      }
    } else {
      _2720 = 0.0f;
      _2721 = 0.0f;
      _2722 = 0.0f;
    }
  } else {
    _2720 = _2704;
    _2721 = _2705;
    _2722 = _2706;
  }
  SV_Target.x = _2720;
  SV_Target.y = _2721;
  SV_Target.z = _2722;
  SV_Target.w = _2224;
  return SV_Target;
}