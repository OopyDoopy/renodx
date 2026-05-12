#include "../tonemap.hlsli"

struct PostProcessMemoryRead_CDStruct {
  float _memoryReadProgress;
  float _memoryReadBackgroundOpacity;
  float _memoryOpacity;
  float _enemyBossOpacity;
  uint _noiseTex;
  uint _auraTex;
  uint _glitchTex;
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float3 _cubeSpaceSkyColor;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _cubeSpaceSpeedRatio;
  float _tempCubeSpaceRatio;
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

struct BindlessParameters_PostProcessMemoryRead_CD {
  PostProcessMemoryRead_CDStruct BindlessParameters_PostProcessMemoryRead_CD;
};

typedef BindlessParameters_PostProcessMemoryRead_CD BindlessParameters_PostProcessMemoryRead_CD_t;
ConstantBuffer<BindlessParameters_PostProcessMemoryRead_CD_t> BindlessParameters_PostProcessMemoryRead_CD[] : register(b0, space100);

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
  float _344;
  float _345;
  float _514;
  float _565;
  float _770;
  float _771;
  float _772;
  float _865;
  float _866;
  float _867;
  float _987;
  float _988;
  float _989;
  float _1007;
  float _1008;
  float _1009;
  float _1042;
  float _1043;
  float _1044;
  float _1058;
  float _1059;
  float _1060;
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
  int _320;
  float _328;
  float _329;
  float _331;
  float _332;
  float _333;
  float _347;
  float _348;
  float _349;
  float _350;
  float _352;
  float _353;
  float _354;
  float _355;
  float _358;
  float _359;
  float _392;
  uint _399;
  uint _400;
  uint4 _402;
  float4 _405;
  float _423;
  float _424;
  float _425;
  float _427;
  float _428;
  float _429;
  float _430;
  float _433;
  float _434;
  float _437;
  float _438;
  float _442;
  float _444;
  float _445;
  float _446;
  float _447;
  float _449;
  float _452;
  float _453;
  float _454;
  float _455;
  float _464;
  float _468;
  float _472;
  float _474;
  int _491;
  float _499;
  int _504;
  float _512;
  int _515;
  float _523;
  float _538;
  float _542;
  float _549;
  float _550;
  float _551;
  uint _552;
  float _574;
  float _623;
  float _624;
  float _625;
  float _627;
  float _634;
  float _635;
  float _636;
  float _655;
  float _656;
  float _657;
  float _658;
  float _659;
  float _660;
  float _661;
  float _662;
  float _663;
  float _709;
  float _710;
  float _711;
  float _712;
  float _713;
  float _714;
  float _715;
  float _732;
  float _733;
  float _734;
  float _735;
  float _741;
  float _744;
  float _751;
  float _752;
  float _753;
  float _782;
  float _807;
  float _808;
  float _809;
  float _828;
  float _829;
  float _830;
  float _836;
  float _840;
  float _841;
  float _842;
  float _843;
  float _848;
  float _873;
  float _877;
  float _878;
  float _879;
  float _880;
  int _921;
  float _976;
  float _997;
  float _998;
  float _1002;
  float _1049;
  float _1070;
  float _1071;
  float _1072;
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
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._radius);
  _102 = WaveReadLaneFirst(_materialIndex);
  _110 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_102 < (uint)170000), _102, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _113 = saturate(1.0f - _110) * _101;
  if (!(_113 < 0.0010000000474974513f)) {
    _143 = WaveReadLaneFirst(_materialIndex);
    _151 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._squareSize);
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
  _278 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
  _288 = WaveReadLaneFirst(_materialIndex);
  _296 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_288 < (uint)170000), _288, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _297 = _296 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_278 < (uint)65000), _278, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_263 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f) + (_263 * TEXCOORD.y)))))).y) + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_303.x, _303.y);
  _318 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_303.x)))))) + 0.5f) * ((_297 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)((int)(_303.y)))))) + 0.5f) * ((_297 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  _320 = _318.x & 255;
  _328 = (float((uint)((uint)((uint)((uint)(_318.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _329 = (float((uint)((uint)(((uint)((uint)(_318.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _331 = 1.0f - abs(_328);
  _332 = abs(_329);
  _333 = _331 - _332;
  if (_333 < 0.0f) {
    _344 = (select((_328 >= 0.0f), 1.0f, -1.0f) * (1.0f - _332));
    _345 = (select((_329 >= 0.0f), 1.0f, -1.0f) * _331);
  } else {
    _344 = _328;
    _345 = _329;
  }
  _347 = rsqrt(dot(float3(_344, _345, _333), float3(_344, _345, _333)));
  _348 = _347 * _344;
  _349 = _347 * _345;
  _350 = _347 * _333;
  _352 = rsqrt(dot(float3(_348, _349, _350), float3(_348, _349, _350)));
  _353 = _352 * _348;
  _354 = _352 * _349;
  _355 = _352 * _350;
  _358 = (_297 * 0.0005000000237487257f) + TEXCOORD.x;
  _359 = (_297 * 0.004999999888241291f) + TEXCOORD.y;
  _392 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _358)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _359)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _358), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _359), 0)))).x)))));
  _399 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_297 * 0.0002500000118743628f) + TEXCOORD.x));
  _400 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_297 * 0.0024999999441206455f) + TEXCOORD.y));
  _402 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_399, _400, 0));
  _405 = __3__36__0__0__g_gbufferNormal.Load(int3(_399, _400, 0));
  _423 = (saturate(_405.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _424 = (saturate(_405.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _425 = (saturate(_405.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _427 = rsqrt(dot(float3(_423, _424, _425), float3(_423, _424, _425)));
  _428 = _427 * _423;
  _429 = _427 * _424;
  _430 = _425 * _427;
  _433 = (float((uint)((uint)(((uint)((uint)(_402.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _434 = (float((uint)((uint)(_402.w & 255))) * 0.007843137718737125f) + -1.0f;
  _437 = (_433 + _434) * 0.5f;
  _438 = (_433 - _434) * 0.5f;
  _442 = (1.0f - abs(_437)) - abs(_438);
  _444 = rsqrt(dot(float3(_437, _438, _442), float3(_437, _438, _442)));
  _445 = _444 * _437;
  _446 = _444 * _438;
  _447 = _444 * _442;
  _449 = select((_430 >= 0.0f), 1.0f, -1.0f);
  _452 = -0.0f - (1.0f / (_449 + _430));
  _453 = _429 * _452;
  _454 = _453 * _428;
  _455 = _449 * _428;
  _464 = mad(_447, _428, mad(_446, _454, ((((_455 * _428) * _452) + 1.0f) * _445)));
  _468 = mad(_447, _429, mad(_446, (_449 + (_453 * _429)), ((_445 * _449) * _454)));
  _472 = mad(_447, _430, mad(_446, (-0.0f - _429), (-0.0f - (_455 * _445))));
  _474 = rsqrt(dot(float3(_464, _468, _472), float3(_464, _468, _472)));
  [branch]
  if (_320 == _renderPassMemory) {
    _491 = WaveReadLaneFirst(_materialIndex);
    _499 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_491 < (uint)170000), _491, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryOpacity);
    _514 = _499;
  } else {
    if (_320 == _renderPassEnemyBoss) {
      _504 = WaveReadLaneFirst(_materialIndex);
      _512 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_504 < (uint)170000), _504, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
      _514 = _512;
    } else {
      _514 = 1.0f;
    }
  }
  _515 = WaveReadLaneFirst(_materialIndex);
  _523 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_515 < (uint)170000), _515, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _538 = (saturate((_523 * 100.0f) + -99.0f) * _514) * exp2(log2(1.0f - abs(dot(float3(((((_474 * _464) - _353) * _392) + _353), ((((_474 * _468) - _354) * _392) + _354), ((((_474 * _472) - _355) * _392) + _355)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f);
  _542 = select((_392 != 0.0f), _538, ((_538 * 0.05999999865889549f) + 0.007000000216066837f));
  _549 = ((_542 - _69) * _258) + _69;
  _550 = ((_542 - _70) * _258) + _70;
  _551 = ((_542 - _71) * _258) + _71;
  _552 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _565 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _552, 0)))).x) & 127))) + 0.5f);
  } else {
    _565 = _258;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_549, _550, _551));
    _987 = output_color.x;
    _988 = output_color.y;
    _989 = output_color.z;
  } else {
    _987 = _549;
    _988 = _550;
    _989 = _551;
  }
  if (_etcParams.y > 1.0f) {
    _997 = abs(_77);
    _998 = abs(_78 + -1.0f);
    _1002 = saturate(1.0f - (dot(float2(_997, _998), float2(_997, _998)) * saturate(_etcParams.y + -1.0f)));
    _1007 = (_1002 * _987);
    _1008 = (_1002 * _988);
    _1009 = (_1002 * _989);
  } else {
    _1007 = _987;
    _1008 = _988;
    _1009 = _989;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1042 = select((_1007 <= 0.0031308000907301903f), (_1007 * 12.920000076293945f), (((pow(_1007, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1043 = select((_1008 <= 0.0031308000907301903f), (_1008 * 12.920000076293945f), (((pow(_1008, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1044 = select((_1009 <= 0.0031308000907301903f), (_1009 * 12.920000076293945f), (((pow(_1009, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1042 = _1007;
    _1043 = _1008;
    _1044 = _1009;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1049 = float((uint)_552);
    if (!(_1049 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1049 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1058 = _1042;
        _1059 = _1043;
        _1060 = _1044;
      } else {
        _1058 = 0.0f;
        _1059 = 0.0f;
        _1060 = 0.0f;
      }
    } else {
      _1058 = 0.0f;
      _1059 = 0.0f;
      _1060 = 0.0f;
    }
  } else {
    _1058 = _1042;
    _1059 = _1043;
    _1060 = _1044;
  }
  _1070 = exp2(log2(_1058 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1071 = exp2(log2(_1059 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1072 = exp2(log2(_1060 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1070 * 18.6875f) + 1.0f)) * ((_1070 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1071 * 18.6875f) + 1.0f)) * ((_1071 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1072 * 18.6875f) + 1.0f)) * ((_1072 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _565;
  return SV_Target;
}