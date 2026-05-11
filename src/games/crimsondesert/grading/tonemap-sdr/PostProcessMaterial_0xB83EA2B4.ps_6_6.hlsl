#include "../tonemap.hlsli"

struct PostProcessChromaticRadialBlurStruct {
  float _ratio;
  float _start;
  float _offsetR;
  float _offsetG;
  float _offsetB;
  float _rangeR;
  float _rangeG;
  float _rangeB;
  float _centerX;
  float _centerY;
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

struct BindlessParameters_PostProcessChromaticRadialBlur {
  PostProcessChromaticRadialBlurStruct BindlessParameters_PostProcessChromaticRadialBlur;
};

typedef BindlessParameters_PostProcessChromaticRadialBlur BindlessParameters_PostProcessChromaticRadialBlur_t;
ConstantBuffer<BindlessParameters_PostProcessChromaticRadialBlur_t> BindlessParameters_PostProcessChromaticRadialBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _19;
  float _27;
  int _28;
  float _36;
  int _37;
  float _45;
  int _46;
  float _54;
  int _55;
  float _63;
  int _64;
  float _72;
  int _73;
  float _81;
  int _82;
  float _90;
  int _91;
  float _99;
  int _100;
  float _108;
  float _109;
  float _110;
  float _127;
  float _129;
  float _130;
  float _131;
  int _132;
  float _240;
  float _445;
  float _446;
  float _447;
  float _540;
  float _541;
  float _542;
  float _662;
  float _663;
  float _664;
  float _685;
  float _686;
  float _687;
  float _720;
  float _721;
  float _722;
  float _736;
  float _737;
  float _738;
  float _135;
  float _137;
  float _140;
  float _143;
  float _146;
  float _148;
  float _176;
  float _186;
  float _191;
  float _201;
  float _206;
  float _216;
  int _217;
  uint _227;
  float _249;
  float _298;
  float _299;
  float _300;
  float _302;
  float _309;
  float _310;
  float _311;
  float _330;
  float _331;
  float _332;
  float _333;
  float _334;
  float _335;
  float _336;
  float _337;
  float _338;
  float _384;
  float _385;
  float _386;
  float _387;
  float _388;
  float _389;
  float _390;
  float _407;
  float _408;
  float _409;
  float _410;
  float _416;
  float _419;
  float _426;
  float _427;
  float _428;
  float _457;
  float _482;
  float _483;
  float _484;
  float _503;
  float _504;
  float _505;
  float _511;
  float _515;
  float _516;
  float _517;
  float _518;
  float _523;
  float _548;
  float _552;
  float _553;
  float _554;
  float _555;
  int _596;
  float _651;
  float _675;
  float _676;
  float _680;
  float _727;
  float _748;
  float _749;
  float _750;
  float _15[36];
  _19 = WaveReadLaneFirst(_materialIndex);
  _27 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._ratio);
  _28 = WaveReadLaneFirst(_materialIndex);
  _36 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._start);
  _37 = WaveReadLaneFirst(_materialIndex);
  _45 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._rangeR);
  _46 = WaveReadLaneFirst(_materialIndex);
  _54 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._rangeG);
  _55 = WaveReadLaneFirst(_materialIndex);
  _63 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_55 < (uint)170000), _55, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._rangeB);
  _64 = WaveReadLaneFirst(_materialIndex);
  _72 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_64 < (uint)170000), _64, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._offsetR);
  _73 = WaveReadLaneFirst(_materialIndex);
  _81 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._offsetG);
  _82 = WaveReadLaneFirst(_materialIndex);
  _90 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._offsetB);
  _91 = WaveReadLaneFirst(_materialIndex);
  _99 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._centerX);
  _100 = WaveReadLaneFirst(_materialIndex);
  _108 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_100 < (uint)170000), _100, 0)) + 0u))].BindlessParameters_PostProcessChromaticRadialBlur._centerY);
  _109 = TEXCOORD.x - _99;
  _110 = TEXCOORD.y - _108;
  _127 = (float((uint)(uint)(_enableChromaticAberration)) * _27) * saturate(((sqrt((_110 * _110) + (_109 * _109)) * 2.0f) - (_36 * 1.4142135381698608f)) / max(0.0010000000474974513f, ((1.0f - _36) * 1.4142135381698608f)));
  _129 = 0.0f;
  _130 = 0.0f;
  _131 = 0.0f;
  _132 = 0;
  while(true) {
    _135 = float((int)(_132)) * 0.25f;
    _137 = (1.0f - _72) + (_135 * _45);
    _140 = (1.0f - _81) + (_135 * _54);
    _143 = (1.0f - _90) + (_135 * _63);
    _146 = _99 - TEXCOORD.x;
    _148 = _108 - TEXCOORD.y;
    _176 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _137) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _137) + _148)) + TEXCOORD.y))))).x) * 0.012683313339948654f);
    _186 = (exp2(log2(max(0.0f, (_176 + -0.8359375f)) / (18.8515625f - (_176 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _129;
    _191 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _140) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _140) + _148)) + TEXCOORD.y))))).y) * 0.012683313339948654f);
    _201 = (exp2(log2(max(0.0f, (_191 + -0.8359375f)) / (18.8515625f - (_191 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _130;
    _206 = exp2(log2(((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _143) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _143) + _148)) + TEXCOORD.y))))).z) * 0.012683313339948654f);
    _216 = (exp2(log2(max(0.0f, (_206 + -0.8359375f)) / (18.8515625f - (_206 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _131;
    _217 = _132 + 1;
    if (!(_217 == 5)) {
      _129 = _186;
      _130 = _201;
      _131 = _216;
      _132 = _217;
      continue;
    }
    _227 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _240 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _227, 0)))).x) & 127))) + 0.5f);
    } else {
      _240 = _postProcessParams.x;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_186, _201, _216));
      _662 = output_color.x;
      _663 = output_color.y;
      _664 = output_color.z;
    } else {
      _662 = (_186 * 0.20000000298023224f);
      _663 = (_201 * 0.20000000298023224f);
      _664 = (_216 * 0.20000000298023224f);
    }
    if (_etcParams.y > 1.0f) {
      _675 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      _676 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      _680 = saturate(1.0f - (dot(float2(_675, _676), float2(_675, _676)) * saturate(_etcParams.y + -1.0f)));
      _685 = (_680 * _662);
      _686 = (_680 * _663);
      _687 = (_680 * _664);
    } else {
      _685 = _662;
      _686 = _663;
      _687 = _664;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _720 = select((_685 <= 0.0031308000907301903f), (_685 * 12.920000076293945f), (((pow(_685, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _721 = select((_686 <= 0.0031308000907301903f), (_686 * 12.920000076293945f), (((pow(_686, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _722 = select((_687 <= 0.0031308000907301903f), (_687 * 12.920000076293945f), (((pow(_687, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _720 = _685;
      _721 = _686;
      _722 = _687;
    }
    if (!(_etcParams.y < 1.0f)) {
      _727 = float((uint)_227);
      if (!(_727 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_727 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _736 = _720;
          _737 = _721;
          _738 = _722;
        } else {
          _736 = 0.0f;
          _737 = 0.0f;
          _738 = 0.0f;
        }
      } else {
        _736 = 0.0f;
        _737 = 0.0f;
        _738 = 0.0f;
      }
    } else {
      _736 = _720;
      _737 = _721;
      _738 = _722;
    }
    _748 = exp2(log2(_736 * 9.999999747378752e-05f) * 0.1593017578125f);
    _749 = exp2(log2(_737 * 9.999999747378752e-05f) * 0.1593017578125f);
    _750 = exp2(log2(_738 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_748 * 18.6875f) + 1.0f)) * ((_748 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_749 * 18.6875f) + 1.0f)) * ((_749 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_750 * 18.6875f) + 1.0f)) * ((_750 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _240;
    break;
  }
  return SV_Target;
}