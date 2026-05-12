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
  int _37;
  float _45;
  float _141;
  float _142;
  float _383;
  float _384;
  float _385;
  float _386;
  float _387;
  float _388;
  float _389;
  float _410;
  float _411;
  float _412;
  float _426;
  float _631;
  float _632;
  float _633;
  float _726;
  float _727;
  float _728;
  float _848;
  float _849;
  float _850;
  float _871;
  float _872;
  float _873;
  float _906;
  float _907;
  float _908;
  float _922;
  float _923;
  float _924;
  float _49;
  int _56;
  int _64;
  float4 _71;
  int _75;
  float _83;
  int _84;
  float _92;
  float _94;
  float _97;
  float _98;
  uint2 _100;
  uint _115;
  float _125;
  float _126;
  float _128;
  float _129;
  float _130;
  float _144;
  float _145;
  float _146;
  float _147;
  float _149;
  float _150;
  float _151;
  float _152;
  uint _162;
  uint _163;
  uint4 _165;
  float4 _168;
  float _186;
  float _187;
  float _188;
  float _190;
  float _191;
  float _192;
  float _193;
  float _196;
  float _197;
  float _200;
  float _201;
  float _205;
  float _207;
  float _208;
  float _209;
  float _210;
  float _212;
  float _215;
  float _216;
  float _217;
  float _218;
  float _227;
  float _231;
  float _235;
  float _237;
  float _259;
  float _260;
  float _263;
  int _264;
  float _272;
  float _273;
  int _274;
  float _282;
  float _292;
  float _293;
  float _294;
  float _296;
  float _302;
  int _303;
  int _311;
  float _320;
  float _321;
  float _322;
  float _334;
  int _338;
  int _346;
  float _360;
  float _361;
  float _362;
  float _363;
  float _370;
  float _371;
  float _372;
  int _390;
  float _398;
  float _399;
  uint _413;
  float _435;
  float _484;
  float _485;
  float _486;
  float _488;
  float _495;
  float _496;
  float _497;
  float _516;
  float _517;
  float _518;
  float _519;
  float _520;
  float _521;
  float _522;
  float _523;
  float _524;
  float _570;
  float _571;
  float _572;
  float _573;
  float _574;
  float _575;
  float _576;
  float _593;
  float _594;
  float _595;
  float _596;
  float _602;
  float _605;
  float _612;
  float _613;
  float _614;
  float _643;
  float _668;
  float _669;
  float _670;
  float _689;
  float _690;
  float _691;
  float _697;
  float _701;
  float _702;
  float _703;
  float _704;
  float _709;
  float _734;
  float _738;
  float _739;
  float _740;
  float _741;
  int _782;
  float _837;
  float _861;
  float _862;
  float _866;
  float _913;
  float _24[36];
  _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _37 = WaveReadLaneFirst(_materialIndex);
  _45 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
  if (!(_45 < 0.0010000000474974513f)) {
    _49 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    _56 = WaveReadLaneFirst(_materialIndex);
    _64 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_56 < (uint)170000), _56, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseTex);
    _71 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_64 < (uint)65000), _64, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _49), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f) + (_49 * TEXCOORD.y))));
    _75 = WaveReadLaneFirst(_materialIndex);
    _83 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _84 = WaveReadLaneFirst(_materialIndex);
    _92 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_84 < (uint)170000), _84, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseIntensity);
    _94 = _92 * (_83 * _71.y);
    _97 = (_94 * 0.009999999776482582f) + TEXCOORD.x;
    _98 = (_94 * 0.05000000074505806f) + TEXCOORD.y;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_100.x, _100.y);
    _115 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_100.x)))))) + 0.5f) * _97), int((float((int)(int(float((int)((int)(_100.y)))))) + 0.5f) * _98), 0));
    _125 = (float((uint)((uint)((uint)((uint)(_115.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    _126 = (float((uint)((uint)(((uint)((uint)(_115.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    _128 = 1.0f - abs(_125);
    _129 = abs(_126);
    _130 = _128 - _129;
    if (_130 < 0.0f) {
      _141 = (select((_125 >= 0.0f), 1.0f, -1.0f) * (1.0f - _129));
      _142 = (select((_126 >= 0.0f), 1.0f, -1.0f) * _128);
    } else {
      _141 = _125;
      _142 = _126;
    }
    _144 = rsqrt(dot(float3(_141, _142, _130), float3(_141, _142, _130)));
    _145 = _144 * _141;
    _146 = _144 * _142;
    _147 = _144 * _130;
    _149 = rsqrt(dot(float3(_145, _146, _147), float3(_145, _146, _147)));
    _150 = _149 * _145;
    _151 = _149 * _146;
    _152 = _149 * _147;
    if ((_115.x & 255) == _renderPassNPCGhost) {
      _162 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _97);
      _163 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _98);
      _165 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_162, _163, 0));
      _168 = __3__36__0__0__g_gbufferNormal.Load(int3(_162, _163, 0));
      _186 = (saturate(_168.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      _187 = (saturate(_168.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      _188 = (saturate(_168.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      _190 = rsqrt(dot(float3(_186, _187, _188), float3(_186, _187, _188)));
      _191 = _190 * _186;
      _192 = _190 * _187;
      _193 = _188 * _190;
      _196 = (float((uint)((uint)(((uint)((uint)(_165.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      _197 = (float((uint)((uint)(_165.w & 255))) * 0.007843137718737125f) + -1.0f;
      _200 = (_196 + _197) * 0.5f;
      _201 = (_196 - _197) * 0.5f;
      _205 = (1.0f - abs(_200)) - abs(_201);
      _207 = rsqrt(dot(float3(_200, _201, _205), float3(_200, _201, _205)));
      _208 = _207 * _200;
      _209 = _207 * _201;
      _210 = _207 * _205;
      _212 = select((_193 >= 0.0f), 1.0f, -1.0f);
      _215 = -0.0f - (1.0f / (_212 + _193));
      _216 = _192 * _215;
      _217 = _216 * _191;
      _218 = _212 * _191;
      _227 = mad(_210, _191, mad(_209, _217, ((((_218 * _191) * _215) + 1.0f) * _208)));
      _231 = mad(_210, _192, mad(_209, (_212 + (_216 * _192)), ((_208 * _212) * _217)));
      _235 = mad(_210, _193, mad(_209, (-0.0f - _192), (-0.0f - (_218 * _208))));
      _237 = rsqrt(dot(float3(_227, _231, _235), float3(_227, _231, _235)));
      _259 = saturate(1.0f - dot(float3(((((_237 * _227) - _150) * 0.20000000298023224f) + _150), ((((_237 * _231) - _151) * 0.20000000298023224f) + _151), ((((_237 * _235) - _152) * 0.20000000298023224f) + _152)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
      _260 = _259 * 2.0f;
      _263 = 1.0f - saturate(_260 * _259);
      _264 = WaveReadLaneFirst(_materialIndex);
      _272 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_264 < (uint)170000), _264, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
      _273 = _272 * _263;
      _274 = WaveReadLaneFirst(_materialIndex);
      _282 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColorInnerBrightness);
      _292 = (((_282 * _33.x) - _33.x) * _273) + _33.x;
      _293 = (((_282 * _33.y) - _33.y) * _273) + _33.y;
      _294 = (((_282 * _33.z) - _33.z) * _273) + _33.z;
      _296 = _259 * _263;
      _302 = saturate(_71.x * 40.0f) * saturate((_296 * _296) * 30.0f);
      _303 = WaveReadLaneFirst(_materialIndex);
      _311 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_303 < (uint)170000), _303, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColor1);
      _320 = float((uint)((uint)(((uint)(_311) >> 16) & 255))) * 0.003921568859368563f;
      _321 = float((uint)((uint)(((uint)(_311) >> 8) & 255))) * 0.003921568859368563f;
      _322 = float((uint)((uint)(_311 & 255))) * 0.003921568859368563f;
      _334 = max(0.0010000000474974513f, _exposure0.x);
      _338 = WaveReadLaneFirst(_materialIndex);
      _346 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXColor2);
      _360 = max(0.0010000000474974513f, _exposure0.x);
      _361 = (float((uint)((uint)(((uint)(_346) >> 16) & 255))) * 0.003921568859368563f) / _360;
      _362 = (float((uint)((uint)(((uint)(_346) >> 8) & 255))) * 0.003921568859368563f) / _360;
      _363 = (float((uint)((uint)(_346 & 255))) * 0.003921568859368563f) / _360;
      _370 = ((_292 - _361) * 0.10000000149011612f) + _361;
      _371 = ((_293 - _362) * 0.10000000149011612f) + _362;
      _372 = ((_294 - _363) * 0.10000000149011612f) + _363;
      _383 = _292;
      _384 = _293;
      _385 = _294;
      _386 = saturate(_260);
      _387 = (((((lerp(_320, _71.x, 0.10000000149011612f)) / _334) - _370) * _302) + _370);
      _388 = (((((lerp(_321, _71.y, 0.10000000149011612f)) / _334) - _371) * _302) + _371);
      _389 = (((((lerp(_322, _71.z, 0.10000000149011612f)) / _334) - _372) * _302) + _372);
    } else {
      _383 = _33.x;
      _384 = _33.y;
      _385 = _33.z;
      _386 = 0.0f;
      _387 = _33.x;
      _388 = _33.y;
      _389 = _33.z;
    }
    _390 = WaveReadLaneFirst(_materialIndex);
    _398 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_390 < (uint)170000), _390, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _399 = _398 * _386;
    _410 = ((_399 * (_387 - _383)) + _383);
    _411 = ((_399 * (_388 - _384)) + _384);
    _412 = ((_399 * (_389 - _385)) + _385);
  } else {
    _410 = _33.x;
    _411 = _33.y;
    _412 = _33.z;
  }
  _413 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _426 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _413, 0)))).x) & 127))) + 0.5f);
  } else {
    _426 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_410, _411, _412));
    _848 = output_color.x;
    _849 = output_color.y;
    _850 = output_color.z;
  } else {
    _848 = _410;
    _849 = _411;
    _850 = _412;
  }
  if (_etcParams.y > 1.0f) {
    _861 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _862 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _866 = saturate(1.0f - (dot(float2(_861, _862), float2(_861, _862)) * saturate(_etcParams.y + -1.0f)));
    _871 = (_866 * _848);
    _872 = (_866 * _849);
    _873 = (_866 * _850);
  } else {
    _871 = _848;
    _872 = _849;
    _873 = _850;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _906 = select((_871 <= 0.0031308000907301903f), (_871 * 12.920000076293945f), (((pow(_871, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _907 = select((_872 <= 0.0031308000907301903f), (_872 * 12.920000076293945f), (((pow(_872, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _908 = select((_873 <= 0.0031308000907301903f), (_873 * 12.920000076293945f), (((pow(_873, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _906 = _871;
    _907 = _872;
    _908 = _873;
  }
  if (!(_etcParams.y < 1.0f)) {
    _913 = float((uint)_413);
    if (!(_913 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_913 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _922 = _906;
        _923 = _907;
        _924 = _908;
      } else {
        _922 = 0.0f;
        _923 = 0.0f;
        _924 = 0.0f;
      }
    } else {
      _922 = 0.0f;
      _923 = 0.0f;
      _924 = 0.0f;
    }
  } else {
    _922 = _906;
    _923 = _907;
    _924 = _908;
  }
  SV_Target.x = _922;
  SV_Target.y = _923;
  SV_Target.z = _924;
  SV_Target.w = _426;
  return SV_Target;
}