#include "../tonemap.hlsli"

struct PostProcessScopeStruct {
  float _progress;
  float _lensRadius;
  float _lensDistance;
  float _lensYOffset;
  float _edgeSmoothness;
  float _distortionIntensity;
  float _chromaticRatio;
  float _opacity;
  uint _lensDirtTexture;
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

struct BindlessParameters_PostProcessScope {
  PostProcessScopeStruct BindlessParameters_PostProcessScope;
};

typedef BindlessParameters_PostProcessScope BindlessParameters_PostProcessScope_t;
ConstantBuffer<BindlessParameters_PostProcessScope_t> BindlessParameters_PostProcessScope[] : register(b0, space100);

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
  float _27;
  int _28;
  float _36;
  float _37;
  int _38;
  float _46;
  float _47;
  int _48;
  float _56;
  int _60;
  float _68;
  int _69;
  float _77;
  int _78;
  float _86;
  float _89;
  float _90;
  float _91;
  int _93;
  float _101;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _154;
  float _155;
  float _420;
  float _623;
  float _624;
  float _625;
  float _718;
  float _719;
  float _720;
  float _840;
  float _841;
  float _842;
  float _859;
  float _860;
  float _861;
  float _894;
  float _895;
  float _896;
  float _910;
  float _911;
  float _912;
  float _109;
  float _110;
  float _113;
  float _117;
  float _121;
  float _126;
  float _136;
  float _148;
  float _156;
  float _157;
  float _160;
  float _161;
  bool _162;
  float _166;
  float _172;
  float _176;
  float _177;
  float _180;
  float _184;
  float _185;
  float _187;
  float _190;
  float _191;
  float _192;
  float _196;
  bool _197;
  float _204;
  float _205;
  float _206;
  float _223;
  float _229;
  float _238;
  float _239;
  float _240;
  float _241;
  float _243;
  float _250;
  float _251;
  float _252;
  float _254;
  float _260;
  float _296;
  float _297;
  float _298;
  float _299;
  float _301;
  float _308;
  float _317;
  float _321;
  float _329;
  float _338;
  float _342;
  float _346;
  float _348;
  float _354;
  float _355;
  int _361;
  int _369;
  float4 _376;
  float _380;
  float _394;
  float _404;
  float _405;
  float _406;
  uint _407;
  float _427;
  float _476;
  float _477;
  float _478;
  float _480;
  float _487;
  float _488;
  float _489;
  float _508;
  float _509;
  float _510;
  float _511;
  float _512;
  float _513;
  float _514;
  float _515;
  float _516;
  float _562;
  float _563;
  float _564;
  float _565;
  float _566;
  float _567;
  float _568;
  float _585;
  float _586;
  float _587;
  float _588;
  float _594;
  float _597;
  float _604;
  float _605;
  float _606;
  float _635;
  float _660;
  float _661;
  float _662;
  float _681;
  float _682;
  float _683;
  float _689;
  float _693;
  float _694;
  float _695;
  float _696;
  float _701;
  float _726;
  float _730;
  float _731;
  float _732;
  float _733;
  int _774;
  float _829;
  float _849;
  float _850;
  float _854;
  float _901;
  float _21[36];
  _27 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _28 = WaveReadLaneFirst(_materialIndex);
  _36 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))].BindlessParameters_PostProcessScope._lensRadius);
  _37 = max(_36, 9.999999747378752e-05f);
  _38 = WaveReadLaneFirst(_materialIndex);
  _46 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))].BindlessParameters_PostProcessScope._edgeSmoothness);
  _47 = max(_46, 9.999999747378752e-05f);
  _48 = WaveReadLaneFirst(_materialIndex);
  _56 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))].BindlessParameters_PostProcessScope._lensDistance);
  _60 = WaveReadLaneFirst(_materialIndex);
  _68 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))].BindlessParameters_PostProcessScope._chromaticRatio);
  _69 = WaveReadLaneFirst(_materialIndex);
  _77 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))].BindlessParameters_PostProcessScope._distortionIntensity);
  _78 = WaveReadLaneFirst(_materialIndex);
  _86 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_78 < (uint)170000), _78, 0)) + 0u))].BindlessParameters_PostProcessScope._opacity);
  _89 = (TEXCOORD.x * 2.0f) + -1.0f;
  _90 = (TEXCOORD.y * 2.0f) + -1.0f;
  _91 = _27 * _89;
  _93 = WaveReadLaneFirst(_materialIndex);
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))].BindlessParameters_PostProcessScope._lensYOffset);
  _102 = _56 * -0.5f;
  _103 = _56 * 0.5f;
  _104 = _47 * _37;
  _105 = _104 - _37;
  _106 = _101 + _90;
  _107 = _106 * _106;
  if (_56 > 0.10000000149011612f) {
    _109 = _91 - _102;
    _110 = _91 - _103;
    _113 = sqrt(_107 + (_109 * _109));
    _117 = sqrt(_107 + (_110 * _110));
    _121 = _37 * 0.6000000238418579f;
    _126 = saturate((((_117 - _113) * 0.5f) / _121) + 0.5f);
    _136 = saturate((((_117 + _105) + (_126 * (_113 - _117))) - ((_126 * _121) * (1.0f - _126))) / _104);
    _154 = ((_136 * _136) * (3.0f - (_136 * 2.0f)));
    _155 = select(((_113 / _37) < (_117 / _37)), _102, _103);
  } else {
    _148 = saturate((sqrt((_91 * _91) + (_90 * _90)) + _105) / _104);
    _154 = ((_148 * _148) * (3.0f - (_148 * 2.0f)));
    _155 = 0.0f;
  }
  _156 = 1.0f - _154;
  _157 = _91 - _155;
  _160 = sqrt((_157 * _157) + _107);
  _161 = _160 / _37;
  _162 = (_160 > 9.999999747378752e-06f);
  _166 = select(_162, (_106 / _160), 1.0f);
  _172 = saturate(abs(TEXCOORD.x + -0.5f) / (saturate(_56) * 0.07999999821186066f));
  _176 = (_172 * _172) * (3.0f - (_172 * 2.0f));
  _177 = 1.0f - _47;
  _180 = saturate((_161 - _177) / _47);
  _184 = (_180 * _180) * (3.0f - (_180 * 2.0f));
  _185 = select(_162, (_157 / _160), 0.0f) / _27;
  _187 = (_176 * _77) * _184;
  _190 = (_187 * _185) + TEXCOORD.x;
  _191 = (_187 * _166) + TEXCOORD.y;
  _192 = _185 * _176;
  _196 = sqrt((_192 * _192) + (_166 * _166));
  _197 = (_196 > 9.999999747378752e-06f);
  _204 = ((float((uint)(uint)(_enableChromaticAberration)) * 0.014999999664723873f) * _68) * _184;
  _205 = select(_197, (_192 / _196), 0.0f) * _204;
  _206 = select(_197, (_166 / _196), 1.0f) * _204;
  _223 = saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y) + 0.10000000149011612f) * 5.0f);
  _229 = rsqrt(dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z))));
  _238 = rsqrt(dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].z))));
  _239 = _238 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].x);
  _240 = _238 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y);
  _241 = _238 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].z);
  _243 = (3.0f - (_223 * 2.0f)) * (_223 * _223);
  _250 = (((_229 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x)) - _239) * _243) + _239;
  _251 = (((_229 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y)) - _240) * _243) + _240;
  _252 = (((_229 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z)) - _241) * _243) + _241;
  _254 = rsqrt(dot(float3(_250, _251, _252), float3(_250, _251, _252)));
  _260 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  _296 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _260, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _89));
  _297 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _260, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _89)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x)) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _296;
  _298 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _260, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _89))) / _296;
  _299 = ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z)) + mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _260, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _89))) / _296;
  _301 = rsqrt(dot(float3(_297, _298, _299), float3(_297, _298, _299)));
  _308 = saturate((dot(float3((_301 * _297), (_301 * _298), (_301 * _299)), float3((_250 * _254), (_251 * _254), (_252 * _254))) + -0.5f) * 2.0f);
  _317 = max(0.5f, _177);
  _321 = saturate(((_161 + -0.4000000059604645f) - _317) * 4.999999523162842f);
  _329 = saturate((0.5f - _154) * -2.0f);
  _338 = (_317 + 0.4000000059604645f) * 2.0f;
  _342 = saturate((_161 - _338) / (((_317 + 0.6000000238418579f) * 0.009999999776482582f) - _338));
  _346 = (_342 * _342) * (3.0f - (_342 * 2.0f));
  _348 = (_346 * _346) * max((((_321 * _321) * _176) * (3.0f - (_321 * 2.0f))), ((_329 * _329) * (3.0f - (_329 * 2.0f))));
  _354 = (((_243 * 1.3999998569488525f) + 5.599999904632568f) * saturate(exp2(log2((_308 * _308) * (3.0f - (_308 * 2.0f))) * 3.0f))) * saturate(1.399999976158142f - _154);
  _355 = _348 * _354;
  _361 = WaveReadLaneFirst(_materialIndex);
  _369 = WaveReadLaneFirst(BindlessParameters_PostProcessScope[((int)((uint)(select(((uint)_361 < (uint)170000), _361, 0)) + 0u))].BindlessParameters_PostProcessScope._lensDirtTexture);
  _376 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_369 < (uint)65000), _369, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 1.2000000476837158f) * _27), (TEXCOORD.y * 1.2000000476837158f)));
  _380 = dot(float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f), float3(_376.x, _376.y, _376.z));
  _394 = (1.0f / max(0.0010000000474974513f, _exposure0.x)) * (_348 * (_354 + 3.0f));
  _404 = ((_394 * (lerp(_380, _376.x, _355))) + ((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_190 - _205), (_191 - _206))))).x) * _156)) * _86;
  _405 = ((_394 * (lerp(_380, _376.y, _355))) + ((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_190, _191)))).y) * _156)) * _86;
  _406 = ((_394 * (lerp(_380, _376.z, _355))) + ((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_205 + _190), (_206 + _191))))).z) * _156)) * _86;
  _407 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _420 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _407, 0)))).x) & 127))) + 0.5f);
  } else {
    _420 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_404, _405, _406));
    _840 = output_color.x;
    _841 = output_color.y;
    _842 = output_color.z;
  } else {
    _840 = _404;
    _841 = _405;
    _842 = _406;
  }
  if (_etcParams.y > 1.0f) {
    _849 = abs(_89);
    _850 = abs(_90);
    _854 = saturate(1.0f - (dot(float2(_849, _850), float2(_849, _850)) * saturate(_etcParams.y + -1.0f)));
    _859 = (_854 * _840);
    _860 = (_854 * _841);
    _861 = (_854 * _842);
  } else {
    _859 = _840;
    _860 = _841;
    _861 = _842;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _894 = select((_859 <= 0.0031308000907301903f), (_859 * 12.920000076293945f), (((pow(_859, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _895 = select((_860 <= 0.0031308000907301903f), (_860 * 12.920000076293945f), (((pow(_860, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _896 = select((_861 <= 0.0031308000907301903f), (_861 * 12.920000076293945f), (((pow(_861, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _894 = _859;
    _895 = _860;
    _896 = _861;
  }
  if (!(_etcParams.y < 1.0f)) {
    _901 = float((uint)_407);
    if (!(_901 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_901 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _910 = _894;
        _911 = _895;
        _912 = _896;
      } else {
        _910 = 0.0f;
        _911 = 0.0f;
        _912 = 0.0f;
      }
    } else {
      _910 = 0.0f;
      _911 = 0.0f;
      _912 = 0.0f;
    }
  } else {
    _910 = _894;
    _911 = _895;
    _912 = _896;
  }
  SV_Target.x = _910;
  SV_Target.y = _911;
  SV_Target.z = _912;
  SV_Target.w = _420;
  return SV_Target;
}