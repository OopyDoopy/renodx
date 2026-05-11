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
  float _310;
  float _311;
  float _312;
  float _313;
  float _314;
  float _327;
  float _328;
  float _329;
  uint _330;
  float _344;
  float _547;
  float _548;
  float _549;
  float _642;
  float _643;
  float _644;
  float _764;
  float _765;
  float _766;
  float _784;
  float _785;
  float _786;
  float _819;
  float _820;
  float _821;
  float _835;
  float _836;
  float _837;
  float _351;
  float _400;
  float _401;
  float _402;
  float _404;
  float _411;
  float _412;
  float _413;
  float _432;
  float _433;
  float _434;
  float _435;
  float _436;
  float _437;
  float _438;
  float _439;
  float _440;
  float _486;
  float _487;
  float _488;
  float _489;
  float _490;
  float _491;
  float _492;
  float _509;
  float _510;
  float _511;
  float _512;
  float _518;
  float _521;
  float _528;
  float _529;
  float _530;
  float _559;
  float _584;
  float _585;
  float _586;
  float _605;
  float _606;
  float _607;
  float _613;
  float _617;
  float _618;
  float _619;
  float _620;
  float _625;
  float _650;
  float _654;
  float _655;
  float _656;
  float _657;
  int _698;
  float _753;
  float _774;
  float _775;
  float _779;
  float _826;
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
  _310 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  _311 = _310 * (1.0f - saturate((pow(_25.x, _79)) * 4.0f));
  _312 = _311 * 0.08000000566244125f;
  _313 = _311 * 0.08999999612569809f;
  _314 = _311 * 0.11000000685453415f;
  _327 = ((saturate(_312) * 0.05999999865889549f) * ((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((TEXCOORD.x - (_276 * _284)) - (_279 * _276)), ((TEXCOORD.y - (_276 * _286)) - (_280 * _276)))))).x) - _312)) + _312;
  _328 = ((saturate(_313) * 0.05999999865889549f) * ((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y) - _313)) + _313;
  _329 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((((_279 + _284) * _276) + TEXCOORD.x), (((_280 + _286) * _276) + TEXCOORD.y))))).z) - _314) * 0.05999999865889549f) * saturate(_314)) + _314;
  _330 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _344 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _330, 0)))).x) & 127))) + 0.5f);
  } else {
    _344 = _310;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_327, _328, _329));
    _764 = output_color.x;
    _765 = output_color.y;
    _766 = output_color.z;
  } else {
    _764 = _327;
    _765 = _328;
    _766 = _329;
  }
  if (_etcParams.y > 1.0f) {
    _774 = abs(_28);
    _775 = abs(_29 + -1.0f);
    _779 = saturate(1.0f - (dot(float2(_774, _775), float2(_774, _775)) * saturate(_etcParams.y + -1.0f)));
    _784 = (_779 * _764);
    _785 = (_779 * _765);
    _786 = (_779 * _766);
  } else {
    _784 = _764;
    _785 = _765;
    _786 = _766;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _819 = select((_784 <= 0.0031308000907301903f), (_784 * 12.920000076293945f), (((pow(_784, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _820 = select((_785 <= 0.0031308000907301903f), (_785 * 12.920000076293945f), (((pow(_785, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _821 = select((_786 <= 0.0031308000907301903f), (_786 * 12.920000076293945f), (((pow(_786, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _819 = _784;
    _820 = _785;
    _821 = _786;
  }
  if (!(_etcParams.y < 1.0f)) {
    _826 = float((uint)_330);
    if (!(_826 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_826 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _835 = _819;
        _836 = _820;
        _837 = _821;
      } else {
        _835 = 0.0f;
        _836 = 0.0f;
        _837 = 0.0f;
      }
    } else {
      _835 = 0.0f;
      _836 = 0.0f;
      _837 = 0.0f;
    }
  } else {
    _835 = _819;
    _836 = _820;
    _837 = _821;
  }
  SV_Target.x = _835;
  SV_Target.y = _836;
  SV_Target.z = _837;
  SV_Target.w = _344;
  return SV_Target;
}