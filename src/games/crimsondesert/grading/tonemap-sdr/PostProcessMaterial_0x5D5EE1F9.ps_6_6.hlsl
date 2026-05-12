#include "../tonemap.hlsli"

struct PostProcessAimHighlight_CDStruct {
  float _aimHighlightProgress;
  float _aimHighlightBackground;
  uint _noiseTex;
  uint _auraTex;
  float _radius;
  float _squareSize;
  float _maskThreshold;
  uint _aimGimmickColor;
  uint _aimHighlightColor;
  float _fishEyeMaxPower;
  float _vignetteIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t38, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

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

struct BindlessParameters_PostProcessAimHighlight_CD {
  PostProcessAimHighlight_CDStruct BindlessParameters_PostProcessAimHighlight_CD;
};

typedef BindlessParameters_PostProcessAimHighlight_CD BindlessParameters_PostProcessAimHighlight_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAimHighlight_CD_t> BindlessParameters_PostProcessAimHighlight_CD[] : register(b0, space100);

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
  float4 _32;
  float _42;
  float _43;
  float _44;
  float _69;
  float _70;
  float _71;
  float _77;
  float _78;
  float _79;
  float _80;
  float _92;
  int _93;
  float _101;
  int _102;
  float _110;
  float _113;
  float _159;
  float _160;
  float _161;
  float _162;
  int _163;
  float _168;
  float _169;
  float _170;
  float _171;
  int _172;
  float _177;
  float _178;
  float _179;
  float _180;
  int _181;
  float _258;
  float _343;
  float _344;
  float _535;
  float _740;
  float _741;
  float _742;
  float _835;
  float _836;
  float _837;
  float _957;
  float _958;
  float _959;
  float _977;
  float _978;
  float _979;
  float _1012;
  float _1013;
  float _1014;
  float _1028;
  float _1029;
  float _1030;
  int _143;
  float _151;
  float _152;
  float _153;
  float _154;
  float _155;
  float _156;
  float _157;
  int _165;
  int _174;
  float _182;
  float _183;
  float _184;
  float _188;
  float _189;
  float _190;
  float _205;
  float _212;
  float _213;
  float _214;
  float _225;
  bool _226;
  float _227;
  float _228;
  float _229;
  float _230;
  int _231;
  float _244;
  float _245;
  float _246;
  float _263;
  int _270;
  int _278;
  int _288;
  float _296;
  float _297;
  uint2 _303;
  uint _318;
  float _327;
  float _328;
  float _330;
  float _331;
  float _332;
  float _346;
  float _347;
  float _348;
  float _349;
  float _351;
  float _352;
  float _353;
  float _354;
  float _357;
  float _358;
  float _391;
  uint _398;
  uint _399;
  uint4 _401;
  float4 _404;
  float _422;
  float _423;
  float _424;
  float _426;
  float _427;
  float _428;
  float _429;
  float _432;
  float _433;
  float _436;
  float _437;
  float _441;
  float _443;
  float _444;
  float _445;
  float _446;
  float _448;
  float _451;
  float _452;
  float _453;
  float _454;
  float _463;
  float _467;
  float _471;
  float _473;
  int _486;
  float _494;
  float _508;
  float _512;
  float _519;
  float _520;
  float _521;
  uint _522;
  float _544;
  float _593;
  float _594;
  float _595;
  float _597;
  float _604;
  float _605;
  float _606;
  float _625;
  float _626;
  float _627;
  float _628;
  float _629;
  float _630;
  float _631;
  float _632;
  float _633;
  float _679;
  float _680;
  float _681;
  float _682;
  float _683;
  float _684;
  float _685;
  float _702;
  float _703;
  float _704;
  float _705;
  float _711;
  float _714;
  float _721;
  float _722;
  float _723;
  float _752;
  float _777;
  float _778;
  float _779;
  float _798;
  float _799;
  float _800;
  float _806;
  float _810;
  float _811;
  float _812;
  float _813;
  float _818;
  float _843;
  float _847;
  float _848;
  float _849;
  float _850;
  int _891;
  float _946;
  float _967;
  float _968;
  float _972;
  float _1019;
  float _1040;
  float _1041;
  float _1042;
  int __loop_jump_target = -1;
  float _27[36];
  _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _42 = (pow(_32.x, 0.012683313339948654f));
  _43 = (pow(_32.y, 0.012683313339948654f));
  _44 = (pow(_32.z, 0.012683313339948654f));
  _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _77 = (TEXCOORD.x * 2.0f) + -1.0f;
  _78 = TEXCOORD.y * 2.0f;
  _79 = 1.0f - _78;
  _80 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _92 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _80, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _79, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _77))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _93 = WaveReadLaneFirst(_materialIndex);
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._radius);
  _102 = WaveReadLaneFirst(_materialIndex);
  _110 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_102 < (uint)170000), _102, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _113 = saturate(1.0f - _110) * _101;
  if (!(_113 < 0.0010000000474974513f)) {
    _143 = WaveReadLaneFirst(_materialIndex);
    _151 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._squareSize);
    _152 = _151 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _80, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _79, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _77))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _92);
    _153 = _151 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _80, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _79, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _77))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _92);
    _154 = _151 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _80, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _79, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _77))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _92);
    _155 = floor(_152);
    _156 = floor(_153);
    _157 = floor(_154);
    _159 = 10.0f;
    _160 = 0.0f;
    _161 = 0.0f;
    _162 = 0.0f;
    _163 = -1;
    while(true) {
      _168 = _159;
      _169 = _160;
      _170 = _161;
      _171 = _162;
      _172 = -1;
      while(true) {
        _177 = _168;
        _178 = _169;
        _179 = _170;
        _180 = _171;
        _181 = -1;
        while(true) {
          _182 = float((int)(_181));
          _183 = float((int)(_172));
          _184 = float((int)(_163));
          _188 = sin(_182 + _155);
          _189 = sin(_183 + _156);
          _190 = sin(_184 + _157);
          _205 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _212 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _182;
          _213 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _183;
          _214 = sin(_205 * frac(sin(dot(float3(_188, _189, _190), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _184;
          _225 = max(abs((_155 - _152) + _212), max(abs((_156 - _153) + _213), abs((_157 - _154) + _214)));
          _226 = (_225 < _177);
          _227 = select(_226, _225, _177);
          _228 = select(_226, _212, _178);
          _229 = select(_226, _213, _179);
          _230 = select(_226, _214, _180);
          _231 = _181 + 1;
          if (!(_231 == 2)) {
            _177 = _227;
            _178 = _228;
            _179 = _229;
            _180 = _230;
            _181 = _231;
            continue;
          }
          while(true) {
            _174 = _172 + 1;
            if (!(_174 == 2)) {
              _168 = _227;
              _169 = _228;
              _170 = _229;
              _171 = _230;
              _172 = _174;
              __loop_jump_target = 167;
              break;
            }
            while(true) {
              _165 = _163 + 1;
              if (!(_165 == 2)) {
                _159 = _227;
                _160 = _228;
                _161 = _229;
                _162 = _230;
                _163 = _165;
                __loop_jump_target = 158;
                break;
              }
              _244 = ((_228 + _155) / _151) - _mainPosition.x;
              _245 = ((_229 + _156) / _151) - _mainPosition.y;
              _246 = ((_230 + _157) / _151) - _mainPosition.z;
              _258 = saturate((_227 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _113)) * sqrt(dot(float3(_244, _245, _246), float3(_244, _245, _246))))) * 1.470588207244873f));
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
        if (__loop_jump_target == 167) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 158) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _258 = 1.0f;
  }
  _263 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  _270 = WaveReadLaneFirst(_materialIndex);
  _278 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
  _288 = WaveReadLaneFirst(_materialIndex);
  _296 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_288 < (uint)170000), _288, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _297 = _296 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_278 < (uint)65000), _278, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_263 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f) + (_263 * TEXCOORD.y)))))).y) + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_303.x, _303.y);
  _318 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_303.x)))))) + 0.5f) * ((_297 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)((int)(_303.y)))))) + 0.5f) * ((_297 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  _327 = (float((uint)((uint)((uint)((uint)(_318.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _328 = (float((uint)((uint)(((uint)((uint)(_318.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _330 = 1.0f - abs(_327);
  _331 = abs(_328);
  _332 = _330 - _331;
  if (_332 < 0.0f) {
    _343 = (select((_327 >= 0.0f), 1.0f, -1.0f) * (1.0f - _331));
    _344 = (select((_328 >= 0.0f), 1.0f, -1.0f) * _330);
  } else {
    _343 = _327;
    _344 = _328;
  }
  _346 = rsqrt(dot(float3(_343, _344, _332), float3(_343, _344, _332)));
  _347 = _346 * _343;
  _348 = _346 * _344;
  _349 = _346 * _332;
  _351 = rsqrt(dot(float3(_347, _348, _349), float3(_347, _348, _349)));
  _352 = _351 * _347;
  _353 = _351 * _348;
  _354 = _351 * _349;
  _357 = (_297 * 0.0005000000237487257f) + TEXCOORD.x;
  _358 = (_297 * 0.004999999888241291f) + TEXCOORD.y;
  _391 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _357)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _358)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _357), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _358), 0)))).x)))));
  _398 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_297 * 0.0002500000118743628f) + TEXCOORD.x));
  _399 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_297 * 0.0024999999441206455f) + TEXCOORD.y));
  _401 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_398, _399, 0));
  _404 = __3__36__0__0__g_gbufferNormal.Load(int3(_398, _399, 0));
  _422 = (saturate(_404.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _423 = (saturate(_404.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _424 = (saturate(_404.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _426 = rsqrt(dot(float3(_422, _423, _424), float3(_422, _423, _424)));
  _427 = _426 * _422;
  _428 = _426 * _423;
  _429 = _424 * _426;
  _432 = (float((uint)((uint)(((uint)((uint)(_401.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _433 = (float((uint)((uint)(_401.w & 255))) * 0.007843137718737125f) + -1.0f;
  _436 = (_432 + _433) * 0.5f;
  _437 = (_432 - _433) * 0.5f;
  _441 = (1.0f - abs(_436)) - abs(_437);
  _443 = rsqrt(dot(float3(_436, _437, _441), float3(_436, _437, _441)));
  _444 = _443 * _436;
  _445 = _443 * _437;
  _446 = _443 * _441;
  _448 = select((_429 >= 0.0f), 1.0f, -1.0f);
  _451 = -0.0f - (1.0f / (_448 + _429));
  _452 = _428 * _451;
  _453 = _452 * _427;
  _454 = _448 * _427;
  _463 = mad(_446, _427, mad(_445, _453, ((((_454 * _427) * _451) + 1.0f) * _444)));
  _467 = mad(_446, _428, mad(_445, (_448 + (_452 * _428)), ((_444 * _448) * _453)));
  _471 = mad(_446, _429, mad(_445, (-0.0f - _428), (-0.0f - (_454 * _444))));
  _473 = rsqrt(dot(float3(_463, _467, _471), float3(_463, _467, _471)));
  _486 = WaveReadLaneFirst(_materialIndex);
  _494 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_486 < (uint)170000), _486, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _508 = exp2(log2(1.0f - abs(dot(float3(((((_473 * _463) - _352) * _391) + _352), ((((_473 * _467) - _353) * _391) + _353), ((((_473 * _471) - _354) * _391) + _354)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f) * saturate((_494 * 100.0f) + -99.0f);
  _512 = select((_391 != 0.0f), _508, ((_508 * 0.25f) + 0.009999999776482582f));
  _519 = ((_512 - _69) * _258) + _69;
  _520 = ((_512 - _70) * _258) + _70;
  _521 = ((_512 - _71) * _258) + _71;
  _522 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _535 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _522, 0)))).x) & 127))) + 0.5f);
  } else {
    _535 = _258;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_519, _520, _521));
    _957 = output_color.x;
    _958 = output_color.y;
    _959 = output_color.z;
  } else {
    _957 = _519;
    _958 = _520;
    _959 = _521;
  }
  if (_etcParams.y > 1.0f) {
    _967 = abs(_77);
    _968 = abs(_78 + -1.0f);
    _972 = saturate(1.0f - (dot(float2(_967, _968), float2(_967, _968)) * saturate(_etcParams.y + -1.0f)));
    _977 = (_972 * _957);
    _978 = (_972 * _958);
    _979 = (_972 * _959);
  } else {
    _977 = _957;
    _978 = _958;
    _979 = _959;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1012 = select((_977 <= 0.0031308000907301903f), (_977 * 12.920000076293945f), (((pow(_977, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1013 = select((_978 <= 0.0031308000907301903f), (_978 * 12.920000076293945f), (((pow(_978, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1014 = select((_979 <= 0.0031308000907301903f), (_979 * 12.920000076293945f), (((pow(_979, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1012 = _977;
    _1013 = _978;
    _1014 = _979;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1019 = float((uint)_522);
    if (!(_1019 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1019 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1028 = _1012;
        _1029 = _1013;
        _1030 = _1014;
      } else {
        _1028 = 0.0f;
        _1029 = 0.0f;
        _1030 = 0.0f;
      }
    } else {
      _1028 = 0.0f;
      _1029 = 0.0f;
      _1030 = 0.0f;
    }
  } else {
    _1028 = _1012;
    _1029 = _1013;
    _1030 = _1014;
  }
  _1040 = exp2(log2(_1028 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1041 = exp2(log2(_1029 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1042 = exp2(log2(_1030 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1040 * 18.6875f) + 1.0f)) * ((_1040 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1041 * 18.6875f) + 1.0f)) * ((_1041 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1042 * 18.6875f) + 1.0f)) * ((_1042 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _535;
  return SV_Target;
}