#include "../tonemap.hlsli"

struct PostProcessAnamorphic_CDStruct {
  float _anamorphicProgress;
  uint _anamorphicPlayerColor;
  uint _anamorphicBackgroundColor;
  uint _noiseTex;
  uint _milkyWayTexture;
  float _milkyWayRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b26, space35) {
  float _sunLightIntensity : packoffset(c000.x);
  float _sunLightPreset : packoffset(c000.y);
  float _sunSizeAngle : packoffset(c000.z);
  float _sunSizeAngleCosine : packoffset(c000.w);
  float _sunDirY : packoffset(c001.x);
  float _moonLightIntensity : packoffset(c001.y);
  float _moonLightPreset : packoffset(c001.z);
  float _moonSizeAngle : packoffset(c001.w);
  float _moonSizeAngleCosine : packoffset(c002.x);
  float _moonDirY : packoffset(c002.y);
  float _earthAxisTilt : packoffset(c002.z);
  float _latitude : packoffset(c002.w);
  float _earthRadius : packoffset(c003.x);
  float _atmosphereThickness : packoffset(c003.y);
  float _rayleighScaledHeight : packoffset(c003.z);
  uint _rayleighScatteringColor : packoffset(c003.w);
  float _mieScaledHeight : packoffset(c004.x);
  float _mieAerosolDensity : packoffset(c004.y);
  float _mieAerosolAbsorption : packoffset(c004.z);
  float _miePhaseConst : packoffset(c004.w);
  float _ozoneRatio : packoffset(c005.x);
  float _directionalLightLuminanceScale : packoffset(c005.y);
  float _distanceScale : packoffset(c005.z);
  float _heightFogDensity : packoffset(c005.w);
  float _heightFogBaseline : packoffset(c006.x);
  float _heightFogFalloff : packoffset(c006.y);
  float _heightFogScale : packoffset(c006.z);
  float _cloudBaseDensity : packoffset(c006.w);
  float _cloudBaseContrast : packoffset(c007.x);
  float _cloudBaseScale : packoffset(c007.y);
  float _cloudAlpha : packoffset(c007.z);
  float _cloudScrollMultiplier : packoffset(c007.w);
  float _cloudScatteringCoefficient : packoffset(c008.x);
  float _cloudPhaseConstFront : packoffset(c008.y);
  float _cloudPhaseConstBack : packoffset(c008.z);
  float _cloudAltitude : packoffset(c008.w);
  float _cloudThickness : packoffset(c009.x);
  float _cloudVisibleRange : packoffset(c009.y);
  float _cloudNear : packoffset(c009.z);
  float _cloudFadeRange : packoffset(c009.w);
  float _cloudDetailRatio : packoffset(c010.x);
  float _cloudDetailScale : packoffset(c010.y);
  float _cloudMultiRatio : packoffset(c010.z);
  float _cloudBeerPowderRatio : packoffset(c010.w);
  float _cloudCirrusAltitude : packoffset(c011.x);
  float _cloudCirrusDensity : packoffset(c011.y);
  float _cloudCirrusScale : packoffset(c011.z);
  float _cloudCirrusWeightR : packoffset(c011.w);
  float _cloudCirrusWeightG : packoffset(c012.x);
  float _cloudCirrusWeightB : packoffset(c012.y);
  float _cloudFlow : packoffset(c012.z);
  float _cloudSeed : packoffset(c012.w);
  float4 _volumeFogScatterColor : packoffset(c013.x);
  float4 _mieScatterColor : packoffset(c014.x);
};

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

struct BindlessParameters_PostProcessAnamorphic_CD {
  PostProcessAnamorphic_CDStruct BindlessParameters_PostProcessAnamorphic_CD;
};

