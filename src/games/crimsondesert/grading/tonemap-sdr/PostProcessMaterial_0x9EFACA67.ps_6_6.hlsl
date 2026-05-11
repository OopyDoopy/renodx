#include "../tonemap.hlsli"

struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessGhost_CD {
  PostProcessGhost_CDStruct BindlessParameters_PostProcessGhost_CD;
};

typedef BindlessParameters_PostProcessGhost_CD BindlessParameters_PostProcessGhost_CD_t;
ConstantBuffer<BindlessParameters_PostProcessGhost_CD_t> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

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
  float4 _33;
  float _43;
  float _44;
  float _45;
  float _70;
  float _71;
  float _72;
  int _73;
  float _81;
  float _177;
  float _178;
  float _419;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  float _425;
  float _446;
  float _447;
  float _448;
  float _462;
  float _667;
  float _668;
  float _669;
  float _762;
  float _763;
  float _764;
  float _884;
  float _885;
  float _886;
  float _907;
  float _908;
  float _909;
  float _942;
  float _943;
  float _944;
  float _958;
  float _959;
  float _960;
  float _85;
  int _92;
  int _100;
  float4 _107;
  int _111;
  float _119;
  int _120;
  float _128;
  float _130;
  float _133;
  float _134;
  uint2 _136;
  uint _151;
  float _161;
  float _162;
  float _164;
  float _165;
  float _166;
  float _180;
  float _181;
  float _182;
  float _183;
  float _185;
  float _186;
  float _187;
  float _188;
  uint _198;
  uint _199;
  uint4 _201;
  float4 _204;
  float _222;
  float _223;
  float _224;
  float _226;
  float _227;
  float _228;
  float _229;
  float _232;
  float _233;
  float _236;
  float _237;
  float _241;
  float _243;
  float _244;
  float _245;
  float _246;
  float _248;
  float _251;
  float _252;
  float _253;
  float _254;
  float _263;
  float _267;
  float _271;
  float _273;
  float _295;
  float _296;
  float _299;
  int _300;
  float _308;
  float _309;
  int _310;
  float _318;
  float _328;
  float _329;
  float _330;
  float _332;
  float _338;
  int _339;
  int _347;
  float _356;
  float _357;
  float _358;
  float _370;
  int _374;
  int _382;
  float _396;
  float _397;
  float _398;
  float _399;
  float _406;
  float _407;
  float _408;
  int _426;
  float _434;
  float _435;
  uint _449;
  float _471;
  float _520;
  float _521;
  float _522;
  float _524;
  float _531;
  float _532;
  float _533;
  float _552;
  float _553;
  float _554;
  float _555;
  float _556;
  float _557;
  float _558;
  float _559;
  float _560;
  float _606;
  float _607;
  float _608;
  float _609;
  float _610;
  float _611;
  float _612;
  float _629;
  float _630;
  float _631;
  float _632;
  float _638;
  float _641;
  float _648;
  float _649;
  float _650;
  float _679;
  float _704;
  float _705;
  float _706;
  float _725;
  float _726;
  float _727;
  float _733;
  float _737;
  float _738;
  float _739;
  float _740;
  float _745;
  float _770;
  float _774;
  float _775;
  float _776;
  float _777;
  int _818;
  float _873;
  float _897;
  float _898;
  float _902;
  float _949;
  float _970;
  float _971;
  float _972;
  float _24[36];
  _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _43 = (pow(_33.x, 0.012683313339948654f));
  _44 = (pow(_33.y, 0.012683313339948654f));
  _45 = (pow(_33.z, 0.012683313339948654f));
  _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _73 = WaveReadLaneFirst(_materialIndex);
  _81 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
  if (!(_81 < 0.0010000000474974513f)) {
    _85 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    _92 = WaveReadLaneFirst(_materialIndex);
    _100 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseTex);
    _107 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_100 < (uint)65000), _100, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _85), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f) + (_85 * TEXCOORD.y))));
    _111 = WaveReadLaneFirst(_materialIndex);
    _119 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_111 < (uint)170000), _111, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _120 = WaveReadLaneFirst(_materialIndex);
    _128 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseIntensity);
    _130 = _128 * (_119 * _107.y);
    _133 = (_130 * 0.009999999776482582f) + TEXCOORD.x;
    _134 = (_130 * 0.05000000074505806f) + TEXCOORD.y;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_136.x, _136.y);
    _151 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_136.x)))))) + 0.5f) * _133), int((float((int)(int(float((int)((int)(_136.y)))))) + 0.5f) * _134), 0));
    _161 = (float((uint)((uint)((uint)((uint)(_151.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _162 = (float((uint)((uint)(((uint)((uint)(_151.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _164 = 1.0f - abs(_161);
    _165 = abs(_162);
    _166 = _164 - _165;
    if (_166 < 0.0f) {
      _177 = (select((_161 >= 0.0f), 1.0f, -1.0f) * (1.0f - _165));
      _178 = (select((_162 >= 0.0f), 1.0f, -1.0f) * _164);
    } else {
      _177 = _161;
      _178 = _162;
    }
    _180 = rsqrt(dot(float3(_177, _178, _166), float3(_177, _178, _166)));
    _181 = _180 * _177;
    _182 = _180 * _178;
    _183 = _180 * _166;
    _185 = rsqrt(dot(float3(_181, _182, _183), float3(_181, _182, _183)));
    _186 = _185 * _181;
    _187 = _185 * _182;
    _188 = _185 * _183;
    if ((_151.x & 255) == _renderPassNPCGhost) {
      _198 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _133);
      _199 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _134);
      _201 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_198, _199, 0));
      _204 = __3__36__0__0__g_gbufferNormal.Load(int3(_198, _199, 0));
      _222 = (saturate(_204.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _223 = (saturate(_204.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _224 = (saturate(_204.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _226 = rsqrt(dot(float3(_222, _223, _224), float3(_222, _223, _224)));
      _227 = _226 * _222;
      _228 = _226 * _223;
      _229 = _224 * _226;
      _232 = (float((uint)((uint)(((uint)((uint)(_201.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _233 = (float((uint)((uint)(_201.w & 255))) * 0.007843137718737125f) + -1.0f;
      _236 = (_232 + _233) * 0.5f;
      _237 = (_232 - _233) * 0.5f;
      _241 = (1.0f - abs(_236)) - abs(_237);
      _243 = rsqrt(dot(float3(_236, _237, _241), float3(_236, _237, _241)));
      _244 = _243 * _236;
      _245 = _243 * _237;
      _246 = _243 * _241;
      _248 = select((_229 >= 0.0f), 1.0f, -1.0f);
      _251 = -0.0f - (1.0f / (_248 + _229));
      _252 = _228 * _251;
      _253 = _252 * _227;
      _254 = _248 * _227;
      _263 = mad(_246, _227, mad(_245, _253, ((((_254 * _227) * _251) + 1.0f) * _244)));
      _267 = mad(_246, _228, mad(_245, (_248 + (_252 * _228)), ((_244 * _248) * _253)));
      _271 = mad(_246, _229, mad(_245, (-0.0f - _228), (-0.0f - (_254 * _244))));
      _273 = rsqrt(dot(float3(_263, _267, _271), float3(_263, _267, _271)));
      _295 = saturate(1.0f - dot(float3(((((_273 * _263) - _186) * 0.20000000298023224f) + _186), ((((_273 * _267) - _187) * 0.20000000298023224f) + _187), ((((_273 * _271) - _188) * 0.20000000298023224f) + _188)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _296 = _295 * 2.0f;
      _299 = 1.0f - saturate(_296 * _295);
      _300 = WaveReadLaneFirst(_materialIndex);
      _308 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_300 < (uint)170000), _300, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
      _309 = _308 * _299;
      _310 = WaveReadLaneFirst(_materialIndex);
      _318 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColorInnerBrightness);
      _328 = (((_318 * _70) - _70) * _309) + _70;
      _329 = (((_318 * _71) - _71) * _309) + _71;
      _330 = (((_318 * _72) - _72) * _309) + _72;
      _332 = _295 * _299;
      _338 = saturate(_107.x * 40.0f) * saturate((_332 * _332) * 30.0f);
      _339 = WaveReadLaneFirst(_materialIndex);
      _347 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColor1);
      _356 = float((uint)((uint)(((uint)(_347) >> 16) & 255))) * 0.003921568859368563f;
      _357 = float((uint)((uint)(((uint)(_347) >> 8) & 255))) * 0.003921568859368563f;
      _358 = float((uint)((uint)(_347 & 255))) * 0.003921568859368563f;
      _370 = max(0.0010000000474974513f, _exposure0.x);
      _374 = WaveReadLaneFirst(_materialIndex);
      _382 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColor2);
      _396 = max(0.0010000000474974513f, _exposure0.x);
      _397 = (float((uint)((uint)(((uint)(_382) >> 16) & 255))) * 0.003921568859368563f) / _396;
      _398 = (float((uint)((uint)(((uint)(_382) >> 8) & 255))) * 0.003921568859368563f) / _396;
      _399 = (float((uint)((uint)(_382 & 255))) * 0.003921568859368563f) / _396;
      _406 = ((_328 - _397) * 0.10000000149011612f) + _397;
      _407 = ((_329 - _398) * 0.10000000149011612f) + _398;
      _408 = ((_330 - _399) * 0.10000000149011612f) + _399;
      _419 = _328;
      _420 = _329;
      _421 = _330;
      _422 = saturate(_296);
      _423 = (((((lerp(_356, _107.x, 0.10000000149011612f)) / _370) - _406) * _338) + _406);
      _424 = (((((lerp(_357, _107.y, 0.10000000149011612f)) / _370) - _407) * _338) + _407);
      _425 = (((((lerp(_358, _107.z, 0.10000000149011612f)) / _370) - _408) * _338) + _408);
    } else {
      _419 = _70;
      _420 = _71;
      _421 = _72;
      _422 = 0.0f;
      _423 = _70;
      _424 = _71;
      _425 = _72;
    }
    _426 = WaveReadLaneFirst(_materialIndex);
    _434 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _435 = _434 * _422;
    _446 = ((_435 * (_423 - _419)) + _419);
    _447 = ((_435 * (_424 - _420)) + _420);
    _448 = ((_435 * (_425 - _421)) + _421);
  } else {
    _446 = _70;
    _447 = _71;
    _448 = _72;
  }
  _449 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _462 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _449, 0)))).x) & 127))) + 0.5f);
  } else {
    _462 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_446, _447, _448));
    _884 = output_color.x;
    _885 = output_color.y;
    _886 = output_color.z;
  } else {
    _884 = _446;
    _885 = _447;
    _886 = _448;
  }
  if (_etcParams.y > 1.0f) {
    _897 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _898 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _902 = saturate(1.0f - (dot(float2(_897, _898), float2(_897, _898)) * saturate(_etcParams.y + -1.0f)));
    _907 = (_902 * _884);
    _908 = (_902 * _885);
    _909 = (_902 * _886);
  } else {
    _907 = _884;
    _908 = _885;
    _909 = _886;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _942 = select((_907 <= 0.0031308000907301903f), (_907 * 12.920000076293945f), (((pow(_907, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _943 = select((_908 <= 0.0031308000907301903f), (_908 * 12.920000076293945f), (((pow(_908, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _944 = select((_909 <= 0.0031308000907301903f), (_909 * 12.920000076293945f), (((pow(_909, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _942 = _907;
    _943 = _908;
    _944 = _909;
  }
  if (!(_etcParams.y < 1.0f)) {
    _949 = float((uint)_449);
    if (!(_949 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_949 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _958 = _942;
        _959 = _943;
        _960 = _944;
      } else {
        _958 = 0.0f;
        _959 = 0.0f;
        _960 = 0.0f;
      }
    } else {
      _958 = 0.0f;
      _959 = 0.0f;
      _960 = 0.0f;
    }
  } else {
    _958 = _942;
    _959 = _943;
    _960 = _944;
  }
  _970 = exp2(log2(_958 * 9.999999747378752e-05f) * 0.1593017578125f);
  _971 = exp2(log2(_959 * 9.999999747378752e-05f) * 0.1593017578125f);
  _972 = exp2(log2(_960 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_970 * 18.6875f) + 1.0f)) * ((_970 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_971 * 18.6875f) + 1.0f)) * ((_971 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_972 * 18.6875f) + 1.0f)) * ((_972 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _462;
  return SV_Target;
}