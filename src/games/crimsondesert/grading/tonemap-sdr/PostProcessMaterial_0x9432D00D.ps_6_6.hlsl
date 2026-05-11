#include "../tonemap.hlsli"

struct PostProcessLearningHolo_CDStruct {
  float _learningEffectRatio;
  uint _learningEffectColor;
  uint _noiseTexture;
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

struct BindlessParameters_PostProcessLearningHolo_CD {
  PostProcessLearningHolo_CDStruct BindlessParameters_PostProcessLearningHolo_CD;
};

typedef BindlessParameters_PostProcessLearningHolo_CD BindlessParameters_PostProcessLearningHolo_CD_t;
ConstantBuffer<BindlessParameters_PostProcessLearningHolo_CD_t> BindlessParameters_PostProcessLearningHolo_CD[] : register(b0, space100);

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
  float4 _29;
  int _33;
  float _41;
  int _46;
  int _54;
  uint2 _71;
  uint _86;
  int _88;
  float _96;
  float _97;
  float _99;
  float _100;
  float _101;
  float _112;
  float _113;
  float _411;
  float _412;
  float _413;
  float _414;
  float _422;
  float _423;
  float _424;
  float _425;
  float _426;
  float _427;
  float _428;
  float _451;
  float _656;
  float _657;
  float _658;
  float _751;
  float _752;
  float _753;
  float _873;
  float _874;
  float _875;
  float _896;
  float _897;
  float _898;
  float _931;
  float _932;
  float _933;
  float _947;
  float _948;
  float _949;
  float _115;
  float _116;
  float _117;
  float _118;
  float _120;
  float _121;
  float _122;
  float _123;
  bool _127;
  float _139;
  float _140;
  float _141;
  float _143;
  float _144;
  uint _150;
  uint _151;
  uint4 _153;
  float4 _156;
  float _174;
  float _175;
  float _176;
  float _178;
  float _179;
  float _180;
  float _181;
  float _184;
  float _185;
  float _188;
  float _189;
  float _193;
  float _195;
  float _196;
  float _197;
  float _198;
  float _200;
  float _203;
  float _204;
  float _205;
  float _206;
  float _215;
  float _219;
  float _223;
  float _225;
  float _229;
  float _230;
  int _231;
  int _239;
  float _242;
  float _245;
  float _247;
  float _277;
  float _292;
  float _316;
  float _318;
  float _319;
  float _323;
  float _324;
  float _325;
  float _330;
  float _334;
  float _335;
  float _336;
  float _358;
  float _365;
  float _369;
  float _375;
  float _378;
  float _397;
  float _417;
  float _435;
  float _436;
  float _437;
  uint _438;
  float _460;
  float _509;
  float _510;
  float _511;
  float _513;
  float _520;
  float _521;
  float _522;
  float _541;
  float _542;
  float _543;
  float _544;
  float _545;
  float _546;
  float _547;
  float _548;
  float _549;
  float _595;
  float _596;
  float _597;
  float _598;
  float _599;
  float _600;
  float _601;
  float _618;
  float _619;
  float _620;
  float _621;
  float _627;
  float _630;
  float _637;
  float _638;
  float _639;
  float _668;
  float _693;
  float _694;
  float _695;
  float _714;
  float _715;
  float _716;
  float _722;
  float _726;
  float _727;
  float _728;
  float _729;
  float _734;
  float _759;
  float _763;
  float _764;
  float _765;
  float _766;
  int _807;
  float _862;
  float _886;
  float _887;
  float _891;
  float _938;
  float _24[36];
  _29 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _33 = WaveReadLaneFirst(_materialIndex);
  _41 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectRatio);
  _46 = WaveReadLaneFirst(_materialIndex);
  _54 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._noiseTexture);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_71.x, _71.y);
  _86 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_71.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_71.y)))))) + 0.5f) * (((saturate(1.0f - _41) * 0.125f) * (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_54 < (uint)65000), _54, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_41 + (TEXCOORD.x * 5.0f)), (_41 + (TEXCOORD.y * 0.10000000149011612f)))))).y) * 2.0f) + -0.9960784316062927f)) + TEXCOORD.y)), 0));
  _88 = _86.x & 255;
  _96 = (float((uint)((uint)((uint)((uint)(_86.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _97 = (float((uint)((uint)(((uint)((uint)(_86.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _99 = 1.0f - abs(_96);
  _100 = abs(_97);
  _101 = _99 - _100;
  if (_101 < 0.0f) {
    _112 = (select((_96 >= 0.0f), 1.0f, -1.0f) * (1.0f - _100));
    _113 = (select((_97 >= 0.0f), 1.0f, -1.0f) * _99);
  } else {
    _112 = _96;
    _113 = _97;
  }
  _115 = rsqrt(dot(float3(_112, _113, _101), float3(_112, _113, _101)));
  _116 = _115 * _112;
  _117 = _115 * _113;
  _118 = _115 * _101;
  _120 = rsqrt(dot(float3(_116, _117, _118), float3(_116, _117, _118)));
  _121 = _120 * _116;
  _122 = _120 * _117;
  _123 = _120 * _118;
  _127 = (_41 > 0.0010000000474974513f);
  if (_88 == _renderPassLearning) {
    if (_127) {
      _139 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x);
      _140 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y);
      _141 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z);
      _143 = saturate(dot(float3(_121, _122, _123), float3(_139, _140, _141)));
      _144 = 1.0f - _143;
      _150 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _151 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _153 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_150, _151, 0));
      _156 = __3__36__0__0__g_gbufferNormal.Load(int3(_150, _151, 0));
      _174 = (saturate(_156.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _175 = (saturate(_156.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _176 = (saturate(_156.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _178 = rsqrt(dot(float3(_174, _175, _176), float3(_174, _175, _176)));
      _179 = _178 * _174;
      _180 = _178 * _175;
      _181 = _176 * _178;
      _184 = (float((uint)((uint)(((uint)((uint)(_153.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _185 = (float((uint)((uint)(_153.w & 255))) * 0.007843137718737125f) + -1.0f;
      _188 = (_184 + _185) * 0.5f;
      _189 = (_184 - _185) * 0.5f;
      _193 = (1.0f - abs(_188)) - abs(_189);
      _195 = rsqrt(dot(float3(_188, _189, _193), float3(_188, _189, _193)));
      _196 = _195 * _188;
      _197 = _195 * _189;
      _198 = _195 * _193;
      _200 = select((_181 >= 0.0f), 1.0f, -1.0f);
      _203 = -0.0f - (1.0f / (_200 + _181));
      _204 = _180 * _203;
      _205 = _204 * _179;
      _206 = _200 * _179;
      _215 = mad(_198, _179, mad(_197, _205, ((((_206 * _179) * _203) + 1.0f) * _196)));
      _219 = mad(_198, _180, mad(_197, (_200 + (_204 * _180)), ((_196 * _200) * _205)));
      _223 = mad(_198, _181, mad(_197, (-0.0f - _180), (-0.0f - (_206 * _196))));
      _225 = rsqrt(dot(float3(_215, _219, _223), float3(_215, _219, _223)));
      _229 = dot(float3((_225 * _215), (_225 * _219), (_225 * _223)), float3(_139, _140, _141));
      _230 = 1.0f - _229;
      _231 = WaveReadLaneFirst(_materialIndex);
      _239 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectColor);
      _242 = float((uint)((uint)(((uint)(_239) >> 16) & 255)));
      _245 = float((uint)((uint)(((uint)(_239) >> 8) & 255)));
      _247 = float((uint)((uint)(_239 & 255)));
      _277 = max(0.0010000000474974513f, _exposure0.x);
      _292 = saturate((abs(sin(((_123 * 2.0f) + (TEXCOORD.y * 500.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f))) * 3.0f) + -2.0f);
      _316 = _143 * _229;
      _318 = ((saturate((abs(sin(((_122 * 2.0f) + (TEXCOORD.y * 10.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_121 * 0.25f) + (TEXCOORD.y * 25.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.2000000476837158f))) * 3.0f) + -1.0f) - _292)) + _292) * (_316 * _316);
      _319 = dot(float3(_29.x, _29.y, _29.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _323 = _318 * (_319 + (select(((_242 * 0.003921568859368563f) < 0.040449999272823334f), (_242 * 0.0003035269910469651f), exp2(log2((_242 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _324 = _318 * (_319 + (select(((_245 * 0.003921568859368563f) < 0.040449999272823334f), (_245 * 0.0003035269910469651f), exp2(log2((_245 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _325 = _318 * (_319 + (select(((_247 * 0.003921568859368563f) < 0.040449999272823334f), (_247 * 0.0003035269910469651f), exp2(log2((_247 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _330 = exp2(log2(_230 * _144) * 3.0f) * 10.0f;
      _334 = (_330 * _323) + _323;
      _335 = (_330 * _324) + _324;
      _336 = (_330 * _325) + _325;
      _358 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x))) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))));
      _365 = (saturate(1.0f - abs((_41 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_358 < 1.0f) {
        _369 = log2(1.0f - _358);
        _375 = (pow(_358, 3.0f)) * exp2(_369 * 8.0f);
        _378 = (_375 * 600.0f) / _277;
        _411 = ((_378 + _334) * _365);
        _412 = ((_378 + _335) * _365);
        _413 = ((((_375 * 1800.0f) / _277) + _336) * _365);
        _414 = saturate(exp2(_369 * 3.0f) * _41);
      } else {
        if (_88 == _renderPassAimHighlight) {
          _397 = ((_230 - _144) * 0.4000000059604645f) + _144;
          _411 = ((((_397 * 0.800000011920929f) / _277) + _334) * _365);
          _412 = ((((_397 * 1.2000000476837158f) / _277) + _335) * _365);
          _413 = ((((_397 * 2.0f) / _277) + _336) * _365);
          _414 = _41;
        } else {
          _411 = _29.x;
          _412 = _29.y;
          _413 = _29.z;
          _414 = 0.0f;
        }
      }
      _417 = ((_41 * 3.0f) * _414) + 1.0f;
      _422 = (_417 * _29.x);
      _423 = (_417 * _29.y);
      _424 = (_417 * _29.z);
      _425 = _411;
      _426 = _412;
      _427 = _413;
      _428 = _414;
    } else {
      _422 = _29.x;
      _423 = _29.y;
      _424 = _29.z;
      _425 = _29.x;
      _426 = _29.y;
      _427 = _29.z;
      _428 = 0.0f;
    }
  } else {
    if (_127 && (_88 == _renderPassAimHighlight)) {
      _139 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x);
      _140 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y);
      _141 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z);
      _143 = saturate(dot(float3(_121, _122, _123), float3(_139, _140, _141)));
      _144 = 1.0f - _143;
      _150 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _151 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _153 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_150, _151, 0));
      _156 = __3__36__0__0__g_gbufferNormal.Load(int3(_150, _151, 0));
      _174 = (saturate(_156.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _175 = (saturate(_156.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _176 = (saturate(_156.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _178 = rsqrt(dot(float3(_174, _175, _176), float3(_174, _175, _176)));
      _179 = _178 * _174;
      _180 = _178 * _175;
      _181 = _176 * _178;
      _184 = (float((uint)((uint)(((uint)((uint)(_153.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _185 = (float((uint)((uint)(_153.w & 255))) * 0.007843137718737125f) + -1.0f;
      _188 = (_184 + _185) * 0.5f;
      _189 = (_184 - _185) * 0.5f;
      _193 = (1.0f - abs(_188)) - abs(_189);
      _195 = rsqrt(dot(float3(_188, _189, _193), float3(_188, _189, _193)));
      _196 = _195 * _188;
      _197 = _195 * _189;
      _198 = _195 * _193;
      _200 = select((_181 >= 0.0f), 1.0f, -1.0f);
      _203 = -0.0f - (1.0f / (_200 + _181));
      _204 = _180 * _203;
      _205 = _204 * _179;
      _206 = _200 * _179;
      _215 = mad(_198, _179, mad(_197, _205, ((((_206 * _179) * _203) + 1.0f) * _196)));
      _219 = mad(_198, _180, mad(_197, (_200 + (_204 * _180)), ((_196 * _200) * _205)));
      _223 = mad(_198, _181, mad(_197, (-0.0f - _180), (-0.0f - (_206 * _196))));
      _225 = rsqrt(dot(float3(_215, _219, _223), float3(_215, _219, _223)));
      _229 = dot(float3((_225 * _215), (_225 * _219), (_225 * _223)), float3(_139, _140, _141));
      _230 = 1.0f - _229;
      _231 = WaveReadLaneFirst(_materialIndex);
      _239 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectColor);
      _242 = float((uint)((uint)(((uint)(_239) >> 16) & 255)));
      _245 = float((uint)((uint)(((uint)(_239) >> 8) & 255)));
      _247 = float((uint)((uint)(_239 & 255)));
      _277 = max(0.0010000000474974513f, _exposure0.x);
      _292 = saturate((abs(sin(((_123 * 2.0f) + (TEXCOORD.y * 500.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f))) * 3.0f) + -2.0f);
      _316 = _143 * _229;
      _318 = ((saturate((abs(sin(((_122 * 2.0f) + (TEXCOORD.y * 10.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_121 * 0.25f) + (TEXCOORD.y * 25.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.2000000476837158f))) * 3.0f) + -1.0f) - _292)) + _292) * (_316 * _316);
      _319 = dot(float3(_29.x, _29.y, _29.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _323 = _318 * (_319 + (select(((_242 * 0.003921568859368563f) < 0.040449999272823334f), (_242 * 0.0003035269910469651f), exp2(log2((_242 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _324 = _318 * (_319 + (select(((_245 * 0.003921568859368563f) < 0.040449999272823334f), (_245 * 0.0003035269910469651f), exp2(log2((_245 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _325 = _318 * (_319 + (select(((_247 * 0.003921568859368563f) < 0.040449999272823334f), (_247 * 0.0003035269910469651f), exp2(log2((_247 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _277));
      _330 = exp2(log2(_230 * _144) * 3.0f) * 10.0f;
      _334 = (_330 * _323) + _323;
      _335 = (_330 * _324) + _324;
      _336 = (_330 * _325) + _325;
      _358 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x))) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))));
      _365 = (saturate(1.0f - abs((_41 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_358 < 1.0f) {
        _369 = log2(1.0f - _358);
        _375 = (pow(_358, 3.0f)) * exp2(_369 * 8.0f);
        _378 = (_375 * 600.0f) / _277;
        _411 = ((_378 + _334) * _365);
        _412 = ((_378 + _335) * _365);
        _413 = ((((_375 * 1800.0f) / _277) + _336) * _365);
        _414 = saturate(exp2(_369 * 3.0f) * _41);
      } else {
        if (_88 == _renderPassAimHighlight) {
          _397 = ((_230 - _144) * 0.4000000059604645f) + _144;
          _411 = ((((_397 * 0.800000011920929f) / _277) + _334) * _365);
          _412 = ((((_397 * 1.2000000476837158f) / _277) + _335) * _365);
          _413 = ((((_397 * 2.0f) / _277) + _336) * _365);
          _414 = _41;
        } else {
          _411 = _29.x;
          _412 = _29.y;
          _413 = _29.z;
          _414 = 0.0f;
        }
      }
      _417 = ((_41 * 3.0f) * _414) + 1.0f;
      _422 = (_417 * _29.x);
      _423 = (_417 * _29.y);
      _424 = (_417 * _29.z);
      _425 = _411;
      _426 = _412;
      _427 = _413;
      _428 = _414;
    } else {
      _422 = _29.x;
      _423 = _29.y;
      _424 = _29.z;
      _425 = _29.x;
      _426 = _29.y;
      _427 = _29.z;
      _428 = 0.0f;
    }
  }
  _435 = (_428 * (_425 - _422)) + _422;
  _436 = (_428 * (_426 - _423)) + _423;
  _437 = (_428 * (_427 - _424)) + _424;
  _438 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _451 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _438, 0)))).x) & 127))) + 0.5f);
  } else {
    _451 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_435, _436, _437));
    _873 = output_color.x;
    _874 = output_color.y;
    _875 = output_color.z;
  } else {
    _873 = _435;
    _874 = _436;
    _875 = _437;
  }
  if (_etcParams.y > 1.0f) {
    _886 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _887 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _891 = saturate(1.0f - (dot(float2(_886, _887), float2(_886, _887)) * saturate(_etcParams.y + -1.0f)));
    _896 = (_891 * _873);
    _897 = (_891 * _874);
    _898 = (_891 * _875);
  } else {
    _896 = _873;
    _897 = _874;
    _898 = _875;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _931 = select((_896 <= 0.0031308000907301903f), (_896 * 12.920000076293945f), (((pow(_896, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _932 = select((_897 <= 0.0031308000907301903f), (_897 * 12.920000076293945f), (((pow(_897, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _933 = select((_898 <= 0.0031308000907301903f), (_898 * 12.920000076293945f), (((pow(_898, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _931 = _896;
    _932 = _897;
    _933 = _898;
  }
  if (!(_etcParams.y < 1.0f)) {
    _938 = float((uint)_438);
    if (!(_938 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_938 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _947 = _931;
        _948 = _932;
        _949 = _933;
      } else {
        _947 = 0.0f;
        _948 = 0.0f;
        _949 = 0.0f;
      }
    } else {
      _947 = 0.0f;
      _948 = 0.0f;
      _949 = 0.0f;
    }
  } else {
    _947 = _931;
    _948 = _932;
    _949 = _933;
  }
  SV_Target.x = _947;
  SV_Target.y = _948;
  SV_Target.z = _949;
  SV_Target.w = _451;
  return SV_Target;
}