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
  float _307;
  float _308;
  float _499;
  float _704;
  float _705;
  float _706;
  float _799;
  float _800;
  float _801;
  float _921;
  float _922;
  float _923;
  float _941;
  float _942;
  float _943;
  float _976;
  float _977;
  float _978;
  float _992;
  float _993;
  float _994;
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
  float _291;
  float _292;
  float _294;
  float _295;
  float _296;
  float _310;
  float _311;
  float _312;
  float _313;
  float _315;
  float _316;
  float _317;
  float _318;
  float _321;
  float _322;
  float _355;
  uint _362;
  uint _363;
  uint4 _365;
  float4 _368;
  float _386;
  float _387;
  float _388;
  float _390;
  float _391;
  float _392;
  float _393;
  float _396;
  float _397;
  float _400;
  float _401;
  float _405;
  float _407;
  float _408;
  float _409;
  float _410;
  float _412;
  float _415;
  float _416;
  float _417;
  float _418;
  float _427;
  float _431;
  float _435;
  float _437;
  int _450;
  float _458;
  float _472;
  float _476;
  float _483;
  float _484;
  float _485;
  uint _486;
  float _508;
  float _557;
  float _558;
  float _559;
  float _561;
  float _568;
  float _569;
  float _570;
  float _589;
  float _590;
  float _591;
  float _592;
  float _593;
  float _594;
  float _595;
  float _596;
  float _597;
  float _643;
  float _644;
  float _645;
  float _646;
  float _647;
  float _648;
  float _649;
  float _666;
  float _667;
  float _668;
  float _669;
  float _675;
  float _678;
  float _685;
  float _686;
  float _687;
  float _716;
  float _741;
  float _742;
  float _743;
  float _762;
  float _763;
  float _764;
  float _770;
  float _774;
  float _775;
  float _776;
  float _777;
  float _782;
  float _807;
  float _811;
  float _812;
  float _813;
  float _814;
  int _855;
  float _910;
  float _931;
  float _932;
  float _936;
  float _983;
  int __loop_jump_target = -1;
  float _27[36];
  _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _41 = (TEXCOORD.x * 2.0f) + -1.0f;
  _42 = TEXCOORD.y * 2.0f;
  _43 = 1.0f - _42;
  _44 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _56 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _44, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _43, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _41))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _57 = WaveReadLaneFirst(_materialIndex);
  _65 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._radius);
  _66 = WaveReadLaneFirst(_materialIndex);
  _74 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _77 = saturate(1.0f - _74) * _65;
  if (!(_77 < 0.0010000000474974513f)) {
    _107 = WaveReadLaneFirst(_materialIndex);
    _115 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._squareSize);
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
  _242 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._noiseTex);
  _252 = WaveReadLaneFirst(_materialIndex);
  _260 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_252 < (uint)170000), _252, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _261 = _260 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_242 < (uint)65000), _242, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_227 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f) + (_227 * TEXCOORD.y)))))).y) + -0.30000001192092896f);
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_267.x, _267.y);
  _282 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_267.x)))))) + 0.5f) * ((_261 * 0.0010000000474974513f) + TEXCOORD.x)), int((float((int)(int(float((int)((int)(_267.y)))))) + 0.5f) * ((_261 * 0.009999999776482582f) + TEXCOORD.y)), 0));
  _291 = (float((uint)((uint)((uint)((uint)(_282.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _292 = (float((uint)((uint)(((uint)((uint)(_282.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _294 = 1.0f - abs(_291);
  _295 = abs(_292);
  _296 = _294 - _295;
  if (_296 < 0.0f) {
    _307 = (select((_291 >= 0.0f), 1.0f, -1.0f) * (1.0f - _295));
    _308 = (select((_292 >= 0.0f), 1.0f, -1.0f) * _294);
  } else {
    _307 = _291;
    _308 = _292;
  }
  _310 = rsqrt(dot(float3(_307, _308, _296), float3(_307, _308, _296)));
  _311 = _310 * _307;
  _312 = _310 * _308;
  _313 = _310 * _296;
  _315 = rsqrt(dot(float3(_311, _312, _313), float3(_311, _312, _313)));
  _316 = _315 * _311;
  _317 = _315 * _312;
  _318 = _315 * _313;
  _321 = (_261 * 0.0005000000237487257f) + TEXCOORD.x;
  _322 = (_261 * 0.004999999888241291f) + TEXCOORD.y;
  _355 = saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _321)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _322)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.10000000149011612f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _321), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _322), 0)))).x)))));
  _362 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * ((_261 * 0.0002500000118743628f) + TEXCOORD.x));
  _363 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * ((_261 * 0.0024999999441206455f) + TEXCOORD.y));
  _365 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_362, _363, 0));
  _368 = __3__36__0__0__g_gbufferNormal.Load(int3(_362, _363, 0));
  _386 = (saturate(_368.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _387 = (saturate(_368.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _388 = (saturate(_368.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _390 = rsqrt(dot(float3(_386, _387, _388), float3(_386, _387, _388)));
  _391 = _390 * _386;
  _392 = _390 * _387;
  _393 = _388 * _390;
  _396 = (float((uint)((uint)(((uint)((uint)(_365.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _397 = (float((uint)((uint)(_365.w & 255))) * 0.007843137718737125f) + -1.0f;
  _400 = (_396 + _397) * 0.5f;
  _401 = (_396 - _397) * 0.5f;
  _405 = (1.0f - abs(_400)) - abs(_401);
  _407 = rsqrt(dot(float3(_400, _401, _405), float3(_400, _401, _405)));
  _408 = _407 * _400;
  _409 = _407 * _401;
  _410 = _407 * _405;
  _412 = select((_393 >= 0.0f), 1.0f, -1.0f);
  _415 = -0.0f - (1.0f / (_412 + _393));
  _416 = _392 * _415;
  _417 = _416 * _391;
  _418 = _412 * _391;
  _427 = mad(_410, _391, mad(_409, _417, ((((_418 * _391) * _415) + 1.0f) * _408)));
  _431 = mad(_410, _392, mad(_409, (_412 + (_416 * _392)), ((_408 * _412) * _417)));
  _435 = mad(_410, _393, mad(_409, (-0.0f - _392), (-0.0f - (_418 * _408))));
  _437 = rsqrt(dot(float3(_427, _431, _435), float3(_427, _431, _435)));
  _450 = WaveReadLaneFirst(_materialIndex);
  _458 = WaveReadLaneFirst(BindlessParameters_PostProcessAimHighlight_CD[((int)((uint)(select(((uint)_450 < (uint)170000), _450, 0)) + 0u))].BindlessParameters_PostProcessAimHighlight_CD._aimHighlightProgress);
  _472 = exp2(log2(1.0f - abs(dot(float3(((((_437 * _427) - _316) * _355) + _316), ((((_437 * _431) - _317) * _355) + _317), ((((_437 * _435) - _318) * _355) + _318)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 2.5f) * saturate((_458 * 100.0f) + -99.0f);
  _476 = select((_355 != 0.0f), _472, ((_472 * 0.25f) + 0.009999999776482582f));
  _483 = ((_476 - _32.x) * _222) + _32.x;
  _484 = ((_476 - _32.y) * _222) + _32.y;
  _485 = ((_476 - _32.z) * _222) + _32.z;
  _486 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _499 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _486, 0)))).x) & 127))) + 0.5f);
  } else {
    _499 = _222;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_483, _484, _485));
    _921 = output_color.x;
    _922 = output_color.y;
    _923 = output_color.z;
  } else {
    _921 = _483;
    _922 = _484;
    _923 = _485;
  }
  if (_etcParams.y > 1.0f) {
    _931 = abs(_41);
    _932 = abs(_42 + -1.0f);
    _936 = saturate(1.0f - (dot(float2(_931, _932), float2(_931, _932)) * saturate(_etcParams.y + -1.0f)));
    _941 = (_936 * _921);
    _942 = (_936 * _922);
    _943 = (_936 * _923);
  } else {
    _941 = _921;
    _942 = _922;
    _943 = _923;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _976 = select((_941 <= 0.0031308000907301903f), (_941 * 12.920000076293945f), (((pow(_941, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _977 = select((_942 <= 0.0031308000907301903f), (_942 * 12.920000076293945f), (((pow(_942, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _978 = select((_943 <= 0.0031308000907301903f), (_943 * 12.920000076293945f), (((pow(_943, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _976 = _941;
    _977 = _942;
    _978 = _943;
  }
  if (!(_etcParams.y < 1.0f)) {
    _983 = float((uint)_486);
    if (!(_983 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_983 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _992 = _976;
        _993 = _977;
        _994 = _978;
      } else {
        _992 = 0.0f;
        _993 = 0.0f;
        _994 = 0.0f;
      }
    } else {
      _992 = 0.0f;
      _993 = 0.0f;
      _994 = 0.0f;
    }
  } else {
    _992 = _976;
    _993 = _977;
    _994 = _978;
  }
  SV_Target.x = _992;
  SV_Target.y = _993;
  SV_Target.z = _994;
  SV_Target.w = _499;
  return SV_Target;
}