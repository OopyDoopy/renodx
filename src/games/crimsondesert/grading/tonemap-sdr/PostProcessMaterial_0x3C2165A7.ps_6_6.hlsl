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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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
  int _29;
  float _37;
  float _38;
  float _39;
  float _47;
  float _48;
  float _50;
  float4 _64;
  float _71;
  int _72;
  float _80;
  float _86;
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  bool _94;
  float _102;
  float _139;
  float _140;
  float _669;
  float _670;
  float _671;
  float _685;
  float _890;
  float _891;
  float _892;
  float _985;
  float _986;
  float _987;
  float _1107;
  float _1108;
  float _1109;
  float _1130;
  float _1131;
  float _1132;
  float _1165;
  float _1166;
  float _1167;
  float _1181;
  float _1182;
  float _1183;
  float _104;
  float _106;
  float _114;
  float _122;
  float _123;
  float _125;
  float _133;
  int _142;
  float _150;
  bool _151;
  float _154;
  float _155;
  float _156;
  float _196;
  float _199;
  float _200;
  float _202;
  float _236;
  float _237;
  float _239;
  bool _242;
  bool _243;
  bool _244;
  bool _245;
  bool _248;
  float _249;
  bool _250;
  bool _252;
  float _253;
  float _257;
  int _274;
  float _282;
  int _284;
  float _292;
  float _298;
  float _299;
  int _304;
  float _312;
  float _315;
  float _316;
  int _327;
  float _335;
  float _336;
  int _338;
  int _346;
  float4 _353;
  float _361;
  float _364;
  float _371;
  float _408;
  float _409;
  float _410;
  float _429;
  int _433;
  int _441;
  float _445;
  float _449;
  bool _452;
  bool _453;
  float4 _470;
  float _477;
  bool _480;
  bool _481;
  bool _482;
  bool _483;
  float4 _498;
  float _523;
  float _534;
  float _549;
  float _559;
  int _563;
  int _571;
  float4 _578;
  int _582;
  float _590;
  int _603;
  float _611;
  float _633;
  float _637;
  int _648;
  float _656;
  float _658;
  uint _672;
  float _694;
  float _743;
  float _744;
  float _745;
  float _747;
  float _754;
  float _755;
  float _756;
  float _775;
  float _776;
  float _777;
  float _778;
  float _779;
  float _780;
  float _781;
  float _782;
  float _783;
  float _829;
  float _830;
  float _831;
  float _832;
  float _833;
  float _834;
  float _835;
  float _852;
  float _853;
  float _854;
  float _855;
  float _861;
  float _864;
  float _871;
  float _872;
  float _873;
  float _902;
  float _927;
  float _928;
  float _929;
  float _948;
  float _949;
  float _950;
  float _956;
  float _960;
  float _961;
  float _962;
  float _963;
  float _968;
  float _993;
  float _997;
  float _998;
  float _999;
  float _1000;
  int _1041;
  float _1096;
  float _1120;
  float _1121;
  float _1125;
  float _1172;
  float _22[36];
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._chromaticShiftValue);
  _38 = TEXCOORD.x + -0.5f;
  _39 = TEXCOORD.y + -0.5f;
  _47 = rsqrt(dot(float2(_38, _39), float2(_38, _39))) * (sqrt((_39 * _39) + (_38 * _38)) * _37);
  _48 = _47 * _38;
  _50 = _47 * _39;
  _64 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _71 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _72 = WaveReadLaneFirst(_materialIndex);
  _80 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._fishEyeIntensity);
  _86 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  _87 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  _88 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _89 = 0.5f / _88;
  _90 = _86 + -0.5f;
  _91 = _87 - _89;
  _92 = dot(float2(_90, _91), float2(_90, _91));
  _93 = sqrt(_92);
  _94 = (_80 > 0.0f);
  if (_94) {
    _102 = sqrt(dot(float2(0.5f, _89), float2(0.5f, _89)));
  } else {
    if (!(_88 < 1.0f)) {
      _102 = _89;
    } else {
      _102 = 0.5f;
    }
  }
  if (_94) {
    _104 = rsqrt(_92);
    _106 = tan(_93 * _80);
    _114 = tan(_102 * _80);
    _139 = (((((_102 * _90) * _104) * _106) / _114) + 0.5f);
    _140 = (((((_102 * _91) * _104) * _106) / _114) + _89);
  } else {
    if (_80 < 0.0f) {
      _122 = rsqrt(_92);
      _123 = _80 * -10.0f;
      _125 = atan(_93 * _123);
      _133 = atan(_102 * _123);
      _139 = (((((_102 * _90) * _122) * _125) / _133) + 0.5f);
      _140 = (((((_102 * _91) * _122) * _125) / _133) + _89);
    } else {
      _139 = _86;
      _140 = _87;
    }
  }
  _142 = WaveReadLaneFirst(_materialIndex);
  _150 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._useFishUV);
  _151 = (_150 == 1.0f);
  _154 = select(_151, _139, TEXCOORD.x) + -0.5f;
  _155 = select(_151, (_140 * _88), TEXCOORD.y) + -0.5f;
  _156 = _154 * _71;
  _196 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
  _199 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].z), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].z), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].z) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].z)) / _196;
  _200 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _196) * -0.5f;
  _202 = (_71 * 0.5f) * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _196);
  if ((abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f) || ((!(abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f)) && (abs(_questGuideWorldPosition.y) > 9.999999747378752e-06f))) {
    if (!((_200 >= 1.0499999523162842f) || ((_200 <= -1.5f) || ((_202 >= 1.600000023841858f) || ((_202 <= -1.600000023841858f) || ((_199 < 0.0f) || (_202 <= -1.5f))))))) {
      _236 = _156 - _202;
      _237 = _155 - _200;
      _239 = atan(_236 / _237);
      _242 = (_237 < 0.0f);
      _243 = (_237 == 0.0f);
      _244 = (_236 >= 0.0f);
      _245 = (_236 < 0.0f);
      _248 = _245 && _242;
      _249 = select(_248, (_239 + -3.1415927410125732f), select((_244 && _242), (_239 + 3.1415927410125732f), _239));
      _250 = _245 && _243;
      _252 = _244 && _243;
      _253 = select(_252, 1.5707963705062866f, select(_250, -1.5707963705062866f, _249));
      _257 = sqrt((_237 * _237) + (_236 * _236));
      _274 = WaveReadLaneFirst(_materialIndex);
      _282 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightIntensity);
      _284 = WaveReadLaneFirst(_materialIndex);
      _292 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_284 < (uint)170000), _284, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightThreshold);
      _298 = _202 - _156;
      _299 = _200 - _155;
      _304 = WaveReadLaneFirst(_materialIndex);
      _312 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_304 < (uint)170000), _304, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareScale);
      _315 = max((0.019999999552965164f / (_312 * sqrt((_299 * _299) + (_298 * _298)))), 0.0f);
      _316 = _315 * _315;
      _327 = WaveReadLaneFirst(_materialIndex);
      _335 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_327 < (uint)170000), _327, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareAnimSpeed);
      _336 = _335 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
      _338 = WaveReadLaneFirst(_materialIndex);
      _346 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _353 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_346 < (uint)65000), _346, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_253 * 2.0f) + _202) * 4.0f) - cos((_253 * 3.0f) + _200)) + _336), _336));
      _361 = 1.0f / exp2((_257 * 1.4426950216293335f) * ((frac(_353.x) * 0.6600000262260437f) + 0.33000001311302185f));
      _364 = frac((_361 * 20.0f) + 1.0031249523162842f);
      _371 = exp2(log2(1.0f - abs((_361 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      _408 = sin(select(_252, 6.2831854820251465f, select(_250, -6.2831854820251465f, (_249 * 4.0f))));
      _409 = _408 * _236;
      _410 = _408 * _237;
      _429 = exp2(log2(((saturate(_361 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_409 * _409) + (_410 * _410)))) * 8.0f)) * _361) * 12.949999809265137f) * (_361 * 0.4999999701976776f);
      _433 = WaveReadLaneFirst(_materialIndex);
      _441 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_433 < (uint)170000), _433, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _445 = exp2(log2(_257 * 16.0f) * 0.5f);
      _449 = atan(_237 / _236);
      _452 = (_236 == 0.0f);
      _453 = (_237 >= 0.0f);
      _470 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_452 && _453), 2.356194496154785f, select((_452 && _242), -2.356194496154785f, (select(_248, (_449 + -3.1415927410125732f), select((_245 && _453), (_449 + 3.1415927410125732f), _449)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - _445)));
      _477 = atan((-0.0f - _237) / (-0.0f - _236));
      _480 = (_236 > -0.0f);
      _481 = (_236 == -0.0f);
      _482 = (_237 <= -0.0f);
      _483 = (_237 > -0.0f);
      _498 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_481 && _482), 2.356194496154785f, select((_481 && _483), -2.356194496154785f, (select((_480 && _483), (_477 + -3.1415927410125732f), select((_480 && _482), (_477 + 3.1415927410125732f), _477)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - (_445 * 0.5f))));
      _523 = exp2(log2(min(max((1.0f - (_257 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      _534 = exp2(log2(min(max((1.100000023841858f - (_257 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      _549 = (((pow(_257, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_353.x * 8.0f) * 0.20000000298023224f);
      _559 = (exp2(log2(saturate(1.0f - (_282 * sqrt((_154 * _154) + (_155 * _155))))) * _292) * 150.0f) * _exposure2.x;
      _563 = WaveReadLaneFirst(_materialIndex);
      _571 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtTexture);
      _578 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_571 < (uint)65000), _571, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _582 = WaveReadLaneFirst(_materialIndex);
      _590 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_582 < (uint)170000), _582, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtThreshold);
      _603 = WaveReadLaneFirst(_materialIndex);
      _611 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_603 < (uint)170000), _603, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtIntensity);
      _633 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      _637 = frac(sin(floor(_633)) * 43758.546875f);
      _648 = WaveReadLaneFirst(_materialIndex);
      _656 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_648 < (uint)170000), _648, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensflareRatio);
      _658 = _656 * (((((frac(_633) * (frac(sin(ceil(_633)) * 43758.546875f) - _637)) + _637) * 0.6499999761581421f) + 0.3499999940395355f) * (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).w));
      _669 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.x, _498.x))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50))))).x))) * saturate((_611 * (saturate(pow(_578.x, _590)) + -1.0f)) + 1.0f)) + _64.x);
      _670 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.y, _498.y))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y))) * saturate((_611 * (saturate(pow(_578.y, _590)) + -1.0f)) + 1.0f)) + _64.y);
      _671 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.z, _498.z))) * 4.0f))) * 7.0f) + (_429 * (((min(max((abs((frac(_364 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y))))).z))) * saturate((_611 * (saturate(pow(_578.z, _590)) + -1.0f)) + 1.0f)) + _64.z);
    } else {
      _669 = _64.x;
      _670 = _64.y;
      _671 = _64.z;
    }
  } else {
    if (!((_200 >= 1.0499999523162842f) || ((_200 <= -1.5f) || ((_202 >= 1.600000023841858f) || ((_202 <= -1.600000023841858f) || ((_202 <= -1.5f) || ((_199 < 0.0f) || (abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))) {
      _236 = _156 - _202;
      _237 = _155 - _200;
      _239 = atan(_236 / _237);
      _242 = (_237 < 0.0f);
      _243 = (_237 == 0.0f);
      _244 = (_236 >= 0.0f);
      _245 = (_236 < 0.0f);
      _248 = _245 && _242;
      _249 = select(_248, (_239 + -3.1415927410125732f), select((_244 && _242), (_239 + 3.1415927410125732f), _239));
      _250 = _245 && _243;
      _252 = _244 && _243;
      _253 = select(_252, 1.5707963705062866f, select(_250, -1.5707963705062866f, _249));
      _257 = sqrt((_237 * _237) + (_236 * _236));
      _274 = WaveReadLaneFirst(_materialIndex);
      _282 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightIntensity);
      _284 = WaveReadLaneFirst(_materialIndex);
      _292 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_284 < (uint)170000), _284, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightThreshold);
      _298 = _202 - _156;
      _299 = _200 - _155;
      _304 = WaveReadLaneFirst(_materialIndex);
      _312 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_304 < (uint)170000), _304, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareScale);
      _315 = max((0.019999999552965164f / (_312 * sqrt((_299 * _299) + (_298 * _298)))), 0.0f);
      _316 = _315 * _315;
      _327 = WaveReadLaneFirst(_materialIndex);
      _335 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_327 < (uint)170000), _327, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareAnimSpeed);
      _336 = _335 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
      _338 = WaveReadLaneFirst(_materialIndex);
      _346 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _353 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_346 < (uint)65000), _346, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_253 * 2.0f) + _202) * 4.0f) - cos((_253 * 3.0f) + _200)) + _336), _336));
      _361 = 1.0f / exp2((_257 * 1.4426950216293335f) * ((frac(_353.x) * 0.6600000262260437f) + 0.33000001311302185f));
      _364 = frac((_361 * 20.0f) + 1.0031249523162842f);
      _371 = exp2(log2(1.0f - abs((_361 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      _408 = sin(select(_252, 6.2831854820251465f, select(_250, -6.2831854820251465f, (_249 * 4.0f))));
      _409 = _408 * _236;
      _410 = _408 * _237;
      _429 = exp2(log2(((saturate(_361 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_409 * _409) + (_410 * _410)))) * 8.0f)) * _361) * 12.949999809265137f) * (_361 * 0.4999999701976776f);
      _433 = WaveReadLaneFirst(_materialIndex);
      _441 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_433 < (uint)170000), _433, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _445 = exp2(log2(_257 * 16.0f) * 0.5f);
      _449 = atan(_237 / _236);
      _452 = (_236 == 0.0f);
      _453 = (_237 >= 0.0f);
      _470 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_452 && _453), 2.356194496154785f, select((_452 && _242), -2.356194496154785f, (select(_248, (_449 + -3.1415927410125732f), select((_245 && _453), (_449 + 3.1415927410125732f), _449)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - _445)));
      _477 = atan((-0.0f - _237) / (-0.0f - _236));
      _480 = (_236 > -0.0f);
      _481 = (_236 == -0.0f);
      _482 = (_237 <= -0.0f);
      _483 = (_237 > -0.0f);
      _498 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_481 && _482), 2.356194496154785f, select((_481 && _483), -2.356194496154785f, (select((_480 && _483), (_477 + -3.1415927410125732f), select((_480 && _482), (_477 + 3.1415927410125732f), _477)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - (_445 * 0.5f))));
      _523 = exp2(log2(min(max((1.0f - (_257 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      _534 = exp2(log2(min(max((1.100000023841858f - (_257 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      _549 = (((pow(_257, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_353.x * 8.0f) * 0.20000000298023224f);
      _559 = (exp2(log2(saturate(1.0f - (_282 * sqrt((_154 * _154) + (_155 * _155))))) * _292) * 150.0f) * _exposure2.x;
      _563 = WaveReadLaneFirst(_materialIndex);
      _571 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtTexture);
      _578 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_571 < (uint)65000), _571, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _582 = WaveReadLaneFirst(_materialIndex);
      _590 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_582 < (uint)170000), _582, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtThreshold);
      _603 = WaveReadLaneFirst(_materialIndex);
      _611 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_603 < (uint)170000), _603, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtIntensity);
      _633 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      _637 = frac(sin(floor(_633)) * 43758.546875f);
      _648 = WaveReadLaneFirst(_materialIndex);
      _656 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_648 < (uint)170000), _648, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensflareRatio);
      _658 = _656 * (((((frac(_633) * (frac(sin(ceil(_633)) * 43758.546875f) - _637)) + _637) * 0.6499999761581421f) + 0.3499999940395355f) * (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).w));
      _669 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.x, _498.x))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50))))).x))) * saturate((_611 * (saturate(pow(_578.x, _590)) + -1.0f)) + 1.0f)) + _64.x);
      _670 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.y, _498.y))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y))) * saturate((_611 * (saturate(pow(_578.y, _590)) + -1.0f)) + 1.0f)) + _64.y);
      _671 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.z, _498.z))) * 4.0f))) * 7.0f) + (_429 * (((min(max((abs((frac(_364 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y))))).z))) * saturate((_611 * (saturate(pow(_578.z, _590)) + -1.0f)) + 1.0f)) + _64.z);
    } else {
      _669 = _64.x;
      _670 = _64.y;
      _671 = _64.z;
    }
  }
  _672 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _685 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _672, 0)))).x) & 127))) + 0.5f);
  } else {
    _685 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_669, _670, _671));
    _1107 = output_color.x;
    _1108 = output_color.y;
    _1109 = output_color.z;
  } else {
    _1107 = _669;
    _1108 = _670;
    _1109 = _671;
  }
  if (_etcParams.y > 1.0f) {
    _1120 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1121 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1125 = saturate(1.0f - (dot(float2(_1120, _1121), float2(_1120, _1121)) * saturate(_etcParams.y + -1.0f)));
    _1130 = (_1125 * _1107);
    _1131 = (_1125 * _1108);
    _1132 = (_1125 * _1109);
  } else {
    _1130 = _1107;
    _1131 = _1108;
    _1132 = _1109;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1165 = select((_1130 <= 0.0031308000907301903f), (_1130 * 12.920000076293945f), (((pow(_1130, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1166 = select((_1131 <= 0.0031308000907301903f), (_1131 * 12.920000076293945f), (((pow(_1131, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1167 = select((_1132 <= 0.0031308000907301903f), (_1132 * 12.920000076293945f), (((pow(_1132, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1165 = _1130;
    _1166 = _1131;
    _1167 = _1132;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1172 = float((uint)_672);
    if (!(_1172 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1172 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1181 = _1165;
        _1182 = _1166;
        _1183 = _1167;
      } else {
        _1181 = 0.0f;
        _1182 = 0.0f;
        _1183 = 0.0f;
      }
    } else {
      _1181 = 0.0f;
      _1182 = 0.0f;
      _1183 = 0.0f;
    }
  } else {
    _1181 = _1165;
    _1182 = _1166;
    _1183 = _1167;
  }
  SV_Target.x = _1181;
  SV_Target.y = _1182;
  SV_Target.z = _1183;
  SV_Target.w = _685;
  return SV_Target;
}