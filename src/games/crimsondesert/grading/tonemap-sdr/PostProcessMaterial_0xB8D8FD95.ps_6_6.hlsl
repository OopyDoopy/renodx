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
  float _39;
  float _40;
  float _41;
  float _66;
  float _67;
  float _68;
  int _69;
  float _77;
  int _82;
  int _90;
  uint2 _107;
  uint _122;
  int _124;
  float _132;
  float _133;
  float _135;
  float _136;
  float _137;
  float _148;
  float _149;
  float _447;
  float _448;
  float _449;
  float _450;
  float _458;
  float _459;
  float _460;
  float _461;
  float _462;
  float _463;
  float _464;
  float _487;
  float _692;
  float _693;
  float _694;
  float _787;
  float _788;
  float _789;
  float _909;
  float _910;
  float _911;
  float _932;
  float _933;
  float _934;
  float _967;
  float _968;
  float _969;
  float _983;
  float _984;
  float _985;
  float _151;
  float _152;
  float _153;
  float _154;
  float _156;
  float _157;
  float _158;
  float _159;
  bool _163;
  float _175;
  float _176;
  float _177;
  float _179;
  float _180;
  uint _186;
  uint _187;
  uint4 _189;
  float4 _192;
  float _210;
  float _211;
  float _212;
  float _214;
  float _215;
  float _216;
  float _217;
  float _220;
  float _221;
  float _224;
  float _225;
  float _229;
  float _231;
  float _232;
  float _233;
  float _234;
  float _236;
  float _239;
  float _240;
  float _241;
  float _242;
  float _251;
  float _255;
  float _259;
  float _261;
  float _265;
  float _266;
  int _267;
  int _275;
  float _278;
  float _281;
  float _283;
  float _313;
  float _328;
  float _352;
  float _354;
  float _355;
  float _359;
  float _360;
  float _361;
  float _366;
  float _370;
  float _371;
  float _372;
  float _394;
  float _401;
  float _405;
  float _411;
  float _414;
  float _433;
  float _453;
  float _471;
  float _472;
  float _473;
  uint _474;
  float _496;
  float _545;
  float _546;
  float _547;
  float _549;
  float _556;
  float _557;
  float _558;
  float _577;
  float _578;
  float _579;
  float _580;
  float _581;
  float _582;
  float _583;
  float _584;
  float _585;
  float _631;
  float _632;
  float _633;
  float _634;
  float _635;
  float _636;
  float _637;
  float _654;
  float _655;
  float _656;
  float _657;
  float _663;
  float _666;
  float _673;
  float _674;
  float _675;
  float _704;
  float _729;
  float _730;
  float _731;
  float _750;
  float _751;
  float _752;
  float _758;
  float _762;
  float _763;
  float _764;
  float _765;
  float _770;
  float _795;
  float _799;
  float _800;
  float _801;
  float _802;
  int _843;
  float _898;
  float _922;
  float _923;
  float _927;
  float _974;
  float _995;
  float _996;
  float _997;
  float _24[36];
  _29 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _39 = (pow(_29.x, 0.012683313339948654f));
  _40 = (pow(_29.y, 0.012683313339948654f));
  _41 = (pow(_29.z, 0.012683313339948654f));
  _66 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _68 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _69 = WaveReadLaneFirst(_materialIndex);
  _77 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectRatio);
  _82 = WaveReadLaneFirst(_materialIndex);
  _90 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._noiseTexture);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_107.x, _107.y);
  _122 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_107.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_107.y)))))) + 0.5f) * (((saturate(1.0f - _77) * 0.125f) * (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_90 < (uint)65000), _90, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_77 + (TEXCOORD.x * 5.0f)), (_77 + (TEXCOORD.y * 0.10000000149011612f)))))).y) * 2.0f) + -0.9960784316062927f)) + TEXCOORD.y)), 0));
  _124 = _122.x & 255;
  _132 = (float((uint)((uint)((uint)((uint)(_122.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _133 = (float((uint)((uint)(((uint)((uint)(_122.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _135 = 1.0f - abs(_132);
  _136 = abs(_133);
  _137 = _135 - _136;
  if (_137 < 0.0f) {
    _148 = (select((_132 >= 0.0f), 1.0f, -1.0f) * (1.0f - _136));
    _149 = (select((_133 >= 0.0f), 1.0f, -1.0f) * _135);
  } else {
    _148 = _132;
    _149 = _133;
  }
  _151 = rsqrt(dot(float3(_148, _149, _137), float3(_148, _149, _137)));
  _152 = _151 * _148;
  _153 = _151 * _149;
  _154 = _151 * _137;
  _156 = rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
  _157 = _156 * _152;
  _158 = _156 * _153;
  _159 = _156 * _154;
  _163 = (_77 > 0.0010000000474974513f);
  if (_124 == _renderPassLearning) {
    if (_163) {
      _175 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x);
      _176 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y);
      _177 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z);
      _179 = saturate(dot(float3(_157, _158, _159), float3(_175, _176, _177)));
      _180 = 1.0f - _179;
      _186 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _187 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _189 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_186, _187, 0));
      _192 = __3__36__0__0__g_gbufferNormal.Load(int3(_186, _187, 0));
      _210 = (saturate(_192.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _211 = (saturate(_192.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _212 = (saturate(_192.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
      _215 = _214 * _210;
      _216 = _214 * _211;
      _217 = _212 * _214;
      _220 = (float((uint)((uint)(((uint)((uint)(_189.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _221 = (float((uint)((uint)(_189.w & 255))) * 0.007843137718737125f) + -1.0f;
      _224 = (_220 + _221) * 0.5f;
      _225 = (_220 - _221) * 0.5f;
      _229 = (1.0f - abs(_224)) - abs(_225);
      _231 = rsqrt(dot(float3(_224, _225, _229), float3(_224, _225, _229)));
      _232 = _231 * _224;
      _233 = _231 * _225;
      _234 = _231 * _229;
      _236 = select((_217 >= 0.0f), 1.0f, -1.0f);
      _239 = -0.0f - (1.0f / (_236 + _217));
      _240 = _216 * _239;
      _241 = _240 * _215;
      _242 = _236 * _215;
      _251 = mad(_234, _215, mad(_233, _241, ((((_242 * _215) * _239) + 1.0f) * _232)));
      _255 = mad(_234, _216, mad(_233, (_236 + (_240 * _216)), ((_232 * _236) * _241)));
      _259 = mad(_234, _217, mad(_233, (-0.0f - _216), (-0.0f - (_242 * _232))));
      _261 = rsqrt(dot(float3(_251, _255, _259), float3(_251, _255, _259)));
      _265 = dot(float3((_261 * _251), (_261 * _255), (_261 * _259)), float3(_175, _176, _177));
      _266 = 1.0f - _265;
      _267 = WaveReadLaneFirst(_materialIndex);
      _275 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_267 < (uint)170000), _267, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectColor);
      _278 = float((uint)((uint)(((uint)(_275) >> 16) & 255)));
      _281 = float((uint)((uint)(((uint)(_275) >> 8) & 255)));
      _283 = float((uint)((uint)(_275 & 255)));
      _313 = max(0.0010000000474974513f, _exposure0.x);
      _328 = saturate((abs(sin(((_159 * 2.0f) + (TEXCOORD.y * 500.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f))) * 3.0f) + -2.0f);
      _352 = _179 * _265;
      _354 = ((saturate((abs(sin(((_158 * 2.0f) + (TEXCOORD.y * 10.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_157 * 0.25f) + (TEXCOORD.y * 25.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.2000000476837158f))) * 3.0f) + -1.0f) - _328)) + _328) * (_352 * _352);
      _355 = dot(float3(_66, _67, _68), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _359 = _354 * (_355 + (select(((_278 * 0.003921568859368563f) < 0.040449999272823334f), (_278 * 0.0003035269910469651f), exp2(log2((_278 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _360 = _354 * (_355 + (select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _361 = _354 * (_355 + (select(((_283 * 0.003921568859368563f) < 0.040449999272823334f), (_283 * 0.0003035269910469651f), exp2(log2((_283 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _366 = exp2(log2(_266 * _180) * 3.0f) * 10.0f;
      _370 = (_366 * _359) + _359;
      _371 = (_366 * _360) + _360;
      _372 = (_366 * _361) + _361;
      _394 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x))) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))));
      _401 = (saturate(1.0f - abs((_77 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_394 < 1.0f) {
        _405 = log2(1.0f - _394);
        _411 = (pow(_394, 3.0f)) * exp2(_405 * 8.0f);
        _414 = (_411 * 600.0f) / _313;
        _447 = ((_414 + _370) * _401);
        _448 = ((_414 + _371) * _401);
        _449 = ((((_411 * 1800.0f) / _313) + _372) * _401);
        _450 = saturate(exp2(_405 * 3.0f) * _77);
      } else {
        if (_124 == _renderPassAimHighlight) {
          _433 = ((_266 - _180) * 0.4000000059604645f) + _180;
          _447 = ((((_433 * 0.800000011920929f) / _313) + _370) * _401);
          _448 = ((((_433 * 1.2000000476837158f) / _313) + _371) * _401);
          _449 = ((((_433 * 2.0f) / _313) + _372) * _401);
          _450 = _77;
        } else {
          _447 = _66;
          _448 = _67;
          _449 = _68;
          _450 = 0.0f;
        }
      }
      _453 = ((_77 * 3.0f) * _450) + 1.0f;
      _458 = (_453 * _66);
      _459 = (_453 * _67);
      _460 = (_453 * _68);
      _461 = _447;
      _462 = _448;
      _463 = _449;
      _464 = _450;
    } else {
      _458 = _66;
      _459 = _67;
      _460 = _68;
      _461 = _66;
      _462 = _67;
      _463 = _68;
      _464 = 0.0f;
    }
  } else {
    if (_163 && (_124 == _renderPassAimHighlight)) {
      _175 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x);
      _176 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y);
      _177 = -0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z);
      _179 = saturate(dot(float3(_157, _158, _159), float3(_175, _176, _177)));
      _180 = 1.0f - _179;
      _186 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
      _187 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
      _189 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_186, _187, 0));
      _192 = __3__36__0__0__g_gbufferNormal.Load(int3(_186, _187, 0));
      _210 = (saturate(_192.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _211 = (saturate(_192.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _212 = (saturate(_192.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
      _215 = _214 * _210;
      _216 = _214 * _211;
      _217 = _212 * _214;
      _220 = (float((uint)((uint)(((uint)((uint)(_189.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _221 = (float((uint)((uint)(_189.w & 255))) * 0.007843137718737125f) + -1.0f;
      _224 = (_220 + _221) * 0.5f;
      _225 = (_220 - _221) * 0.5f;
      _229 = (1.0f - abs(_224)) - abs(_225);
      _231 = rsqrt(dot(float3(_224, _225, _229), float3(_224, _225, _229)));
      _232 = _231 * _224;
      _233 = _231 * _225;
      _234 = _231 * _229;
      _236 = select((_217 >= 0.0f), 1.0f, -1.0f);
      _239 = -0.0f - (1.0f / (_236 + _217));
      _240 = _216 * _239;
      _241 = _240 * _215;
      _242 = _236 * _215;
      _251 = mad(_234, _215, mad(_233, _241, ((((_242 * _215) * _239) + 1.0f) * _232)));
      _255 = mad(_234, _216, mad(_233, (_236 + (_240 * _216)), ((_232 * _236) * _241)));
      _259 = mad(_234, _217, mad(_233, (-0.0f - _216), (-0.0f - (_242 * _232))));
      _261 = rsqrt(dot(float3(_251, _255, _259), float3(_251, _255, _259)));
      _265 = dot(float3((_261 * _251), (_261 * _255), (_261 * _259)), float3(_175, _176, _177));
      _266 = 1.0f - _265;
      _267 = WaveReadLaneFirst(_materialIndex);
      _275 = WaveReadLaneFirst(BindlessParameters_PostProcessLearningHolo_CD[((int)((uint)(select(((uint)_267 < (uint)170000), _267, 0)) + 0u))].BindlessParameters_PostProcessLearningHolo_CD._learningEffectColor);
      _278 = float((uint)((uint)(((uint)(_275) >> 16) & 255)));
      _281 = float((uint)((uint)(((uint)(_275) >> 8) & 255)));
      _283 = float((uint)((uint)(_275 & 255)));
      _313 = max(0.0010000000474974513f, _exposure0.x);
      _328 = saturate((abs(sin(((_159 * 2.0f) + (TEXCOORD.y * 500.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 10.0f))) * 3.0f) + -2.0f);
      _352 = _179 * _265;
      _354 = ((saturate((abs(sin(((_158 * 2.0f) + (TEXCOORD.y * 10.0f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 2.0f))) * 3.0f) + -2.0f) * (saturate((abs(sin(((_157 * 0.25f) + (TEXCOORD.y * 25.0f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.2000000476837158f))) * 3.0f) + -1.0f) - _328)) + _328) * (_352 * _352);
      _355 = dot(float3(_66, _67, _68), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _359 = _354 * (_355 + (select(((_278 * 0.003921568859368563f) < 0.040449999272823334f), (_278 * 0.0003035269910469651f), exp2(log2((_278 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _360 = _354 * (_355 + (select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _361 = _354 * (_355 + (select(((_283 * 0.003921568859368563f) < 0.040449999272823334f), (_283 * 0.0003035269910469651f), exp2(log2((_283 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _313));
      _366 = exp2(log2(_266 * _180) * 3.0f) * 10.0f;
      _370 = (_366 * _359) + _359;
      _371 = (_366 * _360) + _360;
      _372 = (_366 * _361) + _361;
      _394 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x))) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x))));
      _401 = (saturate(1.0f - abs((_77 * 2.0f) + -1.0f)) * 199.0f) + 1.0f;
      if (_394 < 1.0f) {
        _405 = log2(1.0f - _394);
        _411 = (pow(_394, 3.0f)) * exp2(_405 * 8.0f);
        _414 = (_411 * 600.0f) / _313;
        _447 = ((_414 + _370) * _401);
        _448 = ((_414 + _371) * _401);
        _449 = ((((_411 * 1800.0f) / _313) + _372) * _401);
        _450 = saturate(exp2(_405 * 3.0f) * _77);
      } else {
        if (_124 == _renderPassAimHighlight) {
          _433 = ((_266 - _180) * 0.4000000059604645f) + _180;
          _447 = ((((_433 * 0.800000011920929f) / _313) + _370) * _401);
          _448 = ((((_433 * 1.2000000476837158f) / _313) + _371) * _401);
          _449 = ((((_433 * 2.0f) / _313) + _372) * _401);
          _450 = _77;
        } else {
          _447 = _66;
          _448 = _67;
          _449 = _68;
          _450 = 0.0f;
        }
      }
      _453 = ((_77 * 3.0f) * _450) + 1.0f;
      _458 = (_453 * _66);
      _459 = (_453 * _67);
      _460 = (_453 * _68);
      _461 = _447;
      _462 = _448;
      _463 = _449;
      _464 = _450;
    } else {
      _458 = _66;
      _459 = _67;
      _460 = _68;
      _461 = _66;
      _462 = _67;
      _463 = _68;
      _464 = 0.0f;
    }
  }
  _471 = (_464 * (_461 - _458)) + _458;
  _472 = (_464 * (_462 - _459)) + _459;
  _473 = (_464 * (_463 - _460)) + _460;
  _474 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _487 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _474, 0)))).x) & 127))) + 0.5f);
  } else {
    _487 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_471, _472, _473));
    _909 = output_color.x;
    _910 = output_color.y;
    _911 = output_color.z;
  } else {
    _909 = _471;
    _910 = _472;
    _911 = _473;
  }
  if (_etcParams.y > 1.0f) {
    _922 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _923 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _927 = saturate(1.0f - (dot(float2(_922, _923), float2(_922, _923)) * saturate(_etcParams.y + -1.0f)));
    _932 = (_927 * _909);
    _933 = (_927 * _910);
    _934 = (_927 * _911);
  } else {
    _932 = _909;
    _933 = _910;
    _934 = _911;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _967 = select((_932 <= 0.0031308000907301903f), (_932 * 12.920000076293945f), (((pow(_932, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _968 = select((_933 <= 0.0031308000907301903f), (_933 * 12.920000076293945f), (((pow(_933, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _969 = select((_934 <= 0.0031308000907301903f), (_934 * 12.920000076293945f), (((pow(_934, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _967 = _932;
    _968 = _933;
    _969 = _934;
  }
  if (!(_etcParams.y < 1.0f)) {
    _974 = float((uint)_474);
    if (!(_974 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_974 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _983 = _967;
        _984 = _968;
        _985 = _969;
      } else {
        _983 = 0.0f;
        _984 = 0.0f;
        _985 = 0.0f;
      }
    } else {
      _983 = 0.0f;
      _984 = 0.0f;
      _985 = 0.0f;
    }
  } else {
    _983 = _967;
    _984 = _968;
    _985 = _969;
  }
  _995 = exp2(log2(_983 * 9.999999747378752e-05f) * 0.1593017578125f);
  _996 = exp2(log2(_984 * 9.999999747378752e-05f) * 0.1593017578125f);
  _997 = exp2(log2(_985 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_995 * 18.6875f) + 1.0f)) * ((_995 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_996 * 18.6875f) + 1.0f)) * ((_996 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_997 * 18.6875f) + 1.0f)) * ((_997 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _487;
  return SV_Target;
}