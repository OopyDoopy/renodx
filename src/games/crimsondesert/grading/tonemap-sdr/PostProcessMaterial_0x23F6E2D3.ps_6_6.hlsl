#include "../tonemap.hlsli"

struct PostProcessInteraction_CDStruct {
  uint _lineTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

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

struct BindlessParameters_PostProcessInteraction_CD {
  PostProcessInteraction_CDStruct BindlessParameters_PostProcessInteraction_CD;
};

typedef BindlessParameters_PostProcessInteraction_CD BindlessParameters_PostProcessInteraction_CD_t;
ConstantBuffer<BindlessParameters_PostProcessInteraction_CD_t> BindlessParameters_PostProcessInteraction_CD[] : register(b0, space100);

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
  uint2 _27;
  int _44;
  float4 _47;
  float _102;
  float _103;
  float _520;
  float _521;
  float _522;
  float _536;
  float _741;
  float _742;
  float _743;
  float _836;
  float _837;
  float _838;
  float _958;
  float _959;
  float _960;
  float _981;
  float _982;
  float _983;
  float _1016;
  float _1017;
  float _1018;
  float _1032;
  float _1033;
  float _1034;
  int _60;
  int _68;
  int _119;
  float4 _121;
  float _123;
  float _124;
  float _130;
  float _132;
  float _133;
  float _169;
  float _173;
  float _179;
  float _180;
  float _196;
  float _200;
  float _201;
  int _204;
  float _209;
  float _211;
  float _212;
  float _213;
  float _217;
  float _221;
  float _225;
  float _228;
  float _232;
  float _238;
  float _239;
  float _251;
  float _255;
  float _256;
  float _257;
  float _258;
  float _259;
  float _260;
  float _263;
  float _266;
  float _269;
  float _271;
  float _272;
  float _273;
  float _274;
  float _283;
  float _299;
  float _303;
  float _306;
  float _314;
  float _315;
  float _321;
  float _323;
  float _329;
  float _330;
  float _331;
  float _332;
  float _333;
  float _338;
  float _339;
  float _340;
  float _348;
  uint _374;
  uint _375;
  uint4 _377;
  float4 _380;
  float _398;
  float _399;
  float _400;
  float _402;
  float _403;
  float _404;
  float _405;
  float _408;
  float _409;
  float _412;
  float _413;
  float _417;
  float _419;
  float _420;
  float _421;
  float _422;
  float _424;
  float _427;
  float _428;
  float _429;
  float _430;
  float _439;
  float _443;
  float _447;
  float _449;
  float _450;
  float _451;
  float _452;
  float _461;
  float _478;
  float _485;
  float _488;
  float _504;
  float _505;
  float _512;
  uint _523;
  float _545;
  float _594;
  float _595;
  float _596;
  float _598;
  float _605;
  float _606;
  float _607;
  float _626;
  float _627;
  float _628;
  float _629;
  float _630;
  float _631;
  float _632;
  float _633;
  float _634;
  float _680;
  float _681;
  float _682;
  float _683;
  float _684;
  float _685;
  float _686;
  float _703;
  float _704;
  float _705;
  float _706;
  float _712;
  float _715;
  float _722;
  float _723;
  float _724;
  float _753;
  float _778;
  float _779;
  float _780;
  float _799;
  float _800;
  float _801;
  float _807;
  float _811;
  float _812;
  float _813;
  float _814;
  float _819;
  float _844;
  float _848;
  float _849;
  float _850;
  float _851;
  int _892;
  float _947;
  float _971;
  float _972;
  float _976;
  float _1023;
  float _25[36];
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_27.x, _27.y);
  _44 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_27.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_27.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255;
  _47 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  if (_44 == _renderPassInteraction) {
    _60 = WaveReadLaneFirst(_materialIndex);
    _68 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))].BindlessParameters_PostProcessInteraction_CD._lineTex);
    _102 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_68 < (uint)65000), _68, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f))))).x);
    _103 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x)))));
  } else {
    _102 = 0.0f;
    _103 = 0.0f;
  }
  if (_44 == _renderPassInteraction) {
    _119 = int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y);
    _121 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _119, 0));
    _123 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    _124 = TEXCOORD.x - _123;
    _130 = (_124 * 2.0f) + -1.0f;
    _132 = 1.0f - (TEXCOORD.y * 2.0f);
    _133 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_124 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), _119, 0)))).x));
    _169 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _133, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _130))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _173 = _123 + TEXCOORD.x;
    _179 = (_173 * 2.0f) + -1.0f;
    _180 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_173 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), _119, 0)))).x));
    _196 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _180, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _179))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _200 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    _201 = TEXCOORD.y - _200;
    _204 = int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x);
    _209 = (TEXCOORD.x * 2.0f) + -1.0f;
    _211 = 1.0f - (_201 * 2.0f);
    _212 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(_204, int(_201 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x));
    _213 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _209;
    _217 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _209;
    _221 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _209;
    _225 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _209;
    _228 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _212, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _211, _225)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _232 = _200 + TEXCOORD.y;
    _238 = 1.0f - (_232 * 2.0f);
    _239 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(_204, int(_232 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x));
    _251 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _239, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _238, _225)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _255 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _239, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _238, _213)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _251) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _212, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _211, _213)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _228);
    _256 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _239, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _238, _217)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _251) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _212, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _211, _217)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _228);
    _257 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _239, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _238, _221)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _251) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _212, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _211, _221)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _228);
    _258 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _180, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _179))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _196) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _133, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _130))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _169);
    _259 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _180, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _179))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _196) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _133, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _130))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _169);
    _260 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _180, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _179))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _196) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _133, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _132, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _130))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _169);
    _263 = (_257 * _259) - (_256 * _260);
    _266 = (_255 * _260) - (_257 * _258);
    _269 = (_256 * _258) - (_255 * _259);
    _271 = rsqrt(dot(float3(_263, _266, _269), float3(_263, _266, _269)));
    _272 = _263 * _271;
    _273 = _266 * _271;
    _274 = _269 * _271;
    _283 = saturate(dot(float3(_272, _273, _274), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
    _299 = frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.4000000059604645f);
    _303 = abs((1.9989999532699585f - _283) - (_299 * 2.5f));
    _306 = saturate(1.0f - (_303 * 5.0f));
    _314 = saturate((saturate(((2.0f - _283) * _102) + exp2(log2(1.0f - _283) * 4.0f)) * _121.x) * (_306 - (_306 * _299)));
    _315 = _314 * _103;
    _321 = _121.x * 50.0f;
    _323 = saturate(_321 * _321);
    _329 = saturate(1.0f - (_303 * 1.25f)) * _323;
    _330 = _329 * 0.0020000000949949026f;
    _331 = _330 * _47.x;
    _332 = _330 * _47.y;
    _333 = _330 * _47.z;
    _338 = (_exposure2.x * 5000.0f) * (lerp(_315, _314, 2.0f));
    _339 = (_323 - (_323 * _103)) * _exposure2.x;
    _340 = _339 * 2.0f;
    _348 = (_339 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_272, _273, _274), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f));
    _520 = (((((_338 + _47.x) - (_329 * _47.x)) + _331) + _348) + ((1.0f - _331) * _340));
    _521 = (((((_338 + _47.y) - (_329 * _47.y)) + _332) + _348) + ((1.0f - _332) * _340));
    _522 = (((((_47.z - (_329 * _47.z)) + _338) + _333) + _348) + ((1.0f - _333) * _340));
  } else {
    if (_44 == _renderPassDetectObjective) {
      _374 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _375 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _377 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_374, _375, 0));
      _380 = __3__36__0__0__g_gbufferNormal.Load(int3(_374, _375, 0));
      _398 = (saturate(_380.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _399 = (saturate(_380.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _400 = (saturate(_380.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _402 = rsqrt(dot(float3(_398, _399, _400), float3(_398, _399, _400)));
      _403 = _402 * _398;
      _404 = _402 * _399;
      _405 = _400 * _402;
      _408 = (float((uint)((uint)(((uint)((uint)(_377.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _409 = (float((uint)((uint)(_377.w & 255))) * 0.007843137718737125f) + -1.0f;
      _412 = (_408 + _409) * 0.5f;
      _413 = (_408 - _409) * 0.5f;
      _417 = (1.0f - abs(_412)) - abs(_413);
      _419 = rsqrt(dot(float3(_412, _413, _417), float3(_412, _413, _417)));
      _420 = _419 * _412;
      _421 = _419 * _413;
      _422 = _419 * _417;
      _424 = select((_405 >= 0.0f), 1.0f, -1.0f);
      _427 = -0.0f - (1.0f / (_424 + _405));
      _428 = _404 * _427;
      _429 = _428 * _403;
      _430 = _424 * _403;
      _439 = mad(_422, _403, mad(_421, _429, ((((_430 * _403) * _427) + 1.0f) * _420)));
      _443 = mad(_422, _404, mad(_421, (_424 + (_428 * _404)), ((_420 * _424) * _429)));
      _447 = mad(_422, _405, mad(_421, (-0.0f - _404), (-0.0f - (_430 * _420))));
      _449 = rsqrt(dot(float3(_439, _443, _447), float3(_439, _443, _447)));
      _450 = _449 * _439;
      _451 = _449 * _443;
      _452 = _449 * _447;
      _461 = saturate(dot(float3(_450, _451, _452), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _478 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) - _interactionTime;
      _485 = abs((1.9989999532699585f - _461) - ((pow(_478, 0.5f)) * 2.25f));
      _488 = saturate(1.0f - (_485 * 40.0f));
      _504 = (saturate(exp2(log2(1.0f - abs(dot(float3(_450, _451, _452), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 0.800000011920929f)) * _103) * saturate(1.0f - (_485 * 3.3333332538604736f));
      _505 = _exposure2.x * 25.0f;
      _512 = _505 * saturate((saturate(((2.0f - _461) * _102) + exp2(log2(1.0f - _461) * 4.0f)) * _103) * (_488 - ((_478 * 0.8999999761581421f) * _488)));
      _520 = ((_512 + _47.x) + ((_505 - _47.x) * _504));
      _521 = ((_512 + _47.y) + ((_505 - _47.y) * _504));
      _522 = ((_512 + _47.z) + ((_505 - _47.z) * _504));
    } else {
      _520 = _47.x;
      _521 = _47.y;
      _522 = _47.z;
    }
  }
  _523 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _536 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _523, 0)))).x) & 127))) + 0.5f);
  } else {
    _536 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_520, _521, _522));
    _958 = output_color.x;
    _959 = output_color.y;
    _960 = output_color.z;
  } else {
    _958 = _520;
    _959 = _521;
    _960 = _522;
  }
  if (_etcParams.y > 1.0f) {
    _971 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _972 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _976 = saturate(1.0f - (dot(float2(_971, _972), float2(_971, _972)) * saturate(_etcParams.y + -1.0f)));
    _981 = (_976 * _958);
    _982 = (_976 * _959);
    _983 = (_976 * _960);
  } else {
    _981 = _958;
    _982 = _959;
    _983 = _960;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1016 = select((_981 <= 0.0031308000907301903f), (_981 * 12.920000076293945f), (((pow(_981, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1017 = select((_982 <= 0.0031308000907301903f), (_982 * 12.920000076293945f), (((pow(_982, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1018 = select((_983 <= 0.0031308000907301903f), (_983 * 12.920000076293945f), (((pow(_983, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1016 = _981;
    _1017 = _982;
    _1018 = _983;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1023 = float((uint)_523);
    if (!(_1023 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1023 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1032 = _1016;
        _1033 = _1017;
        _1034 = _1018;
      } else {
        _1032 = 0.0f;
        _1033 = 0.0f;
        _1034 = 0.0f;
      }
    } else {
      _1032 = 0.0f;
      _1033 = 0.0f;
      _1034 = 0.0f;
    }
  } else {
    _1032 = _1016;
    _1033 = _1017;
    _1034 = _1018;
  }
  SV_Target.x = _1032;
  SV_Target.y = _1033;
  SV_Target.z = _1034;
  SV_Target.w = _536;
  return SV_Target;
}