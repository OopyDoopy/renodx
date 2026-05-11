#include "../tonemap.hlsli"

struct PostProcessLensFlareForGimmick_CDStruct {
  uint _lensDirtTexture;
  uint _lensColorTableTexture;
  uint _noiseTex;
  uint _noiseTex2;
  float _lensflareRatio;
  float _sunFlareScale;
  float _sunFlareIntensity;
  float _sunFlareAnimSpeed;
  float _sunFlareWeightThreshold;
  float _sunFlareWeightIntensity;
  float _lensDirtIntensity;
  float _lensDirtThreshold;
  float _chromaticShiftValue;
  float _useFishUV;
  float _fishEyeIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

struct BindlessParameters_PostProcessLensFlareForGimmick_CD {
  PostProcessLensFlareForGimmick_CDStruct BindlessParameters_PostProcessLensFlareForGimmick_CD;
};

typedef BindlessParameters_PostProcessLensFlareForGimmick_CD BindlessParameters_PostProcessLensFlareForGimmick_CD_t;
ConstantBuffer<BindlessParameters_PostProcessLensFlareForGimmick_CD_t> BindlessParameters_PostProcessLensFlareForGimmick_CD[] : register(b0, space100);

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
  int _29;
  float _37;
  float _38;
  float _39;
  float _47;
  float _48;
  float _50;
  float4 _64;
  float _74;
  float _75;
  float _76;
  float _101;
  float _102;
  float _103;
  float _107;
  int _108;
  float _116;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _128;
  float _129;
  bool _130;
  float _138;
  float _175;
  float _176;
  float _705;
  float _706;
  float _707;
  float _721;
  float _926;
  float _927;
  float _928;
  float _1021;
  float _1022;
  float _1023;
  float _1143;
  float _1144;
  float _1145;
  float _1166;
  float _1167;
  float _1168;
  float _1201;
  float _1202;
  float _1203;
  float _1217;
  float _1218;
  float _1219;
  float _140;
  float _142;
  float _150;
  float _158;
  float _159;
  float _161;
  float _169;
  int _178;
  float _186;
  bool _187;
  float _190;
  float _191;
  float _192;
  float _232;
  float _235;
  float _236;
  float _238;
  float _272;
  float _273;
  float _275;
  bool _278;
  bool _279;
  bool _280;
  bool _281;
  bool _284;
  float _285;
  bool _286;
  bool _288;
  float _289;
  float _293;
  int _310;
  float _318;
  int _320;
  float _328;
  float _334;
  float _335;
  int _340;
  float _348;
  float _351;
  float _352;
  int _363;
  float _371;
  float _372;
  int _374;
  int _382;
  float4 _389;
  float _397;
  float _400;
  float _407;
  float _444;
  float _445;
  float _446;
  float _465;
  int _469;
  int _477;
  float _481;
  float _485;
  bool _488;
  bool _489;
  float4 _506;
  float _513;
  bool _516;
  bool _517;
  bool _518;
  bool _519;
  float4 _534;
  float _559;
  float _570;
  float _585;
  float _595;
  int _599;
  int _607;
  float4 _614;
  int _618;
  float _626;
  int _639;
  float _647;
  float _669;
  float _673;
  int _684;
  float _692;
  float _694;
  uint _708;
  float _730;
  float _779;
  float _780;
  float _781;
  float _783;
  float _790;
  float _791;
  float _792;
  float _811;
  float _812;
  float _813;
  float _814;
  float _815;
  float _816;
  float _817;
  float _818;
  float _819;
  float _865;
  float _866;
  float _867;
  float _868;
  float _869;
  float _870;
  float _871;
  float _888;
  float _889;
  float _890;
  float _891;
  float _897;
  float _900;
  float _907;
  float _908;
  float _909;
  float _938;
  float _963;
  float _964;
  float _965;
  float _984;
  float _985;
  float _986;
  float _992;
  float _996;
  float _997;
  float _998;
  float _999;
  float _1004;
  float _1029;
  float _1033;
  float _1034;
  float _1035;
  float _1036;
  int _1077;
  float _1132;
  float _1156;
  float _1157;
  float _1161;
  float _1208;
  float _1229;
  float _1230;
  float _1231;
  float _22[36];
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._chromaticShiftValue);
  _38 = TEXCOORD.x + -0.5f;
  _39 = TEXCOORD.y + -0.5f;
  _47 = rsqrt(dot(float2(_38, _39), float2(_38, _39))) * (sqrt((_39 * _39) + (_38 * _38)) * _37);
  _48 = _47 * _38;
  _50 = _47 * _39;
  _64 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _74 = (pow(_64.x, 0.012683313339948654f));
  _75 = (pow(_64.y, 0.012683313339948654f));
  _76 = (pow(_64.z, 0.012683313339948654f));
  _101 = exp2(log2(max(0.0f, (_74 + -0.8359375f)) / (18.8515625f - (_74 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _102 = exp2(log2(max(0.0f, (_75 + -0.8359375f)) / (18.8515625f - (_75 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _103 = exp2(log2(max(0.0f, (_76 + -0.8359375f)) / (18.8515625f - (_76 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _107 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _108 = WaveReadLaneFirst(_materialIndex);
  _116 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._fishEyeIntensity);
  _122 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  _123 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  _124 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _125 = 0.5f / _124;
  _126 = _122 + -0.5f;
  _127 = _123 - _125;
  _128 = dot(float2(_126, _127), float2(_126, _127));
  _129 = sqrt(_128);
  _130 = (_116 > 0.0f);
  if (_130) {
    _138 = sqrt(dot(float2(0.5f, _125), float2(0.5f, _125)));
  } else {
    if (!(_124 < 1.0f)) {
      _138 = _125;
    } else {
      _138 = 0.5f;
    }
  }
  if (_130) {
    _140 = rsqrt(_128);
    _142 = tan(_129 * _116);
    _150 = tan(_138 * _116);
    _175 = (((((_138 * _126) * _140) * _142) / _150) + 0.5f);
    _176 = (((((_138 * _127) * _140) * _142) / _150) + _125);
  } else {
    if (_116 < 0.0f) {
      _158 = rsqrt(_128);
      _159 = _116 * -10.0f;
      _161 = atan(_129 * _159);
      _169 = atan(_138 * _159);
      _175 = (((((_138 * _126) * _158) * _161) / _169) + 0.5f);
      _176 = (((((_138 * _127) * _158) * _161) / _169) + _125);
    } else {
      _175 = _122;
      _176 = _123;
    }
  }
  _178 = WaveReadLaneFirst(_materialIndex);
  _186 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._useFishUV);
  _187 = (_186 == 1.0f);
  _190 = select(_187, _175, TEXCOORD.x) + -0.5f;
  _191 = select(_187, (_176 * _124), TEXCOORD.y) + -0.5f;
  _192 = _190 * _107;
  _232 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].w), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].w), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].w) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].w);
  _235 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].z), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].z), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].z) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].z)) / _232;
  _236 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].y), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].y), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].y) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].y)) / _232) * -0.5f;
  _238 = (_107 * 0.5f) * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[12u].x), _questGuideWorldPosition.z, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[11u].x), _questGuideWorldPosition.y, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[10u].x) * _questGuideWorldPosition.x))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[13u].x)) / _232);
  if ((abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f) || ((!(abs(_questGuideWorldPosition.x) > 9.999999747378752e-06f)) && (abs(_questGuideWorldPosition.y) > 9.999999747378752e-06f))) {
    if (!((_236 >= 1.0499999523162842f) || ((_236 <= -1.5f) || ((_238 >= 1.600000023841858f) || ((_238 <= -1.600000023841858f) || ((_235 < 0.0f) || (_238 <= -1.5f))))))) {
      _272 = _192 - _238;
      _273 = _191 - _236;
      _275 = atan(_272 / _273);
      _278 = (_273 < 0.0f);
      _279 = (_273 == 0.0f);
      _280 = (_272 >= 0.0f);
      _281 = (_272 < 0.0f);
      _284 = _281 && _278;
      _285 = select(_284, (_275 + -3.1415927410125732f), select((_280 && _278), (_275 + 3.1415927410125732f), _275));
      _286 = _281 && _279;
      _288 = _280 && _279;
      _289 = select(_288, 1.5707963705062866f, select(_286, -1.5707963705062866f, _285));
      _293 = sqrt((_273 * _273) + (_272 * _272));
      _310 = WaveReadLaneFirst(_materialIndex);
      _318 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightIntensity);
      _320 = WaveReadLaneFirst(_materialIndex);
      _328 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_320 < (uint)170000), _320, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightThreshold);
      _334 = _238 - _192;
      _335 = _236 - _191;
      _340 = WaveReadLaneFirst(_materialIndex);
      _348 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_340 < (uint)170000), _340, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareScale);
      _351 = max((0.019999999552965164f / (_348 * sqrt((_335 * _335) + (_334 * _334)))), 0.0f);
      _352 = _351 * _351;
      _363 = WaveReadLaneFirst(_materialIndex);
      _371 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_363 < (uint)170000), _363, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareAnimSpeed);
      _372 = _371 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
      _374 = WaveReadLaneFirst(_materialIndex);
      _382 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _389 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_382 < (uint)65000), _382, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_289 * 2.0f) + _238) * 4.0f) - cos((_289 * 3.0f) + _236)) + _372), _372));
      _397 = 1.0f / exp2((_293 * 1.4426950216293335f) * ((frac(_389.x) * 0.6600000262260437f) + 0.33000001311302185f));
      _400 = frac((_397 * 20.0f) + 1.0031249523162842f);
      _407 = exp2(log2(1.0f - abs((_397 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      _444 = sin(select(_288, 6.2831854820251465f, select(_286, -6.2831854820251465f, (_285 * 4.0f))));
      _445 = _444 * _272;
      _446 = _444 * _273;
      _465 = exp2(log2(((saturate(_397 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_445 * _445) + (_446 * _446)))) * 8.0f)) * _397) * 12.949999809265137f) * (_397 * 0.4999999701976776f);
      _469 = WaveReadLaneFirst(_materialIndex);
      _477 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_469 < (uint)170000), _469, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _481 = exp2(log2(_293 * 16.0f) * 0.5f);
      _485 = atan(_273 / _272);
      _488 = (_272 == 0.0f);
      _489 = (_273 >= 0.0f);
      _506 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_488 && _489), 2.356194496154785f, select((_488 && _278), -2.356194496154785f, (select(_284, (_485 + -3.1415927410125732f), select((_281 && _489), (_485 + 3.1415927410125732f), _485)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - _481)));
      _513 = atan((-0.0f - _273) / (-0.0f - _272));
      _516 = (_272 > -0.0f);
      _517 = (_272 == -0.0f);
      _518 = (_273 <= -0.0f);
      _519 = (_273 > -0.0f);
      _534 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_517 && _518), 2.356194496154785f, select((_517 && _519), -2.356194496154785f, (select((_516 && _519), (_513 + -3.1415927410125732f), select((_516 && _518), (_513 + 3.1415927410125732f), _513)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - (_481 * 0.5f))));
      _559 = exp2(log2(min(max((1.0f - (_293 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      _570 = exp2(log2(min(max((1.100000023841858f - (_293 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      _585 = (((pow(_293, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_389.x * 8.0f) * 0.20000000298023224f);
      _595 = (exp2(log2(saturate(1.0f - (_318 * sqrt((_190 * _190) + (_191 * _191))))) * _328) * 150.0f) * _exposure2.x;
      _599 = WaveReadLaneFirst(_materialIndex);
      _607 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_599 < (uint)170000), _599, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtTexture);
      _614 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_607 < (uint)65000), _607, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _618 = WaveReadLaneFirst(_materialIndex);
      _626 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_618 < (uint)170000), _618, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtThreshold);
      _639 = WaveReadLaneFirst(_materialIndex);
      _647 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtIntensity);
      _669 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      _673 = frac(sin(floor(_669)) * 43758.546875f);
      _684 = WaveReadLaneFirst(_materialIndex);
      _692 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_684 < (uint)170000), _684, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensflareRatio);
      _694 = _692 * (((((frac(_669) * (frac(sin(ceil(_669)) * 43758.546875f) - _673)) + _673) * 0.6499999761581421f) + 0.3499999940395355f) * (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).w));
      _705 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.x, _534.x))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50))))).x))) * saturate((_647 * (saturate(pow(_614.x, _626)) + -1.0f)) + 1.0f)) + _101);
      _706 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.y, _534.y))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y))) * saturate((_647 * (saturate(pow(_614.y, _626)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.z, _534.z))) * 4.0f))) * 7.0f) + (_465 * (((min(max((abs((frac(_400 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y))))).z))) * saturate((_647 * (saturate(pow(_614.z, _626)) + -1.0f)) + 1.0f)) + _103);
    } else {
      _705 = _101;
      _706 = _102;
      _707 = _103;
    }
  } else {
    if (!((_236 >= 1.0499999523162842f) || ((_236 <= -1.5f) || ((_238 >= 1.600000023841858f) || ((_238 <= -1.600000023841858f) || ((_238 <= -1.5f) || ((_235 < 0.0f) || (abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))) {
      _272 = _192 - _238;
      _273 = _191 - _236;
      _275 = atan(_272 / _273);
      _278 = (_273 < 0.0f);
      _279 = (_273 == 0.0f);
      _280 = (_272 >= 0.0f);
      _281 = (_272 < 0.0f);
      _284 = _281 && _278;
      _285 = select(_284, (_275 + -3.1415927410125732f), select((_280 && _278), (_275 + 3.1415927410125732f), _275));
      _286 = _281 && _279;
      _288 = _280 && _279;
      _289 = select(_288, 1.5707963705062866f, select(_286, -1.5707963705062866f, _285));
      _293 = sqrt((_273 * _273) + (_272 * _272));
      _310 = WaveReadLaneFirst(_materialIndex);
      _318 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightIntensity);
      _320 = WaveReadLaneFirst(_materialIndex);
      _328 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_320 < (uint)170000), _320, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareWeightThreshold);
      _334 = _238 - _192;
      _335 = _236 - _191;
      _340 = WaveReadLaneFirst(_materialIndex);
      _348 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_340 < (uint)170000), _340, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareScale);
      _351 = max((0.019999999552965164f / (_348 * sqrt((_335 * _335) + (_334 * _334)))), 0.0f);
      _352 = _351 * _351;
      _363 = WaveReadLaneFirst(_materialIndex);
      _371 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_363 < (uint)170000), _363, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._sunFlareAnimSpeed);
      _372 = _371 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
      _374 = WaveReadLaneFirst(_materialIndex);
      _382 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _389 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_382 < (uint)65000), _382, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_289 * 2.0f) + _238) * 4.0f) - cos((_289 * 3.0f) + _236)) + _372), _372));
      _397 = 1.0f / exp2((_293 * 1.4426950216293335f) * ((frac(_389.x) * 0.6600000262260437f) + 0.33000001311302185f));
      _400 = frac((_397 * 20.0f) + 1.0031249523162842f);
      _407 = exp2(log2(1.0f - abs((_397 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      _444 = sin(select(_288, 6.2831854820251465f, select(_286, -6.2831854820251465f, (_285 * 4.0f))));
      _445 = _444 * _272;
      _446 = _444 * _273;
      _465 = exp2(log2(((saturate(_397 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_445 * _445) + (_446 * _446)))) * 8.0f)) * _397) * 12.949999809265137f) * (_397 * 0.4999999701976776f);
      _469 = WaveReadLaneFirst(_materialIndex);
      _477 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_469 < (uint)170000), _469, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._noiseTex);
      _481 = exp2(log2(_293 * 16.0f) * 0.5f);
      _485 = atan(_273 / _272);
      _488 = (_272 == 0.0f);
      _489 = (_273 >= 0.0f);
      _506 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_488 && _489), 2.356194496154785f, select((_488 && _278), -2.356194496154785f, (select(_284, (_485 + -3.1415927410125732f), select((_281 && _489), (_485 + 3.1415927410125732f), _485)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - _481)));
      _513 = atan((-0.0f - _273) / (-0.0f - _272));
      _516 = (_272 > -0.0f);
      _517 = (_272 == -0.0f);
      _518 = (_273 <= -0.0f);
      _519 = (_273 > -0.0f);
      _534 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select((_517 && _518), 2.356194496154785f, select((_517 && _519), -2.356194496154785f, (select((_516 && _519), (_513 + -3.1415927410125732f), select((_516 && _518), (_513 + 3.1415927410125732f), _513)) * 1.5f))), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) - (_481 * 0.5f))));
      _559 = exp2(log2(min(max((1.0f - (_293 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      _570 = exp2(log2(min(max((1.100000023841858f - (_293 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      _585 = (((pow(_293, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_389.x * 8.0f) * 0.20000000298023224f);
      _595 = (exp2(log2(saturate(1.0f - (_318 * sqrt((_190 * _190) + (_191 * _191))))) * _328) * 150.0f) * _exposure2.x;
      _599 = WaveReadLaneFirst(_materialIndex);
      _607 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_599 < (uint)170000), _599, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtTexture);
      _614 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_607 < (uint)65000), _607, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _618 = WaveReadLaneFirst(_materialIndex);
      _626 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_618 < (uint)170000), _618, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtThreshold);
      _639 = WaveReadLaneFirst(_materialIndex);
      _647 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensDirtIntensity);
      _669 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      _673 = frac(sin(floor(_669)) * 43758.546875f);
      _684 = WaveReadLaneFirst(_materialIndex);
      _692 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_684 < (uint)170000), _684, 0)) + 0u))].BindlessParameters_PostProcessLensFlareForGimmick_CD._lensflareRatio);
      _694 = _692 * (((((frac(_669) * (frac(sin(ceil(_669)) * 43758.546875f) - _673)) + _673) * 0.6499999761581421f) + 0.3499999940395355f) * (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).w));
      _705 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.x, _534.x))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50))))).x))) * saturate((_647 * (saturate(pow(_614.x, _626)) + -1.0f)) + 1.0f)) + _101);
      _706 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.y, _534.y))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y)))).y))) * saturate((_647 * (saturate(pow(_614.y, _626)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.z, _534.z))) * 4.0f))) * 7.0f) + (_465 * (((min(max((abs((frac(_400 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y))))).z))) * saturate((_647 * (saturate(pow(_614.z, _626)) + -1.0f)) + 1.0f)) + _103);
    } else {
      _705 = _101;
      _706 = _102;
      _707 = _103;
    }
  }
  _708 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _721 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _708, 0)))).x) & 127))) + 0.5f);
  } else {
    _721 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_705, _706, _707));
    _1143 = output_color.x;
    _1144 = output_color.y;
    _1145 = output_color.z;
  } else {
    _1143 = _705;
    _1144 = _706;
    _1145 = _707;
  }
  if (_etcParams.y > 1.0f) {
    _1156 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1157 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1161 = saturate(1.0f - (dot(float2(_1156, _1157), float2(_1156, _1157)) * saturate(_etcParams.y + -1.0f)));
    _1166 = (_1161 * _1143);
    _1167 = (_1161 * _1144);
    _1168 = (_1161 * _1145);
  } else {
    _1166 = _1143;
    _1167 = _1144;
    _1168 = _1145;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1201 = select((_1166 <= 0.0031308000907301903f), (_1166 * 12.920000076293945f), (((pow(_1166, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1202 = select((_1167 <= 0.0031308000907301903f), (_1167 * 12.920000076293945f), (((pow(_1167, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1203 = select((_1168 <= 0.0031308000907301903f), (_1168 * 12.920000076293945f), (((pow(_1168, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1201 = _1166;
    _1202 = _1167;
    _1203 = _1168;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1208 = float((uint)_708);
    if (!(_1208 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1208 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1217 = _1201;
        _1218 = _1202;
        _1219 = _1203;
      } else {
        _1217 = 0.0f;
        _1218 = 0.0f;
        _1219 = 0.0f;
      }
    } else {
      _1217 = 0.0f;
      _1218 = 0.0f;
      _1219 = 0.0f;
    }
  } else {
    _1217 = _1201;
    _1218 = _1202;
    _1219 = _1203;
  }
  _1229 = exp2(log2(_1217 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1230 = exp2(log2(_1218 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1231 = exp2(log2(_1219 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1229 * 18.6875f) + 1.0f)) * ((_1229 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1230 * 18.6875f) + 1.0f)) * ((_1230 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1231 * 18.6875f) + 1.0f)) * ((_1231 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _721;
  return SV_Target;
}