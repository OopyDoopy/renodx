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
  int _34;
  float _42;
  float _372;
  float _373;
  float _374;
  float _375;
  float _376;
  float _377;
  float _378;
  float _560;
  float _566;
  float _567;
  float _568;
  float _569;
  float _570;
  float _571;
  float _572;
  float _747;
  float _753;
  float _754;
  float _979;
  float _996;
  float _997;
  float _1102;
  float _1170;
  float _1171;
  float _1172;
  float _1209;
  float _1210;
  float _1211;
  float _1225;
  float _1430;
  float _1431;
  float _1432;
  float _1525;
  float _1526;
  float _1527;
  float _1647;
  float _1648;
  float _1649;
  float _1670;
  float _1671;
  float _1672;
  float _1705;
  float _1706;
  float _1707;
  float _1721;
  float _1722;
  float _1723;
  float _47;
  float _50;
  float _52;
  float _53;
  float _89;
  float _90;
  float _91;
  float _92;
  int _93;
  int _101;
  float _104;
  float _107;
  float _109;
  float _139;
  int _143;
  float _151;
  float _152;
  float _153;
  float _154;
  int _155;
  float _163;
  int _164;
  float _172;
  int _173;
  float _181;
  int _182;
  float _190;
  int _193;
  float _201;
  int _206;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  float _221;
  int _222;
  float _230;
  float _239;
  float _240;
  float _241;
  float _242;
  float _243;
  float _244;
  float _245;
  float _255;
  float _285;
  float _286;
  float _290;
  float _300;
  float _301;
  float _302;
  float _314;
  float _320;
  float _321;
  float _322;
  float _330;
  float _331;
  float _332;
  float _344;
  float _350;
  float _351;
  float _358;
  float _359;
  float _367;
  int _381;
  float _389;
  int _394;
  float _404;
  float _405;
  float _406;
  float _407;
  float _408;
  float _409;
  int _410;
  float _418;
  float _427;
  float _428;
  float _429;
  float _430;
  float _431;
  float _432;
  float _433;
  float _443;
  float _473;
  float _474;
  float _478;
  float _488;
  float _489;
  float _490;
  float _502;
  float _508;
  float _509;
  float _510;
  float _518;
  float _519;
  float _520;
  float _532;
  float _538;
  float _539;
  float _546;
  float _547;
  float _555;
  int _575;
  float _583;
  int _584;
  float _594;
  float _595;
  float _596;
  int _597;
  float _605;
  float _614;
  float _615;
  float _616;
  float _618;
  float _619;
  float _620;
  float _630;
  float _660;
  float _661;
  float _665;
  float _675;
  float _676;
  float _677;
  float _689;
  float _695;
  float _696;
  float _697;
  float _705;
  float _706;
  float _707;
  float _719;
  float _725;
  float _726;
  float _733;
  float _734;
  float _742;
  int _755;
  float _763;
  int _770;
  float _778;
  float _779;
  float _780;
  float _781;
  float _782;
  float _783;
  float _784;
  float _785;
  float _786;
  float _790;
  float _797;
  float _798;
  float _799;
  float _808;
  float _815;
  float _816;
  float _817;
  float _845;
  float _846;
  float _851;
  float _861;
  float _862;
  float _863;
  float _875;
  float _881;
  float _882;
  float _883;
  float _887;
  float _888;
  float _889;
  float _890;
  float _902;
  float _903;
  float _906;
  float _910;
  float _911;
  float _912;
  float _924;
  float _930;
  float _931;
  float _951;
  float _952;
  float _953;
  float _954;
  float _955;
  float _959;
  float _966;
  float _967;
  float _974;
  float _980;
  float _981;
  float _982;
  float _989;
  float4 _1000;
  int _1005;
  float _1013;
  int _1053;
  bool _1057;
  int _1065;
  float _1073;
  float _1076;
  int _1077;
  float _1085;
  int _1089;
  float _1097;
  float _1115;
  int _1121;
  float _1129;
  int _1134;
  float _1142;
  float _1144;
  float _1156;
  int _1173;
  float _1181;
  float _1185;
  float _1187;
  float _1188;
  float _1195;
  float _1196;
  float _1197;
  float _1198;
  uint _1212;
  float _1234;
  float _1283;
  float _1284;
  float _1285;
  float _1287;
  float _1294;
  float _1295;
  float _1296;
  float _1315;
  float _1316;
  float _1317;
  float _1318;
  float _1319;
  float _1320;
  float _1321;
  float _1322;
  float _1323;
  float _1369;
  float _1370;
  float _1371;
  float _1372;
  float _1373;
  float _1374;
  float _1375;
  float _1392;
  float _1393;
  float _1394;
  float _1395;
  float _1401;
  float _1404;
  float _1411;
  float _1412;
  float _1413;
  float _1442;
  float _1467;
  float _1468;
  float _1469;
  float _1488;
  float _1489;
  float _1490;
  float _1496;
  float _1500;
  float _1501;
  float _1502;
  float _1503;
  float _1508;
  float _1533;
  float _1537;
  float _1538;
  float _1539;
  float _1540;
  int _1581;
  float _1636;
  float _1660;
  float _1661;
  float _1665;
  float _1712;
  float _21[36];
  _27 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _30 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = WaveReadLaneFirst(_materialIndex);
  _42 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_34 < (uint)170000), _34, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusRatio);
  if (!(_42 < 0.0010000000474974513f)) {
    _47 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _50 = (TEXCOORD.x * 2.0f) + -1.0f;
    _52 = 1.0f - (TEXCOORD.y * 2.0f);
    _53 = max(1.0000000116860974e-07f, _47.x);
    _89 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _53, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _52, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _50))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _90 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _53, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _52, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _50))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _89;
    _91 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _53, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _52, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _50))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _89;
    _92 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _53, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _52, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _50))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _89;
    _93 = WaveReadLaneFirst(_materialIndex);
    _101 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColor);
    _104 = float((uint)((uint)(((uint)(_101) >> 16) & 255)));
    _107 = float((uint)((uint)(((uint)(_101) >> 8) & 255)));
    _109 = float((uint)((uint)(_101 & 255)));
    _139 = max(0.0010000000474974513f, _exposure0.x);
    _143 = WaveReadLaneFirst(_materialIndex);
    _151 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColorBrightness);
    _152 = _151 * (select(((_104 * 0.003921568859368563f) < 0.040449999272823334f), (_104 * 0.0003035269910469651f), exp2(log2((_104 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    _153 = _151 * (select(((_107 * 0.003921568859368563f) < 0.040449999272823334f), (_107 * 0.0003035269910469651f), exp2(log2((_107 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    _154 = _151 * (select(((_109 * 0.003921568859368563f) < 0.040449999272823334f), (_109 * 0.0003035269910469651f), exp2(log2((_109 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _139);
    _155 = WaveReadLaneFirst(_materialIndex);
    _163 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_155 < (uint)170000), _155, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusRadius);
    _164 = WaveReadLaneFirst(_materialIndex);
    _172 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusRadius);
    _173 = WaveReadLaneFirst(_materialIndex);
    _181 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_173 < (uint)170000), _173, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusRadius);
    _182 = WaveReadLaneFirst(_materialIndex);
    _190 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_182 < (uint)170000), _182, 0)) + 0u))].BindlessParameters_PostProcessFocus._focus3DBlend);
    if (!(_163 < 0.0010000000474974513f)) {
      _193 = WaveReadLaneFirst(_materialIndex);
      _201 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusCenterRadius);
      _206 = WaveReadLaneFirst(_materialIndex);
      _216 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.x);
      _217 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.y);
      _218 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPositionOffset.z);
      _219 = _216 + _mainPosition.x;
      _220 = _217 + _mainPosition.y;
      _221 = _218 + _mainPosition.z;
      _222 = WaveReadLaneFirst(_materialIndex);
      _230 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))].BindlessParameters_PostProcessFocus._playerFocusPower);
      _239 = _219 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _240 = _220 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _241 = _221 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _242 = dot(float3(_239, _240, _241), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)));
      _243 = _90 - _219;
      _244 = _91 - _220;
      _245 = _92 - _221;
      _255 = saturate((sqrt(((_244 * _244) + (_243 * _243)) + (_245 * _245)) - _201) / max(0.0010000000474974513f, _163));
      if (_190 < 1.0f) {
        _285 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _241, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _240, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _239))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _286 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _241, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _240, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _239))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _285;
        _290 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _241, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _240, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _239))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _285) * 0.5f);
        _300 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _163) + _239;
        _301 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _163) + _240;
        _302 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _163) + _241;
        _314 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _302, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _301, (_300 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _320 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _302, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _301, (_300 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _314) * 0.5f)) - _290;
        _321 = _27 * 0.5f;
        _322 = _321 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _302, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _301, (_300 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _314) - _286);
        _330 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _201) + _239;
        _331 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _201) + _240;
        _332 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _201) + _241;
        _344 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _332, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _331, (_330 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _350 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _332, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _331, (_330 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _344) * 0.5f)) - _290;
        _351 = _321 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _332, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _331, (_330 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _344) - _286);
        _358 = TEXCOORD.y - _290;
        _359 = ((TEXCOORD.x + -0.5f) - (_286 * 0.5f)) * _27;
        _367 = saturate((sqrt((_358 * _358) + (_359 * _359)) - sqrt((_350 * _350) + (_351 * _351))) / max(0.0010000000474974513f, sqrt((_320 * _320) + (_322 * _322))));
        _372 = (lerp(_367, _255, _190));
        _373 = _201;
        _374 = _230;
        _375 = _219;
        _376 = _220;
        _377 = _221;
        _378 = _242;
      } else {
        _372 = _255;
        _373 = _201;
        _374 = _230;
        _375 = _219;
        _376 = _220;
        _377 = _221;
        _378 = _242;
      }
    } else {
      _372 = 1.0f;
      _373 = 0.0f;
      _374 = 1.0f;
      _375 = 0.0f;
      _376 = 0.0f;
      _377 = 0.0f;
      _378 = 1.0f;
    }
    if (!(_172 < 0.0010000000474974513f)) {
      _381 = WaveReadLaneFirst(_materialIndex);
      _389 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_381 < (uint)170000), _381, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusCenterRadius);
      _394 = WaveReadLaneFirst(_materialIndex);
      _404 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.x);
      _405 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.y);
      _406 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPositionOffset.z);
      _407 = _404 + _targetFocusPosition.x;
      _408 = _405 + _targetFocusPosition.y;
      _409 = _406 + _targetFocusPosition.z;
      _410 = WaveReadLaneFirst(_materialIndex);
      _418 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_410 < (uint)170000), _410, 0)) + 0u))].BindlessParameters_PostProcessFocus._targetFocusPower);
      _427 = _407 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _428 = _408 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _429 = _409 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _430 = dot(float3(_427, _428, _429), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)));
      _431 = _90 - _407;
      _432 = _91 - _408;
      _433 = _92 - _409;
      _443 = saturate((sqrt(((_432 * _432) + (_431 * _431)) + (_433 * _433)) - _389) / max(0.0010000000474974513f, _172));
      if (_190 < 1.0f) {
        _473 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _429, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _428, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _427))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _474 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _429, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _428, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _427))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _473;
        _478 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _429, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _428, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _427))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _473) * 0.5f);
        _488 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _172) + _427;
        _489 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _172) + _428;
        _490 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _172) + _429;
        _502 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _490, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _489, (_488 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _508 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _490, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _489, (_488 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _502) * 0.5f)) - _478;
        _509 = _27 * 0.5f;
        _510 = _509 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _490, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _489, (_488 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _502) - _474);
        _518 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _389) + _427;
        _519 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _389) + _428;
        _520 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _389) + _429;
        _532 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _520, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _519, (_518 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _538 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _520, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _519, (_518 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _532) * 0.5f)) - _478;
        _539 = _509 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _520, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _519, (_518 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _532) - _474);
        _546 = TEXCOORD.y - _478;
        _547 = ((TEXCOORD.x + -0.5f) - (_474 * 0.5f)) * _27;
        _555 = saturate((sqrt((_546 * _546) + (_547 * _547)) - sqrt((_538 * _538) + (_539 * _539))) / max(0.0010000000474974513f, sqrt((_508 * _508) + (_510 * _510))));
        _560 = (lerp(_555, _443, _190));
      } else {
        _560 = _443;
      }
      _566 = ((saturate(_430) * (_560 + -1.0f)) + 1.0f);
      _567 = _389;
      _568 = _418;
      _569 = _407;
      _570 = _408;
      _571 = _409;
      _572 = _430;
    } else {
      _566 = 1.0f;
      _567 = 0.0f;
      _568 = 1.0f;
      _569 = 0.0f;
      _570 = 0.0f;
      _571 = 0.0f;
      _572 = 1.0f;
    }
    if (!(_181 < 0.0010000000474974513f)) {
      _575 = WaveReadLaneFirst(_materialIndex);
      _583 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_575 < (uint)170000), _575, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusCenterRadius);
      _584 = WaveReadLaneFirst(_materialIndex);
      _594 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.x);
      _595 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.y);
      _596 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPosition.z);
      _597 = WaveReadLaneFirst(_materialIndex);
      _605 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_597 < (uint)170000), _597, 0)) + 0u))].BindlessParameters_PostProcessFocus._worldFocusPower);
      _614 = _594 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
      _615 = _595 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
      _616 = _596 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
      _618 = _90 - _594;
      _619 = _91 - _595;
      _620 = _92 - _596;
      _630 = saturate((sqrt(((_619 * _619) + (_618 * _618)) + (_620 * _620)) - _583) / max(0.0010000000474974513f, _181));
      if (_190 < 1.0f) {
        _660 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _616, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _615, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _614))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _661 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _616, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _615, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _614))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _660;
        _665 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _616, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _615, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _614))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _660) * 0.5f);
        _675 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _181) + _614;
        _676 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _181) + _615;
        _677 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _181) + _616;
        _689 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _677, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _676, (_675 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _695 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _677, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _676, (_675 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _689) * 0.5f)) - _665;
        _696 = _27 * 0.5f;
        _697 = _696 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _677, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _676, (_675 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _689) - _661);
        _705 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _583) + _614;
        _706 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _583) + _615;
        _707 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _583) + _616;
        _719 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _707, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _706, (_705 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _725 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _707, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _706, (_705 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _719) * 0.5f)) - _665;
        _726 = _696 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _707, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _706, (_705 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _719) - _661);
        _733 = TEXCOORD.y - _665;
        _734 = ((TEXCOORD.x + -0.5f) - (_661 * 0.5f)) * _27;
        _742 = saturate((sqrt((_733 * _733) + (_734 * _734)) - sqrt((_725 * _725) + (_726 * _726))) / max(0.0010000000474974513f, sqrt((_695 * _695) + (_697 * _697))));
        _747 = (lerp(_742, _630, _190));
      } else {
        _747 = _630;
      }
      _753 = ((saturate(dot(float3(_614, _615, _616), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))) * (_747 + -1.0f)) + 1.0f);
      _754 = _605;
    } else {
      _753 = 1.0f;
      _754 = 1.0f;
    }
    _755 = WaveReadLaneFirst(_materialIndex);
    _763 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_755 < (uint)170000), _755, 0)) + 0u))].BindlessParameters_PostProcessFocus._connectPlayerTargetDistance);
    if ((_172 >= 0.0010000000474974513f) && ((_163 >= 0.0010000000474974513f) && (_763 >= 0.009999999776482582f))) {
      _770 = WaveReadLaneFirst(_materialIndex);
      _778 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_770 < (uint)170000), _770, 0)) + 0u))].BindlessParameters_PostProcessFocus._connectPlayerTargetPower);
      _779 = _373 + _163;
      _780 = _567 + _172;
      _781 = _569 - _375;
      _782 = _570 - _376;
      _783 = _571 - _377;
      _784 = _90 - _375;
      _785 = _91 - _376;
      _786 = _92 - _377;
      _790 = saturate(dot(float3(_781, _782, _783), float3(_784, _785, _786)) / dot(float3(_781, _782, _783), float3(_781, _782, _783)));
      _797 = _784 - (_790 * _781);
      _798 = _785 - (_790 * _782);
      _799 = _786 - (_790 * _783);
      _808 = saturate(sqrt(((_797 * _797) + (_798 * _798)) + (_799 * _799)) / max(0.0010000000474974513f, ((_790 * (_780 - _779)) + _779)));
      if (_190 < 1.0f) {
        _815 = _375 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
        _816 = _376 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
        _817 = _377 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
        _845 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _817, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _816, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _815))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _846 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _817, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _816, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _815))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _845;
        _851 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _817, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _816, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _815))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _845) * 0.5f);
        _861 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _779) + _815;
        _862 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _779) + _816;
        _863 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _779) + _817;
        _875 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _863, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _862, (_861 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _881 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _863, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _862, (_861 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _875) * 0.5f)) - _851;
        _882 = _27 * 0.5f;
        _883 = _882 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _863, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _862, (_861 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _875) - _846);
        _887 = sqrt((_881 * _881) + (_883 * _883));
        _888 = _569 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
        _889 = _570 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
        _890 = _571 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
        _902 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _890, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _889, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _888))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _903 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _890, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _889, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _888))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _902;
        _906 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _890, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _889, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _888))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _902) * 0.5f);
        _910 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _780) + _888;
        _911 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _780) + _889;
        _912 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _780) + _890;
        _924 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _912, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _911, (_910 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
        _930 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _912, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _911, (_910 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _924) * 0.5f)) - _906;
        _931 = _882 * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _912, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _911, (_910 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _924) - _903);
        _951 = float((int)(((int)(uint)((int)(_572 > 0.0f))) - ((int)(uint)((int)(_572 < 0.0f))))) * float((int)(((int)(uint)((int)(_378 > 0.0f))) - ((int)(uint)((int)(_378 < 0.0f)))));
        _952 = ((_903 - _846) * 0.5f) * _951;
        _953 = (_906 - _851) * _951;
        _954 = TEXCOORD.x - ((_846 * 0.5f) + 0.5f);
        _955 = TEXCOORD.y - _851;
        _959 = saturate(dot(float2(_954, _955), float2(_952, _953)) / dot(float2(_952, _953), float2(_952, _953)));
        _966 = _955 - (_959 * _953);
        _967 = (_954 - (_959 * _952)) * _27;
        _974 = saturate(sqrt((_967 * _967) + (_966 * _966)) / max(0.0010000000474974513f, ((_959 * (sqrt((_930 * _930) + (_931 * _931)) - _887)) + _887)));
        _979 = (lerp(_974, _808, _190));
      } else {
        _979 = _808;
      }
      _980 = _375 - _569;
      _981 = _376 - _570;
      _982 = _377 - _571;
      _989 = _763 * 0.5f;
      _996 = ((1.0f - saturate((sqrt(((_981 * _981) + (_980 * _980)) + (_982 * _982)) - _989) / _989)) * _979);
      _997 = _778;
    } else {
      _996 = 1.0f;
      _997 = 1.0f;
    }
    _1000 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _1005 = WaveReadLaneFirst(_materialIndex);
    _1013 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1005 < (uint)170000), _1005, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskBlurPower);
    _1053 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127;
    _1057 = (_1053 != 57) && ((uint)(_1053 + -53) > (uint)14);
    _1065 = WaveReadLaneFirst(_materialIndex);
    _1073 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1065 < (uint)170000), _1065, 0)) + 0u))].BindlessParameters_PostProcessFocus._maskRatio);
    _1076 = (_1073 * (saturate(((1.0f - saturate(_1000.y)) + exp2(log2(1.0f - saturate(_1000.x)) * _1013)) + float((bool)((uint)(((1.0f - saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x)))))) != 0.0f) && _1057)))) + -1.0f)) + 1.0f;
    _1077 = WaveReadLaneFirst(_materialIndex);
    _1085 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1077 < (uint)170000), _1077, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusCharacterMaterialMask);
    if (!(_1085 < 0.0010000000474974513f)) {
      _1089 = WaveReadLaneFirst(_materialIndex);
      _1097 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1089 < (uint)170000), _1089, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusCharacterMaterialMask);
      _1102 = ((_1097 * (float((bool)_1057) - _1076)) + _1076);
    } else {
      _1102 = _1076;
    }
    _1115 = _1102 * _1102;
    _1121 = WaveReadLaneFirst(_materialIndex);
    _1129 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1121 < (uint)170000), _1121, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusSceneDepthFade);
    _1134 = WaveReadLaneFirst(_materialIndex);
    _1142 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1134 < (uint)170000), _1134, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusColorRemap);
    _1144 = min(max(_1142, -1.0f), 1.0f);
    if (_1144 != 0.0f) {
      if ((_154 != 0.0f) || ((_152 != 0.0f) || (_153 != 0.0f))) {
        _1156 = dot(float3(_30.x, _30.y, _30.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f)) * rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
        _1170 = ((((_1156 * _152) - _30.x) * _1144) + _30.x);
        _1171 = ((((_1156 * _153) - _30.y) * _1144) + _30.y);
        _1172 = ((((_1156 * _154) - _30.z) * _1144) + _30.z);
      } else {
        _1170 = _30.x;
        _1171 = _30.y;
        _1172 = _30.z;
      }
    } else {
      _1170 = _30.x;
      _1171 = _30.y;
      _1172 = _30.z;
    }
    _1173 = WaveReadLaneFirst(_materialIndex);
    _1181 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_1173 < (uint)170000), _1173, 0)) + 0u))].BindlessParameters_PostProcessFocus._focusBackgroundSaturation);
    _1185 = (((((_1115 * _1115) * (pow(_372, _374))) * (pow(_566, _568))) * (pow(_996, _997))) * (pow(_753, _754))) * exp2(log2(1.0f - _47.x) * _1129);
    _1187 = (_1185 * 0.5f) * (1.0f - min(max(_1181, -1.0f), 1.0f));
    _1188 = dot(float3(_1170, _1171, _1172), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _1195 = (_1187 * (_1188 - _1170)) + _1170;
    _1196 = (_1187 * (_1188 - _1171)) + _1171;
    _1197 = (_1187 * (_1188 - _1172)) + _1172;
    _1198 = _1185 * _42;
    _1209 = (lerp(_1195, _152, _1198));
    _1210 = (lerp(_1196, _153, _1198));
    _1211 = (lerp(_1197, _154, _1198));
  } else {
    _1209 = _30.x;
    _1210 = _30.y;
    _1211 = _30.z;
  }
  _1212 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1225 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1212, 0)))).x) & 127))) + 0.5f);
  } else {
    _1225 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1209, _1210, _1211));
    _1647 = output_color.x;
    _1648 = output_color.y;
    _1649 = output_color.z;
  } else {
    _1647 = _1209;
    _1648 = _1210;
    _1649 = _1211;
  }
  if (_etcParams.y > 1.0f) {
    _1660 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1661 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1665 = saturate(1.0f - (dot(float2(_1660, _1661), float2(_1660, _1661)) * saturate(_etcParams.y + -1.0f)));
    _1670 = (_1665 * _1647);
    _1671 = (_1665 * _1648);
    _1672 = (_1665 * _1649);
  } else {
    _1670 = _1647;
    _1671 = _1648;
    _1672 = _1649;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1705 = select((_1670 <= 0.0031308000907301903f), (_1670 * 12.920000076293945f), (((pow(_1670, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1706 = select((_1671 <= 0.0031308000907301903f), (_1671 * 12.920000076293945f), (((pow(_1671, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1707 = select((_1672 <= 0.0031308000907301903f), (_1672 * 12.920000076293945f), (((pow(_1672, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1705 = _1670;
    _1706 = _1671;
    _1707 = _1672;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1712 = float((uint)_1212);
    if (!(_1712 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1712 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1721 = _1705;
        _1722 = _1706;
        _1723 = _1707;
      } else {
        _1721 = 0.0f;
        _1722 = 0.0f;
        _1723 = 0.0f;
      }
    } else {
      _1721 = 0.0f;
      _1722 = 0.0f;
      _1723 = 0.0f;
    }
  } else {
    _1721 = _1705;
    _1722 = _1706;
    _1723 = _1707;
  }
  SV_Target.x = _1721;
  SV_Target.y = _1722;
  SV_Target.z = _1723;
  SV_Target.w = _1225;
  return SV_Target;
}