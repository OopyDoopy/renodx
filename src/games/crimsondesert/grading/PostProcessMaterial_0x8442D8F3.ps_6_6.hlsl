#include "../grading/tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

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
  int3 _padding : packoffset(c012.y);
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

struct BindlessParameters_PostProcessUber_CD_t {
  PostProcessUber_CDStruct BindlessParameters_PostProcessUber_CD;
};

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
  bool _46;
  bool _50;
  float _139;
  float _140;
  float _143;
  float _144;
  float _206;
  float _207;
  int _251;
  int _326;
  float _327;
  float _328;
  float _329;
  float _330;
  float _331;
  float _332;
  float _988;
  float _989;
  float _990;
  float _991;
  float _992;
  float _1018;
  float _1019;
  float _1020;
  float _1021;
  float _1316;
  float _1317;
  float _1318;
  float _1319;
  float _1411;
  float _1412;
  float _1413;
  float _1414;
  float _1429;
  float _1715;
  float _1716;
  float _1717;
  float _1837;
  float _1838;
  float _1839;
  float _1857;
  float _1858;
  float _1859;
  float _1892;
  float _1893;
  float _1894;
  float _1908;
  float _1909;
  float _1910;
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
  float _262;
  float _298;
  float _357;
  float _358;
  float _359;
  float _387;
  float _388;
  float _389;
  float _390;
  float _391;
  float _392;
  float _393;
  float _394;
  float _400;
  float _401;
  float _402;
  float _454;
  float _455;
  float _456;
  float _466;
  float _477;
  float _478;
  float _479;
  float _481;
  float _484;
  float _488;
  float _489;
  float _490;
  float _495;
  float4 _507;
  float4 _519;
  uint _537;
  uint _538;
  float4 _543;
  float _561;
  float _562;
  float _563;
  float _565;
  float _566;
  float _567;
  float _568;
  float _571;
  float _572;
  float _575;
  float _576;
  float _580;
  float _582;
  float _583;
  float _584;
  float _585;
  float _587;
  float _590;
  float _591;
  float _592;
  float _593;
  float _602;
  float _606;
  float _610;
  float _612;
  float _622;
  float _627;
  float _641;
  float _650;
  int _654;
  int _662;
  float _665;
  float _668;
  float _670;
  float _703;
  float _721;
  float _722;
  float _723;
  float _724;
  float _725;
  float _726;
  float _727;
  float _728;
  float _734;
  float _735;
  float _736;
  float _755;
  uint _776;
  uint _777;
  float4 _782;
  float _800;
  float _801;
  float _802;
  float _804;
  float _805;
  float _806;
  float _807;
  float _810;
  float _811;
  float _814;
  float _815;
  float _819;
  float _821;
  float _822;
  float _823;
  float _824;
  float _826;
  float _829;
  float _830;
  float _831;
  float _832;
  float _841;
  float _845;
  float _849;
  float _851;
  float _866;
  float _871;
  float _872;
  float _876;
  float _885;
  float _904;
  bool _919;
  int _948;
  float _966;
  float4 _971;
  float _982;
  float _1000;
  float _1001;
  float _1002;
  float _1025;
  float _1032;
  float4 _1045;
  float4 _1057;
  float _1063;
  float _1096;
  float _1097;
  float _1100;
  float _1101;
  float _1108;
  float _1111;
  float _1112;
  float _1123;
  float _1139;
  float _1140;
  float _1148;
  float _1152;
  float4 _1160;
  float _1164;
  float _1171;
  float _1174;
  float _1184;
  float _1185;
  float _1186;
  float _1196;
  float _1201;
  float _1218;
  float4 _1227;
  int _1232;
  int _1240;
  float _1255;
  float _1257;
  float _1265;
  float _1278;
  float _1281;
  float _1282;
  float _1304;
  float _1324;
  float4 _1333;
  int _1346;
  int _1354;
  float _1365;
  float _1374;
  float _1377;
  float _1378;
  float _1393;
  float _1396;
  float _1399;
  uint _1416;
  float _1438;
  float _1487;
  float _1488;
  float _1489;
  float _1491;
  float _1498;
  float _1499;
  float _1500;
  float _1519;
  float _1520;
  float _1521;
  float _1522;
  float _1523;
  float _1524;
  float _1525;
  float _1526;
  float _1527;
  float _1573;
  float _1574;
  float _1575;
  float _1576;
  float _1577;
  float _1578;
  float _1579;
  float _1592;
  float _1593;
  float _1594;
  float _1595;
  float _1601;
  float _1604;
  float _1611;
  float _1612;
  float _1613;
  float _1620;
  float _1621;
  float _1622;
  float _1632;
  float _1657;
  float _1658;
  float _1659;
  float _1678;
  float _1679;
  float _1680;
  float _1686;
  float _1690;
  float _1691;
  float _1692;
  float _1693;
  float _1698;
  float _1723;
  float _1727;
  float _1728;
  float _1729;
  float _1730;
  int _1771;
  float _1826;
  float _1847;
  float _1848;
  float _1852;
  float _1899;
  float _25[36];
  _37 = WaveReadLaneFirst(_materialIndex);
  _46 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio) >= 0.009999999776482582f);
  _50 = (abs(_temperatureWarning) >= 0.009999999776482582f);
  if (!(_46 || _50)) {
    if (true) discard;
  }
  _66 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _68 = (TEXCOORD.x * 2.0f) + -1.0f;
  _69 = TEXCOORD.y * 2.0f;
  _70 = 1.0f - _69;
  _71 = WaveReadLaneFirst(_materialIndex);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._fishEyeMaxPower);
  if (((bool)((bool)(_79 > 0.0010000000474974513f) || (bool)(_79 < -0.0010000000474974513f))) && ((bool)(!_46))) {
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
  _153 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  if (((bool)((bool)(_highLightForVisionRemoteCatch > 0.0f) || (bool)(_highLightForVision > 0.0f))) || (bool)(_characterHighlight > 0.0f)) {
    uint2 _165; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_165.x, _165.y);
    _182 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((uint)(_165.x)))))) + 0.5f) * _143), int((float((int)(int(float((int)((uint)(_165.y)))))) + 0.5f) * _144), 0)))).x) & 255;
    _190 = (float((uint)((int)((uint)((int)(((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((uint)(_165.x)))))) + 0.5f) * _143), int((float((int)(int(float((int)((uint)(_165.y)))))) + 0.5f) * _144), 0)))).x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _191 = (float((uint)((int)(((uint)((int)(((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((uint)(_165.x)))))) + 0.5f) * _143), int((float((int)(int(float((int)((uint)(_165.y)))))) + 0.5f) * _144), 0)))).x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
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
    if (_182 == _renderPassDetectObjective) {
      _251 = _renderPassDetectRemoteCatch;
      _262 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x));
      _298 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _326 = _251;
      _327 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _298);
      _328 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _298);
      _329 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _298);
      _330 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x);
      _331 = (float((uint)((int)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 16777215))) * 5.960465188081798e-08f);
      _332 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
    } else {
      bool __branch_chain_229;
      if (_182 == _renderPassDetectRemoteCatch) {
        _251 = _renderPassDetectRemoteCatch;
        __branch_chain_229 = true;
      } else {
        if ((bool)(_182 == _renderPassDetectPickedRemoteCatch) || (bool)(_182 == _renderPassKnowledgeNPC)) {
          _251 = _renderPassDetectRemoteCatch;
          __branch_chain_229 = true;
        } else {
          if ((bool)(_182 == _renderPassEnemy) || (bool)(_182 == _renderPassSelfPlayer)) {
            _251 = _renderPassDetectRemoteCatch;
            __branch_chain_229 = true;
          } else {
            if (_182 == _renderPassTest) {
              _251 = _renderPassDetectRemoteCatch;
              __branch_chain_229 = true;
            } else {
              _326 = _renderPassDetectRemoteCatch;
              _327 = 0.0f;
              _328 = 0.0f;
              _329 = 0.0f;
              _330 = 0.0f;
              _331 = 0.0f;
              _332 = 0.0f;
              __branch_chain_229 = false;
            }
          }
        }
      }
      if (__branch_chain_229) {
        _262 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x));
        _298 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
        _326 = _251;
        _327 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _298);
        _328 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _298);
        _329 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _70, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _68))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _298);
        _330 = (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _143), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _144), 0)))).x);
        _331 = (float((uint)((int)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 16777215))) * 5.960465188081798e-08f);
        _332 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
      }
    }
    if (!(_182 == _326) || ((_182 == _326) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio) > 0.0010000000474974513f))) || (((_182 == _326) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio) > 0.0010000000474974513f)) && ((bool)(_highLightForVision < 0.0010000000474974513f) && (bool)(_highLightForVisionRemoteCatch < 0.0010000000474974513f)))) {
      if (!(_182 == _renderPassDetectObjective) || ((_182 == _renderPassDetectObjective) && ((bool)(_highLightForVision < 0.0010000000474974513f) && (bool)(_highLightForVisionRemoteCatch < 0.0010000000474974513f)))) {
        if (!(_182 == _renderPassKnowledgeNPC) || ((_182 == _renderPassKnowledgeNPC) && (_highLightForVision < 0.0010000000474974513f))) {
          _919 = (_182 == _renderPassSelfPlayer);
          if ((_919) | (((bool)((bool)(_182 == _renderPassTest) || (bool)(_182 == _renderPassEnemy))) || (bool)(_182 == _renderPassDetectPickedRemoteCatch))) {
            if ((bool)(_characterHighlight > 0.0010000000474974513f) || (bool)(_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _948 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143)), (uint)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144)), 0)))).x) & 127;
              if (!((uint)_948 > (uint)10) | ((bool)((uint)_948 > (uint)19) && (bool)(_948 != 107))) {
                _966 = _332 * 0.02500000037252903f;
                _971 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_966 + _143), (_966 + _144)));
                if (!_919) {
                  if (!(_182 == _renderPassTest)) {
                    _982 = _971.y * 0.6000000238418579f;
                    if (_182 == _renderPassEnemy) {
                      _988 = _971.x;
                      _989 = _982;
                      _990 = (_971.z * 0.6000000238418579f);
                      _991 = 10.0f;
                      _992 = 1.0f;
                    } else {
                      _988 = (_971.x * 0.5f);
                      _989 = _982;
                      _990 = _971.z;
                      _991 = 50.0f;
                      _992 = 30.0f;
                    }
                  } else {
                    _988 = _971.x;
                    _989 = _971.y;
                    _990 = _971.z;
                    _991 = 10.0f;
                    _992 = 1.0f;
                  }
                } else {
                  _988 = _971.x;
                  _989 = _971.y;
                  _990 = _971.z;
                  _991 = 10.0f;
                  _992 = 1.0f;
                }
                _1000 = _327 - _mainPosition.x;
                _1001 = _328 - _mainPosition.y;
                _1002 = _329 - _mainPosition.z;
                _1018 = (((1.0f - saturate((sqrt(((_1000 * _1000) + (_1001 * _1001)) + (_1002 * _1002)) - _992) / _991)) * (1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _331)) + 0.5f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _330)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1019 = (_988 * 1.5f);
                _1020 = (_989 * 1.5f);
                _1021 = (_990 * 1.5f);
              } else {
                _1018 = 0.0f;
                _1019 = _220.x;
                _1020 = _220.y;
                _1021 = _220.z;
              }
            } else {
              _1018 = 0.0f;
              _1019 = _220.x;
              _1020 = _220.y;
              _1021 = _220.z;
            }
          } else {
            _1018 = 0.0f;
            _1019 = _220.x;
            _1020 = _220.y;
            _1021 = _220.z;
          }
        } else {
          _776 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _143);
          _777 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _144);
          _782 = __3__36__0__0__g_gbufferNormal.Load(int3(_776, _777, 0));
          _800 = (saturate(_782.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          _801 = (saturate(_782.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          _802 = (saturate(_782.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          _804 = rsqrt(dot(float3(_800, _801, _802), float3(_800, _801, _802)));
          _805 = _804 * _800;
          _806 = _804 * _801;
          _807 = _802 * _804;
          _810 = (float((uint)((int)(((uint)((int)(((uint4)(__3__36__0__0__g_gbufferBaseColor.Load(int3(_776, _777, 0)))).w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          _811 = (float((uint)((int)((((uint4)(__3__36__0__0__g_gbufferBaseColor.Load(int3(_776, _777, 0)))).w) & 255))) * 0.007843137718737125f) + -1.0f;
          _814 = (_810 + _811) * 0.5f;
          _815 = (_810 - _811) * 0.5f;
          _819 = (1.0f - abs(_814)) - abs(_815);
          _821 = rsqrt(dot(float3(_814, _815, _819), float3(_814, _815, _819)));
          _822 = _821 * _814;
          _823 = _821 * _815;
          _824 = _821 * _819;
          _826 = select((_807 >= 0.0f), 1.0f, -1.0f);
          _829 = -0.0f - (1.0f / (_826 + _807));
          _830 = _806 * _829;
          _831 = _830 * _805;
          _832 = _826 * _805;
          _841 = mad(_824, _805, mad(_823, _831, ((((_832 * _805) * _829) + 1.0f) * _822)));
          _845 = mad(_824, _806, mad(_823, (_826 + (_830 * _806)), ((_822 * _826) * _831)));
          _849 = mad(_824, _807, mad(_823, (-0.0f - _806), (-0.0f - (_832 * _822))));
          _851 = rsqrt(dot(float3(_841, _845, _849), float3(_841, _845, _849)));
          _866 = 1.0f - dot(float3(((_851 * _841) + -0.10000000149011612f), ((_851 * _845) + -0.10000000149011612f), ((_851 * _849) + -0.10000000149011612f)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
          _871 = frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f) + _866);
          _872 = _871 * _871;
          _876 = _866 * 10.0f;
          _885 = (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_876, _876)))).x) * (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_876, _876)))).x);
          _904 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1018 = ((saturate((_885 * _885) * 4.0f) * saturate((_872 * _872) * 5.0f)) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _331)) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _330)))));
          _1019 = ((_highLightForVision * (_904 - _220.x)) + _220.x);
          _1020 = ((_highLightForVision * ((_904 * 0.6444798111915588f) - _220.y)) + _220.y);
          _1021 = (_220.z - (_highLightForVision * _220.z));
        }
      } else {
        _454 = _327 - _mainPosition.x;
        _455 = _328 - _mainPosition.y;
        _456 = _329 - _mainPosition.z;
        _466 = (1.0f - saturate(sqrt(((_454 * _454) + (_455 * _455)) + (_456 * _456)) * 0.125f)) * 0.20000000298023224f;
        _477 = _454 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x) - _mainPosition.x) * _466);
        _478 = _455 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _mainPosition.y) * _466);
        _479 = _456 - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z) - _mainPosition.z) * _466);
        _481 = rsqrt(dot(float3(_477, _478, _479), float3(_477, _478, _479)));
        _484 = _479 * _481;
        _488 = select((_484 < 0.0f), (-0.0f - _484), _484) + 1.0f;
        _489 = (_478 * _481) / _488;
        _490 = (_477 * _481) / _488;
        _495 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + sin(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x));
        _507 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + (_490 * 2.0f)), ((_495 * 0.10000000149011612f) + (_489 * 2.0f))));
        _519 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_490 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.06000000238418579f)) - (_507.x * 0.05000000074505806f)), ((_489 - (_495 * 0.06000000238418579f)) - (_507.w * 0.05000000074505806f))));
        _537 = uint(((((_507.w + -1.0f) + _519.y) * 0.019999999552965164f) + _143) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x));
        _538 = uint(((((_507.y + -1.0f) + _519.w) * 0.019999999552965164f) + _144) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y));
        _543 = __3__36__0__0__g_gbufferNormal.Load(int3(_537, _538, 0));
        _561 = (saturate(_543.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        _562 = (saturate(_543.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        _563 = (saturate(_543.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        _565 = rsqrt(dot(float3(_561, _562, _563), float3(_561, _562, _563)));
        _566 = _565 * _561;
        _567 = _565 * _562;
        _568 = _563 * _565;
        _571 = (float((uint)((int)(((uint)((int)(((uint4)(__3__36__0__0__g_gbufferBaseColor.Load(int3(_537, _538, 0)))).w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        _572 = (float((uint)((int)((((uint4)(__3__36__0__0__g_gbufferBaseColor.Load(int3(_537, _538, 0)))).w) & 255))) * 0.007843137718737125f) + -1.0f;
        _575 = (_571 + _572) * 0.5f;
        _576 = (_571 - _572) * 0.5f;
        _580 = (1.0f - abs(_575)) - abs(_576);
        _582 = rsqrt(dot(float3(_575, _576, _580), float3(_575, _576, _580)));
        _583 = _582 * _575;
        _584 = _582 * _576;
        _585 = _582 * _580;
        _587 = select((_568 >= 0.0f), 1.0f, -1.0f);
        _590 = -0.0f - (1.0f / (_587 + _568));
        _591 = _567 * _590;
        _592 = _591 * _566;
        _593 = _587 * _566;
        _602 = mad(_585, _566, mad(_584, _592, ((((_593 * _566) * _590) + 1.0f) * _583)));
        _606 = mad(_585, _567, mad(_584, (_587 + (_591 * _567)), ((_583 * _587) * _592)));
        _610 = mad(_585, _568, mad(_584, (-0.0f - _567), (-0.0f - (_593 * _583))));
        _612 = rsqrt(dot(float3(_602, _606, _610), float3(_602, _606, _610)));
        _622 = 1.0f - abs(dot(float3((_612 * _602), (_612 * _606), (_612 * _610)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
        _627 = saturate((_622 * _622) + ((_519.y * _507.y) * _519.z));
        _641 = 1.0f - dot(float3((((_519.x + -0.5f) * _519.w) + _215), (((_519.y + -0.5f) * _519.w) + _216), (((_519.z + -0.5f) * _519.w) + _217)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))));
        _650 = (saturate(_627 * 10.0f) * saturate((_641 * _641) * 3.0f)) + ((_519.x * _519.z) * _519.w);
        _654 = WaveReadLaneFirst(_materialIndex);
        _662 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_654 < (uint)170000), _654, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._objectiveMaskColor);
        _665 = float((uint)((int)(((uint)(_662) >> 16) & 255)));
        _668 = float((uint)((int)(((uint)(_662) >> 8) & 255)));
        _670 = float((uint)((int)(_662 & 255)));
        _703 = (_519.y * _519.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
        _721 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        _722 = _721 * _detectModeLook.x;
        _723 = _721 * _detectModeLook.y;
        _724 = _721 * _detectModeLook.z;
        _725 = _327 - _detectModePosition.x;
        _726 = _328 - _detectModePosition.y;
        _727 = _329 - _detectModePosition.z;
        _728 = dot(float3(_722, _723, _724), float3(_725, _726, _727));
        _734 = _725 - (_722 * _728);
        _735 = _726 - (_723 * _728);
        _736 = _727 - (_724 * _728);
        _755 = 1.0f - saturate(sqrt(((_725 * _725) + (_726 * _726)) + (_727 * _727)) / _detectModeRadius);
        _1018 = (((_755 * _755) * ((1.0f - saturate(sqrt(((_734 * _734) + (_735 * _735)) + (_736 * _736)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _728)))) * (((_627 - _650) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _331)) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _330))))) + _650))) * _highLightForVision);
        _1019 = (_703 * select(((_665 * 0.011764707043766975f) < 0.040449999272823334f), (_665 * 0.0009105810313485563f), exp2(log2((_665 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1020 = (_703 * select(((_668 * 0.011764707043766975f) < 0.040449999272823334f), (_668 * 0.0009105810313485563f), exp2(log2((_668 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1021 = (_703 * select(((_670 * 0.011764707043766975f) < 0.040449999272823334f), (_670 * 0.0009105810313485563f), exp2(log2((_670 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    } else {
      _357 = _327 - _mainPosition.x;
      _358 = _328 - _mainPosition.y;
      _359 = _329 - _mainPosition.z;
      _387 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      _388 = _387 * _detectModeLook.x;
      _389 = _387 * _detectModeLook.y;
      _390 = _387 * _detectModeLook.z;
      _391 = _327 - _detectModePosition.x;
      _392 = _328 - _detectModePosition.y;
      _393 = _329 - _detectModePosition.z;
      _394 = dot(float3(_388, _389, _390), float3(_391, _392, _393));
      _400 = _391 - (_388 * _394);
      _401 = _392 - (_389 * _394);
      _402 = _393 - (_390 * _394);
      _1018 = ((((1.0f - saturate((sqrt(((_357 * _357) + (_358 * _358)) + (_359 * _359)) + -30.0f) * 0.05000000074505806f)) * saturate((_332 * _332) * 4.0f)) * (1.0f - saturate(sqrt(((_400 * _400) + (_401 * _401)) + (_402 * _402)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _394))))) * exp2(log2(1.0f - saturate(sqrt(((_391 * _391) + (_392 * _392)) + (_393 * _393)) / _detectModeRadius)) * 10.0f));
      _1019 = _220.x;
      _1020 = _220.y;
      _1021 = _220.z;
    }
  } else {
    _1018 = 0.0f;
    _1019 = 0.0f;
    _1020 = 0.0f;
    _1021 = 0.0f;
  }
  _1025 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_50) {
    if (_temperatureWarning > 0.0f) {
      _1032 = _66 * TEXCOORD.x;
      _1045 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1032 * 4.25f), ((TEXCOORD.y * 3.0f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f))));
      _1057 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1032 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1045.x * 0.10000000149011612f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f))));
      _1063 = TEXCOORD.x + -0.5f;
      _1096 = abs((_1063 + ((_1045.y + -0.5f) * 0.009999999776482582f)) + ((_1057.z + -0.5f) * 0.029999999329447746f));
      _1097 = abs(((TEXCOORD.y + -0.5f) + ((_1045.x + -0.5f) * 0.019999999552965164f)) + ((_1057.y + -0.5f) * 0.029999999329447746f));
      _1100 = max((_1096 + -0.5f), 0.0f);
      _1101 = max((_1097 + -0.5f), 0.0f);
      _1108 = 0.5f - min(max((((1.0f - (saturate(abs(_1063) * 2.0f) * 0.3999999761581421f)) * ((_1025 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1045.z * 0.30000001192092896f) + -0.5f) + (_1057.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1025 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1025 * 0.11000001430511475f) + 0.2200000137090683f));
      _1111 = max((_1096 - _1108), 0.0f);
      _1112 = max((_1097 - _1108), 0.0f);
      _1123 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);
      _1139 = saturate(_1057.x * _1045.x);
      _1140 = _1025 * 0.20000000298023224f;
      _1148 = ((saturate(_1025 * 2.0f) * saturate(saturate(sqrt((_1112 * _1112) + (_1111 * _1111)) * 10.0f) - saturate(sqrt((_1101 * _1101) + (_1100 * _1100)) * 10.0f))) * ((_1139 * (1.0f - _1140)) + _1140)) * ((((_1123 * _1123) * (3.0f - (_1123 * 2.0f))) * ((saturate((((_1045.x * 0.25f) + -0.3499999940395355f) + (_1057.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      _1152 = _1148 * (_1025 * 0.10000000149011612f);
      _1160 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1152 * (0.5f - TEXCOORD.x)) * _1057.x) + TEXCOORD.x), (((_1152 * (0.5f - TEXCOORD.y)) * _1057.y) + TEXCOORD.y)));
      _1164 = 1.0f - _1148;
      _1171 = ((_1164 * _1164) * _1164) * saturate(((_1139 * _1139) * 2.0f) * _1139);
      _1174 = max(0.0010000000474974513f, _exposure0.x);
      _1184 = (((1.0f / _1174) - _1160.x) * _1171) + _1160.x;
      _1185 = (((0.6000000238418579f / _1174) - _1160.y) * _1171) + _1160.y;
      _1186 = (((0.30000001192092896f / _1174) - _1160.z) * _1171) + _1160.z;
      _1196 = ((_1025 * _1025) * _1025) * saturate(_1025 + -0.5f);
      _1201 = saturate(_1148 * 2.0f);
      _1316 = (_1201 + _1018);
      _1317 = ((((_1184 - _1019) + (((_1148 / _1174) - _1184) * _1196)) * _1201) + _1019);
      _1318 = ((((_1185 - _1020) + ((((_1148 * 0.25f) / _1174) - _1185) * _1196)) * _1201) + _1020);
      _1319 = ((((_1186 - _1021) - (_1186 * _1196)) * _1201) + _1021);
    } else {
      if (_temperatureWarning < 0.0f) {
        _1218 = _66 * TEXCOORD.x;
        _1227 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 1.5f), (TEXCOORD.y * 1.5f)));
        _1232 = WaveReadLaneFirst(_materialIndex);
        _1240 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_1232 < (uint)170000), _1232, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._temperatureWarningTex);
        _1255 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1240 < (uint)65000), _1240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 2.0f), _69)))).y)), (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1240 < (uint)65000), _1240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 2.0f), _69)))).y)) + -0.5f) * 0.30000001192092896f;
        _1257 = (_1227.x + -0.4000000059604645f) * 0.20000000298023224f;
        _1265 = max(0.0010000000474974513f, _exposure0.x);
        _1278 = 0.5f - (_1025 * 0.25f);
        _1281 = max((abs(((TEXCOORD.x + -0.5f) + _1257) + _1255) - _1278), 0.0f);
        _1282 = max((abs(((_1255 + _1257) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1278), 0.0f);
        _1304 = (_1025 * (1.0f - TEXCOORD.y)) * saturate(((((((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1240 < (uint)65000), _1240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 2.0f), _69)))).y) * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1282 * _1282) + (_1281 * _1281)) * 6.666666507720947f)) * 2.0f))) * saturate(((((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1240 < (uint)65000), _1240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 2.0f), _69)))).y) * (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1240 < (uint)65000), _1240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1218 * 2.0f), _69)))).y)) * 2.0f)) * saturate(_1227.z * _1227.w));
        _1316 = (_1304 + _1018);
        _1317 = ((_1304 * ((((_1227.w * 1.8809775114059448f) + 0.11902248114347458f) / _1265) - _1019)) + _1019);
        _1318 = ((_1304 * ((((_1227.w * 1.3989123106002808f) + 0.6010876893997192f) / _1265) - _1020)) + _1020);
        _1319 = ((_1304 * ((2.0f / _1265) - _1021)) + _1021);
      } else {
        _1316 = _1018;
        _1317 = _1019;
        _1318 = _1020;
        _1319 = _1021;
      }
    }
  } else {
    _1316 = _1018;
    _1317 = _1019;
    _1318 = _1020;
    _1319 = _1021;
  }
  if (_electrocutionWarning != 0.0f) {
    _1324 = _66 * TEXCOORD.x;
    _1333 = __0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1324 * 1.5f), (TEXCOORD.y * 1.5f)));
    _1346 = WaveReadLaneFirst(_materialIndex);
    _1354 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((uint)((int)(select(((uint)_1346 < (uint)170000), _1346, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._electrocutionTex);
    _1365 = max(0.0010000000474974513f, _exposure0.x);
    _1374 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    _1377 = max((abs(TEXCOORD.x + -0.5f) - _1374), 0.0f);
    _1378 = max((abs(TEXCOORD.y + -0.5f) - _1374), 0.0f);
    _1393 = 1.0f - abs((frac((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f) + _1333.y) * 2.0f) + -1.0f);
    _1396 = (_1393 * _1393) * (saturate(sqrt((_1378 * _1378) + (_1377 * _1377)) / _1333.z) * (((float4)(__0__7__0__0__g_bindlessTextures[((uint)((int)(select(((uint)_1354 < (uint)65000), _1354, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1333.x * 0.05000000074505806f) + (_1324 * 2.0f)), (((_1333.y * 0.05000000074505806f) + _69) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)))))).x));
    _1399 = (pow(_1396, 1.600000023841858f));
    _1411 = (_1396 + _1316);
    _1412 = ((_1399 * ((340.0f / _1365) - _1317)) + _1317);
    _1413 = ((_1399 * ((660.0f / _1365) - _1318)) + _1318);
    _1414 = ((_1399 * ((2000.0f / _1365) - _1319)) + _1319);
  } else {
    _1411 = _1316;
    _1412 = _1317;
    _1413 = _1318;
    _1414 = _1319;
  }
  _1416 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1429 = (float((uint)((int)((((uint2)(__3__36__0__0__g_stencil.Load(int3((uint)(uint(SV_Position.x)), _1416, 0)))).x) & 127))) + 0.5f);
  } else {
    _1429 = saturate(_1411);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1412, _1413, _1414));
    _1837 = output_color.x;
    _1838 = output_color.y;
    _1839 = output_color.z;
  } else {
    _1837 = _1412;
    _1838 = _1413;
    _1839 = _1414;
  }
  if (_etcParams.y > 1.0f) {
    _1847 = abs(_68);
    _1848 = abs(_69 + -1.0f);
    _1852 = saturate(1.0f - (dot(float2(_1847, _1848), float2(_1847, _1848)) * saturate(_etcParams.y + -1.0f)));
    _1857 = (_1852 * _1837);
    _1858 = (_1852 * _1838);
    _1859 = (_1852 * _1839);
  } else {
    _1857 = _1837;
    _1858 = _1838;
    _1859 = _1839;
  }
  if ((bool)(_localToneMappingParams.w > 0.0f) && (bool)(_etcParams.z > 0.0f)) {
    _1892 = select((_1857 <= 0.0031308000907301903f), (_1857 * 12.920000076293945f), (((pow(_1857, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1893 = select((_1858 <= 0.0031308000907301903f), (_1858 * 12.920000076293945f), (((pow(_1858, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1894 = select((_1859 <= 0.0031308000907301903f), (_1859 * 12.920000076293945f), (((pow(_1859, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1892 = _1857;
    _1893 = _1858;
    _1894 = _1859;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1899 = float((uint)_1416);
    if (!(_1899 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1899 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1908 = _1892;
        _1909 = _1893;
        _1910 = _1894;
      } else {
        _1908 = 0.0f;
        _1909 = 0.0f;
        _1910 = 0.0f;
      }
    } else {
      _1908 = 0.0f;
      _1909 = 0.0f;
      _1910 = 0.0f;
    }
  } else {
    _1908 = _1892;
    _1909 = _1893;
    _1910 = _1894;
  }
  SV_Target.x = _1908;
  SV_Target.y = _1909;
  SV_Target.z = _1910;
  SV_Target.w = _1429;
  return SV_Target;
}