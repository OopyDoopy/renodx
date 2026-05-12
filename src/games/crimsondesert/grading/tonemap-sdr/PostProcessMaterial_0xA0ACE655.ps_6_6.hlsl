#include "../tonemap.hlsli"

struct PostProcessLensFlareForGimmick_CDStruct {
  uint _lensDirtTexture;
  uint _lensColorTableTexture;
  uint _noiseTex;
  uint _noiseTex2;
  float _lensflareRatio;
  float _sunFlareScale;
  float _sunFlareIntensity;
  float _sunFlareAnimSpeed;
  float _sunFlareWeightThreshold;
  float _sunFlareWeightIntensity;
  float _lensDirtIntensity;
  float _lensDirtThreshold;
  float _chromaticShiftValue;
  float _useFishUV;
  float _fishEyeIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessLensFlareForGimmick_CD {
  PostProcessLensFlareForGimmick_CDStruct BindlessParameters_PostProcessLensFlareForGimmick_CD;
};

typedef BindlessParameters_PostProcessLensFlareForGimmick_CD BindlessParameters_PostProcessLensFlareForGimmick_CD_t;
ConstantBuffer<BindlessParameters_PostProcessLensFlareForGimmick_CD_t> BindlessParameters_PostProcessLensFlareForGimmick_CD[] : register(b0, space100);

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
  float _28;
  int _29;
  float _37;
  float _43;
  float _44;
  float _45;
  float _46;
  float _47;
  float _48;
  float _49;
  float _50;
  bool _51;
  float _59;
  float _96;
  float _97;
  float _1012;
  float _1013;
  float _1014;
  int _1015;
  float _1357;
  float _1380;
  float _1402;
  float _1423;
  float _1445;
  float _1464;
  float _1483;
  float _1502;
  float _1567;
  float _1568;
  float _1569;
  int _1570;
  float _1812;
  float _1813;
  float _1814;
  float _1815;
  float _1829;
  float _2034;
  float _2035;
  float _2036;
  float _2129;
  float _2130;
  float _2131;
  float _2251;
  float _2252;
  float _2253;
  float _2274;
  float _2275;
  float _2276;
  float _2309;
  float _2310;
  float _2311;
  float _2325;
  float _2326;
  float _2327;
  float _61;
  float _63;
  float _71;
  float _79;
  float _80;
  float _82;
  float _90;
  int _99;
  float _107;
  bool _108;
  float _111;
  float _112;
  float _113;
  float _153;
  float _156;
  float _157;
  float _159;
  int _203;
  int _211;
  float4 _218;
  float _232;
  float _233;
  int _234;
  int _242;
  float _243;
  float _245;
  float _246;
  float _247;
  float _251;
  float _253;
  float _257;
  float _258;
  float _261;
  float _262;
  float _265;
  float _266;
  float _270;
  float _275;
  float _277;
  bool _280;
  bool _281;
  bool _282;
  bool _283;
  float _309;
  bool _312;
  bool _313;
  bool _314;
  bool _315;
  float _328;
  float _333;
  float _334;
  float _344;
  float _345;
  float _360;
  float _364;
  float _366;
  float _367;
  float _371;
  int _385;
  int _393;
  float _394;
  float _395;
  float _399;
  float _404;
  float _406;
  bool _409;
  bool _410;
  bool _411;
  bool _412;
  float _438;
  bool _441;
  bool _442;
  bool _443;
  bool _444;
  float _457;
  float _462;
  float _463;
  float _480;
  float _484;
  float _492;
  float _494;
  float _507;
  float _510;
  float _511;
  float _514;
  float _515;
  float _518;
  float _521;
  float _522;
  float _523;
  float _531;
  float _532;
  float _533;
  float _535;
  float _538;
  float _539;
  float _541;
  float _544;
  float _548;
  float _549;
  float _560;
  float _563;
  float _585;
  float _589;
  float _597;
  float _602;
  float _614;
  float _615;
  float _618;
  float _621;
  float _622;
  float _623;
  float _631;
  float _632;
  float _633;
  float _635;
  float _638;
  float _639;
  float _641;
  float _644;
  float _648;
  float _649;
  float _660;
  float _663;
  float _687;
  float _688;
  float _692;
  float _700;
  float _702;
  float _714;
  float _715;
  float _718;
  float _721;
  float _722;
  float _723;
  float _731;
  float _732;
  float _733;
  float _735;
  float _738;
  float _739;
  float _741;
  float _744;
  float _748;
  float _749;
  float _760;
  float _763;
  float _785;
  float _789;
  float _797;
  float _800;
  float _803;
  float _815;
  float _816;
  float _819;
  float _822;
  float _823;
  float _824;
  float _832;
  float _833;
  float _834;
  float _836;
  float _839;
  float _840;
  float _842;
  float _845;
  float _849;
  float _850;
  float _861;
  float _864;
  float _886;
  float _890;
  float _898;
  float _901;
  float _903;
  float _915;
  float _916;
  float _919;
  float _922;
  float _923;
  float _924;
  float _932;
  float _933;
  float _934;
  float _936;
  float _939;
  float _940;
  float _942;
  float _945;
  float _949;
  float _950;
  float _961;
  float _964;
  float _989;
  float _992;
  float _997;
  int _1016;
  float _1017;
  float _1026;
  float _1030;
  float _1038;
  float _1047;
  float _1069;
  float _1070;
  float _1071;
  float _1072;
  float _1084;
  float _1085;
  float _1088;
  float _1091;
  float _1092;
  float _1093;
  float _1101;
  float _1102;
  float _1103;
  float _1105;
  float _1108;
  float _1109;
  float _1111;
  float _1114;
  float _1120;
  float _1121;
  float _1132;
  float _1135;
  float _1153;
  float _1154;
  float _1166;
  float _1167;
  float _1170;
  float _1173;
  float _1174;
  float _1175;
  float _1183;
  float _1184;
  float _1185;
  float _1187;
  float _1190;
  float _1191;
  float _1193;
  float _1196;
  float _1202;
  float _1203;
  float _1214;
  float _1217;
  float _1239;
  float _1240;
  float _1241;
  float _1242;
  float _1259;
  float _1282;
  float _1306;
  float _1307;
  float _1321;
  float _1322;
  float _1323;
  float _1324;
  uint2 _1326;
  float _1335;
  float _1336;
  int _1339;
  int _1340;
  int _1363;
  float _1383;
  int _1385;
  int _1406;
  float _1426;
  int _1428;
  float _1546;
  float _1555;
  float _1562;
  int _1577;
  float _1578;
  float _1583;
  float _1586;
  float _1590;
  float _1598;
  float _1600;
  float _1612;
  float _1620;
  float _1621;
  float _1634;
  float _1635;
  float _1638;
  float _1641;
  float _1642;
  float _1643;
  float _1651;
  float _1652;
  float _1653;
  float _1655;
  float _1658;
  float _1659;
  float _1661;
  float _1664;
  float _1666;
  float _1671;
  float _1673;
  float _1684;
  float _1687;
  float _1707;
  float _1708;
  float _1713;
  float _1717;
  float _1730;
  float _1731;
  float _1734;
  float _1737;
  float _1738;
  float _1739;
  float _1747;
  float _1748;
  float _1749;
  float _1751;
  float _1754;
  float _1755;
  float _1757;
  float _1760;
  float _1762;
  float _1767;
  float _1769;
  float _1780;
  float _1783;
  float _1803;
  float _1807;
  float _1808;
  float _1809;
  uint _1816;
  float _1838;
  float _1887;
  float _1888;
  float _1889;
  float _1891;
  float _1898;
  float _1899;
  float _1900;
  float _1919;
  float _1920;
  float _1921;
  float _1922;
  float _1923;
  float _1924;
  float _1925;
  float _1926;
  float _1927;
  float _1973;
  float _1974;
  float _1975;
  float _1976;
  float _1977;
  float _1978;
  float _1979;
  float _1996;
  float _1997;
  float _1998;
  float _1999;
  float _2005;
  float _2008;
  float _2015;
  float _2016;
  float _2017;
  float _2046;
  float _2071;
  float _2072;
  float _2073;
  float _2092;
  float _2093;
  float _2094;
  float _2100;
  float _2104;
  float _2105;
  float _2106;
  float _2107;
  float _2112;
  float _2137;
  float _2141;
  float _2142;
  float _2143;
  float _2144;
  int _2185;
  float _2240;
  float _2264;
  float _2265;
  float _2269;
  float _2316;
  float _2337;
  float _2338;
  float _2339;
  float _22[36];
  _28 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._fishEyeIntensity);
  _43 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  _44 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  _45 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _46 = 0.5f / _45;
  _47 = _43 + -0.5f;
  _48 = _44 - _46;
  _49 = dot(float2(_47, _48), float2(_47, _48));
  _50 = sqrt(_49);
  _51 = (_37 > 0.0f);
  if (_51) {
    _59 = sqrt(dot(float2(0.5f, _46), float2(0.5f, _46)));
  } else {
    if (!(_45 < 1.0f)) {
      _59 = _46;
    } else {
      _59 = 0.5f;
    }
  }
  if (_51) {
    _61 = rsqrt(_49);
    _63 = tan(_50 * _37);
    _71 = tan(_59 * _37);
    _96 = (((((_59 * _47) * _61) * _63) / _71) + 0.5f);
    _97 = (((((_59 * _48) * _61) * _63) / _71) + _46);
  } else {
    if (_37 < 0.0f) {
      _79 = rsqrt(_49);
      _80 = _37 * -10.0f;
      _82 = atan(_50 * _80);
      _90 = atan(_59 * _80);
      _96 = (((((_59 * _47) * _79) * _82) / _90) + 0.5f);
      _97 = (((((_59 * _48) * _79) * _82) / _90) + _46);
    } else {
      _96 = _43;
      _97 = _44;
    }
  }
  _99 = WaveReadLaneFirst(_materialIndex);
  _107 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._useFishUV);
  _108 = (_107 == 1.0f);
  _111 = select(_108, _96, TEXCOORD.x) + -0.5f;
  _112 = select(_108, (_97 * _45), TEXCOORD.y) + -0.5f;
  _113 = _111 * _28;
  _153 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
  _156 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].z), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].z), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].z) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].z)) / _153;
  _157 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _153) * -0.5f;
  _159 = (_28 * 0.5f) * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _153);
  if ((abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f) || ((!(abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f)) && (abs(_questGuideWorldPosition.y) > 9.999999747378752e-06f))) {
    if (!((_157 >= 1.0499999523162842f) || ((_157 <= -1.5f) || ((_159 >= 1.600000023841858f) || ((_156 < 0.0f) || (_159 <= -1.600000023841858f)))))) {
      _203 = WaveReadLaneFirst(_materialIndex);
      _211 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_203 < (uint)170000), _203, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensColorTableTexture);
      _218 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_211 < (uint)65000), _211, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((sqrt((_111 * _111) + (_112 * _112)) * 2.0f), 0.5f));
      _232 = -0.0f - _159;
      _233 = -0.0f - _157;
      _234 = WaveReadLaneFirst(_materialIndex);
      _242 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex2);
      _243 = -0.0f - _113;
      _245 = rsqrt(dot(float3(_112, _243, 0.0f), float3(_112, _243, 0.0f)));
      _246 = _245 * _112;
      _247 = _245 * _243;
      _251 = sqrt((_112 * _112) + (_113 * _113));
      _253 = cos(_251 * 1.5f);
      _257 = 1.0f - _253;
      _258 = _257 * dot(float3(_246, _247, 0.0f), float3(_232, _233, 0.0f));
      _261 = (_258 * _246) + (_253 * _232);
      _262 = (_258 * _247) + (_253 * _233);
      _265 = _113 - (_261 * 0.5666666626930237f);
      _266 = _112 - (_262 * 0.5666666626930237f);
      _270 = sqrt((_265 * _265) + (_266 * _266));
      _275 = (pow(_270, 0.5f));
      _277 = atan(_266 / _265);
      _280 = (_265 < 0.0f);
      _281 = (_265 == 0.0f);
      _282 = (_266 >= 0.0f);
      _283 = (_266 < 0.0f);
      _309 = atan((-0.0f - _266) / (-0.0f - _265));
      _312 = (_265 > -0.0f);
      _313 = (_265 == -0.0f);
      _314 = (_266 <= -0.0f);
      _315 = (_266 > -0.0f);
      _328 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f;
      _333 = max((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_281 && _282), 18.84955596923828f, select((_281 && _283), -18.84955596923828f, (select((_280 && _283), (_277 + -3.1415927410125732f), select((_280 && _282), (_277 + 3.1415927410125732f), _277)) * 12.0f))), (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _275) * 12.0f))))).x), (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((select((_313 && _314), 18.84955596923828f, select((_313 && _315), -18.84955596923828f, (select((_312 && _315), (_309 + -3.1415927410125732f), select((_312 && _314), (_309 + 3.1415927410125732f), _309)) * 12.0f))) + _328), (_328 + (_275 * 12.0f)))))).x));
      _334 = _333 * _333;
      _344 = _265 - _261;
      _345 = _266 - _262;
      _360 = log2(1.0f - saturate(exp2(log2(sqrt((_261 * _261) + (_262 * _262))) * 0.5f)));
      _364 = TEXCOORD.x * 0.10000000149011612f;
      _366 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.6800000667572021f) + _364;
      _367 = _366 + 16.80000114440918f;
      _371 = frac(sin(floor(_367)) * 43758.546875f);
      _385 = WaveReadLaneFirst(_materialIndex);
      _393 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex2);
      _394 = _261 + _113;
      _395 = _262 + _112;
      _399 = sqrt((_394 * _394) + (_395 * _395));
      _404 = (pow(_399, 0.5f));
      _406 = atan(_395 / _394);
      _409 = (_394 < 0.0f);
      _410 = (_394 == 0.0f);
      _411 = (_395 >= 0.0f);
      _412 = (_395 < 0.0f);
      _438 = atan((-0.0f - _395) / (-0.0f - _394));
      _441 = (_394 > -0.0f);
      _442 = (_394 == -0.0f);
      _443 = (_395 <= -0.0f);
      _444 = (_395 > -0.0f);
      _457 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f;
      _462 = max((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_393 < (uint)65000), _393, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_410 && _411), 18.84955596923828f, select((_410 && _412), -18.84955596923828f, (select((_409 && _412), (_406 + -3.1415927410125732f), select((_409 && _411), (_406 + 3.1415927410125732f), _406)) * 12.0f))), (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _404) * 12.0f))))).x), (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_393 < (uint)65000), _393, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((select((_442 && _443), 18.84955596923828f, select((_442 && _444), -18.84955596923828f, (select((_441 && _444), (_438 + -3.1415927410125732f), select((_441 && _443), (_438 + 3.1415927410125732f), _438)) * 12.0f))) + _457), (_457 + (_404 * 12.0f)))))).x));
      _463 = _462 * _462;
      _480 = _366 + 4.59375f;
      _484 = frac(sin(floor(_480)) * 43758.546875f);
      _492 = (frac(_480) * (frac(sin(ceil(_480)) * 43758.546875f) - _484)) + _484;
      _494 = (_492 * 0.050000011920928955f) + 0.44999998807907104f;
      _507 = dot(float3(_246, _247, 0.0f), float3(_159, _157, 0.0f)) * _257;
      _510 = (_507 * _246) + (_253 * _159);
      _511 = (_507 * _247) + (_253 * _157);
      _514 = _113 - (_510 * _494);
      _515 = _112 - (_511 * _494);
      _518 = (_514 * 0.9553365111351013f) + (_515 * 0.29552021622657776f);
      _521 = (_515 * 0.9553365111351013f) - (_514 * 0.29552021622657776f);
      _522 = _510 - _518;
      _523 = _511 - _521;
      _531 = saturate(exp2(log2(sqrt((_522 * _522) + (_523 * _523))) * 15.0f));
      _532 = abs(_518);
      _533 = abs(_521);
      _535 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_532, _533)), 0.0f);
      _538 = (_535 * 1.8477590084075928f) + _532;
      _539 = _533 - (_535 * 0.7653668522834778f);
      _541 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_538, _539)), 0.0f);
      _544 = _538 - (_541 * 1.8477590084075928f);
      _548 = _544 - min(max(_544, -0.06006096675992012f), 0.06006096675992012f);
      _549 = (_539 - (_541 * 0.7653668522834778f)) + -0.14499999582767487f;
      _560 = float((int)(((int)(uint)((int)(_549 > 0.0f))) - ((int)(uint)((int)(_549 < 0.0f))))) * sqrt((_548 * _548) + (_549 * _549));
      _563 = saturate(abs(_560) * 200.0f);
      _585 = _366 + 4.46250057220459f;
      _589 = frac(sin(floor(_585)) * 43758.546875f);
      _597 = (frac(_585) * (frac(sin(ceil(_585)) * 43758.546875f) - _589)) + _589;
      _602 = (_597 * 0.08000002056360245f) + 0.7199999690055847f;
      _614 = _113 - (_602 * _510);
      _615 = _112 - (_602 * _511);
      _618 = (_614 * 0.9553365111351013f) + (_615 * 0.29552021622657776f);
      _621 = (_615 * 0.9553365111351013f) - (_614 * 0.29552021622657776f);
      _622 = _510 - _618;
      _623 = _511 - _621;
      _631 = saturate(exp2(log2(sqrt((_622 * _622) + (_623 * _623))) * 15.0f));
      _632 = abs(_618);
      _633 = abs(_621);
      _635 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_632, _633)), 0.0f);
      _638 = (_635 * 1.8477590084075928f) + _632;
      _639 = _633 - (_635 * 0.7653668522834778f);
      _641 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_638, _639)), 0.0f);
      _644 = _638 - (_641 * 1.8477590084075928f);
      _648 = _644 - min(max(_644, -0.08491378277540207f), 0.08491378277540207f);
      _649 = (_639 - (_641 * 0.7653668522834778f)) + -0.20499999821186066f;
      _660 = float((int)(((int)(uint)((int)(_649 > 0.0f))) - ((int)(uint)((int)(_649 < 0.0f))))) * sqrt((_648 * _648) + (_649 * _649));
      _663 = saturate(abs(_660) * 200.0f);
      _687 = (saturate(saturate(exp2(log2(saturate(1.0f - _660)) * (5.0f / ((_597 * 0.00800000224262476f) + 0.07199999690055847f)))) - _631) + (saturate((1.0f - _631) - saturate((_663 * _663) * (3.0f - (_663 * 2.0f)))) * 0.4000000059604645f)) * ((_492 * 0.8999999761581421f) + 0.10000000149011612f);
      _688 = _366 + 1.7308595180511475f;
      _692 = frac(sin(floor(_688)) * 43758.546875f);
      _700 = (frac(_688) * (frac(sin(ceil(_688)) * 43758.546875f) - _692)) + _692;
      _702 = 1.5f - (_700 * 0.15000003576278687f);
      _714 = _113 - (_702 * _261);
      _715 = _112 - (_702 * _262);
      _718 = (_714 * 0.9553365111351013f) + (_715 * 0.29552021622657776f);
      _721 = (_715 * 0.9553365111351013f) - (_714 * 0.29552021622657776f);
      _722 = _261 - _718;
      _723 = _262 - _721;
      _731 = saturate(exp2(log2(sqrt((_722 * _722) + (_723 * _723))) * 15.0f));
      _732 = abs(_718);
      _733 = abs(_721);
      _735 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_732, _733)), 0.0f);
      _738 = (_735 * 1.8477590084075928f) + _732;
      _739 = _733 - (_735 * 0.7653668522834778f);
      _741 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_738, _739)), 0.0f);
      _744 = _738 - (_741 * 1.8477590084075928f);
      _748 = _744 - min(max(_744, -0.12633514404296875f), 0.12633514404296875f);
      _749 = (_739 - (_741 * 0.7653668522834778f)) + -0.3050000071525574f;
      _760 = float((int)(((int)(uint)((int)(_749 > 0.0f))) - ((int)(uint)((int)(_749 < 0.0f))))) * sqrt((_748 * _748) + (_749 * _749));
      _763 = saturate(abs(_760) * 200.0f);
      _785 = _366 + 4.856250286102295f;
      _789 = frac(sin(floor(_785)) * 43758.546875f);
      _797 = (frac(_785) * (frac(sin(ceil(_785)) * 43758.546875f) - _789)) + _789;
      _800 = ((_797 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _760)) * (5.0f / (0.15000000596046448f - (_700 * 0.015000003390014172f))))) - _731) + (saturate((1.0f - _731) - saturate((_763 * _763) * (3.0f - (_763 * 2.0f)))) * 0.4000000059604645f));
      _803 = 0.5f - (_797 * 0.050000011920928955f);
      _815 = _113 - (_803 * _261);
      _816 = _112 - (_803 * _262);
      _819 = (_815 * 0.9553365111351013f) + (_816 * 0.29552021622657776f);
      _822 = (_816 * 0.9553365111351013f) - (_815 * 0.29552021622657776f);
      _823 = _261 - _819;
      _824 = _262 - _822;
      _832 = saturate(exp2(log2(sqrt((_823 * _823) + (_824 * _824))) * 15.0f));
      _833 = abs(_819);
      _834 = abs(_822);
      _836 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_833, _834)), 0.0f);
      _839 = (_836 * 1.8477590084075928f) + _833;
      _840 = _834 - (_836 * 0.7653668522834778f);
      _842 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_839, _840)), 0.0f);
      _845 = _839 - (_842 * 1.8477590084075928f);
      _849 = _845 - min(max(_845, -0.08491378277540207f), 0.08491378277540207f);
      _850 = (_840 - (_842 * 0.7653668522834778f)) + -0.20499999821186066f;
      _861 = float((int)(((int)(uint)((int)(_850 > 0.0f))) - ((int)(uint)((int)(_850 < 0.0f))))) * sqrt((_849 * _849) + (_850 * _850));
      _864 = saturate(abs(_861) * 200.0f);
      _886 = _366 + 1.1156251430511475f;
      _890 = frac(sin(floor(_886)) * 43758.546875f);
      _898 = (frac(_886) * (frac(sin(ceil(_886)) * 43758.546875f) - _890)) + _890;
      _901 = ((_898 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _861)) * (5.0f / (0.05000000074505806f - (_797 * 0.005000001285225153f))))) - _832) + (saturate((1.0f - _832) - saturate((_864 * _864) * (3.0f - (_864 * 2.0f)))) * 0.4000000059604645f));
      _903 = 0.20000000298023224f - (_898 * 0.020000005140900612f);
      _915 = _113 - (_903 * _261);
      _916 = _112 - (_903 * _262);
      _919 = (_915 * 0.9553365111351013f) + (_916 * 0.29552021622657776f);
      _922 = (_916 * 0.9553365111351013f) - (_915 * 0.29552021622657776f);
      _923 = _261 - _919;
      _924 = _262 - _922;
      _932 = saturate(exp2(log2(sqrt((_923 * _923) + (_924 * _924))) * 15.0f));
      _933 = abs(_919);
      _934 = abs(_922);
      _936 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_933, _934)), 0.0f);
      _939 = (_936 * 1.8477590084075928f) + _933;
      _940 = _934 - (_936 * 0.7653668522834778f);
      _942 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_939, _940)), 0.0f);
      _945 = _939 - (_942 * 1.8477590084075928f);
      _949 = _945 - min(max(_945, -0.06834524124860764f), 0.06834524124860764f);
      _950 = (_940 - (_942 * 0.7653668522834778f)) + -0.16500000655651093f;
      _961 = float((int)(((int)(uint)((int)(_950 > 0.0f))) - ((int)(uint)((int)(_950 < 0.0f))))) * sqrt((_949 * _949) + (_950 * _950));
      _964 = saturate(abs(_961) * 200.0f);
      _989 = ((saturate(saturate(exp2(log2(saturate(1.0f - _961)) * (1.0f / (0.020000001415610313f - (_898 * 0.00200000056065619f))))) - _932) + (saturate((1.0f - _932) - saturate((_964 * _964) * (3.0f - (_964 * 2.0f)))) * 0.4000000059604645f)) * ((_700 * 0.8999999761581421f) + 0.10000000149011612f)) + (((_597 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _560)) * (5.0f / ((_492 * 0.005000001285225153f) + 0.044999998062849045f)))) - _531) + (saturate((1.0f - _531) - saturate((_563 * _563) * (3.0f - (_563 * 2.0f)))) * 0.4000000059604645f)));
      _992 = _901 + _687;
      _997 = _218.w * 0.07999999821186066f;
      _1012 = 0.0f;
      _1013 = 0.0f;
      _1014 = 0.0f;
      _1015 = 0;
      while(true) {
        _1016 = _1015 + 1;
        _1017 = float((int)(_1016));
        _1026 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.5199999809265137f) * frac(sin(float((int)(_1015))) * 43758.546875f)) + _364;
        _1030 = frac(sin(floor(_1026)) * 43758.546875f);
        _1038 = (frac(_1026) * (frac(sin(ceil(_1026)) * 43758.546875f) - _1030)) + _1030;
        _1047 = (_1038 * 0.1599999964237213f) + 0.64000004529953f;
        _1069 = _1017 * 0.07000000029802322f;
        _1070 = (((frac(sin(_1017 * 10.0f) * 43758.546875f) + -1.0f) * _1047) + 1.0f) * _1069;
        _1071 = _1017 * 0.0010000000474974513f;
        _1072 = (((frac(sin(_1017 * 2000.0f) * 43758.546875f) + -1.0f) * 0.20000000298023224f) + 1.0f) * _1071;
        _1084 = _113 - (_1070 * _159);
        _1085 = _112 - (_1070 * _157);
        _1088 = (_1084 * 0.9553365111351013f) + (_1085 * 0.29552021622657776f);
        _1091 = (_1085 * 0.9553365111351013f) - (_1084 * 0.29552021622657776f);
        _1092 = _159 - _1088;
        _1093 = _157 - _1091;
        _1101 = saturate(exp2(log2(sqrt((_1092 * _1092) + (_1093 * _1093))) * 15.0f));
        _1102 = abs(_1088);
        _1103 = abs(_1091);
        _1105 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1102, _1103)), 0.0f);
        _1108 = (_1105 * 1.8477590084075928f) + _1102;
        _1109 = _1103 - (_1105 * 0.7653668522834778f);
        _1111 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1108, _1109)), 0.0f);
        _1114 = _1108 - (_1111 * 1.8477590084075928f);
        _1120 = _1114 - min(max(_1114, (_1072 * -0.4142135679721832f)), (_1072 * 0.4142135679721832f));
        _1121 = (_1109 - (_1111 * 0.7653668522834778f)) - _1072;
        _1132 = float((int)(((int)(uint)((int)(_1121 > 0.0f))) - ((int)(uint)((int)(_1121 < 0.0f))))) * sqrt((_1120 * _1120) + (_1121 * _1121));
        _1135 = saturate(abs(_1132) * 200.0f);
        _1153 = (((frac(sin(_1017 * 5.0f) * 43758.546875f) + -1.0f) * _1047) + 1.0f) * _1069;
        _1154 = (((frac(sin(_1017 * 20.0f) * 43758.546875f) + -1.0f) * 0.20000000298023224f) + 1.0f) * _1071;
        _1166 = _113 - (_1153 * _232);
        _1167 = _112 - (_1153 * _233);
        _1170 = (_1166 * 0.9553365111351013f) + (_1167 * 0.29552021622657776f);
        _1173 = (_1167 * 0.9553365111351013f) - (_1166 * 0.29552021622657776f);
        _1174 = _232 - _1170;
        _1175 = _233 - _1173;
        _1183 = saturate(exp2(log2(sqrt((_1174 * _1174) + (_1175 * _1175))) * 15.0f));
        _1184 = abs(_1170);
        _1185 = abs(_1173);
        _1187 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1184, _1185)), 0.0f);
        _1190 = (_1187 * 1.8477590084075928f) + _1184;
        _1191 = _1185 - (_1187 * 0.7653668522834778f);
        _1193 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1190, _1191)), 0.0f);
        _1196 = _1190 - (_1193 * 1.8477590084075928f);
        _1202 = _1196 - min(max(_1196, (_1154 * -0.4142135679721832f)), (_1154 * 0.4142135679721832f));
        _1203 = (_1191 - (_1193 * 0.7653668522834778f)) - _1154;
        _1214 = float((int)(((int)(uint)((int)(_1203 > 0.0f))) - ((int)(uint)((int)(_1203 < 0.0f))))) * sqrt((_1202 * _1202) + (_1203 * _1203));
        _1217 = saturate(abs(_1214) * 200.0f);
        _1239 = ((saturate(saturate(exp2(log2(saturate(1.0f - _1214)) * (100.0f / _1153))) - _1183) + saturate(saturate(exp2(log2(saturate(1.0f - _1132)) * (100.0f / _1070))) - _1101)) + ((saturate((1.0f - _1183) - saturate((_1217 * _1217) * (3.0f - (_1217 * 2.0f)))) + saturate((1.0f - _1101) - saturate((_1135 * _1135) * (3.0f - (_1135 * 2.0f))))) * 0.4000000059604645f)) * _1038;
        _1240 = _1239 + _1012;
        _1241 = _1239 + _1013;
        _1242 = _1239 + _1014;
        if (!(_1016 == 20)) {
          _1012 = _1240;
          _1013 = _1241;
          _1014 = _1242;
          _1015 = _1016;
          continue;
        }
        while(true) {
          _1567 = 0.0f;
          _1568 = 0.0f;
          _1569 = 0.0f;
          _1570 = 0;
          while(true) {
            _1577 = _1570 + 1;
            _1578 = float((int)(_1577));
            _1583 = frac(sin(_1578 * 300.0f) * 43758.546875f) + -1.0f;
            _1586 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.5199999809265137f) * frac(sin(float((int)(_1570))) * 43758.546875f)) + _364;
            _1590 = frac(sin(floor(_1586)) * 43758.546875f);
            _1598 = (frac(_1586) * (frac(sin(ceil(_1586)) * 43758.546875f) - _1590)) + _1590;
            _1600 = (_1598 * 0.037500008940696716f) + 0.7124999761581421f;
            _1612 = frac(sin(_1578 * 170.0f) * 43758.546875f) + -1.0f;
            _1620 = _1578 * 0.15000000596046448f;
            _1621 = ((_1600 * (frac(sin(_1578 * 110.0f) * 43758.546875f) + -1.0f)) + 1.0f) * _1620;
            _1634 = _113 - (_1621 * _510);
            _1635 = _112 - (_1621 * _511);
            _1638 = (_1634 * 0.9553365111351013f) + (_1635 * 0.29552021622657776f);
            _1641 = (_1635 * 0.9553365111351013f) - (_1634 * 0.29552021622657776f);
            _1642 = _510 - _1638;
            _1643 = _511 - _1641;
            _1651 = saturate(exp2(log2(sqrt((_1642 * _1642) + (_1643 * _1643))) * 15.0f));
            _1652 = abs(_1638);
            _1653 = abs(_1641);
            _1655 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1652, _1653)), 0.0f);
            _1658 = (_1655 * 1.8477590084075928f) + _1652;
            _1659 = _1653 - (_1655 * 0.7653668522834778f);
            _1661 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1658, _1659)), 0.0f);
            _1664 = _1658 - (_1661 * 1.8477590084075928f);
            _1666 = _1583 * 0.0124264070764184f;
            _1671 = _1664 - min(max(_1664, (-0.02071067877113819f - _1666)), (_1666 + 0.02071067877113819f));
            _1673 = (_1659 - (_1661 * 0.7653668522834778f)) + (-0.05000000074505806f - (_1583 * 0.030000001192092896f));
            _1684 = float((int)(((int)(uint)((int)(_1673 > 0.0f))) - ((int)(uint)((int)(_1673 < 0.0f))))) * sqrt((_1671 * _1671) + (_1673 * _1673));
            _1687 = saturate(abs(_1684) * 200.0f);
            _1707 = _1578 * 0.10000000149011612f;
            _1708 = (saturate(saturate(exp2(log2(saturate(1.0f - _1684)) * (300.0f / _1621))) - _1651) + (saturate((1.0f - _1651) - saturate((_1687 * _1687) * (3.0f - (_1687 * 2.0f)))) * 0.4000000059604645f)) * _1707;
            _1713 = (_1598 * 0.5f) + 0.5f;
            _1717 = (((frac(sin(_1578 * 15.0f) * 43758.546875f) + -1.0f) * _1600) + 1.0f) * _1620;
            _1730 = _113 - (_1717 * _261);
            _1731 = _112 - (_1717 * _262);
            _1734 = (_1730 * 0.9553365111351013f) + (_1731 * 0.29552021622657776f);
            _1737 = (_1731 * 0.9553365111351013f) - (_1730 * 0.29552021622657776f);
            _1738 = _261 - _1734;
            _1739 = _262 - _1737;
            _1747 = saturate(exp2(log2(sqrt((_1738 * _1738) + (_1739 * _1739))) * 15.0f));
            _1748 = abs(_1734);
            _1749 = abs(_1737);
            _1751 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1748, _1749)), 0.0f);
            _1754 = (_1751 * 1.8477590084075928f) + _1748;
            _1755 = _1749 - (_1751 * 0.7653668522834778f);
            _1757 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1754, _1755)), 0.0f);
            _1760 = _1754 - (_1757 * 1.8477590084075928f);
            _1762 = _1612 * 0.0124264070764184f;
            _1767 = _1760 - min(max(_1760, (-0.02071067877113819f - _1762)), (_1762 + 0.02071067877113819f));
            _1769 = (_1755 - (_1757 * 0.7653668522834778f)) + (-0.05000000074505806f - (_1612 * 0.030000001192092896f));
            _1780 = float((int)(((int)(uint)((int)(_1769 > 0.0f))) - ((int)(uint)((int)(_1769 < 0.0f))))) * sqrt((_1767 * _1767) + (_1769 * _1769));
            _1783 = saturate(abs(_1780) * 200.0f);
            _1803 = (saturate(saturate(exp2(log2(saturate(1.0f - _1780)) * (300.0f / _1717))) - _1747) + (saturate((1.0f - _1747) - saturate((_1783 * _1783) * (3.0f - (_1783 * 2.0f)))) * 0.4000000059604645f)) * _1707;
            _1807 = (_1803 + ((_1708 + _1567) * _1713)) * _1713;
            _1808 = (_1803 + ((_1708 + _1568) * _1713)) * _1713;
            _1809 = (_1803 + ((_1708 + _1569) * _1713)) * _1713;
            if (!(_1577 == 10)) {
              _1567 = _1807;
              _1568 = _1808;
              _1569 = _1809;
              _1570 = _1577;
              continue;
            }
            while(true) {
              _1259 = saturate(exp2(log2(_218.w)) * 4.0f);
              _1282 = ((((exp2(log2(saturate(1.0f - (abs(_399 + -0.25f) * 3.0f))) * 5.199999809265137f) * 0.20000000298023224f) * (lerp(_463, 1.0f, 0.4000000059604645f))) * saturate(exp2((_251 * 6.0f) * _360))) + (((exp2(log2(saturate(1.0f - (abs(_270 + -0.550000011920929f) * 3.0f))) * 5.199999809265137f) * 0.14000000059604645f) * (lerp(_334, 1.0f, 0.4000000059604645f))) * saturate(exp2((sqrt((_344 * _344) + (_345 * _345)) * 2.7272725105285645f) * _360)))) * ((((frac(_367) * (frac(sin(ceil(_367)) * 43758.546875f) - _371)) + _371) * 0.800000011920929f) + 0.20000000298023224f);
              _1306 = ((_srcTargetSizeAndInv.x * ((_159 * 0.5f) + 0.5f)) + 0.5f) * _srcTargetSizeAndInv.z;
              _1307 = ((_srcTargetSizeAndInv.y * ((_157 * 0.5f) + 0.5f)) + 0.5f) * _srcTargetSizeAndInv.w;
              _1321 = dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x)), ((-0.0f - _questGuideWorldPosition.y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z))));
              _1322 = 5.0f / _srcTargetSizeAndInv.x;
              _1323 = _1306 - _1322;
              _1324 = _1322 + _1307;
              __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_1326.x, _1326.y);
              _1335 = float((int)(int(float((int)((int)(_1326.x)))))) + 0.5f;
              _1336 = float((int)(int(float((int)((int)(_1326.y)))))) + 0.5f;
              _1339 = int(_1335 * _1323);
              _1340 = int(_1336 * _1324);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1340, 0)))).x) & 255) == 201) {
                _1357 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1357 = 0.0f;
              }
              _1363 = int(_1335 * _1306);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1363, _1340, 0)))).x) & 255) == 201) {
                _1380 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1306), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1380 = 0.0f;
              }
              _1383 = _1322 + _1306;
              _1385 = int(_1335 * _1383);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1340, 0)))).x) & 255) == 201) {
                _1402 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1402 = 0.0f;
              }
              _1406 = int(_1336 * _1307);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1406, 0)))).x) & 255) == 201) {
                _1423 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1307), 0)))).x);
              } else {
                _1423 = 0.0f;
              }
              _1426 = _1307 - _1322;
              _1428 = int(_1336 * _1426);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1428, 0)))).x) & 255) == 201) {
                _1445 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1445 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1363, _1428, 0)))).x) & 255) == 201) {
                _1464 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1306), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1464 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1428, 0)))).x) & 255) == 201) {
                _1483 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1483 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1406, 0)))).x) & 255) == 201) {
                _1502 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1307), 0)))).x);
              } else {
                _1502 = 0.0f;
              }
              _1546 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) + _questGuideWorldPosition.y;
              _1555 = saturate((sqrt(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x))) + (_1546 * _1546)) * 0.05000000074505806f) + -1.0f);
              _1562 = ((((_1555 * _1555) * 0.949999988079071f) * (3.0f - (_1555 * 2.0f))) + 0.05000000074505806f) * (_exposure2.x * 200.0f);
              _1812 = (_1562 * (((((_992 * 0.30000001192092896f) + ((_989 + _800) * 0.20000000298023224f)) * _997) + _1282) + ((((_1807 * 0.04500000178813934f) + (_1240 * 0.15000000596046448f)) * _218.x) * _1259)));
              _1813 = (_1562 * ((((((_992 * 0.4000000059604645f) + (_800 * 0.30000001192092896f)) + (_989 * 0.5f)) * _997) + _1282) + ((((_1808 * 0.07500000298023224f) + (_1241 * 0.15000000596046448f)) * _218.y) * _1259)));
              _1814 = (_1562 * ((((_218.w * 0.06400000303983688f) * (((_989 + _687) + _800) + _901)) + _1282) + ((((_1809 * 0.12000000476837158f) + (_1242 * 0.15000000596046448f)) * _218.z) * _1259)));
              _1815 = (dot(float4(saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1445)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1464)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1483)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1502)) - _1321)), float4(0.25f, 0.25f, 0.25f, 0.25f)) + dot(float4(saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1357)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1380)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1402)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1423)) - _1321)), float4(0.25f, 0.25f, 0.25f, 0.25f)));
              break;
            }
            break;
          }
          break;
        }
        break;
      }
    } else {
      _1812 = 0.0f;
      _1813 = 0.0f;
      _1814 = 0.0f;
      _1815 = 1.0f;
    }
  } else {
    if (!((_157 >= 1.0499999523162842f) || ((_157 <= -1.5f) || ((_159 >= 1.600000023841858f) || ((_159 <= -1.600000023841858f) || ((_156 < 0.0f) || (abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f))))))) {
      _203 = WaveReadLaneFirst(_materialIndex);
      _211 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_203 < (uint)170000), _203, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensColorTableTexture);
      _218 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_211 < (uint)65000), _211, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((sqrt((_111 * _111) + (_112 * _112)) * 2.0f), 0.5f));
      _232 = -0.0f - _159;
      _233 = -0.0f - _157;
      _234 = WaveReadLaneFirst(_materialIndex);
      _242 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex2);
      _243 = -0.0f - _113;
      _245 = rsqrt(dot(float3(_112, _243, 0.0f), float3(_112, _243, 0.0f)));
      _246 = _245 * _112;
      _247 = _245 * _243;
      _251 = sqrt((_112 * _112) + (_113 * _113));
      _253 = cos(_251 * 1.5f);
      _257 = 1.0f - _253;
      _258 = _257 * dot(float3(_246, _247, 0.0f), float3(_232, _233, 0.0f));
      _261 = (_258 * _246) + (_253 * _232);
      _262 = (_258 * _247) + (_253 * _233);
      _265 = _113 - (_261 * 0.5666666626930237f);
      _266 = _112 - (_262 * 0.5666666626930237f);
      _270 = sqrt((_265 * _265) + (_266 * _266));
      _275 = (pow(_270, 0.5f));
      _277 = atan(_266 / _265);
      _280 = (_265 < 0.0f);
      _281 = (_265 == 0.0f);
      _282 = (_266 >= 0.0f);
      _283 = (_266 < 0.0f);
      _309 = atan((-0.0f - _266) / (-0.0f - _265));
      _312 = (_265 > -0.0f);
      _313 = (_265 == -0.0f);
      _314 = (_266 <= -0.0f);
      _315 = (_266 > -0.0f);
      _328 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f;
      _333 = max((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_281 && _282), 18.84955596923828f, select((_281 && _283), -18.84955596923828f, (select((_280 && _283), (_277 + -3.1415927410125732f), select((_280 && _282), (_277 + 3.1415927410125732f), _277)) * 12.0f))), (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _275) * 12.0f))))).x), (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((select((_313 && _314), 18.84955596923828f, select((_313 && _315), -18.84955596923828f, (select((_312 && _315), (_309 + -3.1415927410125732f), select((_312 && _314), (_309 + 3.1415927410125732f), _309)) * 12.0f))) + _328), (_328 + (_275 * 12.0f)))))).x));
      _334 = _333 * _333;
      _344 = _265 - _261;
      _345 = _266 - _262;
      _360 = log2(1.0f - saturate(exp2(log2(sqrt((_261 * _261) + (_262 * _262))) * 0.5f)));
      _364 = TEXCOORD.x * 0.10000000149011612f;
      _366 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.6800000667572021f) + _364;
      _367 = _366 + 16.80000114440918f;
      _371 = frac(sin(floor(_367)) * 43758.546875f);
      _385 = WaveReadLaneFirst(_materialIndex);
      _393 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex2);
      _394 = _261 + _113;
      _395 = _262 + _112;
      _399 = sqrt((_394 * _394) + (_395 * _395));
      _404 = (pow(_399, 0.5f));
      _406 = atan(_395 / _394);
      _409 = (_394 < 0.0f);
      _410 = (_394 == 0.0f);
      _411 = (_395 >= 0.0f);
      _412 = (_395 < 0.0f);
      _438 = atan((-0.0f - _395) / (-0.0f - _394));
      _441 = (_394 > -0.0f);
      _442 = (_394 == -0.0f);
      _443 = (_395 <= -0.0f);
      _444 = (_395 > -0.0f);
      _457 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f;
      _462 = max((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_393 < (uint)65000), _393, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_410 && _411), 18.84955596923828f, select((_410 && _412), -18.84955596923828f, (select((_409 && _412), (_406 + -3.1415927410125732f), select((_409 && _411), (_406 + 3.1415927410125732f), _406)) * 12.0f))), (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + _404) * 12.0f))))).x), (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_393 < (uint)65000), _393, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((select((_442 && _443), 18.84955596923828f, select((_442 && _444), -18.84955596923828f, (select((_441 && _444), (_438 + -3.1415927410125732f), select((_441 && _443), (_438 + 3.1415927410125732f), _438)) * 12.0f))) + _457), (_457 + (_404 * 12.0f)))))).x));
      _463 = _462 * _462;
      _480 = _366 + 4.59375f;
      _484 = frac(sin(floor(_480)) * 43758.546875f);
      _492 = (frac(_480) * (frac(sin(ceil(_480)) * 43758.546875f) - _484)) + _484;
      _494 = (_492 * 0.050000011920928955f) + 0.44999998807907104f;
      _507 = dot(float3(_246, _247, 0.0f), float3(_159, _157, 0.0f)) * _257;
      _510 = (_507 * _246) + (_253 * _159);
      _511 = (_507 * _247) + (_253 * _157);
      _514 = _113 - (_510 * _494);
      _515 = _112 - (_511 * _494);
      _518 = (_514 * 0.9553365111351013f) + (_515 * 0.29552021622657776f);
      _521 = (_515 * 0.9553365111351013f) - (_514 * 0.29552021622657776f);
      _522 = _510 - _518;
      _523 = _511 - _521;
      _531 = saturate(exp2(log2(sqrt((_522 * _522) + (_523 * _523))) * 15.0f));
      _532 = abs(_518);
      _533 = abs(_521);
      _535 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_532, _533)), 0.0f);
      _538 = (_535 * 1.8477590084075928f) + _532;
      _539 = _533 - (_535 * 0.7653668522834778f);
      _541 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_538, _539)), 0.0f);
      _544 = _538 - (_541 * 1.8477590084075928f);
      _548 = _544 - min(max(_544, -0.06006096675992012f), 0.06006096675992012f);
      _549 = (_539 - (_541 * 0.7653668522834778f)) + -0.14499999582767487f;
      _560 = float((int)(((int)(uint)((int)(_549 > 0.0f))) - ((int)(uint)((int)(_549 < 0.0f))))) * sqrt((_548 * _548) + (_549 * _549));
      _563 = saturate(abs(_560) * 200.0f);
      _585 = _366 + 4.46250057220459f;
      _589 = frac(sin(floor(_585)) * 43758.546875f);
      _597 = (frac(_585) * (frac(sin(ceil(_585)) * 43758.546875f) - _589)) + _589;
      _602 = (_597 * 0.08000002056360245f) + 0.7199999690055847f;
      _614 = _113 - (_602 * _510);
      _615 = _112 - (_602 * _511);
      _618 = (_614 * 0.9553365111351013f) + (_615 * 0.29552021622657776f);
      _621 = (_615 * 0.9553365111351013f) - (_614 * 0.29552021622657776f);
      _622 = _510 - _618;
      _623 = _511 - _621;
      _631 = saturate(exp2(log2(sqrt((_622 * _622) + (_623 * _623))) * 15.0f));
      _632 = abs(_618);
      _633 = abs(_621);
      _635 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_632, _633)), 0.0f);
      _638 = (_635 * 1.8477590084075928f) + _632;
      _639 = _633 - (_635 * 0.7653668522834778f);
      _641 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_638, _639)), 0.0f);
      _644 = _638 - (_641 * 1.8477590084075928f);
      _648 = _644 - min(max(_644, -0.08491378277540207f), 0.08491378277540207f);
      _649 = (_639 - (_641 * 0.7653668522834778f)) + -0.20499999821186066f;
      _660 = float((int)(((int)(uint)((int)(_649 > 0.0f))) - ((int)(uint)((int)(_649 < 0.0f))))) * sqrt((_648 * _648) + (_649 * _649));
      _663 = saturate(abs(_660) * 200.0f);
      _687 = (saturate(saturate(exp2(log2(saturate(1.0f - _660)) * (5.0f / ((_597 * 0.00800000224262476f) + 0.07199999690055847f)))) - _631) + (saturate((1.0f - _631) - saturate((_663 * _663) * (3.0f - (_663 * 2.0f)))) * 0.4000000059604645f)) * ((_492 * 0.8999999761581421f) + 0.10000000149011612f);
      _688 = _366 + 1.7308595180511475f;
      _692 = frac(sin(floor(_688)) * 43758.546875f);
      _700 = (frac(_688) * (frac(sin(ceil(_688)) * 43758.546875f) - _692)) + _692;
      _702 = 1.5f - (_700 * 0.15000003576278687f);
      _714 = _113 - (_702 * _261);
      _715 = _112 - (_702 * _262);
      _718 = (_714 * 0.9553365111351013f) + (_715 * 0.29552021622657776f);
      _721 = (_715 * 0.9553365111351013f) - (_714 * 0.29552021622657776f);
      _722 = _261 - _718;
      _723 = _262 - _721;
      _731 = saturate(exp2(log2(sqrt((_722 * _722) + (_723 * _723))) * 15.0f));
      _732 = abs(_718);
      _733 = abs(_721);
      _735 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_732, _733)), 0.0f);
      _738 = (_735 * 1.8477590084075928f) + _732;
      _739 = _733 - (_735 * 0.7653668522834778f);
      _741 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_738, _739)), 0.0f);
      _744 = _738 - (_741 * 1.8477590084075928f);
      _748 = _744 - min(max(_744, -0.12633514404296875f), 0.12633514404296875f);
      _749 = (_739 - (_741 * 0.7653668522834778f)) + -0.3050000071525574f;
      _760 = float((int)(((int)(uint)((int)(_749 > 0.0f))) - ((int)(uint)((int)(_749 < 0.0f))))) * sqrt((_748 * _748) + (_749 * _749));
      _763 = saturate(abs(_760) * 200.0f);
      _785 = _366 + 4.856250286102295f;
      _789 = frac(sin(floor(_785)) * 43758.546875f);
      _797 = (frac(_785) * (frac(sin(ceil(_785)) * 43758.546875f) - _789)) + _789;
      _800 = ((_797 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _760)) * (5.0f / (0.15000000596046448f - (_700 * 0.015000003390014172f))))) - _731) + (saturate((1.0f - _731) - saturate((_763 * _763) * (3.0f - (_763 * 2.0f)))) * 0.4000000059604645f));
      _803 = 0.5f - (_797 * 0.050000011920928955f);
      _815 = _113 - (_803 * _261);
      _816 = _112 - (_803 * _262);
      _819 = (_815 * 0.9553365111351013f) + (_816 * 0.29552021622657776f);
      _822 = (_816 * 0.9553365111351013f) - (_815 * 0.29552021622657776f);
      _823 = _261 - _819;
      _824 = _262 - _822;
      _832 = saturate(exp2(log2(sqrt((_823 * _823) + (_824 * _824))) * 15.0f));
      _833 = abs(_819);
      _834 = abs(_822);
      _836 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_833, _834)), 0.0f);
      _839 = (_836 * 1.8477590084075928f) + _833;
      _840 = _834 - (_836 * 0.7653668522834778f);
      _842 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_839, _840)), 0.0f);
      _845 = _839 - (_842 * 1.8477590084075928f);
      _849 = _845 - min(max(_845, -0.08491378277540207f), 0.08491378277540207f);
      _850 = (_840 - (_842 * 0.7653668522834778f)) + -0.20499999821186066f;
      _861 = float((int)(((int)(uint)((int)(_850 > 0.0f))) - ((int)(uint)((int)(_850 < 0.0f))))) * sqrt((_849 * _849) + (_850 * _850));
      _864 = saturate(abs(_861) * 200.0f);
      _886 = _366 + 1.1156251430511475f;
      _890 = frac(sin(floor(_886)) * 43758.546875f);
      _898 = (frac(_886) * (frac(sin(ceil(_886)) * 43758.546875f) - _890)) + _890;
      _901 = ((_898 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _861)) * (5.0f / (0.05000000074505806f - (_797 * 0.005000001285225153f))))) - _832) + (saturate((1.0f - _832) - saturate((_864 * _864) * (3.0f - (_864 * 2.0f)))) * 0.4000000059604645f));
      _903 = 0.20000000298023224f - (_898 * 0.020000005140900612f);
      _915 = _113 - (_903 * _261);
      _916 = _112 - (_903 * _262);
      _919 = (_915 * 0.9553365111351013f) + (_916 * 0.29552021622657776f);
      _922 = (_916 * 0.9553365111351013f) - (_915 * 0.29552021622657776f);
      _923 = _261 - _919;
      _924 = _262 - _922;
      _932 = saturate(exp2(log2(sqrt((_923 * _923) + (_924 * _924))) * 15.0f));
      _933 = abs(_919);
      _934 = abs(_922);
      _936 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_933, _934)), 0.0f);
      _939 = (_936 * 1.8477590084075928f) + _933;
      _940 = _934 - (_936 * 0.7653668522834778f);
      _942 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_939, _940)), 0.0f);
      _945 = _939 - (_942 * 1.8477590084075928f);
      _949 = _945 - min(max(_945, -0.06834524124860764f), 0.06834524124860764f);
      _950 = (_940 - (_942 * 0.7653668522834778f)) + -0.16500000655651093f;
      _961 = float((int)(((int)(uint)((int)(_950 > 0.0f))) - ((int)(uint)((int)(_950 < 0.0f))))) * sqrt((_949 * _949) + (_950 * _950));
      _964 = saturate(abs(_961) * 200.0f);
      _989 = ((saturate(saturate(exp2(log2(saturate(1.0f - _961)) * (1.0f / (0.020000001415610313f - (_898 * 0.00200000056065619f))))) - _932) + (saturate((1.0f - _932) - saturate((_964 * _964) * (3.0f - (_964 * 2.0f)))) * 0.4000000059604645f)) * ((_700 * 0.8999999761581421f) + 0.10000000149011612f)) + (((_597 * 0.8999999761581421f) + 0.10000000149011612f) * (saturate(saturate(exp2(log2(saturate(1.0f - _560)) * (5.0f / ((_492 * 0.005000001285225153f) + 0.044999998062849045f)))) - _531) + (saturate((1.0f - _531) - saturate((_563 * _563) * (3.0f - (_563 * 2.0f)))) * 0.4000000059604645f)));
      _992 = _901 + _687;
      _997 = _218.w * 0.07999999821186066f;
      _1012 = 0.0f;
      _1013 = 0.0f;
      _1014 = 0.0f;
      _1015 = 0;
      while(true) {
        _1016 = _1015 + 1;
        _1017 = float((int)(_1016));
        _1026 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.5199999809265137f) * frac(sin(float((int)(_1015))) * 43758.546875f)) + _364;
        _1030 = frac(sin(floor(_1026)) * 43758.546875f);
        _1038 = (frac(_1026) * (frac(sin(ceil(_1026)) * 43758.546875f) - _1030)) + _1030;
        _1047 = (_1038 * 0.1599999964237213f) + 0.64000004529953f;
        _1069 = _1017 * 0.07000000029802322f;
        _1070 = (((frac(sin(_1017 * 10.0f) * 43758.546875f) + -1.0f) * _1047) + 1.0f) * _1069;
        _1071 = _1017 * 0.0010000000474974513f;
        _1072 = (((frac(sin(_1017 * 2000.0f) * 43758.546875f) + -1.0f) * 0.20000000298023224f) + 1.0f) * _1071;
        _1084 = _113 - (_1070 * _159);
        _1085 = _112 - (_1070 * _157);
        _1088 = (_1084 * 0.9553365111351013f) + (_1085 * 0.29552021622657776f);
        _1091 = (_1085 * 0.9553365111351013f) - (_1084 * 0.29552021622657776f);
        _1092 = _159 - _1088;
        _1093 = _157 - _1091;
        _1101 = saturate(exp2(log2(sqrt((_1092 * _1092) + (_1093 * _1093))) * 15.0f));
        _1102 = abs(_1088);
        _1103 = abs(_1091);
        _1105 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1102, _1103)), 0.0f);
        _1108 = (_1105 * 1.8477590084075928f) + _1102;
        _1109 = _1103 - (_1105 * 0.7653668522834778f);
        _1111 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1108, _1109)), 0.0f);
        _1114 = _1108 - (_1111 * 1.8477590084075928f);
        _1120 = _1114 - min(max(_1114, (_1072 * -0.4142135679721832f)), (_1072 * 0.4142135679721832f));
        _1121 = (_1109 - (_1111 * 0.7653668522834778f)) - _1072;
        _1132 = float((int)(((int)(uint)((int)(_1121 > 0.0f))) - ((int)(uint)((int)(_1121 < 0.0f))))) * sqrt((_1120 * _1120) + (_1121 * _1121));
        _1135 = saturate(abs(_1132) * 200.0f);
        _1153 = (((frac(sin(_1017 * 5.0f) * 43758.546875f) + -1.0f) * _1047) + 1.0f) * _1069;
        _1154 = (((frac(sin(_1017 * 20.0f) * 43758.546875f) + -1.0f) * 0.20000000298023224f) + 1.0f) * _1071;
        _1166 = _113 - (_1153 * _232);
        _1167 = _112 - (_1153 * _233);
        _1170 = (_1166 * 0.9553365111351013f) + (_1167 * 0.29552021622657776f);
        _1173 = (_1167 * 0.9553365111351013f) - (_1166 * 0.29552021622657776f);
        _1174 = _232 - _1170;
        _1175 = _233 - _1173;
        _1183 = saturate(exp2(log2(sqrt((_1174 * _1174) + (_1175 * _1175))) * 15.0f));
        _1184 = abs(_1170);
        _1185 = abs(_1173);
        _1187 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1184, _1185)), 0.0f);
        _1190 = (_1187 * 1.8477590084075928f) + _1184;
        _1191 = _1185 - (_1187 * 0.7653668522834778f);
        _1193 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1190, _1191)), 0.0f);
        _1196 = _1190 - (_1193 * 1.8477590084075928f);
        _1202 = _1196 - min(max(_1196, (_1154 * -0.4142135679721832f)), (_1154 * 0.4142135679721832f));
        _1203 = (_1191 - (_1193 * 0.7653668522834778f)) - _1154;
        _1214 = float((int)(((int)(uint)((int)(_1203 > 0.0f))) - ((int)(uint)((int)(_1203 < 0.0f))))) * sqrt((_1202 * _1202) + (_1203 * _1203));
        _1217 = saturate(abs(_1214) * 200.0f);
        _1239 = ((saturate(saturate(exp2(log2(saturate(1.0f - _1214)) * (100.0f / _1153))) - _1183) + saturate(saturate(exp2(log2(saturate(1.0f - _1132)) * (100.0f / _1070))) - _1101)) + ((saturate((1.0f - _1183) - saturate((_1217 * _1217) * (3.0f - (_1217 * 2.0f)))) + saturate((1.0f - _1101) - saturate((_1135 * _1135) * (3.0f - (_1135 * 2.0f))))) * 0.4000000059604645f)) * _1038;
        _1240 = _1239 + _1012;
        _1241 = _1239 + _1013;
        _1242 = _1239 + _1014;
        if (!(_1016 == 20)) {
          _1012 = _1240;
          _1013 = _1241;
          _1014 = _1242;
          _1015 = _1016;
          continue;
        }
        while(true) {
          _1567 = 0.0f;
          _1568 = 0.0f;
          _1569 = 0.0f;
          _1570 = 0;
          while(true) {
            _1577 = _1570 + 1;
            _1578 = float((int)(_1577));
            _1583 = frac(sin(_1578 * 300.0f) * 43758.546875f) + -1.0f;
            _1586 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.5199999809265137f) * frac(sin(float((int)(_1570))) * 43758.546875f)) + _364;
            _1590 = frac(sin(floor(_1586)) * 43758.546875f);
            _1598 = (frac(_1586) * (frac(sin(ceil(_1586)) * 43758.546875f) - _1590)) + _1590;
            _1600 = (_1598 * 0.037500008940696716f) + 0.7124999761581421f;
            _1612 = frac(sin(_1578 * 170.0f) * 43758.546875f) + -1.0f;
            _1620 = _1578 * 0.15000000596046448f;
            _1621 = ((_1600 * (frac(sin(_1578 * 110.0f) * 43758.546875f) + -1.0f)) + 1.0f) * _1620;
            _1634 = _113 - (_1621 * _510);
            _1635 = _112 - (_1621 * _511);
            _1638 = (_1634 * 0.9553365111351013f) + (_1635 * 0.29552021622657776f);
            _1641 = (_1635 * 0.9553365111351013f) - (_1634 * 0.29552021622657776f);
            _1642 = _510 - _1638;
            _1643 = _511 - _1641;
            _1651 = saturate(exp2(log2(sqrt((_1642 * _1642) + (_1643 * _1643))) * 15.0f));
            _1652 = abs(_1638);
            _1653 = abs(_1641);
            _1655 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1652, _1653)), 0.0f);
            _1658 = (_1655 * 1.8477590084075928f) + _1652;
            _1659 = _1653 - (_1655 * 0.7653668522834778f);
            _1661 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1658, _1659)), 0.0f);
            _1664 = _1658 - (_1661 * 1.8477590084075928f);
            _1666 = _1583 * 0.0124264070764184f;
            _1671 = _1664 - min(max(_1664, (-0.02071067877113819f - _1666)), (_1666 + 0.02071067877113819f));
            _1673 = (_1659 - (_1661 * 0.7653668522834778f)) + (-0.05000000074505806f - (_1583 * 0.030000001192092896f));
            _1684 = float((int)(((int)(uint)((int)(_1673 > 0.0f))) - ((int)(uint)((int)(_1673 < 0.0f))))) * sqrt((_1671 * _1671) + (_1673 * _1673));
            _1687 = saturate(abs(_1684) * 200.0f);
            _1707 = _1578 * 0.10000000149011612f;
            _1708 = (saturate(saturate(exp2(log2(saturate(1.0f - _1684)) * (300.0f / _1621))) - _1651) + (saturate((1.0f - _1651) - saturate((_1687 * _1687) * (3.0f - (_1687 * 2.0f)))) * 0.4000000059604645f)) * _1707;
            _1713 = (_1598 * 0.5f) + 0.5f;
            _1717 = (((frac(sin(_1578 * 15.0f) * 43758.546875f) + -1.0f) * _1600) + 1.0f) * _1620;
            _1730 = _113 - (_1717 * _261);
            _1731 = _112 - (_1717 * _262);
            _1734 = (_1730 * 0.9553365111351013f) + (_1731 * 0.29552021622657776f);
            _1737 = (_1731 * 0.9553365111351013f) - (_1730 * 0.29552021622657776f);
            _1738 = _261 - _1734;
            _1739 = _262 - _1737;
            _1747 = saturate(exp2(log2(sqrt((_1738 * _1738) + (_1739 * _1739))) * 15.0f));
            _1748 = abs(_1734);
            _1749 = abs(_1737);
            _1751 = min(dot(float2(-0.9238795042037964f, 0.3826834261417389f), float2(_1748, _1749)), 0.0f);
            _1754 = (_1751 * 1.8477590084075928f) + _1748;
            _1755 = _1749 - (_1751 * 0.7653668522834778f);
            _1757 = min(dot(float2(0.9238795042037964f, 0.3826834261417389f), float2(_1754, _1755)), 0.0f);
            _1760 = _1754 - (_1757 * 1.8477590084075928f);
            _1762 = _1612 * 0.0124264070764184f;
            _1767 = _1760 - min(max(_1760, (-0.02071067877113819f - _1762)), (_1762 + 0.02071067877113819f));
            _1769 = (_1755 - (_1757 * 0.7653668522834778f)) + (-0.05000000074505806f - (_1612 * 0.030000001192092896f));
            _1780 = float((int)(((int)(uint)((int)(_1769 > 0.0f))) - ((int)(uint)((int)(_1769 < 0.0f))))) * sqrt((_1767 * _1767) + (_1769 * _1769));
            _1783 = saturate(abs(_1780) * 200.0f);
            _1803 = (saturate(saturate(exp2(log2(saturate(1.0f - _1780)) * (300.0f / _1717))) - _1747) + (saturate((1.0f - _1747) - saturate((_1783 * _1783) * (3.0f - (_1783 * 2.0f)))) * 0.4000000059604645f)) * _1707;
            _1807 = (_1803 + ((_1708 + _1567) * _1713)) * _1713;
            _1808 = (_1803 + ((_1708 + _1568) * _1713)) * _1713;
            _1809 = (_1803 + ((_1708 + _1569) * _1713)) * _1713;
            if (!(_1577 == 10)) {
              _1567 = _1807;
              _1568 = _1808;
              _1569 = _1809;
              _1570 = _1577;
              continue;
            }
            while(true) {
              _1259 = saturate(exp2(log2(_218.w)) * 4.0f);
              _1282 = ((((exp2(log2(saturate(1.0f - (abs(_399 + -0.25f) * 3.0f))) * 5.199999809265137f) * 0.20000000298023224f) * (lerp(_463, 1.0f, 0.4000000059604645f))) * saturate(exp2((_251 * 6.0f) * _360))) + (((exp2(log2(saturate(1.0f - (abs(_270 + -0.550000011920929f) * 3.0f))) * 5.199999809265137f) * 0.14000000059604645f) * (lerp(_334, 1.0f, 0.4000000059604645f))) * saturate(exp2((sqrt((_344 * _344) + (_345 * _345)) * 2.7272725105285645f) * _360)))) * ((((frac(_367) * (frac(sin(ceil(_367)) * 43758.546875f) - _371)) + _371) * 0.800000011920929f) + 0.20000000298023224f);
              _1306 = ((_srcTargetSizeAndInv.x * ((_159 * 0.5f) + 0.5f)) + 0.5f) * _srcTargetSizeAndInv.z;
              _1307 = ((_srcTargetSizeAndInv.y * ((_157 * 0.5f) + 0.5f)) + 0.5f) * _srcTargetSizeAndInv.w;
              _1321 = dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x)), ((-0.0f - _questGuideWorldPosition.y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z))));
              _1322 = 5.0f / _srcTargetSizeAndInv.x;
              _1323 = _1306 - _1322;
              _1324 = _1322 + _1307;
              __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_1326.x, _1326.y);
              _1335 = float((int)(int(float((int)((int)(_1326.x)))))) + 0.5f;
              _1336 = float((int)(int(float((int)((int)(_1326.y)))))) + 0.5f;
              _1339 = int(_1335 * _1323);
              _1340 = int(_1336 * _1324);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1340, 0)))).x) & 255) == 201) {
                _1357 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1357 = 0.0f;
              }
              _1363 = int(_1335 * _1306);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1363, _1340, 0)))).x) & 255) == 201) {
                _1380 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1306), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1380 = 0.0f;
              }
              _1383 = _1322 + _1306;
              _1385 = int(_1335 * _1383);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1340, 0)))).x) & 255) == 201) {
                _1402 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1324), 0)))).x);
              } else {
                _1402 = 0.0f;
              }
              _1406 = int(_1336 * _1307);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1406, 0)))).x) & 255) == 201) {
                _1423 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1307), 0)))).x);
              } else {
                _1423 = 0.0f;
              }
              _1426 = _1307 - _1322;
              _1428 = int(_1336 * _1426);
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1385, _1428, 0)))).x) & 255) == 201) {
                _1445 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1383), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1445 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1363, _1428, 0)))).x) & 255) == 201) {
                _1464 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1306), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1464 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1428, 0)))).x) & 255) == 201) {
                _1483 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1426), 0)))).x);
              } else {
                _1483 = 0.0f;
              }
              if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(_1339, _1406, 0)))).x) & 255) == 201) {
                _1502 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _1323), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _1307), 0)))).x);
              } else {
                _1502 = 0.0f;
              }
              _1546 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) + _questGuideWorldPosition.y;
              _1555 = saturate((sqrt(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x))) + (_1546 * _1546)) * 0.05000000074505806f) + -1.0f);
              _1562 = ((((_1555 * _1555) * 0.949999988079071f) * (3.0f - (_1555 * 2.0f))) + 0.05000000074505806f) * (_exposure2.x * 200.0f);
              _1812 = (_1562 * (((((_992 * 0.30000001192092896f) + ((_989 + _800) * 0.20000000298023224f)) * _997) + _1282) + ((((_1807 * 0.04500000178813934f) + (_1240 * 0.15000000596046448f)) * _218.x) * _1259)));
              _1813 = (_1562 * ((((((_992 * 0.4000000059604645f) + (_800 * 0.30000001192092896f)) + (_989 * 0.5f)) * _997) + _1282) + ((((_1808 * 0.07500000298023224f) + (_1241 * 0.15000000596046448f)) * _218.y) * _1259)));
              _1814 = (_1562 * ((((_218.w * 0.06400000303983688f) * (((_989 + _687) + _800) + _901)) + _1282) + ((((_1809 * 0.12000000476837158f) + (_1242 * 0.15000000596046448f)) * _218.z) * _1259)));
              _1815 = (dot(float4(saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1445)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1464)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1483)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1502)) - _1321)), float4(0.25f, 0.25f, 0.25f, 0.25f)) + dot(float4(saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1357)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1380)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1402)) - _1321), saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _1423)) - _1321)), float4(0.25f, 0.25f, 0.25f, 0.25f)));
              break;
            }
            break;
          }
          break;
        }
        break;
      }
    } else {
      _1812 = 0.0f;
      _1813 = 0.0f;
      _1814 = 0.0f;
      _1815 = 1.0f;
    }
  }
  _1816 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1829 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1816, 0)))).x) & 127))) + 0.5f);
  } else {
    _1829 = _1815;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1812, _1813, _1814));
    _2251 = output_color.x;
    _2252 = output_color.y;
    _2253 = output_color.z;
  } else {
    _2251 = _1812;
    _2252 = _1813;
    _2253 = _1814;
  }
  if (_etcParams.y > 1.0f) {
    _2264 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _2265 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _2269 = saturate(1.0f - (dot(float2(_2264, _2265), float2(_2264, _2265)) * saturate(_etcParams.y + -1.0f)));
    _2274 = (_2269 * _2251);
    _2275 = (_2269 * _2252);
    _2276 = (_2269 * _2253);
  } else {
    _2274 = _2251;
    _2275 = _2252;
    _2276 = _2253;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2309 = select((_2274 <= 0.0031308000907301903f), (_2274 * 12.920000076293945f), (((pow(_2274, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2310 = select((_2275 <= 0.0031308000907301903f), (_2275 * 12.920000076293945f), (((pow(_2275, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2311 = select((_2276 <= 0.0031308000907301903f), (_2276 * 12.920000076293945f), (((pow(_2276, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2309 = _2274;
    _2310 = _2275;
    _2311 = _2276;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2316 = float((uint)_1816);
    if (!(_2316 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2316 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2325 = _2309;
        _2326 = _2310;
        _2327 = _2311;
      } else {
        _2325 = 0.0f;
        _2326 = 0.0f;
        _2327 = 0.0f;
      }
    } else {
      _2325 = 0.0f;
      _2326 = 0.0f;
      _2327 = 0.0f;
    }
  } else {
    _2325 = _2309;
    _2326 = _2310;
    _2327 = _2311;
  }
  _2337 = exp2(log2(_2325 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2338 = exp2(log2(_2326 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2339 = exp2(log2(_2327 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_2337 * 18.6875f) + 1.0f)) * ((_2337 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_2338 * 18.6875f) + 1.0f)) * ((_2338 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_2339 * 18.6875f) + 1.0f)) * ((_2339 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1829;
  return SV_Target;
}