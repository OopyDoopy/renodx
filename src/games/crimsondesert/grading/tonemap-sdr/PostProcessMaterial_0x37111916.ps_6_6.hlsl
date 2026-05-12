#include "../tonemap.hlsli"

struct PostProcessHousing_CDStruct {
  float _housingPreviewRatio;
  uint _housingValidColor;
  uint _housingInvalidColor;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessHousing_CD {
  PostProcessHousing_CDStruct BindlessParameters_PostProcessHousing_CD;
};

typedef BindlessParameters_PostProcessHousing_CD BindlessParameters_PostProcessHousing_CD_t;
ConstantBuffer<BindlessParameters_PostProcessHousing_CD_t> BindlessParameters_PostProcessHousing_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _24;
  float _34;
  float _35;
  float _36;
  float _61;
  float _62;
  float _63;
  uint2 _65;
  uint _80;
  float _90;
  float _91;
  float _93;
  float _94;
  float _95;
  float _106;
  float _107;
  float _143;
  float _271;
  float _474;
  float _475;
  float _476;
  float _569;
  float _570;
  float _571;
  float _691;
  float _692;
  float _693;
  float _714;
  float _715;
  float _716;
  float _749;
  float _750;
  float _751;
  float _765;
  float _766;
  float _767;
  float _109;
  float _110;
  float _111;
  float _112;
  float _114;
  int _132;
  float _140;
  int _144;
  int _152;
  float _155;
  float _158;
  float _160;
  float _185;
  float _186;
  float _187;
  int _188;
  int _196;
  float _199;
  float _202;
  float _204;
  float _245;
  float _255;
  float _256;
  float _257;
  uint _258;
  float _278;
  float _327;
  float _328;
  float _329;
  float _331;
  float _338;
  float _339;
  float _340;
  float _359;
  float _360;
  float _361;
  float _362;
  float _363;
  float _364;
  float _365;
  float _366;
  float _367;
  float _413;
  float _414;
  float _415;
  float _416;
  float _417;
  float _418;
  float _419;
  float _436;
  float _437;
  float _438;
  float _439;
  float _445;
  float _448;
  float _455;
  float _456;
  float _457;
  float _486;
  float _511;
  float _512;
  float _513;
  float _532;
  float _533;
  float _534;
  float _540;
  float _544;
  float _545;
  float _546;
  float _547;
  float _552;
  float _577;
  float _581;
  float _582;
  float _583;
  float _584;
  int _625;
  float _680;
  float _704;
  float _705;
  float _709;
  float _756;
  float _777;
  float _778;
  float _779;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = (pow(_24.x, 0.012683313339948654f));
  _35 = (pow(_24.y, 0.012683313339948654f));
  _36 = (pow(_24.z, 0.012683313339948654f));
  _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_65.x, _65.y);
  _80 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_65.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_65.y)))))) + 0.5f) * TEXCOORD.y), 0));
  _90 = (float((uint)((uint)((uint)((uint)(_80.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _91 = (float((uint)((uint)(((uint)((uint)(_80.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _93 = 1.0f - abs(_90);
  _94 = abs(_91);
  _95 = _93 - _94;
  if (_95 < 0.0f) {
    _106 = (select((_90 >= 0.0f), 1.0f, -1.0f) * (1.0f - _94));
    _107 = (select((_91 >= 0.0f), 1.0f, -1.0f) * _93);
  } else {
    _106 = _90;
    _107 = _91;
  }
  _109 = rsqrt(dot(float3(_106, _107, _95), float3(_106, _107, _95)));
  _110 = _109 * _106;
  _111 = _109 * _107;
  _112 = _109 * _95;
  _114 = rsqrt(dot(float3(_110, _111, _112), float3(_110, _111, _112)));
  if ((_80.x & 255) == _renderPassHousing) {
    _132 = WaveReadLaneFirst(_materialIndex);
    _140 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingPreviewRatio);
    _143 = (_140 * (1.0f - abs(dot(float3((_114 * _110), (_114 * _111), (_114 * _112)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))))));
  } else {
    _143 = 0.0f;
  }
  _144 = WaveReadLaneFirst(_materialIndex);
  _152 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingValidColor);
  _155 = float((uint)((uint)(((uint)(_152) >> 16) & 255)));
  _158 = float((uint)((uint)(((uint)(_152) >> 8) & 255)));
  _160 = float((uint)((uint)(_152 & 255)));
  _185 = select(((_155 * 0.003921568859368563f) < 0.040449999272823334f), (_155 * 0.0003035269910469651f), exp2(log2((_155 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _186 = select(((_158 * 0.003921568859368563f) < 0.040449999272823334f), (_158 * 0.0003035269910469651f), exp2(log2((_158 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _187 = select(((_160 * 0.003921568859368563f) < 0.040449999272823334f), (_160 * 0.0003035269910469651f), exp2(log2((_160 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _188 = WaveReadLaneFirst(_materialIndex);
  _196 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_188 < (uint)170000), _188, 0)) + 0u))].BindlessParameters_PostProcessHousing_CD._housingInvalidColor);
  _199 = float((uint)((uint)(((uint)(_196) >> 16) & 255)));
  _202 = float((uint)((uint)(((uint)(_196) >> 8) & 255)));
  _204 = float((uint)((uint)(_196 & 255)));
  _245 = max(0.0010000000474974513f, _exposure0.x);
  _255 = (((((_housingPreviewState * (select(((_199 * 0.003921568859368563f) < 0.040449999272823334f), (_199 * 0.0003035269910469651f), exp2(log2((_199 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _185)) + _185) / _245) - _61) * _143) + _61;
  _256 = (((((_housingPreviewState * (select(((_202 * 0.003921568859368563f) < 0.040449999272823334f), (_202 * 0.0003035269910469651f), exp2(log2((_202 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _186)) + _186) / _245) - _62) * _143) + _62;
  _257 = (((((_housingPreviewState * (select(((_204 * 0.003921568859368563f) < 0.040449999272823334f), (_204 * 0.0003035269910469651f), exp2(log2((_204 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _187)) + _187) / _245) - _63) * _143) + _63;
  _258 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _271 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _258, 0)))).x) & 127))) + 0.5f);
  } else {
    _271 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_255, _256, _257));
    _691 = output_color.x;
    _692 = output_color.y;
    _693 = output_color.z;
  } else {
    _691 = _255;
    _692 = _256;
    _693 = _257;
  }
  if (_etcParams.y > 1.0f) {
    _704 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _705 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _709 = saturate(1.0f - (dot(float2(_704, _705), float2(_704, _705)) * saturate(_etcParams.y + -1.0f)));
    _714 = (_709 * _691);
    _715 = (_709 * _692);
    _716 = (_709 * _693);
  } else {
    _714 = _691;
    _715 = _692;
    _716 = _693;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _749 = select((_714 <= 0.0031308000907301903f), (_714 * 12.920000076293945f), (((pow(_714, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _750 = select((_715 <= 0.0031308000907301903f), (_715 * 12.920000076293945f), (((pow(_715, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _751 = select((_716 <= 0.0031308000907301903f), (_716 * 12.920000076293945f), (((pow(_716, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _749 = _714;
    _750 = _715;
    _751 = _716;
  }
  if (!(_etcParams.y < 1.0f)) {
    _756 = float((uint)_258);
    if (!(_756 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_756 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _765 = _749;
        _766 = _750;
        _767 = _751;
      } else {
        _765 = 0.0f;
        _766 = 0.0f;
        _767 = 0.0f;
      }
    } else {
      _765 = 0.0f;
      _766 = 0.0f;
      _767 = 0.0f;
    }
  } else {
    _765 = _749;
    _766 = _750;
    _767 = _751;
  }
  _777 = exp2(log2(_765 * 9.999999747378752e-05f) * 0.1593017578125f);
  _778 = exp2(log2(_766 * 9.999999747378752e-05f) * 0.1593017578125f);
  _779 = exp2(log2(_767 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_777 * 18.6875f) + 1.0f)) * ((_777 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_778 * 18.6875f) + 1.0f)) * ((_778 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_779 * 18.6875f) + 1.0f)) * ((_779 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _271;
  return SV_Target;
}