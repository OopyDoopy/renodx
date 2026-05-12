#include "../tonemap.hlsli"

struct PostProcessAxiom_CDStruct {
  float _axiomEyeProgress;
  float _axiomEyeRadius;
  uint _axiomEyeTargetColor;
  uint _axiomPlayerColor;
  uint _axiomBackgroundColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t67, space36);

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

struct BindlessParameters_PostProcessAxiom_CD {
  PostProcessAxiom_CDStruct BindlessParameters_PostProcessAxiom_CD;
};

typedef BindlessParameters_PostProcessAxiom_CD BindlessParameters_PostProcessAxiom_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAxiom_CD_t> BindlessParameters_PostProcessAxiom_CD[] : register(b0, space100);

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
  float _31;
  float4 _34;
  float _44;
  float _45;
  float _46;
  float _71;
  float _72;
  float _73;
  float _75;
  float _76;
  float _77;
  float _81;
  float _117;
  float _121;
  int _128;
  int _136;
  float4 _143;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  float _151;
  uint2 _153;
  uint _168;
  int _170;
  float _178;
  float _179;
  float _181;
  float _182;
  float _183;
  float _194;
  float _195;
  float _583;
  float _584;
  float _585;
  float _611;
  float _612;
  float _613;
  float _639;
  float _844;
  float _845;
  float _846;
  float _939;
  float _940;
  float _941;
  float _1061;
  float _1062;
  float _1063;
  float _1081;
  float _1082;
  float _1083;
  float _1116;
  float _1117;
  float _1118;
  float _1132;
  float _1133;
  float _1134;
  float _197;
  float _198;
  float _199;
  float _200;
  float _202;
  float _203;
  float _204;
  float _205;
  int _215;
  float _223;
  float _228;
  float _229;
  float _230;
  float _243;
  float _249;
  int _253;
  int _261;
  float _264;
  float _267;
  float _269;
  float4 _301;
  float _303;
  float _304;
  float _305;
  float _306;
  float _342;
  float _350;
  float _351;
  float _352;
  int _359;
  float _367;
  float _372;
  float _389;
  int _400;
  int _408;
  float4 _415;
  float _428;
  float _431;
  float _433;
  int _442;
  int _450;
  float _453;
  float _456;
  float _458;
  int _494;
  int _502;
  float _505;
  float _508;
  float _510;
  float _535;
  float _536;
  float _537;
  float _555;
  float _557;
  float _560;
  float4 _567;
  float _589;
  float _590;
  float _591;
  float _623;
  float _624;
  float _625;
  uint _626;
  float _648;
  float _697;
  float _698;
  float _699;
  float _701;
  float _708;
  float _709;
  float _710;
  float _729;
  float _730;
  float _731;
  float _732;
  float _733;
  float _734;
  float _735;
  float _736;
  float _737;
  float _783;
  float _784;
  float _785;
  float _786;
  float _787;
  float _788;
  float _789;
  float _806;
  float _807;
  float _808;
  float _809;
  float _815;
  float _818;
  float _825;
  float _826;
  float _827;
  float _856;
  float _881;
  float _882;
  float _883;
  float _902;
  float _903;
  float _904;
  float _910;
  float _914;
  float _915;
  float _916;
  float _917;
  float _922;
  float _947;
  float _951;
  float _952;
  float _953;
  float _954;
  int _995;
  float _1050;
  float _1071;
  float _1072;
  float _1076;
  float _1123;
  float _1144;
  float _1145;
  float _1146;
  float _25[36];
  _31 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _44 = (pow(_34.x, 0.012683313339948654f));
  _45 = (pow(_34.y, 0.012683313339948654f));
  _46 = (pow(_34.z, 0.012683313339948654f));
  _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _73 = exp2(log2(max(0.0f, (_46 + -0.8359375f)) / (18.8515625f - (_46 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _75 = (TEXCOORD.x * 2.0f) + -1.0f;
  _76 = TEXCOORD.y * 2.0f;
  _77 = 1.0f - _76;
  _81 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _117 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _81, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _121 = 6.0f / _31;
  _128 = WaveReadLaneFirst(_materialIndex);
  _136 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
  _143 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_136 < (uint)65000), _136, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_121 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f) + (_121 * TEXCOORD.y))));
  _146 = _143.x + -0.5f;
  _147 = _143.y + -0.5f;
  _148 = _146 * 0.004999999888241291f;
  _149 = _147 * 0.004999999888241291f;
  _150 = _148 + TEXCOORD.x;
  _151 = _149 + TEXCOORD.y;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_153.x, _153.y);
  _168 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_153.x)))))) + 0.5f) * _150), int((float((int)(int(float((int)((int)(_153.y)))))) + 0.5f) * _151), 0));
  _170 = _168.x & 255;
  _178 = (float((uint)((uint)((uint)((uint)(_168.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _179 = (float((uint)((uint)(((uint)((uint)(_168.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _181 = 1.0f - abs(_178);
  _182 = abs(_179);
  _183 = _181 - _182;
  if (_183 < 0.0f) {
    _194 = (select((_178 >= 0.0f), 1.0f, -1.0f) * (1.0f - _182));
    _195 = (select((_179 >= 0.0f), 1.0f, -1.0f) * _181);
  } else {
    _194 = _178;
    _195 = _179;
  }
  _197 = rsqrt(dot(float3(_194, _195, _183), float3(_194, _195, _183)));
  _198 = _197 * _194;
  _199 = _197 * _195;
  _200 = _197 * _183;
  _202 = rsqrt(dot(float3(_198, _199, _200), float3(_198, _199, _200)));
  _203 = _202 * _198;
  _204 = _202 * _199;
  _205 = _202 * _200;
  _215 = WaveReadLaneFirst(_materialIndex);
  _223 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_215 < (uint)170000), _215, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeProgress);
  _228 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _81, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _117) - _mainPosition.x;
  _229 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _81, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _117) - _mainPosition.y;
  _230 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _81, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _117) - _mainPosition.z;
  _243 = saturate((1.0f - saturate(sqrt(((_228 * _228) + (_229 * _229)) + (_230 * _230)) / max(0.0010000000474974513f, (_223 * 50.0f)))) * 1.25f);
  _249 = (saturate((_223 * 4.0f) + -3.0f) * (1.0f - _243)) + _243;
  if (_243 > 0.0f) {
    _253 = WaveReadLaneFirst(_materialIndex);
    _261 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_253 < (uint)170000), _253, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomBackgroundColor);
    _264 = float((uint)((uint)(((uint)(_261) >> 16) & 255)));
    _267 = float((uint)((uint)(((uint)(_261) >> 8) & 255)));
    _269 = float((uint)((uint)(_261 & 255)));
    _301 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _148), (TEXCOORD.y - _149)), 0.0f);
    _303 = _301.w * select(((_264 * 0.003921568859368563f) < 0.040449999272823334f), (_264 * 0.0003035269910469651f), exp2(log2((_264 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _304 = _301.w * select(((_267 * 0.003921568859368563f) < 0.040449999272823334f), (_267 * 0.0003035269910469651f), exp2(log2((_267 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _305 = _301.w * select(((_269 * 0.003921568859368563f) < 0.040449999272823334f), (_269 * 0.0003035269910469651f), exp2(log2((_269 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _306 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _150), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _151), 0)))).x));
    _342 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _306, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _350 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _306, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _342) - _mainPosition.x;
    _351 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _306, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _342) - _mainPosition.y;
    _352 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _306, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _77, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _75))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _342) - _mainPosition.z;
    _359 = WaveReadLaneFirst(_materialIndex);
    _367 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_359 < (uint)170000), _359, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeRadius);
    _372 = 1.0f - saturate(sqrt(((_350 * _350) + (_351 * _351)) + (_352 * _352)) / max(0.0010000000474974513f, (_367 * _249)));
    if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
      if (_372 > 0.0f) {
        _389 = 2.0f / _31;
        _400 = WaveReadLaneFirst(_materialIndex);
        _408 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_400 < (uint)170000), _400, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
        _415 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_408 < (uint)65000), _408, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_389 * TEXCOORD.x) - (_143.x * 0.25f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)), ((_389 * TEXCOORD.y) - (_143.y * 0.25f))));
        _428 = saturate(1.0f - dot(float3(_203, _204, _205), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _431 = _415.z + -0.5f;
        _433 = saturate(((_428 * _428) * _428) + _431);
        if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
          _442 = WaveReadLaneFirst(_materialIndex);
          _450 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_442 < (uint)170000), _442, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomPlayerColor);
          _453 = float((uint)((uint)(((uint)(_450) >> 16) & 255)));
          _456 = float((uint)((uint)(((uint)(_450) >> 8) & 255)));
          _458 = float((uint)((uint)(_450 & 255)));
          _611 = (select(((_453 * 0.003921568859368563f) < 0.040449999272823334f), (_453 * 0.0003035269910469651f), exp2(log2((_453 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _612 = (select(((_456 * 0.003921568859368563f) < 0.040449999272823334f), (_456 * 0.0003035269910469651f), exp2(log2((_456 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _613 = (select(((_458 * 0.003921568859368563f) < 0.040449999272823334f), (_458 * 0.0003035269910469651f), exp2(log2((_458 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
        } else {
          if (_170 == _renderPassDetectItem) {
            _494 = WaveReadLaneFirst(_materialIndex);
            _502 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeTargetColor);
            _505 = float((uint)((uint)(((uint)(_502) >> 16) & 255)));
            _508 = float((uint)((uint)(((uint)(_502) >> 8) & 255)));
            _510 = float((uint)((uint)(_502 & 255)));
            _535 = select(((_505 * 0.003921568859368563f) < 0.040449999272823334f), (_505 * 0.0003035269910469651f), exp2(log2((_505 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _536 = select(((_508 * 0.003921568859368563f) < 0.040449999272823334f), (_508 * 0.0003035269910469651f), exp2(log2((_508 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _537 = select(((_510 * 0.003921568859368563f) < 0.040449999272823334f), (_510 * 0.0003035269910469651f), exp2(log2((_510 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _555 = saturate(1.0f - dot(float3((((_415.x + -0.5f) * 4.0f) + _203), (((_415.y + -0.5f) * 4.0f) + _204), ((_431 * 4.0f) + _205)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
            _557 = saturate(_555 * _555);
            _560 = saturate((_372 * 2.0f) + -1.0f);
            _567 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_146 * 0.04999999701976776f)), (TEXCOORD.y - (_147 * 0.04999999701976776f))), 0.0f);
            if (!(_567.w < 0.10000000149011612f)) {
              if (_567.w < 0.14000000059604645f) {
                _583 = (_535 + 1.0f);
                _584 = _536;
                _585 = _537;
              } else {
                if (_567.w < 0.17000000178813934f) {
                  _583 = _535;
                  _584 = (_536 + 1.0f);
                  _585 = _537;
                } else {
                  if (_567.w < 0.30000001192092896f) {
                    _583 = _535;
                    _584 = _536;
                    _585 = (_537 + 1.0f);
                  } else {
                    _583 = _535;
                    _584 = _536;
                    _585 = _537;
                  }
                }
              }
            } else {
              _583 = _535;
              _584 = _536;
              _585 = _537;
            }
            _589 = _535 * _433;
            _590 = _536 * _433;
            _591 = _537 * _433;
            _611 = ((((_589 - _303) + (((_583 * _557) - _589) * _560)) * _372) + _303);
            _612 = ((((_590 - _304) + (((_584 * _557) - _590) * _560)) * _372) + _304);
            _613 = ((((_591 - _305) + (((_585 * _557) - _591) * _560)) * _372) + _305);
          } else {
            _611 = _303;
            _612 = _304;
            _613 = _305;
          }
        }
      } else {
        _611 = _303;
        _612 = _304;
        _613 = _305;
      }
    } else {
      if ((_372 > 0.0f) && (_170 == _renderPassDetectItem)) {
        _389 = 2.0f / _31;
        _400 = WaveReadLaneFirst(_materialIndex);
        _408 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_400 < (uint)170000), _400, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
        _415 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_408 < (uint)65000), _408, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_389 * TEXCOORD.x) - (_143.x * 0.25f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)), ((_389 * TEXCOORD.y) - (_143.y * 0.25f))));
        _428 = saturate(1.0f - dot(float3(_203, _204, _205), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _431 = _415.z + -0.5f;
        _433 = saturate(((_428 * _428) * _428) + _431);
        if ((_170 == _renderPassSelfPlayer) || ((!(_170 == _renderPassSelfPlayer)) && (_170 == _renderPassTest))) {
          _442 = WaveReadLaneFirst(_materialIndex);
          _450 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_442 < (uint)170000), _442, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomPlayerColor);
          _453 = float((uint)((uint)(((uint)(_450) >> 16) & 255)));
          _456 = float((uint)((uint)(((uint)(_450) >> 8) & 255)));
          _458 = float((uint)((uint)(_450 & 255)));
          _611 = (select(((_453 * 0.003921568859368563f) < 0.040449999272823334f), (_453 * 0.0003035269910469651f), exp2(log2((_453 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _612 = (select(((_456 * 0.003921568859368563f) < 0.040449999272823334f), (_456 * 0.0003035269910469651f), exp2(log2((_456 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
          _613 = (select(((_458 * 0.003921568859368563f) < 0.040449999272823334f), (_458 * 0.0003035269910469651f), exp2(log2((_458 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _433);
        } else {
          if (_170 == _renderPassDetectItem) {
            _494 = WaveReadLaneFirst(_materialIndex);
            _502 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeTargetColor);
            _505 = float((uint)((uint)(((uint)(_502) >> 16) & 255)));
            _508 = float((uint)((uint)(((uint)(_502) >> 8) & 255)));
            _510 = float((uint)((uint)(_502 & 255)));
            _535 = select(((_505 * 0.003921568859368563f) < 0.040449999272823334f), (_505 * 0.0003035269910469651f), exp2(log2((_505 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _536 = select(((_508 * 0.003921568859368563f) < 0.040449999272823334f), (_508 * 0.0003035269910469651f), exp2(log2((_508 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _537 = select(((_510 * 0.003921568859368563f) < 0.040449999272823334f), (_510 * 0.0003035269910469651f), exp2(log2((_510 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _555 = saturate(1.0f - dot(float3((((_415.x + -0.5f) * 4.0f) + _203), (((_415.y + -0.5f) * 4.0f) + _204), ((_431 * 4.0f) + _205)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
            _557 = saturate(_555 * _555);
            _560 = saturate((_372 * 2.0f) + -1.0f);
            _567 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_146 * 0.04999999701976776f)), (TEXCOORD.y - (_147 * 0.04999999701976776f))), 0.0f);
            if (!(_567.w < 0.10000000149011612f)) {
              if (_567.w < 0.14000000059604645f) {
                _583 = (_535 + 1.0f);
                _584 = _536;
                _585 = _537;
              } else {
                if (_567.w < 0.17000000178813934f) {
                  _583 = _535;
                  _584 = (_536 + 1.0f);
                  _585 = _537;
                } else {
                  if (_567.w < 0.30000001192092896f) {
                    _583 = _535;
                    _584 = _536;
                    _585 = (_537 + 1.0f);
                  } else {
                    _583 = _535;
                    _584 = _536;
                    _585 = _537;
                  }
                }
              }
            } else {
              _583 = _535;
              _584 = _536;
              _585 = _537;
            }
            _589 = _535 * _433;
            _590 = _536 * _433;
            _591 = _537 * _433;
            _611 = ((((_589 - _303) + (((_583 * _557) - _589) * _560)) * _372) + _303);
            _612 = ((((_590 - _304) + (((_584 * _557) - _590) * _560)) * _372) + _304);
            _613 = ((((_591 - _305) + (((_585 * _557) - _591) * _560)) * _372) + _305);
          } else {
            _611 = _303;
            _612 = _304;
            _613 = _305;
          }
        }
      } else {
        _611 = _303;
        _612 = _304;
        _613 = _305;
      }
    }
  } else {
    _611 = _71;
    _612 = _72;
    _613 = _73;
  }
  _623 = (((_611 * _243) - _71) * _249) + _71;
  _624 = (((_612 * _243) - _72) * _249) + _72;
  _625 = (((_613 * _243) - _73) * _249) + _73;
  _626 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _639 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _626, 0)))).x) & 127))) + 0.5f);
  } else {
    _639 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_623, _624, _625));
    _1061 = output_color.x;
    _1062 = output_color.y;
    _1063 = output_color.z;
  } else {
    _1061 = _623;
    _1062 = _624;
    _1063 = _625;
  }
  if (_etcParams.y > 1.0f) {
    _1071 = abs(_75);
    _1072 = abs(_76 + -1.0f);
    _1076 = saturate(1.0f - (dot(float2(_1071, _1072), float2(_1071, _1072)) * saturate(_etcParams.y + -1.0f)));
    _1081 = (_1076 * _1061);
    _1082 = (_1076 * _1062);
    _1083 = (_1076 * _1063);
  } else {
    _1081 = _1061;
    _1082 = _1062;
    _1083 = _1063;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1116 = select((_1081 <= 0.0031308000907301903f), (_1081 * 12.920000076293945f), (((pow(_1081, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1117 = select((_1082 <= 0.0031308000907301903f), (_1082 * 12.920000076293945f), (((pow(_1082, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1118 = select((_1083 <= 0.0031308000907301903f), (_1083 * 12.920000076293945f), (((pow(_1083, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1116 = _1081;
    _1117 = _1082;
    _1118 = _1083;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1123 = float((uint)_626);
    if (!(_1123 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1123 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1132 = _1116;
        _1133 = _1117;
        _1134 = _1118;
      } else {
        _1132 = 0.0f;
        _1133 = 0.0f;
        _1134 = 0.0f;
      }
    } else {
      _1132 = 0.0f;
      _1133 = 0.0f;
      _1134 = 0.0f;
    }
  } else {
    _1132 = _1116;
    _1133 = _1117;
    _1134 = _1118;
  }
  _1144 = exp2(log2(_1132 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1145 = exp2(log2(_1133 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1146 = exp2(log2(_1134 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1144 * 18.6875f) + 1.0f)) * ((_1144 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1145 * 18.6875f) + 1.0f)) * ((_1145 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1146 * 18.6875f) + 1.0f)) * ((_1146 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _639;
  return SV_Target;
}