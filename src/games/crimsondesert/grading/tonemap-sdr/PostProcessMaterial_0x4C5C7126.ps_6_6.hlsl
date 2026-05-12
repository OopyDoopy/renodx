#include "../tonemap.hlsli"

struct PostProcessAbyssEnterGlid_CDStruct {
  float _startYPos;
  float _endYPos;
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
  float3 _globalColor;
  float3 _lightColor;
  float3 _centerGlowColor;
  float _centerGlowRadius;
  float _stardustIntensity;
  float _particleIntensity;
  float _particleEmissionWidth;
  float _anamorphicIntensity;
  float _anamorphicWidth;
  float _largeHalo;
  float _largeHaloIntensity;
  float _middleHaloIntensity;
  float _blubIntensity;
  float _streakGlowIntensity;
  float _centerpoint;
  float _tunnelTotal;
  float _cameraFov;
  float _cubeDistance;
  uint _screenWarpTex;
  float _screenWarpRatio;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessAbyssEnterGlid_CD {
  PostProcessAbyssEnterGlid_CDStruct BindlessParameters_PostProcessAbyssEnterGlid_CD;
};

typedef BindlessParameters_PostProcessAbyssEnterGlid_CD BindlessParameters_PostProcessAbyssEnterGlid_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssEnterGlid_CD_t> BindlessParameters_PostProcessAbyssEnterGlid_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _24;
  float _32;
  int _33;
  float _41;
  float _47;
  float _48;
  float _79;
  float _82;
  float _118;
  float _119;
  float _120;
  float _121;
  float _123;
  float _124;
  float _125;
  float _126;
  float _129;
  float _133;
  float _134;
  float _135;
  float _136;
  float _137;
  float _138;
  float _139;
  float _140;
  float _141;
  float _157;
  float _158;
  float _159;
  float _164;
  float _170;
  float _173;
  float _176;
  float _177;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _188;
  int _189;
  float _284;
  float _285;
  float _286;
  float _287;
  float _288;
  float _289;
  float _290;
  float _321;
  float _322;
  float _323;
  float _366;
  float _408;
  float _409;
  int _410;
  float _415;
  float _416;
  float _417;
  float _418;
  float _419;
  float _420;
  int _421;
  float _724;
  float _783;
  float _784;
  int _785;
  float _790;
  float _791;
  float _792;
  float _793;
  float _794;
  float _795;
  int _796;
  bool _921;
  float _1022;
  float _1023;
  float _1024;
  float _1025;
  float _1026;
  float _1146;
  float _1207;
  float _1208;
  float _1209;
  bool _1784;
  float _1833;
  float _1846;
  float _1860;
  float _2063;
  float _2064;
  float _2065;
  float _2158;
  float _2159;
  float _2160;
  float _2280;
  float _2281;
  float _2282;
  float _2301;
  float _2302;
  float _2303;
  float _2336;
  float _2337;
  float _2338;
  float _2352;
  float _2353;
  float _2354;
  float _199;
  float _200;
  float _201;
  float _204;
  float _224;
  float _226;
  float _228;
  float _229;
  float _233;
  float _234;
  float _235;
  float _254;
  float _259;
  float _262;
  float _267;
  float _269;
  float _270;
  float _271;
  float _272;
  float _273;
  float _278;
  float _279;
  float _280;
  float _281;
  float _304;
  float _306;
  float _308;
  int _318;
  int _324;
  float _332;
  int _333;
  float _341;
  int _342;
  float _350;
  float _353;
  float _355;
  bool _356;
  float _367;
  float _368;
  float _369;
  float _370;
  float _381;
  float _382;
  float _391;
  bool _392;
  float _394;
  float _422;
  float _423;
  float _430;
  float _431;
  float _432;
  float _436;
  float _442;
  float _446;
  float _448;
  float _451;
  float _453;
  float _455;
  float _457;
  float _458;
  float _459;
  float _461;
  float _466;
  float _469;
  float _470;
  float _471;
  float _478;
  float _481;
  float _482;
  float _483;
  float _484;
  float _485;
  float _486;
  float _487;
  float _491;
  float _492;
  float _493;
  float _497;
  float _498;
  float _499;
  float _504;
  float _506;
  float _539;
  float _541;
  float _542;
  float _543;
  float _544;
  float _545;
  float _547;
  float _548;
  float _550;
  float _552;
  float _554;
  float _555;
  float _556;
  float _557;
  float _559;
  float _562;
  float _564;
  float _567;
  float _571;
  float _587;
  float _589;
  float _591;
  int _601;
  float _607;
  float _608;
  float _609;
  int _610;
  float _620;
  float _621;
  float _622;
  float _624;
  float _630;
  int _631;
  float _641;
  float _642;
  float _643;
  float _668;
  float _672;
  float _673;
  float _674;
  float _676;
  float _677;
  float _678;
  float _679;
  float _685;
  float _686;
  float _693;
  float _694;
  float _695;
  float _697;
  float _712;
  float _713;
  float _714;
  float _725;
  float _726;
  float _727;
  float _728;
  float _729;
  float _730;
  float _731;
  float _732;
  float _748;
  float _749;
  float _750;
  float _769;
  float _797;
  float _798;
  float _805;
  float _806;
  float _807;
  float _811;
  float _817;
  float _821;
  float _823;
  float _826;
  float _828;
  float _830;
  float _832;
  float _833;
  float _834;
  float _836;
  float _841;
  float _845;
  float _846;
  float _857;
  float _858;
  float _859;
  float _860;
  float _861;
  float _862;
  float _866;
  float _867;
  float _868;
  float _879;
  float _881;
  float _885;
  float _901;
  float _903;
  float _905;
  int _915;
  float _922;
  int _923;
  float _933;
  float _934;
  float _935;
  float _960;
  float _962;
  float _968;
  float _970;
  float _971;
  float _979;
  float _990;
  float _994;
  float _999;
  float _1004;
  int _1027;
  float _1037;
  float _1038;
  float _1039;
  float _1067;
  float _1077;
  float _1078;
  float _1079;
  int _1080;
  float _1090;
  float _1091;
  float _1092;
  int _1121;
  float _1129;
  float _1130;
  float _1131;
  float _1132;
  float _1133;
  float _1134;
  float _1139;
  float _1151;
  float _1152;
  float _1153;
  float _1154;
  float _1155;
  float _1157;
  float _1159;
  float _1162;
  float _1164;
  float _1165;
  float _1170;
  float _1171;
  float _1184;
  float _1185;
  float _1188;
  float _1190;
  float _1191;
  float _1193;
  float _1197;
  float _1199;
  int _1213;
  float _1221;
  float _1259;
  float _1260;
  float _1261;
  float _1262;
  float _1266;
  float _1278;
  float _1281;
  float _1282;
  float _1283;
  float _1284;
  float _1285;
  float _1286;
  float _1287;
  float _1288;
  float _1289;
  float _1293;
  float _1299;
  float _1300;
  float _1301;
  float _1310;
  float _1311;
  float _1312;
  float _1316;
  float _1338;
  float _1350;
  int _1351;
  float _1359;
  float _1361;
  float _1365;
  float _1371;
  float _1375;
  float _1383;
  float _1386;
  float _1389;
  float _1391;
  float _1392;
  float _1393;
  float _1401;
  float _1407;
  float _1411;
  float _1419;
  float _1422;
  float _1425;
  float _1427;
  float _1428;
  float _1429;
  float _1437;
  float _1443;
  float _1447;
  float _1455;
  float _1458;
  float _1462;
  float _1463;
  float _1466;
  float _1470;
  float _1474;
  float _1477;
  float _1491;
  float _1496;
  float _1507;
  float _1511;
  float _1517;
  float _1521;
  float _1522;
  float _1523;
  float _1527;
  float _1530;
  float _1538;
  float _1542;
  bool _1545;
  bool _1546;
  bool _1547;
  bool _1548;
  float _1563;
  bool _1566;
  bool _1567;
  float _1584;
  int _1589;
  float _1597;
  int _1610;
  float _1618;
  float _1621;
  int _1643;
  float _1651;
  int _1652;
  float _1660;
  float _1661;
  float _1664;
  float _1670;
  float _1675;
  float _1685;
  float _1687;
  float _1693;
  int _1715;
  float _1723;
  float _1733;
  int4 _1749;
  int _1754;
  int _1755;
  int _1756;
  int _1757;
  float4 _1786;
  float _1796;
  float _1797;
  float _1798;
  float _1826;
  float _1827;
  float _1828;
  float _1829;
  float _1840;
  float _1841;
  float _1842;
  uint _1847;
  float _1867;
  float _1916;
  float _1917;
  float _1918;
  float _1920;
  float _1927;
  float _1928;
  float _1929;
  float _1948;
  float _1949;
  float _1950;
  float _1951;
  float _1952;
  float _1953;
  float _1954;
  float _1955;
  float _1956;
  float _2002;
  float _2003;
  float _2004;
  float _2005;
  float _2006;
  float _2007;
  float _2008;
  float _2025;
  float _2026;
  float _2027;
  float _2028;
  float _2034;
  float _2037;
  float _2044;
  float _2045;
  float _2046;
  float _2075;
  float _2100;
  float _2101;
  float _2102;
  float _2121;
  float _2122;
  float _2123;
  float _2129;
  float _2133;
  float _2134;
  float _2135;
  float _2136;
  float _2141;
  float _2166;
  float _2170;
  float _2171;
  float _2172;
  float _2173;
  int _2214;
  float _2269;
  float _2291;
  float _2292;
  float _2296;
  float _2343;
  float _2364;
  float _2365;
  float _2366;
  float _21[36];
  _24 = WaveReadLaneFirst(_materialIndex);
  _32 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_24 < (uint)170000), _24, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._startYPos);
  _33 = WaveReadLaneFirst(_materialIndex);
  _41 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._endYPos);
  _47 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _41) / (_32 - _41));
  _48 = 1.0f - _47;
  _79 = (TEXCOORD.x * 2.0f) + -1.0f;
  _82 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  _118 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _79));
  _119 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _79)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _118;
  _120 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _79))) / _118;
  _121 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _79))) / _118;
  _123 = rsqrt(dot(float3(_119, _120, _121), float3(_119, _120, _121)));
  _124 = _123 * _119;
  _125 = _123 * _120;
  _126 = _123 * _121;
  _129 = sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + 3.0f;
  _133 = (_129 * _124) + _124;
  _134 = (_129 * _125) + _125;
  _135 = (_129 * _126) + _126;
  _136 = floor(asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x));
  _137 = floor(asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y));
  _138 = floor(asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z));
  _139 = 1.0f / _124;
  _140 = 1.0f / _125;
  _141 = 1.0f / _126;
  _157 = float((int)(((int)(uint)((int)(_124 > 0.0f))) - ((int)(uint)((int)(_124 < 0.0f)))));
  _158 = float((int)(((int)(uint)((int)(_125 > 0.0f))) - ((int)(uint)((int)(_125 < 0.0f)))));
  _159 = float((int)(((int)(uint)((int)(_126 > 0.0f))) - ((int)(uint)((int)(_126 < 0.0f)))));
  _164 = _136 + (0.5f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x));
  _170 = _138 + (0.5f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z));
  _173 = ((_137 + (0.5f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y))) + (_158 * 0.5f)) * _140;
  _176 = _136;
  _177 = _137;
  _178 = _138;
  _179 = (((_157 * 0.5f) + _164) * _139);
  _180 = _173;
  _181 = (((_159 * 0.5f) + _170) * _141);
  _182 = 0.0f;
  _183 = 0.0f;
  _184 = 0.0f;
  _185 = 0.0f;
  _186 = 0.0f;
  _187 = 0.0f;
  _188 = 0.0f;
  _189 = 0;
  while(true) {
    _284 = _182;
    _285 = _183;
    _286 = _184;
    _287 = _185;
    _288 = _186;
    _289 = _187;
    _290 = _188;
    _199 = frac(sin(dot(float3(_176, _177, _178), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
    _200 = frac(sin(dot(float3(_176, _177, _178), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
    _201 = frac(sin(dot(float3(_176, _177, _178), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
    _204 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _199;
    _224 = (_176 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x)) + min(max(((cos(_204 + _199) * 0.10000000149011612f) + _199), 0.004999999888241291f), 0.9950000047683716f);
    _226 = (_177 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y)) + min(max(((cos(_204 + _200) * 0.10000000149011612f) + _200), 0.004999999888241291f), 0.9950000047683716f);
    _228 = (_178 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z)) + min(max(((cos(_204 + _201) * 0.10000000149011612f) + _201), 0.004999999888241291f), 0.9950000047683716f);
    _229 = dot(float3(_224, _226, _228), float3(_124, _125, _126));
    _233 = _224 - (_229 * _124);
    _234 = _226 - (_229 * _125);
    _235 = _228 - (_229 * _126);
    bool __branch_chain_175;
    if (!((_229 > 0.0f) && (_229 < 50.0f))) {
      _284 = _182;
      _285 = _183;
      _286 = _184;
      _287 = _185;
      _288 = _186;
      _289 = _187;
      _290 = _188;
      __branch_chain_175 = true;
    } else {
      _254 = saturate((sqrt(((_233 * _233) + (_234 * _234)) + (_235 * _235)) + -0.0024999999441206455f) * 400.0f);
      _259 = 1.0f - ((_254 * _254) * (3.0f - (_254 * 2.0f)));
      _262 = saturate((_229 + -5.0f) * -0.20000000298023224f);
      _267 = ((_262 * _262) * (3.0f - (_262 * 2.0f))) * _259;
      _269 = _259 * (_267 / _229);
      _270 = _269 * ((_182 * 0.4000000059604645f) + 0.6000000238418579f);
      _271 = _269 * ((_183 * 0.4000000059604645f) + 0.6000000238418579f);
      _272 = _269 * ((_184 * 0.4000000059604645f) + 0.6000000238418579f);
      _273 = 1.0f - _188;
      _278 = (_270 * _273) + _185;
      _279 = (_271 * _273) + _186;
      _280 = (_272 * _273) + _187;
      _281 = (_267 * _273) + _188;
      if (!(_281 > 0.9900000095367432f)) {
        _284 = _270;
        _285 = _271;
        _286 = _272;
        _287 = _278;
        _288 = _279;
        _289 = _280;
        _290 = _281;
        __branch_chain_175 = true;
      } else {
        _321 = _278;
        _322 = _279;
        _323 = _280;
        __branch_chain_175 = false;
      }
    }
    if (__branch_chain_175) {
      _304 = (select((_180 < _179), 0.0f, 1.0f) * _157) * select((_181 < _179), 0.0f, 1.0f);
      _306 = (select((_179 < _180), 0.0f, 1.0f) * _158) * select((_181 < _180), 0.0f, 1.0f);
      _308 = (select((_179 < _181), 0.0f, 1.0f) * _159) * select((_180 < _181), 0.0f, 1.0f);
      _318 = _189 + 1;
      if ((int)_318 < (int)5) {
        _176 = (_304 + _176);
        _177 = (_306 + _177);
        _178 = (_308 + _178);
        _179 = ((_304 * _139) + _179);
        _180 = ((_306 * _140) + _180);
        _181 = ((_308 * _141) + _181);
        _182 = _284;
        _183 = _285;
        _184 = _286;
        _185 = _287;
        _186 = _288;
        _187 = _289;
        _188 = _290;
        _189 = _318;
        continue;
      } else {
        _321 = _287;
        _322 = _288;
        _323 = _289;
      }
    }
    _324 = WaveReadLaneFirst(_materialIndex);
    _332 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_324 < (uint)170000), _324, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._stardustIntensity);
    _333 = WaveReadLaneFirst(_materialIndex);
    _341 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._cubeScale);
    _342 = WaveReadLaneFirst(_materialIndex);
    _350 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_342 < (uint)170000), _342, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._cubeDistance);
    _353 = (pow(_48, 2.200000047683716f));
    _355 = (_353 + 1.0f) * 5.0f;
    _356 = (_48 > 0.800000011920929f);
    if (_356) {
      _366 = ((exp2(log2(_47 * 5.0f) * 2.200000047683716f) * (_355 + -0.009999999776482582f)) + 0.009999999776482582f);
    } else {
      _366 = _355;
    }
    _367 = _366 * _124;
    _368 = _366 * _126;
    _369 = 1.0f / _367;
    _370 = 1.0f / _368;
    _381 = float((int)(((int)(uint)((int)(_367 > 0.0f))) - ((int)(uint)((int)(_367 < 0.0f)))));
    _382 = float((int)(((int)(uint)((int)(_368 > 0.0f))) - ((int)(uint)((int)(_368 < 0.0f)))));
    _391 = _341 * 0.009999999776482582f;
    _392 = (_48 < 1.0f);
    if (_392) {
      _394 = saturate(_48);
      _408 = (max((5.0f - (_353 * 5.300000190734863f)), 0.0f) * _350);
      _409 = (((_394 * _394) * _391) * (3.0f - (_394 * 2.0f)));
      _410 = 64;
    } else {
      if (_48 > 0.9998999834060669f) {
        _408 = 0.0f;
        _409 = _391;
        _410 = 0;
      } else {
        _408 = _350;
        _409 = _391;
        _410 = 64;
      }
    }
    if (!(_410 == 0)) {
      _415 = _136;
      _416 = _137;
      _417 = _138;
      _418 = (((_381 * 0.5f) + _164) * _369);
      _419 = _173;
      _420 = (((_382 * 0.5f) + _170) * _370);
      _421 = 0;
      while(true) {
        _422 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) - _415;
        _423 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) - _417;
        if (dot(float2(_422, _423), float2(_422, _423)) > (_408 * _408)) {
          _430 = frac(_415 * 0.1031000018119812f);
          _431 = frac(_416 * 0.1031000018119812f);
          _432 = frac(_417 * 0.1031000018119812f);
          _436 = dot(float3(_430, _431, _432), float3((_431 + 19.190000534057617f), (_432 + 19.190000534057617f), (_430 + 19.190000534057617f)));
          _442 = frac(((_431 + _430) + (_436 * 2.0f)) * (_436 + _432));
          if (_442 > 0.8999999761581421f) {
            _446 = (_417 + asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + _442;
            _448 = (_446 * 2.0f) + _416;
            _451 = min(max((_442 * 0.5f), 0.10000000149011612f), _409);
            _453 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) + -0.5f) - _415;
            _455 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) + -0.5f) - _416;
            _457 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) + -0.5f) - _417;
            _458 = cos(_446);
            _459 = sin(_446);
            _461 = mad(_459, _455, (_458 * _457));
            _466 = mad(_459, _125, (_458 * _368));
            _469 = mad(_458, _125, (-0.0f - (_368 * _459)));
            _470 = cos(_448);
            _471 = sin(_448);
            _478 = mad(_471, _466, (_470 * _367));
            _481 = mad(_470, _466, (-0.0f - (_367 * _471)));
            _482 = 1.0f / _478;
            _483 = 1.0f / _469;
            _484 = 1.0f / _481;
            _485 = _482 * mad(_471, _461, (_470 * _453));
            _486 = _483 * mad(_458, _455, (-0.0f - (_457 * _459)));
            _487 = _484 * mad(_470, _461, (-0.0f - (_453 * _471)));
            _491 = abs(_482) * _451;
            _492 = abs(_483) * _451;
            _493 = abs(_484) * _451;
            _497 = (-0.0f - _485) - _491;
            _498 = (-0.0f - _486) - _492;
            _499 = (-0.0f - _487) - _493;
            _504 = max(max(_497, _498), _499);
            _506 = min(min((_491 - _485), (_492 - _486)), (_493 - _487));
            _539 = (select((_497 < _498), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_478 < 0.0f))) - ((int)(uint)((int)(_478 > 0.0f)))))) * select((_497 < _499), 0.0f, 1.0f);
            _541 = (select((_498 < _497), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_469 < 0.0f))) - ((int)(uint)((int)(_469 > 0.0f)))))) * select((_498 < _499), 0.0f, 1.0f);
            _542 = (select((_499 < _497), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_481 < 0.0f))) - ((int)(uint)((int)(_481 > 0.0f)))))) * select((_499 < _498), 0.0f, 1.0f);
            _543 = -0.0f - _446;
            _544 = cos(_543);
            _545 = sin(_543);
            _547 = mad(_545, _541, (_542 * _544));
            _548 = -0.0f - _545;
            _550 = mad(_544, _541, (_542 * _548));
            _552 = mad(_545, _550, (_547 * _544));
            _554 = mad(_544, _550, (_547 * _548));
            _555 = -0.0f - _448;
            _556 = cos(_555);
            _557 = sin(_555);
            _559 = mad(_557, _552, (_556 * _539));
            _562 = mad(_556, _552, (-0.0f - (_539 * _557)));
            _564 = mad(_557, _562, (_559 * _556));
            _567 = mad(_556, _562, (-0.0f - (_557 * _559)));
            _571 = select(((_504 > _506) || (_506 < 0.0f)), 0.0f, _504);
            if (_571 > 0.0f) {
              _607 = (_571 * _124) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
              _608 = (_571 * _125) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
              _609 = (_571 * _126) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
              _610 = WaveReadLaneFirst(_materialIndex);
              _620 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_610 < (uint)170000), _610, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._lightColor.x);
              _621 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_610 < (uint)170000), _610, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._lightColor.y);
              _622 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_610 < (uint)170000), _610, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._lightColor.z);
              _624 = rsqrt(dot(float3(_620, _621, _622), float3(_620, _621, _622)));
              _630 = max(dot(float3((_624 * _620), (_624 * _621), (_624 * _622)), float3(_564, _554, _567)), 0.05000000074505806f) * 0.009999999776482582f;
              _631 = WaveReadLaneFirst(_materialIndex);
              _641 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_631 < (uint)170000), _631, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._ambientColor.x);
              _642 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_631 < (uint)170000), _631, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._ambientColor.y);
              _643 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_631 < (uint)170000), _631, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._ambientColor.z);
              _668 = max(0.0f, _554);
              _672 = _133 - _607;
              _673 = _134 - _608;
              _674 = _135 - _609;
              _676 = rsqrt(dot(float3(_672, _673, _674), float3(_672, _673, _674)));
              _677 = _676 * _672;
              _678 = _676 * _673;
              _679 = _676 * _674;
              _685 = sqrt(((_672 * _672) + (_673 * _673)) + (_674 * _674));
              _686 = _685 * _685;
              _693 = -0.0f - _677;
              _694 = -0.0f - _678;
              _695 = -0.0f - _679;
              _697 = dot(float3(_693, _694, _695), float3(_564, _554, _567)) * 2.0f;
              _712 = _607 - (_124 * 0.009999999776482582f);
              _713 = _608 - (_125 * 0.009999999776482582f);
              _714 = _609 - (_126 * 0.009999999776482582f);
              if (_356) {
                _724 = ((exp2(log2(_47 * 5.0f) * 2.200000047683716f) * (_355 + -0.009999999776482582f)) + 0.009999999776482582f);
              } else {
                _724 = _355;
              }
              _725 = _724 * _677;
              _726 = _724 * _679;
              _727 = floor(_712);
              _728 = floor(_713);
              _729 = floor(_714);
              _730 = 1.0f / _725;
              _731 = 1.0f / _678;
              _732 = 1.0f / _726;
              _748 = float((int)(((int)(uint)((int)(_725 > 0.0f))) - ((int)(uint)((int)(_725 < 0.0f)))));
              _749 = float((int)(((int)(uint)((int)(_678 > 0.0f))) - ((int)(uint)((int)(_678 < 0.0f)))));
              _750 = float((int)(((int)(uint)((int)(_726 > 0.0f))) - ((int)(uint)((int)(_726 < 0.0f)))));
              if (_392) {
                _769 = saturate(_48);
                _783 = (max((5.0f - (_353 * 5.300000190734863f)), 0.0f) * _350);
                _784 = (((_769 * _769) * _391) * (3.0f - (_769 * 2.0f)));
                _785 = 64;
              } else {
                if (_48 > 0.9998999834060669f) {
                  _783 = 0.0f;
                  _784 = _391;
                  _785 = 0;
                } else {
                  _783 = _350;
                  _784 = _391;
                  _785 = 64;
                }
              }
              if (!(_785 == 0)) {
                _790 = _727;
                _791 = _728;
                _792 = _729;
                _793 = ((((0.5f - _712) + _727) + (_748 * 0.5f)) * _730);
                _794 = (_731 * (((0.5f - _713) + (_749 * 0.5f)) + _728));
                _795 = ((((0.5f - _714) + _729) + (_750 * 0.5f)) * _732);
                _796 = 0;
                while(true) {
                  _797 = _712 - _790;
                  _798 = _714 - _792;
                  bool __branch_chain_789;
                  if (!(dot(float2(_797, _798), float2(_797, _798)) > (_783 * _783))) {
                    __branch_chain_789 = true;
                  } else {
                    _805 = frac(_790 * 0.1031000018119812f);
                    _806 = frac(_791 * 0.1031000018119812f);
                    _807 = frac(_792 * 0.1031000018119812f);
                    _811 = dot(float3(_805, _806, _807), float3((_806 + 19.190000534057617f), (_807 + 19.190000534057617f), (_805 + 19.190000534057617f)));
                    _817 = frac(((_806 + _805) + (_811 * 2.0f)) * (_811 + _807));
                    if (!(_817 > 0.8999999761581421f)) {
                      __branch_chain_789 = true;
                    } else {
                      _821 = (_792 + asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + _817;
                      _823 = (_821 * 2.0f) + _791;
                      _826 = min(max((_817 * 0.5f), 0.10000000149011612f), _784);
                      _828 = (_712 + -0.5f) - _790;
                      _830 = (_713 + -0.5f) - _791;
                      _832 = (_714 + -0.5f) - _792;
                      _833 = cos(_821);
                      _834 = sin(_821);
                      _836 = mad(_834, _830, (_833 * _832));
                      _841 = mad(_834, _678, (_833 * _726));
                      _845 = cos(_823);
                      _846 = sin(_823);
                      _857 = 1.0f / mad(_846, _841, (_845 * _725));
                      _858 = 1.0f / mad(_833, _678, (-0.0f - (_726 * _834)));
                      _859 = 1.0f / mad(_845, _841, (-0.0f - (_725 * _846)));
                      _860 = _857 * mad(_846, _836, (_845 * _828));
                      _861 = _858 * mad(_833, _830, (-0.0f - (_832 * _834)));
                      _862 = _859 * mad(_845, _836, (-0.0f - (_828 * _846)));
                      _866 = abs(_857) * _826;
                      _867 = abs(_858) * _826;
                      _868 = abs(_859) * _826;
                      _879 = max(max(((-0.0f - _860) - _866), ((-0.0f - _861) - _867)), ((-0.0f - _862) - _868));
                      _881 = min(min((_866 - _860), (_867 - _861)), (_868 - _862));
                      _885 = select(((_879 > _881) || (_881 < 0.0f)), 0.0f, _879);
                      if (!(_885 > 0.0f)) {
                        __branch_chain_789 = true;
                      } else {
                        __branch_chain_789 = false;
                      }
                    }
                  }
                  if (__branch_chain_789) {
                    _901 = (select((_794 < _793), 0.0f, 1.0f) * _748) * select((_795 < _793), 0.0f, 1.0f);
                    _903 = (select((_793 < _794), 0.0f, 1.0f) * _749) * select((_795 < _794), 0.0f, 1.0f);
                    _905 = (select((_793 < _795), 0.0f, 1.0f) * _750) * select((_794 < _795), 0.0f, 1.0f);
                    _915 = _796 + 1;
                    if ((uint)_915 < (uint)_785) {
                      _790 = (_901 + _790);
                      _791 = (_903 + _791);
                      _792 = (_905 + _792);
                      _793 = ((_901 * _730) + _793);
                      _794 = ((_903 * _731) + _794);
                      _795 = ((_905 * _732) + _795);
                      _796 = _915;
                      continue;
                    } else {
                      _921 = false;
                    }
                  } else {
                    _921 = (_885 < _685);
                  }
                  break;
                }
              } else {
                _921 = false;
              }
              _922 = select(_921, 0.0f, 1.0f);
              _923 = WaveReadLaneFirst(_materialIndex);
              _933 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_923 < (uint)170000), _923, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._globalColor.x);
              _934 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_923 < (uint)170000), _923, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._globalColor.y);
              _935 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_923 < (uint)170000), _923, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._globalColor.z);
              _960 = dot(float3(_677, _678, _679), float3(_564, _554, _567));
              _962 = max(_960, 0.05000000074505806f) * (1.0f / ((_686 * 0.05000000074505806f) + 1.0f));
              _968 = 1.0f / ((_686 * 0.10000000149011612f) + 1.0f);
              _970 = max(_960, 0.009999999776482582f) * _968;
              _971 = _970 * 0.07323896884918213f;
              _979 = _968 * exp2(log2(max(dot(float3((_693 - (_697 * _564)), (_694 - (_697 * _554)), (_695 - (_697 * _567))), float3((-0.0f - _124), (-0.0f - _125), (-0.0f - _126))), 0.0f)) * 10.0f);
              _990 = (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 50.0f) * exp2(log2(2.0f - _47) * 0.45454543828964233f)) + _608) * 0.019999999552965164f;
              _994 = frac(abs(_990));
              _999 = select(((select((_990 >= (-0.0f - _990)), _994, (-0.0f - _994)) * 50.0f) > 2.0f), 0.0f, 1.0f);
              _1004 = (_571 * 0.10000000149011612f) + 1.0f;
              _1022 = _571;
              _1023 = (((((_668 * select((_641 < 0.040449999272823334f), (_641 * 0.07739938050508499f), exp2(log2((_641 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _630) + (_979 * 0.13286834955215454f)) + ((_971 + (_962 * select((_933 < 0.040449999272823334f), (_933 * 0.07739938050508499f), exp2(log2((_933 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _922)) + ((_999 * 0.05000000074505806f) / _1004));
              _1024 = (((((_668 * select((_642 < 0.040449999272823334f), (_642 * 0.07739938050508499f), exp2(log2((_642 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _630) + (_979 * 0.21404112875461578f)) + ((_971 + (_962 * select((_934 < 0.040449999272823334f), (_934 * 0.07739938050508499f), exp2(log2((_934 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _922)) + ((_999 * 0.10000000149011612f) / _1004));
              _1025 = (((((select((_643 < 0.040449999272823334f), (_643 * 0.07739938050508499f), exp2(log2((_643 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _668) + _630) + (_979 * 0.4479884207248688f)) + (((_970 * 0.21404112875461578f) + (_962 * select((_935 < 0.040449999272823334f), (_935 * 0.07739938050508499f), exp2(log2((_935 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _922)) + ((_999 * 0.20000000298023224f) / _1004));
              _1026 = _571;
            } else {
              _587 = (select((_419 < _418), 0.0f, 1.0f) * _381) * select((_420 < _418), 0.0f, 1.0f);
              _589 = (select((_418 < _419), 0.0f, 1.0f) * _158) * select((_420 < _419), 0.0f, 1.0f);
              _591 = (select((_418 < _420), 0.0f, 1.0f) * _382) * select((_419 < _420), 0.0f, 1.0f);
              _601 = _421 + 1;
              if ((uint)_601 < (uint)_410) {
                _415 = (_587 + _415);
                _416 = (_589 + _416);
                _417 = (_591 + _417);
                _418 = ((_587 * _369) + _418);
                _419 = ((_589 * _140) + _419);
                _420 = ((_591 * _370) + _420);
                _421 = _601;
                continue;
              } else {
                _1022 = -1.0f;
                _1023 = 0.0f;
                _1024 = 0.0f;
                _1025 = 0.0f;
                _1026 = 50.0f;
              }
            }
          } else {
            _587 = (select((_419 < _418), 0.0f, 1.0f) * _381) * select((_420 < _418), 0.0f, 1.0f);
            _589 = (select((_418 < _419), 0.0f, 1.0f) * _158) * select((_420 < _419), 0.0f, 1.0f);
            _591 = (select((_418 < _420), 0.0f, 1.0f) * _382) * select((_419 < _420), 0.0f, 1.0f);
            _601 = _421 + 1;
            if ((uint)_601 < (uint)_410) {
              _415 = (_587 + _415);
              _416 = (_589 + _416);
              _417 = (_591 + _417);
              _418 = ((_587 * _369) + _418);
              _419 = ((_589 * _140) + _419);
              _420 = ((_591 * _370) + _420);
              _421 = _601;
              continue;
            } else {
              _1022 = -1.0f;
              _1023 = 0.0f;
              _1024 = 0.0f;
              _1025 = 0.0f;
              _1026 = 50.0f;
            }
          }
        } else {
          _587 = (select((_419 < _418), 0.0f, 1.0f) * _381) * select((_420 < _418), 0.0f, 1.0f);
          _589 = (select((_418 < _419), 0.0f, 1.0f) * _158) * select((_420 < _419), 0.0f, 1.0f);
          _591 = (select((_418 < _420), 0.0f, 1.0f) * _382) * select((_419 < _420), 0.0f, 1.0f);
          _601 = _421 + 1;
          if ((uint)_601 < (uint)_410) {
            _415 = (_587 + _415);
            _416 = (_589 + _416);
            _417 = (_591 + _417);
            _418 = ((_587 * _369) + _418);
            _419 = ((_589 * _140) + _419);
            _420 = ((_591 * _370) + _420);
            _421 = _601;
            continue;
          } else {
            _1022 = -1.0f;
            _1023 = 0.0f;
            _1024 = 0.0f;
            _1025 = 0.0f;
            _1026 = 50.0f;
          }
        }
        break;
      }
    } else {
      _1022 = -1.0f;
      _1023 = 0.0f;
      _1024 = 0.0f;
      _1025 = 0.0f;
      _1026 = 50.0f;
    }
    _1027 = WaveReadLaneFirst(_materialIndex);
    _1037 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1027 < (uint)170000), _1027, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._fogColor.x);
    _1038 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1027 < (uint)170000), _1027, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._fogColor.y);
    _1039 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1027 < (uint)170000), _1027, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._fogColor.z);
    _1067 = exp2(log2(_1026 * 0.019999999552965164f) * 6.0f);
    _1077 = ((_1067 * (select((_1037 < 0.040449999272823334f), (_1037 * 0.07739938050508499f), exp2(log2((_1037 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1023)) + _1023) * 1.2000000476837158f;
    _1078 = ((_1067 * (select((_1038 < 0.040449999272823334f), (_1038 * 0.07739938050508499f), exp2(log2((_1038 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1024)) + _1024) * 1.2000000476837158f;
    _1079 = ((_1067 * (select((_1039 < 0.040449999272823334f), (_1039 * 0.07739938050508499f), exp2(log2((_1039 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1025)) + _1025) * 1.2000000476837158f;
    _1080 = WaveReadLaneFirst(_materialIndex);
    _1090 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1080 < (uint)170000), _1080, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._centerGlowColor.x);
    _1091 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1080 < (uint)170000), _1080, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._centerGlowColor.y);
    _1092 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1080 < (uint)170000), _1080, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._centerGlowColor.z);
    _1121 = WaveReadLaneFirst(_materialIndex);
    _1129 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1121 < (uint)170000), _1121, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._centerGlowRadius);
    _1130 = _1129 * ((sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 5.0f) * 0.050000011920928955f) + 0.949999988079071f);
    _1131 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) - _133;
    _1132 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _134;
    _1133 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) - _135;
    _1134 = dot(float3(_1131, _1132, _1133), float3(_124, _125, _126));
    _1139 = (_1134 * _1134) - (dot(float3(_1131, _1132, _1133), float3(_1131, _1132, _1133)) - (_1130 * _1130));
    if (!(_1139 < 0.0f)) {
      _1146 = ((-0.0f - _1134) - sqrt(_1139));
    } else {
      _1146 = 0.0f;
    }
    if ((_1146 > 0.0f) && (_1146 < _1026)) {
      _1151 = 50.0f / _1130;
      _1152 = _1131 / _1130;
      _1153 = _1132 / _1130;
      _1154 = _1133 / _1130;
      _1155 = dot(float3(_124, _125, _126), float3(_1152, _1153, _1154));
      _1157 = dot(float3(_1152, _1153, _1154), float3(_1152, _1153, _1154)) + -1.0f;
      _1159 = (_1155 * _1155) - _1157;
      if (!(_1159 < 0.0f)) {
        _1162 = sqrt(_1159);
        _1164 = (-0.0f - _1155) - _1162;
        _1165 = _1162 - _1155;
        if (!((_1165 < 0.0f) || (_1164 > _1151))) {
          _1170 = max(_1164, 0.0f);
          _1171 = min(_1165, _1151);
          _1184 = ((((-0.0f - _1157) - (_1171 * _1155)) + ((_1171 * _1171) * -0.3333333432674408f)) * _1171) + (((((_1170 * 0.3333333432674408f) + _1155) * _1170) + _1157) * _1170);
          _1185 = _1184 * 0.75f;
          if (_1185 > 0.0f) {
            _1188 = _1185 * _1185;
            _1190 = _1185 * (_1188 * _1188);
            _1191 = _1190 * _1190;
            _1193 = (_1191 * _1191) * 5.0f;
            _1197 = _1185 * _1184;
            _1199 = _1197 * 0.22500000894069672f;
            _1207 = (((_1193 * select((_1090 < 0.040449999272823334f), (_1090 * 0.07739938050508499f), exp2(log2((_1090 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1077) + (_1197 * 0.07500000298023224f));
            _1208 = (((_1193 * select((_1091 < 0.040449999272823334f), (_1091 * 0.07739938050508499f), exp2(log2((_1091 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1078) + _1199);
            _1209 = (((_1193 * select((_1092 < 0.040449999272823334f), (_1092 * 0.07739938050508499f), exp2(log2((_1092 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1079) + _1199);
          } else {
            _1207 = _1077;
            _1208 = _1078;
            _1209 = _1079;
          }
        } else {
          _1207 = _1077;
          _1208 = _1078;
          _1209 = _1079;
        }
      } else {
        _1207 = _1077;
        _1208 = _1078;
        _1209 = _1079;
      }
    } else {
      _1207 = _1077;
      _1208 = _1078;
      _1209 = _1079;
    }
    _1213 = WaveReadLaneFirst(_materialIndex);
    _1221 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1213 < (uint)170000), _1213, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._tunnelTotal);
    _1259 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y;
    _1260 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y;
    _1261 = _1259 * 1.5f;
    _1262 = _1260 * 1.5f;
    _1266 = sqrt((_1262 * _1262) + (_1261 * _1261));
    _1278 = frac((sin((_1260 * 0.15000000596046448f) + (_1259 * 25.5f)) * 10000.0f) * (abs(sin((_1260 * 19.5f) + _1261)) + 0.10000000149011612f));
    _1281 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.5f;
    _1282 = (_1259 * 22.5f) + _1281;
    _1283 = (_1260 * 22.5f) + _1281;
    _1284 = floor(_1282);
    _1285 = floor(_1283);
    _1286 = frac(_1282);
    _1287 = frac(_1283);
    _1288 = _1284 * 17.0f;
    _1289 = _1285 * 0.10000000149011612f;
    _1293 = _1285 * 13.0f;
    _1299 = frac((sin(_1289 + _1288) * 10000.0f) * (abs(sin(_1293 + _1284)) + 0.10000000149011612f));
    _1300 = _1284 + 1.0f;
    _1301 = _1300 * 17.0f;
    _1310 = frac((sin(_1301 + _1289) * 10000.0f) * (abs(sin(_1293 + _1300)) + 0.10000000149011612f));
    _1311 = _1285 + 1.0f;
    _1312 = _1311 * 0.10000000149011612f;
    _1316 = _1311 * 13.0f;
    _1338 = (_1286 * _1286) * (3.0f - (_1286 * 2.0f));
    _1350 = (lerp(_1299, _1310, _1338)) + (((_1287 * _1287) * (3.0f - (_1287 * 2.0f))) * (((frac((sin(_1312 + _1301) * 10000.0f) * (abs(sin(_1316 + _1300)) + 0.10000000149011612f)) - _1310) * _1338) + ((frac((sin(_1312 + _1288) * 10000.0f) * (abs(sin(_1316 + _1284)) + 0.10000000149011612f)) - _1299) * (1.0f - _1338))));
    _1351 = WaveReadLaneFirst(_materialIndex);
    _1359 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1351 < (uint)170000), _1351, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._anamorphicWidth);
    _1361 = (_1359 * 0.8999999761581421f) + 0.10999999940395355f;
    _1365 = saturate((_1266 - _1361) / (-0.0f - _1361));
    _1371 = saturate((cos(_1261) * 0.4000000059604645f) + -1.0f);
    _1375 = (_1371 * _1371) * (3.0f - (_1371 * 2.0f));
    _1383 = saturate(((abs(_1375 + _1262) + -0.03999999910593033f) + abs(_1262 - _1375)) * -25.0f);
    _1386 = _1365 * _1383;
    _1389 = ((3.0f - (_1383 * 2.0f)) * (3.0f - (_1365 * 2.0f))) * (_1386 * _1386);
    _1391 = (_1359 * 0.5f) + 0.11999999731779099f;
    _1392 = _1261 + -0.07999999821186066f;
    _1393 = _1262 + 0.004999999888241291f;
    _1401 = saturate((sqrt((_1393 * _1393) + (_1392 * _1392)) - _1391) / (-0.0f - _1391));
    _1407 = saturate((cos(_1392) * 0.4000000059604645f) + -1.0f);
    _1411 = (_1407 * _1407) * (3.0f - (_1407 * 2.0f));
    _1419 = saturate(((abs(_1411 + _1393) + -0.017999999225139618f) + abs(_1393 - _1411)) * -55.55555725097656f);
    _1422 = _1401 * _1419;
    _1425 = ((3.0f - (_1419 * 2.0f)) * (3.0f - (_1401 * 2.0f))) * (_1422 * _1422);
    _1427 = (_1359 * 0.699999988079071f) + 0.12999999523162842f;
    _1428 = _1261 + 0.09000000357627869f;
    _1429 = _1262 + -0.004999999888241291f;
    _1437 = saturate((sqrt((_1429 * _1429) + (_1428 * _1428)) - _1427) / (-0.0f - _1427));
    _1443 = saturate((cos(_1428) * 0.4000000059604645f) + -1.0f);
    _1447 = (_1443 * _1443) * (3.0f - (_1443 * 2.0f));
    _1455 = saturate(((abs(_1447 + _1429) + -0.014299999922513962f) + abs(_1429 - _1447)) * -69.93006896972656f);
    _1458 = _1437 * _1455;
    _1462 = _1259 * 2.25f;
    _1463 = _1260 * 2.25f;
    _1466 = (_1350 * 0.07999999821186066f) + 0.15000000596046448f;
    _1470 = saturate((abs(_1463) - _1466) / (-0.0f - _1466));
    _1474 = sqrt((_1463 * _1463) + (_1462 * _1462));
    _1477 = saturate((_1474 + -0.800000011920929f) * -0.7692307829856873f);
    _1491 = max(0.8999999761581421f, frac(frac((sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 8.550000190734863f) * 10000.0f) * (abs(sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 7.0f)) + 0.10000000149011612f)))) * 0.07999999821186066f;
    _1496 = saturate(((_1474 + -0.10000000149011612f) - _1491) / (-0.12000000476837158f - _1491));
    _1507 = saturate(((abs(_1462) * abs(_1260 * 1.6875f)) + -0.07000000029802322f) * -5.882352828979492f);
    _1511 = (_1470 * _1477) * _1507;
    _1517 = (((3.0f - (_1477 * 2.0f)) * (15.0f - (_1470 * 10.0f))) * (3.0f - (_1507 * 2.0f))) * (_1511 * _1511);
    _1521 = _1350 * -0.014999999664723873f;
    _1522 = _1521 + (_1259 * 2.8499999046325684f);
    _1523 = _1521 + (_1260 * 2.8499999046325684f);
    _1527 = sqrt((_1522 * _1522) + (_1523 * _1523));
    _1530 = saturate((_1527 + -1.0f) * -1.4285714626312256f);
    _1538 = saturate(((((_1530 * _1530) * _1527) * (3.0f - (_1530 * 2.0f))) + -0.10000000149011612f) * 2.5f);
    _1542 = atan(_1262 / _1261);
    _1545 = (_1261 < 0.0f);
    _1546 = (_1261 == 0.0f);
    _1547 = (_1262 >= 0.0f);
    _1548 = (_1262 < 0.0f);
    _1563 = atan(_1262 / (-0.0f - _1261));
    _1566 = (_1261 > -0.0f);
    _1567 = (_1261 == -0.0f);
    _1584 = saturate(-0.0f - (_1266 + -1.0f));
    _1589 = WaveReadLaneFirst(_materialIndex);
    _1597 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1589 < (uint)170000), _1589, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._blubIntensity);
    _1610 = WaveReadLaneFirst(_materialIndex);
    _1618 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1610 < (uint)170000), _1610, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._middleHaloIntensity);
    _1621 = (((lerp(_1278, 1.0f, 0.9700000286102295f)) * 0.8999999761581421f) * exp2(log2(((abs(sin(select((_1567 && _1547), 1.3566371202468872f, select((_1567 && _1548), -1.1566370725631714f, ((select((_1566 && _1548), (_1563 + -3.1415927410125732f), select((_1566 && _1547), (_1563 + 3.1415927410125732f), _1563)) * 0.800000011920929f) + 0.10000000149011612f))))) + abs(sin(select((_1546 && _1547), 1.2995574474334717f, select((_1546 && _1548), -0.8995574116706848f, ((select((_1545 && _1548), (_1542 + -3.1415927410125732f), select((_1545 && _1547), (_1542 + 3.1415927410125732f), _1542)) * 0.699999988079071f) + 0.20000000298023224f)))))) * 0.5f) * (((_1584 * _1584) * (3.0f - (_1584 * 2.0f))) - ((((_1538 * _1538) * 0.4000000059604645f) * (3.0f - (_1538 * 2.0f))) * _1597))) * 2.5f)) * _1618;
    _1643 = WaveReadLaneFirst(_materialIndex);
    _1651 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1643 < (uint)170000), _1643, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._centerpoint);
    _1652 = WaveReadLaneFirst(_materialIndex);
    _1660 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1652 < (uint)170000), _1652, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._streakGlowIntensity);
    _1661 = (_1517 * _1517) * _1660;
    _1664 = ((_1496 * _1496) * (3.0f - (_1496 * 2.0f))) * _1651;
    _1670 = exp2(log2(_1664 * 1.2000000476837158f) * 5.0f);
    _1675 = exp2(log2(_1664 * 1.100000023841858f) * 24.0f);
    _1685 = _1670 + (_1664 * 0.20000000298023224f);
    _1687 = (_1661 * 0.04965713247656822f) + (_1389 * 0.010022826492786407f);
    _1693 = (((3.0f - (_1455 * 2.0f)) * (3.0f - (_1437 * 2.0f))) * (_1458 * _1458)) + _1425;
    _1715 = WaveReadLaneFirst(_materialIndex);
    _1723 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_1715 < (uint)170000), _1715, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._anamorphicIntensity);
    _1733 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1749 = __3__36__0__0__g_CustomRenderPassValue.GatherRed(__0__4__0__0__g_staticPointClamp, float2((TEXCOORD.x - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].z) * 0.5f)), (TEXCOORD.y - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].w) * 0.5f))));
    _1754 = _1749.x & 255;
    _1755 = _1749.y & 255;
    _1756 = _1749.z & 255;
    _1757 = _1749.w & 255;
    if ((_1754 == _renderPassSelfPlayer) | (_1754 == _renderPassTest)) {
      if ((_1755 == _renderPassSelfPlayer) | (_1755 == _renderPassTest)) {
        if ((_1756 == _renderPassSelfPlayer) | (_1756 == _renderPassTest)) {
          if (!(_1757 == _renderPassSelfPlayer)) {
            _1784 = (_1757 == _renderPassTest);
          } else {
            _1784 = true;
          }
        } else {
          _1784 = false;
        }
      } else {
        _1784 = false;
      }
    } else {
      _1784 = false;
    }
    _1786 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _1796 = (pow(_1786.x, 0.012683313339948654f));
    _1797 = (pow(_1786.y, 0.012683313339948654f));
    _1798 = (pow(_1786.z, 0.012683313339948654f));
    _1826 = 10000.0f - (saturate(_353 * 7.0f) * 9950.0f);
    _1827 = _1826 * exp2(log2(max(0.0f, (_1796 + -0.8359375f)) / (18.8515625f - (_1796 * 18.6875f))) * 6.277394771575928f);
    _1828 = _1826 * exp2(log2(max(0.0f, (_1797 + -0.8359375f)) / (18.8515625f - (_1797 * 18.6875f))) * 6.277394771575928f);
    _1829 = _1826 * exp2(log2(max(0.0f, (_1798 + -0.8359375f)) / (18.8515625f - (_1798 * 18.6875f))) * 6.277394771575928f);
    if (!_1784) {
      _1833 = saturate(_1022);
    } else {
      _1833 = 0.0f;
    }
    _1840 = (_1833 * (max(0.0f, (_1733 * (((_1221 * saturate(_1207)) + ((_321 * 0.5f) * _332)) + (_1723 * exp2(log2(((((_1687 + (_1425 * 0.033104754984378815f)) + (((_1621 * 0.16689524054527283f) + 0.033104754984378815f) * _1621)) + _1675) + (_1685 * 0.07323896884918213f)) * 2.0f)))))) - _1827)) + _1827;
    _1841 = (_1833 * (max(0.0f, (_1733 * (((_1221 * saturate(_1208)) + ((_322 * 0.699999988079071f) * _332)) + (_1723 * exp2(log2(((((_1687 + (_1693 * 0.033104754984378815f)) + ((0.07323896884918213f - (_1621 * 0.02323896810412407f)) * _1621)) + _1675) + (_1685 * 0.21404112875461578f)) * 2.0f)))))) - _1828)) + _1828;
    _1842 = (_1833 * (max(0.0f, (_1733 * (((_1221 * saturate(_1209)) + ((_323 * 0.8999999761581421f) * _332)) + (_1723 * exp2(log2((((((((_1693 * 0.07323896884918213f) + (_1389 * 0.033104754984378815f)) + ((0.13286834955215454f - (_1621 * 0.08286835253238678f)) * _1621)) + (_1664 * 0.06370936334133148f)) + (_1661 * 0.1098584532737732f)) + (_1670 * 0.6038274168968201f)) + _1675) * 2.0f)))))) - _1829)) + _1829;
    if (!_1784) {
      _1846 = saturate(_1022);
    } else {
      _1846 = 1.0f;
    }
    _1847 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _1860 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1847, 0)))).x) & 127))) + 0.5f);
    } else {
      _1860 = _1846;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_1840, _1841, _1842));
      _2280 = output_color.x;
      _2281 = output_color.y;
      _2282 = output_color.z;
    } else {
      _2280 = _1840;
      _2281 = _1841;
      _2282 = _1842;
    }
    if (_etcParams.y > 1.0f) {
      _2291 = abs(_79);
      _2292 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      _2296 = saturate(1.0f - (dot(float2(_2291, _2292), float2(_2291, _2292)) * saturate(_etcParams.y + -1.0f)));
      _2301 = (_2296 * _2280);
      _2302 = (_2296 * _2281);
      _2303 = (_2296 * _2282);
    } else {
      _2301 = _2280;
      _2302 = _2281;
      _2303 = _2282;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _2336 = select((_2301 <= 0.0031308000907301903f), (_2301 * 12.920000076293945f), (((pow(_2301, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2337 = select((_2302 <= 0.0031308000907301903f), (_2302 * 12.920000076293945f), (((pow(_2302, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2338 = select((_2303 <= 0.0031308000907301903f), (_2303 * 12.920000076293945f), (((pow(_2303, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2336 = _2301;
      _2337 = _2302;
      _2338 = _2303;
    }
    if (!(_etcParams.y < 1.0f)) {
      _2343 = float((uint)_1847);
      if (!(_2343 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_2343 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _2352 = _2336;
          _2353 = _2337;
          _2354 = _2338;
        } else {
          _2352 = 0.0f;
          _2353 = 0.0f;
          _2354 = 0.0f;
        }
      } else {
        _2352 = 0.0f;
        _2353 = 0.0f;
        _2354 = 0.0f;
      }
    } else {
      _2352 = _2336;
      _2353 = _2337;
      _2354 = _2338;
    }
    _2364 = exp2(log2(_2352 * 9.999999747378752e-05f) * 0.1593017578125f);
    _2365 = exp2(log2(_2353 * 9.999999747378752e-05f) * 0.1593017578125f);
    _2366 = exp2(log2(_2354 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_2364 * 18.6875f) + 1.0f)) * ((_2364 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_2365 * 18.6875f) + 1.0f)) * ((_2365 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_2366 * 18.6875f) + 1.0f)) * ((_2366 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _1860;
    break;
  }
  return SV_Target;
}