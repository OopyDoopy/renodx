#include "../tonemap.hlsli"

struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessAbyssEnter_CD {
  PostProcessAbyssEnter_CDStruct BindlessParameters_PostProcessAbyssEnter_CD;
};

typedef BindlessParameters_PostProcessAbyssEnter_CD BindlessParameters_PostProcessAbyssEnter_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssEnter_CD_t> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

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
  float _29;
  float _35;
  float _36;
  float _37;
  uint2 _39;
  int _56;
  float _68;
  float _233;
  float _234;
  float _235;
  float _282;
  float _283;
  float _284;
  float _477;
  float _478;
  float _479;
  float _480;
  float _494;
  float _699;
  float _700;
  float _701;
  float _794;
  float _795;
  float _796;
  float _916;
  float _917;
  float _918;
  float _936;
  float _937;
  float _938;
  float _971;
  float _972;
  float _973;
  float _987;
  float _988;
  float _989;
  int _69;
  int _77;
  float _83;
  float _84;
  float4 _87;
  float _89;
  float4 _91;
  float _93;
  float4 _94;
  float _96;
  float4 _97;
  float4 _100;
  float _102;
  float4 _104;
  float _106;
  float4 _107;
  float _109;
  float4 _110;
  float4 _113;
  float _139;
  float _160;
  float _164;
  float _168;
  float _172;
  float _175;
  float _176;
  float _177;
  float _178;
  float _182;
  float _183;
  float _199;
  float _208;
  float _209;
  float _225;
  float _239;
  float _240;
  float _252;
  float _261;
  float _262;
  float _274;
  float _287;
  float _290;
  float _293;
  float _295;
  float _317;
  int _321;
  float _329;
  float _330;
  int _338;
  int _346;
  float _349;
  float _385;
  float _386;
  float _389;
  float _390;
  float _391;
  float _393;
  float _394;
  float _395;
  int _396;
  int _404;
  float _406;
  float _408;
  float _413;
  float4 _420;
  float _427;
  float _429;
  float4 _430;
  float4 _436;
  float _441;
  float _442;
  float _451;
  float _452;
  float _453;
  float _454;
  float _471;
  uint _481;
  float _503;
  float _552;
  float _553;
  float _554;
  float _556;
  float _563;
  float _564;
  float _565;
  float _584;
  float _585;
  float _586;
  float _587;
  float _588;
  float _589;
  float _590;
  float _591;
  float _592;
  float _638;
  float _639;
  float _640;
  float _641;
  float _642;
  float _643;
  float _644;
  float _661;
  float _662;
  float _663;
  float _664;
  float _670;
  float _673;
  float _680;
  float _681;
  float _682;
  float _711;
  float _736;
  float _737;
  float _738;
  float _757;
  float _758;
  float _759;
  float _765;
  float _769;
  float _770;
  float _771;
  float _772;
  float _777;
  float _802;
  float _806;
  float _807;
  float _808;
  float _809;
  int _850;
  float _905;
  float _926;
  float _927;
  float _931;
  float _978;
  float _999;
  float _1000;
  float _1001;
  float _23[36];
  _29 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  _35 = (TEXCOORD.x * 2.0f) + -1.0f;
  _36 = TEXCOORD.y * 2.0f;
  _37 = 1.0f - _36;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_39.x, _39.y);
  _56 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_39.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_39.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255;
  if ((_56 == _renderPassSelfPlayer) | ((_56 == 70) || (_56 == _renderPassTest))) {
    _68 = 1.0f;
  } else {
    _68 = 0.0f;
  }
  _69 = WaveReadLaneFirst(_materialIndex);
  _77 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._effectType);
  if (_77 == 0) {
    _83 = 1.0f / _srcTargetSizeAndInv.x;
    _84 = 1.0f / _srcTargetSizeAndInv.y;
    _87 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _89 = _83 * 2.0f;
    _91 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _89), TEXCOORD.y));
    _93 = TEXCOORD.x - _83;
    _94 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_93, TEXCOORD.y));
    _96 = _83 + TEXCOORD.x;
    _97 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_96, TEXCOORD.y));
    _100 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_89 + TEXCOORD.x), TEXCOORD.y));
    _102 = _84 * 2.0f;
    _104 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _102)));
    _106 = TEXCOORD.y - _84;
    _107 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _106));
    _109 = _84 + TEXCOORD.y;
    _110 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _109));
    _113 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_102 + TEXCOORD.y)));
    _139 = max(1.0000000116860974e-07f, _87.x);
    _160 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _35;
    _164 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _35;
    _168 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _35;
    _172 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _35;
    _175 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _139, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _37, _172)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
    _176 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _139, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _37, _160)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _175;
    _177 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _139, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _37, _164)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _175;
    _178 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _139, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _37, _168)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _175;
    if (abs(((_94.x * _91.x) / ((_91.x * 2.0f) - _94.x)) - _87.x) < abs(((_100.x * _97.x) / ((_100.x * 2.0f) - _97.x)) - _87.x)) {
      _182 = (_93 * 2.0f) + -1.0f;
      _183 = max(1.0000000116860974e-07f, _94.x);
      _199 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _183, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _182))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
      _233 = (_176 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _183, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _182))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _199));
      _234 = (_177 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _183, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _182))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _199));
      _235 = (_178 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _183, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _182))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _199));
    } else {
      _208 = (_96 * 2.0f) + -1.0f;
      _209 = max(1.0000000116860974e-07f, _97.x);
      _225 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _209, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _208))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
      _233 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _209, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _208))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _225) - _176);
      _234 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _209, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _208))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _225) - _177);
      _235 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _209, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _208))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _225) - _178);
    }
    if (abs(((_107.x * _104.x) / ((_104.x * 2.0f) - _107.x)) - _87.x) < abs(((_113.x * _110.x) / ((_113.x * 2.0f) - _110.x)) - _87.x)) {
      _239 = 1.0f - (_106 * 2.0f);
      _240 = max(1.0000000116860974e-07f, _107.x);
      _252 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _240, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _239, _172)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
      _282 = (_176 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _240, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _239, _160)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _252));
      _283 = (_177 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _240, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _239, _164)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _252));
      _284 = (_178 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _240, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _239, _168)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _252));
    } else {
      _261 = 1.0f - (_109 * 2.0f);
      _262 = max(1.0000000116860974e-07f, _110.x);
      _274 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _261, _172)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
      _282 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _261, _160)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _274) - _176);
      _283 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _261, _164)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _274) - _177);
      _284 = (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _262, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _261, _168)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _274) - _178);
    }
    _287 = (_284 * _234) - (_283 * _235);
    _290 = (_282 * _235) - (_284 * _233);
    _293 = (_283 * _233) - (_282 * _234);
    _295 = rsqrt(dot(float3(_287, _290, _293), float3(_287, _290, _293)));
    _317 = exp2(log2(1.0f - abs(dot(float3((_287 * _295), (_290 * _295), (_295 * _293)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f);
    _321 = WaveReadLaneFirst(_materialIndex);
    _329 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._startFade);
    _330 = _329 * _68;
    _477 = (saturate(_317 * 0.44999998807907104f) + _330);
    _478 = (saturate(_317 * 0.6499999761581421f) + _330);
    _479 = (saturate(_317 * 0.949999988079071f) + _330);
    _480 = _68;
  } else {
    _338 = WaveReadLaneFirst(_materialIndex);
    _346 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._effectType);
    if (_346 == 1) {
      _349 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
      _385 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _349, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _35))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
      _386 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _349, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _35))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _385;
      _389 = -0.0f - _386;
      _390 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _349, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _35))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _385);
      _391 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _349, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _37, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _35))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _385);
      _393 = rsqrt(dot(float3(_389, _390, _391), float3(_389, _390, _391)));
      _394 = _393 * _390;
      _395 = _393 * _391;
      _396 = WaveReadLaneFirst(_materialIndex);
      _404 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_396 < (uint)170000), _396, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._noiseTex);
      _406 = (_386 * -2.0f) * _393;
      _408 = _395 * 2.0f;
      _413 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f;
      _420 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_413 + _406), (_413 + _408)));
      _427 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f;
      _429 = _427 + (_394 * 2.0f);
      _430 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_427 + _408), _429));
      _436 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_429, (_427 + _406)));
      _441 = abs(_394);
      _442 = abs(_395);
      _451 = (_441 * (_420.x - _430.x)) + _430.x;
      _452 = (_441 * (_420.y - _430.y)) + _430.y;
      _453 = (_441 * (_420.z - _430.z)) + _430.z;
      _454 = (_441 * (_420.w - _430.w)) + _430.w;
      _471 = _68 * _29;
      _477 = (saturate(lerp(_451, _436.x, _442)) * _471);
      _478 = (saturate(lerp(_452, _436.y, _442)) * _471);
      _479 = (saturate(lerp(_453, _436.z, _442)) * _471);
      _480 = (saturate(lerp(_454, _436.w, _442)) * _29);
    } else {
      _477 = 0.0f;
      _478 = 0.0f;
      _479 = 0.0f;
      _480 = 0.0f;
    }
  }
  _481 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _494 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _481, 0)))).x) & 127))) + 0.5f);
  } else {
    _494 = _480;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_477, _478, _479));
    _916 = output_color.x;
    _917 = output_color.y;
    _918 = output_color.z;
  } else {
    _916 = _477;
    _917 = _478;
    _918 = _479;
  }
  if (_etcParams.y > 1.0f) {
    _926 = abs(_35);
    _927 = abs(_36 + -1.0f);
    _931 = saturate(1.0f - (dot(float2(_926, _927), float2(_926, _927)) * saturate(_etcParams.y + -1.0f)));
    _936 = (_931 * _916);
    _937 = (_931 * _917);
    _938 = (_931 * _918);
  } else {
    _936 = _916;
    _937 = _917;
    _938 = _918;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _971 = select((_936 <= 0.0031308000907301903f), (_936 * 12.920000076293945f), (((pow(_936, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _972 = select((_937 <= 0.0031308000907301903f), (_937 * 12.920000076293945f), (((pow(_937, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _973 = select((_938 <= 0.0031308000907301903f), (_938 * 12.920000076293945f), (((pow(_938, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _971 = _936;
    _972 = _937;
    _973 = _938;
  }
  if (!(_etcParams.y < 1.0f)) {
    _978 = float((uint)_481);
    if (!(_978 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_978 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _987 = _971;
        _988 = _972;
        _989 = _973;
      } else {
        _987 = 0.0f;
        _988 = 0.0f;
        _989 = 0.0f;
      }
    } else {
      _987 = 0.0f;
      _988 = 0.0f;
      _989 = 0.0f;
    }
  } else {
    _987 = _971;
    _988 = _972;
    _989 = _973;
  }
  _999 = exp2(log2(_987 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1000 = exp2(log2(_988 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1001 = exp2(log2(_989 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_999 * 18.6875f) + 1.0f)) * ((_999 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1000 * 18.6875f) + 1.0f)) * ((_1000 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1001 * 18.6875f) + 1.0f)) * ((_1001 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _494;
  return SV_Target;
}