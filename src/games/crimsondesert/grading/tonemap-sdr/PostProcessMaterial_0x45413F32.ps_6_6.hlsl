#include "../tonemap.hlsli"

struct PostProcessWorldLoadingStruct {
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float _ringRatio;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _depthOuterMaskRadius;
  uint _invertDepthMask;
  float _depthIntensity;
  float _depthContrast;
  float _voronoiDotDensity;
  float _voronoiMovementSpeed;
  float _voronoiOffset;
  float3 _voronoiScrollSpeed;
  float _voronoiDotThreshold;
  float _voronoiDotRatio;
  float _rippleIntensity;
  float _rippleWidth;
  float _rippleCount;
  float _rippleContrast;
  float _rippleSpeed;
  float3 _ripplePosOffset;
  uint _noiseTex;
  float _bigRippleIntensity;
  float _bigRippleWidth;
  float _bigRipplePhaseOffset;
  float _bigRippleSpeed;
  float _bigRippleDistortionIntensity;
  float _bigRippleContrast;
  float _starburstIntensity;
  float _vignetteIntensity;
  uint _excludePlayer;
  float _ppWorldLoadingRatio;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

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

struct BindlessParameters_PostProcessWorldLoading {
  PostProcessWorldLoadingStruct BindlessParameters_PostProcessWorldLoading;
};

typedef BindlessParameters_PostProcessWorldLoading BindlessParameters_PostProcessWorldLoading_t;
ConstantBuffer<BindlessParameters_PostProcessWorldLoading_t> BindlessParameters_PostProcessWorldLoading[] : register(b0, space100);

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
  float4 _25;
  float _32;
  float _33;
  float _56;
  float _57;
  float _58;
  float _59;
  float _95;
  float _96;
  float _97;
  float _98;
  int _99;
  float _107;
  float _108;
  float _109;
  float _110;
  float _111;
  float _112;
  float _113;
  float _115;
  float _116;
  float _117;
  float _118;
  int _119;
  float _124;
  float _125;
  float _126;
  float _127;
  int _128;
  float _133;
  float _134;
  float _135;
  float _136;
  int _137;
  float _301;
  float _506;
  float _507;
  float _508;
  float _601;
  float _602;
  float _603;
  float _723;
  float _724;
  float _725;
  float _743;
  float _744;
  float _745;
  float _778;
  float _779;
  float _780;
  float _794;
  float _795;
  float _796;
  int _121;
  int _130;
  float _138;
  float _139;
  float _140;
  float _144;
  float _145;
  float _146;
  float _161;
  float _168;
  float _169;
  float _170;
  float _181;
  bool _182;
  float _183;
  float _184;
  float _185;
  float _186;
  int _187;
  float _197;
  int _214;
  float _222;
  float _227;
  float _228;
  float _229;
  int _240;
  float _248;
  float _254;
  float _255;
  float _256;
  int _271;
  float _279;
  float _281;
  float _285;
  float _286;
  float _287;
  uint _288;
  float _310;
  float _359;
  float _360;
  float _361;
  float _363;
  float _370;
  float _371;
  float _372;
  float _391;
  float _392;
  float _393;
  float _394;
  float _395;
  float _396;
  float _397;
  float _398;
  float _399;
  float _445;
  float _446;
  float _447;
  float _448;
  float _449;
  float _450;
  float _451;
  float _468;
  float _469;
  float _470;
  float _471;
  float _477;
  float _480;
  float _487;
  float _488;
  float _489;
  float _518;
  float _543;
  float _544;
  float _545;
  float _564;
  float _565;
  float _566;
  float _572;
  float _576;
  float _577;
  float _578;
  float _579;
  float _584;
  float _609;
  float _613;
  float _614;
  float _615;
  float _616;
  int _657;
  float _712;
  float _733;
  float _734;
  float _738;
  float _785;
  float _806;
  float _807;
  float _808;
  int __loop_jump_target = -1;
  float _17[36];
  _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _32 = (pow(_25.y, 0.012683313339948654f));
  _33 = (pow(_25.z, 0.012683313339948654f));
  _56 = (TEXCOORD.x * 2.0f) + -1.0f;
  _57 = TEXCOORD.y * 2.0f;
  _58 = 1.0f - _57;
  _59 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _95 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _59, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _58, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _56))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _96 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _59, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _58, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _56))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _95;
  _97 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _59, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _58, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _56))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _95;
  _98 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _59, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _58, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _56))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _95;
  _99 = WaveReadLaneFirst(_materialIndex);
  _107 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._squareSize);
  _108 = _107 * _96;
  _109 = _107 * _97;
  _110 = _107 * _98;
  _111 = floor(_108);
  _112 = floor(_109);
  _113 = floor(_110);
  _115 = 10.0f;
  _116 = 0.0f;
  _117 = 0.0f;
  _118 = 0.0f;
  _119 = -1;
  while(true) {
    _124 = _115;
    _125 = _116;
    _126 = _117;
    _127 = _118;
    _128 = -1;
    while(true) {
      _133 = _124;
      _134 = _125;
      _135 = _126;
      _136 = _127;
      _137 = -1;
      while(true) {
        _138 = float((int)(_137));
        _139 = float((int)(_128));
        _140 = float((int)(_119));
        _144 = sin(_138 + _111);
        _145 = sin(_139 + _112);
        _146 = sin(_140 + _113);
        _161 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
        _168 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _138;
        _169 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _139;
        _170 = sin(_161 * frac(sin(dot(float3(_144, _145, _146), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _140;
        _181 = max(abs((_111 - _108) + _168), max(abs((_112 - _109) + _169), abs((_113 - _110) + _170)));
        _182 = (_181 < _133);
        _183 = select(_182, _181, _133);
        _184 = select(_182, _168, _134);
        _185 = select(_182, _169, _135);
        _186 = select(_182, _170, _136);
        _187 = _137 + 1;
        if (!(_187 == 2)) {
          _133 = _183;
          _134 = _184;
          _135 = _185;
          _136 = _186;
          _137 = _187;
          continue;
        }
        while(true) {
          _130 = _128 + 1;
          if (!(_130 == 2)) {
            _124 = _183;
            _125 = _184;
            _126 = _185;
            _127 = _186;
            _128 = _130;
            __loop_jump_target = 123;
            break;
          }
          while(true) {
            _121 = _119 + 1;
            if (!(_121 == 2)) {
              _115 = _183;
              _116 = _184;
              _117 = _185;
              _118 = _186;
              _119 = _121;
              __loop_jump_target = 114;
              break;
            }
            _197 = (pow(_25.x, 0.012683313339948654f));
            _214 = WaveReadLaneFirst(_materialIndex);
            _222 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_214 < (uint)170000), _214, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
            _227 = ((_184 + _111) / _107) - _mainPosition.x;
            _228 = ((_185 + _112) / _107) - _mainPosition.y;
            _229 = ((_186 + _113) / _107) - _mainPosition.z;
            _240 = WaveReadLaneFirst(_materialIndex);
            _248 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_240 < (uint)170000), _240, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
            _254 = _96 - _mainPosition.x;
            _255 = _97 - _mainPosition.y;
            _256 = _98 - _mainPosition.z;
            _271 = WaveReadLaneFirst(_materialIndex);
            _279 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_271 < (uint)170000), _271, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ringRatio);
            _281 = ((1.0f - saturate(exp2(log2(abs(((1.0f - ((1.0f / max(9.999999747378752e-06f, (_248 * 0.8333333134651184f))) * sqrt(dot(float3(_254, _255, _256), float3(_254, _255, _256))))) * 2.500000238418579f) + -0.5f) * 0.6666666865348816f)))) * (1.0f / max(0.0010000000474974513f, _exposure0.x))) * _279;
            _285 = (_281 * 0.800000011920929f) + (exp2(log2(max(0.0f, (_197 + -0.8359375f)) / (18.8515625f - (_197 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
            _286 = (_281 * 0.4000000059604645f) + (exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
            _287 = (_281 * 0.20000000298023224f) + (exp2(log2(max(0.0f, (_33 + -0.8359375f)) / (18.8515625f - (_33 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
            _288 = uint(SV_Position.y);
            if (_etcParams.y == 1.0f) {
              _301 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _288, 0)))).x) & 127))) + 0.5f);
            } else {
              _301 = saturate((_183 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _222)) * sqrt(dot(float3(_227, _228, _229), float3(_227, _228, _229))))) * 1.470588207244873f));
            }
            if (_localToneMappingParams.w > 0.0f) {
              float3 output_color = TonemapReplacer(float3(_285, _286, _287));
              _723 = output_color.x;
              _724 = output_color.y;
              _725 = output_color.z;
            } else {
              _723 = _285;
              _724 = _286;
              _725 = _287;
            }
            if (_etcParams.y > 1.0f) {
              _733 = abs(_56);
              _734 = abs(_57 + -1.0f);
              _738 = saturate(1.0f - (dot(float2(_733, _734), float2(_733, _734)) * saturate(_etcParams.y + -1.0f)));
              _743 = (_738 * _723);
              _744 = (_738 * _724);
              _745 = (_738 * _725);
            } else {
              _743 = _723;
              _744 = _724;
              _745 = _725;
            }
            if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
              _778 = select((_743 <= 0.0031308000907301903f), (_743 * 12.920000076293945f), (((pow(_743, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
              _779 = select((_744 <= 0.0031308000907301903f), (_744 * 12.920000076293945f), (((pow(_744, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
              _780 = select((_745 <= 0.0031308000907301903f), (_745 * 12.920000076293945f), (((pow(_745, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
            } else {
              _778 = _743;
              _779 = _744;
              _780 = _745;
            }
            if (!(_etcParams.y < 1.0f)) {
              _785 = float((uint)_288);
              if (!(_785 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
                if (_785 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
                  _794 = _778;
                  _795 = _779;
                  _796 = _780;
                } else {
                  _794 = 0.0f;
                  _795 = 0.0f;
                  _796 = 0.0f;
                }
              } else {
                _794 = 0.0f;
                _795 = 0.0f;
                _796 = 0.0f;
              }
            } else {
              _794 = _778;
              _795 = _779;
              _796 = _780;
            }
            _806 = exp2(log2(_794 * 9.999999747378752e-05f) * 0.1593017578125f);
            _807 = exp2(log2(_795 * 9.999999747378752e-05f) * 0.1593017578125f);
            _808 = exp2(log2(_796 * 9.999999747378752e-05f) * 0.1593017578125f);
            SV_Target.x = exp2(log2((1.0f / ((_806 * 18.6875f) + 1.0f)) * ((_806 * 18.8515625f) + 0.8359375f)) * 78.84375f);
            SV_Target.y = exp2(log2((1.0f / ((_807 * 18.6875f) + 1.0f)) * ((_807 * 18.8515625f) + 0.8359375f)) * 78.84375f);
            SV_Target.z = exp2(log2((1.0f / ((_808 * 18.6875f) + 1.0f)) * ((_808 * 18.8515625f) + 0.8359375f)) * 78.84375f);
            SV_Target.w = _301;
            break;
          }
          if (__loop_jump_target != -1) {
            break;
          }
          break;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 123) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
    if (__loop_jump_target == 114) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}