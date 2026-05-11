#include "../tonemap.hlsli"

struct PostProcessFocusStruct {
  float _focusRatio;
  float _focusSceneDepthFade;
  float _focusBackgroundSaturation;
  float _focus3DBlend;
  float _focusCharacterMaterialMask;
  float _focusColorBrightness;
  uint _focusColor;
  float _focusColorRemap;
  float _maskRatio;
  float _maskNoiseIntensity;
  float _maskBlurThickness;
  float _maskBlurPower;
  uint _maskNoiseTexture;
  float _playerFocusRadius;
  float _playerFocusCenterRadius;
  float _playerFocusPower;
  float3 _playerFocusPositionOffset;
  float _targetFocusRadius;
  float _targetFocusCenterRadius;
  float _targetFocusPower;
  float3 _targetFocusPositionOffset;
  float _connectPlayerTargetDistance;
  float _connectPlayerTargetPower;
  float _worldFocusRadius;
  float _worldFocusCenterRadius;
  float _worldFocusPower;
  float3 _worldFocusPosition;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessFocus {
  PostProcessFocusStruct BindlessParameters_PostProcessFocus;
};

typedef BindlessParameters_PostProcessFocus BindlessParameters_PostProcessFocus_t;
ConstantBuffer<BindlessParameters_PostProcessFocus_t> BindlessParameters_PostProcessFocus[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _27;
  float4 _30;
  float _40;
  float _41;
  float _42;
  float _67;
  float _68;
  float _69;
  int _70;
  float _78;
  float _408;
  float _409;
  float _410;
  float _411;
  float _412;
  float _413;
  float _414;
  float _596;
  float _602;
  float _603;
  float _604;
  float _605;
  float _606;
  float _607;
  float _608;
  float _783;
  float _789;
  float _790;
  float _1015;
  float _1032;
  float _1033;
  float _1162;
  float _1230;
  float _1231;
  float _1232;
  float _1269;
  float _1270;
  float _1271;
  float _1285;
  float _1490;
  float _1491;
  float _1492;
  float _1585;
  float _1586;
  float _1587;
  float _1707;
  float _1708;
  float _1709;
  float _1730;
  float _1731;
  float _1732;
  float _1765;
  float _1766;
  float _1767;
  float _1781;
  float _1782;
  float _1783;
  float _83;
  float _86;
  float _88;
  float _89;
  float _125;
  float _126;
  float _127;
  float _128;
  int _129;
  int _137;
  float _140;
  float _143;
  float _145;
  float _175;
  int _179;
  float _187;
  float _188;
  float _189;
  float _190;
  int _191;
  float _199;
  int _200;
  float _208;
  int _209;
  float _217;
  int _218;
  float _226;
  int _229;
  float _237;
  int _242;
  float _252;
  float _253;
  float _254;
  float _255;
  float _256;
  float _257;
  int _258;
  float _266;
  float _275;
  float _276;
  float _277;
  float _278;
  float _279;
  float _280;
  float _281;
  float _291;
  float _321;
  float _322;
  float _326;
  float _336;
  float _337;
  float _338;
  float _350;
  float _356;
  float _357;
  float _358;
  float _366;
  float _367;
  float _368;
  float _380;
  float _386;
  float _387;
  float _394;
  float _395;
  float _403;
  int _417;
  float _425;
  int _430;
  float _440;
  float _441;
  float _442;
  float _443;
  float _444;
  float _445;
  int _446;
  float _454;
  float _463;
  float _464;
  float _465;
  float _466;
  float _467;
  float _468;
  float _469;
  float _479;
  float _509;
  float _510;
  float _514;
  float _524;
  float _525;
  float _526;
  float _538;
  float _544;
  float _545;
  float _546;
  float _554;
  float _555;
  float _556;
  float _568;
  float _574;
  float _575;
  float _582;
  float _583;
  float _591;
  int _611;
  float _619;
  int _620;
  float _630;
  float _631;
  float _632;
  int _633;
  float _641;
  float _650;
  float _651;
  float _652;
  float _654;
  float _655;
  float _656;
  float _666;
  float _696;
  float _697;
  float _701;
  float _711;
  float _712;
  float _713;
  float _725;
  float _731;
  float _732;
  float _733;
  float _741;
  float _742;
  float _743;
  float _755;
  float _761;
  float _762;
  float _769;
  float _770;
  float _778;
  int _791;
  float _799;
  int _806;
  float _814;
  float _815;
  float _816;
  float _817;
  float _818;
  float _819;
  float _820;
  float _821;
  float _822;
  float _826;
  float _833;
  float _834;
  float _835;
  float _844;
  float _851;
  float _852;
  float _853;
  float _881;
  float _882;
  float _887;
  float _897;
  float _898;
  float _899;
  float _911;
  float _917;
  float _918;
  float _919;
  float _923;
  float _924;
  float _925;
  float _926;
  float _938;
  float _939;
  float _942;
  float _946;
  float _947;
  float _948;
  float _960;
  float _966;
  float _967;
  float _987;
  float _988;
  float _989;
  float _990;
  float _991;
  float _995;
  float _1002;
  float _1003;
  float _1010;
  float _1016;
  float _1017;
  float _1018;
  float _1025;
  float4 _1036;
  float _1043;
  float _1044;
  int _1065;
  float _1073;
  int _1113;
  bool _1117;
  int _1125;
  float _1133;
  float _1136;
  int _1137;
  float _1145;
  int _1149;
  float _1157;
  float _1175;
  int _1181;
  float _1189;
  int _1194;
  float _1202;
  float _1204;
  float _1216;
  int _1233;
  float _1241;
  float _1245;
  float _1247;
  float _1248;
  float _1255;
  float _1256;
  float _1257;
  float _1258;
  uint _1272;
  float _1294;
  float _1343;
  float _1344;
  float _1345;
  float _1347;
  float _1354;
  float _1355;
  float _1356;
  float _1375;
  float _1376;
  float _1377;
  float _1378;
  float _1379;
  float _1380;
  float _1381;
  float _1382;
  float _1383;
  float _1429;
  float _1430;
  float _1431;
  float _1432;
  float _1433;
  float _1434;
  float _1435;
  float _1452;
  float _1453;
  float _1454;
  float _1455;
  float _1461;
  float _1464;
  float _1471;
  float _1472;
  float _1473;
  float _1502;
  float _1527;
  float _1528;
  float _1529;
  float _1548;
  float _1549;
  float _1550;
  float _1556;
  float _1560;
  float _1561;
  float _1562;
  float _1563;
  float _1568;
  float _1593;
  float _1597;
  float _1598;
  float _1599;
  float _1600;
  int _1641;
  float _1696;
  float _1720;
  float _1721;
  float _1725;
  float _1772;
  float _1793;
  float _1794;
  float _1795;
  float _21[36];
  _27 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _30 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _40 = (pow(_30.x, 0.012683313339948654f));
  _41 = (pow(_30.y, 0.012683313339948654f));
  _42 = (pow(_30.z, 0.012683313339948654f));
  _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _70 = WaveReadLaneFirst(_materialIndex);
  _78 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_70 < (uint)170000), _70, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusRatio);
  if (!(_78 < 0.0010000000474974513f)) {
    _83 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _86 = (TEXCOORD.x * 2.0f) + -1.0f;
    _88 = 1.0f - (TEXCOORD.y * 2.0f);
    _89 = max(1.0000000116860974e-07f, _83.x);
    _125 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _89, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _88, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _86))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _126 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _89, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _88, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _86))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _125;
    _127 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _89, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _88, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _86))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _125;
    _128 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _89, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _88, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _86))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _125;
    _129 = WaveReadLaneFirst(_materialIndex);
    _137 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColor);
    _140 = float((uint)((uint)(((uint)(_137) >> 16) & 255)));
    _143 = float((uint)((uint)(((uint)(_137) >> 8) & 255)));
    _145 = float((uint)((uint)(_137 & 255)));
    _175 = max(0.0010000000474974513f, _exposure0.x);
    _179 = WaveReadLaneFirst(_materialIndex);
    _187 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColorBrightness);
    _188 = _187 * (select(((_140 * 0.003921568859368563f) < 0.040449999272823334f), (_140 * 0.0003035269910469651f), exp2(log2((_140 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    _189 = _187 * (select(((_143 * 0.003921568859368563f) < 0.040449999272823334f), (_143 * 0.0003035269910469651f), exp2(log2((_143 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    _190 = _187 * (select(((_145 * 0.003921568859368563f) < 0.040449999272823334f), (_145 * 0.0003035269910469651f), exp2(log2((_145 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _175);
    _191 = WaveReadLaneFirst(_materialIndex);
    _199 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_191 < (uint)170000), _191, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusRadius);
    _200 = WaveReadLaneFirst(_materialIndex);
    _208 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_200 < (uint)170000), _200, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusRadius);
    _209 = WaveReadLaneFirst(_materialIndex);
    _217 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_209 < (uint)170000), _209, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusRadius);
    _218 = WaveReadLaneFirst(_materialIndex);
    _226 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))].BindlessParameters_PostProcessFocus._focus3DBlend);
    if (!(_199 < 0.0010000000474974513f)) {
      _229 = WaveReadLaneFirst(_materialIndex);
      _237 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_229 < (uint)170000), _229, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusCenterRadius);
      _242 = WaveReadLaneFirst(_materialIndex);
      _252 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.x);
      _253 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.y);
      _254 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.z);
      _255 = _252 + _mainPosition.x;
      _256 = _253 + _mainPosition.y;
      _257 = _254 + _mainPosition.z;
      _258 = WaveReadLaneFirst(_materialIndex);
      _266 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPower);
      _275 = _255 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _276 = _256 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _277 = _257 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _278 = dot(float3(_275, _276, _277), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)));
      _279 = _126 - _255;
      _280 = _127 - _256;
      _281 = _128 - _257;
      _291 = saturate((sqrt(((_280 * _280) + (_279 * _279)) + (_281 * _281)) - _237) / max(0.0010000000474974513f, _199));
      if (_226 < 1.0f) {
        _321 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _277, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _276, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _275))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _322 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _277, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _276, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _275))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _321;
        _326 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _277, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _276, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _275))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _321) * 0.5f);
        _336 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _199) + _275;
        _337 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _199) + _276;
        _338 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _199) + _277;
        _350 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _338, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _337, (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _356 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _338, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _337, (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _350) * 0.5f)) - _326;
        _357 = _27 * 0.5f;
        _358 = _357 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _338, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _337, (_336 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _350) - _322);
        _366 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _237) + _275;
        _367 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _237) + _276;
        _368 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _237) + _277;
        _380 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _368, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _367, (_366 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _386 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _368, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _367, (_366 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _380) * 0.5f)) - _326;
        _387 = _357 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _368, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _367, (_366 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _380) - _322);
        _394 = TEXCOORD.y - _326;
        _395 = ((TEXCOORD.x + -0.5f) - (_322 * 0.5f)) * _27;
        _403 = saturate((sqrt((_394 * _394) + (_395 * _395)) - sqrt((_386 * _386) + (_387 * _387))) / max(0.0010000000474974513f, sqrt((_356 * _356) + (_358 * _358))));
        _408 = (lerp(_403, _291, _226));
        _409 = _237;
        _410 = _266;
        _411 = _255;
        _412 = _256;
        _413 = _257;
        _414 = _278;
      } else {
        _408 = _291;
        _409 = _237;
        _410 = _266;
        _411 = _255;
        _412 = _256;
        _413 = _257;
        _414 = _278;
      }
    } else {
      _408 = 1.0f;
      _409 = 0.0f;
      _410 = 1.0f;
      _411 = 0.0f;
      _412 = 0.0f;
      _413 = 0.0f;
      _414 = 1.0f;
    }
    if (!(_208 < 0.0010000000474974513f)) {
      _417 = WaveReadLaneFirst(_materialIndex);
      _425 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_417 < (uint)170000), _417, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusCenterRadius);
      _430 = WaveReadLaneFirst(_materialIndex);
      _440 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.x);
      _441 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.y);
      _442 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.z);
      _443 = _440 + _targetFocusPosition.x;
      _444 = _441 + _targetFocusPosition.y;
      _445 = _442 + _targetFocusPosition.z;
      _446 = WaveReadLaneFirst(_materialIndex);
      _454 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_446 < (uint)170000), _446, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPower);
      _463 = _443 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _464 = _444 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _465 = _445 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _466 = dot(float3(_463, _464, _465), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)));
      _467 = _126 - _443;
      _468 = _127 - _444;
      _469 = _128 - _445;
      _479 = saturate((sqrt(((_468 * _468) + (_467 * _467)) + (_469 * _469)) - _425) / max(0.0010000000474974513f, _208));
      if (_226 < 1.0f) {
        _509 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _465, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _464, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _463))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _510 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _465, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _464, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _463))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _509;
        _514 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _465, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _464, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _463))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _509) * 0.5f);
        _524 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _208) + _463;
        _525 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _208) + _464;
        _526 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _208) + _465;
        _538 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _526, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _525, (_524 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _544 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _526, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _525, (_524 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _538) * 0.5f)) - _514;
        _545 = _27 * 0.5f;
        _546 = _545 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _526, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _525, (_524 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _538) - _510);
        _554 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _425) + _463;
        _555 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _425) + _464;
        _556 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _425) + _465;
        _568 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _556, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _555, (_554 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _574 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _556, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _555, (_554 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _568) * 0.5f)) - _514;
        _575 = _545 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _556, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _555, (_554 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _568) - _510);
        _582 = TEXCOORD.y - _514;
        _583 = ((TEXCOORD.x + -0.5f) - (_510 * 0.5f)) * _27;
        _591 = saturate((sqrt((_582 * _582) + (_583 * _583)) - sqrt((_574 * _574) + (_575 * _575))) / max(0.0010000000474974513f, sqrt((_544 * _544) + (_546 * _546))));
        _596 = (lerp(_591, _479, _226));
      } else {
        _596 = _479;
      }
      _602 = ((saturate(_466) * (_596 + -1.0f)) + 1.0f);
      _603 = _425;
      _604 = _454;
      _605 = _443;
      _606 = _444;
      _607 = _445;
      _608 = _466;
    } else {
      _602 = 1.0f;
      _603 = 0.0f;
      _604 = 1.0f;
      _605 = 0.0f;
      _606 = 0.0f;
      _607 = 0.0f;
      _608 = 1.0f;
    }
    if (!(_217 < 0.0010000000474974513f)) {
      _611 = WaveReadLaneFirst(_materialIndex);
      _619 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_611 < (uint)170000), _611, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusCenterRadius);
      _620 = WaveReadLaneFirst(_materialIndex);
      _630 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.x);
      _631 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.y);
      _632 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.z);
      _633 = WaveReadLaneFirst(_materialIndex);
      _641 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_633 < (uint)170000), _633, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPower);
      _650 = _630 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _651 = _631 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _652 = _632 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _654 = _126 - _630;
      _655 = _127 - _631;
      _656 = _128 - _632;
      _666 = saturate((sqrt(((_655 * _655) + (_654 * _654)) + (_656 * _656)) - _619) / max(0.0010000000474974513f, _217));
      if (_226 < 1.0f) {
        _696 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _652, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _651, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _650))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _697 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _652, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _651, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _650))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _696;
        _701 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _652, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _651, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _650))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _696) * 0.5f);
        _711 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _217) + _650;
        _712 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _217) + _651;
        _713 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _217) + _652;
        _725 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _713, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _712, (_711 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _731 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _713, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _712, (_711 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _725) * 0.5f)) - _701;
        _732 = _27 * 0.5f;
        _733 = _732 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _713, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _712, (_711 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _725) - _697);
        _741 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _619) + _650;
        _742 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _619) + _651;
        _743 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _619) + _652;
        _755 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _743, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _742, (_741 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _761 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _743, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _742, (_741 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _755) * 0.5f)) - _701;
        _762 = _732 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _743, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _742, (_741 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _755) - _697);
        _769 = TEXCOORD.y - _701;
        _770 = ((TEXCOORD.x + -0.5f) - (_697 * 0.5f)) * _27;
        _778 = saturate((sqrt((_769 * _769) + (_770 * _770)) - sqrt((_761 * _761) + (_762 * _762))) / max(0.0010000000474974513f, sqrt((_731 * _731) + (_733 * _733))));
        _783 = (lerp(_778, _666, _226));
      } else {
        _783 = _666;
      }
      _789 = ((saturate(dot(float3(_650, _651, _652), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))) * (_783 + -1.0f)) + 1.0f);
      _790 = _641;
    } else {
      _789 = 1.0f;
      _790 = 1.0f;
    }
    _791 = WaveReadLaneFirst(_materialIndex);
    _799 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_791 < (uint)170000), _791, 0)) + 0u))].BindlessParameters_PostProcessFocus._connectPlayerTargetDistance);
    if ((_208 >= 0.0010000000474974513f) && ((_199 >= 0.0010000000474974513f) && (_799 >= 0.009999999776482582f))) {
      _806 = WaveReadLaneFirst(_materialIndex);
      _814 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_806 < (uint)170000), _806, 0)) + 0u))].BindlessParameters_PostProcessFocus._connectPlayerTargetPower);
      _815 = _409 + _199;
      _816 = _603 + _208;
      _817 = _605 - _411;
      _818 = _606 - _412;
      _819 = _607 - _413;
      _820 = _126 - _411;
      _821 = _127 - _412;
      _822 = _128 - _413;
      _826 = saturate(dot(float3(_817, _818, _819), float3(_820, _821, _822)) / dot(float3(_817, _818, _819), float3(_817, _818, _819)));
      _833 = _820 - (_826 * _817);
      _834 = _821 - (_826 * _818);
      _835 = _822 - (_826 * _819);
      _844 = saturate(sqrt(((_833 * _833) + (_834 * _834)) + (_835 * _835)) / max(0.0010000000474974513f, ((_826 * (_816 - _815)) + _815)));
      if (_226 < 1.0f) {
        _851 = _411 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
        _852 = _412 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
        _853 = _413 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
        _881 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _853, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _852, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _851))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _882 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _853, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _852, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _851))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _881;
        _887 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _853, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _852, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _851))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _881) * 0.5f);
        _897 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _815) + _851;
        _898 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _815) + _852;
        _899 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _815) + _853;
        _911 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _899, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _898, (_897 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _917 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _899, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _898, (_897 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _911) * 0.5f)) - _887;
        _918 = _27 * 0.5f;
        _919 = _918 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _899, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _898, (_897 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _911) - _882);
        _923 = sqrt((_917 * _917) + (_919 * _919));
        _924 = _605 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
        _925 = _606 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
        _926 = _607 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
        _938 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _926, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _925, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _924))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _939 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _926, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _925, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _924))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _938;
        _942 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _926, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _925, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _924))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _938) * 0.5f);
        _946 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _816) + _924;
        _947 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _816) + _925;
        _948 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _816) + _926;
        _960 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _948, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _947, (_946 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _966 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _948, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _947, (_946 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _960) * 0.5f)) - _942;
        _967 = _918 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _948, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _947, (_946 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _960) - _939);
        _987 = float((int)(((int)(uint)((int)(_608 > 0.0f))) - ((int)(uint)((int)(_608 < 0.0f))))) * float((int)(((int)(uint)((int)(_414 > 0.0f))) - ((int)(uint)((int)(_414 < 0.0f)))));
        _988 = ((_939 - _882) * 0.5f) * _987;
        _989 = (_942 - _887) * _987;
        _990 = TEXCOORD.x - ((_882 * 0.5f) + 0.5f);
        _991 = TEXCOORD.y - _887;
        _995 = saturate(dot(float2(_990, _991), float2(_988, _989)) / dot(float2(_988, _989), float2(_988, _989)));
        _1002 = _991 - (_995 * _989);
        _1003 = (_990 - (_995 * _988)) * _27;
        _1010 = saturate(sqrt((_1003 * _1003) + (_1002 * _1002)) / max(0.0010000000474974513f, ((_995 * (sqrt((_966 * _966) + (_967 * _967)) - _923)) + _923)));
        _1015 = (lerp(_1010, _844, _226));
      } else {
        _1015 = _844;
      }
      _1016 = _411 - _605;
      _1017 = _412 - _606;
      _1018 = _413 - _607;
      _1025 = _799 * 0.5f;
      _1032 = ((1.0f - saturate((sqrt(((_1017 * _1017) + (_1016 * _1016)) + (_1018 * _1018)) - _1025) / _1025)) * _1015);
      _1033 = _814;
    } else {
      _1032 = 1.0f;
      _1033 = 1.0f;
    }
    _1036 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _1043 = (pow(_1036.x, 0.012683313339948654f));
    _1044 = (pow(_1036.y, 0.012683313339948654f));
    _1065 = WaveReadLaneFirst(_materialIndex);
    _1073 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1065 < (uint)170000), _1065, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskBlurPower);
    _1113 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127;
    _1117 = (_1113 != 57) && ((uint)(_1113 + -53) > (uint)14);
    _1125 = WaveReadLaneFirst(_materialIndex);
    _1133 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1125 < (uint)170000), _1125, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskRatio);
    _1136 = (_1133 * (saturate(((1.0f - saturate(exp2(log2(max(0.0f, (_1044 + -0.8359375f)) / (18.8515625f - (_1044 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) + exp2(log2(1.0f - saturate(exp2(log2(max(0.0f, (_1043 + -0.8359375f)) / (18.8515625f - (_1043 * 18.6875f))) * 6.277394771575928f) * 10000.0f)) * _1073)) + float((bool)((uint)(((1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x)))))) != 0.0f) && _1117)))) + -1.0f)) + 1.0f;
    _1137 = WaveReadLaneFirst(_materialIndex);
    _1145 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1137 < (uint)170000), _1137, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusCharacterMaterialMask);
    if (!(_1145 < 0.0010000000474974513f)) {
      _1149 = WaveReadLaneFirst(_materialIndex);
      _1157 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1149 < (uint)170000), _1149, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusCharacterMaterialMask);
      _1162 = ((_1157 * (float((bool)_1117) - _1136)) + _1136);
    } else {
      _1162 = _1136;
    }
    _1175 = _1162 * _1162;
    _1181 = WaveReadLaneFirst(_materialIndex);
    _1189 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1181 < (uint)170000), _1181, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusSceneDepthFade);
    _1194 = WaveReadLaneFirst(_materialIndex);
    _1202 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1194 < (uint)170000), _1194, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColorRemap);
    _1204 = min(max(_1202, -1.0f), 1.0f);
    if (_1204 != 0.0f) {
      if ((_190 != 0.0f) || ((_188 != 0.0f) || (_189 != 0.0f))) {
        _1216 = dot(float3(_67, _68, _69), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_188, _189, _190), float3(_188, _189, _190)));
        _1230 = ((((_1216 * _188) - _67) * _1204) + _67);
        _1231 = ((((_1216 * _189) - _68) * _1204) + _68);
        _1232 = ((((_1216 * _190) - _69) * _1204) + _69);
      } else {
        _1230 = _67;
        _1231 = _68;
        _1232 = _69;
      }
    } else {
      _1230 = _67;
      _1231 = _68;
      _1232 = _69;
    }
    _1233 = WaveReadLaneFirst(_materialIndex);
    _1241 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1233 < (uint)170000), _1233, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusBackgroundSaturation);
    _1245 = (((((_1175 * _1175) * (pow(_408, _410))) * (pow(_602, _604))) * (pow(_1032, _1033))) * (pow(_789, _790))) * exp2(log2(1.0f - _83.x) * _1189);
    _1247 = (_1245 * 0.5f) * (1.0f - min(max(_1241, -1.0f), 1.0f));
    _1248 = dot(float3(_1230, _1231, _1232), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _1255 = (_1247 * (_1248 - _1230)) + _1230;
    _1256 = (_1247 * (_1248 - _1231)) + _1231;
    _1257 = (_1247 * (_1248 - _1232)) + _1232;
    _1258 = _1245 * _78;
    _1269 = (lerp(_1255, _188, _1258));
    _1270 = (lerp(_1256, _189, _1258));
    _1271 = (lerp(_1257, _190, _1258));
  } else {
    _1269 = _67;
    _1270 = _68;
    _1271 = _69;
  }
  _1272 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1285 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1272, 0)))).x) & 127))) + 0.5f);
  } else {
    _1285 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1269, _1270, _1271));
    _1707 = output_color.x;
    _1708 = output_color.y;
    _1709 = output_color.z;
  } else {
    _1707 = _1269;
    _1708 = _1270;
    _1709 = _1271;
  }
  if (_etcParams.y > 1.0f) {
    _1720 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1721 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1725 = saturate(1.0f - (dot(float2(_1720, _1721), float2(_1720, _1721)) * saturate(_etcParams.y + -1.0f)));
    _1730 = (_1725 * _1707);
    _1731 = (_1725 * _1708);
    _1732 = (_1725 * _1709);
  } else {
    _1730 = _1707;
    _1731 = _1708;
    _1732 = _1709;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1765 = select((_1730 <= 0.0031308000907301903f), (_1730 * 12.920000076293945f), (((pow(_1730, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1766 = select((_1731 <= 0.0031308000907301903f), (_1731 * 12.920000076293945f), (((pow(_1731, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1767 = select((_1732 <= 0.0031308000907301903f), (_1732 * 12.920000076293945f), (((pow(_1732, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1765 = _1730;
    _1766 = _1731;
    _1767 = _1732;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1772 = float((uint)_1272);
    if (!(_1772 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1772 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1781 = _1765;
        _1782 = _1766;
        _1783 = _1767;
      } else {
        _1781 = 0.0f;
        _1782 = 0.0f;
        _1783 = 0.0f;
      }
    } else {
      _1781 = 0.0f;
      _1782 = 0.0f;
      _1783 = 0.0f;
    }
  } else {
    _1781 = _1765;
    _1782 = _1766;
    _1783 = _1767;
  }
  _1793 = exp2(log2(_1781 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1794 = exp2(log2(_1782 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1795 = exp2(log2(_1783 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1793 * 18.6875f) + 1.0f)) * ((_1793 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1794 * 18.6875f) + 1.0f)) * ((_1794 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1795 * 18.6875f) + 1.0f)) * ((_1795 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1285;
  return SV_Target;
}