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
  float _41;
  float _42;
  float _43;
  float _44;
  float _56;
  int _57;
  float _65;
  int _66;
  float _74;
  float _77;
  float _123;
  float _124;
  float _125;
  float _126;
  int _127;
  float _132;
  float _133;
  float _134;
  float _135;
  int _136;
  float _141;
  float _142;
  float _143;
  float _144;
  int _145;
  float _222;
  float _308;
  float _309;
  float _478;
  float _529;
  float _734;
  float _735;
  float _736;
  float _829;
  float _830;
  float _831;
  float _951;
  float _952;
  float _953;
  float _971;
  float _972;
  float _973;
  float _1006;
  float _1007;
  float _1008;
  float _1022;
  float _1023;
  float _1024;
  int _107;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  float _120;
  float _121;
  int _129;
  int _138;
  float _146;
  float _147;
  float _148;
  float _152;
  float _153;
  float _154;
  float _169;
  float _176;
  float _177;
  float _178;
  float _189;
  bool _190;
  float _191;
  float _192;
  float _193;
  float _194;
  int _195;
  float _208;
  float _209;
  float _210;
  float _227;
  int _234;
  int _242;
  int _252;
  float _260;
  float _261;
  uint2 _267;
  uint _282;
  int _284;
  float _292;
  float _293;
  float _295;
  float _296;
  float _297;
  float _311;
  float _312;
  float _313;
  float _314;
  float _316;
  float _317;
  float _318;
  float _319;
  float _322;
  float _323;
  float _356;
  uint _363;
  uint _364;
  uint4 _366;
  float4 _369;
  float _387;
  float _388;
  float _389;
  float _391;
  float _392;
  float _393;
  float _394;
  float _397;
  float _398;
  float _401;
  float _402;
  float _406;
  float _408;
  float _409;
  float _410;
  float _411;
  float _413;
  float _416;
  float _417;
  float _418;
  float _419;
  float _428;
  float _432;
  float _436;
  float _438;
  int _455;
  float _463;
  int _468;
  float _476;
  int _479;
  float _487;
  float _502;
  float _506;
  float _513;
  float _514;
  float _515;
  uint _516;
  float _538;
  float _587;
  float _588;
  float _589;
  float _591;
  float _598;
  float _599;
  float _600;
  float _619;
  float _620;
  float _621;
  float _622;
  float _623;
  float _624;
  float _625;
  float _626;
  float _627;
  float _673;
  float _674;
  float _675;
  float _676;
  float _677;
  float _678;
  float _679;
  float _696;
  float _697;
  float _698;
  float _699;
  float _705;
  float _708;
  float _715;
  float _716;
  float _717;
  float _746;
  float _771;
  float _772;
  float _773;
  float _792;
  float _793;
  float _794;
  float _800;
  float _804;
  float _805;
  float _806;
  float _807;
  float _812;
  float _837;
  float _841;
  float _842;
  float _843;
  float _844;
  int _885;
  float _940;
  float _961;
  float _962;
  float _966;
  float _1013;
  int __loop_jump_target = -1;
  float _27[36];
  _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _41 = (TEXCOORD.x * 2.0f) + -1.0f;
  _42 = TEXCOORD.y * 2.0f;
  _43 = 1.0f - _42;
  _44 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _56 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _44, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _43, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _41))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _57 = WaveReadLaneFirst(_materialIndex);
  _65 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._radius);
  _66 = WaveReadLaneFirst(_materialIndex);
  _74 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _77 = saturate(1.0f - _74) * _65;
  if (!(_77 < 0.0010000000474974513f)) {
    _107 = WaveReadLaneFirst(_materialIndex);
    _115 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._squareSize);
    _116 = _115 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _44, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _43, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _41))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _56);
    _117 = _115 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _44, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _43, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _41))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _56);
    _118 = _115 * ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _44, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _43, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _41))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _56);
    _119 = floor(_116);
    _120 = floor(_117);
    _121 = floor(_118);
    _123 = 10.0f;
    _124 = 0.0f;
    _125 = 0.0f;
    _126 = 0.0f;
    _127 = -1;
    while(true) {
      _132 = _123;
      _133 = _124;
      _134 = _125;
      _135 = _126;
      _136 = -1;
      while(true) {
        _141 = _132;
        _142 = _133;
        _143 = _134;
        _144 = _135;
        _145 = -1;
        while(true) {
          _146 = float((int)(_145));
          _147 = float((int)(_136));
          _148 = float((int)(_127));
          _152 = sin(_146 + _119);
          _153 = sin(_147 + _120);
          _154 = sin(_148 + _121);
          _169 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
          _176 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _146;
          _177 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _147;
          _178 = sin(_169 * frac(sin(dot(float3(_152, _153, _154), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _148;
          _189 = max(abs((_119 - _116) + _176), max(abs((_120 - _117) + _177), abs((_121 - _118) + _178)));
          _190 = (_189 < _141);
          _191 = select(_190, _189, _141);
          _192 = select(_190, _176, _142);
          _193 = select(_190, _177, _143);
          _194 = select(_190, _178, _144);
          _195 = _145 + 1;
          if (!(_195 == 2)) {
            _141 = _191;
            _142 = _192;
            _143 = _193;
            _144 = _194;
            _145 = _195;
            continue;
          }
          while(true) {
            _138 = _136 + 1;
            if (!(_138 == 2)) {
              _132 = _191;
              _133 = _192;
              _134 = _193;
              _135 = _194;
              _136 = _138;
              __loop_jump_target = 131;
              break;
            }
            while(true) {
              _129 = _127 + 1;
              if (!(_129 == 2)) {
                _123 = _191;
                _124 = _192;
                _125 = _193;
                _126 = _194;
                _127 = _129;
                __loop_jump_target = 122;
                break;
              }
              _208 = ((_192 + _119) / _115) - _mainPosition.x;
              _209 = ((_193 + _120) / _115) - _mainPosition.y;
              _210 = ((_194 + _121) / _115) - _mainPosition.z;
              _222 = saturate((_191 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _77)) * sqrt(dot(float3(_208, _209, _210), float3(_208, _209, _210))))) * 1.470588207244873f));
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
        if (__loop_jump_target == 131) {
          __loop_jump_target = -1;
          continue;
        }
        if (__loop_jump_target != -1) {
          break;
        }
        break;
      }
      if (__loop_jump_target == 122) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    _222 = 1.0f;
  }
  _227 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
  _234 = WaveReadLaneFirst(_materialIndex);
  _242 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._noiseTex);
  _252 = WaveReadLaneFirst(_materialIndex);
  _260 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_252 < (uint)170000), _252, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _261 = _260 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_227 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f) + (_227 * TEXCOORD.y)))))).y) + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_267.x, _267.y);
  _282 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_267.x)))))) + 0.5f) * ((_261 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)((int)(_267.y)))))) + 0.5f) * ((_261 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  _284 = _282.x & 255;
  _292 = (float((uint)((uint)((uint)((uint)(_282.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _293 = (float((uint)((uint)(((uint)((uint)(_282.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _295 = 1.0f - abs(_292);
  _296 = abs(_293);
  _297 = _295 - _296;
  if (_297 < 0.0f) {
    _308 = (select((_292 >= 0.0f), 1.0f, -1.0f) * (1.0f - _296));
    _309 = (select((_293 >= 0.0f), 1.0f, -1.0f) * _295);
  } else {
    _308 = _292;
    _309 = _293;
  }
  _311 = rsqrt(dot(float3(_308, _309, _297), float3(_308, _309, _297)));
  _312 = _311 * _308;
  _313 = _311 * _309;
  _314 = _311 * _297;
  _316 = rsqrt(dot(float3(_312, _313, _314), float3(_312, _313, _314)));
  _317 = _316 * _312;
  _318 = _316 * _313;
  _319 = _316 * _314;
  _322 = (_261 * 0.0005000000237487257f) + TEXCOORD.x;
  _323 = (_261 * 0.004999999888241291f) + TEXCOORD.y;
  _356 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _322)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _323)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _322), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _323), 0)))).x)))));
  _363 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_261 * 0.0002500000118743628f) + TEXCOORD.x));
  _364 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_261 * 0.0024999999441206455f) + TEXCOORD.y));
  _366 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_363, _364, 0));
  _369 = __3__36__0__0__g_gbufferNormal.Load(int3(_363, _364, 0));
  _387 = (saturate(_369.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _388 = (saturate(_369.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _389 = (saturate(_369.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _391 = rsqrt(dot(float3(_387, _388, _389), float3(_387, _388, _389)));
  _392 = _391 * _387;
  _393 = _391 * _388;
  _394 = _389 * _391;
  _397 = (float((uint)((uint)(((uint)((uint)(_366.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _398 = (float((uint)((uint)(_366.w & 255))) * 0.007843137718737125f) + -1.0f;
  _401 = (_397 + _398) * 0.5f;
  _402 = (_397 - _398) * 0.5f;
  _406 = (1.0f - abs(_401)) - abs(_402);
  _408 = rsqrt(dot(float3(_401, _402, _406), float3(_401, _402, _406)));
  _409 = _408 * _401;
  _410 = _408 * _402;
  _411 = _408 * _406;
  _413 = select((_394 >= 0.0f), 1.0f, -1.0f);
  _416 = -0.0f - (1.0f / (_413 + _394));
  _417 = _393 * _416;
  _418 = _417 * _392;
  _419 = _413 * _392;
  _428 = mad(_411, _392, mad(_410, _418, ((((_419 * _392) * _416) + 1.0f) * _409)));
  _432 = mad(_411, _393, mad(_410, (_413 + (_417 * _393)), ((_409 * _413) * _418)));
  _436 = mad(_411, _394, mad(_410, (-0.0f - _393), (-0.0f - (_419 * _409))));
  _438 = rsqrt(dot(float3(_428, _432, _436), float3(_428, _432, _436)));
  [branch]
  if (_284 == _renderPassMemory) {
    _455 = WaveReadLaneFirst(_materialIndex);
    _463 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_455 < (uint)170000), _455, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryOpacity);
    _478 = _463;
  } else {
    if (_284 == _renderPassEnemyBoss) {
      _468 = WaveReadLaneFirst(_materialIndex);
      _476 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_468 < (uint)170000), _468, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._enemyBossOpacity);
      _478 = _476;
    } else {
      _478 = 1.0f;
    }
  }
  _479 = WaveReadLaneFirst(_materialIndex);
  _487 = WaveReadLaneFirst(BindlessParameters_PostProcessMemoryRead_CD[((int)((uint)(select(((uint)_479 < (uint)170000), _479, 0)) + 0u))].BindlessParameters_PostProcessMemoryRead_CD._memoryReadProgress);
  _502 = (saturate((_487 * 100.0f) + -99.0f) * _478) * exp2(log2(1.0f - abs(dot(float3(((((_438 * _428) - _317) * _356) + _317), ((((_438 * _432) - _318) * _356) + _318), ((((_438 * _436) - _319) * _356) + _319)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f);
  _506 = select((_356 != 0.0f), _502, ((_502 * 0.05999999865889549f) + 0.007000000216066837f));
  _513 = ((_506 - _32.x) * _222) + _32.x;
  _514 = ((_506 - _32.y) * _222) + _32.y;
  _515 = ((_506 - _32.z) * _222) + _32.z;
  _516 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _529 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _516, 0)))).x) & 127))) + 0.5f);
  } else {
    _529 = _222;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_513, _514, _515));
    _951 = output_color.x;
    _952 = output_color.y;
    _953 = output_color.z;
  } else {
    _951 = _513;
    _952 = _514;
    _953 = _515;
  }
  if (_etcParams.y > 1.0f) {
    _961 = abs(_41);
    _962 = abs(_42 + -1.0f);
    _966 = saturate(1.0f - (dot(float2(_961, _962), float2(_961, _962)) * saturate(_etcParams.y + -1.0f)));
    _971 = (_966 * _951);
    _972 = (_966 * _952);
    _973 = (_966 * _953);
  } else {
    _971 = _951;
    _972 = _952;
    _973 = _953;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1006 = select((_971 <= 0.0031308000907301903f), (_971 * 12.920000076293945f), (((pow(_971, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1007 = select((_972 <= 0.0031308000907301903f), (_972 * 12.920000076293945f), (((pow(_972, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1008 = select((_973 <= 0.0031308000907301903f), (_973 * 12.920000076293945f), (((pow(_973, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1006 = _971;
    _1007 = _972;
    _1008 = _973;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1013 = float((uint)_516);
    if (!(_1013 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1013 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1022 = _1006;
        _1023 = _1007;
        _1024 = _1008;
      } else {
        _1022 = 0.0f;
        _1023 = 0.0f;
        _1024 = 0.0f;
      }
    } else {
      _1022 = 0.0f;
      _1023 = 0.0f;
      _1024 = 0.0f;
    }
  } else {
    _1022 = _1006;
    _1023 = _1007;
    _1024 = _1008;
  }
  SV_Target.x = _1022;
  SV_Target.y = _1023;
  SV_Target.z = _1024;
  SV_Target.w = _529;
  return SV_Target;
}