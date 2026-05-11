#include "../tonemap.hlsli"

struct PostProcessBerserk_CDStruct {
  float _scanRadius;
  float _fishEyeIntensity;
  float _bloodLineIntensity;
  float _auraIntensity;
  float _centerMaskWidth;
  float _fireIntensity;
  float _sphereMaskRatio;
  float _fogIntensity;
  float _scanRadiusEnd;
  float _ringMaskRadius;
  float _ringMaskIntensity;
  float _radialBlurIntensity;
  uint _noiseTex;
  uint _noiseTex2;
  uint _distortionTex;
  uint _marbleCrackTex;
  float _sphereMaskEndRatio;
  float _sphereMaskEndNoiseIntensity;
  float _sceneColorDistortionIntensity;
  float _characterMaskIntensity;
  uint _enemyGradientTex;
  uint _enemyMaskColor;
  float _flashRatio;
  uint _paperTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessBerserk_CD {
  PostProcessBerserk_CDStruct BindlessParameters_PostProcessBerserk_CD;
};

typedef BindlessParameters_PostProcessBerserk_CD BindlessParameters_PostProcessBerserk_CD_t;
ConstantBuffer<BindlessParameters_PostProcessBerserk_CD_t> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

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
  float _37;
  float _38;
  int _39;
  float _47;
  float _68;
  float _105;
  float _106;
  float _109;
  float _110;
  float _364;
  float _365;
  float _366;
  float _411;
  float _519;
  float _520;
  float _521;
  float _542;
  float _543;
  float _544;
  float _1047;
  float _1048;
  float _1049;
  float _1050;
  float _1051;
  float _1069;
  float _1070;
  float _1071;
  float _1072;
  float _1073;
  float _1074;
  float _1075;
  float _1076;
  float _1077;
  float _1142;
  float _1347;
  float _1348;
  float _1349;
  float _1442;
  float _1443;
  float _1444;
  float _1564;
  float _1565;
  float _1566;
  float _1587;
  float _1588;
  float _1589;
  float _1622;
  float _1623;
  float _1624;
  float _1638;
  float _1639;
  float _1640;
  float _53;
  float _54;
  float _55;
  float _56;
  float _57;
  float _58;
  float _59;
  bool _60;
  float _70;
  float _72;
  float _80;
  float _88;
  float _89;
  float _91;
  float _99;
  float _112;
  float _114;
  float _119;
  float _155;
  float _156;
  float _157;
  float _158;
  float _194;
  float _209;
  float _210;
  float _211;
  float _213;
  float _214;
  float _215;
  float _216;
  float4 _218;
  int _227;
  float _235;
  float _236;
  float _247;
  float _250;
  float _251;
  float _252;
  float _253;
  float _257;
  float _258;
  float _265;
  float _268;
  float _271;
  float _278;
  float _279;
  int _282;
  int _290;
  float4 _297;
  int _302;
  int _310;
  float4 _317;
  float _320;
  float _321;
  float _323;
  float _325;
  float _326;
  float _327;
  float _332;
  int _338;
  float _346;
  float4 _349;
  float4 _359;
  float _383;
  int _389;
  float _397;
  float _401;
  float _417;
  float _428;
  int _430;
  int _438;
  float4 _445;
  float _448;
  float _449;
  int _453;
  int _461;
  int _473;
  int _481;
  int _493;
  float _501;
  float _504;
  float _510;
  float _514;
  int _522;
  float _530;
  float _534;
  float _538;
  uint _550;
  uint _551;
  uint4 _553;
  float4 _556;
  float _574;
  float _575;
  float _576;
  float _578;
  float _579;
  float _580;
  float _581;
  float _584;
  float _585;
  float _588;
  float _589;
  float _593;
  float _595;
  float _596;
  float _597;
  float _598;
  float _600;
  float _603;
  float _604;
  float _605;
  float _606;
  float _615;
  float _619;
  float _623;
  float _625;
  int _628;
  int _636;
  float _642;
  float _643;
  float _644;
  float _651;
  float4 _654;
  float _660;
  float _661;
  float _664;
  int _669;
  int _677;
  float _685;
  float _686;
  float _687;
  float _694;
  float4 _697;
  float _705;
  float _709;
  float _710;
  float _719;
  float _720;
  float _721;
  float _730;
  float _733;
  int _736;
  float _744;
  float _749;
  float _750;
  float _751;
  int _760;
  float _768;
  int _773;
  float _781;
  float _786;
  float _787;
  float _788;
  int _796;
  float _804;
  int _807;
  float _815;
  float _819;
  float _828;
  int _831;
  int _839;
  float _848;
  uint2 _851;
  float _872;
  uint _880;
  uint _881;
  uint4 _883;
  float4 _886;
  float _904;
  float _905;
  float _906;
  float _908;
  float _909;
  float _910;
  float _911;
  float _914;
  float _915;
  float _918;
  float _919;
  float _923;
  float _925;
  float _926;
  float _927;
  float _928;
  float _930;
  float _933;
  float _934;
  float _935;
  float _936;
  float _945;
  float _949;
  float _953;
  float _955;
  float _956;
  float _957;
  float _958;
  float _963;
  float _964;
  float _965;
  float _970;
  int _981;
  int _989;
  float _992;
  float _995;
  float _997;
  float _1044;
  float _1063;
  int _1078;
  float _1086;
  float _1106;
  float _1126;
  float _1127;
  float _1128;
  uint _1129;
  float _1151;
  float _1200;
  float _1201;
  float _1202;
  float _1204;
  float _1211;
  float _1212;
  float _1213;
  float _1232;
  float _1233;
  float _1234;
  float _1235;
  float _1236;
  float _1237;
  float _1238;
  float _1239;
  float _1240;
  float _1286;
  float _1287;
  float _1288;
  float _1289;
  float _1290;
  float _1291;
  float _1292;
  float _1309;
  float _1310;
  float _1311;
  float _1312;
  float _1318;
  float _1321;
  float _1328;
  float _1329;
  float _1330;
  float _1359;
  float _1384;
  float _1385;
  float _1386;
  float _1405;
  float _1406;
  float _1407;
  float _1413;
  float _1417;
  float _1418;
  float _1419;
  float _1420;
  float _1425;
  float _1450;
  float _1454;
  float _1455;
  float _1456;
  float _1457;
  int _1498;
  float _1553;
  float _1577;
  float _1578;
  float _1582;
  float _1629;
  float _26[36];
  _37 = 1.0f / max(9.999999747378752e-05f, _exposure0.x);
  _38 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _39 = WaveReadLaneFirst(_materialIndex);
  _47 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._fishEyeIntensity);
  if (!(abs(_47) < 0.0010000000474974513f)) {
    _53 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    _54 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
    _55 = 0.5f / _38;
    _56 = _53 + -0.5f;
    _57 = _54 - _55;
    _58 = dot(float2(_56, _57), float2(_56, _57));
    _59 = sqrt(_58);
    _60 = (_47 > 0.0f);
    if (_60) {
      _68 = sqrt(dot(float2(0.5f, _55), float2(0.5f, _55)));
    } else {
      if (!(_38 < 1.0f)) {
        _68 = _55;
      } else {
        _68 = 0.5f;
      }
    }
    if (_60) {
      _70 = rsqrt(_58);
      _72 = tan(_59 * _47);
      _80 = tan(_68 * _47);
      _105 = (((((_68 * _56) * _70) * _72) / _80) + 0.5f);
      _106 = (((((_68 * _57) * _70) * _72) / _80) + _55);
    } else {
      if (_47 < 0.0f) {
        _88 = rsqrt(_58);
        _89 = _47 * -10.0f;
        _91 = atan(_59 * _89);
        _99 = atan(_68 * _89);
        _105 = (((((_68 * _56) * _88) * _91) / _99) + 0.5f);
        _106 = (((((_68 * _57) * _88) * _91) / _99) + _55);
      } else {
        _105 = _53;
        _106 = _54;
      }
    }
    _109 = _105;
    _110 = (_106 * _38);
  } else {
    _109 = TEXCOORD.x;
    _110 = TEXCOORD.y;
  }
  _112 = (_109 * 2.0f) + -1.0f;
  _114 = 1.0f - (_110 * 2.0f);
  _119 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110))).x));
  _155 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _156 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _155;
  _157 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _155;
  _158 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _155;
  _194 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].w), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].w), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].w) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].w);
  _209 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].x), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].x), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].x) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].x)) / _194);
  _210 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].y), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].y), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].y) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].y)) / _194);
  _211 = -0.0f - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[32u].z), _119, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[31u].z), _114, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[30u].z) * _112))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[33u].z)) / _194);
  _213 = rsqrt(dot(float3(_209, _210, _211), float3(_209, _210, _211)));
  _214 = _213 * _209;
  _215 = _213 * _210;
  _216 = _213 * _211;
  _218 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  _227 = WaveReadLaneFirst(_materialIndex);
  _235 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_227 < (uint)170000), _227, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._centerMaskWidth);
  _236 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * _235;
  _247 = _236 * 25.0f;
  _250 = TEXCOORD.x + -0.5f;
  _251 = TEXCOORD.y + -0.5f;
  _252 = abs(_250);
  _253 = abs(_251);
  _257 = min(_252, _253) / max(max(_252, _253), 9.99999993922529e-09f);
  _258 = _257 * _257;
  _265 = ((_258 * _257) * (((0.15931421518325806f - (_258 * 0.046496473252773285f)) * _258) + -0.32762277126312256f)) + _257;
  _268 = select((_253 > _252), (1.5707963705062866f - _265), _265);
  _271 = select((_250 < 0.0f), (3.1415927410125732f - _268), _268);
  _278 = sqrt((_251 * _251) + (_250 * _250));
  _279 = select((_251 < 0.0f), (-0.0f - _271), _271) * 0.9549295902252197f;
  _282 = WaveReadLaneFirst(_materialIndex);
  _290 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _297 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_216, (_215 + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f))));
  _302 = WaveReadLaneFirst(_materialIndex);
  _310 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_302 < (uint)170000), _302, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _317 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_310 < (uint)65000), _310, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_215 + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f)), _214));
  _320 = _317.x + _297.x;
  _321 = _317.y + _297.y;
  _323 = abs(dot(float3(_214, _215, _216), float3(0.0f, 1.0f, 0.0f)));
  _325 = abs(dot(float3(_214, _215, _216), float3(0.0f, 0.0f, 1.0f)));
  _326 = _320 * _323;
  _327 = _321 * _323;
  _332 = (_326 * _325) + (_320 - _326);
  _338 = WaveReadLaneFirst(_materialIndex);
  _346 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sceneColorDistortionIntensity);
  _349 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  if (_346 > 9.999999747378752e-05f) {
    _359 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_346 * ((_332 * 2.0f) + -0.9960784316062927f)) + _109), ((_346 * ((((_327 * _325) + (_321 - _327)) * 2.0f) + -0.9960784316062927f)) + _110)));
    _364 = _359.x;
    _365 = _359.y;
    _366 = _359.z;
  } else {
    _364 = _349.x;
    _365 = _349.y;
    _366 = _349.z;
  }
  _383 = frac(frac(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_109)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_110))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  _389 = WaveReadLaneFirst(_materialIndex);
  _397 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_389 < (uint)170000), _389, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._fireIntensity);
  if (_397 > 9.999999747378752e-05f) {
    _401 = _397 * ((((_332 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    _411 = (((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_401 * (_383 + -0.5f)) + _109), ((_401 * (0.5f - _383)) + _110))))).x);
  } else {
    _411 = _218.x;
  }
  _417 = ((dot(float3(_364, _365, _366), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _218.y) * saturate(_247 * _247)) + _218.y;
  _428 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.125f;
  _430 = WaveReadLaneFirst(_materialIndex);
  _438 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._distortionTex);
  _445 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_438 < (uint)65000), _438, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_279, (_278 + _428)));
  _448 = _445.x * 0.20000000298023224f;
  _449 = _445.y * 0.20000000298023224f;
  _453 = WaveReadLaneFirst(_materialIndex);
  _461 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_453 < (uint)170000), _453, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._marbleCrackTex);
  _473 = WaveReadLaneFirst(_materialIndex);
  _481 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_473 < (uint)170000), _473, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._marbleCrackTex);
  _493 = WaveReadLaneFirst(_materialIndex);
  _501 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_493 < (uint)170000), _493, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._auraIntensity);
  _504 = saturate((_218.w + -0.10000000149011612f) * 1.1111111640930176f);
  _510 = ((_504 * _504) * (1.0f - saturate(exp2(log2(_236 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_504 * 2.0f));
  if (_501 > 9.999999747378752e-05f) {
    _514 = _510 * (_501 * _37);
    _519 = (_514 * 0.3185468018054962f);
    _520 = (_514 * 0.033104754984378815f);
    _521 = (_514 * 0.010022826492786407f);
  } else {
    _519 = 0.0f;
    _520 = 0.0f;
    _521 = 0.0f;
  }
  _522 = WaveReadLaneFirst(_materialIndex);
  _530 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_522 < (uint)170000), _522, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._bloodLineIntensity);
  _534 = saturate(saturate(((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_481 < (uint)65000), _481, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_449 + _279), ((_278 - _428) + _449))))).y) * 1.2000000476837158f) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_461 < (uint)65000), _461, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_448 + _279), ((_278 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.25f)) + _448))))).x)) - (_236 * 14.0f)) * _510;
  if (_530 > 9.999999747378752e-05f) {
    _538 = _534 * (_530 * _37);
    _542 = (_538 * 2.5371556282043457f);
    _543 = (_538 * 0.4479884207248688f);
    _544 = 0.0f;
  } else {
    _542 = _534;
    _543 = _534;
    _544 = _534;
  }
  _550 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _109);
  _551 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _110);
  _553 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_550, _551, 0));
  _556 = __3__36__0__0__g_gbufferNormal.Load(int3(_550, _551, 0));
  _574 = (saturate(_556.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _575 = (saturate(_556.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _576 = (saturate(_556.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _578 = rsqrt(dot(float3(_574, _575, _576), float3(_574, _575, _576)));
  _579 = _578 * _574;
  _580 = _578 * _575;
  _581 = _576 * _578;
  _584 = (float((uint)((uint)(((uint)((uint)(_553.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _585 = (float((uint)((uint)(_553.w & 255))) * 0.007843137718737125f) + -1.0f;
  _588 = (_584 + _585) * 0.5f;
  _589 = (_584 - _585) * 0.5f;
  _593 = (1.0f - abs(_588)) - abs(_589);
  _595 = rsqrt(dot(float3(_588, _589, _593), float3(_588, _589, _593)));
  _596 = _595 * _588;
  _597 = _595 * _589;
  _598 = _595 * _593;
  _600 = select((_581 >= 0.0f), 1.0f, -1.0f);
  _603 = -0.0f - (1.0f / (_600 + _581));
  _604 = _580 * _603;
  _605 = _604 * _579;
  _606 = _600 * _579;
  _615 = mad(_598, _579, mad(_597, _605, ((((_606 * _579) * _603) + 1.0f) * _596)));
  _619 = mad(_598, _580, mad(_597, (_600 + (_604 * _580)), ((_596 * _600) * _605)));
  _623 = mad(_598, _581, mad(_597, (-0.0f - _580), (-0.0f - (_606 * _596))));
  _625 = rsqrt(dot(float3(_615, _619, _623), float3(_615, _619, _623)));
  _628 = WaveReadLaneFirst(_materialIndex);
  _636 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_628 < (uint)170000), _628, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _642 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * -0.009999999776482582f;
  _643 = (_156 * 0.019999999552965164f) + _642;
  _644 = (_158 * 0.019999999552965164f) + _642;
  _651 = (_157 * 0.019999999552965164f) + _642;
  _654 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_644, _651));
  _660 = abs(_625 * _619);
  _661 = abs(_625 * _623);
  _664 = (_660 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_643, _644)))).x) - _654.x)) + _654.x;
  _669 = WaveReadLaneFirst(_materialIndex);
  _677 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_669 < (uint)170000), _669, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex2);
  _685 = (saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_651, _643)))).x) - _664) * _661) + _664) * 0.30000001192092896f) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f);
  _686 = _685 + (_156 * 0.10000000149011612f);
  _687 = _685 + (_158 * 0.10000000149011612f);
  _694 = _685 + (_157 * 0.10000000149011612f);
  _697 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_687, _694));
  _705 = (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_686, _687)))).w) - _697.w) * _660) + _697.w;
  _709 = saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_694, _686)))).w) - _705) * _661) + _705);
  _710 = _709 * 3.0f;
  _719 = _156 - _mainPosition.x;
  _720 = _157 - _mainPosition.y;
  _721 = _158 - _mainPosition.z;
  _730 = 1.0f - saturate(sqrt(((_719 * _719) + (_720 * _720)) + (_721 * _721)) * 0.0020000000949949026f);
  _733 = (_730 * _730) * (exp2(log2(saturate(_710)) * 5.400000095367432f) * _37);
  _736 = WaveReadLaneFirst(_materialIndex);
  _744 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_736 < (uint)170000), _736, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._scanRadius);
  _749 = _mainPosition.x - _156;
  _750 = _mainPosition.y - _157;
  _751 = _mainPosition.z - _158;
  _760 = WaveReadLaneFirst(_materialIndex);
  _768 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_760 < (uint)170000), _760, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskRatio);
  _773 = WaveReadLaneFirst(_materialIndex);
  _781 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_773 < (uint)170000), _773, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._scanRadiusEnd);
  _786 = _mainPosition.x - _156;
  _787 = _mainPosition.y - _157;
  _788 = _mainPosition.z - _158;
  _796 = WaveReadLaneFirst(_materialIndex);
  _804 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_796 < (uint)170000), _796, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskEndNoiseIntensity);
  _807 = WaveReadLaneFirst(_materialIndex);
  _815 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_807 < (uint)170000), _807, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskEndRatio);
  _819 = saturate((_815 * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, _744)) * sqrt(dot(float3(_749, _750, _751), float3(_749, _750, _751))))) * 2.500000238418579f) - _710) + -1.0f) * _768) + 1.0f)) * saturate((_804 * _709) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _781)) * sqrt(dot(float3(_786, _787, _788), float3(_786, _787, _788))))) * 1.4285714626312256f)));
  if ((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _109)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _110)), 0)))).x) & 127) + -53) < (uint)15) {
    _828 = _218.w * 0.5f;
    _831 = WaveReadLaneFirst(_materialIndex);
    _839 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_831 < (uint)170000), _831, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
    _848 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_839 < (uint)65000), _839, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_828 + ((TEXCOORD.x * 2.0f) * _38)), (_828 + (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + TEXCOORD.y) * 2.0f)))))).x) + -0.20000000298023224f;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_851.x, _851.y);
    _872 = _848 * 0.01874999888241291f;
    _880 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * (_872 + _109));
    _881 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * (_872 + _110));
    _883 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_880, _881, 0));
    _886 = __3__36__0__0__g_gbufferNormal.Load(int3(_880, _881, 0));
    _904 = (saturate(_886.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _905 = (saturate(_886.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _906 = (saturate(_886.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _908 = rsqrt(dot(float3(_904, _905, _906), float3(_904, _905, _906)));
    _909 = _908 * _904;
    _910 = _908 * _905;
    _911 = _906 * _908;
    _914 = (float((uint)((uint)(((uint)((uint)(_883.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _915 = (float((uint)((uint)(_883.w & 255))) * 0.007843137718737125f) + -1.0f;
    _918 = (_914 + _915) * 0.5f;
    _919 = (_914 - _915) * 0.5f;
    _923 = (1.0f - abs(_918)) - abs(_919);
    _925 = rsqrt(dot(float3(_918, _919, _923), float3(_918, _919, _923)));
    _926 = _925 * _918;
    _927 = _925 * _919;
    _928 = _925 * _923;
    _930 = select((_911 >= 0.0f), 1.0f, -1.0f);
    _933 = -0.0f - (1.0f / (_930 + _911));
    _934 = _910 * _933;
    _935 = _934 * _909;
    _936 = _930 * _909;
    _945 = mad(_928, _909, mad(_927, _935, ((((_936 * _909) * _933) + 1.0f) * _926)));
    _949 = mad(_928, _910, mad(_927, (_930 + (_934 * _910)), ((_926 * _930) * _935)));
    _953 = mad(_928, _911, mad(_927, (-0.0f - _910), (-0.0f - (_936 * _926))));
    _955 = rsqrt(dot(float3(_945, _949, _953), float3(_945, _949, _953)));
    _956 = _955 * _945;
    _957 = _955 * _949;
    _958 = _955 * _953;
    _963 = _mainPosition.x - _156;
    _964 = _mainPosition.y - _157;
    _965 = _mainPosition.z - _158;
    _970 = saturate(5.000000476837158f - (sqrt(dot(float3(_963, _964, _965), float3(_963, _964, _965))) * 0.1250000149011612f));
    if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_851.x)))))) + 0.5f) * _109), int((float((int)(int(float((int)((int)(_851.y)))))) + 0.5f) * _110), 0)))).x) & 255) == _renderPassEnemy) {
      _981 = WaveReadLaneFirst(_materialIndex);
      _989 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_981 < (uint)170000), _981, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._enemyMaskColor);
      _992 = float((uint)((uint)(((uint)(_989) >> 16) & 255)));
      _995 = float((uint)((uint)(((uint)(_989) >> 8) & 255)));
      _997 = float((uint)((uint)(_989 & 255)));
      _1044 = exp2(log2(saturate(_332 * 0.5f)) * 2.4000000953674316f) * (((((_848 * 3.25f) + 1.2999999523162842f) * _37) * _970) * exp2(log2(abs(dot(float3(_956, _957, _958), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 5.0f));
      _1047 = (((select(((_992 * 0.003921568859368563f) < 0.040449999272823334f), (_992 * 0.0003035269910469651f), exp2(log2((_992 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1048 = (((select(((_995 * 0.003921568859368563f) < 0.040449999272823334f), (_995 * 0.0003035269910469651f), exp2(log2((_995 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1049 = (((select(((_997 * 0.003921568859368563f) < 0.040449999272823334f), (_997 * 0.0003035269910469651f), exp2(log2((_997 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1050 = _1044;
      _1051 = (_1044 * 0.15000000596046448f);
    } else {
      _1047 = 1.0f;
      _1048 = 1.0f;
      _1049 = 1.0f;
      _1050 = 0.0f;
      _1051 = 0.0f;
    }
    _1063 = ((_848 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_956, _957, _958), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 5.0f)) * _37;
    _1069 = 0.0f;
    _1070 = 0.0f;
    _1071 = 0.0f;
    _1072 = 0.0f;
    _1073 = _1047;
    _1074 = _1048;
    _1075 = _1049;
    _1076 = (_1050 + (_1063 * 0.3185468018054962f));
    _1077 = (_1051 + (_1063 * 0.033104754984378815f));
  } else {
    _1069 = (_411 * 0.2632734179496765f);
    _1070 = (_411 * 0.05087609216570854f);
    _1071 = (_733 * 0.07323896884918213f);
    _1072 = (_733 * 0.003935939632356167f);
    _1073 = 1.0f;
    _1074 = 1.0f;
    _1075 = 1.0f;
    _1076 = 0.0f;
    _1077 = 0.0f;
  }
  _1078 = WaveReadLaneFirst(_materialIndex);
  _1086 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1078 < (uint)170000), _1078, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._fogIntensity);
  _1106 = saturate(saturate(exp2(log2(_236 * 20.0f) * 0.5f)));
  _1126 = ((((((_519 - _364) + _542) + _1071) + _1076) + ((((_1086 * (((lerp(_364, _417, 0.5f)) * 0.800000011920929f) - _1069)) + _1069) * saturate(_1073 + 0.20000000298023224f)) * _1106)) * _819) + _364;
  _1127 = ((((((_520 - _365) + _543) + _1072) + _1077) + ((((_1086 * (((lerp(_365, _417, 0.5f)) * 0.800000011920929f) - _1070)) + _1070) * saturate(_1074 + 0.20000000298023224f)) * _1106)) * _819) + _365;
  _1128 = ((((_521 - _366) + _544) + (((((lerp(_366, _417, 0.5f)) * 0.800000011920929f) * _1086) * saturate(_1075 + 0.20000000298023224f)) * _1106)) * _819) + _366;
  _1129 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1142 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1129, 0)))).x) & 127))) + 0.5f);
  } else {
    _1142 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1126, _1127, _1128));
    _1564 = output_color.x;
    _1565 = output_color.y;
    _1566 = output_color.z;
  } else {
    _1564 = _1126;
    _1565 = _1127;
    _1566 = _1128;
  }
  if (_etcParams.y > 1.0f) {
    _1577 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1578 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1582 = saturate(1.0f - (dot(float2(_1577, _1578), float2(_1577, _1578)) * saturate(_etcParams.y + -1.0f)));
    _1587 = (_1582 * _1564);
    _1588 = (_1582 * _1565);
    _1589 = (_1582 * _1566);
  } else {
    _1587 = _1564;
    _1588 = _1565;
    _1589 = _1566;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1622 = select((_1587 <= 0.0031308000907301903f), (_1587 * 12.920000076293945f), (((pow(_1587, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1623 = select((_1588 <= 0.0031308000907301903f), (_1588 * 12.920000076293945f), (((pow(_1588, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1624 = select((_1589 <= 0.0031308000907301903f), (_1589 * 12.920000076293945f), (((pow(_1589, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1622 = _1587;
    _1623 = _1588;
    _1624 = _1589;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1629 = float((uint)_1129);
    if (!(_1629 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1629 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1638 = _1622;
        _1639 = _1623;
        _1640 = _1624;
      } else {
        _1638 = 0.0f;
        _1639 = 0.0f;
        _1640 = 0.0f;
      }
    } else {
      _1638 = 0.0f;
      _1639 = 0.0f;
      _1640 = 0.0f;
    }
  } else {
    _1638 = _1622;
    _1639 = _1623;
    _1640 = _1624;
  }
  SV_Target.x = _1638;
  SV_Target.y = _1639;
  SV_Target.z = _1640;
  SV_Target.w = _1142;
  return SV_Target;
}