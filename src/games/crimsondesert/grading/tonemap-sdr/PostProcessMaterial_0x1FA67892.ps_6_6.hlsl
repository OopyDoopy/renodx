#include "../tonemap.hlsli"

struct PostProcessScreenDamage_CDStruct {
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor1;
  uint _borderColor2;
  uint _sceneColorTint;
  uint _borderEdgeNoiseTexture;
  uint _borderInsideDistortionTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessScreenDamage_CD {
  PostProcessScreenDamage_CDStruct BindlessParameters_PostProcessScreenDamage_CD;
};

typedef BindlessParameters_PostProcessScreenDamage_CD BindlessParameters_PostProcessScreenDamage_CD_t;
ConstantBuffer<BindlessParameters_PostProcessScreenDamage_CD_t> BindlessParameters_PostProcessScreenDamage_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _24;
  float _35;
  float _36;
  float _37;
  float _62;
  float _63;
  float _64;
  float _403;
  float _404;
  float _405;
  float _419;
  float _624;
  float _625;
  float _626;
  float _719;
  float _720;
  float _721;
  float _841;
  float _842;
  float _843;
  float _864;
  float _865;
  float _866;
  float _899;
  float _900;
  float _901;
  float _915;
  float _916;
  float _917;
  float _70;
  float _76;
  float _78;
  int _79;
  float _88;
  float _89;
  int _92;
  float _101;
  float _102;
  float _109;
  int _112;
  int _120;
  float _129;
  int _132;
  int _140;
  int _149;
  float _157;
  float _163;
  float _166;
  float _167;
  int _180;
  float _189;
  float _190;
  int _194;
  float _202;
  int _207;
  float _215;
  float _221;
  int _222;
  int _230;
  float _233;
  float _236;
  float _238;
  float _269;
  int _273;
  int _281;
  float _284;
  float _287;
  float _289;
  float _314;
  float _315;
  float _316;
  int _317;
  int _325;
  float _328;
  float _331;
  float _333;
  float _367;
  float _380;
  float _390;
  float _391;
  float _392;
  uint _406;
  float _428;
  float _477;
  float _478;
  float _479;
  float _481;
  float _488;
  float _489;
  float _490;
  float _509;
  float _510;
  float _511;
  float _512;
  float _513;
  float _514;
  float _515;
  float _516;
  float _517;
  float _563;
  float _564;
  float _565;
  float _566;
  float _567;
  float _568;
  float _569;
  float _586;
  float _587;
  float _588;
  float _589;
  float _595;
  float _598;
  float _605;
  float _606;
  float _607;
  float _636;
  float _661;
  float _662;
  float _663;
  float _682;
  float _683;
  float _684;
  float _690;
  float _694;
  float _695;
  float _696;
  float _697;
  float _702;
  float _727;
  float _731;
  float _732;
  float _733;
  float _734;
  int _775;
  float _830;
  float _854;
  float _855;
  float _859;
  float _906;
  float _927;
  float _928;
  float _929;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _35 = (pow(_24.x, 0.012683313339948654f));
  _36 = (pow(_24.y, 0.012683313339948654f));
  _37 = (pow(_24.z, 0.012683313339948654f));
  _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  if (!(_hpPercentage > 20.0f)) {
    _70 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if ((_hpPercentage > 0.0f) && (_70 > 0.0f)) {
      _76 = 0.12999999523162842f - (_hpPercentage * 0.006000000052154064f);
      _78 = 2.0f - (_hpPercentage * 0.05000000074505806f);
      _79 = WaveReadLaneFirst(_materialIndex);
      _88 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseTile.x);
      _89 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseTile.y);
      _92 = WaveReadLaneFirst(_materialIndex);
      _101 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseOffset.x);
      _102 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseOffset.y);
      _109 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f;
      _112 = WaveReadLaneFirst(_materialIndex);
      _120 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_112 < (uint)170000), _112, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderInsideDistortionTexture);
      _129 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_120 < (uint)65000), _120, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_109 + (TEXCOORD.x * 12.0f)), (_109 + (TEXCOORD.y * 6.0f)))))).x) * 0.10000000149011612f;
      _132 = WaveReadLaneFirst(_materialIndex);
      _140 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseTexture);
      _149 = WaveReadLaneFirst(_materialIndex);
      _157 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_149 < (uint)170000), _149, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderSmoothness);
      _163 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      _166 = max((abs(TEXCOORD.x + -0.5f) - _163), 0.0f);
      _167 = max((abs(TEXCOORD.y + -0.5f) - _163), 0.0f);
      _180 = WaveReadLaneFirst(_materialIndex);
      _189 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderFlickerOpacityMinMax.x);
      _190 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderFlickerOpacityMinMax.y);
      _194 = WaveReadLaneFirst(_materialIndex);
      _202 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_194 < (uint)170000), _194, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderFlickerIntensity);
      _207 = WaveReadLaneFirst(_materialIndex);
      _215 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderEdgeNoiseRatio);
      _221 = min(max(_70, 0.0f), 1.0f) * saturate((saturate(((((_190 - _189) * sin(frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _78) * 3.1415927410125732f)) + _189) * saturate(sqrt((_167 * _167) + (_166 * _166)) / _157)) * _202) * 2.0f) - (_215 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_140 < (uint)65000), _140, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_101 + (_88 * TEXCOORD.x)) + _129), ((_102 + (_89 * TEXCOORD.y)) + _129))))).x)));
      _222 = WaveReadLaneFirst(_materialIndex);
      _230 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._sceneColorTint);
      _233 = float((uint)((uint)(((uint)(_230) >> 16) & 255)));
      _236 = float((uint)((uint)(((uint)(_230) >> 8) & 255)));
      _238 = float((uint)((uint)(_230 & 255)));
      _269 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      _273 = WaveReadLaneFirst(_materialIndex);
      _281 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_273 < (uint)170000), _273, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderColor1);
      _284 = float((uint)((uint)(((uint)(_281) >> 16) & 255)));
      _287 = float((uint)((uint)(((uint)(_281) >> 8) & 255)));
      _289 = float((uint)((uint)(_281 & 255)));
      _314 = select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _315 = select(((_287 * 0.003921568859368563f) < 0.040449999272823334f), (_287 * 0.0003035269910469651f), exp2(log2((_287 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _316 = select(((_289 * 0.003921568859368563f) < 0.040449999272823334f), (_289 * 0.0003035269910469651f), exp2(log2((_289 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      _317 = WaveReadLaneFirst(_materialIndex);
      _325 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_317 < (uint)170000), _317, 0)) + 0u))].BindlessParameters_PostProcessScreenDamage_CD._borderColor2);
      _328 = float((uint)((uint)(((uint)(_325) >> 16) & 255)));
      _331 = float((uint)((uint)(((uint)(_325) >> 8) & 255)));
      _333 = float((uint)((uint)(_325 & 255)));
      _367 = saturate(sin(frac(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _78) * 3.1415927410125732f));
      _380 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      _390 = (((_269 * select(((_233 * 0.003921568859368563f) < 0.040449999272823334f), (_233 * 0.0003035269910469651f), exp2(log2((_233 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _62) * _76) + _62;
      _391 = (((_269 * select(((_236 * 0.003921568859368563f) < 0.040449999272823334f), (_236 * 0.0003035269910469651f), exp2(log2((_236 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _63) * _76) + _63;
      _392 = (((_269 * select(((_238 * 0.003921568859368563f) < 0.040449999272823334f), (_238 * 0.0003035269910469651f), exp2(log2((_238 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _64) * _76) + _64;
      _403 = ((((_380 * ((_367 * (select(((_328 * 0.003921568859368563f) < 0.040449999272823334f), (_328 * 0.0003035269910469651f), exp2(log2((_328 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _314)) + _314)) - _390) * _221) + _390);
      _404 = ((((_380 * ((_367 * (select(((_331 * 0.003921568859368563f) < 0.040449999272823334f), (_331 * 0.0003035269910469651f), exp2(log2((_331 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _315)) + _315)) - _391) * _221) + _391);
      _405 = ((((_380 * ((_367 * (select(((_333 * 0.003921568859368563f) < 0.040449999272823334f), (_333 * 0.0003035269910469651f), exp2(log2((_333 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _316)) + _316)) - _392) * _221) + _392);
    } else {
      _403 = _62;
      _404 = _63;
      _405 = _64;
    }
  } else {
    _403 = _62;
    _404 = _63;
    _405 = _64;
  }
  _406 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _419 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _406, 0)))).x) & 127))) + 0.5f);
  } else {
    _419 = _24.w;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_403, _404, _405));
    _841 = output_color.x;
    _842 = output_color.y;
    _843 = output_color.z;
  } else {
    _841 = _403;
    _842 = _404;
    _843 = _405;
  }
  if (_etcParams.y > 1.0f) {
    _854 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _855 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _859 = saturate(1.0f - (dot(float2(_854, _855), float2(_854, _855)) * saturate(_etcParams.y + -1.0f)));
    _864 = (_859 * _841);
    _865 = (_859 * _842);
    _866 = (_859 * _843);
  } else {
    _864 = _841;
    _865 = _842;
    _866 = _843;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _899 = select((_864 <= 0.0031308000907301903f), (_864 * 12.920000076293945f), (((pow(_864, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _900 = select((_865 <= 0.0031308000907301903f), (_865 * 12.920000076293945f), (((pow(_865, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _901 = select((_866 <= 0.0031308000907301903f), (_866 * 12.920000076293945f), (((pow(_866, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _899 = _864;
    _900 = _865;
    _901 = _866;
  }
  if (!(_etcParams.y < 1.0f)) {
    _906 = float((uint)_406);
    if (!(_906 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_906 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _915 = _899;
        _916 = _900;
        _917 = _901;
      } else {
        _915 = 0.0f;
        _916 = 0.0f;
        _917 = 0.0f;
      }
    } else {
      _915 = 0.0f;
      _916 = 0.0f;
      _917 = 0.0f;
    }
  } else {
    _915 = _899;
    _916 = _900;
    _917 = _901;
  }
  _927 = exp2(log2(_915 * 9.999999747378752e-05f) * 0.1593017578125f);
  _928 = exp2(log2(_916 * 9.999999747378752e-05f) * 0.1593017578125f);
  _929 = exp2(log2(_917 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_927 * 18.6875f) + 1.0f)) * ((_927 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_928 * 18.6875f) + 1.0f)) * ((_928 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_929 * 18.6875f) + 1.0f)) * ((_929 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _419;
  return SV_Target;
}