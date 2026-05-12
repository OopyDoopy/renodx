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
  float _365;
  float _366;
  float _475;
  float _476;
  float _477;
  float _478;
  int _479;
  float _484;
  float _485;
  float _486;
  float _487;
  int _488;
  float _493;
  float _494;
  float _495;
  float _496;
  int _497;
  float _639;
  float _640;
  float _641;
  int _642;
  float _716;
  float _717;
  float _718;
  float _794;
  float _795;
  float _796;
  float _797;
  float _798;
  float _799;
  float _800;
  bool _861;
  float _878;
  float _879;
  float _880;
  float _890;
  float _1254;
  float _1255;
  float _1256;
  float _1257;
  float _1356;
  float _1357;
  float _1658;
  float _1659;
  float _1660;
  float _1701;
  float _1702;
  float _1703;
  float _1704;
  float _1755;
  float _1960;
  float _1961;
  float _1962;
  float _2055;
  float _2056;
  float _2057;
  float _2177;
  float _2178;
  float _2179;
  float _2200;
  float _2201;
  float _2202;
  float _2235;
  float _2236;
  float _2237;
  float _2251;
  float _2252;
  float _2253;
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
  float _282;
  float _283;
  float _284;
  int _289;
  int _297;
  float4 _304;
  int _309;
  float _317;
  float _318;
  float _321;
  float _322;
  uint2 _324;
  uint _339;
  int _341;
  float _349;
  float _350;
  float _352;
  float _353;
  float _354;
  float _368;
  float _369;
  float _370;
  float _371;
  float _373;
  int _377;
  float _385;
  int _386;
  float _394;
  float _397;
  float _400;
  float _401;
  float _402;
  float _403;
  float _404;
  float _405;
  float _406;
  float _407;
  float _408;
  float _409;
  float _412;
  float _415;
  float _418;
  float _421;
  float _424;
  float _427;
  float _434;
  float _435;
  float _436;
  float _443;
  float _444;
  float _445;
  float _448;
  float _451;
  float _454;
  int _459;
  float _467;
  float _468;
  float _469;
  float _470;
  float _471;
  float _472;
  float _473;
  int _481;
  int _490;
  float _498;
  float _499;
  float _500;
  float _504;
  float _505;
  float _506;
  float _521;
  float _528;
  float _529;
  float _530;
  float _541;
  bool _542;
  float _543;
  float _544;
  float _545;
  float _546;
  int _547;
  float _557;
  float _558;
  float _559;
  float _587;
  float _592;
  float _593;
  float _598;
  float _599;
  float _600;
  float _609;
  float _611;
  float _612;
  float _614;
  float _616;
  float _617;
  float _618;
  float _624;
  float _625;
  float _646;
  float _647;
  float _648;
  float4 _653;
  float4 _657;
  int _664;
  float _672;
  float _674;
  float _681;
  float _682;
  float _683;
  int _686;
  float4 _691;
  int _695;
  float _703;
  float _705;
  int _719;
  float _727;
  int _733;
  float _741;
  float _744;
  int _769;
  int _777;
  float4 _784;
  float _787;
  float _789;
  float _792;
  float _805;
  float _806;
  float _807;
  float _808;
  float _817;
  float _818;
  float _820;
  float4 _828;
  float _837;
  float _838;
  float _839;
  float _840;
  float _847;
  float _867;
  float _870;
  float _894;
  float _895;
  float _896;
  float4 _899;
  int _901;
  float _909;
  float _924;
  float _925;
  float _926;
  float _932;
  float _935;
  int _946;
  uint _952;
  uint _953;
  uint4 _955;
  float4 _958;
  float _976;
  float _977;
  float _978;
  float _980;
  float _981;
  float _982;
  float _983;
  float _986;
  float _987;
  float _990;
  float _991;
  float _995;
  float _997;
  float _998;
  float _999;
  float _1000;
  float _1002;
  float _1005;
  float _1006;
  float _1007;
  float _1008;
  float _1017;
  float _1021;
  float _1025;
  float _1027;
  float _1040;
  float _1043;
  float _1048;
  float _1063;
  float _1064;
  float _1065;
  float _1076;
  float _1082;
  float _1085;
  float _1088;
  float _1089;
  float _1090;
  float _1091;
  float _1100;
  float _1109;
  float _1118;
  float _1120;
  float _1132;
  float _1138;
  float _1141;
  float _1144;
  int _1145;
  float _1159;
  float _1160;
  float _1161;
  float _1189;
  float _1190;
  float _1194;
  float _1204;
  float _1205;
  float _1206;
  float _1218;
  float _1224;
  float _1226;
  float _1233;
  float _1234;
  float _1242;
  float _1247;
  float _1260;
  float _1261;
  float _1276;
  float _1277;
  float _1278;
  float _1294;
  float _1295;
  float _1296;
  float _1307;
  float _1312;
  float _1313;
  uint2 _1315;
  uint _1330;
  float _1340;
  float _1341;
  float _1343;
  float _1344;
  float _1345;
  float _1359;
  float _1360;
  float _1361;
  float _1362;
  float _1364;
  float _1365;
  float _1366;
  float _1367;
  int _1368;
  int _1376;
  float _1379;
  float _1382;
  float _1384;
  float _1409;
  float _1410;
  float _1411;
  int _1412;
  int _1420;
  float _1423;
  float _1426;
  float _1428;
  float _1429;
  float _1430;
  float _1434;
  int _1485;
  int _1493;
  float4 _1500;
  float _1514;
  float _1550;
  float _1567;
  float _1568;
  float _1569;
  float _1579;
  float _1588;
  float _1589;
  float _1602;
  float _1631;
  float _1632;
  float _1634;
  float _1696;
  float _1707;
  int _1712;
  float _1720;
  int _1722;
  float _1730;
  float _1732;
  float _1739;
  float _1740;
  float _1741;
  uint _1742;
  float _1764;
  float _1813;
  float _1814;
  float _1815;
  float _1817;
  float _1824;
  float _1825;
  float _1826;
  float _1845;
  float _1846;
  float _1847;
  float _1848;
  float _1849;
  float _1850;
  float _1851;
  float _1852;
  float _1853;
  float _1899;
  float _1900;
  float _1901;
  float _1902;
  float _1903;
  float _1904;
  float _1905;
  float _1922;
  float _1923;
  float _1924;
  float _1925;
  float _1931;
  float _1934;
  float _1941;
  float _1942;
  float _1943;
  float _1972;
  float _1997;
  float _1998;
  float _1999;
  float _2018;
  float _2019;
  float _2020;
  float _2026;
  float _2030;
  float _2031;
  float _2032;
  float _2033;
  float _2038;
  float _2063;
  float _2067;
  float _2068;
  float _2069;
  float _2070;
  int _2111;
  float _2166;
  float _2190;
  float _2191;
  float _2195;
  float _2242;
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
  _282 = 4.0f / _34;
  _283 = _282 * _142;
  _284 = _282 * _143;
  _289 = WaveReadLaneFirst(_materialIndex);
  _297 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_289 < (uint)170000), _289, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
  _304 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_297 < (uint)65000), _297, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_283, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _284)));
  _309 = WaveReadLaneFirst(_materialIndex);
  _317 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_309 < (uint)170000), _309, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _318 = _317 * (_304.y + -0.30000001192092896f);
  _321 = (_318 * 0.0010000000474974513f) + _142;
  _322 = (_318 * 0.019999999552965164f) + _143;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_324.x, _324.y);
  _339 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_324.x)))))) + 0.5f) * _321), int((float((int)(int(float((int)((int)(_324.y)))))) + 0.5f) * _322), 0));
  _341 = _339.x & 255;
  _349 = (float((uint)((uint)((uint)((uint)(_339.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _350 = (float((uint)((uint)(((uint)((uint)(_339.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _352 = 1.0f - abs(_349);
  _353 = abs(_350);
  _354 = _352 - _353;
  if (_354 < 0.0f) {
    _365 = (select((_349 >= 0.0f), 1.0f, -1.0f) * (1.0f - _353));
    _366 = (select((_350 >= 0.0f), 1.0f, -1.0f) * _352);
  } else {
    _365 = _349;
    _366 = _350;
  }
  _368 = rsqrt(dot(float3(_365, _366, _354), float3(_365, _366, _354)));
  _369 = _368 * _365;
  _370 = _368 * _366;
  _371 = _368 * _354;
  _373 = rsqrt(dot(float3(_369, _370, _371), float3(_369, _370, _371)));
  _377 = WaveReadLaneFirst(_materialIndex);
  _385 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_377 < (uint)170000), _377, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._radius);
  _386 = WaveReadLaneFirst(_materialIndex);
  _394 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_386 < (uint)170000), _386, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _397 = saturate(1.0f - _394) * _385;
  if (!(_397 < 0.0010000000474974513f)) {
    _400 = ddx_coarse(_273);
    _401 = ddx_coarse(_274);
    _402 = ddx_coarse(_275);
    _403 = ddy_coarse(_273);
    _404 = ddy_coarse(_274);
    _405 = ddy_coarse(_275);
    _406 = ddx_coarse(_142);
    _407 = ddx_coarse(_143);
    _408 = ddy_coarse(_142);
    _409 = ddy_coarse(_143);
    _412 = (_404 * _187) - (_405 * _186);
    _415 = (_405 * _185) - (_403 * _187);
    _418 = (_403 * _186) - (_404 * _185);
    _421 = (_402 * _186) - (_401 * _187);
    _424 = (_400 * _187) - (_402 * _185);
    _427 = (_401 * _185) - (_400 * _186);
    _434 = (_408 * _421) + (_412 * _406);
    _435 = (_408 * _424) + (_415 * _406);
    _436 = (_408 * _427) + (_418 * _406);
    _443 = (_409 * _421) + (_412 * _407);
    _444 = (_409 * _424) + (_415 * _407);
    _445 = (_409 * _427) + (_407 * _418);
    _448 = max(dot(float3(_434, _435, _436), float3(_434, _435, _436)), dot(float3(_443, _444, _445), float3(_443, _444, _445)));
    _451 = rsqrt(select((_448 != 0.0f), _448, 0.10000000149011612f));
    _454 = _451 * _273;
    _459 = WaveReadLaneFirst(_materialIndex);
    _467 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_459 < (uint)170000), _459, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._squareSize);
    _468 = _467 * _229;
    _469 = _467 * _230;
    _470 = _467 * _231;
    _471 = floor(_468);
    _472 = floor(_469);
    _473 = floor(_470);
    _475 = 10.0f;
    _476 = 0.0f;
    _477 = 0.0f;
    _478 = 0.0f;
    _479 = -1;
    while(true) {
      _484 = _475;
      _485 = _476;
      _486 = _477;
      _487 = _478;
      _488 = -1;
      while(true) {
        _493 = _484;
        _494 = _485;
        _495 = _486;
        _496 = _487;
        _497 = -1;
        while(true) {
          _498 = float((int)(_497));
          _499 = float((int)(_488));
          _500 = float((int)(_479));
          _504 = sin(_498 + _471);
          _505 = sin(_499 + _472);
          _506 = sin(_500 + _473);
          _521 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _528 = sin(_521 * frac(sin(dot(float3(_504, _505, _506), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _498;
          _529 = sin(_521 * frac(sin(dot(float3(_504, _505, _506), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _499;
          _530 = sin(_521 * frac(sin(dot(float3(_504, _505, _506), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _500;
          _541 = max(abs((_471 - _468) + _528), max(abs((_472 - _469) + _529), abs((_473 - _470) + _530)));
          _542 = (_541 < _493);
          _543 = select(_542, _541, _493);
          _544 = select(_542, _528, _494);
          _545 = select(_542, _529, _495);
          _546 = select(_542, _530, _496);
          _547 = _497 + 1;
          if (!(_547 == 2)) {
            _493 = _543;
            _494 = _544;
            _495 = _545;
            _496 = _546;
            _497 = _547;
            continue;
          }
          while(true) {
            _490 = _488 + 1;
            if (!(_490 == 2)) {
              _484 = _543;
              _485 = _544;
              _486 = _545;
              _487 = _546;
              _488 = _490;
              __loop_jump_target = 483;
              break;
            }
            while(true) {
              _481 = _479 + 1;
              if (!(_481 == 2)) {
                _475 = _543;
                _476 = _544;
                _477 = _545;
                _478 = _546;
                _479 = _481;
                __loop_jump_target = 474;
                break;
              }
              _557 = (_544 + _471) / _467;
              _558 = (_545 + _472) / _467;
              _559 = (_546 + _473) / _467;
              _587 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _559, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _558, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _557))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
              _592 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _559, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _558, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _557))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _587) * 0.5f) + 0.5f;
              _593 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _559, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _558, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _557))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _587) * 0.5f);
              _598 = _557 - _mainPosition.x;
              _599 = _558 - _mainPosition.y;
              _600 = _559 - _mainPosition.z;
              _609 = saturate(1.0f - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _397)) * sqrt(dot(float3(_598, _599, _600), float3(_598, _599, _600))))) * 1.0152283906936646f));
              _611 = 1.0f - saturate(_609);
              _612 = _609 * 0.5f;
              _614 = (_142 - _592) / _611;
              _616 = (_143 - _593) / _611;
              _617 = sin(_612);
              _618 = cos(_612);
              _624 = mad((-0.0f - _617), _616, (_618 * _614)) + _592;
              _625 = mad(_618, _616, (_617 * _614)) + _593;
              _639 = 0.0f;
              _640 = 0.0f;
              _641 = 0.0f;
              _642 = 1;
              while(true) {
                _646 = (float((int)(6 - _642)) * 0.1666666716337204f) * ((saturate(_157.x * 1.5f) * 0.5f) * saturate(frac(sin(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_142)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_143))))), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + 0.5f));
                _647 = _646 * mad((_451 * _436), _275, mad((_451 * _435), _274, (_454 * _434)));
                _648 = _646 * mad((_451 * _445), _275, mad((_451 * _444), _274, (_454 * _443)));
                _653 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_647 + _142), (_648 + _143)));
                _657 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_647 + _624), (_648 + _625)));
                _664 = WaveReadLaneFirst(_materialIndex);
                _672 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_664 < (uint)170000), _664, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._maskThreshold);
                _674 = float((bool)(uint)(_653.w < _672));
                _681 = (_674 * ((_657.x * 0.4000000059604645f) - _639)) + _639;
                _682 = (_674 * ((_657.y * 0.4000000059604645f) - _640)) + _640;
                _683 = (_674 * ((_657.z * 0.4000000059604645f) - _641)) + _641;
                if (!(_653.w > 0.8999999761581421f)) {
                  _686 = _642 + 1;
                  if ((int)_686 < (int)6) {
                    _639 = _681;
                    _640 = _682;
                    _641 = _683;
                    _642 = _686;
                    continue;
                  }
                }
                _691 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_624, _625));
                _695 = WaveReadLaneFirst(_materialIndex);
                _703 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_695 < (uint)170000), _695, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._maskThreshold);
                _705 = float((bool)(uint)(_653.w < _703));
                _716 = ((_705 * (_691.x - _681)) + _681);
                _717 = ((_705 * (_691.y - _682)) + _682);
                _718 = ((_705 * (_691.z - _683)) + _683);
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
        if (__loop_jump_target == 483) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 474) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _716 = 0.0f;
    _717 = 0.0f;
    _718 = 0.0f;
  }
  _719 = WaveReadLaneFirst(_materialIndex);
  _727 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_719 < (uint)170000), _719, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _733 = WaveReadLaneFirst(_materialIndex);
  _741 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_733 < (uint)170000), _733, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _744 = saturate((_741 * 100.0f) + -99.0f);
  if (!(_744 < 0.0010000000474974513f)) {
    if ((_341 == _renderPassSelfPlayer) | (_341 == _renderPassTest) | (_341 == _renderPassDetectRemoteCatch) | (_341 == _renderPassDetectPickedRemoteCatch)) {
      _769 = WaveReadLaneFirst(_materialIndex);
      _777 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_769 < (uint)170000), _769, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
      _784 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_777 < (uint)65000), _777, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_283 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.2199999988079071f)), (_284 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.18000000715255737f))));
      _787 = _784.x + -0.30000001192092896f;
      _789 = ((_784.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
      _792 = _787 * 0.006000000052154064f;
      _794 = _792;
      _795 = _792;
      _796 = 0.0f;
      _797 = 0.0f;
      _798 = 0.0f;
      _799 = 0.0f;
      _800 = -1.0f;
      while(true) {
        _805 = _142 - ((_794 * sin(_789)) * _800);
        _806 = _143 - ((_795 * cos(_789)) * _800);
        _807 = _805 + -0.5f;
        _808 = _806 + -0.5f;
        _817 = rsqrt(dot(float2(_807, _808), float2(_807, _808))) * ((_787 * 0.05999999865889549f) * sqrt((_807 * _807) + (_808 * _808)));
        _818 = _817 * _807;
        _820 = _817 * _808;
        _828 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_805, _806));
        _837 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_805 - _818), (_806 - _820))))).x) * 0.20000000298023224f) + _796;
        _838 = (_828.y * 0.20000000298023224f) + _797;
        _839 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_818 + _805), (_820 + _806))))).z) * 0.20000000298023224f) + _798;
        _840 = (_828.w * 0.20000000298023224f) + _799;
        _847 = _800 + 0.20000000298023224f;
        if (!(_847 > 1.0f)) {
          _794 = (_794 * 1.0099999904632568f);
          _795 = (_795 * 1.0099999904632568f);
          _796 = (_837 * 0.8999999761581421f);
          _797 = (_838 * 0.8999999761581421f);
          _798 = (_839 * 0.8999999761581421f);
          _799 = (_840 * 0.8999999761581421f);
          _800 = _847;
          continue;
        }
        if (!(_341 == _renderPassSelfPlayer)) {
          _861 = (_341 == _renderPassTest);
        } else {
          _861 = true;
        }
        _867 = saturate(_840 * 1.0800000429153442f);
        _870 = max(0.0010000000474974513f, _exposure0.x);
        _878 = ((((_837 * 0.5400000214576721f) * select(_861, 0.550000011920929f, 0.5f)) / _870) * _867);
        _879 = ((((_838 * 0.5400000214576721f) * select(_861, 0.699999988079071f, 0.800000011920929f)) / _870) * _867);
        _880 = (((_839 * 0.5400000214576721f) / _870) * _867);
        break;
      }
    } else {
      _878 = 0.0f;
      _879 = 0.0f;
      _880 = 0.0f;
    }
  } else {
    _878 = 0.0f;
    _879 = 0.0f;
    _880 = 0.0f;
  }
  if ((_341 == _renderPassSelfPlayer) | (_341 == _renderPassTest)) {
    _890 = _744;
  } else {
    _890 = saturate(_727 * 2.0f);
  }
  _894 = _278.z + (_890 * (_718 - _278.z));
  _895 = _278.y + (_890 * (_717 - _278.y));
  _896 = _278.x + (_890 * (_716 - _278.x));
  _899 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_142, _143), 0.0f);
  _901 = WaveReadLaneFirst(_materialIndex);
  _909 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_901 < (uint)170000), _901, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightBackground);
  if (!(_909 < 0.0010000000474974513f)) {
    if (!(_341 == _renderPassSelfPlayer)) {
      if (!(_341 == _renderPassTest)) {
        _924 = _229 - _mainPosition.x;
        _925 = _230 - _mainPosition.y;
        _926 = _231 - _mainPosition.z;
        _932 = sqrt(((_924 * _924) + (_925 * _925)) + (_926 * _926));
        _935 = 1.0f - saturate(_932 * 0.03333333507180214f);
        _946 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _142)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _143)), 0)))).x) & 127;
        if ((uint)(_946 + -53) < (uint)15) {
          _952 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _321);
          _953 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _322);
          _955 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_952, _953, 0));
          _958 = __3__36__0__0__g_gbufferNormal.Load(int3(_952, _953, 0));
          _976 = (saturate(_958.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          _977 = (saturate(_958.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          _978 = (saturate(_958.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          _980 = rsqrt(dot(float3(_976, _977, _978), float3(_976, _977, _978)));
          _981 = _980 * _976;
          _982 = _980 * _977;
          _983 = _978 * _980;
          _986 = (float((uint)((uint)(((uint)((uint)(_955.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          _987 = (float((uint)((uint)(_955.w & 255))) * 0.007843137718737125f) + -1.0f;
          _990 = (_986 + _987) * 0.5f;
          _991 = (_986 - _987) * 0.5f;
          _995 = (1.0f - abs(_990)) - abs(_991);
          _997 = rsqrt(dot(float3(_990, _991, _995), float3(_990, _991, _995)));
          _998 = _997 * _990;
          _999 = _997 * _991;
          _1000 = _997 * _995;
          _1002 = select((_983 >= 0.0f), 1.0f, -1.0f);
          _1005 = -0.0f - (1.0f / (_1002 + _983));
          _1006 = _982 * _1005;
          _1007 = _1006 * _981;
          _1008 = _1002 * _981;
          _1017 = mad(_1000, _981, mad(_999, _1007, ((((_1008 * _981) * _1005) + 1.0f) * _998)));
          _1021 = mad(_1000, _982, mad(_999, (_1002 + (_1006 * _982)), ((_998 * _1002) * _1007)));
          _1025 = mad(_1000, _983, mad(_999, (-0.0f - _982), (-0.0f - (_1008 * _998))));
          _1027 = rsqrt(dot(float3(_1017, _1021, _1025), float3(_1017, _1021, _1025)));
          _1040 = 1.0f - saturate(dot(float3((_1027 * _1017), (_1027 * _1021), (_1027 * _1025)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
          _1043 = max(0.0010000000474974513f, _exposure0.x);
          _1048 = (_1040 * _1040) * _935;
          _1254 = ((_1048 * (0.05000000074505806f / _1043)) + _896);
          _1255 = (((0.07999999821186066f / _1043) * _1048) + _895);
          _1256 = (((0.10000000149011612f / _1043) * _1048) + _894);
          _1257 = _899.w;
        } else {
          _1063 = _229 - _aimHighlightPosition.x;
          _1064 = _230 - _aimHighlightPosition.y;
          _1065 = _231 - _aimHighlightPosition.z;
          _1076 = 1.0f - saturate(sqrt(((_1063 * _1063) + (_1064 * _1064)) + (_1065 * _1065)) / (_aimHighlightPosition.w * 5.0f));
          _1082 = saturate(((_1076 * _1076) * _1076) + ((1.0f - saturate(_932 * 0.5f)) * 0.10000000149011612f)) * _899.w;
          _1085 = (_899.w * _899.w) * _935;
          _1088 = _1082 * 0.875f;
          _1089 = _1082 * 1.625f;
          _1090 = _1082 * 2.5f;
          _1091 = _1082 * 60.0f;
          _1100 = (((1.0f - saturate(_1091 + -2.0f)) * saturate(_1091 + -1.5f)) * (0.3499999940395355f - _1088)) + _1088;
          _1109 = (((0.6499999761581421f - _1089) * saturate(_1091 + -1.7000000476837158f)) * (1.0f - saturate(_1091 + -3.0f))) + _1089;
          _1118 = ((saturate(_1091 + -2.200000047683716f) * (1.0f - _1090)) * (1.0f - saturate(_1091 + -6.0f))) + _1090;
          _1120 = saturate(_1091 + -7.0f);
          _1132 = 1.0f - _1085;
          _1138 = (((((_1120 * ((_1082 * 1.75f) - _1100)) + _1100) * _1132) + (_1085 * 0.3499999940395355f)) * _909) + _896;
          _1141 = (((((((_1082 * 3.25f) - _1109) * _1120) + _1109) * _1132) + (_1085 * 0.6499999761581421f)) * _909) + _895;
          _1144 = (((((((_1082 * 5.0f) - _1118) * _1120) + _1118) * _1132) + _1085) * _909) + _894;
          _1145 = _946 + -105;
          if ((_946 == 107) || ((_946 == 26) || (((uint)(_946 + -27) < (uint)2) || ((uint)_1145 < (uint)2)))) {
            _1159 = _mainPosition.x - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
            _1160 = _mainPosition.y - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
            _1161 = _mainPosition.z - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
            _1189 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _1161, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _1160, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _1159))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
            _1190 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _1161, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _1160, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _1159))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _1189;
            _1194 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _1161, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _1160, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _1159))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _1189) * 0.5f);
            _1204 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * 5.0f) + _1159;
            _1205 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * 5.0f) + _1160;
            _1206 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * 5.0f) + _1161;
            _1218 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _1206, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _1205, (_1204 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
            _1224 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _1206, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _1205, (_1204 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _1218) * 0.5f)) - _1194;
            _1226 = (_34 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _1206, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _1205, (_1204 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _1218) - _1190);
            _1233 = _143 - _1194;
            _1234 = ((_142 + -0.5f) - (_1190 * 0.5f)) * _34;
            _1242 = 1.0f - saturate(sqrt((_1233 * _1233) + (_1234 * _1234)) / max(0.0010000000474974513f, sqrt((_1224 * _1224) + (_1226 * _1226))));
            _1247 = (_1242 * _1242) * (select(((uint)_1145 < (uint)3), 0.05000000074505806f, 0.004999999888241291f) * _909);
            _1254 = ((_1247 * 0.3499999940395355f) + _1138);
            _1255 = ((_1247 * 0.6499999761581421f) + _1141);
            _1256 = (_1247 + _1144);
            _1257 = _1085;
          } else {
            _1254 = _1138;
            _1255 = _1141;
            _1256 = _1144;
            _1257 = _1085;
          }
        }
      } else {
        _1254 = _896;
        _1255 = _895;
        _1256 = _894;
        _1257 = _899.w;
      }
    } else {
      _1254 = _896;
      _1255 = _895;
      _1256 = _894;
      _1257 = _899.w;
    }
  } else {
    _1254 = _896;
    _1255 = _895;
    _1256 = _894;
    _1257 = _899.w;
  }
  if (_744 > 0.0f) {
    _1276 = float((int)(int(_229 * 2000.0f))) * 0.0005000000237487257f;
    _1277 = float((int)(int(_230 * 2000.0f))) * 0.0005000000237487257f;
    _1278 = float((int)(int(_231 * 2000.0f))) * 0.0005000000237487257f;
    _1294 = saturate(frac(sin(dot(float3(_1276, _1277, _1278), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f) + -0.5f);
    _1295 = saturate(frac(sin(dot(float3(_1276, _1277, _1278), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f) + -0.5f);
    _1296 = saturate(frac(sin(dot(float3(_1276, _1277, _1278), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f) + -0.5f);
    _1307 = frac(sin(dot(float2(_142, _143), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 0.5f;
    _1312 = ((frac((_1295 + _1294) - _1296) - _1307) * 0.02500000037252903f) + _142;
    _1313 = ((frac((_1295 - _1294) + _1296) - _1307) * 0.02500000037252903f) + _143;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_1315.x, _1315.y);
    _1330 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_1315.x)))))) + 0.5f) * _1312), int((float((int)(int(float((int)((int)(_1315.y)))))) + 0.5f) * _1313), 0));
    _1340 = (float((uint)((uint)((uint)((uint)(_1330.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _1341 = (float((uint)((uint)(((uint)((uint)(_1330.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _1343 = 1.0f - abs(_1340);
    _1344 = abs(_1341);
    _1345 = _1343 - _1344;
    if (_1345 < 0.0f) {
      _1356 = (select((_1340 >= 0.0f), 1.0f, -1.0f) * (1.0f - _1344));
      _1357 = (select((_1341 >= 0.0f), 1.0f, -1.0f) * _1343);
    } else {
      _1356 = _1340;
      _1357 = _1341;
    }
    _1359 = rsqrt(dot(float3(_1356, _1357, _1345), float3(_1356, _1357, _1345)));
    _1360 = _1359 * _1356;
    _1361 = _1359 * _1357;
    _1362 = _1359 * _1345;
    _1364 = rsqrt(dot(float3(_1360, _1361, _1362), float3(_1360, _1361, _1362)));
    _1365 = _1364 * _1360;
    _1366 = _1364 * _1361;
    _1367 = _1364 * _1362;
    _1368 = WaveReadLaneFirst(_materialIndex);
    _1376 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1368 < (uint)170000), _1368, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimGimmickColor);
    _1379 = float((uint)((uint)(((uint)(_1376) >> 16) & 255)));
    _1382 = float((uint)((uint)(((uint)(_1376) >> 8) & 255)));
    _1384 = float((uint)((uint)(_1376 & 255)));
    _1409 = select(((_1379 * 0.003921568859368563f) < 0.040449999272823334f), (_1379 * 0.0003035269910469651f), exp2(log2((_1379 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1410 = select(((_1382 * 0.003921568859368563f) < 0.040449999272823334f), (_1382 * 0.0003035269910469651f), exp2(log2((_1382 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1411 = select(((_1384 * 0.003921568859368563f) < 0.040449999272823334f), (_1384 * 0.0003035269910469651f), exp2(log2((_1384 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1412 = WaveReadLaneFirst(_materialIndex);
    _1420 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1412 < (uint)170000), _1412, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightColor);
    _1423 = float((uint)((uint)(((uint)(_1420) >> 16) & 255)));
    _1426 = float((uint)((uint)(((uint)(_1420) >> 8) & 255)));
    _1428 = float((uint)((uint)(_1420 & 255)));
    _1429 = _142 + -0.5f;
    _1430 = _143 + -0.5f;
    _1434 = sqrt((_1430 * _1430) + (_1429 * _1429));
    if (_341 == _renderPassAimHighlight) {
      _1485 = WaveReadLaneFirst(_materialIndex);
      _1493 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1485 < (uint)170000), _1485, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._auraTex);
      _1500 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1493 < (uint)65000), _1493, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((8.0f / _34) * _142) + ((_304.w + -0.5f) * 0.10000000149011612f)), ((((5.0f / _34) * _143) + ((_304.z + -0.5f) * 0.10000000149011612f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f))));
      _1514 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _142), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _143), 0)))).x));
      _1550 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _1514, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _1567 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _1514, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _1550) - _aimHighlightPosition.x) - ((_1500.x + -0.5f) * 0.4000000059604645f);
      _1568 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _1514, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _1550) - _aimHighlightPosition.y) - ((_1500.y + -0.5f) * 0.4000000059604645f);
      _1569 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _1514, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _191, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _189))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _1550) - _aimHighlightPosition.z) - ((_1500.z + -0.5f) * 0.4000000059604645f);
      _1579 = 1.0f - saturate(sqrt(((_1567 * _1567) + (_1568 * _1568)) + (_1569 * _1569)) / _aimHighlightPosition.w);
      _1588 = _1579 * ((sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f) + (_1579 * 20.0f)) + 1.5f) * 0.33329999446868896f);
      _1589 = _1588 * _1588;
      _1602 = (((((_1589 * _1589) * ((pow(_1579, 5.0f)) * 7999999.0f)) * _1589) + 1.0f) / max(0.0010000000474974513f, _exposure0.x)) * _1589;
      if (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _192) + 0.05000000074505806f) < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _1514)) {
        _1631 = 1.0f - saturate(dot(float3(((((_373 * _369) - _1365) * 0.75f) + _1365), ((((_373 * _370) - _1366) * 0.75f) + _1366), ((((_373 * _371) - _1367) * 0.75f) + _1367)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _1632 = _1631 * _1631;
        _1634 = (_1632 * _1632) * _1631;
        _1658 = ((_1634 * (lerp(_1409, 0.3499999940395355f, 0.30000001192092896f))) + (_1254 * 4.0f));
        _1659 = ((_1634 * (lerp(_1410, 0.6499999761581421f, 0.30000001192092896f))) + (_1255 * 4.0f));
        _1660 = ((_1634 * (lerp(_1411, 1.0f, 0.30000001192092896f))) + (_1256 * 4.0f));
      } else {
        _1658 = (_1409 * _1257);
        _1659 = (_1410 * _1257);
        _1660 = (_1411 * _1257);
      }
      _1701 = _1434;
      _1702 = (((((_1602 * select(((_1423 * 0.003921568859368563f) < 0.040449999272823334f), (_1423 * 0.0003035269910469651f), exp2(log2((_1423 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1254) + _1658) * _744) + _1254);
      _1703 = (((((_1602 * select(((_1426 * 0.003921568859368563f) < 0.040449999272823334f), (_1426 * 0.0003035269910469651f), exp2(log2((_1426 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1255) + _1659) * _744) + _1255);
      _1704 = (((((_1602 * select(((_1428 * 0.003921568859368563f) < 0.040449999272823334f), (_1428 * 0.0003035269910469651f), exp2(log2((_1428 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _1256) + _1660) * _744) + _1256);
    } else {
      if (float((uint)((uint)(_1330.x & 255))) == float((uint)(uint)(_renderPassAimHighlight))) {
        if (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _192) + 0.05000000074505806f) < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1312), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1313), 0)))).x)))) {
          _1696 = min(max(saturate(1.0f - (_1434 * 2.0f)), 0.10000000149011612f), 1.0f) * 0.05000000074505806f;
          _1701 = _1434;
          _1702 = (_1696 * _1409);
          _1703 = (_1696 * _1410);
          _1704 = (_1696 * _1411);
        } else {
          _1701 = _1434;
          _1702 = _1254;
          _1703 = _1255;
          _1704 = _1256;
        }
      } else {
        _1701 = _1434;
        _1702 = _1254;
        _1703 = _1255;
        _1704 = _1256;
      }
    }
  } else {
    _1260 = _142 + -0.5f;
    _1261 = _143 + -0.5f;
    _1701 = sqrt((_1261 * _1261) + (_1260 * _1260));
    _1702 = _1254;
    _1703 = _1255;
    _1704 = _1256;
  }
  _1707 = saturate((_1701 + -0.009999999776482582f) * 1.0101009607315063f);
  _1712 = WaveReadLaneFirst(_materialIndex);
  _1720 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1712 < (uint)170000), _1712, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._vignetteIntensity);
  _1722 = WaveReadLaneFirst(_materialIndex);
  _1730 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_1722 < (uint)170000), _1722, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _1732 = 1.0f - ((((_1707 * _1707) * (3.0f - (_1707 * 2.0f))) * _1720) * _1730);
  _1739 = max(0.0f, (_1732 * (_1702 + _878)));
  _1740 = max(0.0f, (_1732 * (_1703 + _879)));
  _1741 = max(0.0f, (_1732 * (_1704 + _880)));
  _1742 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1755 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1742, 0)))).x) & 127))) + 0.5f);
  } else {
    _1755 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1739, _1740, _1741));
    _2177 = output_color.x;
    _2178 = output_color.y;
    _2179 = output_color.z;
  } else {
    _2177 = _1739;
    _2178 = _1740;
    _2179 = _1741;
  }
  if (_etcParams.y > 1.0f) {
    _2190 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _2191 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _2195 = saturate(1.0f - (dot(float2(_2190, _2191), float2(_2190, _2191)) * saturate(_etcParams.y + -1.0f)));
    _2200 = (_2195 * _2177);
    _2201 = (_2195 * _2178);
    _2202 = (_2195 * _2179);
  } else {
    _2200 = _2177;
    _2201 = _2178;
    _2202 = _2179;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2235 = select((_2200 <= 0.0031308000907301903f), (_2200 * 12.920000076293945f), (((pow(_2200, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2236 = select((_2201 <= 0.0031308000907301903f), (_2201 * 12.920000076293945f), (((pow(_2201, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2237 = select((_2202 <= 0.0031308000907301903f), (_2202 * 12.920000076293945f), (((pow(_2202, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2235 = _2200;
    _2236 = _2201;
    _2237 = _2202;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2242 = float((uint)_1742);
    if (!(_2242 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2242 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2251 = _2235;
        _2252 = _2236;
        _2253 = _2237;
      } else {
        _2251 = 0.0f;
        _2252 = 0.0f;
        _2253 = 0.0f;
      }
    } else {
      _2251 = 0.0f;
      _2252 = 0.0f;
      _2253 = 0.0f;
    }
  } else {
    _2251 = _2235;
    _2252 = _2236;
    _2253 = _2237;
  }
  SV_Target.x = _2251;
  SV_Target.y = _2252;
  SV_Target.z = _2253;
  SV_Target.w = _1755;
  return SV_Target;
}