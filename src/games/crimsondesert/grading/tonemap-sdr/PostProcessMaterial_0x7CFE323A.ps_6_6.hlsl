#include "../tonemap.hlsli"

struct PostProcessAimHighlight_CDStruct {
  float _aimHighlightProgress;
  float _aimHighlightBackground;
  uint _noiseTex;
  uint _auraTex;
  float _radius;
  float _squareSize;
  float _maskThreshold;
  uint _aimGimmickColor;
  uint _aimHighlightColor;
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

struct BindlessParameters_PostProcessAimHighlight_CD {
  PostProcessAimHighlight_CDStruct BindlessParameters_PostProcessAimHighlight_CD;
};

typedef BindlessParameters_PostProcessAimHighlight_CD BindlessParameters_PostProcessAimHighlight_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAimHighlight_CD_t> BindlessParameters_PostProcessAimHighlight_CD[] : register(b0, space100);

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
  float _138;
  float _139;
  float _142;
  float _143;
  float _401;
  float _402;
  float _511;
  float _512;
  float _513;
  float _514;
  int _515;
  float _520;
  float _521;
  float _522;
  float _523;
  int _524;
  float _529;
  float _530;
  float _531;
  float _532;
  int _533;
  float _675;
  float _676;
  float _677;
  int _678;
  float _821;
  float _822;
  float _823;
  float _899;
  float _900;
  float _901;
  float _902;
  float _903;
  float _904;
  float _905;
  bool _966;
  float _983;
  float _984;
  float _985;
  float _995;
  float _1359;
  float _1360;
  float _1361;
  float _1362;
  float _1461;
  float _1462;
  float _1763;
  float _1764;
  float _1765;
  float _1806;
  float _1807;
  float _1808;
  float _1809;
  float _1860;
  float _2065;
  float _2066;
  float _2067;
  float _2160;
  float _2161;
  float _2162;
  float _2282;
  float _2283;
  float _2284;
  float _2305;
  float _2306;
  float _2307;
  float _2340;
  float _2341;
  float _2342;
  float _2356;
  float _2357;
  float _2358;
  int _51;
  float _59;
  int _62;
  float _70;
  int _73;
  float _81;
  int _82;
  float _90;
  float _91;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _104;
  float _109;
  float _113;
  float _122;
  float _124;
  float _128;
  float _132;
  float _157;
  float4 _167;
  float _180;
  float _181;
  float _182;
  float _184;
  float _185;
  float _186;
  float _187;
  float _189;
  float _191;
  float _192;
  float _228;
  float _229;
  float _230;
  float _231;
  float _267;
  float _268;
  float _269;
  float _270;
  float _272;
  float _273;
  float _274;
  float _275;
  float4 _278;
  float _288;
  float _289;
  float _290;
  float _315;
  float _316;
  float _317;
  float _318;
  float _319;
  float _320;
  int _325;
  int _333;
  float4 _340;
  int _345;
  float _353;
  float _354;
  float _357;
  float _358;
  uint2 _360;
  uint _375;
  int _377;
  float _385;
  float _386;
  float _388;
  float _389;
  float _390;
  float _404;
  float _405;
  float _406;
  float _407;
  float _409;
  int _413;
  float _421;
  int _422;
  float _430;
  float _433;
  float _436;
  float _437;
  float _438;
  float _439;
  float _440;
  float _441;
  float _442;
  float _443;
  float _444;
  float _445;
  float _448;
  float _451;
  float _454;
  float _457;
  float _460;
  float _463;
  float _470;
  float _471;
  float _472;
  float _479;
  float _480;
  float _481;
  float _484;
  float _487;
  float _490;
  int _495;
  float _503;
  float _504;
  float _505;
  float _506;
  float _507;
  float _508;
  float _509;
  int _517;
  int _526;
  float _534;
  float _535;
  float _536;
  float _540;
  float _541;
  float _542;
  float _557;
  float _564;
  float _565;
  float _566;
  float _577;
  bool _578;
  float _579;
  float _580;
  float _581;
  float _582;
  int _583;
  float _593;
  float _594;
  float _595;
  float _623;
  float _628;
  float _629;
  float _634;
  float _635;
  float _636;
  float _645;
  float _647;
  float _648;
  float _650;
  float _652;
  float _653;
  float _654;
  float _660;
  float _661;
  float _682;
  float _683;
  float _684;
  float4 _689;
  float4 _693;
  float _703;
  float _704;
  float _705;
  int _733;
  float _741;
  float _743;
  float _750;
  float _751;
  float _752;
  int _755;
  float4 _760;
  float _770;
  float _771;
  float _772;
  int _800;
  float _808;
  float _810;
  int _824;
  float _832;
  int _838;
  float _846;
  float _849;
  int _874;
  int _882;
  float4 _889;
  float _892;
  float _894;
  float _897;
  float _910;
  float _911;
  float _912;
  float _913;
  float _922;
  float _923;
  float _925;
  float4 _933;
  float _942;
  float _943;
  float _944;
  float _945;
  float _952;
  float _972;
  float _975;
  float _999;
  float _1000;
  float _1001;
  float4 _1004;
  int _1006;
  float _1014;
  float _1029;
  float _1030;
  float _1031;
  float _1037;
  float _1040;
  int _1051;
  uint _1057;
  uint _1058;
  uint4 _1060;
  float4 _1063;
  float _1081;
  float _1082;
  float _1083;
  float _1085;
  float _1086;
  float _1087;
  float _1088;
  float _1091;
  float _1092;
  float _1095;
  float _1096;
  float _1100;
  float _1102;
  float _1103;
  float _1104;
  float _1105;
  float _1107;
  float _1110;
  float _1111;
  float _1112;
  float _1113;
  float _1122;
  float _1126;
  float _1130;
  float _1132;
  float _1145;
  float _1148;
  float _1153;
  float _1168;
  float _1169;
  float _1170;
  float _1181;
  float _1187;
  float _1190;
  float _1193;
  float _1194;
  float _1195;
  float _1196;
  float _1205;
  float _1214;
  float _1223;
  float _1225;
  float _1237;
  float _1243;
  float _1246;
  float _1249;
  int _1250;
  float _1264;
  float _1265;
  float _1266;
  float _1294;
  float _1295;
  float _1299;
  float _1309;
  float _1310;
  float _1311;
  float _1323;
  float _1329;
  float _1331;
  float _1338;
  float _1339;
  float _1347;
  float _1352;
  float _1365;
  float _1366;
  float _1381;
  float _1382;
  float _1383;
  float _1399;
  float _1400;
  float _1401;
  float _1412;
  float _1417;
  float _1418;
  uint2 _1420;
  uint _1435;
  float _1445;
  float _1446;
  float _1448;
  float _1449;
  float _1450;
  float _1464;
  float _1465;
  float _1466;
  float _1467;
  float _1469;
  float _1470;
  float _1471;
  float _1472;
  int _1473;
  int _1481;
  float _1484;
  float _1487;
  float _1489;
  float _1514;
  float _1515;
  float _1516;
  int _1517;
  int _1525;
  float _1528;
  float _1531;
  float _1533;
  float _1534;
  float _1535;
  float _1539;
  int _1590;
  int _1598;
  float4 _1605;
  float _1619;
  float _1655;
  float _1672;
  float _1673;
  float _1674;
  float _1684;
  float _1693;
  float _1694;
  float _1707;
  float _1736;
  float _1737;
  float _1739;
  float _1801;
  float _1812;
  int _1817;
  float _1825;
  int _1827;
  float _1835;
  float _1837;
  float _1844;
  float _1845;
  float _1846;
  uint _1847;
  float _1869;
  float _1918;
  float _1919;
  float _1920;
  float _1922;
  float _1929;
  float _1930;
  float _1931;
  float _1950;
  float _1951;
  float _1952;
  float _1953;
  float _1954;
  float _1955;
  float _1956;
  float _1957;
  float _1958;
  float _2004;
  float _2005;
  float _2006;
  float _2007;
  float _2008;
  float _2009;
  float _2010;
  float _2027;
  float _2028;
  float _2029;
  float _2030;
  float _2036;
  float _2039;
  float _2046;
  float _2047;
  float _2048;
  float _2077;
  float _2102;
  float _2103;
  float _2104;
  float _2123;
  float _2124;
  float _2125;
  float _2131;
  float _2135;
  float _2136;
  float _2137;
  float _2138;
  float _2143;
  float _2168;
  float _2172;
  float _2173;
  float _2174;
  float _2175;
  int _2216;
  float _2271;
  float _2295;
  float _2296;
  float _2300;
  float _2347;
  float _2368;
  float _2369;
  float _2370;
  int __loop_jump_target = -1;
  float _28[36];
  _34 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _40 = WaveReadLaneFirst(_materialIndex);
  _48 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._fishEyeMaxPower);
  bool __branch_chain_0;
  if (_48 > 0.0010000000474974513f) {
    __branch_chain_0 = true;
  } else {
    _51 = WaveReadLaneFirst(_materialIndex);
    _59 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_51 < (uint)170000), _51, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._fishEyeMaxPower);
    if (_59 < -0.0010000000474974513f) {
      __branch_chain_0 = true;
    } else {
      _142 = TEXCOORD.x;
      _143 = TEXCOORD.y;
      __branch_chain_0 = false;
    }
  }
  if (__branch_chain_0) {
    _62 = WaveReadLaneFirst(_materialIndex);
    _70 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
    if (!(_70 < 0.0010000000474974513f)) {
      _73 = WaveReadLaneFirst(_materialIndex);
      _81 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._fishEyeMaxPower);
      _82 = WaveReadLaneFirst(_materialIndex);
      _90 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
      _91 = _90 * _81;
      _96 = 0.5f / _34;
      _97 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
      _98 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _96;
      _99 = dot(float2(_97, _98), float2(_97, _98));
      _100 = sqrt(_99);
      if (_91 > 0.0f) {
        _104 = sqrt(dot(float2(0.5f, _96), float2(0.5f, _96)));
        _109 = tan(_100 * _91) * (rsqrt(_99) * _104);
        _113 = tan(_104 * _91);
        _138 = (((_109 * _97) / _113) + 0.5f);
        _139 = (((_109 * _98) / _113) + _96);
      } else {
        if (_91 < 0.0f) {
          _122 = select((_34 < 1.0f), 0.5f, _96);
          _124 = _91 * -10.0f;
          _128 = atan(_100 * _124) * (rsqrt(_99) * _122);
          _132 = atan(_122 * _124);
          _138 = (((_128 * _97) / _132) + 0.5f);
          _139 = (((_128 * _98) / _132) + _96);
        } else {
          _138 = 0.0f;
          _139 = 0.0f;
        }
      }
      _142 = _138;
      _143 = (_139 * _34);
    } else {
      _142 = TEXCOORD.x;
      _143 = TEXCOORD.y;
    }
  }
  _157 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_142, _143));
  _167 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _142)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _143)), 0));
  _180 = (saturate(_167.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _181 = (saturate(_167.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _182 = (saturate(_167.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _184 = rsqrt(dot(float3(_180, _181, _182), float3(_180, _181, _182)));
  _185 = _184 * _180;
  _186 = _184 * _181;
  _187 = _182 * _184;
  _189 = (_142 * 2.0f) + -1.0f;
  _191 = 1.0f - (_143 * 2.0f);
  _192 = max(1.0000000116860974e-07f, _157.x);
  _228 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _229 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _228;
  _230 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _228;
  _231 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _228;
  _267 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _268 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _267;
  _269 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _267;
  _270 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _192, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _267;
  _272 = rsqrt(dot(float3(_268, _269, _270), float3(_268, _269, _270)));
  _273 = _272 * _268;
  _274 = _272 * _269;
  _275 = _272 * _270;
  _278 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_142, _143));
  _288 = (pow(_278.x, 0.012683313339948654f));
  _289 = (pow(_278.y, 0.012683313339948654f));
  _290 = (pow(_278.z, 0.012683313339948654f));
  _315 = exp2(log2(max(0.0f, (_288 + -0.8359375f)) / (18.8515625f - (_288 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _316 = exp2(log2(max(0.0f, (_289 + -0.8359375f)) / (18.8515625f - (_289 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _317 = exp2(log2(max(0.0f, (_290 + -0.8359375f)) / (18.8515625f - (_290 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _318 = 4.0f / _34;
  _319 = _318 * _142;
  _320 = _318 * _143;
  _325 = WaveReadLaneFirst(_materialIndex);
  _333 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_325 < (uint)170000), _325, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
  _340 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_333 < (uint)65000), _333, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_319, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _320)));
  _345 = WaveReadLaneFirst(_materialIndex);
  _353 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_345 < (uint)170000), _345, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _354 = _353 * (_340.y + -0.30000001192092896f);
  _357 = (_354 * 0.0010000000474974513f) + _142;
  _358 = (_354 * 0.019999999552965164f) + _143;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_360.x, _360.y);
  _375 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_360.x)))))) + 0.5f) * _357), int((float((int)(int(float((int)((int)(_360.y)))))) + 0.5f) * _358), 0));
  _377 = _375.x & 255;
  _385 = (float((uint)((uint)((uint)((uint)(_375.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _386 = (float((uint)((uint)(((uint)((uint)(_375.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _388 = 1.0f - abs(_385);
  _389 = abs(_386);
  _390 = _388 - _389;
  if (_390 < 0.0f) {
    _401 = (select((_385 >= 0.0f), 1.0f, -1.0f) * (1.0f - _389));
    _402 = (select((_386 >= 0.0f), 1.0f, -1.0f) * _388);
  } else {
    _401 = _385;
    _402 = _386;
  }
  _404 = rsqrt(dot(float3(_401, _402, _390), float3(_401, _402, _390)));
  _405 = _404 * _401;
  _406 = _404 * _402;
  _407 = _404 * _390;
  _409 = rsqrt(dot(float3(_405, _406, _407), float3(_405, _406, _407)));
  _413 = WaveReadLaneFirst(_materialIndex);
  _421 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_413 < (uint)170000), _413, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._radius);
  _422 = WaveReadLaneFirst(_materialIndex);
  _430 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_422 < (uint)170000), _422, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _433 = saturate(1.0f - _430) * _421;
  if (!(_433 < 0.0010000000474974513f)) {
    _436 = ddx_coarse(_273);
    _437 = ddx_coarse(_274);
    _438 = ddx_coarse(_275);
    _439 = ddy_coarse(_273);
    _440 = ddy_coarse(_274);
    _441 = ddy_coarse(_275);
    _442 = ddx_coarse(_142);
    _443 = ddx_coarse(_143);
    _444 = ddy_coarse(_142);
    _445 = ddy_coarse(_143);
    _448 = (_440 * _187) - (_441 * _186);
    _451 = (_441 * _185) - (_439 * _187);
    _454 = (_439 * _186) - (_440 * _185);
    _457 = (_438 * _186) - (_437 * _187);
    _460 = (_436 * _187) - (_438 * _185);
    _463 = (_437 * _185) - (_436 * _186);
    _470 = (_444 * _457) + (_448 * _442);
    _471 = (_444 * _460) + (_451 * _442);
    _472 = (_444 * _463) + (_454 * _442);
    _479 = (_445 * _457) + (_448 * _443);
    _480 = (_445 * _460) + (_451 * _443);
    _481 = (_445 * _463) + (_443 * _454);
    _484 = max(dot(float3(_470, _471, _472), float3(_470, _471, _472)), dot(float3(_479, _480, _481), float3(_479, _480, _481)));
    _487 = rsqrt(select((_484 != 0.0f), _484, 0.10000000149011612f));
    _490 = _487 * _273;
    _495 = WaveReadLaneFirst(_materialIndex);
    _503 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_495 < (uint)170000), _495, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._squareSize);
    _504 = _503 * _229;
    _505 = _503 * _230;
    _506 = _503 * _231;
    _507 = floor(_504);
    _508 = floor(_505);
    _509 = floor(_506);
    _511 = 10.0f;
    _512 = 0.0f;
    _513 = 0.0f;
    _514 = 0.0f;
    _515 = -1;
    while(true) {
      _520 = _511;
      _521 = _512;
      _522 = _513;
      _523 = _514;
      _524 = -1;
      while(true) {
        _529 = _520;
        _530 = _521;
        _531 = _522;
        _532 = _523;
        _533 = -1;
        while(true) {
          _534 = float((int)(_533));
          _535 = float((int)(_524));
          _536 = float((int)(_515));
          _540 = sin(_534 + _507);
          _541 = sin(_535 + _508);
          _542 = sin(_536 + _509);
          _557 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _564 = sin(_557 * frac(sin(dot(float3(_540, _541, _542), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _534;
          _565 = sin(_557 * frac(sin(dot(float3(_540, _541, _542), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _535;
          _566 = sin(_557 * frac(sin(dot(float3(_540, _541, _542), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _536;
          _577 = max(abs((_507 - _504) + _564), max(abs((_508 - _505) + _565), abs((_509 - _506) + _566)));
          _578 = (_577 < _529);
          _579 = select(_578, _577, _529);
          _580 = select(_578, _564, _530);
          _581 = select(_578, _565, _531);
          _582 = select(_578, _566, _532);
          _583 = _533 + 1;
          if (!(_583 == 2)) {
            _529 = _579;
            _530 = _580;
            _531 = _581;
            _532 = _582;
            _533 = _583;
            continue;
          }
          while(true) {
            _526 = _524 + 1;
            if (!(_526 == 2)) {
              _520 = _579;
              _521 = _580;
              _522 = _581;
              _523 = _582;
              _524 = _526;
              __loop_jump_target = 519;
              break;
            }
            while(true) {
              _517 = _515 + 1;
              if (!(_517 == 2)) {
                _511 = _579;
                _512 = _580;
                _513 = _581;
                _514 = _582;
                _515 = _517;
                __loop_jump_target = 510;
                break;
              }
              _593 = (_580 + _507) / _503;
              _594 = (_581 + _508) / _503;
              _595 = (_582 + _509) / _503;
              _623 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _595, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _594, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _593))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
              _628 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _595, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _594, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _593))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _623) * 0.5f) + 0.5f;
              _629 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _595, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _594, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _593))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _623) * 0.5f);
              _634 = _593 - _mainPosition.x;
              _635 = _594 - _mainPosition.y;
              _636 = _595 - _mainPosition.z;
              _645 = saturate(1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _433)) * sqrt(dot(float3(_634, _635, _636), float3(_634, _635, _636))))) * 1.0152283906936646f));
              _647 = 1.0f - saturate(_645);
              _648 = _645 * 0.5f;
              _650 = (_142 - _628) / _647;
              _652 = (_143 - _629) / _647;
              _653 = sin(_648);
              _654 = cos(_648);
              _660 = mad((-0.0f - _653), _652, (_654 * _650)) + _628;
              _661 = mad(_654, _652, (_653 * _650)) + _629;
              _675 = 0.0f;
              _676 = 0.0f;
              _677 = 0.0f;
              _678 = 1;
              while(true) {
                _682 = (float((int)(6 - _678)) * 0.1666666716337204f) * ((saturate(_157.x * 1.5f) * 0.5f) * saturate(frac(sin(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_142)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_143))))), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + 0.5f));
                _683 = _682 * mad((_487 * _472), _275, mad((_487 * _471), _274, (_490 * _470)));
                _684 = _682 * mad((_487 * _481), _275, mad((_487 * _480), _274, (_490 * _479)));
                _689 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_683 + _142), (_684 + _143)));
                _693 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_683 + _660), (_684 + _661)));
                _703 = (pow(_693.x, 0.012683313339948654f));
                _704 = (pow(_693.y, 0.012683313339948654f));
                _705 = (pow(_693.z, 0.012683313339948654f));
                _733 = WaveReadLaneFirst(_materialIndex);
                _741 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_733 < (uint)170000), _733, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._maskThreshold);
                _743 = float((bool)(uint)(_689.w < _741));
                _750 = (_743 * ((exp2(log2(max(0.0f, (_703 + -0.8359375f)) / (18.8515625f - (_703 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _675)) + _675;
                _751 = (_743 * ((exp2(log2(max(0.0f, (_704 + -0.8359375f)) / (18.8515625f - (_704 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _676)) + _676;
                _752 = (_743 * ((exp2(log2(max(0.0f, (_705 + -0.8359375f)) / (18.8515625f - (_705 * 18.6875f))) * 6.277394771575928f) * 4000.0f) - _677)) + _677;
                if (!(_689.w > 0.8999999761581421f)) {
                  _755 = _678 + 1;
                  if ((int)_755 < (int)6) {
                    _675 = _750;
                    _676 = _751;
                    _677 = _752;
                    _678 = _755;
                    continue;
                  }
                }
                _760 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_660, _661));
                _770 = (pow(_760.x, 0.012683313339948654f));
                _771 = (pow(_760.y, 0.012683313339948654f));
                _772 = (pow(_760.z, 0.012683313339948654f));
                _800 = WaveReadLaneFirst(_materialIndex);
                _808 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_800 < (uint)170000), _800, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._maskThreshold);
                _810 = float((bool)(uint)(_689.w < _808));
                _821 = ((_810 * ((exp2(log2(max(0.0f, (_770 + -0.8359375f)) / (18.8515625f - (_770 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _750)) + _750);
                _822 = ((_810 * ((exp2(log2(max(0.0f, (_771 + -0.8359375f)) / (18.8515625f - (_771 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _751)) + _751);
                _823 = ((_810 * ((exp2(log2(max(0.0f, (_772 + -0.8359375f)) / (18.8515625f - (_772 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _752)) + _752);
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
        if (__loop_jump_target == 519) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 510) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _821 = 0.0f;
    _822 = 0.0f;
    _823 = 0.0f;
  }
  _824 = WaveReadLaneFirst(_materialIndex);
  _832 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_824 < (uint)170000), _824, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _838 = WaveReadLaneFirst(_materialIndex);
  _846 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_838 < (uint)170000), _838, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _849 = saturate((_846 * 100.0f) + -99.0f);
  if (!(_849 < 0.0010000000474974513f)) {
    if ((_377 == _renderPassSelfPlayer) | (_377 == _renderPassTest) | (_377 == _renderPassDetectRemoteCatch) | (_377 == _renderPassDetectPickedRemoteCatch)) {
      _874 = WaveReadLaneFirst(_materialIndex);
      _882 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_874 < (uint)170000), _874, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
      _889 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_882 < (uint)65000), _882, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_319 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.2199999988079071f)), (_320 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.18000000715255737f))));
      _892 = _889.x + -0.30000001192092896f;
      _894 = ((_889.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
      _897 = _892 * 0.006000000052154064f;
      _899 = _897;
      _900 = _897;
      _901 = 0.0f;
      _902 = 0.0f;
      _903 = 0.0f;
      _904 = 0.0f;
      _905 = -1.0f;
      while(true) {
        _910 = _142 - ((_899 * sin(_894)) * _905);
        _911 = _143 - ((_900 * cos(_894)) * _905);
        _912 = _910 + -0.5f;
        _913 = _911 + -0.5f;
        _922 = rsqrt(dot(float2(_912, _913), float2(_912, _913))) * ((_892 * 0.05999999865889549f) * sqrt((_912 * _912) + (_913 * _913)));
        _923 = _922 * _912;
        _925 = _922 * _913;
        _933 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_910, _911));
        _942 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_910 - _923), (_911 - _925))))).x) * 0.20000000298023224f) + _901;
        _943 = (_933.y * 0.20000000298023224f) + _902;
        _944 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_923 + _910), (_925 + _911))))).z) * 0.20000000298023224f) + _903;
        _945 = (_933.w * 0.20000000298023224f) + _904;
        _952 = _905 + 0.20000000298023224f;
        if (!(_952 > 1.0f)) {
          _899 = (_899 * 1.0099999904632568f);
          _900 = (_900 * 1.0099999904632568f);
          _901 = (_942 * 0.8999999761581421f);
          _902 = (_943 * 0.8999999761581421f);
          _903 = (_944 * 0.8999999761581421f);
          _904 = (_945 * 0.8999999761581421f);
          _905 = _952;
          continue;
        }
        if (!(_377 == _renderPassSelfPlayer)) {
          _966 = (_377 == _renderPassTest);
        } else {
          _966 = true;
        }
        _972 = saturate(_945 * 1.0800000429153442f);
        _975 = max(0.0010000000474974513f, _exposure0.x);
        _983 = ((((_942 * 0.5400000214576721f) * select(_966, 0.550000011920929f, 0.5f)) / _975) * _972);
        _984 = ((((_943 * 0.5400000214576721f) * select(_966, 0.699999988079071f, 0.800000011920929f)) / _975) * _972);
        _985 = (((_944 * 0.5400000214576721f) / _975) * _972);
        break;
      }
    } else {
      _983 = 0.0f;
      _984 = 0.0f;
      _985 = 0.0f;
    }
  } else {
    _983 = 0.0f;
    _984 = 0.0f;
    _985 = 0.0f;
  }
  if ((_377 == _renderPassSelfPlayer) | (_377 == _renderPassTest)) {
    _995 = _849;
  } else {
    _995 = saturate(_832 * 2.0f);
  }
  _999 = _317 + (_995 * (_823 - _317));
  _1000 = _316 + (_995 * (_822 - _316));
  _1001 = _315 + (_995 * (_821 - _315));
  _1004 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_142, _143), 0.0f);
  _1006 = WaveReadLaneFirst(_materialIndex);
  _1014 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1006 < (uint)170000), _1006, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightBackground);
  if (!(_1014 < 0.0010000000474974513f)) {
    if (!(_377 == _renderPassSelfPlayer)) {
      if (!(_377 == _renderPassTest)) {
        _1029 = _229 - _mainPosition.x;
        _1030 = _230 - _mainPosition.y;
        _1031 = _231 - _mainPosition.z;
        _1037 = sqrt(((_1029 * _1029) + (_1030 * _1030)) + (_1031 * _1031));
        _1040 = 1.0f - saturate(_1037 * 0.03333333507180214f);
        _1051 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _142)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _143)), 0)))).x) & 127;
        if ((uint)(_1051 + -53) < (uint)15) {
          _1057 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _357);
          _1058 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _358);
          _1060 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_1057, _1058, 0));
          _1063 = __3__36__0__0__g_gbufferNormal.Load(int3(_1057, _1058, 0));
          _1081 = (saturate(_1063.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          _1082 = (saturate(_1063.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          _1083 = (saturate(_1063.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          _1085 = rsqrt(dot(float3(_1081, _1082, _1083), float3(_1081, _1082, _1083)));
          _1086 = _1085 * _1081;
          _1087 = _1085 * _1082;
          _1088 = _1083 * _1085;
          _1091 = (float((uint)((uint)(((uint)((uint)(_1060.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          _1092 = (float((uint)((uint)(_1060.w & 255))) * 0.007843137718737125f) + -1.0f;
          _1095 = (_1091 + _1092) * 0.5f;
          _1096 = (_1091 - _1092) * 0.5f;
          _1100 = (1.0f - abs(_1095)) - abs(_1096);
          _1102 = rsqrt(dot(float3(_1095, _1096, _1100), float3(_1095, _1096, _1100)));
          _1103 = _1102 * _1095;
          _1104 = _1102 * _1096;
          _1105 = _1102 * _1100;
          _1107 = select((_1088 >= 0.0f), 1.0f, -1.0f);
          _1110 = -0.0f - (1.0f / (_1107 + _1088));
          _1111 = _1087 * _1110;
          _1112 = _1111 * _1086;
          _1113 = _1107 * _1086;
          _1122 = mad(_1105, _1086, mad(_1104, _1112, ((((_1113 * _1086) * _1110) + 1.0f) * _1103)));
          _1126 = mad(_1105, _1087, mad(_1104, (_1107 + (_1111 * _1087)), ((_1103 * _1107) * _1112)));
          _1130 = mad(_1105, _1088, mad(_1104, (-0.0f - _1087), (-0.0f - (_1113 * _1103))));
          _1132 = rsqrt(dot(float3(_1122, _1126, _1130), float3(_1122, _1126, _1130)));
          _1145 = 1.0f - saturate(dot(float3((_1132 * _1122), (_1132 * _1126), (_1132 * _1130)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
          _1148 = max(0.0010000000474974513f, _exposure0.x);
          _1153 = (_1145 * _1145) * _1040;
          _1359 = ((_1153 * (0.05000000074505806f / _1148)) + _1001);
          _1360 = (((0.07999999821186066f / _1148) * _1153) + _1000);
          _1361 = (((0.10000000149011612f / _1148) * _1153) + _999);
          _1362 = _1004.w;
        } else {
          _1168 = _229 - _aimHighlightPosition.x;
          _1169 = _230 - _aimHighlightPosition.y;
          _1170 = _231 - _aimHighlightPosition.z;
          _1181 = 1.0f - saturate(sqrt(((_1168 * _1168) + (_1169 * _1169)) + (_1170 * _1170)) / (_aimHighlightPosition.w * 5.0f));
          _1187 = saturate(((_1181 * _1181) * _1181) + ((1.0f - saturate(_1037 * 0.5f)) * 0.10000000149011612f)) * _1004.w;
          _1190 = (_1004.w * _1004.w) * _1040;
          _1193 = _1187 * 0.875f;
          _1194 = _1187 * 1.625f;
          _1195 = _1187 * 2.5f;
          _1196 = _1187 * 60.0f;
          _1205 = (((1.0f - saturate(_1196 + -2.0f)) * saturate(_1196 + -1.5f)) * (0.3499999940395355f - _1193)) + _1193;
          _1214 = (((0.6499999761581421f - _1194) * saturate(_1196 + -1.7000000476837158f)) * (1.0f - saturate(_1196 + -3.0f))) + _1194;
          _1223 = ((saturate(_1196 + -2.200000047683716f) * (1.0f - _1195)) * (1.0f - saturate(_1196 + -6.0f))) + _1195;
          _1225 = saturate(_1196 + -7.0f);
          _1237 = 1.0f - _1190;
          _1243 = (((((_1225 * ((_1187 * 1.75f) - _1205)) + _1205) * _1237) + (_1190 * 0.3499999940395355f)) * _1014) + _1001;
          _1246 = (((((((_1187 * 3.25f) - _1214) * _1225) + _1214) * _1237) + (_1190 * 0.6499999761581421f)) * _1014) + _1000;
          _1249 = (((((((_1187 * 5.0f) - _1223) * _1225) + _1223) * _1237) + _1190) * _1014) + _999;
          _1250 = _1051 + -105;
          if ((_1051 == 107) || ((_1051 == 26) || (((uint)(_1051 + -27) < (uint)2) || ((uint)_1250 < (uint)2)))) {
            _1264 = _mainPosition.x - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
            _1265 = _mainPosition.y - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
            _1266 = _mainPosition.z - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
            _1294 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _1266, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _1265, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _1264))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
            _1295 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _1266, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _1265, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _1264))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _1294;
            _1299 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _1266, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _1265, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _1264))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _1294) * 0.5f);
            _1309 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * 5.0f) + _1264;
            _1310 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * 5.0f) + _1265;
            _1311 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * 5.0f) + _1266;
            _1323 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _1311, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _1310, (_1309 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
            _1329 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _1311, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _1310, (_1309 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _1323) * 0.5f)) - _1299;
            _1331 = (_34 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _1311, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _1310, (_1309 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _1323) - _1295);
            _1338 = _143 - _1299;
            _1339 = ((_142 + -0.5f) - (_1295 * 0.5f)) * _34;
            _1347 = 1.0f - saturate(sqrt((_1338 * _1338) + (_1339 * _1339)) / max(0.0010000000474974513f, sqrt((_1329 * _1329) + (_1331 * _1331))));
            _1352 = (_1347 * _1347) * (select(((uint)_1250 < (uint)3), 0.05000000074505806f, 0.004999999888241291f) * _1014);
            _1359 = ((_1352 * 0.3499999940395355f) + _1243);
            _1360 = ((_1352 * 0.6499999761581421f) + _1246);
            _1361 = (_1352 + _1249);
            _1362 = _1190;
          } else {
            _1359 = _1243;
            _1360 = _1246;
            _1361 = _1249;
            _1362 = _1190;
          }
        }
      } else {
        _1359 = _1001;
        _1360 = _1000;
        _1361 = _999;
        _1362 = _1004.w;
      }
    } else {
      _1359 = _1001;
      _1360 = _1000;
      _1361 = _999;
      _1362 = _1004.w;
    }
  } else {
    _1359 = _1001;
    _1360 = _1000;
    _1361 = _999;
    _1362 = _1004.w;
  }
  if (_849 > 0.0f) {
    _1381 = float((int)(int(_229 * 2000.0f))) * 0.0005000000237487257f;
    _1382 = float((int)(int(_230 * 2000.0f))) * 0.0005000000237487257f;
    _1383 = float((int)(int(_231 * 2000.0f))) * 0.0005000000237487257f;
    _1399 = saturate(frac(sin(dot(float3(_1381, _1382, _1383), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f) + -0.5f);
    _1400 = saturate(frac(sin(dot(float3(_1381, _1382, _1383), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f) + -0.5f);
    _1401 = saturate(frac(sin(dot(float3(_1381, _1382, _1383), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f) + -0.5f);
    _1412 = frac(sin(dot(float2(_142, _143), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 0.5f;
    _1417 = ((frac((_1400 + _1399) - _1401) - _1412) * 0.02500000037252903f) + _142;
    _1418 = ((frac((_1400 - _1399) + _1401) - _1412) * 0.02500000037252903f) + _143;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_1420.x, _1420.y);
    _1435 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_1420.x)))))) + 0.5f) * _1417), int((float((int)(int(float((int)((int)(_1420.y)))))) + 0.5f) * _1418), 0));
    _1445 = (float((uint)((uint)((uint)((uint)(_1435.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _1446 = (float((uint)((uint)(((uint)((uint)(_1435.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _1448 = 1.0f - abs(_1445);
    _1449 = abs(_1446);
    _1450 = _1448 - _1449;
    if (_1450 < 0.0f) {
      _1461 = (select((_1445 >= 0.0f), 1.0f, -1.0f) * (1.0f - _1449));
      _1462 = (select((_1446 >= 0.0f), 1.0f, -1.0f) * _1448);
    } else {
      _1461 = _1445;
      _1462 = _1446;
    }
    _1464 = rsqrt(dot(float3(_1461, _1462, _1450), float3(_1461, _1462, _1450)));
    _1465 = _1464 * _1461;
    _1466 = _1464 * _1462;
    _1467 = _1464 * _1450;
    _1469 = rsqrt(dot(float3(_1465, _1466, _1467), float3(_1465, _1466, _1467)));
    _1470 = _1469 * _1465;
    _1471 = _1469 * _1466;
    _1472 = _1469 * _1467;
    _1473 = WaveReadLaneFirst(_materialIndex);
    _1481 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1473 < (uint)170000), _1473, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimGimmickColor);
    _1484 = float((uint)((uint)(((uint)(_1481) >> 16) & 255)));
    _1487 = float((uint)((uint)(((uint)(_1481) >> 8) & 255)));
    _1489 = float((uint)((uint)(_1481 & 255)));
    _1514 = select(((_1484 * 0.003921568859368563f) < 0.040449999272823334f), (_1484 * 0.0003035269910469651f), exp2(log2((_1484 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1515 = select(((_1487 * 0.003921568859368563f) < 0.040449999272823334f), (_1487 * 0.0003035269910469651f), exp2(log2((_1487 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1516 = select(((_1489 * 0.003921568859368563f) < 0.040449999272823334f), (_1489 * 0.0003035269910469651f), exp2(log2((_1489 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1517 = WaveReadLaneFirst(_materialIndex);
    _1525 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1517 < (uint)170000), _1517, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightColor);
    _1528 = float((uint)((uint)(((uint)(_1525) >> 16) & 255)));
    _1531 = float((uint)((uint)(((uint)(_1525) >> 8) & 255)));
    _1533 = float((uint)((uint)(_1525 & 255)));
    _1534 = _142 + -0.5f;
    _1535 = _143 + -0.5f;
    _1539 = sqrt((_1535 * _1535) + (_1534 * _1534));
    if (_377 == _renderPassAimHighlight) {
      _1590 = WaveReadLaneFirst(_materialIndex);
      _1598 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1590 < (uint)170000), _1590, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._auraTex);
      _1605 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1598 < (uint)65000), _1598, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((8.0f / _34) * _142) + ((_340.w + -0.5f) * 0.10000000149011612f)), ((((5.0f / _34) * _143) + ((_340.z + -0.5f) * 0.10000000149011612f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f))));
      _1619 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _142), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _143), 0)))).x));
      _1655 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1619, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _1672 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1619, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1655) - _aimHighlightPosition.x) - ((_1605.x + -0.5f) * 0.4000000059604645f);
      _1673 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _1619, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _1655) - _aimHighlightPosition.y) - ((_1605.y + -0.5f) * 0.4000000059604645f);
      _1674 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1619, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1655) - _aimHighlightPosition.z) - ((_1605.z + -0.5f) * 0.4000000059604645f);
      _1684 = 1.0f - saturate(sqrt(((_1672 * _1672) + (_1673 * _1673)) + (_1674 * _1674)) / _aimHighlightPosition.w);
      _1693 = _1684 * ((sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f) + (_1684 * 20.0f)) + 1.5f) * 0.33329999446868896f);
      _1694 = _1693 * _1693;
      _1707 = (((((_1694 * _1694) * ((pow(_1684, 5.0f)) * 7999999.0f)) * _1694) + 1.0f) / max(0.0010000000474974513f, _exposure0.x)) * _1694;
      if (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _192) + 0.05000000074505806f) < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _1619)) {
        _1736 = 1.0f - saturate(dot(float3(((((_409 * _405) - _1470) * 0.75f) + _1470), ((((_409 * _406) - _1471) * 0.75f) + _1471), ((((_409 * _407) - _1472) * 0.75f) + _1472)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _1737 = _1736 * _1736;
        _1739 = (_1737 * _1737) * _1736;
        _1763 = ((_1739 * (lerp(_1514, 0.3499999940395355f, 0.30000001192092896f))) + (_1359 * 4.0f));
        _1764 = ((_1739 * (lerp(_1515, 0.6499999761581421f, 0.30000001192092896f))) + (_1360 * 4.0f));
        _1765 = ((_1739 * (lerp(_1516, 1.0f, 0.30000001192092896f))) + (_1361 * 4.0f));
      } else {
        _1763 = (_1514 * _1362);
        _1764 = (_1515 * _1362);
        _1765 = (_1516 * _1362);
      }
      _1806 = _1539;
      _1807 = (((((_1707 * select(((_1528 * 0.003921568859368563f) < 0.040449999272823334f), (_1528 * 0.0003035269910469651f), exp2(log2((_1528 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1359) + _1763) * _849) + _1359);
      _1808 = (((((_1707 * select(((_1531 * 0.003921568859368563f) < 0.040449999272823334f), (_1531 * 0.0003035269910469651f), exp2(log2((_1531 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1360) + _1764) * _849) + _1360);
      _1809 = (((((_1707 * select(((_1533 * 0.003921568859368563f) < 0.040449999272823334f), (_1533 * 0.0003035269910469651f), exp2(log2((_1533 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1361) + _1765) * _849) + _1361);
    } else {
      if (float((uint)((uint)(_1435.x & 255))) == float((uint)(uint)(_renderPassAimHighlight))) {
        if (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _192) + 0.05000000074505806f) < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1417), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1418), 0)))).x)))) {
          _1801 = min(max(saturate(1.0f - (_1539 * 2.0f)), 0.10000000149011612f), 1.0f) * 0.05000000074505806f;
          _1806 = _1539;
          _1807 = (_1801 * _1514);
          _1808 = (_1801 * _1515);
          _1809 = (_1801 * _1516);
        } else {
          _1806 = _1539;
          _1807 = _1359;
          _1808 = _1360;
          _1809 = _1361;
        }
      } else {
        _1806 = _1539;
        _1807 = _1359;
        _1808 = _1360;
        _1809 = _1361;
      }
    }
  } else {
    _1365 = _142 + -0.5f;
    _1366 = _143 + -0.5f;
    _1806 = sqrt((_1366 * _1366) + (_1365 * _1365));
    _1807 = _1359;
    _1808 = _1360;
    _1809 = _1361;
  }
  _1812 = saturate((_1806 + -0.009999999776482582f) * 1.0101009607315063f);
  _1817 = WaveReadLaneFirst(_materialIndex);
  _1825 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1817 < (uint)170000), _1817, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._vignetteIntensity);
  _1827 = WaveReadLaneFirst(_materialIndex);
  _1835 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1827 < (uint)170000), _1827, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _1837 = 1.0f - ((((_1812 * _1812) * (3.0f - (_1812 * 2.0f))) * _1825) * _1835);
  _1844 = max(0.0f, (_1837 * (_1807 + _983)));
  _1845 = max(0.0f, (_1837 * (_1808 + _984)));
  _1846 = max(0.0f, (_1837 * (_1809 + _985)));
  _1847 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1860 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1847, 0)))).x) & 127))) + 0.5f);
  } else {
    _1860 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1844, _1845, _1846));
    _2282 = output_color.x;
    _2283 = output_color.y;
    _2284 = output_color.z;
  } else {
    _2282 = _1844;
    _2283 = _1845;
    _2284 = _1846;
  }
  if (_etcParams.y > 1.0f) {
    _2295 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _2296 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _2300 = saturate(1.0f - (dot(float2(_2295, _2296), float2(_2295, _2296)) * saturate(_etcParams.y + -1.0f)));
    _2305 = (_2300 * _2282);
    _2306 = (_2300 * _2283);
    _2307 = (_2300 * _2284);
  } else {
    _2305 = _2282;
    _2306 = _2283;
    _2307 = _2284;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2340 = select((_2305 <= 0.0031308000907301903f), (_2305 * 12.920000076293945f), (((pow(_2305, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2341 = select((_2306 <= 0.0031308000907301903f), (_2306 * 12.920000076293945f), (((pow(_2306, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2342 = select((_2307 <= 0.0031308000907301903f), (_2307 * 12.920000076293945f), (((pow(_2307, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2340 = _2305;
    _2341 = _2306;
    _2342 = _2307;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2347 = float((uint)_1847);
    if (!(_2347 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2347 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2356 = _2340;
        _2357 = _2341;
        _2358 = _2342;
      } else {
        _2356 = 0.0f;
        _2357 = 0.0f;
        _2358 = 0.0f;
      }
    } else {
      _2356 = 0.0f;
      _2357 = 0.0f;
      _2358 = 0.0f;
    }
  } else {
    _2356 = _2340;
    _2357 = _2341;
    _2358 = _2342;
  }
  _2368 = exp2(log2(_2356 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2369 = exp2(log2(_2357 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2370 = exp2(log2(_2358 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_2368 * 18.6875f) + 1.0f)) * ((_2368 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_2369 * 18.6875f) + 1.0f)) * ((_2369 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_2370 * 18.6875f) + 1.0f)) * ((_2370 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1860;
  return SV_Target;
}