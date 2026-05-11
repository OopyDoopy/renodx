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
  float _57;
  float _58;
  float _59;
  float _81;
  float _82;
  float _83;
  float _84;
  float _85;
  float _86;
  float _138;
  float _139;
  float _557;
  float _558;
  float _559;
  float _573;
  float _778;
  float _779;
  float _780;
  float _873;
  float _874;
  float _875;
  float _995;
  float _996;
  float _997;
  float _1018;
  float _1019;
  float _1020;
  float _1053;
  float _1054;
  float _1055;
  float _1069;
  float _1070;
  float _1071;
  int _96;
  int _104;
  int _155;
  float4 _157;
  float _159;
  float _160;
  float _166;
  float _168;
  float _169;
  float _205;
  float _209;
  float _215;
  float _216;
  float _232;
  float _236;
  float _237;
  int _240;
  float _245;
  float _247;
  float _248;
  float _249;
  float _253;
  float _257;
  float _261;
  float _264;
  float _268;
  float _274;
  float _275;
  float _287;
  float _291;
  float _292;
  float _293;
  float _294;
  float _295;
  float _296;
  float _299;
  float _302;
  float _305;
  float _307;
  float _308;
  float _309;
  float _310;
  float _319;
  float _335;
  float _339;
  float _342;
  float _350;
  float _351;
  float _357;
  float _359;
  float _365;
  float _366;
  float _374;
  float _375;
  float _376;
  float _384;
  float _385;
  uint _411;
  uint _412;
  uint4 _414;
  float4 _417;
  float _435;
  float _436;
  float _437;
  float _439;
  float _440;
  float _441;
  float _442;
  float _445;
  float _446;
  float _449;
  float _450;
  float _454;
  float _456;
  float _457;
  float _458;
  float _459;
  float _461;
  float _464;
  float _465;
  float _466;
  float _467;
  float _476;
  float _480;
  float _484;
  float _486;
  float _487;
  float _488;
  float _489;
  float _498;
  float _515;
  float _522;
  float _525;
  float _541;
  float _542;
  float _549;
  uint _560;
  float _582;
  float _631;
  float _632;
  float _633;
  float _635;
  float _642;
  float _643;
  float _644;
  float _663;
  float _664;
  float _665;
  float _666;
  float _667;
  float _668;
  float _669;
  float _670;
  float _671;
  float _717;
  float _718;
  float _719;
  float _720;
  float _721;
  float _722;
  float _723;
  float _740;
  float _741;
  float _742;
  float _743;
  float _749;
  float _752;
  float _759;
  float _760;
  float _761;
  float _790;
  float _815;
  float _816;
  float _817;
  float _836;
  float _837;
  float _838;
  float _844;
  float _848;
  float _849;
  float _850;
  float _851;
  float _856;
  float _881;
  float _885;
  float _886;
  float _887;
  float _888;
  int _929;
  float _984;
  float _1008;
  float _1009;
  float _1013;
  float _1060;
  float _1081;
  float _1082;
  float _1083;
  float _25[36];
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_27.x, _27.y);
  _44 = (((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_27.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_27.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255;
  _47 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _57 = (pow(_47.x, 0.012683313339948654f));
  _58 = (pow(_47.y, 0.012683313339948654f));
  _59 = (pow(_47.z, 0.012683313339948654f));
  _81 = exp2(log2(max(0.0f, (_57 + -0.8359375f)) / (18.8515625f - (_57 * 18.6875f))) * 6.277394771575928f);
  _82 = exp2(log2(max(0.0f, (_58 + -0.8359375f)) / (18.8515625f - (_58 * 18.6875f))) * 6.277394771575928f);
  _83 = exp2(log2(max(0.0f, (_59 + -0.8359375f)) / (18.8515625f - (_59 * 18.6875f))) * 6.277394771575928f);
  _84 = _81 * 10000.0f;
  _85 = _82 * 10000.0f;
  _86 = _83 * 10000.0f;
  if (_44 == _renderPassInteraction) {
    _96 = WaveReadLaneFirst(_materialIndex);
    _104 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))].BindlessParameters_PostProcessInteraction_CD._lineTex);
    _138 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_104 < (uint)65000), _104, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f))))).x);
    _139 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x)))));
  } else {
    _138 = 0.0f;
    _139 = 0.0f;
  }
  if (_44 == _renderPassInteraction) {
    _155 = int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y);
    _157 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _155, 0));
    _159 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    _160 = TEXCOORD.x - _159;
    _166 = (_160 * 2.0f) + -1.0f;
    _168 = 1.0f - (TEXCOORD.y * 2.0f);
    _169 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_160 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), _155, 0)))).x));
    _205 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _169, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _209 = _159 + TEXCOORD.x;
    _215 = (_209 * 2.0f) + -1.0f;
    _216 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_209 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), _155, 0)))).x));
    _232 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _216, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _215))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _236 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    _237 = TEXCOORD.y - _236;
    _240 = int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x);
    _245 = (TEXCOORD.x * 2.0f) + -1.0f;
    _247 = 1.0f - (_237 * 2.0f);
    _248 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(_240, int(_237 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x));
    _249 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _245;
    _253 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _245;
    _257 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _245;
    _261 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _245;
    _264 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _248, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _247, _261)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _268 = _236 + TEXCOORD.y;
    _274 = 1.0f - (_268 * 2.0f);
    _275 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(_240, int(_268 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x));
    _287 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _275, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _274, _261)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _291 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _275, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _274, _249)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _287) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _248, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _247, _249)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _264);
    _292 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _275, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _274, _253)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _287) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _248, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _247, _253)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _264);
    _293 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _275, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _274, _257)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _287) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _248, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _247, _257)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _264);
    _294 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _216, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _215))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _232) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _169, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _205);
    _295 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _216, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _215))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _232) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _169, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _205);
    _296 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _216, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _215))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _232) - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _169, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _168, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _166))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _205);
    _299 = (_293 * _295) - (_292 * _296);
    _302 = (_291 * _296) - (_293 * _294);
    _305 = (_292 * _294) - (_291 * _295);
    _307 = rsqrt(dot(float3(_299, _302, _305), float3(_299, _302, _305)));
    _308 = _299 * _307;
    _309 = _302 * _307;
    _310 = _305 * _307;
    _319 = saturate(dot(float3(_308, _309, _310), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
    _335 = frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.4000000059604645f);
    _339 = abs((1.9989999532699585f - _319) - (_335 * 2.5f));
    _342 = saturate(1.0f - (_339 * 5.0f));
    _350 = saturate((saturate(((2.0f - _319) * _138) + exp2(log2(1.0f - _319) * 4.0f)) * _157.x) * (_342 - (_342 * _335)));
    _351 = _350 * _139;
    _357 = _157.x * 50.0f;
    _359 = saturate(_357 * _357);
    _365 = saturate(1.0f - (_339 * 1.25f)) * _359;
    _366 = _365 * 20.0f;
    _374 = (_exposure2.x * 5000.0f) * (lerp(_351, _350, 2.0f));
    _375 = (_359 - (_359 * _139)) * _exposure2.x;
    _376 = _375 * 2.0f;
    _384 = (_375 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_308, _309, _310), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f));
    _385 = _366 + 10000.0f;
    _557 = ((((_374 - (_365 * _84)) + _384) + (_385 * _81)) + ((1.0f - (_366 * _81)) * _376));
    _558 = ((((_374 - (_365 * _85)) + _384) + (_385 * _82)) + ((1.0f - (_366 * _82)) * _376));
    _559 = ((((_374 - (_365 * _86)) + _384) + (_385 * _83)) + ((1.0f - (_366 * _83)) * _376));
  } else {
    if (_44 == _renderPassDetectObjective) {
      _411 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _412 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _414 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_411, _412, 0));
      _417 = __3__36__0__0__g_gbufferNormal.Load(int3(_411, _412, 0));
      _435 = (saturate(_417.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _436 = (saturate(_417.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _437 = (saturate(_417.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _439 = rsqrt(dot(float3(_435, _436, _437), float3(_435, _436, _437)));
      _440 = _439 * _435;
      _441 = _439 * _436;
      _442 = _437 * _439;
      _445 = (float((uint)((uint)(((uint)((uint)(_414.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _446 = (float((uint)((uint)(_414.w & 255))) * 0.007843137718737125f) + -1.0f;
      _449 = (_445 + _446) * 0.5f;
      _450 = (_445 - _446) * 0.5f;
      _454 = (1.0f - abs(_449)) - abs(_450);
      _456 = rsqrt(dot(float3(_449, _450, _454), float3(_449, _450, _454)));
      _457 = _456 * _449;
      _458 = _456 * _450;
      _459 = _456 * _454;
      _461 = select((_442 >= 0.0f), 1.0f, -1.0f);
      _464 = -0.0f - (1.0f / (_461 + _442));
      _465 = _441 * _464;
      _466 = _465 * _440;
      _467 = _461 * _440;
      _476 = mad(_459, _440, mad(_458, _466, ((((_467 * _440) * _464) + 1.0f) * _457)));
      _480 = mad(_459, _441, mad(_458, (_461 + (_465 * _441)), ((_457 * _461) * _466)));
      _484 = mad(_459, _442, mad(_458, (-0.0f - _441), (-0.0f - (_467 * _457))));
      _486 = rsqrt(dot(float3(_476, _480, _484), float3(_476, _480, _484)));
      _487 = _486 * _476;
      _488 = _486 * _480;
      _489 = _486 * _484;
      _498 = saturate(dot(float3(_487, _488, _489), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _515 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) - _interactionTime;
      _522 = abs((1.9989999532699585f - _498) - ((pow(_515, 0.5f)) * 2.25f));
      _525 = saturate(1.0f - (_522 * 40.0f));
      _541 = (saturate(exp2(log2(1.0f - abs(dot(float3(_487, _488, _489), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 0.800000011920929f)) * _139) * saturate(1.0f - (_522 * 3.3333332538604736f));
      _542 = _exposure2.x * 25.0f;
      _549 = _542 * saturate((saturate(((2.0f - _498) * _138) + exp2(log2(1.0f - _498) * 4.0f)) * _139) * (_525 - ((_515 * 0.8999999761581421f) * _525)));
      _557 = ((_549 + _84) + ((_542 - _84) * _541));
      _558 = ((_549 + _85) + ((_542 - _85) * _541));
      _559 = ((_549 + _86) + ((_542 - _86) * _541));
    } else {
      _557 = _84;
      _558 = _85;
      _559 = _86;
    }
  }
  _560 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _573 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _560, 0)))).x) & 127))) + 0.5f);
  } else {
    _573 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_557, _558, _559));
    _995 = output_color.x;
    _996 = output_color.y;
    _997 = output_color.z;
  } else {
    _995 = _557;
    _996 = _558;
    _997 = _559;
  }
  if (_etcParams.y > 1.0f) {
    _1008 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1009 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1013 = saturate(1.0f - (dot(float2(_1008, _1009), float2(_1008, _1009)) * saturate(_etcParams.y + -1.0f)));
    _1018 = (_1013 * _995);
    _1019 = (_1013 * _996);
    _1020 = (_1013 * _997);
  } else {
    _1018 = _995;
    _1019 = _996;
    _1020 = _997;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1053 = select((_1018 <= 0.0031308000907301903f), (_1018 * 12.920000076293945f), (((pow(_1018, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1054 = select((_1019 <= 0.0031308000907301903f), (_1019 * 12.920000076293945f), (((pow(_1019, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1055 = select((_1020 <= 0.0031308000907301903f), (_1020 * 12.920000076293945f), (((pow(_1020, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1053 = _1018;
    _1054 = _1019;
    _1055 = _1020;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1060 = float((uint)_560);
    if (!(_1060 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1060 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1069 = _1053;
        _1070 = _1054;
        _1071 = _1055;
      } else {
        _1069 = 0.0f;
        _1070 = 0.0f;
        _1071 = 0.0f;
      }
    } else {
      _1069 = 0.0f;
      _1070 = 0.0f;
      _1071 = 0.0f;
    }
  } else {
    _1069 = _1053;
    _1070 = _1054;
    _1071 = _1055;
  }
  _1081 = exp2(log2(_1069 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1082 = exp2(log2(_1070 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1083 = exp2(log2(_1071 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1081 * 18.6875f) + 1.0f)) * ((_1081 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1082 * 18.6875f) + 1.0f)) * ((_1082 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1083 * 18.6875f) + 1.0f)) * ((_1083 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _573;
  return SV_Target;
}