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
  float _34;
  float _35;
  float _71;
  float _72;
  float _73;
  float _74;
  int _75;
  float _83;
  float _84;
  float _85;
  float _86;
  float _87;
  float _88;
  float _89;
  float _91;
  float _92;
  float _93;
  float _94;
  int _95;
  float _100;
  float _101;
  float _102;
  float _103;
  int _104;
  float _109;
  float _110;
  float _111;
  float _112;
  int _113;
  float _265;
  float _470;
  float _471;
  float _472;
  float _565;
  float _566;
  float _567;
  float _687;
  float _688;
  float _689;
  float _707;
  float _708;
  float _709;
  float _742;
  float _743;
  float _744;
  float _758;
  float _759;
  float _760;
  int _97;
  int _106;
  float _114;
  float _115;
  float _116;
  float _120;
  float _121;
  float _122;
  float _137;
  float _144;
  float _145;
  float _146;
  float _157;
  bool _158;
  float _159;
  float _160;
  float _161;
  float _162;
  int _163;
  int _178;
  float _186;
  float _191;
  float _192;
  float _193;
  int _204;
  float _212;
  float _218;
  float _219;
  float _220;
  int _235;
  float _243;
  float _245;
  float _249;
  float _250;
  float _251;
  uint _252;
  float _274;
  float _323;
  float _324;
  float _325;
  float _327;
  float _334;
  float _335;
  float _336;
  float _355;
  float _356;
  float _357;
  float _358;
  float _359;
  float _360;
  float _361;
  float _362;
  float _363;
  float _409;
  float _410;
  float _411;
  float _412;
  float _413;
  float _414;
  float _415;
  float _432;
  float _433;
  float _434;
  float _435;
  float _441;
  float _444;
  float _451;
  float _452;
  float _453;
  float _482;
  float _507;
  float _508;
  float _509;
  float _528;
  float _529;
  float _530;
  float _536;
  float _540;
  float _541;
  float _542;
  float _543;
  float _548;
  float _573;
  float _577;
  float _578;
  float _579;
  float _580;
  int _621;
  float _676;
  float _697;
  float _698;
  float _702;
  float _749;
  int __loop_jump_target = -1;
  float _17[36];
  _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _32 = (TEXCOORD.x * 2.0f) + -1.0f;
  _33 = TEXCOORD.y * 2.0f;
  _34 = 1.0f - _33;
  _35 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _71 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _35, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _34, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _32))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _72 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _35, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _34, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _32))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _71;
  _73 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _35, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _34, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _32))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _71;
  _74 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _35, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _34, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _32))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _71;
  _75 = WaveReadLaneFirst(_materialIndex);
  _83 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._squareSize);
  _84 = _83 * _72;
  _85 = _83 * _73;
  _86 = _83 * _74;
  _87 = floor(_84);
  _88 = floor(_85);
  _89 = floor(_86);
  _91 = 10.0f;
  _92 = 0.0f;
  _93 = 0.0f;
  _94 = 0.0f;
  _95 = -1;
  while(true) {
    _100 = _91;
    _101 = _92;
    _102 = _93;
    _103 = _94;
    _104 = -1;
    while(true) {
      _109 = _100;
      _110 = _101;
      _111 = _102;
      _112 = _103;
      _113 = -1;
      while(true) {
        _114 = float((int)(_113));
        _115 = float((int)(_104));
        _116 = float((int)(_95));
        _120 = sin(_114 + _87);
        _121 = sin(_115 + _88);
        _122 = sin(_116 + _89);
        _137 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
        _144 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _114;
        _145 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _115;
        _146 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _116;
        _157 = max(abs((_87 - _84) + _144), max(abs((_88 - _85) + _145), abs((_89 - _86) + _146)));
        _158 = (_157 < _109);
        _159 = select(_158, _157, _109);
        _160 = select(_158, _144, _110);
        _161 = select(_158, _145, _111);
        _162 = select(_158, _146, _112);
        _163 = _113 + 1;
        if (!(_163 == 2)) {
          _109 = _159;
          _110 = _160;
          _111 = _161;
          _112 = _162;
          _113 = _163;
          continue;
        }
        while(true) {
          _106 = _104 + 1;
          if (!(_106 == 2)) {
            _100 = _159;
            _101 = _160;
            _102 = _161;
            _103 = _162;
            _104 = _106;
            __loop_jump_target = 99;
            break;
          }
          while(true) {
            _97 = _95 + 1;
            if (!(_97 == 2)) {
              _91 = _159;
              _92 = _160;
              _93 = _161;
              _94 = _162;
              _95 = _97;
              __loop_jump_target = 90;
              break;
            }
            _178 = WaveReadLaneFirst(_materialIndex);
            _186 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
            _191 = ((_160 + _87) / _83) - _mainPosition.x;
            _192 = ((_161 + _88) / _83) - _mainPosition.y;
            _193 = ((_162 + _89) / _83) - _mainPosition.z;
            _204 = WaveReadLaneFirst(_materialIndex);
            _212 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_204 < (uint)170000), _204, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._radius);
            _218 = _72 - _mainPosition.x;
            _219 = _73 - _mainPosition.y;
            _220 = _74 - _mainPosition.z;
            _235 = WaveReadLaneFirst(_materialIndex);
            _243 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_235 < (uint)170000), _235, 0)) + 0u))].BindlessParameters_PostProcessWorldLoading._ringRatio);
            _245 = ((1.0f - saturate(exp2(log2(abs(((1.0f - ((1.0f / max(9.999999747378752e-06f, (_212 * 0.8333333134651184f))) * sqrt(dot(float3(_218, _219, _220), float3(_218, _219, _220))))) * 2.500000238418579f) + -0.5f) * 0.6666666865348816f)))) * (1.0f / max(0.0010000000474974513f, _exposure0.x))) * _243;
            _249 = (_245 * 0.800000011920929f) + _25.x;
            _250 = (_245 * 0.4000000059604645f) + _25.y;
            _251 = (_245 * 0.20000000298023224f) + _25.z;
            _252 = uint(SV_Position.y);
            if (_etcParams.y == 1.0f) {
              _265 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _252, 0)))).x) & 127))) + 0.5f);
            } else {
              _265 = saturate((_159 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _186)) * sqrt(dot(float3(_191, _192, _193), float3(_191, _192, _193))))) * 1.470588207244873f));
            }
            if (_localToneMappingParams.w > 0.0f) {
              float3 output_color = TonemapReplacer(float3(_249, _250, _251));
              _687 = output_color.x;
              _688 = output_color.y;
              _689 = output_color.z;
            } else {
              _687 = _249;
              _688 = _250;
              _689 = _251;
            }
            if (_etcParams.y > 1.0f) {
              _697 = abs(_32);
              _698 = abs(_33 + -1.0f);
              _702 = saturate(1.0f - (dot(float2(_697, _698), float2(_697, _698)) * saturate(_etcParams.y + -1.0f)));
              _707 = (_702 * _687);
              _708 = (_702 * _688);
              _709 = (_702 * _689);
            } else {
              _707 = _687;
              _708 = _688;
              _709 = _689;
            }
            if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
              _742 = select((_707 <= 0.0031308000907301903f), (_707 * 12.920000076293945f), (((pow(_707, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
              _743 = select((_708 <= 0.0031308000907301903f), (_708 * 12.920000076293945f), (((pow(_708, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
              _744 = select((_709 <= 0.0031308000907301903f), (_709 * 12.920000076293945f), (((pow(_709, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
            } else {
              _742 = _707;
              _743 = _708;
              _744 = _709;
            }
            if (!(_etcParams.y < 1.0f)) {
              _749 = float((uint)_252);
              if (!(_749 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
                if (_749 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
                  _758 = _742;
                  _759 = _743;
                  _760 = _744;
                } else {
                  _758 = 0.0f;
                  _759 = 0.0f;
                  _760 = 0.0f;
                }
              } else {
                _758 = 0.0f;
                _759 = 0.0f;
                _760 = 0.0f;
              }
            } else {
              _758 = _742;
              _759 = _743;
              _760 = _744;
            }
            SV_Target.x = _758;
            SV_Target.y = _759;
            SV_Target.z = _760;
            SV_Target.w = _265;
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
      if (__loop_jump_target == 99) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
    if (__loop_jump_target == 90) {
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