typedef BindlessParameters_PostProcessAnamorphic_CD BindlessParameters_PostProcessAnamorphic_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAnamorphic_CD_t> BindlessParameters_PostProcessAnamorphic_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _36;
  float4 _39;
  float _49;
  float _50;
  float _51;
  float _76;
  float _77;
  float _78;
  float _80;
  float _81;
  float _82;
  float _84;
  float _86;
  float _122;
  float _126;
  int _133;
  int _141;
  float4 _148;
  float _151;
  float _152;
  float _155;
  float _156;
  uint2 _158;
  uint _173;
  int _175;
  float _183;
  float _184;
  float _186;
  float _187;
  float _188;
  float _199;
  float _200;
  float _269;
  float _809;
  float _818;
  float _819;
  float _820;
  float _923;
  float _924;
  float _925;
  float _948;
  float _1151;
  float _1152;
  float _1153;
  float _1246;
  float _1247;
  float _1248;
  float _1368;
  float _1369;
  float _1370;
  float _1388;
  float _1389;
  float _1390;
  float _1423;
  float _1424;
  float _1425;
  float _1439;
  float _1440;
  float _1441;
  float _202;
  float _203;
  float _204;
  float _205;
  float _207;
  float _208;
  float _209;
  float _229;
  int _230;
  float _238;
  float _243;
  float _244;
  float _245;
  float _255;
  float _256;
  int _270;
  int _278;
  float _281;
  float _284;
  float _286;
  float _311;
  float _312;
  float _313;
  float _316;
  float _317;
  float4 _320;
  float _327;
  float _328;
  float _329;
  float _333;
  float _334;
  float _335;
  float _336;
  float _337;
  float _338;
  float _339;
  float _340;
  float _350;
  float _386;
  float _387;
  float _388;
  float _389;
  float _391;
  float _392;
  float _393;
  float _394;
  float _397;
  float _401;
  float _404;
  float _406;
  bool _409;
  bool _410;
  bool _411;
  bool _412;
  int _425;
  int _433;
  float4 _440;
  float _444;
  float _445;
  float _446;
  float _455;
  float _457;
  float _467;
  float _468;
  float _469;
  float _471;
  float _472;
  float _473;
  float _474;
  float _475;
  float _477;
  float _490;
  float _491;
  float _492;
  float _494;
  float _495;
  float _502;
  float _503;
  float _504;
  float _506;
  bool _521;
  float _527;
  float _537;
  float _538;
  float _539;
  float _552;
  float _564;
  float _571;
  float _572;
  float _573;
  float _586;
  float _598;
  float _602;
  float _606;
  float _607;
  float _608;
  float _612;
  int _619;
  float _627;
  float _640;
  float _641;
  float _642;
  float _643;
  float _645;
  float _652;
  float _653;
  float _654;
  float _655;
  int _670;
  int _678;
  float _696;
  float _700;
  int _701;
  int _709;
  float _712;
  float _715;
  float _717;
  float _750;
  float _751;
  float _752;
  float _753;
  int _796;
  bool _804;
  float _810;
  uint _826;
  uint _827;
  uint4 _829;
  float4 _832;
  float _850;
  float _851;
  float _852;
  float _854;
  float _855;
  float _856;
  float _857;
  float _860;
  float _861;
  float _864;
  float _865;
  float _869;
  float _871;
  float _872;
  float _873;
  float _874;
  float _876;
  float _879;
  float _880;
  float _881;
  float _882;
  float _891;
  float _895;
  float _899;
  float _901;
  float _915;
  float _932;
  float _933;
  float _934;
  uint _935;
  float _955;
  float _1004;
  float _1005;
  float _1006;
  float _1008;
  float _1015;
  float _1016;
  float _1017;
  float _1036;
  float _1037;
  float _1038;
  float _1039;
  float _1040;
  float _1041;
  float _1042;
  float _1043;
  float _1044;
  float _1090;
  float _1091;
  float _1092;
  float _1093;
  float _1094;
  float _1095;
  float _1096;
  float _1113;
  float _1114;
  float _1115;
  float _1116;
  float _1122;
  float _1125;
  float _1132;
  float _1133;
  float _1134;
  float _1163;
  float _1188;
  float _1189;
  float _1190;
  float _1209;
  float _1210;
  float _1211;
  float _1217;
  float _1221;
  float _1222;
  float _1223;
  float _1224;
  float _1229;
  float _1254;
  float _1258;
  float _1259;
  float _1260;
  float _1261;
  int _1302;
  float _1357;
  float _1378;
  float _1379;
  float _1383;
  float _1430;
  float _1451;
  float _1452;
  float _1453;
  float _30[36];
  _36 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _39 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _49 = (pow(_39.x, 0.012683313339948654f));
  _50 = (pow(_39.y, 0.012683313339948654f));
  _51 = (pow(_39.z, 0.012683313339948654f));
  _76 = exp2(log2(max(0.0f, (_49 + -0.8359375f)) / (18.8515625f - (_49 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _80 = (TEXCOORD.x * 2.0f) + -1.0f;
  _81 = TEXCOORD.y * 2.0f;
  _82 = 1.0f - _81;
  _84 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _86 = max(1.0000000116860974e-07f, _84.x);
  _122 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _86, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _80))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _126 = 5.0f / _36;
  _133 = WaveReadLaneFirst(_materialIndex);
  _141 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._noiseTex);
  _148 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_126 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + (_126 * TEXCOORD.y))));
  _151 = _148.x + -0.20000000298023224f;
  _152 = _148.y + -0.20000000298023224f;
  _155 = (_151 * 0.0020000000949949026f) + TEXCOORD.x;
  _156 = (_152 * 0.004999999888241291f) + TEXCOORD.y;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_158.x, _158.y);
  _173 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_158.x)))))) + 0.5f) * _155), int((float((int)(int(float((int)((int)(_158.y)))))) + 0.5f) * _156), 0));
  _175 = _173.x & 255;
  _183 = (float((uint)((uint)((uint)((uint)(_173.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _184 = (float((uint)((uint)(((uint)((uint)(_173.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _186 = 1.0f - abs(_183);
  _187 = abs(_184);
  _188 = _186 - _187;
  if (_188 < 0.0f) {
    _199 = (select((_183 >= 0.0f), 1.0f, -1.0f) * (1.0f - _187));
    _200 = (select((_184 >= 0.0f), 1.0f, -1.0f) * _186);
  } else {
    _199 = _183;
    _200 = _184;
  }
  _202 = rsqrt(dot(float3(_199, _200, _188), float3(_199, _200, _188)));
  _203 = _202 * _199;
  _204 = _202 * _200;
  _205 = _202 * _188;
  _207 = rsqrt(dot(float3(_203, _204, _205), float3(_203, _204, _205)));
  _208 = _207 * _203;
  _209 = _207 * _204;
  _229 = saturate((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / _86) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _155), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _156), 0)))).x)))) * 50.0f);
  _230 = WaveReadLaneFirst(_materialIndex);
  _238 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_230 < (uint)170000), _230, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._anamorphicProgress);
  _243 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _86, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _80))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _122) - _mainPosition.x;
  _244 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _86, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _80))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _122) - _mainPosition.y;
  _245 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _86, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _82, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _80))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _122) - _mainPosition.z;
  _255 = saturate(sqrt(((_243 * _243) + (_244 * _244)) + (_245 * _245)) / max(0.0010000000474974513f, (_238 * 300.0f)));
  _256 = 1.0f - _255;
  if (_256 > 0.0f) {
    _269 = ((saturate((_238 * 2.0f) + -1.0f) * _255) + _256);
  } else {
    _269 = (pow(_238, 0.25f));
  }
  _270 = WaveReadLaneFirst(_materialIndex);
  _278 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._anamorphicBackgroundColor);
  _281 = float((uint)((uint)(((uint)(_278) >> 16) & 255)));
  _284 = float((uint)((uint)(((uint)(_278) >> 8) & 255)));
  _286 = float((uint)((uint)(_278 & 255)));
  _311 = select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _312 = select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _313 = select(((_286 * 0.003921568859368563f) < 0.040449999272823334f), (_286 * 0.0003035269910469651f), exp2(log2((_286 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _316 = TEXCOORD.x - (_151 * 0.0010000000474974513f);
  _317 = TEXCOORD.y - (_152 * 0.0024999999441206455f);
  _320 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_316, _317), 0.0f);
  _327 = ((_earthAxisTilt + 90.0f) - _latitude) * 0.01745329238474369f;
  _328 = sin(_327);
  _329 = cos(_327);
  _333 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].w) * 0.2617993950843811f) + -3.1415927410125732f;
  _334 = sin(_333);
  _335 = cos(_333);
  _336 = 1.0f - _335;
  _337 = _336 * _328;
  _338 = _336 * _329;
  _339 = _334 * _328;
  _340 = _334 * _329;
  _350 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  _386 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _350, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _80));
  _387 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _350, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _80)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _386;
  _388 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _350, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _80))) / _386;
  _389 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _350, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _80))) / _386;
  _391 = rsqrt(dot(float3(_387, _388, _389), float3(_387, _388, _389)));
  _392 = _391 * _387;
  _393 = _391 * _388;
  _394 = _391 * _389;
  _397 = mad((-0.0f - _339), _394, mad(_340, _393, (_392 * _335)));
  _401 = mad((_338 * _328), _394, mad(((_337 * _328) + _335), _393, (-0.0f - (_340 * _392))));
  _404 = mad(((_338 * _329) + _335), _394, mad((_337 * _329), _393, (_392 * _339)));
  _406 = atan(_404 / _397);
  _409 = (_397 < 0.0f);
  _410 = (_397 == 0.0f);
  _411 = (_404 >= 0.0f);
  _412 = (_404 < 0.0f);
  _425 = WaveReadLaneFirst(_materialIndex);
  _433 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_425 < (uint)170000), _425, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._milkyWayTexture);
  _440 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_433 < (uint)65000), _433, 0)) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(select((_410 && _411), 0.75f, select((_410 && _412), 0.25f, ((select((_409 && _412), (_406 + -3.1415927410125732f), select((_409 && _411), (_406 + 3.1415927410125732f), _406)) * 0.15915493667125702f) + 0.5f))), (acos(_401) * 0.31830987334251404f)), 0.0f);
  _444 = _440.x + -0.061246078461408615f;
  _445 = _440.y + -0.08228270709514618f;
  _446 = _440.z + -0.09989875555038452f;
  _455 = saturate(1.0f - (sqrt(((_444 * _444) + (_445 * _445)) + (_446 * _446)) * 4.0f));
  _457 = dot(float3(_440.x, _440.y, _440.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 2.0f;
  _467 = (((_457 * _311) - _440.x) * _455) + _440.x;
  _468 = (((_457 * _312) - _440.y) * _455) + _440.y;
  _469 = (((_457 * _313) - _440.z) * _455) + _440.z;
  _471 = saturate(_320.w * 1.4285714626312256f);
  _472 = _471 * _311;
  _473 = _471 * _312;
  _474 = _471 * _313;
  _475 = _320.w * 10.0f;
  _477 = saturate(_475 + -7.0f);
  _490 = ((saturate(_311 * 2.0f) - _472) * _477) + _472;
  _491 = ((saturate(_312 * 2.0f) - _473) * _477) + _473;
  _492 = ((saturate(_313 * 2.0f) - _474) * _477) + _474;
  _494 = saturate(_475 + -8.0f);
  _495 = _494 * _494;
  _502 = (_495 * (1.0f - _490)) + _490;
  _503 = ((0.75f - _491) * _495) + _491;
  _504 = ((0.550000011920929f - _492) * _495) + _492;
  _506 = saturate(_475 + -9.0f);
  _521 = (_84.x < 1.0000000116860974e-07f) || (_84.x == 1.0f);
  _527 = max(0.0010000000474974513f, _exposure0.x);
  _537 = float((int)(int(_397 * 2000.0f)));
  _538 = float((int)(int(_401 * 2000.0f)));
  _539 = float((int)(int(_404 * 2000.0f)));
  _552 = frac((sin((_538 * 5.0000002374872565e-05f) + (_537 * 0.008500000461935997f)) * 10000.0f) * (abs(sin((_538 * 0.006500000134110451f) + (_537 * 0.0005000000237487257f))) + 0.10000000149011612f));
  _564 = frac((sin((_552 * 17.0f) + (_539 * 5.0000002374872565e-05f)) * 10000.0f) * (abs(sin(_552 + (_539 * 0.006500000134110451f))) + 0.10000000149011612f));
  _571 = float((int)(int(_397 * 1500.0f)));
  _572 = float((int)(int(_401 * 1500.0f)));
  _573 = float((int)(int(_404 * 1500.0f)));
  _586 = frac((sin((_572 * 6.666666740784422e-05f) + (_571 * 0.01133333332836628f)) * 10000.0f) * (abs(sin((_572 * 0.008666666224598885f) + (_571 * 0.0006666666595265269f))) + 0.10000000149011612f));
  _598 = frac((sin((_586 * 17.0f) + (_573 * 6.666666740784422e-05f)) * 10000.0f) * (abs(sin(_586 + (_573 * 0.008666666224598885f))) + 0.10000000149011612f));
  _602 = saturate((_564 + -0.699999988079071f) * 3.3333332538604736f) * 1.5f;
  _606 = (_602 * _467) + _467;
  _607 = (_602 * _468) + _468;
  _608 = (_602 * _469) + _469;
  _612 = saturate((_598 + -0.9800000190734863f) * 50.00004959106445f) * 9.0f;
  _619 = WaveReadLaneFirst(_materialIndex);
  _627 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_619 < (uint)170000), _619, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._milkyWayRatio);
  _640 = ((saturate((_598 + -0.9994999766349792f) * 1999.906494140625f) * 3.0f) + (saturate((_564 + -0.9990000128746033f) * 1000.0128784179688f) * 0.10000000149011612f)) * 0.5f;
  _641 = _640 + (_627 * ((_606 * _612) + _606));
  _642 = _640 + (_627 * ((_607 * _612) + _607));
  _643 = _640 + (_627 * ((_608 * _612) + _608));
  _645 = saturate(_84.x * 5.0f);
  _652 = (((select(_521, 0.0f, ((((_311 * 0.10000000149011612f) - _502) * _506) + _502)) / _527) - _641) * _645) + _641;
  _653 = (((select(_521, 0.0f, ((((_312 * 0.10000000149011612f) - _503) * _506) + _503)) / _527) - _642) * _645) + _642;
  _654 = (((select(_521, 0.0f, ((((_313 * 0.10000000149011612f) - _504) * _506) + _504)) / _527) - _643) * _645) + _643;
  _655 = 2.0f / _36;
  _670 = WaveReadLaneFirst(_materialIndex);
  _678 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_670 < (uint)170000), _670, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._noiseTex);
  _696 = saturate(1.0f - dot(float3(_208, _209, (_207 * _205)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
  _700 = saturate((_696 * _696) + ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_678 < (uint)65000), _678, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_208 * -0.10000000149011612f) - (_148.x * 0.20000000298023224f)) + (_655 * TEXCOORD.x)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f)), (((_209 * -0.10000000149011612f) - (_148.y * 0.20000000298023224f)) + (_655 * TEXCOORD.y)))))).w) * 0.5f));
  _701 = WaveReadLaneFirst(_materialIndex);
  _709 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_701 < (uint)170000), _701, 0)) + 0u))].BindlessParameters_PostProcessAnamorphic_CD._anamorphicPlayerColor);
  _712 = float((uint)((uint)(((uint)(_709) >> 16) & 255)));
  _715 = float((uint)((uint)(((uint)(_709) >> 8) & 255)));
  _717 = float((uint)((uint)(_709 & 255)));
  _750 = max(0.0010000000474974513f, _exposure0.x);
  _751 = (select(((_712 * 0.003921568859368563f) < 0.040449999272823334f), (_712 * 0.0003035269910469651f), exp2(log2((_712 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  _752 = (select(((_715 * 0.003921568859368563f) < 0.040449999272823334f), (_715 * 0.0003035269910469651f), exp2(log2((_715 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  _753 = (select(((_717 * 0.003921568859368563f) < 0.040449999272823334f), (_717 * 0.0003035269910469651f), exp2(log2((_717 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  if ((_175 == _renderPassSelfPlayer) || ((!(_175 == _renderPassSelfPlayer)) && (_175 == _renderPassTest))) {
    _923 = (lerp(_652, _751, _229));
    _924 = (lerp(_653, _752, _229));
    _925 = (lerp(_654, _753, _229));
  } else {
    if (_175 == _renderPassAnamorphicMural) {
      _923 = (lerp(_652, _76, _229));
      _924 = (lerp(_653, _77, _229));
      _925 = (lerp(_654, _78, _229));
    } else {
      _796 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127;
      if ((uint)(_796 + -105) < (uint)2) {
        _809 = 0.10000000149011612f;
        _810 = _809 * _229;
        _818 = ((_810 * _751) + _652);
        _819 = ((_810 * _752) + _653);
        _820 = ((_810 * _753) + _654);
      } else {
        _804 = (_796 == 107);
        if (_804 || ((_796 == 26) || ((uint)(_796 + -27) < (uint)2))) {
          _809 = select(_804, 0.10000000149011612f, 0.014999999664723873f);
          _810 = _809 * _229;
          _818 = ((_810 * _751) + _652);
          _819 = ((_810 * _752) + _653);
          _820 = ((_810 * _753) + _654);
        } else {
          _818 = _652;
          _819 = _653;
          _820 = _654;
        }
      }
      if ((uint)(_796 + -53) < (uint)15) {
        _826 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _316);
        _827 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _317);
        _829 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_826, _827, 0));
        _832 = __3__36__0__0__g_gbufferNormal.Load(int3(_826, _827, 0));
        _850 = (saturate(_832.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        _851 = (saturate(_832.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        _852 = (saturate(_832.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        _854 = rsqrt(dot(float3(_850, _851, _852), float3(_850, _851, _852)));
        _855 = _854 * _850;
        _856 = _854 * _851;
        _857 = _852 * _854;
        _860 = (float((uint)((uint)(((uint)((uint)(_829.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        _861 = (float((uint)((uint)(_829.w & 255))) * 0.007843137718737125f) + -1.0f;
        _864 = (_860 + _861) * 0.5f;
        _865 = (_860 - _861) * 0.5f;
        _869 = (1.0f - abs(_864)) - abs(_865);
        _871 = rsqrt(dot(float3(_864, _865, _869), float3(_864, _865, _869)));
        _872 = _871 * _864;
        _873 = _871 * _865;
        _874 = _871 * _869;
        _876 = select((_857 >= 0.0f), 1.0f, -1.0f);
        _879 = -0.0f - (1.0f / (_876 + _857));
        _880 = _856 * _879;
        _881 = _880 * _855;
        _882 = _876 * _855;
        _891 = mad(_874, _855, mad(_873, _881, ((((_882 * _855) * _879) + 1.0f) * _872)));
        _895 = mad(_874, _856, mad(_873, (_876 + (_880 * _856)), ((_872 * _876) * _881)));
        _899 = mad(_874, _857, mad(_873, (-0.0f - _856), (-0.0f - (_882 * _872))));
        _901 = rsqrt(dot(float3(_891, _895, _899), float3(_891, _895, _899)));
        _915 = (1.0f - saturate(dot(float3((_901 * _891), (_901 * _895), (_901 * _899)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))))) * _229;
        _923 = ((_915 * _751) + _818);
        _924 = ((_915 * _752) + _819);
        _925 = ((_915 * _753) + _820);
      } else {
        _923 = _818;
        _924 = _819;
        _925 = _820;
      }
    }
  }
  _932 = ((_923 - _76) * _269) + _76;
  _933 = ((_924 - _77) * _269) + _77;
  _934 = ((_925 - _78) * _269) + _78;
  _935 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _948 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _935, 0)))).x) & 127))) + 0.5f);
  } else {
    _948 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_932, _933, _934));
    _1368 = output_color.x;
    _1369 = output_color.y;
    _1370 = output_color.z;
  } else {
    _1368 = _932;
    _1369 = _933;
    _1370 = _934;
  }
  if (_etcParams.y > 1.0f) {
    _1378 = abs(_80);
    _1379 = abs(_81 + -1.0f);
    _1383 = saturate(1.0f - (dot(float2(_1378, _1379), float2(_1378, _1379)) * saturate(_etcParams.y + -1.0f)));
    _1388 = (_1383 * _1368);
    _1389 = (_1383 * _1369);
    _1390 = (_1383 * _1370);
  } else {
    _1388 = _1368;
    _1389 = _1369;
    _1390 = _1370;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1423 = select((_1388 <= 0.0031308000907301903f), (_1388 * 12.920000076293945f), (((pow(_1388, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1424 = select((_1389 <= 0.0031308000907301903f), (_1389 * 12.920000076293945f), (((pow(_1389, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1425 = select((_1390 <= 0.0031308000907301903f), (_1390 * 12.920000076293945f), (((pow(_1390, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1423 = _1388;
    _1424 = _1389;
    _1425 = _1390;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1430 = float((uint)_935);
    if (!(_1430 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1430 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1439 = _1423;
        _1440 = _1424;
        _1441 = _1425;
      } else {
        _1439 = 0.0f;
        _1440 = 0.0f;
        _1441 = 0.0f;
      }
    } else {
      _1439 = 0.0f;
      _1440 = 0.0f;
      _1441 = 0.0f;
    }
  } else {
    _1439 = _1423;
    _1440 = _1424;
    _1441 = _1425;
  }
  _1451 = exp2(log2(_1439 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1452 = exp2(log2(_1440 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1453 = exp2(log2(_1441 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1451 * 18.6875f) + 1.0f)) * ((_1451 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1452 * 18.6875f) + 1.0f)) * ((_1452 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1453 * 18.6875f) + 1.0f)) * ((_1453 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _948;
  return SV_Target;
}