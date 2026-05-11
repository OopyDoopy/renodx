#include "../tonemap.hlsli"

struct PostProcessKnowledgeGain_CDStruct {
  uint _noiseTex;
  uint _regionTex;
  float _knowledgeGainRegionRatio;
  float _knowledgeGainCharacterRatio;
  float _knowledgeGainGimmickRatio;
  uint _knowledgeGainColor;
  uint _knowledgeGainRegionNumberR;
  uint _knowledgeGainRegionNumberG;
  float3 _knowledgeGainBoundBoxMin;
  float3 _knowledgeGainBoundBoxMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t67, space36);

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

struct BindlessParameters_PostProcessKnowledgeGain_CD {
  PostProcessKnowledgeGain_CDStruct BindlessParameters_PostProcessKnowledgeGain_CD;
};

typedef BindlessParameters_PostProcessKnowledgeGain_CD BindlessParameters_PostProcessKnowledgeGain_CD_t;
ConstantBuffer<BindlessParameters_PostProcessKnowledgeGain_CD_t> BindlessParameters_PostProcessKnowledgeGain_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _28;
  float _38;
  float _39;
  float _40;
  float _65;
  float _66;
  float _67;
  int _68;
  float _76;
  bool _306;
  float _307;
  float _430;
  float _431;
  float _432;
  float _495;
  float _496;
  float _497;
  float _575;
  float _576;
  float _577;
  float _591;
  float _796;
  float _797;
  float _798;
  float _891;
  float _892;
  float _893;
  float _1013;
  float _1014;
  float _1015;
  float _1036;
  float _1037;
  float _1038;
  float _1071;
  float _1072;
  float _1073;
  float _1087;
  float _1088;
  float _1089;
  int _79;
  int _87;
  int _88;
  int _96;
  int _97;
  float _107;
  float _108;
  float _109;
  int _110;
  float _120;
  float _121;
  float _122;
  float _143;
  float _145;
  float _146;
  float _182;
  float _183;
  float _184;
  float _185;
  int _188;
  int _196;
  float4 _203;
  float _208;
  float _209;
  float _210;
  float _223;
  float _224;
  float _225;
  float _232;
  float _233;
  float _234;
  float _241;
  int _256;
  int _264;
  float4 _271;
  float _291;
  float _292;
  float _293;
  float4 _311;
  int _313;
  int _321;
  float _324;
  float _327;
  float _329;
  float _359;
  float _360;
  float _361;
  float _362;
  float _364;
  float _378;
  float _379;
  float _380;
  float _382;
  float _388;
  float _401;
  float _409;
  float _412;
  float _415;
  float _419;
  int _443;
  float _448;
  float _461;
  float _468;
  float _469;
  float _470;
  float _473;
  float _474;
  float _481;
  float _482;
  float _483;
  float _484;
  int _498;
  float _506;
  int _507;
  float _515;
  float4 _522;
  float _533;
  float _534;
  float _535;
  uint _578;
  float _600;
  float _649;
  float _650;
  float _651;
  float _653;
  float _660;
  float _661;
  float _662;
  float _681;
  float _682;
  float _683;
  float _684;
  float _685;
  float _686;
  float _687;
  float _688;
  float _689;
  float _735;
  float _736;
  float _737;
  float _738;
  float _739;
  float _740;
  float _741;
  float _758;
  float _759;
  float _760;
  float _761;
  float _767;
  float _770;
  float _777;
  float _778;
  float _779;
  float _808;
  float _833;
  float _834;
  float _835;
  float _854;
  float _855;
  float _856;
  float _862;
  float _866;
  float _867;
  float _868;
  float _869;
  float _874;
  float _899;
  float _903;
  float _904;
  float _905;
  float _906;
  int _947;
  float _1002;
  float _1026;
  float _1027;
  float _1031;
  float _1078;
  float _1099;
  float _1100;
  float _1101;
  float _23[36];
  _28 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _38 = (pow(_28.x, 0.012683313339948654f));
  _39 = (pow(_28.y, 0.012683313339948654f));
  _40 = (pow(_28.z, 0.012683313339948654f));
  _65 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _66 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _67 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _68 = WaveReadLaneFirst(_materialIndex);
  _76 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionRatio);
  if (!(_76 < 0.0010000000474974513f)) {
    _79 = WaveReadLaneFirst(_materialIndex);
    _87 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionNumberR);
    _88 = WaveReadLaneFirst(_materialIndex);
    _96 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionNumberG);
    _97 = WaveReadLaneFirst(_materialIndex);
    _107 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.x);
    _108 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.y);
    _109 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.z);
    _110 = WaveReadLaneFirst(_materialIndex);
    _120 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.x);
    _121 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.y);
    _122 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.z);
    if (!((_96 | _87) == 0) | (((_107 != 0.0f) && (_108 != 0.0f)) && (_109 != 0.0f)) | (((_120 != 0.0f) && (_121 != 0.0f)) && (_122 != 0.0f))) {
      _143 = (TEXCOORD.x * 2.0f) + -1.0f;
      _145 = 1.0f - (TEXCOORD.y * 2.0f);
      _146 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
      _182 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _146, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _145, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _143))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _183 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _146, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _145, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _143))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _182;
      _184 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _146, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _145, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _143))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _182;
      _185 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _146, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _145, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _143))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _182;
      _188 = WaveReadLaneFirst(_materialIndex);
      _196 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_188 < (uint)170000), _188, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._noiseTex);
      _203 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_196 < (uint)65000), _196, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_183 * 0.019999999552965164f), (_185 * 0.019999999552965164f)));
      _208 = _107 - _120;
      _209 = _108 - _121;
      _210 = _109 - _122;
      bool __branch_chain_137;
      if (sqrt(((_209 * _209) + (_208 * _208)) + (_210 * _210)) < 0.009999999776482582f) {
        __branch_chain_137 = true;
      } else {
        _223 = _120 - _mainPosition.x;
        _224 = _121 - _mainPosition.y;
        _225 = _122 - _mainPosition.z;
        _232 = _107 - _mainPosition.x;
        _233 = _108 - _mainPosition.y;
        _234 = _109 - _mainPosition.z;
        _241 = max(sqrt(((_232 * _232) + (_233 * _233)) + (_234 * _234)), sqrt(((_223 * _223) + (_224 * _224)) + (_225 * _225)));
        if (_241 < 0.009999999776482582f) {
          __branch_chain_137 = true;
        } else {
          __branch_chain_137 = false;
        }
      }
      if (__branch_chain_137) {
        _256 = WaveReadLaneFirst(_materialIndex);
        _264 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_256 < (uint)170000), _256, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._regionTex);
        _271 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_264 < (uint)65000), _264, 0)) + 0u))].Sample(__0__4__0__0__g_staticPointClamp, float2((((_203.x + -0.5f) * 0.0005000000237487257f) + ((_183 + 16384.0f) * 4.882812572759576e-05f)), ((1.0f - ((_185 + 11264.0f) * 4.882812572759576e-05f)) + ((_203.y + -0.5f) * 0.0005000000237487257f))));
        _306 = (((int)(uint(_271.x * 255.0f)) == _87) && ((int)(uint(_271.y * 255.0f)) == _96));
        _307 = (_76 * 300.0f);
      } else {
        _291 = ((_203.x + -0.5f) * 10.0f) + _183;
        _292 = ((_203.y + -0.5f) * 10.0f) + _184;
        _293 = ((_203.z + -0.5f) * 10.0f) + _185;
        _306 = ((_293 > _122) && ((_293 < _109) && ((_292 > _121) && ((_292 < _108) && ((_291 < _107) && (_291 > _120))))));
        _307 = (min((_241 * 2.0f), 300.0f) * _76);
      }
      if (_306) {
        _311 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _313 = WaveReadLaneFirst(_materialIndex);
        _321 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_313 < (uint)170000), _313, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainColor);
        _324 = float((uint)((uint)(((uint)(_321) >> 16) & 255)));
        _327 = float((uint)((uint)(((uint)(_321) >> 8) & 255)));
        _329 = float((uint)((uint)(_321 & 255)));
        _359 = max(0.0010000000474974513f, _exposure0.x);
        _360 = select(((_324 * 0.003921568859368563f) < 0.040449999272823334f), (_324 * 0.0003035269910469651f), exp2(log2((_324 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _359;
        _361 = select(((_327 * 0.003921568859368563f) < 0.040449999272823334f), (_327 * 0.0003035269910469651f), exp2(log2((_327 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _359;
        _362 = select(((_329 * 0.003921568859368563f) < 0.040449999272823334f), (_329 * 0.0003035269910469651f), exp2(log2((_329 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _359;
        _364 = min(max(_307, 0.0f), 30.0f);
        _378 = (_183 - _mainPosition.x) + (_364 * (_203.z + -0.5f));
        _379 = (_184 - _mainPosition.y) + (_364 * (_203.w + -0.5f));
        _380 = (_185 - _mainPosition.z) + (_364 * (_203.x + -0.5f));
        _382 = saturate(_307) * 30.0f;
        _388 = sqrt(((_378 * _378) + (_379 * _379)) + (_380 * _380));
        _401 = ((1.0f - saturate(floor(_388 / _307))) * saturate(((_382 - _307) + _388) / _382)) * saturate((1.0f - _76) * 10.0f);
        _409 = log2(_401) * min(max((100.0f - (saturate(_388 * 0.009999999776482582f) * 100.0f)), 10.0f), 30.0f);
        _412 = exp2(_409 * 0.25f);
        _415 = ((8.0f - _412) * exp2(_409)) + _412;
        _419 = _401 * 0.5f;
        if (!(_311.w < 0.20000000298023224f)) {
          if (!(_311.w < 0.30000001192092896f)) {
            if (!(_311.w < 0.4000000059604645f)) {
              _430 = (_360 * _311.w);
              _431 = (_361 * _311.w);
              _432 = (_362 * _311.w);
            } else {
              _430 = _65;
              _431 = _66;
              _432 = _362;
            }
          } else {
            _430 = _65;
            _431 = _361;
            _432 = _67;
          }
        } else {
          _430 = _360;
          _431 = _66;
          _432 = _67;
        }
        _443 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127;
        _448 = float((bool)((uint)((_443 != 57) && ((uint)(_443 + -53) > (uint)14))));
        _461 = _448 * _412;
        _468 = (_461 * (((((_430 + -1.0f) * 0.02500000037252903f) + 1.0f) * _65) - _65)) + _65;
        _469 = (_461 * (((((_431 + -1.0f) * 0.02500000037252903f) + 1.0f) * _66) - _66)) + _66;
        _470 = (_461 * (((((_432 + -1.0f) * 0.02500000037252903f) + 1.0f) * _67) - _67)) + _67;
        _473 = ((_448 * 0.19999998807907104f) + 0.6000000238418579f) * _419;
        _474 = 0.0010000000474974513f / _359;
        _481 = ((_474 - _468) * _473) + _468;
        _482 = ((_474 - _469) * _473) + _469;
        _483 = ((_474 - _470) * _473) + _470;
        _484 = _448 * _419;
        _495 = ((((_415 * _360) - _481) * _484) + _481);
        _496 = ((((_415 * _361) - _482) * _484) + _482);
        _497 = ((((_415 * _362) - _483) * _484) + _483);
      } else {
        _495 = _65;
        _496 = _66;
        _497 = _67;
      }
    } else {
      _495 = _65;
      _496 = _66;
      _497 = _67;
    }
  } else {
    _495 = _65;
    _496 = _66;
    _497 = _67;
  }
  _498 = WaveReadLaneFirst(_materialIndex);
  _506 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_498 < (uint)170000), _498, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainCharacterRatio);
  _507 = WaveReadLaneFirst(_materialIndex);
  _515 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_507 < (uint)170000), _507, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainGimmickRatio);
  if ((_506 >= 0.0010000000474974513f) || (_515 >= 0.0010000000474974513f)) {
    _522 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    _533 = (pow(_522.x, 0.012683313339948654f));
    _534 = (pow(_522.y, 0.012683313339948654f));
    _535 = (pow(_522.z, 0.012683313339948654f));
    if (_522.w != 0.0f) {
      _575 = ((((exp2(log2(max(0.0f, (_533 + -0.8359375f)) / (18.8515625f - (_533 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _495) * _522.w) + _495);
      _576 = ((((exp2(log2(max(0.0f, (_534 + -0.8359375f)) / (18.8515625f - (_534 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _496) * _522.w) + _496);
      _577 = ((((exp2(log2(max(0.0f, (_535 + -0.8359375f)) / (18.8515625f - (_535 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _497) * _522.w) + _497);
    } else {
      _575 = _495;
      _576 = _496;
      _577 = _497;
    }
  } else {
    _575 = _495;
    _576 = _496;
    _577 = _497;
  }
  _578 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _591 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _578, 0)))).x) & 127))) + 0.5f);
  } else {
    _591 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_575, _576, _577));
    _1013 = output_color.x;
    _1014 = output_color.y;
    _1015 = output_color.z;
  } else {
    _1013 = _575;
    _1014 = _576;
    _1015 = _577;
  }
  if (_etcParams.y > 1.0f) {
    _1026 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1027 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1031 = saturate(1.0f - (dot(float2(_1026, _1027), float2(_1026, _1027)) * saturate(_etcParams.y + -1.0f)));
    _1036 = (_1031 * _1013);
    _1037 = (_1031 * _1014);
    _1038 = (_1031 * _1015);
  } else {
    _1036 = _1013;
    _1037 = _1014;
    _1038 = _1015;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1071 = select((_1036 <= 0.0031308000907301903f), (_1036 * 12.920000076293945f), (((pow(_1036, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1072 = select((_1037 <= 0.0031308000907301903f), (_1037 * 12.920000076293945f), (((pow(_1037, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1073 = select((_1038 <= 0.0031308000907301903f), (_1038 * 12.920000076293945f), (((pow(_1038, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1071 = _1036;
    _1072 = _1037;
    _1073 = _1038;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1078 = float((uint)_578);
    if (!(_1078 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1078 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1087 = _1071;
        _1088 = _1072;
        _1089 = _1073;
      } else {
        _1087 = 0.0f;
        _1088 = 0.0f;
        _1089 = 0.0f;
      }
    } else {
      _1087 = 0.0f;
      _1088 = 0.0f;
      _1089 = 0.0f;
    }
  } else {
    _1087 = _1071;
    _1088 = _1072;
    _1089 = _1073;
  }
  _1099 = exp2(log2(_1087 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1100 = exp2(log2(_1088 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1101 = exp2(log2(_1089 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1099 * 18.6875f) + 1.0f)) * ((_1099 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1100 * 18.6875f) + 1.0f)) * ((_1100 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1101 * 18.6875f) + 1.0f)) * ((_1101 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _591;
  return SV_Target;
}