#include "../tonemap.hlsli"

struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessAbyssCommon_CD {
  PostProcessAbyssCommon_CDStruct BindlessParameters_PostProcessAbyssCommon_CD;
};

typedef BindlessParameters_PostProcessAbyssCommon_CD BindlessParameters_PostProcessAbyssCommon_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssCommon_CD_t> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

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
  float _25;
  float _28;
  float _29;
  float _30;
  float _31;
  float _67;
  int _71;
  float _79;
  float _86;
  float _87;
  float _88;
  float _90;
  float _91;
  float _92;
  float _93;
  int _94;
  int _102;
  float4 _109;
  int _116;
  int _124;
  float4 _131;
  int _140;
  int _148;
  float4 _155;
  float _158;
  float _159;
  int _164;
  int _172;
  float4 _179;
  int _188;
  int _196;
  float4 _203;
  float _209;
  float _211;
  float _216;
  float _217;
  float _222;
  float _223;
  float _225;
  int _232;
  int _240;
  float4 _247;
  float _256;
  float _257;
  int _265;
  float _273;
  float _276;
  float _278;
  float _279;
  float _280;
  float _284;
  float _286;
  float _305;
  float _319;
  float _333;
  float _346;
  float _347;
  float _348;
  float _349;
  float _350;
  float _363;
  float _364;
  float _365;
  uint _366;
  float _380;
  float _583;
  float _584;
  float _585;
  float _678;
  float _679;
  float _680;
  float _800;
  float _801;
  float _802;
  float _820;
  float _821;
  float _822;
  float _855;
  float _856;
  float _857;
  float _871;
  float _872;
  float _873;
  float _387;
  float _436;
  float _437;
  float _438;
  float _440;
  float _447;
  float _448;
  float _449;
  float _468;
  float _469;
  float _470;
  float _471;
  float _472;
  float _473;
  float _474;
  float _475;
  float _476;
  float _522;
  float _523;
  float _524;
  float _525;
  float _526;
  float _527;
  float _528;
  float _545;
  float _546;
  float _547;
  float _548;
  float _554;
  float _557;
  float _564;
  float _565;
  float _566;
  float _595;
  float _620;
  float _621;
  float _622;
  float _641;
  float _642;
  float _643;
  float _649;
  float _653;
  float _654;
  float _655;
  float _656;
  float _661;
  float _686;
  float _690;
  float _691;
  float _692;
  float _693;
  int _734;
  float _789;
  float _810;
  float _811;
  float _815;
  float _862;
  float _883;
  float _884;
  float _885;
  float _20[36];
  _25 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _28 = (TEXCOORD.x * 2.0f) + -1.0f;
  _29 = TEXCOORD.y * 2.0f;
  _30 = 1.0f - _29;
  _31 = max(1.0000000116860974e-07f, _25.x);
  _67 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _31, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _30, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _28))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _71 = WaveReadLaneFirst(_materialIndex);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._fogDepth);
  _86 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _31, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _30, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _28))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _67);
  _87 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _31, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _30, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _28))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _67);
  _88 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _31, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _30, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _28))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _67);
  _90 = rsqrt(dot(float3(_86, _87, _88), float3(_86, _87, _88)));
  _91 = _90 * _86;
  _92 = _90 * _87;
  _93 = _90 * _88;
  _94 = WaveReadLaneFirst(_materialIndex);
  _102 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _109 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_102 < (uint)65000), _102, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_93, _91));
  _116 = WaveReadLaneFirst(_materialIndex);
  _124 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _131 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_124 < (uint)65000), _124, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_93, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f) + _92)));
  _140 = WaveReadLaneFirst(_materialIndex);
  _148 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_140 < (uint)170000), _140, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _155 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_148 < (uint)65000), _148, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_93 * 2.0f), ((_92 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)) * 2.0f)));
  _158 = _155.x + _131.x;
  _159 = _155.y + _131.y;
  _164 = WaveReadLaneFirst(_materialIndex);
  _172 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _179 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_172 < (uint)65000), _172, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.12999999523162842f) + _92), _91));
  _188 = WaveReadLaneFirst(_materialIndex);
  _196 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_188 < (uint)170000), _188, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _203 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_196 < (uint)65000), _196, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _92) * 2.0f), (_91 * 2.0f)));
  _209 = abs(dot(float3(_91, _92, _93), float3(0.0f, 1.0f, 0.0f)));
  _211 = abs(dot(float3(_91, _92, _93), float3(0.0f, 0.0f, 1.0f)));
  _216 = (_209 * (_109.x - _158)) + _158;
  _217 = (_209 * (_109.y - _159)) + _159;
  _222 = (((_203.x + _179.x) - _216) * _211) + _216;
  _223 = (((_203.y + _179.y) - _217) * _211) + _217;
  _225 = saturate(_25.x * 35.0f);
  _232 = WaveReadLaneFirst(_materialIndex);
  _240 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._noiseTex);
  _247 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_240 < (uint)65000), _240, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f)), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + TEXCOORD.y)));
  _256 = TEXCOORD.x + -0.5f;
  _257 = TEXCOORD.y + -0.5f;
  _265 = WaveReadLaneFirst(_materialIndex);
  _273 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_265 < (uint)170000), _265, 0)) + 0u))].BindlessParameters_PostProcessAbyssCommon_CD._chromaticShiftValue);
  _276 = ((sqrt((_257 * _257) + (_256 * _256)) * 0.009999999776482582f) * float((uint)(uint)(_enableChromaticAberration))) * _273;
  _278 = rsqrt(dot(float2(_256, _257), float2(_256, _257)));
  _279 = _278 * _256;
  _280 = _278 * _257;
  _284 = ((lerp(_222, _247.x, _225)) * 4.0f) + -1.9921568632125854f;
  _286 = ((lerp(_223, _247.y, _225)) * 4.0f) + -1.9921568632125854f;
  _305 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((TEXCOORD.x - (_276 * _284)) - (_279 * _276)), ((TEXCOORD.y - (_276 * _286)) - (_280 * _276)))))).x) * 0.012683313339948654f);
  _319 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y) * 0.012683313339948654f);
  _333 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((((_279 + _284) * _276) + TEXCOORD.x), (((_280 + _286) * _276) + TEXCOORD.y))))).z) * 0.012683313339948654f);
  _346 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  _347 = _346 * (1.0f - saturate((pow(_25.x, _79)) * 4.0f));
  _348 = _347 * 0.08000000566244125f;
  _349 = _347 * 0.08999999612569809f;
  _350 = _347 * 0.11000000685453415f;
  _363 = ((saturate(_348) * 0.05999999865889549f) * ((exp2(log2(max(0.0f, (_305 + -0.8359375f)) / (18.8515625f - (_305 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _348)) + _348;
  _364 = ((saturate(_349) * 0.05999999865889549f) * ((exp2(log2(max(0.0f, (_319 + -0.8359375f)) / (18.8515625f - (_319 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _349)) + _349;
  _365 = ((((exp2(log2(max(0.0f, (_333 + -0.8359375f)) / (18.8515625f - (_333 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _350) * 0.05999999865889549f) * saturate(_350)) + _350;
  _366 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _380 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _366, 0)))).x) & 127))) + 0.5f);
  } else {
    _380 = _346;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_363, _364, _365));
    _800 = output_color.x;
    _801 = output_color.y;
    _802 = output_color.z;
  } else {
    _800 = _363;
    _801 = _364;
    _802 = _365;
  }
  if (_etcParams.y > 1.0f) {
    _810 = abs(_28);
    _811 = abs(_29 + -1.0f);
    _815 = saturate(1.0f - (dot(float2(_810, _811), float2(_810, _811)) * saturate(_etcParams.y + -1.0f)));
    _820 = (_815 * _800);
    _821 = (_815 * _801);
    _822 = (_815 * _802);
  } else {
    _820 = _800;
    _821 = _801;
    _822 = _802;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _855 = select((_820 <= 0.0031308000907301903f), (_820 * 12.920000076293945f), (((pow(_820, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _856 = select((_821 <= 0.0031308000907301903f), (_821 * 12.920000076293945f), (((pow(_821, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _857 = select((_822 <= 0.0031308000907301903f), (_822 * 12.920000076293945f), (((pow(_822, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _855 = _820;
    _856 = _821;
    _857 = _822;
  }
  if (!(_etcParams.y < 1.0f)) {
    _862 = float((uint)_366);
    if (!(_862 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_862 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _871 = _855;
        _872 = _856;
        _873 = _857;
      } else {
        _871 = 0.0f;
        _872 = 0.0f;
        _873 = 0.0f;
      }
    } else {
      _871 = 0.0f;
      _872 = 0.0f;
      _873 = 0.0f;
    }
  } else {
    _871 = _855;
    _872 = _856;
    _873 = _857;
  }
  _883 = exp2(log2(_871 * 9.999999747378752e-05f) * 0.1593017578125f);
  _884 = exp2(log2(_872 * 9.999999747378752e-05f) * 0.1593017578125f);
  _885 = exp2(log2(_873 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_883 * 18.6875f) + 1.0f)) * ((_883 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_884 * 18.6875f) + 1.0f)) * ((_884 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_885 * 18.6875f) + 1.0f)) * ((_885 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _380;
  return SV_Target;
}