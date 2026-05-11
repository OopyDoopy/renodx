#include "../tonemap.hlsli"

struct PostProcessTransitionStruct {
  uint _sceneSampleType;
  uint _sceneDistortTex;
  float2 _sceneDistortTexScale;
  float2 _sceneDistortIntensity;
  float _scenePolarDistort;
  float2 _scenePolarDistortCenter;
  float _topVignetteRatio;
  float _topVignetteRadius;
  float _topVignettePower;
  uint _topVignetteColor;
  float _sideVignetteRatio;
  float _sideVignetteRadius;
  float _sideVignettePower;
  uint _sideVignetteColor;
  float _bottomVignetteRatio;
  float _bottomVignetteRadius;
  float _bottomVignettePower;
  uint _bottomVignetteColor;
  float _impactFrame;
  float _impactFrameFresnel;
  float _impactFrameFresnelIntensity;
  float _impactFrameInverse;
  uint _chapterTransitionTex;
  uint _chapterTransitionNoiseTex;
  float _chapterTransition;
  float _chapterTransitionUseDivide;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessTransition {
  PostProcessTransitionStruct BindlessParameters_PostProcessTransition;
};

typedef BindlessParameters_PostProcessTransition BindlessParameters_PostProcessTransition_t;
ConstantBuffer<BindlessParameters_PostProcessTransition_t> BindlessParameters_PostProcessTransition[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticBilinearBlackBorder : register(s4, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _28;
  float _36;
  float _166;
  float _167;
  float _572;
  float _573;
  float _574;
  float _575;
  float _576;
  float _577;
  float _578;
  bool _623;
  float _682;
  float _697;
  float _698;
  float _699;
  float _821;
  float _822;
  float _823;
  float _917;
  float _918;
  float _919;
  float _1012;
  float _1013;
  float _1014;
  float _1227;
  float _1228;
  float _1229;
  float _1243;
  float _1448;
  float _1449;
  float _1450;
  float _1543;
  float _1544;
  float _1545;
  float _1665;
  float _1666;
  float _1667;
  float _1688;
  float _1689;
  float _1690;
  float _1723;
  float _1724;
  float _1725;
  float _1739;
  float _1740;
  float _1741;
  int _40;
  float _49;
  float _50;
  float _51;
  float _52;
  float _54;
  bool _57;
  bool _58;
  bool _59;
  bool _60;
  float _73;
  int _74;
  float _83;
  float _84;
  int _87;
  int _95;
  float4 _101;
  int _106;
  float _114;
  float _116;
  int _120;
  float _129;
  float _130;
  int _133;
  int _141;
  float4 _147;
  int _152;
  float _161;
  float _162;
  float _168;
  float _169;
  int _170;
  int _178;
  float4 _182;
  float _192;
  float _193;
  float _194;
  uint _230;
  uint _231;
  uint4 _233;
  float4 _236;
  float _254;
  float _255;
  float _256;
  float _258;
  float _259;
  float _260;
  float _261;
  float _264;
  float _265;
  float _268;
  float _269;
  float _273;
  float _275;
  float _276;
  float _277;
  float _278;
  float _280;
  float _283;
  float _284;
  float _285;
  float _286;
  float _295;
  float _299;
  float _303;
  float _305;
  float4 _312;
  float _322;
  float _323;
  float _324;
  uint _361;
  uint _362;
  uint4 _364;
  float4 _367;
  float _385;
  float _386;
  float _387;
  float _389;
  float _390;
  float _391;
  float _392;
  float _395;
  float _396;
  float _399;
  float _400;
  float _404;
  float _406;
  float _407;
  float _408;
  float _409;
  float _411;
  float _414;
  float _415;
  float _416;
  float _417;
  float _426;
  float _430;
  float _434;
  float _436;
  float4 _443;
  float _453;
  float _454;
  float _455;
  uint _492;
  uint _493;
  uint4 _495;
  float4 _498;
  float _516;
  float _517;
  float _518;
  float _520;
  float _521;
  float _522;
  float _523;
  float _526;
  float _527;
  float _530;
  float _531;
  float _535;
  float _537;
  float _538;
  float _539;
  float _540;
  float _542;
  float _545;
  float _546;
  float _547;
  float _548;
  float _557;
  float _561;
  float _565;
  float _567;
  uint2 _580;
  int _597;
  bool _600;
  int _601;
  float _609;
  float _625;
  int _626;
  float _634;
  float _637;
  int _638;
  float _646;
  float _647;
  float _662;
  int _668;
  float _676;
  float _686;
  int _700;
  float _708;
  int _709;
  float _717;
  int _718;
  float _726;
  float _729;
  float _730;
  int _735;
  float _743;
  int _749;
  float _757;
  int _763;
  int _771;
  float _774;
  float _777;
  float _779;
  float _809;
  float _813;
  float _826;
  float _827;
  int _832;
  float _840;
  int _845;
  float _853;
  int _859;
  int _867;
  float _870;
  float _873;
  float _875;
  float _905;
  float _909;
  float _922;
  float _923;
  int _928;
  float _936;
  int _940;
  float _948;
  int _954;
  int _962;
  float _965;
  float _968;
  float _970;
  float _1000;
  float _1004;
  int _1015;
  float _1023;
  float _1028;
  bool _1029;
  float _1031;
  int _1032;
  int _1040;
  float _1049;
  float4 _1052;
  float _1062;
  float _1063;
  float _1064;
  float _1089;
  float _1090;
  float _1091;
  int _1092;
  float _1100;
  float _1103;
  float _1105;
  float _1110;
  float _1115;
  float _1116;
  int _1125;
  int _1133;
  int _1142;
  int _1150;
  float _1160;
  float _1163;
  int _1187;
  int _1195;
  float4 _1201;
  float _1205;
  uint _1230;
  float _1252;
  float _1301;
  float _1302;
  float _1303;
  float _1305;
  float _1312;
  float _1313;
  float _1314;
  float _1333;
  float _1334;
  float _1335;
  float _1336;
  float _1337;
  float _1338;
  float _1339;
  float _1340;
  float _1341;
  float _1387;
  float _1388;
  float _1389;
  float _1390;
  float _1391;
  float _1392;
  float _1393;
  float _1410;
  float _1411;
  float _1412;
  float _1413;
  float _1419;
  float _1422;
  float _1429;
  float _1430;
  float _1431;
  float _1460;
  float _1485;
  float _1486;
  float _1487;
  float _1506;
  float _1507;
  float _1508;
  float _1514;
  float _1518;
  float _1519;
  float _1520;
  float _1521;
  float _1526;
  float _1551;
  float _1555;
  float _1556;
  float _1557;
  float _1558;
  int _1599;
  float _1654;
  float _1678;
  float _1679;
  float _1683;
  float _1730;
  float _1751;
  float _1752;
  float _1753;
  float _25[36];
  _28 = WaveReadLaneFirst(_materialIndex);
  _36 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))].BindlessParameters_PostProcessTransition._scenePolarDistort);
  if (_36 < 0.0010000000474974513f) {
    _120 = WaveReadLaneFirst(_materialIndex);
    _129 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTexScale.x);
    _130 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTexScale.y);
    _133 = WaveReadLaneFirst(_materialIndex);
    _141 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTex);
    _147 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_129 * TEXCOORD.x), (_130 * TEXCOORD.y)));
    _152 = WaveReadLaneFirst(_materialIndex);
    _161 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortIntensity.x);
    _162 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortIntensity.y);
    _166 = (_161 * (_147.x + -0.5f));
    _167 = (_162 * (_147.y + -0.5f));
  } else {
    _40 = WaveReadLaneFirst(_materialIndex);
    _49 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessTransition._scenePolarDistortCenter.x);
    _50 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessTransition._scenePolarDistortCenter.y);
    _51 = TEXCOORD.x - _49;
    _52 = TEXCOORD.y - _50;
    _54 = atan(_52 / _51);
    _57 = (_51 < 0.0f);
    _58 = (_51 == 0.0f);
    _59 = (_52 >= 0.0f);
    _60 = (_52 < 0.0f);
    _73 = sqrt((_52 * _52) + (_51 * _51));
    _74 = WaveReadLaneFirst(_materialIndex);
    _83 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTexScale.x);
    _84 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTexScale.y);
    _87 = WaveReadLaneFirst(_materialIndex);
    _95 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneDistortTex);
    _101 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_95 < (uint)65000), _95, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_83 * select((_58 && _59), 0.5f, select((_58 && _60), -0.5f, (select((_57 && _60), (_54 + -3.1415927410125732f), select((_57 && _59), (_54 + 3.1415927410125732f), _54)) * 0.31830987334251404f)))), (_84 * _73)));
    _106 = WaveReadLaneFirst(_materialIndex);
    _114 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_106 < (uint)170000), _106, 0)) + 0u))].BindlessParameters_PostProcessTransition._scenePolarDistort);
    _116 = saturate(_73) * _114;
    _166 = (_116 * (_101.x + -0.5f));
    _167 = (_116 * (_101.y + -0.5f));
  }
  _168 = TEXCOORD.x - _166;
  _169 = TEXCOORD.y - _167;
  _170 = WaveReadLaneFirst(_materialIndex);
  _178 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))].BindlessParameters_PostProcessTransition._sceneSampleType);
  switch (_178) {
    case 0: {
      _182 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      _192 = (pow(_182.x, 0.012683313339948654f));
      _193 = (pow(_182.y, 0.012683313339948654f));
      _194 = (pow(_182.z, 0.012683313339948654f));
      _230 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _231 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _233 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_230, _231, 0));
      _236 = __3__36__0__0__g_gbufferNormal.Load(int3(_230, _231, 0));
      _254 = (saturate(_236.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _255 = (saturate(_236.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _256 = (saturate(_236.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _258 = rsqrt(dot(float3(_254, _255, _256), float3(_254, _255, _256)));
      _259 = _258 * _254;
      _260 = _258 * _255;
      _261 = _256 * _258;
      _264 = (float((uint)((uint)(((uint)((uint)(_233.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _265 = (float((uint)((uint)(_233.w & 255))) * 0.007843137718737125f) + -1.0f;
      _268 = (_264 + _265) * 0.5f;
      _269 = (_264 - _265) * 0.5f;
      _273 = (1.0f - abs(_268)) - abs(_269);
      _275 = rsqrt(dot(float3(_268, _269, _273), float3(_268, _269, _273)));
      _276 = _275 * _268;
      _277 = _275 * _269;
      _278 = _275 * _273;
      _280 = select((_261 >= 0.0f), 1.0f, -1.0f);
      _283 = -0.0f - (1.0f / (_280 + _261));
      _284 = _260 * _283;
      _285 = _284 * _259;
      _286 = _280 * _259;
      _295 = mad(_278, _259, mad(_277, _285, ((((_286 * _259) * _283) + 1.0f) * _276)));
      _299 = mad(_278, _260, mad(_277, (_280 + (_284 * _260)), ((_276 * _280) * _285)));
      _303 = mad(_278, _261, mad(_277, (-0.0f - _260), (-0.0f - (_286 * _276))));
      _305 = rsqrt(dot(float3(_295, _299, _303), float3(_295, _299, _303)));
      _572 = (exp2(log2(max(0.0f, (_192 + -0.8359375f)) / (18.8515625f - (_192 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_193 + -0.8359375f)) / (18.8515625f - (_193 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_194 + -0.8359375f)) / (18.8515625f - (_194 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169))).x);
      _576 = (_305 * _295);
      _577 = (_305 * _299);
      _578 = (_305 * _303);
      break;
    }
    case 1: {
      _312 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      _322 = (pow(_312.x, 0.012683313339948654f));
      _323 = (pow(_312.y, 0.012683313339948654f));
      _324 = (pow(_312.z, 0.012683313339948654f));
      _361 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _362 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _364 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_361, _362, 0));
      _367 = __3__36__0__0__g_gbufferNormal.Load(int3(_361, _362, 0));
      _385 = (saturate(_367.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _386 = (saturate(_367.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _387 = (saturate(_367.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _389 = rsqrt(dot(float3(_385, _386, _387), float3(_385, _386, _387)));
      _390 = _389 * _385;
      _391 = _389 * _386;
      _392 = _387 * _389;
      _395 = (float((uint)((uint)(((uint)((uint)(_364.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _396 = (float((uint)((uint)(_364.w & 255))) * 0.007843137718737125f) + -1.0f;
      _399 = (_395 + _396) * 0.5f;
      _400 = (_395 - _396) * 0.5f;
      _404 = (1.0f - abs(_399)) - abs(_400);
      _406 = rsqrt(dot(float3(_399, _400, _404), float3(_399, _400, _404)));
      _407 = _406 * _399;
      _408 = _406 * _400;
      _409 = _406 * _404;
      _411 = select((_392 >= 0.0f), 1.0f, -1.0f);
      _414 = -0.0f - (1.0f / (_411 + _392));
      _415 = _391 * _414;
      _416 = _415 * _390;
      _417 = _411 * _390;
      _426 = mad(_409, _390, mad(_408, _416, ((((_417 * _390) * _414) + 1.0f) * _407)));
      _430 = mad(_409, _391, mad(_408, (_411 + (_415 * _391)), ((_407 * _411) * _416)));
      _434 = mad(_409, _392, mad(_408, (-0.0f - _391), (-0.0f - (_417 * _407))));
      _436 = rsqrt(dot(float3(_426, _430, _434), float3(_426, _430, _434)));
      _572 = (exp2(log2(max(0.0f, (_322 + -0.8359375f)) / (18.8515625f - (_322 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_323 + -0.8359375f)) / (18.8515625f - (_323 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_324 + -0.8359375f)) / (18.8515625f - (_324 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_168, _169))).x);
      _576 = (_436 * _426);
      _577 = (_436 * _430);
      _578 = (_436 * _434);
      break;
    }
    case 2: {
      _443 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      _453 = (pow(_443.x, 0.012683313339948654f));
      _454 = (pow(_443.y, 0.012683313339948654f));
      _455 = (pow(_443.z, 0.012683313339948654f));
      _492 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _493 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _495 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_492, _493, 0));
      _498 = __3__36__0__0__g_gbufferNormal.Load(int3(_492, _493, 0));
      _516 = (saturate(_498.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _517 = (saturate(_498.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _518 = (saturate(_498.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _520 = rsqrt(dot(float3(_516, _517, _518), float3(_516, _517, _518)));
      _521 = _520 * _516;
      _522 = _520 * _517;
      _523 = _518 * _520;
      _526 = (float((uint)((uint)(((uint)((uint)(_495.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _527 = (float((uint)((uint)(_495.w & 255))) * 0.007843137718737125f) + -1.0f;
      _530 = (_526 + _527) * 0.5f;
      _531 = (_526 - _527) * 0.5f;
      _535 = (1.0f - abs(_530)) - abs(_531);
      _537 = rsqrt(dot(float3(_530, _531, _535), float3(_530, _531, _535)));
      _538 = _537 * _530;
      _539 = _537 * _531;
      _540 = _537 * _535;
      _542 = select((_523 >= 0.0f), 1.0f, -1.0f);
      _545 = -0.0f - (1.0f / (_542 + _523));
      _546 = _522 * _545;
      _547 = _546 * _521;
      _548 = _542 * _521;
      _557 = mad(_540, _521, mad(_539, _547, ((((_548 * _521) * _545) + 1.0f) * _538)));
      _561 = mad(_540, _522, mad(_539, (_542 + (_546 * _522)), ((_538 * _542) * _547)));
      _565 = mad(_540, _523, mad(_539, (-0.0f - _522), (-0.0f - (_548 * _538))));
      _567 = rsqrt(dot(float3(_557, _561, _565), float3(_557, _561, _565)));
      _572 = (exp2(log2(max(0.0f, (_453 + -0.8359375f)) / (18.8515625f - (_453 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_454 + -0.8359375f)) / (18.8515625f - (_454 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_455 + -0.8359375f)) / (18.8515625f - (_455 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_168, _169))).x);
      _576 = (_567 * _557);
      _577 = (_567 * _561);
      _578 = (_567 * _565);
      break;
    }
    default: {
      _572 = 0.0f;
      _573 = 0.0f;
      _574 = 0.0f;
      _575 = 0.0f;
      _576 = 0.0f;
      _577 = 0.0f;
      _578 = 0.0f;
      break;
    }
  }
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_580.x, _580.y);
  _597 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_580.x)))))) + 0.5f) * _168), int((float((int)(int(float((int)((int)(_580.y)))))) + 0.5f) * _169), 0)))).x) & 255;
  _600 = (_575 < 1.0000000116860974e-07f) || (_575 == 1.0f);
  _601 = WaveReadLaneFirst(_materialIndex);
  _609 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_601 < (uint)170000), _601, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrame);
  if (!(_609 < 0.0010000000474974513f)) {
    if (!(_597 == _renderPassSelfPlayer)) {
      if (!(_597 == _renderPassTest)) {
        _623 = (_597 == _renderPassTargetFocus);
      } else {
        _623 = true;
      }
    } else {
      _623 = true;
    }
    _625 = select(_600, 1.0f, select(_623, 0.0f, 1.0f));
    _626 = WaveReadLaneFirst(_materialIndex);
    _634 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_626 < (uint)170000), _626, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameInverse);
    _637 = select((_634 > 0.0010000000474974513f), (1.0f - _625), _625);
    _638 = WaveReadLaneFirst(_materialIndex);
    _646 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_638 < (uint)170000), _638, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameFresnel);
    _647 = abs(_646);
    if (!(_600 || (!(_647 > 0.0f)))) {
      _662 = abs(1.0f - saturate(dot(float3(_576, _577, _578), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
      _668 = WaveReadLaneFirst(_materialIndex);
      _676 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_668 < (uint)170000), _668, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameFresnelIntensity);
      _682 = ((saturate(_676 * exp2(log2(select((_646 < 0.0f), (1.0f - _662), _662)) * _647)) + 0.0020000000949949026f) * _637);
    } else {
      _682 = _637;
    }
    _686 = _682 / max(0.0010000000474974513f, _exposure0.x);
    _697 = (lerp(_572, _686, _609));
    _698 = (lerp(_573, _686, _609));
    _699 = (lerp(_574, _686, _609));
  } else {
    _697 = _572;
    _698 = _573;
    _699 = _574;
  }
  _700 = WaveReadLaneFirst(_materialIndex);
  _708 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_700 < (uint)170000), _700, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteRatio);
  _709 = WaveReadLaneFirst(_materialIndex);
  _717 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_709 < (uint)170000), _709, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteRatio);
  _718 = WaveReadLaneFirst(_materialIndex);
  _726 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_718 < (uint)170000), _718, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteRatio);
  if (!(_717 < 0.0010000000474974513f)) {
    _729 = TEXCOORD.x + -0.5f;
    _730 = TEXCOORD.y + -0.5f;
    _735 = WaveReadLaneFirst(_materialIndex);
    _743 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_735 < (uint)170000), _735, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteRadius);
    _749 = WaveReadLaneFirst(_materialIndex);
    _757 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_749 < (uint)170000), _749, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignettePower);
    _763 = WaveReadLaneFirst(_materialIndex);
    _771 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_763 < (uint)170000), _763, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteColor);
    _774 = float((uint)((uint)(((uint)(_771) >> 16) & 255)));
    _777 = float((uint)((uint)(((uint)(_771) >> 8) & 255)));
    _779 = float((uint)((uint)(_771 & 255)));
    _809 = max(0.0010000000474974513f, _exposure0.x);
    _813 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * _757) * (sqrt((_730 * _730) + (_729 * _729)) / max(0.0010000000474974513f, (1.0f - _743)))) * _717;
    _821 = (((select(((_774 * 0.003921568859368563f) < 0.040449999272823334f), (_774 * 0.0003035269910469651f), exp2(log2((_774 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _697);
    _822 = (((select(((_777 * 0.003921568859368563f) < 0.040449999272823334f), (_777 * 0.0003035269910469651f), exp2(log2((_777 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _698);
    _823 = (((select(((_779 * 0.003921568859368563f) < 0.040449999272823334f), (_779 * 0.0003035269910469651f), exp2(log2((_779 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _699);
  } else {
    _821 = _697;
    _822 = _698;
    _823 = _699;
  }
  if (!(_708 < 0.0010000000474974513f)) {
    _826 = TEXCOORD.x + -0.5f;
    _827 = TEXCOORD.y + -0.5f;
    _832 = WaveReadLaneFirst(_materialIndex);
    _840 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_832 < (uint)170000), _832, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteRadius);
    _845 = WaveReadLaneFirst(_materialIndex);
    _853 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_845 < (uint)170000), _845, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignettePower);
    _859 = WaveReadLaneFirst(_materialIndex);
    _867 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_859 < (uint)170000), _859, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteColor);
    _870 = float((uint)((uint)(((uint)(_867) >> 16) & 255)));
    _873 = float((uint)((uint)(((uint)(_867) >> 8) & 255)));
    _875 = float((uint)((uint)(_867 & 255)));
    _905 = max(0.0010000000474974513f, _exposure0.x);
    _909 = saturate(exp2(log2(1.0f - TEXCOORD.y) * _853) * (sqrt((_827 * _827) + (_826 * _826)) / max(0.0010000000474974513f, (1.0f - _840)))) * _708;
    _917 = (((select(((_870 * 0.003921568859368563f) < 0.040449999272823334f), (_870 * 0.0003035269910469651f), exp2(log2((_870 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _821);
    _918 = (((select(((_873 * 0.003921568859368563f) < 0.040449999272823334f), (_873 * 0.0003035269910469651f), exp2(log2((_873 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _822);
    _919 = (((select(((_875 * 0.003921568859368563f) < 0.040449999272823334f), (_875 * 0.0003035269910469651f), exp2(log2((_875 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _823);
  } else {
    _917 = _821;
    _918 = _822;
    _919 = _823;
  }
  if (!(_726 < 0.0010000000474974513f)) {
    _922 = TEXCOORD.x + -0.5f;
    _923 = TEXCOORD.y + -0.5f;
    _928 = WaveReadLaneFirst(_materialIndex);
    _936 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_928 < (uint)170000), _928, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteRadius);
    _940 = WaveReadLaneFirst(_materialIndex);
    _948 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_940 < (uint)170000), _940, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignettePower);
    _954 = WaveReadLaneFirst(_materialIndex);
    _962 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_954 < (uint)170000), _954, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteColor);
    _965 = float((uint)((uint)(((uint)(_962) >> 16) & 255)));
    _968 = float((uint)((uint)(((uint)(_962) >> 8) & 255)));
    _970 = float((uint)((uint)(_962 & 255)));
    _1000 = max(0.0010000000474974513f, _exposure0.x);
    _1004 = saturate((pow(TEXCOORD.y, _948)) * (sqrt((_923 * _923) + (_922 * _922)) / max(0.0010000000474974513f, (1.0f - _936)))) * _726;
    _1012 = (((select(((_965 * 0.003921568859368563f) < 0.040449999272823334f), (_965 * 0.0003035269910469651f), exp2(log2((_965 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _917);
    _1013 = (((select(((_968 * 0.003921568859368563f) < 0.040449999272823334f), (_968 * 0.0003035269910469651f), exp2(log2((_968 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _918);
    _1014 = (((select(((_970 * 0.003921568859368563f) < 0.040449999272823334f), (_970 * 0.0003035269910469651f), exp2(log2((_970 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _919);
  } else {
    _1012 = _917;
    _1013 = _918;
    _1014 = _919;
  }
  _1015 = WaveReadLaneFirst(_materialIndex);
  _1023 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1015 < (uint)170000), _1015, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransition);
  if ((_1023 >= 0.0010000000474974513f) && (_1023 < 1.0f)) {
    _1028 = _1023 * 2.0f;
    _1029 = (_1028 > 1.0f);
    _1031 = select(_1029, (_1028 + -1.0f), _1028);
    _1032 = WaveReadLaneFirst(_materialIndex);
    _1040 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1032 < (uint)170000), _1032, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionNoiseTex);
    _1049 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1040 < (uint)65000), _1040, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y)))).x) * 0.20000000298023224f;
    _1052 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _1062 = (pow(_1052.x, 0.012683313339948654f));
    _1063 = (pow(_1052.y, 0.012683313339948654f));
    _1064 = (pow(_1052.z, 0.012683313339948654f));
    _1089 = exp2(log2(max(0.0f, (_1062 + -0.8359375f)) / (18.8515625f - (_1062 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1090 = exp2(log2(max(0.0f, (_1063 + -0.8359375f)) / (18.8515625f - (_1063 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1091 = exp2(log2(max(0.0f, (_1064 + -0.8359375f)) / (18.8515625f - (_1064 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _1092 = WaveReadLaneFirst(_materialIndex);
    _1100 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1092 < (uint)170000), _1092, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionUseDivide);
    _1103 = (_1031 + -0.5f) * 1.5f;
    _1105 = _1049 + (TEXCOORD.x - _1103);
    _1110 = select((_1031 >= 0.8999999761581421f), ((_1031 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (_1100 != 0.0f) {
      _1115 = TEXCOORD.y + 0.44999998807907104f;
      _1116 = TEXCOORD.y + -0.44999998807907104f;
      _1125 = WaveReadLaneFirst(_materialIndex);
      _1133 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1125 < (uint)170000), _1125, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _1142 = WaveReadLaneFirst(_materialIndex);
      _1150 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1142 < (uint)170000), _1142, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _1160 = saturate(((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1150 < (uint)65000), _1150, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _1103) + _1049), _1116)))).x) * select(((_1116 < 0.0f) || (_1116 > 1.0f)), 0.0f, 1.0f)) + ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1133 < (uint)65000), _1133, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1105, _1115)))).x) * select(((_1115 < 0.0f) || (_1115 > 1.0f)), 0.0f, 1.0f)));
      _1163 = ((1.0f - _1160) * _1110) + _1160;
      if (_1029) {
        _1227 = ((_1163 * (_1012 - _1089)) + _1089);
        _1228 = ((_1163 * (_1013 - _1090)) + _1090);
        _1229 = ((_1163 * (_1014 - _1091)) + _1091);
      } else {
        _1227 = ((_1163 * (_1089 - _1012)) + _1012);
        _1228 = ((_1163 * (_1090 - _1013)) + _1013);
        _1229 = ((_1163 * (_1091 - _1014)) + _1014);
      }
    } else {
      _1187 = WaveReadLaneFirst(_materialIndex);
      _1195 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1187 < (uint)170000), _1187, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _1201 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1195 < (uint)65000), _1195, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1105, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      _1205 = ((1.0f - _1201.x) * _1110) + _1201.x;
      if (_1029) {
        _1227 = ((_1205 * (_1012 - _1089)) + _1089);
        _1228 = ((_1205 * (_1013 - _1090)) + _1090);
        _1229 = ((_1205 * (_1014 - _1091)) + _1091);
      } else {
        _1227 = ((_1205 * (_1089 - _1012)) + _1012);
        _1228 = ((_1205 * (_1090 - _1013)) + _1013);
        _1229 = ((_1205 * (_1091 - _1014)) + _1014);
      }
    }
  } else {
    _1227 = _1012;
    _1228 = _1013;
    _1229 = _1014;
  }
  _1230 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1243 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1230, 0)))).x) & 127))) + 0.5f);
  } else {
    _1243 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1227, _1228, _1229));
    _1665 = output_color.x;
    _1666 = output_color.y;
    _1667 = output_color.z;
  } else {
    _1665 = _1227;
    _1666 = _1228;
    _1667 = _1229;
  }
  if (_etcParams.y > 1.0f) {
    _1678 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1679 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1683 = saturate(1.0f - (dot(float2(_1678, _1679), float2(_1678, _1679)) * saturate(_etcParams.y + -1.0f)));
    _1688 = (_1683 * _1665);
    _1689 = (_1683 * _1666);
    _1690 = (_1683 * _1667);
  } else {
    _1688 = _1665;
    _1689 = _1666;
    _1690 = _1667;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1723 = select((_1688 <= 0.0031308000907301903f), (_1688 * 12.920000076293945f), (((pow(_1688, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1724 = select((_1689 <= 0.0031308000907301903f), (_1689 * 12.920000076293945f), (((pow(_1689, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1725 = select((_1690 <= 0.0031308000907301903f), (_1690 * 12.920000076293945f), (((pow(_1690, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1723 = _1688;
    _1724 = _1689;
    _1725 = _1690;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1730 = float((uint)_1230);
    if (!(_1730 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1730 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1739 = _1723;
        _1740 = _1724;
        _1741 = _1725;
      } else {
        _1739 = 0.0f;
        _1740 = 0.0f;
        _1741 = 0.0f;
      }
    } else {
      _1739 = 0.0f;
      _1740 = 0.0f;
      _1741 = 0.0f;
    }
  } else {
    _1739 = _1723;
    _1740 = _1724;
    _1741 = _1725;
  }
  _1751 = exp2(log2(_1739 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1752 = exp2(log2(_1740 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1753 = exp2(log2(_1741 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1751 * 18.6875f) + 1.0f)) * ((_1751 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1752 * 18.6875f) + 1.0f)) * ((_1752 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1753 * 18.6875f) + 1.0f)) * ((_1753 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1243;
  return SV_Target;
}