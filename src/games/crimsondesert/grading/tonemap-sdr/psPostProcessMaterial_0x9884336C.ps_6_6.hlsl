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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t41, space36);

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

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _36;
  float _44;
  bool _45;
  bool _49;
  float _138;
  float _139;
  float _142;
  float _143;
  float _205;
  float _206;
  int _250;
  int _325;
  float _326;
  float _327;
  float _328;
  float _329;
  float _330;
  float _331;
  float _987;
  float _988;
  float _989;
  float _990;
  float _991;
  float _1017;
  float _1018;
  float _1019;
  float _1020;
  float _1315;
  float _1316;
  float _1317;
  float _1318;
  float _1410;
  float _1411;
  float _1412;
  float _1413;
  float _1428;
  float _1633;
  float _1634;
  float _1635;
  float _1728;
  float _1729;
  float _1730;
  float _1774;
  float _1775;
  float _1776;
  float _1796;
  float _1797;
  float _1798;
  float _1814;
  float _1815;
  float _1816;
  float _1846;
  float _1847;
  float _1848;
  float _1862;
  float _1863;
  float _1864;
  float _65;
  float _67;
  float _68;
  float _69;
  int _70;
  float _78;
  float _90;
  float _97;
  float _98;
  float _99;
  float _100;
  float _104;
  float _109;
  float _113;
  float _122;
  float _124;
  float _128;
  float _132;
  int _144;
  int _152;
  uint2 _164;
  uint _179;
  int _181;
  float _189;
  float _190;
  float _192;
  float _193;
  float _194;
  float _208;
  float _209;
  float _210;
  float _211;
  float _213;
  float _214;
  float _215;
  float _216;
  float4 _219;
  float4 _259;
  float _261;
  float _297;
  int _334;
  float _342;
  float _356;
  float _357;
  float _358;
  float _386;
  float _387;
  float _388;
  float _389;
  float _390;
  float _391;
  float _392;
  float _393;
  float _399;
  float _400;
  float _401;
  float _453;
  float _454;
  float _455;
  float _465;
  float _476;
  float _477;
  float _478;
  float _480;
  float _483;
  float _487;
  float _488;
  float _489;
  float _494;
  float4 _506;
  float4 _518;
  uint _536;
  uint _537;
  uint4 _539;
  float4 _542;
  float _560;
  float _561;
  float _562;
  float _564;
  float _565;
  float _566;
  float _567;
  float _570;
  float _571;
  float _574;
  float _575;
  float _579;
  float _581;
  float _582;
  float _583;
  float _584;
  float _586;
  float _589;
  float _590;
  float _591;
  float _592;
  float _601;
  float _605;
  float _609;
  float _611;
  float _621;
  float _626;
  float _640;
  float _649;
  int _653;
  int _661;
  float _664;
  float _667;
  float _669;
  float _702;
  float _720;
  float _721;
  float _722;
  float _723;
  float _724;
  float _725;
  float _726;
  float _727;
  float _733;
  float _734;
  float _735;
  float _754;
  uint _775;
  uint _776;
  uint4 _778;
  float4 _781;
  float _799;
  float _800;
  float _801;
  float _803;
  float _804;
  float _805;
  float _806;
  float _809;
  float _810;
  float _813;
  float _814;
  float _818;
  float _820;
  float _821;
  float _822;
  float _823;
  float _825;
  float _828;
  float _829;
  float _830;
  float _831;
  float _840;
  float _844;
  float _848;
  float _850;
  float _865;
  float _870;
  float _871;
  float _875;
  float4 _882;
  float _884;
  float _903;
  bool _918;
  int _947;
  float _965;
  float4 _970;
  float _981;
  float _999;
  float _1000;
  float _1001;
  float _1024;
  float _1031;
  float4 _1044;
  float4 _1056;
  float _1062;
  float _1095;
  float _1096;
  float _1099;
  float _1100;
  float _1107;
  float _1110;
  float _1111;
  float _1122;
  float _1138;
  float _1139;
  float _1147;
  float _1151;
  float4 _1159;
  float _1163;
  float _1170;
  float _1173;
  float _1183;
  float _1184;
  float _1185;
  float _1195;
  float _1200;
  float _1217;
  float4 _1226;
  int _1231;
  int _1239;
  float4 _1246;
  float _1254;
  float _1256;
  float _1264;
  float _1277;
  float _1280;
  float _1281;
  float _1303;
  float _1323;
  float4 _1332;
  int _1345;
  int _1353;
  float _1364;
  float _1373;
  float _1376;
  float _1377;
  float _1392;
  float _1395;
  float _1398;
  uint _1415;
  bool _1431;
  float _1437;
  float _1486;
  float _1487;
  float _1488;
  float _1490;
  float _1497;
  float _1498;
  float _1499;
  float _1518;
  float _1519;
  float _1520;
  float _1521;
  float _1522;
  float _1523;
  float _1524;
  float _1525;
  float _1526;
  float _1572;
  float _1573;
  float _1574;
  float _1575;
  float _1576;
  float _1577;
  float _1578;
  float _1595;
  float _1596;
  float _1597;
  float _1598;
  float _1604;
  float _1607;
  float _1614;
  float _1615;
  float _1616;
  float _1645;
  float _1670;
  float _1671;
  float _1672;
  float _1691;
  float _1692;
  float _1693;
  float _1699;
  float _1703;
  float _1704;
  float _1705;
  float _1706;
  float _1711;
  float _1736;
  float _1740;
  float _1741;
  float _1742;
  float _1743;
  int _1746;
  float _1785;
  float _1804;
  float _1805;
  float _1809;
  float _1853;
  _36 = WaveReadLaneFirst(_materialIndex);
  _44 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_36 < (uint)170000), _36, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
  _45 = (_44 >= 0.009999999776482582f);
  _49 = (abs(_temperatureWarning) >= 0.009999999776482582f);
  if (!(_45 || _49)) {
    if (true) discard;
  }
  _65 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  _67 = (TEXCOORD.x * 2.0f) + -1.0f;
  _68 = TEXCOORD.y * 2.0f;
  _69 = 1.0f - _68;
  _70 = WaveReadLaneFirst(_materialIndex);
  _78 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_70 < (uint)170000), _70, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._fishEyeMaxPower);
  if (((_78 > 0.0010000000474974513f) || (_78 < -0.0010000000474974513f)) && (!_45)) {
    _90 = 0.5f / _65;
    _97 = (((_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) * 4.0f) + -0.5f;
    _98 = (((_destTargetSizAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) * 4.0f) - _90;
    _99 = dot(float2(_97, _98), float2(_97, _98));
    _100 = sqrt(_99);
    if (_78 > 0.0f) {
      _104 = sqrt(dot(float2(0.5f, _90), float2(0.5f, _90)));
      _109 = tan(_100 * _78) * (rsqrt(_99) * _104);
      _113 = tan(_104 * _78);
      _138 = (((_109 * _97) / _113) + 0.5f);
      _139 = (((_109 * _98) / _113) + _90);
    } else {
      if (_78 < 0.0f) {
        _122 = select((_65 < 1.0f), 0.5f, _90);
        _124 = _78 * -10.0f;
        _128 = atan(_100 * _124) * (rsqrt(_99) * _122);
        _132 = atan(_122 * _124);
        _138 = (((_128 * _97) / _132) + 0.5f);
        _139 = (((_128 * _98) / _132) + _90);
      } else {
        _138 = 0.0f;
        _139 = 0.0f;
      }
    }
    _142 = _138;
    _143 = (_139 * _65);
  } else {
    _142 = TEXCOORD.x;
    _143 = TEXCOORD.y;
  }
  _144 = WaveReadLaneFirst(_materialIndex);
  _152 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._noiseTex);
  if (((_highLightForVisionRemoteCatch > 0.0f) || (_highLightForVision > 0.0f)) || (_characterHighlight > 0.0f)) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_164.x, _164.y);
  // [sem: _3__36__0__0__g_CustomRenderPassValue_load]
    _179 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_164.x)))))) + 0.5f) * _142), int((float((int)(int(float((int)((int)(_164.y)))))) + 0.5f) * _143), 0));
    _181 = _179.x & 255;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _189 = (((float)((uint)((uint)((uint)((uint)(_179.x)) >> 20)))) * 0.0004884005174972117f) + -1.0f;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _190 = (((float)((uint)((uint)(((uint)((uint)(_179.x)) >> 8) & 4095)))) * 0.0004884005174972117f) + -1.0f;  // [sem: _3__36__0__0__g_CustomRenderPassValue_load_derived]
    _192 = 1.0f - abs(_189);
    _193 = abs(_190);
    _194 = _192 - _193;
    if (!(_194 >= 0.0f)) {
      _205 = (select((_189 >= 0.0f), 1.0f, -1.0f) * (1.0f - _193));
      _206 = (select((_190 >= 0.0f), 1.0f, -1.0f) * _192);
    } else {
      _205 = _189;
      _206 = _190;
    }
    _208 = rsqrt(dot(float3(_205, _206, _194), float3(_205, _206, _194)));  // [sem: invLength]
    _209 = _208 * _205;
    _210 = _208 * _206;
    _211 = _208 * _194;
    _213 = rsqrt(dot(float3(_209, _210, _211), float3(_209, _210, _211)));  // [sem: invLength]
    _214 = _213 * _209;
    _215 = _213 * _210;
    _216 = _213 * _211;
    _219 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_142, _143));  // [sem: _3__36__0__0__g_sceneColor_sample]
    if (_181 == _renderPassDetectObjective) {
      _250 = _renderPassDetectRemoteCatch;
  // [sem: _3__36__0__0__g_CustomRenderPassDepth_load]
      _259 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _142), int(_customRenderPassSizeInvSize.y * _143), 0));
      _261 = max(1.0000000116860974e-07f, _259.x);
      _297 = mad((_invViewProj[2].w), _261, mad((_invViewProj[1].w), _69, ((_invViewProj[0].w) * _67))) + (_invViewProj[3].w);
      _325 = _250;
      _326 = ((mad((_invViewProj[2].x), _261, mad((_invViewProj[1].x), _69, ((_invViewProj[0].x) * _67))) + (_invViewProj[3].x)) / _297);
      _327 = ((mad((_invViewProj[2].y), _261, mad((_invViewProj[1].y), _69, ((_invViewProj[0].y) * _67))) + (_invViewProj[3].y)) / _297);
      _328 = ((mad((_invViewProj[2].z), _261, mad((_invViewProj[1].z), _69, ((_invViewProj[0].z) * _67))) + (_invViewProj[3].z)) / _297);
      _329 = _259.x;
      _330 = (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _142)), (int)(uint(_bufferSizeAndInvSize.y * _143)), 0)))).x) & 16777215)))) * 5.960465188081798e-08f);
      _331 = (1.0f - saturate(dot(float3(_214, _215, _216), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
    } else {
      bool __branch_chain_228;
      if (_181 == _renderPassDetectRemoteCatch) {
        _250 = _renderPassDetectRemoteCatch;
        __branch_chain_228 = true;
      } else {
        if ((_181 == _renderPassDetectPickedRemoteCatch) || (_181 == _renderPassKnowledgeNPC)) {
          _250 = _renderPassDetectRemoteCatch;
          __branch_chain_228 = true;
        } else {
          if ((_181 == _renderPassEnemy) || (_181 == _renderPassSelfPlayer)) {
            _250 = _renderPassDetectRemoteCatch;
            __branch_chain_228 = true;
          } else {
            if (_181 == _renderPassTest) {
              _250 = _renderPassDetectRemoteCatch;
              __branch_chain_228 = true;
            } else {
              _325 = _renderPassDetectRemoteCatch;
              _326 = 0.0f;
              _327 = 0.0f;
              _328 = 0.0f;
              _329 = 0.0f;
              _330 = 0.0f;
              _331 = 0.0f;
              __branch_chain_228 = false;
            }
          }
        }
      }
      if (__branch_chain_228) {
  // [sem: _3__36__0__0__g_CustomRenderPassDepth_load]
        _259 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _142), int(_customRenderPassSizeInvSize.y * _143), 0));
        _261 = max(1.0000000116860974e-07f, _259.x);
        _297 = mad((_invViewProj[2].w), _261, mad((_invViewProj[1].w), _69, ((_invViewProj[0].w) * _67))) + (_invViewProj[3].w);
        _325 = _250;
        _326 = ((mad((_invViewProj[2].x), _261, mad((_invViewProj[1].x), _69, ((_invViewProj[0].x) * _67))) + (_invViewProj[3].x)) / _297);
        _327 = ((mad((_invViewProj[2].y), _261, mad((_invViewProj[1].y), _69, ((_invViewProj[0].y) * _67))) + (_invViewProj[3].y)) / _297);
        _328 = ((mad((_invViewProj[2].z), _261, mad((_invViewProj[1].z), _69, ((_invViewProj[0].z) * _67))) + (_invViewProj[3].z)) / _297);
        _329 = _259.x;
        _330 = (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _142)), (int)(uint(_bufferSizeAndInvSize.y * _143)), 0)))).x) & 16777215)))) * 5.960465188081798e-08f);
        _331 = (1.0f - saturate(dot(float3(_214, _215, _216), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      }
    }
    bool __branch_chain_324;
    if (!(_181 == _325)) {
      __branch_chain_324 = true;
    } else {
      _334 = WaveReadLaneFirst(_materialIndex);
      _342 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_334 < (uint)170000), _334, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._itemRatio);
      if (!(_342 > 0.0010000000474974513f)) {
        __branch_chain_324 = true;
      } else {
        if ((!(_highLightForVision >= 0.0010000000474974513f)) && (!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f))) {
          __branch_chain_324 = true;
        } else {
          __branch_chain_324 = false;
        }
      }
    }
    if (__branch_chain_324) {
      if (!(_181 == _renderPassDetectObjective) || ((_181 == _renderPassDetectObjective) && ((!(_highLightForVision >= 0.0010000000474974513f)) && (!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f))))) {
        if (!(_181 == _renderPassKnowledgeNPC) || ((_181 == _renderPassKnowledgeNPC) && (!(_highLightForVision >= 0.0010000000474974513f)))) {
          _918 = (_181 == _renderPassSelfPlayer);
          if ((_918) | (((_181 == _renderPassTest) || (_181 == _renderPassEnemy)) || (_181 == _renderPassDetectPickedRemoteCatch))) {
            if ((_characterHighlight > 0.0010000000474974513f) || (_highLightForVisionRemoteCatch > 0.0010000000474974513f)) {
              _947 = (((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _142)), (int)(uint(_bufferSizeAndInvSize.y * _143)), 0)))).x) & 127;
              if (!((uint)_947 > (uint)10) | (((uint)_947 > (uint)19) && (_947 != 107))) {
                _965 = _331 * 0.02500000037252903f;
  // [sem: _3__36__0__0__g_sceneColor_sample]
                _970 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_965 + _142), (_965 + _143)));
                if (!_918) {
                  if (!(_181 == _renderPassTest)) {
                    _981 = _970.y * 0.6000000238418579f;  // [sem: _3__36__0__0__g_sceneColor_sample_derived]
                    if (_181 == _renderPassEnemy) {
                      _987 = _970.x;
                      _988 = _981;
                      _989 = (_970.z * 0.6000000238418579f);
                      _990 = 10.0f;
                      _991 = 1.0f;
                    } else {
                      _987 = (_970.x * 0.5f);
                      _988 = _981;
                      _989 = _970.z;
                      _990 = 50.0f;
                      _991 = 30.0f;
                    }
                  } else {
                    _987 = _970.x;
                    _988 = _970.y;
                    _989 = _970.z;
                    _990 = 10.0f;
                    _991 = 1.0f;
                  }
                } else {
                  _987 = _970.x;
                  _988 = _970.y;
                  _989 = _970.z;
                  _990 = 10.0f;
                  _991 = 1.0f;
                }
                _999 = _326 - _mainPosition.x;
                _1000 = _327 - _mainPosition.y;
                _1001 = _328 - _mainPosition.z;
                _1017 = (((1.0f - saturate((sqrt(((_999 * _999) + (_1000 * _1000)) + (_1001 * _1001)) - _991) / _990)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _330)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _329)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1018 = (_987 * 1.5f);
                _1019 = (_988 * 1.5f);
                _1020 = (_989 * 1.5f);
              } else {
                _1017 = 0.0f;
                _1018 = _219.x;
                _1019 = _219.y;
                _1020 = _219.z;
              }
            } else {
              _1017 = 0.0f;
              _1018 = _219.x;
              _1019 = _219.y;
              _1020 = _219.z;
            }
          } else {
            _1017 = 0.0f;
            _1018 = _219.x;
            _1019 = _219.y;
            _1020 = _219.z;
          }
        } else {
          _775 = uint(_bufferSizeAndInvSize.x * _142);
          _776 = uint(_bufferSizeAndInvSize.y * _143);
          _778 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_775, _776, 0));  // [sem: _3__36__0__0__g_gbufferBaseColor_load]
          _781 = __3__36__0__0__g_gbufferNormal.Load(int3(_775, _776, 0));  // [sem: _3__36__0__0__g_gbufferNormal_load]
          _799 = (saturate(_781.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
          _800 = (saturate(_781.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
          _801 = (saturate(_781.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
          _803 = rsqrt(dot(float3(_799, _800, _801), float3(_799, _800, _801)));  // [sem: invLength]
          _804 = _803 * _799;
          _805 = _803 * _800;
          _806 = _801 * _803;
          _809 = (((float)((uint)((uint)(((uint)((uint)(_778.w)) >> 8) & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
          _810 = (((float)((uint)((uint)(_778.w & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
          _813 = (_809 + _810) * 0.5f;
          _814 = (_809 - _810) * 0.5f;
          _818 = (1.0f - abs(_813)) - abs(_814);
          _820 = rsqrt(dot(float3(_813, _814, _818), float3(_813, _814, _818)));  // [sem: invLength]
          _821 = _820 * _813;
          _822 = _820 * _814;
          _823 = _820 * _818;
          _825 = select((_806 >= 0.0f), 1.0f, -1.0f);
          _828 = -0.0f - (1.0f / (_825 + _806));
          _829 = _805 * _828;
          _830 = _829 * _804;
          _831 = _825 * _804;
          _840 = mad(_823, _804, mad(_822, _830, ((((_831 * _804) * _828) + 1.0f) * _821)));
          _844 = mad(_823, _805, mad(_822, (_825 + (_829 * _805)), ((_821 * _825) * _830)));
          _848 = mad(_823, _806, mad(_822, (-0.0f - _805), (-0.0f - (_831 * _821))));
          _850 = rsqrt(dot(float3(_840, _844, _848), float3(_840, _844, _848)));  // [sem: invLength]
          _865 = 1.0f - dot(float3(((_850 * _840) + -0.10000000149011612f), ((_850 * _844) + -0.10000000149011612f), ((_850 * _848) + -0.10000000149011612f)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
          _870 = frac((_time.x * 2.0f) + _865);
          _871 = _870 * _870;
          _875 = _865 * 10.0f;
          _882 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_875, _875));
          _884 = _882.x * _882.x;
          _903 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1017 = ((saturate((_884 * _884) * 4.0f) * saturate((_871 * _871) * 5.0f)) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _330)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _329)))));
          _1018 = ((_highLightForVision * (_903 - _219.x)) + _219.x);
          _1019 = ((_highLightForVision * ((_903 * 0.6444798111915588f) - _219.y)) + _219.y);
          _1020 = (_219.z - (_highLightForVision * _219.z));
        }
      } else {
        _453 = _326 - _mainPosition.x;
        _454 = _327 - _mainPosition.y;
        _455 = _328 - _mainPosition.z;
        _465 = (1.0f - saturate(sqrt(((_453 * _453) + (_454 * _454)) + (_455 * _455)) * 0.125f)) * 0.20000000298023224f;
        _476 = _453 - ((_viewPos.x - _mainPosition.x) * _465);
        _477 = _454 - ((_viewPos.y - _mainPosition.y) * _465);
        _478 = _455 - ((_viewPos.z - _mainPosition.z) * _465);
        _480 = rsqrt(dot(float3(_476, _477, _478), float3(_476, _477, _478)));  // [sem: invLength]
        _483 = _478 * _480;
        _487 = select((_483 < 0.0f), (-0.0f - _483), _483) + 1.0f;
        _488 = (_477 * _480) / _487;
        _489 = (_476 * _480) / _487;
        _494 = _time.x + sin(_time.x);
        _506 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.10000000149011612f) + (_489 * 2.0f)), ((_494 * 0.10000000149011612f) + (_488 * 2.0f))));
        _518 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_489 - (_time.x * 0.06000000238418579f)) - (_506.x * 0.05000000074505806f)), ((_488 - (_494 * 0.06000000238418579f)) - (_506.w * 0.05000000074505806f))));
        _536 = uint(((((_506.w + -1.0f) + _518.y) * 0.019999999552965164f) + _142) * _bufferSizeAndInvSize.x);
        _537 = uint(((((_506.y + -1.0f) + _518.w) * 0.019999999552965164f) + _143) * _bufferSizeAndInvSize.y);
        _539 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_536, _537, 0));  // [sem: _3__36__0__0__g_gbufferBaseColor_load]
        _542 = __3__36__0__0__g_gbufferNormal.Load(int3(_536, _537, 0));  // [sem: _3__36__0__0__g_gbufferNormal_load]
        _560 = (saturate(_542.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
        _561 = (saturate(_542.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
        _562 = (saturate(_542.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferNormal_load_derived]
        _564 = rsqrt(dot(float3(_560, _561, _562), float3(_560, _561, _562)));  // [sem: invLength]
        _565 = _564 * _560;
        _566 = _564 * _561;
        _567 = _562 * _564;
        _570 = (((float)((uint)((uint)(((uint)((uint)(_539.w)) >> 8) & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
        _571 = (((float)((uint)((uint)(_539.w & 255)))) * 0.007843137718737125f) + -1.0f;  // [sem: _3__36__0__0__g_gbufferBaseColor_load_derived]
        _574 = (_570 + _571) * 0.5f;
        _575 = (_570 - _571) * 0.5f;
        _579 = (1.0f - abs(_574)) - abs(_575);
        _581 = rsqrt(dot(float3(_574, _575, _579), float3(_574, _575, _579)));  // [sem: invLength]
        _582 = _581 * _574;
        _583 = _581 * _575;
        _584 = _581 * _579;
        _586 = select((_567 >= 0.0f), 1.0f, -1.0f);
        _589 = -0.0f - (1.0f / (_586 + _567));
        _590 = _566 * _589;
        _591 = _590 * _565;
        _592 = _586 * _565;
        _601 = mad(_584, _565, mad(_583, _591, ((((_592 * _565) * _589) + 1.0f) * _582)));
        _605 = mad(_584, _566, mad(_583, (_586 + (_590 * _566)), ((_582 * _586) * _591)));
        _609 = mad(_584, _567, mad(_583, (-0.0f - _566), (-0.0f - (_592 * _582))));
        _611 = rsqrt(dot(float3(_601, _605, _609), float3(_601, _605, _609)));  // [sem: invLength]
        _621 = 1.0f - abs(dot(float3((_611 * _601), (_611 * _605), (_611 * _609)), float3(_viewDir.x, _viewDir.y, _viewDir.z)));
        _626 = saturate((_621 * _621) + ((_518.y * _506.y) * _518.z));  // [sem: expr_sat]
        _640 = 1.0f - dot(float3((((_518.x + -0.5f) * _518.w) + _214), (((_518.y + -0.5f) * _518.w) + _215), (((_518.z + -0.5f) * _518.w) + _216)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
        _649 = (saturate(_626 * 10.0f) * saturate((_640 * _640) * 3.0f)) + ((_518.x * _518.z) * _518.w);
        _653 = WaveReadLaneFirst(_materialIndex);
        _661 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_653 < (uint)170000), _653, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._objectiveMaskColor);
        _664 = (float)((uint)((uint)(((uint)(_661) >> 16) & 255)));
        _667 = (float)((uint)((uint)(((uint)(_661) >> 8) & 255)));
        _669 = (float)((uint)((uint)(_661 & 255)));
        _702 = (_518.y * _518.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
  // [sem: invLength]
        _720 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        _721 = _720 * _detectModeLook.x;
        _722 = _720 * _detectModeLook.y;
        _723 = _720 * _detectModeLook.z;
        _724 = _326 - _detectModePosition.x;
        _725 = _327 - _detectModePosition.y;
        _726 = _328 - _detectModePosition.z;
        _727 = dot(float3(_721, _722, _723), float3(_724, _725, _726));
        _733 = _724 - (_721 * _727);
        _734 = _725 - (_722 * _727);
        _735 = _726 - (_723 * _727);
        _754 = 1.0f - saturate(sqrt(((_724 * _724) + (_725 * _725)) + (_726 * _726)) / _detectModeRadius);
        _1017 = (((_754 * _754) * ((1.0f - saturate(sqrt(((_733 * _733) + (_734 * _734)) + (_735 * _735)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _727)))) * (((_626 - _649) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _330)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _329))))) + _649))) * _highLightForVision);
        _1018 = (_702 * select(((_664 * 0.011764707043766975f) < 0.040449999272823334f), (_664 * 0.0009105810313485563f), exp2(log2((_664 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1019 = (_702 * select(((_667 * 0.011764707043766975f) < 0.040449999272823334f), (_667 * 0.0009105810313485563f), exp2(log2((_667 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1020 = (_702 * select(((_669 * 0.011764707043766975f) < 0.040449999272823334f), (_669 * 0.0009105810313485563f), exp2(log2((_669 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    } else {
      _356 = _326 - _mainPosition.x;
      _357 = _327 - _mainPosition.y;
      _358 = _328 - _mainPosition.z;
  // [sem: invLength]
      _386 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      _387 = _386 * _detectModeLook.x;
      _388 = _386 * _detectModeLook.y;
      _389 = _386 * _detectModeLook.z;
      _390 = _326 - _detectModePosition.x;
      _391 = _327 - _detectModePosition.y;
      _392 = _328 - _detectModePosition.z;
      _393 = dot(float3(_387, _388, _389), float3(_390, _391, _392));
      _399 = _390 - (_387 * _393);
      _400 = _391 - (_388 * _393);
      _401 = _392 - (_389 * _393);
      _1017 = ((((1.0f - saturate((sqrt(((_356 * _356) + (_357 * _357)) + (_358 * _358)) + -30.0f) * 0.05000000074505806f)) * saturate((_331 * _331) * 4.0f)) * (1.0f - saturate(sqrt(((_399 * _399) + (_400 * _400)) + (_401 * _401)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _393))))) * exp2(log2(1.0f - saturate(sqrt(((_390 * _390) + (_391 * _391)) + (_392 * _392)) / _detectModeRadius)) * 10.0f));
      _1018 = _219.x;
      _1019 = _219.y;
      _1020 = _219.z;
    }
  } else {
    _1017 = 0.0f;
    _1018 = 0.0f;
    _1019 = 0.0f;
    _1020 = 0.0f;
  }
  _1024 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_49) {
    if (_temperatureWarning > 0.0f) {
      _1031 = _65 * TEXCOORD.x;
      _1044 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1031 * 4.25f), ((TEXCOORD.y * 3.0f) - (_time.x * 0.15000000596046448f))));
      _1056 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1031 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1044.x * 0.10000000149011612f)) + (_time.x * 0.20000000298023224f))));
      _1062 = TEXCOORD.x + -0.5f;
      _1095 = abs((_1062 + ((_1044.y + -0.5f) * 0.009999999776482582f)) + ((_1056.z + -0.5f) * 0.029999999329447746f));
      _1096 = abs(((TEXCOORD.y + -0.5f) + ((_1044.x + -0.5f) * 0.019999999552965164f)) + ((_1056.y + -0.5f) * 0.029999999329447746f));
      _1099 = max((_1095 + -0.5f), 0.0f);
      _1100 = max((_1096 + -0.5f), 0.0f);
      _1107 = 0.5f - min(max((((1.0f - (saturate(abs(_1062) * 2.0f) * 0.3999999761581421f)) * ((_1024 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1044.z * 0.30000001192092896f) + -0.5f) + (_1056.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1024 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1024 * 0.11000001430511475f) + 0.2200000137090683f));
      _1110 = max((_1095 - _1107), 0.0f);
      _1111 = max((_1096 - _1107), 0.0f);
      _1122 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);  // [sem: expr_sat]
      _1138 = saturate(_1056.x * _1044.x);  // [sem: expr_sat]
      _1139 = _1024 * 0.20000000298023224f;
      _1147 = ((saturate(_1024 * 2.0f) * saturate(saturate(sqrt((_1111 * _1111) + (_1110 * _1110)) * 10.0f) - saturate(sqrt((_1100 * _1100) + (_1099 * _1099)) * 10.0f))) * ((_1138 * (1.0f - _1139)) + _1139)) * ((((_1122 * _1122) * (3.0f - (_1122 * 2.0f))) * ((saturate((((_1044.x * 0.25f) + -0.3499999940395355f) + (_1056.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      _1151 = _1147 * (_1024 * 0.10000000149011612f);
  // [sem: _3__36__0__0__g_sceneColor_sample]
      _1159 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1151 * (0.5f - TEXCOORD.x)) * _1056.x) + TEXCOORD.x), (((_1151 * (0.5f - TEXCOORD.y)) * _1056.y) + TEXCOORD.y)));
      _1163 = 1.0f - _1147;
      _1170 = ((_1163 * _1163) * _1163) * saturate(((_1138 * _1138) * 2.0f) * _1138);
      _1173 = max(0.0010000000474974513f, _exposure0.x);
      _1183 = (((1.0f / _1173) - _1159.x) * _1170) + _1159.x;
      _1184 = (((0.6000000238418579f / _1173) - _1159.y) * _1170) + _1159.y;
      _1185 = (((0.30000001192092896f / _1173) - _1159.z) * _1170) + _1159.z;
      _1195 = ((_1024 * _1024) * _1024) * saturate(_1024 + -0.5f);
      _1200 = saturate(_1147 * 2.0f);  // [sem: expr_sat]
      _1315 = (_1200 + _1017);
      _1316 = ((((_1183 - _1018) + (((_1147 / _1173) - _1183) * _1195)) * _1200) + _1018);
      _1317 = ((((_1184 - _1019) + ((((_1147 * 0.25f) / _1173) - _1184) * _1195)) * _1200) + _1019);
      _1318 = ((((_1185 - _1020) - (_1185 * _1195)) * _1200) + _1020);
    } else {
      if (_temperatureWarning < 0.0f) {
        _1217 = _65 * TEXCOORD.x;
        _1226 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1217 * 1.5f), (TEXCOORD.y * 1.5f)));
        _1231 = WaveReadLaneFirst(_materialIndex);
        _1239 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1231 < (uint)170000), _1231, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._temperatureWarningTex);
        _1246 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1239 < (uint)65000), _1239, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1217 * 2.0f), _68));
        _1254 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - _1246.y), _1246.y) + -0.5f) * 0.30000001192092896f;
        _1256 = (_1226.x + -0.4000000059604645f) * 0.20000000298023224f;
        _1264 = max(0.0010000000474974513f, _exposure0.x);
        _1277 = 0.5f - (_1024 * 0.25f);
        _1280 = max((abs(((TEXCOORD.x + -0.5f) + _1256) + _1254) - _1277), 0.0f);
        _1281 = max((abs(((_1254 + _1256) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1277), 0.0f);
        _1303 = (_1024 * (1.0f - TEXCOORD.y)) * saturate((((_1246.y * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1281 * _1281) + (_1280 * _1280)) * 6.666666507720947f)) * 2.0f))) * saturate((_1246.y * _1246.y) * 2.0f)) * saturate(_1226.z * _1226.w));
        _1315 = (_1303 + _1017);
        _1316 = ((_1303 * ((((_1226.w * 1.8809775114059448f) + 0.11902248114347458f) / _1264) - _1018)) + _1018);
        _1317 = ((_1303 * ((((_1226.w * 1.3989123106002808f) + 0.6010876893997192f) / _1264) - _1019)) + _1019);
        _1318 = ((_1303 * ((2.0f / _1264) - _1020)) + _1020);
      } else {
        _1315 = _1017;
        _1316 = _1018;
        _1317 = _1019;
        _1318 = _1020;
      }
    }
  } else {
    _1315 = _1017;
    _1316 = _1018;
    _1317 = _1019;
    _1318 = _1020;
  }
  if (!(_electrocutionWarning == 0.0f)) {
    _1323 = _65 * TEXCOORD.x;
    _1332 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_152 < (uint)65000), _152, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1323 * 1.5f), (TEXCOORD.y * 1.5f)));
    _1345 = WaveReadLaneFirst(_materialIndex);
    _1353 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1345 < (uint)170000), _1345, 0)) + 0u))].BindlessParameters_PostProcessUber_CD._electrocutionTex);
    _1364 = max(0.0010000000474974513f, _exposure0.x);
    _1373 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    _1376 = max((abs(TEXCOORD.x + -0.5f) - _1373), 0.0f);
    _1377 = max((abs(TEXCOORD.y + -0.5f) - _1373), 0.0f);
    _1392 = 1.0f - abs((frac((_time.x * 2.0f) + _1332.y) * 2.0f) + -1.0f);
    _1395 = (_1392 * _1392) * (saturate(sqrt((_1377 * _1377) + (_1376 * _1376)) / _1332.z) * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1353 < (uint)65000), _1353, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1332.x * 0.05000000074505806f) + (_1323 * 2.0f)), (((_1332.y * 0.05000000074505806f) + _68) + (_time.x * 0.10000000149011612f)))))).x));
    _1398 = (pow(_1395, 1.600000023841858f));
    _1410 = (_1395 + _1315);
    _1411 = ((_1398 * ((340.0f / _1364) - _1316)) + _1316);
    _1412 = ((_1398 * ((660.0f / _1364) - _1317)) + _1317);
    _1413 = ((_1398 * ((2000.0f / _1364) - _1318)) + _1318);
  } else {
    _1410 = _1315;
    _1411 = _1316;
    _1412 = _1317;
    _1413 = _1318;
  }
  _1415 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
  // [sem: _1410_sat]
    _1428 = (((float)((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _1415, 0)))).x) & 127)))) + 0.5f);
  } else {
    _1428 = saturate(_1410);  // [sem: _1410_sat]
  }
  _1431 = (_localToneMappingParams.w > 0.0f);
  if (_1431) {
    _1437 = _userImageAdjust.z * _exposure0.x;
    _1486 = exp2(log2(max(0.0f, (((_1437 * max(0.0f, (((_1411 * 1.705049991607666f) - (_1412 * 0.6217899918556213f)) - (_1413 * 0.08325999975204468f)))) * _slopeParams.x) + _offsetParams.x))) * _powerParams.x);
    _1487 = exp2(log2(max(0.0f, (((max(0.0f, (((_1412 * 1.1407999992370605f) - (_1411 * 0.13026000559329987f)) - (_1413 * 0.01054999977350235f))) * _1437) * _slopeParams.y) + _offsetParams.y))) * _powerParams.y);
    _1488 = exp2(log2(max(0.0f, (((max(0.0f, (((_1411 * -0.024000000208616257f) - (_1412 * 0.12896999716758728f)) + (_1413 * 1.1529699563980103f))) * _1437) * _slopeParams.z) + _offsetParams.z))) * _powerParams.z);
    _1490 = dot(float3(_1486, _1487, _1488), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    _1497 = ((_1486 - _1490) * _powerParams.w) + _1490;
    _1498 = ((_1487 - _1490) * _powerParams.w) + _1490;
    _1499 = ((_1488 - _1490) * _powerParams.w) + _1490;
    _1518 = min(max(log2(mad(_1499, 0.07922374457120895f, mad(_1498, 0.07843360304832458f, (_1497 * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _1519 = min(max(log2(mad(_1499, 0.07916612923145294f, mad(_1498, 0.8784686326980591f, (_1497 * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _1520 = min(max(log2(mad(_1499, 0.8791429996490479f, mad(_1498, 0.07843360304832458f, (_1497 * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
    _1521 = _1518 * 0.06060606241226196f;
    _1522 = _1519 * 0.06060606241226196f;
    _1523 = _1520 * 0.06060606241226196f;
    _1524 = _1521 * _1521;
    _1525 = _1522 * _1522;
    _1526 = _1523 * _1523;
    _1572 = min(0.0f, (-0.0f - (((_1518 * 0.007218181621283293f) + ((_1524 * 0.42980000376701355f) + (((_1524 * _1524) * ((31.959999084472656f - (_1518 * 2.432727336883545f)) + (_1524 * 15.5f))) - ((_1518 * 0.41624245047569275f) * _1524)))) + -0.002319999970495701f)));
    _1573 = min(0.0f, (-0.0f - (((_1519 * 0.007218181621283293f) + ((_1525 * 0.42980000376701355f) + (((_1525 * _1525) * ((31.959999084472656f - (_1519 * 2.432727336883545f)) + (_1525 * 15.5f))) - ((_1519 * 0.41624245047569275f) * _1525)))) + -0.002319999970495701f)));
    _1574 = min(0.0f, (-0.0f - (((_1520 * 0.007218181621283293f) + ((_1526 * 0.42980000376701355f) + (((_1526 * _1526) * ((31.959999084472656f - (_1520 * 2.432727336883545f)) + (_1526 * 15.5f))) - ((_1520 * 0.41624245047569275f) * _1526)))) + -0.002319999970495701f)));
    _1575 = -0.0f - _1572;
    _1576 = -0.0f - _1573;
    _1577 = -0.0f - _1574;
    _1578 = dot(float3(_1575, _1576, _1577), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    if (_nightToneParm == 1) {
      _1595 = exp2(exp2(log2(abs((_time.w * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f;
      _1596 = -0.7999999523162842f / _1595;
      _1597 = -1.2000000476837158f / _1595;
      _1598 = 0.20000004768371582f / _1595;
      _1604 = saturate((_exposure2.x + -0.6000000238418579f) * 0.10638298094272614f);  // [sem: expr_sat]
      _1607 = saturate((_exposure2.x + -0.10000000149011612f) * 2.0f);  // [sem: expr_sat]
      _1614 = (_1596 + 1.399999976158142f) + (_1607 * (-0.3999999761581421f - _1596));
      _1615 = (_1597 + 1.600000023841858f) + (_1607 * (-0.6000000238418579f - _1597));
      _1616 = (_1598 + 0.8999999761581421f) + (_1607 * (0.5f - _1598));
      _1633 = (lerp(_1615, 1.2000000476837158f, _1604));  // [sem: blended]
      _1634 = (lerp(_1614, 1.0f, _1604));  // [sem: blended]
      _1635 = (lerp(_1616, 1.399999976158142f, _1604));  // [sem: blended]
    } else {
      _1633 = ((saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f) + 1.0f);  // [sem: blended]
      _1634 = 1.0f;  // [sem: blended]
      _1635 = 1.399999976158142f;  // [sem: blended]
    }
    _1645 = 1.0f - _1633;
    _1670 = ((exp2(log2(((saturate((_1572 * _1572) * _1575) * _1645) + _1633) * _1575) * _1634) - _1578) * _1635) + _1578;
    _1671 = ((exp2(log2(((saturate((_1573 * _1573) * _1576) * _1645) + _1633) * _1576) * _1634) - _1578) * _1635) + _1578;
    _1672 = ((exp2(log2(((saturate((_1574 * _1574) * _1577) * _1645) + _1633) * _1577) * _1634) - _1578) * _1635) + _1578;
  // [sem: expr_sat]
    _1691 = saturate(exp2(log2(mad(_1672, -0.09902974218130112f, mad(_1671, -0.09802088141441345f, (_1670 * 1.1968790292739868f)))) * 2.200000047683716f));
  // [sem: expr_sat]
    _1692 = saturate(exp2(log2(mad(_1672, -0.09896117448806763f, mad(_1671, 1.1519031524658203f, (_1670 * -0.052896853536367416f)))) * 2.200000047683716f));
  // [sem: expr_sat]
    _1693 = saturate(exp2(log2(mad(_1672, 1.151073694229126f, mad(_1671, -0.09804344922304153f, (_1670 * -0.05297163501381874f)))) * 2.200000047683716f));
    if (_etcParams.z == 0.0f) {
      _1699 = 1.0f - abs(_etcParams.w);
      _1703 = saturate(_etcParams.w);  // [sem: expr_sat]
      _1704 = (_1699 * _1691) + _1703;
      _1705 = (_1699 * _1692) + _1703;
      _1706 = (_1699 * _1693) + _1703;
      if (_colorGradingParams.w > 0.0f) {
        _1711 = saturate(_colorGradingParams.w);  // [sem: expr_sat]
        _1728 = (((max(0.0f, (1.0f - _1704)) - _1704) * _1711) + _1704);
        _1729 = (((max(0.0f, (1.0f - _1705)) - _1705) * _1711) + _1705);
        _1730 = (((max(0.0f, (1.0f - _1706)) - _1706) * _1711) + _1706);
      } else {
        _1728 = _1704;
        _1729 = _1705;
        _1730 = _1706;
      }
      _1736 = _userImageAdjust.y + 1.0f;
      _1740 = _userImageAdjust.x + 0.5f;
      _1741 = ((_1728 + -0.5f) * _1736) + _1740;
      _1742 = ((_1729 + -0.5f) * _1736) + _1740;
      _1743 = ((_1730 + -0.5f) * _1736) + _1740;
      _1746 = min((int)(max((int)(_colorBlindParam), (int)(0))), (int)(3));
      [branch]
      if (_1746 == 1) {
        _1774 = mad(0.20000000298023224f, _1742, (_1741 * 0.800000011920929f));
        _1775 = mad(0.7416700124740601f, _1742, (_1741 * 0.25832998752593994f));
        _1776 = mad(0.8583300113677979f, _1743, mad(0.14167000353336334f, _1742, 0.0f));
      } else {
        if (_1746 == 2) {
          _1774 = mad(0.1833299994468689f, _1742, (_1741 * 0.8166700005531311f));
          _1775 = mad(0.666670024394989f, _1742, (_1741 * 0.3333300054073334f));
          _1776 = mad(0.875f, _1743, mad(0.125f, _1742, 0.0f));
        } else {
          if (_1746 == 3) {
            _1774 = mad(0.033330000936985016f, _1742, (_1741 * 0.9666699767112732f));
            _1775 = mad(0.26666998863220215f, _1743, mad(0.7333300113677979f, _1742, 0.0f));
            _1776 = mad(0.8166700005531311f, _1743, mad(0.1833299994468689f, _1742, 0.0f));
          } else {
            _1774 = _1741;
            _1775 = _1742;
            _1776 = _1743;
          }
        }
      }
      _1785 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
      _1796 = exp2(log2(saturate(_1774)) * _1785);
      _1797 = exp2(log2(saturate(_1775)) * _1785);
      _1798 = exp2(log2(saturate(_1776)) * _1785);
    } else {
      _1796 = _1691;
      _1797 = _1692;
      _1798 = _1693;
    }
  } else {
    _1796 = _1411;
    _1797 = _1412;
    _1798 = _1413;
  }
  // RenoDX: >>> [Patch: TonemapReplacementSDR] [Version: 1.10]
  // Description: The 1.10 psPostProcessMaterial shader is an observed active successor for the 1.09 SDR material tonemap path. The native branch above applies the same local-tonemap display transform inputs used by the historical material remaps; this patch overwrites that branch output with TonemapReplacer at the same AP1 scene-color point so tuned RenoDX SDR exposure, contrast, saturation, blowout, auto-exposure, and tonemap behavior match 1.09 instead of shifting into a later final-output space.
  if (_1431) {
    float3 _rndx_output_color = TonemapReplacer(float3(_1411, _1412, _1413));
    _1796 = _rndx_output_color.x;
    _1797 = _rndx_output_color.y;
    _1798 = _rndx_output_color.z;
  }
  // RenoDX: <<< [Patch: TonemapReplacementSDR]
  // RenoDX: >>> [Patch: BasicPostProcessFilmGrain] [Version: 1.10]
  // Description: The 1.10 material postprocess successor can become the active final-output path, bypassing the standalone final shader. This patch applies the existing RenoDX custom film grain only when the basic postprocess final flag has selected this material path, preserving the shipped 1.09 direct-output behavior.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f && CUSTOM_FILM_GRAIN_TYPE != 0) {
    float3 _rndx_postprocess_color = renodx::effects::ApplyFilmGrain(float3(_1796, _1797, _1798), TEXCOORD, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    _1796 = _rndx_postprocess_color.x;
    _1797 = _rndx_postprocess_color.y;
    _1798 = _rndx_postprocess_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFilmGrain]
  if (_etcParams.y > 1.0f) {
    _1804 = abs(_67);
    _1805 = abs(_68 + -1.0f);
    // RenoDX: >>> [Patch: BasicPostProcessVignette] [Version: 1.10]
    // Description: This material path applies its own output vignette from `_etcParams.y`. When it is the selected basic postprocess final path, this patch multiplies the native vignette strength by the existing RenoDX vignette control so direct-output material variants match 1.09 behavior.
    float _rndx_vignette_strength = saturate(_etcParams.y + -1.0f);
    if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
      _rndx_vignette_strength *= CUSTOM_VIGNETTE;
    }
    _1809 = saturate(1.0f - (dot(float2(_1804, _1805), float2(_1804, _1805)) * _rndx_vignette_strength));  // [sem: expr_sat]
    // RenoDX: <<< [Patch: BasicPostProcessVignette]
    _1814 = (_1809 * _1796);
    _1815 = (_1809 * _1797);
    _1816 = (_1809 * _1798);
  } else {
    _1814 = _1796;
    _1815 = _1797;
    _1816 = _1798;
  }
  if (_1431 && (_etcParams.z > 0.0f)) {
    _1846 = select((_1814 <= 0.0031308000907301903f), (_1814 * 12.920000076293945f), (((pow(_1814, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1847 = select((_1815 <= 0.0031308000907301903f), (_1815 * 12.920000076293945f), (((pow(_1815, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1848 = select((_1816 <= 0.0031308000907301903f), (_1816 * 12.920000076293945f), (((pow(_1816, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1846 = _1814;
    _1847 = _1815;
    _1848 = _1816;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    _1853 = (float)((uint)_1415);
    if (!(_1853 < _viewDir.w)) {
      if (!(_1853 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1862 = _1846;
        _1863 = _1847;
        _1864 = _1848;
      } else {
        _1862 = 0.0f;
        _1863 = 0.0f;
        _1864 = 0.0f;
      }
    } else {
      _1862 = 0.0f;
      _1863 = 0.0f;
      _1864 = 0.0f;
    }
  } else {
    _1862 = _1846;
    _1863 = _1847;
    _1864 = _1848;
  }
  // RenoDX: >>> [Patch: BasicPostProcessFinalizeSDR] [Version: 1.10]
  // Description: Direct-output material variants can bypass the standalone final shader, so color-temperature, Purkinje, and SDR black-crush adjustments must be applied here when this path is marked as the basic postprocess final. This preserves the shipped 1.09 finalization behavior without adding late final-space color grading or widening to unrelated material siblings.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
    float3 _rndx_final_color = FinalizeSDR(float3(_1862, _1863, _1864), _sunDirection.y, _moonDirection.y);
    _1862 = _rndx_final_color.x;
    _1863 = _rndx_final_color.y;
    _1864 = _rndx_final_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFinalizeSDR]
  SV_Target.x = _1862;
  SV_Target.y = _1863;
  SV_Target.z = _1864;
  SV_Target.w = _1428;
  return SV_Target;
}
