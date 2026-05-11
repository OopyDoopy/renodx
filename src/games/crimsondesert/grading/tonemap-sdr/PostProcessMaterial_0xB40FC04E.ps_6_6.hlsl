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
  float _454;
  float _455;
  float _456;
  float _516;
  float _624;
  float _625;
  float _626;
  float _647;
  float _648;
  float _649;
  float _1152;
  float _1153;
  float _1154;
  float _1155;
  float _1156;
  float _1174;
  float _1175;
  float _1176;
  float _1177;
  float _1178;
  float _1179;
  float _1180;
  float _1181;
  float _1182;
  float _1247;
  float _1452;
  float _1453;
  float _1454;
  float _1547;
  float _1548;
  float _1549;
  float _1669;
  float _1670;
  float _1671;
  float _1692;
  float _1693;
  float _1694;
  float _1727;
  float _1728;
  float _1729;
  float _1743;
  float _1744;
  float _1745;
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
  float _226;
  float _227;
  float _245;
  int _251;
  float _259;
  float _260;
  float _271;
  float _274;
  float _275;
  float _276;
  float _277;
  float _281;
  float _282;
  float _289;
  float _292;
  float _295;
  float _302;
  float _303;
  int _306;
  int _314;
  float4 _321;
  int _326;
  int _334;
  float4 _341;
  float _344;
  float _345;
  float _347;
  float _349;
  float _350;
  float _351;
  float _356;
  int _362;
  float _370;
  float4 _373;
  float _383;
  float _384;
  float _385;
  float4 _416;
  float _426;
  float _427;
  float _428;
  float _457;
  float _458;
  float _459;
  float _476;
  int _482;
  float _490;
  float _494;
  float _505;
  float _522;
  float _533;
  int _535;
  int _543;
  float4 _550;
  float _553;
  float _554;
  int _558;
  int _566;
  int _578;
  int _586;
  int _598;
  float _606;
  float _609;
  float _615;
  float _619;
  int _627;
  float _635;
  float _639;
  float _643;
  uint _655;
  uint _656;
  uint4 _658;
  float4 _661;
  float _679;
  float _680;
  float _681;
  float _683;
  float _684;
  float _685;
  float _686;
  float _689;
  float _690;
  float _693;
  float _694;
  float _698;
  float _700;
  float _701;
  float _702;
  float _703;
  float _705;
  float _708;
  float _709;
  float _710;
  float _711;
  float _720;
  float _724;
  float _728;
  float _730;
  int _733;
  int _741;
  float _747;
  float _748;
  float _749;
  float _756;
  float4 _759;
  float _765;
  float _766;
  float _769;
  int _774;
  int _782;
  float _790;
  float _791;
  float _792;
  float _799;
  float4 _802;
  float _810;
  float _814;
  float _815;
  float _824;
  float _825;
  float _826;
  float _835;
  float _838;
  int _841;
  float _849;
  float _854;
  float _855;
  float _856;
  int _865;
  float _873;
  int _878;
  float _886;
  float _891;
  float _892;
  float _893;
  int _901;
  float _909;
  int _912;
  float _920;
  float _924;
  float _933;
  int _936;
  int _944;
  float _953;
  uint2 _956;
  float _977;
  uint _985;
  uint _986;
  uint4 _988;
  float4 _991;
  float _1009;
  float _1010;
  float _1011;
  float _1013;
  float _1014;
  float _1015;
  float _1016;
  float _1019;
  float _1020;
  float _1023;
  float _1024;
  float _1028;
  float _1030;
  float _1031;
  float _1032;
  float _1033;
  float _1035;
  float _1038;
  float _1039;
  float _1040;
  float _1041;
  float _1050;
  float _1054;
  float _1058;
  float _1060;
  float _1061;
  float _1062;
  float _1063;
  float _1068;
  float _1069;
  float _1070;
  float _1075;
  int _1086;
  int _1094;
  float _1097;
  float _1100;
  float _1102;
  float _1149;
  float _1168;
  int _1183;
  float _1191;
  float _1211;
  float _1231;
  float _1232;
  float _1233;
  uint _1234;
  float _1256;
  float _1305;
  float _1306;
  float _1307;
  float _1309;
  float _1316;
  float _1317;
  float _1318;
  float _1337;
  float _1338;
  float _1339;
  float _1340;
  float _1341;
  float _1342;
  float _1343;
  float _1344;
  float _1345;
  float _1391;
  float _1392;
  float _1393;
  float _1394;
  float _1395;
  float _1396;
  float _1397;
  float _1414;
  float _1415;
  float _1416;
  float _1417;
  float _1423;
  float _1426;
  float _1433;
  float _1434;
  float _1435;
  float _1464;
  float _1489;
  float _1490;
  float _1491;
  float _1510;
  float _1511;
  float _1512;
  float _1518;
  float _1522;
  float _1523;
  float _1524;
  float _1525;
  float _1530;
  float _1555;
  float _1559;
  float _1560;
  float _1561;
  float _1562;
  int _1603;
  float _1658;
  float _1682;
  float _1683;
  float _1687;
  float _1734;
  float _1755;
  float _1756;
  float _1757;
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
  _226 = (pow(_218.x, 0.012683313339948654f));
  _227 = (pow(_218.y, 0.012683313339948654f));
  _245 = exp2(log2(max(0.0f, (_227 + -0.8359375f)) / (18.8515625f - (_227 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _251 = WaveReadLaneFirst(_materialIndex);
  _259 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_251 < (uint)170000), _251, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._centerMaskWidth);
  _260 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * _259;
  _271 = _260 * 25.0f;
  _274 = TEXCOORD.x + -0.5f;
  _275 = TEXCOORD.y + -0.5f;
  _276 = abs(_274);
  _277 = abs(_275);
  _281 = min(_276, _277) / max(max(_276, _277), 9.99999993922529e-09f);
  _282 = _281 * _281;
  _289 = ((_282 * _281) * (((0.15931421518325806f - (_282 * 0.046496473252773285f)) * _282) + -0.32762277126312256f)) + _281;
  _292 = select((_277 > _276), (1.5707963705062866f - _289), _289);
  _295 = select((_274 < 0.0f), (3.1415927410125732f - _292), _292);
  _302 = sqrt((_275 * _275) + (_274 * _274));
  _303 = select((_275 < 0.0f), (-0.0f - _295), _295) * 0.9549295902252197f;
  _306 = WaveReadLaneFirst(_materialIndex);
  _314 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_306 < (uint)170000), _306, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _321 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_314 < (uint)65000), _314, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_216, (_215 + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.05000000074505806f))));
  _326 = WaveReadLaneFirst(_materialIndex);
  _334 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_326 < (uint)170000), _326, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _341 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_334 < (uint)65000), _334, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_215 + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.15000000596046448f)), _214));
  _344 = _341.x + _321.x;
  _345 = _341.y + _321.y;
  _347 = abs(dot(float3(_214, _215, _216), float3(0.0f, 1.0f, 0.0f)));
  _349 = abs(dot(float3(_214, _215, _216), float3(0.0f, 0.0f, 1.0f)));
  _350 = _344 * _347;
  _351 = _345 * _347;
  _356 = (_350 * _349) + (_344 - _350);
  _362 = WaveReadLaneFirst(_materialIndex);
  _370 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_362 < (uint)170000), _362, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sceneColorDistortionIntensity);
  _373 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  _383 = (pow(_373.x, 0.012683313339948654f));
  _384 = (pow(_373.y, 0.012683313339948654f));
  _385 = (pow(_373.z, 0.012683313339948654f));
  if (_370 > 9.999999747378752e-05f) {
    _416 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_370 * ((_356 * 2.0f) + -0.9960784316062927f)) + _109), ((_370 * ((((_351 * _349) + (_345 - _351)) * 2.0f) + -0.9960784316062927f)) + _110)));
    _426 = (pow(_416.x, 0.012683313339948654f));
    _427 = (pow(_416.y, 0.012683313339948654f));
    _428 = (pow(_416.z, 0.012683313339948654f));
    _454 = exp2(log2(max(0.0f, (_426 + -0.8359375f)) / (18.8515625f - (_426 * 18.6875f))) * 6.277394771575928f);
    _455 = exp2(log2(max(0.0f, (_427 + -0.8359375f)) / (18.8515625f - (_427 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_428 + -0.8359375f)) / (18.8515625f - (_428 * 18.6875f))) * 6.277394771575928f);
  } else {
    _454 = exp2(log2(max(0.0f, (_383 + -0.8359375f)) / (18.8515625f - (_383 * 18.6875f))) * 6.277394771575928f);
    _455 = exp2(log2(max(0.0f, (_384 + -0.8359375f)) / (18.8515625f - (_384 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_385 + -0.8359375f)) / (18.8515625f - (_385 * 18.6875f))) * 6.277394771575928f);
  }
  _457 = _456 * 10000.0f;
  _458 = _455 * 10000.0f;
  _459 = _454 * 10000.0f;
  _476 = frac(frac(dot(float2(float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(_109)))), float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(_110))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  _482 = WaveReadLaneFirst(_materialIndex);
  _490 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_482 < (uint)170000), _482, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._fireIntensity);
  if (_490 > 9.999999747378752e-05f) {
    _494 = _490 * ((((_356 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    _505 = exp2(log2(((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_494 * (_476 + -0.5f)) + _109), ((_494 * (0.5f - _476)) + _110))))).x) * 0.012683313339948654f);
    _516 = (exp2(log2(max(0.0f, (_505 + -0.8359375f)) / (18.8515625f - (_505 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _516 = (exp2(log2(max(0.0f, (_226 + -0.8359375f)) / (18.8515625f - (_226 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  }
  _522 = ((dot(float3(_459, _458, _457), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _245) * saturate(_271 * _271)) + _245;
  _533 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.125f;
  _535 = WaveReadLaneFirst(_materialIndex);
  _543 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_535 < (uint)170000), _535, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._distortionTex);
  _550 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_543 < (uint)65000), _543, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_303, (_302 + _533)));
  _553 = _550.x * 0.20000000298023224f;
  _554 = _550.y * 0.20000000298023224f;
  _558 = WaveReadLaneFirst(_materialIndex);
  _566 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_558 < (uint)170000), _558, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._marbleCrackTex);
  _578 = WaveReadLaneFirst(_materialIndex);
  _586 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_578 < (uint)170000), _578, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._marbleCrackTex);
  _598 = WaveReadLaneFirst(_materialIndex);
  _606 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_598 < (uint)170000), _598, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._auraIntensity);
  _609 = saturate((_218.w + -0.10000000149011612f) * 1.1111111640930176f);
  _615 = ((_609 * _609) * (1.0f - saturate(exp2(log2(_260 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_609 * 2.0f));
  if (_606 > 9.999999747378752e-05f) {
    _619 = _615 * (_606 * _37);
    _624 = (_619 * 0.3185468018054962f);
    _625 = (_619 * 0.033104754984378815f);
    _626 = (_619 * 0.010022826492786407f);
  } else {
    _624 = 0.0f;
    _625 = 0.0f;
    _626 = 0.0f;
  }
  _627 = WaveReadLaneFirst(_materialIndex);
  _635 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._bloodLineIntensity);
  _639 = saturate(saturate(((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_586 < (uint)65000), _586, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_554 + _303), ((_302 - _533) + _554))))).y) * 1.2000000476837158f) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_566 < (uint)65000), _566, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_553 + _303), ((_302 - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.25f)) + _553))))).x)) - (_260 * 14.0f)) * _615;
  if (_635 > 9.999999747378752e-05f) {
    _643 = _639 * (_635 * _37);
    _647 = (_643 * 2.5371556282043457f);
    _648 = (_643 * 0.4479884207248688f);
    _649 = 0.0f;
  } else {
    _647 = _639;
    _648 = _639;
    _649 = _639;
  }
  _655 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _109);
  _656 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _110);
  _658 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_655, _656, 0));
  _661 = __3__36__0__0__g_gbufferNormal.Load(int3(_655, _656, 0));
  _679 = (saturate(_661.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  _680 = (saturate(_661.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  _681 = (saturate(_661.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  _683 = rsqrt(dot(float3(_679, _680, _681), float3(_679, _680, _681)));
  _684 = _683 * _679;
  _685 = _683 * _680;
  _686 = _681 * _683;
  _689 = (float((uint)((uint)(((uint)((uint)(_658.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  _690 = (float((uint)((uint)(_658.w & 255))) * 0.007843137718737125f) + -1.0f;
  _693 = (_689 + _690) * 0.5f;
  _694 = (_689 - _690) * 0.5f;
  _698 = (1.0f - abs(_693)) - abs(_694);
  _700 = rsqrt(dot(float3(_693, _694, _698), float3(_693, _694, _698)));
  _701 = _700 * _693;
  _702 = _700 * _694;
  _703 = _700 * _698;
  _705 = select((_686 >= 0.0f), 1.0f, -1.0f);
  _708 = -0.0f - (1.0f / (_705 + _686));
  _709 = _685 * _708;
  _710 = _709 * _684;
  _711 = _705 * _684;
  _720 = mad(_703, _684, mad(_702, _710, ((((_711 * _684) * _708) + 1.0f) * _701)));
  _724 = mad(_703, _685, mad(_702, (_705 + (_709 * _685)), ((_701 * _705) * _710)));
  _728 = mad(_703, _686, mad(_702, (-0.0f - _685), (-0.0f - (_711 * _701))));
  _730 = rsqrt(dot(float3(_720, _724, _728), float3(_720, _724, _728)));
  _733 = WaveReadLaneFirst(_materialIndex);
  _741 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_733 < (uint)170000), _733, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
  _747 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * -0.009999999776482582f;
  _748 = (_156 * 0.019999999552965164f) + _747;
  _749 = (_158 * 0.019999999552965164f) + _747;
  _756 = (_157 * 0.019999999552965164f) + _747;
  _759 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_749, _756));
  _765 = abs(_730 * _724);
  _766 = abs(_730 * _728);
  _769 = (_765 * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_748, _749)))).x) - _759.x)) + _759.x;
  _774 = WaveReadLaneFirst(_materialIndex);
  _782 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_774 < (uint)170000), _774, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex2);
  _790 = (saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_756, _748)))).x) - _769) * _766) + _769) * 0.30000001192092896f) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f);
  _791 = _790 + (_156 * 0.10000000149011612f);
  _792 = _790 + (_158 * 0.10000000149011612f);
  _799 = _790 + (_157 * 0.10000000149011612f);
  _802 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_792, _799));
  _810 = (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_791, _792)))).w) - _802.w) * _765) + _802.w;
  _814 = saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_799, _791)))).w) - _810) * _766) + _810);
  _815 = _814 * 3.0f;
  _824 = _156 - _mainPosition.x;
  _825 = _157 - _mainPosition.y;
  _826 = _158 - _mainPosition.z;
  _835 = 1.0f - saturate(sqrt(((_824 * _824) + (_825 * _825)) + (_826 * _826)) * 0.0020000000949949026f);
  _838 = (_835 * _835) * (exp2(log2(saturate(_815)) * 5.400000095367432f) * _37);
  _841 = WaveReadLaneFirst(_materialIndex);
  _849 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_841 < (uint)170000), _841, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._scanRadius);
  _854 = _mainPosition.x - _156;
  _855 = _mainPosition.y - _157;
  _856 = _mainPosition.z - _158;
  _865 = WaveReadLaneFirst(_materialIndex);
  _873 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_865 < (uint)170000), _865, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskRatio);
  _878 = WaveReadLaneFirst(_materialIndex);
  _886 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_878 < (uint)170000), _878, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._scanRadiusEnd);
  _891 = _mainPosition.x - _156;
  _892 = _mainPosition.y - _157;
  _893 = _mainPosition.z - _158;
  _901 = WaveReadLaneFirst(_materialIndex);
  _909 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_901 < (uint)170000), _901, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskEndNoiseIntensity);
  _912 = WaveReadLaneFirst(_materialIndex);
  _920 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_912 < (uint)170000), _912, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._sphereMaskEndRatio);
  _924 = saturate((_920 * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, _849)) * sqrt(dot(float3(_854, _855, _856), float3(_854, _855, _856))))) * 2.500000238418579f) - _815) + -1.0f) * _873) + 1.0f)) * saturate((_909 * _814) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, _886)) * sqrt(dot(float3(_891, _892, _893), float3(_891, _892, _893))))) * 1.4285714626312256f)));
  if ((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _109)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _110)), 0)))).x) & 127) + -53) < (uint)15) {
    _933 = _218.w * 0.5f;
    _936 = WaveReadLaneFirst(_materialIndex);
    _944 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_936 < (uint)170000), _936, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex);
    _953 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_944 < (uint)65000), _944, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_933 + ((TEXCOORD.x * 2.0f) * _38)), (_933 + (((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + TEXCOORD.y) * 2.0f)))))).x) + -0.20000000298023224f;
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_956.x, _956.y);
    _977 = _953 * 0.01874999888241291f;
    _985 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * (_977 + _109));
    _986 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * (_977 + _110));
    _988 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_985, _986, 0));
    _991 = __3__36__0__0__g_gbufferNormal.Load(int3(_985, _986, 0));
    _1009 = (saturate(_991.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _1010 = (saturate(_991.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _1011 = (saturate(_991.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _1013 = rsqrt(dot(float3(_1009, _1010, _1011), float3(_1009, _1010, _1011)));
    _1014 = _1013 * _1009;
    _1015 = _1013 * _1010;
    _1016 = _1011 * _1013;
    _1019 = (float((uint)((uint)(((uint)((uint)(_988.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _1020 = (float((uint)((uint)(_988.w & 255))) * 0.007843137718737125f) + -1.0f;
    _1023 = (_1019 + _1020) * 0.5f;
    _1024 = (_1019 - _1020) * 0.5f;
    _1028 = (1.0f - abs(_1023)) - abs(_1024);
    _1030 = rsqrt(dot(float3(_1023, _1024, _1028), float3(_1023, _1024, _1028)));
    _1031 = _1030 * _1023;
    _1032 = _1030 * _1024;
    _1033 = _1030 * _1028;
    _1035 = select((_1016 >= 0.0f), 1.0f, -1.0f);
    _1038 = -0.0f - (1.0f / (_1035 + _1016));
    _1039 = _1015 * _1038;
    _1040 = _1039 * _1014;
    _1041 = _1035 * _1014;
    _1050 = mad(_1033, _1014, mad(_1032, _1040, ((((_1041 * _1014) * _1038) + 1.0f) * _1031)));
    _1054 = mad(_1033, _1015, mad(_1032, (_1035 + (_1039 * _1015)), ((_1031 * _1035) * _1040)));
    _1058 = mad(_1033, _1016, mad(_1032, (-0.0f - _1015), (-0.0f - (_1041 * _1031))));
    _1060 = rsqrt(dot(float3(_1050, _1054, _1058), float3(_1050, _1054, _1058)));
    _1061 = _1060 * _1050;
    _1062 = _1060 * _1054;
    _1063 = _1060 * _1058;
    _1068 = _mainPosition.x - _156;
    _1069 = _mainPosition.y - _157;
    _1070 = _mainPosition.z - _158;
    _1075 = saturate(5.000000476837158f - (sqrt(dot(float3(_1068, _1069, _1070), float3(_1068, _1069, _1070))) * 0.1250000149011612f));
    if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_956.x)))))) + 0.5f) * _109), int((float((int)(int(float((int)((int)(_956.y)))))) + 0.5f) * _110), 0)))).x) & 255) == _renderPassEnemy) {
      _1086 = WaveReadLaneFirst(_materialIndex);
      _1094 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1086 < (uint)170000), _1086, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._enemyMaskColor);
      _1097 = float((uint)((uint)(((uint)(_1094) >> 16) & 255)));
      _1100 = float((uint)((uint)(((uint)(_1094) >> 8) & 255)));
      _1102 = float((uint)((uint)(_1094 & 255)));
      _1149 = exp2(log2(saturate(_356 * 0.5f)) * 2.4000000953674316f) * (((((_953 * 3.25f) + 1.2999999523162842f) * _37) * _1075) * exp2(log2(abs(dot(float3(_1061, _1062, _1063), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 5.0f));
      _1152 = (((select(((_1097 * 0.003921568859368563f) < 0.040449999272823334f), (_1097 * 0.0003035269910469651f), exp2(log2((_1097 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1153 = (((select(((_1100 * 0.003921568859368563f) < 0.040449999272823334f), (_1100 * 0.0003035269910469651f), exp2(log2((_1100 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1154 = (((select(((_1102 * 0.003921568859368563f) < 0.040449999272823334f), (_1102 * 0.0003035269910469651f), exp2(log2((_1102 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1155 = _1149;
      _1156 = (_1149 * 0.15000000596046448f);
    } else {
      _1152 = 1.0f;
      _1153 = 1.0f;
      _1154 = 1.0f;
      _1155 = 0.0f;
      _1156 = 0.0f;
    }
    _1168 = ((_953 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_1061, _1062, _1063), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))))) * 5.0f)) * _37;
    _1174 = 0.0f;
    _1175 = 0.0f;
    _1176 = 0.0f;
    _1177 = 0.0f;
    _1178 = _1152;
    _1179 = _1153;
    _1180 = _1154;
    _1181 = (_1155 + (_1168 * 0.3185468018054962f));
    _1182 = (_1156 + (_1168 * 0.033104754984378815f));
  } else {
    _1174 = (_516 * 0.2632734179496765f);
    _1175 = (_516 * 0.05087609216570854f);
    _1176 = (_838 * 0.07323896884918213f);
    _1177 = (_838 * 0.003935939632356167f);
    _1178 = 1.0f;
    _1179 = 1.0f;
    _1180 = 1.0f;
    _1181 = 0.0f;
    _1182 = 0.0f;
  }
  _1183 = WaveReadLaneFirst(_materialIndex);
  _1191 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1183 < (uint)170000), _1183, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._fogIntensity);
  _1211 = saturate(saturate(exp2(log2(_260 * 20.0f) * 0.5f)));
  _1231 = ((((((_624 - _459) + _647) + _1176) + _1181) + ((((_1191 * (((lerp(_459, _522, 0.5f)) * 0.800000011920929f) - _1174)) + _1174) * saturate(_1178 + 0.20000000298023224f)) * _1211)) * _924) + _459;
  _1232 = ((((((_625 - _458) + _648) + _1177) + _1182) + ((((_1191 * (((lerp(_458, _522, 0.5f)) * 0.800000011920929f) - _1175)) + _1175) * saturate(_1179 + 0.20000000298023224f)) * _1211)) * _924) + _458;
  _1233 = ((((_626 - _457) + _649) + (((((lerp(_457, _522, 0.5f)) * 0.800000011920929f) * _1191) * saturate(_1180 + 0.20000000298023224f)) * _1211)) * _924) + _457;
  _1234 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1247 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1234, 0)))).x) & 127))) + 0.5f);
  } else {
    _1247 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1231, _1232, _1233));
    _1669 = output_color.x;
    _1670 = output_color.y;
    _1671 = output_color.z;
  } else {
    _1669 = _1231;
    _1670 = _1232;
    _1671 = _1233;
  }
  if (_etcParams.y > 1.0f) {
    _1682 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1683 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1687 = saturate(1.0f - (dot(float2(_1682, _1683), float2(_1682, _1683)) * saturate(_etcParams.y + -1.0f)));
    _1692 = (_1687 * _1669);
    _1693 = (_1687 * _1670);
    _1694 = (_1687 * _1671);
  } else {
    _1692 = _1669;
    _1693 = _1670;
    _1694 = _1671;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1727 = select((_1692 <= 0.0031308000907301903f), (_1692 * 12.920000076293945f), (((pow(_1692, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1728 = select((_1693 <= 0.0031308000907301903f), (_1693 * 12.920000076293945f), (((pow(_1693, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1729 = select((_1694 <= 0.0031308000907301903f), (_1694 * 12.920000076293945f), (((pow(_1694, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1727 = _1692;
    _1728 = _1693;
    _1729 = _1694;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1734 = float((uint)_1234);
    if (!(_1734 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1734 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1743 = _1727;
        _1744 = _1728;
        _1745 = _1729;
      } else {
        _1743 = 0.0f;
        _1744 = 0.0f;
        _1745 = 0.0f;
      }
    } else {
      _1743 = 0.0f;
      _1744 = 0.0f;
      _1745 = 0.0f;
    }
  } else {
    _1743 = _1727;
    _1744 = _1728;
    _1745 = _1729;
  }
  _1755 = exp2(log2(_1743 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1756 = exp2(log2(_1744 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1757 = exp2(log2(_1745 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1755 * 18.6875f) + 1.0f)) * ((_1755 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1756 * 18.6875f) + 1.0f)) * ((_1756 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1757 * 18.6875f) + 1.0f)) * ((_1757 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1247;
  return SV_Target;
}