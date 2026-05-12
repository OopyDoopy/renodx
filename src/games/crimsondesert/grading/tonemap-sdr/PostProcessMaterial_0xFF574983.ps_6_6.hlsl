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
  float _464;
  float _465;
  float _466;
  float _467;
  float _468;
  float _469;
  float _470;
  bool _515;
  float _574;
  float _589;
  float _590;
  float _591;
  float _713;
  float _714;
  float _715;
  float _809;
  float _810;
  float _811;
  float _904;
  float _905;
  float _906;
  float _1083;
  float _1084;
  float _1085;
  float _1099;
  float _1304;
  float _1305;
  float _1306;
  float _1399;
  float _1400;
  float _1401;
  float _1521;
  float _1522;
  float _1523;
  float _1544;
  float _1545;
  float _1546;
  float _1579;
  float _1580;
  float _1581;
  float _1595;
  float _1596;
  float _1597;
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
  uint _194;
  uint _195;
  uint4 _197;
  float4 _200;
  float _218;
  float _219;
  float _220;
  float _222;
  float _223;
  float _224;
  float _225;
  float _228;
  float _229;
  float _232;
  float _233;
  float _237;
  float _239;
  float _240;
  float _241;
  float _242;
  float _244;
  float _247;
  float _248;
  float _249;
  float _250;
  float _259;
  float _263;
  float _267;
  float _269;
  float4 _276;
  uint _289;
  uint _290;
  uint4 _292;
  float4 _295;
  float _313;
  float _314;
  float _315;
  float _317;
  float _318;
  float _319;
  float _320;
  float _323;
  float _324;
  float _327;
  float _328;
  float _332;
  float _334;
  float _335;
  float _336;
  float _337;
  float _339;
  float _342;
  float _343;
  float _344;
  float _345;
  float _354;
  float _358;
  float _362;
  float _364;
  float4 _371;
  uint _384;
  uint _385;
  uint4 _387;
  float4 _390;
  float _408;
  float _409;
  float _410;
  float _412;
  float _413;
  float _414;
  float _415;
  float _418;
  float _419;
  float _422;
  float _423;
  float _427;
  float _429;
  float _430;
  float _431;
  float _432;
  float _434;
  float _437;
  float _438;
  float _439;
  float _440;
  float _449;
  float _453;
  float _457;
  float _459;
  uint2 _472;
  int _489;
  bool _492;
  int _493;
  float _501;
  float _517;
  int _518;
  float _526;
  float _529;
  int _530;
  float _538;
  float _539;
  float _554;
  int _560;
  float _568;
  float _578;
  int _592;
  float _600;
  int _601;
  float _609;
  int _610;
  float _618;
  float _621;
  float _622;
  int _627;
  float _635;
  int _641;
  float _649;
  int _655;
  int _663;
  float _666;
  float _669;
  float _671;
  float _701;
  float _705;
  float _718;
  float _719;
  int _724;
  float _732;
  int _737;
  float _745;
  int _751;
  int _759;
  float _762;
  float _765;
  float _767;
  float _797;
  float _801;
  float _814;
  float _815;
  int _820;
  float _828;
  int _832;
  float _840;
  int _846;
  int _854;
  float _857;
  float _860;
  float _862;
  float _892;
  float _896;
  int _907;
  float _915;
  float _920;
  bool _921;
  float _923;
  int _924;
  int _932;
  float _941;
  float4 _944;
  int _948;
  float _956;
  float _959;
  float _961;
  float _966;
  float _971;
  float _972;
  int _981;
  int _989;
  int _998;
  int _1006;
  float _1016;
  float _1019;
  int _1043;
  int _1051;
  float4 _1057;
  float _1061;
  uint _1086;
  float _1108;
  float _1157;
  float _1158;
  float _1159;
  float _1161;
  float _1168;
  float _1169;
  float _1170;
  float _1189;
  float _1190;
  float _1191;
  float _1192;
  float _1193;
  float _1194;
  float _1195;
  float _1196;
  float _1197;
  float _1243;
  float _1244;
  float _1245;
  float _1246;
  float _1247;
  float _1248;
  float _1249;
  float _1266;
  float _1267;
  float _1268;
  float _1269;
  float _1275;
  float _1278;
  float _1285;
  float _1286;
  float _1287;
  float _1316;
  float _1341;
  float _1342;
  float _1343;
  float _1362;
  float _1363;
  float _1364;
  float _1370;
  float _1374;
  float _1375;
  float _1376;
  float _1377;
  float _1382;
  float _1407;
  float _1411;
  float _1412;
  float _1413;
  float _1414;
  int _1455;
  float _1510;
  float _1534;
  float _1535;
  float _1539;
  float _1586;
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
      _194 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _195 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _197 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_194, _195, 0));
      _200 = __3__36__0__0__g_gbufferNormal.Load(int3(_194, _195, 0));
      _218 = (saturate(_200.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _219 = (saturate(_200.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _220 = (saturate(_200.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _222 = rsqrt(dot(float3(_218, _219, _220), float3(_218, _219, _220)));
      _223 = _222 * _218;
      _224 = _222 * _219;
      _225 = _220 * _222;
      _228 = (float((uint)((uint)(((uint)((uint)(_197.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _229 = (float((uint)((uint)(_197.w & 255))) * 0.007843137718737125f) + -1.0f;
      _232 = (_228 + _229) * 0.5f;
      _233 = (_228 - _229) * 0.5f;
      _237 = (1.0f - abs(_232)) - abs(_233);
      _239 = rsqrt(dot(float3(_232, _233, _237), float3(_232, _233, _237)));
      _240 = _239 * _232;
      _241 = _239 * _233;
      _242 = _239 * _237;
      _244 = select((_225 >= 0.0f), 1.0f, -1.0f);
      _247 = -0.0f - (1.0f / (_244 + _225));
      _248 = _224 * _247;
      _249 = _248 * _223;
      _250 = _244 * _223;
      _259 = mad(_242, _223, mad(_241, _249, ((((_250 * _223) * _247) + 1.0f) * _240)));
      _263 = mad(_242, _224, mad(_241, (_244 + (_248 * _224)), ((_240 * _244) * _249)));
      _267 = mad(_242, _225, mad(_241, (-0.0f - _224), (-0.0f - (_250 * _240))));
      _269 = rsqrt(dot(float3(_259, _263, _267), float3(_259, _263, _267)));
      _464 = _182.x;
      _465 = _182.y;
      _466 = _182.z;
      _467 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169))).x);
      _468 = (_269 * _259);
      _469 = (_269 * _263);
      _470 = (_269 * _267);
      break;
    }
    case 1: {
      _276 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      _289 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _290 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _292 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_289, _290, 0));
      _295 = __3__36__0__0__g_gbufferNormal.Load(int3(_289, _290, 0));
      _313 = (saturate(_295.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _314 = (saturate(_295.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _315 = (saturate(_295.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _317 = rsqrt(dot(float3(_313, _314, _315), float3(_313, _314, _315)));
      _318 = _317 * _313;
      _319 = _317 * _314;
      _320 = _315 * _317;
      _323 = (float((uint)((uint)(((uint)((uint)(_292.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _324 = (float((uint)((uint)(_292.w & 255))) * 0.007843137718737125f) + -1.0f;
      _327 = (_323 + _324) * 0.5f;
      _328 = (_323 - _324) * 0.5f;
      _332 = (1.0f - abs(_327)) - abs(_328);
      _334 = rsqrt(dot(float3(_327, _328, _332), float3(_327, _328, _332)));
      _335 = _334 * _327;
      _336 = _334 * _328;
      _337 = _334 * _332;
      _339 = select((_320 >= 0.0f), 1.0f, -1.0f);
      _342 = -0.0f - (1.0f / (_339 + _320));
      _343 = _319 * _342;
      _344 = _343 * _318;
      _345 = _339 * _318;
      _354 = mad(_337, _318, mad(_336, _344, ((((_345 * _318) * _342) + 1.0f) * _335)));
      _358 = mad(_337, _319, mad(_336, (_339 + (_343 * _319)), ((_335 * _339) * _344)));
      _362 = mad(_337, _320, mad(_336, (-0.0f - _319), (-0.0f - (_345 * _335))));
      _364 = rsqrt(dot(float3(_354, _358, _362), float3(_354, _358, _362)));
      _464 = _276.x;
      _465 = _276.y;
      _466 = _276.z;
      _467 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_168, _169))).x);
      _468 = (_364 * _354);
      _469 = (_364 * _358);
      _470 = (_364 * _362);
      break;
    }
    case 2: {
      _371 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      _384 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _168);
      _385 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _169);
      _387 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_384, _385, 0));
      _390 = __3__36__0__0__g_gbufferNormal.Load(int3(_384, _385, 0));
      _408 = (saturate(_390.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _409 = (saturate(_390.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _410 = (saturate(_390.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _412 = rsqrt(dot(float3(_408, _409, _410), float3(_408, _409, _410)));
      _413 = _412 * _408;
      _414 = _412 * _409;
      _415 = _410 * _412;
      _418 = (float((uint)((uint)(((uint)((uint)(_387.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _419 = (float((uint)((uint)(_387.w & 255))) * 0.007843137718737125f) + -1.0f;
      _422 = (_418 + _419) * 0.5f;
      _423 = (_418 - _419) * 0.5f;
      _427 = (1.0f - abs(_422)) - abs(_423);
      _429 = rsqrt(dot(float3(_422, _423, _427), float3(_422, _423, _427)));
      _430 = _429 * _422;
      _431 = _429 * _423;
      _432 = _429 * _427;
      _434 = select((_415 >= 0.0f), 1.0f, -1.0f);
      _437 = -0.0f - (1.0f / (_434 + _415));
      _438 = _414 * _437;
      _439 = _438 * _413;
      _440 = _434 * _413;
      _449 = mad(_432, _413, mad(_431, _439, ((((_440 * _413) * _437) + 1.0f) * _430)));
      _453 = mad(_432, _414, mad(_431, (_434 + (_438 * _414)), ((_430 * _434) * _439)));
      _457 = mad(_432, _415, mad(_431, (-0.0f - _414), (-0.0f - (_440 * _430))));
      _459 = rsqrt(dot(float3(_449, _453, _457), float3(_449, _453, _457)));
      _464 = _371.x;
      _465 = _371.y;
      _466 = _371.z;
      _467 = ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_168, _169))).x);
      _468 = (_459 * _449);
      _469 = (_459 * _453);
      _470 = (_459 * _457);
      break;
    }
    default: {
      _464 = 0.0f;
      _465 = 0.0f;
      _466 = 0.0f;
      _467 = 0.0f;
      _468 = 0.0f;
      _469 = 0.0f;
      _470 = 0.0f;
      break;
    }
  }
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_472.x, _472.y);
  _489 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_472.x)))))) + 0.5f) * _168), int((float((int)(int(float((int)((int)(_472.y)))))) + 0.5f) * _169), 0)))).x) & 255;
  _492 = (_467 < 1.0000000116860974e-07f) || (_467 == 1.0f);
  _493 = WaveReadLaneFirst(_materialIndex);
  _501 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_493 < (uint)170000), _493, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrame);
  if (!(_501 < 0.0010000000474974513f)) {
    if (!(_489 == _renderPassSelfPlayer)) {
      if (!(_489 == _renderPassTest)) {
        _515 = (_489 == _renderPassTargetFocus);
      } else {
        _515 = true;
      }
    } else {
      _515 = true;
    }
    _517 = select(_492, 1.0f, select(_515, 0.0f, 1.0f));
    _518 = WaveReadLaneFirst(_materialIndex);
    _526 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_518 < (uint)170000), _518, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameInverse);
    _529 = select((_526 > 0.0010000000474974513f), (1.0f - _517), _517);
    _530 = WaveReadLaneFirst(_materialIndex);
    _538 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_530 < (uint)170000), _530, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameFresnel);
    _539 = abs(_538);
    if (!(_492 || (!(_539 > 0.0f)))) {
      _554 = abs(1.0f - saturate(dot(float3(_468, _469, _470), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))));
      _560 = WaveReadLaneFirst(_materialIndex);
      _568 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_560 < (uint)170000), _560, 0)) + 0u))].BindlessParameters_PostProcessTransition._impactFrameFresnelIntensity);
      _574 = ((saturate(_568 * exp2(log2(select((_538 < 0.0f), (1.0f - _554), _554)) * _539)) + 0.0020000000949949026f) * _529);
    } else {
      _574 = _529;
    }
    _578 = _574 / max(0.0010000000474974513f, _exposure0.x);
    _589 = (lerp(_464, _578, _501));
    _590 = (lerp(_465, _578, _501));
    _591 = (lerp(_466, _578, _501));
  } else {
    _589 = _464;
    _590 = _465;
    _591 = _466;
  }
  _592 = WaveReadLaneFirst(_materialIndex);
  _600 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_592 < (uint)170000), _592, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteRatio);
  _601 = WaveReadLaneFirst(_materialIndex);
  _609 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_601 < (uint)170000), _601, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteRatio);
  _610 = WaveReadLaneFirst(_materialIndex);
  _618 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_610 < (uint)170000), _610, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteRatio);
  if (!(_609 < 0.0010000000474974513f)) {
    _621 = TEXCOORD.x + -0.5f;
    _622 = TEXCOORD.y + -0.5f;
    _627 = WaveReadLaneFirst(_materialIndex);
    _635 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteRadius);
    _641 = WaveReadLaneFirst(_materialIndex);
    _649 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_641 < (uint)170000), _641, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignettePower);
    _655 = WaveReadLaneFirst(_materialIndex);
    _663 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_655 < (uint)170000), _655, 0)) + 0u))].BindlessParameters_PostProcessTransition._sideVignetteColor);
    _666 = float((uint)((uint)(((uint)(_663) >> 16) & 255)));
    _669 = float((uint)((uint)(((uint)(_663) >> 8) & 255)));
    _671 = float((uint)((uint)(_663 & 255)));
    _701 = max(0.0010000000474974513f, _exposure0.x);
    _705 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * _649) * (sqrt((_622 * _622) + (_621 * _621)) / max(0.0010000000474974513f, (1.0f - _635)))) * _609;
    _713 = (((select(((_666 * 0.003921568859368563f) < 0.040449999272823334f), (_666 * 0.0003035269910469651f), exp2(log2((_666 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _589);
    _714 = (((select(((_669 * 0.003921568859368563f) < 0.040449999272823334f), (_669 * 0.0003035269910469651f), exp2(log2((_669 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _590);
    _715 = (((select(((_671 * 0.003921568859368563f) < 0.040449999272823334f), (_671 * 0.0003035269910469651f), exp2(log2((_671 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _591);
  } else {
    _713 = _589;
    _714 = _590;
    _715 = _591;
  }
  if (!(_600 < 0.0010000000474974513f)) {
    _718 = TEXCOORD.x + -0.5f;
    _719 = TEXCOORD.y + -0.5f;
    _724 = WaveReadLaneFirst(_materialIndex);
    _732 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_724 < (uint)170000), _724, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteRadius);
    _737 = WaveReadLaneFirst(_materialIndex);
    _745 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_737 < (uint)170000), _737, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignettePower);
    _751 = WaveReadLaneFirst(_materialIndex);
    _759 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_751 < (uint)170000), _751, 0)) + 0u))].BindlessParameters_PostProcessTransition._topVignetteColor);
    _762 = float((uint)((uint)(((uint)(_759) >> 16) & 255)));
    _765 = float((uint)((uint)(((uint)(_759) >> 8) & 255)));
    _767 = float((uint)((uint)(_759 & 255)));
    _797 = max(0.0010000000474974513f, _exposure0.x);
    _801 = saturate(exp2(log2(1.0f - TEXCOORD.y) * _745) * (sqrt((_719 * _719) + (_718 * _718)) / max(0.0010000000474974513f, (1.0f - _732)))) * _600;
    _809 = (((select(((_762 * 0.003921568859368563f) < 0.040449999272823334f), (_762 * 0.0003035269910469651f), exp2(log2((_762 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _713);
    _810 = (((select(((_765 * 0.003921568859368563f) < 0.040449999272823334f), (_765 * 0.0003035269910469651f), exp2(log2((_765 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _714);
    _811 = (((select(((_767 * 0.003921568859368563f) < 0.040449999272823334f), (_767 * 0.0003035269910469651f), exp2(log2((_767 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _715);
  } else {
    _809 = _713;
    _810 = _714;
    _811 = _715;
  }
  if (!(_618 < 0.0010000000474974513f)) {
    _814 = TEXCOORD.x + -0.5f;
    _815 = TEXCOORD.y + -0.5f;
    _820 = WaveReadLaneFirst(_materialIndex);
    _828 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_820 < (uint)170000), _820, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteRadius);
    _832 = WaveReadLaneFirst(_materialIndex);
    _840 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_832 < (uint)170000), _832, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignettePower);
    _846 = WaveReadLaneFirst(_materialIndex);
    _854 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_846 < (uint)170000), _846, 0)) + 0u))].BindlessParameters_PostProcessTransition._bottomVignetteColor);
    _857 = float((uint)((uint)(((uint)(_854) >> 16) & 255)));
    _860 = float((uint)((uint)(((uint)(_854) >> 8) & 255)));
    _862 = float((uint)((uint)(_854 & 255)));
    _892 = max(0.0010000000474974513f, _exposure0.x);
    _896 = saturate((pow(TEXCOORD.y, _840)) * (sqrt((_815 * _815) + (_814 * _814)) / max(0.0010000000474974513f, (1.0f - _828)))) * _618;
    _904 = (((select(((_857 * 0.003921568859368563f) < 0.040449999272823334f), (_857 * 0.0003035269910469651f), exp2(log2((_857 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _809);
    _905 = (((select(((_860 * 0.003921568859368563f) < 0.040449999272823334f), (_860 * 0.0003035269910469651f), exp2(log2((_860 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _810);
    _906 = (((select(((_862 * 0.003921568859368563f) < 0.040449999272823334f), (_862 * 0.0003035269910469651f), exp2(log2((_862 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _811);
  } else {
    _904 = _809;
    _905 = _810;
    _906 = _811;
  }
  _907 = WaveReadLaneFirst(_materialIndex);
  _915 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_907 < (uint)170000), _907, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransition);
  if ((_915 >= 0.0010000000474974513f) && (_915 < 1.0f)) {
    _920 = _915 * 2.0f;
    _921 = (_920 > 1.0f);
    _923 = select(_921, (_920 + -1.0f), _920);
    _924 = WaveReadLaneFirst(_materialIndex);
    _932 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_924 < (uint)170000), _924, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionNoiseTex);
    _941 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_932 < (uint)65000), _932, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y)))).x) * 0.20000000298023224f;
    _944 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _948 = WaveReadLaneFirst(_materialIndex);
    _956 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_948 < (uint)170000), _948, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionUseDivide);
    _959 = (_923 + -0.5f) * 1.5f;
    _961 = _941 + (TEXCOORD.x - _959);
    _966 = select((_923 >= 0.8999999761581421f), ((_923 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (_956 != 0.0f) {
      _971 = TEXCOORD.y + 0.44999998807907104f;
      _972 = TEXCOORD.y + -0.44999998807907104f;
      _981 = WaveReadLaneFirst(_materialIndex);
      _989 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_981 < (uint)170000), _981, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _998 = WaveReadLaneFirst(_materialIndex);
      _1006 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_998 < (uint)170000), _998, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _1016 = saturate(((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1006 < (uint)65000), _1006, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _959) + _941), _972)))).x) * select(((_972 < 0.0f) || (_972 > 1.0f)), 0.0f, 1.0f)) + ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_989 < (uint)65000), _989, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_961, _971)))).x) * select(((_971 < 0.0f) || (_971 > 1.0f)), 0.0f, 1.0f)));
      _1019 = ((1.0f - _1016) * _966) + _1016;
      if (_921) {
        _1083 = ((_1019 * (_904 - _944.x)) + _944.x);
        _1084 = ((_1019 * (_905 - _944.y)) + _944.y);
        _1085 = ((_1019 * (_906 - _944.z)) + _944.z);
      } else {
        _1083 = ((_1019 * (_944.x - _904)) + _904);
        _1084 = ((_1019 * (_944.y - _905)) + _905);
        _1085 = ((_1019 * (_944.z - _906)) + _906);
      }
    } else {
      _1043 = WaveReadLaneFirst(_materialIndex);
      _1051 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1043 < (uint)170000), _1043, 0)) + 0u))].BindlessParameters_PostProcessTransition._chapterTransitionTex);
      _1057 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1051 < (uint)65000), _1051, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_961, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      _1061 = ((1.0f - _1057.x) * _966) + _1057.x;
      if (_921) {
        _1083 = ((_1061 * (_904 - _944.x)) + _944.x);
        _1084 = ((_1061 * (_905 - _944.y)) + _944.y);
        _1085 = ((_1061 * (_906 - _944.z)) + _944.z);
      } else {
        _1083 = ((_1061 * (_944.x - _904)) + _904);
        _1084 = ((_1061 * (_944.y - _905)) + _905);
        _1085 = ((_1061 * (_944.z - _906)) + _906);
      }
    }
  } else {
    _1083 = _904;
    _1084 = _905;
    _1085 = _906;
  }
  _1086 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1099 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1086, 0)))).x) & 127))) + 0.5f);
  } else {
    _1099 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1083, _1084, _1085));
    _1521 = output_color.x;
    _1522 = output_color.y;
    _1523 = output_color.z;
  } else {
    _1521 = _1083;
    _1522 = _1084;
    _1523 = _1085;
  }
  if (_etcParams.y > 1.0f) {
    _1534 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1535 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1539 = saturate(1.0f - (dot(float2(_1534, _1535), float2(_1534, _1535)) * saturate(_etcParams.y + -1.0f)));
    _1544 = (_1539 * _1521);
    _1545 = (_1539 * _1522);
    _1546 = (_1539 * _1523);
  } else {
    _1544 = _1521;
    _1545 = _1522;
    _1546 = _1523;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1579 = select((_1544 <= 0.0031308000907301903f), (_1544 * 12.920000076293945f), (((pow(_1544, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1580 = select((_1545 <= 0.0031308000907301903f), (_1545 * 12.920000076293945f), (((pow(_1545, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1581 = select((_1546 <= 0.0031308000907301903f), (_1546 * 12.920000076293945f), (((pow(_1546, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1579 = _1544;
    _1580 = _1545;
    _1581 = _1546;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1586 = float((uint)_1086);
    if (!(_1586 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1586 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1595 = _1579;
        _1596 = _1580;
        _1597 = _1581;
      } else {
        _1595 = 0.0f;
        _1596 = 0.0f;
        _1597 = 0.0f;
      }
    } else {
      _1595 = 0.0f;
      _1596 = 0.0f;
      _1597 = 0.0f;
    }
  } else {
    _1595 = _1579;
    _1596 = _1580;
    _1597 = _1581;
  }
  SV_Target.x = _1595;
  SV_Target.y = _1596;
  SV_Target.z = _1597;
  SV_Target.w = _1099;
  return SV_Target;
}