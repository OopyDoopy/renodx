struct PostProcessUber_CDStruct {
  uint _noiseTex;
  float _itemRatio;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
  float _dropItemFakeLightIntensity;
  float _dropItemBlurWidth;
  float _dropItemBlurIntensity;
  float3 _channelBrightness;
  float _contrast;
  float3 _saturation;
  float _fishEyeMaxPower;
  uint _enemyMaskColor;
  uint _objectiveMaskColor;
  float _uiMainMenuEffect;
  float _uiQuickSlotEffect;
  uint _detectColorBase;
  float _detectModeG;
  float _detectModeR;
  float _detectModeB;
  float _detectModeKnowledge;
  float _detectModeInterrupt;
  uint _detectLiftColor;
  float _statusVignetteRatio1;
  float _statusVignetteRadius1;
  float _statusVignettePower1;
  float _statusVignetteChromaticShift1;
  uint _statusVignetteColor1;
  float _statusVignetteRatio2;
  float _statusVignetteRadius2;
  float _statusVignettePower2;
  float _statusVignetteChromaticShift2;
  uint _statusVignetteColor2;
  float _statusVignetteRatio3;
  float _statusVignetteRadius3;
  float _statusVignettePower3;
  float _statusVignetteChromaticShift3;
  uint _statusVignetteColor3;
  uint _temperatureWarningTex;
  uint _electrocutionTex;
  uint _enemyAlertTex;
  uint _wantedRegionColor;
  float _chromaticAberrationRatio;
  float _chromaticAberrationShiftValue;
  float2 _chromaticAberrationShiftPosition;
  float _invertColor;
  uint _followLearningColor;
  uint _followLearningSaturationTone;
  uint _followLearningNoiseTex;
  float _isBloodEffect;
  float _testEffectRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_noiseTex : register(t26, space36);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b15, space35) {
  float4 _time;
  float4 _timeNoScale;
  uint4 _frameNumber;
  float4 _screenSizeAndInvSize;
  float4 _bufferSizeAndInvSize;
  float4 _hiZUVScaleAndInvScale;
  float4 _resolutionScale;
  float4 _temporalReprojectionParams;
  float4 _viewPos;
  float4 _viewDir;
  row_major float4x4 _viewProj;
  row_major float4x4 _viewProjNoJitter;
  row_major float4x4 _viewProjRelative;
  row_major float4x4 _viewProjRelativeNoJitter;
  row_major float4x4 _invViewProj;
  row_major float4x4 _invViewProjRelative;
  row_major float4x4 _invViewProjRelativeNoJitter;
  row_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  row_major float4x4 _view;
  row_major float4x4 _viewRelative;
  row_major float4x4 _viewRelativePrev;
  row_major float4x4 _proj;
  row_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  row_major float4x4 _viewProjNoJitterPrev;
  row_major float4x4 _viewProjRelativePrev;
  row_major float4x4 _viewProjRelativeNoJitterPrev;
  row_major float4x4 _invViewProjPrev;
  row_major float4x4 _invViewProjRelativePrev;
  row_major float4x4 _projToPrevProj;
  row_major float4x4 _projToPrevProjNoTranslation;
  row_major float4x4 _viewProjectionTexScale;
  float4 _temporalAAJitter;
  float4 _temporalAAJitterParams;
  float4 _frustumPlanes[6];
  float4 _frustumPlanesPrev[6];
  float4 _frustumCornerDirs[4];
  float4 _screenPercentage;
  float4 _nearFarProj;
  float4 _renderingOriginPos;
  float4 _renderingOriginPosPrev;
  float4 _lodMaskRenderRate;
  float4 _terrainNormalParams;
  int4 _hiZMapInfo;
  int4 _hiZMapInfoCurrent;
  float4 _treeParams;
  uint4 _clusterSize;
  uint4 _globalLightParams;
  float4 _bevelParams;
  float4 _variableRateShadingParams;
  float4 _cavityParams;
  float4 _customRenderPassSizeInvSize;
  uint4 _impostorParams;
  float4 _clusterDecalSizeAndInvSize;
  uint4 _globalWindParams;
  float4 _windFluidVolumeParams;
  float4 _windFluidTextureParams;
  float4 _raytracingAccelerationStructureOrigin;
  float4 _debugBaseColor;
  float4 _debugNormal;
  float4 _debugMaterial;
  float4 _debugMultiplier;
  min16float4 _debugBaseColor16;
  min16float4 _debugNormal16;
  min16float4 _debugMaterial16;
  min16float4 _debugMultiplier16;
  float4 _debugCursorWorldPos;
  uint4 _debugRenderToggle01;
  uint4 _debugTreeShapeVariation;
  float4 _positionBasedDynamicsParameter;
  float _effectiveMetallicForVelvet;
  float _debugCharacterSnowRate;
  uint _systemRandomSeed;
  uint _skinnedMeshDebugFlag;
  float4 _viewPosShifted;
  float4 _viewPosShiftedPrev;
  float4 _viewTileRelativePos;
  float4 _viewTileRelativePosPrev;
  int2 _viewTileIndex;
  int2 _viewTileIndexPrev;
  float4 _worldVolume;
  float3 _diffViewPosAccurate;
  uint _isPhotosensitiveMode_isAllolwBlood;
};

