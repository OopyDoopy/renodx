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
  float _319;
  float _320;
  float _321;
  float _322;
  float _336;
  float _541;
  float _542;
  float _543;
  float _636;
  float _637;
  float _638;
  float _758;
  float _759;
  float _760;
  float _781;
  float _782;
  float _783;
  float _816;
  float _817;
  float _818;
  float _832;
  float _833;
  float _834;
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
  float _232;
  float4 _235;
  float _239;
  float4 _242;
  float _246;
  int _247;
  int _255;
  float _258;
  float _261;
  float _263;
  float _288;
  float _289;
  float _290;
  float _302;
  uint _323;
  float _345;
  float _394;
  float _395;
  float _396;
  float _398;
  float _405;
  float _406;
  float _407;
  float _426;
  float _427;
  float _428;
  float _429;
  float _430;
  float _431;
  float _432;
  float _433;
  float _434;
  float _480;
  float _481;
  float _482;
  float _483;
  float _484;
  float _485;
  float _486;
  float _503;
  float _504;
  float _505;
  float _506;
  float _512;
  float _515;
  float _522;
  float _523;
  float _524;
  float _553;
  float _578;
  float _579;
  float _580;
  float _599;
  float _600;
  float _601;
  float _607;
  float _611;
  float _612;
  float _613;
  float _614;
  float _619;
  float _644;
  float _648;
  float _649;
  float _650;
  float _651;
  int _692;
  float _747;
  float _771;
  float _772;
  float _776;
  float _823;
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
      _232 = dot(float3(_228.x, _228.y, _228.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _235 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + -0.0020000000949949026f), (_226 + -0.0020000000949949026f)));
      _239 = dot(float3(_235.x, _235.y, _235.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _242 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + 0.0020000000949949026f), (_226 + 0.0020000000949949026f)));
      _246 = dot(float3(_242.x, _242.y, _242.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      _247 = WaveReadLaneFirst(_materialIndex);
      _255 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_247 < (uint)170000), _247, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainColor);
      _258 = float((uint)((uint)(((uint)(_255) >> 16) & 255)));
      _261 = float((uint)((uint)(((uint)(_255) >> 8) & 255)));
      _263 = float((uint)((uint)(_255 & 255)));
      _288 = select(((_258 * 0.003921568859368563f) < 0.040449999272823334f), (_258 * 0.0003035269910469651f), exp2(log2((_258 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _289 = select(((_261 * 0.003921568859368563f) < 0.040449999272823334f), (_261 * 0.0003035269910469651f), exp2(log2((_261 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _290 = select(((_263 * 0.003921568859368563f) < 0.040449999272823334f), (_263 * 0.0003035269910469651f), exp2(log2((_263 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _302 = max(0.0010000000474974513f, _exposure0.x);
      _319 = ((((((lerp(_288, 0.0010000000474974513f, _222)) / _302) * _239) - _239) * 0.4000000059604645f) + _239);
      _320 = ((((((lerp(_289, 0.0010000000474974513f, _222)) / _302) * _232) - _232) * 0.4000000059604645f) + _232);
      _321 = ((((((lerp(_290, 0.0010000000474974513f, _222)) / _302) * _246) - _246) * 0.4000000059604645f) + _246);
      _322 = ((saturate(float((int)((((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 - _110)), int(_125 * (_105 - _111)), 0)))).x) & 255) == _renderPassKnowledgeGain))) + ((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * _104), int(_125 * _105), 0)))).x) & 255) == _renderPassKnowledgeGain)))) + ((int)(uint)((int)(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 + _110)), int(_125 * (_105 + _111)), 0)))).x) & 255) == _renderPassKnowledgeGain)))))) * _60) * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, _69.x)) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _104), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _105), 0)))).x))))));
    } else {
      _319 = 0.0f;
      _320 = 0.0f;
      _321 = 0.0f;
      _322 = 0.0f;
    }
  } else {
    _319 = 0.0f;
    _320 = 0.0f;
    _321 = 0.0f;
    _322 = 0.0f;
  }
  _323 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _336 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _323, 0)))).x) & 127))) + 0.5f);
  } else {
    _336 = _322;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_319, _320, _321));
    _758 = output_color.x;
    _759 = output_color.y;
    _760 = output_color.z;
  } else {
    _758 = _319;
    _759 = _320;
    _760 = _321;
  }
  if (_etcParams.y > 1.0f) {
    _771 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _772 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _776 = saturate(1.0f - (dot(float2(_771, _772), float2(_771, _772)) * saturate(_etcParams.y + -1.0f)));
    _781 = (_776 * _758);
    _782 = (_776 * _759);
    _783 = (_776 * _760);
  } else {
    _781 = _758;
    _782 = _759;
    _783 = _760;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _816 = select((_781 <= 0.0031308000907301903f), (_781 * 12.920000076293945f), (((pow(_781, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _817 = select((_782 <= 0.0031308000907301903f), (_782 * 12.920000076293945f), (((pow(_782, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _818 = select((_783 <= 0.0031308000907301903f), (_783 * 12.920000076293945f), (((pow(_783, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _816 = _781;
    _817 = _782;
    _818 = _783;
  }
  if (!(_etcParams.y < 1.0f)) {
    _823 = float((uint)_323);
    if (!(_823 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_823 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _832 = _816;
        _833 = _817;
        _834 = _818;
      } else {
        _832 = 0.0f;
        _833 = 0.0f;
        _834 = 0.0f;
      }
    } else {
      _832 = 0.0f;
      _833 = 0.0f;
      _834 = 0.0f;
    }
  } else {
    _832 = _816;
    _833 = _817;
    _834 = _818;
  }
  SV_Target.x = _832;
  SV_Target.y = _833;
  SV_Target.z = _834;
  SV_Target.w = _336;
  return SV_Target;
}