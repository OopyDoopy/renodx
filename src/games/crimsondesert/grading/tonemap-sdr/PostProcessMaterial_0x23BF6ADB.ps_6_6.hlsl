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
  int _32;
  float _40;
  bool _270;
  float _271;
  float _394;
  float _395;
  float _396;
  float _459;
  float _460;
  float _461;
  float _503;
  float _504;
  float _505;
  float _519;
  float _724;
  float _725;
  float _726;
  float _819;
  float _820;
  float _821;
  float _941;
  float _942;
  float _943;
  float _964;
  float _965;
  float _966;
  float _999;
  float _1000;
  float _1001;
  float _1015;
  float _1016;
  float _1017;
  int _43;
  int _51;
  int _52;
  int _60;
  int _61;
  float _71;
  float _72;
  float _73;
  int _74;
  float _84;
  float _85;
  float _86;
  float _107;
  float _109;
  float _110;
  float _146;
  float _147;
  float _148;
  float _149;
  int _152;
  int _160;
  float4 _167;
  float _172;
  float _173;
  float _174;
  float _187;
  float _188;
  float _189;
  float _196;
  float _197;
  float _198;
  float _205;
  int _220;
  int _228;
  float4 _235;
  float _255;
  float _256;
  float _257;
  float4 _275;
  int _277;
  int _285;
  float _288;
  float _291;
  float _293;
  float _323;
  float _324;
  float _325;
  float _326;
  float _328;
  float _342;
  float _343;
  float _344;
  float _346;
  float _352;
  float _365;
  float _373;
  float _376;
  float _379;
  float _383;
  int _407;
  float _412;
  float _425;
  float _432;
  float _433;
  float _434;
  float _437;
  float _438;
  float _445;
  float _446;
  float _447;
  float _448;
  int _462;
  float _470;
  int _471;
  float _479;
  float4 _486;
  uint _506;
  float _528;
  float _577;
  float _578;
  float _579;
  float _581;
  float _588;
  float _589;
  float _590;
  float _609;
  float _610;
  float _611;
  float _612;
  float _613;
  float _614;
  float _615;
  float _616;
  float _617;
  float _663;
  float _664;
  float _665;
  float _666;
  float _667;
  float _668;
  float _669;
  float _686;
  float _687;
  float _688;
  float _689;
  float _695;
  float _698;
  float _705;
  float _706;
  float _707;
  float _736;
  float _761;
  float _762;
  float _763;
  float _782;
  float _783;
  float _784;
  float _790;
  float _794;
  float _795;
  float _796;
  float _797;
  float _802;
  float _827;
  float _831;
  float _832;
  float _833;
  float _834;
  int _875;
  float _930;
  float _954;
  float _955;
  float _959;
  float _1006;
  float _23[36];
  _28 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _32 = WaveReadLaneFirst(_materialIndex);
  _40 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_32 < (uint)170000), _32, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionRatio);
  if (!(_40 < 0.0010000000474974513f)) {
    _43 = WaveReadLaneFirst(_materialIndex);
    _51 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionNumberR);
    _52 = WaveReadLaneFirst(_materialIndex);
    _60 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_52 < (uint)170000), _52, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainRegionNumberG);
    _61 = WaveReadLaneFirst(_materialIndex);
    _71 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.x);
    _72 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.y);
    _73 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMax.z);
    _74 = WaveReadLaneFirst(_materialIndex);
    _84 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.x);
    _85 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.y);
    _86 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainBoundBoxMin.z);
    if (!((_60 | _51) == 0) | (((_71 != 0.0f) && (_72 != 0.0f)) && (_73 != 0.0f)) | (((_84 != 0.0f) && (_85 != 0.0f)) && (_86 != 0.0f))) {
      _107 = (TEXCOORD.x * 2.0f) + -1.0f;
      _109 = 1.0f - (TEXCOORD.y * 2.0f);
      _110 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
      _146 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _110, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _109, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _107))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
      _147 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _110, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _109, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _107))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _146;
      _148 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _110, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _109, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _107))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _146;
      _149 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _110, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _109, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _107))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _146;
      _152 = WaveReadLaneFirst(_materialIndex);
      _160 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._noiseTex);
      _167 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_160 < (uint)65000), _160, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_147 * 0.019999999552965164f), (_149 * 0.019999999552965164f)));
      _172 = _71 - _84;
      _173 = _72 - _85;
      _174 = _73 - _86;
      bool __branch_chain_101;
      if (sqrt(((_173 * _173) + (_172 * _172)) + (_174 * _174)) < 0.009999999776482582f) {
        __branch_chain_101 = true;
      } else {
        _187 = _84 - _mainPosition.x;
        _188 = _85 - _mainPosition.y;
        _189 = _86 - _mainPosition.z;
        _196 = _71 - _mainPosition.x;
        _197 = _72 - _mainPosition.y;
        _198 = _73 - _mainPosition.z;
        _205 = max(sqrt(((_196 * _196) + (_197 * _197)) + (_198 * _198)), sqrt(((_187 * _187) + (_188 * _188)) + (_189 * _189)));
        if (_205 < 0.009999999776482582f) {
          __branch_chain_101 = true;
        } else {
          __branch_chain_101 = false;
        }
      }
      if (__branch_chain_101) {
        _220 = WaveReadLaneFirst(_materialIndex);
        _228 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_220 < (uint)170000), _220, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._regionTex);
        _235 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_228 < (uint)65000), _228, 0)) + 0u))].Sample(__0__4__0__0__g_staticPointClamp, float2((((_167.x + -0.5f) * 0.0005000000237487257f) + ((_147 + 16384.0f) * 4.882812572759576e-05f)), ((1.0f - ((_149 + 11264.0f) * 4.882812572759576e-05f)) + ((_167.y + -0.5f) * 0.0005000000237487257f))));
        _270 = (((int)(uint(_235.x * 255.0f)) == _51) && ((int)(uint(_235.y * 255.0f)) == _60));
        _271 = (_40 * 300.0f);
      } else {
        _255 = ((_167.x + -0.5f) * 10.0f) + _147;
        _256 = ((_167.y + -0.5f) * 10.0f) + _148;
        _257 = ((_167.z + -0.5f) * 10.0f) + _149;
        _270 = ((_257 > _86) && ((_257 < _73) && ((_256 > _85) && ((_256 < _72) && ((_255 < _71) && (_255 > _84))))));
        _271 = (min((_205 * 2.0f), 300.0f) * _40);
      }
      if (_270) {
        _275 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _277 = WaveReadLaneFirst(_materialIndex);
        _285 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainColor);
        _288 = float((uint)((uint)(((uint)(_285) >> 16) & 255)));
        _291 = float((uint)((uint)(((uint)(_285) >> 8) & 255)));
        _293 = float((uint)((uint)(_285 & 255)));
        _323 = max(0.0010000000474974513f, _exposure0.x);
        _324 = select(((_288 * 0.003921568859368563f) < 0.040449999272823334f), (_288 * 0.0003035269910469651f), exp2(log2((_288 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323;
        _325 = select(((_291 * 0.003921568859368563f) < 0.040449999272823334f), (_291 * 0.0003035269910469651f), exp2(log2((_291 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323;
        _326 = select(((_293 * 0.003921568859368563f) < 0.040449999272823334f), (_293 * 0.0003035269910469651f), exp2(log2((_293 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323;
        _328 = min(max(_271, 0.0f), 30.0f);
        _342 = (_147 - _mainPosition.x) + (_328 * (_167.z + -0.5f));
        _343 = (_148 - _mainPosition.y) + (_328 * (_167.w + -0.5f));
        _344 = (_149 - _mainPosition.z) + (_328 * (_167.x + -0.5f));
        _346 = saturate(_271) * 30.0f;
        _352 = sqrt(((_342 * _342) + (_343 * _343)) + (_344 * _344));
        _365 = ((1.0f - saturate(floor(_352 / _271))) * saturate(((_346 - _271) + _352) / _346)) * saturate((1.0f - _40) * 10.0f);
        _373 = log2(_365) * min(max((100.0f - (saturate(_352 * 0.009999999776482582f) * 100.0f)), 10.0f), 30.0f);
        _376 = exp2(_373 * 0.25f);
        _379 = ((8.0f - _376) * exp2(_373)) + _376;
        _383 = _365 * 0.5f;
        if (!(_275.w < 0.20000000298023224f)) {
          if (!(_275.w < 0.30000001192092896f)) {
            if (!(_275.w < 0.4000000059604645f)) {
              _394 = (_324 * _275.w);
              _395 = (_325 * _275.w);
              _396 = (_326 * _275.w);
            } else {
              _394 = _28.x;
              _395 = _28.y;
              _396 = _326;
            }
          } else {
            _394 = _28.x;
            _395 = _325;
            _396 = _28.z;
          }
        } else {
          _394 = _324;
          _395 = _28.y;
          _396 = _28.z;
        }
        _407 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127;
        _412 = float((bool)((uint)((_407 != 57) && ((uint)(_407 + -53) > (uint)14))));
        _425 = _412 * _376;
        _432 = (_425 * (((((_394 + -1.0f) * 0.02500000037252903f) + 1.0f) * _28.x) - _28.x)) + _28.x;
        _433 = (_425 * (((((_395 + -1.0f) * 0.02500000037252903f) + 1.0f) * _28.y) - _28.y)) + _28.y;
        _434 = (_425 * (((((_396 + -1.0f) * 0.02500000037252903f) + 1.0f) * _28.z) - _28.z)) + _28.z;
        _437 = ((_412 * 0.19999998807907104f) + 0.6000000238418579f) * _383;
        _438 = 0.0010000000474974513f / _323;
        _445 = ((_438 - _432) * _437) + _432;
        _446 = ((_438 - _433) * _437) + _433;
        _447 = ((_438 - _434) * _437) + _434;
        _448 = _412 * _383;
        _459 = ((((_379 * _324) - _445) * _448) + _445);
        _460 = ((((_379 * _325) - _446) * _448) + _446);
        _461 = ((((_379 * _326) - _447) * _448) + _447);
      } else {
        _459 = _28.x;
        _460 = _28.y;
        _461 = _28.z;
      }
    } else {
      _459 = _28.x;
      _460 = _28.y;
      _461 = _28.z;
    }
  } else {
    _459 = _28.x;
    _460 = _28.y;
    _461 = _28.z;
  }
  _462 = WaveReadLaneFirst(_materialIndex);
  _470 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_462 < (uint)170000), _462, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainCharacterRatio);
  _471 = WaveReadLaneFirst(_materialIndex);
  _479 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_471 < (uint)170000), _471, 0)) + 0u))].BindlessParameters_PostProcessKnowledgeGain_CD._knowledgeGainGimmickRatio);
  if ((_470 >= 0.0010000000474974513f) || (_479 >= 0.0010000000474974513f)) {
    _486 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    if (_486.w != 0.0f) {
      _503 = (lerp(_459, _486.x, _486.w));
      _504 = (lerp(_460, _486.y, _486.w));
      _505 = (lerp(_461, _486.z, _486.w));
    } else {
      _503 = _459;
      _504 = _460;
      _505 = _461;
    }
  } else {
    _503 = _459;
    _504 = _460;
    _505 = _461;
  }
  _506 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _519 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _506, 0)))).x) & 127))) + 0.5f);
  } else {
    _519 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_503, _504, _505));
    _941 = output_color.x;
    _942 = output_color.y;
    _943 = output_color.z;
  } else {
    _941 = _503;
    _942 = _504;
    _943 = _505;
  }
  if (_etcParams.y > 1.0f) {
    _954 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _955 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _959 = saturate(1.0f - (dot(float2(_954, _955), float2(_954, _955)) * saturate(_etcParams.y + -1.0f)));
    _964 = (_959 * _941);
    _965 = (_959 * _942);
    _966 = (_959 * _943);
  } else {
    _964 = _941;
    _965 = _942;
    _966 = _943;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _999 = select((_964 <= 0.0031308000907301903f), (_964 * 12.920000076293945f), (((pow(_964, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1000 = select((_965 <= 0.0031308000907301903f), (_965 * 12.920000076293945f), (((pow(_965, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1001 = select((_966 <= 0.0031308000907301903f), (_966 * 12.920000076293945f), (((pow(_966, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _999 = _964;
    _1000 = _965;
    _1001 = _966;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1006 = float((uint)_506);
    if (!(_1006 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1006 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1015 = _999;
        _1016 = _1000;
        _1017 = _1001;
      } else {
        _1015 = 0.0f;
        _1016 = 0.0f;
        _1017 = 0.0f;
      }
    } else {
      _1015 = 0.0f;
      _1016 = 0.0f;
      _1017 = 0.0f;
    }
  } else {
    _1015 = _999;
    _1016 = _1000;
    _1017 = _1001;
  }
  SV_Target.x = _1015;
  SV_Target.y = _1016;
  SV_Target.z = _1017;
  SV_Target.w = _519;
  return SV_Target;
}