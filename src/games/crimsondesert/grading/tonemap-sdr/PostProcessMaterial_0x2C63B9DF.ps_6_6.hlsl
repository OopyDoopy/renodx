#include "../tonemap.hlsli"

struct PostProcessAxiom_CDStruct {
  float _axiomEyeProgress;
  float _axiomEyeRadius;
  uint _axiomEyeTargetColor;
  uint _axiomPlayerColor;
  uint _axiomBackgroundColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t67, space36);

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

struct BindlessParameters_PostProcessAxiom_CD {
  PostProcessAxiom_CDStruct BindlessParameters_PostProcessAxiom_CD;
};

typedef BindlessParameters_PostProcessAxiom_CD BindlessParameters_PostProcessAxiom_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAxiom_CD_t> BindlessParameters_PostProcessAxiom_CD[] : register(b0, space100);

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
  float _31;
  float4 _34;
  float _39;
  float _40;
  float _41;
  float _45;
  float _81;
  float _85;
  int _92;
  int _100;
  float4 _107;
  float _110;
  float _111;
  float _112;
  float _113;
  float _114;
  float _115;
  uint2 _117;
  uint _132;
  int _134;
  float _142;
  float _143;
  float _145;
  float _146;
  float _147;
  float _158;
  float _159;
  float _547;
  float _548;
  float _549;
  float _575;
  float _576;
  float _577;
  float _603;
  float _808;
  float _809;
  float _810;
  float _903;
  float _904;
  float _905;
  float _1025;
  float _1026;
  float _1027;
  float _1045;
  float _1046;
  float _1047;
  float _1080;
  float _1081;
  float _1082;
  float _1096;
  float _1097;
  float _1098;
  float _161;
  float _162;
  float _163;
  float _164;
  float _166;
  float _167;
  float _168;
  float _169;
  int _179;
  float _187;
  float _192;
  float _193;
  float _194;
  float _207;
  float _213;
  int _217;
  int _225;
  float _228;
  float _231;
  float _233;
  float4 _265;
  float _267;
  float _268;
  float _269;
  float _270;
  float _306;
  float _314;
  float _315;
  float _316;
  int _323;
  float _331;
  float _336;
  float _353;
  int _364;
  int _372;
  float4 _379;
  float _392;
  float _395;
  float _397;
  int _406;
  int _414;
  float _417;
  float _420;
  float _422;
  int _458;
  int _466;
  float _469;
  float _472;
  float _474;
  float _499;
  float _500;
  float _501;
  float _519;
  float _521;
  float _524;
  float4 _531;
  float _553;
  float _554;
  float _555;
  float _587;
  float _588;
  float _589;
  uint _590;
  float _612;
  float _661;
  float _662;
  float _663;
  float _665;
  float _672;
  float _673;
  float _674;
  float _693;
  float _694;
  float _695;
  float _696;
  float _697;
  float _698;
  float _699;
  float _700;
  float _701;
  float _747;
  float _748;
  float _749;
  float _750;
  float _751;
  float _752;
  float _753;
  float _770;
  float _771;
  float _772;
  float _773;
  float _779;
  float _782;
  float _789;
  float _790;
  float _791;
  float _820;
  float _845;
  float _846;
  float _847;
  float _866;
  float _867;
  float _868;
  float _874;
  float _878;
  float _879;
  float _880;
  float _881;
  float _886;
  float _911;
  float _915;
  float _916;
  float _917;
  float _918;
  int _959;
  float _1014;
  float _1035;
  float _1036;
  float _1040;
  float _1087;
  float _25[36];
  _31 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _39 = (TEXCOORD.x * 2.0f) + -1.0f;
  _40 = TEXCOORD.y * 2.0f;
  _41 = 1.0f - _40;
  _45 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _81 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _45, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _85 = 6.0f / _31;
  _92 = WaveReadLaneFirst(_materialIndex);
  _100 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
  _107 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_100 < (uint)65000), _100, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_85 * TEXCOORD.x), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.009999999776482582f) + (_85 * TEXCOORD.y))));
  _110 = _107.x + -0.5f;
  _111 = _107.y + -0.5f;
  _112 = _110 * 0.004999999888241291f;
  _113 = _111 * 0.004999999888241291f;
  _114 = _112 + TEXCOORD.x;
  _115 = _113 + TEXCOORD.y;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_117.x, _117.y);
  _132 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_117.x)))))) + 0.5f) * _114), int((float((int)(int(float((int)((int)(_117.y)))))) + 0.5f) * _115), 0));
  _134 = _132.x & 255;
  _142 = (float((uint)((uint)((uint)((uint)(_132.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  _143 = (float((uint)((uint)(((uint)((uint)(_132.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  _145 = 1.0f - abs(_142);
  _146 = abs(_143);
  _147 = _145 - _146;
  if (_147 < 0.0f) {
    _158 = (select((_142 >= 0.0f), 1.0f, -1.0f) * (1.0f - _146));
    _159 = (select((_143 >= 0.0f), 1.0f, -1.0f) * _145);
  } else {
    _158 = _142;
    _159 = _143;
  }
  _161 = rsqrt(dot(float3(_158, _159, _147), float3(_158, _159, _147)));
  _162 = _161 * _158;
  _163 = _161 * _159;
  _164 = _161 * _147;
  _166 = rsqrt(dot(float3(_162, _163, _164), float3(_162, _163, _164)));
  _167 = _166 * _162;
  _168 = _166 * _163;
  _169 = _166 * _164;
  _179 = WaveReadLaneFirst(_materialIndex);
  _187 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeProgress);
  _192 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _45, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _81) - _mainPosition.x;
  _193 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _45, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _81) - _mainPosition.y;
  _194 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _45, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _81) - _mainPosition.z;
  _207 = saturate((1.0f - saturate(sqrt(((_192 * _192) + (_193 * _193)) + (_194 * _194)) / max(0.0010000000474974513f, (_187 * 50.0f)))) * 1.25f);
  _213 = (saturate((_187 * 4.0f) + -3.0f) * (1.0f - _207)) + _207;
  if (_207 > 0.0f) {
    _217 = WaveReadLaneFirst(_materialIndex);
    _225 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_217 < (uint)170000), _217, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomBackgroundColor);
    _228 = float((uint)((uint)(((uint)(_225) >> 16) & 255)));
    _231 = float((uint)((uint)(((uint)(_225) >> 8) & 255)));
    _233 = float((uint)((uint)(_225 & 255)));
    _265 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _112), (TEXCOORD.y - _113)), 0.0f);
    _267 = _265.w * select(((_228 * 0.003921568859368563f) < 0.040449999272823334f), (_228 * 0.0003035269910469651f), exp2(log2((_228 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _268 = _265.w * select(((_231 * 0.003921568859368563f) < 0.040449999272823334f), (_231 * 0.0003035269910469651f), exp2(log2((_231 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _269 = _265.w * select(((_233 * 0.003921568859368563f) < 0.040449999272823334f), (_233 * 0.0003035269910469651f), exp2(log2((_233 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _270 = max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _114), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _115), 0)))).x));
    _306 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _270, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _314 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _270, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _306) - _mainPosition.x;
    _315 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _270, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _306) - _mainPosition.y;
    _316 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _270, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _41, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _39))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _306) - _mainPosition.z;
    _323 = WaveReadLaneFirst(_materialIndex);
    _331 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_323 < (uint)170000), _323, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeRadius);
    _336 = 1.0f - saturate(sqrt(((_314 * _314) + (_315 * _315)) + (_316 * _316)) / max(0.0010000000474974513f, (_331 * _213)));
    if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
      if (_336 > 0.0f) {
        _353 = 2.0f / _31;
        _364 = WaveReadLaneFirst(_materialIndex);
        _372 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
        _379 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_372 < (uint)65000), _372, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_353 * TEXCOORD.x) - (_107.x * 0.25f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)), ((_353 * TEXCOORD.y) - (_107.y * 0.25f))));
        _392 = saturate(1.0f - dot(float3(_167, _168, _169), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _395 = _379.z + -0.5f;
        _397 = saturate(((_392 * _392) * _392) + _395);
        if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
          _406 = WaveReadLaneFirst(_materialIndex);
          _414 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_406 < (uint)170000), _406, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomPlayerColor);
          _417 = float((uint)((uint)(((uint)(_414) >> 16) & 255)));
          _420 = float((uint)((uint)(((uint)(_414) >> 8) & 255)));
          _422 = float((uint)((uint)(_414 & 255)));
          _575 = (select(((_417 * 0.003921568859368563f) < 0.040449999272823334f), (_417 * 0.0003035269910469651f), exp2(log2((_417 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _576 = (select(((_420 * 0.003921568859368563f) < 0.040449999272823334f), (_420 * 0.0003035269910469651f), exp2(log2((_420 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _577 = (select(((_422 * 0.003921568859368563f) < 0.040449999272823334f), (_422 * 0.0003035269910469651f), exp2(log2((_422 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
        } else {
          if (_134 == _renderPassDetectItem) {
            _458 = WaveReadLaneFirst(_materialIndex);
            _466 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_458 < (uint)170000), _458, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeTargetColor);
            _469 = float((uint)((uint)(((uint)(_466) >> 16) & 255)));
            _472 = float((uint)((uint)(((uint)(_466) >> 8) & 255)));
            _474 = float((uint)((uint)(_466 & 255)));
            _499 = select(((_469 * 0.003921568859368563f) < 0.040449999272823334f), (_469 * 0.0003035269910469651f), exp2(log2((_469 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _500 = select(((_472 * 0.003921568859368563f) < 0.040449999272823334f), (_472 * 0.0003035269910469651f), exp2(log2((_472 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _501 = select(((_474 * 0.003921568859368563f) < 0.040449999272823334f), (_474 * 0.0003035269910469651f), exp2(log2((_474 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _519 = saturate(1.0f - dot(float3((((_379.x + -0.5f) * 4.0f) + _167), (((_379.y + -0.5f) * 4.0f) + _168), ((_395 * 4.0f) + _169)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
            _521 = saturate(_519 * _519);
            _524 = saturate((_336 * 2.0f) + -1.0f);
            _531 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_110 * 0.04999999701976776f)), (TEXCOORD.y - (_111 * 0.04999999701976776f))), 0.0f);
            if (!(_531.w < 0.10000000149011612f)) {
              if (_531.w < 0.14000000059604645f) {
                _547 = (_499 + 1.0f);
                _548 = _500;
                _549 = _501;
              } else {
                if (_531.w < 0.17000000178813934f) {
                  _547 = _499;
                  _548 = (_500 + 1.0f);
                  _549 = _501;
                } else {
                  if (_531.w < 0.30000001192092896f) {
                    _547 = _499;
                    _548 = _500;
                    _549 = (_501 + 1.0f);
                  } else {
                    _547 = _499;
                    _548 = _500;
                    _549 = _501;
                  }
                }
              }
            } else {
              _547 = _499;
              _548 = _500;
              _549 = _501;
            }
            _553 = _499 * _397;
            _554 = _500 * _397;
            _555 = _501 * _397;
            _575 = ((((_553 - _267) + (((_547 * _521) - _553) * _524)) * _336) + _267);
            _576 = ((((_554 - _268) + (((_548 * _521) - _554) * _524)) * _336) + _268);
            _577 = ((((_555 - _269) + (((_549 * _521) - _555) * _524)) * _336) + _269);
          } else {
            _575 = _267;
            _576 = _268;
            _577 = _269;
          }
        }
      } else {
        _575 = _267;
        _576 = _268;
        _577 = _269;
      }
    } else {
      if ((_336 > 0.0f) && (_134 == _renderPassDetectItem)) {
        _353 = 2.0f / _31;
        _364 = WaveReadLaneFirst(_materialIndex);
        _372 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._noiseTex);
        _379 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_372 < (uint)65000), _372, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_353 * TEXCOORD.x) - (_107.x * 0.25f)) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f)), ((_353 * TEXCOORD.y) - (_107.y * 0.25f))));
        _392 = saturate(1.0f - dot(float3(_167, _168, _169), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
        _395 = _379.z + -0.5f;
        _397 = saturate(((_392 * _392) * _392) + _395);
        if ((_134 == _renderPassSelfPlayer) || ((!(_134 == _renderPassSelfPlayer)) && (_134 == _renderPassTest))) {
          _406 = WaveReadLaneFirst(_materialIndex);
          _414 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_406 < (uint)170000), _406, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomPlayerColor);
          _417 = float((uint)((uint)(((uint)(_414) >> 16) & 255)));
          _420 = float((uint)((uint)(((uint)(_414) >> 8) & 255)));
          _422 = float((uint)((uint)(_414 & 255)));
          _575 = (select(((_417 * 0.003921568859368563f) < 0.040449999272823334f), (_417 * 0.0003035269910469651f), exp2(log2((_417 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _576 = (select(((_420 * 0.003921568859368563f) < 0.040449999272823334f), (_420 * 0.0003035269910469651f), exp2(log2((_420 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
          _577 = (select(((_422 * 0.003921568859368563f) < 0.040449999272823334f), (_422 * 0.0003035269910469651f), exp2(log2((_422 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _397);
        } else {
          if (_134 == _renderPassDetectItem) {
            _458 = WaveReadLaneFirst(_materialIndex);
            _466 = WaveReadLaneFirst(BindlessParameters_PostProcessAxiom_CD[((int)((uint)(select(((uint)_458 < (uint)170000), _458, 0)) + 0u))].BindlessParameters_PostProcessAxiom_CD._axiomEyeTargetColor);
            _469 = float((uint)((uint)(((uint)(_466) >> 16) & 255)));
            _472 = float((uint)((uint)(((uint)(_466) >> 8) & 255)));
            _474 = float((uint)((uint)(_466 & 255)));
            _499 = select(((_469 * 0.003921568859368563f) < 0.040449999272823334f), (_469 * 0.0003035269910469651f), exp2(log2((_469 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _500 = select(((_472 * 0.003921568859368563f) < 0.040449999272823334f), (_472 * 0.0003035269910469651f), exp2(log2((_472 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _501 = select(((_474 * 0.003921568859368563f) < 0.040449999272823334f), (_474 * 0.0003035269910469651f), exp2(log2((_474 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
            _519 = saturate(1.0f - dot(float3((((_379.x + -0.5f) * 4.0f) + _167), (((_379.y + -0.5f) * 4.0f) + _168), ((_395 * 4.0f) + _169)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
            _521 = saturate(_519 * _519);
            _524 = saturate((_336 * 2.0f) + -1.0f);
            _531 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_110 * 0.04999999701976776f)), (TEXCOORD.y - (_111 * 0.04999999701976776f))), 0.0f);
            if (!(_531.w < 0.10000000149011612f)) {
              if (_531.w < 0.14000000059604645f) {
                _547 = (_499 + 1.0f);
                _548 = _500;
                _549 = _501;
              } else {
                if (_531.w < 0.17000000178813934f) {
                  _547 = _499;
                  _548 = (_500 + 1.0f);
                  _549 = _501;
                } else {
                  if (_531.w < 0.30000001192092896f) {
                    _547 = _499;
                    _548 = _500;
                    _549 = (_501 + 1.0f);
                  } else {
                    _547 = _499;
                    _548 = _500;
                    _549 = _501;
                  }
                }
              }
            } else {
              _547 = _499;
              _548 = _500;
              _549 = _501;
            }
            _553 = _499 * _397;
            _554 = _500 * _397;
            _555 = _501 * _397;
            _575 = ((((_553 - _267) + (((_547 * _521) - _553) * _524)) * _336) + _267);
            _576 = ((((_554 - _268) + (((_548 * _521) - _554) * _524)) * _336) + _268);
            _577 = ((((_555 - _269) + (((_549 * _521) - _555) * _524)) * _336) + _269);
          } else {
            _575 = _267;
            _576 = _268;
            _577 = _269;
          }
        }
      } else {
        _575 = _267;
        _576 = _268;
        _577 = _269;
      }
    }
  } else {
    _575 = _34.x;
    _576 = _34.y;
    _577 = _34.z;
  }
  _587 = (((_575 * _207) - _34.x) * _213) + _34.x;
  _588 = (((_576 * _207) - _34.y) * _213) + _34.y;
  _589 = (((_577 * _207) - _34.z) * _213) + _34.z;
  _590 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _603 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _590, 0)))).x) & 127))) + 0.5f);
  } else {
    _603 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_587, _588, _589));
    _1025 = output_color.x;
    _1026 = output_color.y;
    _1027 = output_color.z;
  } else {
    _1025 = _587;
    _1026 = _588;
    _1027 = _589;
  }
  if (_etcParams.y > 1.0f) {
    _1035 = abs(_39);
    _1036 = abs(_40 + -1.0f);
    _1040 = saturate(1.0f - (dot(float2(_1035, _1036), float2(_1035, _1036)) * saturate(_etcParams.y + -1.0f)));
    _1045 = (_1040 * _1025);
    _1046 = (_1040 * _1026);
    _1047 = (_1040 * _1027);
  } else {
    _1045 = _1025;
    _1046 = _1026;
    _1047 = _1027;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1080 = select((_1045 <= 0.0031308000907301903f), (_1045 * 12.920000076293945f), (((pow(_1045, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1081 = select((_1046 <= 0.0031308000907301903f), (_1046 * 12.920000076293945f), (((pow(_1046, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1082 = select((_1047 <= 0.0031308000907301903f), (_1047 * 12.920000076293945f), (((pow(_1047, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1080 = _1045;
    _1081 = _1046;
    _1082 = _1047;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1087 = float((uint)_590);
    if (!(_1087 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1087 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1096 = _1080;
        _1097 = _1081;
        _1098 = _1082;
      } else {
        _1096 = 0.0f;
        _1097 = 0.0f;
        _1098 = 0.0f;
      }
    } else {
      _1096 = 0.0f;
      _1097 = 0.0f;
      _1098 = 0.0f;
    }
  } else {
    _1096 = _1080;
    _1097 = _1081;
    _1098 = _1082;
  }
  SV_Target.x = _1096;
  SV_Target.y = _1097;
  SV_Target.z = _1098;
  SV_Target.w = _603;
  return SV_Target;
}