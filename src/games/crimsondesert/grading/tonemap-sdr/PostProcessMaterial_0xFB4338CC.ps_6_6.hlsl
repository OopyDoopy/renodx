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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t38, space36);

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

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _37;
  float _45;
  bool _46;
  bool _50;
  float _139;
  float _140;
  float _143;
  float _144;
  float _206;
  float _207;
  int _287;
  int _362;
  float _363;
  float _364;
  float _365;
  float _366;
  float _367;
  float _368;
  float _1060;
  float _1061;
  float _1062;
  float _1063;
  float _1064;
  float _1090;
  float _1091;
  float _1092;
  float _1093;
  float _1424;
  float _1425;
  float _1426;
  float _1427;
  float _1519;
  float _1520;
  float _1521;
  float _1522;
  float _1537;
  float _1742;
  float _1743;
  float _1744;
  float _1837;
  float _1838;
  float _1839;
  float _1959;
  float _1960;
  float _1961;
  float _1979;
  float _1980;
  float _1981;
  float _2014;
  float _2015;
  float _2016;
  float _2030;
  float _2031;
  float _2032;
  float _66;
  float _68;
  float _69;
  float _70;
  int _71;
  float _79;
  float _91;
  float _98;
  float _99;
  float _100;
  float _101;
  float _105;
  float _110;
  float _114;
  float _123;
  float _125;
  float _129;
  float _133;
  int _145;
  int _153;
  uint2 _165;
  uint _180;
  int _182;
  float _190;
  float _191;
  float _193;
  float _194;
  float _195;
  float _209;
  float _210;
  float _211;
  float _212;
  float _214;
  float _215;
  float _216;
  float _217;
  float4 _220;
  float _230;
  float _231;
  float _232;
  float _257;
  float _258;
  float _259;
  float4 _296;
  float _298;
  float _334;
  int _371;
  float _379;
  float _393;
  float _394;
  float _395;
  float _423;
  float _424;
  float _425;
  float _426;
  float _427;
  float _428;
  float _429;
  float _430;
  float _436;
  float _437;
  float _438;
  float _490;
  float _491;
  float _492;
  float _502;
  float _513;
  float _514;
  float _515;
  float _517;
  float _520;
  float _524;
  float _525;
  float _526;
  float _531;
  float4 _543;
  float4 _555;
  uint _573;
  uint _574;
  uint4 _576;
  float4 _579;
  float _597;
  float _598;
  float _599;
  float _601;
  float _602;
  float _603;
  float _604;
  float _607;
  float _608;
  float _611;
  float _612;
  float _616;
  float _618;
  float _619;
  float _620;
  float _621;
  float _623;
  float _626;
  float _627;
  float _628;
  float _629;
  float _638;
  float _642;
  float _646;
  float _648;
  float _658;
  float _663;
  float _677;
  float _686;
  int _690;
  int _698;
  float _701;
  float _704;
  float _706;
  float _739;
  float _757;
  float _758;
  float _759;
  float _760;
  float _761;
  float _762;
  float _763;
  float _764;
  float _770;
  float _771;
  float _772;
  float _791;
  uint _812;
  uint _813;
  uint4 _815;
  float4 _818;
  float _836;
  float _837;
  float _838;
  float _840;
  float _841;
  float _842;
  float _843;
  float _846;
  float _847;
  float _850;
  float _851;
  float _855;
  float _857;
  float _858;
  float _859;
  float _860;
  float _862;
  float _865;
  float _866;
  float _867;
  float _868;
  float _877;
  float _881;
  float _885;
  float _887;
  float _902;
  float _907;
  float _908;
  float _912;
  float4 _919;
  float _921;
  float _940;
  bool _955;
  int _984;
  float _1002;
  float4 _1007;
  float _1017;
  float _1018;
  float _1019;
  float _1041;
  float _1042;
  float _1043;
  float _1044;
  float _1045;
  float _1046;
  float _1054;
  float _1072;
  float _1073;
  float _1074;
  float _1097;
  float _1104;
  float4 _1117;
  float4 _1129;
  float _1135;
  float _1168;
  float _1169;
  float _1172;
  float _1173;
  float _1180;
  float _1183;
  float _1184;
  float _1195;
  float _1211;
  float _1212;
  float _1220;
  float _1224;
  float4 _1232;
  float _1242;
  float _1243;
  float _1244;
  float _1269;
  float _1270;
  float _1271;
  float _1272;
  float _1279;
  float _1282;
  float _1292;
  float _1293;
  float _1294;
  float _1304;
  float _1309;
  float _1326;
  float4 _1335;
  int _1340;
  int _1348;
  float4 _1355;
  float _1363;
  float _1365;
  float _1373;
  float _1386;
  float _1389;
  float _1390;
  float _1412;
  float _1432;
  float4 _1441;
  int _1454;
  int _1462;
  float _1473;
  float _1482;
  float _1485;
  float _1486;
  float _1501;
  float _1504;
  float _1507;
  uint _1524;
  float _1546;
  float _1595;
  float _1596;
  float _1597;
  float _1599;
  float _1606;
  float _1607;
  float _1608;
  float _1627;
  float _1628;
  float _1629;
  float _1630;
  float _1631;
  float _1632;
  float _1633;
  float _1634;
  float _1635;
  float _1681;
  float _1682;
  float _1683;
  float _1684;
  float _1685;
  float _1686;
  float _1687;
  float _1704;
  float _1705;
  float _1706;
  float _1707;
  float _1713;
  float _1716;
  float _1723;
  float _1724;
  float _1725;
  float _1754;
  float _1779;
  float _1780;
  float _1781;
  float _1800;
  float _1801;
  float _1802;
  float _1808;
  float _1812;
  float _1813;
  float _1814;
  float _1815;
  float _1820;
  float _1845;
  float _1849;
  float _1850;
  float _1851;
  float _1852;
  int _1893;
  float _1948;
  float _1969;
  float _1970;
  float _1974;
  float _2021;
  float _2042;
  float _2043;
  float _2044;
  float _25[36];
  _37 = WaveReadLaneFirst(_materialIndex);
  _45 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
  _46 = (_45 >= 0.009999999776482582f);
  _50 = (abs(_temperatureWarning) >= 0.009999999776482582f);
  if (!(_46 || _50)) {
    if (true) discard;
  }
  _66 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _68 = (TEXCOORD.x * 2.0f) + -1.0f;
  _69 = TEXCOORD.y * 2.0f;
  _70 = 1.0f - _69;
  _71 = WaveReadLaneFirst(_materialIndex);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._fishEyeMaxPower);
  if (((_79 > 0.0010000000474974513f) || (_79 < -0.0010000000474974513f)) && (!_46)) {
    _91 = 0.5f / _66;
    _98 = (((_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) * 4.0f) + -0.5f;
    _99 = (((_destTargetSizAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) * 4.0f) - _91;
    _100 = dot(float2(_98, _99), float2(_98, _99));
    _101 = sqrt(_100);
    if (_79 > 0.0f) {
      _105 = sqrt(dot(float2(0.5f, _91), float2(0.5f, _91)));
      _110 = tan(_101 * _79) * (rsqrt(_100) * _105);
      _114 = tan(_105 * _79);
      _139 = (((_110 * _98) / _114) + 0.5f);
      _140 = (((_110 * _99) / _114) + _91);
    } else {
      if (_79 < 0.0f) {
        _123 = select((_66 < 1.0f), 0.5f, _91);
        _125 = _79 * -10.0f;
        _129 = atan(_101 * _125) * (rsqrt(_100) * _123);
        _133 = atan(_123 * _125);
        _139 = (((_129 * _98) / _133) + 0.5f);
        _140 = (((_129 * _99) / _133) + _91);
      } else {
        _139 = 0.0f;
        _140 = 0.0f;
      }
    }
    _143 = _139;
    _144 = (_140 * _66);
  } else {
    _143 = TEXCOORD.x;
    _144 = TEXCOORD.y;
  }
  _145 = WaveReadLaneFirst(_materialIndex);
  _153 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  if (((_highLightForVisionRemoteCatch > 0.0f) || (_highLightForVision > 0.0f)) || (_characterHighlight > 0.0f)) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_165.x, _165.y);
    _180 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_165.x)))))) + 0.5f) * _143), int((float((int)(int(float((int)((int)(_165.y)))))) + 0.5f) * _144), 0));
    _182 = _180.x & 255;
    _190 = (float((uint)((uint)((uint)((uint)(_180.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _191 = (float((uint)((uint)(((uint)((uint)(_180.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _193 = 1.0f - abs(_190);
    _194 = abs(_191);
    _195 = _193 - _194;
    if (_195 < 0.0f) {
      _206 = (select((_190 >= 0.0f), 1.0f, -1.0f) * (1.0f - _194));
      _207 = (select((_191 >= 0.0f), 1.0f, -1.0f) * _193);
    } else {
      _206 = _190;
      _207 = _191;
    }
    _209 = rsqrt(dot(float3(_206, _207, _195), float3(_206, _207, _195)));
    _210 = _209 * _206;
    _211 = _209 * _207;
    _212 = _209 * _195;
    _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
    _215 = _214 * _210;
    _216 = _214 * _211;
    _217 = _214 * _212;
    _220 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_143, _144));
    _230 = (pow(_220.x, 0.012683313339948654f));
    _231 = (pow(_220.y, 0.012683313339948654f));
    _232 = (pow(_220.z, 0.012683313339948654f));
    _257 = exp2(log2(max(0.0f, (_230 + -0.8359375f)) / (18.8515625f - (_230 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _258 = exp2(log2(max(0.0f, (_231 + -0.8359375f)) / (18.8515625f - (_231 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _259 = exp2(log2(max(0.0f, (_232 + -0.8359375f)) / (18.8515625f - (_232 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_182 == _renderPassDetectObjective) {
      _287 = _renderPassDetectRemoteCatch;
      _296 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0));
      _298 = max(1.0000000116860974e-07f, _296.x);
      _334 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _362 = _287;
      _363 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _334);
      _364 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _334);
      _365 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _334);
      _366 = _296.x;
      _367 = (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 16777215))) * 5.960465188081798e-08f);
      _368 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
    } else {
      bool __branch_chain_265;
      if (_182 == _renderPassDetectRemoteCatch) {
        _287 = _renderPassDetectRemoteCatch;
        __branch_chain_265 = true;
      } else {
        if ((_182 == _renderPassDetectPickedRemoteCatch) || (_182 == _renderPassKnowledgeNPC)) {
          _287 = _renderPassDetectRemoteCatch;
          __branch_chain_265 = true;
        } else {
          if ((_182 == _renderPassEnemy) || (_182 == _renderPassSelfPlayer)) {
            _287 = _renderPassDetectRemoteCatch;
            __branch_chain_265 = true;
          } else {
            if (_182 == _renderPassTest) {
              _287 = _renderPassDetectRemoteCatch;
              __branch_chain_265 = true;
            } else {
              _362 = _renderPassDetectRemoteCatch;
              _363 = 0.0f;
              _364 = 0.0f;
              _365 = 0.0f;
              _366 = 0.0f;
              _367 = 0.0f;
              _368 = 0.0f;
              __branch_chain_265 = false;
            }
          }
        }
      }
      if (__branch_chain_265) {
        _296 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0));
        _298 = max(1.0000000116860974e-07f, _296.x);
        _334 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
        _362 = _287;
        _363 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _334);
        _364 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _334);
        _365 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _298, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _334);
        _366 = _296.x;
        _367 = (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 16777215))) * 5.960465188081798e-08f);
        _368 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
      }
    }
    bool __branch_chain_361;
    if (!(_182 == _362)) {
      __branch_chain_361 = true;
    } else {
      _371 = WaveReadLaneFirst(_materialIndex);
      _379 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_371 < (uint)170000), _371, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
      if (!(_379 > 0.0010000000474974513f)) {
        __branch_chain_361 = true;
      } else {
        if ((_highLightForVision < 0.0010000000474974513f) && (_highLightForVisionRemoteCatch < 0.0010000000474974513f)) {
          __branch_chain_361 = true;
        } else {
          __branch_chain_361 = false;
        }
      }
    }
    if (__branch_chain_361) {
      if (!(_182 == _renderPassDetectObjective) || ((_182 == _renderPassDetectObjective) && ((_highLightForVision < 0.0010000000474974513f) && (_highLightForVisionRemoteCatch < 0.0010000000474974513f)))) {
        if (!(_182 == _renderPassKnowledgeNPC) || ((_182 == _renderPassKnowledgeNPC) && (_highLightForVision < 0.0010000000474974513f))) {
          _955 = (_182 == _renderPassSelfPlayer);
          if ((_955) | (((_182 == _renderPassTest) || (_182 == _renderPassEnemy)) || (_182 == _renderPassDetectPickedRemoteCatch))) {
            if ((_characterHighlight > 0.0010000000474974513f) || (_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _984 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 127;
              if (!((uint)_984 > (uint)10) | (((uint)_984 > (uint)19) && (_984 != 107))) {
                _1002 = _368 * 0.02500000037252903f;
                _1007 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1002 + _143), (_1002 + _144)));
                _1017 = (pow(_1007.x, 0.012683313339948654f));
                _1018 = (pow(_1007.y, 0.012683313339948654f));
                _1019 = (pow(_1007.z, 0.012683313339948654f));
                _1041 = exp2(log2(max(0.0f, (_1017 + -0.8359375f)) / (18.8515625f - (_1017 * 18.6875f))) * 6.277394771575928f);
                _1042 = exp2(log2(max(0.0f, (_1018 + -0.8359375f)) / (18.8515625f - (_1018 * 18.6875f))) * 6.277394771575928f);
                _1043 = exp2(log2(max(0.0f, (_1019 + -0.8359375f)) / (18.8515625f - (_1019 * 18.6875f))) * 6.277394771575928f);
                _1044 = _1041 * 10000.0f;
                _1045 = _1042 * 10000.0f;
                _1046 = _1043 * 10000.0f;
                if (!_955) {
                  if (!(_182 == _renderPassTest)) {
                    _1054 = _1042 * 6000.0f;
                    if (_182 == _renderPassEnemy) {
                      _1060 = _1044;
                      _1061 = _1054;
                      _1062 = (_1043 * 6000.0f);
                      _1063 = 10.0f;
                      _1064 = 1.0f;
                    } else {
                      _1060 = (_1041 * 5000.0f);
                      _1061 = _1054;
                      _1062 = _1046;
                      _1063 = 50.0f;
                      _1064 = 30.0f;
                    }
                  } else {
                    _1060 = _1044;
                    _1061 = _1045;
                    _1062 = _1046;
                    _1063 = 10.0f;
                    _1064 = 1.0f;
                  }
                } else {
                  _1060 = _1044;
                  _1061 = _1045;
                  _1062 = _1046;
                  _1063 = 10.0f;
                  _1064 = 1.0f;
                }
                _1072 = _363 - _mainPosition.x;
                _1073 = _364 - _mainPosition.y;
                _1074 = _365 - _mainPosition.z;
                _1090 = (((1.0f - saturate((sqrt(((_1072 * _1072) + (_1073 * _1073)) + (_1074 * _1074)) - _1064) / _1063)) * (1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _367)) + 0.5f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _366)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1091 = (_1060 * 1.5f);
                _1092 = (_1061 * 1.5f);
                _1093 = (_1062 * 1.5f);
              } else {
                _1090 = 0.0f;
                _1091 = _257;
                _1092 = _258;
                _1093 = _259;
              }
            } else {
              _1090 = 0.0f;
              _1091 = _257;
              _1092 = _258;
              _1093 = _259;
            }
          } else {
            _1090 = 0.0f;
            _1091 = _257;
            _1092 = _258;
            _1093 = _259;
          }
        } else {
          _812 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143);
          _813 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144);
          _815 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_812, _813, 0));
          _818 = __3__36__0__0__g_gbufferNormal.Load(int3(_812, _813, 0));
          _836 = (saturate(_818.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          _837 = (saturate(_818.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          _838 = (saturate(_818.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          _840 = rsqrt(dot(float3(_836, _837, _838), float3(_836, _837, _838)));
          _841 = _840 * _836;
          _842 = _840 * _837;
          _843 = _838 * _840;
          _846 = (float((uint)((uint)(((uint)((uint)(_815.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          _847 = (float((uint)((uint)(_815.w & 255))) * 0.007843137718737125f) + -1.0f;
          _850 = (_846 + _847) * 0.5f;
          _851 = (_846 - _847) * 0.5f;
          _855 = (1.0f - abs(_850)) - abs(_851);
          _857 = rsqrt(dot(float3(_850, _851, _855), float3(_850, _851, _855)));
          _858 = _857 * _850;
          _859 = _857 * _851;
          _860 = _857 * _855;
          _862 = select((_843 >= 0.0f), 1.0f, -1.0f);
          _865 = -0.0f - (1.0f / (_862 + _843));
          _866 = _842 * _865;
          _867 = _866 * _841;
          _868 = _862 * _841;
          _877 = mad(_860, _841, mad(_859, _867, ((((_868 * _841) * _865) + 1.0f) * _858)));
          _881 = mad(_860, _842, mad(_859, (_862 + (_866 * _842)), ((_858 * _862) * _867)));
          _885 = mad(_860, _843, mad(_859, (-0.0f - _842), (-0.0f - (_868 * _858))));
          _887 = rsqrt(dot(float3(_877, _881, _885), float3(_877, _881, _885)));
          _902 = 1.0f - dot(float3(((_887 * _877) + -0.10000000149011612f), ((_887 * _881) + -0.10000000149011612f), ((_887 * _885) + -0.10000000149011612f)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
          _907 = frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f) + _902);
          _908 = _907 * _907;
          _912 = _902 * 10.0f;
          _919 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_912, _912));
          _921 = _919.x * _919.x;
          _940 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1090 = ((saturate((_921 * _921) * 4.0f) * saturate((_908 * _908) * 5.0f)) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _367)) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _366)))));
          _1091 = ((_highLightForVision * (_940 - _257)) + _257);
          _1092 = ((_highLightForVision * ((_940 * 0.6444798111915588f) - _258)) + _258);
          _1093 = (_259 - (_highLightForVision * _259));
        }
      } else {
        _490 = _363 - _mainPosition.x;
        _491 = _364 - _mainPosition.y;
        _492 = _365 - _mainPosition.z;
        _502 = (1.0f - saturate(sqrt(((_490 * _490) + (_491 * _491)) + (_492 * _492)) * 0.125f)) * 0.20000000298023224f;
        _513 = _490 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) - _mainPosition.x) * _502);
        _514 = _491 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _mainPosition.y) * _502);
        _515 = _492 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) - _mainPosition.z) * _502);
        _517 = rsqrt(dot(float3(_513, _514, _515), float3(_513, _514, _515)));
        _520 = _515 * _517;
        _524 = select((_520 < 0.0f), (-0.0f - _520), _520) + 1.0f;
        _525 = (_514 * _517) / _524;
        _526 = (_513 * _517) / _524;
        _531 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x));
        _543 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + (_526 * 2.0f)), ((_531 * 0.10000000149011612f) + (_525 * 2.0f))));
        _555 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_526 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.06000000238418579f)) - (_543.x * 0.05000000074505806f)), ((_525 - (_531 * 0.06000000238418579f)) - (_543.w * 0.05000000074505806f))));
        _573 = uint(((((_543.w + -1.0f) + _555.y) * 0.019999999552965164f) + _143) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x));
        _574 = uint(((((_543.y + -1.0f) + _555.w) * 0.019999999552965164f) + _144) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y));
        _576 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_573, _574, 0));
        _579 = __3__36__0__0__g_gbufferNormal.Load(int3(_573, _574, 0));
        _597 = (saturate(_579.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        _598 = (saturate(_579.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        _599 = (saturate(_579.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        _601 = rsqrt(dot(float3(_597, _598, _599), float3(_597, _598, _599)));
        _602 = _601 * _597;
        _603 = _601 * _598;
        _604 = _599 * _601;
        _607 = (float((uint)((uint)(((uint)((uint)(_576.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        _608 = (float((uint)((uint)(_576.w & 255))) * 0.007843137718737125f) + -1.0f;
        _611 = (_607 + _608) * 0.5f;
        _612 = (_607 - _608) * 0.5f;
        _616 = (1.0f - abs(_611)) - abs(_612);
        _618 = rsqrt(dot(float3(_611, _612, _616), float3(_611, _612, _616)));
        _619 = _618 * _611;
        _620 = _618 * _612;
        _621 = _618 * _616;
        _623 = select((_604 >= 0.0f), 1.0f, -1.0f);
        _626 = -0.0f - (1.0f / (_623 + _604));
        _627 = _603 * _626;
        _628 = _627 * _602;
        _629 = _623 * _602;
        _638 = mad(_621, _602, mad(_620, _628, ((((_629 * _602) * _626) + 1.0f) * _619)));
        _642 = mad(_621, _603, mad(_620, (_623 + (_627 * _603)), ((_619 * _623) * _628)));
        _646 = mad(_621, _604, mad(_620, (-0.0f - _603), (-0.0f - (_629 * _619))));
        _648 = rsqrt(dot(float3(_638, _642, _646), float3(_638, _642, _646)));
        _658 = 1.0f - abs(dot(float3((_648 * _638), (_648 * _642), (_648 * _646)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
        _663 = saturate((_658 * _658) + ((_555.y * _543.y) * _555.z));
        _677 = 1.0f - dot(float3((((_555.x + -0.5f) * _555.w) + _215), (((_555.y + -0.5f) * _555.w) + _216), (((_555.z + -0.5f) * _555.w) + _217)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
        _686 = (saturate(_663 * 10.0f) * saturate((_677 * _677) * 3.0f)) + ((_555.x * _555.z) * _555.w);
        _690 = WaveReadLaneFirst(_materialIndex);
        _698 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_690 < (uint)170000), _690, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._objectiveMaskColor);
        _701 = float((uint)((uint)(((uint)(_698) >> 16) & 255)));
        _704 = float((uint)((uint)(((uint)(_698) >> 8) & 255)));
        _706 = float((uint)((uint)(_698 & 255)));
        _739 = (_555.y * _555.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
        _757 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        _758 = _757 * _detectModeLook.x;
        _759 = _757 * _detectModeLook.y;
        _760 = _757 * _detectModeLook.z;
        _761 = _363 - _detectModePosition.x;
        _762 = _364 - _detectModePosition.y;
        _763 = _365 - _detectModePosition.z;
        _764 = dot(float3(_758, _759, _760), float3(_761, _762, _763));
        _770 = _761 - (_758 * _764);
        _771 = _762 - (_759 * _764);
        _772 = _763 - (_760 * _764);
        _791 = 1.0f - saturate(sqrt(((_761 * _761) + (_762 * _762)) + (_763 * _763)) / _detectModeRadius);
        _1090 = (((_791 * _791) * ((1.0f - saturate(sqrt(((_770 * _770) + (_771 * _771)) + (_772 * _772)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _764)))) * (((_663 - _686) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _367)) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _366))))) + _686))) * _highLightForVision);
        _1091 = (_739 * select(((_701 * 0.011764707043766975f) < 0.040449999272823334f), (_701 * 0.0009105810313485563f), exp2(log2((_701 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1092 = (_739 * select(((_704 * 0.011764707043766975f) < 0.040449999272823334f), (_704 * 0.0009105810313485563f), exp2(log2((_704 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1093 = (_739 * select(((_706 * 0.011764707043766975f) < 0.040449999272823334f), (_706 * 0.0009105810313485563f), exp2(log2((_706 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    } else {
      _393 = _363 - _mainPosition.x;
      _394 = _364 - _mainPosition.y;
      _395 = _365 - _mainPosition.z;
      _423 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      _424 = _423 * _detectModeLook.x;
      _425 = _423 * _detectModeLook.y;
      _426 = _423 * _detectModeLook.z;
      _427 = _363 - _detectModePosition.x;
      _428 = _364 - _detectModePosition.y;
      _429 = _365 - _detectModePosition.z;
      _430 = dot(float3(_424, _425, _426), float3(_427, _428, _429));
      _436 = _427 - (_424 * _430);
      _437 = _428 - (_425 * _430);
      _438 = _429 - (_426 * _430);
      _1090 = ((((1.0f - saturate((sqrt(((_393 * _393) + (_394 * _394)) + (_395 * _395)) + -30.0f) * 0.05000000074505806f)) * saturate((_368 * _368) * 4.0f)) * (1.0f - saturate(sqrt(((_436 * _436) + (_437 * _437)) + (_438 * _438)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _430))))) * exp2(log2(1.0f - saturate(sqrt(((_427 * _427) + (_428 * _428)) + (_429 * _429)) / _detectModeRadius)) * 10.0f));
      _1091 = _257;
      _1092 = _258;
      _1093 = _259;
    }
  } else {
    _1090 = 0.0f;
    _1091 = 0.0f;
    _1092 = 0.0f;
    _1093 = 0.0f;
  }
  _1097 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_50) {
    if (_temperatureWarning > 0.0f) {
      _1104 = _66 * TEXCOORD.x;
      _1117 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1104 * 4.25f), ((TEXCOORD.y * 3.0f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f))));
      _1129 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1104 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1117.x * 0.10000000149011612f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f))));
      _1135 = TEXCOORD.x + -0.5f;
      _1168 = abs((_1135 + ((_1117.y + -0.5f) * 0.009999999776482582f)) + ((_1129.z + -0.5f) * 0.029999999329447746f));
      _1169 = abs(((TEXCOORD.y + -0.5f) + ((_1117.x + -0.5f) * 0.019999999552965164f)) + ((_1129.y + -0.5f) * 0.029999999329447746f));
      _1172 = max((_1168 + -0.5f), 0.0f);
      _1173 = max((_1169 + -0.5f), 0.0f);
      _1180 = 0.5f - min(max((((1.0f - (saturate(abs(_1135) * 2.0f) * 0.3999999761581421f)) * ((_1097 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1117.z * 0.30000001192092896f) + -0.5f) + (_1129.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1097 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1097 * 0.11000001430511475f) + 0.2200000137090683f));
      _1183 = max((_1168 - _1180), 0.0f);
      _1184 = max((_1169 - _1180), 0.0f);
      _1195 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);
      _1211 = saturate(_1129.x * _1117.x);
      _1212 = _1097 * 0.20000000298023224f;
      _1220 = ((saturate(_1097 * 2.0f) * saturate(saturate(sqrt((_1184 * _1184) + (_1183 * _1183)) * 10.0f) - saturate(sqrt((_1173 * _1173) + (_1172 * _1172)) * 10.0f))) * ((_1211 * (1.0f - _1212)) + _1212)) * ((((_1195 * _1195) * (3.0f - (_1195 * 2.0f))) * ((saturate((((_1117.x * 0.25f) + -0.3499999940395355f) + (_1129.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      _1224 = _1220 * (_1097 * 0.10000000149011612f);
      _1232 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1224 * (0.5f - TEXCOORD.x)) * _1129.x) + TEXCOORD.x), (((_1224 * (0.5f - TEXCOORD.y)) * _1129.y) + TEXCOORD.y)));
      _1242 = (pow(_1232.x, 0.012683313339948654f));
      _1243 = (pow(_1232.y, 0.012683313339948654f));
      _1244 = (pow(_1232.z, 0.012683313339948654f));
      _1269 = exp2(log2(max(0.0f, (_1242 + -0.8359375f)) / (18.8515625f - (_1242 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _1270 = exp2(log2(max(0.0f, (_1243 + -0.8359375f)) / (18.8515625f - (_1243 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _1271 = exp2(log2(max(0.0f, (_1244 + -0.8359375f)) / (18.8515625f - (_1244 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _1272 = 1.0f - _1220;
      _1279 = ((_1272 * _1272) * _1272) * saturate(((_1211 * _1211) * 2.0f) * _1211);
      _1282 = max(0.0010000000474974513f, _exposure0.x);
      _1292 = (((1.0f / _1282) - _1269) * _1279) + _1269;
      _1293 = (((0.6000000238418579f / _1282) - _1270) * _1279) + _1270;
      _1294 = (((0.30000001192092896f / _1282) - _1271) * _1279) + _1271;
      _1304 = ((_1097 * _1097) * _1097) * saturate(_1097 + -0.5f);
      _1309 = saturate(_1220 * 2.0f);
      _1424 = (_1309 + _1090);
      _1425 = ((((_1292 - _1091) + (((_1220 / _1282) - _1292) * _1304)) * _1309) + _1091);
      _1426 = ((((_1293 - _1092) + ((((_1220 * 0.25f) / _1282) - _1293) * _1304)) * _1309) + _1092);
      _1427 = ((((_1294 - _1093) - (_1294 * _1304)) * _1309) + _1093);
    } else {
      if (_temperatureWarning < 0.0f) {
        _1326 = _66 * TEXCOORD.x;
        _1335 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1326 * 1.5f), (TEXCOORD.y * 1.5f)));
        _1340 = WaveReadLaneFirst(_materialIndex);
        _1348 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1340 < (uint)170000), _1340, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._temperatureWarningTex);
        _1355 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1348 < (uint)65000), _1348, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1326 * 2.0f), _69));
        _1363 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - _1355.y), _1355.y) + -0.5f) * 0.30000001192092896f;
        _1365 = (_1335.x + -0.4000000059604645f) * 0.20000000298023224f;
        _1373 = max(0.0010000000474974513f, _exposure0.x);
        _1386 = 0.5f - (_1097 * 0.25f);
        _1389 = max((abs(((TEXCOORD.x + -0.5f) + _1365) + _1363) - _1386), 0.0f);
        _1390 = max((abs(((_1363 + _1365) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1386), 0.0f);
        _1412 = (_1097 * (1.0f - TEXCOORD.y)) * saturate((((_1355.y * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1390 * _1390) + (_1389 * _1389)) * 6.666666507720947f)) * 2.0f))) * saturate((_1355.y * _1355.y) * 2.0f)) * saturate(_1335.z * _1335.w));
        _1424 = (_1412 + _1090);
        _1425 = ((_1412 * ((((_1335.w * 1.8809775114059448f) + 0.11902248114347458f) / _1373) - _1091)) + _1091);
        _1426 = ((_1412 * ((((_1335.w * 1.3989123106002808f) + 0.6010876893997192f) / _1373) - _1092)) + _1092);
        _1427 = ((_1412 * ((2.0f / _1373) - _1093)) + _1093);
      } else {
        _1424 = _1090;
        _1425 = _1091;
        _1426 = _1092;
        _1427 = _1093;
      }
    }
  } else {
    _1424 = _1090;
    _1425 = _1091;
    _1426 = _1092;
    _1427 = _1093;
  }
  if (_electrocutionWarning != 0.0f) {
    _1432 = _66 * TEXCOORD.x;
    _1441 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1432 * 1.5f), (TEXCOORD.y * 1.5f)));
    _1454 = WaveReadLaneFirst(_materialIndex);
    _1462 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1454 < (uint)170000), _1454, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._electrocutionTex);
    _1473 = max(0.0010000000474974513f, _exposure0.x);
    _1482 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    _1485 = max((abs(TEXCOORD.x + -0.5f) - _1482), 0.0f);
    _1486 = max((abs(TEXCOORD.y + -0.5f) - _1482), 0.0f);
    _1501 = 1.0f - abs((frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f) + _1441.y) * 2.0f) + -1.0f);
    _1504 = (_1501 * _1501) * (saturate(sqrt((_1486 * _1486) + (_1485 * _1485)) / _1441.z) * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1462 < (uint)65000), _1462, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1441.x * 0.05000000074505806f) + (_1432 * 2.0f)), (((_1441.y * 0.05000000074505806f) + _69) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)))))).x));
    _1507 = (pow(_1504, 1.600000023841858f));
    _1519 = (_1504 + _1424);
    _1520 = ((_1507 * ((340.0f / _1473) - _1425)) + _1425);
    _1521 = ((_1507 * ((660.0f / _1473) - _1426)) + _1426);
    _1522 = ((_1507 * ((2000.0f / _1473) - _1427)) + _1427);
  } else {
    _1519 = _1424;
    _1520 = _1425;
    _1521 = _1426;
    _1522 = _1427;
  }
  _1524 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1537 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1524, 0)))).x) & 127))) + 0.5f);
  } else {
    _1537 = saturate(_1519);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1520, _1521, _1522));
    _1959 = output_color.x;
    _1960 = output_color.y;
    _1961 = output_color.z;
  } else {
    _1959 = _1520;
    _1960 = _1521;
    _1961 = _1522;
  }
  if (_etcParams.y > 1.0f) {
    _1969 = abs(_68);
    _1970 = abs(_69 + -1.0f);
    _1974 = saturate(1.0f - (dot(float2(_1969, _1970), float2(_1969, _1970)) * saturate(_etcParams.y + -1.0f)));
    _1979 = (_1974 * _1959);
    _1980 = (_1974 * _1960);
    _1981 = (_1974 * _1961);
  } else {
    _1979 = _1959;
    _1980 = _1960;
    _1981 = _1961;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _2014 = select((_1979 <= 0.0031308000907301903f), (_1979 * 12.920000076293945f), (((pow(_1979, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2015 = select((_1980 <= 0.0031308000907301903f), (_1980 * 12.920000076293945f), (((pow(_1980, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2016 = select((_1981 <= 0.0031308000907301903f), (_1981 * 12.920000076293945f), (((pow(_1981, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2014 = _1979;
    _2015 = _1980;
    _2016 = _1981;
  }
  if (!(_etcParams.y < 1.0f)) {
    _2021 = float((uint)_1524);
    if (!(_2021 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_2021 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _2030 = _2014;
        _2031 = _2015;
        _2032 = _2016;
      } else {
        _2030 = 0.0f;
        _2031 = 0.0f;
        _2032 = 0.0f;
      }
    } else {
      _2030 = 0.0f;
      _2031 = 0.0f;
      _2032 = 0.0f;
    }
  } else {
    _2030 = _2014;
    _2031 = _2015;
    _2032 = _2016;
  }
  _2042 = exp2(log2(_2030 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2043 = exp2(log2(_2031 * 9.999999747378752e-05f) * 0.1593017578125f);
  _2044 = exp2(log2(_2032 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_2042 * 18.6875f) + 1.0f)) * ((_2042 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_2043 * 18.6875f) + 1.0f)) * ((_2043 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_2044 * 18.6875f) + 1.0f)) * ((_2044 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1537;
  return SV_Target;
}