#define RENODX_TONEMAP_EXTERNAL_SCENE_CONSTANT_BUFFER 1
#define RENODX_TONEMAP_SCENE_TIME_W _time.w
#include "../tonemap.hlsli"

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b30, space35) {
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

struct BindlessParameters_PostProcessUber_CD {
  PostProcessUber_CDStruct BindlessParameters_PostProcessUber_CD;
};

typedef BindlessParameters_PostProcessUber_CD BindlessParameters_PostProcessUber_CD_t;
ConstantBuffer<BindlessParameters_PostProcessUber_CD_t> BindlessParameters_PostProcessUber_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointWrap : register(s8, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _34;
  int _40;
  float _48;
  int _49;
  float _57;
  int _58;
  float _66;
  int _67;
  float _75;
  float _79;
  int _80;
  float _88;
  float _92;
  int _93;
  float _101;
  float _105;
  int _106;
  float _114;
  float _118;
  int _119;
  float _127;
  int _128;
  float _136;
  int _137;
  float _145;
  float _172;
  float _211;
  float _212;
  float _215;
  float _216;
  float _237;
  float _238;
  float _308;
  float _309;
  float _310;
  float _345;
  float _430;
  float _431;
  float _432;
  float _473;
  float _474;
  float _475;
  float _526;
  float _527;
  float _528;
  float _590;
  float _591;
  float _592;
  float _593;
  float _594;
  float _595;
  float _665;
  float _666;
  float _667;
  float _724;
  float _725;
  float _926;
  float _927;
  float _928;
  float _961;
  float _962;
  float _963;
  int _964;
  float _1141;
  float _1142;
  float _1143;
  float _1206;
  float _1207;
  float _1208;
  float _1248;
  float _1249;
  float _1250;
  float _1385;
  float _1386;
  float _1387;
  float _1449;
  float _1450;
  float _1451;
  float _1452;
  float _1453;
  float _1454;
  float _1653;
  float _1740;
  float _1741;
  float _1742;
  float _1864;
  float _1865;
  float _1866;
  float _1985;
  float _1986;
  float _1987;
  float _2105;
  float _2106;
  float _2107;
  float _2168;
  float _2169;
  float _2170;
  bool _2522;
  bool _2539;
  float _2586;
  float _2587;
  float _2588;
  float _2589;
  float _2722;
  float _2723;
  float _2724;
  float _2754;
  float _2755;
  float _2756;
  float _2899;
  float _2900;
  float _2901;
  float _2915;
  float _3120;
  float _3121;
  float _3122;
  float _3215;
  float _3216;
  float _3217;
  float _3261;
  float _3262;
  float _3263;
  float _3283;
  float _3284;
  float _3285;
  float _3304;
  float _3305;
  float _3306;
  float _3336;
  float _3337;
  float _3338;
  float _3352;
  float _3353;
  float _3354;
  float _154;
  float _159;
  float _160;
  float _161;
  float _162;
  float _176;
  float _181;
  float _185;
  float _194;
  float _200;
  float _205;
  int _217;
  float _225;
  float4 _241;
  int _245;
  int _253;
  float4 _277;
  float _286;
  float _287;
  float _300;
  int _311;
  float _319;
  int _324;
  float _332;
  int _335;
  float _343;
  float _353;
  float4 _377;
  int _382;
  float _390;
  bool _392;
  bool _393;
  int _395;
  float _403;
  float _413;
  float _414;
  float _425;
  float _447;
  float _448;
  float _457;
  float _458;
  float _460;
  int _480;
  float _489;
  float _490;
  float _491;
  float _492;
  float _501;
  float _502;
  float _504;
  int _529;
  float _537;
  int _538;
  float _546;
  int _547;
  float _555;
  int _556;
  float _564;
  int _565;
  float _573;
  float _578;
  bool _596;
  float _600;
  float _601;
  float _602;
  float _609;
  float _611;
  float _613;
  float _615;
  float _616;
  float _617;
  float _621;
  float _626;
  float _636;
  float _637;
  float _645;
  float _652;
  float _653;
  float _654;
  uint2 _683;
  uint _698;
  int _700;
  float _708;
  float _709;
  float _711;
  float _712;
  float _713;
  float _727;
  float _728;
  float _729;
  float _730;
  float _732;
  float4 _738;
  int _751;
  float _759;
  float _760;
  float _786;
  int _803;
  float _811;
  int _821;
  int _829;
  float _832;
  float _835;
  float _837;
  float _870;
  bool _883;
  float _912;
  float _913;
  float _914;
  bool _921;
  float _935;
  int _973;
  int _981;
  float _984;
  float _987;
  float _989;
  float _1022;
  float _1030;
  float _1032;
  float _1038;
  float _1040;
  float _1041;
  float _1069;
  float _1075;
  float _1076;
  float _1080;
  float _1087;
  float _1089;
  float _1096;
  float _1100;
  float _1103;
  float _1104;
  float _1107;
  int _1122;
  float _1130;
  float4 _1155;
  float _1161;
  float _1164;
  float _1165;
  float _1166;
  float _1174;
  float _1179;
  float _1180;
  float _1195;
  float _1209;
  float _1215;
  float _1219;
  float _1220;
  float _1228;
  float _1235;
  float _1236;
  float _1237;
  float _1256;
  float _1271;
  float _1282;
  int _1285;
  int _1293;
  float _1307;
  float _1310;
  float _1311;
  float _1323;
  float _1335;
  float _1338;
  float _1339;
  bool _1347;
  float _1349;
  float _1358;
  float _1360;
  float _1364;
  float _1365;
  float _1372;
  float _1373;
  float _1374;
  int _1388;
  float _1398;
  float _1399;
  float _1400;
  int _1401;
  float _1411;
  float _1412;
  float _1413;
  int _1414;
  float _1422;
  bool _1427;
  bool _1434;
  float _1435;
  bool _1443;
  float _1444;
  float _1455;
  float _1456;
  float _1457;
  float _1461;
  float _1463;
  float _1465;
  float _1470;
  float _1487;
  float _1494;
  float _1495;
  float _1496;
  int _1497;
  float _1505;
  float _1508;
  float _1518;
  float _1519;
  float _1520;
  int _1521;
  float _1529;
  int _1532;
  float _1541;
  float _1542;
  int _1545;
  float _1554;
  float _1555;
  int _1558;
  int _1566;
  int _1575;
  float _1583;
  int _1584;
  float _1592;
  float _1598;
  float _1601;
  float _1602;
  float _1611;
  int _1612;
  float _1620;
  int _1623;
  float _1632;
  float _1633;
  int _1641;
  float _1649;
  int _1655;
  float _1663;
  float _1669;
  int _1670;
  int _1678;
  float _1681;
  float _1684;
  float _1686;
  float _1711;
  bool _1718;
  float _1719;
  float _1726;
  float _1745;
  float _1746;
  int _1751;
  float _1759;
  int _1765;
  float _1773;
  float _1778;
  float _1783;
  float _1790;
  float _1791;
  float _1792;
  int _1793;
  int _1801;
  float _1804;
  float _1807;
  float _1809;
  float _1834;
  bool _1841;
  float _1842;
  float _1849;
  float _1856;
  float _1869;
  float _1870;
  int _1875;
  float _1883;
  int _1888;
  float _1896;
  float _1901;
  float _1904;
  float _1911;
  float _1912;
  float _1913;
  int _1914;
  int _1922;
  float _1925;
  float _1928;
  float _1930;
  float _1955;
  bool _1962;
  float _1963;
  float _1970;
  float _1977;
  float _1990;
  float _1991;
  int _1996;
  float _2004;
  int _2008;
  float _2016;
  float _2021;
  float _2024;
  float _2031;
  float _2032;
  float _2033;
  int _2034;
  int _2042;
  float _2045;
  float _2048;
  float _2050;
  float _2075;
  bool _2082;
  float _2083;
  float _2090;
  float _2097;
  float _2112;
  float _2113;
  float _2114;
  float _2122;
  float _2130;
  float _2138;
  float _2141;
  float _2144;
  float _2151;
  float _2152;
  float _2153;
  float _2157;
  int _2175;
  int _2183;
  float _2186;
  float _2189;
  float _2191;
  float _2221;
  float _2222;
  float _2223;
  float _2224;
  int _2225;
  int _2233;
  float4 _2244;
  float _2251;
  float _2254;
  float _2256;
  float _2257;
  float _2293;
  uint _2302;
  uint _2303;
  uint4 _2305;
  float4 _2308;
  float _2326;
  float _2327;
  float _2328;
  float _2330;
  float _2331;
  float _2332;
  float _2333;
  float _2336;
  float _2337;
  float _2340;
  float _2341;
  float _2345;
  float _2347;
  float _2348;
  float _2349;
  float _2350;
  float _2352;
  float _2355;
  float _2356;
  float _2357;
  float _2358;
  float _2367;
  float _2371;
  float _2375;
  float _2377;
  float _2379;
  float _2380;
  float _2383;
  float _2386;
  float _2387;
  float4 _2394;
  float _2397;
  float _2406;
  float _2409;
  float _2410;
  float _2415;
  float _2417;
  float _2422;
  float _2425;
  float _2426;
  float _2431;
  float _2435;
  float _2441;
  float _2451;
  float _2454;
  float _2456;
  bool _2459;
  bool _2460;
  bool _2461;
  bool _2462;
  float _2474;
  float4 _2487;
  bool _2523;
  bool _2525;
  float _2541;
  float _2548;
  float _2549;
  float _2550;
  bool _2551;
  float _2558;
  float4 _2562;
  float _2576;
  float _2590;
  float _2597;
  float _2598;
  float _2599;
  float _2601;
  float _2607;
  float _2614;
  float _2615;
  float _2616;
  int _2617;
  int _2625;
  float _2628;
  float _2631;
  float _2633;
  float _2658;
  float _2659;
  float _2660;
  float _2664;
  float _2666;
  float _2668;
  float _2673;
  float _2686;
  float _2687;
  float _2688;
  float _2702;
  float _2707;
  float _2711;
  float _2725;
  float _2729;
  float _2736;
  float _2737;
  float _2738;
  float _2743;
  bool _2776;
  float _2782;
  float4 _2799;
  float _2802;
  float _2803;
  float _2813;
  float _2816;
  float _2817;
  int _2828;
  int _2836;
  float4 _2843;
  bool _2848;
  bool _2850;
  bool _2854;
  bool _2862;
  float _2886;
  float _2888;
  uint _2902;
  bool _2918;
  float _2924;
  float _2973;
  float _2974;
  float _2975;
  float _2977;
  float _2984;
  float _2985;
  float _2986;
  float _3005;
  float _3006;
  float _3007;
  float _3008;
  float _3009;
  float _3010;
  float _3011;
  float _3012;
  float _3013;
  float _3059;
  float _3060;
  float _3061;
  float _3062;
  float _3063;
  float _3064;
  float _3065;
  float _3082;
  float _3083;
  float _3084;
  float _3085;
  float _3091;
  float _3094;
  float _3101;
  float _3102;
  float _3103;
  float _3132;
  float _3157;
  float _3158;
  float _3159;
  float _3178;
  float _3179;
  float _3180;
  float _3186;
  float _3190;
  float _3191;
  float _3192;
  float _3193;
  float _3198;
  float _3223;
  float _3227;
  float _3228;
  float _3229;
  float _3230;
  int _3233;
  float _3272;
  float _3294;
  float _3295;
  float _3299;
  float _3343;
  _34 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _40 = WaveReadLaneFirst(_materialIndex);
  _48 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio1);
  _49 = WaveReadLaneFirst(_materialIndex);
  _57 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_49 < (uint)170000), _49, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio2);
  _58 = WaveReadLaneFirst(_materialIndex);
  _66 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRatio3);
  _67 = WaveReadLaneFirst(_materialIndex);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift1);
  _79 = ((float)((uint)(uint)(_enableChromaticAberration))) * _75;
  _80 = WaveReadLaneFirst(_materialIndex);
  _88 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift2);
  _92 = ((float)((uint)(uint)(_enableChromaticAberration))) * _88;
  _93 = WaveReadLaneFirst(_materialIndex);
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteChromaticShift3);
  _105 = ((float)((uint)(uint)(_enableChromaticAberration))) * _101;
  _106 = WaveReadLaneFirst(_materialIndex);
  _114 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_106 < (uint)170000), _106, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationRatio);
  _118 = ((float)((uint)(uint)(_enableChromaticAberration))) * _114;
  _119 = WaveReadLaneFirst(_materialIndex);
  _127 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_119 < (uint)170000), _119, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftValue);
  _128 = WaveReadLaneFirst(_materialIndex);
  _136 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._isBloodEffect);
  _137 = WaveReadLaneFirst(_materialIndex);
  _145 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_137 < (uint)170000), _137, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._fishEyeMaxPower);
  [branch]
  if (((_145 > 0.0010000000474974513f) || (_145 < -0.0010000000474974513f)) | (_followLearning > 0.0010000000474974513f)) {
    _154 = 0.5f / _34;
    _159 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
    _160 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _154;
    _161 = dot(float2(_159, _160), float2(_159, _160));
    _162 = sqrt(_161);
    if (_followLearning > 0.0010000000474974513f) {
      _172 = ((pow(_followLearning, 0.25f)) * 1.5f);
    } else {
      _172 = _145;
    }
    if (_172 > 0.0f) {
      _176 = sqrt(dot(float2(0.5f, _154), float2(0.5f, _154)));
      _181 = tan(_172 * _162) * (rsqrt(_161) * _176);
      _185 = tan(_176 * _172);
      _211 = (((_181 * _159) / _185) + 0.5f);
      _212 = (((_181 * _160) / _185) + _154);
    } else {
      if (_172 < 0.0f) {
        _194 = select((_34 < 1.0f), 0.5f, _154);
        _200 = atan((_172 * _162) * -10.0f) * (rsqrt(_161) * _194);
        _205 = atan((_172 * -10.0f) * _194);
        _211 = (((_200 * _159) / _205) + 0.5f);
        _212 = (((_200 * _160) / _205) + _154);
      } else {
        _211 = 0.0f;
        _212 = 0.0f;
      }
    }
    _215 = _211;
    _216 = (_212 * _34);
  } else {
    _215 = TEXCOORD.x;
    _216 = TEXCOORD.y;
  }
  _217 = WaveReadLaneFirst(_materialIndex);
  _225 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_217 < (uint)170000), _217, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiQuickSlotEffect);
  if (!(!(_225 >= 0.0010000000474974513f))) {
    _237 = ((_225 * (0.029999999329447746f - (_215 * 0.06000000238418579f))) + _215);
    _238 = ((_225 * (0.029999999329447746f - (_216 * 0.06000000238418579f))) + _216);
  } else {
    _237 = _215;
    _238 = _216;
  }
  _241 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_237, _238));  // [sem: _3__36__0__0__g_sceneColor_sample]
  _245 = WaveReadLaneFirst(_materialIndex);
  _253 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_245 < (uint)170000), _245, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  [branch]
  if (!(!(_fleeCount >= 0.0010000000474974513f))) {
    _277 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_253 < (uint)65000), _253, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _34) * 4.0f)) + (_time.x * 0.019999999552965164f))));
    _286 = (TEXCOORD.x + -0.5f) + ((_277.x + -0.5f) * 0.15000000596046448f);
    _287 = (TEXCOORD.y + -0.5f) + ((_277.y + -0.5f) * 0.15000000596046448f);
  // [sem: expr_sat]
    _300 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_286 * _286) + (_287 * _287))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _308 = (_241.x - (_300 * _241.x));
    _309 = (_241.y - (_300 * _241.y));
    _310 = (_241.z - (_300 * _241.z));
  } else {
    _308 = _241.x;
    _309 = _241.y;
    _310 = _241.z;
  }
  _311 = WaveReadLaneFirst(_materialIndex);
  _319 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
  if ((_225 >= 0.0010000000474974513f) || (_319 >= 0.0010000000474974513f)) {
    _324 = WaveReadLaneFirst(_materialIndex);
    _332 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_324 < (uint)170000), _324, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    if (_332 > _225) {
      _335 = WaveReadLaneFirst(_materialIndex);
      _343 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_335 < (uint)170000), _335, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
      _345 = _343;
    } else {
      _345 = _225;
    }
    _353 = _345 * 0.5f;
    _377 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_253 < (uint)65000), _253, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _34), (TEXCOORD.y * 2.0f)));
    _382 = WaveReadLaneFirst(_materialIndex);
    _390 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_382 < (uint)170000), _382, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _392 = (_225 < 0.0010000000474974513f);
    _393 = _392 && (_390 >= 0.0010000000474974513f);
    _395 = WaveReadLaneFirst(_materialIndex);
    _403 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._uiMainMenuEffect);
    _413 = (TEXCOORD.y - select(_393, 0.550000011920929f, 0.5f)) - ((_377.y + -0.5f) * 0.05000000074505806f);
    _414 = ((TEXCOORD.x - ((_377.x + -0.5f) * 0.05000000074505806f)) + select(_393, -0.41999998688697815f, -0.5f)) * _34;
    _425 = ((_345 * -0.8999999761581421f) * (1.0f - saturate((select((_392 && (_403 >= 0.0010000000474974513f)), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_414 * _414) + (_413 * _413))) * 1.4285714626312256f))) + 1.0f;
    _430 = (_425 * ((_353 * (((_309 * 0.75f) - (_308 * 0.6069999933242798f)) + (_310 * 0.1889999955892563f))) + _308));
    _431 = (_425 * ((_353 * (((_308 * 0.3490000069141388f) - (_309 * 0.3140000104904175f)) + (_310 * 0.1679999977350235f))) + _309));
    _432 = (_425 * ((_353 * (((_308 * 0.2720000147819519f) + (_309 * 0.5339999794960022f)) - (_310 * 0.8690000176429749f))) + _310));
  } else {
    _430 = _308;
    _431 = _309;
    _432 = _310;
  }
  if (((_48 >= 0.0010000000474974513f) && (_79 >= 0.0010000000474974513f)) | ((_57 >= 0.0010000000474974513f) && (_92 >= 0.0010000000474974513f)) | ((_66 >= 0.0010000000474974513f) && (_105 >= 0.0010000000474974513f))) {
    _447 = _237 + -0.5f;
    _448 = _238 + -0.5f;
  // [sem: invLength]
    _457 = rsqrt(dot(float2(_447, _448), float2(_447, _448))) * ((max(max(_79, _92), _105) * 0.009999999776482582f) * sqrt((_448 * _448) + (_447 * _447)));
    _458 = _457 * _447;
    _460 = _457 * _448;
    _473 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_237 - _458), (_238 - _460))))).x);
    _474 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238)))).y);
    _475 = (((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_458 + _237), (_460 + _238))))).z);
  } else {
    _473 = _430;
    _474 = _431;
    _475 = _432;
  }
  if ((_118 >= 0.0010000000474974513f) && (_127 >= 0.0010000000474974513f)) {
    _480 = WaveReadLaneFirst(_materialIndex);
    _489 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_480 < (uint)170000), _480, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.x);
    _490 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_480 < (uint)170000), _480, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._chromaticAberrationShiftPosition.y);
    _491 = _237 - _489;
    _492 = _238 - _490;
  // [sem: invLength]
    _501 = rsqrt(dot(float2(_491, _492), float2(_491, _492))) * ((_127 * 0.009999999776482582f) * sqrt((_492 * _492) + (_491 * _491)));
    _502 = _501 * _491;
    _504 = _501 * _492;
    _526 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_237 - _502), (_238 - _504))))).x) - _473) * _118) + _473);
    _527 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238)))).y) - _474) * _118) + _474);
    _528 = ((((((float4)(__3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_502 + _237), (_504 + _238))))).z) - _475) * _118) + _475);
  } else {
    _526 = _430;
    _527 = _431;
    _528 = _432;
  }
  _529 = WaveReadLaneFirst(_materialIndex);
  _537 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_529 < (uint)170000), _529, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeG);
  _538 = WaveReadLaneFirst(_materialIndex);
  _546 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_538 < (uint)170000), _538, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeR);
  _547 = WaveReadLaneFirst(_materialIndex);
  _555 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_547 < (uint)170000), _547, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeB);
  _556 = WaveReadLaneFirst(_materialIndex);
  _564 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_556 < (uint)170000), _556, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeKnowledge);
  _565 = WaveReadLaneFirst(_materialIndex);
  _573 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_565 < (uint)170000), _565, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectModeInterrupt);
  _578 = saturate((((_546 + _537) + _555) + _564) + _573);  // [sem: expr_sat]
  [branch]
  if (_578 > 0.0f) {
    if (!(_537 >= 0.0010000000474974513f)) {
      if (!(_546 >= 0.0010000000474974513f)) {
        if (!(_555 >= 0.0010000000474974513f)) {
          if (!(!(_564 >= 0.0010000000474974513f))) {
            _590 = 0.6000000238418579f;
            _591 = 0.6000000238418579f;
            _592 = 0.800000011920929f;
            _593 = 0.5f;
            _594 = 0.44999998807907104f;
            _595 = 0.949999988079071f;
          } else {
            _590 = 0.0f;
            _591 = 0.0f;
            _592 = 0.0f;
            _593 = 0.0f;
            _594 = 0.0f;
            _595 = 0.0f;
          }
        } else {
          _590 = 0.6000000238418579f;
          _591 = 0.699999988079071f;
          _592 = 0.699999988079071f;
          _593 = 0.6000000238418579f;
          _594 = 0.699999988079071f;
          _595 = 0.800000011920929f;
        }
      } else {
        _590 = 0.699999988079071f;
        _591 = 0.6000000238418579f;
        _592 = 0.6000000238418579f;
        _593 = 0.800000011920929f;
        _594 = 0.699999988079071f;
        _595 = 0.6000000238418579f;
      }
    } else {
      _590 = 0.6000000238418579f;
      _591 = 0.699999988079071f;
      _592 = 0.6000000238418579f;
      _593 = 0.6000000238418579f;
      _594 = 0.800000011920929f;
      _595 = 0.699999988079071f;
    }
    _596 = (_573 >= 0.0010000000474974513f);
    _600 = select(_596, 0.800000011920929f, _593);
    _601 = select(_596, 0.6000000238418579f, _594);
    _602 = select(_596, 0.20000000298023224f, _595);
    _609 = (1.0f - _600) * 0.3086000084877014f;
    _611 = (1.0f - _601) * 0.6093999743461609f;
    _613 = (1.0f - _602) * 0.0820000022649765f;
    _615 = select(_596, 2.0f, _590) * _526;
    _616 = select(_596, 2.0f, _591) * _527;
    _617 = select(_596, 2.0f, _592) * _528;
    _621 = _609 * _615;
    _626 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    _636 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    _637 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    _645 = (_578 * 0.75f) * saturate(sqrt((_637 * _637) + (_636 * _636)) * 2.0f);
    _652 = ((mad(_617, _613, mad(_616, _611, ((_609 + _600) * _615))) - _526) * _578) + _526;
    _653 = ((mad(_617, _613, mad(_616, (_611 + _601), _621)) - _527) * _578) + _527;
    _654 = ((mad(_617, (_613 + _602), mad(_616, _611, _621)) - _528) * _578) + _528;
    _665 = ((_645 * ((_626 * _600) - _652)) + _652);
    _666 = ((_645 * ((_626 * _601) - _653)) + _653);
    _667 = ((_645 * ((_626 * _602) - _654)) + _654);
  } else {
    _665 = _526;
    _666 = _527;
    _667 = _528;
  }
  if ((((_highLightForVisionRemoteCatch > 0.0f) || (_highLightForVision > 0.0f)) || (_characterHighlight > 0.0f)) | (_followLearning > 0.0010000000474974513f)) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_683.x, _683.y);
  // [sem: _3__36__0__0__g_CustomRenderPassValue_load]
    _698 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_683.x)))))) + 0.5f) * _237), int((float((int)(int(float((int)((int)(_683.y)))))) + 0.5f) * _238), 0));
    _700 = _698.x & 255;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _708 = (((float)((uint)((uint)((uint)((uint)(_698.x)) >> 20)))) * 0.0004884005174972117f) + -1.0f;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _709 = (((float)((uint)((uint)(((uint)((uint)(_698.x)) >> 8) & 4095)))) * 0.0004884005174972117f) + -1.0f;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _711 = 1.0f - abs(_708);
    _712 = abs(_709);
    _713 = _711 - _712;
    if (!(_713 >= 0.0f)) {
      _724 = (select((_708 >= 0.0f), 1.0f, -1.0f) * (1.0f - _712));
      _725 = (select((_709 >= 0.0f), 1.0f, -1.0f) * _711);
    } else {
      _724 = _708;
      _725 = _709;
    }
    _727 = rsqrt(dot(float3(_724, _725, _713), float3(_724, _725, _713)));  // [sem: invLength]
    _728 = _727 * _724;
    _729 = _727 * _725;
    _730 = _727 * _713;
    _732 = rsqrt(dot(float3(_728, _729, _730), float3(_728, _729, _730)));  // [sem: invLength]
    _738 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238));  // [sem: _3__36__0__0__g_postProcessSizeColor_sample]
    [branch]
    if (_700 == _renderPassTest) {
      _751 = WaveReadLaneFirst(_materialIndex);
      _759 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_751 < (uint)170000), _751, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._testEffectRatio);
      _760 = _759 * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _961 = (_760 + _665);
      _962 = _666;
      _963 = (_760 + _667);
      _964 = _700;
    } else {
      if ((_700 == _renderPassDetectObjective) || ((!(_700 == _renderPassDetectObjective)) && (_700 == _renderPassKnowledgeNPC))) {
        _786 = ((((float4)(__3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * _bufferSizeAndInvSize.x), frac((TEXCOORD.y * 0.015625f) * _bufferSizeAndInvSize.y)), 0.0f))).x) * 0.5f) + 0.5f;
        _961 = ((((_786 * _738.x) - _665) * _738.w) + _665);
        _962 = ((((_786 * _738.y) - _666) * _738.w) + _666);
        _963 = ((((_786 * _738.z) - _667) * _738.w) + _667);
        _964 = _700;
      } else {
        bool __branch_chain_799;
        if (!(_700 == _renderPassDetectRemoteCatch)) {
          __branch_chain_799 = true;
        } else {
          _803 = WaveReadLaneFirst(_materialIndex);
          _811 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_803 < (uint)170000), _803, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
          if (!(_811 > 0.0010000000474974513f)) {
            __branch_chain_799 = true;
          } else {
            if (!((_highLightForVision > 0.0f) || (_highLightForVisionRemoteCatch > 0.0f))) {
              __branch_chain_799 = true;
            } else {
              __branch_chain_799 = false;
            }
          }
        }
        if (__branch_chain_799) {
          _883 = (_700 == _renderPassSelfPlayer);
          if ((_883) | ((_700 == _renderPassTest) || (_700 == _renderPassEnemy)) | (_700 == _renderPassDetectPickedRemoteCatch)) {
            if ((_characterHighlight > 0.0010000000474974513f) || (_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _912 = 1.0f - saturate(dot(float3((_732 * _728), (_732 * _729), (_732 * _730)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
              _913 = _912 * _912;
              _914 = _913 * _913;
              if (!_883) {
                if (!(_700 == _renderPassTest)) {
                  _921 = (_700 == _renderPassEnemy);
                  _926 = select(_921, 1.0f, 0.20000000298023224f);
                  _927 = select(_921, 0.30000001192092896f, 0.4000000059604645f);
                  _928 = select(_921, 0.30000001192092896f, 1.0f);
                } else {
                  _926 = 1.0f;
                  _927 = 1.0f;
                  _928 = 1.0f;
                }
              } else {
                _926 = 1.0f;
                _927 = 1.0f;
                _928 = 1.0f;
              }
              _935 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _961 = ((((_738.x - _665) + ((((_935 + (_665 * 10.0f)) * _926) - _738.x) * _914)) * _738.w) + _665);
              _962 = ((((_738.y - _666) + ((((_935 + (_666 * 10.0f)) * _927) - _738.y) * _914)) * _738.w) + _666);
              _963 = ((((_738.z - _667) + ((((_935 + (_667 * 10.0f)) * _928) - _738.z) * _914)) * _738.w) + _667);
              _964 = _700;
            } else {
              _961 = _665;
              _962 = _666;
              _963 = _667;
              _964 = _700;
            }
          } else {
            _961 = _665;
            _962 = _666;
            _963 = _667;
            _964 = _700;
          }
        } else {
          _821 = WaveReadLaneFirst(_materialIndex);
          _829 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_821 < (uint)170000), _821, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._detectColorBase);
          _832 = (float)((uint)((uint)(((uint)(_829) >> 16) & 255)));
          _835 = (float)((uint)((uint)(((uint)(_829) >> 8) & 255)));
          _837 = (float)((uint)((uint)(_829 & 255)));
          _870 = max(0.0010000000474974513f, _exposure0.x);
          _961 = ((((select(((_832 * 0.003921568859368563f) < 0.040449999272823334f), (_832 * 0.0003035269910469651f), exp2(log2((_832 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _870) * _738.w) + _665);
          _962 = ((((select(((_835 * 0.003921568859368563f) < 0.040449999272823334f), (_835 * 0.0003035269910469651f), exp2(log2((_835 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _870) * _738.w) + _666);
          _963 = ((((select(((_837 * 0.003921568859368563f) < 0.040449999272823334f), (_837 * 0.0003035269910469651f), exp2(log2((_837 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _870) * _738.w) + _667);
          _964 = _700;
        }
      }
    }
  } else {
    _961 = _665;
    _962 = _666;
    _963 = _667;
    _964 = 0;
  }
  if (!(!(_wantedRegionRatio >= 0.0010000000474974513f))) {
    [branch]
    if (!(!(_wantedRegionOpacity >= 0.0010000000474974513f))) {
      _973 = WaveReadLaneFirst(_materialIndex);
      _981 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_973 < (uint)170000), _973, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._wantedRegionColor);
      _984 = (float)((uint)((uint)(((uint)(_981) >> 16) & 255)));
      _987 = (float)((uint)((uint)(((uint)(_981) >> 8) & 255)));
      _989 = (float)((uint)((uint)(_981 & 255)));
      _1022 = max(0.0010000000474974513f, _exposure0.x);
      _1030 = _wantedRegionRadius * _wantedRegionRatio;
      _1032 = saturate(_1030) * 4.0f;
      _1038 = (_237 * 2.0f) + -1.0f;
      _1040 = 1.0f - (_238 * 2.0f);
      _1041 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238))).x));
      _1069 = mad((_invViewProj[2].w), _1041, mad((_invViewProj[1].w), _1040, ((_invViewProj[0].w) * _1038))) + (_invViewProj[3].w);
      _1075 = ((mad((_invViewProj[2].x), _1041, mad((_invViewProj[1].x), _1040, ((_invViewProj[0].x) * _1038))) + (_invViewProj[3].x)) / _1069) - _wantedRegionPosition.x;
      _1076 = ((mad((_invViewProj[2].z), _1041, mad((_invViewProj[1].z), _1040, ((_invViewProj[0].z) * _1038))) + (_invViewProj[3].z)) / _1069) - _wantedRegionPosition.z;
      _1080 = sqrt((_1075 * _1075) + (_1076 * _1076));
      _1087 = saturate(floor(_1080 / _1030));  // [sem: expr_sat]
      _1089 = (1.0f - _1087) * saturate(((_1032 - _1030) + _1080) / _1032);
      _1096 = (1.0f - saturate((_1080 - _1030) / _1032)) * _1087;
      _1100 = saturate(((_1096 * _1096) * _1096) + ((_1089 * _1089) * _1089));  // [sem: expr_sat]
      _1103 = saturate((_1100 * 5.0f) + -4.0f);  // [sem: expr_sat]
      _1104 = _1103 * _1103;
      _1107 = ((_1104 * _1104) * 9.0f) + 1.0f;
      _1122 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _237)), (int)(uint(_bufferSizeAndInvSize.y * _238)), 0)))).x) & 127;
      _1130 = (((((float)((uint)((uint)((uint)(_981) >> 24)))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1100) * ((float)((bool)((uint)((_1122 != 57) && ((uint)(_1122 + -53) > (uint)14)))));
      _1141 = ((_1130 * ((_1107 * (select(((_984 * 0.003921568859368563f) < 0.040449999272823334f), (_984 * 0.0003035269910469651f), exp2(log2((_984 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1022)) - _961)) + _961);
      _1142 = ((_1130 * ((_1107 * (select(((_987 * 0.003921568859368563f) < 0.040449999272823334f), (_987 * 0.0003035269910469651f), exp2(log2((_987 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1022)) - _962)) + _962);
      _1143 = ((_1130 * ((_1107 * (select(((_989 * 0.003921568859368563f) < 0.040449999272823334f), (_989 * 0.0003035269910469651f), exp2(log2((_989 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1022)) - _963)) + _963);
    } else {
      _1141 = _961;
      _1142 = _962;
      _1143 = _963;
    }
  } else {
    _1141 = _961;
    _1142 = _962;
    _1143 = _963;
  }
  if (((_temperatureWarning <= -0.009999999776482582f) || (_temperatureWarning >= 0.009999999776482582f)) || (_electrocutionWarning > 0.0010000000474974513f)) {
    _1155 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238));  // [sem: _3__36__0__0__g_postProcessSizeColor_sample]
    _1161 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      _1164 = saturate(saturate(_1161));  // [sem: expr_sat]
      _1165 = TEXCOORD.x + -0.5f;
      _1166 = TEXCOORD.y + -0.6000000238418579f;
      _1174 = saturate((_1164 + -0.5f) + sqrt((_1166 * _1166) + (_1165 * _1165))) * _1164;
      _1179 = (1.0f - (_1174 * 0.30000001192092896f)) * _1142;
      _1180 = (1.0f - (_1174 * 0.699999988079071f)) * _1143;
      _1206 = ((_1155.x - _1141) * _1155.w);
      _1207 = (lerp(_1179, _1155.y, _1155.w));  // [sem: blended]
      _1208 = (lerp(_1180, _1155.z, _1155.w));  // [sem: blended]
    } else {
      _1195 = (_1155.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1161) * 2.0f);
      _1206 = (_1195 * (_1155.x - (_1141 * 0.30000001192092896f)));
      _1207 = ((_1195 * (_1155.y - (_1142 * 0.10000002384185791f))) + _1142);  // [sem: blended]
      _1208 = ((_1195 * _1155.z) + _1143);  // [sem: blended]
    }
    _1209 = _1141 + _1206;
    if (!(_electrocutionWarning == 0.0f)) {
      _1215 = max(0.0010000000474974513f, _exposure0.x);
      _1219 = TEXCOORD.x + -0.5f;
      _1220 = TEXCOORD.y + -0.6000000238418579f;
      _1228 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1220 * _1220) + (_1219 * _1219)) + -0.30000001192092896f);
      _1235 = (_1228 * ((0.05000000074505806f / _1215) - _1209)) + _1209;
      _1236 = (_1228 * ((0.10000000149011612f / _1215) - _1207)) + _1207;
      _1237 = (_1228 * ((0.5f / _1215) - _1208)) + _1208;
      _1248 = (lerp(_1235, _1155.x, _1155.w));  // [sem: blended]
      _1249 = (lerp(_1236, _1155.y, _1155.w));  // [sem: blended]
      _1250 = (lerp(_1237, _1155.z, _1155.w));  // [sem: blended]
    } else {
      _1248 = _1209;  // [sem: blended]
      _1249 = _1207;  // [sem: blended]
      _1250 = _1208;  // [sem: blended]
    }
  } else {
    _1248 = _1141;  // [sem: blended]
    _1249 = _1142;  // [sem: blended]
    _1250 = _1143;  // [sem: blended]
  }
  [branch]
  if (!(!(_hpPercentage <= 20.0f))) {
    _1256 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if ((!(_hpPercentage <= 0.0f)) && (_1256 >= 0.0010000000474974513f)) {
      _1271 = _time.x * 0.30000001192092896f;
      _1282 = (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_253 < (uint)65000), _253, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1271 + (TEXCOORD.x * 12.0f)), (_1271 + (TEXCOORD.y * 6.0f)))))).w) * 0.10000000149011612f;
      _1285 = WaveReadLaneFirst(_materialIndex);
      _1293 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1285 < (uint)170000), _1285, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
      _1307 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      _1310 = max((abs(TEXCOORD.x + -0.5f) - _1307), 0.0f);
      _1311 = max((abs(TEXCOORD.y + -0.5f) - _1307), 0.0f);
      _1323 = sin(frac(_time.x * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      _1335 = 1.0f - _238;
      _1338 = saturate((_1335 * _1335) * 2.0f);  // [sem: expr_sat]
      _1339 = saturate(_1323);  // [sem: _1323_sat]
      _1347 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
      _1349 = (_1339 * 0.0112674031406641f) + 0.022386489436030388f;
      _1358 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      _1360 = select(_1347, 0.006995410192757845f, 0.04317210242152214f) * _1358;
      _1364 = (min(max(_1256, 0.0f), 1.0f) * saturate((saturate(((_1323 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1311 * _1311) + (_1310 * _1310)) * 3.846153974533081f)) * 2.0f) - ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1293 < (uint)65000), _1293, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1282), (_1282 + TEXCOORD.y))))).x) * 1.440000057220459f))) * _1338;
      _1365 = _1338 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      _1372 = (((select(_1347, 0.215860515832901f, 0.04317210242152214f) * _1358) - _1248) * _1365) + _1248;
      _1373 = ((_1360 - _1249) * _1365) + _1249;
      _1374 = ((_1360 - _1250) * _1365) + _1250;
      _1385 = ((((select(_1347, ((_1339 * 0.056337013840675354f) + 0.11193244159221649f), _1349) * _1358) - _1372) * _1364) + _1372);
      _1386 = ((((select(_1347, ((_1339 * 0.0053743417374789715f) + 0.0021246890537440777f), _1349) * _1358) - _1373) * _1364) + _1373);
      _1387 = ((((select(_1347, 0.0021246890537440777f, _1349) * _1358) - _1374) * _1364) + _1374);
    } else {
      _1385 = _1248;
      _1386 = _1249;
      _1387 = _1250;
    }
  } else {
    _1385 = _1248;
    _1386 = _1249;
    _1387 = _1250;
  }
  _1388 = WaveReadLaneFirst(_materialIndex);
  _1398 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1388 < (uint)170000), _1388, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.x);
  _1399 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1388 < (uint)170000), _1388, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.y);
  _1400 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1388 < (uint)170000), _1388, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._channelBrightness.z);
  _1401 = WaveReadLaneFirst(_materialIndex);
  _1411 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1401 < (uint)170000), _1401, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.x);
  _1412 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1401 < (uint)170000), _1401, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.y);
  _1413 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1401 < (uint)170000), _1401, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._saturation.z);
  _1414 = WaveReadLaneFirst(_materialIndex);
  _1422 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1414 < (uint)170000), _1414, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._contrast);
  _1427 = (_136 > 0.0010000000474974513f);
  if (_1427 && ((_isPhotosensitiveMode_isAllolwBlood & 1) == 0)) {
    _1434 = (_1398 > (_1399 + 0.05000000074505806f)) && (_1398 > (_1400 + 0.05000000074505806f));
    _1435 = _1398 * 0.4000000059604645f;
    _1443 = (_1411 > (_1412 + 0.05000000074505806f)) && (_1411 > (_1413 + 0.05000000074505806f));
    _1444 = _1411 * 0.4000000059604645f;
    _1449 = select(_1434, _1435, _1398);
    _1450 = select(_1434, _1435, _1399);
    _1451 = select(_1434, _1435, _1400);
    _1452 = select(_1443, _1444, _1411);
    _1453 = select(_1443, _1444, _1412);
    _1454 = select(_1443, _1444, _1413);
  } else {
    _1449 = _1398;
    _1450 = _1399;
    _1451 = _1400;
    _1452 = _1411;
    _1453 = _1412;
    _1454 = _1413;
  }
  _1455 = _1449 * _1385;
  _1456 = _1450 * _1386;
  _1457 = _1451 * _1387;
  _1461 = (1.0f - _1452) * 0.3086000084877014f;
  _1463 = (1.0f - _1453) * 0.6093999743461609f;
  _1465 = (1.0f - _1454) * 0.0820000022649765f;
  _1470 = _1461 * _1455;
  _1487 = max(_1422, 0.0f);
  _1494 = max(0.0f, ((_1487 * (mad(_1457, _1465, mad(_1456, _1463, ((_1461 + _1452) * _1455))) + -0.5f)) + 0.5f));
  _1495 = max(0.0f, ((_1487 * (mad(_1457, _1465, mad(_1456, (_1463 + _1453), _1470)) + -0.5f)) + 0.5f));
  _1496 = max(0.0f, ((_1487 * (mad(_1457, (_1465 + _1454), mad(_1456, _1463, _1470)) + -0.5f)) + 0.5f));
  _1497 = WaveReadLaneFirst(_materialIndex);
  _1505 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1497 < (uint)170000), _1497, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._invertColor);
  _1508 = _exposure2.x * 4.0f;
  _1518 = ((_1508 - (_1494 * 2.0f)) * _1505) + _1494;
  _1519 = ((_1508 - (_1495 * 2.0f)) * _1505) + _1495;
  _1520 = ((_1508 - (_1496 * 2.0f)) * _1505) + _1496;
  _1521 = WaveReadLaneFirst(_materialIndex);
  _1529 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1521 < (uint)170000), _1521, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderRatio);
  [branch]
  if (!(!(_1529 >= 0.0010000000474974513f))) {
    _1532 = WaveReadLaneFirst(_materialIndex);
    _1541 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1532 < (uint)170000), _1532, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.x);
    _1542 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1532 < (uint)170000), _1532, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTile.y);
    _1545 = WaveReadLaneFirst(_materialIndex);
    _1554 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1545 < (uint)170000), _1545, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.x);
    _1555 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1545 < (uint)170000), _1545, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseOffset.y);
    _1558 = WaveReadLaneFirst(_materialIndex);
    _1566 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1558 < (uint)170000), _1558, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseTexture);
    _1575 = WaveReadLaneFirst(_materialIndex);
    _1583 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1575 < (uint)170000), _1575, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderSmoothness);
    _1584 = WaveReadLaneFirst(_materialIndex);
    _1592 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1584 < (uint)170000), _1584, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderWidth);
    _1598 = (1.0f - _1592) * 0.5f;
    _1601 = max((abs(TEXCOORD.x + -0.5f) - _1598), 0.0f);
    _1602 = max((abs(TEXCOORD.y + -0.5f) - _1598), 0.0f);
    _1611 = 1.0f - ((1.0f - saturate(sqrt((_1602 * _1602) + (_1601 * _1601)) / _1583)) * 2.0f);
    _1612 = WaveReadLaneFirst(_materialIndex);
    _1620 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1612 < (uint)170000), _1612, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerSpeed);
    if (_1620 > 0.0010000000474974513f) {
      _1623 = WaveReadLaneFirst(_materialIndex);
      _1632 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1623 < (uint)170000), _1623, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.x);
      _1633 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1623 < (uint)170000), _1623, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerOpacityMinMax.y);
      _1641 = WaveReadLaneFirst(_materialIndex);
      _1649 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1641 < (uint)170000), _1641, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderFlickerIntensity);
      _1653 = ((min(max(sin((_1620 * 3.1415927410125732f) * _time.x), _1632), _1633) * _1611) * _1649);
    } else {
      _1653 = _1611;
    }
    _1655 = WaveReadLaneFirst(_materialIndex);
    _1663 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1655 < (uint)170000), _1655, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderEdgeNoiseRatio);
    _1669 = min(max(_1529, 0.0f), 1.0f) * saturate(saturate(_1653) - (_1663 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1566 < (uint)65000), _1566, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1554 + (_1541 * TEXCOORD.x)), (_1555 + (_1542 * TEXCOORD.y)))))).x)));
    _1670 = WaveReadLaneFirst(_materialIndex);
    _1678 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1670 < (uint)170000), _1670, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._borderColor);
    _1681 = (float)((uint)((uint)(((uint)(_1678) >> 16) & 255)));
    _1684 = (float)((uint)((uint)(((uint)(_1678) >> 8) & 255)));
    _1686 = (float)((uint)((uint)(_1678 & 255)));
    _1711 = select(((_1681 * 0.003921568859368563f) < 0.040449999272823334f), (_1681 * 0.0003035269910469651f), exp2(log2((_1681 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1718 = _1427 && ((_isPhotosensitiveMode_isAllolwBlood & 1) == 0);
    _1719 = _1711 * 0.4000000059604645f;
    _1726 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1740 = ((((select(_1718, _1719, _1711) * _1726) - _1518) * _1669) + _1518);
    _1741 = ((((select(_1718, _1719, select(((_1684 * 0.003921568859368563f) < 0.040449999272823334f), (_1684 * 0.0003035269910469651f), exp2(log2((_1684 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1726) - _1519) * _1669) + _1519);
    _1742 = ((((select(_1718, _1719, select(((_1686 * 0.003921568859368563f) < 0.040449999272823334f), (_1686 * 0.0003035269910469651f), exp2(log2((_1686 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1726) - _1520) * _1669) + _1520);
  } else {
    _1740 = _1518;
    _1741 = _1519;
    _1742 = _1520;
  }
  [branch]
  if (!(!(_57 >= 0.0010000000474974513f))) {
    _1745 = TEXCOORD.x + -0.5f;
    _1746 = TEXCOORD.y + -0.5f;
    _1751 = WaveReadLaneFirst(_materialIndex);
    _1759 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1751 < (uint)170000), _1751, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius2);
    _1765 = WaveReadLaneFirst(_materialIndex);
    _1773 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1765 < (uint)170000), _1765, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower2);
  // [sem: expr_sat]
    _1778 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * _1773) * (sqrt((_1746 * _1746) + (_1745 * _1745)) / max(0.0010000000474974513f, (1.0f - _1759))));
    _1783 = saturate(_57 * 10.0f) * saturate(_1778 * 2.0f);  // [sem: expr_sat]
    _1790 = (_1783 * (_473 - _1740)) + _1740;
    _1791 = (_1783 * (_474 - _1741)) + _1741;
    _1792 = (_1783 * (_475 - _1742)) + _1742;
    _1793 = WaveReadLaneFirst(_materialIndex);
    _1801 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1793 < (uint)170000), _1793, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor2);
    _1804 = (float)((uint)((uint)(((uint)(_1801) >> 16) & 255)));
    _1807 = (float)((uint)((uint)(((uint)(_1801) >> 8) & 255)));
    _1809 = (float)((uint)((uint)(_1801 & 255)));
    _1834 = select(((_1804 * 0.003921568859368563f) < 0.040449999272823334f), (_1804 * 0.0003035269910469651f), exp2(log2((_1804 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1841 = _1427 && ((_isPhotosensitiveMode_isAllolwBlood & 1) == 0);
    _1842 = _1834 * 0.20000000298023224f;
    _1849 = max(0.0010000000474974513f, _exposure0.x);
    _1856 = saturate(_1778) * _57;
    _1864 = ((((select(_1841, _1842, _1834) / _1849) - _1790) * _1856) + _1790);
    _1865 = ((((select(_1841, _1842, select(((_1807 * 0.003921568859368563f) < 0.040449999272823334f), (_1807 * 0.0003035269910469651f), exp2(log2((_1807 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1849) - _1791) * _1856) + _1791);
    _1866 = ((((select(_1841, _1842, select(((_1809 * 0.003921568859368563f) < 0.040449999272823334f), (_1809 * 0.0003035269910469651f), exp2(log2((_1809 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1849) - _1792) * _1856) + _1792);
  } else {
    _1864 = _1740;
    _1865 = _1741;
    _1866 = _1742;
  }
  [branch]
  if (!(!(_48 >= 0.0010000000474974513f))) {
    _1869 = TEXCOORD.x + -0.5f;
    _1870 = TEXCOORD.y + -0.5f;
    _1875 = WaveReadLaneFirst(_materialIndex);
    _1883 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1875 < (uint)170000), _1875, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius1);
    _1888 = WaveReadLaneFirst(_materialIndex);
    _1896 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1888 < (uint)170000), _1888, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower1);
  // [sem: expr_sat]
    _1901 = saturate(exp2(log2(1.0f - TEXCOORD.y) * _1896) * (sqrt((_1870 * _1870) + (_1869 * _1869)) / max(0.0010000000474974513f, (1.0f - _1883))));
    _1904 = saturate(_48 * 10.0f) * _1901;
    _1911 = (_1904 * (_473 - _1864)) + _1864;
    _1912 = (_1904 * (_474 - _1865)) + _1865;
    _1913 = (_1904 * (_475 - _1866)) + _1866;
    _1914 = WaveReadLaneFirst(_materialIndex);
    _1922 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1914 < (uint)170000), _1914, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor1);
    _1925 = (float)((uint)((uint)(((uint)(_1922) >> 16) & 255)));
    _1928 = (float)((uint)((uint)(((uint)(_1922) >> 8) & 255)));
    _1930 = (float)((uint)((uint)(_1922 & 255)));
    _1955 = select(((_1925 * 0.003921568859368563f) < 0.040449999272823334f), (_1925 * 0.0003035269910469651f), exp2(log2((_1925 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _1962 = _1427 && ((_isPhotosensitiveMode_isAllolwBlood & 1) == 0);
    _1963 = _1955 * 0.20000000298023224f;
    _1970 = max(0.0010000000474974513f, _exposure0.x);
    _1977 = saturate(_1901) * _48;
    _1985 = ((((select(_1962, _1963, _1955) / _1970) - _1911) * _1977) + _1911);
    _1986 = ((((select(_1962, _1963, select(((_1928 * 0.003921568859368563f) < 0.040449999272823334f), (_1928 * 0.0003035269910469651f), exp2(log2((_1928 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1970) - _1912) * _1977) + _1912);
    _1987 = ((((select(_1962, _1963, select(((_1930 * 0.003921568859368563f) < 0.040449999272823334f), (_1930 * 0.0003035269910469651f), exp2(log2((_1930 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1970) - _1913) * _1977) + _1913);
  } else {
    _1985 = _1864;
    _1986 = _1865;
    _1987 = _1866;
  }
  [branch]
  if (!(!(_66 >= 0.0010000000474974513f))) {
    _1990 = TEXCOORD.x + -0.5f;
    _1991 = TEXCOORD.y + -0.5f;
    _1996 = WaveReadLaneFirst(_materialIndex);
    _2004 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1996 < (uint)170000), _1996, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteRadius3);
    _2008 = WaveReadLaneFirst(_materialIndex);
    _2016 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2008 < (uint)170000), _2008, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignettePower3);
  // [sem: expr_sat]
    _2021 = saturate((pow(TEXCOORD.y, _2016)) * (sqrt((_1991 * _1991) + (_1990 * _1990)) / max(0.0010000000474974513f, (1.0f - _2004))));
    _2024 = saturate(_66 * 10.0f) * _2021;
    _2031 = (_2024 * (_473 - _1985)) + _1985;
    _2032 = (_2024 * (_474 - _1986)) + _1986;
    _2033 = (_2024 * (_475 - _1987)) + _1987;
    _2034 = WaveReadLaneFirst(_materialIndex);
    _2042 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2034 < (uint)170000), _2034, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._statusVignetteColor3);
    _2045 = (float)((uint)((uint)(((uint)(_2042) >> 16) & 255)));
    _2048 = (float)((uint)((uint)(((uint)(_2042) >> 8) & 255)));
    _2050 = (float)((uint)((uint)(_2042 & 255)));
    _2075 = select(((_2045 * 0.003921568859368563f) < 0.040449999272823334f), (_2045 * 0.0003035269910469651f), exp2(log2((_2045 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2082 = _1427 && ((_isPhotosensitiveMode_isAllolwBlood & 1) == 0);
    _2083 = _2075 * 0.20000000298023224f;
    _2090 = max(0.0010000000474974513f, _exposure0.x);
    _2097 = saturate(_2021) * _66;
    _2105 = ((((select(_2082, _2083, _2075) / _2090) - _2031) * _2097) + _2031);
    _2106 = ((((select(_2082, _2083, select(((_2048 * 0.003921568859368563f) < 0.040449999272823334f), (_2048 * 0.0003035269910469651f), exp2(log2((_2048 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2090) - _2032) * _2097) + _2032);
    _2107 = ((((select(_2082, _2083, select(((_2050 * 0.003921568859368563f) < 0.040449999272823334f), (_2050 * 0.0003035269910469651f), exp2(log2((_2050 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2090) - _2033) * _2097) + _2033);
  } else {
    _2105 = _1985;
    _2106 = _1986;
    _2107 = _1987;
  }
  [branch]
  if (!(!(_hideStateRatio >= 0.0010000000474974513f))) {
    _2112 = _hideStateRatio * 0.5f;
    _2113 = TEXCOORD.x + -0.5f;
    _2114 = TEXCOORD.y + -0.5f;
    _2122 = saturate(((_2112 + -0.5f) + sqrt((_2114 * _2114) + (_2113 * _2113))) * 2.0f);  // [sem: expr_sat]
    _2130 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2122) * 0.5f) + _2122);  // [sem: expr_sat]
    _2138 = (((_2130 * _2130) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2130 * 2.0f));
    _2141 = dot(float3(_2105, _2106, _2107), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2112);
    _2144 = (pow(_2138, 0.5f));
    _2151 = ((_2141 - _2105) * _2144) + _2105;
    _2152 = ((_2141 - _2106) * _2144) + _2106;
    _2153 = ((_2141 - _2107) * _2144) + _2107;
    _2157 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2168 = (lerp(_2151, _2157, _2138));  // [sem: blended]
    _2169 = (lerp(_2152, _2157, _2138));  // [sem: blended]
    _2170 = (lerp(_2153, _2157, _2138));  // [sem: blended]
  } else {
    _2168 = _2105;  // [sem: blended]
    _2169 = _2106;  // [sem: blended]
    _2170 = _2107;  // [sem: blended]
  }
  if (_followLearning > 0.0010000000474974513f) {
    _2175 = WaveReadLaneFirst(_materialIndex);
    _2183 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2175 < (uint)170000), _2175, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningColor);
    _2186 = (float)((uint)((uint)(((uint)(_2183) >> 16) & 255)));
    _2189 = (float)((uint)((uint)(((uint)(_2183) >> 8) & 255)));
    _2191 = (float)((uint)((uint)(_2183 & 255)));
    _2221 = max(0.0010000000474974513f, _exposure0.x);
    _2222 = select(((_2186 * 0.003921568859368563f) < 0.040449999272823334f), (_2186 * 0.0003035269910469651f), exp2(log2((_2186 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2221;
    _2223 = select(((_2189 * 0.003921568859368563f) < 0.040449999272823334f), (_2189 * 0.0003035269910469651f), exp2(log2((_2189 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2221;
    _2224 = select(((_2191 * 0.003921568859368563f) < 0.040449999272823334f), (_2191 * 0.0003035269910469651f), exp2(log2((_2191 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2221;
    _2225 = WaveReadLaneFirst(_materialIndex);
    _2233 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2225 < (uint)170000), _2225, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningNoiseTex);
    _2244 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_253 < (uint)65000), _253, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_237, ((_time.x * 0.20000000298023224f) + _238)));
    _2251 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238));  // [sem: _3__36__0__0__g_depth_sample]
    _2254 = (_237 * 2.0f) + -1.0f;
    _2256 = 1.0f - (_238 * 2.0f);
    _2257 = max(1.0000000116860974e-07f, _2251.x);  // [sem: _3__36__0__0__g_depth_sample_derived]
    _2293 = mad((_invViewProj[2].w), _2257, mad((_invViewProj[1].w), _2256, ((_invViewProj[0].w) * _2254))) + (_invViewProj[3].w);
    _2302 = uint(_bufferSizeAndInvSize.x * _237);
    _2303 = uint(_bufferSizeAndInvSize.y * _238);
    _2305 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_2302, _2303, 0));  // [sem: _3__36__0__0__g_gbufferBaseColor_load]
    _2308 = __3__36__0__0__g_gbufferNormal.Load(int3(_2302, _2303, 0));  // [sem: _3__36__0__0__g_gbufferNormal_load]
    _2326 = (saturate(_2308.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
    _2327 = (saturate(_2308.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
    _2328 = (saturate(_2308.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
    _2330 = rsqrt(dot(float3(_2326, _2327, _2328), float3(_2326, _2327, _2328)));  // [sem: invLength]
    _2331 = _2330 * _2326;
    _2332 = _2330 * _2327;
    _2333 = _2328 * _2330;
    _2336 = (((float)((uint)((uint)(((uint)((uint)(_2305.w)) >> 8) & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
    _2337 = (((float)((uint)((uint)(_2305.w & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
    _2340 = (_2336 + _2337) * 0.5f;
    _2341 = (_2336 - _2337) * 0.5f;
    _2345 = (1.0f - abs(_2340)) - abs(_2341);
    _2347 = rsqrt(dot(float3(_2340, _2341, _2345), float3(_2340, _2341, _2345)));  // [sem: invLength]
    _2348 = _2347 * _2340;
    _2349 = _2347 * _2341;
    _2350 = _2347 * _2345;
    _2352 = select((_2333 >= 0.0f), 1.0f, -1.0f);
    _2355 = -0.0f - (1.0f / (_2352 + _2333));
    _2356 = _2332 * _2355;
    _2357 = _2356 * _2331;
    _2358 = _2352 * _2331;
    _2367 = mad(_2350, _2331, mad(_2349, _2357, ((((_2358 * _2331) * _2355) + 1.0f) * _2348)));
    _2371 = mad(_2350, _2332, mad(_2349, (_2352 + (_2356 * _2332)), ((_2348 * _2352) * _2357)));
    _2375 = mad(_2350, _2333, mad(_2349, (-0.0f - _2332), (-0.0f - (_2358 * _2348))));
    _2377 = rsqrt(dot(float3(_2367, _2371, _2375), float3(_2367, _2371, _2375)));  // [sem: invLength]
    _2379 = _2377 * _2371;
    _2380 = _2377 * _2375;
    _2383 = _time.x * 0.5f;
    _2386 = (((mad((_invViewProj[2].z), _2257, mad((_invViewProj[1].z), _2256, ((_invViewProj[0].z) * _2254))) + (_invViewProj[3].z)) / _2293) - _2383) * 0.20000000298023224f;
    _2387 = (((mad((_invViewProj[2].y), _2257, mad((_invViewProj[1].y), _2256, ((_invViewProj[0].y) * _2254))) + (_invViewProj[3].y)) / _2293) - _2383) * 0.20000000298023224f;
    _2394 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2233 < (uint)65000), _2233, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2386, _2387));
    _2397 = (((mad((_invViewProj[2].x), _2257, mad((_invViewProj[1].x), _2256, ((_invViewProj[0].x) * _2254))) + (_invViewProj[3].x)) / _2293) - _2383) * 0.20000000298023224f;
    _2406 = (abs(_2379) * ((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2233 < (uint)65000), _2233, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2397, _2386)))).w) - _2394.w)) + _2394.w;
    _2409 = (((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2233 < (uint)65000), _2233, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2397, _2387)))).w) - _2406) * abs(_2380)) + _2406;
    _2410 = _2244.z + -0.5f;
    _2415 = _237 + -0.5f;
    _2417 = _238 + -0.5f;
    _2422 = 0.375f - (_2410 * 0.25f);
    _2425 = max((abs(((_2244.x + -0.5f) * 0.10000000149011612f) + _2415) - _2422), 0.0f);
    _2426 = max((abs(((_2244.y + -0.5f) * 0.10000000149011612f) + _2417) - _2422), 0.0f);
    _2431 = saturate(sqrt((_2426 * _2426) + (_2425 * _2425)));  // [sem: expr_sat]
    _2435 = saturate(_followLearning * 2.0f);  // [sem: expr_sat]
    _2441 = saturate(((((_2251.x * 100.0f) * _2435) - _2409) * 2.0f) + -0.5f);  // [sem: expr_sat]
    _2451 = sqrt((_2417 * _2417) + (_2415 * _2415));
    _2454 = ((saturate((_2435 * 2.0f) + -1.0f) * (1.0f - _2441)) + _2441) * saturate(_2451 + 0.5f);
    _2456 = atan(_2417 / _2415);
    _2459 = (_2415 < 0.0f);
    _2460 = (_2415 == 0.0f);
    _2461 = (_2417 >= 0.0f);
    _2462 = (_2417 < 0.0f);
    _2474 = _2409 * 0.5f;
    _2487 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2233 < (uint)65000), _2233, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2410 * -0.5f) - _2474) - (_time.x * 0.20000000298023224f)) + select((_2460 && _2461), 7.5f, select((_2460 && _2462), -7.5f, (select((_2459 && _2462), (_2456 + -3.1415927410125732f), select((_2459 && _2461), (_2456 + 3.1415927410125732f), _2456)) * 4.774648189544678f)))), (((((_2244.w + -0.5f) * -0.5f) - _2474) + (_2451 * 2.0f)) - (_time.x * 1.5f))));
    if (!(_964 == _renderPassSelfPlayer)) {
      _2522 = (_964 == _renderPassTest);
    } else {
      _2522 = true;
    }
    _2523 = !((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_237, _238))).x))) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _237), int(_customRenderPassSizeInvSize.y * _238), 0)))).x)))))) == 0.0f);
    _2525 = _2523 || (!_2522);
    if (_964 == _renderPassTargetFocus) {
      if (_2523) {
        _2539 = (_964 != _renderPassAimHighlight);
      } else {
        _2539 = false;
      }
    } else {
      if (_2523 || (_964 != _renderPassLearning)) {
        _2539 = (_964 != _renderPassAimHighlight);
      } else {
        _2539 = false;
      }
    }
    _2541 = saturate(_followLearning * 4.0f);  // [sem: expr_sat]
    _2548 = (_2541 * (_241.x - _2168)) + _2168;
    _2549 = (_2541 * (_241.y - _2169)) + _2169;
    _2550 = (_2541 * (_241.z - _2170)) + _2170;
    _2551 = _2525 && _2539;
    if (_2551) {
      _2558 = ((_followLearning * 0.25f) * _2487.w) * saturate(_2451 - (_2541 * 0.20000000298023224f));
  // [sem: _3__36__0__0__g_sceneColor_sample]
      _2562 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2558 + _237), (_2558 + _238)));
      _2576 = 1.0f - (_followLearning * 0.75f);
      _2586 = ((lerp(_2548, _2562.x, _2541)) * _2576);
      _2587 = ((lerp(_2549, _2562.y, _2541)) * _2576);
      _2588 = ((lerp(_2550, _2562.z, _2541)) * _2576);
      _2589 = _2454;
    } else {
      if (_2525) {
        _2586 = _2548;
        _2587 = _2549;
        _2588 = _2550;
        _2589 = select(_2539, _2454, 0.0f);
      } else {
        _2586 = _2548;
        _2587 = _2549;
        _2588 = _2550;
        _2589 = (_2454 * 0.4000000059604645f);
      }
    }
    _2590 = dot(float3(_2586, _2587, _2588), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _2597 = ((_2590 - _2586) * _2589) + _2586;
    _2598 = ((_2590 - _2587) * _2589) + _2587;
    _2599 = ((_2590 - _2588) * _2589) + _2588;
    _2601 = _2409 * (_2244.z * 0.30000001192092896f);
    _2607 = saturate(_2589 * 5.0f) * 0.8999999761581421f;
    _2614 = (((_2601 * _2222) - _2597) * _2607) + _2597;
    _2615 = (((_2601 * _2223) - _2598) * _2607) + _2598;
    _2616 = (((_2601 * _2224) - _2599) * _2607) + _2599;
    _2617 = WaveReadLaneFirst(_materialIndex);
    _2625 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2617 < (uint)170000), _2617, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._followLearningSaturationTone);
    _2628 = (float)((uint)((uint)(((uint)(_2625) >> 16) & 255)));
    _2631 = (float)((uint)((uint)(((uint)(_2625) >> 8) & 255)));
    _2633 = (float)((uint)((uint)(_2625 & 255)));
    _2658 = select(((_2628 * 0.003921568859368563f) < 0.040449999272823334f), (_2628 * 0.0003035269910469651f), exp2(log2((_2628 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2659 = select(((_2631 * 0.003921568859368563f) < 0.040449999272823334f), (_2631 * 0.0003035269910469651f), exp2(log2((_2631 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2660 = select(((_2633 * 0.003921568859368563f) < 0.040449999272823334f), (_2633 * 0.0003035269910469651f), exp2(log2((_2633 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _2664 = (1.0f - _2658) * 0.3086000084877014f;
    _2666 = (1.0f - _2659) * 0.6093999743461609f;
    _2668 = (1.0f - _2660) * 0.0820000022649765f;
    _2673 = _2664 * _2614;
    _2686 = (_followLearning * (mad(_2616, _2668, mad(_2615, _2666, ((_2664 + _2658) * _2614))) - _2614)) + _2614;
    _2687 = (_followLearning * (mad(_2616, _2668, mad(_2615, (_2666 + _2659), _2673)) - _2615)) + _2615;
    _2688 = (_followLearning * (mad(_2616, (_2668 + _2660), mad(_2615, _2666, _2673)) - _2616)) + _2616;
    if (!_2551) {
  // [sem: expr_sat]
      _2702 = saturate(1.0f - dot(float3((_2474 + (_2377 * _2367)), (_2474 + _2379), (_2474 + _2380)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      _2707 = select(_2525, ((_2702 * _2702) * 6.0f), (_2702 * 0.25f)) * _2702;
      _2711 = (_followLearning * _followLearning) * saturate(_2409 * 10.0f);
      _2722 = (((_2711 * _2222) * _2707) + _2686);
      _2723 = (((_2711 * _2223) * _2707) + _2687);
      _2724 = (((_2711 * _2224) * _2707) + _2688);
    } else {
      _2722 = _2686;
      _2723 = _2687;
      _2724 = _2688;
    }
    _2725 = _followLearning * _2431;
    _2729 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2736 = ((_2729 - _2722) * _2725) + _2722;
    _2737 = ((_2729 - _2723) * _2725) + _2723;
    _2738 = ((_2729 - _2724) * _2725) + _2724;
    _2743 = saturate(((_2487.w * _2487.w) * 20.0f) * _followLearning) * _2431;
    _2754 = (lerp(_2736, _2222, _2743));  // [sem: blended]
    _2755 = (lerp(_2737, _2223, _2743));  // [sem: blended]
    _2756 = (lerp(_2738, _2224, _2743));  // [sem: blended]
  } else {
    _2754 = _2168;  // [sem: blended]
    _2755 = _2169;  // [sem: blended]
    _2756 = _2170;  // [sem: blended]
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    _2776 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
    _2782 = max(0.0010000000474974513f, _exposure0.x);
    _2799 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_253 < (uint)65000), _253, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _34), ((_time.x * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    _2802 = _2799.x + -0.5f;
    _2803 = _2799.y + -0.5f;
    _2813 = 0.44999998807907104f - (_2802 * 0.004999999888241291f);
    _2816 = max((abs((TEXCOORD.x + -0.5f) + (_2802 * 0.019999999552965164f)) - _2813), 0.0f);
    _2817 = max((abs((TEXCOORD.y + -0.5f) + (_2803 * 0.019999999552965164f)) - _2813), 0.0f);
    _2828 = WaveReadLaneFirst(_materialIndex);
    _2836 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2828 < (uint)170000), _2828, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._enemyAlertTex);
    _2843 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2836 < (uint)65000), _2836, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_2803 * 0.029999999329447746f)), (TEXCOORD.y - (_2802 * 0.029999999329447746f))));
    _2848 = (TEXCOORD.y > 0.5f);
    _2850 = (TEXCOORD.x < 0.5f);
    _2854 = (TEXCOORD.y < 0.5f);
    _2862 = (TEXCOORD.x > 0.5f);
  // [sem: expr_sat]
    _2886 = saturate(dot(float4((_2843.x * ((float)((bool)_2854))), (_2843.y * ((float)((bool)((uint)(_2862 && _2854))))), (_2843.z * ((float)((bool)_2862))), (_2843.w * ((float)((bool)((uint)(_2862 && _2848)))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_2843.x * ((float)((bool)_2848))), (_2843.y * ((float)((bool)((uint)(_2850 && _2848))))), (_2843.z * ((float)((bool)_2850))), (_2843.w * ((float)((bool)((uint)(_2850 && _2854)))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_2817 * _2817) + (_2816 * _2816)) * 20.0f);
    _2888 = (_2886 * _2886) * _2886;
    _2899 = ((_2888 * ((select(_2776, 0.09989875555038452f, 0.08437622338533401f) / _2782) - _2754)) + _2754);
    _2900 = ((_2888 * ((select(_2776, 0.027320895344018936f, 0.030713455751538277f) / _2782) - _2755)) + _2755);
    _2901 = ((_2888 * ((select(_2776, 0.04817182570695877f, 0.07036010921001434f) / _2782) - _2756)) + _2756);
  } else {
    _2899 = _2754;
    _2900 = _2755;
    _2901 = _2756;
  }
  _2902 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _2915 = (((float)((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _2902, 0)))).x) & 127)))) + 0.5f);
  } else {
    _2915 = 1.0f;
  }
  _2918 = (_localToneMappingParams.w > 0.0f);
  if (_2918) {
    _2924 = _userImageAdjust.z * _exposure0.x;
    _2973 = exp2(log2(max(0.0f, (((_2924 * max(0.0f, (((_2899 * 1.705049991607666f) - (_2900 * 0.6217899918556213f)) - (_2901 * 0.08325999975204468f)))) * _slopeParams.x) + _offsetParams.x))) * _powerParams.x);
    _2974 = exp2(log2(max(0.0f, (((max(0.0f, (((_2900 * 1.1407999992370605f) - (_2899 * 0.13026000559329987f)) - (_2901 * 0.01054999977350235f))) * _2924) * _slopeParams.y) + _offsetParams.y))) * _powerParams.y);
    _2975 = exp2(log2(max(0.0f, (((max(0.0f, (((_2899 * -0.024000000208616257f) - (_2900 * 0.12896999716758728f)) + (_2901 * 1.1529699563980103f))) * _2924) * _slopeParams.z) + _offsetParams.z))) * _powerParams.z);
    _2977 = dot(float3(_2973, _2974, _2975), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    _2984 = ((_2973 - _2977) * _powerParams.w) + _2977;
    _2985 = ((_2974 - _2977) * _powerParams.w) + _2977;
    _2986 = ((_2975 - _2977) * _powerParams.w) + _2977;
    _3005 = min(max(log2(mad(_2986, 0.07922374457120895f, mad(_2985, 0.07843360304832458f, (_2984 * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _3006 = min(max(log2(mad(_2986, 0.07916612923145294f, mad(_2985, 0.8784686326980591f, (_2984 * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _3007 = min(max(log2(mad(_2986, 0.8791429996490479f, mad(_2985, 0.07843360304832458f, (_2984 * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _3008 = _3005 * 0.06060606241226196f;
    _3009 = _3006 * 0.06060606241226196f;
    _3010 = _3007 * 0.06060606241226196f;
    _3011 = _3008 * _3008;
    _3012 = _3009 * _3009;
    _3013 = _3010 * _3010;
    _3059 = min(0.0f, (-0.0f - (((_3005 * 0.007218181621283293f) + ((_3011 * 0.42980000376701355f) + (((_3011 * _3011) * ((31.959999084472656f - (_3005 * 2.432727336883545f)) + (_3011 * 15.5f))) - ((_3005 * 0.41624245047569275f) * _3011)))) + -0.002319999970495701f)));
    _3060 = min(0.0f, (-0.0f - (((_3006 * 0.007218181621283293f) + ((_3012 * 0.42980000376701355f) + (((_3012 * _3012) * ((31.959999084472656f - (_3006 * 2.432727336883545f)) + (_3012 * 15.5f))) - ((_3006 * 0.41624245047569275f) * _3012)))) + -0.002319999970495701f)));
    _3061 = min(0.0f, (-0.0f - (((_3007 * 0.007218181621283293f) + ((_3013 * 0.42980000376701355f) + (((_3013 * _3013) * ((31.959999084472656f - (_3007 * 2.432727336883545f)) + (_3013 * 15.5f))) - ((_3007 * 0.41624245047569275f) * _3013)))) + -0.002319999970495701f)));
    _3062 = -0.0f - _3059;
    _3063 = -0.0f - _3060;
    _3064 = -0.0f - _3061;
    _3065 = dot(float3(_3062, _3063, _3064), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    if (_nightToneParm == 1) {
      _3082 = exp2(exp2(log2(abs((_time.w * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f;
      _3083 = -0.7999999523162842f / _3082;
      _3084 = -1.2000000476837158f / _3082;
      _3085 = 0.20000004768371582f / _3082;
      _3091 = saturate((_exposure2.x + -0.6000000238418579f) * 0.10638298094272614f);  // [sem: expr_sat]
      _3094 = saturate((_exposure2.x + -0.10000000149011612f) * 2.0f);  // [sem: expr_sat]
      _3101 = (_3083 + 1.399999976158142f) + (_3094 * (-0.3999999761581421f - _3083));
      _3102 = (_3084 + 1.600000023841858f) + (_3094 * (-0.6000000238418579f - _3084));
      _3103 = (_3085 + 0.8999999761581421f) + (_3094 * (0.5f - _3085));
      _3120 = (lerp(_3102, 1.2000000476837158f, _3091));  // [sem: blended]
      _3121 = (lerp(_3101, 1.0f, _3091));  // [sem: blended]
      _3122 = (lerp(_3103, 1.399999976158142f, _3091));  // [sem: blended]
    } else {
      _3120 = ((saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f) + 1.0f);  // [sem: blended]
      _3121 = 1.0f;  // [sem: blended]
      _3122 = 1.399999976158142f;  // [sem: blended]
    }
    _3132 = 1.0f - _3120;
    _3157 = ((exp2(log2(((saturate((_3059 * _3059) * _3062) * _3132) + _3120) * _3062) * _3121) - _3065) * _3122) + _3065;
    _3158 = ((exp2(log2(((saturate((_3060 * _3060) * _3063) * _3132) + _3120) * _3063) * _3121) - _3065) * _3122) + _3065;
    _3159 = ((exp2(log2(((saturate((_3061 * _3061) * _3064) * _3132) + _3120) * _3064) * _3121) - _3065) * _3122) + _3065;
  // [sem: expr_sat]
    _3178 = saturate(exp2(log2(mad(_3159, -0.09902974218130112f, mad(_3158, -0.09802088141441345f, (_3157 * 1.1968790292739868f)))) * 2.200000047683716f));
  // [sem: expr_sat]
    _3179 = saturate(exp2(log2(mad(_3159, -0.09896117448806763f, mad(_3158, 1.1519031524658203f, (_3157 * -0.052896853536367416f)))) * 2.200000047683716f));
  // [sem: expr_sat]
    _3180 = saturate(exp2(log2(mad(_3159, 1.151073694229126f, mad(_3158, -0.09804344922304153f, (_3157 * -0.05297163501381874f)))) * 2.200000047683716f));
    if (_etcParams.z == 0.0f) {
      _3186 = 1.0f - abs(_etcParams.w);
      _3190 = saturate(_etcParams.w);  // [sem: expr_sat]
      _3191 = (_3186 * _3178) + _3190;
      _3192 = (_3186 * _3179) + _3190;
      _3193 = (_3186 * _3180) + _3190;
      if (_colorGradingParams.w > 0.0f) {
        _3198 = saturate(_colorGradingParams.w);  // [sem: expr_sat]
        _3215 = (((max(0.0f, (1.0f - _3191)) - _3191) * _3198) + _3191);
        _3216 = (((max(0.0f, (1.0f - _3192)) - _3192) * _3198) + _3192);
        _3217 = (((max(0.0f, (1.0f - _3193)) - _3193) * _3198) + _3193);
      } else {
        _3215 = _3191;
        _3216 = _3192;
        _3217 = _3193;
      }
      _3223 = _userImageAdjust.y + 1.0f;
      _3227 = _userImageAdjust.x + 0.5f;
      _3228 = ((_3215 + -0.5f) * _3223) + _3227;
      _3229 = ((_3216 + -0.5f) * _3223) + _3227;
      _3230 = ((_3217 + -0.5f) * _3223) + _3227;
      _3233 = min((int)(max((int)(_colorBlindParam), (int)(0))), (int)(3));
      [branch]
      if (_3233 == 1) {
        _3261 = mad(0.20000000298023224f, _3229, (_3228 * 0.800000011920929f));
        _3262 = mad(0.7416700124740601f, _3229, (_3228 * 0.25832998752593994f));
        _3263 = mad(0.8583300113677979f, _3230, mad(0.14167000353336334f, _3229, 0.0f));
      } else {
        if (_3233 == 2) {
          _3261 = mad(0.1833299994468689f, _3229, (_3228 * 0.8166700005531311f));
          _3262 = mad(0.666670024394989f, _3229, (_3228 * 0.3333300054073334f));
          _3263 = mad(0.875f, _3230, mad(0.125f, _3229, 0.0f));
        } else {
          if (_3233 == 3) {
            _3261 = mad(0.033330000936985016f, _3229, (_3228 * 0.9666699767112732f));
            _3262 = mad(0.26666998863220215f, _3230, mad(0.7333300113677979f, _3229, 0.0f));
            _3263 = mad(0.8166700005531311f, _3230, mad(0.1833299994468689f, _3229, 0.0f));
          } else {
            _3261 = _3228;
            _3262 = _3229;
            _3263 = _3230;
          }
        }
      }
      _3272 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
      _3283 = exp2(log2(saturate(_3261)) * _3272);
      _3284 = exp2(log2(saturate(_3262)) * _3272);
      _3285 = exp2(log2(saturate(_3263)) * _3272);
    } else {
      _3283 = _3178;
      _3284 = _3179;
      _3285 = _3180;
    }
  } else {
    _3283 = _2899;
    _3284 = _2900;
    _3285 = _2901;
  }
  // RenoDX: >>> [Patch: TonemapReplacementSDR] [Version: 1.10]
  // Description: The 1.10 psPostProcessCompositeMaterial shader is an observed active successor for the 1.09 SDR composite/material tonemap path. The native branch above uses the same AP1 scene-color inputs as the historical material remaps; this patch overwrites that branch output with TonemapReplacer at that pre-output point so tuned RenoDX SDR exposure, contrast, saturation, blowout, auto-exposure, and tonemap behavior match 1.09 instead of being approximated after final output.
  if (_2918) {
    float3 _rndx_output_color = TonemapReplacer(float3(_2899, _2900, _2901));
    _3283 = _rndx_output_color.x;
    _3284 = _rndx_output_color.y;
    _3285 = _rndx_output_color.z;
  }
  // RenoDX: <<< [Patch: TonemapReplacementSDR]
  // RenoDX: >>> [Patch: BasicPostProcessFilmGrain] [Version: 1.10]
  // Description: The 1.10 composite material postprocess successor can become the active final-output path, bypassing the standalone final shader. This patch applies the existing RenoDX custom film grain only when the basic postprocess final flag has selected this composite material path, preserving the shipped 1.09 direct-output behavior.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f && CUSTOM_FILM_GRAIN_TYPE != 0) {
    float3 _rndx_postprocess_color = renodx::effects::ApplyFilmGrain(float3(_3283, _3284, _3285), TEXCOORD, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    _3283 = _rndx_postprocess_color.x;
    _3284 = _rndx_postprocess_color.y;
    _3285 = _rndx_postprocess_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFilmGrain]
  if (_etcParams.y > 1.0f) {
    _3294 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _3295 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    // RenoDX: >>> [Patch: BasicPostProcessVignette] [Version: 1.10]
    // Description: This composite material path applies its own output vignette from `_etcParams.y`. When it is the selected basic postprocess final path, this patch multiplies the native vignette strength by the existing RenoDX vignette control so direct-output composite material variants match 1.09 behavior.
    float _rndx_vignette_strength = saturate(_etcParams.y + -1.0f);
    if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
      _rndx_vignette_strength *= CUSTOM_VIGNETTE;
    }
    _3299 = saturate(1.0f - (dot(float2(_3294, _3295), float2(_3294, _3295)) * _rndx_vignette_strength));  // [sem: expr_sat]
    // RenoDX: <<< [Patch: BasicPostProcessVignette]
    _3304 = (_3299 * _3283);
    _3305 = (_3299 * _3284);
    _3306 = (_3299 * _3285);
  } else {
    _3304 = _3283;
    _3305 = _3284;
    _3306 = _3285;
  }
  if (_2918 && (_etcParams.z > 0.0f)) {
    _3336 = select((_3304 <= 0.0031308000907301903f), (_3304 * 12.920000076293945f), (((pow(_3304, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3337 = select((_3305 <= 0.0031308000907301903f), (_3305 * 12.920000076293945f), (((pow(_3305, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3338 = select((_3306 <= 0.0031308000907301903f), (_3306 * 12.920000076293945f), (((pow(_3306, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3336 = _3304;
    _3337 = _3305;
    _3338 = _3306;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    _3343 = (float)((uint)_2902);
    if (!(_3343 < _viewDir.w)) {
      if (!(_3343 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _3352 = _3336;
        _3353 = _3337;
        _3354 = _3338;
      } else {
        _3352 = 0.0f;
        _3353 = 0.0f;
        _3354 = 0.0f;
      }
    } else {
      _3352 = 0.0f;
      _3353 = 0.0f;
      _3354 = 0.0f;
    }
  } else {
    _3352 = _3336;
    _3353 = _3337;
    _3354 = _3338;
  }
  // RenoDX: >>> [Patch: BasicPostProcessFinalizeSDR] [Version: 1.10]
  // Description: Direct-output composite material variants can bypass the standalone final shader, so color-temperature, Purkinje, and SDR black-crush adjustments must be applied here when this path is marked as the basic postprocess final. This preserves the shipped 1.09 finalization behavior without adding late final-space color grading or widening to unrelated material siblings.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
    float3 _rndx_final_color = FinalizeSDR(float3(_3352, _3353, _3354), _sunDirection.y, _moonDirection.y);
    _3352 = _rndx_final_color.x;
    _3353 = _rndx_final_color.y;
    _3354 = _rndx_final_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFinalizeSDR]
  SV_Target.x = _3352;
  SV_Target.y = _3353;
  SV_Target.z = _3354;
  SV_Target.w = _2915;
  return SV_Target;
}
