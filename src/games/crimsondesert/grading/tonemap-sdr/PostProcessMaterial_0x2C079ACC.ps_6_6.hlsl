#include "../tonemap.hlsli"

struct PostProcessKnowledgeGain_CDStruct {
  uint _noiseTex;
  uint _regionTex;
  float _knowledgeGainRegionRatio;
  float _knowledgeGainCharacterRatio;
  float _knowledgeGainGimmickRatio;
  uint _knowledgeGainColor;
  uint _knowledgeGainRegionNumberR;
  uint _knowledgeGainRegionNumberG;
  float3 _knowledgeGainBoundBoxMin;
  float3 _knowledgeGainBoundBoxMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessKnowledgeGain_CD {
  PostProcessKnowledgeGain_CDStruct BindlessParameters_PostProcessKnowledgeGain_CD;
};

typedef BindlessParameters_PostProcessKnowledgeGain_CD BindlessParameters_PostProcessKnowledgeGain_CD_t;
ConstantBuffer<BindlessParameters_PostProcessKnowledgeGain_CD_t> BindlessParameters_PostProcessKnowledgeGain_CD[] : register(b0, space100);

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
  int _28;
  float _36;
  int _37;
  float _45;
  float _427;
  float _428;
  float _429;
  float _430;
  float _444;
  float _649;
  float _650;
  float _651;
  float _744;
  float _745;
  float _746;
  float _866;
  float _867;
  float _868;
  float _889;
  float _890;
  float _891;
  float _924;
  float _925;
  float _926;
  float _940;
  float _941;
  float _942;
  float _60;
  float _66;
  float _69;
  float _72;
  int _81;
  int _89;
  float4 _96;
  float _100;
  float _101;
  float _104;
  float _105;
  float _109;
  float _110;
  float _111;
  uint2 _115;
  float _124;
  float _125;
  float4 _190;
  float _203;
  float _204;
  float _205;
  float _207;
  float _219;
  float _222;
  float _224;
  float _225;
  float _226;
  float4 _228;
  float _238;
  float _239;
  float _240;
  float _268;
  float4 _271;
  float _281;
  float _282;
  float _283;
  float _311;
  float4 _314;
  float _324;
  float _325;
  float _326;
  float _354;
  int _355;
  int _363;
  float _366;
  float _369;
  float _371;
  float _396;
  float _397;
  float _398;
  float _410;
  uint _431;
  float _453;
  float _502;
  float _503;
  float _504;
  float _506;
  float _513;
  float _514;
  float _515;
  float _534;
  float _535;
  float _536;
  float _537;
  float _538;
  float _539;
  float _540;
  float _541;
  float _542;
  float _588;
  float _589;
  float _590;
  float _591;
  float _592;
  float _593;
  float _594;
  float _611;
  float _612;
  float _613;
  float _614;
  float _620;
  float _623;
  float _630;
  float _631;
  float _632;
  float _661;
  float _686;
  float _687;
  float _688;
  float _707;
  float _708;
  float _709;
  float _715;
  float _719;
  float _720;
  float _721;
  float _722;
  float _727;
  float _752;
  float _756;
  float _757;
  float _758;
  float _759;
  int _800;
  float _855;
  float _879;
  float _880;
  float _884;
  float _931;
  float _952;
  float _953;
  float _954;
  float _25[36];
  _28 = WaveReadLaneFirst(_materialIndex);
  _36 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainCharacterRatio);
  _37 = WaveReadLaneFirst(_materialIndex);
  _45 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainGimmickRatio);
  if ((_36 >= 0.0010000000474974513f) || (_45 >= 0.0010000000474974513f)) {
    _60 = saturate(saturate(((1.0f - abs((1.25f - TEXCOORD.y) - (max(_36, _45) * 1.5f))) * 4.0f) + -3.0f) * 2.0f);
    if (_60 > 0.0010000000474974513f) {
      _66 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
      _69 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _72 = min(max(_69.x, 0.009999999776482582f), 0.10000000149011612f);
      _81 = WaveReadLaneFirst(_materialIndex);
      _89 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._noiseTex);
      _96 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_89 < (uint)65000), _89, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((8.0f / _66) * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + ((3.0f / _66) * TEXCOORD.y))));
      _100 = _96.y + -0.4000000059604645f;
      _101 = _72 * 0.25f;
      _104 = ((_96.x + -0.4000000059604645f) * _101) + TEXCOORD.x;
      _105 = (_100 * _101) + TEXCOORD.y;
      _109 = _72 * 200.0f;
      _110 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].z) * _109;
      _111 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].w) * _109;
      __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_115.x, _115.y);
      _124 = float((int)(int(float((int)((int)(_115.x)))))) + 0.5f;
      _125 = float((int)(int(float((int)((int)(_115.y)))))) + 0.5f;
      _190 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0));
      _203 = (saturate(_190.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _204 = (saturate(_190.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _205 = (saturate(_190.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _207 = rsqrt(dot(float3(_203, _204, _205), float3(_203, _204, _205)));
      _219 = abs(dot(float3((_207 * _203), (_207 * _204), (_205 * _207)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _222 = saturate((_219 * _219) * 2.0f);
      _224 = (_72 * 0.10000000149011612f) * _100;
      _225 = _224 + TEXCOORD.x;
      _226 = _224 + TEXCOORD.y;
      _228 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_225, _226));
      _238 = (pow(_228.x, 0.012683313339948654f));
      _239 = (pow(_228.y, 0.012683313339948654f));
      _240 = (pow(_228.z, 0.012683313339948654f));
      _268 = dot(float3((exp2(log2(max(0.0f, (_238 + -0.8359375f)) / (18.8515625f - (_238 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_240 + -0.8359375f)) / (18.8515625f - (_240 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _271 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + -0.0020000000949949026f), (_226 + -0.0020000000949949026f)));
      _281 = (pow(_271.x, 0.012683313339948654f));
      _282 = (pow(_271.y, 0.012683313339948654f));
      _283 = (pow(_271.z, 0.012683313339948654f));
      _311 = dot(float3((exp2(log2(max(0.0f, (_281 + -0.8359375f)) / (18.8515625f - (_281 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_282 + -0.8359375f)) / (18.8515625f - (_282 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_283 + -0.8359375f)) / (18.8515625f - (_283 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _314 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + 0.0020000000949949026f), (_226 + 0.0020000000949949026f)));
      _324 = (pow(_314.x, 0.012683313339948654f));
      _325 = (pow(_314.y, 0.012683313339948654f));
      _326 = (pow(_314.z, 0.012683313339948654f));
      _354 = dot(float3((exp2(log2(max(0.0f, (_324 + -0.8359375f)) / (18.8515625f - (_324 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_325 + -0.8359375f)) / (18.8515625f - (_325 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_326 + -0.8359375f)) / (18.8515625f - (_326 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _355 = WaveReadLaneFirst(_materialIndex);
      _363 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_355 < (uint)170000), _355, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainColor);
      _366 = float((uint)((uint)(((uint)(_363) >> 16) & 255)));
      _369 = float((uint)((uint)(((uint)(_363) >> 8) & 255)));
      _371 = float((uint)((uint)(_363 & 255)));
      _396 = select(((_366 * 0.003921568859368563f) < 0.040449999272823334f), (_366 * 0.0003035269910469651f), exp2(log2((_366 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _397 = select(((_369 * 0.003921568859368563f) < 0.040449999272823334f), (_369 * 0.0003035269910469651f), exp2(log2((_369 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _398 = select(((_371 * 0.003921568859368563f) < 0.040449999272823334f), (_371 * 0.0003035269910469651f), exp2(log2((_371 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _410 = max(0.0010000000474974513f, _exposure0.x);
      _427 = ((((((lerp(_396, 0.0010000000474974513f, _222)) / _410) * _311) - _311) * 0.4000000059604645f) + _311);
      _428 = ((((((lerp(_397, 0.0010000000474974513f, _222)) / _410) * _268) - _268) * 0.4000000059604645f) + _268);
      _429 = ((((((lerp(_398, 0.0010000000474974513f, _222)) / _410) * _354) - _354) * 0.4000000059604645f) + _354);
      _430 = ((saturate(float((int)((((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 - _110)), int(_125 * (_105 - _111)), 0)))).x) & 255) == _renderPassKnowledgeGain))) + ((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * _104), int(_125 * _105), 0)))).x) & 255) == _renderPassKnowledgeGain)))) + ((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 + _110)), int(_125 * (_105 + _111)), 0)))).x) & 255) == _renderPassKnowledgeGain)))))) * _60) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _69.x)) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _104), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _105), 0)))).x))))));
    } else {
      _427 = 0.0f;
      _428 = 0.0f;
      _429 = 0.0f;
      _430 = 0.0f;
    }
  } else {
    _427 = 0.0f;
    _428 = 0.0f;
    _429 = 0.0f;
    _430 = 0.0f;
  }
  _431 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _444 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _431, 0)))).x) & 127))) + 0.5f);
  } else {
    _444 = _430;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_427, _428, _429));
    _866 = output_color.x;
    _867 = output_color.y;
    _868 = output_color.z;
  } else {
    _866 = _427;
    _867 = _428;
    _868 = _429;
  }
  if (_etcParams.y > 1.0f) {
    _879 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _880 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _884 = saturate(1.0f - (dot(float2(_879, _880), float2(_879, _880)) * saturate(_etcParams.y + -1.0f)));
    _889 = (_884 * _866);
    _890 = (_884 * _867);
    _891 = (_884 * _868);
  } else {
    _889 = _866;
    _890 = _867;
    _891 = _868;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _924 = select((_889 <= 0.0031308000907301903f), (_889 * 12.920000076293945f), (((pow(_889, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _925 = select((_890 <= 0.0031308000907301903f), (_890 * 12.920000076293945f), (((pow(_890, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _926 = select((_891 <= 0.0031308000907301903f), (_891 * 12.920000076293945f), (((pow(_891, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _924 = _889;
    _925 = _890;
    _926 = _891;
  }
  if (!(_etcParams.y < 1.0f)) {
    _931 = float((uint)_431);
    if (!(_931 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_931 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _940 = _924;
        _941 = _925;
        _942 = _926;
      } else {
        _940 = 0.0f;
        _941 = 0.0f;
        _942 = 0.0f;
      }
    } else {
      _940 = 0.0f;
      _941 = 0.0f;
      _942 = 0.0f;
    }
  } else {
    _940 = _924;
    _941 = _925;
    _942 = _926;
  }
  _952 = exp2(log2(_940 * 9.999999747378752e-05f) * 0.1593017578125f);
  _953 = exp2(log2(_941 * 9.999999747378752e-05f) * 0.1593017578125f);
  _954 = exp2(log2(_942 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_952 * 18.6875f) + 1.0f)) * ((_952 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_953 * 18.6875f) + 1.0f)) * ((_953 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_954 * 18.6875f) + 1.0f)) * ((_954 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _444;
  return SV_Target;
}