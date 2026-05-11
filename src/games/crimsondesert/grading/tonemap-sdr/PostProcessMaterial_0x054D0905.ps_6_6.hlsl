#include "../tonemap.hlsli"

struct PostProcessChromaticAberrationStruct {
  float _ratio;
  float _shiftValue;
  float2 _shiftPosition;
};


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

struct BindlessParameters_PostProcessChromaticAberration {
  PostProcessChromaticAberrationStruct BindlessParameters_PostProcessChromaticAberration;
};

typedef BindlessParameters_PostProcessChromaticAberration BindlessParameters_PostProcessChromaticAberration_t;
ConstantBuffer<BindlessParameters_PostProcessChromaticAberration_t> BindlessParameters_PostProcessChromaticAberration[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _22;
  float _31;
  float _32;
  float _33;
  float _34;
  int _44;
  float _52;
  float _56;
  float _57;
  float _59;
  float4 _65;
  float4 _67;
  float4 _69;
  uint _71;
  float _85;
  float _290;
  float _291;
  float _292;
  float _385;
  float _386;
  float _387;
  float _507;
  float _508;
  float _509;
  float _530;
  float _531;
  float _532;
  float _565;
  float _566;
  float _567;
  float _581;
  float _582;
  float _583;
  float _94;
  float _143;
  float _144;
  float _145;
  float _147;
  float _154;
  float _155;
  float _156;
  float _175;
  float _176;
  float _177;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _234;
  float _235;
  float _252;
  float _253;
  float _254;
  float _255;
  float _261;
  float _264;
  float _271;
  float _272;
  float _273;
  float _302;
  float _327;
  float _328;
  float _329;
  float _348;
  float _349;
  float _350;
  float _356;
  float _360;
  float _361;
  float _362;
  float _363;
  float _368;
  float _393;
  float _397;
  float _398;
  float _399;
  float _400;
  int _441;
  float _496;
  float _520;
  float _521;
  float _525;
  float _572;
  float _17[36];
  _22 = WaveReadLaneFirst(_materialIndex);
  _31 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))].BindlessParameters_PostProcessChromaticAberration._shiftPosition.x);
  _32 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))].BindlessParameters_PostProcessChromaticAberration._shiftPosition.y);
  _33 = TEXCOORD.x - _31;
  _34 = TEXCOORD.y - _32;
  _44 = WaveReadLaneFirst(_materialIndex);
  _52 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))].BindlessParameters_PostProcessChromaticAberration._shiftValue);
  _56 = (((sqrt((_34 * _34) + (_33 * _33)) * 0.009999999776482582f) * float((uint)(uint)(_enableChromaticAberration))) * _52) * rsqrt(dot(float2(_33, _34), float2(_33, _34)));
  _57 = _56 * _33;
  _59 = _56 * _34;
  _65 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _57), (TEXCOORD.y - _59)));
  _67 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _69 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_57 + TEXCOORD.x), (_59 + TEXCOORD.y)));
  _71 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _85 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _71, 0)))).x) & 127))) + 0.5f);
  } else {
    _85 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_65.x, _67.y, _69.z));
    _507 = output_color.x;
    _508 = output_color.y;
    _509 = output_color.z;
  } else {
    _507 = _65.x;
    _508 = _67.y;
    _509 = _69.z;
  }
  if (_etcParams.y > 1.0f) {
    _520 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _521 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _525 = saturate(1.0f - (dot(float2(_520, _521), float2(_520, _521)) * saturate(_etcParams.y + -1.0f)));
    _530 = (_525 * _507);
    _531 = (_525 * _508);
    _532 = (_525 * _509);
  } else {
    _530 = _507;
    _531 = _508;
    _532 = _509;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _565 = select((_530 <= 0.0031308000907301903f), (_530 * 12.920000076293945f), (((pow(_530, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _566 = select((_531 <= 0.0031308000907301903f), (_531 * 12.920000076293945f), (((pow(_531, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _567 = select((_532 <= 0.0031308000907301903f), (_532 * 12.920000076293945f), (((pow(_532, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _565 = _530;
    _566 = _531;
    _567 = _532;
  }
  if (!(_etcParams.y < 1.0f)) {
    _572 = float((uint)_71);
    if (!(_572 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_572 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _581 = _565;
        _582 = _566;
        _583 = _567;
      } else {
        _581 = 0.0f;
        _582 = 0.0f;
        _583 = 0.0f;
      }
    } else {
      _581 = 0.0f;
      _582 = 0.0f;
      _583 = 0.0f;
    }
  } else {
    _581 = _565;
    _582 = _566;
    _583 = _567;
  }
  SV_Target.x = _581;
  SV_Target.y = _582;
  SV_Target.z = _583;
  SV_Target.w = _85;
  return SV_Target;
}